void sub_14AA2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,char a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,char a44,uint64_t a45,int a46,__int16 a47,char a48,char a49,uint64_t a50,void *a51,uint64_t a52,int a53,__int16 a54,char a55,char a56,uint64_t a57,char a58,uint64_t a59,int a60,__int16 a61,char a62,char a63)
{
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

long long *sub_14AAE8(uint64_t a1, long long *a2, long long *a3, void **a4)
{
  if ((long long *)a1 != a2)
  {
    uint64_t v8 = (uint64_t)a2 - a1;
    uint64_t v9 = ((uint64_t)a2 - a1) / 24;
    if ((uint64_t)a2 - a1 >= 25)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      v12 = (long long *)(a1 + 24 * v10);
      do
      {
        sub_14AE20(a1, a4, v9, v12);
        v12 = (long long *)((char *)v12 - 24);
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      while (1)
      {
        if (*((char *)v14 + 23) < 0)
        {
          sub_124B4(__dst, *(void **)v14, *((void *)v14 + 1));
        }
        else
        {
          *(_OWORD *)__dst = *v14;
          uint64_t v43 = *((void *)v14 + 2);
        }
        if (*(char *)(a1 + 23) < 0)
        {
          sub_124B4(__p, *(void **)a1, *(void *)(a1 + 8));
        }
        else
        {
          *(_OWORD *)__p = *(_OWORD *)a1;
          uint64_t v41 = *(void *)(a1 + 16);
        }
        v15 = *a4;
        v16 = sub_EE310(*a4, (unsigned __int8 *)__dst);
        v17 = sub_EE310(v15, (unsigned __int8 *)__p);
        unint64_t v18 = *((void *)v16 + 14);
        unint64_t v19 = *((void *)v17 + 14);
        BOOL v20 = v18 < v19;
        if (v18 == v19)
        {
          unint64_t v21 = *((void *)v16 + 8);
          unint64_t v22 = *((void *)v17 + 8);
          BOOL v23 = v21 == v22;
          BOOL v24 = v21 < v22;
          if (v23) {
            BOOL v20 = v16 < v17;
          }
          else {
            BOOL v20 = v24;
          }
        }
        if (SHIBYTE(v41) < 0) {
          operator delete(__p[0]);
        }
        if ((SHIBYTE(v43) & 0x80000000) == 0) {
          break;
        }
        operator delete(__dst[0]);
        if (v20) {
          goto LABEL_23;
        }
LABEL_24:
        v14 = (long long *)((char *)v14 + 24);
        if (v14 == a3)
        {
          v13 = a3;
          goto LABEL_26;
        }
      }
      if (!v20) {
        goto LABEL_24;
      }
LABEL_23:
      uint64_t v25 = *((void *)v14 + 2);
      long long v26 = *v14;
      uint64_t v27 = *(void *)(a1 + 16);
      long long *v14 = *(_OWORD *)a1;
      *((void *)v14 + 2) = v27;
      *(_OWORD *)a1 = v26;
      *(void *)(a1 + 16) = v25;
      sub_14AE20(a1, a4, v9, (long long *)a1);
      goto LABEL_24;
    }
LABEL_26:
    if (v8 >= 25)
    {
      int64_t v28 = v8 / 0x18uLL;
      v29 = (long long *)((char *)a2 - 24);
      do
      {
        v30 = *(void **)a1;
        v44[0] = *(void *)(a1 + 8);
        *(void *)((char *)v44 + 7) = *(void *)(a1 + 15);
        char v31 = *(unsigned char *)(a1 + 23);
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
        *(void *)a1 = 0;
        uint64_t v32 = sub_14B3B0(a1, a4, v28);
        uint64_t v33 = v32;
        int v34 = *(char *)(v32 + 23);
        if (v29 == (long long *)v32)
        {
          if (v34 < 0) {
            operator delete(*(void **)v32);
          }
          uint64_t v37 = v44[0];
          *(void *)uint64_t v33 = v30;
          *(void *)(v33 + 8) = v37;
          *(void *)(v33 + 15) = *(void *)((char *)v44 + 7);
          *(unsigned char *)(v33 + 23) = v31;
        }
        else
        {
          if (v34 < 0) {
            operator delete(*(void **)v32);
          }
          long long v35 = *v29;
          *(void *)(v33 + 16) = *((void *)v29 + 2);
          *(_OWORD *)uint64_t v33 = v35;
          uint64_t v36 = v44[0];
          *(void *)v29 = v30;
          *((void *)v29 + 1) = v36;
          *(void *)((char *)v29 + 15) = *(void *)((char *)v44 + 7);
          *((unsigned char *)v29 + 23) = v31;
          sub_14B588(a1, v33 + 24, a4, 0xAAAAAAAAAAAAAAABLL * ((v33 + 24 - a1) >> 3));
        }
        v29 = (long long *)((char *)v29 - 24);
      }
      while (v28-- > 2);
    }
    return v13;
  }
  return a3;
}

void sub_14ADD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_14AE20(uint64_t a1, void **a2, uint64_t a3, long long *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = a4;
    uint64_t v56 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    {
      uint64_t v7 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
      uint64_t v8 = (long long *)(a1 + 24 * v7);
      uint64_t v9 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
      if (v9 < a3)
      {
        if (*((char *)v8 + 23) < 0)
        {
          sub_124B4(&__dst, *(void **)v8, *((void *)v8 + 1));
        }
        else
        {
          long long __dst = *v8;
          uint64_t v75 = *((void *)v8 + 2);
        }
        if (*((char *)v8 + 47) < 0)
        {
          sub_124B4(&v72, *((void **)v8 + 3), *((void *)v8 + 4));
        }
        else
        {
          long long v72 = *(long long *)((char *)v8 + 24);
          uint64_t v73 = *((void *)v8 + 5);
        }
        unint64_t v10 = *a2;
        unint64_t v11 = sub_EE310(*a2, (unsigned __int8 *)&__dst);
        v12 = sub_EE310(v10, (unsigned __int8 *)&v72);
        unint64_t v13 = *((void *)v11 + 14);
        unint64_t v14 = *((void *)v12 + 14);
        BOOL v15 = v13 < v14;
        if (v13 == v14)
        {
          unint64_t v16 = *((void *)v11 + 8);
          unint64_t v17 = *((void *)v12 + 8);
          BOOL v18 = v16 == v17;
          BOOL v19 = v16 < v17;
          if (v18) {
            BOOL v15 = v11 < v12;
          }
          else {
            BOOL v15 = v19;
          }
        }
        if (SHIBYTE(v73) < 0) {
          operator delete((void *)v72);
        }
        if (SHIBYTE(v75) < 0)
        {
          operator delete((void *)__dst);
          if (!v15) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }
        if (v15)
        {
LABEL_18:
          uint64_t v8 = (long long *)((char *)v8 + 24);
          uint64_t v7 = v9;
        }
      }
LABEL_19:
      if (*((char *)v8 + 23) < 0)
      {
        sub_124B4(&v70, *(void **)v8, *((void *)v8 + 1));
      }
      else
      {
        long long v70 = *v8;
        uint64_t v71 = *((void *)v8 + 2);
      }
      uint64_t v20 = a1;
      if (*((char *)v5 + 23) < 0)
      {
        sub_124B4(__p, *(void **)v5, *((void *)v5 + 1));
      }
      else
      {
        *(_OWORD *)__p = *v5;
        uint64_t v69 = *((void *)v5 + 2);
      }
      unint64_t v21 = *a2;
      unint64_t v22 = sub_EE310(*a2, (unsigned __int8 *)&v70);
      BOOL v23 = sub_EE310(v21, (unsigned __int8 *)__p);
      unint64_t v24 = *((void *)v22 + 14);
      unint64_t v25 = *((void *)v23 + 14);
      BOOL v26 = v24 < v25;
      if (v24 == v25)
      {
        unint64_t v27 = *((void *)v22 + 8);
        unint64_t v28 = *((void *)v23 + 8);
        BOOL v18 = v27 == v28;
        BOOL v29 = v27 < v28;
        if (v18) {
          BOOL v26 = v22 < v23;
        }
        else {
          BOOL v26 = v29;
        }
      }
      if (SHIBYTE(v69) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v71) < 0)
      {
        operator delete((void *)v70);
        if (v26) {
          return;
        }
      }
      else if (v26)
      {
        return;
      }
      v53 = (void *)*((void *)v5 + 1);
      v54 = *(void **)v5;
      v67[0] = *((_DWORD *)v5 + 4);
      *(_DWORD *)((char *)v67 + 3) = *(_DWORD *)((char *)v5 + 19);
      int v30 = *((char *)v5 + 23);
      *((void *)v5 + 1) = 0;
      *((void *)v5 + 2) = 0;
      *(void *)v5 = 0;
      while (1)
      {
        char v31 = v8;
        if (*((char *)v5 + 23) < 0) {
          operator delete(*(void **)v5);
        }
        long long v32 = *v8;
        *((void *)v5 + 2) = *((void *)v8 + 2);
        long long *v5 = v32;
        *((unsigned char *)v8 + 23) = 0;
        *(unsigned char *)uint64_t v8 = 0;
        if (v56 < v7)
        {
LABEL_75:
          *(void *)char v31 = v54;
          *((void *)v31 + 1) = v53;
          *((_DWORD *)v31 + 4) = v67[0];
          *(_DWORD *)((char *)v31 + 19) = *(_DWORD *)((char *)v67 + 3);
          *((unsigned char *)v31 + 23) = v30;
          return;
        }
        uint64_t v33 = 2 * v7;
        uint64_t v7 = (2 * v7) | 1;
        uint64_t v8 = (long long *)(v20 + 24 * v7);
        uint64_t v34 = v33 + 2;
        if (v33 + 2 < a3)
        {
          if (*((char *)v8 + 23) < 0)
          {
            sub_124B4(v65, *(void **)v8, *((void *)v8 + 1));
          }
          else
          {
            *(_OWORD *)v65 = *v8;
            uint64_t v66 = *((void *)v8 + 2);
          }
          if (*((char *)v8 + 47) < 0)
          {
            sub_124B4(v63, *((void **)v8 + 3), *((void *)v8 + 4));
          }
          else
          {
            *(_OWORD *)v63 = *(long long *)((char *)v8 + 24);
            uint64_t v64 = *((void *)v8 + 5);
          }
          long long v35 = *a2;
          uint64_t v36 = sub_EE310(*a2, (unsigned __int8 *)v65);
          uint64_t v37 = sub_EE310(v35, (unsigned __int8 *)v63);
          unint64_t v38 = *((void *)v36 + 14);
          unint64_t v39 = *((void *)v37 + 14);
          BOOL v40 = v38 < v39;
          if (v38 == v39)
          {
            unint64_t v41 = *((void *)v36 + 8);
            unint64_t v42 = *((void *)v37 + 8);
            BOOL v18 = v41 == v42;
            BOOL v43 = v41 < v42;
            if (v18) {
              BOOL v40 = v36 < v37;
            }
            else {
              BOOL v40 = v43;
            }
          }
          if (SHIBYTE(v64) < 0) {
            operator delete(v63[0]);
          }
          if (SHIBYTE(v66) < 0)
          {
            operator delete(v65[0]);
            if (!v40) {
              goto LABEL_55;
            }
LABEL_54:
            uint64_t v8 = (long long *)((char *)v8 + 24);
            uint64_t v7 = v34;
            goto LABEL_55;
          }
          if (v40) {
            goto LABEL_54;
          }
        }
LABEL_55:
        if (*((char *)v8 + 23) < 0)
        {
          sub_124B4(v61, *(void **)v8, *((void *)v8 + 1));
        }
        else
        {
          *(_OWORD *)v61 = *v8;
          uint64_t v62 = *((void *)v8 + 2);
        }
        if (v30 < 0)
        {
          sub_124B4(v58, v54, (unint64_t)v53);
          uint64_t v20 = a1;
        }
        else
        {
          uint64_t v20 = a1;
          v58[0] = v54;
          v58[1] = v53;
          *(_DWORD *)v59 = v67[0];
          *(_DWORD *)&v59[3] = *(_DWORD *)((char *)v67 + 3);
          char v60 = v30;
        }
        v44 = *a2;
        v45 = sub_EE310(*a2, (unsigned __int8 *)v61);
        v46 = sub_EE310(v44, (unsigned __int8 *)v58);
        unint64_t v47 = *((void *)v45 + 14);
        unint64_t v48 = *((void *)v46 + 14);
        BOOL v49 = v47 < v48;
        if (v47 == v48)
        {
          unint64_t v50 = *((void *)v45 + 8);
          unint64_t v51 = *((void *)v46 + 8);
          BOOL v18 = v50 == v51;
          BOOL v52 = v50 < v51;
          if (v18) {
            BOOL v49 = v45 < v46;
          }
          else {
            BOOL v49 = v52;
          }
        }
        if (v60 < 0) {
          operator delete(v58[0]);
        }
        if (SHIBYTE(v62) < 0) {
          operator delete(v61[0]);
        }
        v5 = v31;
        if (v49)
        {
          if (*((char *)v31 + 23) < 0) {
            operator delete(*(void **)v31);
          }
          goto LABEL_75;
        }
      }
    }
  }
}

void sub_14B2E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,int a50,__int16 a51,char a52,char a53)
{
  if (*(char *)(v53 - 105) < 0) {
    operator delete(*(void **)(v53 - 128));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_14B3B0(uint64_t a1, void **a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v6 = a3 - 2;
  if (a3 < 2) {
    uint64_t v6 = a3 - 1;
  }
  uint64_t v7 = v6 >> 1;
  do
  {
    uint64_t v8 = a1 + 24 * v5 + 24;
    uint64_t v9 = 2 * v5;
    uint64_t v5 = (2 * v5) | 1;
    uint64_t v10 = v9 + 2;
    if (v9 + 2 >= a3) {
      goto LABEL_20;
    }
    if (*(char *)(v8 + 23) < 0)
    {
      sub_124B4(__dst, *(void **)v8, *(void *)(v8 + 8));
    }
    else
    {
      long long v11 = *(_OWORD *)v8;
      uint64_t v29 = *(void *)(v8 + 16);
      *(_OWORD *)long long __dst = v11;
    }
    if (*(char *)(v8 + 47) < 0)
    {
      sub_124B4(__p, *(void **)(v8 + 24), *(void *)(v8 + 32));
    }
    else
    {
      long long v12 = *(_OWORD *)(v8 + 24);
      uint64_t v27 = *(void *)(v8 + 40);
      *(_OWORD *)__p = v12;
    }
    unint64_t v13 = *a2;
    unint64_t v14 = sub_EE310(*a2, (unsigned __int8 *)__dst);
    BOOL v15 = sub_EE310(v13, (unsigned __int8 *)__p);
    unint64_t v16 = *((void *)v14 + 14);
    unint64_t v17 = *((void *)v15 + 14);
    BOOL v18 = v16 < v17;
    if (v16 == v17)
    {
      unint64_t v19 = *((void *)v14 + 8);
      unint64_t v20 = *((void *)v15 + 8);
      BOOL v21 = v19 == v20;
      BOOL v22 = v19 < v20;
      if (v21) {
        BOOL v18 = v14 < v15;
      }
      else {
        BOOL v18 = v22;
      }
    }
    if (SHIBYTE(v27) < 0) {
      operator delete(__p[0]);
    }
    if ((SHIBYTE(v29) & 0x80000000) == 0)
    {
      if (!v18) {
        goto LABEL_20;
      }
LABEL_19:
      v8 += 24;
      uint64_t v5 = v10;
      goto LABEL_20;
    }
    operator delete(__dst[0]);
    if (v18) {
      goto LABEL_19;
    }
LABEL_20:
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v23 = *(_OWORD *)v8;
    *(void *)(a1 + 16) = *(void *)(v8 + 16);
    *(_OWORD *)a1 = v23;
    *(unsigned char *)(v8 + 23) = 0;
    *(unsigned char *)uint64_t v8 = 0;
    a1 = v8;
  }
  while (v5 <= v7);
  return v8;
}

void sub_14B554(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_14B588(uint64_t a1, uint64_t a2, void **a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v6 = v4 >> 1;
    uint64_t v7 = (long long *)(a1 + 24 * (v4 >> 1));
    if (*((char *)v7 + 23) < 0)
    {
      sub_124B4(__dst, *(void **)v7, *((void *)v7 + 1));
    }
    else
    {
      *(_OWORD *)long long __dst = *v7;
      uint64_t v44 = *((void *)v7 + 2);
    }
    uint64_t v8 = (long long *)(a2 - 24);
    if (*(char *)(a2 - 1) < 0)
    {
      sub_124B4(__p, *(void **)(a2 - 24), *(void *)(a2 - 16));
    }
    else
    {
      *(_OWORD *)__p = *v8;
      uint64_t v42 = *(void *)(a2 - 8);
    }
    uint64_t v9 = *a3;
    uint64_t v10 = sub_EE310(*a3, (unsigned __int8 *)__dst);
    long long v11 = sub_EE310(v9, (unsigned __int8 *)__p);
    unint64_t v12 = *((void *)v10 + 14);
    unint64_t v13 = *((void *)v11 + 14);
    BOOL v14 = v12 < v13;
    if (v12 == v13)
    {
      unint64_t v15 = *((void *)v10 + 8);
      unint64_t v16 = *((void *)v11 + 8);
      BOOL v17 = v15 == v16;
      BOOL v18 = v15 < v16;
      if (v17) {
        BOOL v14 = v10 < v11;
      }
      else {
        BOOL v14 = v18;
      }
    }
    if (SHIBYTE(v42) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v44) < 0)
    {
      operator delete(__dst[0]);
      if (!v14) {
        return;
      }
    }
    else if (!v14)
    {
      return;
    }
    unint64_t v19 = *(void **)(a2 - 24);
    unint64_t v20 = *(void **)(a2 - 16);
    v40[0] = *(_DWORD *)(a2 - 8);
    *(_DWORD *)((char *)v40 + 3) = *(_DWORD *)(a2 - 5);
    int v21 = *(char *)(a2 - 1);
    *(void *)(a2 - 16) = 0;
    *(void *)(a2 - 8) = 0;
    *(void *)uint64_t v8 = 0;
    while (1)
    {
      BOOL v22 = v7;
      if (*((char *)v8 + 23) < 0) {
        operator delete(*(void **)v8);
      }
      long long v23 = *v7;
      *((void *)v8 + 2) = *((void *)v7 + 2);
      *uint64_t v8 = v23;
      *((unsigned char *)v7 + 23) = 0;
      *(unsigned char *)uint64_t v7 = 0;
      if (!v6) {
        break;
      }
      unint64_t v6 = (v6 - 1) >> 1;
      uint64_t v7 = (long long *)(a1 + 24 * v6);
      if (*((char *)v7 + 23) < 0)
      {
        sub_124B4(v38, *(void **)v7, *((void *)v7 + 1));
      }
      else
      {
        *(_OWORD *)unint64_t v38 = *v7;
        uint64_t v39 = *((void *)v7 + 2);
      }
      if (v21 < 0)
      {
        sub_124B4(v35, v19, (unint64_t)v20);
      }
      else
      {
        v35[0] = v19;
        v35[1] = v20;
        *(_DWORD *)uint64_t v36 = v40[0];
        *(_DWORD *)&v36[3] = *(_DWORD *)((char *)v40 + 3);
        char v37 = v21;
      }
      unint64_t v24 = *a3;
      unint64_t v25 = sub_EE310(*a3, (unsigned __int8 *)v38);
      BOOL v26 = sub_EE310(v24, (unsigned __int8 *)v35);
      unint64_t v27 = *((void *)v25 + 14);
      unint64_t v28 = *((void *)v26 + 14);
      BOOL v29 = v27 < v28;
      if (v27 == v28)
      {
        unint64_t v30 = *((void *)v25 + 8);
        unint64_t v31 = *((void *)v26 + 8);
        BOOL v17 = v30 == v31;
        BOOL v32 = v30 < v31;
        if (v17) {
          BOOL v29 = v25 < v26;
        }
        else {
          BOOL v29 = v32;
        }
      }
      if (v37 < 0) {
        operator delete(v35[0]);
      }
      if (SHIBYTE(v39) < 0) {
        operator delete(v38[0]);
      }
      uint64_t v8 = v22;
      if (!v29)
      {
        if (*((char *)v22 + 23) < 0) {
          operator delete(*(void **)v22);
        }
        break;
      }
    }
    *(void *)BOOL v22 = v19;
    *((void *)v22 + 1) = v20;
    *((_DWORD *)v22 + 4) = v40[0];
    *(_DWORD *)((char *)v22 + 19) = *(_DWORD *)((char *)v40 + 3);
    *((unsigned char *)v22 + 23) = v21;
  }
}

void sub_14B828(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (a37 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_14B89C(uint64_t a1, long long *a2, void *a3, uint64_t a4, char a5)
{
void sub_14BD54(unsigned __int8 *a1, unsigned __int8 *a2, void *a3)
{
  if (a1 == a2) {
    return;
  }
  char v5 = a1 + 24;
  if (a1 + 24 == a2) {
    return;
  }
  uint64_t v7 = 0;
  uint64_t v8 = a1;
  do
  {
    uint64_t v9 = v8;
    uint64_t v8 = v5;
    uint64_t v10 = (void *)(*a3 + 40);
    long long v11 = sub_EE310(v10, v5);
    unint64_t v12 = sub_EE310(v10, v9);
    unint64_t v13 = *((void *)v11 + 7);
    unint64_t v14 = *((void *)v12 + 7);
    if (v13 == v14)
    {
      unint64_t v15 = *((void *)v11 + 6);
      unint64_t v16 = *((void *)v12 + 6);
      BOOL v17 = v15 == v16;
      BOOL v18 = v15 < v16;
      if (v17) {
        BOOL v18 = v11 < v12;
      }
      if (!v18) {
        goto LABEL_25;
      }
    }
    else if (v13 >= v14)
    {
      goto LABEL_25;
    }
    long long v31 = *(_OWORD *)v8;
    uint64_t v32 = *((void *)v8 + 2);
    *((void *)v8 + 1) = 0;
    *((void *)v8 + 2) = 0;
    *(void *)uint64_t v8 = 0;
    for (uint64_t i = v7; ; i -= 24)
    {
      unint64_t v20 = &a1[i];
      int v21 = (void **)&a1[i + 24];
      if ((char)a1[i + 47] < 0) {
        operator delete(*v21);
      }
      *(_OWORD *)int v21 = *(_OWORD *)v20;
      *(void *)&a1[i + 40] = *((void *)v20 + 2);
      v20[23] = 0;
      *unint64_t v20 = 0;
      if (!i)
      {
        unint64_t v30 = a1;
        goto LABEL_24;
      }
      BOOL v22 = (void *)(*a3 + 40);
      long long v23 = sub_EE310(v22, (unsigned __int8 *)&v31);
      unint64_t v24 = sub_EE310(v22, &a1[i - 24]);
      unint64_t v25 = *((void *)v23 + 7);
      unint64_t v26 = *((void *)v24 + 7);
      if (v25 == v26) {
        break;
      }
      if (v25 >= v26) {
        goto LABEL_22;
      }
LABEL_20:
      ;
    }
    unint64_t v27 = *((void *)v23 + 6);
    unint64_t v28 = *((void *)v24 + 6);
    BOOL v17 = v27 == v28;
    BOOL v29 = v27 < v28;
    if (v17) {
      BOOL v29 = v23 < v24;
    }
    if (v29) {
      goto LABEL_20;
    }
LABEL_22:
    unint64_t v30 = &a1[i];
    if ((char)a1[i + 23] < 0) {
      operator delete(*(void **)v30);
    }
LABEL_24:
    *(_OWORD *)unint64_t v30 = v31;
    *((void *)v30 + 2) = v32;
LABEL_25:
    char v5 = v8 + 24;
    v7 += 24;
  }
  while (v8 + 24 != a2);
}

void sub_14BF10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_14BF2C(unsigned __int8 *a1, unsigned __int8 *a2, void *a3)
{
  if (a1 != a2)
  {
    unint64_t v4 = a1;
    char v5 = a1 + 24;
    if (a1 + 24 != a2)
    {
      for (uint64_t i = a1 - 24; ; i += 24)
      {
        uint64_t v8 = v4;
        unint64_t v4 = v5;
        uint64_t v9 = (void *)(*a3 + 40);
        uint64_t v10 = sub_EE310(v9, v5);
        long long v11 = sub_EE310(v9, v8);
        unint64_t v12 = *((void *)v10 + 7);
        unint64_t v13 = *((void *)v11 + 7);
        if (v12 != v13) {
          break;
        }
        unint64_t v14 = *((void *)v10 + 6);
        unint64_t v15 = *((void *)v11 + 6);
        BOOL v16 = v14 == v15;
        BOOL v17 = v14 < v15;
        if (v16) {
          BOOL v17 = v10 < v11;
        }
        if (v17) {
          goto LABEL_10;
        }
LABEL_23:
        char v5 = v4 + 24;
        if (v4 + 24 == a2) {
          return;
        }
      }
      if (v12 >= v13) {
        goto LABEL_23;
      }
LABEL_10:
      long long v30 = *(_OWORD *)v4;
      uint64_t v31 = *((void *)v4 + 2);
      *((void *)v4 + 1) = 0;
      *((void *)v4 + 2) = 0;
      *(void *)unint64_t v4 = 0;
      for (j = i; ; j -= 24)
      {
        uint64_t v19 = (void **)(j + 48);
        if ((char)j[71] < 0) {
          operator delete(*v19);
        }
        *(_OWORD *)uint64_t v19 = *(_OWORD *)(j + 24);
        *((void *)j + 8) = *((void *)j + 5);
        j[47] = 0;
        j[24] = 0;
        unint64_t v20 = (void *)(*a3 + 40);
        int v21 = sub_EE310(v20, (unsigned __int8 *)&v30);
        BOOL v22 = sub_EE310(v20, j);
        unint64_t v23 = *((void *)v21 + 7);
        unint64_t v24 = *((void *)v22 + 7);
        if (v23 == v24)
        {
          unint64_t v25 = *((void *)v21 + 6);
          unint64_t v26 = *((void *)v22 + 6);
          BOOL v16 = v25 == v26;
          BOOL v27 = v25 < v26;
          if (v16) {
            BOOL v27 = v21 < v22;
          }
          if (!v27)
          {
LABEL_20:
            int v28 = (char)j[47];
            BOOL v29 = j + 24;
            if (v28 < 0) {
              operator delete(*(void **)v29);
            }
            *(_OWORD *)BOOL v29 = v30;
            *((void *)v29 + 2) = v31;
            goto LABEL_23;
          }
        }
        else if (v23 >= v24)
        {
          goto LABEL_20;
        }
      }
    }
  }
}

void sub_14C0D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_14C0F0(unsigned __int8 *a1, unsigned __int8 *a2, unsigned __int8 *a3, void *a4)
{
  uint64_t v8 = (void *)(*a4 + 40);
  uint64_t v9 = sub_EE310(v8, a2);
  uint64_t v10 = sub_EE310(v8, a1);
  unint64_t v11 = *((void *)v9 + 7);
  unint64_t v12 = *((void *)v10 + 7);
  if (v11 == v12)
  {
    unint64_t v13 = *((void *)v9 + 6);
    unint64_t v14 = *((void *)v10 + 6);
    BOOL v15 = v13 == v14;
    BOOL v16 = v13 < v14;
    if (v15) {
      BOOL v16 = v9 < v10;
    }
    if (!v16) {
      goto LABEL_5;
    }
LABEL_11:
    unint64_t v26 = (void *)(*a4 + 40);
    BOOL v27 = sub_EE310(v26, a3);
    int v28 = sub_EE310(v26, a2);
    unint64_t v29 = *((void *)v27 + 7);
    unint64_t v30 = *((void *)v28 + 7);
    if (v29 == v30)
    {
      unint64_t v31 = *((void *)v27 + 6);
      unint64_t v32 = *((void *)v28 + 6);
      BOOL v15 = v31 == v32;
      BOOL v33 = v31 < v32;
      if (v15) {
        BOOL v33 = v27 < v28;
      }
      if (!v33)
      {
LABEL_15:
        uint64_t v34 = *((void *)a1 + 2);
        long long v35 = *(_OWORD *)a1;
        uint64_t v36 = *((void *)a2 + 2);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *((void *)a1 + 2) = v36;
        *(_OWORD *)a2 = v35;
        *((void *)a2 + 2) = v34;
        char v37 = (void *)(*a4 + 40);
        unint64_t v38 = sub_EE310(v37, a3);
        unint64_t v39 = sub_EE310(v37, a2);
        unint64_t v40 = *((void *)v38 + 7);
        unint64_t v41 = *((void *)v39 + 7);
        if (v40 == v41)
        {
          unint64_t v42 = *((void *)v38 + 6);
          unint64_t v43 = *((void *)v39 + 6);
          BOOL v15 = v42 == v43;
          BOOL v44 = v42 < v43;
          if (v15) {
            BOOL v44 = v38 < v39;
          }
          if (!v44) {
            return 1;
          }
        }
        else if (v40 >= v41)
        {
          return 1;
        }
        uint64_t v59 = *((void *)a2 + 2);
        long long v60 = *(_OWORD *)a2;
        uint64_t v61 = *((void *)a3 + 2);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *((void *)a2 + 2) = v61;
        *(_OWORD *)a3 = v60;
        *((void *)a3 + 2) = v59;
        return 2;
      }
    }
    else if (v29 >= v30)
    {
      goto LABEL_15;
    }
    uint64_t v56 = *((void *)a1 + 2);
    long long v57 = *(_OWORD *)a1;
    uint64_t v58 = *((void *)a3 + 2);
    *(_OWORD *)a1 = *(_OWORD *)a3;
    *((void *)a1 + 2) = v58;
    *(_OWORD *)a3 = v57;
    *((void *)a3 + 2) = v56;
    return 1;
  }
  if (v11 < v12) {
    goto LABEL_11;
  }
LABEL_5:
  BOOL v17 = (void *)(*a4 + 40);
  BOOL v18 = sub_EE310(v17, a3);
  uint64_t v19 = sub_EE310(v17, a2);
  unint64_t v20 = *((void *)v18 + 7);
  unint64_t v21 = *((void *)v19 + 7);
  if (v20 == v21)
  {
    unint64_t v22 = *((void *)v18 + 6);
    unint64_t v23 = *((void *)v19 + 6);
    BOOL v15 = v22 == v23;
    BOOL v24 = v22 < v23;
    if (v15) {
      BOOL v24 = v18 < v19;
    }
    if (!v24) {
      return 0;
    }
  }
  else if (v20 >= v21)
  {
    return 0;
  }
  uint64_t v45 = *((void *)a2 + 2);
  long long v46 = *(_OWORD *)a2;
  uint64_t v47 = *((void *)a3 + 2);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *((void *)a2 + 2) = v47;
  *(_OWORD *)a3 = v46;
  *((void *)a3 + 2) = v45;
  unint64_t v48 = (void *)(*a4 + 40);
  BOOL v49 = sub_EE310(v48, a2);
  unint64_t v50 = sub_EE310(v48, a1);
  unint64_t v51 = *((void *)v49 + 7);
  unint64_t v52 = *((void *)v50 + 7);
  if (v51 == v52)
  {
    unint64_t v53 = *((void *)v49 + 6);
    unint64_t v54 = *((void *)v50 + 6);
    BOOL v15 = v53 == v54;
    BOOL v55 = v53 < v54;
    if (v15) {
      BOOL v55 = v49 < v50;
    }
    if (!v55) {
      return 1;
    }
    goto LABEL_31;
  }
  if (v51 < v52)
  {
LABEL_31:
    uint64_t v62 = *((void *)a1 + 2);
    long long v63 = *(_OWORD *)a1;
    uint64_t v64 = *((void *)a2 + 2);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((void *)a1 + 2) = v64;
    *(_OWORD *)a2 = v63;
    *((void *)a2 + 2) = v62;
    return 2;
  }
  return 1;
}

long long *sub_14C3AC(long long *a1, unsigned __int8 *a2, void *a3)
{
  long long v63 = *a1;
  uint64_t v64 = *((void *)a1 + 2);
  *((void *)a1 + 1) = 0;
  *((void *)a1 + 2) = 0;
  *(void *)a1 = 0;
  BOOL v6 = (void *)(*a3 + 40);
  uint64_t v7 = sub_EE310(v6, (unsigned __int8 *)&v63);
  uint64_t v8 = sub_EE310(v6, a2 - 24);
  unint64_t v9 = *((void *)v7 + 7);
  unint64_t v10 = *((void *)v8 + 7);
  if (v9 != v10)
  {
    if (v9 >= v10) {
      goto LABEL_5;
    }
LABEL_15:
    for (uint64_t i = (long long *)((char *)a1 + 24); ; uint64_t i = (long long *)((char *)i + 24))
    {
      BOOL v24 = (void *)(*a3 + 40);
      unint64_t v25 = sub_EE310(v24, (unsigned __int8 *)&v63);
      unint64_t v26 = sub_EE310(v24, (unsigned __int8 *)i);
      unint64_t v27 = *((void *)v25 + 7);
      unint64_t v28 = *((void *)v26 + 7);
      if (v27 == v28)
      {
        unint64_t v29 = *((void *)v25 + 6);
        unint64_t v30 = *((void *)v26 + 6);
        BOOL v13 = v29 == v30;
        BOOL v31 = v29 < v30;
        if (v13) {
          BOOL v31 = v25 < v26;
        }
        if (v31) {
          goto LABEL_23;
        }
      }
      else if (v27 < v28)
      {
        goto LABEL_23;
      }
    }
  }
  unint64_t v11 = *((void *)v7 + 6);
  unint64_t v12 = *((void *)v8 + 6);
  BOOL v13 = v11 == v12;
  BOOL v14 = v11 < v12;
  if (v13) {
    BOOL v14 = v7 < v8;
  }
  if (v14) {
    goto LABEL_15;
  }
LABEL_5:
  for (uint64_t i = (long long *)((char *)a1 + 24); i < (long long *)a2; uint64_t i = (long long *)((char *)i + 24))
  {
    BOOL v16 = (void *)(*a3 + 40);
    BOOL v17 = sub_EE310(v16, (unsigned __int8 *)&v63);
    BOOL v18 = sub_EE310(v16, (unsigned __int8 *)i);
    unint64_t v19 = *((void *)v17 + 7);
    unint64_t v20 = *((void *)v18 + 7);
    if (v19 == v20)
    {
      unint64_t v21 = *((void *)v17 + 6);
      unint64_t v22 = *((void *)v18 + 6);
      BOOL v13 = v21 == v22;
      BOOL v23 = v21 < v22;
      if (v13) {
        BOOL v23 = v17 < v18;
      }
      if (v23) {
        break;
      }
    }
    else if (v19 < v20)
    {
      break;
    }
  }
LABEL_23:
  if (i < (long long *)a2)
  {
    for (a2 -= 24; ; a2 -= 24)
    {
      unint64_t v32 = (void *)(*a3 + 40);
      BOOL v33 = sub_EE310(v32, (unsigned __int8 *)&v63);
      uint64_t v34 = sub_EE310(v32, a2);
      unint64_t v35 = *((void *)v33 + 7);
      unint64_t v36 = *((void *)v34 + 7);
      if (v35 == v36)
      {
        unint64_t v37 = *((void *)v33 + 6);
        unint64_t v38 = *((void *)v34 + 6);
        BOOL v13 = v37 == v38;
        BOOL v39 = v37 < v38;
        if (v13) {
          BOOL v39 = v33 < v34;
        }
        if (!v39) {
          break;
        }
      }
      else if (v35 >= v36)
      {
        break;
      }
    }
  }
LABEL_45:
  while (i < (long long *)a2)
  {
    long long v40 = *i;
    uint64_t v66 = *((void *)i + 2);
    long long v65 = v40;
    long long v41 = *(_OWORD *)a2;
    *((void *)i + 2) = *((void *)a2 + 2);
    *uint64_t i = v41;
    long long v42 = v65;
    *((void *)a2 + 2) = v66;
    *(_OWORD *)a2 = v42;
    do
    {
      while (1)
      {
        uint64_t i = (long long *)((char *)i + 24);
        unint64_t v43 = (void *)(*a3 + 40);
        BOOL v44 = sub_EE310(v43, (unsigned __int8 *)&v63);
        uint64_t v45 = sub_EE310(v43, (unsigned __int8 *)i);
        unint64_t v46 = *((void *)v44 + 7);
        unint64_t v47 = *((void *)v45 + 7);
        if (v46 == v47) {
          break;
        }
        if (v46 < v47) {
          goto LABEL_41;
        }
      }
      unint64_t v48 = *((void *)v44 + 6);
      unint64_t v49 = *((void *)v45 + 6);
      BOOL v13 = v48 == v49;
      BOOL v50 = v48 < v49;
      if (v13) {
        BOOL v50 = v44 < v45;
      }
    }
    while (!v50);
    do
    {
LABEL_41:
      while (1)
      {
        a2 -= 24;
        unint64_t v51 = (void *)(*a3 + 40);
        unint64_t v52 = sub_EE310(v51, (unsigned __int8 *)&v63);
        unint64_t v53 = sub_EE310(v51, a2);
        unint64_t v54 = *((void *)v52 + 7);
        unint64_t v55 = *((void *)v53 + 7);
        if (v54 == v55) {
          break;
        }
        if (v54 >= v55) {
          goto LABEL_45;
        }
      }
      unint64_t v56 = *((void *)v52 + 6);
      unint64_t v57 = *((void *)v53 + 6);
      BOOL v13 = v56 == v57;
      BOOL v58 = v56 < v57;
      if (v13) {
        BOOL v58 = v52 < v53;
      }
    }
    while (v58);
  }
  uint64_t v59 = (void **)i - 3;
  if ((long long *)((char *)i - 24) == a1)
  {
    if (*((char *)i - 1) < 0) {
      operator delete(*v59);
    }
  }
  else
  {
    if (*((char *)a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v60 = *(_OWORD *)v59;
    *((void *)a1 + 2) = *((void *)i - 1);
    *a1 = v60;
    *((unsigned char *)i - 1) = 0;
    *((unsigned char *)i - 24) = 0;
  }
  long long v61 = v63;
  *((void *)i - 1) = v64;
  *(_OWORD *)uint64_t v59 = v61;
  return i;
}

void sub_14C704(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_14C734(long long *a1, unsigned __int8 *a2, void *a3)
{
  long long v60 = *a1;
  uint64_t v61 = *((void *)a1 + 2);
  *((void *)a1 + 1) = 0;
  *((void *)a1 + 2) = 0;
  *(void *)a1 = 0;
  for (uint64_t i = 24; ; i += 24)
  {
    uint64_t v7 = (void *)(*a3 + 40);
    uint64_t v8 = sub_EE310(v7, (unsigned __int8 *)a1 + i);
    unint64_t v9 = sub_EE310(v7, (unsigned __int8 *)&v60);
    unint64_t v10 = *((void *)v8 + 7);
    unint64_t v11 = *((void *)v9 + 7);
    if (v10 == v11) {
      break;
    }
    if (v10 >= v11) {
      goto LABEL_9;
    }
LABEL_8:
    ;
  }
  unint64_t v12 = *((void *)v8 + 6);
  unint64_t v13 = *((void *)v9 + 6);
  BOOL v14 = v12 == v13;
  BOOL v15 = v12 < v13;
  if (v14) {
    BOOL v15 = v8 < v9;
  }
  if (v15) {
    goto LABEL_8;
  }
LABEL_9:
  unint64_t v16 = (unint64_t)a1 + i;
  if (i == 24)
  {
    if (v16 < (unint64_t)a2)
    {
      do
      {
        while (1)
        {
          a2 -= 24;
          unint64_t v25 = (void *)(*a3 + 40);
          unint64_t v26 = sub_EE310(v25, a2);
          unint64_t v27 = sub_EE310(v25, (unsigned __int8 *)&v60);
          unint64_t v28 = *((void *)v26 + 7);
          unint64_t v29 = *((void *)v27 + 7);
          if (v28 == v29) {
            break;
          }
          if (v28 < v29 || v16 >= (unint64_t)a2) {
            goto LABEL_32;
          }
        }
        unint64_t v30 = *((void *)v26 + 6);
        unint64_t v31 = *((void *)v27 + 6);
        BOOL v14 = v30 == v31;
        BOOL v32 = v30 >= v31;
        if (v14) {
          BOOL v32 = v26 >= v27;
        }
      }
      while (v32 && v16 < (unint64_t)a2);
    }
  }
  else
  {
    do
    {
      while (1)
      {
        a2 -= 24;
        BOOL v17 = (void *)(*a3 + 40);
        BOOL v18 = sub_EE310(v17, a2);
        unint64_t v19 = sub_EE310(v17, (unsigned __int8 *)&v60);
        unint64_t v20 = *((void *)v18 + 7);
        unint64_t v21 = *((void *)v19 + 7);
        if (v20 == v21) {
          break;
        }
        if (v20 < v21) {
          goto LABEL_32;
        }
      }
      unint64_t v22 = *((void *)v18 + 6);
      unint64_t v23 = *((void *)v19 + 6);
      BOOL v14 = v22 == v23;
      BOOL v24 = v22 < v23;
      if (v14) {
        BOOL v24 = v18 < v19;
      }
    }
    while (!v24);
  }
LABEL_32:
  unint64_t v35 = (unint64_t)a1 + i;
  if (v16 < (unint64_t)a2)
  {
    unint64_t v36 = a2;
    do
    {
      long long v37 = *(_OWORD *)v35;
      uint64_t v63 = *(void *)(v35 + 16);
      long long v62 = v37;
      long long v38 = *(_OWORD *)v36;
      *(void *)(v35 + 16) = *((void *)v36 + 2);
      *(_OWORD *)unint64_t v35 = v38;
      long long v39 = v62;
      *((void *)v36 + 2) = v63;
      *(_OWORD *)unint64_t v36 = v39;
      do
      {
        while (1)
        {
          v35 += 24;
          long long v40 = (void *)(*a3 + 40);
          long long v41 = sub_EE310(v40, (unsigned __int8 *)v35);
          long long v42 = sub_EE310(v40, (unsigned __int8 *)&v60);
          unint64_t v43 = *((void *)v41 + 7);
          unint64_t v44 = *((void *)v42 + 7);
          if (v43 == v44) {
            break;
          }
          if (v43 >= v44) {
            goto LABEL_43;
          }
        }
        unint64_t v45 = *((void *)v41 + 6);
        unint64_t v46 = *((void *)v42 + 6);
        BOOL v14 = v45 == v46;
        BOOL v47 = v45 < v46;
        if (v14) {
          BOOL v47 = v41 < v42;
        }
      }
      while (v47);
      do
      {
LABEL_43:
        while (1)
        {
          v36 -= 24;
          unint64_t v48 = (void *)(*a3 + 40);
          unint64_t v49 = sub_EE310(v48, v36);
          BOOL v50 = sub_EE310(v48, (unsigned __int8 *)&v60);
          unint64_t v51 = *((void *)v49 + 7);
          unint64_t v52 = *((void *)v50 + 7);
          if (v51 == v52) {
            break;
          }
          if (v51 < v52) {
            goto LABEL_47;
          }
        }
        unint64_t v53 = *((void *)v49 + 6);
        unint64_t v54 = *((void *)v50 + 6);
        BOOL v14 = v53 == v54;
        BOOL v55 = v53 < v54;
        if (v14) {
          BOOL v55 = v49 < v50;
        }
      }
      while (!v55);
LABEL_47:
      ;
    }
    while (v35 < (unint64_t)v36);
  }
  unint64_t v56 = (void **)(v35 - 24);
  if ((long long *)(v35 - 24) == a1)
  {
    if (*(char *)(v35 - 1) < 0) {
      operator delete(*v56);
    }
  }
  else
  {
    if (*((char *)a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v57 = *(_OWORD *)v56;
    *((void *)a1 + 2) = *(void *)(v35 - 8);
    *a1 = v57;
    *(unsigned char *)(v35 - 1) = 0;
    *(unsigned char *)(v35 - 24) = 0;
  }
  long long v58 = v60;
  *(void *)(v35 - 8) = v61;
  *(_OWORD *)unint64_t v56 = v58;
  return v35 - 24;
}

void sub_14CA4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_14CA78(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t v8 = a2 - 24;
      unint64_t v9 = (void *)(*a3 + 40);
      unint64_t v10 = sub_EE310(v9, (unsigned __int8 *)(a2 - 24));
      unint64_t v11 = sub_EE310(v9, (unsigned __int8 *)a1);
      unint64_t v12 = *((void *)v10 + 7);
      unint64_t v13 = *((void *)v11 + 7);
      if (v12 == v13)
      {
        unint64_t v14 = *((void *)v10 + 6);
        unint64_t v15 = *((void *)v11 + 6);
        BOOL v16 = v14 == v15;
        BOOL v17 = v14 < v15;
        if (v16) {
          BOOL v17 = v10 < v11;
        }
        if (!v17) {
          return 1;
        }
      }
      else if (v12 >= v13)
      {
        return 1;
      }
      uint64_t v42 = *(void *)(a1 + 16);
      long long v43 = *(_OWORD *)a1;
      uint64_t v44 = *(void *)(v8 + 16);
      *(_OWORD *)a1 = *(_OWORD *)v8;
      *(void *)(a1 + 16) = v44;
      *(_OWORD *)uint64_t v8 = v43;
      *(void *)(v8 + 16) = v42;
      return 1;
    case 3uLL:
      sub_14C0F0((unsigned __int8 *)a1, (unsigned __int8 *)(a1 + 24), (unsigned __int8 *)(a2 - 24), a3);
      return 1;
    case 4uLL:
      sub_14CDC4(a1, (unsigned __int8 *)(a1 + 24), (unsigned __int8 *)(a1 + 48), (unsigned __int8 *)(a2 - 24), a3);
      return 1;
    case 5uLL:
      sub_14CF90(a1, (unsigned __int8 *)(a1 + 24), (unsigned __int8 *)(a1 + 48), (unsigned __int8 *)(a1 + 72), (unsigned __int8 *)(a2 - 24), a3);
      return 1;
    default:
      BOOL v18 = (unsigned __int8 *)(a1 + 48);
      sub_14C0F0((unsigned __int8 *)a1, (unsigned __int8 *)(a1 + 24), (unsigned __int8 *)(a1 + 48), a3);
      uint64_t v19 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v20 = 0;
      int v21 = 0;
      while (2)
      {
        unint64_t v22 = (void *)(*a3 + 40);
        unint64_t v23 = sub_EE310(v22, (unsigned __int8 *)v19);
        BOOL v24 = sub_EE310(v22, v18);
        unint64_t v25 = *((void *)v23 + 7);
        unint64_t v26 = *((void *)v24 + 7);
        if (v25 == v26)
        {
          unint64_t v27 = *((void *)v23 + 6);
          unint64_t v28 = *((void *)v24 + 6);
          BOOL v16 = v27 == v28;
          BOOL v29 = v27 < v28;
          if (v16) {
            BOOL v29 = v23 < v24;
          }
          if (!v29) {
            goto LABEL_30;
          }
        }
        else if (v25 >= v26)
        {
          goto LABEL_30;
        }
        long long v45 = *(_OWORD *)v19;
        uint64_t v46 = *(void *)(v19 + 16);
        *(void *)(v19 + 8) = 0;
        *(void *)(v19 + 16) = 0;
        *(void *)uint64_t v19 = 0;
        uint64_t v30 = v20;
        while (2)
        {
          uint64_t v31 = a1 + v30;
          BOOL v32 = (void **)(a1 + v30 + 72);
          if (*(char *)(a1 + v30 + 95) < 0) {
            operator delete(*v32);
          }
          *(_OWORD *)BOOL v32 = *(_OWORD *)(v31 + 48);
          *(void *)(a1 + v30 + 88) = *(void *)(v31 + 64);
          *(unsigned char *)(v31 + 71) = 0;
          *(unsigned char *)(v31 + 48) = 0;
          if (v30 == -48)
          {
            uint64_t v41 = a1;
            goto LABEL_29;
          }
          BOOL v33 = (void *)(*a3 + 40);
          uint64_t v34 = sub_EE310(v33, (unsigned __int8 *)&v45);
          unint64_t v35 = sub_EE310(v33, (unsigned __int8 *)(a1 + v30 + 24));
          unint64_t v36 = *((void *)v34 + 7);
          unint64_t v37 = *((void *)v35 + 7);
          if (v36 != v37)
          {
            if (v36 >= v37) {
              break;
            }
            goto LABEL_25;
          }
          unint64_t v38 = *((void *)v34 + 6);
          unint64_t v39 = *((void *)v35 + 6);
          BOOL v16 = v38 == v39;
          BOOL v40 = v38 < v39;
          if (v16) {
            BOOL v40 = v34 < v35;
          }
          if (v40)
          {
LABEL_25:
            v30 -= 24;
            continue;
          }
          break;
        }
        uint64_t v41 = a1 + v30 + 48;
        if (*(char *)(a1 + v30 + 71) < 0) {
          operator delete(*(void **)v41);
        }
LABEL_29:
        *(_OWORD *)uint64_t v41 = v45;
        *(void *)(v41 + 16) = v46;
        if (++v21 != 8)
        {
LABEL_30:
          BOOL v18 = (unsigned __int8 *)v19;
          v20 += 24;
          v19 += 24;
          if (v19 == a2) {
            return 1;
          }
          continue;
        }
        return v19 + 24 == a2;
      }
  }
}

void sub_14CD90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_14CDC4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, void *a5)
{
  sub_14C0F0((unsigned __int8 *)a1, a2, a3, a5);
  unint64_t v10 = (void *)(*a5 + 40);
  unint64_t v11 = sub_EE310(v10, a4);
  unint64_t v12 = sub_EE310(v10, a3);
  unint64_t v14 = *((void *)v11 + 7);
  unint64_t v15 = *((void *)v12 + 7);
  if (v14 != v15)
  {
    if (v14 >= v15) {
      return result;
    }
LABEL_7:
    uint64_t v20 = *((void *)a3 + 2);
    long long v21 = *(_OWORD *)a3;
    uint64_t v22 = *((void *)a4 + 2);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *((void *)a3 + 2) = v22;
    *(_OWORD *)a4 = v21;
    *((void *)a4 + 2) = v20;
    unint64_t v23 = (void *)(*a5 + 40);
    BOOL v24 = sub_EE310(v23, a3);
    unint64_t v25 = sub_EE310(v23, a2);
    unint64_t v26 = *((void *)v24 + 7);
    unint64_t v27 = *((void *)v25 + 7);
    if (v26 == v27)
    {
      unint64_t v28 = *((void *)v24 + 6);
      unint64_t v29 = *((void *)v25 + 6);
      BOOL v18 = v28 == v29;
      BOOL v30 = v28 < v29;
      if (v18) {
        BOOL v30 = v24 < v25;
      }
      if (!v30) {
        return result;
      }
    }
    else if (v26 >= v27)
    {
      return result;
    }
    uint64_t v31 = *((void *)a2 + 2);
    long long v32 = *(_OWORD *)a2;
    uint64_t v33 = *((void *)a3 + 2);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *((void *)a2 + 2) = v33;
    *(_OWORD *)a3 = v32;
    *((void *)a3 + 2) = v31;
    uint64_t v34 = (void *)(*a5 + 40);
    unint64_t v35 = sub_EE310(v34, a2);
    unint64_t v36 = sub_EE310(v34, (unsigned __int8 *)a1);
    unint64_t v37 = *((void *)v35 + 7);
    unint64_t v38 = *((void *)v36 + 7);
    if (v37 == v38)
    {
      unint64_t v39 = *((void *)v35 + 6);
      unint64_t v40 = *((void *)v36 + 6);
      BOOL v18 = v39 == v40;
      BOOL v41 = v39 < v40;
      if (v18) {
        BOOL v41 = v35 < v36;
      }
      if (!v41) {
        return result;
      }
    }
    else if (v37 >= v38)
    {
      return result;
    }
    uint64_t v42 = *(void *)(a1 + 16);
    __n128 result = *(__n128 *)a1;
    uint64_t v43 = *((void *)a2 + 2);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = v43;
    *(__n128 *)a2 = result;
    *((void *)a2 + 2) = v42;
    return result;
  }
  unint64_t v16 = *((void *)v11 + 6);
  unint64_t v17 = *((void *)v12 + 6);
  BOOL v18 = v16 == v17;
  BOOL v19 = v16 < v17;
  if (v18) {
    BOOL v19 = v11 < v12;
  }
  if (v19) {
    goto LABEL_7;
  }
  return result;
}

__n128 sub_14CF90(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, unsigned __int8 *a5, void *a6)
{
  sub_14CDC4(a1, a2, a3, a4, a6);
  unint64_t v12 = (void *)(*a6 + 40);
  unint64_t v13 = sub_EE310(v12, a5);
  unint64_t v14 = sub_EE310(v12, a4);
  unint64_t v16 = *((void *)v13 + 7);
  unint64_t v17 = *((void *)v14 + 7);
  if (v16 != v17)
  {
    if (v16 >= v17) {
      return result;
    }
LABEL_7:
    uint64_t v22 = *((void *)a4 + 2);
    long long v23 = *(_OWORD *)a4;
    uint64_t v24 = *((void *)a5 + 2);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *((void *)a4 + 2) = v24;
    *(_OWORD *)a5 = v23;
    *((void *)a5 + 2) = v22;
    unint64_t v25 = (void *)(*a6 + 40);
    unint64_t v26 = sub_EE310(v25, a4);
    unint64_t v27 = sub_EE310(v25, a3);
    unint64_t v28 = *((void *)v26 + 7);
    unint64_t v29 = *((void *)v27 + 7);
    if (v28 == v29)
    {
      unint64_t v30 = *((void *)v26 + 6);
      unint64_t v31 = *((void *)v27 + 6);
      BOOL v20 = v30 == v31;
      BOOL v32 = v30 < v31;
      if (v20) {
        BOOL v32 = v26 < v27;
      }
      if (!v32) {
        return result;
      }
    }
    else if (v28 >= v29)
    {
      return result;
    }
    uint64_t v33 = *((void *)a3 + 2);
    long long v34 = *(_OWORD *)a3;
    uint64_t v35 = *((void *)a4 + 2);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *((void *)a3 + 2) = v35;
    *(_OWORD *)a4 = v34;
    *((void *)a4 + 2) = v33;
    unint64_t v36 = (void *)(*a6 + 40);
    unint64_t v37 = sub_EE310(v36, a3);
    unint64_t v38 = sub_EE310(v36, a2);
    unint64_t v39 = *((void *)v37 + 7);
    unint64_t v40 = *((void *)v38 + 7);
    if (v39 == v40)
    {
      unint64_t v41 = *((void *)v37 + 6);
      unint64_t v42 = *((void *)v38 + 6);
      BOOL v20 = v41 == v42;
      BOOL v43 = v41 < v42;
      if (v20) {
        BOOL v43 = v37 < v38;
      }
      if (!v43) {
        return result;
      }
    }
    else if (v39 >= v40)
    {
      return result;
    }
    uint64_t v44 = *((void *)a2 + 2);
    long long v45 = *(_OWORD *)a2;
    uint64_t v46 = *((void *)a3 + 2);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *((void *)a2 + 2) = v46;
    *(_OWORD *)a3 = v45;
    *((void *)a3 + 2) = v44;
    BOOL v47 = (void *)(*a6 + 40);
    unint64_t v48 = sub_EE310(v47, a2);
    unint64_t v49 = sub_EE310(v47, (unsigned __int8 *)a1);
    unint64_t v50 = *((void *)v48 + 7);
    unint64_t v51 = *((void *)v49 + 7);
    if (v50 == v51)
    {
      unint64_t v52 = *((void *)v48 + 6);
      unint64_t v53 = *((void *)v49 + 6);
      BOOL v20 = v52 == v53;
      BOOL v54 = v52 < v53;
      if (v20) {
        BOOL v54 = v48 < v49;
      }
      if (!v54) {
        return result;
      }
    }
    else if (v50 >= v51)
    {
      return result;
    }
    uint64_t v55 = *(void *)(a1 + 16);
    __n128 result = *(__n128 *)a1;
    uint64_t v56 = *((void *)a2 + 2);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = v56;
    *(__n128 *)a2 = result;
    *((void *)a2 + 2) = v55;
    return result;
  }
  unint64_t v18 = *((void *)v13 + 6);
  unint64_t v19 = *((void *)v14 + 6);
  BOOL v20 = v18 == v19;
  BOOL v21 = v18 < v19;
  if (v20) {
    BOOL v21 = v13 < v14;
  }
  if (v21) {
    goto LABEL_7;
  }
  return result;
}

long long *sub_14D1DC(uint64_t a1, long long *a2, long long *a3, void *a4)
{
  if ((long long *)a1 != a2)
  {
    uint64_t v8 = (uint64_t)a2 - a1;
    uint64_t v9 = ((uint64_t)a2 - a1) / 24;
    if ((uint64_t)a2 - a1 >= 25)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      unint64_t v12 = (__n128 *)(a1 + 24 * v10);
      do
      {
        sub_14D470(a1, a4, v9, v12);
        unint64_t v12 = (__n128 *)((char *)v12 - 24);
        --v11;
      }
      while (v11);
    }
    unint64_t v13 = a2;
    if (a2 != a3)
    {
      unint64_t v14 = a2;
      while (1)
      {
        unint64_t v15 = (void *)(*a4 + 40);
        unint64_t v16 = sub_EE310(v15, (unsigned __int8 *)v14);
        unint64_t v17 = sub_EE310(v15, (unsigned __int8 *)a1);
        unint64_t v18 = *((void *)v16 + 7);
        unint64_t v19 = *((void *)v17 + 7);
        if (v18 == v19) {
          break;
        }
        if (v18 < v19) {
          goto LABEL_13;
        }
LABEL_14:
        unint64_t v14 = (long long *)((char *)v14 + 24);
        if (v14 == a3)
        {
          unint64_t v13 = a3;
          goto LABEL_16;
        }
      }
      unint64_t v20 = *((void *)v16 + 6);
      unint64_t v21 = *((void *)v17 + 6);
      BOOL v22 = v20 == v21;
      BOOL v23 = v20 < v21;
      if (v22) {
        BOOL v23 = v16 < v17;
      }
      if (!v23) {
        goto LABEL_14;
      }
LABEL_13:
      uint64_t v24 = *((void *)v14 + 2);
      long long v25 = *v14;
      uint64_t v26 = *(void *)(a1 + 16);
      long long *v14 = *(_OWORD *)a1;
      *((void *)v14 + 2) = v26;
      *(_OWORD *)a1 = v25;
      *(void *)(a1 + 16) = v24;
      sub_14D470(a1, a4, v9, (__n128 *)a1);
      goto LABEL_14;
    }
LABEL_16:
    if (v8 >= 25)
    {
      int64_t v27 = v8 / 0x18uLL;
      unint64_t v28 = (long long *)((char *)a2 - 24);
      do
      {
        uint64_t v29 = *(void *)a1;
        *(void *)unint64_t v37 = *(void *)(a1 + 8);
        *(void *)&v37[7] = *(void *)(a1 + 15);
        char v30 = *(unsigned char *)(a1 + 23);
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
        *(void *)a1 = 0;
        uint64_t v31 = sub_14D750(a1, a4, v27);
        uint64_t v32 = v31;
        int v33 = *(char *)(v31 + 23);
        if (v28 == (long long *)v31)
        {
          if (v33 < 0) {
            operator delete(*(void **)v31);
          }
          *(void *)uint64_t v32 = v29;
          *(void *)(v32 + 8) = *(void *)v37;
          *(void *)(v32 + 15) = *(void *)&v37[7];
          *(unsigned char *)(v32 + 23) = v30;
        }
        else
        {
          if (v33 < 0) {
            operator delete(*(void **)v31);
          }
          long long v34 = *v28;
          *(void *)(v32 + 16) = *((void *)v28 + 2);
          *(_OWORD *)uint64_t v32 = v34;
          *(void *)unint64_t v28 = v29;
          *((void *)v28 + 1) = *(void *)v37;
          *(void *)((char *)v28 + 15) = *(void *)&v37[7];
          *((unsigned char *)v28 + 23) = v30;
          sub_14D880(a1, v32 + 24, a4, 0xAAAAAAAAAAAAAAABLL * ((v32 + 24 - a1) >> 3));
        }
        unint64_t v28 = (long long *)((char *)v28 - 24);
      }
      while (v27-- > 2);
    }
    return v13;
  }
  return a3;
}

void sub_14D458(_Unwind_Exception *exception_object)
{
  if (v2 < 0) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_14D470(uint64_t a1, void *a2, uint64_t a3, __n128 *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 < 2) {
    return result;
  }
  char v5 = a4;
  uint64_t v50 = v4 >> 1;
  if ((uint64_t)(v4 >> 1) < (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3))) {
    return result;
  }
  uint64_t v9 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
  unint64_t v10 = (__n128 *)(a1 + 24 * v9);
  uint64_t v11 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
  if (v11 < a3)
  {
    unint64_t v12 = (void *)(*a2 + 40);
    unint64_t v13 = sub_EE310(v12, (unsigned __int8 *)(a1 + 24 * v9));
    unint64_t v14 = sub_EE310(v12, &v10[1].n128_u8[8]);
    unint64_t v15 = *((void *)v13 + 7);
    unint64_t v16 = *((void *)v14 + 7);
    if (v15 == v16)
    {
      unint64_t v17 = *((void *)v13 + 6);
      unint64_t v18 = *((void *)v14 + 6);
      BOOL v19 = v17 == v18;
      BOOL v20 = v17 < v18;
      if (v19) {
        BOOL v20 = v13 < v14;
      }
      if (!v20) {
        goto LABEL_11;
      }
    }
    else if (v15 >= v16)
    {
      goto LABEL_11;
    }
    unint64_t v10 = (__n128 *)((char *)v10 + 24);
    uint64_t v9 = v11;
  }
LABEL_11:
  unint64_t v21 = (void *)(*a2 + 40);
  BOOL v22 = sub_EE310(v21, (unsigned __int8 *)v10);
  BOOL v23 = sub_EE310(v21, (unsigned __int8 *)v5);
  unint64_t v25 = *((void *)v22 + 7);
  unint64_t v26 = *((void *)v23 + 7);
  if (v25 != v26)
  {
    if (v25 < v26) {
      return result;
    }
    goto LABEL_17;
  }
  unint64_t v27 = *((void *)v22 + 6);
  unint64_t v28 = *((void *)v23 + 6);
  BOOL v19 = v27 == v28;
  BOOL v29 = v27 < v28;
  if (v19) {
    BOOL v29 = v22 < v23;
  }
  if (!v29)
  {
LABEL_17:
    __n128 v51 = *v5;
    unint64_t v52 = v5[1].n128_u64[0];
    v5->n128_u64[1] = 0;
    v5[1].n128_u64[0] = 0;
    v5->n128_u64[0] = 0;
    while (1)
    {
      char v30 = v10;
      if (v5[1].n128_i8[7] < 0) {
        operator delete((void *)v5->n128_u64[0]);
      }
      __n128 v31 = *v10;
      v5[1].n128_u64[0] = v10[1].n128_u64[0];
      __n128 *v5 = v31;
      v10[1].n128_u8[7] = 0;
      v10->n128_u8[0] = 0;
      if (v50 < v9)
      {
LABEL_37:
        __n128 result = v51;
        v30[1].n128_u64[0] = v52;
        __n128 *v30 = result;
        return result;
      }
      uint64_t v32 = 2 * v9;
      uint64_t v9 = (2 * v9) | 1;
      unint64_t v10 = (__n128 *)(a1 + 24 * v9);
      uint64_t v33 = v32 + 2;
      if (v32 + 2 < a3)
      {
        long long v34 = (void *)(*a2 + 40);
        uint64_t v35 = sub_EE310(v34, (unsigned __int8 *)(a1 + 24 * v9));
        unint64_t v36 = sub_EE310(v34, &v10[1].n128_u8[8]);
        unint64_t v37 = *((void *)v35 + 7);
        unint64_t v38 = *((void *)v36 + 7);
        if (v37 == v38)
        {
          unint64_t v39 = *((void *)v35 + 6);
          unint64_t v40 = *((void *)v36 + 6);
          BOOL v19 = v39 == v40;
          BOOL v41 = v39 < v40;
          if (v19) {
            BOOL v41 = v35 < v36;
          }
          if (!v41) {
            goto LABEL_29;
          }
LABEL_28:
          unint64_t v10 = (__n128 *)((char *)v10 + 24);
          uint64_t v9 = v33;
          goto LABEL_29;
        }
        if (v37 < v38) {
          goto LABEL_28;
        }
      }
LABEL_29:
      unint64_t v42 = (void *)(*a2 + 40);
      BOOL v43 = sub_EE310(v42, (unsigned __int8 *)v10);
      uint64_t v44 = sub_EE310(v42, (unsigned __int8 *)&v51);
      unint64_t v45 = *((void *)v43 + 7);
      unint64_t v46 = *((void *)v44 + 7);
      if (v45 == v46)
      {
        unint64_t v47 = *((void *)v43 + 6);
        unint64_t v48 = *((void *)v44 + 6);
        BOOL v19 = v47 == v48;
        BOOL v49 = v47 < v48;
        if (v19) {
          BOOL v49 = v43 < v44;
        }
        char v5 = v30;
        if (v49)
        {
LABEL_35:
          if (v30[1].n128_i8[7] < 0) {
            operator delete((void *)v30->n128_u64[0]);
          }
          goto LABEL_37;
        }
      }
      else
      {
        char v5 = v30;
        if (v45 < v46) {
          goto LABEL_35;
        }
      }
    }
  }
  return result;
}

void sub_14D734(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_14D750(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v6 = a3 - 2;
  if (a3 < 2) {
    uint64_t v6 = a3 - 1;
  }
  uint64_t v7 = v6 >> 1;
  do
  {
    uint64_t v8 = a1 + 24 * v5 + 24;
    uint64_t v9 = 2 * v5;
    uint64_t v5 = (2 * v5) | 1;
    uint64_t v10 = v9 + 2;
    if (v9 + 2 >= a3) {
      goto LABEL_12;
    }
    uint64_t v11 = (void *)(*a2 + 40);
    unint64_t v12 = sub_EE310(v11, (unsigned __int8 *)v8);
    unint64_t v13 = sub_EE310(v11, (unsigned __int8 *)(v8 + 24));
    unint64_t v14 = *((void *)v12 + 7);
    unint64_t v15 = *((void *)v13 + 7);
    if (v14 != v15)
    {
      if (v14 >= v15) {
        goto LABEL_12;
      }
LABEL_11:
      v8 += 24;
      uint64_t v5 = v10;
      goto LABEL_12;
    }
    unint64_t v16 = *((void *)v12 + 6);
    unint64_t v17 = *((void *)v13 + 6);
    BOOL v18 = v16 == v17;
    BOOL v19 = v16 < v17;
    if (v18) {
      BOOL v19 = v12 < v13;
    }
    if (v19) {
      goto LABEL_11;
    }
LABEL_12:
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v20 = *(_OWORD *)v8;
    *(void *)(a1 + 16) = *(void *)(v8 + 16);
    *(_OWORD *)a1 = v20;
    *(unsigned char *)(v8 + 23) = 0;
    *(unsigned char *)uint64_t v8 = 0;
    a1 = v8;
  }
  while (v5 <= v7);
  return v8;
}

double sub_14D880(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 < 2) {
    return result;
  }
  unint64_t v7 = v4 >> 1;
  uint64_t v8 = (unsigned __int8 *)(a1 + 24 * (v4 >> 1));
  uint64_t v9 = (unsigned __int8 *)(a2 - 24);
  uint64_t v10 = (void *)(*a3 + 40);
  uint64_t v11 = sub_EE310(v10, v8);
  unint64_t v12 = sub_EE310(v10, v9);
  unint64_t v14 = *((void *)v11 + 7);
  unint64_t v15 = *((void *)v12 + 7);
  if (v14 == v15)
  {
    unint64_t v16 = *((void *)v11 + 6);
    unint64_t v17 = *((void *)v12 + 6);
    BOOL v18 = v16 == v17;
    BOOL v19 = v16 < v17;
    if (v18) {
      BOOL v19 = v11 < v12;
    }
    if (!v19) {
      return result;
    }
  }
  else if (v14 >= v15)
  {
    return result;
  }
  long long v30 = *(_OWORD *)v9;
  uint64_t v31 = *((void *)v9 + 2);
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = 0;
  *(void *)uint64_t v9 = 0;
  while (1)
  {
    long long v20 = v8;
    if ((char)v9[23] < 0) {
      operator delete(*(void **)v9);
    }
    long long v21 = *(_OWORD *)v8;
    *((void *)v9 + 2) = *((void *)v8 + 2);
    *(_OWORD *)uint64_t v9 = v21;
    v8[23] = 0;
    *uint64_t v8 = 0;
    if (!v7) {
      break;
    }
    unint64_t v7 = (v7 - 1) >> 1;
    uint64_t v8 = (unsigned __int8 *)(a1 + 24 * v7);
    BOOL v22 = (void *)(*a3 + 40);
    BOOL v23 = sub_EE310(v22, v8);
    uint64_t v24 = sub_EE310(v22, (unsigned __int8 *)&v30);
    unint64_t v25 = *((void *)v23 + 7);
    unint64_t v26 = *((void *)v24 + 7);
    if (v25 == v26)
    {
      unint64_t v27 = *((void *)v23 + 6);
      unint64_t v28 = *((void *)v24 + 6);
      BOOL v18 = v27 == v28;
      BOOL v29 = v27 < v28;
      if (v18) {
        BOOL v29 = v23 < v24;
      }
      uint64_t v9 = v20;
      if (!v29)
      {
LABEL_18:
        if ((char)v20[23] < 0) {
          operator delete(*(void **)v20);
        }
        break;
      }
    }
    else
    {
      uint64_t v9 = v20;
      if (v25 >= v26) {
        goto LABEL_18;
      }
    }
  }
  double result = *(double *)&v30;
  *(_OWORD *)long long v20 = v30;
  *((void *)v20 + 2) = v31;
  return result;
}

void sub_14DA14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

id sub_14DA30(char **a1, id *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(char **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = (v7 - *a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      sub_4484();
    }
    uint64_t v11 = v5 - (void)*a1;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v25 = v4;
    if (v13) {
      unint64_t v14 = (char *)sub_39FA0(v4, v13);
    }
    else {
      unint64_t v14 = 0;
    }
    unint64_t v15 = &v14[8 * v10];
    unint64_t v16 = &v14[8 * v13];
    uint64_t v24 = v16;
    *(void *)unint64_t v15 = *a2;
    uint64_t v9 = v15 + 8;
    v23.i64[1] = (uint64_t)(v15 + 8);
    BOOL v18 = *a1;
    unint64_t v17 = a1[1];
    if (v17 == *a1)
    {
      int64x2_t v20 = vdupq_n_s64((unint64_t)v17);
    }
    else
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *(void *)unint64_t v17 = 0;
        *((void *)v15 - 1) = v19;
        v15 -= 8;
      }
      while (v17 != v18);
      int64x2_t v20 = *(int64x2_t *)a1;
      uint64_t v9 = (char *)v23.i64[1];
      unint64_t v16 = v24;
    }
    *a1 = v15;
    a1[1] = v9;
    int64x2_t v23 = v20;
    long long v21 = a1[2];
    a1[2] = v16;
    uint64_t v24 = v21;
    uint64_t v22 = v20.i64[0];
    id result = (id)sub_14DB54((uint64_t)&v22);
  }
  else
  {
    id result = *a2;
    *(void *)unint64_t v7 = result;
    uint64_t v9 = v7 + 8;
  }
  a1[1] = v9;
  return result;
}

uint64_t sub_14DB54(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_14DBA8(unint64_t *a1, void **a2, void *a3, uint64_t a4, char a5)
{
void sub_14DF50(void **a1, void **a2, void *a3)
{
  if (a1 == a2) {
    return;
  }
  uint64_t v3 = (unint64_t *)a2;
  char v5 = (unint64_t *)(a1 + 1);
  if (a1 + 1 == a2) {
    return;
  }
  uint64_t v7 = 0;
  uint64_t v8 = (unint64_t *)a1;
  do
  {
    uint64_t v9 = v8;
    uint64_t v8 = v5;
    unint64_t v10 = v9[1];
    unint64_t v37 = *v9;
    unint64_t v38 = v10;
    uint64_t v11 = (void *)(*a3 + 80);
    uint64_t v12 = sub_417C(v11, &v38);
    uint64_t v13 = sub_417C(v11, &v37);
    unint64_t v14 = v12[4];
    unint64_t v15 = v13[4];
    if (v14 == v15)
    {
      unint64_t v16 = v12[3];
      unint64_t v17 = v13[3];
      BOOL v18 = v16 == v17;
      BOOL v19 = v16 < v17;
      if (v18) {
        BOOL v19 = v12 < v13;
      }
      if (!v19) {
        goto LABEL_23;
      }
    }
    else if (v14 >= v15)
    {
      goto LABEL_23;
    }
    unint64_t v20 = *v9;
    unint64_t v21 = v9[1];
    *uint64_t v9 = 0;
    v9[1] = v20;
    unint64_t v22 = a1;
    if (v9 == (unint64_t *)a1) {
      goto LABEL_22;
    }
    uint64_t v23 = v7;
    while (1)
    {
      uint64_t v24 = (void **)((char *)a1 + v23);
      unint64_t v37 = *(unint64_t *)((char *)a1 + v23 - 8);
      unint64_t v38 = v21;
      uint64_t v25 = (void *)(*a3 + 80);
      unint64_t v26 = sub_417C(v25, &v38);
      unint64_t v27 = sub_417C(v25, &v37);
      unint64_t v28 = v26[4];
      unint64_t v29 = v27[4];
      if (v28 == v29)
      {
        unint64_t v30 = v26[3];
        unint64_t v31 = v27[3];
        BOOL v18 = v30 == v31;
        BOOL v32 = v30 < v31;
        if (v18) {
          BOOL v32 = v26 < v27;
        }
        if (!v32)
        {
          unint64_t v22 = (void **)v9;
          goto LABEL_21;
        }
        goto LABEL_18;
      }
      if (v28 >= v29) {
        break;
      }
LABEL_18:
      --v9;
      BOOL v33 = *(v24 - 1);
      unint64_t v34 = *v24;
      *(v24 - 1) = 0;
      *uint64_t v24 = v33;

      v23 -= 8;
      if (!v23)
      {
        unint64_t v22 = a1;
        goto LABEL_21;
      }
    }
    unint64_t v22 = (void **)((char *)a1 + v23);
LABEL_21:
    uint64_t v3 = (unint64_t *)a2;
LABEL_22:
    uint64_t v35 = *v22;
    *unint64_t v22 = (void *)v21;

LABEL_23:
    char v5 = v8 + 1;
    v7 += 8;
  }
  while (v8 + 1 != v3);
}

void sub_14E0F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14E108(unint64_t *a1, unint64_t *a2, void *a3)
{
  if (a1 != a2)
  {
    uint64_t v4 = a1;
    char v5 = a1 + 1;
    if (a1 + 1 != a2)
    {
      while (1)
      {
        uint64_t v7 = v4;
        uint64_t v4 = v5;
        unint64_t v8 = v7[1];
        unint64_t v32 = *v7;
        unint64_t v33 = v8;
        uint64_t v9 = (void *)(*a3 + 80);
        unint64_t v10 = sub_417C(v9, &v33);
        uint64_t v11 = sub_417C(v9, &v32);
        unint64_t v12 = v10[4];
        unint64_t v13 = v11[4];
        if (v12 != v13) {
          break;
        }
        unint64_t v14 = v10[3];
        unint64_t v15 = v11[3];
        BOOL v16 = v14 == v15;
        BOOL v17 = v14 < v15;
        if (v16) {
          BOOL v17 = v10 < v11;
        }
        if (v17) {
          goto LABEL_9;
        }
LABEL_18:
        char v5 = v4 + 1;
        if (v4 + 1 == a2) {
          return;
        }
      }
      if (v12 >= v13) {
        goto LABEL_18;
      }
LABEL_9:
      BOOL v18 = 0;
      unint64_t v19 = *v4;
      *uint64_t v4 = 0;
      for (i = v7; ; uint64_t v7 = i)
      {
        unint64_t v21 = *v7;
        *uint64_t v7 = 0;
        v7[1] = v21;

        unint64_t v22 = *--i;
        unint64_t v32 = v22;
        unint64_t v33 = v19;
        uint64_t v23 = (void *)(*a3 + 80);
        uint64_t v24 = sub_417C(v23, &v33);
        uint64_t v25 = sub_417C(v23, &v32);
        unint64_t v26 = v24[4];
        unint64_t v27 = v25[4];
        if (v26 == v27)
        {
          unint64_t v28 = v24[3];
          unint64_t v29 = v25[3];
          BOOL v16 = v28 == v29;
          BOOL v30 = v28 < v29;
          if (v16) {
            BOOL v30 = v24 < v25;
          }
          if (!v30)
          {
LABEL_17:
            unint64_t v31 = (void *)*v7;
            *uint64_t v7 = v19;

            goto LABEL_18;
          }
        }
        else if (v26 >= v27)
        {
          goto LABEL_17;
        }
        BOOL v18 = (void *)*v7;
      }
    }
  }
}

void sub_14E274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_14E284(unint64_t *a1, unint64_t *a2, unint64_t *a3, void *a4)
{
  BOOL v6 = a2;
  uint64_t v7 = a1;
  unint64_t v8 = *a2;
  unint64_t v68 = *a1;
  unint64_t v69 = v8;
  uint64_t v9 = (void *)(*a4 + 80);
  unint64_t v10 = sub_417C(v9, &v69);
  uint64_t v11 = sub_417C(v9, &v68);
  unint64_t v12 = v10[4];
  unint64_t v13 = v11[4];
  if (v12 != v13)
  {
    if (v12 >= v13) {
      goto LABEL_5;
    }
LABEL_11:
    unint64_t v28 = *a3;
    unint64_t v68 = *v6;
    unint64_t v69 = v28;
    unint64_t v29 = (void *)(*a4 + 80);
    BOOL v30 = sub_417C(v29, &v69);
    unint64_t v31 = sub_417C(v29, &v68);
    unint64_t v32 = v30[4];
    unint64_t v33 = v31[4];
    if (v32 == v33)
    {
      unint64_t v34 = v30[3];
      unint64_t v35 = v31[3];
      BOOL v16 = v34 == v35;
      BOOL v36 = v34 < v35;
      if (v16) {
        BOOL v36 = v30 < v31;
      }
      if (v36) {
        goto LABEL_15;
      }
    }
    else if (v32 < v33)
    {
LABEL_15:
      uint64_t v27 = 1;
      goto LABEL_32;
    }
    unint64_t v50 = *v7;
    *uint64_t v7 = 0;
    unint64_t v51 = *v6;
    *BOOL v6 = 0;
    unint64_t v52 = (void *)*v7;
    *uint64_t v7 = v51;

    unint64_t v53 = (void *)*v6;
    *BOOL v6 = v50;

    unint64_t v54 = *a3;
    unint64_t v68 = *v6;
    unint64_t v69 = v54;
    uint64_t v55 = (void *)(*a4 + 80);
    uint64_t v56 = sub_417C(v55, &v69);
    long long v57 = sub_417C(v55, &v68);
    unint64_t v58 = v56[4];
    unint64_t v59 = v57[4];
    if (v58 == v59)
    {
      unint64_t v60 = v56[3];
      unint64_t v61 = v57[3];
      BOOL v16 = v60 == v61;
      BOOL v62 = v60 < v61;
      if (v16) {
        BOOL v62 = v56 < v57;
      }
      if (!v62) {
        return 1;
      }
    }
    else if (v58 >= v59)
    {
      return 1;
    }
    uint64_t v27 = 2;
    uint64_t v7 = v6;
LABEL_32:
    BOOL v6 = a3;
    goto LABEL_33;
  }
  unint64_t v14 = v10[3];
  unint64_t v15 = v11[3];
  BOOL v16 = v14 == v15;
  BOOL v17 = v14 < v15;
  if (v16) {
    BOOL v17 = v10 < v11;
  }
  if (v17) {
    goto LABEL_11;
  }
LABEL_5:
  unint64_t v18 = *a3;
  unint64_t v68 = *v6;
  unint64_t v69 = v18;
  unint64_t v19 = (void *)(*a4 + 80);
  unint64_t v20 = sub_417C(v19, &v69);
  unint64_t v21 = sub_417C(v19, &v68);
  unint64_t v22 = v20[4];
  unint64_t v23 = v21[4];
  if (v22 == v23)
  {
    unint64_t v24 = v20[3];
    unint64_t v25 = v21[3];
    BOOL v16 = v24 == v25;
    BOOL v26 = v24 < v25;
    if (v16) {
      BOOL v26 = v20 < v21;
    }
    if (!v26) {
      return 0;
    }
    goto LABEL_17;
  }
  if (v22 < v23)
  {
LABEL_17:
    unint64_t v37 = *v6;
    *BOOL v6 = 0;
    unint64_t v38 = *a3;
    *a3 = 0;
    unint64_t v39 = (void *)*v6;
    *BOOL v6 = v38;

    unint64_t v40 = (void *)*a3;
    *a3 = v37;

    unint64_t v41 = *v6;
    unint64_t v68 = *v7;
    unint64_t v69 = v41;
    BOOL v42 = (void *)(*a4 + 80);
    unint64_t v43 = sub_417C(v42, &v69);
    unint64_t v44 = sub_417C(v42, &v68);
    unint64_t v45 = v43[4];
    unint64_t v46 = v44[4];
    if (v45 == v46)
    {
      unint64_t v47 = v43[3];
      unint64_t v48 = v44[3];
      BOOL v16 = v47 == v48;
      BOOL v49 = v47 < v48;
      if (v16) {
        BOOL v49 = v43 < v44;
      }
      if (!v49) {
        return 1;
      }
      goto LABEL_29;
    }
    if (v45 < v46)
    {
LABEL_29:
      uint64_t v27 = 2;
LABEL_33:
      unint64_t v63 = *v7;
      *uint64_t v7 = 0;
      unint64_t v64 = *v6;
      *BOOL v6 = 0;
      long long v65 = (void *)*v7;
      *uint64_t v7 = v64;

      uint64_t v66 = (void *)*v6;
      *BOOL v6 = v63;

      return v27;
    }
    return 1;
  }
  return 0;
}

unint64_t *sub_14E574(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t v4 = a2;
  unint64_t v6 = *a1;
  *a1 = 0;
  unint64_t v68 = *(a2 - 1);
  unint64_t v69 = v6;
  uint64_t v7 = (void *)(*a3 + 80);
  unint64_t v8 = sub_417C(v7, &v69);
  uint64_t v9 = sub_417C(v7, &v68);
  unint64_t v10 = v8[4];
  unint64_t v11 = v9[4];
  if (v10 != v11)
  {
    if (v10 >= v11) {
      goto LABEL_5;
    }
LABEL_15:
    for (uint64_t i = a1 + 1; ; ++i)
    {
      unint64_t v68 = *i;
      unint64_t v69 = v6;
      unint64_t v25 = (void *)(*a3 + 80);
      BOOL v26 = sub_417C(v25, &v69);
      uint64_t v27 = sub_417C(v25, &v68);
      unint64_t v28 = v26[4];
      unint64_t v29 = v27[4];
      if (v28 == v29)
      {
        unint64_t v30 = v26[3];
        unint64_t v31 = v27[3];
        BOOL v14 = v30 == v31;
        BOOL v32 = v30 < v31;
        if (v14) {
          BOOL v32 = v26 < v27;
        }
        if (v32) {
          goto LABEL_23;
        }
      }
      else if (v28 < v29)
      {
        goto LABEL_23;
      }
    }
  }
  unint64_t v12 = v8[3];
  unint64_t v13 = v9[3];
  BOOL v14 = v12 == v13;
  BOOL v15 = v12 < v13;
  if (v14) {
    BOOL v15 = v8 < v9;
  }
  if (v15) {
    goto LABEL_15;
  }
LABEL_5:
  for (uint64_t i = a1 + 1; i < v4; ++i)
  {
    unint64_t v68 = *i;
    unint64_t v69 = v6;
    BOOL v17 = (void *)(*a3 + 80);
    unint64_t v18 = sub_417C(v17, &v69);
    unint64_t v19 = sub_417C(v17, &v68);
    unint64_t v20 = v18[4];
    unint64_t v21 = v19[4];
    if (v20 == v21)
    {
      unint64_t v22 = v18[3];
      unint64_t v23 = v19[3];
      BOOL v14 = v22 == v23;
      BOOL v24 = v22 < v23;
      if (v14) {
        BOOL v24 = v18 < v19;
      }
      if (v24) {
        break;
      }
    }
    else if (v20 < v21)
    {
      break;
    }
  }
LABEL_23:
  if (i >= v4) {
    goto LABEL_44;
  }
  do
  {
    while (1)
    {
      unint64_t v33 = *--v4;
      unint64_t v68 = v33;
      unint64_t v69 = v6;
      unint64_t v34 = (void *)(*a3 + 80);
      unint64_t v35 = sub_417C(v34, &v69);
      BOOL v36 = sub_417C(v34, &v68);
      unint64_t v37 = v35[4];
      unint64_t v38 = v36[4];
      if (v37 == v38) {
        break;
      }
      if (v37 >= v38) {
        goto LABEL_44;
      }
    }
    unint64_t v39 = v35[3];
    unint64_t v40 = v36[3];
    BOOL v14 = v39 == v40;
    BOOL v41 = v39 < v40;
    if (v14) {
      BOOL v41 = v35 < v36;
    }
  }
  while (v41);
LABEL_44:
  if (i < v4)
  {
    unint64_t v42 = *i;
    *uint64_t i = 0;
    unint64_t v43 = *v4;
    *uint64_t v4 = 0;
    unint64_t v44 = (void *)*i;
    *i++ = v43;

    unint64_t v45 = (void *)*v4;
    *uint64_t v4 = v42;

    while (1)
    {
      unint64_t v68 = *i;
      unint64_t v69 = v6;
      unint64_t v46 = (void *)(*a3 + 80);
      unint64_t v47 = sub_417C(v46, &v69);
      unint64_t v48 = sub_417C(v46, &v68);
      unint64_t v49 = v47[4];
      unint64_t v50 = v48[4];
      if (v49 == v50)
      {
        unint64_t v51 = v47[3];
        unint64_t v52 = v48[3];
        BOOL v14 = v51 == v52;
        BOOL v53 = v51 < v52;
        if (v14) {
          BOOL v53 = v47 < v48;
        }
        if (v53)
        {
          do
          {
LABEL_40:
            while (1)
            {
              unint64_t v54 = *--v4;
              unint64_t v68 = v54;
              unint64_t v69 = v6;
              uint64_t v55 = (void *)(*a3 + 80);
              uint64_t v56 = sub_417C(v55, &v69);
              long long v57 = sub_417C(v55, &v68);
              unint64_t v58 = v56[4];
              unint64_t v59 = v57[4];
              if (v58 == v59) {
                break;
              }
              if (v58 >= v59) {
                goto LABEL_44;
              }
            }
            unint64_t v60 = v56[3];
            unint64_t v61 = v57[3];
            BOOL v14 = v60 == v61;
            BOOL v62 = v60 < v61;
            if (v14) {
              BOOL v62 = v56 < v57;
            }
          }
          while (v62);
          goto LABEL_44;
        }
      }
      else if (v49 < v50)
      {
        goto LABEL_40;
      }
      ++i;
    }
  }
  unint64_t v63 = i - 1;
  if (i - 1 != a1)
  {
    unint64_t v64 = *v63;
    *unint64_t v63 = 0;
    long long v65 = (void *)*a1;
    *a1 = v64;
  }
  uint64_t v66 = (void *)*(i - 1);
  *(i - 1) = v6;

  return i;
}

void sub_14E8A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t *sub_14E8CC(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t v6 = 0;
  unint64_t v7 = *a1;
  *a1 = 0;
  while (1)
  {
    unint64_t v8 = a1[v6 + 1];
    unint64_t v68 = v7;
    unint64_t v69 = v8;
    uint64_t v9 = (void *)(*a3 + 80);
    unint64_t v10 = sub_417C(v9, &v69);
    unint64_t v11 = sub_417C(v9, &v68);
    unint64_t v12 = v10[4];
    unint64_t v13 = v11[4];
    if (v12 == v13) {
      break;
    }
    if (v12 >= v13) {
      goto LABEL_9;
    }
LABEL_8:
    ++v6;
  }
  unint64_t v14 = v10[3];
  unint64_t v15 = v11[3];
  BOOL v16 = v14 == v15;
  BOOL v17 = v14 < v15;
  if (v16) {
    BOOL v17 = v10 < v11;
  }
  if (v17) {
    goto LABEL_8;
  }
LABEL_9:
  unint64_t v18 = &a1[v6];
  unint64_t v19 = (unint64_t)&a1[v6 + 1];
  if (v6 * 8)
  {
    do
    {
      while (1)
      {
        unint64_t v20 = *--a2;
        unint64_t v68 = v7;
        unint64_t v69 = v20;
        unint64_t v21 = (void *)(*a3 + 80);
        unint64_t v22 = sub_417C(v21, &v69);
        unint64_t v23 = sub_417C(v21, &v68);
        unint64_t v24 = v22[4];
        unint64_t v25 = v23[4];
        if (v24 == v25) {
          break;
        }
        if (v24 < v25) {
          goto LABEL_32;
        }
      }
      unint64_t v26 = v22[3];
      unint64_t v27 = v23[3];
      BOOL v16 = v26 == v27;
      BOOL v28 = v26 < v27;
      if (v16) {
        BOOL v28 = v22 < v23;
      }
    }
    while (!v28);
  }
  else if (v19 < (unint64_t)a2)
  {
    do
    {
      while (1)
      {
        unint64_t v29 = *--a2;
        unint64_t v68 = v7;
        unint64_t v69 = v29;
        unint64_t v30 = (void *)(*a3 + 80);
        unint64_t v31 = sub_417C(v30, &v69);
        BOOL v32 = sub_417C(v30, &v68);
        unint64_t v33 = v31[4];
        unint64_t v34 = v32[4];
        if (v33 == v34) {
          break;
        }
        if (v33 < v34 || v19 >= (unint64_t)a2) {
          goto LABEL_32;
        }
      }
      unint64_t v35 = v31[3];
      unint64_t v36 = v32[3];
      BOOL v16 = v35 == v36;
      BOOL v37 = v35 >= v36;
      if (v16) {
        BOOL v37 = v31 >= v32;
      }
    }
    while (v37 && v19 < (unint64_t)a2);
  }
LABEL_32:
  if (v19 >= (unint64_t)a2) {
    goto LABEL_49;
  }
  unint64_t v40 = (unint64_t *)v19;
  BOOL v41 = a2;
  while (2)
  {
    unint64_t v42 = *v40;
    *unint64_t v40 = 0;
    unint64_t v43 = *v41;
    *BOOL v41 = 0;
    unint64_t v44 = (void *)*v40;
    *v40++ = v43;

    unint64_t v45 = (void *)*v41;
    *BOOL v41 = v42;

    while (2)
    {
      unint64_t v46 = *v40;
      unint64_t v68 = v7;
      unint64_t v69 = v46;
      unint64_t v47 = (void *)(*a3 + 80);
      unint64_t v48 = sub_417C(v47, &v69);
      unint64_t v49 = sub_417C(v47, &v68);
      unint64_t v50 = v48[4];
      unint64_t v51 = v49[4];
      if (v50 != v51)
      {
        if (v50 >= v51) {
          goto LABEL_43;
        }
        goto LABEL_41;
      }
      unint64_t v52 = v48[3];
      unint64_t v53 = v49[3];
      BOOL v16 = v52 == v53;
      BOOL v54 = v52 < v53;
      if (v16) {
        BOOL v54 = v48 < v49;
      }
      if (v54)
      {
LABEL_41:
        ++v40;
        continue;
      }
      break;
    }
    do
    {
LABEL_43:
      while (1)
      {
        unint64_t v55 = *--v41;
        unint64_t v68 = v7;
        unint64_t v69 = v55;
        uint64_t v56 = (void *)(*a3 + 80);
        long long v57 = sub_417C(v56, &v69);
        unint64_t v58 = sub_417C(v56, &v68);
        unint64_t v59 = v57[4];
        unint64_t v60 = v58[4];
        if (v59 == v60) {
          break;
        }
        if (v59 < v60) {
          goto LABEL_47;
        }
      }
      unint64_t v61 = v57[3];
      unint64_t v62 = v58[3];
      BOOL v16 = v61 == v62;
      BOOL v63 = v61 < v62;
      if (v16) {
        BOOL v63 = v57 < v58;
      }
    }
    while (!v63);
LABEL_47:
    if (v40 < v41) {
      continue;
    }
    break;
  }
  unint64_t v18 = v40 - 1;
LABEL_49:
  if (v18 != a1)
  {
    unint64_t v64 = *v18;
    *unint64_t v18 = 0;
    long long v65 = (void *)*a1;
    *a1 = v64;
  }
  uint64_t v66 = (void *)*v18;
  *unint64_t v18 = v7;

  return v18;
}

void sub_14EBCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_14EBEC(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      unint64_t v8 = *(a2 - 1);
      unint64_t v53 = *a1;
      unint64_t v54 = v8;
      uint64_t v9 = (void *)(*a3 + 80);
      unint64_t v10 = sub_417C(v9, &v54);
      unint64_t v11 = sub_417C(v9, &v53);
      unint64_t v12 = v10[4];
      unint64_t v13 = v11[4];
      if (v12 == v13)
      {
        unint64_t v14 = v10[3];
        unint64_t v15 = v11[3];
        BOOL v16 = v14 == v15;
        BOOL v17 = v14 < v15;
        if (v16) {
          BOOL v17 = v10 < v11;
        }
        if (!v17) {
          return 1;
        }
      }
      else if (v12 >= v13)
      {
        return 1;
      }
      unint64_t v47 = *a1;
      *a1 = 0;
      unint64_t v48 = *(v4 - 1);
      *(v4 - 1) = 0;
      unint64_t v49 = (void *)*a1;
      *a1 = v48;

      unint64_t v50 = (void *)*(v4 - 1);
      *(v4 - 1) = v47;

      return 1;
    case 3:
      sub_14E284(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      sub_14EF24(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      sub_14F12C(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      unint64_t v18 = a1 + 2;
      sub_14E284(a1, a1 + 1, a1 + 2, a3);
      unint64_t v19 = a1 + 3;
      if (a1 + 3 == v4) {
        return 1;
      }
      uint64_t v20 = 0;
      int v21 = 0;
      unint64_t v51 = v4;
      while (2)
      {
        unint64_t v22 = *v19;
        unint64_t v53 = *v18;
        unint64_t v54 = v22;
        unint64_t v23 = (void *)(*a3 + 80);
        unint64_t v24 = sub_417C(v23, &v54);
        unint64_t v25 = sub_417C(v23, &v53);
        unint64_t v26 = v24[4];
        unint64_t v27 = v25[4];
        if (v26 == v27)
        {
          unint64_t v28 = v24[3];
          unint64_t v29 = v25[3];
          BOOL v16 = v28 == v29;
          BOOL v30 = v28 < v29;
          if (v16) {
            BOOL v30 = v24 < v25;
          }
          if (!v30) {
            goto LABEL_28;
          }
        }
        else if (v26 >= v27)
        {
          goto LABEL_28;
        }
        unint64_t v31 = *v19;
        unint64_t v32 = *v18;
        *unint64_t v18 = 0;
        *unint64_t v19 = v32;
        unint64_t v33 = (void **)a1;
        if (v18 == a1) {
          goto LABEL_27;
        }
        int v52 = v21;
        uint64_t v34 = v20;
        while (2)
        {
          unint64_t v35 = (char *)a1 + v34;
          unint64_t v53 = *(unint64_t *)((char *)a1 + v34 + 8);
          unint64_t v54 = v31;
          unint64_t v36 = (void *)(*a3 + 80);
          BOOL v37 = sub_417C(v36, &v54);
          unint64_t v38 = sub_417C(v36, &v53);
          unint64_t v39 = v37[4];
          unint64_t v40 = v38[4];
          if (v39 == v40)
          {
            unint64_t v41 = v37[3];
            unint64_t v42 = v38[3];
            BOOL v16 = v41 == v42;
            BOOL v43 = v41 < v42;
            if (v16) {
              BOOL v43 = v37 < v38;
            }
            if (!v43)
            {
              unint64_t v33 = (void **)v18;
              goto LABEL_26;
            }
LABEL_23:
            --v18;
            uint64_t v44 = *((void *)v35 + 1);
            unint64_t v45 = (void *)*((void *)v35 + 2);
            *((void *)v35 + 1) = 0;
            *((void *)v35 + 2) = v44;

            v34 -= 8;
            if (v34 == -16)
            {
              unint64_t v33 = (void **)a1;
              goto LABEL_26;
            }
            continue;
          }
          break;
        }
        if (v39 < v40) {
          goto LABEL_23;
        }
        unint64_t v33 = (void **)((char *)a1 + v34 + 16);
LABEL_26:
        uint64_t v4 = v51;
        int v21 = v52;
LABEL_27:
        unint64_t v46 = *v33;
        *unint64_t v33 = (void *)v31;

        if (++v21 != 8)
        {
LABEL_28:
          unint64_t v18 = v19;
          v20 += 8;
          if (++v19 == v4) {
            return 1;
          }
          continue;
        }
        return v19 + 1 == v4;
      }
  }
}

void sub_14EEFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14EF24(unint64_t *a1, unint64_t *a2, unint64_t *a3, unint64_t *a4, void *a5)
{
  sub_14E284(a1, a2, a3, a5);
  unint64_t v10 = *a4;
  unint64_t v50 = *a3;
  unint64_t v51 = v10;
  unint64_t v11 = (void *)(*a5 + 80);
  unint64_t v12 = sub_417C(v11, &v51);
  unint64_t v13 = sub_417C(v11, &v50);
  unint64_t v14 = v12[4];
  unint64_t v15 = v13[4];
  if (v14 != v15)
  {
    if (v14 >= v15) {
      return;
    }
LABEL_7:
    unint64_t v20 = *a3;
    *a3 = 0;
    unint64_t v21 = *a4;
    *a4 = 0;
    unint64_t v22 = (void *)*a3;
    *a3 = v21;

    unint64_t v23 = (void *)*a4;
    *a4 = v20;

    unint64_t v24 = *a3;
    unint64_t v50 = *a2;
    unint64_t v51 = v24;
    unint64_t v25 = (void *)(*a5 + 80);
    unint64_t v26 = sub_417C(v25, &v51);
    unint64_t v27 = sub_417C(v25, &v50);
    unint64_t v28 = v26[4];
    unint64_t v29 = v27[4];
    if (v28 == v29)
    {
      unint64_t v30 = v26[3];
      unint64_t v31 = v27[3];
      BOOL v18 = v30 == v31;
      BOOL v32 = v30 < v31;
      if (v18) {
        BOOL v32 = v26 < v27;
      }
      if (!v32) {
        return;
      }
    }
    else if (v28 >= v29)
    {
      return;
    }
    unint64_t v33 = *a2;
    *a2 = 0;
    unint64_t v34 = *a3;
    *a3 = 0;
    unint64_t v35 = (void *)*a2;
    *a2 = v34;

    unint64_t v36 = (void *)*a3;
    *a3 = v33;

    unint64_t v37 = *a2;
    unint64_t v50 = *a1;
    unint64_t v51 = v37;
    unint64_t v38 = (void *)(*a5 + 80);
    unint64_t v39 = sub_417C(v38, &v51);
    unint64_t v40 = sub_417C(v38, &v50);
    unint64_t v41 = v39[4];
    unint64_t v42 = v40[4];
    if (v41 == v42)
    {
      unint64_t v43 = v39[3];
      unint64_t v44 = v40[3];
      BOOL v18 = v43 == v44;
      BOOL v45 = v43 < v44;
      if (v18) {
        BOOL v45 = v39 < v40;
      }
      if (!v45) {
        return;
      }
    }
    else if (v41 >= v42)
    {
      return;
    }
    unint64_t v46 = *a1;
    *a1 = 0;
    unint64_t v47 = *a2;
    *a2 = 0;
    unint64_t v48 = (void *)*a1;
    *a1 = v47;

    unint64_t v49 = (void *)*a2;
    *a2 = v46;

    return;
  }
  unint64_t v16 = v12[3];
  unint64_t v17 = v13[3];
  BOOL v18 = v16 == v17;
  BOOL v19 = v16 < v17;
  if (v18) {
    BOOL v19 = v12 < v13;
  }
  if (v19) {
    goto LABEL_7;
  }
}

void sub_14F12C(unint64_t *a1, unint64_t *a2, unint64_t *a3, unint64_t *a4, unint64_t *a5, void *a6)
{
  sub_14EF24(a1, a2, a3, a4, a6);
  unint64_t v12 = *a5;
  unint64_t v65 = *a4;
  unint64_t v66 = v12;
  unint64_t v13 = (void *)(*a6 + 80);
  unint64_t v14 = sub_417C(v13, &v66);
  unint64_t v15 = sub_417C(v13, &v65);
  unint64_t v16 = v14[4];
  unint64_t v17 = v15[4];
  if (v16 != v17)
  {
    if (v16 >= v17) {
      return;
    }
LABEL_7:
    unint64_t v22 = *a4;
    *a4 = 0;
    unint64_t v23 = *a5;
    *a5 = 0;
    unint64_t v24 = (void *)*a4;
    *a4 = v23;

    unint64_t v25 = (void *)*a5;
    *a5 = v22;

    unint64_t v26 = *a4;
    unint64_t v65 = *a3;
    unint64_t v66 = v26;
    unint64_t v27 = (void *)(*a6 + 80);
    unint64_t v28 = sub_417C(v27, &v66);
    unint64_t v29 = sub_417C(v27, &v65);
    unint64_t v30 = v28[4];
    unint64_t v31 = v29[4];
    if (v30 == v31)
    {
      unint64_t v32 = v28[3];
      unint64_t v33 = v29[3];
      BOOL v20 = v32 == v33;
      BOOL v34 = v32 < v33;
      if (v20) {
        BOOL v34 = v28 < v29;
      }
      if (!v34) {
        return;
      }
    }
    else if (v30 >= v31)
    {
      return;
    }
    unint64_t v35 = *a3;
    *a3 = 0;
    unint64_t v36 = *a4;
    *a4 = 0;
    unint64_t v37 = (void *)*a3;
    *a3 = v36;

    unint64_t v38 = (void *)*a4;
    *a4 = v35;

    unint64_t v39 = *a3;
    unint64_t v65 = *a2;
    unint64_t v66 = v39;
    unint64_t v40 = (void *)(*a6 + 80);
    unint64_t v41 = sub_417C(v40, &v66);
    unint64_t v42 = sub_417C(v40, &v65);
    unint64_t v43 = v41[4];
    unint64_t v44 = v42[4];
    if (v43 == v44)
    {
      unint64_t v45 = v41[3];
      unint64_t v46 = v42[3];
      BOOL v20 = v45 == v46;
      BOOL v47 = v45 < v46;
      if (v20) {
        BOOL v47 = v41 < v42;
      }
      if (!v47) {
        return;
      }
    }
    else if (v43 >= v44)
    {
      return;
    }
    unint64_t v48 = *a2;
    *a2 = 0;
    unint64_t v49 = *a3;
    *a3 = 0;
    unint64_t v50 = (void *)*a2;
    *a2 = v49;

    unint64_t v51 = (void *)*a3;
    *a3 = v48;

    unint64_t v52 = *a2;
    unint64_t v65 = *a1;
    unint64_t v66 = v52;
    unint64_t v53 = (void *)(*a6 + 80);
    unint64_t v54 = sub_417C(v53, &v66);
    unint64_t v55 = sub_417C(v53, &v65);
    unint64_t v56 = v54[4];
    unint64_t v57 = v55[4];
    if (v56 == v57)
    {
      unint64_t v58 = v54[3];
      unint64_t v59 = v55[3];
      BOOL v20 = v58 == v59;
      BOOL v60 = v58 < v59;
      if (v20) {
        BOOL v60 = v54 < v55;
      }
      if (!v60) {
        return;
      }
    }
    else if (v56 >= v57)
    {
      return;
    }
    unint64_t v61 = *a1;
    *a1 = 0;
    unint64_t v62 = *a2;
    *a2 = 0;
    BOOL v63 = (void *)*a1;
    *a1 = v62;

    unint64_t v64 = (void *)*a2;
    *a2 = v61;

    return;
  }
  unint64_t v18 = v14[3];
  unint64_t v19 = v15[3];
  BOOL v20 = v18 == v19;
  BOOL v21 = v18 < v19;
  if (v20) {
    BOOL v21 = v14 < v15;
  }
  if (v21) {
    goto LABEL_7;
  }
}

unint64_t *sub_14F3C8(unint64_t *a1, unint64_t *a2, unint64_t *a3, void *a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      unint64_t v12 = &a1[v10];
      do
      {
        sub_14F5D4((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    unint64_t v13 = a2;
    if (a2 != a3)
    {
      unint64_t v14 = a2;
      while (1)
      {
        unint64_t v15 = *v14;
        unint64_t v40 = *a1;
        unint64_t v41 = v15;
        unint64_t v16 = (void *)(*a4 + 80);
        unint64_t v17 = sub_417C(v16, &v41);
        unint64_t v18 = sub_417C(v16, &v40);
        unint64_t v19 = v17[4];
        unint64_t v20 = v18[4];
        if (v19 == v20) {
          break;
        }
        if (v19 < v20) {
          goto LABEL_13;
        }
LABEL_14:
        if (++v14 == a3)
        {
          unint64_t v13 = a3;
          goto LABEL_16;
        }
      }
      unint64_t v21 = v17[3];
      unint64_t v22 = v18[3];
      BOOL v23 = v21 == v22;
      BOOL v24 = v21 < v22;
      if (v23) {
        BOOL v24 = v17 < v18;
      }
      if (!v24) {
        goto LABEL_14;
      }
LABEL_13:
      unint64_t v25 = *v14;
      unint64_t *v14 = 0;
      unint64_t v26 = *a1;
      *a1 = 0;
      unint64_t v27 = (void *)*v14;
      unint64_t *v14 = v26;

      unint64_t v28 = (void *)*a1;
      *a1 = v25;

      sub_14F5D4((uint64_t)a1, a4, v9, a1);
      goto LABEL_14;
    }
LABEL_16:
    if (v8 >= 9)
    {
      uint64_t v29 = (unint64_t)v8 >> 3;
      unint64_t v30 = (void **)(a2 - 1);
      do
      {
        unint64_t v31 = *a1;
        *a1 = 0;
        unint64_t v32 = sub_14F8BC((void **)a1, a4, v29);
        if (v30 == v32)
        {
          unint64_t v37 = *v32;
          *unint64_t v32 = (void *)v31;
        }
        else
        {
          unint64_t v33 = *v30;
          void *v30 = 0;
          BOOL v34 = *v32;
          *unint64_t v32 = v33;
          uint64_t v35 = (uint64_t)(v32 + 1);

          unint64_t v36 = *v30;
          void *v30 = (void *)v31;

          sub_14F9DC((uint64_t)a1, v35, a4, (v35 - (uint64_t)a1) >> 3);
        }
        --v30;
      }
      while (v29-- > 2);
    }
    return v13;
  }
  return a3;
}

void sub_14F5C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14F5D4(uint64_t a1, void *a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 < 2) {
    return;
  }
  uint64_t v59 = v4 >> 1;
  if ((uint64_t)(v4 >> 1) < ((uint64_t)a4 - a1) >> 3) {
    return;
  }
  uint64_t v9 = ((uint64_t)a4 - a1) >> 2;
  uint64_t v10 = v9 + 1;
  unint64_t v11 = (unint64_t *)(a1 + 8 * (v9 + 1));
  uint64_t v12 = v9 + 2;
  if (v9 + 2 < a3)
  {
    unint64_t v13 = *v11;
    unint64_t v60 = v11[1];
    unint64_t v61 = v13;
    unint64_t v14 = (void *)(*a2 + 80);
    unint64_t v15 = sub_417C(v14, &v61);
    unint64_t v16 = sub_417C(v14, &v60);
    unint64_t v17 = v15[4];
    unint64_t v18 = v16[4];
    if (v17 == v18)
    {
      unint64_t v19 = v15[3];
      unint64_t v20 = v16[3];
      BOOL v21 = v19 == v20;
      BOOL v22 = v19 < v20;
      if (v21) {
        BOOL v22 = v15 < v16;
      }
      if (!v22) {
        goto LABEL_11;
      }
    }
    else if (v17 >= v18)
    {
      goto LABEL_11;
    }
    ++v11;
    uint64_t v10 = v12;
  }
LABEL_11:
  unint64_t v23 = *v11;
  unint64_t v60 = *a4;
  unint64_t v61 = v23;
  BOOL v24 = (void *)(*a2 + 80);
  unint64_t v25 = sub_417C(v24, &v61);
  unint64_t v26 = sub_417C(v24, &v60);
  unint64_t v27 = v25[4];
  unint64_t v28 = v26[4];
  if (v27 == v28)
  {
    unint64_t v29 = v25[3];
    unint64_t v30 = v26[3];
    BOOL v21 = v29 == v30;
    BOOL v31 = v29 < v30;
    if (v21) {
      BOOL v31 = v25 < v26;
    }
    if (v31) {
      return;
    }
  }
  else if (v27 < v28)
  {
    return;
  }
  unint64_t v58 = *a4;
  *a4 = 0;
  unint64_t v32 = *v11;
  *unint64_t v11 = 0;
  unint64_t v33 = (void *)*a4;
  *a4 = v32;

  if (v59 >= v10)
  {
    while (1)
    {
      uint64_t v35 = 2 * v10;
      uint64_t v10 = (2 * v10) | 1;
      BOOL v34 = (unint64_t *)(a1 + 8 * v10);
      uint64_t v36 = v35 + 2;
      if (v35 + 2 >= a3) {
        goto LABEL_27;
      }
      unint64_t v37 = *v34;
      unint64_t v60 = v34[1];
      unint64_t v61 = v37;
      unint64_t v38 = (void *)(*a2 + 80);
      unint64_t v39 = sub_417C(v38, &v61);
      unint64_t v40 = sub_417C(v38, &v60);
      unint64_t v41 = v39[4];
      unint64_t v42 = v40[4];
      if (v41 != v42) {
        break;
      }
      unint64_t v43 = v39[3];
      unint64_t v44 = v40[3];
      BOOL v21 = v43 == v44;
      BOOL v45 = v43 < v44;
      if (v21) {
        BOOL v45 = v39 < v40;
      }
      if (v45) {
        goto LABEL_26;
      }
LABEL_27:
      unint64_t v46 = *v34;
      unint64_t v60 = v58;
      unint64_t v61 = v46;
      BOOL v47 = (void *)(*a2 + 80);
      unint64_t v48 = sub_417C(v47, &v61);
      unint64_t v49 = sub_417C(v47, &v60);
      unint64_t v50 = v48[4];
      unint64_t v51 = v49[4];
      if (v50 == v51)
      {
        unint64_t v52 = v48[3];
        unint64_t v53 = v49[3];
        BOOL v21 = v52 == v53;
        BOOL v54 = v52 < v53;
        if (v21) {
          BOOL v54 = v48 < v49;
        }
        if (v54) {
          goto LABEL_18;
        }
      }
      else if (v50 < v51)
      {
        goto LABEL_18;
      }
      unint64_t v55 = *v34;
      *BOOL v34 = 0;
      unint64_t v56 = (void *)*v11;
      *unint64_t v11 = v55;

      unint64_t v11 = v34;
      if (v59 < v10) {
        goto LABEL_34;
      }
    }
    if (v41 >= v42) {
      goto LABEL_27;
    }
LABEL_26:
    ++v34;
    uint64_t v10 = v36;
    goto LABEL_27;
  }
LABEL_18:
  BOOL v34 = v11;
LABEL_34:
  unint64_t v57 = (void *)*v34;
  *BOOL v34 = v58;
}

void sub_14F8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void **sub_14F8BC(void **a1, void *a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = a1;
    a1 += v6 + 1;
    uint64_t v10 = 2 * v6;
    uint64_t v6 = (2 * v6) | 1;
    uint64_t v11 = v10 + 2;
    if (v10 + 2 >= a3) {
      goto LABEL_12;
    }
    unint64_t v12 = (unint64_t)*a1;
    unint64_t v25 = a1[1];
    unint64_t v26 = v12;
    unint64_t v13 = (void *)(*a2 + 80);
    unint64_t v14 = sub_417C(v13, &v26);
    unint64_t v15 = sub_417C(v13, (unint64_t *)&v25);
    unint64_t v16 = v14[4];
    unint64_t v17 = v15[4];
    if (v16 != v17)
    {
      if (v16 >= v17) {
        goto LABEL_12;
      }
LABEL_11:
      ++a1;
      uint64_t v6 = v11;
      goto LABEL_12;
    }
    unint64_t v18 = v14[3];
    unint64_t v19 = v15[3];
    BOOL v20 = v18 == v19;
    BOOL v21 = v18 < v19;
    if (v20) {
      BOOL v21 = v14 < v15;
    }
    if (v21) {
      goto LABEL_11;
    }
LABEL_12:
    BOOL v22 = *a1;
    *a1 = 0;
    unint64_t v23 = *v9;
    *uint64_t v9 = v22;
  }
  while (v6 <= v8);
  return a1;
}

void sub_14F9DC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 < 2) {
    return;
  }
  unint64_t v8 = v4 >> 1;
  uint64_t v9 = (unint64_t *)(a1 + 8 * (v4 >> 1));
  unint64_t v10 = *v9;
  unint64_t v37 = *(void *)(a2 - 8);
  unint64_t v38 = v10;
  uint64_t v11 = (void *)(*a3 + 80);
  unint64_t v12 = sub_417C(v11, &v38);
  unint64_t v13 = sub_417C(v11, &v37);
  unint64_t v14 = v12[4];
  unint64_t v15 = v13[4];
  if (v14 == v15)
  {
    unint64_t v16 = v12[3];
    unint64_t v17 = v13[3];
    BOOL v18 = v16 == v17;
    BOOL v19 = v16 < v17;
    if (v18) {
      BOOL v19 = v12 < v13;
    }
    if (!v19) {
      return;
    }
  }
  else if (v14 >= v15)
  {
    return;
  }
  unint64_t v20 = *(void *)(a2 - 8);
  *(void *)(a2 - 8) = 0;
  unint64_t v21 = *v9;
  *uint64_t v9 = 0;
  BOOL v22 = *(void **)(a2 - 8);
  *(void *)(a2 - 8) = v21;

  if (v4 >= 2)
  {
    while (1)
    {
      unint64_t v24 = v8 - 1;
      unint64_t v8 = (v8 - 1) >> 1;
      unint64_t v23 = (unint64_t *)(a1 + 8 * v8);
      unint64_t v25 = *v23;
      unint64_t v37 = v20;
      unint64_t v38 = v25;
      unint64_t v26 = (void *)(*a3 + 80);
      unint64_t v27 = sub_417C(v26, &v38);
      unint64_t v28 = sub_417C(v26, &v37);
      unint64_t v29 = v27[4];
      unint64_t v30 = v28[4];
      if (v29 == v30)
      {
        unint64_t v31 = v27[3];
        unint64_t v32 = v28[3];
        BOOL v18 = v31 == v32;
        BOOL v33 = v31 < v32;
        if (v18) {
          BOOL v33 = v27 < v28;
        }
        if (!v33) {
          break;
        }
      }
      else if (v29 >= v30)
      {
        break;
      }
      unint64_t v34 = *v23;
      *unint64_t v23 = 0;
      uint64_t v35 = (void *)*v9;
      *uint64_t v9 = v34;

      uint64_t v9 = (unint64_t *)(a1 + 8 * v8);
      if (v24 <= 1) {
        goto LABEL_17;
      }
    }
  }
  unint64_t v23 = v9;
LABEL_17:
  uint64_t v36 = (void *)*v23;
  *unint64_t v23 = v20;
}

void sub_14FB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14FB7C(void ***a1)
{
  v1 = *a1;
  int v2 = (char *)**a1;
  if (v2)
  {
    unint64_t v4 = (char *)v1[1];
    char v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      char v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *sub_14FBFC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x19999999999999ALL) {
    sub_3EA4();
  }
  return operator new(160 * a2);
}

double sub_14FC44(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6 = sub_EE53C(a1, a2);
  if (v6)
  {
    sub_1470F0((int64x2_t *)(v6 + 40), (int64x2_t *)a3);
  }
  else
  {
    unint64_t v13 = a2;
    uint64_t v7 = sub_14FE4C((uint64_t)a1, a2, (uint64_t)&std::piecewise_construct, (long long **)&v13);
    int64x2_t v8 = *(int64x2_t *)a3;
    *(_OWORD *)(v7 + 56) = *(_OWORD *)(a3 + 16);
    *(int64x2_t *)(v7 + 40) = v8;
    long long v9 = *(_OWORD *)(a3 + 32);
    long long v10 = *(_OWORD *)(a3 + 48);
    long long v11 = *(_OWORD *)(a3 + 64);
    *((void *)v7 + 15) = *(void *)(a3 + 80);
    *(_OWORD *)(v7 + 104) = v11;
    *(_OWORD *)(v7 + 88) = v10;
    *(_OWORD *)(v7 + 72) = v9;
  }
  *(void *)&double result = sub_1470F0((int64x2_t *)(a1[16] - 128), (int64x2_t *)a3).u64[0];
  return result;
}

int64x2_t sub_14FCEC(uint64_t a1, unsigned __int8 *a2, int64x2_t *a3)
{
  uint64_t v6 = a1 + 40;
  uint64_t v7 = sub_EE53C((void *)(a1 + 40), a2);
  if (v7)
  {
    *(int64x2_t *)(v7 + 40) = vaddq_s64(*(int64x2_t *)(v7 + 40), *a3);
    *((void *)v7 + 7) += a3[1].i64[0];
  }
  else
  {
    unint64_t v12 = a2;
    int64x2_t v8 = sub_1501A8(v6, a2, (uint64_t)&std::piecewise_construct, (long long **)&v12);
    int64x2_t v9 = *a3;
    *((void *)v8 + 7) = a3[1].i64[0];
    *(int64x2_t *)(v8 + 40) = v9;
  }
  uint64_t v10 = *(void *)(a1 + 128);
  int64x2_t result = vaddq_s64(*(int64x2_t *)(v10 - 40), *a3);
  *(int64x2_t *)(v10 - 40) = result;
  *(void *)(v10 - 24) += a3[1].i64[0];
  return result;
}

int64x2_t sub_14FDAC(uint64_t a1, unint64_t a2, int64x2_t *a3)
{
  unint64_t v8 = a2;
  uint64_t v4 = a1 + 80;
  char v5 = sub_417C((void *)(a1 + 80), &v8);
  if (v5)
  {
    int64x2_t result = vaddq_s64(*(int64x2_t *)(v5 + 3), *a3);
    *(int64x2_t *)(v5 + 3) = result;
    v5[5] += a3[1].i64[0];
  }
  else
  {
    int64x2_t v9 = (id *)&v8;
    uint64_t v7 = sub_1504F0(v4, &v8, (uint64_t)&std::piecewise_construct, &v9);
    int64x2_t result = *a3;
    v7[5] = a3[1].i64[0];
    *(int64x2_t *)(v7 + 3) = result;
  }
  return result;
}

unsigned __int8 *sub_14FE4C(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = sub_EDD5C(a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    unint64_t v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (sub_EE208(a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  sub_1500E4(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_3ED8(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  unint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *unint64_t v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_1500C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    sub_EE2B0((uint64_t)&a13, __p);
  }
  _Unwind_Resume(exception_object);
}

double sub_1500E4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x80uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = v8 + 16;
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    sub_124B4(v9, *(void **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)unint64_t v9 = v11;
  }
  *((void *)v8 + 15) = 0;
  double result = 0.0;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_15018C(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_EE2B0(v3, v2);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_1501A8(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = sub_EDD5C(a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    unint64_t v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (sub_EE208(a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  sub_150440(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_3ED8(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  unint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *unint64_t v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_15041C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    sub_EE2B0((uint64_t)&a13, __p);
  }
  _Unwind_Resume(exception_object);
}

unsigned char *sub_150440@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x40uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *unint64_t v8 = 0;
  v8[1] = a2;
  double result = v8 + 2;
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    double result = sub_124B4(result, *(void **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    v8[4] = *((void *)v10 + 2);
    *(_OWORD *)double result = v11;
  }
  v8[5] = 0;
  v8[6] = 0;
  v8[7] = 0;
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_1504D4(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_EE2B0(v3, v2);
  _Unwind_Resume(a1);
}

void *sub_1504F0(uint64_t a1, unint64_t *a2, uint64_t a3, id **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }
  unint64_t v13 = (void *)(a1 + 16);
  uint64_t i = operator new(0x30uLL);
  *uint64_t i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  i[4] = 0;
  i[5] = 0;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    sub_3ED8(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *uint64_t i = *v21;
LABEL_38:
    *unint64_t v21 = i;
    goto LABEL_39;
  }
  *uint64_t i = *v13;
  void *v13 = i;
  *(void *)(v20 + 8 * v4) = v13;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_150728(_Unwind_Exception *a1)
{
  sub_4124(v2, v1);
  _Unwind_Resume(a1);
}

uint64_t sub_150744(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 120);
  if (v2)
  {
    *(void *)(a1 + 128) = v2;
    operator delete(v2);
  }
  sub_3BD4(a1 + 80);
  sub_ED91C(a1 + 40);

  return sub_ED91C(a1);
}

void sub_1516B4(id a1)
{
  v1 = (void *)qword_2DF7F0;
  qword_2DF7F0 = (uint64_t)&off_268780;
}

void sub_151758(id a1)
{
  v1 = (void *)qword_2DF800;
  qword_2DF800 = (uint64_t)&off_2687A8;
}

void sub_151800(id a1)
{
  v1 = (void *)qword_2DF810;
  qword_2DF810 = (uint64_t)&off_2687D0;
}

void TUI::Evaluation::Enumerator::State::~State(id *this)
{
}

{
}

double TUI::Evaluation::Enumerator::State::State(TUI::Evaluation::Enumerator::State *this)
{
  double result = NAN;
  *(void *)this = 0xFFFF0000FFFF0000;
  *((unsigned char *)this + 8) &= 0xFCu;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 2) = 0x7FFFFFFFFFFFFFFFLL;
  *((unsigned char *)this + 40) &= 0xF8u;
  return result;
}

{
  double result;

  double result = NAN;
  *(void *)this = 0xFFFF0000FFFF0000;
  *((unsigned char *)this + 8) &= 0xFCu;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 2) = 0x7FFFFFFFFFFFFFFFLL;
  *((unsigned char *)this + 40) &= 0xF8u;
  return result;
}

uint64_t TUI::Evaluation::Enumerator::State::State(uint64_t this, Entry a2, Entry a3)
{
  *(Entry *)this = a2;
  *(Entry *)(this + 4) = a3;
  *(unsigned char *)(this + 8) &= 0xFCu;
  *(void *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  *(void *)(this + 16) = 0x7FFFFFFFFFFFFFFFLL;
  *(unsigned char *)(this + 40) &= 0xF8u;
  return this;
}

{
  *(Entry *)this = a2;
  *(Entry *)(this + 4) = a3;
  *(unsigned char *)(this + 8) &= 0xFCu;
  *(void *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  *(void *)(this + 16) = 0x7FFFFFFFFFFFFFFFLL;
  *(unsigned char *)(this + 40) &= 0xF8u;
  return this;
}

TUI::Evaluation::Enumerator::State *TUI::Evaluation::Enumerator::State::State(TUI::Evaluation::Enumerator::State *this, const TUI::Evaluation::Enumerator::State *a2)
{
  *(_DWORD *)this = *(_DWORD *)a2;
  *((_DWORD *)this + 1) = *((_DWORD *)a2 + 1);
  char v4 = *((unsigned char *)this + 8) & 0xFE | *((unsigned char *)a2 + 8) & 1;
  *((unsigned char *)this + 8) = v4;
  *((unsigned char *)this + 8) = v4 & 0xFD | *((unsigned char *)a2 + 8) & 2;
  char v5 = (void *)*((void *)a2 + 3);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)this + 3) = v5;
  *((void *)this + 4) = *((id *)a2 + 4);
  *((unsigned char *)this + 40) = *((unsigned char *)a2 + 40);
  return this;
}

uint64_t TUI::Evaluation::Enumerator::State::operator=(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  char v4 = *(unsigned char *)(a1 + 8) & 0xFE | *(unsigned char *)(a2 + 8) & 1;
  *(unsigned char *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 8) = v4 & 0xFD | *(unsigned char *)(a2 + 8) & 2;
  uint64_t v6 = *(void *)(a2 + 16);
  char v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  objc_storeStrong((id *)(a1 + 24), v5);
  objc_storeStrong((id *)(a1 + 32), *(id *)(a2 + 32));
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

void sub_1525CC(uint64_t a1)
{
  v1 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "superclass"), "supportedAttributes");
  id v2 = [v1 mutableCopy];

  uint64_t v3 = +[TUIAttributeSet supportedAttributesTextStyling];
  [v2 unionSet:v3];

  v6[0] = @"insets";
  v6[1] = @"text";
  v6[2] = @"return-key-type";
  char v4 = +[NSArray arrayWithObjects:v6 count:3];
  [v2 addAttributesFromArray:v4];

  char v5 = (void *)qword_2DF820;
  qword_2DF820 = (uint64_t)v2;
}

void sub_152734(id a1)
{
  CFStringRef v4 = @"binding";
  v1 = +[NSArray arrayWithObjects:&v4 count:1];
  uint64_t v2 = +[TUIAttributeSet setWithArray:v1];
  uint64_t v3 = (void *)qword_2DF830;
  qword_2DF830 = v2;
}

void sub_152E04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

id sub_152E28(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = (id *)(a1 + 88);
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v9 = [WeakRetained enabled];
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = objc_loadWeakRetained(v6);
  unint64_t v12 = [v11 identifier];
  unint64_t v13 = +[TUITextFieldView renderModelWithStates:actionHandler:viewState:enabled:name:identifier:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:](TUITextFieldView, "renderModelWithStates:actionHandler:viewState:enabled:name:identifier:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:", v7, v4, v5, v9, v10, v12, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 128));

  return v13;
}

void sub_152F74(id a1)
{
  v4[0] = @"name";
  v4[1] = @"duration";
  v4[2] = @"delay";
  v4[3] = @"timing";
  v4[4] = @"curve";
  v4[5] = @"calculation-mode";
  v1 = +[NSArray arrayWithObjects:v4 count:6];
  uint64_t v2 = +[TUIAttributeSet setWithArray:v1];
  uint64_t v3 = (void *)qword_2DF840;
  qword_2DF840 = v2;
}

void sub_153060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1530EC(id a1)
{
  CFStringRef v4 = @"name";
  v1 = +[NSArray arrayWithObjects:&v4 count:1];
  uint64_t v2 = +[TUIAttributeSet setWithArray:v1];
  uint64_t v3 = (void *)qword_2DF850;
  qword_2DF850 = v2;
}

void sub_153194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15323C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1532F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1533D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1534B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_15356C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_153620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_153784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_153934(id a1)
{
  v1 = (void *)qword_2DF860;
  qword_2DF860 = (uint64_t)&off_2687F8;
}

void sub_1539D8(id a1)
{
  v1 = (void *)qword_2DF870;
  qword_2DF870 = (uint64_t)&off_268820;
}

double TUI::Evaluation::Variables::Scope::Scope(TUI::Evaluation::Variables::Scope *this)
{
  *(void *)this = off_256548;
  *((void *)this + 1) = off_256608;
  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((void *)this + 8) = 0;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 5) = xmmword_243B50;
  *((void *)this + 12) = -1;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((_DWORD *)this + 46) = 1065353216;
  *((_OWORD *)this + 12) = xmmword_243B50;
  *((void *)this + 26) = -1;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
  *((_DWORD *)this + 74) = 1065353216;
  *((_OWORD *)this + 19) = xmmword_243B50;
  *((void *)this + 40) = -1;
  *(_OWORD *)((char *)this + 328) = 0u;
  *(_OWORD *)((char *)this + 344) = 0u;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *((_DWORD *)this + 102) = 1065353216;
  *((_OWORD *)this + 26) = xmmword_243B50;
  *((void *)this + 54) = -1;
  *(_OWORD *)((char *)this + 440) = 0u;
  *(_OWORD *)((char *)this + 456) = 0u;
  *(_OWORD *)((char *)this + 472) = 0u;
  *(_OWORD *)((char *)this + 488) = 0u;
  *(_OWORD *)((char *)this + 504) = 0u;
  *((_DWORD *)this + 130) = 1065353216;
  *((_OWORD *)this + 33) = xmmword_243B50;
  *((void *)this + 68) = -1;
  *(_OWORD *)((char *)this + 616) = 0u;
  *(_OWORD *)((char *)this + 600) = 0u;
  *(_OWORD *)((char *)this + 584) = 0u;
  *(_OWORD *)((char *)this + 568) = 0u;
  *(_OWORD *)((char *)this + 552) = 0u;
  *((_DWORD *)this + 158) = 1065353216;
  *((_OWORD *)this + 40) = xmmword_243B50;
  *((void *)this + 82) = -1;
  *(_OWORD *)((char *)this + 728) = 0u;
  *(_OWORD *)((char *)this + 712) = 0u;
  *(_OWORD *)((char *)this + 696) = 0u;
  *(_OWORD *)((char *)this + 680) = 0u;
  *(_OWORD *)((char *)this + 664) = 0u;
  *((_DWORD *)this + 186) = 1065353216;
  *((_OWORD *)this + 47) = xmmword_243B50;
  *((void *)this + 96) = -1;
  *((void *)this + 105) = 0;
  *(_OWORD *)((char *)this + 824) = 0u;
  *(_OWORD *)((char *)this + 808) = 0u;
  *(_OWORD *)((char *)this + 792) = 0u;
  *(_OWORD *)((char *)this + 776) = 0u;
  return result;
}

uint64_t TUI::Evaluation::Variables::Scope::Scope(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_256548;
  *(void *)(a1 + 8) = off_256608;
  *(void *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  sub_155928(a1 + 40, (uint64_t *)(a2 + 40));
  long long v4 = *(_OWORD *)(a2 + 80);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(_OWORD *)(a1 + 80) = v4;
  *(void *)(a1 + 128) = 0;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a2 + 144) = 0;
  *(_OWORD *)(a2 + 128) = 0u;
  sub_155928(a1 + 152, (uint64_t *)(a2 + 152));
  long long v6 = *(_OWORD *)(a2 + 192);
  long long v7 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 224) = v7;
  *(_OWORD *)(a1 + 192) = v6;
  *(void *)(a1 + 240) = 0;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a2 + 256) = 0;
  *(_OWORD *)(a2 + 240) = 0u;
  sub_155928(a1 + 264, (uint64_t *)(a2 + 264));
  long long v8 = *(_OWORD *)(a2 + 304);
  long long v9 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 336) = v9;
  *(_OWORD *)(a1 + 304) = v8;
  *(void *)(a1 + 352) = 0;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
  *(void *)(a1 + 368) = *(void *)(a2 + 368);
  *(void *)(a2 + 368) = 0;
  *(_OWORD *)(a2 + 352) = 0u;
  sub_155928(a1 + 376, (uint64_t *)(a2 + 376));
  long long v10 = *(_OWORD *)(a2 + 416);
  long long v11 = *(_OWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 432) = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 448) = v11;
  *(_OWORD *)(a1 + 416) = v10;
  *(void *)(a1 + 464) = 0;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 464) = *(_OWORD *)(a2 + 464);
  *(void *)(a1 + 480) = *(void *)(a2 + 480);
  *(void *)(a2 + 480) = 0;
  *(_OWORD *)(a2 + 464) = 0u;
  sub_155928(a1 + 488, (uint64_t *)(a2 + 488));
  long long v12 = *(_OWORD *)(a2 + 528);
  long long v13 = *(_OWORD *)(a2 + 560);
  *(_OWORD *)(a1 + 544) = *(_OWORD *)(a2 + 544);
  *(_OWORD *)(a1 + 560) = v13;
  *(_OWORD *)(a1 + 528) = v12;
  *(void *)(a1 + 576) = 0;
  *(_OWORD *)(a1 + 584) = 0u;
  *(_OWORD *)(a1 + 576) = *(_OWORD *)(a2 + 576);
  *(void *)(a1 + 592) = *(void *)(a2 + 592);
  *(void *)(a2 + 592) = 0;
  *(_OWORD *)(a2 + 576) = 0u;
  sub_155928(a1 + 600, (uint64_t *)(a2 + 600));
  long long v14 = *(_OWORD *)(a2 + 640);
  long long v15 = *(_OWORD *)(a2 + 672);
  *(_OWORD *)(a1 + 656) = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 672) = v15;
  *(_OWORD *)(a1 + 640) = v14;
  *(void *)(a1 + 688) = 0;
  *(_OWORD *)(a1 + 696) = 0u;
  *(_OWORD *)(a1 + 688) = *(_OWORD *)(a2 + 688);
  *(void *)(a1 + 704) = *(void *)(a2 + 704);
  *(void *)(a2 + 704) = 0;
  *(_OWORD *)(a2 + 688) = 0u;
  sub_155928(a1 + 712, (uint64_t *)(a2 + 712));
  long long v16 = *(_OWORD *)(a2 + 752);
  long long v17 = *(_OWORD *)(a2 + 784);
  *(_OWORD *)(a1 + 768) = *(_OWORD *)(a2 + 768);
  *(_OWORD *)(a1 + 784) = v17;
  *(_OWORD *)(a1 + 752) = v16;
  *(void *)(a1 + 800) = 0;
  *(_OWORD *)(a1 + 808) = 0u;
  *(_OWORD *)(a1 + 800) = *(_OWORD *)(a2 + 800);
  *(void *)(a1 + 816) = *(void *)(a2 + 816);
  *(void *)(a2 + 816) = 0;
  *(_OWORD *)(a2 + 800) = 0u;
  *(void *)(a1 + 840) = 0;
  *(_OWORD *)(a1 + 824) = 0u;
  *(void *)(a1 + 824) = *(void *)(a2 + 824);
  *(void *)(a1 + 832) = *(void *)(a2 + 832);
  *(void *)(a1 + 840) = *(void *)(a2 + 840);
  *(void *)(a2 + 840) = 0;
  *(_OWORD *)(a2 + 824) = 0u;
  return a1;
}

void TUI::Evaluation::Variables::Scope::~Scope(TUI::Evaluation::Variables::Scope *this)
{
  *(void *)this = off_256548;
  *((void *)this + 1) = off_256608;
  uint64_t v2 = (void *)*((void *)this + 103);
  if (v2)
  {
    *((void *)this + 104) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 100);
  if (v3)
  {
    *((void *)this + 101) = v3;
    operator delete(v3);
  }
  sub_1265C((uint64_t)this + 712);
  long long v4 = (void **)((char *)this + 688);
  sub_15586C(&v4);
  sub_1265C((uint64_t)this + 600);
  long long v4 = (void **)((char *)this + 576);
  sub_15572C(&v4);
  sub_1265C((uint64_t)this + 488);
  long long v4 = (void **)((char *)this + 464);
  sub_15572C(&v4);
  sub_1265C((uint64_t)this + 376);
  long long v4 = (void **)((char *)this + 352);
  sub_1557CC(&v4);
  sub_1265C((uint64_t)this + 264);
  long long v4 = (void **)((char *)this + 240);
  sub_15572C(&v4);
  sub_1265C((uint64_t)this + 152);
  long long v4 = (void **)((char *)this + 128);
  sub_1556A4(&v4);
  sub_1265C((uint64_t)this + 40);
  long long v4 = (void **)((char *)this + 16);
  sub_15561C(&v4);
}

{
  uint64_t vars8;

  TUI::Evaluation::Variables::Scope::~Scope(this);

  operator delete();
}

void non-virtual thunk to'TUI::Evaluation::Variables::Scope::~Scope(TUI::Evaluation::Variables::Scope *this)
{
}

{
  uint64_t vars8;

  TUI::Evaluation::Variables::Scope::~Scope((TUI::Evaluation::Variables::Scope *)((char *)this - 8));

  operator delete();
}

uint64_t *TUI::Evaluation::Variables::Scope::swap(TUI::Evaluation::Variables::Scope *this, TUI::Evaluation::Variables::Scope *a2)
{
  sub_1540F4((uint64_t *)this + 2, (uint64_t *)a2 + 2);
  sub_1540F4((uint64_t *)this + 16, (uint64_t *)a2 + 16);
  sub_1540F4((uint64_t *)this + 30, (uint64_t *)a2 + 30);
  sub_1540F4((uint64_t *)this + 44, (uint64_t *)a2 + 44);
  sub_1540F4((uint64_t *)this + 58, (uint64_t *)a2 + 58);
  sub_1540F4((uint64_t *)this + 72, (uint64_t *)a2 + 72);
  double result = sub_1540F4((uint64_t *)this + 86, (uint64_t *)a2 + 86);
  uint64_t v5 = *((void *)this + 100);
  *((void *)this + 100) = *((void *)a2 + 100);
  *((void *)a2 + 100) = v5;
  uint64_t v6 = *((void *)this + 101);
  *((void *)this + 101) = *((void *)a2 + 101);
  *((void *)a2 + 101) = v6;
  uint64_t v7 = *((void *)this + 102);
  *((void *)this + 102) = *((void *)a2 + 102);
  *((void *)a2 + 102) = v7;
  uint64_t v8 = *((void *)this + 103);
  *((void *)this + 103) = *((void *)a2 + 103);
  *((void *)a2 + 103) = v8;
  uint64_t v9 = *((void *)this + 104);
  *((void *)this + 104) = *((void *)a2 + 104);
  *((void *)a2 + 104) = v9;
  uint64_t v10 = *((void *)this + 105);
  *((void *)this + 105) = *((void *)a2 + 105);
  *((void *)a2 + 105) = v10;
  return result;
}

uint64_t *sub_1540F4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  *a2 = v4;
  uint64_t v5 = a1[1];
  a1[1] = a2[1];
  a2[1] = v5;
  uint64_t v6 = a1[2];
  a1[2] = a2[2];
  a2[2] = v6;
  sub_29920((uint64_t)(a1 + 3), (uint64_t)(a2 + 3));

  return sub_155998(a1 + 8, a2 + 8);
}

int8x16_t TUI::Evaluation::Variables::Scope::symbolUsage@<Q0>(TUI::Evaluation::Variables::Scope *this@<X0>, uint64_t a2@<X8>)
{
  bzero((void *)a2, 0x20uLL);
  bzero((void *)(a2 + 32), 0x100uLL);
  sub_1559FC((uint64_t)this + 16, (uint64_t)v12);
  for (uint64_t i = 0; i != 32; i += 16)
    *(int8x16_t *)(a2 + i) = vorrq_s8(*(int8x16_t *)(a2 + i), *(int8x16_t *)&v12[i]);
  do
  {
    *(int8x16_t *)(a2 + i) = vorrq_s8(*(int8x16_t *)(a2 + i), *(int8x16_t *)&v12[i]);
    i += 16;
  }
  while (i != 288);
  sub_1559FC((uint64_t)this + 128, (uint64_t)v12);
  for (uint64_t j = 0; j != 32; j += 16)
    *(int8x16_t *)(a2 + j) = vorrq_s8(*(int8x16_t *)(a2 + j), *(int8x16_t *)&v12[j]);
  do
  {
    *(int8x16_t *)(a2 + j) = vorrq_s8(*(int8x16_t *)(a2 + j), *(int8x16_t *)&v12[j]);
    j += 16;
  }
  while (j != 288);
  sub_1559FC((uint64_t)this + 240, (uint64_t)v12);
  for (uint64_t k = 0; k != 32; k += 16)
    *(int8x16_t *)(a2 + k) = vorrq_s8(*(int8x16_t *)(a2 + k), *(int8x16_t *)&v12[k]);
  do
  {
    *(int8x16_t *)(a2 + k) = vorrq_s8(*(int8x16_t *)(a2 + k), *(int8x16_t *)&v12[k]);
    k += 16;
  }
  while (k != 288);
  sub_1559FC((uint64_t)this + 352, (uint64_t)v12);
  for (uint64_t m = 0; m != 32; m += 16)
    *(int8x16_t *)(a2 + m) = vorrq_s8(*(int8x16_t *)(a2 + m), *(int8x16_t *)&v12[m]);
  do
  {
    *(int8x16_t *)(a2 + m) = vorrq_s8(*(int8x16_t *)(a2 + m), *(int8x16_t *)&v12[m]);
    m += 16;
  }
  while (m != 288);
  sub_1559FC((uint64_t)this + 464, (uint64_t)v12);
  for (uint64_t n = 0; n != 32; n += 16)
    *(int8x16_t *)(a2 + n) = vorrq_s8(*(int8x16_t *)(a2 + n), *(int8x16_t *)&v12[n]);
  do
  {
    *(int8x16_t *)(a2 + n) = vorrq_s8(*(int8x16_t *)(a2 + n), *(int8x16_t *)&v12[n]);
    n += 16;
  }
  while (n != 288);
  sub_1559FC((uint64_t)this + 576, (uint64_t)v12);
  for (iuint64_t i = 0; ii != 32; ii += 16)
    *(int8x16_t *)(a2 + ii) = vorrq_s8(*(int8x16_t *)(a2 + ii), *(int8x16_t *)&v12[ii]);
  do
  {
    *(int8x16_t *)(a2 + ii) = vorrq_s8(*(int8x16_t *)(a2 + ii), *(int8x16_t *)&v12[ii]);
    ii += 16;
  }
  while (ii != 288);
  sub_1559FC((uint64_t)this + 688, (uint64_t)v12);
  for (juint64_t j = 0; jj != 32; jj += 16)
    *(int8x16_t *)(a2 + jj) = vorrq_s8(*(int8x16_t *)(a2 + jj), *(int8x16_t *)&v12[jj]);
  do
  {
    int8x16_t result = vorrq_s8(*(int8x16_t *)(a2 + jj), *(int8x16_t *)&v12[jj]);
    *(int8x16_t *)(a2 + jj) = result;
    jj += 16;
  }
  while (jj != 288);
  return result;
}

double TUI::Evaluation::Variables::Scope::beginMark@<D0>(TUI::Evaluation::Variables::Scope *this@<X0>, uint64_t a2@<X8>)
{
  double result = 0.0;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(void *)a2 = 0x8E38E38E38E38E39 * ((uint64_t)(*((void *)this + 3) - *((void *)this + 2)) >> 3);
  *(void *)(a2 + 16) = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 17) - *((void *)this + 16)) >> 4);
  *(void *)(a2 + 32) = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 31) - *((void *)this + 30)) >> 4);
  *(void *)(a2 + 48) = (uint64_t)(*((void *)this + 45) - *((void *)this + 44)) >> 6;
  *(void *)(a2 + 64) = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 59) - *((void *)this + 58)) >> 4);
  *(void *)(a2 + 80) = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 73) - *((void *)this + 72)) >> 4);
  *(void *)(a2 + 96) = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)this + 87) - *((void *)this + 86)) >> 3);
  *(void *)(a2 + 104) = 0;
  return result;
}

void *TUI::Evaluation::Variables::Scope::endMark(void *result, void *a2)
{
  a2[1] = 0x8E38E38E38E38E39 * ((uint64_t)(result[3] - result[2]) >> 3);
  a2[3] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(result[17] - result[16]) >> 4);
  a2[5] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(result[31] - result[30]) >> 4);
  a2[7] = (uint64_t)(result[45] - result[44]) >> 6;
  a2[9] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(result[59] - result[58]) >> 4);
  a2[11] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(result[73] - result[72]) >> 4);
  a2[13] = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(result[87] - result[86]) >> 3);
  return result;
}

id TUI::Evaluation::Variables::Scope::equivalentTo(unsigned __int16 **this, const TUI::Evaluation::Variables::Scope *a2)
{
  if (!sub_155A88(this + 2, (uint64_t)a2 + 16)
    || !sub_155CB0(this + 16, (uint64_t)a2 + 128)
    || !sub_155D84(this + 30, (uint64_t)a2 + 240)
    || !sub_155E80(this + 44, (uint64_t)a2 + 352)
    || !sub_155D84(this + 58, (uint64_t)a2 + 464)
    || !sub_155D84(this + 72, (uint64_t)a2 + 576))
  {
    return 0;
  }

  return sub_155FD0(this + 86, (uint64_t)a2 + 688);
}

uint64_t TUI::Evaluation::Variables::Scope::lookup(uint64_t a1, int a2)
{
  sub_1560E0((void *)(a1 + 16), a2, (void *)(a1 + 80));
  if (v3 == -1) {
    return 0;
  }
  else {
    return a1 + 8;
  }
}

{
  uint64_t v3;

  sub_156180((void *)(a1 + 128), a2, (void *)(a1 + 192));
  if (v3 == -1) {
    return 0;
  }
  else {
    return a1 + 8;
  }
}

{
  uint64_t v3;

  sub_156180((void *)(a1 + 240), a2, (void *)(a1 + 304));
  if (v3 == -1) {
    return 0;
  }
  else {
    return a1 + 8;
  }
}

{
  uint64_t v3;

  sub_156220((void *)(a1 + 352), a2, (void *)(a1 + 416));
  if (v3 == -1) {
    return 0;
  }
  else {
    return a1 + 8;
  }
}

{
  uint64_t v3;

  sub_156180((void *)(a1 + 464), a2, (void *)(a1 + 528));
  if (v3 == -1) {
    return 0;
  }
  else {
    return a1 + 8;
  }
}

{
  uint64_t v3;

  sub_156180((void *)(a1 + 576), a2, (void *)(a1 + 640));
  if (v3 == -1) {
    return 0;
  }
  else {
    return a1 + 8;
  }
}

{
  uint64_t v3;

  sub_1562BC((void *)(a1 + 688), a2, (void *)(a1 + 752));
  if (v3 == -1) {
    return 0;
  }
  else {
    return a1 + 8;
  }
}

uint64_t TUI::Evaluation::Variables::Scope::define(uint64_t a1, unsigned int a2, const TUI::Evaluation::Enumerator::State *a3)
{
  sub_15635C((uint64_t *)(a1 + 16), a2, (uint64_t)&v6, a3, a1 + 80);
  if (v4 == -1) {
    return 0;
  }
  else {
    return a1 + 8;
  }
}

uint64_t *TUI::Evaluation::Variables::Scope::define(uint64_t a1, unsigned int a2, id *a3)
{
  return sub_1569B4((uint64_t *)(a1 + 128), a2, (uint64_t)&v4, a3, a1 + 192);
}

uint64_t *TUI::Evaluation::Variables::Scope::define(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  return sub_156DC0((uint64_t *)(a1 + 240), a2, a4, &v5, a1 + 304);
}

{
  uint64_t v5;

  uint64_t v5 = a3;
  return sub_1577FC((uint64_t *)(a1 + 464), a2, a4, &v5, a1 + 528);
}

{
  uint64_t v5;

  uint64_t v5 = a3;
  return sub_157C50((uint64_t *)(a1 + 576), a2, a4, &v5, a1 + 640);
}

{
  return sub_1580A4((uint64_t *)(a1 + 688), a2, a4, a3, a1 + 752);
}

uint64_t *TUI::Evaluation::Variables::Scope::define(uint64_t a1, unsigned int a2, long long *a3, uint64_t a4)
{
  return sub_1572E0((uint64_t *)(a1 + 352), a2, a4, a3, a1 + 416);
}

uint64_t TUI::Evaluation::Variables::Scope::reference(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 16) + 72 * a2 + 24;
}

{
  return *(void *)(a1 + 128) + 48 * a2 + 24;
}

{
  return *(void *)(a1 + 688) + 56 * a2 + 40;
}

uint64_t non-virtual thunk to'TUI::Evaluation::Variables::Scope::reference(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 8) + 72 * a2 + 24;
}

{
  return *(void *)(a1 + 120) + 48 * a2 + 24;
}

{
  return *(void *)(a1 + 680) + 56 * a2 + 40;
}

uint64_t TUI::Evaluation::Variables::Scope::mutate(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 16) + 72 * a2 + 24;
}

uint64_t non-virtual thunk to'TUI::Evaluation::Variables::Scope::mutate(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 8) + 72 * a2 + 24;
}

uint64_t TUI::Evaluation::Variables::Scope::copy(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a1 + 240) + 48 * a2 + 40);
}

{
  return *(void *)(*(void *)(a1 + 464) + 48 * a2 + 40);
}

{
  return *(void *)(*(void *)(a1 + 576) + 48 * a2 + 40);
}

uint64_t non-virtual thunk to'TUI::Evaluation::Variables::Scope::copy(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a1 + 232) + 48 * a2 + 40);
}

{
  return *(void *)(*(void *)(a1 + 456) + 48 * a2 + 40);
}

{
  return *(void *)(*(void *)(a1 + 568) + 48 * a2 + 40);
}

__n128 TUI::Evaluation::Variables::Scope::copy@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 352) + (a2 << 6);
  __n128 result = *(__n128 *)(v3 + 40);
  *a3 = result;
  a3[1].n128_u64[0] = *(void *)(v3 + 56);
  return result;
}

__n128 non-virtual thunk to'TUI::Evaluation::Variables::Scope::copy@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 344) + (a2 << 6);
  __n128 result = *(__n128 *)(v3 + 40);
  *a3 = result;
  a3[1].n128_u64[0] = *(void *)(v3 + 56);
  return result;
}

uint64_t TUI::Evaluation::Variables::Scope::closureAndCapture@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = *(void *)(result + 240) + 48 * a2;
  *(_DWORD *)a3 = *(_DWORD *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v3 = *(void *)(result + 352) + (a2 << 6);
  *(_DWORD *)a3 = *(_DWORD *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v3 = *(void *)(result + 464) + 48 * a2;
  *(_DWORD *)a3 = *(_DWORD *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v3 = *(void *)(result + 576) + 48 * a2;
  *(_DWORD *)a3 = *(_DWORD *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v3 = *(void *)(result + 688) + 56 * a2;
  *(_DWORD *)a3 = *(_DWORD *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t non-virtual thunk to'TUI::Evaluation::Variables::Scope::closureAndCapture@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = *(void *)(result + 232) + 48 * a2;
  *(_DWORD *)a3 = *(_DWORD *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v3 = *(void *)(result + 344) + (a2 << 6);
  *(_DWORD *)a3 = *(_DWORD *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v3 = *(void *)(result + 456) + 48 * a2;
  *(_DWORD *)a3 = *(_DWORD *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v3 = *(void *)(result + 568) + 48 * a2;
  *(_DWORD *)a3 = *(_DWORD *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v3 = *(void *)(result + 680) + 56 * a2;
  *(_DWORD *)a3 = *(_DWORD *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void TUI::Evaluation::Variables::Scope::pushClosure(TUI::Evaluation::Variables::Scope *this, int a2)
{
  if (a2)
  {
    uint64_t v3 = *((void *)this + 10);
    uint64_t v4 = *((void *)this + 11);
    uint64_t v5 = *((void *)this + 24);
    uint64_t v6 = *((void *)this + 25);
    uint64_t v8 = *((void *)this + 38);
    uint64_t v7 = *((void *)this + 39);
    uint64_t v9 = *((void *)this + 52);
    uint64_t v10 = *((void *)this + 53);
    uint64_t v11 = *((void *)this + 66);
    uint64_t v12 = *((void *)this + 67);
    uint64_t v13 = *((void *)this + 80);
    uint64_t v14 = *((void *)this + 81);
    uint64_t v15 = *((void *)this + 94);
    uint64_t v16 = *((void *)this + 95);
  }
  else
  {
    uint64_t v17 = *((void *)this + 13);
    uint64_t v3 = *((void *)this + 10);
    uint64_t v4 = *((void *)this + 11);
    *((void *)this + 10) = 0;
    *((void *)this + 11) = v17;
    uint64_t v18 = *((void *)this + 27);
    uint64_t v5 = *((void *)this + 24);
    uint64_t v6 = *((void *)this + 25);
    *((void *)this + 24) = 0;
    *((void *)this + 25) = v18;
    uint64_t v19 = *((void *)this + 41);
    uint64_t v8 = *((void *)this + 38);
    uint64_t v7 = *((void *)this + 39);
    *((void *)this + 38) = 0;
    *((void *)this + 39) = v19;
    uint64_t v20 = *((void *)this + 55);
    uint64_t v9 = *((void *)this + 52);
    uint64_t v10 = *((void *)this + 53);
    *((void *)this + 52) = 0;
    *((void *)this + 53) = v20;
    uint64_t v21 = *((void *)this + 69);
    uint64_t v11 = *((void *)this + 66);
    uint64_t v12 = *((void *)this + 67);
    *((void *)this + 66) = 0;
    *((void *)this + 67) = v21;
    uint64_t v22 = *((void *)this + 83);
    uint64_t v13 = *((void *)this + 80);
    uint64_t v14 = *((void *)this + 81);
    *((void *)this + 80) = 0;
    *((void *)this + 81) = v22;
    uint64_t v23 = *((void *)this + 97);
    uint64_t v15 = *((void *)this + 94);
    uint64_t v16 = *((void *)this + 95);
    *((void *)this + 94) = 0;
    *((void *)this + 95) = v23;
  }
  unint64_t v24 = (char *)*((void *)this + 104);
  unint64_t v25 = *((void *)this + 105);
  if ((unint64_t)v24 >= v25)
  {
    unint64_t v27 = (void **)((char *)this + 824);
    unint64_t v28 = (char *)*((void *)this + 103);
    uint64_t v29 = 0x6DB6DB6DB6DB6DB7 * ((v24 - v28) >> 4);
    unint64_t v30 = v29 + 1;
    if ((unint64_t)(v29 + 1) > 0x249249249249249) {
      sub_4484();
    }
    unint64_t v31 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v25 - (void)v28) >> 4);
    if (2 * v31 > v30) {
      unint64_t v30 = 2 * v31;
    }
    if (v31 >= 0x124924924924924) {
      unint64_t v32 = 0x249249249249249;
    }
    else {
      unint64_t v32 = v30;
    }
    if (v32)
    {
      uint64_t v51 = v13;
      uint64_t v52 = v5;
      uint64_t v48 = v16;
      uint64_t v33 = v6;
      uint64_t v34 = v8;
      uint64_t v49 = v15;
      uint64_t v50 = v14;
      uint64_t v35 = v7;
      uint64_t v47 = 0x6DB6DB6DB6DB6DB7 * ((v24 - v28) >> 4);
      uint64_t v36 = v9;
      uint64_t v37 = v12;
      unint64_t v38 = (char *)sub_1584F0((uint64_t)this + 840, v32);
      uint64_t v12 = v37;
      uint64_t v9 = v36;
      uint64_t v7 = v35;
      uint64_t v14 = v50;
      uint64_t v13 = v51;
      uint64_t v8 = v34;
      uint64_t v29 = v47;
      unint64_t v27 = (void **)((char *)this + 824);
      uint64_t v6 = v33;
      uint64_t v16 = v48;
      uint64_t v15 = v49;
      uint64_t v5 = v52;
      unint64_t v39 = v38;
      unint64_t v24 = (char *)*((void *)this + 104);
      unint64_t v28 = (char *)*((void *)this + 103);
    }
    else
    {
      unint64_t v39 = 0;
    }
    unint64_t v40 = &v39[112 * v29];
    *(void *)unint64_t v40 = v3;
    *((void *)v40 + 1) = v4;
    *((void *)v40 + 2) = v5;
    *((void *)v40 + 3) = v6;
    unint64_t v41 = &v39[112 * v32];
    *((void *)v40 + 4) = v8;
    *((void *)v40 + 5) = v7;
    *((void *)v40 + 6) = v9;
    *((void *)v40 + 7) = v10;
    *((void *)v40 + 8) = v11;
    *((void *)v40 + 9) = v12;
    *((void *)v40 + 10) = v13;
    *((void *)v40 + 11) = v14;
    *((void *)v40 + 12) = v15;
    *((void *)v40 + 13) = v16;
    unint64_t v26 = v40 + 112;
    if (v24 != v28)
    {
      do
      {
        long long v42 = *((_OWORD *)v24 - 7);
        long long v43 = *((_OWORD *)v24 - 5);
        *((_OWORD *)v40 - 6) = *((_OWORD *)v24 - 6);
        *((_OWORD *)v40 - 5) = v43;
        *((_OWORD *)v40 - 7) = v42;
        long long v44 = *((_OWORD *)v24 - 4);
        long long v45 = *((_OWORD *)v24 - 3);
        long long v46 = *((_OWORD *)v24 - 1);
        *((_OWORD *)v40 - 2) = *((_OWORD *)v24 - 2);
        *((_OWORD *)v40 - 1) = v46;
        *((_OWORD *)v40 - 4) = v44;
        *((_OWORD *)v40 - 3) = v45;
        v40 -= 112;
        v24 -= 112;
      }
      while (v24 != v28);
      unint64_t v28 = (char *)*v27;
    }
    *((void *)this + 103) = v40;
    *((void *)this + 104) = v26;
    *((void *)this + 105) = v41;
    if (v28) {
      operator delete(v28);
    }
  }
  else
  {
    *(void *)unint64_t v24 = v3;
    *((void *)v24 + 1) = v4;
    *((void *)v24 + 2) = v5;
    *((void *)v24 + 3) = v6;
    *((void *)v24 + 4) = v8;
    *((void *)v24 + 5) = v7;
    *((void *)v24 + 6) = v9;
    *((void *)v24 + 7) = v10;
    *((void *)v24 + 8) = v11;
    *((void *)v24 + 9) = v12;
    *((void *)v24 + 10) = v13;
    *((void *)v24 + 11) = v14;
    unint64_t v26 = v24 + 112;
    *((void *)v24 + 12) = v15;
    *((void *)v24 + 13) = v16;
  }
  *((void *)this + 104) = v26;
}

double TUI::Evaluation::Variables::Scope::popClosure(TUI::Evaluation::Variables::Scope *this)
{
  v1 = (_OWORD *)*((void *)this + 104);
  long long v2 = *(v1 - 7);
  v1 -= 7;
  double result = *(double *)&v2;
  *((void *)this + 104) = v1;
  long long v4 = v1[1];
  long long v5 = v1[2];
  long long v6 = v1[3];
  long long v7 = v1[4];
  long long v8 = v1[5];
  long long v9 = v1[6];
  *((_OWORD *)this + 5) = v2;
  *((_OWORD *)this + 12) = v4;
  *((_OWORD *)this + 19) = v5;
  *((_OWORD *)this + 26) = v6;
  *((_OWORD *)this + 33) = v7;
  *((_OWORD *)this + 40) = v8;
  *((_OWORD *)this + 47) = v9;
  return result;
}

void TUI::Evaluation::Variables::Scope::pushScope(TUI::Evaluation::Variables::Scope *this, char a2)
{
  uint64_t v3 = *((void *)this + 12);
  uint64_t v75 = *((void *)this + 13);
  if (a2)
  {
    unint64_t v4 = 0x8E38E38E38E38E39 * ((uint64_t)(*((void *)this + 3) - *((void *)this + 2)) >> 3);
    uint64_t v74 = *((void *)this + 14);
    uint64_t v78 = *((void *)this + 11);
    *((void *)this + 13) = v4;
    if (v3 == -1) {
      *((void *)this + 12) = v4;
    }
  }
  else
  {
    uint64_t v78 = *((void *)this + 11);
    uint64_t v74 = -1;
    unint64_t v4 = -1;
  }
  uint64_t v5 = *((void *)this + 26);
  uint64_t v71 = *((void *)this + 27);
  if ((a2 & 2) != 0)
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 17) - *((void *)this + 16)) >> 4);
    uint64_t v69 = *((void *)this + 28);
    uint64_t v70 = *((void *)this + 25);
    *((void *)this + 27) = v7;
    if (v5 == -1) {
      *((void *)this + 26) = v7;
    }
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 31) - *((void *)this + 30)) >> 4);
    uint64_t v8 = *((void *)this + 42);
    uint64_t v79 = *((void *)this + 41);
    uint64_t v10 = *((void *)this + 39);
    uint64_t v6 = *((void *)this + 40);
    *((void *)this + 41) = v9;
    if (v6 == -1) {
      *((void *)this + 40) = v9;
    }
  }
  else
  {
    uint64_t v70 = *((void *)this + 25);
    uint64_t v6 = *((void *)this + 40);
    uint64_t v79 = *((void *)this + 41);
    unint64_t v7 = -1;
    uint64_t v69 = -1;
    uint64_t v8 = -1;
    unint64_t v9 = -1;
    uint64_t v10 = *((void *)this + 39);
  }
  uint64_t v11 = *((void *)this + 54);
  uint64_t v12 = *((void *)this + 55);
  if ((a2 & 4) != 0)
  {
    uint64_t v15 = (uint64_t)(*((void *)this + 45) - *((void *)this + 44)) >> 6;
    uint64_t v14 = *((void *)this + 56);
    uint64_t v13 = *((void *)this + 53);
    *((void *)this + 55) = v15;
    if (v11 == -1) {
      *((void *)this + 54) = v15;
    }
  }
  else
  {
    uint64_t v13 = *((void *)this + 53);
    uint64_t v14 = -1;
    uint64_t v15 = -1;
  }
  uint64_t v16 = *((void *)this + 69);
  uint64_t v17 = *((void *)this + 68);
  if ((a2 & 8) != 0)
  {
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 59) - *((void *)this + 58)) >> 4);
    uint64_t v19 = *((void *)this + 70);
    uint64_t v18 = *((void *)this + 67);
    *((void *)this + 69) = v20;
    if (v17 == -1) {
      *((void *)this + 68) = v20;
    }
  }
  else
  {
    uint64_t v18 = *((void *)this + 67);
    uint64_t v19 = -1;
    unint64_t v20 = -1;
  }
  uint64_t v21 = *((void *)this + 82);
  uint64_t v76 = *((void *)this + 83);
  uint64_t v77 = v21;
  if ((a2 & 0x10) != 0)
  {
    unint64_t v28 = v20;
    uint64_t v25 = *((void *)this + 84);
    uint64_t v22 = *((void *)this + 81);
    unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 73) - *((void *)this + 72)) >> 4);
    *((void *)this + 83) = v24;
    if (v21 == -1) {
      *((void *)this + 82) = v24;
    }
    uint64_t v29 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)this + 87) - *((void *)this + 86)) >> 3);
    uint64_t v30 = *((void *)this + 97);
    uint64_t v31 = *((void *)this + 96);
    uint64_t v32 = *((void *)this + 98);
    uint64_t v72 = *((void *)this + 95);
    uint64_t v27 = v29;
    *((void *)this + 97) = v29;
    if (v31 == -1) {
      *((void *)this + 96) = v29;
    }
    uint64_t v73 = v31;
    unint64_t v20 = v28;
    uint64_t v23 = v30;
    uint64_t v26 = v32;
  }
  else
  {
    uint64_t v22 = *((void *)this + 81);
    uint64_t v23 = *((void *)this + 97);
    unint64_t v24 = -1;
    uint64_t v73 = *((void *)this + 96);
    uint64_t v25 = -1;
    uint64_t v26 = -1;
    uint64_t v27 = -1;
    uint64_t v72 = *((void *)this + 95);
  }
  uint64_t v33 = (char *)*((void *)this + 101);
  unint64_t v34 = *((void *)this + 102);
  if ((unint64_t)v33 >= v34)
  {
    uint64_t v64 = v22;
    unint64_t v65 = v20;
    uint64_t v66 = v19;
    uint64_t v67 = v18;
    uint64_t v68 = v16;
    uint64_t v36 = (char *)*((void *)this + 100);
    unint64_t v37 = 0xAF8AF8AF8AF8AF8BLL * ((v33 - v36) >> 3);
    unint64_t v38 = v37 + 1;
    if (v37 + 1 > 0xEA0EA0EA0EA0EALL) {
      sub_4484();
    }
    unint64_t v60 = (void **)((char *)this + 800);
    uint64_t v61 = v17;
    uint64_t v62 = v15;
    uint64_t v63 = v14;
    unint64_t v39 = 0xAF8AF8AF8AF8AF8BLL * ((uint64_t)(v34 - (void)v36) >> 3);
    if (2 * v39 > v38) {
      unint64_t v38 = 2 * v39;
    }
    if (v39 >= 0x75075075075075) {
      unint64_t v40 = 0xEA0EA0EA0EA0EALL;
    }
    else {
      unint64_t v40 = v38;
    }
    if (v40)
    {
      unint64_t v58 = v7;
      uint64_t v59 = v3;
      uint64_t v56 = v10;
      uint64_t v57 = v8;
      uint64_t v54 = v11;
      uint64_t v55 = v6;
      unint64_t v41 = v4;
      uint64_t v42 = v5;
      uint64_t v52 = v23;
      uint64_t v53 = v12;
      unint64_t v43 = v9;
      unint64_t v44 = v24;
      uint64_t v45 = v25;
      uint64_t v46 = v27;
      uint64_t v47 = v26;
      unint64_t v48 = v37;
      uint64_t v49 = (char *)sub_15853C((uint64_t)this + 816, v40);
      unint64_t v37 = v48;
      uint64_t v26 = v47;
      uint64_t v27 = v46;
      uint64_t v23 = v52;
      uint64_t v12 = v53;
      uint64_t v25 = v45;
      unint64_t v24 = v44;
      unint64_t v9 = v43;
      uint64_t v8 = v57;
      unint64_t v7 = v58;
      uint64_t v5 = v42;
      uint64_t v6 = v55;
      uint64_t v10 = v56;
      unint64_t v4 = v41;
      uint64_t v11 = v54;
      uint64_t v3 = v59;
      uint64_t v33 = (char *)*((void *)this + 101);
      uint64_t v36 = (char *)*((void *)this + 100);
    }
    else
    {
      uint64_t v49 = 0;
    }
    uint64_t v50 = &v49[280 * v37];
    uint64_t v51 = &v49[280 * v40];
    *(void *)uint64_t v50 = v75;
    *((void *)v50 + 1) = v4;
    *((void *)v50 + 2) = v3;
    *((void *)v50 + 3) = v74;
    *((void *)v50 + 4) = v78;
    *((void *)v50 + 5) = v71;
    *((void *)v50 + 6) = v7;
    *((void *)v50 + 7) = v5;
    *((void *)v50 + 8) = v69;
    *((void *)v50 + 9) = v70;
    *((void *)v50 + 10) = v79;
    *((void *)v50 + 11) = v9;
    *((void *)v50 + 12) = v6;
    *((void *)v50 + 13) = v8;
    *((void *)v50 + 14) = v10;
    *((void *)v50 + 15) = v12;
    *((void *)v50 + 16) = v62;
    *((void *)v50 + 17) = v11;
    *((void *)v50 + 18) = v63;
    *((void *)v50 + 19) = v13;
    *((void *)v50 + 20) = v68;
    *((void *)v50 + 21) = v65;
    *((void *)v50 + 22) = v61;
    *((void *)v50 + 23) = v66;
    *((void *)v50 + 24) = v67;
    *((void *)v50 + 25) = v76;
    *((void *)v50 + 26) = v24;
    *((void *)v50 + 27) = v77;
    *((void *)v50 + 28) = v25;
    *((void *)v50 + 29) = v64;
    *((void *)v50 + 30) = v23;
    *((void *)v50 + 31) = v27;
    *((void *)v50 + 32) = v73;
    *((void *)v50 + 33) = v26;
    uint64_t v35 = v50 + 280;
    *((void *)v50 + 34) = v72;
    if (v33 != v36)
    {
      do
      {
        v33 -= 280;
        v50 -= 280;
        memcpy(v50, v33, 0x118uLL);
      }
      while (v33 != v36);
      uint64_t v36 = (char *)*v60;
    }
    *((void *)this + 100) = v50;
    *((void *)this + 101) = v35;
    *((void *)this + 102) = v51;
    if (v36) {
      operator delete(v36);
    }
  }
  else
  {
    *(void *)uint64_t v33 = v75;
    *((void *)v33 + 1) = v4;
    *((void *)v33 + 2) = v3;
    *((void *)v33 + 3) = v74;
    *((void *)v33 + 4) = v78;
    *((void *)v33 + 5) = v71;
    *((void *)v33 + 6) = v7;
    *((void *)v33 + 7) = v5;
    *((void *)v33 + 8) = v69;
    *((void *)v33 + 9) = v70;
    *((void *)v33 + 10) = v79;
    *((void *)v33 + 11) = v9;
    *((void *)v33 + 12) = v6;
    *((void *)v33 + 13) = v8;
    *((void *)v33 + 14) = v10;
    *((void *)v33 + 15) = v12;
    *((void *)v33 + 16) = v15;
    *((void *)v33 + 17) = v11;
    *((void *)v33 + 18) = v14;
    *((void *)v33 + 19) = v13;
    *((void *)v33 + 20) = v16;
    *((void *)v33 + 21) = v20;
    *((void *)v33 + 22) = v17;
    *((void *)v33 + 23) = v19;
    *((void *)v33 + 24) = v18;
    *((void *)v33 + 25) = v76;
    *((void *)v33 + 26) = v24;
    *((void *)v33 + 27) = v77;
    *((void *)v33 + 28) = v25;
    *((void *)v33 + 29) = v22;
    *((void *)v33 + 30) = v23;
    *((void *)v33 + 31) = v27;
    *((void *)v33 + 32) = v73;
    *((void *)v33 + 33) = v26;
    uint64_t v35 = v33 + 280;
    *((void *)v33 + 34) = v72;
  }
  *((void *)this + 101) = v35;
}

void TUI::Evaluation::Variables::Scope::popScope(TUI::Evaluation::Variables::Scope *this)
{
  long long v2 = (const void *)(*((void *)this + 101) - 280);
  memcpy(__dst, v2, sizeof(__dst));
  *((void *)this + 101) = v2;
  sub_158588((void *)this + 2, (uint64_t)__dst);
  uint64_t v3 = __dst[3];
  *((void *)this + 13) = __dst[0];
  if (v3 != -1) {
    *((void *)this + 14) = v3;
  }
  uint64_t v4 = __dst[2];
  *((void *)this + 11) = __dst[4];
  *((void *)this + 12) = v4;
  sub_158698((void *)this + 16, (uint64_t)&__dst[5]);
  uint64_t v5 = __dst[8];
  *((void *)this + 27) = __dst[5];
  if (v5 != -1) {
    *((void *)this + 28) = v5;
  }
  uint64_t v6 = __dst[7];
  *((void *)this + 25) = __dst[9];
  *((void *)this + 26) = v6;
  sub_158788((void *)this + 30, (uint64_t)&__dst[10]);
  uint64_t v7 = __dst[13];
  *((void *)this + 41) = __dst[10];
  if (v7 != -1) {
    *((void *)this + 42) = v7;
  }
  uint64_t v8 = __dst[12];
  *((void *)this + 39) = __dst[14];
  *((void *)this + 40) = v8;
  sub_15889C((void *)this + 44, (uint64_t)&__dst[15]);
  uint64_t v9 = __dst[18];
  *((void *)this + 55) = __dst[15];
  if (v9 != -1) {
    *((void *)this + 56) = v9;
  }
  uint64_t v10 = __dst[17];
  *((void *)this + 53) = __dst[19];
  *((void *)this + 54) = v10;
  sub_1589A4((void *)this + 58, (uint64_t)&__dst[20]);
  uint64_t v11 = __dst[23];
  *((void *)this + 69) = __dst[20];
  if (v11 != -1) {
    *((void *)this + 70) = v11;
  }
  uint64_t v12 = __dst[22];
  *((void *)this + 67) = __dst[24];
  *((void *)this + 68) = v12;
  sub_158AB8((void *)this + 72, (uint64_t)&__dst[25]);
  uint64_t v13 = __dst[28];
  *((void *)this + 83) = __dst[25];
  if (v13 != -1) {
    *((void *)this + 84) = v13;
  }
  uint64_t v14 = __dst[27];
  *((void *)this + 81) = __dst[29];
  *((void *)this + 82) = v14;
  sub_158BCC((void *)this + 86, (uint64_t)&__dst[30]);
  uint64_t v15 = __dst[33];
  *((void *)this + 97) = __dst[30];
  if (v15 != -1) {
    *((void *)this + 98) = v15;
  }
  uint64_t v16 = __dst[32];
  *((void *)this + 95) = __dst[34];
  *((void *)this + 96) = v16;
}

void sub_15561C(void ***a1)
{
  v1 = *a1;
  long long v2 = (id *)**a1;
  if (v2)
  {
    uint64_t v4 = (id *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = v4 - 9;
        TUI::Evaluation::Enumerator::State::~State(v4 - 6);
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1556A4(void ***a1)
{
  v1 = *a1;
  long long v2 = (id *)**a1;
  if (v2)
  {
    uint64_t v4 = (id *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = v4 - 6;

        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_15572C(void ***a1)
{
  long long v2 = *a1;
  if (*v2)
  {
    sub_155780((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_155780(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 48)
  {
    uint64_t v4 = *(std::__shared_weak_count **)(i - 16);
    if (v4) {
      sub_123E4(v4);
    }
  }
  a1[1] = v2;
}

void sub_1557CC(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_155820((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_155820(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 64)
  {
    uint64_t v4 = *(std::__shared_weak_count **)(i - 32);
    if (v4) {
      sub_123E4(v4);
    }
  }
  a1[1] = v2;
}

void sub_15586C(void ***a1)
{
  v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_1558F0(v4 - 56);
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_1558F0(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    sub_123E4(v2);
  }
  return a1;
}

uint64_t sub_155928(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  *(void *)double result = v2;
  *(void *)(result + 8) = a2[1];
  a2[1] = 0;
  uint64_t v5 = a2[2];
  uint64_t v3 = a2 + 2;
  uint64_t v4 = v5;
  *(void *)(result + 16) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(void *)(v2 + 8 * v7) = result + 16;
    *uint64_t v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t *sub_155998(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *double result = *a2;
  *a2 = v2;
  uint64_t v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  uint64_t v4 = result[2];
  result[2] = a2[2];
  a2[2] = v4;
  uint64_t v5 = result[3];
  result[3] = a2[3];
  a2[3] = v5;
  uint64_t v6 = result[4];
  result[4] = a2[4];
  a2[4] = v6;
  uint64_t v7 = result[5];
  result[5] = a2[5];
  a2[5] = v7;
  return result;
}

void sub_1559FC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  bzero((void *)a2, 0x20uLL);
  bzero((void *)(a2 + 32), 0x100uLL);
  for (uint64_t i = *(uint64_t **)(a1 + 40); i; uint64_t i = (uint64_t *)*i)
  {
    *(void *)(a2 + 8 * (*((_WORD *)i + 8) >> 6)) |= 1 << *((_WORD *)i + 8);
    *(void *)(a2 + 8 * (((unint64_t)*((unsigned __int16 *)i + 9) >> 6) & 0x1F) + 32) |= 1 << *((_WORD *)i + 9);
  }
}

id sub_155A88(unsigned __int16 **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(unsigned __int16 **)a2;
  if ((char *)v3 - (char *)*a1 != *(void *)(a2 + 8) - *(void *)a2) {
    return 0;
  }
  while (v2 != v3)
  {
    id result = sub_155BA8((uint64_t)&v8, v2, v4);
    if (!result) {
      return result;
    }
    v2 += 36;
    v4 += 36;
  }
  return (id)sub_155B18((uint64_t)(a1 + 3), (void *)(a2 + 24));
}

BOOL sub_155B18(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 24) != a2[3]) {
    return 0;
  }
  uint64_t v3 = (unsigned __int16 *)(a1 + 16);
  do
  {
    uint64_t v3 = *(unsigned __int16 **)v3;
    BOOL v4 = v3 == 0;
    if (!v3) {
      break;
    }
    uint64_t v5 = sub_270E0(a2, v3 + 8);
    if (!v5) {
      break;
    }
    BOOL v6 = v3[9] == *((unsigned __int16 *)v5 + 9) && v3[8] == *((unsigned __int16 *)v5 + 8);
  }
  while (v6 && *((void *)v3 + 3) == (void)v5[3]);
  return v4;
}

id sub_155BA8(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  if (a2[1] != a3[1]
    || *a2 != *a3
    || *((void *)a2 + 1) != *((void *)a3 + 1)
    || a2[13] != a3[13]
    || a2[12] != a3[12]
    || a2[15] != a3[15]
    || a2[14] != a3[14]
    || ((*((unsigned char *)a3 + 32) ^ *((unsigned char *)a2 + 32)) & 3) != 0
    || *((void *)a2 + 5) != *((void *)a3 + 5))
  {
    return 0;
  }
  uint64_t v5 = (void *)*((void *)a2 + 6);
  if (v5 == *((void **)a3 + 6) || (id result = objc_msgSend(v5, "isEqual:"), result))
  {
    uint64_t v7 = (void *)*((void *)a2 + 7);
    if (v7 == *((void **)a3 + 7))
    {
      return &def_141F14 + 1;
    }
    else
    {
      return [v7 isEqual:];
    }
  }
  return result;
}

uint64_t sub_155CB0(unsigned __int16 **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  BOOL v4 = *(unsigned __int16 **)a2;
  if ((char *)v3 - (char *)*a1 != *(void *)(a2 + 8) - *(void *)a2) {
    return 0;
  }
  while (v2 != v3)
  {
    uint64_t result = sub_155D40((uint64_t)&v8, v2, v4);
    if (!result) {
      return result;
    }
    v2 += 24;
    v4 += 24;
  }
  return sub_155B18((uint64_t)(a1 + 3), (void *)(a2 + 24));
}

uint64_t sub_155D40(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  if (a2[1] == a3[1] && *a2 == *a3 && *((void *)a2 + 1) == *((void *)a3 + 1)) {
    return TUI::Evaluation::ResolvedValue::operator==((uint64_t)(a2 + 12), (uint64_t)(a3 + 12));
  }
  else {
    return 0;
  }
}

BOOL sub_155D84(unsigned __int16 **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  BOOL v4 = *(unsigned __int16 **)a2;
  if ((char *)v3 - (char *)*a1 != *(void *)(a2 + 8) - *(void *)a2) {
    return 0;
  }
  while (v2 != v3)
  {
    BOOL result = sub_155E14((uint64_t)&v8, v2, v4);
    if (!result) {
      return result;
    }
    v2 += 24;
    v4 += 24;
  }
  return sub_155B18((uint64_t)(a1 + 3), (void *)(a2 + 24));
}

BOOL sub_155E14(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  if (a2[1] != a3[1] || *a2 != *a3 || *((void *)a2 + 1) != *((void *)a3 + 1)) {
    return 0;
  }
  if (*((_DWORD *)a2 + 4) != *((_DWORD *)a3 + 4) || *((void *)a2 + 3) != *((void *)a3 + 3)) {
    return 0;
  }
  return *((_DWORD *)a2 + 10) == *((_DWORD *)a3 + 10) && *((_DWORD *)a2 + 11) == *((_DWORD *)a3 + 11);
}

BOOL sub_155E80(unsigned __int16 **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  BOOL v4 = *(unsigned __int16 **)a2;
  if ((char *)v3 - (char *)*a1 != *(void *)(a2 + 8) - *(void *)a2) {
    return 0;
  }
  while (v2 != v3)
  {
    BOOL result = sub_155F10((uint64_t)&v8, v2, v4);
    if (!result) {
      return result;
    }
    v2 += 32;
    v4 += 32;
  }
  return sub_155B18((uint64_t)(a1 + 3), (void *)(a2 + 24));
}

BOOL sub_155F10(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  if (a2[1] != a3[1] || *a2 != *a3 || *((void *)a2 + 1) != *((void *)a3 + 1)) {
    return 0;
  }
  BOOL v3 = *((_DWORD *)a2 + 4) == *((_DWORD *)a3 + 4) && *((void *)a2 + 3) == *((void *)a3 + 3);
  if (!v3 || *((_DWORD *)a2 + 10) != *((_DWORD *)a3 + 10)) {
    return 0;
  }
  BOOL result = 0;
  if (*((_DWORD *)a2 + 11) == *((_DWORD *)a3 + 11) && a2[24] == a3[24])
  {
    BOOL result = 0;
    if (*((_DWORD *)a2 + 13) == *((_DWORD *)a3 + 13) && *((_DWORD *)a2 + 14) == *((_DWORD *)a3 + 14)) {
      return *((_DWORD *)a2 + 15) == *((_DWORD *)a3 + 15);
    }
  }
  return result;
}

id sub_155FD0(unsigned __int16 **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  BOOL v3 = a1[1];
  BOOL v4 = *(unsigned __int16 **)a2;
  if ((char *)v3 - (char *)*a1 != *(void *)(a2 + 8) - *(void *)a2) {
    return 0;
  }
  while (v2 != v3)
  {
    id result = sub_156060((uint64_t)&v8, v2, v4);
    if (!result) {
      return result;
    }
    v2 += 28;
    v4 += 28;
  }
  return (id)sub_155B18((uint64_t)(a1 + 3), (void *)(a2 + 24));
}

id sub_156060(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  if (a2[1] != a3[1] || *a2 != *a3 || *((void *)a2 + 1) != *((void *)a3 + 1)) {
    return 0;
  }
  BOOL v3 = *((_DWORD *)a2 + 4) == *((_DWORD *)a3 + 4) && *((void *)a2 + 3) == *((void *)a3 + 3);
  if (!v3 || *((_DWORD *)a2 + 12) != *((_DWORD *)a3 + 12)) {
    return 0;
  }
  BOOL v4 = (void *)*((void *)a2 + 5);
  if (v4 == *((void **)a3 + 5)) {
    return &def_141F14 + 1;
  }
  else {
    return [v4 isEqual:];
  }
}

void *sub_1560E0(void *a1, int a2, void *a3)
{
  BOOL v4 = a1;
  int v8 = a2;
  uint64_t v5 = sub_270E0(a1 + 3, (unsigned __int16 *)&v8);
  if (!v5) {
    return 0;
  }
  BOOL v6 = v5[3];
  if (v6 == (uint64_t *)-1) {
    return 0;
  }
  if ((unint64_t)v6 < a3[1] && *a3)
  {
    do
    {
      if ((unint64_t)v6 + a3[5] < *a3) {
        break;
      }
      BOOL v6 = *(uint64_t **)(*v4 + 72 * (void)v6 + 8);
    }
    while (v6 != (uint64_t *)-1);
  }
  return v4;
}

void *sub_156180(void *a1, int a2, void *a3)
{
  BOOL v4 = a1;
  int v8 = a2;
  uint64_t v5 = sub_270E0(a1 + 3, (unsigned __int16 *)&v8);
  if (!v5) {
    return 0;
  }
  BOOL v6 = v5[3];
  if (v6 == (uint64_t *)-1) {
    return 0;
  }
  if ((unint64_t)v6 < a3[1] && *a3)
  {
    do
    {
      if ((unint64_t)v6 + a3[5] < *a3) {
        break;
      }
      BOOL v6 = *(uint64_t **)(*v4 + 48 * (void)v6 + 8);
    }
    while (v6 != (uint64_t *)-1);
  }
  return v4;
}

void *sub_156220(void *a1, int a2, void *a3)
{
  BOOL v4 = a1;
  int v8 = a2;
  uint64_t v5 = sub_270E0(a1 + 3, (unsigned __int16 *)&v8);
  if (!v5) {
    return 0;
  }
  BOOL v6 = v5[3];
  if (v6 == (uint64_t *)-1) {
    return 0;
  }
  if ((unint64_t)v6 < a3[1] && *a3)
  {
    do
    {
      if ((unint64_t)v6 + a3[5] < *a3) {
        break;
      }
      BOOL v6 = *(uint64_t **)(*v4 + ((void)v6 << 6) + 8);
    }
    while (v6 != (uint64_t *)-1);
  }
  return v4;
}

void *sub_1562BC(void *a1, int a2, void *a3)
{
  BOOL v4 = a1;
  int v8 = a2;
  uint64_t v5 = sub_270E0(a1 + 3, (unsigned __int16 *)&v8);
  if (!v5) {
    return 0;
  }
  BOOL v6 = v5[3];
  if (v6 == (uint64_t *)-1) {
    return 0;
  }
  if ((unint64_t)v6 < a3[1] && *a3)
  {
    do
    {
      if ((unint64_t)v6 + a3[5] < *a3) {
        break;
      }
      BOOL v6 = *(uint64_t **)(*v4 + 56 * (void)v6 + 8);
    }
    while (v6 != (uint64_t *)-1);
  }
  return v4;
}

uint64_t *sub_15635C(uint64_t *a1, unsigned int a2, uint64_t a3, const TUI::Evaluation::Enumerator::State *a4, uint64_t a5)
{
  unsigned int v22 = a2;
  uint64_t v8 = (uint64_t)(a1 + 3);
  uint64_t v9 = sub_270E0(a1 + 3, (unsigned __int16 *)&v22);
  uint64_t v10 = v9;
  if (v9) {
    unint64_t v11 = (unint64_t)v9[3];
  }
  else {
    unint64_t v11 = -1;
  }
  if (v11 != -1 && (v11 >= *(void *)(a5 + 24) ? (BOOL v12 = v11 >= *(void *)(a5 + 32)) : (BOOL v12 = 0), v12))
  {
    TUI::Evaluation::Enumerator::State::operator=(*a1 + 72 * v11 + 24, (uint64_t)a4);
  }
  else
  {
    unsigned int v19 = v22;
    unint64_t v20 = v11;
    TUI::Evaluation::Enumerator::State::State((TUI::Evaluation::Enumerator::State *)v21, a4);
    uint64_t v14 = *a1;
    unint64_t v13 = a1[1];
    if (v13 >= a1[2])
    {
      uint64_t v15 = sub_1564D4(a1, (uint64_t)&v19);
    }
    else
    {
      *(_DWORD *)unint64_t v13 = v19;
      *(void *)(v13 + 8) = v20;
      TUI::Evaluation::Enumerator::State::State((TUI::Evaluation::Enumerator::State *)(v13 + 24), (const TUI::Evaluation::Enumerator::State *)v21);
      uint64_t v15 = v13 + 72;
      a1[1] = v13 + 72;
    }
    unint64_t v16 = 0x8E38E38E38E38E39 * ((uint64_t)(v13 - v14) >> 3);
    a1[1] = v15;
    if (v10)
    {
      v10[3] = (uint64_t *)v16;
    }
    else
    {
      v18[0] = v22;
      v18[1] = v16;
      sub_156778(v8, (unsigned __int16 *)v18, (uint64_t)v18);
    }
    TUI::Evaluation::Enumerator::State::~State(v21);
  }
  return a1;
}

void sub_1564B0(_Unwind_Exception *a1)
{
  TUI::Evaluation::Enumerator::State::~State(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1564D4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0x8E38E38E38E38E39 * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x38E38E38E38E38ELL) {
    sub_4484();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x8E38E38E38E38E39 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x1C71C71C71C71C7) {
    unint64_t v9 = 0x38E38E38E38E38ELL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_7BF34(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = &v10[72 * v4];
  v14[0] = v10;
  v14[1] = v11;
  uint64_t v15 = v11;
  unint64_t v16 = &v10[72 * v9];
  *(_DWORD *)unint64_t v11 = *(_DWORD *)a2;
  *((void *)v11 + 1) = *(void *)(a2 + 8);
  TUI::Evaluation::Enumerator::State::State((TUI::Evaluation::Enumerator::State *)(v11 + 24), (const TUI::Evaluation::Enumerator::State *)(a2 + 24));
  v15 += 72;
  sub_156604(a1, v14);
  uint64_t v12 = a1[1];
  sub_156724((uint64_t)v14);
  return v12;
}

void sub_1565F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_156724((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_156604(uint64_t *a1, void *a2)
{
  uint64_t result = sub_15667C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_15667C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  for (uint64_t i = 96; ; i -= 72)
  {
    uint64_t v12 = a3 + i;
    if (a3 + i - 96 == a5) {
      break;
    }
    uint64_t v13 = a7 + i;
    *(_DWORD *)(v13 - 168) = *(_DWORD *)(a3 + i - 168);
    *(void *)(v13 - 160) = *(void *)(a3 + i - 160);
    uint64_t v14 = (TUI::Evaluation::Enumerator::State *)(a7 + i - 144);
    TUI::Evaluation::Enumerator::State::State(v14, (const TUI::Evaluation::Enumerator::State *)(v12 - 144));
  }
  return a6;
}

uint64_t sub_156724(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 72;
    TUI::Evaluation::Enumerator::State::~State((id *)(i - 48));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *sub_156778(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  int v6 = *a2;
  unint64_t v7 = a2[1];
  unint64_t v8 = (v6 << 16) | v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = (v6 << 16) | v7;
      if (v9 <= v8) {
        unint64_t v3 = v8 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
    unint64_t v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      uint64_t v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (*((unsigned __int16 *)v12 + 9) == v7 && *((unsigned __int16 *)v12 + 8) == v6) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v3) {
              break;
            }
          }
          uint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
  uint64_t v12 = operator new(0x20uLL);
  void *v12 = 0;
  v12[1] = v8;
  *((_DWORD *)v12 + 4) = *(_DWORD *)a3;
  v12[3] = *(void *)(a3 + 8);
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_3ED8(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v21 = *(void *)a1;
  unsigned int v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    void *v12 = *v22;
LABEL_42:
    *unsigned int v22 = v12;
    goto LABEL_43;
  }
  void *v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v21 + 8 * v3) = a1 + 16;
  if (*v12)
  {
    unint64_t v23 = *(void *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }
    else
    {
      v23 &= v9 - 1;
    }
    unsigned int v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_1569A0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_1569B4(uint64_t *a1, unsigned int a2, uint64_t a3, id *a4, uint64_t a5)
{
  unsigned int v28 = a2;
  uint64_t v8 = (uint64_t)(a1 + 3);
  unint64_t v9 = sub_270E0(a1 + 3, (unsigned __int16 *)&v28);
  uint8x8_t v10 = v9;
  if (v9) {
    unint64_t v11 = (unint64_t)v9[3];
  }
  else {
    unint64_t v11 = -1;
  }
  if (v11 != -1 && (v11 >= *(void *)(a5 + 24) ? (BOOL v12 = v11 >= *(void *)(a5 + 32)) : (BOOL v12 = 0), v12))
  {
    uint64_t v13 = *a1 + 48 * v11;
    *(_DWORD *)(v13 + 24) = *(_DWORD *)a4;
    objc_storeStrong((id *)(v13 + 32), a4[1]);
    *(void *)(v13 + 40) = a4[2];
  }
  else
  {
    unsigned int v14 = v28;
    unsigned int v23 = v28;
    unint64_t v24 = v11;
    int v15 = *(_DWORD *)a4;
    int v25 = *(_DWORD *)a4;
    id v16 = a4[1];
    id v17 = a4[2];
    id v26 = v16;
    id v27 = v17;
    uint64_t v19 = *a1;
    unint64_t v18 = a1[1];
    if (v18 >= a1[2])
    {
      uint64_t v20 = sub_156B30(a1, (uint64_t)&v23);
    }
    else
    {
      *(_DWORD *)unint64_t v18 = v14;
      *(void *)(v18 + 8) = v11;
      *(_DWORD *)(v18 + 24) = v15;
      *(void *)(v18 + 32) = v16;
      *(void *)(v18 + 40) = v17;
      uint64_t v20 = v18 + 48;
    }
    a1[1] = v20;
    if (v10)
    {
      v10[3] = (uint64_t *)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v18 - v19) >> 4));
    }
    else
    {
      v22[0] = v28;
      v22[1] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v18 - v19) >> 4);
      sub_156778(v8, (unsigned __int16 *)v22, (uint64_t)v22);
    }
  }
  return a1;
}

void sub_156B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t sub_156B30(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555) {
    sub_4484();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x555555555555555;
  }
  else {
    unint64_t v9 = v5;
  }
  v14[4] = a1 + 2;
  if (v9) {
    uint8x8_t v10 = (char *)sub_452C(v7, v9);
  }
  else {
    uint8x8_t v10 = 0;
  }
  unint64_t v11 = &v10[48 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v14[3] = &v10[48 * v9];
  *(_DWORD *)unint64_t v11 = *(_DWORD *)a2;
  *((void *)v11 + 1) = *(void *)(a2 + 8);
  *((_DWORD *)v11 + 6) = *(_DWORD *)(a2 + 24);
  *((void *)v11 + 4) = *(id *)(a2 + 32);
  *((void *)v11 + 5) = *(void *)(a2 + 40);
  void v14[2] = v11 + 48;
  sub_156C54(a1, v14);
  uint64_t v12 = a1[1];
  sub_156D6C((uint64_t)v14);
  return v12;
}

void sub_156C40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_156D6C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_156C54(uint64_t *a1, void *a2)
{
  uint64_t result = sub_156CCC((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_156CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != a5)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = a7 + v11;
      *(_DWORD *)(v12 - 48) = *(_DWORD *)(a3 + v11 - 48);
      *(void *)(v12 - 40) = *(void *)(a3 + v11 - 40);
      *(_DWORD *)(v12 - 24) = *(_DWORD *)(a3 + v11 - 24);
      *(void *)(v12 - 16) = *(id *)(a3 + v11 - 16);
      *(void *)(v12 - 8) = *(void *)(a3 + v11 - 8);
      v11 -= 48;
    }
    while (a3 + v11 != a5);
  }
  return a6;
}

uint64_t sub_156D6C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t *sub_156DC0(uint64_t *a1, unsigned int a2, uint64_t a3, void *a4, uint64_t a5)
{
  unsigned int v31 = a2;
  uint64_t v9 = (uint64_t)(a1 + 3);
  uint8x8_t v10 = sub_270E0(a1 + 3, (unsigned __int16 *)&v31);
  uint64_t v11 = v10;
  if (v10) {
    unint64_t v12 = (unint64_t)v10[3];
  }
  else {
    unint64_t v12 = -1;
  }
  if (v12 != -1 && (v12 >= *(void *)(a5 + 24) ? (BOOL v13 = v12 >= *(void *)(a5 + 32)) : (BOOL v13 = 0), v13))
  {
    uint64_t v14 = *a1 + 48 * v12;
    sub_42AA4(v14 + 16, a3);
    *(void *)(v14 + 40) = *a4;
  }
  else
  {
    unsigned int v15 = v31;
    unsigned int v25 = v31;
    unint64_t v26 = v12;
    int v16 = *(_DWORD *)a3;
    int v27 = *(_DWORD *)a3;
    uint64_t v18 = *(void *)(a3 + 8);
    id v17 = *(std::__shared_weak_count **)(a3 + 16);
    uint64_t v28 = v18;
    uint64_t v29 = v17;
    if (v17) {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v19 = *a4;
    uint64_t v30 = *a4;
    uint64_t v21 = *a1;
    unint64_t v20 = a1[1];
    if (v20 >= a1[2])
    {
      uint64_t v22 = sub_156F58(a1, (uint64_t)&v25);
    }
    else
    {
      *(_DWORD *)unint64_t v20 = v15;
      *(void *)(v20 + 8) = v12;
      *(_DWORD *)(v20 + 16) = v16;
      *(void *)(v20 + 24) = v18;
      *(void *)(v20 + 32) = v17;
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      *(void *)(v20 + 40) = v19;
      uint64_t v22 = v20 + 48;
    }
    a1[1] = v22;
    if (v11)
    {
      v11[3] = (uint64_t *)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v20 - v21) >> 4));
    }
    else
    {
      v24[0] = v31;
      v24[1] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v20 - v21) >> 4);
      sub_156778(v9, (unsigned __int16 *)v24, (uint64_t)v24);
    }
    if (v29) {
      sub_123E4(v29);
    }
  }
  return a1;
}

void sub_156F3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_123E4(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_156F58(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555) {
    sub_4484();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x555555555555555;
  }
  else {
    unint64_t v9 = v5;
  }
  v15[4] = a1 + 2;
  if (v9) {
    uint8x8_t v10 = (char *)sub_452C(v7, v9);
  }
  else {
    uint8x8_t v10 = 0;
  }
  uint64_t v11 = &v10[48 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[48 * v9];
  *(_DWORD *)uint64_t v11 = *(_DWORD *)a2;
  *((void *)v11 + 1) = *(void *)(a2 + 8);
  *((_DWORD *)v11 + 4) = *(_DWORD *)(a2 + 16);
  *((void *)v11 + 3) = *(void *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 32);
  *((void *)v11 + 4) = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)&v10[48 * v4 + 40] = *(void *)(a2 + 40);
  v15[2] = v11 + 48;
  sub_157098(a1, v15);
  uint64_t v13 = a1[1];
  sub_157258(v15);
  return v13;
}

void sub_157084(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_157258((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_157098(uint64_t *a1, void *a2)
{
  uint64_t result = sub_157110((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_157110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v8 = a3;
    do
    {
      int v9 = *(_DWORD *)(v8 - 48);
      v8 -= 48;
      *(_DWORD *)(v7 - 48) = v9;
      *(void *)(v7 - 40) = *(void *)(v8 + 8);
      *(_DWORD *)(v7 - 32) = *(_DWORD *)(v8 + 16);
      *(void *)(v7 - 24) = *(void *)(v8 + 24);
      uint64_t v10 = *(void *)(v8 + 32);
      *(void *)(v7 - 16) = v10;
      if (v10) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
      }
      *(void *)(v7 - 8) = *(void *)(a3 - 8);
      uint64_t v7 = *((void *)&v16 + 1) - 48;
      *((void *)&v16 + 1) -= 48;
      a3 = v8;
    }
    while (v8 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  sub_1571DC((uint64_t)v13);
  return v11;
}

uint64_t sub_1571DC(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_157214(a1);
  }
  return a1;
}

void sub_157214(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v1 + 32);
    if (v3) {
      sub_123E4(v3);
    }
    v1 += 48;
  }
}

void **sub_157258(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_15728C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    *(void *)(a1 + 16) = v1 - 48;
    unint64_t v4 = *(std::__shared_weak_count **)(v1 - 16);
    if (v4)
    {
      sub_123E4(v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
    else
    {
      v1 -= 48;
    }
  }
}

uint64_t *sub_1572E0(uint64_t *a1, unsigned int a2, uint64_t a3, long long *a4, uint64_t a5)
{
  unsigned int v33 = a2;
  uint64_t v9 = (uint64_t)(a1 + 3);
  uint64_t v10 = sub_270E0(a1 + 3, (unsigned __int16 *)&v33);
  uint64_t v11 = v10;
  if (v10) {
    unint64_t v12 = (unint64_t)v10[3];
  }
  else {
    unint64_t v12 = -1;
  }
  if (v12 != -1 && (v12 >= *(void *)(a5 + 24) ? (BOOL v13 = v12 >= *(void *)(a5 + 32)) : (BOOL v13 = 0), v13))
  {
    unint64_t v14 = *a1 + (v12 << 6);
    sub_42AA4(v14 + 16, a3);
    uint64_t v15 = *((void *)a4 + 2);
    *(_OWORD *)(v14 + 40) = *a4;
    *(void *)(v14 + 56) = v15;
  }
  else
  {
    unsigned int v16 = v33;
    unsigned int v26 = v33;
    unint64_t v27 = v12;
    int v17 = *(_DWORD *)a3;
    int v28 = *(_DWORD *)a3;
    uint64_t v19 = *(void *)(a3 + 8);
    uint64_t v18 = *(std::__shared_weak_count **)(a3 + 16);
    uint64_t v29 = v19;
    uint64_t v30 = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    long long v31 = *a4;
    uint64_t v32 = *((void *)a4 + 2);
    uint64_t v21 = *a1;
    unint64_t v20 = a1[1];
    if (v20 >= a1[2])
    {
      uint64_t v23 = sub_15748C(a1, (uint64_t)&v26);
    }
    else
    {
      *(_DWORD *)unint64_t v20 = v16;
      *(void *)(v20 + 8) = v12;
      *(_DWORD *)(v20 + 16) = v17;
      *(void *)(v20 + 24) = v19;
      *(void *)(v20 + 32) = v18;
      if (v18) {
        atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v22 = v31;
      *(void *)(v20 + 56) = v32;
      *(_OWORD *)(v20 + 40) = v22;
      uint64_t v23 = v20 + 64;
    }
    a1[1] = v23;
    if (v11)
    {
      v11[3] = (uint64_t *)((uint64_t)(v20 - v21) >> 6);
    }
    else
    {
      v25[0] = v33;
      v25[1] = (uint64_t)(v20 - v21) >> 6;
      sub_156778(v9, (unsigned __int16 *)v25, (uint64_t)v25);
    }
    if (v30) {
      sub_123E4(v30);
    }
  }
  return a1;
}

void sub_157470(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_123E4(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_15748C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 6;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 58) {
    sub_4484();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 5 > v5) {
    unint64_t v5 = v8 >> 5;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFC0) {
    unint64_t v9 = 0x3FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  v16[4] = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_66F10(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[64 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[64 * v9];
  *(_DWORD *)uint64_t v11 = *(_DWORD *)a2;
  *((void *)v11 + 1) = *(void *)(a2 + 8);
  *((_DWORD *)v11 + 4) = *(_DWORD *)(a2 + 16);
  *((void *)v11 + 3) = *(void *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 32);
  *((void *)v11 + 4) = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  long long v13 = *(_OWORD *)(a2 + 40);
  *((void *)v11 + 7) = *(void *)(a2 + 56);
  *(_OWORD *)(v11 + 40) = v13;
  v16[2] = v11 + 64;
  sub_1575AC(a1, v16);
  uint64_t v14 = a1[1];
  sub_157774(v16);
  return v14;
}

void sub_157598(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_157774((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1575AC(uint64_t *a1, void *a2)
{
  uint64_t result = sub_157624((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_157624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v17 = a6;
  *((void *)&v17 + 1) = a7;
  long long v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  void v14[2] = &v17;
  if (a3 == a5)
  {
    uint64_t v12 = a6;
  }
  else
  {
    uint64_t v8 = a3;
    do
    {
      int v9 = *(_DWORD *)(v8 - 64);
      v8 -= 64;
      *(_DWORD *)(v7 - 64) = v9;
      *(void *)(v7 - 56) = *(void *)(v8 + 8);
      *(_DWORD *)(v7 - 48) = *(_DWORD *)(v8 + 16);
      *(void *)(v7 - 40) = *(void *)(v8 + 24);
      uint64_t v10 = *(void *)(v8 + 32);
      *(void *)(v7 - 32) = v10;
      if (v10) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v11 = *(void *)(a3 - 8);
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 - 24);
      *(void *)(v7 - 8) = v11;
      uint64_t v7 = *((void *)&v17 + 1) - 64;
      *((void *)&v17 + 1) -= 64;
      a3 = v8;
    }
    while (v8 != a5);
    uint64_t v12 = v17;
  }
  char v15 = 1;
  sub_1576F8((uint64_t)v14);
  return v12;
}

uint64_t sub_1576F8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_157730(a1);
  }
  return a1;
}

void sub_157730(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v1 + 32);
    if (v3) {
      sub_123E4(v3);
    }
    v1 += 64;
  }
}

void **sub_157774(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_1577A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    *(void *)(a1 + 16) = v1 - 64;
    uint64_t v4 = *(std::__shared_weak_count **)(v1 - 32);
    if (v4)
    {
      sub_123E4(v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
    else
    {
      v1 -= 64;
    }
  }
}

uint64_t *sub_1577FC(uint64_t *a1, unsigned int a2, uint64_t a3, void *a4, uint64_t a5)
{
  unsigned int v31 = a2;
  uint64_t v9 = (uint64_t)(a1 + 3);
  uint64_t v10 = sub_270E0(a1 + 3, (unsigned __int16 *)&v31);
  uint64_t v11 = v10;
  if (v10) {
    unint64_t v12 = (unint64_t)v10[3];
  }
  else {
    unint64_t v12 = -1;
  }
  if (v12 != -1 && (v12 >= *(void *)(a5 + 24) ? (BOOL v13 = v12 >= *(void *)(a5 + 32)) : (BOOL v13 = 0), v13))
  {
    uint64_t v14 = *a1 + 48 * v12;
    sub_42AA4(v14 + 16, a3);
    *(void *)(v14 + 40) = *a4;
  }
  else
  {
    unsigned int v15 = v31;
    unsigned int v25 = v31;
    unint64_t v26 = v12;
    int v16 = *(_DWORD *)a3;
    int v27 = *(_DWORD *)a3;
    uint64_t v18 = *(void *)(a3 + 8);
    long long v17 = *(std::__shared_weak_count **)(a3 + 16);
    uint64_t v28 = v18;
    uint64_t v29 = v17;
    if (v17) {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v19 = *a4;
    uint64_t v30 = *a4;
    uint64_t v21 = *a1;
    unint64_t v20 = a1[1];
    if (v20 >= a1[2])
    {
      uint64_t v22 = sub_157994(a1, (uint64_t)&v25);
    }
    else
    {
      *(_DWORD *)unint64_t v20 = v15;
      *(void *)(v20 + 8) = v12;
      *(_DWORD *)(v20 + 16) = v16;
      *(void *)(v20 + 24) = v18;
      *(void *)(v20 + 32) = v17;
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      *(void *)(v20 + 40) = v19;
      uint64_t v22 = v20 + 48;
    }
    a1[1] = v22;
    if (v11)
    {
      v11[3] = (uint64_t *)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v20 - v21) >> 4));
    }
    else
    {
      v24[0] = v31;
      v24[1] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v20 - v21) >> 4);
      sub_156778(v9, (unsigned __int16 *)v24, (uint64_t)v24);
    }
    if (v29) {
      sub_123E4(v29);
    }
  }
  return a1;
}

void sub_157978(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_123E4(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_157994(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555) {
    sub_4484();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x555555555555555;
  }
  else {
    unint64_t v9 = v5;
  }
  v15[4] = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_452C(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[48 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[48 * v9];
  *(_DWORD *)uint64_t v11 = *(_DWORD *)a2;
  *((void *)v11 + 1) = *(void *)(a2 + 8);
  *((_DWORD *)v11 + 4) = *(_DWORD *)(a2 + 16);
  *((void *)v11 + 3) = *(void *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 32);
  *((void *)v11 + 4) = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)&v10[48 * v4 + 40] = *(void *)(a2 + 40);
  v15[2] = v11 + 48;
  sub_157AD4(a1, v15);
  uint64_t v13 = a1[1];
  sub_157258(v15);
  return v13;
}

void sub_157AC0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_157258((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_157AD4(uint64_t *a1, void *a2)
{
  uint64_t result = sub_157B4C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_157B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v8 = a3;
    do
    {
      int v9 = *(_DWORD *)(v8 - 48);
      v8 -= 48;
      *(_DWORD *)(v7 - 48) = v9;
      *(void *)(v7 - 40) = *(void *)(v8 + 8);
      *(_DWORD *)(v7 - 32) = *(_DWORD *)(v8 + 16);
      *(void *)(v7 - 24) = *(void *)(v8 + 24);
      uint64_t v10 = *(void *)(v8 + 32);
      *(void *)(v7 - 16) = v10;
      if (v10) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
      }
      *(void *)(v7 - 8) = *(void *)(a3 - 8);
      uint64_t v7 = *((void *)&v16 + 1) - 48;
      *((void *)&v16 + 1) -= 48;
      a3 = v8;
    }
    while (v8 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  sub_157C18((uint64_t)v13);
  return v11;
}

uint64_t sub_157C18(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_157214(a1);
  }
  return a1;
}

uint64_t *sub_157C50(uint64_t *a1, unsigned int a2, uint64_t a3, void *a4, uint64_t a5)
{
  unsigned int v31 = a2;
  uint64_t v9 = (uint64_t)(a1 + 3);
  uint64_t v10 = sub_270E0(a1 + 3, (unsigned __int16 *)&v31);
  uint64_t v11 = v10;
  if (v10) {
    unint64_t v12 = (unint64_t)v10[3];
  }
  else {
    unint64_t v12 = -1;
  }
  if (v12 != -1 && (v12 >= *(void *)(a5 + 24) ? (BOOL v13 = v12 >= *(void *)(a5 + 32)) : (BOOL v13 = 0), v13))
  {
    uint64_t v14 = *a1 + 48 * v12;
    sub_42AA4(v14 + 16, a3);
    *(void *)(v14 + 40) = *a4;
  }
  else
  {
    unsigned int v15 = v31;
    unsigned int v25 = v31;
    unint64_t v26 = v12;
    int v16 = *(_DWORD *)a3;
    int v27 = *(_DWORD *)a3;
    uint64_t v18 = *(void *)(a3 + 8);
    long long v17 = *(std::__shared_weak_count **)(a3 + 16);
    uint64_t v28 = v18;
    uint64_t v29 = v17;
    if (v17) {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v19 = *a4;
    uint64_t v30 = *a4;
    uint64_t v21 = *a1;
    unint64_t v20 = a1[1];
    if (v20 >= a1[2])
    {
      uint64_t v22 = sub_157DE8(a1, (uint64_t)&v25);
    }
    else
    {
      *(_DWORD *)unint64_t v20 = v15;
      *(void *)(v20 + 8) = v12;
      *(_DWORD *)(v20 + 16) = v16;
      *(void *)(v20 + 24) = v18;
      *(void *)(v20 + 32) = v17;
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      *(void *)(v20 + 40) = v19;
      uint64_t v22 = v20 + 48;
    }
    a1[1] = v22;
    if (v11)
    {
      v11[3] = (uint64_t *)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v20 - v21) >> 4));
    }
    else
    {
      v24[0] = v31;
      v24[1] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v20 - v21) >> 4);
      sub_156778(v9, (unsigned __int16 *)v24, (uint64_t)v24);
    }
    if (v29) {
      sub_123E4(v29);
    }
  }
  return a1;
}

void sub_157DCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_123E4(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_157DE8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555) {
    sub_4484();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x555555555555555;
  }
  else {
    unint64_t v9 = v5;
  }
  v15[4] = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_452C(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[48 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[48 * v9];
  *(_DWORD *)uint64_t v11 = *(_DWORD *)a2;
  *((void *)v11 + 1) = *(void *)(a2 + 8);
  *((_DWORD *)v11 + 4) = *(_DWORD *)(a2 + 16);
  *((void *)v11 + 3) = *(void *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 32);
  *((void *)v11 + 4) = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)&v10[48 * v4 + 40] = *(void *)(a2 + 40);
  v15[2] = v11 + 48;
  sub_157F28(a1, v15);
  uint64_t v13 = a1[1];
  sub_157258(v15);
  return v13;
}

void sub_157F14(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_157258((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_157F28(uint64_t *a1, void *a2)
{
  uint64_t result = sub_157FA0((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_157FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v8 = a3;
    do
    {
      int v9 = *(_DWORD *)(v8 - 48);
      v8 -= 48;
      *(_DWORD *)(v7 - 48) = v9;
      *(void *)(v7 - 40) = *(void *)(v8 + 8);
      *(_DWORD *)(v7 - 32) = *(_DWORD *)(v8 + 16);
      *(void *)(v7 - 24) = *(void *)(v8 + 24);
      uint64_t v10 = *(void *)(v8 + 32);
      *(void *)(v7 - 16) = v10;
      if (v10) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
      }
      *(void *)(v7 - 8) = *(void *)(a3 - 8);
      uint64_t v7 = *((void *)&v16 + 1) - 48;
      *((void *)&v16 + 1) -= 48;
      a3 = v8;
    }
    while (v8 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  sub_15806C((uint64_t)v13);
  return v11;
}

uint64_t sub_15806C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_157214(a1);
  }
  return a1;
}

uint64_t *sub_1580A4(uint64_t *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v28 = a2;
  uint64_t v9 = (uint64_t)(a1 + 3);
  uint64_t v10 = sub_270E0(a1 + 3, (unsigned __int16 *)&v28);
  uint64_t v11 = v10;
  if (v10) {
    unint64_t v12 = (unint64_t)v10[3];
  }
  else {
    unint64_t v12 = -1;
  }
  if (v12 != -1 && (v12 >= *(void *)(a5 + 24) ? (BOOL v13 = v12 >= *(void *)(a5 + 32)) : (BOOL v13 = 0), v13))
  {
    uint64_t v14 = *a1 + 56 * v12;
    sub_42AA4(v14 + 16, a3);
    objc_storeStrong((id *)(v14 + 40), *(id *)a4);
    *(_DWORD *)(v14 + 48) = *(_DWORD *)(a4 + 8);
  }
  else
  {
    unsigned int v21 = v28;
    unint64_t v22 = v12;
    int v23 = *(_DWORD *)a3;
    long long v15 = *(std::__shared_weak_count **)(a3 + 16);
    uint64_t v24 = *(void *)(a3 + 8);
    unsigned int v25 = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v26 = *(id *)a4;
    int v27 = *(_DWORD *)(a4 + 8);
    uint64_t v17 = *a1;
    uint64_t v16 = a1[1];
    sub_158224(a1, (uint64_t)&v21);
    uint64_t v18 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v17) >> 3);
    if (v11)
    {
      v11[3] = (uint64_t *)v18;
    }
    else
    {
      v20[0] = v28;
      v20[1] = v18;
      sub_156778(v9, (unsigned __int16 *)v20, (uint64_t)v20);
    }

    if (v25) {
      sub_123E4(v25);
    }
  }
  return a1;
}

void sub_15820C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1558F0((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_158224(uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v7 - *a1) >> 3);
    if ((unint64_t)(v10 + 1) > 0x492492492492492) {
      sub_4484();
    }
    unint64_t v11 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v5 - *a1) >> 3);
    uint64_t v12 = 2 * v11;
    if (2 * v11 <= v10 + 1) {
      uint64_t v12 = v10 + 1;
    }
    if (v11 >= 0x249249249249249) {
      unint64_t v13 = 0x492492492492492;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v19 = v4;
    if (v13) {
      uint64_t v14 = (char *)sub_158454(v4, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    long long v15 = v14;
    uint64_t v16 = &v14[56 * v10];
    uint64_t v18 = &v14[56 * v13];
    sub_158360((uint64_t)v16, a2);
    uint64_t v17 = v16 + 56;
    sub_1583CC(a1, &v15);
    uint64_t v9 = a1[1];
    uint64_t result = sub_1584A0((uint64_t)&v15);
  }
  else
  {
    uint64_t result = sub_158360(*(void *)(v4 - 8), a2);
    uint64_t v9 = v7 + 56;
    a1[1] = v7 + 56;
  }
  a1[1] = v9;
  return result;
}

void sub_15834C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1584A0((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_158360(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 40) = *(id *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  return a1;
}

uint64_t sub_1583CC(uint64_t *a1, void *a2)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t result = a2[1];
  while (v4 != v5)
  {
    v4 -= 56;
    uint64_t result = sub_158360(result - 56, v4);
  }
  a2[1] = result;
  uint64_t v7 = *a1;
  *a1 = result;
  a2[1] = v7;
  uint64_t v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

void *sub_158454(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    sub_3EA4();
  }
  return operator new(56 * a2);
}

uint64_t sub_1584A0(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 56;
    sub_1558F0(i - 56);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *sub_1584F0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL) {
    sub_3EA4();
  }
  return operator new(112 * a2);
}

void *sub_15853C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xEA0EA0EA0EA0EBLL) {
    sub_3EA4();
  }
  return operator new(280 * a2);
}

void sub_158588(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if ((v2 & 0x80000000) == 0)
  {
    unint64_t v4 = 0x8E38E38E38E38E39 * ((uint64_t)(a1[1] - *a1) >> 3);
    unint64_t v5 = (int)v2;
    while (v5 < v4)
    {
      uint64_t v6 = a1[1];
      int v12 = *(_DWORD *)(v6 - 72);
      uint64_t v13 = *(void *)(v6 - 64);
      TUI::Evaluation::Enumerator::State::State((TUI::Evaluation::Enumerator::State *)v14, (const TUI::Evaluation::Enumerator::State *)(v6 - 48));
      uint64_t v7 = a1[1];
      uint64_t v8 = v7 - 72;
      TUI::Evaluation::Enumerator::State::~State((id *)(v7 - 48));
      a1[1] = v8;
      uint64_t v9 = v13;
      int v11 = v12;
      uint64_t v10 = (uint64_t *)sub_270E0(a1 + 3, (unsigned __int16 *)&v11);
      if (v10)
      {
        if (v9 == -1) {
          sub_34E00(a1 + 3, v10);
        }
        else {
          v10[3] = v9;
        }
      }
      --v4;
      TUI::Evaluation::Enumerator::State::~State(v14);
    }
  }
}

void sub_158680(_Unwind_Exception *a1)
{
  TUI::Evaluation::Enumerator::State::~State(v1);
  _Unwind_Resume(a1);
}

void sub_158698(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if ((v2 & 0x80000000) == 0)
  {
    unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 4);
    unint64_t v5 = (int)v2;
    while (v5 < v4)
    {
      uint64_t v6 = a1[1];
      int v7 = *(_DWORD *)(v6 - 48);
      uint64_t v8 = *(void *)(v6 - 40);
      id v9 = *(id *)(v6 - 16);
      uint64_t v10 = a1[1];
      uint64_t v11 = v10 - 48;

      a1[1] = v11;
      int v13 = v7;
      int v12 = (uint64_t *)sub_270E0(a1 + 3, (unsigned __int16 *)&v13);
      if (v12)
      {
        if (v8 == -1) {
          sub_34E00(a1 + 3, v12);
        }
        else {
          v12[3] = v8;
        }
      }
      --v4;
    }
  }
}

void sub_158774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_158788(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if ((v2 & 0x80000000) == 0)
  {
    unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 4);
    for (unint64_t i = (int)v2; i < v4; --v4)
    {
      uint64_t v6 = a1[1];
      int v7 = *(_DWORD *)(v6 - 48);
      uint64_t v8 = *(void *)(v6 - 40);
      id v9 = *(std::__shared_weak_count **)(v6 - 16);
      if (v9)
      {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v6 = a1[1];
        uint64_t v10 = *(std::__shared_weak_count **)(v6 - 16);
        if (v10) {
          sub_123E4(v10);
        }
      }
      a1[1] = v6 - 48;
      int v12 = v7;
      uint64_t v11 = (uint64_t *)sub_270E0(a1 + 3, (unsigned __int16 *)&v12);
      if (v11)
      {
        if (v8 == -1) {
          sub_34E00(a1 + 3, v11);
        }
        else {
          v11[3] = v8;
        }
      }
      if (v9) {
        sub_123E4(v9);
      }
    }
  }
}

void sub_158880(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_123E4(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_15889C(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if ((v2 & 0x80000000) == 0)
  {
    unint64_t v4 = (uint64_t)(a1[1] - *a1) >> 6;
    for (unint64_t i = (int)v2; i < v4; --v4)
    {
      uint64_t v6 = a1[1];
      int v7 = *(_DWORD *)(v6 - 64);
      uint64_t v8 = *(void *)(v6 - 56);
      id v9 = *(std::__shared_weak_count **)(v6 - 32);
      if (v9)
      {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v6 = a1[1];
        uint64_t v10 = *(std::__shared_weak_count **)(v6 - 32);
        if (v10) {
          sub_123E4(v10);
        }
      }
      a1[1] = v6 - 64;
      int v12 = v7;
      uint64_t v11 = (uint64_t *)sub_270E0(a1 + 3, (unsigned __int16 *)&v12);
      if (v11)
      {
        if (v8 == -1) {
          sub_34E00(a1 + 3, v11);
        }
        else {
          v11[3] = v8;
        }
      }
      if (v9) {
        sub_123E4(v9);
      }
    }
  }
}

void sub_158988(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_123E4(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1589A4(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if ((v2 & 0x80000000) == 0)
  {
    unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 4);
    for (unint64_t i = (int)v2; i < v4; --v4)
    {
      uint64_t v6 = a1[1];
      int v7 = *(_DWORD *)(v6 - 48);
      uint64_t v8 = *(void *)(v6 - 40);
      id v9 = *(std::__shared_weak_count **)(v6 - 16);
      if (v9)
      {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v6 = a1[1];
        uint64_t v10 = *(std::__shared_weak_count **)(v6 - 16);
        if (v10) {
          sub_123E4(v10);
        }
      }
      a1[1] = v6 - 48;
      int v12 = v7;
      uint64_t v11 = (uint64_t *)sub_270E0(a1 + 3, (unsigned __int16 *)&v12);
      if (v11)
      {
        if (v8 == -1) {
          sub_34E00(a1 + 3, v11);
        }
        else {
          v11[3] = v8;
        }
      }
      if (v9) {
        sub_123E4(v9);
      }
    }
  }
}

void sub_158A9C(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_123E4(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_158AB8(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if ((v2 & 0x80000000) == 0)
  {
    unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 4);
    for (unint64_t i = (int)v2; i < v4; --v4)
    {
      uint64_t v6 = a1[1];
      int v7 = *(_DWORD *)(v6 - 48);
      uint64_t v8 = *(void *)(v6 - 40);
      id v9 = *(std::__shared_weak_count **)(v6 - 16);
      if (v9)
      {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v6 = a1[1];
        uint64_t v10 = *(std::__shared_weak_count **)(v6 - 16);
        if (v10) {
          sub_123E4(v10);
        }
      }
      a1[1] = v6 - 48;
      int v12 = v7;
      uint64_t v11 = (uint64_t *)sub_270E0(a1 + 3, (unsigned __int16 *)&v12);
      if (v11)
      {
        if (v8 == -1) {
          sub_34E00(a1 + 3, v11);
        }
        else {
          v11[3] = v8;
        }
      }
      if (v9) {
        sub_123E4(v9);
      }
    }
  }
}

void sub_158BB0(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_123E4(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_158BCC(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if ((v2 & 0x80000000) == 0)
  {
    unint64_t v4 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(a1[1] - *a1) >> 3);
    for (unint64_t i = (int)v2; i < v4; --v4)
    {
      uint64_t v6 = a1[1];
      int v7 = *(_DWORD *)(v6 - 56);
      v12[1] = v7;
      uint64_t v8 = *(void *)(v6 - 48);
      uint64_t v13 = v8;
      int v14 = *(_DWORD *)(v6 - 40);
      uint64_t v15 = *(void *)(v6 - 32);
      id v9 = *(std::__shared_weak_count **)(v6 - 24);
      uint64_t v16 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      id v10 = *(id *)(v6 - 16);
      id v17 = v10;
      int v18 = *(_DWORD *)(v6 - 8);
      a1[1] = sub_1558F0(a1[1] - 56);
      v12[0] = v7;
      uint64_t v11 = (uint64_t *)sub_270E0(a1 + 3, (unsigned __int16 *)v12);
      if (v11)
      {
        if (v8 == -1) {
          sub_34E00(a1 + 3, v11);
        }
        else {
          v11[3] = v8;
        }
      }

      if (v9) {
        sub_123E4(v9);
      }
    }
  }
}

void sub_158CFC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1558F0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_159A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_159A2C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _loadPlayerWithAsset:v3];
}

void sub_159FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_159FD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = *(void **)(a1 + 40);
  unint64_t v4 = *(void **)(a1 + 32);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_15A3C4;
  void v26[3] = &unk_2566E8;
  id v27 = v3;
  id v28 = WeakRetained;
  [v4 enumerateObjectsUsingBlock:v26];
  if ([*(id *)(a1 + 40) isPlayable])
  {
    unint64_t v5 = +[AVPlayerItem playerItemWithAsset:*(void *)(a1 + 40)];
    memset(&buf, 0, sizeof(buf));
    if (WeakRetained) {
      [WeakRetained lastPlaybackTime];
    }
    CMTime time1 = buf;
    long long v12 = *(_OWORD *)&kCMTimeZero.value;
    *(_OWORD *)&time2.value = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    time2.CMTimeEpoch epoch = epoch;
    if (CMTimeCompare(&time1, &time2) >= 1)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_15A5A4;
      v21[3] = &unk_256710;
      CMTime v22 = buf;
      v21[4] = WeakRetained;
      CMTime time1 = buf;
      *(_OWORD *)&time2.value = v12;
      time2.CMTimeEpoch epoch = epoch;
      *(_OWORD *)locatiouint64_t n = v12;
      CMTimeEpoch v20 = epoch;
      [v5 seekToTime:&time1 toleranceBefore:&time2 toleranceAfter:location completionHandler:v21];
    }
    memset(&time1, 0, sizeof(time1));
    CMTimeMake(&time1, 1000, 1000);
    objc_initWeak(location, WeakRetained);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_15A69C;
    v17[3] = &unk_256738;
    objc_copyWeak(&v18, location);
    v17[4] = *(void *)(a1 + 48);
    CMTime time2 = time1;
    int v7 = [WeakRetained addPeriodicTimeObserverForInterval:&time2 queue:0 usingBlock:v17];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15A738;
    block[3] = &unk_252678;
    block[4] = WeakRetained;
    id v14 = v5;
    uint64_t v8 = *(void *)(a1 + 48);
    id v15 = v7;
    uint64_t v16 = v8;
    id v9 = v7;
    id v10 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v11 = TUIVideoLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)WeakRetained;
      _os_log_impl(&def_141F14, v11, OS_LOG_TYPE_DEFAULT, "%@ : Video asset is not playable...", (uint8_t *)&buf, 0xCu);
    }

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    void v25[2] = sub_15A598;
    v25[3] = &unk_251990;
    v25[4] = WeakRetained;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v25);
  }
}

void sub_15A3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_15A3C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void **)(a1 + 32);
  id v14 = 0;
  unint64_t v5 = (char *)[v4 statusOfValueForKey:v3 error:&v14];
  id v6 = v14;
  if (v5 == (unsigned char *)&def_141F14 + 3)
  {
    int v7 = TUIVideoLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)CMTime buf = 138412546;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&def_141F14, v7, OS_LOG_TYPE_DEFAULT, "%@ : Error loading key: %@", buf, 0x16u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15A524;
    block[3] = &unk_251828;
    id v9 = v3;
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = v9;
    uint64_t v13 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_15A524(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"duration"])
  {
    uint64_t v2 = 1;
  }
  else
  {
    id result = [*(id *)(a1 + 32) isEqualToString:@"playable"];
    if (!result) {
      return result;
    }
    uint64_t v2 = 2;
  }
  unint64_t v4 = *(void **)(a1 + 40);

  return [v4 setFailureReason:v2];
}

id sub_15A598(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFailureReason:3];
}

id sub_15A5A4(uint64_t a1)
{
  uint64_t v2 = TUIVideoLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    CMTimeValue v3 = *(void *)(a1 + 32);
    CMTime time = *(CMTime *)(a1 + 40);
    Float64 Seconds = CMTimeGetSeconds(&time);
    LODWORD(time.value) = 138412546;
    *(CMTimeValue *)((char *)&time.value + 4) = v3;
    LOWORD(time.flags) = 2048;
    *(Float64 *)((char *)&time.flags + 2) = Seconds;
    _os_log_impl(&def_141F14, v2, OS_LOG_TYPE_DEFAULT, "%@ : Did restore time to: %f", (uint8_t *)&time, 0x16u);
  }

  unint64_t v5 = *(void **)(a1 + 32);
  long long v7 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  return [v5 setLastPlaybackTime:&v7];
}

void sub_15A69C(uint64_t a1, CMTime *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((*(_WORD *)(*(void *)(a1 + 32) + 16) & 4) != 0)
  {
    CMTime v7 = *a2;
    double Seconds = CMTimeGetSeconds(&v7);
    id v6 = [WeakRetained delegate];
    [v6 player:WeakRetained didPlayToTime:Seconds];
  }
}

void sub_15A738(uint64_t a1)
{
  [*(id *)(a1 + 32) setPlayerItem:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  CMTimeValue v3 = [v2 playerItem];
  [v2 replaceCurrentItemWithPlayerItem:v3];

  [*(id *)(a1 + 32) setTimeObserver:*(void *)(a1 + 48)];
  unint64_t v4 = [*(id *)(a1 + 32) playbackChecks];
  [v4 setAssetKeysLoaded:1];

  unint64_t v5 = +[AVAudioSession sharedInstance];
  [v5 setCategory:AVAudioSessionCategoryPlayback withOptions:1 error:0];

  if ((*(_WORD *)(*(void *)(a1 + 56) + 16) & 0x10) != 0)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 playerDidLoadPlayerItem:*(void *)(a1 + 32)];
  }
}

void sub_15AE74(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[21])
  {
    [v2 setState:6];
  }
  else
  {
    [v2 setState:7];
    [*(id *)(a1 + 32) pause];
  }
  CMTimeValue v3 = *(void **)(a1 + 32);
  long long v10 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [v3 seekToTime:&v10];
  unint64_t v4 = *(_WORD **)(a1 + 32);
  if ((v4[8] & 2) != 0)
  {
    unint64_t v5 = [v4 currentItem];
    id v6 = v5;
    if (v5) {
      [v5 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);

    uint64_t v8 = [*(id *)(a1 + 32) delegate];
    [v8 playerDidPlayToEnd:*(void *)(a1 + 32) mediaTimePlayed:Seconds];
  }
}

id sub_15AFD8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id result = *(id *)(v2 + 64);
  if (result)
  {
    if ((*(_WORD *)(v2 + 16) & 8) != 0)
    {
      [result currentTime];
      double Seconds = CMTimeGetSeconds(&time);
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
      [WeakRetained player:*(void *)(a1 + 32) didStallPlaybackAtTime:Seconds];

      return [*(id *)(a1 + 32) setState:8];
    }
  }
  return result;
}

void sub_15B10C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) name];

  if (v2 == AVPlayerItemFailedToPlayToEndTimeErrorKey)
  {
    id v6 = TUIVideoLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      int v16 = 138412290;
      uint64_t v17 = v15;
      _os_log_impl(&def_141F14, v6, OS_LOG_TYPE_DEFAULT, "%@ : Failed to play video to end", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    NSNotificationName v3 = [*(id *)(a1 + 32) name];

    if (v3 != AVPlayerItemNewErrorLogEntryNotification) {
      return;
    }
    uint64_t v4 = objc_opt_class();
    unint64_t v5 = [*(id *)(a1 + 32) object];
    id v6 = TUIDynamicCast(v4, v5);

    if (v6)
    {
      CMTime v7 = [v6 errorLog];
      uint64_t v8 = [v7 events];
      id v9 = [v8 lastObject];

      long long v10 = TUIVideoLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        id v12 = [v9 errorStatusCode];
        uint64_t v13 = [v9 errorDomain];
        id v14 = [v9 errorComment];
        int v16 = 138413058;
        uint64_t v17 = v11;
        __int16 v18 = 2048;
        id v19 = v12;
        __int16 v20 = 2112;
        unsigned int v21 = v13;
        __int16 v22 = 2112;
        int v23 = v14;
        _os_log_impl(&def_141F14, v10, OS_LOG_TYPE_DEFAULT, "%@ : Playback error occured: code: %li, domain: %@, comment: %@", (uint8_t *)&v16, 0x2Au);
      }
      [*(id *)(a1 + 40) setFailureReason:4];
    }
  }
}

void sub_15BD1C(id a1)
{
  uint64_t v1 = (void *)qword_2DF880;
  qword_2DF880 = (uint64_t)&off_266398;
}

void sub_15BDA0(id a1)
{
  uint64_t v1 = (void *)qword_2DF890;
  qword_2DF890 = (uint64_t)&off_2663B0;
}

void sub_15BE28(id a1)
{
  uint64_t v1 = (void *)qword_2DF8A0;
  qword_2DF8A0 = (uint64_t)&off_2663C8;
}

void sub_15C3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_15C444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15C4D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_15C694(id a1)
{
  uint64_t v1 = +[TUIAttributeSet supportedAttributesSize];
  id v2 = [v1 mutableCopy];

  v6[0] = @"select-index";
  v6[1] = @"color";
  NSNotificationName v3 = +[NSArray arrayWithObjects:v6 count:2];
  [v2 addAttributesFromArray:v3];

  id v4 = [v2 copy];
  unint64_t v5 = (void *)qword_2DF8B0;
  qword_2DF8B0 = (uint64_t)v4;
}

void sub_15C768(_Unwind_Exception *a1)
{
  NSNotificationName v3 = v2;

  _Unwind_Resume(a1);
}

void sub_15C80C(id a1)
{
  CFStringRef v4 = @"binding";
  uint64_t v1 = +[NSArray arrayWithObjects:&v4 count:1];
  uint64_t v2 = +[TUIAttributeSet setWithArray:v1];
  NSNotificationName v3 = (void *)qword_2DF8C0;
  qword_2DF8C0 = v2;
}

void sub_15C8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15C9D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15CAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_15CD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21)
{
  objc_destroyWeak(v23);
  objc_destroyWeak((id *)(v26 - 88));

  _Unwind_Resume(a1);
}

id sub_15CE38(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v8 = [WeakRetained enabled];
  id v9 = objc_loadWeakRetained((id *)(a1 + 72));
  long long v10 = [v9 identifier];
  uint64_t v11 = +[TUISegmentedControlView renderModelWithStates:v4 actionHandler:v5 viewState:v6 enabled:v8 identifier:v10 name:*(void *)(a1 + 48) selectIndex:*(void *)(a1 + 80) segments:*(void *)(a1 + 56) tintColor:*(void *)(a1 + 64)];

  return v11;
}

void sub_15CF20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15CFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_15D08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15D134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15D294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_15D35C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeRenderOverride:a2];
}

void sub_15D414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15D6C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  _Unwind_Resume(a1);
}

id sub_15D718(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeRenderOverride:a2];
}

void sub_15D728(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = [*(id *)(**(void **)(a1 + 48) + 40 * a2 + 32) tui_identifierByAppendingString:@"cell"];
  CMTime v7 = +[TUIRenderReferenceQuery queryWithUUID:v4 uid:v5 identifier:v6];
  id v8 = +[TUIRenderReferenceOverride overrideWithQuery:v7 alpha:0.0];

  [*(id *)(*(void *)(a1 + 32) + 80) addRenderOverride:v8];
  [*(id *)(a1 + 40) addObject:v8];
}

void sub_15D80C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15D838(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = [*(id *)(**(void **)(a1 + 48) + 40 * a2 + 32) tui_identifierByAppendingString:@"divider"];
  CMTime v7 = +[TUIRenderReferenceQuery queryWithUUID:v4 uid:v5 identifier:v6];
  id v8 = +[TUIRenderReferenceOverride overrideWithQuery:v7 alpha:0.0];

  [*(id *)(*(void *)(a1 + 32) + 80) addRenderOverride:v8];
  [*(id *)(a1 + 40) addObject:v8];
}

void sub_15D91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_15D948(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) layoutIfNeeded];
}

void sub_15D9BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = a2;
  id v8 = *(void **)a1;
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= a4)
  {
    if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a1 + 8) - (void)v8) >> 3) >= a4)
    {
      sub_9739C(a2, a3, (uint64_t)v8);
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)(a1 + 8);
      if (v19 != v17)
      {
        do
        {
          uint64_t v20 = v19 - 40;

          uint64_t v19 = v20;
        }
        while (v20 != v18);
      }
      *(void *)(a1 + 8) = v18;
    }
    else
    {
      uint64_t v13 = a2 + 8 * ((uint64_t)(*(void *)(a1 + 8) - (void)v8) >> 3);
      sub_9739C(a2, v13, (uint64_t)v8);
      uint64_t v14 = *(void *)(a1 + 8);
      if (v13 != a3)
      {
        uint64_t v15 = *(void *)(a1 + 8);
        do
        {
          long long v16 = *(_OWORD *)(v13 + 16);
          *(_OWORD *)uint64_t v15 = *(_OWORD *)v13;
          *(_OWORD *)(v15 + 16) = v16;
          *(void *)(v15 + 32) = *(id *)(v13 + 32);
          v14 += 40;
          v13 += 40;
          v15 += 40;
        }
        while (v13 != a3);
      }
      *(void *)(a1 + 8) = v14;
    }
  }
  else
  {
    sub_15DB54((void **)a1);
    if (a4 > 0x666666666666666) {
      sub_4484();
    }
    unint64_t v9 = 0x999999999999999ALL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v9 <= a4) {
      unint64_t v9 = a4;
    }
    if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= 0x333333333333333) {
      unint64_t v10 = 0x666666666666666;
    }
    else {
      unint64_t v10 = v9;
    }
    sub_15DBC0((void *)a1, v10);
    uint64_t v11 = *(void *)(a1 + 8);
    while (v6 != a3)
    {
      long long v12 = *(_OWORD *)(v6 + 16);
      *(_OWORD *)uint64_t v11 = *(_OWORD *)v6;
      *(_OWORD *)(v11 + 16) = v12;
      *(void *)(v11 + 32) = *(id *)(v6 + 32);
      v11 += 40;
      v6 += 40;
    }
    *(void *)(a1 + 8) = v11;
  }
}

void sub_15DB54(void **a1)
{
  uint64_t v1 = (id *)*a1;
  if (*a1)
  {
    uint64_t v3 = (id *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        uint64_t v5 = v3 - 5;

        uint64_t v3 = v5;
      }
      while (v5 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *sub_15DBC0(void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    sub_4484();
  }
  id result = (char *)sub_69ED0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

id TUIElementStateRenderModelMapCopyForInitialAppearanceWithFlags(void *a1, uint64_t a2)
{
  return sub_15DC20(a1, a2, &stru_2568C0);
}

id sub_15DC20(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_15FEA0;
  _DWORD v12[3] = &unk_256958;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v13 = v7;
  id v14 = v5;
  uint64_t v15 = a2;
  id v8 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  unint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

TUIRenderModelSubviews *__cdecl sub_15DD20(id a1, TUIRenderModelSubviews *a2, unint64_t a3)
{
  id v3 = [(TUIRenderModelSubviews *)a2 copyForInitialAppearanceWithFlags:a3];

  return (TUIRenderModelSubviews *)v3;
}

id TUIElementStateRenderModelMapCopyForFinalAppearanceWithFlags(void *a1, uint64_t a2)
{
  return sub_15DC20(a1, a2, &stru_2568E0);
}

TUIRenderModelSubviews *__cdecl sub_15DD58(id a1, TUIRenderModelSubviews *a2, unint64_t a3)
{
  id v3 = [(TUIRenderModelSubviews *)a2 copyForFinalAppearanceWithFlags:a3];

  return (TUIRenderModelSubviews *)v3;
}

id sub_15E158(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v5;
  v7[2] = *(_OWORD *)(a1 + 72);
  return [a3 appendResourcesToCollector:v4 transform:v7];
}

id sub_15E29C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 72);
  v9[0] = *(_OWORD *)(a1 + 56);
  v9[1] = v7;
  v9[2] = *(_OWORD *)(a1 + 88);
  return [a3 appendReferencesToCollector:v4 transform:v9 query:v5 liveTransformResolver:v6];
}

void sub_15FEA0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  long long v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  id v8 = a2;
  v7(v5, a3, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v8];
}

void sub_15FF8C(id a1)
{
  uint64_t v1 = +[TUIAttributeSet supportedAttributesSize];
  id v2 = [v1 mutableCopy];

  v6[0] = @"insets";
  v6[1] = @"background-color";
  void v6[2] = @"continuous-corners";
  void v6[3] = @"corner-radius";
  v6[4] = @"shadow-color";
  v6[5] = @"shadow-offset";
  v6[6] = @"shadow-radius";
  v6[7] = @"shadow-opacity";
  v6[8] = @"border-width";
  v6[9] = @"border-color";
  v6[10] = @"clips-to-bounds";
  v6[11] = @"blend-mode";
  id v3 = +[NSArray arrayWithObjects:v6 count:12];
  [v2 addAttributesFromArray:v3];

  id v4 = [v2 copy];
  uint64_t v5 = (void *)qword_2DF8D0;
  qword_2DF8D0 = (uint64_t)v4;
}

unint64_t TUIFeedIdentifierGenerate()
{
  return atomic_fetch_add(&qword_2DF8E0, 1uLL);
}

id TUIDefaultLog()
{
  if (qword_2DF8F0 != -1) {
    dispatch_once(&qword_2DF8F0, &stru_256998);
  }
  v0 = (void *)qword_2DF8E8;

  return v0;
}

void sub_160B40(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI");
  id v2 = (void *)qword_2DF8E8;
  qword_2DF8E8 = (uint64_t)v1;
}

id TUIInstallBundleLog()
{
  if (qword_2DF900 != -1) {
    dispatch_once(&qword_2DF900, &stru_2569B8);
  }
  v0 = (void *)qword_2DF8F8;

  return v0;
}

void sub_160BD8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI.BundleInstall");
  id v2 = (void *)qword_2DF8F8;
  qword_2DF8F8 = (uint64_t)v1;
}

id TUIInstantiationLog()
{
  if (qword_2DF910 != -1) {
    dispatch_once(&qword_2DF910, &stru_2569D8);
  }
  v0 = (void *)qword_2DF908;

  return v0;
}

void sub_160C70(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI.Instantiation");
  id v2 = (void *)qword_2DF908;
  qword_2DF908 = (uint64_t)v1;
}

id TUILayoutLog()
{
  if (qword_2DF920 != -1) {
    dispatch_once(&qword_2DF920, &stru_2569F8);
  }
  v0 = (void *)qword_2DF918;

  return v0;
}

void sub_160D08(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI.Layout");
  id v2 = (void *)qword_2DF918;
  qword_2DF918 = (uint64_t)v1;
}

id TUIVideoLog()
{
  if (qword_2DF930 != -1) {
    dispatch_once(&qword_2DF930, &stru_256A18);
  }
  v0 = (void *)qword_2DF928;

  return v0;
}

void sub_160DA0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI.Video");
  id v2 = (void *)qword_2DF928;
  qword_2DF928 = (uint64_t)v1;
}

id TUITransactionLog()
{
  if (qword_2DF940 != -1) {
    dispatch_once(&qword_2DF940, &stru_256A38);
  }
  v0 = (void *)qword_2DF938;

  return v0;
}

void sub_160E38(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI.Transaction");
  id v2 = (void *)qword_2DF938;
  qword_2DF938 = (uint64_t)v1;
}

id TUIImageCacheLog()
{
  if (qword_2DF950 != -1) {
    dispatch_once(&qword_2DF950, &stru_256A58);
  }
  v0 = (void *)qword_2DF948;

  return v0;
}

void sub_160ED0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI.ImageCache");
  id v2 = (void *)qword_2DF948;
  qword_2DF948 = (uint64_t)v1;
}

id TUIHostingLog()
{
  if (qword_2DF960 != -1) {
    dispatch_once(&qword_2DF960, &stru_256A78);
  }
  v0 = (void *)qword_2DF958;

  return v0;
}

void sub_160F68(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI.Hosting");
  id v2 = (void *)qword_2DF958;
  qword_2DF958 = (uint64_t)v1;
}

id TUIViewUpdateLog()
{
  if (qword_2DF970 != -1) {
    dispatch_once(&qword_2DF970, &stru_256A98);
  }
  v0 = (void *)qword_2DF968;

  return v0;
}

void sub_161000(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI.ViewUpdate");
  id v2 = (void *)qword_2DF968;
  qword_2DF968 = (uint64_t)v1;
}

id TUILinkEntityActionLog()
{
  if (qword_2DF980 != -1) {
    dispatch_once(&qword_2DF980, &stru_256AB8);
  }
  v0 = (void *)qword_2DF978;

  return v0;
}

void sub_161098(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI.LinkEntityAction");
  id v2 = (void *)qword_2DF978;
  qword_2DF978 = (uint64_t)v1;
}

id TUILinkEntityObserverLog()
{
  if (qword_2DF990 != -1) {
    dispatch_once(&qword_2DF990, &stru_256AD8);
  }
  v0 = (void *)qword_2DF988;

  return v0;
}

void sub_161130(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI.LinkEntityObserver");
  id v2 = (void *)qword_2DF988;
  qword_2DF988 = (uint64_t)v1;
}

id TUIRenderModelLog()
{
  if (qword_2DF9A0 != -1) {
    dispatch_once(&qword_2DF9A0, &stru_256AF8);
  }
  v0 = (void *)qword_2DF998;

  return v0;
}

void sub_1611C8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI.RenderModel");
  id v2 = (void *)qword_2DF998;
  qword_2DF998 = (uint64_t)v1;
}

id TUIActionLog()
{
  if (qword_2DF9B0 != -1) {
    dispatch_once(&qword_2DF9B0, &stru_256B18);
  }
  v0 = (void *)qword_2DF9A8;

  return v0;
}

void sub_161260(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "TemplateUI.Action");
  id v2 = (void *)qword_2DF9A8;
  qword_2DF9A8 = (uint64_t)v1;
}

void sub_162B38(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat right = UIEdgeInsetsZero.right;
    [*(id *)(a1 + 32) scopeBarContentSize];
    bottouint64_t m = v4;
    uint64_t v6 = *(void **)(a1 + 32);
    double top = UIEdgeInsetsZero.top;
    double v8 = left;
    double v9 = right;
    uint64_t v10 = 4;
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 32);
    double top = UIEdgeInsetsZero.top;
    double v8 = UIEdgeInsetsZero.left;
    bottouint64_t m = UIEdgeInsetsZero.bottom;
    double v9 = UIEdgeInsetsZero.right;
    uint64_t v10 = 0;
  }
  [v6 _setOverrideContentInsets:v10 forRectEdges:top, v8, bottom, v9];
  [*(id *)(a1 + 32) sizeToFit];
  [*(id *)(a1 + 32) layoutIfNeeded];
  uint64_t v11 = [*(id *)(a1 + 32) superview];
  [v11 sizeToFit];

  id v12 = [*(id *)(a1 + 32) superview];
  [v12 layoutIfNeeded];
}

uint64_t sub_162C18(uint64_t a1)
{
  char v2 = *(unsigned char *)(a1 + 48);
  double v3 = 0.7;
  if (!v2) {
    double v3 = 0.0;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_162CD0;
  v5[3] = &unk_252AC0;
  v5[4] = *(void *)(a1 + 32);
  char v6 = v2;
  +[UIView addKeyframeWithRelativeStartTime:v5 relativeDuration:v3 animations:0.3];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_162CD0(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:v1];
}

void *sub_162CF8(void *result)
{
  int v1 = *((unsigned __int8 *)result + 40);
  uint64_t v2 = result[4];
  if (v1 == *(unsigned __int8 *)(v2 + 9)) {
    return [*(id *)(v2 + 16) setHidden:v1 == 0];
  }
  return result;
}

id sub_163AD8(uint64_t a1, void *a2)
{
  id result = [a2 isCancelled];
  if ((result & 1) == 0)
  {
    double v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    return [v4 setShowsScopeBar:v5 animated:1];
  }
  return result;
}

void sub_163EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_163EF0(uint64_t *a1, uint64_t *a2)
{
  if (a1 != a2)
  {
    uint64_t v4 = *a2;
    uint64_t v3 = a2[1];
    if (v3) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v5 = (std::__shared_weak_count *)a1[1];
    *a1 = v4;
    a1[1] = v3;
    if (v5) {
      sub_123E4(v5);
    }
  }
  return a1;
}

void sub_164028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_164120(id a1)
{
  CFStringRef v4 = @"n";
  int v1 = +[NSArray arrayWithObjects:&v4 count:1];
  uint64_t v2 = +[TUIAttributeSet setWithArray:v1];
  uint64_t v3 = (void *)qword_2DF9B8;
  qword_2DF9B8 = v2;
}

void sub_164624(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_alloc_init(TUIButtonStateBuilder);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  CFStringRef v4 = [(TUIButtonStateBuilder *)v3 finalizeButtonStateModelWithContext:*(void *)(a1 + 32)];
  if (v4) {
    [*(id *)(a1 + 40) addModel:v4 forState:v5];
  }
}

void sub_164934(id a1)
{
  int v1 = +[TUIAttributeSet supportedAttributesSizeAndIntrinsic];
  id v2 = [v1 mutableCopy];

  uint64_t v3 = +[TUIAttributeSet supportedAttributesTextStyling];
  [v2 unionSet:v3];

  v7[0] = @"color";
  v7[1] = @"kind";
  v7[2] = @"instance";
  _OWORD v7[3] = @"parameters";
  CFStringRef v4 = +[NSArray arrayWithObjects:v7 count:4];
  [v2 addAttributesFromArray:v4];

  id v5 = [v2 copy];
  char v6 = (void *)qword_2DF9C8;
  qword_2DF9C8 = (uint64_t)v5;
}

void sub_1650EC(uint64_t a1, void *a2)
{
  id v56 = a2;
  uint64_t v3 = [v56 pinningLiveTransform];
  CFStringRef v4 = (char *)[v3 pinPosition];
  [v56 defaultPosition];
  double v6 = v5;
  [v56 defaultPosition];
  double v8 = v7;
  switch((unint64_t)v4)
  {
    case 0uLL:
      double v11 = 0.5;
      double v12 = *(double *)(a1 + 48) + *(double *)(a1 + 64) * 0.5;
      [v3 size];
      double v6 = v12 - v13 * 0.5;
      double v14 = *(double *)(a1 + 56);
      double v15 = *(double *)(a1 + 72);
      goto LABEL_17;
    case 1uLL:
      [v56 sectionOffset];
      if (v16 <= 0.0)
      {
        double v11 = 0.5;
        double v42 = *(double *)(a1 + 48) + (*(double *)(a1 + 64) - *(double *)(a1 + 80)) * 0.5;
        [v3 size];
        double v6 = v42 - v43 * 0.5;
        double v14 = *(double *)(a1 + 56);
        double v15 = *(double *)(a1 + 72) - *(double *)(a1 + 88);
LABEL_17:
        double v44 = v14 + v15 * v11;
        [v3 size];
        double v8 = v44 - v45 * v11;
      }
      else
      {
        double v18 = *(double *)(a1 + 80);
        double v17 = *(double *)(a1 + 88);
        double v20 = *(double *)(a1 + 96);
        double v19 = *(double *)(a1 + 104);
        [v3 size];
        double v22 = v19 - v21;
        [v56 sectionOffset];
        double v24 = v22 - v23;
        [v3 size];
        double v26 = v20 - v25;
        [v56 sectionOffset];
        double v28 = v26 - v27;
        [v56 sectionOffset];
        double v30 = v29 + (v17 + v24) * 0.5;
        [v56 sectionOffset];
        double v6 = v31 + (v18 + v28) * 0.5;
        [*(id *)(*(void *)(a1 + 32) + 24) size];
        double v33 = v32;
        [v3 size];
        if (v33 - v34 >= v30) {
          double v8 = v33 - v34;
        }
        else {
          double v8 = v30;
        }
      }
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
      double v9 = *(double *)(a1 + 80) + *(double *)(a1 + 96) * 0.5;
      [v3 size];
      double v6 = v9 - v10 * 0.5;
      if (v4 == (unsigned char *)&dword_4 + 2)
      {
        if (*(unsigned char *)(a1 + 112))
        {
          double v35 = *(double *)(a1 + 88);
          double v36 = *(double *)(a1 + 104);
        }
        else
        {
          double v35 = *(double *)(a1 + 56);
          double v36 = *(double *)(a1 + 72);
        }
        double v46 = v35 + v36;
        [v3 size];
        float v48 = v46 - v47;
        double v8 = ceilf(v48);
      }
      else if (v4 == (unsigned char *)&dword_4 + 1)
      {
        [*(id *)(*(void *)(a1 + 32) + 24) size];
        double v38 = v37;
        [v3 size];
        double v8 = v38 - v39;
        double v40 = *(double *)(a1 + 88) + *(double *)(a1 + 104);
        [v3 size];
        if (v40 - v41 >= v8) {
          double v8 = v40 - v41;
        }
      }
      else if (v4 == (unsigned char *)&def_141F14 + 3)
      {
        double v8 = *(double *)(a1 + 88);
      }
      break;
    default:
      break;
  }
  [v56 currentOffset];
  if (v50 != v6 || v49 != v8)
  {
    [v56 setCurrentOffset:v6, v8];
    uint64_t v52 = [*(id *)(*(void *)(a1 + 32) + 24) liveTransformViewInvalidationMap];
    uint64_t v53 = [v52 objectForKey:v3];

    uint64_t v54 = *(void **)(a1 + 40);
    uint64_t v55 = [v53 allObjects];
    [v54 invalidateIndexPaths:v55];
  }
}

void sub_1656BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_165784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_165794(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
    id v2 = [*(id *)(a1 + 40) prebuiltTemplates];
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_165850;
    v3[3] = &unk_256D40;
    v3[4] = *(void *)(a1 + 32);
    [v2 enumerateKeysAndObjectsUsingBlock:v3];
  }
}

void sub_165840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_165850(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  double v5 = +[NSURLComponents componentsWithURL:a2 resolvingAgainstBaseURL:1];
  double v6 = [v5 path];
  double v7 = [v6 stringByStandardizingPath];
  [v5 setPath:v7];

  double v8 = [v5 URL];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v9 forKeyedSubscript:v8];
}

void sub_165914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16594C()
{
}

void sub_165A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_165A18(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
    id v2 = [*(id *)(a1 + 40) prebuiltTemplates];
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_165AD4;
    v3[3] = &unk_256D40;
    v3[4] = *(void *)(a1 + 32);
    [v2 enumerateKeysAndObjectsUsingBlock:v3];
  }
}

void sub_165AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_165AD4(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  double v5 = +[NSURLComponents componentsWithURL:a2 resolvingAgainstBaseURL:1];
  double v6 = [v5 path];
  double v7 = [v6 stringByStandardizingPath];
  [v5 setPath:v7];

  double v8 = [v5 URL];
  id v9 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v8];

  if (v9 == v10) {
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:0 forKeyedSubscript:v8];
  }
}

void sub_165BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_165C74(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v2 removeAllObjects];
}

void sub_165D2C(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  int v1 = [*(id *)(*(void *)(a1 + 32) + 16) objectEnumerator];
  id v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    do
    {
      for (unint64_t i = 0; i != v2; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        double v5 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        double v6 = [v5 url];
        double v7 = [v6 lastPathComponent];
        NSLog(@"Package: %@ -> %@", v7, v5);
      }
      id v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v2);
  }
}

void sub_165E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_166048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_166094(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1660A4(uint64_t a1)
{
}

void sub_1660AC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  CFStringRef v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) && *(unsigned char *)(a1 + 64))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = *(id *)(*(void *)(a1 + 32) + 24);
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v10 = [v9 lastPathComponent];
          long long v11 = [*(id *)(a1 + 48) lastPathComponent];
          unsigned int v12 = [v10 isEqualToString:v11];

          if (v12)
          {
            uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v9];
            uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
            double v15 = *(void **)(v14 + 40);
            *(void *)(v14 + 40) = v13;

            goto LABEL_13;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

void sub_166250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1670EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16731C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_167B78(uint64_t a1, char a2)
{
  id v4 = objc_alloc_init((Class)BCULayerRenderer);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  long long v8 = *(void **)(v7 + 56);
  int v9 = BCUPriorityHigh;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_167CC8;
  v17[3] = &unk_256D98;
  v17[4] = v7;
  id v18 = *(id *)(a1 + 40);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_167CD4;
  void v14[3] = &unk_256DC0;
  char v15 = a2;
  char v16 = *(unsigned char *)(a1 + 48);
  v14[4] = *(void *)(a1 + 32);
  LODWORD(v10) = v9;
  id v11 = [v8 newOperationWithPriority:1 waitForCPUSynchronization:0 logKey:v17 renderLayer:v14 completion:v10];
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = v11;

  [*(id *)(*(void *)(a1 + 32) + 48) start];
}

id sub_167CC8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _buildRootLayerFromRenderModel:*(void *)(a1 + 40)];
}

void sub_167CD4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 CGImage])
  {
    id v5 = [objc_alloc((Class)UIImage) initWithCGImage:[v4 CGImage]];
    if (*(unsigned char *)(a1 + 40)) {
      id v6 = [objc_alloc((Class)NSError) initWithDomain:@"TUIFeedRendererError" code:0 userInfo:0];
    }
    else {
      id v6 = 0;
    }
    if (*(unsigned char *)(a1 + 41))
    {
      id v7 = [objc_alloc((Class)NSError) initWithDomain:@"TUIFeedRendererError" code:1 userInfo:0];

      id v6 = v7;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_167E34;
    block[3] = &unk_252320;
    void block[4] = *(void *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    id v8 = v6;
    id v9 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t sub_167E34(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1[4] + 32) + 16))(*(void *)(a1[4] + 32), a1[5], a1[6]);
}

void sub_167FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_168004(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_168014(uint64_t a1)
{
}

void sub_16801C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(TUIRenderModelLayerBuilder);
  id v5 = [TUIContainerLayerConfig alloc];
  [v3 size];
  id v6 = -[TUIContainerLayerConfig initWithSize:](v5, "initWithSize:");
  id v7 = [TUIRenderModelLayer alloc];
  id v13 = v3;
  id v8 = +[NSArray arrayWithObjects:&v13 count:1];
  id v9 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:](v7, "initWithSubmodels:config:erasableInsets:", v8, v6, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  [(TUIRenderModelLayerBuilder *)v4 setModel:v9];
  double v10 = [(TUIRenderModelLayerBuilder *)v4 layer];

  if (v10)
  {
    id v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v12 = [(TUIRenderModelLayerBuilder *)v4 layer];
    [v11 addSublayer:v12];
  }
}

uint64_t sub_168404(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_168414(uint64_t a1)
{
}

void sub_16841C(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  objc_storeStrong(v3, v2);
}

void sub_168504(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));

  if (v2 == WeakRetained)
  {
    id v4 = (id *)(*(void *)(a1 + 40) + 16);
    objc_storeWeak(v4, 0);
  }
}

id TUIErrorToString(uint64_t a1)
{
  if (qword_2DF9E0 != -1) {
    dispatch_once(&qword_2DF9E0, &stru_256E48);
  }
  id v2 = (void *)qword_2DF9D8;
  id v3 = +[NSNumber numberWithUnsignedInteger:a1];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

void sub_16874C(id a1)
{
  v3[0] = &off_267F40;
  v3[1] = &off_267F58;
  v4[0] = @"none";
  v4[1] = @"wrong-type";
  v3[2] = &off_267F70;
  v3[3] = &off_267F88;
  v4[2] = @"null-value";
  v4[3] = @"cyclic-dependency";
  v3[4] = &off_267FA0;
  void v3[5] = &off_267FB8;
  v4[4] = @"out-of-bounds";
  v4[5] = @"invalid-property";
  v3[6] = &off_267FD0;
  v3[7] = &off_267FE8;
  void v4[6] = @"undefined-constant";
  v4[7] = @"undefined-function";
  v3[8] = &off_268000;
  v3[9] = &off_268018;
  v4[8] = @"undefined-style";
  v4[9] = @"undefined-binding";
  v3[10] = &off_268030;
  v3[11] = &off_268048;
  v4[10] = @"undefined-element";
  v4[11] = @"undefined-globals";
  v3[12] = &off_268060;
  v3[13] = &off_268078;
  v4[12] = @"undefined-component";
  v4[13] = @"undefined-method";
  v3[14] = &off_268090;
  v3[15] = &off_2680A8;
  v4[14] = @"invalid-root";
  v4[15] = @"invalid-syntax";
  v3[16] = &off_2680C0;
  v3[17] = &off_2680D8;
  v4[16] = @"obsolete-syntax";
  v4[17] = @"unexpected-element";
  v3[18] = &off_2680F0;
  v3[19] = &off_268108;
  v4[18] = @"illegal-operator-on-type";
  v4[19] = @"expected-single-content-box";
  v3[20] = &off_268120;
  v3[21] = &off_268138;
  v4[20] = @"expected-start-color";
  v4[21] = @"expected-end-color";
  v3[22] = &off_268150;
  v3[23] = &off_268168;
  v4[22] = @"exception";
  v4[23] = @"unzip-exception";
  v3[24] = &off_268180;
  v3[25] = &off_268198;
  v4[24] = @"divide-by-zero";
  v4[25] = @"invalid-transform";
  v3[26] = &off_2681B0;
  v3[27] = &off_2681C8;
  v4[26] = @"invalid-float";
  v4[27] = @"invalid-params";
  v3[28] = &off_2681E0;
  v3[29] = &off_2681F8;
  v4[28] = @"invalid-instruction";
  v4[29] = @"invalid-action";
  v3[30] = &off_268210;
  v3[31] = &off_268228;
  v4[30] = @"invalid-offset-kind";
  v4[31] = @"invalid-size";
  v3[32] = &off_268240;
  v3[33] = &off_268258;
  v4[32] = @"invalid-enumeration";
  v4[33] = @"invalid-state";
  v3[34] = &off_268270;
  v3[35] = &off_268288;
  v4[34] = @"not-indexed";
  v4[35] = @"not-keyed";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:36];
  id v2 = (void *)qword_2DF9D8;
  qword_2DF9D8 = v1;
}

void sub_168DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_168E10(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [a2 layoutAncestor];
  double v32 = v9;
  double v33 = v8;
  if (v10)
  {
    do
    {
      if (objc_opt_respondsToSelector()) {
        break;
      }
      uint64_t v11 = [v10 layoutAncestor];

      double v10 = (void *)v11;
    }
    while (v11);
  }
  id v12 = v10;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained pressedScale];
  double v15 = v14;
  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  [v16 touchInsets];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  id v25 = objc_loadWeakRetained((id *)(a1 + 40));
  double v26 = [v25 identifier];
  uint64_t v27 = *(void *)(a1 + 32);
  double v28 = [v12 box];

  double v29 = [v28 identifier];
  double v30 = +[TUIPageControlView renderModelWithStateToRenderModel:pressScale:touchInsets:identifier:pointer:scrollIdentifier:kind:](TUIPageControlView, "renderModelWithStateToRenderModel:pressScale:touchInsets:identifier:pointer:scrollIdentifier:kind:", v33, v26, v27, v29, *(void *)(a1 + 48), v15, v18, v20, v22, v24);

  [v30 setAnimationGroups:v32];

  return v30;
}

void sub_168FE0(id a1)
{
  uint64_t v1 = (void *)qword_2DF9E8;
  qword_2DF9E8 = (uint64_t)&off_268848;
}

void sub_16937C(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) viewModelWithIndex:a2];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) viewModelWithIndex:a2];
  id v6 = [v4 identifier];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 identifier];
  }
  id v9 = v8;

  double v10 = TUIRenderModelLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = +[NSNumber numberWithUnsignedInteger:a2];
    id v12 = [v9 tui_identifierToString];
    id v13 = [v9 tui_identifierDescribeForDebuggingWithPackage:*(void *)(a1 + 40)];
    int v14 = 138412802;
    double v15 = v11;
    __int16 v16 = 2112;
    double v17 = v12;
    __int16 v18 = 2112;
    double v19 = v13;
    _os_log_impl(&def_141F14, v10, OS_LOG_TYPE_DEFAULT, "viewIndex:%@ identifier:%@ debug:\n%@", (uint8_t *)&v14, 0x20u);
  }
}

void sub_1695DC(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[NSIndexPath tui_indexPathForRow:a2 inSection:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

id sub_16A484(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v3 = [WeakRetained navigationItem];
  uint64_t v4 = [v3 title];
  id v5 = (void *)v4;
  id v6 = @"Untitled";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  id v8 = objc_opt_new();
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_16A820;
  v36[3] = &unk_256EE0;
  id v9 = *(void **)(a1 + 40);
  v36[4] = *(void *)(a1 + 32);
  id v37 = v9;
  double v10 = +[UIAction actionWithTitle:@"Capture feed..." image:0 identifier:0 handler:v36];
  [v8 addObject:v10];

  uint64_t v11 = objc_opt_new();
  id v12 = [*(id *)(*(void *)(a1 + 32) + 16) sections];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_16A958;
  v32[3] = &unk_256F08;
  id v13 = v11;
  id v33 = v13;
  id v14 = *(id *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v34 = v14;
  uint64_t v35 = v15;
  [v12 enumerateObjectsUsingBlock:v32];

  if ([v13 count])
  {
    __int16 v16 = +[UIMenu menuWithTitle:@"Errors" image:0 identifier:0 options:1 children:v13];
    [v8 addObject:v16];
  }
  double v17 = objc_opt_new();
  __int16 v18 = [*(id *)(*(void *)(a1 + 32) + 16) sections];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_16AB20;
  v27[3] = &unk_256FA8;
  id v28 = *(id *)(a1 + 40);
  double v19 = v7;
  uint64_t v20 = *(void *)(a1 + 32);
  double v29 = v19;
  uint64_t v30 = v20;
  id v21 = v17;
  id v31 = v21;
  [v18 enumerateObjectsUsingBlock:v27];

  if ([v21 count])
  {
    double v22 = +[UIMenu menuWithTitle:@"Entries" image:0 identifier:0 options:1 children:v21];
    [v8 addObject:v22];
  }
  id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  double v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[fid:%lu] %@", [v23 feedId], v19);

  if ([v8 count])
  {
    id v25 = +[UIMenu menuWithTitle:v24 children:v8];
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

void sub_16A820(uint64_t a1)
{
  id v2 = [TUIFeedCaptureController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v4 = [WeakRetained navigationItem];
  id v5 = [v4 title];
  id v6 = [(TUIFeedCaptureController *)v2 initWithEntry:0 title:v5];

  [*(id *)(a1 + 40) dismissMenu];
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v8 = [v7 layoutController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_16A94C;
  v10[3] = &unk_251828;
  v10[4] = *(void *)(a1 + 32);
  uint64_t v11 = v6;
  id v9 = v6;
  [v8 captureWithController:v9 completion:v10];
}

id sub_16A94C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _shareCapture:*(void *)(a1 + 40)];
}

void sub_16A958(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 errors];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v3 entry];
    id v8 = [v7 templateURL];
    id v9 = [v8 lastPathComponent];
    double v10 = [v3 errors];
    uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Errors (%lu)", v9, [v10 count]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_16AAE4;
    v15[3] = &unk_256080;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    id v16 = v12;
    uint64_t v17 = v13;
    id v18 = v3;
    id v14 = +[UIAction actionWithTitle:v11 image:0 identifier:0 handler:v15];
    [v6 addObject:v14];
  }
}

id sub_16AAE4(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissMenu];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return _[v2 _showErrorsForSection:v3];
}

void sub_16AB20(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_opt_new();
  id v7 = [v5 entry];
  id v8 = [v7 templateURL];
  uint64_t v9 = [v8 URLByDeletingPathExtension];
  double v10 = [(id)v9 lastPathComponent];

  uint64_t v11 = +[NSString stringWithFormat:@"Capture entry ..."];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_16AEE0;
  v38[3] = &unk_256F30;
  id v39 = *(id *)(a1 + 32);
  id v12 = v5;
  id v40 = v12;
  id v41 = *(id *)(a1 + 40);
  id v13 = v10;
  uint64_t v14 = *(void *)(a1 + 48);
  id v42 = v13;
  uint64_t v43 = v14;
  uint64_t v15 = +[UIAction actionWithTitle:v11 image:0 identifier:0 handler:v38];
  [v6 addObject:v15];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 24));
  uint64_t v17 = [WeakRetained debugDelegate];
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if (v9)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_16B018;
    v37[3] = &unk_256F58;
    v37[4] = *(void *)(a1 + 48);
    v37[5] = a3;
    id v18 = +[UIAction actionWithTitle:@"Update section" image:0 identifier:0 handler:v37];
    [v6 addObject:v18];
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_16B09C;
  v33[3] = &unk_256080;
  id v19 = *(id *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 48);
  id v34 = v19;
  uint64_t v35 = v20;
  id v21 = v12;
  id v36 = v21;
  double v22 = +[UIAction actionWithTitle:@"Dump model tree" image:0 identifier:0 handler:v33];
  [v6 addObject:v22];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_16B218;
  v29[3] = &unk_256080;
  id v23 = *(id *)(a1 + 32);
  uint64_t v24 = *(void *)(a1 + 48);
  id v30 = v23;
  uint64_t v31 = v24;
  id v32 = v21;
  id v25 = v21;
  double v26 = +[UIAction actionWithTitle:@"Dump layout tree" image:0 identifier:0 handler:v29];
  [v6 addObject:v26];

  uint64_t v27 = *(void **)(a1 + 56);
  id v28 = +[UIMenu menuWithTitle:v13 children:v6];
  [v27 addObject:v28];
}

void sub_16AEE0(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissMenu];
  id v2 = [TUIFeedCaptureController alloc];
  uint64_t v3 = [*(id *)(a1 + 40) entry];
  uint64_t v4 = +[NSString stringWithFormat:@"%@-%@", *(void *)(a1 + 48), *(void *)(a1 + 56)];
  id v5 = [(TUIFeedCaptureController *)v2 initWithEntry:v3 title:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 64) + 24));
  id v7 = [WeakRetained layoutController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_16B00C;
  _OWORD v9[3] = &unk_251828;
  v9[4] = *(void *)(a1 + 64);
  double v10 = v5;
  id v8 = v5;
  [v7 captureWithController:v8 completion:v9];
}

id sub_16B00C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _shareCapture:*(void *)(a1 + 40)];
}

void sub_16B018(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v2 = [WeakRetained debugDelegate];
  uint64_t v3 = +[NSIndexSet indexSetWithIndex:*(void *)(a1 + 40)];
  [v2 updateSectionsWithIndices:v3];
}

void sub_16B09C(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissMenu];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  uint64_t v3 = [WeakRetained layoutController];
  uint64_t v4 = [*(id *)(a1 + 48) entry];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_16B168;
  v5[3] = &unk_256F80;
  v5[4] = *(void *)(a1 + 40);
  [v3 dumpModelTreeForEntry:v4 completion:v5];
}

void sub_16B168(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_16B20C;
    v5[3] = &unk_251828;
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

id sub_16B20C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _shareText:*(void *)(a1 + 40)];
}

void sub_16B218(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissMenu];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  id v3 = [WeakRetained layoutController];
  uint64_t v4 = [*(id *)(a1 + 48) entry];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_16B2E4;
  v5[3] = &unk_256F80;
  v5[4] = *(void *)(a1 + 40);
  [v3 dumpLayoutTreeForEntry:v4 completion:v5];
}

void sub_16B2E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_16B388;
    v5[3] = &unk_251828;
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

id sub_16B388(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _shareText:*(void *)(a1 + 40)];
}

void sub_16B7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_16B7DC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 errors];
  id v7 = [v6 count];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

id sub_16BBF4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  if (!v3)
  {
    uint64_t v4 = [_TUIFeedSectionDebug alloc];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 24);
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 16));
    id v8 = [WeakRetained feedOverlayDebugViewController];
    uint64_t v9 = [(_TUIFeedSectionDebug *)v4 initWithRenderModel:v6 hostingViewController:v8];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 8);
    *(void *)(v10 + 8) = v9;

    id v12 = [*(id *)(*(void *)(a1 + 32) + 8) button];
    [*(id *)(a1 + 32) addSubview:v12];
    [v12 sizeToFit];

    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 8);
  }
  uint64_t v13 = *(void *)(v2 + 24);

  return [v3 setRenderModel:v13];
}

void sub_16BE5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16BF2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16C1F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16C2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16C480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_16C610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16C7E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16C904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16C964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)TUIRenderModelIdentifierInterest;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_16CA50(uint64_t a1)
{
}

void sub_16CA58(void *a1)
{
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v1 = a1;
  id v2 = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v6;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v6 != v3) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v5 + 1) + 8 * (void)v4) invalidate:v5];
        uint64_t v4 = (char *)v4 + 1;
      }
      while (v2 != v4);
      id v2 = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
    }
    while (v2);
  }
}

void sub_16CB48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16CC1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16CCA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16CD6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_16CD94(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  long long v6 = a1 + 1;
  long long v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        long long v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        long long v5 = *v8;
        long long v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      long long v5 = v8[1];
      if (!v5)
      {
        long long v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    long long v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    sub_9F5D0(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *sub_16CE50(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *id result = *(void *)a2;
  *(void *)a2 = v2;
  uint64_t v5 = result[1];
  uint64_t v4 = result[2];
  uint64_t v3 = result + 1;
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v4;
  if (result[2]) {
    id result = (uint64_t *)(*v3 + 16);
  }
  *id result = (uint64_t)v3;
  long long v6 = (void *)(*(void *)(a2 + 8) + 16);
  if (!v4) {
    long long v6 = (void *)a2;
  }
  *long long v6 = a2 + 8;
  return result;
}

void sub_16CF20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16CFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16D2C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *sub_16D2F4(uint64_t a1, char *__src, unint64_t a3)
{
  unint64_t v3 = a3;
  uint64_t v4 = __src;
  long long v6 = *(char **)(a1 + 8);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    uint64_t v13 = *(char **)a1;
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v6[-*(void *)a1] >> 3) + 1;
    if (v14 > 0xAAAAAAAAAAAAAAALL) {
      sub_4484();
    }
    uint64_t v15 = (char *)(__src - v13);
    int64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((__src - v13) >> 3);
    unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (void)v13) >> 3);
    if (2 * v17 > v14) {
      unint64_t v14 = 2 * v17;
    }
    if (v17 >= 0x555555555555555) {
      unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v18 = v14;
    }
    uint64_t v33 = a1 + 16;
    if (v18) {
      id v19 = (char *)sub_12768(a1 + 16, v18);
    }
    else {
      id v19 = 0;
    }
    double v22 = &v19[24 * v16];
    __p = v19;
    id v30 = v22;
    uint64_t v31 = v22;
    id v32 = &v19[24 * v18];
    if (v16 == v18)
    {
      if ((uint64_t)v15 < 1)
      {
        if (v13 == v4) {
          unint64_t v24 = 1;
        }
        else {
          unint64_t v24 = 2 * v16;
        }
        id v25 = (char *)sub_12768(v8, v24);
        double v22 = &v25[24 * (v24 >> 2)];
        __p = v25;
        id v30 = v22;
        id v32 = &v25[24 * v26];
        if (v19) {
          operator delete(v19);
        }
      }
      else
      {
        uint64_t v23 = v16 + 2;
        if (v16 >= -1) {
          uint64_t v23 = v16 + 1;
        }
        v22 -= 24 * (v23 >> 1);
        id v30 = v22;
      }
    }
    long long v27 = *(_OWORD *)v3;
    *((void *)v22 + 2) = *(void *)(v3 + 16);
    *(_OWORD *)double v22 = v27;
    uint64_t v31 = v22 + 24;
    uint64_t v4 = (char *)sub_16F1BC((void **)a1, (uint64_t)&__p, v4);
    if (v31 != v30) {
      uint64_t v31 = &v30[(v31 - v30 - 24) % 0x18uLL];
    }
    if (__p) {
      operator delete(__p);
    }
  }
  else if (__src == v6)
  {
    long long v21 = *(_OWORD *)a3;
    *((void *)__src + 2) = *(void *)(a3 + 16);
    *(_OWORD *)__src = v21;
    *(void *)(a1 + 8) = __src + 24;
  }
  else
  {
    unint64_t v9 = __src + 24;
    uint64_t v10 = v6 - 24;
    uint64_t v11 = *(void *)(a1 + 8);
    while (v10 < v6)
    {
      long long v12 = *(_OWORD *)v10;
      *(void *)(v11 + 16) = *((void *)v10 + 2);
      *(_OWORD *)uint64_t v11 = v12;
      v11 += 24;
      v10 += 24;
    }
    *(void *)(a1 + 8) = v11;
    if (v6 != v9) {
      memmove(__src + 24, __src, v6 - v9);
    }
    if ((unint64_t)v4 <= v3) {
      v3 += 24 * (*(void *)(a1 + 8) > v3);
    }
    long long v20 = *(_OWORD *)v3;
    *((void *)v4 + 2) = *(void *)(v3 + 16);
    *(_OWORD *)uint64_t v4 = v20;
  }
  return v4;
}

void sub_16D56C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_16D644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16D80C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16DAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_16DB08(void *a1, void *a2)
{
  id v7 = a2;
  [v7 computedTransformedSize];
  *(double *)(*(void *)(a1[4] + 8) + 24) = v3 + *(double *)(*(void *)(a1[4] + 8) + 24);
  *(double *)(*(void *)(a1[5] + 8) + 24) = fmax(*(double *)(*(void *)(a1[5] + 8) + 24), v4);
  double v5 = *(double *)(*(void *)(a1[6] + 8) + 24);
  [v7 computedHeightAbovePivot];
  *(double *)(*(void *)(a1[6] + 8) + 24) = fmax(v5, v6);
}

void sub_16DBA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16DE20(_Unwind_Exception *a1)
{
  double v6 = v5;

  _Unwind_Resume(a1);
}

void sub_16DF34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16DFDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16E200(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_16E454(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_16E638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16E74C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16E7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16E830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16E900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_16E924(uint64_t a1, void *a2)
{
  return [a2 appendLayoutsWithSpecifiedWidthModifiedToArray:*(void *)(a1 + 32)];
}

void sub_16EA44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16EB14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16EDB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16F014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void *sub_16F1BC(void **a1, uint64_t a2, char *__src)
{
  double v5 = *(void **)(a2 + 8);
  double v6 = (char *)*a1;
  id v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      long long v10 = *(_OWORD *)(v8 - 24);
      id v7 = (void *)(v9 - 24);
      *(void *)(v9 - 8) = *((void *)v8 - 1);
      *(_OWORD *)(v9 - 24) = v10;
      v8 -= 24;
      v9 -= 24;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v11 = a1[1];
  uint64_t v12 = *(void *)(a2 + 16);
  int64_t v13 = v11 - __src;
  if (v11 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v11 - __src);
    id v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v12 + v13;
  unint64_t v14 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v14;
  uint64_t v15 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v15;
  int64_t v16 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v16;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void sub_16F310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16F3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16F414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16FC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, ...)
{
  va_start(va, a16);

  sub_63800((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1704C0(id a1)
{
  uint64_t v12 = kCTFontUIFontDesignTrait;
  uint64_t v13 = kCTFontUIFontDesignSerif;
  id v1 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  CFStringRef v10 = kCTFontTraitsAttribute;
  uint64_t v11 = v1;
  CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  double v3 = CTFontDescriptorCreateWithAttributes(v2);
  if (!v3 || (double v4 = v3, (v5 = CTFontCreateWithFontDescriptor(v3, 14.0, 0)) == 0)) {
    objc_exception_throw([objc_alloc((Class)NSException) initWithName:@"TUIMissingFonts" reason:@"Can't create font for Serif-UI-Text-Regular" userInfo:0]);
  }
  double v6 = v5;
  CFArrayRef v7 = CTFontCopySupportedLanguages(v5);
  CFRelease(v6);
  CFRelease(v4);
  uint64_t v8 = +[NSSet setWithArray:v7];
  uint64_t v9 = (void *)qword_2DF9F8;
  qword_2DF9F8 = v8;
}

void sub_1706CC(id a1)
{
  v12[0] = @"ultralight";
  id v1 = +[NSNumber numberWithDouble:UIFontWeightUltraLight];
  v13[0] = v1;
  v12[1] = @"thin";
  CFDictionaryRef v2 = +[NSNumber numberWithDouble:UIFontWeightThin];
  v13[1] = v2;
  v12[2] = @"light";
  double v3 = +[NSNumber numberWithDouble:UIFontWeightLight];
  v13[2] = v3;
  _DWORD v12[3] = @"regular";
  double v4 = +[NSNumber numberWithDouble:UIFontWeightRegular];
  void v13[3] = v4;
  void v12[4] = @"medium";
  double v5 = +[NSNumber numberWithDouble:UIFontWeightMedium];
  v13[4] = v5;
  v12[5] = @"semibold";
  double v6 = +[NSNumber numberWithDouble:UIFontWeightSemibold];
  v13[5] = v6;
  v12[6] = @"bold";
  CFArrayRef v7 = +[NSNumber numberWithDouble:UIFontWeightBold];
  v13[6] = v7;
  v12[7] = @"heavy";
  uint64_t v8 = +[NSNumber numberWithDouble:UIFontWeightHeavy];
  v13[7] = v8;
  v12[8] = @"black";
  uint64_t v9 = +[NSNumber numberWithDouble:UIFontWeightBlack];
  v13[8] = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:9];
  uint64_t v11 = (void *)qword_2DFA08;
  qword_2DFA08 = v10;
}

__CFString *sub_170AD8(void *a1, void *a2, int a3)
{
  id v5 = a1;
  double v6 = v5;
  if (a3)
  {
    if (([v5 isEqualToString:@"SerifUIText-Bold"] & 1) != 0
      || ([v6 isEqualToString:@"SerifUIText-Heavy"] & 1) != 0)
    {
      goto LABEL_4;
    }
    if ([v6 isEqualToString:@"SerifUIText-Semibold"])
    {
LABEL_6:
      CFArrayRef v7 = @"System-Semibold";
      goto LABEL_26;
    }
    if ([v6 isEqualToString:@"SerifUIText-Regular"])
    {
LABEL_8:
      CFArrayRef v7 = @"System-Regular";
      goto LABEL_26;
    }
    if ([v6 isEqualToString:@"SerifUIText-Medium"])
    {
LABEL_10:
      CFArrayRef v7 = @"System-Medium";
      goto LABEL_26;
    }
    if (([v6 isEqualToString:@"SerifUIText-Bold"] & 1) != 0
      || ([v6 isEqualToString:@"BooksSerif-Bold"] & 1) != 0
      || ([v6 isEqualToString:@"BooksSerif-Heavy"] & 1) != 0)
    {
      goto LABEL_4;
    }
    if ([v6 isEqualToString:@"BooksSerif-Semibold"]) {
      goto LABEL_6;
    }
    if ([v6 isEqualToString:@"BooksSerif-Regular"]) {
      goto LABEL_8;
    }
    if ([v6 isEqualToString:@"BooksSerif-Medium"]) {
      goto LABEL_10;
    }
    if ([v6 isEqualToString:@"BooksSerif-Bold"])
    {
LABEL_4:
      CFArrayRef v7 = @"System-Bold";
LABEL_26:
      *a2 = 0x7FF8000000000000;
      goto LABEL_28;
    }
    if ((([v6 hasPrefix:@"SerifUIText"] & 1) != 0
       || ([v6 hasPrefix:@"SerifUIDisplay"] & 1) != 0
       || [v6 hasPrefix:@"BooksSerif"])
      && _TUIDeviceHasInternalInstall())
    {
      id v11 = objc_alloc((Class)NSException);
      uint64_t v12 = +[NSString stringWithFormat:@"postscriptName=%@", v6];
      id v13 = [v11 initWithName:@"TUIFontException" reason:v12 userInfo:0];

      objc_exception_throw(v13);
    }
  }
  if (![v6 hasPrefix:@"BooksSerif-"]
    || ([v6 substringFromIndex:objc_msgSend(@"BooksSerif-", "length")],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        +[NSString stringWithFormat:@"%@%@", @"SystemSerif-", v8], CFArrayRef v7 = (__CFString *)objc_claimAutoreleasedReturnValue(), v8, *a2 = 0x7FF8000000000000, !v7))
  {
    if ([v6 hasPrefix:@"SFProRounded-"])
    {
      uint64_t v9 = [v6 substringFromIndex:[@"SFProRounded-" length]];
      CFArrayRef v7 = +[NSString stringWithFormat:@"%@%@", @"SystemRounded-", v9];

      goto LABEL_26;
    }
    CFArrayRef v7 = 0;
  }
LABEL_28:

  return v7;
}

BOOL sub_170DD4()
{
  v0 = +[NSBundle mainBundle];
  id v1 = [v0 preferredLocalizations];
  CFDictionaryRef v2 = [v1 firstObject];

  BOOL v3 = +[TUIFontSpec determineUseFontFallbackFromLanguage:v2];
  return v3;
}

TUI::Graph::Ordering *TUI::Graph::Ordering::Ordering(TUI::Graph::Ordering *this, uint64_t a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  unint64_t v4 = (unint64_t)(a2 + 63) >> 6;
  size_t v5 = 8 * v4 * (a2 + 2);
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  double v6 = malloc_type_malloc(v5, 0x19739FFEuLL);
  *((void *)this + 3) = v6;
  bzero(v6, v5);
  if (a2)
  {
    uint64_t v7 = 0;
    uint64_t v8 = (void *)*((void *)this + 1);
    do
    {
      unint64_t v9 = *((void *)this + 2);
      uint64_t v10 = *((void *)this + 3) + 8 * v7 * v4;
      if ((unint64_t)v8 >= v9)
      {
        unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - *(void *)this) >> 3);
        unint64_t v12 = v11 + 1;
        if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_4484();
        }
        unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - *(void *)this) >> 3);
        if (2 * v13 > v12) {
          unint64_t v12 = 2 * v13;
        }
        if (v13 >= 0x555555555555555) {
          unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v14 = v12;
        }
        if (v14) {
          uint64_t v15 = (char *)sub_12768((uint64_t)this + 16, v14);
        }
        else {
          uint64_t v15 = 0;
        }
        int64_t v16 = &v15[24 * v11];
        *(void *)int64_t v16 = a2;
        *((void *)v16 + 1) = v10;
        *((void *)v16 + 2) = 0;
        unint64_t v18 = *(char **)this;
        unint64_t v17 = (char *)*((void *)this + 1);
        id v19 = v16;
        if (v17 != *(char **)this)
        {
          do
          {
            long long v20 = *(_OWORD *)(v17 - 24);
            *((void *)v19 - 1) = *((void *)v17 - 1);
            *(_OWORD *)(v19 - 24) = v20;
            v19 -= 24;
            v17 -= 24;
          }
          while (v17 != v18);
          unint64_t v17 = *(char **)this;
        }
        uint64_t v8 = v16 + 24;
        *(void *)this = v19;
        *((void *)this + 1) = v16 + 24;
        *((void *)this + 2) = &v15[24 * v14];
        if (v17) {
          operator delete(v17);
        }
      }
      else
      {
        *uint64_t v8 = a2;
        v8[1] = v10;
        v8[2] = 0;
        v8 += 3;
      }
      *((void *)this + 1) = v8;
      ++v7;
    }
    while (v7 != a2);
  }
  long long v21 = (void *)(*((void *)this + 3) + 8 * v4 * a2);
  *((void *)this + 6) = a2;
  *((void *)this + 7) = v21;
  uint64_t __pattern8 = -1;
  memset_pattern8(v21, &__pattern8, (unint64_t)(8 * a2 + 504) >> 6);
  uint64_t v22 = *((void *)this + 3) + 8 * (v4 + v4 * a2);
  *((void *)this + 4) = a2;
  *((void *)this + 5) = v22;
  return this;
}

void sub_172A3C(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void TUI::Graph::Ordering::~Ordering(void **this)
{
  free(this[3]);
  CFDictionaryRef v2 = *this;
  if (*this)
  {
    this[1] = v2;
    operator delete(v2);
  }
}

uint64_t *TUI::Graph::Ordering::addEdge(uint64_t *this, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *this;
  unint64_t v4 = a3 >> 6;
  uint64_t v5 = *(void *)(*this + 24 * a2 + 8);
  uint64_t v6 = *(void *)(v5 + 8 * (a3 >> 6));
  uint64_t v7 = 1 << a3;
  if ((v6 & (1 << a3)) == 0)
  {
    *(void *)(v5 + 8 * v4) = v6 | v7;
    uint64_t v8 = v3 + 24 * a3;
    uint64_t v9 = *(void *)(v8 + 16);
    *(void *)(v8 + 16) = v9 + 1;
    if (!v9)
    {
      uint64_t v10 = this[7];
      uint64_t v11 = *(void *)(v10 + 8 * v4);
      if ((v11 & v7) != 0) {
        *(void *)(v10 + 8 * v4) = v11 & ~v7;
      }
    }
  }
  return this;
}

void TUI::Graph::Ordering::solve(TUI::Graph::Ordering *this@<X0>, char **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  unint64_t v2 = *((void *)this + 6);
  unint64_t v3 = v2 + 63;
  if (v2 + 63 >= 0x40)
  {
    uint64_t v55 = (uint64_t)(a2 + 2);
    id v56 = a2;
    do
    {
      uint64_t v5 = 0;
      unint64_t v6 = v3 >> 6;
      for (unint64_t i = (unint64_t *)*((void *)this + 7); ; ++i)
      {
        unint64_t v8 = *i;
        if (*i) {
          break;
        }
        v5 -= 64;
        if (!--v6) {
          return;
        }
      }
      unint64_t v9 = __clz(__rbit64(v8));
      uint64_t v10 = v9 - v5;
      if (v9 - v5 >= v2) {
        break;
      }
      if ((v8 & (1 << v9)) != 0) {
        *unint64_t i = v8 & ~(1 << v9);
      }
      uint64_t v11 = a2[1];
      unint64_t v12 = (unint64_t)a2[2];
      if ((unint64_t)v11 >= v12)
      {
        unint64_t v14 = *a2;
        uint64_t v15 = (v11 - *a2) >> 3;
        unint64_t v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 61) {
          sub_4484();
        }
        if ((uint64_t)(v12 - (void)v14) >> 2 > v16) {
          unint64_t v16 = (uint64_t)(v12 - (void)v14) >> 2;
        }
        if (v12 - (unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v16;
        }
        if (v17)
        {
          unint64_t v18 = (char *)sub_39FA0(v55, v17);
          unint64_t v14 = *v56;
          uint64_t v11 = v56[1];
        }
        else
        {
          unint64_t v18 = 0;
        }
        id v19 = &v18[8 * v15];
        *(void *)id v19 = v10;
        unint64_t v13 = v19 + 8;
        while (v11 != v14)
        {
          uint64_t v20 = *((void *)v11 - 1);
          v11 -= 8;
          *((void *)v19 - 1) = v20;
          v19 -= 8;
        }
        *id v56 = v19;
        v56[1] = v13;
        v56[2] = &v18[8 * v17];
        if (v14) {
          operator delete(v14);
        }
      }
      else
      {
        *(void *)uint64_t v11 = v10;
        unint64_t v13 = v11 + 8;
      }
      v56[1] = v13;
      unint64_t v58 = (void *)(*(void *)this + 24 * v10);
      unint64_t v21 = *v58 + 63;
      if (v21 >= 0x40)
      {
        uint64_t v22 = 0;
        unint64_t v57 = v21 >> 6;
        do
        {
          unint64_t v23 = *(void *)(v58[1] + 8 * v22);
          uint64_t v62 = 0;
          uint64_t v63 = 0;
          uint64_t v64 = 0;
          __p = 0;
          unint64_t v60 = 0;
          uint64_t v61 = 0;
          if (v23)
          {
            uint64_t v24 = 0;
            do
            {
              unint64_t v25 = __clz(__rbit64(v23));
              uint64_t v26 = v25 + v24;
              unint64_t v27 = v25 + v24 + (v22 << 6);
              uint64_t v28 = *(void *)this + 24 * v27;
              uint64_t v29 = *(void *)(v28 + 16) - 1;
              *(void *)(v28 + 16) = v29;
              if (!v29)
              {
                unint64_t v30 = v27 >> 6;
                uint64_t v31 = *((void *)this + 7);
                uint64_t v32 = *(void *)(v31 + 8 * v30);
                if ((v32 & (1 << v26)) == 0) {
                  *(void *)(v31 + 8 * v30) = v32 | (1 << v26);
                }
              }
              unint64_t v33 = v25 + 1;
              id v34 = v63;
              if (v63 >= v64)
              {
                id v36 = (char *)v62;
                uint64_t v37 = (v63 - (unsigned char *)v62) >> 3;
                unint64_t v38 = v37 + 1;
                if ((unint64_t)(v37 + 1) >> 61) {
                  sub_4484();
                }
                uint64_t v39 = v64 - (unsigned char *)v62;
                if ((v64 - (unsigned char *)v62) >> 2 > v38) {
                  unint64_t v38 = v39 >> 2;
                }
                if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v40 = v38;
                }
                if (v40)
                {
                  id v41 = (char *)sub_39FA0((uint64_t)&v64, v40);
                  id v36 = (char *)v62;
                  id v34 = v63;
                }
                else
                {
                  id v41 = 0;
                }
                id v42 = (unint64_t *)&v41[8 * v37];
                *id v42 = v33;
                uint64_t v35 = (char *)(v42 + 1);
                while (v34 != v36)
                {
                  unint64_t v43 = *((void *)v34 - 1);
                  v34 -= 8;
                  *--id v42 = v43;
                }
                uint64_t v62 = v42;
                uint64_t v63 = v35;
                uint64_t v64 = &v41[8 * v40];
                if (v36) {
                  operator delete(v36);
                }
              }
              else
              {
                *(void *)uint64_t v63 = v33;
                uint64_t v35 = v34 + 8;
              }
              unint64_t v44 = v23 >> v25;
              unint64_t v23 = v44 >> 1;
              uint64_t v63 = v35;
              double v45 = v60;
              if (v60 >= v61)
              {
                double v47 = __p;
                uint64_t v48 = v60 - __p;
                unint64_t v49 = v48 + 1;
                if ((unint64_t)(v48 + 1) >> 61) {
                  sub_4484();
                }
                uint64_t v50 = (char *)v61 - (char *)__p;
                if (((char *)v61 - (char *)__p) >> 2 > v49) {
                  unint64_t v49 = v50 >> 2;
                }
                if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v51 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v51 = v49;
                }
                if (v51)
                {
                  uint64_t v52 = (char *)sub_39FA0((uint64_t)&v61, v51);
                  double v47 = __p;
                  double v45 = v60;
                }
                else
                {
                  uint64_t v52 = 0;
                }
                uint64_t v53 = (unint64_t *)&v52[8 * v48];
                unint64_t *v53 = v23;
                double v46 = v53 + 1;
                while (v45 != v47)
                {
                  unint64_t v54 = *--v45;
                  *--uint64_t v53 = v54;
                }
                __p = v53;
                uint64_t v61 = (unint64_t *)&v52[8 * v51];
                if (v47) {
                  operator delete(v47);
                }
              }
              else
              {
                *unint64_t v60 = v23;
                double v46 = v60 + 1;
              }
              uint64_t v24 = v26 + 1;
              unint64_t v60 = v46;
            }
            while (v44 >= 2);
            if (__p) {
              operator delete(__p);
            }
            if (v62)
            {
              uint64_t v63 = (char *)v62;
              operator delete(v62);
            }
          }
          ++v22;
        }
        while (v22 != v57);
      }
      unint64_t v2 = *((void *)this + 6);
      unint64_t v3 = v2 + 63;
      a2 = v56;
    }
    while (v2 + 63 >= 0x40);
  }
}

void sub_172EEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  uint64_t v20 = *(void **)a10;
  if (*(void *)a10)
  {
    *(void *)(a10 + 8) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

void sub_172FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_173148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1732EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17338C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1734E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17357C(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1735FC(id a1)
{
  v4[0] = @"accepts-drop";
  v4[1] = @"allow-group-blending";
  v4[2] = @"allow-hanging-punctuation";
  v4[3] = @"allow-shrink-to-fit";
  v4[4] = @"anchor-offset";
  v4[5] = @"anchor-position";
  void v4[6] = @"ax-button";
  v4[7] = @"ax-default";
  v4[8] = @"ax-disabled";
  v4[9] = @"ax-enable";
  v4[10] = @"ax-heading";
  v4[11] = @"ax-hint";
  v4[12] = @"ax-identifier";
  v4[13] = @"ax-image";
  v4[14] = @"ax-label";
  v4[15] = @"ax-toggle";
  v4[16] = @"ax-touch-container";
  v4[17] = @"ax-value";
  v4[18] = @"background-color";
  v4[19] = @"behavior";
  v4[20] = @"binding";
  v4[21] = @"blend-mode";
  v4[22] = @"border-color";
  v4[23] = @"border-width";
  v4[24] = @"bottom";
  v4[25] = @"button-role";
  v4[26] = @"calculation-mode";
  v4[27] = @"cancel-text";
  v4[28] = @"chart-type";
  v4[29] = @"clips-to-bounds";
  v4[30] = @"color";
  v4[31] = @"columns";
  v4[32] = @"continuous-corners";
  v4[33] = @"corner-radius";
  v4[34] = @"crossfades-contents";
  v4[35] = @"curve";
  void v4[36] = @"deceleration-rate";
  v4[37] = @"delay";
  v4[38] = @"direction";
  v4[39] = @"duration";
  v4[40] = @"dynamic-unique-id";
  v4[41] = @"enable-background-for-highlight-preview";
  v4[42] = @"enable-shadow-for-highlight-preview";
  v4[43] = @"enabled";
  v4[44] = @"end-color";
  v4[45] = @"end-position";
  v4[46] = @"estimated-height";
  v4[47] = @"estimated-height-above-pivot";
  v4[48] = @"estimated-width";
  v4[49] = @"fallback-color";
  v4[50] = @"fetch-delta";
  v4[51] = @"fetch-initial";
  v4[52] = @"fetch-padding";
  v4[53] = @"fetch-window";
  v4[54] = @"fill-mode";
  v4[55] = @"filter";
  v4[56] = @"font";
  v4[57] = @"halign";
  v4[58] = @"hcompressed";
  v4[59] = @"h";
  v4[60] = @"hflip-for-rtl";
  v4[61] = @"hide-ellipses";
  v4[62] = @"hspacing";
  v4[63] = @"html-tags";
  v4[64] = @"impression-data";
  v4[65] = @"insets";
  v4[66] = @"instance";
  v4[67] = @"ih";
  v4[68] = @"iw";
  v4[69] = @"kind";
  v4[70] = @"layer-contents-gravity";
  v4[71] = @"layout-direction";
  v4[72] = @"layout-mode";
  v4[73] = @"leading";
  v4[74] = @"line-balancing";
  v4[75] = @"live-transform";
  v4[76] = @"mask-color";
  v4[77] = @"max-lines";
  v4[78] = @"max-scale";
  v4[79] = @"min-lines";
  v4[80] = @"min-scale";
  v4[81] = @"n";
  v4[82] = @"name";
  v4[83] = @"menu-is-primary";
  v4[84] = @"item-type";
  v4[85] = @"observe-trigger";
  v4[86] = @"observe-trigger-delay";
  v4[87] = @"observe-trigger-value";
  v4[88] = @"on";
  v4[89] = @"opacity";
  v4[90] = @"param";
  v4[91] = @"parameters";
  v4[92] = @"play-state";
  v4[93] = @"pressed-scale";
  v4[94] = @"progress";
  v4[95] = @"progress-id";
  v4[96] = @"mode";
  v4[97] = @"paused";
  v4[98] = @"rasterize";
  v4[99] = @"rating";
  v4[100] = @"ref-id";
  v4[101] = @"ref-instance";
  v4[102] = @"render-model";
  v4[103] = @"render-outsets";
  v4[104] = @"render-transform";
  v4[105] = @"resource-instance";
  v4[106] = @"resource-kind";
  v4[107] = @"resource-load";
  v4[108] = @"resource-options";
  v4[109] = @"return-key-type";
  v4[110] = @"role";
  v4[111] = @"run-list";
  v4[112] = @"scale";
  v4[113] = @"select-index";
  v4[114] = @"shadow-color";
  v4[115] = @"shadow-offset";
  v4[116] = @"shadow-opacity";
  v4[117] = @"shadow-radius";
  v4[118] = @"should-hyphenate";
  v4[119] = @"show-cancel-button";
  v4[120] = @"spacing";
  v4[121] = @"start-at-end";
  v4[122] = @"start-color";
  v4[123] = @"start-position";
  v4[124] = @"startTime";
  v4[125] = @"style";
  v4[126] = @"text";
  v4[127] = @"text-alignment";
  v4[128] = @"timing";
  v4[129] = @"tint";
  v4[130] = @"title";
  v4[131] = @"top";
  v4[132] = @"touch-outsets";
  v4[133] = @"trailing";
  v4[134] = @"transform";
  v4[135] = @"trigger";
  v4[136] = @"trigger-offset";
  v4[137] = @"v";
  v4[138] = @"valign";
  v4[139] = @"vcompressed";
  v4[140] = @"vpivot";
  v4[141] = @"vspacing";
  v4[142] = @"w";
  v4[143] = @"z-index";
  uint64_t v1 = +[NSArray arrayWithObjects:v4 count:144];
  uint64_t v2 = +[TUIAttributeSet setWithArray:v1];
  unint64_t v3 = (void *)qword_2DFA18;
  qword_2DFA18 = v2;
}

void sub_173F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_173F88(id a1)
{
  v4[0] = @"ax-adjustable";
  v4[1] = @"ax-button";
  v4[2] = @"ax-disabled";
  v4[3] = @"ax-enable";
  v4[4] = @"ax-heading";
  v4[5] = @"ax-hint";
  void v4[6] = @"ax-identifier";
  v4[7] = @"ax-image";
  v4[8] = @"ax-label";
  v4[9] = @"ax-toggle";
  v4[10] = @"ax-touch-container";
  v4[11] = @"ax-value";
  uint64_t v1 = +[NSArray arrayWithObjects:v4 count:12];
  uint64_t v2 = +[TUIAttributeSet setWithArray:v1];
  unint64_t v3 = (void *)qword_2DFA28;
  qword_2DFA28 = v2;
}

void sub_1740C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_174180(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) globallySupportedAttributes];
  v5[0] = @"anchor-position";
  v5[1] = @"allow-group-blending";
  v5[2] = @"allow-hanging-punctuation";
  v5[3] = @"allow-shrink-to-fit";
  v5[4] = @"background-color";
  void v5[5] = @"border-color";
  v5[6] = @"border-width";
  v5[7] = @"bottom";
  v5[8] = @"clips-to-bounds";
  v5[9] = @"color";
  v5[10] = @"columns";
  v5[11] = @"continuous-corners";
  v5[12] = @"corner-radius";
  v5[13] = @"direction";
  v5[14] = @"enabled";
  v5[15] = @"end-color";
  v5[16] = @"fallback-color";
  v5[17] = @"fetch-delta";
  v5[18] = @"fetch-initial";
  v5[19] = @"fetch-padding";
  v5[20] = @"fetch-window";
  v5[21] = @"filter";
  v5[22] = @"font";
  v5[23] = @"halign";
  v5[24] = @"h";
  v5[25] = @"hflip-for-rtl";
  v5[26] = @"hide-ellipses";
  v5[27] = @"hspacing";
  v5[28] = @"html-tags";
  v5[29] = @"insets";
  v5[30] = @"ih";
  v5[31] = @"iw";
  v5[32] = @"chart-type";
  v5[33] = @"layout-direction";
  v5[34] = @"layout-mode";
  v5[35] = @"leading";
  v5[36] = @"line-balancing";
  v5[37] = @"live-transform";
  v5[38] = @"mask-color";
  v5[39] = @"max-lines";
  v5[40] = @"max-scale";
  v5[41] = @"min-lines";
  v5[42] = @"min-scale";
  v5[43] = @"pressed-scale";
  v5[44] = @"rasterize";
  v5[45] = @"rating";
  v5[46] = @"ref-id";
  v5[47] = @"ref-instance";
  v5[48] = @"render-model";
  v5[49] = @"render-outsets";
  v5[50] = @"role";
  v5[51] = @"shadow-color";
  v5[52] = @"shadow-offset";
  v5[53] = @"shadow-opacity";
  v5[54] = @"shadow-radius";
  v5[55] = @"spacing";
  v5[56] = @"start-color";
  v5[57] = @"text-alignment";
  v5[58] = @"top";
  v5[59] = @"touch-outsets";
  v5[60] = @"trailing";
  v5[61] = @"valign";
  v5[62] = @"vspacing";
  v5[63] = @"w";
  v5[64] = @"z-index";
  uint64_t v2 = +[NSArray arrayWithObjects:v5 count:65];
  uint64_t v3 = [v1 setByAddingAttributesFromArray:v2];
  unint64_t v4 = (void *)qword_2DFA38;
  qword_2DFA38 = v3;
}

void sub_1745BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_174680(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) globallySupportedAttributes];
  v5[0] = @"color";
  v5[1] = @"font";
  v5[2] = @"layout-direction";
  v5[3] = @"live-transform";
  v5[4] = @"ref-id";
  void v5[5] = @"ref-instance";
  uint64_t v2 = +[NSArray arrayWithObjects:v5 count:6];
  uint64_t v3 = [v1 setByAddingAttributesFromArray:v2];
  unint64_t v4 = (void *)qword_2DFA48;
  qword_2DFA48 = v3;
}

void sub_174780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_174844(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) globallySupportedAttributes];
  v5[0] = @"anchor-offset";
  v5[1] = @"anchor-position";
  v5[2] = @"bottom";
  v5[3] = @"h";
  v5[4] = @"impression-data";
  void v5[5] = @"layout-direction";
  void v5[6] = @"leading";
  v5[7] = @"live-transform";
  v5[8] = @"ref-id";
  v5[9] = @"ref-instance";
  v5[10] = @"render-model";
  v5[11] = @"render-outsets";
  v5[12] = @"render-transform";
  v5[13] = @"role";
  v5[14] = @"top";
  v5[15] = @"trailing";
  v5[16] = @"transform";
  v5[17] = @"w";
  v5[18] = @"z-index";
  uint64_t v2 = +[NSArray arrayWithObjects:v5 count:19];
  uint64_t v3 = [v1 setByAddingAttributesFromArray:v2];
  unint64_t v4 = (void *)qword_2DFA58;
  qword_2DFA58 = v3;
}

void sub_1749FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_174AC0(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) globallySupportedAttributes];
  v5[0] = @"anchor-offset";
  v5[1] = @"anchor-position";
  v5[2] = @"bottom";
  v5[3] = @"h";
  v5[4] = @"impression-data";
  void v5[5] = @"ih";
  void v5[6] = @"iw";
  v5[7] = @"layout-direction";
  v5[8] = @"leading";
  v5[9] = @"live-transform";
  v5[10] = @"ref-id";
  v5[11] = @"ref-instance";
  v5[12] = @"render-model";
  v5[13] = @"render-outsets";
  v5[14] = @"render-transform";
  v5[15] = @"role";
  v5[16] = @"top";
  v5[17] = @"trailing";
  v5[18] = @"transform";
  void v5[19] = @"w";
  v5[20] = @"z-index";
  uint64_t v2 = +[NSArray arrayWithObjects:v5 count:21];
  uint64_t v3 = [v1 setByAddingAttributesFromArray:v2];
  unint64_t v4 = (void *)qword_2DFA68;
  qword_2DFA68 = v3;
}

void sub_174C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_174EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_174F34(int8x8_t *a1, unsigned int a2, uint64_t a3, unsigned int a4, unsigned char *a5)
{
  unint64_t v5 = a4 - (unint64_t)a2 + 8 * (a3 - (void)a1);
  if (*a5) {
    return sub_174F54(a1, a2, v5);
  }
  else {
    return sub_174FF8((uint64_t *)a1, a2, v5);
  }
}

uint64_t sub_174F54(int8x8_t *a1, unsigned int a2, unint64_t a3)
{
  uint64_t v3 = a2;
  if (a2)
  {
    if (64 - a2 >= a3) {
      unint64_t v4 = a3;
    }
    else {
      unint64_t v4 = 64 - a2;
    }
    uint64_t v5 = (uint64_t)*a1++;
    uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v4)) & (-1 << a2) & v5));
    v6.i16[0] = vaddlv_u8(v6);
    uint64_t v3 = v6.u32[0];
    a3 -= v4;
  }
  if (a3 >= 0x40)
  {
    do
    {
      int8x8_t v7 = *a1++;
      uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      v3 += v8.u32[0];
      a3 -= 64;
    }
    while (a3 > 0x3F);
  }
  if (a3)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)a1 & (0xFFFFFFFFFFFFFFFFLL >> -(char)a3)));
    v9.i16[0] = vaddlv_u8(v9);
    v3 += v9.u32[0];
  }
  return v3;
}

uint64_t sub_174FF8(uint64_t *a1, unsigned int a2, unint64_t a3)
{
  uint64_t v3 = a2;
  if (a2)
  {
    if (64 - a2 >= a3) {
      unint64_t v4 = a3;
    }
    else {
      unint64_t v4 = 64 - a2;
    }
    uint64_t v5 = *a1++;
    uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v4)) & (-1 << a2) & ~v5));
    v6.i16[0] = vaddlv_u8(v6);
    uint64_t v3 = v6.u32[0];
    a3 -= v4;
  }
  if (a3 >= 0x40)
  {
    do
    {
      uint64_t v7 = *a1++;
      uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)~v7);
      v8.i16[0] = vaddlv_u8(v8);
      v3 += v8.u32[0];
      a3 -= 64;
    }
    while (a3 > 0x3F);
  }
  if (a3)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> -(char)a3) & ~*a1));
    v9.i16[0] = vaddlv_u8(v9);
    v3 += v9.u32[0];
  }
  return v3;
}

void sub_1752D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1753EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_175404(id a1, NSString *a2, TUIModel *a3, BOOL *a4)
{
}

id sub_175410(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setParentModel:*(void *)(a1 + 32)];
}

void sub_1754C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1754D8(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 appendLayoutModelsToArray:*(void *)(a1 + 32)];
}

void sub_175588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1755A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

uint64_t TUI::Package::Enumerator::Entry::binding(TUI::Package::Enumerator::Entry *this, Entry a2)
{
  return 0xFFFF000000000001;
}

id TUI::Package::Location::Entry::description(TUI::Package::Location::Entry *this, const TUI::Package::Buffer *a2)
{
  unint64_t v4 = TUI::Package::Location::Entry::pathURL((unsigned __int16 *)this, a2);
  uint64_t v5 = [v4 lastPathComponent];
  uint8x8_t v6 = TUI::Package::Location::Entry::xpathString((uint64_t)this, a2);
  uint64_t v7 = +[NSString stringWithFormat:@"%@ %@", v5, v6];

  return v7;
}

void sub_1763A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id TUI::Package::Location::Entry::pathURL(unsigned __int16 *a1, void *a2)
{
  unint64_t v2 = *a1;
  if (a2[14] > v2 && (uint64_t v4 = a2[13]) != 0)
  {
    uint64_t v5 = +[NSString stringWithUTF8String:v4 + *(unsigned int *)(a2[15] + 4 * v2)];
    uint8x8_t v6 = +[NSURL URLWithString:v5 relativeToURL:*a2];
  }
  else
  {
    uint8x8_t v6 = 0;
  }

  return v6;
}

void sub_176470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id TUI::Package::Location::Entry::xpathString(uint64_t a1, void *a2)
{
  unint64_t v2 = *(unsigned int *)(a1 + 4);
  if (a2[11] > v2 && (uint64_t v3 = a2[10]) != 0)
  {
    uint64_t v4 = +[NSString stringWithUTF8String:v3 + *(unsigned int *)(a2[12] + 4 * v2)];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

double TUI::Package::Decoder::Decoder(TUI::Package::Decoder *this)
{
  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  *((_DWORD *)this + 12) = 1065353216;
  return result;
}

{
  double result;

  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  *((_DWORD *)this + 12) = 1065353216;
  return result;
}

uint64_t TUI::Package::Decoder::Decoder(uint64_t this, char *a2, unint64_t a3)
{
  *(void *)this = a2;
  *(void *)(this + 8) = a3;
  *(_OWORD *)(this + 16) = 0u;
  uint64_t v37 = (void *)(this + 16);
  *(_OWORD *)(this + 32) = 0u;
  *(_DWORD *)(this + 48) = 1065353216;
  if (a3 >= 0x10)
  {
    unint64_t v3 = a3;
    uint64_t v4 = 0;
    id v34 = a2 + 8;
    uint64_t v35 = a2 + 4;
    uint64_t v32 = this;
    unint64_t v33 = a2 + 12;
    uint64_t v5 = 16;
    do
    {
      unsigned int v38 = 0;
      unsigned int v6 = *(_DWORD *)&a2[v4];
      uint64_t v7 = v5;
      unsigned int v38 = v6;
      unint64_t v8 = *(unsigned int *)&v34[v4];
      int v9 = *(_DWORD *)&v33[v4];
      if (!v8) {
        goto LABEL_7;
      }
      if (v3 >= v8) {
        unint64_t v3 = *(unsigned int *)&v34[v4];
      }
      if (*(void *)(this + 8) >= (unint64_t)(v9 + v8)) {
        unint64_t v10 = *(void *)this + v8;
      }
      else {
LABEL_7:
      }
        unint64_t v10 = 0;
      int v11 = *(_DWORD *)&v35[v4];
      unint64_t v12 = sub_177C58(v37, &v38);
      unint64_t v13 = v12;
      if (v12)
      {
        uint64_t v14 = (uint64_t)(v12 + 5);
        unint64_t v15 = v13[5];
        unint64_t v16 = v13[4];
        if (v16 >= v15)
        {
          uint64_t v21 = v13[3];
          unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - v21) >> 3);
          unint64_t v23 = v22 + 1;
          if (v22 + 1 > 0xAAAAAAAAAAAAAAALL) {
            sub_4484();
          }
          unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15 - v21) >> 3);
          if (2 * v24 > v23) {
            unint64_t v23 = 2 * v24;
          }
          if (v24 >= 0x555555555555555) {
            unint64_t v25 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v25 = v23;
          }
          if (v25) {
            uint64_t v26 = (char *)sub_12768(v14, v25);
          }
          else {
            uint64_t v26 = 0;
          }
          unint64_t v27 = &v26[24 * v22];
          *(_DWORD *)unint64_t v27 = v6;
          *((_DWORD *)v27 + 1) = v11;
          *((_DWORD *)v27 + 2) = v8;
          *((_DWORD *)v27 + 3) = v9;
          *((void *)v27 + 2) = v10;
          uint64_t v29 = (char *)v13[3];
          uint64_t v28 = (char *)v13[4];
          unint64_t v30 = v27;
          if (v28 != v29)
          {
            do
            {
              long long v31 = *(_OWORD *)(v28 - 24);
              *((void *)v30 - 1) = *((void *)v28 - 1);
              *(_OWORD *)(v30 - 24) = v31;
              v30 -= 24;
              v28 -= 24;
            }
            while (v28 != v29);
            uint64_t v28 = (char *)v13[3];
          }
          unint64_t v17 = v27 + 24;
          void v13[3] = (uint64_t)v30;
          v13[4] = (uint64_t)(v27 + 24);
          v13[5] = (uint64_t)&v26[24 * v25];
          if (v28) {
            operator delete(v28);
          }
        }
        else
        {
          *(_DWORD *)unint64_t v16 = v6;
          *(_DWORD *)(v16 + 4) = v11;
          *(_DWORD *)(v16 + 8) = v8;
          *(_DWORD *)(v16 + 12) = v9;
          unint64_t v17 = (char *)(v16 + 24);
          *(void *)(v16 + 16) = v10;
        }
        v13[4] = (uint64_t)v17;
      }
      else
      {
        unint64_t v18 = operator new(0x18uLL);
        *unint64_t v18 = v6;
        v18[1] = v11;
        void v18[2] = v8;
        v18[3] = v9;
        *((void *)v18 + 2) = v10;
        uint64_t v39 = &v38;
        id v19 = sub_177D0C((uint64_t)v37, &v38, (uint64_t)&std::piecewise_construct, &v39);
        uint64_t v20 = (void *)v19[3];
        if (v20)
        {
          v19[4] = v20;
          operator delete(v20);
          v19[3] = 0;
          v19[4] = 0;
          v19[5] = 0;
        }
        v19[3] = v18;
        v19[4] = v18 + 6;
        v19[5] = v18 + 6;
      }
      this = v32;
      uint64_t v5 = v7 + 16;
      uint64_t v4 = v7;
    }
    while (v7 + 16 <= v3);
  }
  return this;
}

void sub_176798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

uint64_t *TUI::Package::Decoder::sectionWithTag@<X0>(TUI::Package::Decoder *this@<X0>, unsigned int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  unsigned int v9 = bswap32(a2);
  double result = sub_177C58((void *)this + 2, &v9);
  if (result)
  {
    uint64_t v7 = result[3];
    uint64_t v8 = result[4];
    while (v7 != v8)
    {
      *(_OWORD *)a4 = *(_OWORD *)v7;
      *(void *)(a4 + 16) = *(void *)(v7 + 16);
      if (*(_DWORD *)(a4 + 4) == a3) {
        return result;
      }
      v7 += 24;
    }
  }
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  return result;
}

void TUI::Package::Decoder::swap(TUI::Package::Decoder *this, TUI::Package::Decoder *a2)
{
  uint64_t v2 = *(void *)this;
  uint64_t v3 = *((void *)this + 1);
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)this = *(void *)a2;
  *((void *)this + 1) = v4;
  *(void *)a2 = v2;
  *((void *)a2 + 1) = v3;
  sub_29920((uint64_t)this + 16, (uint64_t)a2 + 16);
}

BOOL TUI::Package::SymbolsSection::decodeIntoSymtab(TUI::Package::SymbolsSection *this, const TUI::Package::Section *a2, int a3, TUI::Symbol::Tab *a4)
{
  if (*((_DWORD *)a2 + 3) < 4u || *((_DWORD *)a2 + 1) != a3) {
    return 0;
  }
  uint64_t v8 = *(unsigned int *)this;
  unint64_t v9 = 2 * v8 + 4;
  TUI::Symbol::Tab::beginSymbolLoading(a4);
  if (v8)
  {
    uint64_t v10 = 0;
    do
    {
      unint64_t v11 = *((unsigned int *)a2 + 3);
      if (v10 + 4 >= v11 || v11 <= v9) {
        break;
      }
      unint64_t v13 = memchr((char *)this + v9, 0, v11 - v9);
      if (!v13) {
        break;
      }
      unsigned int v14 = *(unsigned __int16 *)((char *)this + v10 + 4);
      if (v8 <= v14) {
        break;
      }
      unint64_t v15 = v13;
      sub_6ACC(__p, (char *)this + v9);
      char Symbol = TUI::Symbol::Tab::loadSymbol((uint64_t)a4, v14, (unsigned __int8 *)__p);
      if (v19 < 0) {
        operator delete(__p[0]);
      }
      if ((Symbol & 1) == 0) {
        break;
      }
      unint64_t v9 = v15 + 1 - (unsigned char *)this;
      v10 += 2;
    }
    while (2 * v8 != v10);
  }
  return v9 == *((_DWORD *)a2 + 3) && TUI::Symbol::Tab::endSymbolLoading(a4);
}

void sub_176984(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TUI::Package::NamespacesSection::decodeIntoSymtab(TUI::Package::NamespacesSection *this, const TUI::Package::Section *a2, int a3, TUI::Symbol::Tab *a4)
{
  TUI::Symbol::Tab::beginNSLoading(a4);
  unsigned int v7 = *((_DWORD *)a2 + 3);
  uint64_t v32 = a2;
  if (v7 < 4 || *((_DWORD *)a2 + 1) != a3) {
    return 0;
  }
  unsigned int v9 = *(_DWORD *)this;
  if (*(_DWORD *)this)
  {
    uint64_t v10 = 0;
    uint64_t v30 = *(unsigned int *)this;
    uint64_t v11 = 4;
    do
    {
      unint64_t v12 = *((unsigned int *)v32 + 3);
      if (v11 + 4 > v12) {
        break;
      }
      unsigned int v13 = *(unsigned __int16 *)((char *)this + v11);
      if (v9 <= v13) {
        break;
      }
      uint64_t v14 = *(unsigned __int16 *)((char *)this + v11 + 2);
      if (v11 + 4 + 2 * v14 > v12)
      {
        v11 += 4;
        break;
      }
      __p = 0;
      id v34 = 0;
      uint64_t v35 = 0;
      if (v14)
      {
        unint64_t v15 = 0;
        uint64_t v16 = 0;
        v11 += 4;
        do
        {
          __int16 v17 = *(_WORD *)((char *)this + v11);
          if (v15 >= v35)
          {
            char v19 = (char *)__p;
            uint64_t v20 = v15 - (unsigned char *)__p;
            if (v15 - (unsigned char *)__p <= -3) {
              sub_4484();
            }
            uint64_t v21 = v20 >> 1;
            if (v35 - (unsigned char *)__p <= (unint64_t)((v20 >> 1) + 1)) {
              uint64_t v22 = v21 + 1;
            }
            else {
              uint64_t v22 = v35 - (unsigned char *)__p;
            }
            if ((unint64_t)(v35 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFFELL) {
              uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v23 = v22;
            }
            if (v23)
            {
              unint64_t v24 = (char *)sub_6B98((uint64_t)&v35, v23);
              char v19 = (char *)__p;
              unint64_t v15 = v34;
            }
            else
            {
              unint64_t v24 = 0;
            }
            unint64_t v25 = &v24[2 * v21];
            *(_WORD *)unint64_t v25 = v17;
            unint64_t v18 = v25 + 2;
            while (v15 != v19)
            {
              __int16 v26 = *((_WORD *)v15 - 1);
              v15 -= 2;
              *((_WORD *)v25 - 1) = v26;
              v25 -= 2;
            }
            __p = v25;
            id v34 = v18;
            uint64_t v35 = &v24[2 * v23];
            if (v19) {
              operator delete(v19);
            }
          }
          else
          {
            *(_WORD *)unint64_t v15 = v17;
            unint64_t v18 = v15 + 2;
          }
          id v34 = v18;
          v11 += 2;
          ++v16;
          unint64_t v15 = v18;
        }
        while (v16 != v14);
      }
      else
      {
        v11 += 4;
      }
      char NS = TUI::Symbol::Tab::loadNS((uint64_t)a4, v13, (uint64_t)&__p);
      unsigned int v9 = v30;
      if (__p)
      {
        id v34 = (char *)__p;
        operator delete(__p);
      }
      if (++v10 == v30) {
        char v28 = 0;
      }
      else {
        char v28 = NS;
      }
    }
    while ((v28 & 1) != 0);
    unsigned int v7 = *((_DWORD *)v32 + 3);
  }
  else
  {
    uint64_t v11 = 4;
  }
  if (v11 == v7) {
    return TUI::Symbol::Tab::endNSLoading(a4);
  }
  else {
    return 0;
  }
}

void sub_176BB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TUI::Package::Section::decodeStrings@<X0>(uint64_t this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v3 = *(unsigned int **)(this + 16);
  if (v3)
  {
    if (*(_DWORD *)(this + 4) == a2)
    {
      *a3 = v3;
      a3[1] = *v3;
      a3[2] = v3 + 1;
    }
  }
  return this;
}

StringsSection *TUI::Package::Buffer::Buffer(StringsSection *this, NSURL *a2, const TUI::Package::Decoder *a3)
{
  uint64_t v5 = a2;
  this->base = (char *)v5;
  bzero(&this->count, 0x208uLL);
  TUI::Package::Decoder::sectionWithTag(a3, 0x696E7362u, 2, (uint64_t)&v73);
  if ((void)v74 && DWORD1(v73) == 2)
  {
    unint64_t v6 = (unint64_t)HIDWORD(v73) >> 1;
    this->count = v74;
    this->offsets = (unsigned int *)v6;
    int v7 = 2;
    int v8 = 2;
  }
  else
  {
    this->count = 0;
    this->offsets = 0;
    TUI::Package::Decoder::sectionWithTag(a3, 0x696E7362u, 0, (uint64_t)&v73);
    int v8 = 0;
    unint64_t v9 = v74;
    unint64_t v10 = (unint64_t)HIDWORD(v73) >> 1;
    if ((void)v74 == 0 || DWORD1(v73) != 0)
    {
      unint64_t v9 = 0;
      unint64_t v10 = 0;
    }
    this->count = v9;
    this->offsets = (unsigned int *)v10;
    int v7 = 1;
  }
  TUI::Package::Decoder::sectionWithTag(a3, 0x666C7462u, v8, (uint64_t)&v73);
  uint64_t v11 = (char *)v74;
  if ((void)v74 != 0 && DWORD1(v73) == v8)
  {
    unint64_t v12 = (unint64_t)HIDWORD(v73) >> 2;
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
  }
  this[1].base = v11;
  this[1].count = v12;
  TUI::Package::Decoder::sectionWithTag(a3, 0x696E7462u, v8, (uint64_t)&v73);
  unsigned int v13 = (unsigned int *)v74;
  if ((void)v74 != 0 && DWORD1(v73) == v8)
  {
    unint64_t v14 = (unint64_t)HIDWORD(v73) >> 2;
  }
  else
  {
    unsigned int v13 = 0;
    unint64_t v14 = 0;
  }
  this[1].offsets = v13;
  this[2].base = (char *)v14;
  TUI::Package::Decoder::sectionWithTag(a3, 0x73747262u, v8, (uint64_t)&v73);
  unint64_t v15 = 0;
  if ((void)v74)
  {
    uint64_t v16 = 0;
    __int16 v17 = 0;
    if (DWORD1(v73) == v8)
    {
      __int16 v17 = (char *)(v74 + 4);
      uint64_t v16 = (unsigned int *)*(unsigned int *)v74;
      unint64_t v15 = v74;
    }
  }
  else
  {
    uint64_t v16 = 0;
    __int16 v17 = 0;
  }
  this[2].count = v15;
  this[2].offsets = v16;
  this[3].base = v17;
  TUI::Package::Decoder::sectionWithTag(a3, 0x78707462u, v8, (uint64_t)&v73);
  unint64_t v18 = 0;
  if ((void)v74)
  {
    char v19 = 0;
    uint64_t v20 = 0;
    if (DWORD1(v73) == v8)
    {
      uint64_t v20 = (char *)(v74 + 4);
      char v19 = (unsigned int *)*(unsigned int *)v74;
      unint64_t v18 = v74;
    }
  }
  else
  {
    char v19 = 0;
    uint64_t v20 = 0;
  }
  this[3].count = v18;
  this[3].offsets = v19;
  this[4].base = v20;
  TUI::Package::Decoder::sectionWithTag(a3, 0x70746862u, v8, (uint64_t)&v73);
  unint64_t v21 = 0;
  if ((void)v74)
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    if (DWORD1(v73) == v8)
    {
      uint64_t v23 = (char *)(v74 + 4);
      uint64_t v22 = (unsigned int *)*(unsigned int *)v74;
      unint64_t v21 = v74;
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
  }
  this[4].count = v21;
  this[4].offsets = v22;
  this[5].base = v23;
  TUI::Package::Decoder::sectionWithTag(a3, 0x6C6F6362u, v7, (uint64_t)&v73);
  unint64_t v24 = v74;
  if ((void)v74 != 0 && DWORD1(v73) == v7)
  {
    unint64_t v25 = (unint64_t)HIDWORD(v73) >> 3;
  }
  else
  {
    unint64_t v24 = 0;
    unint64_t v25 = 0;
  }
  this[5].count = v24;
  this[5].offsets = (unsigned int *)v25;
  TUI::Package::Decoder::sectionWithTag(a3, 0x72656662u, v8, (uint64_t)&v73);
  __int16 v26 = 0;
  if ((void)v74)
  {
    unint64_t v27 = 0;
    if (DWORD1(v73) == v8)
    {
      unint64_t v27 = HIDWORD(v73) / 0xCuLL;
      __int16 v26 = (char *)v74;
    }
  }
  else
  {
    unint64_t v27 = 0;
  }
  this[6].base = v26;
  this[6].count = v27;
  TUI::Package::Decoder::sectionWithTag(a3, 0x61726762u, v8, (uint64_t)&v73);
  char v28 = (unsigned int *)v74;
  if ((void)v74 != 0 && DWORD1(v73) == v8)
  {
    unint64_t v29 = (unint64_t)HIDWORD(v73) >> 3;
  }
  else
  {
    char v28 = 0;
    unint64_t v29 = 0;
  }
  this[6].offsets = v28;
  this[7].base = (char *)v29;
  TUI::Package::Decoder::sectionWithTag(a3, 0x64656662u, v8, (uint64_t)&v73);
  unint64_t v30 = 0;
  if ((void)v74)
  {
    unint64_t v31 = 0;
    if (DWORD1(v73) == v8)
    {
      unint64_t v31 = HIDWORD(v73) / 0xCuLL;
      unint64_t v30 = v74;
    }
  }
  else
  {
    unint64_t v31 = 0;
  }
  this[7].count = v30;
  this[7].offsets = (unsigned int *)v31;
  TUI::Package::Decoder::sectionWithTag(a3, 0x70726D62u, v8, (uint64_t)&v73);
  uint64_t v32 = (char *)v74;
  if ((void)v74 != 0 && DWORD1(v73) == v8)
  {
    unint64_t v33 = (unint64_t)HIDWORD(v73) >> 3;
  }
  else
  {
    uint64_t v32 = 0;
    unint64_t v33 = 0;
  }
  this[8].base = v32;
  this[8].count = v33;
  TUI::Package::Decoder::sectionWithTag(a3, 0x656C6D62u, v7, (uint64_t)&v73);
  id v34 = 0;
  if ((void)v74)
  {
    unint64_t v35 = 0;
    if (DWORD1(v73) == v7)
    {
      unint64_t v35 = HIDWORD(v73) / 0x1CuLL;
      id v34 = (unsigned int *)v74;
    }
  }
  else
  {
    unint64_t v35 = 0;
  }
  this[8].offsets = v34;
  this[9].base = (char *)v35;
  TUI::Package::Decoder::sectionWithTag(a3, 0x61747662u, v8, (uint64_t)&v73);
  unint64_t v36 = 0;
  if ((void)v74)
  {
    unint64_t v37 = 0;
    if (DWORD1(v73) == v8)
    {
      unint64_t v37 = HIDWORD(v73) / 0xCuLL;
      unint64_t v36 = v74;
    }
  }
  else
  {
    unint64_t v37 = 0;
  }
  this[9].count = v36;
  this[9].offsets = (unsigned int *)v37;
  TUI::Package::Decoder::sectionWithTag(a3, 0x61746962u, v8, (uint64_t)&v73);
  unsigned int v38 = (char *)v74;
  if ((void)v74 != 0 && DWORD1(v73) == v8)
  {
    unint64_t v39 = (unint64_t)HIDWORD(v73) >> 3;
  }
  else
  {
    unsigned int v38 = 0;
    unint64_t v39 = 0;
  }
  this[10].base = v38;
  this[10].count = v39;
  TUI::Package::Decoder::sectionWithTag(a3, 0x656E756Du, v8, (uint64_t)&v73);
  unint64_t v40 = (unsigned int *)v74;
  if ((void)v74 != 0 && DWORD1(v73) == v8)
  {
    unint64_t v41 = (unint64_t)HIDWORD(v73) >> 4;
  }
  else
  {
    unint64_t v40 = 0;
    unint64_t v41 = 0;
  }
  this[10].offsets = v40;
  this[11].base = (char *)v41;
  TUI::Package::Decoder::sectionWithTag(a3, 0x61746E62u, v8, (uint64_t)&v73);
  id v42 = 0;
  if ((void)v74)
  {
    unint64_t v43 = 0;
    unint64_t v44 = 0;
    if (DWORD1(v73) == v8)
    {
      unint64_t v44 = (unsigned int *)(v74 + 4);
      unint64_t v43 = *(unsigned int *)v74;
      id v42 = (char *)v74;
    }
  }
  else
  {
    unint64_t v43 = 0;
    unint64_t v44 = 0;
  }
  this[19].base = v42;
  this[19].count = v43;
  this[19].offsets = v44;
  TUI::Package::Decoder::sectionWithTag(a3, 0x656C6E62u, v8, (uint64_t)&v73);
  double v45 = 0;
  if ((void)v74)
  {
    unint64_t v46 = 0;
    double v47 = 0;
    if (DWORD1(v73) == v8)
    {
      double v47 = (unsigned int *)(v74 + 4);
      unint64_t v46 = *(unsigned int *)v74;
      double v45 = (char *)v74;
    }
  }
  else
  {
    unint64_t v46 = 0;
    double v47 = 0;
  }
  this[18].base = v45;
  this[18].count = v46;
  this[18].offsets = v47;
  TUI::Package::Decoder::sectionWithTag(a3, 0x726F6F74u, v8, (uint64_t)&v73);
  unint64_t v48 = v74;
  if ((void)v74 != 0 && DWORD1(v73) == v8)
  {
    unint64_t v49 = (unint64_t)HIDWORD(v73) >> 3;
  }
  else
  {
    unint64_t v48 = 0;
    unint64_t v49 = 0;
  }
  this[11].count = v48;
  this[11].offsets = (unsigned int *)v49;
  TUI::Package::Decoder::sectionWithTag(a3, 0x636D7062u, v8, (uint64_t)&v73);
  uint64_t v50 = 0;
  if ((void)v74)
  {
    unint64_t v51 = 0;
    if (DWORD1(v73) == v8)
    {
      unint64_t v51 = HIDWORD(v73) / 0x2CuLL;
      uint64_t v50 = (char *)v74;
    }
  }
  else
  {
    unint64_t v51 = 0;
  }
  this[12].base = v50;
  this[12].count = v51;
  TUI::Package::Decoder::sectionWithTag(a3, 0x6E746962u, v8, (uint64_t)&v73);
  uint64_t v52 = (unsigned int *)v74;
  if ((void)v74 != 0 && DWORD1(v73) == v8)
  {
    unint64_t v53 = (unint64_t)HIDWORD(v73) >> 3;
  }
  else
  {
    uint64_t v52 = 0;
    unint64_t v53 = 0;
  }
  this[12].offsets = v52;
  this[13].base = (char *)v53;
  TUI::Package::Decoder::sectionWithTag(a3, 0x6D746864u, v8, (uint64_t)&v73);
  unint64_t v54 = v74;
  if ((void)v74 != 0 && DWORD1(v73) == v8)
  {
    unint64_t v55 = (unint64_t)HIDWORD(v73) >> 4;
  }
  else
  {
    unint64_t v54 = 0;
    unint64_t v55 = 0;
  }
  this[13].count = v54;
  this[13].offsets = (unsigned int *)v55;
  TUI::Package::Decoder::sectionWithTag(a3, 0x6E616D62u, v8, (uint64_t)&v73);
  id v56 = (char *)v74;
  if ((void)v74 != 0 && DWORD1(v73) == v8)
  {
    unint64_t v57 = (unint64_t)HIDWORD(v73) >> 2;
  }
  else
  {
    id v56 = 0;
    unint64_t v57 = 0;
  }
  this[14].base = v56;
  this[14].count = v57;
  TUI::Package::Decoder::sectionWithTag(a3, 0x676C6262u, 3, (uint64_t)&v73);
  unint64_t v58 = 0;
  if ((void)v74)
  {
    unint64_t v59 = 0;
    if (DWORD1(v73) == 3)
    {
      unint64_t v59 = HIDWORD(v73) / 0xCuLL;
      unint64_t v58 = (unsigned int *)v74;
    }
  }
  else
  {
    unint64_t v59 = 0;
  }
  this[14].offsets = v58;
  this[15].base = (char *)v59;
  TUI::Package::Decoder::sectionWithTag(a3, 0x676C626Fu, 3, (uint64_t)&v73);
  unint64_t v60 = 0;
  if ((void)v74 && DWORD1(v73) == 3)
  {
    uint64_t v61 = 0;
    if (HIDWORD(v73) == 8)
    {
      unint64_t v60 = (unsigned int *)*(unsigned int *)v74;
      uint64_t v61 = (char *)*(unsigned int *)(v74 + 4);
    }
  }
  else
  {
    uint64_t v61 = 0;
  }
  this[16].offsets = v60;
  this[17].base = v61;
  TUI::Package::Decoder::sectionWithTag(a3, 0x676C6272u, v8, (uint64_t)&v73);
  uint64_t v62 = 0;
  if ((void)v74 && DWORD1(v73) == v8)
  {
    unint64_t v63 = 0;
    if (HIDWORD(v73) == 8)
    {
      uint64_t v62 = (char *)*(unsigned int *)v74;
      unint64_t v63 = *(unsigned int *)(v74 + 4);
    }
  }
  else
  {
    unint64_t v63 = 0;
  }
  this[16].base = v62;
  this[16].count = v63;
  TUI::Package::Decoder::sectionWithTag(a3, 0x636D7072u, v8, (uint64_t)&v73);
  unint64_t v64 = 0;
  if ((void)v74 && DWORD1(v73) == v8)
  {
    unint64_t v65 = 0;
    if (HIDWORD(v73) == 8)
    {
      unint64_t v64 = *(unsigned int *)v74;
      unint64_t v65 = (unsigned int *)*(unsigned int *)(v74 + 4);
    }
  }
  else
  {
    unint64_t v65 = 0;
  }
  this[17].count = v64;
  this[17].offsets = v65;
  TUI::Package::Decoder::sectionWithTag(a3, 0x636C7369u, v8, (uint64_t)&v73);
  unint64_t v66 = 0;
  if ((void)v74)
  {
    unint64_t v67 = 0;
    if (DWORD1(v73) == v8)
    {
      unint64_t v67 = HIDWORD(v73) / 0x1CuLL;
      unint64_t v66 = v74;
    }
  }
  else
  {
    unint64_t v67 = 0;
  }
  this[15].count = v66;
  this[15].offsets = (unsigned int *)v67;
  TUI::Package::Attribute::NameMapper::NameMapper((TUI::Package::Attribute::NameMapper *)&v73, this + 19);
  long long v68 = v74;
  long long v69 = *(_OWORD *)&this[20].base;
  long long v70 = *(_OWORD *)&this[20].offsets;
  *(_OWORD *)&this[20].base = v73;
  *(_OWORD *)&this[20].offsets = v68;
  long long v73 = v69;
  long long v74 = v70;
  long long v71 = *(_OWORD *)&this[21].count;
  *(_OWORD *)&this[21].count = v75;
  long long v75 = v71;
  TUI::Package::Attribute::NameMapper::~NameMapper((TUI::Package::Attribute::NameMapper *)&v73);

  return this;
}

void sub_177564(_Unwind_Exception *a1)
{
  TUI::Package::Attribute::NameMapper::~NameMapper((TUI::Package::Attribute::NameMapper *)(v1 + 60));

  _Unwind_Resume(a1);
}

double TUI::Package::Attribute::NameMapper::NameMapper(TUI::Package::Attribute::NameMapper *this)
{
  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

{
  double result;

  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

void TUI::Package::Buffer::~Buffer(id *this)
{
}

{
  TUI::Package::Attribute::NameMapper::~NameMapper((TUI::Package::Attribute::NameMapper *)(this + 60));
}

unint64_t TUI::Package::Buffer::findAttribute(void *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = a1[63];
  unsigned int v4 = 0xFFFF;
  if (a2 >= (unint64_t)((a1[64] - v3) >> 1)
    || ((unint64_t v5 = *(unsigned __int16 *)(v3 + 2 * a2), v5 != 0xFFFF)
      ? (BOOL v6 = (a3 & 0xFFFF00000000) == 0)
      : (BOOL v6 = 1),
        v6))
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v9 = a3;
    unint64_t v10 = a3 + WORD2(a3);
    if (a3 >= v10)
    {
      unint64_t v7 = 0;
      unsigned int v4 = 0xFFFF;
    }
    else
    {
      while (1)
      {
        if (a1[31] <= (v10 + v9) >> 1 || (unint64_t v11 = (v10 + v9) >> 1, (v12 = (unsigned __int16 *)(a1[30] + 8 * v11)) == 0))
        {
LABEL_20:
          unint64_t v7 = 0;
          unsigned int v4 = 0xFFFF;
          return v7 | v4;
        }
        unsigned int v13 = *v12;
        if (v13 == v5) {
          break;
        }
        if (v13 < v5) {
          unint64_t v14 = v11 + 1;
        }
        else {
          unint64_t v14 = v9;
        }
        if (v5 < v13) {
          unint64_t v10 = (v10 + v9) >> 1;
        }
        else {
          unint64_t v9 = v14;
        }
        if (v9 >= v10) {
          goto LABEL_20;
        }
      }
      uint64_t v15 = a1[60];
      if (v5 >= (a1[61] - v15) >> 1) {
        unsigned int v4 = 0xFFFF;
      }
      else {
        unsigned int v4 = *(unsigned __int16 *)(v15 + 2 * v5);
      }
      unint64_t v7 = (unint64_t)v12[1] << 16;
    }
  }
  return v7 | v4;
}

uint64_t TUI::Package::Buffer::globalsWithName(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 384);
  int v3 = *(_DWORD *)(a1 + 392) + v2 - 1;
  if (v3 < v2) {
    return 0;
  }
  HIDWORD(v5) = a2;
  LODWORD(v5) = a2;
  unsigned int v4 = v5 >> 16;
  while (1)
  {
    int v7 = (v2 + v3) / 2;
    uint64_t v6 = *(void *)(a1 + 304);
    int v8 = *(void *)(a1 + 312) <= (unint64_t)v7 ? 0 : (_DWORD *)(v6 + 8 * v7);
    HIDWORD(v10) = *v8;
    LODWORD(v10) = *v8;
    unsigned int v9 = v10 >> 16;
    if (v4 >= v9) {
      break;
    }
    int v3 = v7 - 1;
LABEL_10:
    if (v2 > v3) {
      return 0;
    }
  }
  if (v4 > v9)
  {
    int v2 = v7 + 1;
    goto LABEL_10;
  }
  unint64_t v11 = *(unsigned int *)(v6 + 8 * v7 + 4);
  if (*(void *)(a1 + 360) > v11) {
    return *(void *)(a1 + 352) + 12 * v11;
  }
  return 0;
}

uint64_t TUI::Package::Buffer::componentWithName(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 416);
  int v3 = *(_DWORD *)(a1 + 424) + v2 - 1;
  if (v3 < v2) {
    return 0;
  }
  HIDWORD(v5) = a2;
  LODWORD(v5) = a2;
  unsigned int v4 = v5 >> 16;
  while (1)
  {
    int v7 = (v2 + v3) / 2;
    uint64_t v6 = *(void *)(a1 + 304);
    int v8 = *(void *)(a1 + 312) <= (unint64_t)v7 ? 0 : (_DWORD *)(v6 + 8 * v7);
    HIDWORD(v10) = *v8;
    LODWORD(v10) = *v8;
    unsigned int v9 = v10 >> 16;
    if (v4 >= v9) {
      break;
    }
    int v3 = v7 - 1;
LABEL_10:
    if (v2 > v3) {
      return 0;
    }
  }
  if (v4 > v9)
  {
    int v2 = v7 + 1;
    goto LABEL_10;
  }
  unint64_t v11 = *(unsigned int *)(v6 + 8 * v7 + 4);
  if (*(void *)(a1 + 296) > v11) {
    return *(void *)(a1 + 288) + 44 * v11;
  }
  return 0;
}

uint64_t TUI::Package::Buffer::nameForComponent(void *a1, uint64_t a2)
{
  uint64_t result = TUINameNil;
  uint64_t v4 = a1[37];
  if (v4) {
    uint64_t v4 = a1[36];
  }
  unint64_t v5 = (a2 - v4) / 0x2CuLL;
  if (v5 < a1[53])
  {
    unint64_t v6 = a1[52] + v5;
    if (a1[39] > v6)
    {
      int v7 = (unsigned int *)(a1[38] + 8 * v6);
      if (v7) {
        return *v7;
      }
    }
  }
  return result;
}

uint64_t TUI::Package::Buffer::renderMethodForComponent(void *a1, uint64_t a2, int a3)
{
  if (!a2) {
    return 0;
  }
  int v3 = *(_DWORD *)(a2 + 28);
  int v4 = v3 + *(unsigned __int16 *)(a2 + 4) - 1;
  if (v4 < v3) {
    return 0;
  }
  HIDWORD(v6) = a3;
  LODWORD(v6) = a3;
  unsigned int v5 = v6 >> 16;
  while (1)
  {
    int v8 = (v3 + v4) / 2;
    uint64_t v7 = a1[38];
    unsigned int v9 = a1[39] <= (unint64_t)v8 ? 0 : (_DWORD *)(v7 + 8 * v8);
    HIDWORD(v11) = *v9;
    LODWORD(v11) = *v9;
    unsigned int v10 = v11 >> 16;
    if (v5 >= v10) {
      break;
    }
    int v4 = v8 - 1;
LABEL_11:
    if (v3 > v4) {
      return 0;
    }
  }
  if (v5 > v10)
  {
    int v3 = v8 + 1;
    goto LABEL_11;
  }
  unint64_t v12 = *(unsigned int *)(v7 + 8 * v8 + 4);
  if (a1[41] > v12) {
    return a1[40] + 16 * v12;
  }
  return 0;
}

uint64_t TUI::Package::Buffer::renderBodyForComponent(uint64_t a1, uint64_t a2)
{
  if (a2 && (unint64_t v2 = *(unsigned int *)(a2 + 24), *(void *)(a1 + 328) > v2)) {
    return *(void *)(a1 + 320) + 16 * v2;
  }
  else {
    return 0;
  }
}

uint64_t TUI::Package::Buffer::findName(uint64_t a1, int a2, unint64_t *a3)
{
  unint64_t v3 = a3[1] + *a3;
  if (*a3 >= v3) {
    return -1;
  }
  HIDWORD(v5) = a2;
  LODWORD(v5) = a2;
  unsigned int v4 = v5 >> 16;
  unint64_t v6 = *a3;
  while (1)
  {
    unint64_t v7 = (v6 + v3) >> 1;
    int v8 = *(void *)(a1 + 344) <= v7 ? 0 : (int *)(*(void *)(a1 + 336) + 4 * v7);
    int v9 = *v8;
    if (v9 == a2) {
      break;
    }
    HIDWORD(v10) = v9;
    LODWORD(v10) = v9;
    if (v4 >= (v10 >> 16)) {
      unint64_t v6 = v7 + 1;
    }
    else {
      unint64_t v3 = (v6 + v3) >> 1;
    }
    if (v6 >= v3) {
      return -1;
    }
  }
  return v7 - *a3;
}

TUI::Package::Attribute::NameMapper *TUI::Package::Attribute::NameMapper::NameMapper(TUI::Package::Attribute::NameMapper *this, const StringsSection *a2)
{
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  unint64_t count = a2->count;
  __int16 v23 = -1;
  uint64_t v22 = (void *)((char *)this + 24);
  sub_ED4A0((uint64_t)this + 24, count, &v23);
  if (a2->count)
  {
    unint64_t v5 = 0;
    do
    {
      if (a2->base)
      {
        id v6 = [objc_alloc((Class)NSString) initWithUTF8String:&a2->base[a2->offsets[v5]]];
        unsigned int v7 = +[TUIAttributeRegistry lookupAttributeWithName:v6];
      }
      else
      {
        unsigned int v7 = 0xFFFF;
      }
      int v9 = (_WORD *)*((void *)this + 1);
      unint64_t v8 = *((void *)this + 2);
      if ((unint64_t)v9 >= v8)
      {
        unint64_t v11 = *(_WORD **)this;
        uint64_t v12 = (uint64_t)v9 - *(void *)this;
        if (v12 <= -3) {
          sub_4484();
        }
        uint64_t v13 = v12 >> 1;
        unint64_t v14 = v8 - (void)v11;
        if (v14 <= (v12 >> 1) + 1) {
          unint64_t v15 = v13 + 1;
        }
        else {
          unint64_t v15 = v14;
        }
        if (v14 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v16 = v15;
        }
        if (v16)
        {
          __int16 v17 = (char *)sub_6B98((uint64_t)this + 16, v16);
          unint64_t v11 = *(_WORD **)this;
          int v9 = (_WORD *)*((void *)this + 1);
        }
        else
        {
          __int16 v17 = 0;
        }
        unint64_t v18 = &v17[2 * v13];
        *(_WORD *)unint64_t v18 = v7;
        unint64_t v10 = v18 + 2;
        while (v9 != v11)
        {
          __int16 v19 = *--v9;
          *((_WORD *)v18 - 1) = v19;
          v18 -= 2;
        }
        *(void *)this = v18;
        *((void *)this + 1) = v10;
        *((void *)this + 2) = &v17[2 * v16];
        if (v11) {
          operator delete(v11);
        }
      }
      else
      {
        *int v9 = v7;
        unint64_t v10 = v9 + 1;
      }
      *((void *)this + 1) = v10;
      unint64_t v20 = a2->count;
      if (v7 != 0xFFFF && v20 > v7) {
        *(_WORD *)(*v22 + 2 * v7) = v5;
      }
      ++v5;
    }
    while (v5 < v20);
  }
  return this;
}

void sub_177BD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void **a9)
{
  unint64_t v11 = *a9;
  if (*a9)
  {
    *(void *)(v9 + 32) = v11;
    operator delete(v11);
  }
  uint64_t v12 = *(void **)v9;
  if (*(void *)v9)
  {
    *(void *)(v9 + 8) = v12;
    operator delete(v12);
  }
  _Unwind_Resume(exception_object);
}

void TUI::Package::Attribute::NameMapper::~NameMapper(TUI::Package::Attribute::NameMapper *this)
{
  unint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }
  unint64_t v3 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v3;
    operator delete(v3);
  }
}

uint64_t *sub_177C58(void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }
  id v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void *sub_177D0C(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v13 = (void *)(a1 + 16);
  unint64_t v11 = operator new(0x30uLL);
  *unint64_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[4] = 0;
  v11[5] = 0;
  v11[3] = 0;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    sub_3ED8(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *unint64_t v11 = *v21;
LABEL_38:
    *unint64_t v21 = v11;
    goto LABEL_39;
  }
  *unint64_t v11 = *v13;
  void *v13 = v11;
  *(void *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    unint64_t v22 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_177F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_EF480(v11, v10);
  _Unwind_Resume(a1);
}

void sub_1783B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1787EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1788B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)TUIImageLayer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_178D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

void *sub_178E10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v2 == result[4]) {
    return [result updateContentAllowCrossfade:1];
  }
  return result;
}

void sub_179070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1791D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_179268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1792E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17942C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1795D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)TUIImageBoxLayout;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_179650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1796A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_179778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1797A0(uint64_t a1)
{
  return 1;
}

void sub_1799C0(_Unwind_Exception *a1)
{
  unint64_t v8 = v4;

  _Unwind_Resume(a1);
}

void sub_179DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_17A0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17A13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17A1BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17A7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_17AC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_17D9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_17D9D4(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) addObject:@", "];
  }
  unint64_t v3 = *(void **)(a1 + 32);
  unint64_t v4 = [v5 description];
  [v3 addObject:v4];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void *TUIAnimationCollectionViewAnimationForView(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a4;
  unint64_t v17 = [v13 indexPath];
  id v34 = v11;
  unint64_t v18 = [v11 viewModelForIndexPath:v17];
  id v19 = [v18 identifier];
  id v35 = v14;
  id v20 = v15;
  LOBYTE(v15) = [v16 containsObject:v19];

  unint64_t v21 = v12;
  if (v15)
  {
    unint64_t v22 = @"appearing";
  }
  else if ([v20 containsObject:v19])
  {
    unint64_t v22 = @"disappearing";
  }
  else if ([v35 containsObject:v19])
  {
    unint64_t v22 = @"update";
  }
  else
  {
    unint64_t v22 = @"default";
  }
  __int16 v23 = v13;

  unint64_t v24 = v22;
  unint64_t v25 = [v18 animationRenderModels];
  __int16 v26 = [v25 groupPhases];
  unint64_t v27 = [v26 objectForKeyedSubscript:@"default"];

  char v28 = [v27 phaseRenderModels];
  unint64_t v29 = [v28 objectForKeyedSubscript:v24];

  if ([v29 count])
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_17E9A8;
    v36[3] = &unk_2571C8;
    id v37 = v29;
    unint64_t v30 = v34;
    id v38 = v34;
    id v39 = v21;
    id v40 = v23;
    id v41 = v17;
    unint64_t v31 = objc_retainBlock(v36);
  }
  else
  {
    unint64_t v31 = 0;
    unint64_t v30 = v34;
  }
  uint64_t v32 = objc_retainBlock(v31);

  return v32;
}

void sub_17E9A8(id *a1, void *a2)
{
  id v49 = a2;
  unint64_t v3 = dispatch_group_create();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = a1[4];
  id v4 = [obj countByEnumeratingWithState:&v73 objects:v92 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v74;
    uint64_t v50 = v78;
    unint64_t v51 = v86;
    unint64_t v53 = a1;
    unint64_t v54 = v3;
    uint64_t v52 = *(void *)v74;
    do
    {
      unint64_t v7 = 0;
      id v55 = v5;
      do
      {
        if (*(void *)v74 != v6) {
          objc_enumerationMutation(obj);
        }
        unint64_t v8 = *(void **)(*((void *)&v73 + 1) + 8 * (void)v7);
        uint8x8_t v9 = [v8 models:v49, v50, v51];
        if ([v9 count])
        {
          UIAnimationDragCoefficient();
          double v11 = v10;
          dispatch_group_enter(v3);
          [v8 duration];
          double v13 = v12 * v11;
          [v8 delay];
          double v15 = v14 * v11;
          unint64_t v16 = (unint64_t)[v8 options] | 0xE20;
          v68[0] = _NSConcreteStackBlock;
          v68[1] = 3221225472;
          v68[2] = sub_17EFBC;
          v68[3] = &unk_252678;
          id v69 = v9;
          id v70 = a1[5];
          id v71 = a1[8];
          id v72 = a1[6];
          v66[0] = _NSConcreteStackBlock;
          v66[1] = 3221225472;
          v66[2] = sub_17F224;
          v66[3] = &unk_2571A0;
          unint64_t v67 = v3;
          +[UIView animateKeyframesWithDuration:v16 delay:v68 options:v66 animations:v13 completion:v15];

          goto LABEL_18;
        }
        id v17 = v8;
        unint64_t v18 = [v17 from];
        if (v18 || ([v17 to], (unint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
        {
        }
        else
        {
          double v45 = [v17 models];
          id v46 = [v45 count];

          if (v46)
          {
            TUIReusableSubviewApplyLayoutAttributes(a1[6], a1[7]);
            goto LABEL_18;
          }
        }
        unint64_t v63 = v9;
        id v19 = a1[6];
        id v20 = a1[7];
        id v21 = a1[5];
        id v59 = v19;
        id v22 = v20;
        id v23 = v17;
        uint64_t v61 = v3;
        unint64_t v24 = [v22 indexPath];
        unint64_t v25 = [v23 from];
        __int16 v26 = [v23 to];
        unint64_t v27 = [v25 keyPaths];
        char v28 = v27;
        if (v27)
        {
          id v29 = v27;
        }
        else
        {
          id v29 = [v26 keyPaths];
        }
        unint64_t v30 = v29;

        unint64_t v31 = [v26 keyPaths];
        uint64_t v32 = v31;
        uint64_t v62 = v23;
        if (v31)
        {
          id v33 = v31;
        }
        else
        {
          id v33 = [v25 keyPaths];
        }
        id v34 = v33;

        v85[0] = _NSConcreteStackBlock;
        v85[1] = 3221225472;
        v86[0] = sub_180714;
        v86[1] = &unk_257290;
        id v87 = v25;
        id v35 = v21;
        id v88 = v35;
        id v36 = v24;
        id v89 = v36;
        id v37 = v59;
        id v90 = v37;
        id v91 = v30;
        id v60 = v25;
        id v58 = v30;
        id v38 = objc_retainBlock(v85);
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v78[0] = sub_180844;
        v78[1] = &unk_2572B8;
        id v79 = v26;
        id v80 = v35;
        id v81 = v36;
        id v82 = v22;
        id v83 = v37;
        id v84 = v34;
        id v57 = v26;
        id v39 = v35;
        id v40 = v36;
        id v41 = v22;
        id v42 = v37;
        id v43 = v34;
        unint64_t v44 = objc_retainBlock(v77);
        sub_180900(v39, v62, v61, v38, v44);

        a1 = v53;
        unint64_t v3 = v54;
        id v5 = v55;
        uint64_t v6 = v52;
        uint8x8_t v9 = v63;
LABEL_18:

        unint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v47 = [obj countByEnumeratingWithState:&v73 objects:v92 count:16];
      id v5 = v47;
    }
    while (v47);
  }

  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_17F22C;
  v64[3] = &unk_2519B8;
  id v65 = v49;
  id v48 = v49;
  TUIDispatchGroupNotifyViaRunloopIfMain(v3, &_dispatch_main_q, v64);
}

void sub_17EFBC(uint64_t a1)
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v22;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v22 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v5);
        uint64_t v7 = objc_opt_class();
        unint64_t v8 = [v6 renderModel];
        uint8x8_t v9 = TUIDynamicCast(v7, v8);

        float v10 = [*(id *)(a1 + 40) layoutAttributesForViewModel:v9 atIndexPath:*(void *)(a1 + 48) withLiveTransformResolver:0];
        [v6 stepStartTime];
        double v12 = v11;
        [v6 stepDuration];
        double v14 = v13;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_17F1C8;
        v17[3] = &unk_252320;
        id v18 = *(id *)(a1 + 56);
        id v19 = v10;
        id v20 = v6;
        id v15 = v10;
        +[UIView addKeyframeWithRelativeStartTime:v17 relativeDuration:v12 animations:v14];

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }
}

void sub_17F1C8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) keyPaths];
  TUIReusableRenderViewApplyLayoutAttributesWithKeyNames(v1, v2, v3);
}

void sub_17F224(uint64_t a1)
{
}

uint64_t sub_17F22C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

CFStringRef TUIAnimationAnimationPhaseForSectionView(void *a1, void *a2, char a3)
{
  id v5 = a1;
  uint64_t v6 = [a2 renderModel];
  [v5 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v23.origin.x = v8;
  v23.origin.y = v10;
  v23.size.width = v12;
  v23.size.height = v14;
  double v15 = fabs(CGRectGetHeight(v23));
  [v6 frame];
  double v16 = fabs(CGRectGetHeight(v24));
  CFStringRef v17 = @"update";
  CFStringRef v18 = @"default";
  CFStringRef v19 = @"appearing";
  if ((a3 & 8) != 0) {
    CFStringRef v19 = @"default";
  }
  if (v16 >= 2.22044605e-16)
  {
    BOOL v20 = (a3 & 0x10) == 0;
  }
  else
  {
    CFStringRef v17 = v19;
    BOOL v20 = 0;
  }
  if (v20) {
    CFStringRef v18 = @"disappearing";
  }
  if (v15 < 2.22044605e-16) {
    CFStringRef v21 = v18;
  }
  else {
    CFStringRef v21 = v17;
  }

  return v21;
}

void *_TUIAnimationForSectionViewInPhase(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if ([v7 isEqualToString:@"appearing"])
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_17F6F8;
    v41[3] = &unk_251828;
    CGFloat v8 = &v42;
    id v9 = v6;
    id v42 = v9;
    CGFloat v10 = &v43;
    id v43 = v5;
    double v11 = objc_retainBlock(v41);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_17F7E4;
    v39[3] = &unk_251990;
    id v40 = v9;
    CGFloat v12 = objc_retainBlock(v39);
  }
  else
  {
    if ([v7 isEqualToString:@"disappearing"])
    {
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_17F7F0;
      v36[3] = &unk_251828;
      CGFloat v8 = &v37;
      id v13 = v6;
      id v37 = v13;
      CGFloat v10 = &v38;
      id v14 = v5;
      id v38 = v14;
      CGFloat v12 = objc_retainBlock(v36);
      [v14 frame];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_17F870;
      v30[3] = &unk_2571F0;
      uint64_t v32 = v15;
      uint64_t v33 = v16;
      uint64_t v34 = v17;
      uint64_t v35 = v18;
      id v31 = v13;
      CFStringRef v19 = objc_retainBlock(v30);

      double v11 = 0;
      goto LABEL_8;
    }
    if (![v7 isEqualToString:@"update"])
    {
      CFStringRef v19 = 0;
      CGFloat v12 = 0;
      double v11 = 0;
      goto LABEL_11;
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_17F904;
    v27[3] = &unk_251828;
    CGFloat v8 = &v28;
    id v28 = v6;
    CGFloat v10 = &v29;
    id v29 = v5;
    CGFloat v12 = objc_retainBlock(v27);
    double v11 = 0;
  }
  CFStringRef v19 = 0;
LABEL_8:

  if (v12)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_17F948;
    v23[3] = &unk_257240;
    double v11 = v11;
    id v24 = v11;
    CGFloat v12 = v12;
    id v25 = v12;
    CFStringRef v19 = v19;
    id v26 = v19;
    BOOL v20 = objc_retainBlock(v23);

    goto LABEL_12;
  }
LABEL_11:
  BOOL v20 = 0;
LABEL_12:
  CFStringRef v21 = objc_retainBlock(v20);

  return v21;
}

void sub_17F6F8(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_17F7A0;
  v2[3] = &unk_251828;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  +[UIView performWithoutAnimation:v2];
}

id sub_17F7A0(uint64_t a1)
{
  TUISectionViewApplyRenderModelSection(*(void **)(a1 + 32), *(void **)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  return [v2 setAlpha:0.0];
}

id sub_17F7E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id sub_17F7F0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    [v2 transform];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
  }
  id v3 = [*(id *)(a1 + 32) layer];
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  [v3 setAffineTransform:v5];

  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_17F870(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) renderModel];
    [v3 frame];
    v15.origin.x = v4;
    v15.origin.y = v5;
    v15.size.width = v6;
    v15.size.height = v7;
    BOOL v8 = CGRectEqualToRect(*(CGRect *)(a1 + 40), v15);

    if (v8)
    {
      double v9 = *(double *)(a1 + 40);
      double v10 = *(double *)(a1 + 48);
      double v11 = *(double *)(a1 + 56);
      double v12 = *(double *)(a1 + 64);
      id v13 = *(void **)(a1 + 32);
      [v13 setFrame:v9, v10, v11, v12];
    }
  }
}

void sub_17F904(uint64_t a1)
{
  [*(id *)(a1 + 40) frame];
  [*(id *)(a1 + 32) setFrame:];
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);

  TUISectionViewApplyRenderModelSection(v2, v3);
}

void sub_17F948(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGFloat v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_17FAA8;
  _DWORD v12[3] = &unk_257218;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v13 = v4;
  id v14 = v7;
  BOOL v8 = v4;
  +[UIView animateWithDuration:0 delay:v6 options:v12 animations:0.0 completion:0.0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_17FAF0;
  v10[3] = &unk_2519B8;
  id v11 = v3;
  id v9 = v3;
  TUIDispatchGroupNotifyViaRunloopIfMain(v8, &_dispatch_main_q, v10);
}

void sub_17FAA8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

uint64_t sub_17FAF0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void *TUIAnimationCollectionViewAnimationForSectionView(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [v6 renderModel];
  if ((id)v7 == v5)
  {
  }
  else
  {
    BOOL v8 = (void *)v7;
    unsigned int v9 = +[TUIFeedView areFeedUpdatesAnimated];

    if (v9)
    {
      double v10 = TUIAnimationAnimationPhaseForSectionView(v5, v6, a3);
      id v11 = [v5 animationRenderModels];
      double v12 = [v11 groupPhases];
      id v13 = [v12 objectForKeyedSubscript:@"default"];

      id v14 = [v13 phaseRenderModels];
      CGRect v15 = [v14 objectForKeyedSubscript:v10];

      if ([v15 count])
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_17FCF8;
        v19[3] = &unk_257268;
        id v20 = v10;
        id v21 = v6;
        id v22 = v5;
        id v23 = v15;
        uint64_t v16 = objc_retainBlock(v19);
      }
      else
      {
        uint64_t v16 = _TUIAnimationForSectionViewInPhase(v5, v6, v10);
      }

      goto LABEL_9;
    }
  }
  uint64_t v16 = 0;
LABEL_9:
  uint64_t v17 = objc_retainBlock(v16);

  return v17;
}

void sub_17FCF8(id *a1, void *a2)
{
  id v54 = a2;
  id v3 = dispatch_group_create();
  if ([a1[4] isEqualToString:@"appearing"])
  {
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    void v77[2] = sub_1803B4;
    v77[3] = &unk_251828;
    id v78 = a1[5];
    id v79 = a1[6];
    +[UIView performWithoutAnimation:v77];
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = a1[7];
  id v4 = [obj countByEnumeratingWithState:&v73 objects:v88 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v74;
    id v56 = a1;
    id v57 = v3;
    uint64_t v55 = *(void *)v74;
    do
    {
      uint64_t v7 = 0;
      id v58 = v5;
      do
      {
        if (*(void *)v74 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v73 + 1) + 8 * (void)v7);
        unsigned int v9 = [v8 models];
        if ([v9 count])
        {
          UIAnimationDragCoefficient();
          double v11 = v10;
          dispatch_group_enter(v3);
          [v8 duration];
          double v13 = v12 * v11;
          [v8 delay];
          double v15 = v14 * v11;
          unint64_t v16 = (unint64_t)[v8 options] | 0xE20;
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = sub_1804A4;
          v70[3] = &unk_251828;
          id v71 = v9;
          id v72 = a1[5];
          v68[0] = _NSConcreteStackBlock;
          v68[1] = 3221225472;
          v68[2] = sub_1806F0;
          v68[3] = &unk_2571A0;
          id v69 = v3;
          +[UIView animateKeyframesWithDuration:v16 delay:v70 options:v68 animations:v13 completion:v15];

          goto LABEL_20;
        }
        id v17 = v8;
        uint64_t v18 = [v17 from];
        if (v18 || ([v17 to], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
        {
        }
        else
        {
          id v46 = [v17 models];
          id v47 = [v46 count];

          if (v47)
          {
            id v48 = [v17 to];
            id v49 = [v48 renderModel];
            id v50 = a1[5];
            unint64_t v51 = [v48 keyPaths];
            sub_1803C0(v49, v50, v51);

            goto LABEL_20;
          }
        }
        id v19 = a1[6];
        id v20 = a1[5];
        id v21 = v17;
        id v22 = v3;
        id v23 = v19;
        id v24 = [v21 from];
        uint64_t v62 = v21;
        id v25 = [v21 to];
        id v26 = [v24 keyPaths];
        unint64_t v27 = v26;
        if (v26)
        {
          id v28 = v26;
        }
        else
        {
          id v28 = [v25 keyPaths];
        }
        id v29 = v28;

        unint64_t v30 = [v25 keyPaths];
        id v31 = v30;
        unint64_t v64 = v23;
        id v65 = v22;
        if (v30)
        {
          id v32 = v30;
        }
        else
        {
          id v32 = [v24 keyPaths];
        }
        uint64_t v33 = v32;

        uint64_t v34 = objc_opt_class();
        [v24 renderModel];
        uint64_t v35 = v63 = v24;
        id v36 = TUIDynamicCast(v34, v35);

        uint64_t v37 = objc_opt_class();
        id v38 = [v25 renderModel];
        id v39 = TUIDynamicCast(v37, v38);

        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472;
        v84[2] = sub_180B44;
        v84[3] = &unk_252320;
        id v85 = v36;
        id v40 = v20;
        id v86 = v40;
        id v87 = v29;
        id v61 = v36;
        id v60 = v29;
        id v41 = objc_retainBlock(v84);
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = sub_180C14;
        v80[3] = &unk_252320;
        id v81 = v39;
        id v82 = v40;
        id v83 = v33;
        id v42 = v39;
        id v43 = v40;
        id v44 = v33;
        double v45 = objc_retainBlock(v80);
        sub_180900(v64, v62, v65, v41, v45);

        a1 = v56;
        id v3 = v57;
        uint64_t v6 = v55;
        id v5 = v58;
LABEL_20:

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v52 = [obj countByEnumeratingWithState:&v73 objects:v88 count:16];
      id v5 = v52;
    }
    while (v52);
  }

  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_1806F8;
  v66[3] = &unk_2519B8;
  id v67 = v54;
  id v53 = v54;
  TUIDispatchGroupNotifyViaRunloopIfMain(v3, &_dispatch_main_q, v66);
}

void sub_1803B4(uint64_t a1)
{
}

void sub_1803C0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  BOOL v8 = v7;
  if (!v7)
  {
    [v5 alpha];
    [v6 setAlpha:];
    if (v5) {
      goto LABEL_6;
    }
    goto LABEL_8;
  }
  if ([v7 containsObject:@"alpha"])
  {
    [v5 alpha];
    [v6 setAlpha:];
  }
  if ([v8 containsObject:@"transform"])
  {
    if (v5)
    {
LABEL_6:
      [v5 transform];
LABEL_9:
      v9[0] = v10;
      v9[1] = v11;
      v9[2] = v12;
      [v6 setTransform:v9];
      goto LABEL_10;
    }
LABEL_8:
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    goto LABEL_9;
  }
LABEL_10:
}

void sub_1804A4(uint64_t a1)
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v21;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v5);
        uint64_t v7 = objc_opt_class();
        BOOL v8 = [v6 renderModel];
        unsigned int v9 = TUIDynamicCast(v7, v8);

        [v6 stepStartTime];
        double v11 = v10;
        [v6 stepDuration];
        double v13 = v12;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_180694;
        v16[3] = &unk_252320;
        id v17 = v9;
        id v18 = *(id *)(a1 + 40);
        id v19 = v6;
        id v14 = v9;
        +[UIView addKeyframeWithRelativeStartTime:v16 relativeDuration:v11 animations:v13];

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v3);
  }
}

void sub_180694(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) keyPaths];
  sub_1803C0(v1, v2, v3);
}

void sub_1806F0(uint64_t a1)
{
}

uint64_t sub_1806F8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void sub_180714(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  id v3 = [*(id *)(a1 + 32) renderModel];
  uint64_t v4 = TUIDynamicCast(v2, v3);

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) layoutAttributesForViewModel:v4 atIndexPath:*(void *)(a1 + 48) withLiveTransformResolver:0];
    if (v5)
    {
      id v6 = (void *)v5;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_180834;
      v8[3] = &unk_252320;
      id v9 = *(id *)(a1 + 56);
      id v10 = v6;
      id v11 = *(id *)(a1 + 64);
      id v7 = v6;
      +[UIView performWithoutAnimation:v8];
    }
  }
}

void sub_180834(void **a1)
{
}

void sub_180844(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  id v3 = [*(id *)(a1 + 32) renderModel];
  TUIDynamicCast(v2, v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5
    || ([*(id *)(a1 + 40) layoutAttributesForViewModel:v5 atIndexPath:*(void *)(a1 + 48) withLiveTransformResolver:0], (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = *(id *)(a1 + 56);
  }
  TUIReusableRenderViewApplyLayoutAttributesWithKeyNames(*(void **)(a1 + 64), v4, *(void **)(a1 + 72));
}

void sub_180900(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  double v12 = a4;
  id v13 = a5;
  if (v11) {
    dispatch_group_enter(v11);
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_180B34;
  v32[3] = &unk_2571A0;
  id v14 = v11;
  uint64_t v33 = v14;
  double v15 = objc_retainBlock(v32);
  double v31 = 0.0;
  float64x2_t v29 = 0u;
  float64x2_t v30 = 0u;
  if (v10) {
    [v10 timing];
  }
  unint64_t v16 = (unint64_t)[v10 options] | 0x260;
  UIAnimationDragCoefficient();
  float v18 = v17;
  if (v12) {
    v12[2](v12);
  }
  double v19 = v18;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v29, (float64x2_t)TUISpringTimingParametersZero), (int32x4_t)vceqq_f64(v30, unk_243500))), 0xFuLL))) & 1) != 0&& v31 == 0.0)
  {
    [v10 duration:0.0];
    double v21 = v20 * v19;
    [v10 delay];
    +[UIView animateWithDuration:v16 delay:v13 options:v15 animations:v21 completion:v22 * v19];
  }
  else
  {
    v27[0] = v29;
    v27[1] = v30;
    double v28 = v31;
    double v23 = TUISpringTimingCalculateDampingRatio((double *)v27);
    [v10 duration];
    double v25 = v24 * v19;
    [v10 delay];
    +[UIView animateWithDuration:v16 delay:v13 usingSpringWithDamping:v15 initialSpringVelocity:v25 options:v26 * v19 animations:v23 completion:v30.f64[1]];
  }
}

void sub_180B34(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

void sub_180B44(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_180C04;
    v3[3] = &unk_252320;
    id v4 = v1;
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    +[UIView performWithoutAnimation:v3];
  }
}

void sub_180C04(void **a1)
{
}

void sub_180C14(void **a1)
{
}

void TUISectionViewApplyRenderModelSection(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v4)
  {
    [v4 transform];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
  }
  id v6 = [v3 layer];
  v10[0] = v11;
  v10[1] = v12;
  v10[2] = v13;
  [v6 setAffineTransform:v10];

  if (v5)
  {
    [v5 config];
    double v7 = (double)v9;
  }
  else
  {
    double v7 = 0.0;
  }
  BOOL v8 = [v3 layer];
  [v8 setZPosition:v7];

  [v5 frame];
  [v3 setFrame:];
  [v5 alpha];
  [v3 setAlpha:];
}

void TUIReusableSubviewApplyLayoutAttributes(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v4 center];
  [v3 setCenter:];
  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  [v4 size];
  double v10 = v9;
  double v12 = v11;
  unsigned int v13 = [v3 shouldResetBoundsOriginWhenApplyingLayoutAttributes];
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  if (!v13)
  {
    double y = v8;
    double x = v6;
  }
  [v3 setBounds:x, y, v10, v12];
  [v4 alpha];
  [v3 setAlpha:];
  double v16 = (double)(uint64_t)[v4 zIndex];
  float v17 = [v3 layer];
  [v17 setZPosition:v16];

  if (v4)
  {
    [v4 transform];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
  }
  float v18 = [v3 layer];
  v19[0] = v20;
  v19[1] = v21;
  v19[2] = v22;
  [v18 setAffineTransform:v19];

  [v3 setLayoutAttributes:v4];
  [v3 applyLayoutAttributes:v4];
}

void TUIReusableRenderViewApplyLayoutAttributes(void *a1, void *a2)
{
  id v3 = a2;
  id v6 = a1;
  double v4 = (double)(uint64_t)[v3 zIndex];
  double v5 = [v6 layer];
  [v5 setZPosition:v4];

  [v6 setLayoutAttributes:v3];
}

void TUIReusableRenderViewApplyLayoutAttributesWithKeyNames(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  double v8 = v7;
  if (v7)
  {
    if ([v7 containsObject:@"center"])
    {
      [v6 center];
      [v5 setCenter:];
    }
    if (([v8 containsObject:@"bounds"] & 1) == 0) {
      goto LABEL_10;
    }
  }
  else
  {
    [v6 center];
    [v5 setCenter:];
  }
  [v5 bounds];
  double v10 = v9;
  double v12 = v11;
  [v6 size];
  double v14 = v13;
  double v16 = v15;
  unsigned int v17 = [v5 shouldResetBoundsOriginWhenApplyingLayoutAttributes];
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  if (!v17)
  {
    double y = v12;
    double x = v10;
  }
  [v5 setBounds:x, y, v14, v16];
  if (!v8)
  {
    [v6 alpha];
    [v5 setAlpha:];
    if (v6) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_10:
  if ([v8 containsObject:@"alpha"])
  {
    [v6 alpha];
    [v5 setAlpha:];
  }
  if ([v8 containsObject:@"transform"])
  {
    if (v6)
    {
LABEL_14:
      [v6 transform];
LABEL_17:
      long long v20 = [v5 layer];
      v21[0] = v22;
      v21[1] = v23;
      v21[2] = v24;
      [v20 setAffineTransform:v21];

      goto LABEL_18;
    }
LABEL_16:
    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
    goto LABEL_17;
  }
LABEL_18:
  [v5 applyLayoutAttributes:v6];
}

id TUIPlatformAncestorOfClass(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v4 = [v3 superview];

      id v3 = (void *)v4;
      if (!v4) {
        goto LABEL_5;
      }
    }
    id v5 = v3;
  }
  else
  {
LABEL_5:
    id v5 = 0;
  }

  return v5;
}

id TUIPlatformAncestorOfClassAndProtocol(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = a3;
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    double v8 = v6;
    while ((objc_opt_isKindOfClass() & 1) == 0 || ![v8 conformsToProtocol:v5])
    {
      uint64_t v9 = [v8 superview];

      double v8 = (void *)v9;
      if (!v9) {
        goto LABEL_6;
      }
    }
    id v10 = v8;
  }
  else
  {
LABEL_6:
    id v10 = 0;
  }

  return v10;
}

void TUIPlatformRenderInContext(CGContext *a1, void *a2)
{
  id v3 = a2;
  UIGraphicsPushContext(a1);
  if (v3) {
    v3[2]();
  }
  UIGraphicsPopContext();
}

id sub_181CCC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) newUIMenuElement];

  return v1;
}

id sub_181EE0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) newUIMenuElement];

  return v1;
}

BOOL sub_182464(id a1, id a2)
{
  uint64_t v2 = [a2 _accessibilityViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_183100(uint64_t a1, CGContextRef c)
{
  CGContextScaleCTM(c, 1.0, -1.0);
  CGContextTranslateCTM(c, 0.0, -*(double *)(a1 + 56));
  CGContextSaveGState(c);
  CGContextClipToMask(c, *(CGRect *)(a1 + 64), (CGImageRef)[*(id *)(a1 + 32) CGImage]);
  CGContextSetBlendMode(c, kCGBlendModeMultiply);
  CGContextSetFillColorWithColor(c, (CGColorRef)[*(id *)(a1 + 40) CGColor]);
  CGContextFillRect(c, *(CGRect *)(a1 + 64));

  CGContextRestoreGState(c);
}

uint64_t sub_1831B8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 CGContext];
  id v4 = *(uint64_t (**)(uint64_t, id))(v2 + 16);

  return v4(v2, v3);
}

void sub_1848A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 removeInterest];
  [v4 removeObserver:*(void *)(a1 + 32)];
}

id sub_1849D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromState];
}

void sub_186258(id a1, TUIIdentifier *a2, TUIImageResource *a3, BOOL *a4)
{
}

void sub_186260(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 removeInterest];
  [v4 removeObserver:*(void *)(a1 + 32)];
}

id sub_1862B4(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 addObserver:*(void *)(a1 + 32)];
}

void sub_18635C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) renderModel];
  id v3 = [v2 imageModelIDToResource];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1864E4;
  void v13[3] = &unk_251920;
  id v14 = *(id *)(a1 + 40);
  id v4 = [v3 keysOfEntriesPassingTest:v13];
  id v5 = [v4 allObjects];

  if ([v5 count])
  {
    id v6 = [*(id *)(a1 + 32) renderModel];
    id v7 = [v6 imageModelIDToResource];
    double v8 = [v7 objectsForKeys:v5 notFoundMarker:*(void *)(a1 + 40)];

    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v5];
    id v10 = [*(id *)(a1 + 32) control];
    double v11 = [v10 tui_menu];
    [v11 loadImagesFromResourceMap:v9];

    double v12 = [*(id *)(a1 + 32) control];
    [v12 menuDataDidUpdate];
  }
}

BOOL sub_1864E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)(a1 + 32) == a3;
}

id sub_186C74(uint64_t a1)
{
  [*(id *)(a1 + 32) updateFromState];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

id sub_186DA0(uint64_t a1)
{
  [*(id *)(a1 + 32) updateFromState];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

void sub_186F60(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) feedControllerHost];
  id v3 = [v2 contextMenuConfigurationProvider];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 152);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_18702C;
  _OWORD v5[3] = &unk_2573F0;
  id v6 = *(id *)(a1 + 40);
  [v3 menuElementsWithData:v4 completion:v5];
}

void sub_18702C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1870C4;
  void v6[3] = &unk_2572E0;
  id v7 = v3;
  id v5 = v3;
  [v4 updateVisibleMenuWithBlock:v6];
}

id sub_1870C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[TUIControlView menuWithChildren:*(void *)(a1 + 32)];
  id v5 = [objc_alloc((Class)NSMutableArray) initWithObjects:v4, 0];
  if ([v5 count])
  {
    while (1)
    {
      uint64_t v6 = objc_opt_class();
      id v7 = [v5 firstObject];
      TUIDynamicCast(v6, v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      [v5 removeObjectAtIndex:0];
      uint64_t v9 = [v8 identifier];
      id v10 = [v3 identifier];
      unsigned __int8 v11 = [v9 isEqual:v10];

      if (v11) {
        break;
      }
      if (v8)
      {
        double v12 = [v8 children];
        id v13 = [v12 count];

        if (v13)
        {
          id v14 = [v8 children];
          [v5 addObjectsFromArray:v14];
        }
      }

      if (![v5 count]) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    id v8 = v3;
  }

  return v8;
}

void sub_1877D4(id a1)
{
  v3[0] = &off_268330;
  v3[1] = &off_268360;
  v4[0] = &off_268348;
  v4[1] = &off_268378;
  v3[2] = &off_268390;
  v3[3] = &off_2683A8;
  v4[2] = &off_268378;
  v4[3] = &off_2683C0;
  void v3[4] = &off_2683D8;
  void v3[5] = &off_268408;
  v4[4] = &off_2683F0;
  v4[5] = &off_268420;
  v3[6] = &off_268438;
  void v4[6] = &off_268450;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:7];
  uint64_t v2 = (void *)qword_2DFA78;
  qword_2DFA78 = v1;
}

void sub_187978(id a1)
{
  v3[0] = &off_268330;
  v3[1] = &off_268360;
  v4[0] = &off_268348;
  v4[1] = &off_268378;
  v3[2] = &off_2683A8;
  v3[3] = &off_2683D8;
  v4[2] = &off_268468;
  v4[3] = &off_268480;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  uint64_t v2 = (void *)qword_2DFA88;
  qword_2DFA88 = v1;
}

void sub_187ACC(id a1)
{
  v3[0] = @"default";
  v3[1] = @"highlighted";
  v4[0] = &off_268330;
  v4[1] = &off_268360;
  v3[2] = @"disabled";
  v4[2] = &off_2683A8;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  uint64_t v2 = (void *)qword_2DFA98;
  qword_2DFA98 = v1;
}

void sub_187C34(id a1)
{
  v3[0] = &off_268330;
  v3[1] = &off_268360;
  v4[0] = &off_268348;
  v4[1] = &off_268378;
  v3[2] = &off_2683A8;
  v4[2] = &off_268468;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  uint64_t v2 = (void *)qword_2DFAA8;
  qword_2DFAA8 = v1;
}

void sub_187EB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_187ED4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 144));
    id v5 = (void *)WeakRetained[19];
    WeakRetained[19] = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 144));
    uint64_t v6 = [WeakRetained renderModel];
    id v7 = [v6 actionHandler];
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_188070;
    _OWORD v9[3] = &unk_2574C0;
    v9[4] = *(void *)(a1 + 32);
    void v9[5] = WeakRetained;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    id v10 = v3;
    [v7 invoke:@"context-menu" view:v8 point:v9 completion:*(double *)(a1 + 48) *(double *)(a1 + 56)];

    objc_destroyWeak(&v11);
  }
  else
  {
    (*((void (**)(id, void *))v3 + 2))(v3, &__NSArray0__struct);
  }
}

void sub_18805C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_188070(uint64_t a1, void *a2)
{
  id v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 144));
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 152), a2);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 144));
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  uint64_t v9 = sub_188218;
  id v10 = &unk_257498;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  id v5 = v4;
  id v11 = v5;
  id v12 = *(id *)(a1 + 48);
  uint64_t v6 = &v7;
  if (+[NSThread isMainThread])
  {
    v9((uint64_t)v6);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_188514;
    block[3] = &unk_2519B8;
    double v15 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  objc_destroyWeak(&v13);
}

void sub_188204(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_188218(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained feedControllerHost];
  id v3 = [v2 contextMenuConfigurationProvider];
  uint64_t v4 = [v3 menuElementsWithData:*(void *)(a1 + 32)];
  id v5 = (void *)v4;
  uint64_t v6 = &__NSArray0__struct;
  if (v4) {
    uint64_t v6 = (void *)v4;
  }
  id v7 = v6;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_1882D4(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v1 = +[NSArray arrayWithObjects:&v4 count:1];
  uint64_t v2 = +[TUIControlView menuWithChildren:v1];

  return v2;
}

uint64_t sub_188514(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_188524(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

NSString *TUILengthDescription(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIWORD(a2) & 7;
  CFStringRef v3 = @"I";
  if (v2 != 1 && v2 != 4) {
    CFStringRef v3 = &stru_257BF0;
  }
  if ((a2 & 0x6000000000000) == 0x2000000000000) {
    CFStringRef v5 = @"a";
  }
  else {
    CFStringRef v5 = &stru_257BF0;
  }
  if ((unint64_t)(v2 - 5) >= 2) {
    CFStringRef v6 = &stru_257BF0;
  }
  else {
    CFStringRef v6 = @"i";
  }
  return +[NSString stringWithFormat:@"<TUILength v=%f min=%f max=%f prio=%d %@%@%@>", *(float *)&a1, *((float *)&a1 + 1), *(float *)&a2, ((int)(a2 >> 16) >> 16), v3, v5, v6];
}

uint64_t TUILengthWithDelta(uint64_t a1, uint64_t a2, double a3)
{
  float v3 = *(float *)&a1 + a3;
  double v4 = v3;
  float v5 = *((float *)&a1 + 1) + a3;
  double v6 = v5;
  if (v4 <= -3.40282347e38)
  {
    float v7 = -3.4028e38;
  }
  else
  {
    float v7 = v4;
    if (v4 >= 3.40282347e38) {
      float v7 = 3.4028e38;
    }
  }
  *(float *)&uint64_t v11 = v7;
  if (v6 <= -3.40282347e38)
  {
    int v9 = -8388609;
LABEL_11:
    float v8 = *(float *)&v9;
    goto LABEL_12;
  }
  if (v6 >= 3.40282347e38)
  {
    int v9 = 2139095039;
    goto LABEL_11;
  }
  float v8 = v6;
LABEL_12:
  *((float *)&v11 + 1) = v8;
  HIDWORD(v12) = WORD2(a2);
  bzero((char *)&v12 + 6, 2uLL);
  return v11;
}

uint64_t TUILengthCombine(float *a1, uint64_t a2)
{
  if (a2 < 1)
  {
    HIWORD(v11) = 0;
    int32x2_t v10 = vdup_n_s32(0x7FC00000u);
    float v8 = NAN;
  }
  else
  {
    uint64_t v2 = &a1[4 * a2];
    float v3 = NAN;
    float v4 = NAN;
    float v5 = NAN;
    do
    {
      float v6 = fmaxf(v5, *a1);
      float v5 = v6;
      float v4 = fmaxf(v4, a1[1]);
      float v7 = fminf(v3, a1[2]);
      float v3 = v7;
      a1 += 4;
    }
    while (a1 < v2);
    HIWORD(v11) = 0;
    *(float *)v10.i32 = v6;
    float v8 = fmaxf(v7, v4);
    *(float *)&v10.i32[1] = v4;
  }
  uint64_t v11 = LODWORD(v8);
  bzero((char *)&v11 + 6, 2uLL);
  return (uint64_t)v10;
}

uint64_t TUILengthSum(unint64_t a1, uint64_t a2)
{
  if (a2 < 1)
  {
    unsigned __int16 v3 = 0;
    LODWORD(v11) = 0;
    HIWORD(v12) = 0;
LABEL_9:
    HIDWORD(v11) = 2143289344;
    goto LABEL_10;
  }
  char v2 = 0;
  unsigned __int16 v3 = 0;
  unint64_t v4 = a1 + 16 * a2;
  float v5 = 0.0;
  float v6 = 0.0;
  float v7 = 0.0;
  do
  {
    float v8 = *(float *)(a1 + 8);
    float v9 = *(float *)(a1 + 4);
    v2 |= 1u;
    float v7 = fmax(v9, fmin(v8, *(float *)a1)) + v7;
    float v6 = v9 + v6;
    float v5 = v8 + v5;
    if (v3 <= *(_WORD *)(a1 + 12)) {
      unsigned __int16 v3 = *(_WORD *)(a1 + 12);
    }
    a1 += 16;
  }
  while (a1 < v4);
  HIWORD(v12) = 0;
  *(float *)&uint64_t v11 = v7;
  if ((v2 & 1) == 0) {
    goto LABEL_9;
  }
  *((float *)&v11 + 1) = v6;
LABEL_10:
  HIDWORD(v12) = v3;
  bzero((char *)&v12 + 6, 2uLL);
  return v11;
}

unint64_t TUILengthComputedWithValueSpecifiedAndContent(uint64_t a1, double a2)
{
  *(float *)&unsigned int v2 = a2;
  return v2 | ((unint64_t)HIDWORD(a1) << 32);
}

unint64_t TUILengthCombineSpecifiedAndIntrinsic(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  float v4 = *((float *)&a1 + 1);
  float v5 = *(float *)&a1;
  if ((int)(a4 >> 16) >> 16 > SWORD2(a2))
  {
    float v4 = fmaxf(*((float *)&a3 + 1), *((float *)&a1 + 1));
    float v5 = fmaxf(v4, fminf(fminf(v4, *(float *)&a2), *(float *)&a3));
  }
  return LODWORD(v5) | ((unint64_t)LODWORD(v4) << 32);
}

double TUILengthValueWithDefault(uint64_t a1, uint64_t a2, double a3)
{
  if ((a2 & 0x7000000000000uLL) > 0x2000000000000) {
    a3 = *(float *)&a1;
  }
  return fmax(fmin(a3, *(float *)&a2), *((float *)&a1 + 1));
}

unint64_t TUILengthByScaling(uint64_t a1, uint64_t a2, double a3)
{
  if ((a2 & 0x7000000000000uLL) >= 0x2000000000001)
  {
    *(float *)&unsigned int v3 = *(float *)&a1 * a3;
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = a1;
  }
  *(float *)&unsigned int v5 = *((float *)&a1 + 1) * a3;
  return v4 | ((unint64_t)v5 << 32);
}

uint64_t sub_1890AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 24) optimizeUpdatesForTransactionGroup:v3]
    && [*(id *)(*(void *)(a1 + 32) + 24) applyUpdatesForTransactionGroup:v3])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    void v6[2] = sub_189170;
    void v6[3] = &unk_252790;
    void v6[4] = *(void *)(a1 + 32);
    [v3 appendUpdateBlock:v6];
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_189170(uint64_t a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 16) value];
  if ([v2 isObject])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v3 = +[NSArray arrayWithObjects:&v5 count:1];
    id v4 = [v2 callWithArguments:v3];
  }
}

void sub_18930C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_189324(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_189334(uint64_t a1)
{
}

void sub_18933C(uint64_t a1, void *a2)
{
}

void sub_189AE0(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) control];
  id v3 = [*(id *)(a1 + 32) _textForControlUsingRenderModel:*(void *)(a1 + 40)];
  [v2 setText:v3];

  id v4 = [*(id *)(a1 + 32) control];
  [v4 layoutIfNeeded];
}

void sub_18A4D4(id a1)
{
  uint64_t v1 = +[TUIAttributeSet supportedAttributesSize];
  id v2 = [v1 mutableCopy];

  v6[0] = @"fetch-window";
  v6[1] = @"fetch-initial";
  void v6[2] = @"fetch-delta";
  void v6[3] = @"fetch-padding";
  void v6[4] = @"dynamic-unique-id";
  id v3 = +[NSArray arrayWithObjects:v6 count:5];
  [v2 addAttributesFromArray:v3];

  id v4 = [v2 copy];
  uint64_t v5 = (void *)qword_2DFAB8;
  qword_2DFAB8 = (uint64_t)v4;
}

void sub_18A780(id a1)
{
  v4[0] = @"select";
  v4[1] = @"dynamic-unique-id";
  uint64_t v1 = +[NSArray arrayWithObjects:v4 count:2];
  uint64_t v2 = +[TUIAttributeSet setWithArray:v1];
  id v3 = (void *)qword_2DFAC8;
  qword_2DFAC8 = v2;
}

void sub_18A9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18A9D4(id a1, TUIModel *a2, unint64_t a3, BOOL *a4)
{
}

id sub_18A9E0(uint64_t a1, void *a2)
{
  return [a2 setParentModel:*(void *)(a1 + 32)];
}

void sub_18AAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_18AABC(uint64_t a1, void *a2)
{
  return [a2 appendLayoutModelsToArray:*(void *)(a1 + 32)];
}

void sub_18B698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18B734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18B7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BF88(id a1)
{
  uint64_t v1 = (void *)qword_2DFAD8;
  qword_2DFAD8 = (uint64_t)&off_268870;
}

void sub_18C02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18C048(id a1)
{
  uint64_t v1 = (void *)qword_2DFAE8;
  qword_2DFAE8 = (uint64_t)&off_268898;
}

void sub_18C0EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18C108(id a1)
{
  uint64_t v1 = (void *)qword_2DFAF8;
  qword_2DFAF8 = (uint64_t)&off_2688C0;
}

void sub_18C1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18C1C8(id a1)
{
  uint64_t v1 = (void *)qword_2DFB08;
  qword_2DFB08 = (uint64_t)&off_2688E8;
}

void sub_18C26C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18C288(id a1)
{
  uint64_t v1 = (void *)qword_2DFB18;
  qword_2DFB18 = (uint64_t)&off_268910;
}

void sub_18C32C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18C348(id a1)
{
  uint64_t v1 = (void *)qword_2DFB28;
  qword_2DFB28 = (uint64_t)&off_268938;
}

void sub_18C3EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18C408(id a1)
{
  uint64_t v1 = (void *)qword_2DFB38;
  qword_2DFB38 = (uint64_t)&off_268960;
}

void sub_18C4A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18C4B8(id a1)
{
  v3[0] = @"plusL";
  v3[1] = @"plusD";
  v4[0] = kCAFilterPlusL;
  v4[1] = kCAFilterPlusD;
  v3[2] = @"subtractS";
  void v3[3] = @"subtractD";
  void v4[2] = kCAFilterSubtractS;
  void v4[3] = kCAFilterSubtractD;
  void v3[4] = @"multi";
  void v3[5] = @"minimum";
  void v4[4] = kCAFilterMultiply;
  v4[5] = kCAFilterMinimum;
  v3[6] = @"maximum";
  void v3[7] = @"normal";
  void v4[6] = kCAFilterMaximum;
  void v4[7] = kCAFilterNormalBlendMode;
  v3[8] = @"multiply";
  v3[9] = @"screen";
  v4[8] = kCAFilterMultiplyBlendMode;
  v4[9] = kCAFilterScreenBlendMode;
  v3[10] = @"overlay";
  v3[11] = @"darken";
  v4[10] = kCAFilterOverlayBlendMode;
  v4[11] = kCAFilterDarkenBlendMode;
  v3[12] = @"lighten";
  v3[13] = @"colorDodge";
  void v4[12] = kCAFilterLightenBlendMode;
  v4[13] = kCAFilterColorDodgeBlendMode;
  v3[14] = @"colorBurn";
  v3[15] = @"softLight";
  v4[14] = kCAFilterColorBurnBlendMode;
  v4[15] = kCAFilterSoftLightBlendMode;
  v3[16] = @"hardLight";
  v3[17] = @"difference";
  v4[16] = kCAFilterHardLightBlendMode;
  v4[17] = kCAFilterDifferenceBlendMode;
  v3[18] = @"exclusion";
  v3[19] = @"subtract";
  v4[18] = kCAFilterExclusionBlendMode;
  v4[19] = kCAFilterSubtractBlendMode;
  v3[20] = @"divide";
  v3[21] = @"linearBurn";
  v4[20] = kCAFilterDivideBlendMode;
  v4[21] = kCAFilterLinearBurnBlendMode;
  v3[22] = @"linearDodge";
  v3[23] = @"linearLight";
  v4[22] = kCAFilterLinearDodgeBlendMode;
  v4[23] = kCAFilterLinearLightBlendMode;
  v3[24] = @"pinLight";
  v3[25] = @"darkenSourceOver";
  v4[24] = kCAFilterPinLightBlendMode;
  v4[25] = kCAFilterDarkenSourceOver;
  v3[26] = @"lightenSourceOver";
  v3[27] = @"hue";
  v4[26] = kCAFilterLightenSourceOver;
  v4[27] = kCAFilterHueBlendMode;
  v3[28] = @"saturation";
  v3[29] = @"color";
  v4[28] = kCAFilterSaturationBlendMode;
  v4[29] = kCAFilterColorBlendMode;
  v3[30] = @"luminosity";
  v3[31] = @"gaussianBlur";
  v4[30] = kCAFilterLuminosityBlendMode;
  v4[31] = kCAFilterGaussianBlur;
  v3[32] = @"variableBlur";
  v4[32] = kCAFilterVariableBlur;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:33];
  uint64_t v2 = (void *)qword_2DFB48;
  qword_2DFB48 = v1;
}

void sub_18C8E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18C8FC(id a1)
{
  uint64_t v1 = (void *)qword_2DFB58;
  qword_2DFB58 = (uint64_t)&off_268988;
}

void sub_18C9A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18C9BC(id a1)
{
  uint64_t v1 = (void *)qword_2DFB68;
  qword_2DFB68 = (uint64_t)&off_2689B0;
}

void sub_18CA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18CA84(id a1)
{
  uint64_t v1 = (void *)qword_2DFB78;
  qword_2DFB78 = (uint64_t)&off_2689D8;
}

void sub_18CB28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18CB44(id a1)
{
  uint64_t v1 = (void *)qword_2DFB88;
  qword_2DFB88 = (uint64_t)&off_268A00;
}

void sub_18CC14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18CC28(id a1)
{
  v3[0] = @"center";
  v3[1] = @"top";
  v4[0] = kCAGravityCenter;
  v4[1] = kCAGravityTop;
  v3[2] = @"bottom";
  void v3[3] = @"left";
  void v4[2] = kCAGravityBottom;
  void v4[3] = kCAGravityLeft;
  void v3[4] = @"right";
  void v3[5] = @"top-left";
  void v4[4] = kCAGravityRight;
  v4[5] = kCAGravityTopLeft;
  v3[6] = @"top-right";
  void v3[7] = @"bottom-left";
  void v4[6] = kCAGravityTopRight;
  void v4[7] = kCAGravityBottomLeft;
  v3[8] = @"bottom-right";
  v3[9] = @"scale-to-fill";
  v4[8] = kCAGravityBottomRight;
  v4[9] = kCAGravityResize;
  v3[10] = @"scale-aspect-fit";
  v3[11] = @"scale-aspect-fill";
  v4[10] = kCAGravityResizeAspect;
  v4[11] = kCAGravityResizeAspectFill;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:12];
  uint64_t v2 = (void *)qword_2DFB98;
  qword_2DFB98 = v1;
}

void sub_18CE48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18CE64(id a1)
{
  uint64_t v1 = (void *)qword_2DFBA8;
  qword_2DFBA8 = (uint64_t)&off_268A28;
}

void sub_18CF34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18CF48(id a1)
{
  v3[0] = @"resize";
  v3[1] = @"resize-aspect";
  v4[0] = AVLayerVideoGravityResize;
  v4[1] = AVLayerVideoGravityResizeAspect;
  v3[2] = @"resize-aspect-fill";
  void v4[2] = AVLayerVideoGravityResizeAspectFill;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  uint64_t v2 = (void *)qword_2DFBB8;
  qword_2DFBB8 = v1;
}

void sub_18D094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18D0B0(id a1)
{
  uint64_t v1 = (void *)qword_2DFBC8;
  qword_2DFBC8 = (uint64_t)&off_268A50;
}

void sub_18D154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18D170(id a1)
{
  uint64_t v1 = (void *)qword_2DFBD8;
  qword_2DFBD8 = (uint64_t)&off_268A78;
}

void sub_18D3C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

UIScrollViewDecelerationRate TUIBoxDecelerationRateFromString(void *a1)
{
  unsigned int v1 = [a1 isEqualToString:@"fast"];
  uint64_t v2 = &UIScrollViewDecelerationRateFast;
  if (!v1) {
    uint64_t v2 = &UIScrollViewDecelerationRateNormal;
  }
  return *v2;
}

id TUIBoxChildrenWithProtocolAndRole(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  float v7 = objc_opt_new();
  [v5 appendLayoutChildrenToArray:v7];
  float v8 = objc_opt_new();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_18D6A4;
  void v14[3] = &unk_257798;
  id v9 = v6;
  id v15 = v9;
  uint64_t v17 = a3;
  id v10 = v8;
  id v16 = v10;
  [v7 enumerateObjectsUsingBlock:v14];
  uint64_t v11 = v16;
  id v12 = v10;

  return v12;
}

void sub_18D660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  double v19 = v18;

  _Unwind_Resume(a1);
}

void sub_18D6A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((!*(void *)(a1 + 32) || objc_msgSend(v3, "conformsToProtocol:"))
    && [v3 role] == *(id *)(a1 + 48))
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void sub_18D71C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id TUIAncestorBoxFromModel(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 parentModel];

  if (v2)
  {
    do
    {
      if ([v2 modelKind] == (char *)&def_141F14 + 1) {
        break;
      }
      uint64_t v3 = [v2 parentModel];

      uint64_t v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

void sub_18D7B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18D7CC(id a1)
{
  id v1 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v2 = [v1 URLForResource:@"TUIBox" withExtension:@"ppkg"];
  id v6 = 0;
  uint64_t v3 = +[NSData dataWithContentsOfURL:v2 options:8 error:&v6];
  id v4 = v6;
  id v5 = (void *)qword_2DFBE8;
  qword_2DFBE8 = v3;
}

void sub_18D888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18ED7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_18ED9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"[%02lu] %@\n", a3, a2];
}

void sub_18EDCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained tableView];
  [v2 deselectRowAtIndexPath:*(void *)(a1 + 32) animated:0];

  uint64_t v3 = [WeakRetained presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

__n128 sub_18EE88(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_18EE98(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_18EEB8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_18EEF4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_18EF3C()
{
  uint64_t v0 = sub_192D80();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  char v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_192D70();
  __chkstk_darwin();
  sub_192D30();
  __chkstk_darwin();
  sub_1906CC();
  sub_192D20();
  v5[1] = &_swiftEmptyArrayStorage;
  sub_19070C();
  sub_1902BC(&qword_2DF098);
  sub_190764();
  sub_192DC0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t result = sub_192D90();
  qword_2DEFD0 = result;
  return result;
}

id sub_18F13C()
{
  id v0 = [objc_allocWithZone((Class)NSOperationQueue) init];
  [v0 setMaxConcurrentOperationCount:1];
  if (qword_2DEFB0 != -1) {
    swift_once();
  }
  id result = [v0 setUnderlyingQueue:qword_2DEFD0];
  qword_2DEFD8 = (uint64_t)v0;
  return result;
}

void sub_18F28C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_192CD0();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

id MediaBackdropSnapshotRenderer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id MediaBackdropSnapshotRenderer.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MediaBackdropSnapshotRenderer();
  return [super init];
}

id MediaBackdropSnapshotRenderer.__deallocating_deinit()
{
  return sub_18FEAC(type metadata accessor for MediaBackdropSnapshotRenderer);
}

BOOL sub_18F3C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_18F3D4()
{
  Swift::UInt v1 = *v0;
  sub_192E10();
  sub_192E20(v1);
  return sub_192E30();
}

void sub_18F41C()
{
  sub_192E20(*v0);
}

Swift::Int sub_18F448()
{
  Swift::UInt v1 = *v0;
  sub_192E10();
  sub_192E20(v1);
  return sub_192E30();
}

uint64_t sub_18F49C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v4[2] = a4;
  uint64_t v5 = sub_192D10();
  void v4[3] = v5;
  void v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  return _swift_task_switch(sub_18F55C, 0, 0);
}

uint64_t sub_18F55C()
{
  uint64_t v1 = v0[2];
  if (*(double *)(v1 + OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_size) <= 0.0
    || *(double *)(v1 + OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_size + 8) <= 0.0)
  {
    char v8 = 0;
  }
  else
  {
    id v2 = [*(id *)(v1 + OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_content) image];
    if (!v2)
    {
      __break(1u);
      return static Backdrop.CompositeRenderer.snapshot(configuration:)(v2);
    }
    id v3 = [v2 newImage];
    v0[6] = v3;
    swift_unknownObjectRelease();
    if (v3)
    {
      uint64_t v4 = self;
      id v5 = v3;
      id v6 = [v4 traitCollectionWithUserInterfaceStyle:2];
      sub_192D00();
      sub_192CF0();
      uint64_t v7 = (void *)swift_task_alloc();
      v0[7] = v7;
      *uint64_t v7 = v0;
      v7[1] = sub_18F7A4;
      id v2 = (id)v0[5];
      return static Backdrop.CompositeRenderer.snapshot(configuration:)(v2);
    }
    char v8 = 1;
  }
  sub_190638();
  uint64_t v9 = swift_allocError();
  *id v10 = v8;
  swift_willThrow();
  uint64_t v11 = *(void (**)(void, uint64_t))(v0[2]
                                               + OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_completion);
  swift_errorRetain();
  v11(0, v9);
  swift_errorRelease();
  swift_errorRelease();
  sub_192DB0();
  swift_task_dealloc();
  id v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_18F7A4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_18FAC4;
  }
  else {
    uint64_t v4 = sub_18F8B8;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_18F8B8()
{
  uint64_t v1 = (void *)v0[8];
  id v2 = [objc_allocWithZone((Class)CIContext) init];
  id v3 = [v1 CIImage];
  if (v3)
  {
    uint64_t v4 = v3;
    [v3 extent];
    id v5 = [v2 createCGImage:v4];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = (void *)v0[8];
      char v8 = (void *)v0[6];
      uint64_t v9 = v0[4];
      uint64_t v22 = v0[3];
      uint64_t v23 = v0[5];
      id v10 = *(void (**)(id, void))(v0[2]
                                              + OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_completion);
      id v11 = v5;
      v10(v6, 0);

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v23, v22);
      goto LABEL_6;
    }
  }
  id v12 = (void *)v0[8];
  uint64_t v13 = v0[5];
  uint64_t v14 = (void *)v0[6];
  uint64_t v15 = v0[3];
  uint64_t v16 = v0[4];
  sub_190638();
  uint64_t v17 = swift_allocError();
  *float v18 = 2;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v13, v15);
  double v19 = *(void (**)(void, uint64_t))(v0[2]
                                               + OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_completion);
  swift_errorRetain();
  v19(0, v17);
  swift_errorRelease();
  swift_errorRelease();
LABEL_6:
  sub_192DB0();
  swift_task_dealloc();
  long long v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_18FAC4()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v4 = *(void *)(v0 + 72);
  id v5 = *(void (**)(void, uint64_t))(*(void *)(v0 + 16)
                                              + OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_completion);
  swift_errorRetain();
  v5(0, v4);
  swift_errorRelease();
  swift_errorRelease();
  sub_192DB0();
  swift_task_dealloc();
  id v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_18FBA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_192D60();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_192D50();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1904E8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_192D40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_18FE94()
{
  return sub_18FEAC(type metadata accessor for MediaBackdropSnapshotRendererOperation);
}

id sub_18FEAC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t sub_18FF44(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_190020;
  return v6(a1);
}

uint64_t sub_190020()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void _s10TemplateUI29MediaBackdropSnapshotRendererC6render7content4size0H5Scale10completionySo15TUIImageContentC_So6CGSizeV12CoreGraphics7CGFloatVySo10CGImageRefaSg_s5Error_pSgtctFZ_0(void *a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  id v12 = (objc_class *)type metadata accessor for MediaBackdropSnapshotRendererOperation();
  uint64_t v13 = (char *)objc_allocWithZone(v12);
  uint64_t v14 = OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_semaphore;
  id v15 = a1;
  swift_retain();
  uint64_t v16 = v13;
  *(void *)&v13[v14] = dispatch_semaphore_create(0);
  *(void *)&v16[OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_content] = v15;
  uint64_t v17 = (double *)&v16[OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_size];
  double *v17 = a4;
  v17[1] = a5;
  *(double *)&v16[OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_contentScale] = a6;
  float v18 = &v16[OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_completion];
  *(void *)float v18 = a2;
  *((void *)v18 + 1) = a3;
  id v19 = v15;
  swift_retain();

  v21.receiver = v16;
  v21.super_class = v12;
  id v20 = [super init];

  swift_release();
  if (qword_2DEFB8 != -1) {
    swift_once();
  }
  [(id)qword_2DEFD8 addOperation:v20];
}

uint64_t type metadata accessor for MediaBackdropSnapshotRenderer()
{
  return self;
}

uint64_t type metadata accessor for MediaBackdropSnapshotRendererOperation()
{
  return self;
}

uint64_t sub_1902BC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_190300()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_190340(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1903F4;
  return sub_18F49C(a1, v4, v5, v6);
}

uint64_t sub_1903F4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1904E8(uint64_t a1)
{
  uint64_t v2 = sub_1902BC(&qword_2DF058);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_190548()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_190580(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1903F4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2DF070 + dword_2DF070);
  return v6(a1, v4);
}

unint64_t sub_190638()
{
  unint64_t result = qword_2DF080;
  if (!qword_2DF080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2DF080);
  }
  return result;
}

uint64_t sub_19068C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1906C4(uint64_t a1, uint64_t a2)
{
  sub_18F28C(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_1906CC()
{
  unint64_t result = qword_2DF088;
  if (!qword_2DF088)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2DF088);
  }
  return result;
}

unint64_t sub_19070C()
{
  unint64_t result = qword_2DF090;
  if (!qword_2DF090)
  {
    sub_192D70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2DF090);
  }
  return result;
}

unint64_t sub_190764()
{
  unint64_t result = qword_2DF0A0;
  if (!qword_2DF0A0)
  {
    sub_1907C0(&qword_2DF098);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2DF0A0);
  }
  return result;
}

uint64_t sub_1907C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for MediaBackdropSnapshotRendererOperation.BackdropRenderOperationError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MediaBackdropSnapshotRendererOperation.BackdropRenderOperationError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MediaBackdropSnapshotRendererOperation.BackdropRenderOperationError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x190970);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_190998(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1909A4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MediaBackdropSnapshotRendererOperation.BackdropRenderOperationError()
{
  return &type metadata for MediaBackdropSnapshotRendererOperation.BackdropRenderOperationError;
}

unint64_t sub_1909C0()
{
  unint64_t result = qword_2DF0A8;
  if (!qword_2DF0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2DF0A8);
  }
  return result;
}

uint64_t sub_190A14()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_190A48(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&void v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_172A8(&def_141F14, a2, a3, "cyclic dependency %{public}@ <--> %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_190AC0(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 callstack];
  int v6 = 134218242;
  uint64_t v7 = a2;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&def_141F14, a3, OS_LOG_TYPE_ERROR, "[%lu] callstack=%{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_190B70(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 134218242;
  *(void *)&void v3[4] = a2;
  *(_WORD *)&void v3[12] = 2114;
  *(void *)&v3[14] = a1;
  sub_172A8(&def_141F14, a2, a3, "[%lu] tx=%{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_190BE8()
{
  sub_1725C();
  _os_log_fault_impl(&def_141F14, v0, OS_LOG_TYPE_FAULT, "[fid:%lu] Deallocating an incomplete TUITransactionGroup: %@. Going to remove deferrals to free up the dispatch group.", v1, 0x16u);
}

void sub_190C60()
{
  sub_1725C();
  sub_17274(&def_141F14, v0, v1, "[fid:%lu] applyUpdates for %@", v2, v3, v4, v5, v6);
}

void sub_190CCC()
{
  sub_17290();
  sub_17274(&def_141F14, v0, v1, "[fid:%lu] applyUpdates completed %@", v2, v3, v4, v5, v6);
}

void sub_190D3C()
{
  sub_1725C();
  sub_17274(&def_141F14, v0, v1, "[fid:%lu] applyNonVisualUpdates %@", v2, v3, v4, v5, v6);
}

void sub_190DA8()
{
  sub_17290();
  sub_17274(&def_141F14, v0, v1, "[fid:%lu] applyNonVisualUpdates completed %@", v2, v3, v4, v5, v6);
}

uint64_t sub_190E18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_190E3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 64))();
}

uint64_t sub_190E60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 64))();
}

void sub_190E84(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [sub_2AD24(a1, a2) controller];
  sub_2AD58((uint64_t)[v2 feedId], 3.852e-34);
  sub_2AD38(&def_141F14, v3, v4, "[fid:%lu] expandable content should conform to <TUIExpandableContentLayout>.");
}

void sub_190EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [sub_2AD24(a1, a2) controller];
  sub_2AD58((uint64_t)[v2 feedId], 3.852e-34);
  sub_2AD38(&def_141F14, v3, v4, "[fid:%lu] found multiple expandable children");
}

void sub_190F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [sub_2AD24(a1, a2) controller];
  sub_2AD58((uint64_t)[v2 feedId], 3.852e-34);
  sub_2AD38(&def_141F14, v3, v4, "[fid:%lu] found multiple expanded-content children");
}

void sub_190F98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [sub_2AD24(a1, a2) controller];
  sub_2AD58((uint64_t)[v2 feedId], 3.852e-34);
  sub_2AD38(&def_141F14, v3, v4, "[fid:%lu] found multiple 'more' children");
}

void sub_190FF4()
{
  sub_46EC4();
  sub_46EA4(&def_141F14, v0, v1, "[fid:%lu] created next transaction group: %{public}@");
}

void sub_191064()
{
  sub_46EC4();
  sub_46EA4(&def_141F14, v0, v1, "[fid:%lu] sync transaction ready for processing: %{public}@");
}

uint64_t sub_1910DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 64))();
}

void sub_191100(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&def_141F14, a2, OS_LOG_TYPE_ERROR, "No URL found for template %@", (uint8_t *)&v2, 0xCu);
}

void sub_191178(void **a1, void **a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  if (v5)
  {
    *(void *)(a3 + 96) = v5;
    operator delete(v5);
  }
  uint8_t v6 = *a2;
  if (*a2)
  {
    *(void *)(a3 + 72) = v6;
    operator delete(v6);
  }
}

void sub_1911D4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&def_141F14, log, OS_LOG_TYPE_DEBUG, "end waiting for sync assertions", v1, 2u);
}

void sub_191218(void *a1, NSObject *a2, double a3)
{
  int v5 = 134218240;
  id v6 = [a1 count];
  __int16 v7 = 2048;
  double v8 = a3;
  _os_log_error_impl(&def_141F14, a2, OS_LOG_TYPE_ERROR, "%lu sync transactions didn't finish; aborting runloop wait after %f seconds",
    (uint8_t *)&v5,
    0x16u);
}

void sub_1912BC(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *CMTime buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&def_141F14, log, OS_LOG_TYPE_DEBUG, "begin waiting for sync assertions", buf, 2u);
}

void sub_1912FC(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 96);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&def_141F14, a2, OS_LOG_TYPE_ERROR, "[fid:%lu] package doesn't support prebuiltTemplates", (uint8_t *)&v3, 0xCu);
}

void sub_191378(void *a1, void *a2, NSObject *a3)
{
  id v6 = [a1 feedControllerHost];
  id v7 = [v6 feedId];
  double v8 = [a2 to];
  uint64_t v9 = [v8 sections];
  id v10 = [v9 count];
  id v11 = [a2 to];
  [v11 size];
  id v12 = NSStringFromCGSize(v24);
  +[UIView inheritedAnimationDuration];
  int v14 = 134219010;
  id v15 = v7;
  __int16 v16 = 2048;
  uint64_t v17 = a1;
  __int16 v18 = 2048;
  id v19 = v10;
  __int16 v20 = 2112;
  objc_super v21 = v12;
  __int16 v22 = 2048;
  uint64_t v23 = v13;
  _os_log_debug_impl(&def_141F14, a3, OS_LOG_TYPE_DEBUG, "[fid:%lu] applyUpdate(embedded) %p to.sections.count=%lu size=%@ duration=%f", (uint8_t *)&v14, 0x34u);
}

void sub_1914C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&def_141F14, a2, OS_LOG_TYPE_ERROR, "Potential failure to load image resource: %@, blocking may occur if timeout is forever!!", (uint8_t *)&v2, 0xCu);
}

void sub_191540()
{
  sub_924CC();
  sub_924B0(&def_141F14, v0, v1, "Could not read cache dir from disk: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1915A8()
{
  sub_924CC();
  sub_924B0(&def_141F14, v0, v1, "could not write cache to disk (error): %@", v2, v3, v4, v5, v6);
}

void sub_191610()
{
  sub_924CC();
  sub_924B0(&def_141F14, v0, v1, "could not create keyed archive: %@", v2, v3, v4, v5, v6);
}

void sub_191678(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&def_141F14, log, OS_LOG_TYPE_ERROR, "TUIOfflineCache.provider is not set", v1, 2u);
}

void sub_1916BC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 absoluteString];
  sub_924CC();
  _os_log_error_impl(&def_141F14, a2, OS_LOG_TYPE_ERROR, "Resource not found in offline cache: %{public}@", v4, 0xCu);
}

void sub_191750(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a2;
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  _os_log_debug_impl(&def_141F14, log, OS_LOG_TYPE_DEBUG, "Got all %ld images, pass to BCU for creating series cover. <%p>", (uint8_t *)&v3, 0x16u);
}

void sub_1917D8(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 url];
  int v5 = 134218242;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  double v8 = v4;
  _os_log_error_impl(&def_141F14, a2, OS_LOG_TYPE_ERROR, "ImageResouce %p did load image (%@), but image content has no CGImageRef.", (uint8_t *)&v5, 0x16u);
}

void sub_191888(void *a1, uint64_t a2, NSObject *a3)
{
  int v5 = [a1 debugDescription];
  uint64_t v6 = *(void *)(a2 + 32);
  int v7 = 138412546;
  double v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = v6;
  _os_log_debug_impl(&def_141F14, a3, OS_LOG_TYPE_DEBUG, "Received final series cover image %@ from BCU. <%p>", (uint8_t *)&v7, 0x16u);
}

void sub_19193C(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) imageResource];
  int v7 = [*(id *)(a1 + 32) imageResource];
  double v8 = [v7 debugFunctionalDescription];
  __int16 v9 = [a2 description];
  int v10 = 134218498;
  id v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v8;
  __int16 v14 = 2112;
  id v15 = v9;
  _os_log_error_impl(&def_141F14, a3, OS_LOG_TYPE_ERROR, "Failed to load backdrop snapshot for %p: %@, error: %@", (uint8_t *)&v10, 0x20u);
}

void sub_191A3C()
{
  sub_ACFF8();
  sub_ACFDC(&def_141F14, v0, v1, "use of invalid key: %d", v2, v3, v4, v5, v6);
}

void sub_191AA4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&def_141F14, log, OS_LOG_TYPE_ERROR, "no dataset specified", v1, 2u);
}

void sub_191AE8()
{
  sub_ACFF8();
  sub_ACFDC(&def_141F14, v0, v1, "invalid key: %d", v2, v3, v4, v5, v6);
}

void sub_191B50()
{
  sub_ACFF8();
  sub_ACFDC(&def_141F14, v0, v1, "last map doesn't contain key: %d", v2, v3, v4, v5, v6);
}

void sub_191BB8(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = [a2 valueForKey:@"tui_identifierToString"];
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  __int16 v9 = v5;
  _os_log_error_impl(&def_141F14, a3, OS_LOG_TYPE_ERROR, "[fid:%lu] failed to lookup path %@", (uint8_t *)&v6, 0x16u);
}

void sub_191C74(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&def_141F14, log, OS_LOG_TYPE_ERROR, "[fid:%lu] failed to lookup action %@", (uint8_t *)&v4, 0x16u);
}

void sub_191D00(void *a1)
{
  uint64_t v1 = [a1 feedControllerHost];
  [v1 feedId];
  sub_B9878(&def_141F14, v2, v3, "[fid:%lu] requesting hosting update identifier=%{public}@ view=%p", v4, v5, v6, v7, 2u);
}

void sub_191DBC(void *a1)
{
  uint64_t v1 = [a1 feedControllerHost];
  [v1 feedId];
  sub_B9878(&def_141F14, v2, v3, "[fid:%lu] updating hosting view=%p identifier=%{public}@", v4, v5, v6, v7, 2u);
}

void sub_191E70(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 feedControllerHost];
  id v5 = [v4 feedId];
  uint64_t v6 = a1[3];
  uint64_t v7 = [a1 layoutAttributes];
  __int16 v8 = [v7 renderModel];

  int v9 = 134218754;
  id v10 = v5;
  __int16 v11 = 2112;
  __int16 v12 = a1;
  __int16 v13 = 2112;
  uint64_t v14 = v6;
  __int16 v15 = 2112;
  __int16 v16 = v8;
  _os_log_debug_impl(&def_141F14, a2, OS_LOG_TYPE_DEBUG, "[fid:%lu] applyLayoutAttributes view=%@ identifier=%@ renderModel=%@", (uint8_t *)&v9, 0x2Au);
}

void sub_191F78(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl(&def_141F14, a2, OS_LOG_TYPE_DEBUG, "layoutSubviews view=%p identifier=%@", (uint8_t *)&v3, 0x16u);
}

void sub_192008(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 40);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_fault_impl(&def_141F14, log, OS_LOG_TYPE_FAULT, "Encountered view without hosting controller: identifier %@, viewState %@", (uint8_t *)&v5, 0x16u);
}

void sub_1920A0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&def_141F14, a2, OS_LOG_TYPE_ERROR, "%@: NAN cetner.x", (uint8_t *)&v2, 0xCu);
}

void sub_192118(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  int v5 = [*a2 templateURL];
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  int v9 = v5;
  _os_log_error_impl(&def_141F14, a3, OS_LOG_TYPE_ERROR, "[fid:%lu] failed to instantiate template with url=%@", (uint8_t *)&v6, 0x16u);
}

void sub_1921CC()
{
  sub_CD2D4(__stack_chk_guard);
  sub_CD2E0();
  sub_CD2B8(&def_141F14, v0, v1, "[fid:%lu] notify geometry update (after view updates)", v2, v3, v4, v5, v6);
}

void sub_192234()
{
  sub_CD2D4(__stack_chk_guard);
  sub_CD2E0();
  sub_CD2B8(&def_141F14, v0, v1, "[fid:%lu] notify geometry update", v2, v3, v4, v5, v6);
}

void sub_19229C()
{
  sub_CD2D4(__stack_chk_guard);
  sub_CD2E0();
  sub_CD2B8(&def_141F14, v0, v1, "[fid:%lu] defer notify geometry update (until after view updates)", v2, v3, v4, v5, v6);
}

void sub_192304()
{
  sub_CD2D4(__stack_chk_guard);
  sub_CD2E0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&def_141F14, v1, OS_LOG_TYPE_DEBUG, "[fid:%lu] updated geometry map = %@", v2, 0x16u);
}

void sub_192388(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 112);
  uint64_t v5 = [*(id *)(a1 + 40) identifier];
  uint64_t v6 = *(void *)(a1 + 48);
  int v7 = 134218498;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  id v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  _os_log_debug_impl(&def_141F14, a2, OS_LOG_TYPE_DEBUG, "[fid:%lu] add hidden view for identifier=%@ view=%p", (uint8_t *)&v7, 0x20u);
}

void sub_192450(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&def_141F14, log, OS_LOG_TYPE_ERROR, "reusable subview with nil reuseIdentifier requested", v1, 2u);
}

void sub_192494(uint8_t *a1, uint64_t a2, void *a3, NSObject *a4)
{
  int v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  *(_DWORD *)a1 = 138543362;
  *a3 = v8;
  _os_log_error_impl(&def_141F14, a4, OS_LOG_TYPE_ERROR, "subview doesn't have reuse identifier: %{public}@", a1, 0xCu);
}

void sub_192510(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 112);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&def_141F14, log, OS_LOG_TYPE_ERROR, "[fid:%lu] invalidating disconnected model %@", (uint8_t *)&v4, 0x16u);
}

void sub_19259C(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)CMTime buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&def_141F14, log, OS_LOG_TYPE_ERROR, "[fid:%lu] %lu layout(s) still with invalid children", buf, 0x16u);
}

void sub_1925F4(unsigned __int16 *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&def_141F14, a2, OS_LOG_TYPE_ERROR, "ns index:%lu already exists", (uint8_t *)&v3, 0xCu);
}

void sub_192670(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 layoutAttributes];
  __int16 v6 = [v5 renderModel];
  uint64_t v7 = [v6 identifier];
  uint64_t v8 = [v7 tui_identifierToString];
  int v9 = 138543618;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  _os_log_fault_impl(&def_141F14, a3, OS_LOG_TYPE_FAULT, "invoke: preventing recursive invoke refId=%{public}@ view.id=%{public}@", (uint8_t *)&v9, 0x16u);
}

void sub_19275C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_108620(a1, a2, a3, 3.8521e-34);
  _os_log_error_impl(&def_141F14, v4, OS_LOG_TYPE_ERROR, "[fid:%lu] failed to find element: %lu", v3, 0x16u);
}

uint64_t sub_1927A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 64))();
}

void sub_1927C8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 160);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&def_141F14, a2, OS_LOG_TYPE_DEBUG, "[fid:%lu] flushPendingTransaction: sync transaction not created", (uint8_t *)&v3, 0xCu);
}

void sub_19284C(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = *(void *)(a1 + 160);
  __int16 v6 = [a2 to];
  uint64_t v7 = [v6 sections];
  id v8 = [v7 count];
  int v9 = [a2 to];
  [v9 size];
  uint64_t v10 = NSStringFromCGSize(v20);
  +[UIView inheritedAnimationDuration];
  int v12 = 134218754;
  uint64_t v13 = v5;
  __int16 v14 = 2048;
  id v15 = v8;
  __int16 v16 = 2112;
  uint64_t v17 = v10;
  __int16 v18 = 2048;
  uint64_t v19 = v11;
  _os_log_debug_impl(&def_141F14, a3, OS_LOG_TYPE_DEBUG, "[fid:%lu] applyUpdate(feed) to.sections.count=%lu size=%@ animationDuration=%f", (uint8_t *)&v12, 0x2Au);
}

void sub_19297C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 160);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&def_141F14, log, OS_LOG_TYPE_ERROR, "[fid:%lu] handle action failed to find a handler! (%@)", (uint8_t *)&v4, 0x16u);
}

void sub_192A10(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  __int16 v6 = v4;
  _os_log_error_impl(&def_141F14, a2, OS_LOG_TYPE_ERROR, "unsupported model for producing <TUIMenuItemModel>: %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_192AAC(uint8_t *a1, uint64_t a2, void *a3, NSObject *a4)
{
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  *(_DWORD *)a1 = 138543362;
  *a3 = v8;
  _os_log_error_impl(&def_141F14, a4, OS_LOG_TYPE_ERROR, "unsupported model for producing <TUIImageModel>: %{public}@", a1, 0xCu);
}

void sub_192B28(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&def_141F14, log, OS_LOG_TYPE_ERROR, "-drainWithTimeout should be called in main runloop only", v1, 2u);
}

void sub_192B6C(void *a1)
{
  uint64_t v7 = [a1 renderModel];
  sub_188524(&def_141F14, v1, v2, "feedView: %@, renderModel=%@", v3, v4, v5, v6, 2u);
}

void sub_192C0C(void *a1)
{
  uint64_t v2 = [a1 renderModel];
  uint64_t v3 = [a1 renderModel];
  uint64_t v10 = [v3 reuseIdentifier];
  sub_188524(&def_141F14, v4, v5, "TUIControlView expects renderModel.focus to work - %@ (%@)", v6, v7, v8, v9, 2u);
}

uint64_t sub_192CD0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_192CF0()
{
  return type metadata accessor for Backdrop.CompositeRenderer();
}

uint64_t sub_192D00()
{
  return Backdrop.SnapshotConfiguration.init(image:size:scale:offset:traitCollection:)();
}

uint64_t sub_192D10()
{
  return type metadata accessor for Backdrop.SnapshotConfiguration();
}

uint64_t sub_192D20()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_192D30()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_192D40()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_192D50()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_192D60()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_192D70()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_192D80()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_192D90()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

void sub_192DA0()
{
}

Swift::Int sub_192DB0()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_192DC0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_192DD0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_192DE0()
{
  return Error._code.getter();
}

uint64_t sub_192DF0()
{
  return Error._domain.getter();
}

uint64_t sub_192E00()
{
  return Error._userInfo.getter();
}

uint64_t sub_192E10()
{
  return Hasher.init(_seed:)();
}

void sub_192E20(Swift::UInt a1)
{
}

Swift::Int sub_192E30()
{
  return Hasher._finalize()();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return _CATransform3DConcat(retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return _CATransform3DMakeAffineTransform(retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DScale(retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DTranslate(retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return _CFRunLoopSourceCreate(allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformEqualToTransform(t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return _CGAffineTransformInvert(retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return _CGAffineTransformIsIdentity(t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return _CGColorSpaceIsWideGamutRGB(a1);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

uint64_t CGFloatIsValid()
{
  return _CGFloatIsValid();
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return _CGImageGetBitsPerPixel(image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return _CGImageGetColorSpace(image);
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithEllipseInRect(rect, transform);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return _CGRectIsInfinite(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return _CMTimeCompare(time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CFArrayRef CTFontCopySupportedLanguages(CTFontRef font)
{
  return _CTFontCopySupportedLanguages(font);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return _CTFontCreateWithFontDescriptor(descriptor, size, matrix);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return _CTFontDescriptorCreateWithAttributes(attributes);
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  return _CTFontGetAscent(font);
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  return _CTFontGetCapHeight(font);
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  return _CTFontGetDescent(font);
}

CGFloat CTFontGetSize(CTFontRef font)
{
  return _CTFontGetSize(font);
}

BOOL CTFontManagerRegisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return _CTFontManagerRegisterFontsForURL(fontURL, scope, error);
}

BOOL CTFontManagerUnregisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return _CTFontManagerUnregisterFontsForURL(fontURL, scope, error);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return _NSStringFromCGAffineTransform(transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return _NSStringFromCGPoint(point);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return _NSStringFromProtocol(proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return _NSStringFromRect(aRect);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return _NSStringFromUIEdgeInsets(insets);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSUnionRange(range1, range2);
  NSUInteger length = v4.length;
  locatiouint64_t n = v4.location;
  result.NSUInteger length = length;
  result.locatiouint64_t n = location;
  return result;
}

uint64_t TSWPFastCreateFontForStyle()
{
  return _TSWPFastCreateFontForStyle();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return _UIAccessibilityIsBoldTextEnabled();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return _UIAccessibilityIsSwitchControlRunning();
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return _UIAccessibilityIsVideoAutoplayEnabled();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAnimationDragCoefficient()
{
  return _UIAnimationDragCoefficient();
}

uint64_t UICeilToViewScale()
{
  return _UICeilToViewScale();
}

uint64_t UIEdgeInsetsSubtract()
{
  return _UIEdgeInsetsSubtract();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

UIImageSymbolWeight UIImageSymbolWeightForFontWeight(UIFontWeight fontWeight)
{
  return _UIImageSymbolWeightForFontWeight(fontWeight);
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return __AXSApplicationAccessibilityEnabled();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return __AXSCommandAndControlEnabled();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return __AXSFullKeyboardAccessEnabled();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _NSIsNSArray()
{
  return __NSIsNSArray();
}

uint64_t _NSIsNSDictionary()
{
  return __NSIsNSDictionary();
}

uint64_t _NSIsNSNumber()
{
  return __NSIsNSNumber();
}

uint64_t _NSIsNSString()
{
  return __NSIsNSString();
}

uint64_t _UIAXAssignFocusToItem()
{
  return __UIAXAssignFocusToItem();
}

uint64_t _UIApplicationIsExtension()
{
  return __UIApplicationIsExtension();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return std::__sort<std::__less<double,double> &,double *>();
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
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
  return ___cxa_guard_acquire((uint64_t *)a1);
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
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return _class_copyPropertyList(cls, outCount);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

htmlParserCtxtPtr htmlCreateMemoryParserCtxt(const char *buffer, int size)
{
  return _htmlCreateMemoryParserCtxt(buffer, size);
}

htmlDocPtr htmlCtxtReadMemory(xmlParserCtxtPtr ctxt, const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return _htmlCtxtReadMemory(ctxt, buffer, size, URL, encoding, options);
}

void htmlFreeParserCtxt(htmlParserCtxtPtr ctxt)
{
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

const char *__cdecl property_getName(objc_property_t property)
{
  return _property_getName(property);
}

BOOL protocol_isEqual(Protocol *proto, Protocol *other)
{
  return _protocol_isEqual(proto, other);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return _xmlDocGetRootElement(doc);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

xmlChar *__cdecl xmlGetProp(const xmlNode *node, const xmlChar *name)
{
  return _xmlGetProp(node, name);
}

int xmlNodeIsText(const xmlNode *node)
{
  return _xmlNodeIsText(node);
}

int xmlStrcasecmp(const xmlChar *str1, const xmlChar *str2)
{
  return _xmlStrcasecmp(str1, str2);
}

int xmlStrlen(const xmlChar *str)
{
  return _xmlStrlen(str);
}

id objc_msgSend_CGAffineTransformValue(void *a1, const char *a2, ...)
{
  return _[a1 CGAffineTransformValue];
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return _[a1 CGContext];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return _[a1 CGSizeValue];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [a1 JSONObjectWithData:options:error:];
}

id objc_msgSend_UIEdgeInsetsValue(void *a1, const char *a2, ...)
{
  return _[a1 UIEdgeInsetsValue];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathExtension:];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingPathExtension];
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return _[a1 URLByResolvingSymlinksInPath];
}

id objc_msgSend_URLByStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 URLByStandardizingPath];
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return [a1 URLForResource:withExtension:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_URLWithString_relativeToURL_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:relativeToURL:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__accessDropBehaviorForEmbeddedCollectionView_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessDropBehaviorForEmbeddedCollectionView:block:");
}

id objc_msgSend__accessibilityFindAncestor_startWithSelf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:");
}

id objc_msgSend__accessibilityFindUnsortedSubviewDescendantsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityFindUnsortedSubviewDescendantsPassingTest:");
}

id objc_msgSend__accessibilityGetAXElementMatchFromArray_(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityGetAXElementMatchFromArray];
}

id objc_msgSend__accessibilityHitTest_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityHitTest:withEvent:");
}

id objc_msgSend__accessibilityIsFKARunningForFocusItem(void *a1, const char *a2, ...)
{
  return _[a1 _accessibilityIsFKARunningForFocusItem];
}

id objc_msgSend__accessibilityRect_equalToRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityRect:equalToRect:");
}

id objc_msgSend__accessibilityTraitsAsHumanReadableStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityTraitsAsHumanReadableStrings:");
}

id objc_msgSend__accessibilityViewController(void *a1, const char *a2, ...)
{
  return _[a1 _accessibilityViewController];
}

id objc_msgSend__activateGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activateGroup:");
}

id objc_msgSend__addAudioSessionObservers(void *a1, const char *a2, ...)
{
  return _[a1 _addAudioSessionObservers];
}

id objc_msgSend__addChild_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addChild:");
}

id objc_msgSend__addNotificationObservers(void *a1, const char *a2, ...)
{
  return _[a1 _addNotificationObservers];
}

id objc_msgSend__addObserver_(void *a1, const char *a2, ...)
{
  return [a1 _addObserver:];
}

id objc_msgSend__addPlaybackCheckObservers(void *a1, const char *a2, ...)
{
  return _[a1 _addPlaybackCheckObservers];
}

id objc_msgSend__addPlayerObservers(void *a1, const char *a2, ...)
{
  return _[a1 _addPlayerObservers];
}

id objc_msgSend__addTransactionAndProcess_(void *a1, const char *a2, ...)
{
  return [a1 _addTransactionAndProcess:];
}

id objc_msgSend__addURLToOfflineCache_response_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addURLToOfflineCache:response:data:");
}

id objc_msgSend__adjustScrollViewForKeyboardInfo_(void *a1, const char *a2, ...)
{
  return [_adjustScrollViewForKeyboardInfo:];
}

id objc_msgSend__adjustedPriority_(void *a1, const char *a2, ...)
{
  return [a1 _adjustedPriority:];
}

id objc_msgSend__animationRenderModelForStep_sourceRenderModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animationRenderModelForStep:sourceRenderModel:");
}

id objc_msgSend__appearState(void *a1, const char *a2, ...)
{
  return _[a1 _appearState];
}

id objc_msgSend__appendIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendIdentifier:");
}

id objc_msgSend__appendIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendIndex:");
}

id objc_msgSend__appendInterests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendInterests:");
}

id objc_msgSend__appendTransactions_forPredecessorsFromMap_forTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendTransactions:forPredecessorsFromMap:forTransaction:");
}

id objc_msgSend__appendVisibilityUpdatesAtTime_forCollector_toUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendVisibilityUpdatesAtTime:forCollector:toUpdates:");
}

id objc_msgSend__appendVisibleBoundsUpdatesAtTime_forCollector_toUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendVisibleBoundsUpdatesAtTime:forCollector:toUpdates:");
}

id objc_msgSend__applicationKeyWindow(void *a1, const char *a2, ...)
{
  return _[a1 _applicationKeyWindow];
}

id objc_msgSend__applyParagraphStyleWithStyle_color_fontSpec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyParagraphStyleWithStyle:color:fontSpec:");
}

id objc_msgSend__applyQueuedTransactionGroupsCheckForSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyQueuedTransactionGroupsCheckForSync:");
}

id objc_msgSend__applyToImages_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyToImages:completion:");
}

id objc_msgSend__applyUpdates_toFeedView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyUpdates:toFeedView:");
}

id objc_msgSend__aq_appendLayoutBlock_(void *a1, const char *a2, ...)
{
  return [_aq_appendLayoutBlock:];
}

id objc_msgSend__aq_instanceForTransaction_(void *a1, const char *a2, ...)
{
  return [_aq_instanceForTransaction:];
}

id objc_msgSend__aq_layoutBlocksToApply(void *a1, const char *a2, ...)
{
  return [_aq_layoutBlocksToApply];
}

id objc_msgSend__aq_loadPostLaunchCaches(void *a1, const char *a2, ...)
{
  return [_aq_loadPostLaunchCaches];
}

id objc_msgSend__aq_saveOfflineCache(void *a1, const char *a2, ...)
{
  return [_aq_saveOfflineCache];
}

id objc_msgSend__axBarButtonItemForLargeTitleAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_axBarButtonItemForLargeTitleAccessoryView:");
}

id objc_msgSend__beginBatchUpdatesWithTransaction_generation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginBatchUpdatesWithTransaction:generation:");
}

id objc_msgSend__bitset(void *a1, const char *a2, ...)
{
  return _[a1 _bitset];
}

id objc_msgSend__bodyLeading(void *a1, const char *a2, ...)
{
  return _[a1 _bodyLeading];
}

id objc_msgSend__bottomBaselineForColumns_(void *a1, const char *a2, ...)
{
  return [a1 _bottomBaselineForColumns:];
}

id objc_msgSend__buildVStacks(void *a1, const char *a2, ...)
{
  return _[a1 _buildVStacks];
}

id objc_msgSend__cacheKeyFromRatingStarsImageName_starSize_starCount_starPadding_traitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheKeyFromRatingStarsImageName:starSize:starCount:starPadding:traitCollection:");
}

id objc_msgSend__callActionHandlerForTrigger_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callActionHandlerForTrigger:arguments:");
}

id objc_msgSend__cancelDataRequests(void *a1, const char *a2, ...)
{
  return _[a1 _cancelDataRequests];
}

id objc_msgSend__captureFeedViewState(void *a1, const char *a2, ...)
{
  return _[a1 _captureFeedViewState];
}

id objc_msgSend__checkInitialResourcesAndInvokeDelegateIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _checkInitialResourcesAndInvokeDelegateIfNeeded];
}

id objc_msgSend__cleanUp(void *a1, const char *a2, ...)
{
  return _[a1 _cleanUp];
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return _[a1 _cleanup];
}

id objc_msgSend__clearButton(void *a1, const char *a2, ...)
{
  return _[a1 _clearButton];
}

id objc_msgSend__collectIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_collectIndex:");
}

id objc_msgSend__collectionRenderModel(void *a1, const char *a2, ...)
{
  return _[a1 _collectionRenderModel];
}

id objc_msgSend__columnStyle(void *a1, const char *a2, ...)
{
  return _[a1 _columnStyle];
}

id objc_msgSend__compositingFilter(void *a1, const char *a2, ...)
{
  return _[a1 _compositingFilter];
}

id objc_msgSend__compressStorage(void *a1, const char *a2, ...)
{
  return _[a1 _compressStorage];
}

id objc_msgSend__compute(void *a1, const char *a2, ...)
{
  return _[a1 _compute];
}

id objc_msgSend__computeAspectConstrainedSpecifiedWidthHeight(void *a1, const char *a2, ...)
{
  return _[a1 _computeAspectConstrainedSpecifiedWidthHeight];
}

id objc_msgSend__computeClippedBoundsForProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeClippedBoundsForProvider:");
}

id objc_msgSend__computeClippingBoundsForObserver_(void *a1, const char *a2, ...)
{
  return [a1 _computeClippingBoundsForObserver:];
}

id objc_msgSend__computeCurrentValue_(void *a1, const char *a2, ...)
{
  return [a1 _computeCurrentValue:];
}

id objc_msgSend__computeFromPlusInsertsWithFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeFromPlusInsertsWithFrom:to:");
}

id objc_msgSend__computeHasErrors(void *a1, const char *a2, ...)
{
  return _[a1 _computeHasErrors];
}

id objc_msgSend__computeHash(void *a1, const char *a2, ...)
{
  return _[a1 _computeHash];
}

id objc_msgSend__computeHiddenCells(void *a1, const char *a2, ...)
{
  return _[a1 _computeHiddenCells];
}

id objc_msgSend__computeIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 _computeIntrinsicContentSize];
}

id objc_msgSend__computeSectionUpdates_from_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeSectionUpdates:from:to:");
}

id objc_msgSend__computeUpdatedWithFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeUpdatedWithFrom:to:");
}

id objc_msgSend__computeViewUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _computeViewUpdate];
}

id objc_msgSend__computeVisible(void *a1, const char *a2, ...)
{
  return _[a1 _computeVisible];
}

id objc_msgSend__computeWithUpdates_layoutQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeWithUpdates:layoutQueue:");
}

id objc_msgSend__computedContentInsetsWithRenderModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computedContentInsetsWithRenderModel:");
}

id objc_msgSend__computedFrameTransform(void *a1, const char *a2, ...)
{
  return _[a1 _computedFrameTransform];
}

id objc_msgSend__configureActivityIndicatorView(void *a1, const char *a2, ...)
{
  return _[a1 _configureActivityIndicatorView];
}

id objc_msgSend__configureEffectView(void *a1, const char *a2, ...)
{
  return _[a1 _configureEffectView];
}

id objc_msgSend__configureFullscreenTapGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 _configureFullscreenTapGestureRecognizer];
}

id objc_msgSend__configurePlayButtonView(void *a1, const char *a2, ...)
{
  return _[a1 _configurePlayButtonView];
}

id objc_msgSend__configurePosterFrameImageView(void *a1, const char *a2, ...)
{
  return _[a1 _configurePosterFrameImageView];
}

id objc_msgSend__configurePropertyMap_withFontSpec_style_color_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configurePropertyMap:withFontSpec:style:color:");
}

id objc_msgSend__configureVideoViewController(void *a1, const char *a2, ...)
{
  return _[a1 _configureVideoViewController];
}

id objc_msgSend__configureWithAXAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureWithAXAttributes:");
}

id objc_msgSend__configureWithModel_(void *a1, const char *a2, ...)
{
  return [a1 _configureWithModel:];
}

id objc_msgSend__configuredImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configuredImage:");
}

id objc_msgSend__contentSizeForColumns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentSizeForColumns:");
}

id objc_msgSend__context(void *a1, const char *a2, ...)
{
  return _[a1 _context];
}

id objc_msgSend__controllerWithID_(void *a1, const char *a2, ...)
{
  return [a1 _controllerWithID];
}

id objc_msgSend__convertDrawModel_toKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertDrawModel:toKind:");
}

id objc_msgSend__convertLayerModel_toKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertLayerModel:toKind:");
}

id objc_msgSend__convertModel_toKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertModel:toKind:");
}

id objc_msgSend__copyPackages(void *a1, const char *a2, ...)
{
  return _[a1 _copyPackages];
}

id objc_msgSend__cornerCurve(void *a1, const char *a2, ...)
{
  return _[a1 _cornerCurve];
}

id objc_msgSend__createCharacterStyleWithParentStyle_style_color_fontSpec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createCharacterStyleWithParentStyle:style:color:fontSpec:");
}

id objc_msgSend__createLayoutForModel_withParent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createLayoutForModel:withParent:");
}

id objc_msgSend__createSyncTransactionIfNeededAnimated_duration_timingParameters_timeout_isLayingOutFeed_ignoreWindow_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:");
}

id objc_msgSend__createSyncTransactionWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 _createSyncTransactionWithOptions:];
}

id objc_msgSend__currentStateForControl(void *a1, const char *a2, ...)
{
  return _[a1 _currentStateForControl];
}

id objc_msgSend__currentTraitCollection(void *a1, const char *a2, ...)
{
  return _[a1 _currentTraitCollection];
}

id objc_msgSend__dequeueUpdateGroup(void *a1, const char *a2, ...)
{
  return _[a1 _dequeueUpdateGroup];
}

id objc_msgSend__dequeueUpdateGroupForTransactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dequeueUpdateGroupForTransactionGroup:");
}

id objc_msgSend__determineSourceViewFromState_currentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_determineSourceViewFromState:currentView:");
}

id objc_msgSend__determineSystemAutoPlay(void *a1, const char *a2, ...)
{
  return _[a1 _determineSystemAutoPlay];
}

id objc_msgSend__didSizeChangeComparedToEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 _didSizeChangeComparedToEnvironment];
}

id objc_msgSend__dispatchAfter_toMain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dispatchAfter:toMain:");
}

id objc_msgSend__dispatchAsyncToMain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dispatchAsyncToMain:");
}

id objc_msgSend__dispatchGroup_notifyMain_(void *a1, const char *a2, ...)
{
  return [a1 _dispatchGroup:notifyMain:];
}

id objc_msgSend__dragSession_containsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dragSession:containsView:");
}

id objc_msgSend__drainWithTimeout_(void *a1, const char *a2, ...)
{
  return [a1 _drainWithTimeout:];
}

id objc_msgSend__dynamicColorWithColorsByTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dynamicColorWithColorsByTraitCollection:");
}

id objc_msgSend__effectNeedsView(void *a1, const char *a2, ...)
{
  return _[a1 _effectNeedsView];
}

id objc_msgSend__effectiveSyncLayoutController(void *a1, const char *a2, ...)
{
  return _[a1 _effectiveSyncLayoutController];
}

id objc_msgSend__embeddedCollectionModelWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_embeddedCollectionModelWithContext:");
}

id objc_msgSend__embeddedCollectionView_canHandleDropSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_embeddedCollectionView:canHandleDropSession:");
}

id objc_msgSend__embeddedCollectionView_performDrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_embeddedCollectionView:performDrop:");
}

id objc_msgSend__embeddedCollectionViewForInteraction_session_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_embeddedCollectionViewForInteraction:session:");
}

id objc_msgSend__emitDynamicState(void *a1, const char *a2, ...)
{
  return _[a1 _emitDynamicState];
}

id objc_msgSend__emitImages(void *a1, const char *a2, ...)
{
  return _[a1 _emitImages];
}

id objc_msgSend__endBatchUpdates(void *a1, const char *a2, ...)
{
  return _[a1 _endBatchUpdates];
}

id objc_msgSend__endFilterOperation_(void *a1, const char *a2, ...)
{
  return [a1 _endFilterOperation:];
}

id objc_msgSend__enqueueUpdate_(void *a1, const char *a2, ...)
{
  return [a1 _enqueueUpdate:];
}

id objc_msgSend__enumerateSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateSolution:");
}

id objc_msgSend__examineChildrenIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _examineChildrenIfNeeded];
}

id objc_msgSend__failureAsString(void *a1, const char *a2, ...)
{
  return _[a1 _failureAsString];
}

id objc_msgSend__feedInfo(void *a1, const char *a2, ...)
{
  return _[a1 _feedInfo];
}

id objc_msgSend__fieldEditor(void *a1, const char *a2, ...)
{
  return _[a1 _fieldEditor];
}

id objc_msgSend__filterOptions(void *a1, const char *a2, ...)
{
  return _[a1 _filterOptions];
}

id objc_msgSend__finalRenderModelForDeletedRenderModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finalRenderModelForDeletedRenderModel:");
}

id objc_msgSend__finishOngoingModalTransitionAnimationsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishOngoingModalTransitionAnimationsWithCompletion:");
}

id objc_msgSend__foregroundImageClipBounds(void *a1, const char *a2, ...)
{
  return _[a1 _foregroundImageClipBounds];
}

id objc_msgSend__foregroundImageContainerClipBounds(void *a1, const char *a2, ...)
{
  return _[a1 _foregroundImageContainerClipBounds];
}

id objc_msgSend__generateImageForRatingStarsImageName_starSize_starCount_starPadding_traitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateImageForRatingStarsImageName:starSize:starCount:starPadding:traitCollection:");
}

id objc_msgSend__generateModelsForPhase_sourceRenderModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateModelsForPhase:sourceRenderModel:");
}

id objc_msgSend__groupIdentifierForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupIdentifierForIdentifier:");
}

id objc_msgSend__heightForRows_(void *a1, const char *a2, ...)
{
  return [a1 _heightForRows:];
}

id objc_msgSend__horzOffsetForIndex_(void *a1, const char *a2, ...)
{
  return [a1 _horzOffsetForIndex:];
}

id objc_msgSend__image(void *a1, const char *a2, ...)
{
  return _[a1 _image];
}

id objc_msgSend__infoForFinal_(void *a1, const char *a2, ...)
{
  return [a1 _infoForFinal:];
}

id objc_msgSend__initWithKind_index_edge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithKind:index:edge:");
}

id objc_msgSend__initWithPath_retinaScale_rootDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithPath:retinaScale:rootDict:");
}

id objc_msgSend__initWithSection_(void *a1, const char *a2, ...)
{
  return [a1 _initWithSection:];
}

id objc_msgSend__initWithURL_info_(void *a1, const char *a2, ...)
{
  return [a1 _initWithURL:info:];
}

id objc_msgSend__initialRenderModelForInsertedRenderModel_(void *a1, const char *a2, ...)
{
  return [a1 _initialRenderModelForInsertedRenderModel:];
}

id objc_msgSend__instanceForTransaction_(void *a1, const char *a2, ...)
{
  return [a1 _instanceForTransaction:];
}

id objc_msgSend__instantiateTemplateWithTransactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_instantiateTemplateWithTransactionGroup:");
}

id objc_msgSend__invalidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidate:");
}

id objc_msgSend__invalidateChildrenForModel_(void *a1, const char *a2, ...)
{
  return [a1 _invalidateChildrenForModel:];
}

id objc_msgSend__invalidateImpressionsWithContext_(void *a1, const char *a2, ...)
{
  return [a1 _invalidateImpressionsWithContext:];
}

id objc_msgSend__invalidateIndexPaths_(void *a1, const char *a2, ...)
{
  return [a1 _invalidateIndexPaths:];
}

id objc_msgSend__invalidateLayout_callOnInvalidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateLayout:callOnInvalidate:");
}

id objc_msgSend__invokeCompletions(void *a1, const char *a2, ...)
{
  return _[a1 _invokeCompletions];
}

id objc_msgSend__invokeHandlersForUpdatesApplied(void *a1, const char *a2, ...)
{
  return _[a1 _invokeHandlersForUpdatesApplied];
}

id objc_msgSend__isAnimatingScroll(void *a1, const char *a2, ...)
{
  return _[a1 _isAnimatingScroll];
}

id objc_msgSend__isAutomaticContentOffsetAdjustmentEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isAutomaticContentOffsetAdjustmentEnabled];
}

id objc_msgSend__isDependentOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDependentOn:");
}

id objc_msgSend__isEmptyLine_column_(void *a1, const char *a2, ...)
{
  return [a1 _isEmptyLine:column:];
}

id objc_msgSend__isExpanded(void *a1, const char *a2, ...)
{
  return _[a1 _isExpanded];
}

id objc_msgSend__isInAnimationBlock(void *a1, const char *a2, ...)
{
  return _[a1 _isInAnimationBlock];
}

id objc_msgSend__isRTL(void *a1, const char *a2, ...)
{
  return _[a1 _isRTL];
}

id objc_msgSend__isTruncatedLine_column_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTruncatedLine:column:");
}

id objc_msgSend__isWhitespaceLine_column_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isWhitespaceLine:column:");
}

id objc_msgSend__keyForSharedOfflineCacheURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keyForSharedOfflineCacheURL:");
}

id objc_msgSend__keyboardOverlapInView_usingKeyboardInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keyboardOverlapInView:usingKeyboardInfo:");
}

id objc_msgSend__layout_lengthForProposedLength_(void *a1, const char *a2, ...)
{
  return [a1 _layout:lengthForProposedLength:];
}

id objc_msgSend__layoutAttributesForImpression_index_snapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutAttributesForImpression:index:snapshot:");
}

id objc_msgSend__layoutAttributesForViewModel_index_withLiveTransformResolver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutAttributesForViewModel:index:withLiveTransformResolver:");
}

id objc_msgSend__layoutFeedIgnoringWindow_(void *a1, const char *a2, ...)
{
  return [a1 _layoutFeedIgnoringWindow:];
}

id objc_msgSend__layoutSizeForColumns_withInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutSizeForColumns:withInsets:");
}

id objc_msgSend__leadingGradientFrame(void *a1, const char *a2, ...)
{
  return _[a1 _leadingGradientFrame];
}

id objc_msgSend__lengthForColumns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lengthForColumns:");
}

id objc_msgSend__lengthToAdjustWithMeasured_desired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lengthToAdjustWithMeasured:desired:");
}

id objc_msgSend__loadCacheFromCandidatePaths_(void *a1, const char *a2, ...)
{
  return [a1 _loadCacheFromCandidatePaths:];
}

id objc_msgSend__loadFeed(void *a1, const char *a2, ...)
{
  return _[a1 _loadFeed];
}

id objc_msgSend__loadPlayerWithAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadPlayerWithAsset:");
}

id objc_msgSend__loadedImage_insets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadedImage:insets:");
}

id objc_msgSend__lq_applyTransaction_group_transactions_categories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lq_applyTransaction:group:transactions:categories:");
}

id objc_msgSend__lq_scheduleLayoutRemainder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lq_scheduleLayoutRemainder");
}

id objc_msgSend__lq_shouldInstantiateEntry_sectionIndex_transactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 _lq_shouldInstantiateEntry:sectionIndex:transactionGroup:];
}

id objc_msgSend__lq_shouldSubmitRenderModelUpdate_transactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lq_shouldSubmitRenderModelUpdate:transactionGroup:");
}

id objc_msgSend__makeDir_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeDir:");
}

id objc_msgSend__mappedSpec_traitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mappedSpec:traitCollection:");
}

id objc_msgSend__maxHeight(void *a1, const char *a2, ...)
{
  return _[a1 _maxHeight];
}

id objc_msgSend__metricsForButtonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metricsForButtonType:");
}

id objc_msgSend__needsRenderModel(void *a1, const char *a2, ...)
{
  return _[a1 _needsRenderModel];
}

id objc_msgSend__needsSubviewsRenderModelWithContext_(void *a1, const char *a2, ...)
{
  return [a1 _needsSubviewsRenderModelWithContext:];
}

id objc_msgSend__newImageResourcesWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newImageResourcesWithContext:");
}

id objc_msgSend__newIntrinsicImageResource(void *a1, const char *a2, ...)
{
  return _[a1 _newIntrinsicImageResource];
}

id objc_msgSend__newUpdateGroupWithGeneration_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newUpdateGroupWithGeneration:transaction:");
}

id objc_msgSend__newWPTextForIntrinsic_(void *a1, const char *a2, ...)
{
  return [a1 _newWPTextForIntrinsic:];
}

id objc_msgSend__nodeFromGuide_(void *a1, const char *a2, ...)
{
  return [a1 _nodeFromGuide:];
}

id objc_msgSend__notify(void *a1, const char *a2, ...)
{
  return _[a1 _notify];
}

id objc_msgSend__notifyDelegateOfViewDraggingStateForSession_interaction_dropOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyDelegateOfViewDraggingStateForSession:interaction:dropOperation:");
}

id objc_msgSend__notifyGeometryUpdated(void *a1, const char *a2, ...)
{
  return _[a1 _notifyGeometryUpdated];
}

id objc_msgSend__notifyObserversWithSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyObserversWithSession:");
}

id objc_msgSend__notifyProviderObserversForIdentifier_notifyControllerObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyProviderObserversForIdentifier:notifyControllerObservers:");
}

id objc_msgSend__notifyRenderOverrideObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyRenderOverrideObservers:");
}

id objc_msgSend__orphanLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_orphanLayout:");
}

id objc_msgSend__performPendingBlocks(void *a1, const char *a2, ...)
{
  return _[a1 _performPendingBlocks];
}

id objc_msgSend__pointerTargetViewWithRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pointerTargetViewWithRefId:");
}

id objc_msgSend__popoverArrowDirectionFromProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_popoverArrowDirectionFromProperties:");
}

id objc_msgSend__prebuiltTemplateForURL_looseMatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prebuiltTemplateForURL:looseMatch:");
}

id objc_msgSend__presentMenuAtLocation_(void *a1, const char *a2, ...)
{
  return [a1 _presentMenuAtLocation:];
}

id objc_msgSend__presentPopoverLayoutForViewState_superview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentPopoverLayoutForViewState:superview:");
}

id objc_msgSend__presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 _presentedViewController];
}

id objc_msgSend__privateLocalContext(void *a1, const char *a2, ...)
{
  return _[a1 _privateLocalContext];
}

id objc_msgSend__processUntilDirtyOrEndtime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processUntilDirtyOrEndtime:");
}

id objc_msgSend__propertiesForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 _propertiesForIdentifier:];
}

id objc_msgSend__proxyForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 _proxyForIdentifier];
}

id objc_msgSend__q_loadIntrinsicSize_(void *a1, const char *a2, ...)
{
  return [a1 _q_loadIntrinsicSize:];
}

id objc_msgSend__q_loadedImage_insets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_q_loadedImage:insets:");
}

id objc_msgSend__q_shouldLoadResourceIfNeededAllowDefer_(void *a1, const char *a2, ...)
{
  return [a1 _q_shouldLoadResourceIfNeededAllowDefer];
}

id objc_msgSend__q_unloadResource(void *a1, const char *a2, ...)
{
  return [a1 _q_unloadResource];
}

id objc_msgSend__queueTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 _queueTransactionGroup];
}

id objc_msgSend__refresh(void *a1, const char *a2, ...)
{
  return _[a1 _refresh];
}

id objc_msgSend__registerTriggers(void *a1, const char *a2, ...)
{
  return _[a1 _registerTriggers];
}

id objc_msgSend__removeAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAssertion:");
}

id objc_msgSend__removeAudioSessionObservers(void *a1, const char *a2, ...)
{
  return _[a1 _removeAudioSessionObservers];
}

id objc_msgSend__removeChild_(void *a1, const char *a2, ...)
{
  return [a1 _removeChild:];
}

id objc_msgSend__removeInstanceForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeInstanceForTransaction:");
}

id objc_msgSend__removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeObserver:");
}

id objc_msgSend__removePlaybackCheckObservers(void *a1, const char *a2, ...)
{
  return _[a1 _removePlaybackCheckObservers];
}

id objc_msgSend__removePlayerItemObservers(void *a1, const char *a2, ...)
{
  return _[a1 _removePlayerItemObservers];
}

id objc_msgSend__removePlayerObservers(void *a1, const char *a2, ...)
{
  return _[a1 _removePlayerObservers];
}

id objc_msgSend__removeProviderForViewState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeProviderForViewState:");
}

id objc_msgSend__removeTriggerObservationForRenderModel_(void *a1, const char *a2, ...)
{
  return [a1 _removeTriggerObservationForRenderModel:];
}

id objc_msgSend__renderLargeNavigationBarTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_renderLargeNavigationBarTitle:");
}

id objc_msgSend__renderLargeTitleAccessoryViewWithFactory_(void *a1, const char *a2, ...)
{
  return [a1 _renderLargeTitleAccessoryViewWithFactory:];
}

id objc_msgSend__renderLeftNavigationItemsWithFactory_triggerManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_renderLeftNavigationItemsWithFactory:triggerManager:");
}

id objc_msgSend__renderModel(void *a1, const char *a2, ...)
{
  return _[a1 _renderModel];
}

id objc_msgSend__renderModelChildKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_renderModelChildKind:");
}

id objc_msgSend__renderNavigationBarTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_renderNavigationBarTitle:");
}

id objc_msgSend__renderRightNavigationItemsWithFactory_triggerManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_renderRightNavigationItemsWithFactory:triggerManager:");
}

id objc_msgSend__renderSearchControllerWithFactory_(void *a1, const char *a2, ...)
{
  return [a1 _renderSearchControllerWithFactory:];
}

id objc_msgSend__reportAction_origin_videoId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportAction:origin:videoId:");
}

id objc_msgSend__reportEvent_mediaTimePlayed_videoId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportEvent:mediaTimePlayed:videoId:");
}

id objc_msgSend__resetStyling(void *a1, const char *a2, ...)
{
  return _[a1 _resetStyling];
}

id objc_msgSend__resetUpdateController(void *a1, const char *a2, ...)
{
  return _[a1 _resetUpdateController];
}

id objc_msgSend__resolvedFontSpecWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resolvedFontSpecWithTraitCollection:");
}

id objc_msgSend__resolvedValueForAttribute_node_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resolvedValueForAttribute:node:");
}

id objc_msgSend__retainIndexes_(void *a1, const char *a2, ...)
{
  return [a1 _retainIndexes:];
}

id objc_msgSend__returnKeyTypeForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_returnKeyTypeForString:");
}

id objc_msgSend__reusableViewForRefId_inCurrentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reusableViewForRefId:inCurrentView:");
}

id objc_msgSend__revealableContentPadding(void *a1, const char *a2, ...)
{
  return _[a1 _revealableContentPadding];
}

id objc_msgSend__rootDataProvider(void *a1, const char *a2, ...)
{
  return _[a1 _rootDataProvider];
}

id objc_msgSend__rotatingToInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 _rotatingToInterfaceOrientation];
}

id objc_msgSend__schedule(void *a1, const char *a2, ...)
{
  return _[a1 _schedule];
}

id objc_msgSend__scheduleUpdate_(void *a1, const char *a2, ...)
{
  return [a1 _scheduleUpdate:];
}

id objc_msgSend__scheduleUpdateAtTime_(void *a1, const char *a2, ...)
{
  return [a1 _scheduleUpdateAtTime:];
}

id objc_msgSend__scheduleUpdates_(void *a1, const char *a2, ...)
{
  return [a1 _scheduleUpdates:];
}

id objc_msgSend__scrollAncestor(void *a1, const char *a2, ...)
{
  return _[a1 _scrollAncestor];
}

id objc_msgSend__searchBar(void *a1, const char *a2, ...)
{
  return _[a1 _searchBar];
}

id objc_msgSend__setAlpha_forSessionDragItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAlpha:forSessionDragItems:");
}

id objc_msgSend__setAutoDisableCancelButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAutoDisableCancelButton:");
}

id objc_msgSend__setAutomaticContentOffsetAdjustmentEnabled_(void *a1, const char *a2, ...)
{
  return [a1 _setAutomaticContentOffsetAdjustmentEnabled:];
}

id objc_msgSend__setCancelButtonText_(void *a1, const char *a2, ...)
{
  return [a1 _setCancelButtonText:];
}

id objc_msgSend__setContentNeedsUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _setContentNeedsUpdate];
}

id objc_msgSend__setCurrentTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 _setCurrentTraitCollection:];
}

id objc_msgSend__setLargeTitleAccessoryView_alignToBaseline_(void *a1, const char *a2, ...)
{
  return [a1 _setLargeTitleAccessoryView:alignToBaseline:];
}

id objc_msgSend__setManualScrollEdgeAppearanceEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setManualScrollEdgeAppearanceEnabled:");
}

id objc_msgSend__setManualScrollEdgeAppearanceProgress_(void *a1, const char *a2, ...)
{
  return [a1 _setManualScrollEdgeAppearanceProgress:];
}

id objc_msgSend__setMaximumWidth_(void *a1, const char *a2, ...)
{
  return [a1 _setMaximumWidth:];
}

id objc_msgSend__setMinimumWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setMinimumWidth:");
}

id objc_msgSend__setOverrideContentInsets_forRectEdges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOverrideContentInsets:forRectEdges:");
}

id objc_msgSend__setPlayButtonVisible_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPlayButtonVisible:animated:");
}

id objc_msgSend__setPosterFrameImageVisible_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPosterFrameImageVisible:animated:");
}

id objc_msgSend__setPrivateLocalContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPrivateLocalContext:");
}

id objc_msgSend__setTitleOpacity_(void *a1, const char *a2, ...)
{
  return [a1 _setTitleOpacity:];
}

id objc_msgSend__setValue_forName_(void *a1, const char *a2, ...)
{
  return [a1 _setValue:forName:];
}

id objc_msgSend__setupBarChartBars(void *a1, const char *a2, ...)
{
  return _[a1 _setupBarChartBars];
}

id objc_msgSend__setupController(void *a1, const char *a2, ...)
{
  return _[a1 _setupController];
}

id objc_msgSend__setupControllers(void *a1, const char *a2, ...)
{
  return _[a1 _setupControllers];
}

id objc_msgSend__setupDeterminateBackgroundLayers(void *a1, const char *a2, ...)
{
  return _[a1 _setupDeterminateBackgroundLayers];
}

id objc_msgSend__setupFeedView(void *a1, const char *a2, ...)
{
  return _[a1 _setupFeedView];
}

id objc_msgSend__setupHosting(void *a1, const char *a2, ...)
{
  return _[a1 _setupHosting];
}

id objc_msgSend__setupProgressLayer(void *a1, const char *a2, ...)
{
  return _[a1 _setupProgressLayer];
}

id objc_msgSend__setupTextFields(void *a1, const char *a2, ...)
{
  return _[a1 _setupTextFields];
}

id objc_msgSend__shouldDisableLayoutDueToAppBeingBackgrounded(void *a1, const char *a2, ...)
{
  return _[a1 _shouldDisableLayoutDueToAppBeingBackgrounded];
}

id objc_msgSend__shouldExtendVisibleBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldExtendVisibleBounds:");
}

id objc_msgSend__shouldInferAccessibilityLabel(void *a1, const char *a2, ...)
{
  return _[a1 _shouldInferAccessibilityLabel];
}

id objc_msgSend__shouldVendViewForIdentifier_inGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldVendViewForIdentifier:inGroup:");
}

id objc_msgSend__startFilterOperation_(void *a1, const char *a2, ...)
{
  return [a1 _startFilterOperation:];
}

id objc_msgSend__startObserving(void *a1, const char *a2, ...)
{
  return _[a1 _startObserving];
}

id objc_msgSend__stateAsString(void *a1, const char *a2, ...)
{
  return _[a1 _stateAsString];
}

id objc_msgSend__storageDataset(void *a1, const char *a2, ...)
{
  return _[a1 _storageDataset];
}

id objc_msgSend__symbolImageForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_symbolImageForKey:");
}

id objc_msgSend__synchronouslyUpdateContent_environment_andWaitForEntry_timeout_assertion_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synchronouslyUpdateContent:environment:andWaitForEntry:timeout:assertion:completion:");
}

id objc_msgSend__systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 _systemImageNamed:withConfiguration:];
}

id objc_msgSend__teardownController(void *a1, const char *a2, ...)
{
  return _[a1 _teardownController];
}

id objc_msgSend__teardownControllers(void *a1, const char *a2, ...)
{
  return _[a1 _teardownControllers];
}

id objc_msgSend__teardownDeterminateBackgroundLayers(void *a1, const char *a2, ...)
{
  return _[a1 _teardownDeterminateBackgroundLayers];
}

id objc_msgSend__teardownFeedView(void *a1, const char *a2, ...)
{
  return _[a1 _teardownFeedView];
}

id objc_msgSend__textForControlUsingRenderModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textForControlUsingRenderModel:");
}

id objc_msgSend__timeControlStatusAsString(void *a1, const char *a2, ...)
{
  return _[a1 _timeControlStatusAsString];
}

id objc_msgSend__topAligmentOffsetForColumns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_topAligmentOffsetForColumns:");
}

id objc_msgSend__trailingGradientFrame(void *a1, const char *a2, ...)
{
  return _[a1 _trailingGradientFrame];
}

id objc_msgSend__transformedRenderModel_transform_context_allowCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformedRenderModel:transform:context:allowCache:");
}

id objc_msgSend__tui_commonInit(void *a1, const char *a2, ...)
{
  return [a1 _tui_commonInit];
}

id objc_msgSend__unorphanLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unorphanLayout:");
}

id objc_msgSend__unregisterTriggers(void *a1, const char *a2, ...)
{
  return _[a1 _unregisterTriggers];
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return _[a1 _update];
}

id objc_msgSend__updateAfterLayoutConditionSuspendingUpdatesInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 _updateAfterLayoutConditionSuspendingUpdatesInvalidated];
}

id objc_msgSend__updateAnchorPoint(void *a1, const char *a2, ...)
{
  return _[a1 _updateAnchorPoint];
}

id objc_msgSend__updateAnchorSet(void *a1, const char *a2, ...)
{
  return _[a1 _updateAnchorSet];
}

id objc_msgSend__updateBackdropLayer(void *a1, const char *a2, ...)
{
  return _[a1 _updateBackdropLayer];
}

id objc_msgSend__updateBackgroundImage(void *a1, const char *a2, ...)
{
  return _[a1 _updateBackgroundImage];
}

id objc_msgSend__updateChildren(void *a1, const char *a2, ...)
{
  return _[a1 _updateChildren];
}

id objc_msgSend__updateClippingState(void *a1, const char *a2, ...)
{
  return _[a1 _updateClippingState];
}

id objc_msgSend__updateCount_generation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCount:generation:");
}

id objc_msgSend__updateDatesCollectorInitialResourcesRenderedDate(void *a1, const char *a2, ...)
{
  return _[a1 _updateDatesCollectorInitialResourcesRenderedDate];
}

id objc_msgSend__updateDebugButtons(void *a1, const char *a2, ...)
{
  return _[a1 _updateDebugButtons];
}

id objc_msgSend__updateDraggingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDraggingState:");
}

id objc_msgSend__updateDynamicLayouts(void *a1, const char *a2, ...)
{
  return _[a1 _updateDynamicLayouts];
}

id objc_msgSend__updateDynamicViewState(void *a1, const char *a2, ...)
{
  return _[a1 _updateDynamicViewState];
}

id objc_msgSend__updateEmbedded(void *a1, const char *a2, ...)
{
  return _[a1 _updateEmbedded];
}

id objc_msgSend__updateEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _updateEnabled];
}

id objc_msgSend__updateEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 _updateEnvironment];
}

id objc_msgSend__updateForegroundImage(void *a1, const char *a2, ...)
{
  return _[a1 _updateForegroundImage];
}

id objc_msgSend__updateFromPreviousSubmodels_newSubmodels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFromPreviousSubmodels:newSubmodels:");
}

id objc_msgSend__updateFromState(void *a1, const char *a2, ...)
{
  return _[a1 _updateFromState];
}

id objc_msgSend__updateGeometry(void *a1, const char *a2, ...)
{
  return _[a1 _updateGeometry];
}

id objc_msgSend__updateGeomtry_forIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateGeomtry:forIdentifier:");
}

id objc_msgSend__updateHasOverlays(void *a1, const char *a2, ...)
{
  return _[a1 _updateHasOverlays];
}

id objc_msgSend__updateHeightLayoutConditions(void *a1, const char *a2, ...)
{
  return _[a1 _updateHeightLayoutConditions];
}

id objc_msgSend__updateHost(void *a1, const char *a2, ...)
{
  return _[a1 _updateHost];
}

id objc_msgSend__updateHostingGeometryMapIfNeededWithTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateHostingGeometryMapIfNeededWithTransaction:");
}

id objc_msgSend__updateHostingGeometryMapWithTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateHostingGeometryMapWithTransaction:");
}

id objc_msgSend__updateImagesIfNeededWithForegroundImageName_backgroundImageName_starWidth_starPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateImagesIfNeededWithForegroundImageName:backgroundImageName:starWidth:starPadding:");
}

id objc_msgSend__updateInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInsets:");
}

id objc_msgSend__updateInvalidatedSubviews(void *a1, const char *a2, ...)
{
  return _[a1 _updateInvalidatedSubviews];
}

id objc_msgSend__updateLayerGeometry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLayerGeometry:");
}

id objc_msgSend__updateLayerWithPreviousModel_newModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLayerWithPreviousModel:newModel:");
}

id objc_msgSend__updateLayoutAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLayoutAttributes:");
}

id objc_msgSend__updateLayoutIfNeededIgnoringWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLayoutIfNeededIgnoringWindow:");
}

id objc_msgSend__updateModel(void *a1, const char *a2, ...)
{
  return _[a1 _updateModel];
}

id objc_msgSend__updateNavigationBarItems(void *a1, const char *a2, ...)
{
  return _[a1 _updateNavigationBarItems];
}

id objc_msgSend__updateNavigationItemTriggerObservanceForCurrentRenderModel_previous_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateNavigationItemTriggerObservanceForCurrentRenderModel:previous:");
}

id objc_msgSend__updatePagedScrollable(void *a1, const char *a2, ...)
{
  return _[a1 _updatePagedScrollable];
}

id objc_msgSend__updatePopoverLayout(void *a1, const char *a2, ...)
{
  return _[a1 _updatePopoverLayout];
}

id objc_msgSend__updatePredicate_(void *a1, const char *a2, ...)
{
  return [a1 _updatePredicate:];
}

id objc_msgSend__updatePriority(void *a1, const char *a2, ...)
{
  return _[a1 _updatePriority];
}

id objc_msgSend__updateProvider_count_generation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateProvider:count:generation:");
}

id objc_msgSend__updateRootLayout(void *a1, const char *a2, ...)
{
  return _[a1 _updateRootLayout];
}

id objc_msgSend__updateScrollObserver(void *a1, const char *a2, ...)
{
  return _[a1 _updateScrollObserver];
}

id objc_msgSend__updateSearchController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSearchController:");
}

id objc_msgSend__updateSettled(void *a1, const char *a2, ...)
{
  return _[a1 _updateSettled];
}

id objc_msgSend__updateSpecifiedWidth(void *a1, const char *a2, ...)
{
  return _[a1 _updateSpecifiedWidth];
}

id objc_msgSend__updateState(void *a1, const char *a2, ...)
{
  return _[a1 _updateState];
}

id objc_msgSend__updateStateBasedSubviewsAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateStateBasedSubviewsAnimated:");
}

id objc_msgSend__updateStateBasedTapGestureRecognizers(void *a1, const char *a2, ...)
{
  return _[a1 _updateStateBasedTapGestureRecognizers];
}

id objc_msgSend__updateSubmodelLayers(void *a1, const char *a2, ...)
{
  return _[a1 _updateSubmodelLayers];
}

id objc_msgSend__updateSubviews(void *a1, const char *a2, ...)
{
  return _[a1 _updateSubviews];
}

id objc_msgSend__updateTaskWithHighestRequestedPriority(void *a1, const char *a2, ...)
{
  return _[a1 _updateTaskWithHighestRequestedPriority];
}

id objc_msgSend__updateTriggerStatesWithNewStates_updateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTriggerStatesWithNewStates:updateEvent:");
}

id objc_msgSend__updateValueForPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateValueForPoint:");
}

id objc_msgSend__updateValues(void *a1, const char *a2, ...)
{
  return _[a1 _updateValues];
}

id objc_msgSend__updateVisibilityCollector(void *a1, const char *a2, ...)
{
  return _[a1 _updateVisibilityCollector];
}

id objc_msgSend__updateVisibilityForObserver_time_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateVisibilityForObserver:time:");
}

id objc_msgSend__updateVisibilityWithTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateVisibilityWithTime:");
}

id objc_msgSend__updateVisible(void *a1, const char *a2, ...)
{
  return _[a1 _updateVisible];
}

id objc_msgSend__updateVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateVisible:");
}

id objc_msgSend__updateVisibleOverlays(void *a1, const char *a2, ...)
{
  return _[a1 _updateVisibleOverlays];
}

id objc_msgSend__updateVisibleSubviews(void *a1, const char *a2, ...)
{
  return _[a1 _updateVisibleSubviews];
}

id objc_msgSend__updateWithContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithContent:");
}

id objc_msgSend__updateWithHostingMap_transactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithHostingMap:transactionGroup:");
}

id objc_msgSend__updateWithRenderModel_viewState_flags_transactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithRenderModel:viewState:flags:transactionGroup:");
}

id objc_msgSend__userInterfaceActiveAppearance(void *a1, const char *a2, ...)
{
  return _[a1 _userInterfaceActiveAppearance];
}

id objc_msgSend__validateChildren(void *a1, const char *a2, ...)
{
  return _[a1 _validateChildren];
}

id objc_msgSend__validateChildrenForLayout_(void *a1, const char *a2, ...)
{
  return [a1 _validateChildrenForLayout:];
}

id objc_msgSend__validateInserts(void *a1, const char *a2, ...)
{
  return _[a1 _validateInserts];
}

id objc_msgSend__validateLayout(void *a1, const char *a2, ...)
{
  return _[a1 _validateLayout];
}

id objc_msgSend__validateLayoutWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateLayoutWithBlock:");
}

id objc_msgSend__valueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_valueForValue:");
}

id objc_msgSend__vertOffsetForIndex_(void *a1, const char *a2, ...)
{
  return [a1 _vertOffsetForIndex:];
}

id objc_msgSend__viewForOverrideIdentifier_outParentRenderModelSection_outParentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_viewForOverrideIdentifier:outParentRenderModelSection:outParentView:");
}

id objc_msgSend__viewSize(void *a1, const char *a2, ...)
{
  return _[a1 _viewSize];
}

id objc_msgSend__visibleBounds(void *a1, const char *a2, ...)
{
  return _[a1 _visibleBounds];
}

id objc_msgSend__waitForSyncTransactionCompletion_(void *a1, const char *a2, ...)
{
  return [a1 _waitForSyncTransactionCompletion:];
}

id objc_msgSend__weightFromString_(void *a1, const char *a2, ...)
{
  return [a1 _weightFromString:];
}

id objc_msgSend__windowSize(void *a1, const char *a2, ...)
{
  return _[a1 _windowSize];
}

id objc_msgSend_aTemplate(void *a1, const char *a2, ...)
{
  return _[a1 aTemplate];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_absoluteURL(void *a1, const char *a2, ...)
{
  return _[a1 absoluteURL];
}

id objc_msgSend_acceptsDrop(void *a1, const char *a2, ...)
{
  return _[a1 acceptsDrop];
}

id objc_msgSend_accessibilityActivationPoint(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityActivationPoint];
}

id objc_msgSend_accessibilityContrast(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityContrast];
}

id objc_msgSend_accessibilityElements(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityElements];
}

id objc_msgSend_accessibilityElementsNeeded(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityElementsNeeded];
}

id objc_msgSend_accessibilityFrame(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityFrame];
}

id objc_msgSend_accessibilityFrameRelativeToScrollAncestor(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityFrameRelativeToScrollAncestor];
}

id objc_msgSend_accessibilityHint(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityHint];
}

id objc_msgSend_accessibilityIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityIdentifier];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityLabel];
}

id objc_msgSend_accessibilityTraits(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityTraits];
}

id objc_msgSend_accessibilityValue(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityValue];
}

id objc_msgSend_accumulatedLength(void *a1, const char *a2, ...)
{
  return _[a1 accumulatedLength];
}

id objc_msgSend_accumulatedWidth(void *a1, const char *a2, ...)
{
  return _[a1 accumulatedWidth];
}

id objc_msgSend_actionCaseAsString(void *a1, const char *a2, ...)
{
  return _[a1 actionCaseAsString];
}

id objc_msgSend_actionData(void *a1, const char *a2, ...)
{
  return _[a1 actionData];
}

id objc_msgSend_actionDelegate(void *a1, const char *a2, ...)
{
  return _[a1 actionDelegate];
}

id objc_msgSend_actionHandler(void *a1, const char *a2, ...)
{
  return _[a1 actionHandler];
}

id objc_msgSend_actionHandlerDelegate(void *a1, const char *a2, ...)
{
  return _[a1 actionHandlerDelegate];
}

id objc_msgSend_actionKind(void *a1, const char *a2, ...)
{
  return _[a1 actionKind];
}

id objc_msgSend_actionObject(void *a1, const char *a2, ...)
{
  return _[a1 actionObject];
}

id objc_msgSend_actionWithTitle_image_identifier_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:image:identifier:handler:];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:style:handler:];
}

id objc_msgSend_actionsData(void *a1, const char *a2, ...)
{
  return _[a1 actionsData];
}

id objc_msgSend_actionsMap(void *a1, const char *a2, ...)
{
  return _[a1 actionsMap];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
}

id objc_msgSend_activateEffectWithAnimationCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 activateEffectWithAnimationCoordinator:];
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return _[a1 activationState];
}

id objc_msgSend_activeAppearance(void *a1, const char *a2, ...)
{
  return _[a1 activeAppearance];
}

id objc_msgSend_activeCallbackQueue(void *a1, const char *a2, ...)
{
  return _[a1 activeCallbackQueue];
}

id objc_msgSend_activeHost(void *a1, const char *a2, ...)
{
  return _[a1 activeHost];
}

id objc_msgSend_activeQueue(void *a1, const char *a2, ...)
{
  return _[a1 activeQueue];
}

id objc_msgSend_activeVideoPlayer(void *a1, const char *a2, ...)
{
  return _[a1 activeVideoPlayer];
}

id objc_msgSend_addAXAction_(void *a1, const char *a2, ...)
{
  return [a1 addAXAction:];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return [a1 addAction:];
}

id objc_msgSend_addActionTriggerHandler_controlIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 addActionTriggerHandler:controlIdentifier:];
}

id objc_msgSend_addAdornment_(void *a1, const char *a2, ...)
{
  return [a1 addAdornment:];
}

id objc_msgSend_addAnimation_(void *a1, const char *a2, ...)
{
  return [a1 addAnimation:];
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return [a1 addAnimation:forKey:];
}

id objc_msgSend_addAnimationGroup_withName_(void *a1, const char *a2, ...)
{
  return [a1 addAnimationGroup:withName:];
}

id objc_msgSend_addAnimationGroupPhase_withName_(void *a1, const char *a2, ...)
{
  return [a1 addAnimationGroupPhase:withName:];
}

id objc_msgSend_addAnimationValue_forAttributeName_(void *a1, const char *a2, ...)
{
  return [a1 addAnimationValue:forAttributeName:];
}

id objc_msgSend_addAnimations_(void *a1, const char *a2, ...)
{
  return [a1 addAnimations:];
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return [a1 addAttribute:value:range:];
}

id objc_msgSend_addAttributedString_forRole_(void *a1, const char *a2, ...)
{
  return [a1 addAttributedString:forRole:];
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return [a1 addAttributes:range:];
}

id objc_msgSend_addAttributesFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addAttributesFromArray:];
}

id objc_msgSend_addBox_(void *a1, const char *a2, ...)
{
  return [a1 addBox:];
}

id objc_msgSend_addCategory_(void *a1, const char *a2, ...)
{
  return [a1 addCategory:];
}

id objc_msgSend_addCellOrAdornment_(void *a1, const char *a2, ...)
{
  return [a1 addCellOrAdornment:];
}

id objc_msgSend_addChildLayout_ifFitting_(void *a1, const char *a2, ...)
{
  return [a1 addChildLayout:ifFitting:];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 addChildViewController:];
}

id objc_msgSend_addCommitHandler_forPhase_(void *a1, const char *a2, ...)
{
  return [a1 addCommitHandler:forPhase:];
}

id objc_msgSend_addCompletion_(void *a1, const char *a2, ...)
{
  return [a1 addCompletion:];
}

id objc_msgSend_addCompletion_queue_(void *a1, const char *a2, ...)
{
  return [a1 addCompletion:queue:];
}

id objc_msgSend_addCompletionDeferral(void *a1, const char *a2, ...)
{
  return _[a1 addCompletionDeferral];
}

id objc_msgSend_addConfigurationData_withKey_(void *a1, const char *a2, ...)
{
  return [a1 addConfigurationData:withKey:];
}

id objc_msgSend_addContentModel_(void *a1, const char *a2, ...)
{
  return [a1 addContentModel:];
}

id objc_msgSend_addCoordinatedAnimations_completion_(void *a1, const char *a2, ...)
{
  return [a1 addCoordinatedAnimations:completion:];
}

id objc_msgSend_addDefaultButton(void *a1, const char *a2, ...)
{
  return _[a1 addDefaultButton];
}

id objc_msgSend_addDeletedInterestInDeletedModels_(void *a1, const char *a2, ...)
{
  return [a1 addDeletedInterestInDeletedModels:];
}

id objc_msgSend_addEdgeFrom_to_length_(void *a1, const char *a2, ...)
{
  return [a1 addEdgeFrom:to:length:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addError_(void *a1, const char *a2, ...)
{
  return [a1 addError:];
}

id objc_msgSend_addErrors_(void *a1, const char *a2, ...)
{
  return [a1 addErrors:];
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer:];
}

id objc_msgSend_addImageModel_forRole_(void *a1, const char *a2, ...)
{
  return [a1 addImageModel:forRole:];
}

id objc_msgSend_addImageResource_(void *a1, const char *a2, ...)
{
  return [a1 addImageResource:];
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return [a1 addIndex:];
}

id objc_msgSend_addIndexes_(void *a1, const char *a2, ...)
{
  return [a1 addIndexes:];
}

id objc_msgSend_addIndexesInRange_(void *a1, const char *a2, ...)
{
  return [a1 addIndexesInRange:];
}

id objc_msgSend_addInteraction_(void *a1, const char *a2, ...)
{
  return [a1 addInteraction:];
}

id objc_msgSend_addInterest(void *a1, const char *a2, ...)
{
  return _[a1 addInterest];
}

id objc_msgSend_addKeyCommands_(void *a1, const char *a2, ...)
{
  return [a1 addKeyCommands:];
}

id objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(void *a1, const char *a2, ...)
{
  return [a1 addKeyframeWithRelativeStartTime:relativeStartTime:relativeDuration:animations:];
}

id objc_msgSend_addLayout_length_compressed_(void *a1, const char *a2, ...)
{
  return [a1 addLayout:length:compressed:];
}

id objc_msgSend_addLinkEntity_(void *a1, const char *a2, ...)
{
  return [a1 addLinkEntity:];
}

id objc_msgSend_addLinkEntityAction_(void *a1, const char *a2, ...)
{
  return [a1 addLinkEntityAction];
}

id objc_msgSend_addMenuContainer_(void *a1, const char *a2, ...)
{
  return [a1 addMenuContainer:];
}

id objc_msgSend_addModel_(void *a1, const char *a2, ...)
{
  return [a1 addModel:];
}

id objc_msgSend_addModel_forState_(void *a1, const char *a2, ...)
{
  return [a1 addModel:forState:];
}

id objc_msgSend_addNonVolatileInterest(void *a1, const char *a2, ...)
{
  return _[a1 addNonVolatileInterest];
}

id objc_msgSend_addNotifyWhenAppliedDeferral(void *a1, const char *a2, ...)
{
  return _[a1 addNotifyWhenAppliedDeferral];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObject_toContainingBuilder_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:toContainingBuilder:context:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addObserver_forTrigger_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forTrigger:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addPeriodicTimeObserverForInterval_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addPeriodicTimeObserverForInterval:queue:usingBlock:];
}

id objc_msgSend_addPhase_fromCollector_(void *a1, const char *a2, ...)
{
  return [a1 addPhase:fromCollector:];
}

id objc_msgSend_addPreCommitBlock_(void *a1, const char *a2, ...)
{
  return [a1 addPreCommitBlock:];
}

id objc_msgSend_addProviderObserver_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 addProviderObserver:forIdentifier:];
}

id objc_msgSend_addRegionWithKey_rect_(void *a1, const char *a2, ...)
{
  return [a1 addRegionWithKey:rect:];
}

id objc_msgSend_addRenderOverride_(void *a1, const char *a2, ...)
{
  return [a1 addRenderOverride:];
}

id objc_msgSend_addScrollQuery_animated_skipVoiceOverFocus_(void *a1, const char *a2, ...)
{
  return [a1 addScrollQuery:animated:skipVoiceOverFocus:];
}

id objc_msgSend_addSectionOrAdornment_(void *a1, const char *a2, ...)
{
  return [a1 addSectionOrAdornment:];
}

id objc_msgSend_addSectionView_respectingZIndex_(void *a1, const char *a2, ...)
{
  return [a1 addSectionView:respectingZIndex:];
}

id objc_msgSend_addSegmentWithTitle_(void *a1, const char *a2, ...)
{
  return [a1 addSegmentWithTitle:];
}

id objc_msgSend_addSmartField_toRange_dolcContext_undoTransaction_(void *a1, const char *a2, ...)
{
  return [a1 addSmartField:toRange:dolcContext:undoTransaction:];
}

id objc_msgSend_addSubTransaction_completionQueue_(void *a1, const char *a2, ...)
{
  return [a1 addSubTransaction:completionQueue:];
}

id objc_msgSend_addSubTransactionCompletion_queue_(void *a1, const char *a2, ...)
{
  return [a1 addSubTransactionCompletion:queue:];
}

id objc_msgSend_addSubTransactionCompletionDeferral(void *a1, const char *a2, ...)
{
  return _[a1 addSubTransactionCompletionDeferral];
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return [a1 addSublayer:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addSubview_applyingMaterialStyle_tintEffectStyle_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:applyingMaterialStyle:tintEffectStyle:];
}

id objc_msgSend_addSubviewButton(void *a1, const char *a2, ...)
{
  return _[a1 addSubviewButton];
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forControlEvents:];
}

id objc_msgSend_addText_forRole_(void *a1, const char *a2, ...)
{
  return [a1 addText:forRole:];
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return [a1 addTimer:forMode:];
}

id objc_msgSend_addToLayer_onTop_gravity_(void *a1, const char *a2, ...)
{
  return [a1 addToLayer:onTop:gravity:];
}

id objc_msgSend_addTrigger_withBehavior_(void *a1, const char *a2, ...)
{
  return [a1 addTrigger:withBehavior:];
}

id objc_msgSend_addTrigger_withRefId_(void *a1, const char *a2, ...)
{
  return [a1 addTrigger:withRefId:];
}

id objc_msgSend_addUpdateForTrigger_state_(void *a1, const char *a2, ...)
{
  return [a1 addUpdateForTrigger:state:];
}

id objc_msgSend_addVisibilityObserver_(void *a1, const char *a2, ...)
{
  return [a1 addVisibilityObserver:];
}

id objc_msgSend_addWidgetData_withKey_(void *a1, const char *a2, ...)
{
  return [a1 addWidgetData:withKey:];
}

id objc_msgSend_added(void *a1, const char *a2, ...)
{
  return _[a1 added];
}

id objc_msgSend_additionalConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 additionalConfiguration];
}

id objc_msgSend_adjustedContentInset(void *a1, const char *a2, ...)
{
  return _[a1 adjustedContentInset];
}

id objc_msgSend_adjustedLengthForLayout_(void *a1, const char *a2, ...)
{
  return [a1 adjustedLengthForLayout:];
}

id objc_msgSend_adjustedNaturalLengthWithMeasured_computed_(void *a1, const char *a2, ...)
{
  return [a1 adjustedNaturalLengthWithMeasured:computed:];
}

id objc_msgSend_adornmentKindFromString_(void *a1, const char *a2, ...)
{
  return [a1 adornmentKindFromString:];
}

id objc_msgSend_adornmentRoleFromString_(void *a1, const char *a2, ...)
{
  return [a1 adornmentRoleFromString:];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 alertControllerWithTitle:message:preferredStyle:];
}

id objc_msgSend_alignment(void *a1, const char *a2, ...)
{
  return _[a1 alignment];
}

id objc_msgSend_alignmentInsets(void *a1, const char *a2, ...)
{
  return _[a1 alignmentInsets];
}

id objc_msgSend_alignmentRectForFrame_(void *a1, const char *a2, ...)
{
  return [a1 alignmentRectForFrame:];
}

id objc_msgSend_alignmentRectInsets(void *a1, const char *a2, ...)
{
  return _[a1 alignmentRectInsets];
}

id objc_msgSend_allCategories(void *a1, const char *a2, ...)
{
  return _[a1 allCategories];
}

id objc_msgSend_allContentReadyDate(void *a1, const char *a2, ...)
{
  return _[a1 allContentReadyDate];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allSupportedAttributes(void *a1, const char *a2, ...)
{
  return _[a1 allSupportedAttributes];
}

id objc_msgSend_allTriggers(void *a1, const char *a2, ...)
{
  return _[a1 allTriggers];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_allocateNewIndex(void *a1, const char *a2, ...)
{
  return _[a1 allocateNewIndex];
}

id objc_msgSend_allowDynamicWindowInstantiation(void *a1, const char *a2, ...)
{
  return _[a1 allowDynamicWindowInstantiation];
}

id objc_msgSend_allowEmptyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 allowEmptyEnumerator];
}

id objc_msgSend_allowFullScreen(void *a1, const char *a2, ...)
{
  return _[a1 allowFullScreen];
}

id objc_msgSend_allowHangingPunctuation(void *a1, const char *a2, ...)
{
  return _[a1 allowHangingPunctuation];
}

id objc_msgSend_allowShrinkToFit(void *a1, const char *a2, ...)
{
  return _[a1 allowShrinkToFit];
}

id objc_msgSend_allowedAsChildInContainedBuilding(void *a1, const char *a2, ...)
{
  return _[a1 allowedAsChildInContainedBuilding];
}

id objc_msgSend_allowsGroupBlending(void *a1, const char *a2, ...)
{
  return _[a1 allowsGroupBlending];
}

id objc_msgSend_allowsMultipleUpdates(void *a1, const char *a2, ...)
{
  return _[a1 allowsMultipleUpdates];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_ancestorScrollIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 ancestorScrollIdentifier];
}

id objc_msgSend_anchor(void *a1, const char *a2, ...)
{
  return _[a1 anchor];
}

id objc_msgSend_anchorOffset(void *a1, const char *a2, ...)
{
  return _[a1 anchorOffset];
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return _[a1 anchorPoint];
}

id objc_msgSend_anchorPosition(void *a1, const char *a2, ...)
{
  return _[a1 anchorPosition];
}

id objc_msgSend_anchorPositionFromString_(void *a1, const char *a2, ...)
{
  return [a1 anchorPositionFromString:];
}

id objc_msgSend_anchorRefId(void *a1, const char *a2, ...)
{
  return _[a1 anchorRefId];
}

id objc_msgSend_anchorSet(void *a1, const char *a2, ...)
{
  return _[a1 anchorSet];
}

id objc_msgSend_animate(void *a1, const char *a2, ...)
{
  return _[a1 animate];
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateAlongsideTransition:completion:];
}

id objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateKeyframesWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:];
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:animations:completion:];
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:delay:options:animations:completion:];
}

id objc_msgSend_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:");
}

id objc_msgSend_animatedUpdateCompletionGroup(void *a1, const char *a2, ...)
{
  return _[a1 animatedUpdateCompletionGroup];
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return _[a1 animation];
}

id objc_msgSend_animationCalculationModeAndCurveForNode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationCalculationModeAndCurveForNode:");
}

id objc_msgSend_animationDefinitonWithNode_nameAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationDefinitonWithNode:nameAttribute:");
}

id objc_msgSend_animationForKey_(void *a1, const char *a2, ...)
{
  return [a1 animationForKey:];
}

id objc_msgSend_animationForKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 animationForKeyPath:];
}

id objc_msgSend_animationGroups(void *a1, const char *a2, ...)
{
  return _[a1 animationGroups];
}

id objc_msgSend_animationKeys(void *a1, const char *a2, ...)
{
  return _[a1 animationKeys];
}

id objc_msgSend_animationReferenceForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 animationReferenceForAttribute:node:];
}

id objc_msgSend_animationRenderModels(void *a1, const char *a2, ...)
{
  return _[a1 animationRenderModels];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 animationWithKeyPath:];
}

id objc_msgSend_animations(void *a1, const char *a2, ...)
{
  return _[a1 animations];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appendAdornmentRenderModelsCompatibleWithKind_transform_context_box_toModels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAdornmentRenderModelsCompatibleWithKind:transform:context:box:toModels:");
}

id objc_msgSend_appendAnchorsToSet_forLayout_inRoot_(void *a1, const char *a2, ...)
{
  return [a1 appendAnchorsToSet:forLayout:inRoot:];
}

id objc_msgSend_appendAnchorsToSet_inRoot_(void *a1, const char *a2, ...)
{
  return [a1 appendAnchorsToSet:inRoot:];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 appendAttributedString:];
}

id objc_msgSend_appendBoxDescription_(void *a1, const char *a2, ...)
{
  return [a1 appendBoxDescription:];
}

id objc_msgSend_appendChildAnchorsToSet_inRoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendChildAnchorsToSet:inRoot:");
}

id objc_msgSend_appendChildRenderModelCompatibleWithKind_context_transform_toModels_(void *a1, const char *a2, ...)
{
  return [a1 appendChildRenderModelCompatibleWithKind:context:transform:toModels:];
}

id objc_msgSend_appendChilden_renderModelCompatibleWithKind_context_transform_toModels_(void *a1, const char *a2, ...)
{
  return [a1 appendChilden:renderModelCompatibleWithKind:context:transform:toModels:];
}

id objc_msgSend_appendContainedChildrenToArray_(void *a1, const char *a2, ...)
{
  return [a1 appendContainedChildrenToArray:];
}

id objc_msgSend_appendEmbeddedAnchorsToSet_inRoot_(void *a1, const char *a2, ...)
{
  return [a1 appendEmbeddedAnchorsToSet:inRoot:];
}

id objc_msgSend_appendEmbeddedIdentifierMaps_updateControllers_UUIDs_(void *a1, const char *a2, ...)
{
  return [a1 appendEmbeddedIdentifierMaps:updateControllers:UUIDs:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendHoverRegions_relativeToLayout_(void *a1, const char *a2, ...)
{
  return [a1 appendHoverRegions:relativeToLayout:];
}

id objc_msgSend_appendHoverRegions_transform_(void *a1, const char *a2, ...)
{
  return [a1 appendHoverRegions:transform:];
}

id objc_msgSend_appendHyperlinkWithURL_block_(void *a1, const char *a2, ...)
{
  return [a1 appendHyperlinkWithURL:];
}

id objc_msgSend_appendImpressionLayoutAttributes_forElementsInRect_snapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendImpressionLayoutAttributes:forElementsInRect:snapshot:");
}

id objc_msgSend_appendLayoutAttributes_forElementsInRect_withLiveTransformResolver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendLayoutAttributes:forElementsInRect:withLiveTransformResolver:");
}

id objc_msgSend_appendLayoutChildrenToArray_(void *a1, const char *a2, ...)
{
  return [a1 appendLayoutChildrenToArray:];
}

id objc_msgSend_appendLayoutModelsToArray_(void *a1, const char *a2, ...)
{
  return [a1 appendLayoutModelsToArray:];
}

id objc_msgSend_appendLayoutsWithSpecifiedWidthModifiedToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendLayoutsWithSpecifiedWidthModifiedToArray:");
}

id objc_msgSend_appendLiveTransformLayoutAttributes_forElementsInRect_withLiveTransformResolver_(void *a1, const char *a2, ...)
{
  return [a1 appendLiveTransformLayoutAttributes:forElementsInRect:withLiveTransformResolver:];
}

id objc_msgSend_appendLiveTransformViewInvalidationMap_(void *a1, const char *a2, ...)
{
  return [a1 appendLiveTransformViewInvalidationMap:];
}

id objc_msgSend_appendLogicalScrollAnchor_withOffset_(void *a1, const char *a2, ...)
{
  return [a1 appendLogicalScrollAnchor:withOffset:];
}

id objc_msgSend_appendNonScrollableAdornmentRenderModelsCompatibleWithKind_transform_context_box_toModels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendNonScrollableAdornmentRenderModelsCompatibleWithKind:transform:context:box:toModels:");
}

id objc_msgSend_appendObjectsWithProtocol_toArray_(void *a1, const char *a2, ...)
{
  return [a1 appendObjectsWithProtocol:toArray:];
}

id objc_msgSend_appendReference_withIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 appendReference:withIdentifier:];
}

id objc_msgSend_appendReferencesToCollector_transform_query_liveTransformResolver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendReferencesToCollector:transform:query:liveTransformResolver:");
}

id objc_msgSend_appendRenderModelCompatibleWithKind_context_transform_toModels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendRenderModelCompatibleWithKind:context:transform:toModels:");
}

id objc_msgSend_appendRenderModelIgnoreHiddenCompatibleWithKind_context_transform_toModels_(void *a1, const char *a2, ...)
{
  return [a1 appendRenderModelIgnoreHiddenCompatibleWithKind:context:transform:toModels:];
}

id objc_msgSend_appendRenderOverrideObservers_(void *a1, const char *a2, ...)
{
  return [a1 appendRenderOverrideObservers:];
}

id objc_msgSend_appendResourcesToCollector_transform_(void *a1, const char *a2, ...)
{
  return [a1 appendResourcesToCollector:transform:];
}

id objc_msgSend_appendScrollAnchor_(void *a1, const char *a2, ...)
{
  return [a1 appendScrollAnchor:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_appendToBuilder_context_(void *a1, const char *a2, ...)
{
  return [a1 appendToBuilder:context:];
}

id objc_msgSend_appendTriggerAnchorWithOffset_trigger_axis_(void *a1, const char *a2, ...)
{
  return [a1 appendTriggerAnchorWithOffset:trigger:axis:];
}

id objc_msgSend_appendUpdateBlock_(void *a1, const char *a2, ...)
{
  return [a1 appendUpdateBlock:];
}

id objc_msgSend_appendVisibleBoundsObservers_axis_offset_(void *a1, const char *a2, ...)
{
  return [a1 appendVisibleBoundsObservers:axis:offset:];
}

id objc_msgSend_appendVisibleView_(void *a1, const char *a2, ...)
{
  return [a1 appendVisibleView:];
}

id objc_msgSend_appendWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 appendWithBlock:];
}

id objc_msgSend_appendWithStyle_color_fontSpec_block_(void *a1, const char *a2, ...)
{
  return [a1 appendWithStyle:color:fontSpec:block:];
}

id objc_msgSend_applyInitialUpdate(void *a1, const char *a2, ...)
{
  return _[a1 applyInitialUpdate];
}

id objc_msgSend_applyLayerModelUpdate_hasInvalidLayouts_(void *a1, const char *a2, ...)
{
  return [a1 applyLayerModelUpdate:hasInvalidLayouts:];
}

id objc_msgSend_applyLayoutAttributes_(void *a1, const char *a2, ...)
{
  return [a1 applyLayoutAttributes:];
}

id objc_msgSend_applyStyle_(void *a1, const char *a2, ...)
{
  return [a1 applyStyle:];
}

id objc_msgSend_applyStylingToLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyStylingToLayer:");
}

id objc_msgSend_applyStylingToView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyStylingToView:");
}

id objc_msgSend_applyToContext_(void *a1, const char *a2, ...)
{
  return [a1 applyToContext:];
}

id objc_msgSend_applyToFeedView_completion_(void *a1, const char *a2, ...)
{
  return [a1 applyToFeedView:completion:];
}

id objc_msgSend_applyToImage_completion_(void *a1, const char *a2, ...)
{
  return [a1 applyToImage:completion:];
}

id objc_msgSend_applyUpdate_(void *a1, const char *a2, ...)
{
  return [a1 applyUpdate:];
}

id objc_msgSend_applyUpdate_controller_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyUpdate:controller:completion:");
}

id objc_msgSend_applyUpdateCollection_updates_(void *a1, const char *a2, ...)
{
  return [a1 applyUpdateCollection:updates];
}

id objc_msgSend_applyUpdates(void *a1, const char *a2, ...)
{
  return _[a1 applyUpdates];
}

id objc_msgSend_applyUpdatesForTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 applyUpdatesForTransactionGroup:];
}

id objc_msgSend_applyUpdatesForTransactionGroup_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyUpdatesForTransactionGroup:withBlock:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [a1 archivedDataWithRootObject:requiringSecureCoding:error:];
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 areAnimationsEnabled];
}

id objc_msgSend_areFeedUpdatesAnimated(void *a1, const char *a2, ...)
{
  return _[a1 areFeedUpdatesAnimated];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return _[a1 arguments];
}

id objc_msgSend_argumentsForView_(void *a1, const char *a2, ...)
{
  return [a1 argumentsForView:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObject:];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObjectsFromArray:];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_arrowDirection(void *a1, const char *a2, ...)
{
  return _[a1 arrowDirection];
}

id objc_msgSend_arrowDirectionFromString_(void *a1, const char *a2, ...)
{
  return [a1 arrowDirectionFromString:];
}

id objc_msgSend_aspectConstrainedSpecifiedHeight(void *a1, const char *a2, ...)
{
  return _[a1 aspectConstrainedSpecifiedHeight];
}

id objc_msgSend_aspectConstrainedSpecifiedWidth(void *a1, const char *a2, ...)
{
  return _[a1 aspectConstrainedSpecifiedWidth];
}

id objc_msgSend_aspectRatio(void *a1, const char *a2, ...)
{
  return _[a1 aspectRatio];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return _[a1 asset];
}

id objc_msgSend_associatedIndex(void *a1, const char *a2, ...)
{
  return _[a1 associatedIndex];
}

id objc_msgSend_attachToTracker_(void *a1, const char *a2, ...)
{
  return [a1 attachToTracker:];
}

id objc_msgSend_attemptPendingScrolls(void *a1, const char *a2, ...)
{
  return _[a1 attemptPendingScrolls];
}

id objc_msgSend_attribute_atIndex_effectiveRange_(void *a1, const char *a2, ...)
{
  return [a1 attribute:atIndex:effectiveRange:];
}

id objc_msgSend_attributeWithName_(void *a1, const char *a2, ...)
{
  return [a1 attributeWithName:];
}

id objc_msgSend_attributedPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 attributedPlaceholder];
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return [a1 attributedStringWithAttachment:];
}

id objc_msgSend_attributedTitle(void *a1, const char *a2, ...)
{
  return _[a1 attributedTitle];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_attributesForAttributedString(void *a1, const char *a2, ...)
{
  return _[a1 attributesForAttributedString];
}

id objc_msgSend_attributesForButtonType_(void *a1, const char *a2, ...)
{
  return [a1 attributesForButtonType:];
}

id objc_msgSend_attributesMap(void *a1, const char *a2, ...)
{
  return _[a1 attributesMap];
}

id objc_msgSend_attributesToEvaluate(void *a1, const char *a2, ...)
{
  return _[a1 attributesToEvaluate];
}

id objc_msgSend_attributesToEvaluateForInvocation(void *a1, const char *a2, ...)
{
  return _[a1 attributesToEvaluateForInvocation];
}

id objc_msgSend_attributesToIgnoreWhenResolving(void *a1, const char *a2, ...)
{
  return _[a1 attributesToIgnoreWhenResolving];
}

id objc_msgSend_attributesToIgnoreWhenResolvingInvocation(void *a1, const char *a2, ...)
{
  return _[a1 attributesToIgnoreWhenResolvingInvocation];
}

id objc_msgSend_autoPlay(void *a1, const char *a2, ...)
{
  return _[a1 autoPlay];
}

id objc_msgSend_auxRenderModel(void *a1, const char *a2, ...)
{
  return _[a1 auxRenderModel];
}

id objc_msgSend_auxiliaryUpdateController(void *a1, const char *a2, ...)
{
  return _[a1 auxiliaryUpdateController];
}

id objc_msgSend_availableHeight(void *a1, const char *a2, ...)
{
  return _[a1 availableHeight];
}

id objc_msgSend_avoidSyncTransactionInViewWillAppear(void *a1, const char *a2, ...)
{
  return _[a1 avoidSyncTransactionInViewWillAppear];
}

id objc_msgSend_axActions(void *a1, const char *a2, ...)
{
  return _[a1 axActions];
}

id objc_msgSend_axAdjustable(void *a1, const char *a2, ...)
{
  return _[a1 axAdjustable];
}

id objc_msgSend_axAttributes(void *a1, const char *a2, ...)
{
  return _[a1 axAttributes];
}

id objc_msgSend_axButton(void *a1, const char *a2, ...)
{
  return _[a1 axButton];
}

id objc_msgSend_axCustomActions(void *a1, const char *a2, ...)
{
  return _[a1 axCustomActions];
}

id objc_msgSend_axDisabled(void *a1, const char *a2, ...)
{
  return _[a1 axDisabled];
}

id objc_msgSend_axHasNonDefaultAttributess(void *a1, const char *a2, ...)
{
  return _[a1 axHasNonDefaultAttributess];
}

id objc_msgSend_axHeading(void *a1, const char *a2, ...)
{
  return _[a1 axHeading];
}

id objc_msgSend_axHint(void *a1, const char *a2, ...)
{
  return _[a1 axHint];
}

id objc_msgSend_axIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 axIdentifier];
}

id objc_msgSend_axImage(void *a1, const char *a2, ...)
{
  return _[a1 axImage];
}

id objc_msgSend_axLabel(void *a1, const char *a2, ...)
{
  return _[a1 axLabel];
}

id objc_msgSend_axModel(void *a1, const char *a2, ...)
{
  return _[a1 axModel];
}

id objc_msgSend_axModelTree(void *a1, const char *a2, ...)
{
  return _[a1 axModelTree];
}

id objc_msgSend_axModelTreeWithCustomActionsCollector_scrollAncestorLayout_scrollAncestorTranslation_liveTransformAncestorLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:");
}

id objc_msgSend_axStaticText(void *a1, const char *a2, ...)
{
  return _[a1 axStaticText];
}

id objc_msgSend_axToggle(void *a1, const char *a2, ...)
{
  return _[a1 axToggle];
}

id objc_msgSend_axTouchContainer(void *a1, const char *a2, ...)
{
  return _[a1 axTouchContainer];
}

id objc_msgSend_axValue(void *a1, const char *a2, ...)
{
  return _[a1 axValue];
}

id objc_msgSend_axis(void *a1, const char *a2, ...)
{
  return _[a1 axis];
}

id objc_msgSend_axisFromString_(void *a1, const char *a2, ...)
{
  return [a1 axisFromString:];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return _[a1 background];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_backgroundImageName(void *a1, const char *a2, ...)
{
  return _[a1 backgroundImageName];
}

id objc_msgSend_backgroundKind(void *a1, const char *a2, ...)
{
  return _[a1 backgroundKind];
}

id objc_msgSend_backgroundKindFromString_(void *a1, const char *a2, ...)
{
  return [a1 backgroundKindFromString:];
}

id objc_msgSend_balanceSections(void *a1, const char *a2, ...)
{
  return _[a1 balanceSections];
}

id objc_msgSend_baseBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 baseBackgroundColor];
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return _[a1 baseURL];
}

id objc_msgSend_baseURLForNode_(void *a1, const char *a2, ...)
{
  return [a1 baseURLForNode:];
}

id objc_msgSend_baseUrl(void *a1, const char *a2, ...)
{
  return _[a1 baseUrl];
}

id objc_msgSend_basedOn(void *a1, const char *a2, ...)
{
  return _[a1 basedOn];
}

id objc_msgSend_baseline(void *a1, const char *a2, ...)
{
  return _[a1 baseline];
}

id objc_msgSend_baselineOfLineFragmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 baselineOfLineFragmentAtIndex:];
}

id objc_msgSend_baselineOffset(void *a1, const char *a2, ...)
{
  return _[a1 baselineOffset];
}

id objc_msgSend_baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _[a1 baselineOffsetFromBottom];
}

id objc_msgSend_becameHiddenAtTime_threshold_(void *a1, const char *a2, ...)
{
  return [a1 becameHiddenAtTime:threshold:];
}

id objc_msgSend_becameVisibleAtTime_(void *a1, const char *a2, ...)
{
  return [a1 becameVisibleAtTime:];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginAppearanceTransition_animated_(void *a1, const char *a2, ...)
{
  return [a1 beginAppearanceTransition:animated:];
}

id objc_msgSend_beginCaptureWithFactory_completion_(void *a1, const char *a2, ...)
{
  return [a1 beginCaptureWithFactory:completion:];
}

id objc_msgSend_beginFrame(void *a1, const char *a2, ...)
{
  return _[a1 beginFrame];
}

id objc_msgSend_beginLayout(void *a1, const char *a2, ...)
{
  return _[a1 beginLayout];
}

id objc_msgSend_beginLiveResize(void *a1, const char *a2, ...)
{
  return _[a1 beginLiveResize];
}

id objc_msgSend_beginLoadingResources(void *a1, const char *a2, ...)
{
  return _[a1 beginLoadingResources];
}

id objc_msgSend_beginTime(void *a1, const char *a2, ...)
{
  return _[a1 beginTime];
}

id objc_msgSend_beginViewUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginViewUpdates];
}

id objc_msgSend_behavior(void *a1, const char *a2, ...)
{
  return _[a1 behavior];
}

id objc_msgSend_behaviorDataForTrigger_(void *a1, const char *a2, ...)
{
  return [a1 behaviorDataForTrigger:];
}

id objc_msgSend_behaviorWithName_(void *a1, const char *a2, ...)
{
  return [a1 behaviorWithName:];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return _[a1 bezierPath];
}

id objc_msgSend_bezierPathWithOvalInRect_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithOvalInRect:];
}

id objc_msgSend_binding(void *a1, const char *a2, ...)
{
  return _[a1 binding];
}

id objc_msgSend_bindingNameForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 bindingNameForAttribute:node:];
}

id objc_msgSend_bindings(void *a1, const char *a2, ...)
{
  return _[a1 bindings];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_blendMode(void *a1, const char *a2, ...)
{
  return _[a1 blendMode];
}

id objc_msgSend_blendModeFromString_(void *a1, const char *a2, ...)
{
  return [a1 blendModeFromString:];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _[a1 block];
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return _[a1 blueColor];
}

id objc_msgSend_blurEffectStyleFromString_(void *a1, const char *a2, ...)
{
  return [a1 blurEffectStyleFromString:];
}

id objc_msgSend_blurStyle(void *a1, const char *a2, ...)
{
  return _[a1 blurStyle];
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 boldSystemFontOfSize:];
}

id objc_msgSend_BOOLForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForAttribute:node:];
}

id objc_msgSend_BOOLForAttribute_withDefault_node_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForAttribute:withDefault:node:];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLFromDictionary_key_defaultValue_(void *a1, const char *a2, ...)
{
  return [a1 BOOLFromDictionary:key:defaultValue:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_borderColor(void *a1, const char *a2, ...)
{
  return _[a1 borderColor];
}

id objc_msgSend_borderWidth(void *a1, const char *a2, ...)
{
  return _[a1 borderWidth];
}

id objc_msgSend_bottom(void *a1, const char *a2, ...)
{
  return _[a1 bottom];
}

id objc_msgSend_bottomTriggerName(void *a1, const char *a2, ...)
{
  return _[a1 bottomTriggerName];
}

id objc_msgSend_boundingRectForMatchingQuery_viewState_(void *a1, const char *a2, ...)
{
  return [a1 boundingRectForMatchingQuery:viewState:];
}

id objc_msgSend_boundingRectWithSize_options_context_(void *a1, const char *a2, ...)
{
  return [a1 boundingRectWithSize:options:context:];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_boundsForFeedView(void *a1, const char *a2, ...)
{
  return _[a1 boundsForFeedView];
}

id objc_msgSend_box(void *a1, const char *a2, ...)
{
  return _[a1 box];
}

id objc_msgSend_boxType(void *a1, const char *a2, ...)
{
  return _[a1 boxType];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return [a1 bringSubviewToFront:];
}

id objc_msgSend_bu_arrayByInvokingBlock_(void *a1, const char *a2, ...)
{
  return [a1 bu_arrayByInvokingBlock:];
}

id objc_msgSend_builderCache(void *a1, const char *a2, ...)
{
  return _[a1 builderCache];
}

id objc_msgSend_builderClass(void *a1, const char *a2, ...)
{
  return _[a1 builderClass];
}

id objc_msgSend_builderClassForDynamicInstantiation(void *a1, const char *a2, ...)
{
  return _[a1 builderClassForDynamicInstantiation];
}

id objc_msgSend_builderProtocols(void *a1, const char *a2, ...)
{
  return _[a1 builderProtocols];
}

id objc_msgSend_builderWithNode_object_attributes_context_(void *a1, const char *a2, ...)
{
  return [a1 builderWithNode:object:attributes:context:];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass];
}

id objc_msgSend_bundleWithURL_requireInfoPlist_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithURL:requireInfoPlist:];
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return _[a1 button];
}

id objc_msgSend_button_contextMenuInteraction_willDisplayMenuForConfiguration_animator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "button:contextMenuInteraction:willDisplayMenuForConfiguration:animator:");
}

id objc_msgSend_button_contextMenuInteraction_willEndForConfiguration_animator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "button:contextMenuInteraction:willEndForConfiguration:animator:");
}

id objc_msgSend_buttonMask(void *a1, const char *a2, ...)
{
  return _[a1 buttonMask];
}

id objc_msgSend_buttonRole(void *a1, const char *a2, ...)
{
  return _[a1 buttonRole];
}

id objc_msgSend_buttonRoleFromString_(void *a1, const char *a2, ...)
{
  return [a1 buttonRoleFromString:];
}

id objc_msgSend_buttonType(void *a1, const char *a2, ...)
{
  return _[a1 buttonType];
}

id objc_msgSend_buttonTypeFromString_(void *a1, const char *a2, ...)
{
  return [a1 buttonTypeFromString:];
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithType:];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cacheDirCandidatesForPostLaunch(void *a1, const char *a2, ...)
{
  return _[a1 cacheDirCandidatesForPostLaunch];
}

id objc_msgSend_cacheFileCandidatesForPreLaunch(void *a1, const char *a2, ...)
{
  return _[a1 cacheFileCandidatesForPreLaunch];
}

id objc_msgSend_cacheKeyWithColor_(void *a1, const char *a2, ...)
{
  return [a1 cacheKeyWithColor:];
}

id objc_msgSend_cacheKeyWithFilterInfo_(void *a1, const char *a2, ...)
{
  return [a1 cacheKeyWithFilterInfo:];
}

id objc_msgSend_cacheKeyWithSize_(void *a1, const char *a2, ...)
{
  return [a1 cacheKeyWithSize:];
}

id objc_msgSend_cachedRenderModelValidatedForLayout_(void *a1, const char *a2, ...)
{
  return [a1 cachedRenderModelValidatedForLayout:];
}

id objc_msgSend_cachedResponseForRequest_(void *a1, const char *a2, ...)
{
  return [a1 cachedResponseForRequest:];
}

id objc_msgSend_calculatedInsetForFooterText(void *a1, const char *a2, ...)
{
  return _[a1 calculatedInsetForFooterText];
}

id objc_msgSend_calculatedInsetForTitleText(void *a1, const char *a2, ...)
{
  return _[a1 calculatedInsetForTitleText];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return _[a1 callStackSymbols];
}

id objc_msgSend_callWithArguments_(void *a1, const char *a2, ...)
{
  return [a1 callWithArguments:];
}

id objc_msgSend_callstack(void *a1, const char *a2, ...)
{
  return _[a1 callstack];
}

id objc_msgSend_canHandleDropSession_actionObject_behavior_(void *a1, const char *a2, ...)
{
  return [a1 canHandleDropSession:actionObject:behavior:];
}

id objc_msgSend_canHandleDropSession_behavior_(void *a1, const char *a2, ...)
{
  return [a1 canHandleDropSession:behavior:];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return _[a1 cancelButton];
}

id objc_msgSend_cancelLoading(void *a1, const char *a2, ...)
{
  return _[a1 cancelLoading];
}

id objc_msgSend_cancelSynchronousAndSuspendUpdatesUnlessFinalized(void *a1, const char *a2, ...)
{
  return _[a1 cancelSynchronousAndSuspendUpdatesUnlessFinalized];
}

id objc_msgSend_cancelText(void *a1, const char *a2, ...)
{
  return _[a1 cancelText];
}

id objc_msgSend_caps(void *a1, const char *a2, ...)
{
  return _[a1 caps];
}

id objc_msgSend_captionsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 captionsEnabled];
}

id objc_msgSend_capture(void *a1, const char *a2, ...)
{
  return _[a1 capture];
}

id objc_msgSend_captureDynamicState_forKind_instance_parameters_(void *a1, const char *a2, ...)
{
  return [a1 captureDynamicState:forKind:instance:parameters:];
}

id objc_msgSend_captureImageResource_forKind_naturalSize_contentsScale_instance_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "captureImageResource:forKind:naturalSize:contentsScale:instance:options:");
}

id objc_msgSend_captureIntrinsicImageResource_forKind_instance_options_(void *a1, const char *a2, ...)
{
  return [a1 captureIntrinsicImageResource:forKind:instance:options:];
}

id objc_msgSend_captureSectionWithEntry_bindings_template_(void *a1, const char *a2, ...)
{
  return [a1 captureSectionWithEntry:bindings:template:];
}

id objc_msgSend_captureTokenFromContext_(void *a1, const char *a2, ...)
{
  return [a1 captureTokenFromContext:];
}

id objc_msgSend_captureWithController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "captureWithController:completion:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return [a1 caseInsensitiveCompare:];
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return _[a1 categories];
}

id objc_msgSend_cells(void *a1, const char *a2, ...)
{
  return _[a1 cells];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_cgImages(void *a1, const char *a2, ...)
{
  return _[a1 cgImages];
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return _[a1 changeType];
}

id objc_msgSend_changes(void *a1, const char *a2, ...)
{
  return _[a1 changes];
}

id objc_msgSend_charCount(void *a1, const char *a2, ...)
{
  return _[a1 charCount];
}

id objc_msgSend_charIndex(void *a1, const char *a2, ...)
{
  return _[a1 charIndex];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 characterAtIndex:];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 characterSetWithCharactersInString:];
}

id objc_msgSend_characterStyleAtCharIndex_effectiveRange_(void *a1, const char *a2, ...)
{
  return [a1 characterStyleAtCharIndex:effectiveRange:];
}

id objc_msgSend_chartType(void *a1, const char *a2, ...)
{
  return _[a1 chartType];
}

id objc_msgSend_checkContents_(void *a1, const char *a2, ...)
{
  return [a1 checkContents:];
}

id objc_msgSend_childCountForNode_(void *a1, const char *a2, ...)
{
  return [a1 childCountForNode:];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _[a1 children];
}

id objc_msgSend_childrenForHoverRegions(void *a1, const char *a2, ...)
{
  return _[a1 childrenForHoverRegions];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearErrors(void *a1, const char *a2, ...)
{
  return _[a1 clearErrors];
}

id objc_msgSend_clearImpressions(void *a1, const char *a2, ...)
{
  return _[a1 clearImpressions];
}

id objc_msgSend_clearPool(void *a1, const char *a2, ...)
{
  return _[a1 clearPool];
}

id objc_msgSend_clipContainerForCrossfade(void *a1, const char *a2, ...)
{
  return _[a1 clipContainerForCrossfade];
}

id objc_msgSend_clipsToBounds(void *a1, const char *a2, ...)
{
  return _[a1 clipsToBounds];
}

id objc_msgSend_closureAndCapture(void *a1, const char *a2, ...)
{
  return _[a1 closureAndCapture];
}

id objc_msgSend_closureForNode_(void *a1, const char *a2, ...)
{
  return [a1 closureForNode:];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectAndFlush_accumulatedImpressionsAtTime_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 collectAndFlush:accumulatedImpressionsAtTime:withCompletion:];
}

id objc_msgSend_collectHostingPropertiesWithCollector_(void *a1, const char *a2, ...)
{
  return [a1 collectHostingPropertiesWithCollector:];
}

id objc_msgSend_collectImageResource_(void *a1, const char *a2, ...)
{
  return [a1 collectImageResource:];
}

id objc_msgSend_collectImpressionsForChild_(void *a1, const char *a2, ...)
{
  return [a1 collectImpressionsForChild:];
}

id objc_msgSend_collectImpressionsForChildren(void *a1, const char *a2, ...)
{
  return _[a1 collectImpressionsForChildren];
}

id objc_msgSend_collectInterestWithInvalidationQueue_(void *a1, const char *a2, ...)
{
  return [a1 collectInterestWithInvalidationQueue:];
}

id objc_msgSend_collectLinkEntities(void *a1, const char *a2, ...)
{
  return _[a1 collectLinkEntities];
}

id objc_msgSend_collectLinkEntitiesForChild_(void *a1, const char *a2, ...)
{
  return [a1 collectLinkEntitiesForChild:];
}

id objc_msgSend_collectLinkEntitiesForChildren(void *a1, const char *a2, ...)
{
  return _[a1 collectLinkEntitiesForChildren];
}

id objc_msgSend_collectResource_(void *a1, const char *a2, ...)
{
  return [a1 collectResource:];
}

id objc_msgSend_collectStatsFromLayoutController_(void *a1, const char *a2, ...)
{
  return [a1 collectStatsFromLayoutController:];
}

id objc_msgSend_collectWithRoot_options_entryUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectWithRoot:options:entryUUID:");
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _[a1 color];
}

id objc_msgSend_colorArrayForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 colorArrayForAttribute:node:];
}

id objc_msgSend_colorForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 colorForAttribute:node:];
}

id objc_msgSend_colorRegistry(void *a1, const char *a2, ...)
{
  return _[a1 colorRegistry];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return [a1 colorWithAlphaComponent:];
}

id objc_msgSend_colorWithCGColor_(void *a1, const char *a2, ...)
{
  return [a1 colorWithCGColor:];
}

id objc_msgSend_colorWithName_(void *a1, const char *a2, ...)
{
  return [a1 colorWithName:];
}

id objc_msgSend_colorWithPlatformColor_(void *a1, const char *a2, ...)
{
  return [a1 colorWithPlatformColor:];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithRed:green:blue:alpha:];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithWhite:alpha:];
}

id objc_msgSend_colors(void *a1, const char *a2, ...)
{
  return _[a1 colors];
}

id objc_msgSend_columnCount(void *a1, const char *a2, ...)
{
  return _[a1 columnCount];
}

id objc_msgSend_columnLayoutProviderColumnSpanForColumnSpan_(void *a1, const char *a2, ...)
{
  return [a1 columnLayoutProviderColumnSpanForColumnSpan:];
}

id objc_msgSend_columnLayoutProviderColumnsForContainerFraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columnLayoutProviderColumnsForContainerFraction:");
}

id objc_msgSend_columnLayoutProviderWidthForColumnSpan_(void *a1, const char *a2, ...)
{
  return [a1 columnLayoutProviderWidthForColumnSpan:];
}

id objc_msgSend_columnMultiple(void *a1, const char *a2, ...)
{
  return _[a1 columnMultiple];
}

id objc_msgSend_columnSpacing(void *a1, const char *a2, ...)
{
  return _[a1 columnSpacing];
}

id objc_msgSend_columnSpan(void *a1, const char *a2, ...)
{
  return _[a1 columnSpan];
}

id objc_msgSend_columnWidth(void *a1, const char *a2, ...)
{
  return _[a1 columnWidth];
}

id objc_msgSend_columnWidthWithConfiguration_columns_spacing_(void *a1, const char *a2, ...)
{
  return [a1 columnWidthWithConfiguration:columns:spacing:];
}

id objc_msgSend_columnWithIndex_edge_(void *a1, const char *a2, ...)
{
  return [a1 columnWithIndex:edge:];
}

id objc_msgSend_columns(void *a1, const char *a2, ...)
{
  return _[a1 columns];
}

id objc_msgSend_columnsWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 columnsWithConfiguration:];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_complete(void *a1, const char *a2, ...)
{
  return _[a1 complete];
}

id objc_msgSend_completed(void *a1, const char *a2, ...)
{
  return _[a1 completed];
}

id objc_msgSend_componentViewStateWithName_(void *a1, const char *a2, ...)
{
  return [a1 componentViewStateWithName:];
}

id objc_msgSend_componentsFromLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 componentsFromLocaleIdentifier:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return [a1 componentsWithURL:resolvingAgainstBaseURL:];
}

id objc_msgSend_compositingFilter(void *a1, const char *a2, ...)
{
  return _[a1 compositingFilter];
}

id objc_msgSend_compressedFromString_(void *a1, const char *a2, ...)
{
  return [a1 compressedFromString:];
}

id objc_msgSend_computeContainerUpdateCurrent_from_tracker_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computeContainerUpdateCurrent:from:tracker:flags:");
}

id objc_msgSend_computeDerivedHeight(void *a1, const char *a2, ...)
{
  return _[a1 computeDerivedHeight];
}

id objc_msgSend_computeDerivedWidth(void *a1, const char *a2, ...)
{
  return _[a1 computeDerivedWidth];
}

id objc_msgSend_computeDifferencesWithMap_(void *a1, const char *a2, ...)
{
  return [a1 computeDifferencesWithMap:];
}

id objc_msgSend_computeFinalUpdatesWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 computeFinalUpdatesWithBlock:];
}

id objc_msgSend_computeHeight(void *a1, const char *a2, ...)
{
  return _[a1 computeHeight];
}

id objc_msgSend_computeHeightWithoutDerived(void *a1, const char *a2, ...)
{
  return _[a1 computeHeightWithoutDerived];
}

id objc_msgSend_computeIntrinsicAspectRatio(void *a1, const char *a2, ...)
{
  return _[a1 computeIntrinsicAspectRatio];
}

id objc_msgSend_computeIntrinsicHeight(void *a1, const char *a2, ...)
{
  return _[a1 computeIntrinsicHeight];
}

id objc_msgSend_computeIntrinsicWidth(void *a1, const char *a2, ...)
{
  return _[a1 computeIntrinsicWidth];
}

id objc_msgSend_computeLayout(void *a1, const char *a2, ...)
{
  return _[a1 computeLayout];
}

id objc_msgSend_computeLayoutWithOffset_(void *a1, const char *a2, ...)
{
  return [a1 computeLayoutWithOffset:];
}

id objc_msgSend_computeLayoutWithOrigin_(void *a1, const char *a2, ...)
{
  return [a1 computeLayoutWithOrigin:];
}

id objc_msgSend_computeLength(void *a1, const char *a2, ...)
{
  return _[a1 computeLength];
}

id objc_msgSend_computeSingleColorWithColumns_(void *a1, const char *a2, ...)
{
  return [a1 computeSingleColorWithColumns:];
}

id objc_msgSend_computeSizeFittingVideoSize_(void *a1, const char *a2, ...)
{
  return [a1 computeSizeFittingVideoSize:];
}

id objc_msgSend_computeTriggerStatesInScrollView_axis_(void *a1, const char *a2, ...)
{
  return [a1 computeTriggerStatesInScrollView:axis:];
}

id objc_msgSend_computeUpdatesWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 computeUpdatesWithBlock:];
}

id objc_msgSend_computeWidth(void *a1, const char *a2, ...)
{
  return _[a1 computeWidth];
}

id objc_msgSend_computeWidthWithoutDerived(void *a1, const char *a2, ...)
{
  return _[a1 computeWidthWithoutDerived];
}

id objc_msgSend_computeWithMeasured_desired_(void *a1, const char *a2, ...)
{
  return [a1 computeWithMeasured:desired:];
}

id objc_msgSend_computeZIndexWithDefault_(void *a1, const char *a2, ...)
{
  return [a1 computeZIndexWithDefault:];
}

id objc_msgSend_computedBounds(void *a1, const char *a2, ...)
{
  return _[a1 computedBounds];
}

id objc_msgSend_computedBoundsChildrenWithFlags_(void *a1, const char *a2, ...)
{
  return [a1 computedBoundsChildrenWithFlags:];
}

id objc_msgSend_computedBoundsPrimitiveWithFlags_(void *a1, const char *a2, ...)
{
  return [a1 computedBoundsPrimitiveWithFlags:];
}

id objc_msgSend_computedBoundsWithFlags_(void *a1, const char *a2, ...)
{
  return [a1 computedBoundsWithFlags:];
}

id objc_msgSend_computedColumnSpacing(void *a1, const char *a2, ...)
{
  return _[a1 computedColumnSpacing];
}

id objc_msgSend_computedColumnWidth(void *a1, const char *a2, ...)
{
  return _[a1 computedColumnWidth];
}

id objc_msgSend_computedColumns(void *a1, const char *a2, ...)
{
  return _[a1 computedColumns];
}

id objc_msgSend_computedContentHeight(void *a1, const char *a2, ...)
{
  return _[a1 computedContentHeight];
}

id objc_msgSend_computedContentHeightConsideringTransform(void *a1, const char *a2, ...)
{
  return _[a1 computedContentHeightConsideringTransform];
}

id objc_msgSend_computedContentWidth(void *a1, const char *a2, ...)
{
  return _[a1 computedContentWidth];
}

id objc_msgSend_computedContentWidthConsideringTransform(void *a1, const char *a2, ...)
{
  return _[a1 computedContentWidthConsideringTransform];
}

id objc_msgSend_computedErasableBounds(void *a1, const char *a2, ...)
{
  return _[a1 computedErasableBounds];
}

id objc_msgSend_computedErasableBoundsPrimitive(void *a1, const char *a2, ...)
{
  return _[a1 computedErasableBoundsPrimitive];
}

id objc_msgSend_computedFrame(void *a1, const char *a2, ...)
{
  return _[a1 computedFrame];
}

id objc_msgSend_computedHeight(void *a1, const char *a2, ...)
{
  return _[a1 computedHeight];
}

id objc_msgSend_computedHeightAbovePivot(void *a1, const char *a2, ...)
{
  return _[a1 computedHeightAbovePivot];
}

id objc_msgSend_computedHorizontalCenter(void *a1, const char *a2, ...)
{
  return _[a1 computedHorizontalCenter];
}

id objc_msgSend_computedLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 computedLayoutDirection];
}

id objc_msgSend_computedLeadingEdge(void *a1, const char *a2, ...)
{
  return _[a1 computedLeadingEdge];
}

id objc_msgSend_computedNaturalSize(void *a1, const char *a2, ...)
{
  return _[a1 computedNaturalSize];
}

id objc_msgSend_computedOrigin(void *a1, const char *a2, ...)
{
  return _[a1 computedOrigin];
}

id objc_msgSend_computedRefIdWithContext_(void *a1, const char *a2, ...)
{
  return [a1 computedRefIdWithContext:];
}

id objc_msgSend_computedRefInstanceWithContext_(void *a1, const char *a2, ...)
{
  return [a1 computedRefInstanceWithContext:];
}

id objc_msgSend_computedScale(void *a1, const char *a2, ...)
{
  return _[a1 computedScale];
}

id objc_msgSend_computedSize(void *a1, const char *a2, ...)
{
  return _[a1 computedSize];
}

id objc_msgSend_computedTouchInsets(void *a1, const char *a2, ...)
{
  return _[a1 computedTouchInsets];
}

id objc_msgSend_computedTrailingEdge(void *a1, const char *a2, ...)
{
  return _[a1 computedTrailingEdge];
}

id objc_msgSend_computedTransform(void *a1, const char *a2, ...)
{
  return _[a1 computedTransform];
}

id objc_msgSend_computedTransformInAncestorLayout_(void *a1, const char *a2, ...)
{
  return [a1 computedTransformInAncestorLayout:];
}

id objc_msgSend_computedTransformedSize(void *a1, const char *a2, ...)
{
  return _[a1 computedTransformedSize];
}

id objc_msgSend_computedWidth(void *a1, const char *a2, ...)
{
  return _[a1 computedWidth];
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return _[a1 config];
}

id objc_msgSend_configWithContentsScale_resource_load_cornerRadius_cornerCurve_fallbackColor_contentsGravity_crossfadesContents_opacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configWithContentsScale:resource:load:cornerRadius:cornerCurve:fallbackColor:contentsGravity:crossfadesContents:opacity:");
}

id objc_msgSend_configWithURL_gravity_textKey_textValue_shouldStartAtEnd_triggerName_targetTriggerState_triggerDelay_fontSpec_fileProvider_(void *a1, const char *a2, ...)
{
  return [a1 configWithURL:gravity:textKey:textValue:shouldStartAtEnd:triggerName:targetTriggerState:triggerDelay:fontSpec:fileProvider:];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationByApplyingConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 configurationByApplyingConfiguration:];
}

id objc_msgSend_configurationPreferringMulticolor(void *a1, const char *a2, ...)
{
  return _[a1 configurationPreferringMulticolor];
}

id objc_msgSend_configurationWithHierarchicalColor_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithHierarchicalColor:];
}

id objc_msgSend_configurationWithIdentifier_previewProvider_actionProvider_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithIdentifier:previewProvider:actionProvider:];
}

id objc_msgSend_configurationWithPaletteColors_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithPaletteColors:];
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithPointSize:];
}

id objc_msgSend_configurationWithPointSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithPointSize:weight:];
}

id objc_msgSend_configurationWithPointSize_weight_scale_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithPointSize:weight:scale:];
}

id objc_msgSend_configurationWithScale_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithScale:];
}

id objc_msgSend_configureBounds_(void *a1, const char *a2, ...)
{
  return [a1 configureBounds:];
}

id objc_msgSend_configureBox_withNode_attributes_context_(void *a1, const char *a2, ...)
{
  return [a1 configureBox:withNode:attributes:context:];
}

id objc_msgSend_configureCell_(void *a1, const char *a2, ...)
{
  return [a1 configureCell:];
}

id objc_msgSend_configureChildBox_withChildNode_attributes_builder_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureChildBox:withChildNode:attributes:builder:context:");
}

id objc_msgSend_configureContainingBuilder_withNode_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureContainingBuilder:withNode:attributes:context:");
}

id objc_msgSend_configureContentLayout_configuration_(void *a1, const char *a2, ...)
{
  return [a1 configureContentLayout:configuration:];
}

id objc_msgSend_configureDelegate_(void *a1, const char *a2, ...)
{
  return [a1 configureDelegate:];
}

id objc_msgSend_configureDropCapWithCount_lines_raised_style_color_fontSpec_backgroundColor_padding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureDropCapWithCount:lines:raised:style:color:fontSpec:backgroundColor:padding:");
}

id objc_msgSend_configureGradientWithAxis_leading_(void *a1, const char *a2, ...)
{
  return [a1 configureGradientWithAxis:leading:];
}

id objc_msgSend_configureHostWithPlayerForURL_videoId_host_options_(void *a1, const char *a2, ...)
{
  return [a1 configureHostWithPlayerForURL:videoId:host:options:];
}

id objc_msgSend_configureLayer_(void *a1, const char *a2, ...)
{
  return [a1 configureLayer:];
}

id objc_msgSend_configureLineStylingForLines_relativeToDropCapLines_style_color_fontSpec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureLineStylingForLines:relativeToDropCapLines:style:color:fontSpec:");
}

id objc_msgSend_configureNavigationItem_scrollView_extraLeftItems_extraRightItems_(void *a1, const char *a2, ...)
{
  return [a1 configureNavigationItem:scrollView:extraLeftItems:extraRightItems:];
}

id objc_msgSend_configureObject_withBuilder_context_(void *a1, const char *a2, ...)
{
  return [a1 configureObject:withBuilder:context:];
}

id objc_msgSend_configureObject_withNode_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureObject:withNode:attributes:context:");
}

id objc_msgSend_configureParagraphStyle_(void *a1, const char *a2, ...)
{
  return [a1 configureParagraphStyle:];
}

id objc_msgSend_configureScrollLayout_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureScrollLayout:configuration:");
}

id objc_msgSend_configureSearchControllerIfNeededForNavigationItem_(void *a1, const char *a2, ...)
{
  return [a1 configureSearchControllerIfNeededForNavigationItem:];
}

id objc_msgSend_configureSublayers_forLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureSublayers:forLayer:");
}

id objc_msgSend_configureSubviews(void *a1, const char *a2, ...)
{
  return _[a1 configureSubviews];
}

id objc_msgSend_configureSubviewsWithFactory_outsets_host_overrides_usedOverrides_UUID_uid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:");
}

id objc_msgSend_configureWithChildNode_attributes_(void *a1, const char *a2, ...)
{
  return [a1 configureWithChildNode:attributes:];
}

id objc_msgSend_configureWithModel_(void *a1, const char *a2, ...)
{
  return [a1 configureWithModel:];
}

id objc_msgSend_configureWithModel_outsets_(void *a1, const char *a2, ...)
{
  return [a1 configureWithModel:outsets:];
}

id objc_msgSend_configureWithNode_attributes_(void *a1, const char *a2, ...)
{
  return [a1 configureWithNode:attributes:];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_constantNameForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 constantNameForAttribute:node:];
}

id objc_msgSend_constrainComputedHeight_(void *a1, const char *a2, ...)
{
  return [a1 constrainComputedHeight:];
}

id objc_msgSend_constrainComputedWidth_(void *a1, const char *a2, ...)
{
  return [a1 constrainComputedWidth:];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_containedSubmodels(void *a1, const char *a2, ...)
{
  return _[a1 containedSubmodels];
}

id objc_msgSend_containerFraction(void *a1, const char *a2, ...)
{
  return _[a1 containerFraction];
}

id objc_msgSend_containers(void *a1, const char *a2, ...)
{
  return _[a1 containers];
}

id objc_msgSend_containingHeight(void *a1, const char *a2, ...)
{
  return _[a1 containingHeight];
}

id objc_msgSend_containingWidth(void *a1, const char *a2, ...)
{
  return _[a1 containingWidth];
}

id objc_msgSend_containsAttribute_(void *a1, const char *a2, ...)
{
  return [a1 containsAttribute:];
}

id objc_msgSend_containsIndex_(void *a1, const char *a2, ...)
{
  return [a1 containsIndex:];
}

id objc_msgSend_containsLiveTransforms(void *a1, const char *a2, ...)
{
  return _[a1 containsLiveTransforms];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsSingleComponent(void *a1, const char *a2, ...)
{
  return _[a1 containsSingleComponent];
}

id objc_msgSend_containsTransaction_(void *a1, const char *a2, ...)
{
  return [a1 containsTransaction:];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentBackground(void *a1, const char *a2, ...)
{
  return _[a1 contentBackground];
}

id objc_msgSend_contentChild(void *a1, const char *a2, ...)
{
  return _[a1 contentChild];
}

id objc_msgSend_contentErasableInsets(void *a1, const char *a2, ...)
{
  return _[a1 contentErasableInsets];
}

id objc_msgSend_contentHeight(void *a1, const char *a2, ...)
{
  return _[a1 contentHeight];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _[a1 contentInset];
}

id objc_msgSend_contentInsetAdjustmentBehavior(void *a1, const char *a2, ...)
{
  return _[a1 contentInsetAdjustmentBehavior];
}

id objc_msgSend_contentInsets(void *a1, const char *a2, ...)
{
  return _[a1 contentInsets];
}

id objc_msgSend_contentInsetsForScrollingToRectWithContentInsets_(void *a1, const char *a2, ...)
{
  return [a1 contentInsetsForScrollingToRectWithContentInsets];
}

id objc_msgSend_contentLayoutSize(void *a1, const char *a2, ...)
{
  return _[a1 contentLayoutSize];
}

id objc_msgSend_contentModel(void *a1, const char *a2, ...)
{
  return _[a1 contentModel];
}

id objc_msgSend_contentModels(void *a1, const char *a2, ...)
{
  return _[a1 contentModels];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_contentOffsetFromProposedContentOffset_atScrollPosition_(void *a1, const char *a2, ...)
{
  return [a1 contentOffsetFromProposedContentOffset:atScrollPosition:];
}

id objc_msgSend_contentOrigin(void *a1, const char *a2, ...)
{
  return _[a1 contentOrigin];
}

id objc_msgSend_contentScaleFactor(void *a1, const char *a2, ...)
{
  return _[a1 contentScaleFactor];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 contentSizeCategory];
}

id objc_msgSend_contentSizeCategorySymbol(void *a1, const char *a2, ...)
{
  return _[a1 contentSizeCategorySymbol];
}

id objc_msgSend_contentUpdateDate(void *a1, const char *a2, ...)
{
  return _[a1 contentUpdateDate];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contentWidth(void *a1, const char *a2, ...)
{
  return _[a1 contentWidth];
}

id objc_msgSend_contentWidthPadding(void *a1, const char *a2, ...)
{
  return _[a1 contentWidthPadding];
}

id objc_msgSend_contentWithEdge_(void *a1, const char *a2, ...)
{
  return [a1 contentWithEdge:];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return _[a1 contents];
}

id objc_msgSend_contentsGravity(void *a1, const char *a2, ...)
{
  return _[a1 contentsGravity];
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 contentsOfDirectoryAtPath:error:];
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return [a1 contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:];
}

id objc_msgSend_contentsScale(void *a1, const char *a2, ...)
{
  return _[a1 contentsScale];
}

id objc_msgSend_contentsSwizzle(void *a1, const char *a2, ...)
{
  return _[a1 contentsSwizzle];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextMenuConfigurationForButton_point_(void *a1, const char *a2, ...)
{
  return [a1 contextMenuConfigurationForButton:point:];
}

id objc_msgSend_contextMenuConfigurationProvider(void *a1, const char *a2, ...)
{
  return _[a1 contextMenuConfigurationProvider];
}

id objc_msgSend_contextMenuInteraction(void *a1, const char *a2, ...)
{
  return _[a1 contextMenuInteraction];
}

id objc_msgSend_contextMenuInteraction_configurationForMenuAtLocation_(void *a1, const char *a2, ...)
{
  return [a1 contextMenuInteraction:configurationForMenuAtLocation:];
}

id objc_msgSend_contextMenuInteraction_willDisplayMenuForConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 contextMenuInteraction:willDisplayMenuForConfiguration:];
}

id objc_msgSend_contextMenuInteraction_willEndForConfiguration_withData_(void *a1, const char *a2, ...)
{
  return [a1 contextMenuInteraction:willEndForConfiguration:withData:];
}

id objc_msgSend_contextMenuIsPrimaryAction(void *a1, const char *a2, ...)
{
  return _[a1 contextMenuIsPrimaryAction];
}

id objc_msgSend_contextSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 contextSnapshot];
}

id objc_msgSend_continuousCorners(void *a1, const char *a2, ...)
{
  return _[a1 continuousCorners];
}

id objc_msgSend_continuousCurve(void *a1, const char *a2, ...)
{
  return _[a1 continuousCurve];
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return _[a1 control];
}

id objc_msgSend_controlIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 controlIdentifier];
}

id objc_msgSend_controlIsOn(void *a1, const char *a2, ...)
{
  return _[a1 controlIsOn];
}

id objc_msgSend_controlViewForOverrideIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 controlViewForOverrideIdentifier:];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return _[a1 controller];
}

id objc_msgSend_controllerHost(void *a1, const char *a2, ...)
{
  return _[a1 controllerHost];
}

id objc_msgSend_controllerID(void *a1, const char *a2, ...)
{
  return _[a1 controllerID];
}

id objc_msgSend_controllers(void *a1, const char *a2, ...)
{
  return _[a1 controllers];
}

id objc_msgSend_convertPoint_fromView_(void *a1, const char *a2, ...)
{
  return [a1 convertPoint:fromView:];
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return [a1 convertPoint:toView:];
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:fromView:];
}

id objc_msgSend_convertRect_fromWindow_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:fromWindow:];
}

id objc_msgSend_convertRect_toLayer_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:toLayer:];
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:toView:];
}

id objc_msgSend_convertRenderModel_toKind_(void *a1, const char *a2, ...)
{
  return [a1 convertRenderModel:toKind:];
}

id objc_msgSend_coordinator(void *a1, const char *a2, ...)
{
  return _[a1 coordinator];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyForFinalAppearanceWithFlags_(void *a1, const char *a2, ...)
{
  return [a1 copyForFinalAppearanceWithFlags:];
}

id objc_msgSend_copyForInitialAppearanceWithFlags_(void *a1, const char *a2, ...)
{
  return [a1 copyForInitialAppearanceWithFlags:];
}

id objc_msgSend_copyFromReference_(void *a1, const char *a2, ...)
{
  return [a1 copyFromReference:];
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return [a1 copyItemAtURL:toURL:error:];
}

id objc_msgSend_copySubmodel_forFinalAppearanceWithFlags_(void *a1, const char *a2, ...)
{
  return [a1 copySubmodel:forFinalAppearanceWithFlags:];
}

id objc_msgSend_copySubmodel_forInitialAppearanceWithFlags_(void *a1, const char *a2, ...)
{
  return [a1 copySubmodel:forInitialAppearanceWithFlags:];
}

id objc_msgSend_copyWithAlpha_(void *a1, const char *a2, ...)
{
  return [a1 copyWithAlpha:];
}

id objc_msgSend_copyWithAlpha_submodel_(void *a1, const char *a2, ...)
{
  return [a1 copyWithAlpha:submodel:];
}

id objc_msgSend_copyWithContainedSubmodels_(void *a1, const char *a2, ...)
{
  return [a1 copyWithContainedSubmodels:];
}

id objc_msgSend_copyWithErrors_(void *a1, const char *a2, ...)
{
  return [a1 copyWithErrors:];
}

id objc_msgSend_copyWithItemIndex_(void *a1, const char *a2, ...)
{
  return [a1 copyWithItemIndex:];
}

id objc_msgSend_copyWithSection_offset_size_uuid_(void *a1, const char *a2, ...)
{
  return [a1 copyWithSection:offset:size:uuid:];
}

id objc_msgSend_copyWithSection_offset_uuid_(void *a1, const char *a2, ...)
{
  return [a1 copyWithSection:offset:uuid:];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 copyWithZone:];
}

id objc_msgSend_cornerCurve(void *a1, const char *a2, ...)
{
  return _[a1 cornerCurve];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForEvent_(void *a1, const char *a2, ...)
{
  return [a1 countForEvent:];
}

id objc_msgSend_countForFetchRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 countForFetchRequest:error:];
}

id objc_msgSend_countForGeneration_(void *a1, const char *a2, ...)
{
  return [a1 countForGeneration:];
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return [a1 countForObject:];
}

id objc_msgSend_countLines(void *a1, const char *a2, ...)
{
  return _[a1 countLines];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createImageResourceCollector(void *a1, const char *a2, ...)
{
  return _[a1 createImageResourceCollector];
}

id objc_msgSend_createImageResourceCollectorForLoaded(void *a1, const char *a2, ...)
{
  return _[a1 createImageResourceCollectorForLoaded];
}

id objc_msgSend_createImageResourceCollectorForNotLoadedInVisibleBounds_viewState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createImageResourceCollectorForNotLoadedInVisibleBounds:viewState:");
}

id objc_msgSend_createResourceCollectorForEverything(void *a1, const char *a2, ...)
{
  return _[a1 createResourceCollectorForEverything];
}

id objc_msgSend_createResourceCollectorForVisibleBounds_viewState_(void *a1, const char *a2, ...)
{
  return [a1 createResourceCollectorForVisibleBounds:viewState:];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_crossfadesContents(void *a1, const char *a2, ...)
{
  return _[a1 crossfadesContents];
}

id objc_msgSend_currentEntriesUID(void *a1, const char *a2, ...)
{
  return _[a1 currentEntriesUID];
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return _[a1 currentItem];
}

id objc_msgSend_currentLiveTransform(void *a1, const char *a2, ...)
{
  return _[a1 currentLiveTransform];
}

id objc_msgSend_currentMediaSelection(void *a1, const char *a2, ...)
{
  return _[a1 currentMediaSelection];
}

id objc_msgSend_currentOffset(void *a1, const char *a2, ...)
{
  return _[a1 currentOffset];
}

id objc_msgSend_currentOrImplicitTransaction(void *a1, const char *a2, ...)
{
  return _[a1 currentOrImplicitTransaction];
}

id objc_msgSend_currentOrNewTransactionWithOptions_block_(void *a1, const char *a2, ...)
{
  return [a1 currentOrNewTransactionWithOptions:block:];
}

id objc_msgSend_currentPointer(void *a1, const char *a2, ...)
{
  return _[a1 currentPointer];
}

id objc_msgSend_currentQueryGenerationToken(void *a1, const char *a2, ...)
{
  return _[a1 currentQueryGenerationToken];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentScale(void *a1, const char *a2, ...)
{
  return _[a1 currentScale];
}

id objc_msgSend_currentStackName(void *a1, const char *a2, ...)
{
  return _[a1 currentStackName];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _[a1 currentState];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return _[a1 currentThread];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return _[a1 currentTime];
}

id objc_msgSend_currentTimePlayed(void *a1, const char *a2, ...)
{
  return _[a1 currentTimePlayed];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return _[a1 currentTraitCollection];
}

id objc_msgSend_currentUpdateCollection(void *a1, const char *a2, ...)
{
  return _[a1 currentUpdateCollection];
}

id objc_msgSend_currentViewState(void *a1, const char *a2, ...)
{
  return _[a1 currentViewState];
}

id objc_msgSend_cursor(void *a1, const char *a2, ...)
{
  return _[a1 cursor];
}

id objc_msgSend_customActionByRefIdAndTrigger(void *a1, const char *a2, ...)
{
  return _[a1 customActionByRefIdAndTrigger];
}

id objc_msgSend_customActionsForPress(void *a1, const char *a2, ...)
{
  return _[a1 customActionsForPress];
}

id objc_msgSend_customAnimationForContentOffset(void *a1, const char *a2, ...)
{
  return _[a1 customAnimationForContentOffset];
}

id objc_msgSend_customImageBundle(void *a1, const char *a2, ...)
{
  return _[a1 customImageBundle];
}

id objc_msgSend_damping(void *a1, const char *a2, ...)
{
  return _[a1 damping];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataFor_(void *a1, const char *a2, ...)
{
  return [a1 dataFor:];
}

id objc_msgSend_dataProvider(void *a1, const char *a2, ...)
{
  return _[a1 dataProvider];
}

id objc_msgSend_dataTaskWithURL_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 dataTaskWithURL:completionHandler:];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfFile:options:error:];
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfURL:];
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfURL:options:error:];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithJSONObject:options:error:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSince1970:];
}

id objc_msgSend_deactivateEffectWithAnimationCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 deactivateEffectWithAnimationCoordinator:];
}

id objc_msgSend_debugContainedSubmodels(void *a1, const char *a2, ...)
{
  return _[a1 debugContainedSubmodels];
}

id objc_msgSend_debugContentDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugContentDescription];
}

id objc_msgSend_debugDelegate(void *a1, const char *a2, ...)
{
  return _[a1 debugDelegate];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_debugDumpEnvironmentContainerStructure(void *a1, const char *a2, ...)
{
  return _[a1 debugDumpEnvironmentContainerStructure];
}

id objc_msgSend_debugDumpEnvironmentContainerStructure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDumpEnvironmentContainerStructure:");
}

id objc_msgSend_debugEnabled(void *a1, const char *a2, ...)
{
  return _[a1 debugEnabled];
}

id objc_msgSend_debugFunctionalDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugFunctionalDescription];
}

id objc_msgSend_debugLocationForNode_(void *a1, const char *a2, ...)
{
  return [a1 debugLocationForNode:];
}

id objc_msgSend_debugName(void *a1, const char *a2, ...)
{
  return _[a1 debugName];
}

id objc_msgSend_debugVisualLayout(void *a1, const char *a2, ...)
{
  return _[a1 debugVisualLayout];
}

id objc_msgSend_decelerationRate(void *a1, const char *a2, ...)
{
  return _[a1 decelerationRate];
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClasses:forKey:];
}

id objc_msgSend_decrementAction(void *a1, const char *a2, ...)
{
  return _[a1 decrementAction];
}

id objc_msgSend_decrementHostCount(void *a1, const char *a2, ...)
{
  return _[a1 decrementHostCount];
}

id objc_msgSend_decrementInterestInDeletedModels_(void *a1, const char *a2, ...)
{
  return [a1 decrementInterestInDeletedModels];
}

id objc_msgSend_defaultAction(void *a1, const char *a2, ...)
{
  return _[a1 defaultAction];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultCharacterStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultCharacterStyle];
}

id objc_msgSend_defaultColumnStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultColumnStyle];
}

id objc_msgSend_defaultFocusStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultFocusStyle];
}

id objc_msgSend_defaultFontSpec(void *a1, const char *a2, ...)
{
  return _[a1 defaultFontSpec];
}

id objc_msgSend_defaultFormat(void *a1, const char *a2, ...)
{
  return _[a1 defaultFormat];
}

id objc_msgSend_defaultGuideSpecForLayout_edge_(void *a1, const char *a2, ...)
{
  return [a1 defaultGuideSpecForLayout:edge:];
}

id objc_msgSend_defaultHeightForStyle_(void *a1, const char *a2, ...)
{
  return [a1 defaultHeightForStyle:];
}

id objc_msgSend_defaultImplicitOptions(void *a1, const char *a2, ...)
{
  return _[a1 defaultImplicitOptions];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultOrigin(void *a1, const char *a2, ...)
{
  return _[a1 defaultOrigin];
}

id objc_msgSend_defaultParagraphStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultParagraphStyle];
}

id objc_msgSend_defaultPointerCursor(void *a1, const char *a2, ...)
{
  return _[a1 defaultPointerCursor];
}

id objc_msgSend_defaultPointerStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultPointerStyle];
}

id objc_msgSend_defaultPosition(void *a1, const char *a2, ...)
{
  return _[a1 defaultPosition];
}

id objc_msgSend_defaultRole(void *a1, const char *a2, ...)
{
  return _[a1 defaultRole];
}

id objc_msgSend_defaultScale(void *a1, const char *a2, ...)
{
  return _[a1 defaultScale];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultSize(void *a1, const char *a2, ...)
{
  return _[a1 defaultSize];
}

id objc_msgSend_defaultStackNames(void *a1, const char *a2, ...)
{
  return _[a1 defaultStackNames];
}

id objc_msgSend_deferLoadsBegin(void *a1, const char *a2, ...)
{
  return _[a1 deferLoadsBegin];
}

id objc_msgSend_deferLoadsEnd(void *a1, const char *a2, ...)
{
  return _[a1 deferLoadsEnd];
}

id objc_msgSend_defineAnimation_closure_(void *a1, const char *a2, ...)
{
  return [a1 defineAnimation:closure:];
}

id objc_msgSend_defineBindingWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 defineBindingWithName:value:];
}

id objc_msgSend_defineBool_withName_(void *a1, const char *a2, ...)
{
  return [a1 defineBool:withName:];
}

id objc_msgSend_defineComponentBindingWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 defineComponentBindingWithName:value:];
}

id objc_msgSend_defineElement_closure_(void *a1, const char *a2, ...)
{
  return [a1 defineElement:closure:];
}

id objc_msgSend_defineLet_closure_(void *a1, const char *a2, ...)
{
  return [a1 defineLet:closure:];
}

id objc_msgSend_defineStruct_withName_(void *a1, const char *a2, ...)
{
  return [a1 defineStruct:withName:];
}

id objc_msgSend_defineStyle_closure_(void *a1, const char *a2, ...)
{
  return [a1 defineStyle:closure:];
}

id objc_msgSend_definesScopes(void *a1, const char *a2, ...)
{
  return _[a1 definesScopes];
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return _[a1 delay];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 deleteAtIndex:];
}

id objc_msgSend_deleteItemAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 deleteItemAtIndex:];
}

id objc_msgSend_deleteSections_(void *a1, const char *a2, ...)
{
  return [a1 deleteSections:];
}

id objc_msgSend_deleted(void *a1, const char *a2, ...)
{
  return _[a1 deleted];
}

id objc_msgSend_deletedModels(void *a1, const char *a2, ...)
{
  return _[a1 deletedModels];
}

id objc_msgSend_deletes(void *a1, const char *a2, ...)
{
  return _[a1 deletes];
}

id objc_msgSend_demoMode(void *a1, const char *a2, ...)
{
  return _[a1 demoMode];
}

id objc_msgSend_dependencies(void *a1, const char *a2, ...)
{
  return _[a1 dependencies];
}

id objc_msgSend_dependencyToken(void *a1, const char *a2, ...)
{
  return _[a1 dependencyToken];
}

id objc_msgSend_dependentOn_(void *a1, const char *a2, ...)
{
  return [a1 dependentOn:];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier:];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier:forIndexPath:];
}

id objc_msgSend_dequeueReusableHeaderFooterViewWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableHeaderFooterViewWithIdentifier:];
}

id objc_msgSend_dequeueReusableSubviewWithReuseIdentifier_host_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableSubviewWithReuseIdentifier:host:];
}

id objc_msgSend_dereferenceByCollector_(void *a1, const char *a2, ...)
{
  return [a1 dereferenceByCollector:];
}

id objc_msgSend_descendentEnvironmentUseMask(void *a1, const char *a2, ...)
{
  return _[a1 descendentEnvironmentUseMask];
}

id objc_msgSend_descendentViewWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 descendentViewWithIdentifier:];
}

id objc_msgSend_descendentViewWithRefId_(void *a1, const char *a2, ...)
{
  return [a1 descendentViewWithRefId:];
}

id objc_msgSend_describeForDebuggingIdentifierIndex_package_(void *a1, const char *a2, ...)
{
  return [a1 describeForDebuggingIdentifierIndex:package:];
}

id objc_msgSend_describeWithContext_(void *a1, const char *a2, ...)
{
  return [a1 describeWithContext:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_desdendantSpecifiedWidthModified(void *a1, const char *a2, ...)
{
  return _[a1 desdendantSpecifiedWidthModified];
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return [a1 deselectRowAtIndexPath:animated:];
}

id objc_msgSend_designatedIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 designatedIdentifier];
}

id objc_msgSend_detachFromTracker(void *a1, const char *a2, ...)
{
  return _[a1 detachFromTracker];
}

id objc_msgSend_detachInteractions(void *a1, const char *a2, ...)
{
  return _[a1 detachInteractions];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_determineUseFontFallbackFromLanguage_(void *a1, const char *a2, ...)
{
  return [a1 determineUseFontFallbackFromLanguage:];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _[a1 deviceClass];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryByAddingEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryByAddingEntriesFromDictionary:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithCapacity:];
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfURL:];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didAddChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 didAddChildViewController:];
}

id objc_msgSend_didAddLayerWithFeedControllerHost_(void *a1, const char *a2, ...)
{
  return [a1 didAddLayerWithFeedControllerHost:];
}

id objc_msgSend_didBecomeActiveHost(void *a1, const char *a2, ...)
{
  return _[a1 didBecomeActiveHost];
}

id objc_msgSend_didBeginDraggingView_(void *a1, const char *a2, ...)
{
  return [a1 didBeginDraggingView:];
}

id objc_msgSend_didEndDisplayForViewState_(void *a1, const char *a2, ...)
{
  return [a1 didEndDisplayForViewState:];
}

id objc_msgSend_didEndDragSession_dropOperation_(void *a1, const char *a2, ...)
{
  return [a1 didEndDragSession:dropOperation:];
}

id objc_msgSend_didEndDraggingView_(void *a1, const char *a2, ...)
{
  return [a1 didEndDraggingView:];
}

id objc_msgSend_didExamineChildren(void *a1, const char *a2, ...)
{
  return _[a1 didExamineChildren];
}

id objc_msgSend_didScrollToQuery_(void *a1, const char *a2, ...)
{
  return [a1 didScrollToQuery:];
}

id objc_msgSend_didUpdateContentOffset_withInvalidationContext_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateContentOffset:withInvalidationContext:];
}

id objc_msgSend_didUpdateSubviews(void *a1, const char *a2, ...)
{
  return _[a1 didUpdateSubviews];
}

id objc_msgSend_didUpdateWithTrigger_text_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateWithTrigger:text:];
}

id objc_msgSend_differenceFromArray_withOptions_(void *a1, const char *a2, ...)
{
  return [a1 differenceFromArray:withOptions:];
}

id objc_msgSend_differenceMaskWithEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 differenceMaskWithEnvironment:];
}

id objc_msgSend_differences(void *a1, const char *a2, ...)
{
  return _[a1 differences];
}

id objc_msgSend_directEnvironmentUseMask(void *a1, const char *a2, ...)
{
  return _[a1 directEnvironmentUseMask];
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return _[a1 direction];
}

id objc_msgSend_directionFromString_(void *a1, const char *a2, ...)
{
  return [a1 directionFromString:];
}

id objc_msgSend_dismissMenu(void *a1, const char *a2, ...)
{
  return _[a1 dismissMenu];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:completion:];
}

id objc_msgSend_dispatchGroup_notifyMain_(void *a1, const char *a2, ...)
{
  return [a1 dispatchGroup:notifyMain:];
}

id objc_msgSend_displayClass(void *a1, const char *a2, ...)
{
  return _[a1 displayClass];
}

id objc_msgSend_displayGamut(void *a1, const char *a2, ...)
{
  return _[a1 displayGamut];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _[a1 displayScale];
}

id objc_msgSend_documentDidLoad(void *a1, const char *a2, ...)
{
  return _[a1 documentDidLoad];
}

id objc_msgSend_documentDuration(void *a1, const char *a2, ...)
{
  return _[a1 documentDuration];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dragController_dragSessionDidEnd_(void *a1, const char *a2, ...)
{
  return [a1 dragController:dragSessionDidEnd:];
}

id objc_msgSend_dragDelegate(void *a1, const char *a2, ...)
{
  return _[a1 dragDelegate];
}

id objc_msgSend_dragInfo(void *a1, const char *a2, ...)
{
  return _[a1 dragInfo];
}

id objc_msgSend_dragInteraction_itemsForAddingToSession_withTouchAtPoint_(void *a1, const char *a2, ...)
{
  return [a1 dragInteraction:itemsForAddingToSession:withTouchAtPoint:];
}

id objc_msgSend_dragInteractionWithActionHandlerDelegate_dragDelegate_(void *a1, const char *a2, ...)
{
  return [a1 dragInteractionWithActionHandlerDelegate:dragDelegate:];
}

id objc_msgSend_dragItemForFeedEntry_name_arguments_imageResourceBlock_(void *a1, const char *a2, ...)
{
  return [a1 dragItemForFeedEntry:name:arguments:imageResourceBlock:];
}

id objc_msgSend_dragItemForObject_withName_arguments_(void *a1, const char *a2, ...)
{
  return [a1 dragItemForObject:withName:arguments:];
}

id objc_msgSend_draw(void *a1, const char *a2, ...)
{
  return _[a1 draw];
}

id objc_msgSend_drawAtPoint_(void *a1, const char *a2, ...)
{
  return [a1 drawAtPoint:];
}

id objc_msgSend_dropCapSpacingWithLineCount_elevatedLineCount_(void *a1, const char *a2, ...)
{
  return [a1 dropCapSpacingWithLineCount:elevatedLineCount:];
}

id objc_msgSend_dropCapWithCharCount_characterStyleOverridePropertyMap_spacing_(void *a1, const char *a2, ...)
{
  return [a1 dropCapWithCharCount:spacing:characterStyleOverridePropertyMap:];
}

id objc_msgSend_dropHandler(void *a1, const char *a2, ...)
{
  return _[a1 dropHandler];
}

id objc_msgSend_dropInteraction(void *a1, const char *a2, ...)
{
  return _[a1 dropInteraction];
}

id objc_msgSend_dumpLayoutTreeForEntry_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dumpLayoutTreeForEntry:completion:");
}

id objc_msgSend_dumpModelTreeForEntry_completion_(void *a1, const char *a2, ...)
{
  return [a1 dumpModelTreeForEntry:completion:];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_dynamicArrayLayoutContainerClass(void *a1, const char *a2, ...)
{
  return _[a1 dynamicArrayLayoutContainerClass];
}

id objc_msgSend_dynamicArrayLayoutIterationClass(void *a1, const char *a2, ...)
{
  return _[a1 dynamicArrayLayoutIterationClass];
}

id objc_msgSend_dynamicArrayWindowingBox(void *a1, const char *a2, ...)
{
  return _[a1 dynamicArrayWindowingBox];
}

id objc_msgSend_dynamicChanged_transaction_(void *a1, const char *a2, ...)
{
  return [a1 dynamicChanged:transaction:];
}

id objc_msgSend_dynamicController(void *a1, const char *a2, ...)
{
  return _[a1 dynamicController];
}

id objc_msgSend_dynamicProgress(void *a1, const char *a2, ...)
{
  return _[a1 dynamicProgress];
}

id objc_msgSend_dynamicProgressForKind_instance_parameters_(void *a1, const char *a2, ...)
{
  return [a1 dynamicProgressForKind:instance:parameters:];
}

id objc_msgSend_dynamicRegistry(void *a1, const char *a2, ...)
{
  return _[a1 dynamicRegistry];
}

id objc_msgSend_dynamicStateForKind_instance_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicStateForKind:instance:parameters:");
}

id objc_msgSend_dynamicStates(void *a1, const char *a2, ...)
{
  return _[a1 dynamicStates];
}

id objc_msgSend_dynamicUpdateDate(void *a1, const char *a2, ...)
{
  return _[a1 dynamicUpdateDate];
}

id objc_msgSend_dynamicUserInterfaceTraitDidChange(void *a1, const char *a2, ...)
{
  return _[a1 dynamicUserInterfaceTraitDidChange];
}

id objc_msgSend_dynamicUserInterfaceTraitDidChangeForLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicUserInterfaceTraitDidChangeForLayer:");
}

id objc_msgSend_dynamicValue(void *a1, const char *a2, ...)
{
  return _[a1 dynamicValue];
}

id objc_msgSend_edge(void *a1, const char *a2, ...)
{
  return _[a1 edge];
}

id objc_msgSend_edges(void *a1, const char *a2, ...)
{
  return _[a1 edges];
}

id objc_msgSend_editingInsets(void *a1, const char *a2, ...)
{
  return _[a1 editingInsets];
}

id objc_msgSend_effect(void *a1, const char *a2, ...)
{
  return _[a1 effect];
}

id objc_msgSend_effectWithPreview_(void *a1, const char *a2, ...)
{
  return [a1 effectWithPreview:];
}

id objc_msgSend_effectWithRoundedRect_cornerRadius_curve_(void *a1, const char *a2, ...)
{
  return [a1 effectWithRoundedRect:cornerRadius:curve:];
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 effectWithStyle:];
}

id objc_msgSend_effectiveButtonTypeForLayout(void *a1, const char *a2, ...)
{
  return _[a1 effectiveButtonTypeForLayout];
}

id objc_msgSend_effectiveGuideBottom(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGuideBottom];
}

id objc_msgSend_effectiveGuideLeading(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGuideLeading];
}

id objc_msgSend_effectiveGuideTop(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGuideTop];
}

id objc_msgSend_effectiveGuideTrailing(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGuideTrailing];
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_elapsed_(void *a1, const char *a2, ...)
{
  return [a1 elapsed:];
}

id objc_msgSend_elapsedTimeForPhase_(void *a1, const char *a2, ...)
{
  return [a1 elapsedTimeForPhase:];
}

id objc_msgSend_elementClassForName_(void *a1, const char *a2, ...)
{
  return [a1 elementClassForName:];
}

id objc_msgSend_elementDefinitionWithNameAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 elementDefinitionWithNameAttribute:node:];
}

id objc_msgSend_elementReferenceForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 elementReferenceForAttribute:node:];
}

id objc_msgSend_elementRegistry(void *a1, const char *a2, ...)
{
  return _[a1 elementRegistry];
}

id objc_msgSend_elementWithUncachedProvider_(void *a1, const char *a2, ...)
{
  return [a1 elementWithUncachedProvider:];
}

id objc_msgSend_embeddedIdentifierMapForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 embeddedIdentifierMapForIdentifier:];
}

id objc_msgSend_embeddedScrollAnchors(void *a1, const char *a2, ...)
{
  return _[a1 embeddedScrollAnchors];
}

id objc_msgSend_embeddedScrollViewCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 embeddedScrollViewCoordinator];
}

id objc_msgSend_embeddedState(void *a1, const char *a2, ...)
{
  return _[a1 embeddedState];
}

id objc_msgSend_embeddedUUIDForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 embeddedUUIDForIdentifier:];
}

id objc_msgSend_embeddedUpdateControllerForIdentifier_renderModel_(void *a1, const char *a2, ...)
{
  return [a1 embeddedUpdateControllerForIdentifier:renderModel:];
}

id objc_msgSend_enableBackgroundForHighlightPreview(void *a1, const char *a2, ...)
{
  return _[a1 enableBackgroundForHighlightPreview];
}

id objc_msgSend_enableContext(void *a1, const char *a2, ...)
{
  return _[a1 enableContext];
}

id objc_msgSend_enableShadowForHighlightPreview(void *a1, const char *a2, ...)
{
  return _[a1 enableShadowForHighlightPreview];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _[a1 enabled];
}

id objc_msgSend_endAppearanceTransition(void *a1, const char *a2, ...)
{
  return _[a1 endAppearanceTransition];
}

id objc_msgSend_endCapture(void *a1, const char *a2, ...)
{
  return _[a1 endCapture];
}

id objc_msgSend_endFrame(void *a1, const char *a2, ...)
{
  return _[a1 endFrame];
}

id objc_msgSend_endHostingForVideoId_forHost_(void *a1, const char *a2, ...)
{
  return [a1 endHostingForVideoId:forHost:];
}

id objc_msgSend_endLayout(void *a1, const char *a2, ...)
{
  return _[a1 endLayout];
}

id objc_msgSend_endLiveResize(void *a1, const char *a2, ...)
{
  return _[a1 endLiveResize];
}

id objc_msgSend_endPhase_(void *a1, const char *a2, ...)
{
  return [a1 endPhase:];
}

id objc_msgSend_endViewUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endViewUpdates];
}

id objc_msgSend_endViewUpdatesNotifyDelegate_(void *a1, const char *a2, ...)
{
  return [a1 endViewUpdatesNotifyDelegate:];
}

id objc_msgSend_enqueueUpdate_(void *a1, const char *a2, ...)
{
  return [a1 enqueueUpdate:];
}

id objc_msgSend_enqueueUpdateGroup_(void *a1, const char *a2, ...)
{
  return [a1 enqueueUpdateGroup:];
}

id objc_msgSend_ensureParagraphBoundary(void *a1, const char *a2, ...)
{
  return _[a1 ensureParagraphBoundary];
}

id objc_msgSend_ensureParagraphBoundaryWithBuilder_(void *a1, const char *a2, ...)
{
  return [a1 ensureParagraphBoundaryWithBuilder:];
}

id objc_msgSend_enterFullScreenWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 enterFullScreenWithCompletion:];
}

id objc_msgSend_entries(void *a1, const char *a2, ...)
{
  return _[a1 entries];
}

id objc_msgSend_entry(void *a1, const char *a2, ...)
{
  return _[a1 entry];
}

id objc_msgSend_entryPasses(void *a1, const char *a2, ...)
{
  return _[a1 entryPasses];
}

id objc_msgSend_enumerateAttributesInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateAttributesInRange:options:usingBlock:];
}

id objc_msgSend_enumerateAttributesInSection_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateAttributesInSection:block:");
}

id objc_msgSend_enumerateChildren_(void *a1, const char *a2, ...)
{
  return [a1 enumerateChildren:];
}

id objc_msgSend_enumerateChildrenOfNode_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateChildrenOfNode:block:");
}

id objc_msgSend_enumerateIndexesUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateIndexesUsingBlock:];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateLayout_(void *a1, const char *a2, ...)
{
  return [a1 enumerateLayout:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsWithOptions:];
}

id objc_msgSend_enumerateRangesUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateRangesUsingBlock:];
}

id objc_msgSend_enumerateRangesWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateRangesWithOptions:];
}

id objc_msgSend_enumerator(void *a1, const char *a2, ...)
{
  return _[a1 enumerator];
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return [a1 enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:];
}

id objc_msgSend_enumeratorWithAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 enumeratorWithAttribute:node:];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_environmentChildContainersForContainer_(void *a1, const char *a2, ...)
{
  return [a1 environmentChildContainersForContainer:];
}

id objc_msgSend_environmentContainersUsingGlobals(void *a1, const char *a2, ...)
{
  return _[a1 environmentContainersUsingGlobals];
}

id objc_msgSend_environmentNeedsUpdate(void *a1, const char *a2, ...)
{
  return _[a1 environmentNeedsUpdate];
}

id objc_msgSend_erasableBounds_(void *a1, const char *a2, ...)
{
  return [a1 erasableBounds];
}

id objc_msgSend_erasableBoundsWithBounds_(void *a1, const char *a2, ...)
{
  return [a1 erasableBoundsWithBounds:];
}

id objc_msgSend_erasableInsets(void *a1, const char *a2, ...)
{
  return _[a1 erasableInsets];
}

id objc_msgSend_erasableInsetsForContentsScale_(void *a1, const char *a2, ...)
{
  return [a1 erasableInsetsForContentsScale:];
}

id objc_msgSend_eraseableInsets(void *a1, const char *a2, ...)
{
  return _[a1 eraseableInsets];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorComment(void *a1, const char *a2, ...)
{
  return _[a1 errorComment];
}

id objc_msgSend_errorDomain(void *a1, const char *a2, ...)
{
  return _[a1 errorDomain];
}

id objc_msgSend_errorLog(void *a1, const char *a2, ...)
{
  return _[a1 errorLog];
}

id objc_msgSend_errorStatusCode(void *a1, const char *a2, ...)
{
  return _[a1 errorStatusCode];
}

id objc_msgSend_errorTextFromError_(void *a1, const char *a2, ...)
{
  return [a1 errorTextFromError:];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return _[a1 errors];
}

id objc_msgSend_estimatedHeight(void *a1, const char *a2, ...)
{
  return _[a1 estimatedHeight];
}

id objc_msgSend_estimatedHeightAbovePivot(void *a1, const char *a2, ...)
{
  return _[a1 estimatedHeightAbovePivot];
}

id objc_msgSend_estimatedWidth(void *a1, const char *a2, ...)
{
  return _[a1 estimatedWidth];
}

id objc_msgSend_evaluateAttributes(void *a1, const char *a2, ...)
{
  return _[a1 evaluateAttributes];
}

id objc_msgSend_evaluateBinding_withObject_atIndex_count_uniqueID_nodes_flags_containingObject_builder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateBinding:withObject:atIndex:count:uniqueID:nodes:flags:containingObject:builder:");
}

id objc_msgSend_evaluateBinding_withObject_nodes_containingObject_builder_(void *a1, const char *a2, ...)
{
  return [a1 evaluateBinding:withObject:nodes:containingObject:builder:];
}

id objc_msgSend_evaluateEnumerator_withObject_atIndex_count_uniqueID_nodes_flags_containingObject_builder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateEnumerator:withObject:atIndex:count:uniqueID:nodes:flags:containingObject:builder:");
}

id objc_msgSend_evaluateEnumerator_withObject_nodes_containingObject_builder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateEnumerator:withObject:nodes:containingObject:builder:");
}

id objc_msgSend_evaluateStates_block_(void *a1, const char *a2, ...)
{
  return [a1 evaluateStates:block:];
}

id objc_msgSend_evaluateStringForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 evaluateStringForAttribute:node:];
}

id objc_msgSend_evaluateWithEntry_index_(void *a1, const char *a2, ...)
{
  return [a1 evaluateWithEntry:index:];
}

id objc_msgSend_evaluateWithIdentifierMap_block_(void *a1, const char *a2, ...)
{
  return [a1 evaluateWithIdentifierMap:block:];
}

id objc_msgSend_evaluateWithLiveTransform_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateWithLiveTransform:block:");
}

id objc_msgSend_evaluateWithPointer_block_(void *a1, const char *a2, ...)
{
  return [a1 evaluateWithPointer:block:];
}

id objc_msgSend_evaluateWithRenderModel_(void *a1, const char *a2, ...)
{
  return [a1 evaluateWithRenderModel:];
}

id objc_msgSend_evaluateWithSnapshot_block_(void *a1, const char *a2, ...)
{
  return [a1 evaluateWithSnapshot:block:];
}

id objc_msgSend_evaluateWithWidth_layoutDirection_block_(void *a1, const char *a2, ...)
{
  return [a1 evaluateWithWidth:layoutDirection:block:];
}

id objc_msgSend_evaluationErrors(void *a1, const char *a2, ...)
{
  return _[a1 evaluationErrors];
}

id objc_msgSend_eventCaseAsString(void *a1, const char *a2, ...)
{
  return _[a1 eventCaseAsString];
}

id objc_msgSend_eventCollector(void *a1, const char *a2, ...)
{
  return _[a1 eventCollector];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _[a1 events];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 exceptionWithName:reason:userInfo:];
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 executeFetchRequest:error:];
}

id objc_msgSend_expandableChild(void *a1, const char *a2, ...)
{
  return _[a1 expandableChild];
}

id objc_msgSend_expandableContentIsTruncated(void *a1, const char *a2, ...)
{
  return _[a1 expandableContentIsTruncated];
}

id objc_msgSend_expandableMoreWidth(void *a1, const char *a2, ...)
{
  return _[a1 expandableMoreWidth];
}

id objc_msgSend_expandableMoreXOffset(void *a1, const char *a2, ...)
{
  return _[a1 expandableMoreXOffset];
}

id objc_msgSend_expandedContentChild(void *a1, const char *a2, ...)
{
  return _[a1 expandedContentChild];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_externalSystemGreenColor(void *a1, const char *a2, ...)
{
  return _[a1 externalSystemGreenColor];
}

id objc_msgSend_externalSystemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 externalSystemRedColor];
}

id objc_msgSend_externalSystemTealColor(void *a1, const char *a2, ...)
{
  return _[a1 externalSystemTealColor];
}

id objc_msgSend_extraLeftItems(void *a1, const char *a2, ...)
{
  return _[a1 extraLeftItems];
}

id objc_msgSend_extraRightItems(void *a1, const char *a2, ...)
{
  return _[a1 extraRightItems];
}

id objc_msgSend_failureCount(void *a1, const char *a2, ...)
{
  return _[a1 failureCount];
}

id objc_msgSend_fallbackColor(void *a1, const char *a2, ...)
{
  return _[a1 fallbackColor];
}

id objc_msgSend_feedBehaviorsWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedBehaviorsWithDictionary:");
}

id objc_msgSend_feedContentWithEntries_stackName_(void *a1, const char *a2, ...)
{
  return [a1 feedContentWithEntries:stackName:];
}

id objc_msgSend_feedControllerHost(void *a1, const char *a2, ...)
{
  return _[a1 feedControllerHost];
}

id objc_msgSend_feedDataWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 feedDataWithDictionary:];
}

id objc_msgSend_feedEntry_handleBehavior_name_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedEntry:handleBehavior:name:arguments:");
}

id objc_msgSend_feedEntry_requestDataWithPriority_block_(void *a1, const char *a2, ...)
{
  return [a1 feedEntry:requestDataWithPriority:block:];
}

id objc_msgSend_feedEntryFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 feedEntryFromDictionary:];
}

id objc_msgSend_feedEntryFromTemplateURL_data_behaviors_(void *a1, const char *a2, ...)
{
  return [a1 feedEntryFromTemplateURL:data:behaviors:];
}

id objc_msgSend_feedId(void *a1, const char *a2, ...)
{
  return _[a1 feedId];
}

id objc_msgSend_feedLayoutController(void *a1, const char *a2, ...)
{
  return _[a1 feedLayoutController];
}

id objc_msgSend_feedLayoutController_applyUpdatesFromTransactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedLayoutController:applyUpdatesFromTransactionGroup:");
}

id objc_msgSend_feedLayoutController_axModelSections_renderModelCollection_renderModelSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedLayoutController:axModelSections:renderModelCollection:renderModelSections:");
}

id objc_msgSend_feedLayoutController_didTransitionToLayoutState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedLayoutController:didTransitionToLayoutState:");
}

id objc_msgSend_feedLayoutController_updateStats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedLayoutController:updateStats:");
}

id objc_msgSend_feedLayoutController_willTransitionToLayoutState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedLayoutController:willTransitionToLayoutState:");
}

id objc_msgSend_feedLayoutControllerAllContentReady_(void *a1, const char *a2, ...)
{
  return [a1 feedLayoutControllerAllContentReady:];
}

id objc_msgSend_feedLayoutControllerInitialContentReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedLayoutControllerInitialContentReady:");
}

id objc_msgSend_feedNotVisibleTriggerStatesForAxis_(void *a1, const char *a2, ...)
{
  return [a1 feedNotVisibleTriggerStatesForAxis:];
}

id objc_msgSend_feedOverlayDebugViewController(void *a1, const char *a2, ...)
{
  return _[a1 feedOverlayDebugViewController];
}

id objc_msgSend_feedScrollAnchor(void *a1, const char *a2, ...)
{
  return _[a1 feedScrollAnchor];
}

id objc_msgSend_feedView(void *a1, const char *a2, ...)
{
  return _[a1 feedView];
}

id objc_msgSend_feedView_didEndDisplayView_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedView:didEndDisplayView:atIndexPath:");
}

id objc_msgSend_feedView_willDisplayView_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedView:willDisplayView:atIndexPath:");
}

id objc_msgSend_feedViewController_contentInsetsForScrollingToRectWithContentInsets_(void *a1, const char *a2, ...)
{
  return [a1 feedViewController:contentInsetsForScrollingToRectWithContentInsets];
}

id objc_msgSend_feedViewController_customizeEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedViewController:customizeEnvironment:");
}

id objc_msgSend_feedViewController_didTransitionToLayoutState_(void *a1, const char *a2, ...)
{
  return [a1 feedViewController:didTransitionToLayoutState:];
}

id objc_msgSend_feedViewController_willTransitionToContentHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedViewController:willTransitionToContentHeight:");
}

id objc_msgSend_feedViewController_willTransitionToLayoutState_(void *a1, const char *a2, ...)
{
  return [a1 feedViewController:willTransitionToLayoutState:];
}

id objc_msgSend_feedViewControllerAllContentReady_(void *a1, const char *a2, ...)
{
  return [a1 feedViewControllerAllContentReady:];
}

id objc_msgSend_feedViewControllerDidScroll_(void *a1, const char *a2, ...)
{
  return [a1 feedViewControllerDidScroll:];
}

id objc_msgSend_feedViewControllerInitialContentReady_(void *a1, const char *a2, ...)
{
  return [a1 feedViewControllerInitialContentReady:];
}

id objc_msgSend_feedViewControllerInteractionBuilder_(void *a1, const char *a2, ...)
{
  return [a1 feedViewControllerInteractionBuilder:];
}

id objc_msgSend_feedViewControllerIsConsideredVisible_(void *a1, const char *a2, ...)
{
  return [a1 feedViewControllerIsConsideredVisible:];
}

id objc_msgSend_feedViewControllerNavigationBarItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedViewControllerNavigationBarItem:");
}

id objc_msgSend_feedViewControllerNeedsSyncLayoutController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedViewControllerNeedsSyncLayoutController:");
}

id objc_msgSend_feedViewForAX(void *a1, const char *a2, ...)
{
  return _[a1 feedViewForAX];
}

id objc_msgSend_fetchDataForIndexes_generation_block_(void *a1, const char *a2, ...)
{
  return [a1 fetchDataForIndexes:generation:block:];
}

id objc_msgSend_fetchDataForRange_generation_block_(void *a1, const char *a2, ...)
{
  return [a1 fetchDataForRange:generation:block:];
}

id objc_msgSend_fetchDelta(void *a1, const char *a2, ...)
{
  return _[a1 fetchDelta];
}

id objc_msgSend_fetchIndexes(void *a1, const char *a2, ...)
{
  return _[a1 fetchIndexes];
}

id objc_msgSend_fetchInitial(void *a1, const char *a2, ...)
{
  return _[a1 fetchInitial];
}

id objc_msgSend_fetchLimit(void *a1, const char *a2, ...)
{
  return _[a1 fetchLimit];
}

id objc_msgSend_fetchPadding(void *a1, const char *a2, ...)
{
  return _[a1 fetchPadding];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return _[a1 fetchRequest];
}

id objc_msgSend_fetchWindow(void *a1, const char *a2, ...)
{
  return _[a1 fetchWindow];
}

id objc_msgSend_fetchedObjects(void *a1, const char *a2, ...)
{
  return _[a1 fetchedObjects];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:isDirectory:];
}

id objc_msgSend_fileProviderForKind_(void *a1, const char *a2, ...)
{
  return [a1 fileProviderForKind:];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:isDirectory:];
}

id objc_msgSend_fileURLWithPath_relativeToURL_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:relativeToURL:];
}

id objc_msgSend_filledButtonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 filledButtonConfiguration];
}

id objc_msgSend_filter(void *a1, const char *a2, ...)
{
  return _[a1 filter];
}

id objc_msgSend_filterInfo(void *a1, const char *a2, ...)
{
  return _[a1 filterInfo];
}

id objc_msgSend_filterOptions(void *a1, const char *a2, ...)
{
  return _[a1 filterOptions];
}

id objc_msgSend_filterRegistry(void *a1, const char *a2, ...)
{
  return _[a1 filterRegistry];
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return [a1 filterWithType:];
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return [a1 filteredArrayUsingPredicate:];
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return _[a1 filters];
}

id objc_msgSend_finalizeAXActions(void *a1, const char *a2, ...)
{
  return _[a1 finalizeAXActions];
}

id objc_msgSend_finalizeAnimationGroup(void *a1, const char *a2, ...)
{
  return _[a1 finalizeAnimationGroup];
}

id objc_msgSend_finalizeAnimationGroups(void *a1, const char *a2, ...)
{
  return _[a1 finalizeAnimationGroups];
}

id objc_msgSend_finalizeAnimationValues(void *a1, const char *a2, ...)
{
  return _[a1 finalizeAnimationValues];
}

id objc_msgSend_finalizeAnimationWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalizeAnimationWithContext:");
}

id objc_msgSend_finalizeButtonStateModelWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalizeButtonStateModelWithContext:");
}

id objc_msgSend_finalizeConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 finalizeConfiguration];
}

id objc_msgSend_finalizeContentsWithContext_(void *a1, const char *a2, ...)
{
  return [a1 finalizeContentsWithContext:];
}

id objc_msgSend_finalizeImpressions(void *a1, const char *a2, ...)
{
  return _[a1 finalizeImpressions];
}

id objc_msgSend_finalizeLinkEntities(void *a1, const char *a2, ...)
{
  return _[a1 finalizeLinkEntities];
}

id objc_msgSend_finalizeLinkEntityWithContext_(void *a1, const char *a2, ...)
{
  return [a1 finalizeLinkEntityWithContext:];
}

id objc_msgSend_finalizeMenuItem(void *a1, const char *a2, ...)
{
  return _[a1 finalizeMenuItem];
}

id objc_msgSend_finalizeModels(void *a1, const char *a2, ...)
{
  return _[a1 finalizeModels];
}

id objc_msgSend_finalizeModelsWithParent_(void *a1, const char *a2, ...)
{
  return [a1 finalizeModelsWithParent:];
}

id objc_msgSend_finalizeModelsWithParent_box_context_(void *a1, const char *a2, ...)
{
  return [a1 finalizeModelsWithParent:box:context:];
}

id objc_msgSend_finalizeModelsWithParent_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalizeModelsWithParent:context:");
}

id objc_msgSend_finalizeSegments(void *a1, const char *a2, ...)
{
  return _[a1 finalizeSegments];
}

id objc_msgSend_finalizeStateMapWithContext_(void *a1, const char *a2, ...)
{
  return [a1 finalizeStateMapWithContext:];
}

id objc_msgSend_finalizeStruct(void *a1, const char *a2, ...)
{
  return _[a1 finalizeStruct];
}

id objc_msgSend_finalizeSyncTransaction_(void *a1, const char *a2, ...)
{
  return [a1 finalizeSyncTransaction:];
}

id objc_msgSend_finalizeTextModelWithContext_(void *a1, const char *a2, ...)
{
  return [a1 finalizeTextModelWithContext:];
}

id objc_msgSend_finalizeTriggers(void *a1, const char *a2, ...)
{
  return _[a1 finalizeTriggers];
}

id objc_msgSend_finalizeUpdates(void *a1, const char *a2, ...)
{
  return _[a1 finalizeUpdates];
}

id objc_msgSend_finalizeWidgetWithParent_(void *a1, const char *a2, ...)
{
  return [a1 finalizeWidgetWithParent:];
}

id objc_msgSend_finalizeWithContentsScale_(void *a1, const char *a2, ...)
{
  return [a1 finalizeWithContentsScale:];
}

id objc_msgSend_finalizeWithTimebase_(void *a1, const char *a2, ...)
{
  return [a1 finalizeWithTimebase:];
}

id objc_msgSend_findCharIndex(void *a1, const char *a2, ...)
{
  return _[a1 findCharIndex];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return _[a1 finishDecoding];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return _[a1 first];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return _[a1 firstIndex];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_flashPlaybackControlsWithDuration_(void *a1, const char *a2, ...)
{
  return [a1 flashPlaybackControlsWithDuration:];
}

id objc_msgSend_flexedHeight(void *a1, const char *a2, ...)
{
  return _[a1 flexedHeight];
}

id objc_msgSend_flexedWidth(void *a1, const char *a2, ...)
{
  return _[a1 flexedWidth];
}

id objc_msgSend_flipsHorizontal(void *a1, const char *a2, ...)
{
  return _[a1 flipsHorizontal];
}

id objc_msgSend_flipsHorizontalAxis(void *a1, const char *a2, ...)
{
  return _[a1 flipsHorizontalAxis];
}

id objc_msgSend_floatForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 floatForAttribute:node:];
}

id objc_msgSend_floatForAttribute_withDefault_node_(void *a1, const char *a2, ...)
{
  return [a1 floatForAttribute:withDefault:node:];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_floatValueForProperty_(void *a1, const char *a2, ...)
{
  return [a1 floatValueForProperty:];
}

id objc_msgSend_floatingLiveTransform(void *a1, const char *a2, ...)
{
  return _[a1 floatingLiveTransform];
}

id objc_msgSend_focusStyle(void *a1, const char *a2, ...)
{
  return _[a1 focusStyle];
}

id objc_msgSend_focusStyleForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 focusStyleForAttribute:node:];
}

id objc_msgSend_focusStyleWithColor_(void *a1, const char *a2, ...)
{
  return [a1 focusStyleWithColor:];
}

id objc_msgSend_focusStyleWithContinuousCurve_(void *a1, const char *a2, ...)
{
  return [a1 focusStyleWithContinuousCurve:];
}

id objc_msgSend_focusStyleWithCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 focusStyleWithCornerRadius:];
}

id objc_msgSend_focusStyleWithEffect_(void *a1, const char *a2, ...)
{
  return [a1 focusStyleWithEffect:];
}

id objc_msgSend_focusStyleWithGroupIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 focusStyleWithGroupIdentifier:];
}

id objc_msgSend_focusStyleWithInsets_(void *a1, const char *a2, ...)
{
  return [a1 focusStyleWithInsets:];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontAttributes(void *a1, const char *a2, ...)
{
  return _[a1 fontAttributes];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorWithFontAttributes_(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptorWithFontAttributes:];
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptorWithSymbolicTraits:];
}

id objc_msgSend_fontDesignTrait(void *a1, const char *a2, ...)
{
  return _[a1 fontDesignTrait];
}

id objc_msgSend_fontFamilyName(void *a1, const char *a2, ...)
{
  return _[a1 fontFamilyName];
}

id objc_msgSend_fontMetricsAtCharacterIndex_(void *a1, const char *a2, ...)
{
  return [a1 fontMetricsAtCharacterIndex:];
}

id objc_msgSend_fontSize(void *a1, const char *a2, ...)
{
  return _[a1 fontSize];
}

id objc_msgSend_fontSpec(void *a1, const char *a2, ...)
{
  return _[a1 fontSpec];
}

id objc_msgSend_fontSpecForNode_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecForNode:];
}

id objc_msgSend_fontSpecWithAdditionalLeading_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithAdditionalLeading:];
}

id objc_msgSend_fontSpecWithCaps_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithCaps:];
}

id objc_msgSend_fontSpecWithColor_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithColor:];
}

id objc_msgSend_fontSpecWithDesign_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithDesign:];
}

id objc_msgSend_fontSpecWithFamily_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithFamily:];
}

id objc_msgSend_fontSpecWithLeading_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithLeading:];
}

id objc_msgSend_fontSpecWithMaxContentSize_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithMaxContentSize:];
}

id objc_msgSend_fontSpecWithMaxPointSize_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithMaxPointSize:];
}

id objc_msgSend_fontSpecWithMinContentSize_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithMinContentSize:];
}

id objc_msgSend_fontSpecWithMinPointSize_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithMinPointSize:];
}

id objc_msgSend_fontSpecWithMonospacedDigits_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithMonospacedDigits:];
}

id objc_msgSend_fontSpecWithPointSize_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithPointSize:];
}

id objc_msgSend_fontSpecWithTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithTextStyle:];
}

id objc_msgSend_fontSpecWithTracking_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithTracking:];
}

id objc_msgSend_fontSpecWithWeight_(void *a1, const char *a2, ...)
{
  return [a1 fontSpecWithWeight:];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithDescriptor:];
}

id objc_msgSend_fontWithName_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithName:size:];
}

id objc_msgSend_fontWithSize_(void *a1, const char *a2, ...)
{
  return [a1 fontWithSize:];
}

id objc_msgSend_footer(void *a1, const char *a2, ...)
{
  return _[a1 footer];
}

id objc_msgSend_forceVisibleOnHover(void *a1, const char *a2, ...)
{
  return _[a1 forceVisibleOnHover];
}

id objc_msgSend_foregroundColor(void *a1, const char *a2, ...)
{
  return _[a1 foregroundColor];
}

id objc_msgSend_foregroundImageName(void *a1, const char *a2, ...)
{
  return _[a1 foregroundImageName];
}

id objc_msgSend_formatForTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 formatForTraitCollection:];
}

id objc_msgSend_formattedProgress(void *a1, const char *a2, ...)
{
  return _[a1 formattedProgress];
}

id objc_msgSend_fraction(void *a1, const char *a2, ...)
{
  return _[a1 fraction];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_frameBounds(void *a1, const char *a2, ...)
{
  return _[a1 frameBounds];
}

id objc_msgSend_frameForAlignmentRect_(void *a1, const char *a2, ...)
{
  return [a1 frameForAlignmentRect:];
}

id objc_msgSend_from(void *a1, const char *a2, ...)
{
  return _[a1 from];
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return [a1 functionWithName:];
}

id objc_msgSend_generateAllGroupRenderModelsFromSource_(void *a1, const char *a2, ...)
{
  return [a1 generateAllGroupRenderModelsFromSource:];
}

id objc_msgSend_generateAnimationRenderModelsForAllPhasesFromSource_(void *a1, const char *a2, ...)
{
  return [a1 generateAnimationRenderModelsForAllPhasesFromSource:];
}

id objc_msgSend_generateCache(void *a1, const char *a2, ...)
{
  return _[a1 generateCache];
}

id objc_msgSend_generateRenderModelsFromSource_(void *a1, const char *a2, ...)
{
  return [a1 generateRenderModelsFromSource:];
}

id objc_msgSend_generation(void *a1, const char *a2, ...)
{
  return _[a1 generation];
}

id objc_msgSend_generic(void *a1, const char *a2, ...)
{
  return _[a1 generic];
}

id objc_msgSend_geometry(void *a1, const char *a2, ...)
{
  return _[a1 geometry];
}

id objc_msgSend_geometryForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 geometryForIdentifier:];
}

id objc_msgSend_geometryForIdentifier_requestedSize_(void *a1, const char *a2, ...)
{
  return [a1 geometryForIdentifier:requestedSize:];
}

id objc_msgSend_geometryUpdatedFlag(void *a1, const char *a2, ...)
{
  return _[a1 geometryUpdatedFlag];
}

id objc_msgSend_gestureRecognizers(void *a1, const char *a2, ...)
{
  return _[a1 gestureRecognizers];
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:length:];
}

id objc_msgSend_getHue_saturation_brightness_alpha_(void *a1, const char *a2, ...)
{
  return [a1 getHue:saturation:brightness:alpha:];
}

id objc_msgSend_getRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 getRed:green:blue:alpha:];
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 getUUIDBytes:];
}

id objc_msgSend_globallySupportedAttributes(void *a1, const char *a2, ...)
{
  return _[a1 globallySupportedAttributes];
}

id objc_msgSend_globalsEnvironmentUseMask(void *a1, const char *a2, ...)
{
  return _[a1 globalsEnvironmentUseMask];
}

id objc_msgSend_globalsNameForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 globalsNameForAttribute:node:];
}

id objc_msgSend_gradientBlurOffset(void *a1, const char *a2, ...)
{
  return _[a1 gradientBlurOffset];
}

id objc_msgSend_gradientBlurRadius(void *a1, const char *a2, ...)
{
  return _[a1 gradientBlurRadius];
}

id objc_msgSend_gradientDirection(void *a1, const char *a2, ...)
{
  return _[a1 gradientDirection];
}

id objc_msgSend_gradientEndColor(void *a1, const char *a2, ...)
{
  return _[a1 gradientEndColor];
}

id objc_msgSend_gradientEndPosition(void *a1, const char *a2, ...)
{
  return _[a1 gradientEndPosition];
}

id objc_msgSend_gradientFraction(void *a1, const char *a2, ...)
{
  return _[a1 gradientFraction];
}

id objc_msgSend_gradientInsets(void *a1, const char *a2, ...)
{
  return _[a1 gradientInsets];
}

id objc_msgSend_gradientLayer(void *a1, const char *a2, ...)
{
  return _[a1 gradientLayer];
}

id objc_msgSend_gradientStartColor(void *a1, const char *a2, ...)
{
  return _[a1 gradientStartColor];
}

id objc_msgSend_gradientStartPosition(void *a1, const char *a2, ...)
{
  return _[a1 gradientStartPosition];
}

id objc_msgSend_gradientWidth(void *a1, const char *a2, ...)
{
  return _[a1 gradientWidth];
}

id objc_msgSend_gravity(void *a1, const char *a2, ...)
{
  return _[a1 gravity];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return _[a1 grayColor];
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return _[a1 greenColor];
}

id objc_msgSend_gridWithEdge_(void *a1, const char *a2, ...)
{
  return [a1 gridWithEdge:];
}

id objc_msgSend_groupIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 groupIdentifier];
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return _[a1 groupName];
}

id objc_msgSend_groupPhases(void *a1, const char *a2, ...)
{
  return _[a1 groupPhases];
}

id objc_msgSend_groupPriority(void *a1, const char *a2, ...)
{
  return _[a1 groupPriority];
}

id objc_msgSend_grouped(void *a1, const char *a2, ...)
{
  return _[a1 grouped];
}

id objc_msgSend_groupedContainingContentMode(void *a1, const char *a2, ...)
{
  return _[a1 groupedContainingContentMode];
}

id objc_msgSend_groupedContainingInsets(void *a1, const char *a2, ...)
{
  return _[a1 groupedContainingInsets];
}

id objc_msgSend_groupedContainingInsetsMode(void *a1, const char *a2, ...)
{
  return _[a1 groupedContainingInsetsMode];
}

id objc_msgSend_groupedContainingIsGrouped(void *a1, const char *a2, ...)
{
  return _[a1 groupedContainingIsGrouped];
}

id objc_msgSend_groupedContainingLayouts(void *a1, const char *a2, ...)
{
  return _[a1 groupedContainingLayouts];
}

id objc_msgSend_groups(void *a1, const char *a2, ...)
{
  return _[a1 groups];
}

id objc_msgSend_guideBottom(void *a1, const char *a2, ...)
{
  return _[a1 guideBottom];
}

id objc_msgSend_guideForLayout_spec_(void *a1, const char *a2, ...)
{
  return [a1 guideForLayout:spec:];
}

id objc_msgSend_guideForSpec_(void *a1, const char *a2, ...)
{
  return [a1 guideForSpec:];
}

id objc_msgSend_guideForSpec_withOffset_(void *a1, const char *a2, ...)
{
  return [a1 guideForSpec:withOffset:];
}

id objc_msgSend_guideLayoutController(void *a1, const char *a2, ...)
{
  return _[a1 guideLayoutController];
}

id objc_msgSend_guideLayoutController_changedPhase_(void *a1, const char *a2, ...)
{
  return [a1 guideLayoutController:changedPhase:];
}

id objc_msgSend_guideLayoutControllerForLayout_(void *a1, const char *a2, ...)
{
  return [a1 guideLayoutControllerForLayout:];
}

id objc_msgSend_guideLeading(void *a1, const char *a2, ...)
{
  return _[a1 guideLeading];
}

id objc_msgSend_guideOffset(void *a1, const char *a2, ...)
{
  return _[a1 guideOffset];
}

id objc_msgSend_guideProvider(void *a1, const char *a2, ...)
{
  return _[a1 guideProvider];
}

id objc_msgSend_guideProviderForLayout_(void *a1, const char *a2, ...)
{
  return [a1 guideProviderForLayout:];
}

id objc_msgSend_guideTop(void *a1, const char *a2, ...)
{
  return _[a1 guideTop];
}

id objc_msgSend_guideTrailing(void *a1, const char *a2, ...)
{
  return _[a1 guideTrailing];
}

id objc_msgSend_guides(void *a1, const char *a2, ...)
{
  return _[a1 guides];
}

id objc_msgSend_halign(void *a1, const char *a2, ...)
{
  return _[a1 halign];
}

id objc_msgSend_halignFromString_(void *a1, const char *a2, ...)
{
  return [a1 halignFromString:];
}

id objc_msgSend_handleAction_forLinkEntity_withParameters_sourceView_completion_(void *a1, const char *a2, ...)
{
  return [a1 handleAction:forLinkEntity:withParameters:sourceView:completion:];
}

id objc_msgSend_handleActionForObject_withName_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleActionForObject:withName:arguments:");
}

id objc_msgSend_handleBehaviorWithName_arguments_(void *a1, const char *a2, ...)
{
  return [a1 handleBehaviorWithName:arguments:];
}

id objc_msgSend_handlePlaybackChecksChange_keyPath_playbackChecks_(void *a1, const char *a2, ...)
{
  return [a1 handlePlaybackChecksChange:keyPath:playbackChecks:];
}

id objc_msgSend_handlePlayerChange_keyPath_player_(void *a1, const char *a2, ...)
{
  return [a1 handlePlayerChange:keyPath:player:];
}

id objc_msgSend_handlePlayerItemChange_keyPath_playerItem_(void *a1, const char *a2, ...)
{
  return [a1 handlePlayerItemChange:keyPath:playerItem:];
}

id objc_msgSend_handleTrigger_didChangeState_updateEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTrigger:didChangeState:updateEvent:");
}

id objc_msgSend_handlesAlphaForFinalAppearance(void *a1, const char *a2, ...)
{
  return _[a1 handlesAlphaForFinalAppearance];
}

id objc_msgSend_handlesAlphaForInitialAppearance(void *a1, const char *a2, ...)
{
  return _[a1 handlesAlphaForInitialAppearance];
}

id objc_msgSend_hasAccessibleDescendants(void *a1, const char *a2, ...)
{
  return _[a1 hasAccessibleDescendants];
}

id objc_msgSend_hasActionForTrigger_(void *a1, const char *a2, ...)
{
  return [a1 hasActionForTrigger:];
}

id objc_msgSend_hasBaseline(void *a1, const char *a2, ...)
{
  return _[a1 hasBaseline];
}

id objc_msgSend_hasChangesToApply(void *a1, const char *a2, ...)
{
  return _[a1 hasChangesToApply];
}

id objc_msgSend_hasContextMenu(void *a1, const char *a2, ...)
{
  return _[a1 hasContextMenu];
}

id objc_msgSend_hasDeletesOrInserts(void *a1, const char *a2, ...)
{
  return _[a1 hasDeletesOrInserts];
}

id objc_msgSend_hasExtendedNS_(void *a1, const char *a2, ...)
{
  return [a1 hasExtendedNS];
}

id objc_msgSend_hasInvalidationsToApply(void *a1, const char *a2, ...)
{
  return _[a1 hasInvalidationsToApply];
}

id objc_msgSend_hasItemsConformingToTypeIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 hasItemsConformingToTypeIdentifiers:];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasRelativeWidth(void *a1, const char *a2, ...)
{
  return _[a1 hasRelativeWidth];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_hasUpdates(void *a1, const char *a2, ...)
{
  return _[a1 hasUpdates];
}

id objc_msgSend_hasUpdatesForTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 hasUpdatesForTransactionGroup:];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 hashTableWithOptions:];
}

id objc_msgSend_hcompressed(void *a1, const char *a2, ...)
{
  return _[a1 hcompressed];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return _[a1 height];
}

id objc_msgSend_heightClass(void *a1, const char *a2, ...)
{
  return _[a1 heightClass];
}

id objc_msgSend_hflipForRTL(void *a1, const char *a2, ...)
{
  return _[a1 hflipForRTL];
}

id objc_msgSend_hidden(void *a1, const char *a2, ...)
{
  return _[a1 hidden];
}

id objc_msgSend_hiddenPriority(void *a1, const char *a2, ...)
{
  return _[a1 hiddenPriority];
}

id objc_msgSend_hideEllipses(void *a1, const char *a2, ...)
{
  return _[a1 hideEllipses];
}

id objc_msgSend_hitRect(void *a1, const char *a2, ...)
{
  return _[a1 hitRect];
}

id objc_msgSend_hitTest_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 hitTest:withEvent:];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 horizontalSizeClass];
}

id objc_msgSend_hostWantsToPausePlayerWithVideoId_requestingHost_isTriggerInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hostWantsToPausePlayerWithVideoId:requestingHost:isTriggerInitiated:");
}

id objc_msgSend_hostWantsToPlayVideoWithVideoId_requestingHost_isTriggerInitiated_(void *a1, const char *a2, ...)
{
  return [a1 hostWantsToPlayVideoWithVideoId:requestingHost:isTriggerInitiated:];
}

id objc_msgSend_hostWantsToSetPlayerIsWithinVisibleBoundsForPlayerWithVideoId_requestingHost_isWithinVisibleBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hostWantsToSetPlayerIsWithinVisibleBoundsForPlayerWithVideoId:requestingHost:isWithinVisibleBounds:");
}

id objc_msgSend_hostedViewFactoryForType_(void *a1, const char *a2, ...)
{
  return [a1 hostedViewFactoryForType:];
}

id objc_msgSend_hostedViewFactoryTypesWithGeometryReuse(void *a1, const char *a2, ...)
{
  return _[a1 hostedViewFactoryTypesWithGeometryReuse];
}

id objc_msgSend_hostedViewFlags(void *a1, const char *a2, ...)
{
  return _[a1 hostedViewFlags];
}

id objc_msgSend_hostedViewProviderCreateViewController(void *a1, const char *a2, ...)
{
  return _[a1 hostedViewProviderCreateViewController];
}

id objc_msgSend_hostedViewProviderVisibilityOptions(void *a1, const char *a2, ...)
{
  return _[a1 hostedViewProviderVisibilityOptions];
}

id objc_msgSend_hostingCollectorAddProperties_forIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hostingCollectorAddProperties:forIdentifier:");
}

id objc_msgSend_hostingCollectorFinalizeMap(void *a1, const char *a2, ...)
{
  return _[a1 hostingCollectorFinalizeMap];
}

id objc_msgSend_hostingContainerView(void *a1, const char *a2, ...)
{
  return _[a1 hostingContainerView];
}

id objc_msgSend_hostingController(void *a1, const char *a2, ...)
{
  return _[a1 hostingController];
}

id objc_msgSend_hostingController_didChangeContentIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hostingController:didChangeContentIdentifiers:");
}

id objc_msgSend_hostingControllerGeometryUpdated_(void *a1, const char *a2, ...)
{
  return [a1 hostingControllerGeometryUpdated:];
}

id objc_msgSend_hostingControllerProvidersUpdated_(void *a1, const char *a2, ...)
{
  return [a1 hostingControllerProvidersUpdated:];
}

id objc_msgSend_hostingGeometry(void *a1, const char *a2, ...)
{
  return _[a1 hostingGeometry];
}

id objc_msgSend_hostingGeometryForIdentifier_requestedSize_(void *a1, const char *a2, ...)
{
  return [a1 hostingGeometryForIdentifier:requestedSize:];
}

id objc_msgSend_hostingIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 hostingIdentifier];
}

id objc_msgSend_hostingIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 hostingIdentifiers];
}

id objc_msgSend_hostingNavigationBar(void *a1, const char *a2, ...)
{
  return _[a1 hostingNavigationBar];
}

id objc_msgSend_hostingProperities(void *a1, const char *a2, ...)
{
  return _[a1 hostingProperities];
}

id objc_msgSend_hostingProperties(void *a1, const char *a2, ...)
{
  return _[a1 hostingProperties];
}

id objc_msgSend_hostingProviderUpdatedForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 hostingProviderUpdatedForIdentifier:];
}

id objc_msgSend_hostingRequestedSize(void *a1, const char *a2, ...)
{
  return _[a1 hostingRequestedSize];
}

id objc_msgSend_hoverAvailable(void *a1, const char *a2, ...)
{
  return _[a1 hoverAvailable];
}

id objc_msgSend_hoverController(void *a1, const char *a2, ...)
{
  return _[a1 hoverController];
}

id objc_msgSend_hoverIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 hoverIdentifier];
}

id objc_msgSend_hoverIdentifierWithName_(void *a1, const char *a2, ...)
{
  return [a1 hoverIdentifierWithName:];
}

id objc_msgSend_hoverIdentifierWithName_forDescdendent_(void *a1, const char *a2, ...)
{
  return [a1 hoverIdentifierWithName:forDescdendent:];
}

id objc_msgSend_hoverInteraction(void *a1, const char *a2, ...)
{
  return _[a1 hoverInteraction];
}

id objc_msgSend_hoverInteraction_didChangeStateForRegionWithKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hoverInteraction:didChangeStateForRegionWithKeys:");
}

id objc_msgSend_hoverInteractionDidSettle_(void *a1, const char *a2, ...)
{
  return [a1 hoverInteractionDidSettle:];
}

id objc_msgSend_hoverRegions(void *a1, const char *a2, ...)
{
  return _[a1 hoverRegions];
}

id objc_msgSend_hoverStateChanged_(void *a1, const char *a2, ...)
{
  return [a1 hoverStateChanged:];
}

id objc_msgSend_hoverStateForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 hoverStateForIdentifier:];
}

id objc_msgSend_hspacing(void *a1, const char *a2, ...)
{
  return _[a1 hspacing];
}

id objc_msgSend_id(void *a1, const char *a2, ...)
{
  return _[a1 id];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 identifierEnumerator];
}

id objc_msgSend_identifierForValue_(void *a1, const char *a2, ...)
{
  return [a1 identifierForValue];
}

id objc_msgSend_identifierForViewAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 identifierForViewAtIndex:];
}

id objc_msgSend_identifierForViewAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 identifierForViewAtIndexPath:];
}

id objc_msgSend_identifierMap(void *a1, const char *a2, ...)
{
  return _[a1 identifierMap];
}

id objc_msgSend_identifierNodeMap(void *a1, const char *a2, ...)
{
  return _[a1 identifierNodeMap];
}

id objc_msgSend_identifierToAXElementMap(void *a1, const char *a2, ...)
{
  return _[a1 identifierToAXElementMap];
}

id objc_msgSend_identifierToContainedSubmodelMap(void *a1, const char *a2, ...)
{
  return _[a1 identifierToContainedSubmodelMap];
}

id objc_msgSend_identifierToModelMap(void *a1, const char *a2, ...)
{
  return _[a1 identifierToModelMap];
}

id objc_msgSend_identifierWithNode_(void *a1, const char *a2, ...)
{
  return [a1 identifierWithNode:];
}

id objc_msgSend_identifierWithNode_baseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 identifierWithNode:baseIdentifier:];
}

id objc_msgSend_identifierWithoutModelIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 identifierWithoutModelIdentifier];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _[a1 identifiers];
}

id objc_msgSend_ignoreInsetsForOpacityTrigger(void *a1, const char *a2, ...)
{
  return _[a1 ignoreInsetsForOpacityTrigger];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageByPreparingThumbnailOfSize_(void *a1, const char *a2, ...)
{
  return [a1 imageByPreparingThumbnailOfSize:];
}

id objc_msgSend_imageContentWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 imageContentWithOptions:];
}

id objc_msgSend_imageFilterWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 imageFilterWithIdentifier:];
}

id objc_msgSend_imageFlippedForRightToLeftLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 imageFlippedForRightToLeftLayoutDirection];
}

id objc_msgSend_imageForState_(void *a1, const char *a2, ...)
{
  return [a1 imageForState:];
}

id objc_msgSend_imageModel(void *a1, const char *a2, ...)
{
  return _[a1 imageModel];
}

id objc_msgSend_imageModelIDToResource(void *a1, const char *a2, ...)
{
  return _[a1 imageModelIDToResource];
}

id objc_msgSend_imageModelsToLoad(void *a1, const char *a2, ...)
{
  return _[a1 imageModelsToLoad];
}

id objc_msgSend_imageNamed_inBundle_withConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 imageNamed:inBundle:withConfiguration:];
}

id objc_msgSend_imagePrefetchControllerDidLoadAllResources_(void *a1, const char *a2, ...)
{
  return [a1 imagePrefetchControllerDidLoadAllResources:];
}

id objc_msgSend_imagePrefetchControllerDidLoadInitialResources_(void *a1, const char *a2, ...)
{
  return [a1 imagePrefetchControllerDidLoadInitialResources:];
}

id objc_msgSend_imagePrefetchControllerDidStartLoadingInitialResources_(void *a1, const char *a2, ...)
{
  return [a1 imagePrefetchControllerDidStartLoadingInitialResources:];
}

id objc_msgSend_imageProviderForKind_(void *a1, const char *a2, ...)
{
  return [a1 imageProviderForKind:];
}

id objc_msgSend_imageRenderingModeFromString_(void *a1, const char *a2, ...)
{
  return [a1 imageRenderingModeFromString:];
}

id objc_msgSend_imageResource(void *a1, const char *a2, ...)
{
  return _[a1 imageResource];
}

id objc_msgSend_imageResource_naturalSize_contentsScale_withFilter_filterOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageResource:naturalSize:contentsScale:withFilter:filterOptions:");
}

id objc_msgSend_imageResource_tintedWithColor_(void *a1, const char *a2, ...)
{
  return [a1 imageResource:tintedWithColor:];
}

id objc_msgSend_imageResourceCache(void *a1, const char *a2, ...)
{
  return _[a1 imageResourceCache];
}

id objc_msgSend_imageResourceDidChangeImage_(void *a1, const char *a2, ...)
{
  return [a1 imageResourceDidChangeImage:];
}

id objc_msgSend_imageResourceDidChangeIntrinsicSize_(void *a1, const char *a2, ...)
{
  return [a1 imageResourceDidChangeIntrinsicSize:];
}

id objc_msgSend_imageResourceForImageResources_filters_imageSetFilter_naturalSize_contentsScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageResourceForImageResources:filters:imageSetFilter:naturalSize:contentsScale:");
}

id objc_msgSend_imageResourceForKind_naturalSize_contentsScale_instance_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageResourceForKind:naturalSize:contentsScale:instance:options:");
}

id objc_msgSend_imageResourceForNaturalSize_contentsScale_instance_options_(void *a1, const char *a2, ...)
{
  return [a1 imageResourceForNaturalSize:contentsScale:instance:options:];
}

id objc_msgSend_imageResourceForTemplatedURL_baseURL_naturalSize_contentsScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageResourceForTemplatedURL:baseURL:naturalSize:contentsScale:");
}

id objc_msgSend_imageResourceForURL_contentsScale_(void *a1, const char *a2, ...)
{
  return [a1 imageResourceForURL:contentsScale:];
}

id objc_msgSend_imageResourceProviderWithURL_(void *a1, const char *a2, ...)
{
  return [a1 imageResourceProviderWithURL:];
}

id objc_msgSend_imageResources(void *a1, const char *a2, ...)
{
  return _[a1 imageResources];
}

id objc_msgSend_imageSetFilter(void *a1, const char *a2, ...)
{
  return _[a1 imageSetFilter];
}

id objc_msgSend_imageSetFilterWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 imageSetFilterWithIdentifier:];
}

id objc_msgSend_imageSizeForSize_(void *a1, const char *a2, ...)
{
  return [a1 imageSizeForSize:];
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return [a1 imageWithActions:];
}

id objc_msgSend_imageWithAlignmentRectInsets_(void *a1, const char *a2, ...)
{
  return [a1 imageWithAlignmentRectInsets:];
}

id objc_msgSend_imageWithBaselineOffsetFromBottom_(void *a1, const char *a2, ...)
{
  return [a1 imageWithBaselineOffsetFromBottom:];
}

id objc_msgSend_imageWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 imageWithConfiguration:];
}

id objc_msgSend_imageWithData_scale_(void *a1, const char *a2, ...)
{
  return [a1 imageWithData:scale:];
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return [a1 imageWithRenderingMode:];
}

id objc_msgSend_imageWithTintColor_(void *a1, const char *a2, ...)
{
  return [a1 imageWithTintColor:];
}

id objc_msgSend_implicitTransaction(void *a1, const char *a2, ...)
{
  return _[a1 implicitTransaction];
}

id objc_msgSend_impressionController_didUpdateSnapshot_(void *a1, const char *a2, ...)
{
  return [a1 impressionController:didUpdateSnapshot:];
}

id objc_msgSend_impressionData(void *a1, const char *a2, ...)
{
  return _[a1 impressionData];
}

id objc_msgSend_impressionForData_size_create_(void *a1, const char *a2, ...)
{
  return [a1 impressionForData:size:create:];
}

id objc_msgSend_impressionForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 impressionForIdentifier:];
}

id objc_msgSend_impressionSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 impressionSnapshot];
}

id objc_msgSend_impressions(void *a1, const char *a2, ...)
{
  return _[a1 impressions];
}

id objc_msgSend_includeTemplateWithURL_(void *a1, const char *a2, ...)
{
  return [a1 includeTemplateWithURL:];
}

id objc_msgSend_incrementAction(void *a1, const char *a2, ...)
{
  return _[a1 incrementAction];
}

id objc_msgSend_incrementHostCount(void *a1, const char *a2, ...)
{
  return _[a1 incrementHostCount];
}

id objc_msgSend_incrementInterestInDeletedModels_(void *a1, const char *a2, ...)
{
  return [a1 incrementInterestInDeletedModels:];
}

id objc_msgSend_incrementPostLaunchCacheCount(void *a1, const char *a2, ...)
{
  return _[a1 incrementPostLaunchCacheCount];
}

id objc_msgSend_indentFirstLine(void *a1, const char *a2, ...)
{
  return _[a1 indentFirstLine];
}

id objc_msgSend_indentLeading(void *a1, const char *a2, ...)
{
  return _[a1 indentLeading];
}

id objc_msgSend_indentTrailing(void *a1, const char *a2, ...)
{
  return _[a1 indentTrailing];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return _[a1 index];
}

id objc_msgSend_indexAtPosition_(void *a1, const char *a2, ...)
{
  return [a1 indexAtPosition:];
}

id objc_msgSend_indexForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 indexForIdentifier:];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexOfObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObjectIdenticalTo:];
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObjectPassingTest:];
}

id objc_msgSend_indexPath(void *a1, const char *a2, ...)
{
  return _[a1 indexPath];
}

id objc_msgSend_indexPathByAddingIndex_(void *a1, const char *a2, ...)
{
  return [a1 indexPathByAddingIndex:];
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForRow:inSection:];
}

id objc_msgSend_indexPathWithIndex_(void *a1, const char *a2, ...)
{
  return [a1 indexPathWithIndex:];
}

id objc_msgSend_indexPathWithIndexes_length_(void *a1, const char *a2, ...)
{
  return [a1 indexPathWithIndexes:length:];
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return [a1 indexSetWithIndex:];
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 indexesOfObjectsPassingTest:];
}

id objc_msgSend_inferredLabel(void *a1, const char *a2, ...)
{
  return _[a1 inferredLabel];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return _[a1 info];
}

id objc_msgSend_infoTextFromError_(void *a1, const char *a2, ...)
{
  return [a1 infoTextFromError:];
}

id objc_msgSend_inheritedAnimationDuration(void *a1, const char *a2, ...)
{
  return _[a1 inheritedAnimationDuration];
}

id objc_msgSend_inheritedRefIdWithContext_(void *a1, const char *a2, ...)
{
  return [a1 inheritedRefIdWithContext:];
}

id objc_msgSend_inheritedRefInstanceWithContext_(void *a1, const char *a2, ...)
{
  return [a1 inheritedRefInstanceWithContext:];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initAsEmpty(void *a1, const char *a2, ...)
{
  return _[a1 initAsEmpty];
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return [a1 initForReadingFromData:error:];
}

id objc_msgSend_initSharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 initSharedInstance];
}

id objc_msgSend_initWithAXAttributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithAXAttributes:];
}

id objc_msgSend_initWithActionCase_origin_mode_isMuted_isPlaying_mediaTimePlayed_mediaDuration_mediaId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionCase:origin:mode:isMuted:isPlaying:mediaTimePlayed:mediaDuration:mediaId:");
}

id objc_msgSend_initWithActionObject_behavior_arguments_(void *a1, const char *a2, ...)
{
  return [a1 initWithActionObject:behavior:arguments:];
}

id objc_msgSend_initWithActionsData_actionObject_actionDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithActionsData:actionObject:actionDelegate:];
}

id objc_msgSend_initWithActionsData_block_(void *a1, const char *a2, ...)
{
  return [a1 initWithActionsData:block:];
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivityIndicatorStyle:];
}

id objc_msgSend_initWithActivityItems_applicationActivities_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivityItems:applicationActivities:];
}

id objc_msgSend_initWithAnchor_relativeDistance_(void *a1, const char *a2, ...)
{
  return [a1 initWithAnchor:relativeDistance:];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithArray_augmenter_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:augmenter:];
}

id objc_msgSend_initWithArray_generation_count_observer_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:generation:count:observer:];
}

id objc_msgSend_initWithArray_index_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:index:];
}

id objc_msgSend_initWithArray_mapper_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:mapper:];
}

id objc_msgSend_initWithArray_start_end_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:start:end:];
}

id objc_msgSend_initWithAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 initWithAttributedString:];
}

id objc_msgSend_initWithAttributes_caps_(void *a1, const char *a2, ...)
{
  return [a1 initWithAttributes:caps:];
}

id objc_msgSend_initWithAxis_(void *a1, const char *a2, ...)
{
  return [a1 initWithAxis:];
}

id objc_msgSend_initWithAxis_window_layout_offset_(void *a1, const char *a2, ...)
{
  return [a1 initWithAxis:window:layout:offset:];
}

id objc_msgSend_initWithBehavior_arguments_(void *a1, const char *a2, ...)
{
  return [a1 initWithBehavior:arguments:];
}

id objc_msgSend_initWithBlurStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithBlurStyle:];
}

id objc_msgSend_initWithBounds_(void *a1, const char *a2, ...)
{
  return [a1 initWithBounds:];
}

id objc_msgSend_initWithBounds_format_(void *a1, const char *a2, ...)
{
  return [a1 initWithBounds:format:];
}

id objc_msgSend_initWithBounds_viewState_(void *a1, const char *a2, ...)
{
  return [a1 initWithBounds:viewState:];
}

id objc_msgSend_initWithButtonAttributes_contentModel_(void *a1, const char *a2, ...)
{
  return [a1 initWithButtonAttributes:contentModel:];
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:length:];
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:length:encoding:];
}

id objc_msgSend_initWithCGColor_(void *a1, const char *a2, ...)
{
  return [a1 initWithCGColor:];
}

id objc_msgSend_initWithCGImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithCGImage:];
}

id objc_msgSend_initWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return [a1 initWithCGImage:scale:orientation:];
}

id objc_msgSend_initWithCache_unsizedCacheSet_queue_naturalSize_contentsScale_resource_(void *a1, const char *a2, ...)
{
  return [a1 initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:];
}

id objc_msgSend_initWithCache_unsizedCacheSet_queue_naturalSize_contentsScale_resource_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:filter:");
}

id objc_msgSend_initWithCache_unsizedCacheSet_queue_naturalSize_contentsScale_resources_filters_imageSetFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resources:filters:imageSetFilter:");
}

id objc_msgSend_initWithCache_unsizedCacheSet_queue_resource_color_(void *a1, const char *a2, ...)
{
  return [a1 initWithCache:unsizedCacheSet:queue:resource:color:];
}

id objc_msgSend_initWithCache_unsizedCacheSet_queue_templateURL_baseURL_url_naturalSize_contentsScale_loader_(void *a1, const char *a2, ...)
{
  return [a1 initWithCache:unsizedCacheSet:queue:templateURL:baseURL:url:naturalSize:contentsScale:loader:];
}

id objc_msgSend_initWithCancelBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithCancelBlock:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithCells_(void *a1, const char *a2, ...)
{
  return [a1 initWithCells:];
}

id objc_msgSend_initWithCenter_size_transform_(void *a1, const char *a2, ...)
{
  return [a1 initWithCenter:size:transform:];
}

id objc_msgSend_initWithCenter_size_transform_pinPosition_(void *a1, const char *a2, ...)
{
  return [a1 initWithCenter:size:transform:pinPosition:];
}

id objc_msgSend_initWithChildren_(void *a1, const char *a2, ...)
{
  return [a1 initWithChildren:];
}

id objc_msgSend_initWithCollector_(void *a1, const char *a2, ...)
{
  return [a1 initWithCollector:];
}

id objc_msgSend_initWithColor_(void *a1, const char *a2, ...)
{
  return [a1 initWithColor:];
}

id objc_msgSend_initWithColumns_yOffset_compositingFilterType_(void *a1, const char *a2, ...)
{
  return [a1 initWithColumns:yOffset:compositingFilterType:];
}

id objc_msgSend_initWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 initWithCompletion:];
}

id objc_msgSend_initWithConcurrencyType_(void *a1, const char *a2, ...)
{
  return [a1 initWithConcurrencyType:];
}

id objc_msgSend_initWithContainer_center_(void *a1, const char *a2, ...)
{
  return [a1 initWithContainer:center:];
}

id objc_msgSend_initWithContainer_reference_style_(void *a1, const char *a2, ...)
{
  return [a1 initWithContainer:reference:style:];
}

id objc_msgSend_initWithContent_(void *a1, const char *a2, ...)
{
  return [a1 initWithContent:];
}

id objc_msgSend_initWithContent_sections_size_insets_visibleBoundsObservers_info_anchorSet_layoutDirection_matchingUUID_matchingUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:");
}

id objc_msgSend_initWithContentsScale_image_color_hflip_blendMode_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsScale:image:color:hflip:blendMode:];
}

id objc_msgSend_initWithContentsScale_resource_load_cornerRadius_fallbackColor_contentsGravity_hflip_crossfadesContents_opacity_continuousCorners_shouldRasterize_blendMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:];
}

id objc_msgSend_initWithContext_box_baselineOffset_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:box:baselineOffset:];
}

id objc_msgSend_initWithContext_drawable_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:drawable:];
}

id objc_msgSend_initWithContext_fetchRequest_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:fetchRequest:];
}

id objc_msgSend_initWithContext_string_stylesheet_kind_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:string:stylesheet:kind:];
}

id objc_msgSend_initWithContext_url_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:url:];
}

id objc_msgSend_initWithContextSnapshot_(void *a1, const char *a2, ...)
{
  return [a1 initWithContextSnapshot:];
}

id objc_msgSend_initWithController_provider_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithController:provider:identifier:];
}

id objc_msgSend_initWithController_timeout_transaction_feedId_(void *a1, const char *a2, ...)
{
  return [a1 initWithController:timeout:transaction:feedId:];
}

id objc_msgSend_initWithCoordinator_block_array_(void *a1, const char *a2, ...)
{
  return [a1 initWithCoordinator:block:array:];
}

id objc_msgSend_initWithCoordinator_block_value_(void *a1, const char *a2, ...)
{
  return [a1 initWithCoordinator:block:value:];
}

id objc_msgSend_initWithCount_(void *a1, const char *a2, ...)
{
  return [a1 initWithCount:];
}

id objc_msgSend_initWithCurrent_from_to_tracker_flags_(void *a1, const char *a2, ...)
{
  return [a1 initWithCurrent:from:to:tracker:flags:];
}

id objc_msgSend_initWithCustomAction_arguments_axElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCustomAction:arguments:axElement:");
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return [a1 initWithCustomView:];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithData_contentsScale_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:contentsScale:];
}

id objc_msgSend_initWithData_scale_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:scale:];
}

id objc_msgSend_initWithData_size_center_transform_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:size:center:transform:];
}

id objc_msgSend_initWithData_size_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:size:identifier:];
}

id objc_msgSend_initWithDataProvider_generation_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataProvider:generation:count:];
}

id objc_msgSend_initWithDates_collector_(void *a1, const char *a2, ...)
{
  return [a1 initWithDates:collector:];
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithDelegate_package_manager_identifierMap_environment_state_feedId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:package:manager:identifierMap:environment:state:feedId:");
}

id objc_msgSend_initWithDelegate_view_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:view:];
}

id objc_msgSend_initWithDictionaries_stackName_initialContentReadyEntryIndex_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionaries:];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithDomain:code:userInfo:];
}

id objc_msgSend_initWithDragInfo_view_(void *a1, const char *a2, ...)
{
  return [a1 initWithDragInfo:view:];
}

id objc_msgSend_initWithDraw_contentsScale_renderMode_(void *a1, const char *a2, ...)
{
  return [a1 initWithDraw:contentsScale:renderMode:];
}

id objc_msgSend_initWithDraw_erasableInsets_(void *a1, const char *a2, ...)
{
  return [a1 initWithDraw:erasableInsets:];
}

id objc_msgSend_initWithDropOperation_(void *a1, const char *a2, ...)
{
  return [a1 initWithDropOperation];
}

id objc_msgSend_initWithDuration_controlPoint1_controlPoint2_animations_(void *a1, const char *a2, ...)
{
  return [a1 initWithDuration:controlPoint1:controlPoint2:animations:];
}

id objc_msgSend_initWithDuration_curve_animations_(void *a1, const char *a2, ...)
{
  return [a1 initWithDuration:curve:animations:];
}

id objc_msgSend_initWithDuration_timingParameters_(void *a1, const char *a2, ...)
{
  return [a1 initWithDuration:timingParameters:];
}

id objc_msgSend_initWithDynamicValue_observer_(void *a1, const char *a2, ...)
{
  return [a1 initWithDynamicValue:observer:];
}

id objc_msgSend_initWithDynamicValue_value_observer_(void *a1, const char *a2, ...)
{
  return [a1 initWithDynamicValue:value:observer:];
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return [a1 initWithEffect:];
}

id objc_msgSend_initWithEntry_bindings_template_(void *a1, const char *a2, ...)
{
  return [a1 initWithEntry:bindings:template:];
}

id objc_msgSend_initWithEntry_submodels_config_impressions_linkEntities_hoverRegions_identifierMap_layoutQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntry:submodels:config:impressions:linkEntities:hoverRegions:identifierMap:layoutQueue:");
}

id objc_msgSend_initWithEntry_title_(void *a1, const char *a2, ...)
{
  return [a1 initWithEntry:title:];
}

id objc_msgSend_initWithEnumerator_binding_array_context_transactionCoordinator_dynamicController_nodes_snapshot_options_flags_builderClass_(void *a1, const char *a2, ...)
{
  return [a1 initWithEnumerator:v1 binding:v2 array:v3 context:v4 transactionCoordinator:v5 dynamicController:v6 nodes:v7 snapshot:v8 options:v9 flags:v10 builderClass:v11];
}

id objc_msgSend_initWithEnumerator_binding_value_context_transactionCoordinator_dynamicController_nodes_snapshot_flags_builderClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnumerator:binding:value:context:transactionCoordinator:dynamicController:nodes:snapshot:flags:builderClass:");
}

id objc_msgSend_initWithEqualColumnCount_gapFraction_(void *a1, const char *a2, ...)
{
  return [a1 initWithEqualColumnCount:gapFraction:];
}

id objc_msgSend_initWithErrors_(void *a1, const char *a2, ...)
{
  return [a1 initWithErrors:];
}

id objc_msgSend_initWithEvaluationContext_accessibilityContainer_(void *a1, const char *a2, ...)
{
  return [a1 initWithEvaluationContext:accessibilityContainer:];
}

id objc_msgSend_initWithEventCase_mode_isMuted_isPlaying_mediaTimePlayed_mediaDuration_mediaId_(void *a1, const char *a2, ...)
{
  return [a1 initWithEventCase:mode:isMuted:isPlaying:mediaTimePlayed:mediaDuration:mediaId:];
}

id objc_msgSend_initWithFeed_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeed:];
}

id objc_msgSend_initWithFeedEntry_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeedEntry:];
}

id objc_msgSend_initWithFeedId_delegate_tracker_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeedId:delegate:tracker:queue:];
}

id objc_msgSend_initWithFeedId_delegate_viewController_manager_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeedId:delegate:viewController:manager:];
}

id objc_msgSend_initWithFeedId_environment_factory_manager_renderMode_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeedId:environment:factory:manager:renderMode:];
}

id objc_msgSend_initWithFeedId_layoutQueueContext_delegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeedId:layoutQueueContext:delegate:];
}

id objc_msgSend_initWithFeedId_queue_viewResolver_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeedId:queue:viewResolver:];
}

id objc_msgSend_initWithFeedId_section_controller_entry_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeedId:section:controller:entry:];
}

id objc_msgSend_initWithFeedId_transactions_options_flags_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeedId:transactions:options:flags:];
}

id objc_msgSend_initWithFetchRequest_managedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithFetchRequest:managedObjectContext:];
}

id objc_msgSend_initWithFetchRequest_managedObjectContext_sectionNameKeyPath_cacheName_(void *a1, const char *a2, ...)
{
  return [a1 initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:];
}

id objc_msgSend_initWithFetchWindow_fetchInitial_fetchDelta_fetchPadding_uniqueID_(void *a1, const char *a2, ...)
{
  return [a1 initWithFetchWindow:fetchInitial:fetchDelta:fetchPadding:uniqueID:];
}

id objc_msgSend_initWithFilter_naturalSize_contentsScale_(void *a1, const char *a2, ...)
{
  return [a1 initWithFilter:naturalSize:contentsScale:];
}

id objc_msgSend_initWithFirst_second_(void *a1, const char *a2, ...)
{
  return [a1 initWithFirst:second:];
}

id objc_msgSend_initWithFontSpec_style_color_alignment_writingDirection_language_shouldHyphenate_service_(void *a1, const char *a2, ...)
{
  return [a1 initWithFontSpec:style:color:alignment:writingDirection:language:shouldHyphenate:service:];
}

id objc_msgSend_initWithFontSpec_style_color_textAlignment_(void *a1, const char *a2, ...)
{
  return [a1 initWithFontSpec:style:color:textAlignment:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:arguments:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithFrom_to_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrom:to:];
}

id objc_msgSend_initWithFrom_to_reuseTypes_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrom:to:reuseTypes:];
}

id objc_msgSend_initWithFrom_to_viewState_updates_changes_layoutQueue_flags_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrom:to:viewState:updates:changes:layoutQueue:flags:];
}

id objc_msgSend_initWithGeneration_count_transaction_(void *a1, const char *a2, ...)
{
  return [a1 initWithGeneration:count:transaction:];
}

id objc_msgSend_initWithGroup_(void *a1, const char *a2, ...)
{
  return [a1 initWithGroup:];
}

id objc_msgSend_initWithHeight_widthPadding_alignmentRectInsets_(void *a1, const char *a2, ...)
{
  return [a1 initWithHeight:widthPadding:alignmentRectInsets:];
}

id objc_msgSend_initWithID_(void *a1, const char *a2, ...)
{
  return [a1 initWithID:];
}

id objc_msgSend_initWithIdentifier_boxType_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:boxType:];
}

id objc_msgSend_initWithIdentifier_hostingController_item_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:hostingController:item:];
}

id objc_msgSend_initWithIdentifier_hostingController_viewVisibilityController_view_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:hostingController:viewVisibilityController:view:");
}

id objc_msgSend_initWithIdentifier_image_size_renderMode_alignmentRectInsets_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:image:size:renderMode:alignmentRectInsets:];
}

id objc_msgSend_initWithIdentifier_linkEntities_size_center_transform_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:linkEntities:size:center:transform:];
}

id objc_msgSend_initWithIdentifier_parent_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:parent:];
}

id objc_msgSend_initWithIdentifier_size_content_contentOrigin_contentErasableInsets_overlay_overlayOrigin_padding_gradientWidth_layoutDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:");
}

id objc_msgSend_initWithIdentifier_size_requestedSize_usingGeometry_insets_hostingIdentifier_hostingProperties_anchorPoint_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:size:requestedSize:usingGeometry:insets:hostingIdentifier:hostingProperties:anchorPoint:];
}

id objc_msgSend_initWithIdentifier_submodel_focusStyle_actionHandler_linkEntities_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:submodel:focusStyle:actionHandler:linkEntities:];
}

id objc_msgSend_initWithIdentifier_submodel_hostingIdentifier_hostingProperties_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:submodel:hostingIdentifier:hostingProperties:];
}

id objc_msgSend_initWithIdentifier_submodel_hoverIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:submodel:hoverIdentifier:];
}

id objc_msgSend_initWithIdentifier_urlString_baseURL_size_renderMode_alignmentRectInsets_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:urlString:baseURL:size:renderMode:alignmentRectInsets:];
}

id objc_msgSend_initWithIdentifier_view_flags_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:view:flags:];
}

id objc_msgSend_initWithIdentifierMap_embeddedIdentifierMaps_embeddedUpdateControllerMap_embeddedUUIDMap_environment_uid_UUID_entry_layoutQueue_renderMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifierMap:embeddedIdentifierMaps:embeddedUpdateControllerMap:embeddedUUIDMap:environment:uid:UUID:entry:layoutQueue:renderMode:");
}

id objc_msgSend_initWithIdentifiers_added_removed_identifierNodeMap_attributesMap_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifiers:added:removed:identifierNodeMap:attributesMap:];
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:];
}

id objc_msgSend_initWithImage_contentInsets_isMulticolor_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:contentInsets:isMulticolor:];
}

id objc_msgSend_initWithImage_insets_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:insets:];
}

id objc_msgSend_initWithImage_insets_intrinsicSize_flags_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:insets:intrinsicSize:flags:];
}

id objc_msgSend_initWithImage_surface_contentsScale_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:surface:contentsScale:];
}

id objc_msgSend_initWithImageResources_assertion_assertionQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithImageResources:assertion:assertionQueue:];
}

id objc_msgSend_initWithIndexes_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithIndexes:length:];
}

id objc_msgSend_initWithIndexes_map_(void *a1, const char *a2, ...)
{
  return [a1 initWithIndexes:map:];
}

id objc_msgSend_initWithInstance_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithInstance:options:];
}

id objc_msgSend_initWithIntrinsicSize_flags_(void *a1, const char *a2, ...)
{
  return [a1 initWithIntrinsicSize:flags:];
}

id objc_msgSend_initWithIsOn_(void *a1, const char *a2, ...)
{
  return [a1 initWithIsOn:];
}

id objc_msgSend_initWithItemType_identifier_imageModelIDToResource_actionHandler_title_attributedTitle_image_enabled_buttonType_buttonRole_width_minWidth_maxWidth_text_searchTextMaxLength_placeholderText_keyboardAppearance_navigationBarBackgroundOpacity_observeTrigger_observeTriggerValue_ignoreInsetsForOpacityTrigger_menu_subview_axAttributes_refId_refInstance_hostingIdentifiers_hostingProperties_(void *a1, const char *a2, ...)
{
  return [self initWithItemType:a1 identifier:a2 imageModelIDToResource:a3 actionHandler:a4 title:a5 attributedTitle:a6 image:a7 enabled:a8 buttonType:a9 buttonRole:a10 width:a11 minWidth:a12 maxWidth:a13 text:a14 searchTextMaxLength:a15 placeholderText:a16 keyboardAppearance:a17 navigationBarBackgroundOpacity:a18 observeTrigger:a19 observeTriggerValue:a20 ignoreInsetsForOpacityTrigger:a21 menu:a22 subview:a23 axAttributes:a24 refId:a25 refInstance:a26 hostingIdentifiers:a27 hostingProperties:a28];
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return [a1 initWithItems:];
}

id objc_msgSend_initWithKeyOptions_valueOptions_capacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithKeyOptions:valueOptions:capacity:];
}

id objc_msgSend_initWithKind_instancesMap_(void *a1, const char *a2, ...)
{
  return [a1 initWithKind:instancesMap:];
}

id objc_msgSend_initWithLastTimestamp_timestamp_rootNode_(void *a1, const char *a2, ...)
{
  return [a1 initWithLastTimestamp:timestamp:rootNode:];
}

id objc_msgSend_initWithLayer_(void *a1, const char *a2, ...)
{
  return [a1 initWithLayer:];
}

id objc_msgSend_initWithLayout_(void *a1, const char *a2, ...)
{
  return [a1 initWithLayout:];
}

id objc_msgSend_initWithLayout_baselineOffset_intrinsic_charIndex_(void *a1, const char *a2, ...)
{
  return [a1 initWithLayout:baselineOffset:intrinsic:charIndex:];
}

id objc_msgSend_initWithLayout_children_(void *a1, const char *a2, ...)
{
  return [a1 initWithLayout:children:];
}

id objc_msgSend_initWithLayout_contentsScale_(void *a1, const char *a2, ...)
{
  return [a1 initWithLayout:contentsScale:];
}

id objc_msgSend_initWithLayout_spacing_maxWidth_(void *a1, const char *a2, ...)
{
  return [a1 initWithLayout:spacing:maxWidth:];
}

id objc_msgSend_initWithLayoutQueue_renderModel_(void *a1, const char *a2, ...)
{
  return [a1 initWithLayoutQueue:renderModel:];
}

id objc_msgSend_initWithLeading_trailing_top_bottom_(void *a1, const char *a2, ...)
{
  return [a1 initWithLeading:trailing:top:bottom:];
}

id objc_msgSend_initWithLoader_filters_customImageBundle_(void *a1, const char *a2, ...)
{
  return [a1 initWithLoader:filters:customImageBundle:];
}

id objc_msgSend_initWithMap_(void *a1, const char *a2, ...)
{
  return [a1 initWithMap:];
}

id objc_msgSend_initWithMap_identifiers_(void *a1, const char *a2, ...)
{
  return [a1 initWithMap:identifiers:];
}

id objc_msgSend_initWithMap_order_(void *a1, const char *a2, ...)
{
  return [a1 initWithMap:order:];
}

id objc_msgSend_initWithMap_refIdMap_(void *a1, const char *a2, ...)
{
  return [a1 initWithMap:refIdMap:];
}

id objc_msgSend_initWithMap_reuseTypes_(void *a1, const char *a2, ...)
{
  return [a1 initWithMap:reuseTypes:];
}

id objc_msgSend_initWithMemoryCapacity_diskCapacity_diskPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithMemoryCapacity:diskCapacity:diskPath:];
}

id objc_msgSend_initWithMode_(void *a1, const char *a2, ...)
{
  return [a1 initWithMode:];
}

id objc_msgSend_initWithMode_amount_(void *a1, const char *a2, ...)
{
  return [a1 initWithMode:amount:];
}

id objc_msgSend_initWithMode_timingCollector_passes_(void *a1, const char *a2, ...)
{
  return [a1 initWithMode:timingCollector:passes:];
}

id objc_msgSend_initWithMode_uid_(void *a1, const char *a2, ...)
{
  return [a1 initWithMode:uid:];
}

id objc_msgSend_initWithModel_(void *a1, const char *a2, ...)
{
  return [a1 initWithModel:];
}

id objc_msgSend_initWithModel_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithModel:identifier:];
}

id objc_msgSend_initWithModel_parent_controller_(void *a1, const char *a2, ...)
{
  return [a1 initWithModel:parent:controller:];
}

id objc_msgSend_initWithModel_path_renderIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithModel:path:renderIdentifier:];
}

id objc_msgSend_initWithModels_(void *a1, const char *a2, ...)
{
  return [a1 initWithModels:];
}

id objc_msgSend_initWithModels_tracker_(void *a1, const char *a2, ...)
{
  return [a1 initWithModels:tracker:];
}

id objc_msgSend_initWithMuteState_(void *a1, const char *a2, ...)
{
  return [a1 initWithMuteState:];
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:];
}

id objc_msgSend_initWithName_closure_basedOn_context_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:closure:basedOn:context:];
}

id objc_msgSend_initWithName_configuration_style_contentsScale_layoutDirection_renderingMode_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:configuration:style:contentsScale:layoutDirection:renderingMode:];
}

id objc_msgSend_initWithName_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:identifier:];
}

id objc_msgSend_initWithName_observationMode_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:observationMode:];
}

id objc_msgSend_initWithName_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:options:];
}

id objc_msgSend_initWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:reason:userInfo:];
}

id objc_msgSend_initWithName_target_selector_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:target:selector:];
}

id objc_msgSend_initWithName_trigger_refId_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:trigger:refId:];
}

id objc_msgSend_initWithNavigationItems_(void *a1, const char *a2, ...)
{
  return [a1 initWithNavigationItems:];
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return [a1 initWithNibName:nil bundle:nil];
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithOptions_capacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithOptions:capacity:];
}

id objc_msgSend_initWithOther_(void *a1, const char *a2, ...)
{
  return [a1 initWithOther:];
}

id objc_msgSend_initWithPackage_(void *a1, const char *a2, ...)
{
  return [a1 initWithPackage:];
}

id objc_msgSend_initWithPackage_feedId_manager_transactionCoordinator_state_identifierMap_entry_environment_instantiateDelegate_actionDelegate_queue_renderMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPackage:feedId:manager:transactionCoordinator:state:identifierMap:entry:environment:instantiateDelegate:actionDelegate:queue:renderMode:");
}

id objc_msgSend_initWithPackage_url_rootElementNode_(void *a1, const char *a2, ...)
{
  return [a1 initWithPackage:url:rootElementNode:];
}

id objc_msgSend_initWithParagraphStyle_columnStyle_alignmentForNaturalAlignment_naturalDirection_(void *a1, const char *a2, ...)
{
  return [a1 initWithParagraphStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:];
}

id objc_msgSend_initWithParent_(void *a1, const char *a2, ...)
{
  return [a1 initWithParent:];
}

id objc_msgSend_initWithParsedElement_closureAndCapture_(void *a1, const char *a2, ...)
{
  return [a1 initWithParsedElement:closureAndCapture:];
}

id objc_msgSend_initWithPath_retinaScale_(void *a1, const char *a2, ...)
{
  return [a1 initWithPath:retinaScale:];
}

id objc_msgSend_initWithPath_retinaScale_fileProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithPath:retinaScale:fileProvider:];
}

id objc_msgSend_initWithPath_retinaScale_rootLayer_publishedObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithPath:retinaScale:rootLayer:publishedObjects:];
}

id objc_msgSend_initWithPolicy_view_host_uuid_uid_(void *a1, const char *a2, ...)
{
  return [a1 initWithPolicy:view:host:uuid:uid:];
}

id objc_msgSend_initWithPosition_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithPosition:identifier:];
}

id objc_msgSend_initWithPresentation_flags_arrowDirection_groupIdentifier_groupPriority_designatedIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithPresentation:flags:arrowDirection:groupIdentifier:groupPriority:designatedIdentifier:];
}

id objc_msgSend_initWithProtocolClasses_(void *a1, const char *a2, ...)
{
  return [a1 initWithProtocolClasses:];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithQueue_interests_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:interests:];
}

id objc_msgSend_initWithRating_backgroundImageName_foregroundImageName_direction_color_startColor_backgroundColor_starWidth_starPadding_(void *a1, const char *a2, ...)
{
  return [a1 initWithRating:backgroundImageName:foregroundImageName:direction:color:startColor:backgroundColor:starWidth:starPadding:];
}

id objc_msgSend_initWithRef_context_(void *a1, const char *a2, ...)
{
  return [a1 initWithRef:context:];
}

id objc_msgSend_initWithRefId_style_(void *a1, const char *a2, ...)
{
  return [a1 initWithRefId:style:];
}

id objc_msgSend_initWithRefId_trigger_(void *a1, const char *a2, ...)
{
  return [a1 initWithRefId:trigger:];
}

id objc_msgSend_initWithRegistry_(void *a1, const char *a2, ...)
{
  return [a1 initWithRegistry:];
}

id objc_msgSend_initWithRenderModel_hostingViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithRenderModel:hostingViewController:];
}

id objc_msgSend_initWithRenderModel_timeout_(void *a1, const char *a2, ...)
{
  return [a1 initWithRenderModel:timeout:];
}

id objc_msgSend_initWithRenderer_(void *a1, const char *a2, ...)
{
  return [a1 initWithRenderer:];
}

id objc_msgSend_initWithRequestedSize_layoutSize_erasableInsets_(void *a1, const char *a2, ...)
{
  return [a1 initWithRequestedSize:layoutSize:erasableInsets:];
}

id objc_msgSend_initWithResource_kind_instance_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithResource:kind:instance:options:];
}

id objc_msgSend_initWithResource_kind_naturalSize_contentsScale_instance_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithResource:kind:naturalSize:contentsScale:instance:options:];
}

id objc_msgSend_initWithResource_priority_(void *a1, const char *a2, ...)
{
  return [a1 initWithResource:priority:];
}

id objc_msgSend_initWithResourceLoader_(void *a1, const char *a2, ...)
{
  return [a1 initWithResourceLoader:];
}

id objc_msgSend_initWithResponse_data_(void *a1, const char *a2, ...)
{
  return [a1 initWithResponse:data:];
}

id objc_msgSend_initWithReuseIdentifier_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithReuseIdentifier:identifier];
}

id objc_msgSend_initWithReuseIdentifier_identifier_elementStates_actionHandler_viewState_enabled_name_editingInsets_style_placeholderText_text_returnKey_keyboardAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKey:keyboardAppearance:");
}

id objc_msgSend_initWithReuseIdentifier_identifier_elementStates_actionHandler_viewState_enabled_name_editingInsets_style_placeholderText_text_returnKey_keyboardAppearance_cancelText_showCancel_(void *a1, const char *a2, ...)
{
  return [a1 initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKey:keyboardAppearance:cancelText:showCancel:];
}

id objc_msgSend_initWithReuseIdentifier_identifier_elementStates_actionHandler_viewState_enabled_name_editingInsets_style_placeholderText_text_returnKeyType_keyboardAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:");
}

id objc_msgSend_initWithReuseIdentifier_identifier_elementStates_actionHandler_viewState_enabled_name_editingInsets_style_placeholderText_text_returnKeyType_keyboardAppearance_cancelText_showCancel_(void *a1, const char *a2, ...)
{
  return [a1 initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:cancelText:showCancel:];
}

id objc_msgSend_initWithReuseIdentifier_identifier_elementStates_actionHandler_viewState_enabled_name_rating_direction_color_startColor_backgroundColor_backgroundImageName_foregroundImageName_starWidth_starPadding_(void *a1, const char *a2, ...)
{
  return [a1 initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:rating:direction:color:startColor:backgroundColor:backgroundImageName:foregroundImageName:starWidth:starPadding:];
}

id objc_msgSend_initWithReuseIdentifier_identifier_elementStates_actionHandler_viewState_enabled_name_selectIndex_segments_tintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:selectIndex:segments:tintColor:");
}

id objc_msgSend_initWithReuseIdentifier_identifier_elementStates_actionHandler_viewState_enabled_name_title_isOn_(void *a1, const char *a2, ...)
{
  return [a1 initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:title:isOn:];
}

id objc_msgSend_initWithReuseIdentifier_identifier_style_elementStates_actionHandler_viewState_enabled_pressScale_touchInsets_(void *a1, const char *a2, ...)
{
  return [a1 initWithReuseIdentifier:identifier:style:elementStates:actionHandler:viewState:enabled:pressScale:touchInsets:];
}

id objc_msgSend_initWithReuseIdentifier_identifier_style_elementStates_imageModelIDToResource_actionHandler_viewState_enabled_pressScale_touchInsets_pointer_focusStyle_menu_name_(void *a1, const char *a2, ...)
{
  return [a1 initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:];
}

id objc_msgSend_initWithReuseIdentifier_identifier_style_stateToButtonAttributes_stateToRenderModel_imageModelIDToResource_actionHandler_viewState_linkEntities_type_role_userInterfaceStyle_enabled_pressScale_touchInsets_pointer_focusStyle_menu_contextMenuIsPrimaryAction_name_axAttributes_enableBackgroundForHighlightPreview_enableShadowForHighlightPreview_(void *a1, const char *a2, ...)
{
  return [a1 initWithReuseIdentifier:identifier style:stateToButtonAttributes:stateToRenderModel:imageModelIDToResource:actionHandler:viewState:linkEntities:type:role:userInterfaceStyle:enabled:pressScale:touchInsets:pointer:focusStyle:menu:contextMenuIsPrimaryAction:name:axAttributes:enableBackgroundForHighlightPreview:enableShadowForHighlightPreview:];
}

id objc_msgSend_initWithReuseIdentifier_identifier_submodel_(void *a1, const char *a2, ...)
{
  return [a1 initWithReuseIdentifier:identifier:submodel:];
}

id objc_msgSend_initWithReuseIdentifier_identifier_submodel_style_(void *a1, const char *a2, ...)
{
  return [a1 initWithReuseIdentifier:identifier:submodel:style:];
}

id objc_msgSend_initWithRole_(void *a1, const char *a2, ...)
{
  return [a1 initWithRole:];
}

id objc_msgSend_initWithRootProvider_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithRootProvider:queue:];
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithRootViewController:];
}

id objc_msgSend_initWithSearchControllerDelegate_hostingController_viewVisibilityController_(void *a1, const char *a2, ...)
{
  return [a1 initWithSearchControllerDelegate:hostingController:viewVisibilityController:];
}

id objc_msgSend_initWithSearchResultsController_(void *a1, const char *a2, ...)
{
  return [a1 initWithSearchResultsController:];
}

id objc_msgSend_initWithSectionCount_completion_(void *a1, const char *a2, ...)
{
  return [a1 initWithSectionCount:completion:];
}

id objc_msgSend_initWithSectionUpdates_model_(void *a1, const char *a2, ...)
{
  return [a1 initWithSectionUpdates:model:];
}

id objc_msgSend_initWithSelectIndex_(void *a1, const char *a2, ...)
{
  return [a1 initWithSelectIndex:];
}

id objc_msgSend_initWithSessionDataTask_(void *a1, const char *a2, ...)
{
  return [a1 initWithSessionDataTask:];
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return [a1 initWithSize:];
}

id objc_msgSend_initWithSize_columnSystem_(void *a1, const char *a2, ...)
{
  return [a1 initWithSize:columnSystem:];
}

id objc_msgSend_initWithSize_format_(void *a1, const char *a2, ...)
{
  return [a1 initWithSize:format:];
}

id objc_msgSend_initWithSize_transform_(void *a1, const char *a2, ...)
{
  return [a1 initWithSize:transform:];
}

id objc_msgSend_initWithSpec_(void *a1, const char *a2, ...)
{
  return [a1 initWithSpec:];
}

id objc_msgSend_initWithStackName_initialContentReadyEntryIndex_(void *a1, const char *a2, ...)
{
  return [a1 initWithStackName:initialContentReadyEntryIndex:];
}

id objc_msgSend_initWithStateToRenderModel_pressScale_touchInsets_identifier_pointer_scrollIdentifier_kind_(void *a1, const char *a2, ...)
{
  return [a1 initWithStateToRenderModel:pressScale:touchInsets:identifier:pointer:scrollIdentifier:kind:];
}

id objc_msgSend_initWithStats_uid_(void *a1, const char *a2, ...)
{
  return [a1 initWithStats:uid:];
}

id objc_msgSend_initWithStepStartTime_duration_renderModel_animatedKeyPaths_(void *a1, const char *a2, ...)
{
  return [a1 initWithStepStartTime:duration:renderModel:animatedKeyPaths:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:attributes:];
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyle:];
}

id objc_msgSend_initWithStyle_attributes_fragments_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyle:attributes:fragments:];
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyle:reuseIdentifier:];
}

id objc_msgSend_initWithStyleReference_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyleReference:];
}

id objc_msgSend_initWithStyler_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyler:];
}

id objc_msgSend_initWithSubmodel_(void *a1, const char *a2, ...)
{
  return [a1 initWithSubmodel:];
}

id objc_msgSend_initWithSubmodels_(void *a1, const char *a2, ...)
{
  return [a1 initWithSubmodels:];
}

id objc_msgSend_initWithSubmodels_config_erasableInsets_(void *a1, const char *a2, ...)
{
  return [a1 initWithSubmodels:config:erasableInsets:];
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:action:];
}

id objc_msgSend_initWithTemplate_bindings_actionObject_(void *a1, const char *a2, ...)
{
  return [a1 initWithTemplate:bindings:actionObject:];
}

id objc_msgSend_initWithTemplateURL_uuid_bindings_(void *a1, const char *a2, ...)
{
  return [a1 initWithTemplateURL:uuid:bindings:];
}

id objc_msgSend_initWithText_(void *a1, const char *a2, ...)
{
  return [a1 initWithText:];
}

id objc_msgSend_initWithThreshold_block_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithThreshold:block:queue:];
}

id objc_msgSend_initWithTime_flags_block_(void *a1, const char *a2, ...)
{
  return [a1 initWithTime:flags:block:];
}

id objc_msgSend_initWithTitle_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:];
}

id objc_msgSend_initWithTitle_image_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:image:];
}

id objc_msgSend_initWithTitle_imageModel_isEnabled_isOn_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:imageModel:isEnabled:isOn:action:];
}

id objc_msgSend_initWithTitle_imageModel_isInline_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:imageModel:isInline:];
}

id objc_msgSend_initWithTitle_imageModel_isInline_children_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:imageModel:isInline:children:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:style:target:action:];
}

id objc_msgSend_initWithTraitCollection_viewController_viewSize_windowSize_(void *a1, const char *a2, ...)
{
  return [a1 initWithTraitCollection:viewController:viewSize:windowSize:];
}

id objc_msgSend_initWithTransaction_(void *a1, const char *a2, ...)
{
  return [a1 initWithTransaction:];
}

id objc_msgSend_initWithTransaction_enumerator_(void *a1, const char *a2, ...)
{
  return [a1 initWithTransaction:enumerator:];
}

id objc_msgSend_initWithTrigger_actionData_actionObject_actionDelegate_controlIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithTrigger:actionData:actionObject:actionDelegate:controlIdentifier:];
}

id objc_msgSend_initWithTriggerStateUpdate_(void *a1, const char *a2, ...)
{
  return [a1 initWithTriggerStateUpdate:];
}

id objc_msgSend_initWithType_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:identifier:];
}

id objc_msgSend_initWithType_identifier_parameters_modelIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:identifier:parameters:modelIdentifier:];
}

id objc_msgSend_initWithType_identifier_requestedSize_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:identifier:requestedSize:];
}

id objc_msgSend_initWithType_identifier_title_actionsMap_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:identifier:title:actionsMap:];
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:];
}

id objc_msgSend_initWithURL_baseURL_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:baseURL:error:];
}

id objc_msgSend_initWithURL_fragments_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:fragments:];
}

id objc_msgSend_initWithURL_gravity_textKey_textValue_shouldStartAtEnd_triggerName_targetTriggerState_triggerDelay_contentScale_opacity_fontSpec_fileProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:gravity:textKey:textValue:shouldStartAtEnd:triggerName:targetTriggerState:triggerDelay:contentScale:opacity:fontSpec:fileProvider:];
}

id objc_msgSend_initWithURL_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:options:];
}

id objc_msgSend_initWithURL_packagesURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:packagesURL:];
}

id objc_msgSend_initWithURL_uid_reason_timingCollector_timeBase_eventCollector_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:uid:reason:timingCollector:timeBase:eventCollector:];
}

id objc_msgSend_initWithURL_videoId_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:videoId:];
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 initWithUTF8String:];
}

id objc_msgSend_initWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUID:];
}

id objc_msgSend_initWithUUID_identifier_data_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUID:identifier:data:];
}

id objc_msgSend_initWithUUID_indexPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUID:indexPath];
}

id objc_msgSend_initWithUUID_indexPath_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUID:indexPath:identifier];
}

id objc_msgSend_initWithUUID_indexes_identifiers_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUID:indexes:identifiers:];
}

id objc_msgSend_initWithUUID_uid_refId_refInstance_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUID:uid:refId:refInstance:];
}

id objc_msgSend_initWithUUID_value_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUID:value:];
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDBytes:];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initWithUpdateController_uid_UUID_(void *a1, const char *a2, ...)
{
  return [a1 initWithUpdateController:uid:UUID:];
}

id objc_msgSend_initWithUrl_posterFrameResource_videoId_loop_muted_allowFullScreen_autoPlay_showPlaybackControls_gravity_cornerRadius_topTriggerName_bottomTriggerName_leftTriggerName_rightTriggerName_actionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUrl:posterFrameResource:videoId:loop:muted:allowFullScreen:autoPlay:showPlaybackControls:gravity:cornerRadius:topTriggerName:bottomTriggerName:leftTriggerName:rightTriggerName:actionHandler:");
}

id objc_msgSend_initWithUrl_videoId_(void *a1, const char *a2, ...)
{
  return [a1 initWithUrl:videoId:];
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:];
}

id objc_msgSend_initWithValue_basedOn_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:basedOn:];
}

id objc_msgSend_initWithValue_kind_instance_parameters_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:kind:instance:parameters:];
}

id objc_msgSend_initWithValue_property_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:property:];
}

id objc_msgSend_initWithValue_transaction_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:transaction:];
}

id objc_msgSend_initWithValues_(void *a1, const char *a2, ...)
{
  return [a1 initWithValues:];
}

id objc_msgSend_initWithView_(void *a1, const char *a2, ...)
{
  return [a1 initWithView:];
}

id objc_msgSend_initWithView_completion_(void *a1, const char *a2, ...)
{
  return [a1 initWithView:completion:];
}

id objc_msgSend_initWithView_options_kind_block_(void *a1, const char *a2, ...)
{
  return [a1 initWithView:options:kind:block:];
}

id objc_msgSend_initWithView_parameters_(void *a1, const char *a2, ...)
{
  return [a1 initWithView:parameters:];
}

id objc_msgSend_initWithView_parameters_target_(void *a1, const char *a2, ...)
{
  return [a1 initWithView:parameters:target:];
}

id objc_msgSend_initWithView_scrollView_(void *a1, const char *a2, ...)
{
  return [a1 initWithView:scrollView:];
}

id objc_msgSend_initWithViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithViewController:];
}

id objc_msgSend_initWithViewController_viewSize_windowSize_(void *a1, const char *a2, ...)
{
  return [a1 initWithViewController:viewSize:windowSize:];
}

id objc_msgSend_initWithViewSize_traitCollection_(void *a1, const char *a2, ...)
{
  return [a1 initWithViewSize:traitCollection:];
}

id objc_msgSend_initWithViewState_(void *a1, const char *a2, ...)
{
  return [a1 initWithViewState:];
}

id objc_msgSend_initWithViewStateMapping_(void *a1, const char *a2, ...)
{
  return [a1 initWithViewStateMapping:];
}

id objc_msgSend_initWithWidth_height_box_(void *a1, const char *a2, ...)
{
  return [a1 initWithWidth:height:box:];
}

id objc_msgSend_initWithWillUpdateValue_didUpdateValue_(void *a1, const char *a2, ...)
{
  return [a1 initWithWillUpdateValue:didUpdateValue:];
}

id objc_msgSend_initialContentReadyDate(void *a1, const char *a2, ...)
{
  return _[a1 initialContentReadyDate];
}

id objc_msgSend_initialContentReadyEntryIndex(void *a1, const char *a2, ...)
{
  return _[a1 initialContentReadyEntryIndex];
}

id objc_msgSend_initialLayoutStartDate(void *a1, const char *a2, ...)
{
  return _[a1 initialLayoutStartDate];
}

id objc_msgSend_initialResourcesRenderedDate(void *a1, const char *a2, ...)
{
  return _[a1 initialResourcesRenderedDate];
}

id objc_msgSend_initialVelocity(void *a1, const char *a2, ...)
{
  return _[a1 initialVelocity];
}

id objc_msgSend_insertAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertAtIndex:];
}

id objc_msgSend_insertAttachmentOrFootnote_range_(void *a1, const char *a2, ...)
{
  return [a1 insertAttachmentOrFootnote:range:];
}

id objc_msgSend_insertItemAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertItemAtIndex:];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertObject:atIndex:];
}

id objc_msgSend_insertSections_(void *a1, const char *a2, ...)
{
  return [a1 insertSections:];
}

id objc_msgSend_insertSegmentWithTitle_atIndex_animated_(void *a1, const char *a2, ...)
{
  return [a1 insertSegmentWithTitle:atIndex:animated:];
}

id objc_msgSend_insertString_atCharIndex_undoTransaction_(void *a1, const char *a2, ...)
{
  return [a1 insertString:atCharIndex:undoTransaction:];
}

id objc_msgSend_insertSublayer_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertSublayer:atIndex:];
}

id objc_msgSend_insertSublayer_below_(void *a1, const char *a2, ...)
{
  return [a1 insertSublayer:below:];
}

id objc_msgSend_insertSubview_aboveSubview_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:aboveSubview:];
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:atIndex:];
}

id objc_msgSend_insertSubview_belowSubview_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:belowSubview:];
}

id objc_msgSend_inserts(void *a1, const char *a2, ...)
{
  return _[a1 inserts];
}

id objc_msgSend_insets(void *a1, const char *a2, ...)
{
  return _[a1 insets];
}

id objc_msgSend_insetsForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 insetsForAttribute:node:];
}

id objc_msgSend_insetsForAttribute_withDefault_node_(void *a1, const char *a2, ...)
{
  return [a1 insetsForAttribute:withDefault:node:];
}

id objc_msgSend_insetsForSize_contentsScale_options_(void *a1, const char *a2, ...)
{
  return [a1 insetsForSize:contentsScale:options:];
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return _[a1 instance];
}

id objc_msgSend_instanceForObserver_(void *a1, const char *a2, ...)
{
  return [a1 instanceForObserver:];
}

id objc_msgSend_instancesRespondToSelector_(void *a1, const char *a2, ...)
{
  return [a1 instancesRespondToSelector:];
}

id objc_msgSend_instantiateAnimationReference_(void *a1, const char *a2, ...)
{
  return [a1 instantiateAnimationReference:];
}

id objc_msgSend_instantiateAsBinding_options_flags_builderClass_nodes_snapshot_context_(void *a1, const char *a2, ...)
{
  return [a1 instantiateAsBinding:options:flags:builderClass:nodes:snapshot:context:];
}

id objc_msgSend_instantiateAsEnumerator_options_flags_builderClass_nodes_snapshot_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instantiateAsEnumerator:options:flags:builderClass:nodes:snapshot:context:");
}

id objc_msgSend_instantiateBinding_withDynamicProvider_childrenOfNode_(void *a1, const char *a2, ...)
{
  return [a1 instantiateBinding:withDynamicProvider:childrenOfNode:];
}

id objc_msgSend_instantiateCaptureForEntry_(void *a1, const char *a2, ...)
{
  return [a1 instantiateCaptureForEntry:];
}

id objc_msgSend_instantiateChildren(void *a1, const char *a2, ...)
{
  return _[a1 instantiateChildren];
}

id objc_msgSend_instantiateChildrenOfNode_object_builder_context_block_(void *a1, const char *a2, ...)
{
  return [a1 instantiateChildrenOfNode:object:builder:context:block:];
}

id objc_msgSend_instantiateChildrenOfNode_object_containingBuilder_context_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instantiateChildrenOfNode:object:containingBuilder:context:block:");
}

id objc_msgSend_instantiateComponentWithReference_withChildrenOfNode_(void *a1, const char *a2, ...)
{
  return [a1 instantiateComponentWithReference:withChildrenOfNode:];
}

id objc_msgSend_instantiateContext(void *a1, const char *a2, ...)
{
  return _[a1 instantiateContext];
}

id objc_msgSend_instantiateContext_serviceConformingToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 instantiateContext:serviceConformingToProtocol:];
}

id objc_msgSend_instantiateElementReference_withChildrenOfNode_(void *a1, const char *a2, ...)
{
  return [a1 instantiateElementReference:withChildrenOfNode:];
}

id objc_msgSend_instantiateEnumerator_withChildrenOfNode_options_(void *a1, const char *a2, ...)
{
  return [a1 instantiateEnumerator:withChildrenOfNode:options:];
}

id objc_msgSend_instantiateNamedElementReference_(void *a1, const char *a2, ...)
{
  return [a1 instantiateNamedElementReference:];
}

id objc_msgSend_instantiateNode_withBuilder_(void *a1, const char *a2, ...)
{
  return [a1 instantiateNode:withBuilder:];
}

id objc_msgSend_instantiateNode_withObject_context_(void *a1, const char *a2, ...)
{
  return [a1 instantiateNode:withObject:context:];
}

id objc_msgSend_instantiateRender_withChildrenOfNode_(void *a1, const char *a2, ...)
{
  return [a1 instantiateRender:withChildrenOfNode:];
}

id objc_msgSend_instantiateResult(void *a1, const char *a2, ...)
{
  return _[a1 instantiateResult];
}

id objc_msgSend_instantiateTemplate_bindings_actionObject_(void *a1, const char *a2, ...)
{
  return [a1 instantiateTemplate:bindings:actionObject:];
}

id objc_msgSend_instantiateWithContext_(void *a1, const char *a2, ...)
{
  return [a1 instantiateWithContext:];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_intValueForProperty_(void *a1, const char *a2, ...)
{
  return [a1 intValueForProperty:];
}

id objc_msgSend_integerForAttribute_withDefault_node_(void *a1, const char *a2, ...)
{
  return [a1 integerForAttribute:withDefault:node:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interactionBuilder(void *a1, const char *a2, ...)
{
  return _[a1 interactionBuilder];
}

id objc_msgSend_interactionForLinkEntity_(void *a1, const char *a2, ...)
{
  return [a1 interactionForLinkEntity:];
}

id objc_msgSend_interactions(void *a1, const char *a2, ...)
{
  return _[a1 interactions];
}

id objc_msgSend_interfaceLayoutDirectionFromString_(void *a1, const char *a2, ...)
{
  return [a1 interfaceLayoutDirectionFromString:];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return [a1 intersectSet:];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_intrinsicHeight(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicHeight];
}

id objc_msgSend_intrinsicImageResourceForInstance_options_(void *a1, const char *a2, ...)
{
  return [a1 intrinsicImageResourceForInstance:options:];
}

id objc_msgSend_intrinsicImageResourceForKind_instance_options_(void *a1, const char *a2, ...)
{
  return [a1 intrinsicImageResourceForKind:instance:options:];
}

id objc_msgSend_intrinsicSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicSize];
}

id objc_msgSend_intrinsicWidth(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicWidth];
}

id objc_msgSend_invalidChildren(void *a1, const char *a2, ...)
{
  return _[a1 invalidChildren];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAuxiliaryRenderModel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAuxiliaryRenderModel];
}

id objc_msgSend_invalidateCachedRenderModelForLayout_(void *a1, const char *a2, ...)
{
  return [a1 invalidateCachedRenderModelForLayout:];
}

id objc_msgSend_invalidateChildren_(void *a1, const char *a2, ...)
{
  return [a1 invalidateChildren:];
}

id objc_msgSend_invalidateColors(void *a1, const char *a2, ...)
{
  return _[a1 invalidateColors];
}

id objc_msgSend_invalidateIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 invalidateIndexPath:];
}

id objc_msgSend_invalidateIndexPaths_(void *a1, const char *a2, ...)
{
  return [a1 invalidateIndexPaths:];
}

id objc_msgSend_invalidateInstantiation_(void *a1, const char *a2, ...)
{
  return [a1 invalidateInstantiation];
}

id objc_msgSend_invalidateIntrinsicSize(void *a1, const char *a2, ...)
{
  return _[a1 invalidateIntrinsicSize];
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return _[a1 invalidateLayout];
}

id objc_msgSend_invalidateLayout_(void *a1, const char *a2, ...)
{
  return [a1 invalidateLayout:];
}

id objc_msgSend_invalidatePendingScrolls(void *a1, const char *a2, ...)
{
  return _[a1 invalidatePendingScrolls];
}

id objc_msgSend_invalidateRenderModel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateRenderModel];
}

id objc_msgSend_invalidateRenderOverride_flags_feedView_uids_(void *a1, const char *a2, ...)
{
  return [a1 invalidateRenderOverride:flags:feedView:uids:];
}

id objc_msgSend_invalidateRenderReferenceOverride_(void *a1, const char *a2, ...)
{
  return [a1 invalidateRenderReferenceOverride:];
}

id objc_msgSend_invalidateShowContents(void *a1, const char *a2, ...)
{
  return _[a1 invalidateShowContents];
}

id objc_msgSend_invalidateViewAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 invalidateViewAtIndexPath:];
}

id objc_msgSend_invalidateWithContext_(void *a1, const char *a2, ...)
{
  return [a1 invalidateWithContext:];
}

id objc_msgSend_invalidatedIndexPaths(void *a1, const char *a2, ...)
{
  return _[a1 invalidatedIndexPaths];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return _[a1 invoke];
}

id objc_msgSend_invoke_arguments_(void *a1, const char *a2, ...)
{
  return [a1 invoke:arguments:];
}

id objc_msgSend_invoke_view_(void *a1, const char *a2, ...)
{
  return [a1 invoke:view:];
}

id objc_msgSend_invoke_view_allowRefId_(void *a1, const char *a2, ...)
{
  return [a1 invoke:view:allowRefId:];
}

id objc_msgSend_invoke_view_allowRefId_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invoke:view:allowRefId:arguments:");
}

id objc_msgSend_invoke_view_point_allowRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invoke:view:point:allowRefId:");
}

id objc_msgSend_invoke_view_point_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invoke:view:point:completion:");
}

id objc_msgSend_invokeWithArguments_(void *a1, const char *a2, ...)
{
  return [a1 invokeWithArguments:];
}

id objc_msgSend_isAXElement(void *a1, const char *a2, ...)
{
  return _[a1 isAXElement];
}

id objc_msgSend_isAccessibilityElement(void *a1, const char *a2, ...)
{
  return _[a1 isAccessibilityElement];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 isAtEnd];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isBeingDismissed(void *a1, const char *a2, ...)
{
  return _[a1 isBeingDismissed];
}

id objc_msgSend_isBeingPresented(void *a1, const char *a2, ...)
{
  return _[a1 isBeingPresented];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isCommitted(void *a1, const char *a2, ...)
{
  return _[a1 isCommitted];
}

id objc_msgSend_isCommittedAndIfNotNotifyWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 isCommittedAndIfNotNotifyWithBlock:];
}

id objc_msgSend_isCompatibleWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 isCompatibleWithOptions:];
}

id objc_msgSend_isContentVisible(void *a1, const char *a2, ...)
{
  return _[a1 isContentVisible];
}

id objc_msgSend_isControl(void *a1, const char *a2, ...)
{
  return _[a1 isControl];
}

id objc_msgSend_isDecelerating(void *a1, const char *a2, ...)
{
  return _[a1 isDecelerating];
}

id objc_msgSend_isDefault(void *a1, const char *a2, ...)
{
  return _[a1 isDefault];
}

id objc_msgSend_isDescendantOfView_(void *a1, const char *a2, ...)
{
  return [a1 isDescendantOfView:];
}

id objc_msgSend_isDescendentOfLayout_(void *a1, const char *a2, ...)
{
  return [a1 isDescendentOfLayout:];
}

id objc_msgSend_isDeterminate(void *a1, const char *a2, ...)
{
  return _[a1 isDeterminate];
}

id objc_msgSend_isDragging(void *a1, const char *a2, ...)
{
  return _[a1 isDragging];
}

id objc_msgSend_isEditableControl(void *a1, const char *a2, ...)
{
  return _[a1 isEditableControl];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _[a1 isEditing];
}

id objc_msgSend_isEmptyLineFragmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 isEmptyLineFragmentAtIndex:];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEnabledWithRenderModel_(void *a1, const char *a2, ...)
{
  return [a1 isEnabledWithRenderModel:];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToArray:];
}

id objc_msgSend_isEqualToAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToAttributedString:];
}

id objc_msgSend_isEqualToConfig_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToConfig:];
}

id objc_msgSend_isEqualToConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToConfiguration:];
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDictionary:];
}

id objc_msgSend_isEqualToDraw_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDraw:];
}

id objc_msgSend_isEqualToEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToEnvironment:];
}

id objc_msgSend_isEqualToGeometry_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToGeometry:];
}

id objc_msgSend_isEqualToHandler_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToHandler:];
}

id objc_msgSend_isEqualToIndexSet_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToIndexSet:];
}

id objc_msgSend_isEqualToMap_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToMap:];
}

id objc_msgSend_isEqualToRenderModel_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToRenderModel:];
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToSet:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isEqualToStyle_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToStyle:];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isFocused(void *a1, const char *a2, ...)
{
  return _[a1 isFocused];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return _[a1 isHighlighted];
}

id objc_msgSend_isHorizontallyAligningChildren(void *a1, const char *a2, ...)
{
  return _[a1 isHorizontallyAligningChildren];
}

id objc_msgSend_isHovering(void *a1, const char *a2, ...)
{
  return _[a1 isHovering];
}

id objc_msgSend_isImageLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isImageLoaded];
}

id objc_msgSend_isImageLoading(void *a1, const char *a2, ...)
{
  return _[a1 isImageLoading];
}

id objc_msgSend_isInForeground(void *a1, const char *a2, ...)
{
  return _[a1 isInForeground];
}

id objc_msgSend_isLayout(void *a1, const char *a2, ...)
{
  return _[a1 isLayout];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isLoaded];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLowPowerModeEnabled];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isMonospacedDigitsSpecified(void *a1, const char *a2, ...)
{
  return _[a1 isMonospacedDigitsSpecified];
}

id objc_msgSend_isMulticolor(void *a1, const char *a2, ...)
{
  return _[a1 isMulticolor];
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return _[a1 isMuted];
}

id objc_msgSend_isObject(void *a1, const char *a2, ...)
{
  return _[a1 isObject];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return _[a1 isOn];
}

id objc_msgSend_isPlayable(void *a1, const char *a2, ...)
{
  return _[a1 isPlayable];
}

id objc_msgSend_isPlaybackAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 isPlaybackAtEnd];
}

id objc_msgSend_isPlaybackBufferEmpty(void *a1, const char *a2, ...)
{
  return _[a1 isPlaybackBufferEmpty];
}

id objc_msgSend_isPlaybackBufferFull(void *a1, const char *a2, ...)
{
  return _[a1 isPlaybackBufferFull];
}

id objc_msgSend_isPlaybackLikelyToKeepUp(void *a1, const char *a2, ...)
{
  return _[a1 isPlaybackLikelyToKeepUp];
}

id objc_msgSend_isPlaying(void *a1, const char *a2, ...)
{
  return _[a1 isPlaying];
}

id objc_msgSend_isPointSizeSpecified(void *a1, const char *a2, ...)
{
  return _[a1 isPointSizeSpecified];
}

id objc_msgSend_isPrimary(void *a1, const char *a2, ...)
{
  return _[a1 isPrimary];
}

id objc_msgSend_isReadyForDisplay(void *a1, const char *a2, ...)
{
  return _[a1 isReadyForDisplay];
}

id objc_msgSend_isReference(void *a1, const char *a2, ...)
{
  return _[a1 isReference];
}

id objc_msgSend_isRemovedOnCompletion(void *a1, const char *a2, ...)
{
  return _[a1 isRemovedOnCompletion];
}

id objc_msgSend_isRotating(void *a1, const char *a2, ...)
{
  return _[a1 isRotating];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return _[a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isStaticMenu(void *a1, const char *a2, ...)
{
  return _[a1 isStaticMenu];
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return [a1 isSubclassOfClass];
}

id objc_msgSend_isSymbolImage(void *a1, const char *a2, ...)
{
  return _[a1 isSymbolImage];
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return _[a1 isTracking];
}

id objc_msgSend_isTruncatedLineFragmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 isTruncatedLineFragmentAtIndex:];
}

id objc_msgSend_isUserInteractionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isUserInteractionEnabled];
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return [a1 isValidJSONObject:];
}

id objc_msgSend_isVerticallyAligningChildren(void *a1, const char *a2, ...)
{
  return _[a1 isVerticallyAligningChildren];
}

id objc_msgSend_isWeightSpecified(void *a1, const char *a2, ...)
{
  return _[a1 isWeightSpecified];
}

id objc_msgSend_isWithinVisibleBounds(void *a1, const char *a2, ...)
{
  return _[a1 isWithinVisibleBounds];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _[a1 item];
}

id objc_msgSend_itemIndex(void *a1, const char *a2, ...)
{
  return _[a1 itemIndex];
}

id objc_msgSend_itemType(void *a1, const char *a2, ...)
{
  return _[a1 itemType];
}

id objc_msgSend_itemTypeFromString_(void *a1, const char *a2, ...)
{
  return [a1 itemTypeFromString:];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_keyCommandWithInput_modifierFlags_action_(void *a1, const char *a2, ...)
{
  return [a1 keyCommandWithInput:modifierFlags:action:];
}

id objc_msgSend_keyCommands(void *a1, const char *a2, ...)
{
  return _[a1 keyCommands];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_keyPaths(void *a1, const char *a2, ...)
{
  return _[a1 keyPaths];
}

id objc_msgSend_keyboardAppearance(void *a1, const char *a2, ...)
{
  return _[a1 keyboardAppearance];
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 keysOfEntriesPassingTest:];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return _[a1 kind];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _[a1 language];
}

id objc_msgSend_largestResourceWithContentAndNaturalSize_contentsScale_(void *a1, const char *a2, ...)
{
  return [a1 largestResourceWithContentAndNaturalSize:contentsScale:];
}

id objc_msgSend_lastIndex(void *a1, const char *a2, ...)
{
  return _[a1 lastIndex];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastPlaybackTime(void *a1, const char *a2, ...)
{
  return _[a1 lastPlaybackTime];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layerClass(void *a1, const char *a2, ...)
{
  return _[a1 layerClass];
}

id objc_msgSend_layerClassForSize_(void *a1, const char *a2, ...)
{
  return [a1 layerClassForSize:];
}

id objc_msgSend_layerContents(void *a1, const char *a2, ...)
{
  return _[a1 layerContents];
}

id objc_msgSend_layerContentsGravityFromString_(void *a1, const char *a2, ...)
{
  return [a1 layerContentsGravityFromString:];
}

id objc_msgSend_layerRenderModel(void *a1, const char *a2, ...)
{
  return _[a1 layerRenderModel];
}

id objc_msgSend_layerUpdateController(void *a1, const char *a2, ...)
{
  return _[a1 layerUpdateController];
}

id objc_msgSend_layout(void *a1, const char *a2, ...)
{
  return _[a1 layout];
}

id objc_msgSend_layoutAncestor(void *a1, const char *a2, ...)
{
  return _[a1 layoutAncestor];
}

id objc_msgSend_layoutAttributes(void *a1, const char *a2, ...)
{
  return _[a1 layoutAttributes];
}

id objc_msgSend_layoutAttributesForImpressionAtIndexPath_snapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutAttributesForImpressionAtIndexPath:snapshot:");
}

id objc_msgSend_layoutAttributesForViewAtIndexPath_withLiveTransformResolver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutAttributesForViewAtIndexPath:withLiveTransformResolver:");
}

id objc_msgSend_layoutAttributesForViewModel_atIndexPath_withLiveTransformResolver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutAttributesForViewModel:atIndexPath:withLiveTransformResolver:");
}

id objc_msgSend_layoutClass(void *a1, const char *a2, ...)
{
  return _[a1 layoutClass];
}

id objc_msgSend_layoutContent_(void *a1, const char *a2, ...)
{
  return [a1 layoutContent:];
}

id objc_msgSend_layoutController(void *a1, const char *a2, ...)
{
  return _[a1 layoutController];
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 layoutDirection];
}

id objc_msgSend_layoutForModel_(void *a1, const char *a2, ...)
{
  return [a1 layoutForModel:];
}

id objc_msgSend_layoutGenerationId(void *a1, const char *a2, ...)
{
  return _[a1 layoutGenerationId];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutIfNeededWithTransaction_(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeededWithTransaction:];
}

id objc_msgSend_layoutIsInvalid(void *a1, const char *a2, ...)
{
  return _[a1 layoutIsInvalid];
}

id objc_msgSend_layoutManager(void *a1, const char *a2, ...)
{
  return _[a1 layoutManager];
}

id objc_msgSend_layoutMode(void *a1, const char *a2, ...)
{
  return _[a1 layoutMode];
}

id objc_msgSend_layoutModeFromString_(void *a1, const char *a2, ...)
{
  return [a1 layoutModeFromString:];
}

id objc_msgSend_layoutMultiColumnTextStorage_minSize_maxSize_anchor_pageNumber_pageCount_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:");
}

id objc_msgSend_layoutNonContentChildrenWithSize_(void *a1, const char *a2, ...)
{
  return [a1 layoutNonContentChildrenWithSize:];
}

id objc_msgSend_layoutPhase(void *a1, const char *a2, ...)
{
  return _[a1 layoutPhase];
}

id objc_msgSend_layoutScrollContentScrollSizeWithProposedSize_(void *a1, const char *a2, ...)
{
  return [a1 layoutScrollContentScrollSizeWithProposedSize:];
}

id objc_msgSend_layoutScrollContentShouldClipVertically(void *a1, const char *a2, ...)
{
  return _[a1 layoutScrollContentShouldClipVertically];
}

id objc_msgSend_layoutScrollGradientFraction(void *a1, const char *a2, ...)
{
  return _[a1 layoutScrollGradientFraction];
}

id objc_msgSend_layoutScrollGradientInsets(void *a1, const char *a2, ...)
{
  return _[a1 layoutScrollGradientInsets];
}

id objc_msgSend_layoutScrollPageGap(void *a1, const char *a2, ...)
{
  return _[a1 layoutScrollPageGap];
}

id objc_msgSend_layoutSize(void *a1, const char *a2, ...)
{
  return _[a1 layoutSize];
}

id objc_msgSend_layoutUpdateWindowRange_(void *a1, const char *a2, ...)
{
  return [a1 layoutUpdateWindowRange:];
}

id objc_msgSend_layouts(void *a1, const char *a2, ...)
{
  return _[a1 layouts];
}

id objc_msgSend_leading(void *a1, const char *a2, ...)
{
  return _[a1 leading];
}

id objc_msgSend_leftTriggerName(void *a1, const char *a2, ...)
{
  return _[a1 leftTriggerName];
}

id objc_msgSend_leftView(void *a1, const char *a2, ...)
{
  return _[a1 leftView];
}

id objc_msgSend_legibilityWeight(void *a1, const char *a2, ...)
{
  return _[a1 legibilityWeight];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 lengthForAttribute:node:];
}

id objc_msgSend_letDefinitionWithNameAttribute_valueAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 letDefinitionWithNameAttribute:valueAttribute:node:];
}

id objc_msgSend_lineFragmentRangeForLogicalLineIndex_(void *a1, const char *a2, ...)
{
  return [a1 lineFragmentRangeForLogicalLineIndex:];
}

id objc_msgSend_lineSpacing(void *a1, const char *a2, ...)
{
  return _[a1 lineSpacing];
}

id objc_msgSend_lineStylingWithLineCount_options_additionalCharacterStylePropertyMap_overrideCharacterStylePropertyMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lineStylingWithLineCount:options:additionalCharacterStylePropertyMap:overrideCharacterStylePropertyMap:");
}

id objc_msgSend_lines(void *a1, const char *a2, ...)
{
  return _[a1 lines];
}

id objc_msgSend_linkColor(void *a1, const char *a2, ...)
{
  return _[a1 linkColor];
}

id objc_msgSend_linkEntities(void *a1, const char *a2, ...)
{
  return _[a1 linkEntities];
}

id objc_msgSend_linkEntityController_visibleEntityReferencesWithAdded_removed_(void *a1, const char *a2, ...)
{
  return [a1 linkEntityController:visibleEntityReferencesWithAdded:removed:];
}

id objc_msgSend_liveAttributesForRenderModel_(void *a1, const char *a2, ...)
{
  return [a1 liveAttributesForRenderModel:];
}

id objc_msgSend_liveLayoutAttributesForRenderModel_(void *a1, const char *a2, ...)
{
  return [a1 liveLayoutAttributesForRenderModel:];
}

id objc_msgSend_liveTransform(void *a1, const char *a2, ...)
{
  return _[a1 liveTransform];
}

id objc_msgSend_liveTransformAncestorIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 liveTransformAncestorIdentifier];
}

id objc_msgSend_liveTransformFromString_(void *a1, const char *a2, ...)
{
  return [a1 liveTransformFromString];
}

id objc_msgSend_liveTransformKind(void *a1, const char *a2, ...)
{
  return _[a1 liveTransformKind];
}

id objc_msgSend_liveTransformViewInvalidationMap(void *a1, const char *a2, ...)
{
  return _[a1 liveTransformViewInvalidationMap];
}

id objc_msgSend_liveTransformsForKind_(void *a1, const char *a2, ...)
{
  return [a1 liveTransformsForKind:];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_loadControlIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 loadControlIfNeeded];
}

id objc_msgSend_loadControlWithValue_enabled_direction_color_startColor_backgroundColor_backgroundImageName_foregroundImageName_starWidth_starPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadControlWithValue:enabled:direction:color:startColor:backgroundColor:backgroundImageName:foregroundImageName:starWidth:starPadding:");
}

id objc_msgSend_loadImage(void *a1, const char *a2, ...)
{
  return _[a1 loadImage];
}

id objc_msgSend_loadImageFromResource_placeholderImage_(void *a1, const char *a2, ...)
{
  return [a1 loadImageFromResource:placeholderImage:];
}

id objc_msgSend_loadImagesFromResourceMap_(void *a1, const char *a2, ...)
{
  return [a1 loadImagesFromResourceMap:];
}

id objc_msgSend_loadIntrinsicSize(void *a1, const char *a2, ...)
{
  return _[a1 loadIntrinsicSize];
}

id objc_msgSend_loadLargestLoadedImageAsTemporary(void *a1, const char *a2, ...)
{
  return _[a1 loadLargestLoadedImageAsTemporary];
}

id objc_msgSend_loadResource(void *a1, const char *a2, ...)
{
  return _[a1 loadResource];
}

id objc_msgSend_loadResourceWithURL_completion_(void *a1, const char *a2, ...)
{
  return [a1 loadResourceWithURL:completion:];
}

id objc_msgSend_loadValuesAsynchronouslyForKeys_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 loadValuesAsynchronouslyForKeys:completionHandler:];
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 loadViewIfNeeded];
}

id objc_msgSend_loadedTimeRanges(void *a1, const char *a2, ...)
{
  return _[a1 loadedTimeRanges];
}

id objc_msgSend_loadingIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 loadingIdentifier];
}

id objc_msgSend_loadingRenderModelWithSize_center_environment_(void *a1, const char *a2, ...)
{
  return [a1 loadingRenderModelWithSize:center:environment:];
}

id objc_msgSend_localizedCapitalizedString(void *a1, const char *a2, ...)
{
  return _[a1 localizedCapitalizedString];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedLowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 localizedLowercaseString];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithFormat:];
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 localizedUppercaseString];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return [a1 locationInView:];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_logicalLineCount(void *a1, const char *a2, ...)
{
  return _[a1 logicalLineCount];
}

id objc_msgSend_lookupAttributeWithName_(void *a1, const char *a2, ...)
{
  return [a1 lookupAttributeWithName:];
}

id objc_msgSend_lookupName_symtab_(void *a1, const char *a2, ...)
{
  return [a1 lookupName:symtab:];
}

id objc_msgSend_loop(void *a1, const char *a2, ...)
{
  return _[a1 loop];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_lq_appendAnchorsToSet_(void *a1, const char *a2, ...)
{
  return [a1 lq_appendAnchorsToSet:];
}

id objc_msgSend_lq_captureWithController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lq_captureWithController:");
}

id objc_msgSend_lq_createEmptyRenderModelWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lq_createEmptyRenderModelWithSize:");
}

id objc_msgSend_lq_createRenderModelForFeedEntry_section_(void *a1, const char *a2, ...)
{
  return [a1 lq_createRenderModelForFeedEntry:section:];
}

id objc_msgSend_lq_instantiateWithController_transactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 lq_instantiateWithController:transactionGroup:];
}

id objc_msgSend_lq_loadFeedEntry_data_section_transactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 lq_loadFeedEntry:data:section:transactionGroup:];
}

id objc_msgSend_lq_loadOrUpdateEntry_data_controller_transactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lq_loadOrUpdateEntry:data:controller:transactionGroup:");
}

id objc_msgSend_lq_nextTransactionGroup(void *a1, const char *a2, ...)
{
  return [a1 lq_nextTransactionGroup];
}

id objc_msgSend_lq_updateAXModelTreeWithTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 lq_updateAXModelTreeWithTransactionGroup:];
}

id objc_msgSend_lq_updateAuxiliaryLayoutWithTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 lq_updateAuxiliaryLayoutWithTransactionGroup:];
}

id objc_msgSend_lq_updateContent_contentUpdateDate_transaction_transactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lq_updateContent:contentUpdateDate:transaction:transactionGroup:");
}

id objc_msgSend_lq_updateEnvironment_withTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 lq_updateEnvironment:withTransactionGroup:];
}

id objc_msgSend_lq_updateHostingGeometryMap_(void *a1, const char *a2, ...)
{
  return [a1 lq_updateHostingGeometryMap:];
}

id objc_msgSend_lq_updateLayerLayoutWithTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 lq_updateLayerLayoutWithTransactionGroup:];
}

id objc_msgSend_lq_updateLayoutWithTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 lq_updateLayoutWithTransactionGroup:];
}

id objc_msgSend_lq_updateRenderModelsWithTransactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lq_updateRenderModelsWithTransactionGroup:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeAvailableForReuse_(void *a1, const char *a2, ...)
{
  return [a1 makeAvailableForReuse:];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectContext];
}

id objc_msgSend_managedValueWithValue_(void *a1, const char *a2, ...)
{
  return [a1 managedValueWithValue:];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _[a1 manager];
}

id objc_msgSend_manager_didSetCaptions_(void *a1, const char *a2, ...)
{
  return [a1 manager:didSetCaptions:];
}

id objc_msgSend_managerAttemptingActionWithOrigin_actionCase_(void *a1, const char *a2, ...)
{
  return [a1 managerAttemptingActionWithOrigin:actionCase:];
}

id objc_msgSend_map(void *a1, const char *a2, ...)
{
  return _[a1 map];
}

id objc_msgSend_mapData_(void *a1, const char *a2, ...)
{
  return [a1 mapData:];
}

id objc_msgSend_mapFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 mapFromIndex:];
}

id objc_msgSend_mapRenderModels_(void *a1, const char *a2, ...)
{
  return [a1 mapRenderModels:];
}

id objc_msgSend_mapTableWithKeyOptions_valueOptions_(void *a1, const char *a2, ...)
{
  return [a1 mapTableWithKeyOptions:valueOptions:];
}

id objc_msgSend_mapToIndex_(void *a1, const char *a2, ...)
{
  return [a1 mapToIndex:];
}

id objc_msgSend_mapViewModels_(void *a1, const char *a2, ...)
{
  return [a1 mapViewModels:];
}

id objc_msgSend_mappedSpecIfNeededWithEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 mappedSpecIfNeededWithEnvironment:];
}

id objc_msgSend_markAsNonVolatile(void *a1, const char *a2, ...)
{
  return _[a1 markAsNonVolatile];
}

id objc_msgSend_markAsVolatile(void *a1, const char *a2, ...)
{
  return _[a1 markAsVolatile];
}

id objc_msgSend_mask(void *a1, const char *a2, ...)
{
  return _[a1 mask];
}

id objc_msgSend_maskColor(void *a1, const char *a2, ...)
{
  return _[a1 maskColor];
}

id objc_msgSend_maskImageWithStartPoint_endPoint_offset_startColor_endColor_direction_containerBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maskImageWithStartPoint:endPoint:offset:startColor:endColor:direction:containerBounds:");
}

id objc_msgSend_masksToBounds(void *a1, const char *a2, ...)
{
  return _[a1 masksToBounds];
}

id objc_msgSend_mass(void *a1, const char *a2, ...)
{
  return _[a1 mass];
}

id objc_msgSend_matchesRefId_refInstance_identifier_(void *a1, const char *a2, ...)
{
  return [a1 matchesRefId:refInstance:identifier:];
}

id objc_msgSend_matchesUUID_uid_(void *a1, const char *a2, ...)
{
  return [a1 matchesUUID:uid:];
}

id objc_msgSend_matchingSectionUID(void *a1, const char *a2, ...)
{
  return _[a1 matchingSectionUID];
}

id objc_msgSend_matchingSectionUUID(void *a1, const char *a2, ...)
{
  return _[a1 matchingSectionUUID];
}

id objc_msgSend_max(void *a1, const char *a2, ...)
{
  return _[a1 max];
}

id objc_msgSend_maxAspectRatio(void *a1, const char *a2, ...)
{
  return _[a1 maxAspectRatio];
}

id objc_msgSend_maxColumns(void *a1, const char *a2, ...)
{
  return _[a1 maxColumns];
}

id objc_msgSend_maxLineCount(void *a1, const char *a2, ...)
{
  return _[a1 maxLineCount];
}

id objc_msgSend_maxLines(void *a1, const char *a2, ...)
{
  return _[a1 maxLines];
}

id objc_msgSend_maxPages(void *a1, const char *a2, ...)
{
  return _[a1 maxPages];
}

id objc_msgSend_maxScale(void *a1, const char *a2, ...)
{
  return _[a1 maxScale];
}

id objc_msgSend_maxWidth(void *a1, const char *a2, ...)
{
  return _[a1 maxWidth];
}

id objc_msgSend_mediaBackdropImageResourceFrom_naturalSize_contentScale_(void *a1, const char *a2, ...)
{
  return [a1 mediaBackdropImageResourceFrom:naturalSize:contentScale:];
}

id objc_msgSend_mediaSelectionGroupForMediaCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaSelectionGroupForMediaCharacteristic:");
}

id objc_msgSend_menu(void *a1, const char *a2, ...)
{
  return _[a1 menu];
}

id objc_msgSend_menuContainer(void *a1, const char *a2, ...)
{
  return _[a1 menuContainer];
}

id objc_msgSend_menuDataDidUpdate(void *a1, const char *a2, ...)
{
  return _[a1 menuDataDidUpdate];
}

id objc_msgSend_menuElementsWithData_(void *a1, const char *a2, ...)
{
  return [a1 menuElementsWithData:];
}

id objc_msgSend_menuElementsWithData_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuElementsWithData:completion:");
}

id objc_msgSend_menuIsPrimary(void *a1, const char *a2, ...)
{
  return _[a1 menuIsPrimary];
}

id objc_msgSend_menuItemWithTitle_imageModel_isEnabled_isOn_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItemWithTitle:imageModel:isEnabled:isOn:action:");
}

id objc_msgSend_menuModel(void *a1, const char *a2, ...)
{
  return _[a1 menuModel];
}

id objc_msgSend_menuWithChildren_(void *a1, const char *a2, ...)
{
  return [a1 menuWithChildren:];
}

id objc_msgSend_menuWithIsPrimary_actionObject_actionDelegate_(void *a1, const char *a2, ...)
{
  return [a1 menuWithIsPrimary:actionObject:actionDelegate:];
}

id objc_msgSend_menuWithTitle_children_(void *a1, const char *a2, ...)
{
  return [a1 menuWithTitle:children:];
}

id objc_msgSend_menuWithTitle_image_identifier_options_children_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuWithTitle:image:identifier:options:children:");
}

id objc_msgSend_menuWithTitle_imageModel_isInline_children_(void *a1, const char *a2, ...)
{
  return [a1 menuWithTitle:imageModel:isInline:children:];
}

id objc_msgSend_micaPlayerDidChangePlaybackTime_(void *a1, const char *a2, ...)
{
  return [a1 micaPlayerDidChangePlaybackTime:];
}

id objc_msgSend_micaPlayerDidStartPlaying_(void *a1, const char *a2, ...)
{
  return [a1 micaPlayerDidStartPlaying:];
}

id objc_msgSend_micaPlayerDidStopPlaying_(void *a1, const char *a2, ...)
{
  return [a1 micaPlayerDidStopPlaying:];
}

id objc_msgSend_minScale(void *a1, const char *a2, ...)
{
  return _[a1 minScale];
}

id objc_msgSend_minUpdateInterval(void *a1, const char *a2, ...)
{
  return _[a1 minUpdateInterval];
}

id objc_msgSend_minWidth(void *a1, const char *a2, ...)
{
  return _[a1 minWidth];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return [a1 minusSet:];
}

id objc_msgSend_modalAnchorOptions(void *a1, const char *a2, ...)
{
  return _[a1 modalAnchorOptions];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _[a1 mode];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelForButtonType_context_(void *a1, const char *a2, ...)
{
  return [a1 modelForButtonType:context:];
}

id objc_msgSend_modelIdentifierByAppendingString_node_(void *a1, const char *a2, ...)
{
  return [a1 modelIdentifierByAppendingString:node:];
}

id objc_msgSend_modelIdentifierForEnclosingScrollable(void *a1, const char *a2, ...)
{
  return _[a1 modelIdentifierForEnclosingScrollable];
}

id objc_msgSend_modelIdentifierForScrollable(void *a1, const char *a2, ...)
{
  return _[a1 modelIdentifierForScrollable];
}

id objc_msgSend_modelIdentifierWithNode_(void *a1, const char *a2, ...)
{
  return [a1 modelIdentifierWithNode:];
}

id objc_msgSend_modelKind(void *a1, const char *a2, ...)
{
  return _[a1 modelKind];
}

id objc_msgSend_models(void *a1, const char *a2, ...)
{
  return _[a1 models];
}

id objc_msgSend_modifiedSpecifiedWidthForChild_(void *a1, const char *a2, ...)
{
  return [a1 modifiedSpecifiedWidthForChild:];
}

id objc_msgSend_modifierFlags(void *a1, const char *a2, ...)
{
  return _[a1 modifierFlags];
}

id objc_msgSend_monospacedDigitSystemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 monospacedDigitSystemFontOfSize:weight:];
}

id objc_msgSend_monospacedDigits(void *a1, const char *a2, ...)
{
  return _[a1 monospacedDigits];
}

id objc_msgSend_moreChild(void *a1, const char *a2, ...)
{
  return _[a1 moreChild];
}

id objc_msgSend_moveAndResizeWithinParentLayer_usingGravity_animate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveAndResizeWithinParentLayer:usingGravity:animate:");
}

id objc_msgSend_moveFromIndex_toIndex_(void *a1, const char *a2, ...)
{
  return [a1 moveFromIndex:toIndex:];
}

id objc_msgSend_moveItemFromIndex_toIndex_(void *a1, const char *a2, ...)
{
  return [a1 moveItemFromIndex:toIndex:];
}

id objc_msgSend_moveSection_toSection_(void *a1, const char *a2, ...)
{
  return [a1 moveSection:toSection:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_muted(void *a1, const char *a2, ...)
{
  return _[a1 muted];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameForAttribute_(void *a1, const char *a2, ...)
{
  return [a1 nameForAttribute:];
}

id objc_msgSend_nameReference(void *a1, const char *a2, ...)
{
  return _[a1 nameReference];
}

id objc_msgSend_nameReferenceForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 nameReferenceForAttribute:node:];
}

id objc_msgSend_named_(void *a1, const char *a2, ...)
{
  return [a1 named:];
}

id objc_msgSend_namesForTriggersInUpdate(void *a1, const char *a2, ...)
{
  return _[a1 namesForTriggersInUpdate];
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return _[a1 naturalSize];
}

id objc_msgSend_navBarModels(void *a1, const char *a2, ...)
{
  return _[a1 navBarModels];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationBarBackgroundOpacity(void *a1, const char *a2, ...)
{
  return _[a1 navigationBarBackgroundOpacity];
}

id objc_msgSend_navigationBarBackgroundOpacity_anchors_scrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationBarBackgroundOpacity:anchors:scrollView:");
}

id objc_msgSend_navigationBarItemMatchingQuery_(void *a1, const char *a2, ...)
{
  return [a1 navigationBarItemMatchingQuery:];
}

id objc_msgSend_navigationBarItemsDidUpdate_hasItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationBarItemsDidUpdate:hasItems:");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_navigationItems(void *a1, const char *a2, ...)
{
  return _[a1 navigationItems];
}

id objc_msgSend_needsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 needsDisplay];
}

id objc_msgSend_needsGeometryUpdateWithOldTraitCollection_newTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 needsGeometryUpdateWithOldTraitCollection:newTraitCollection:];
}

id objc_msgSend_needsInstantiation(void *a1, const char *a2, ...)
{
  return _[a1 needsInstantiation];
}

id objc_msgSend_needsLayout(void *a1, const char *a2, ...)
{
  return _[a1 needsLayout];
}

id objc_msgSend_needsTimer(void *a1, const char *a2, ...)
{
  return _[a1 needsTimer];
}

id objc_msgSend_needsValidationForTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 needsValidationForTransactionGroup:];
}

id objc_msgSend_newAdded(void *a1, const char *a2, ...)
{
  return _[a1 newAdded];
}

id objc_msgSend_newCollectorForProvider_withIdentifier_parentIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 newCollectorForProvider:withIdentifier:parentIdentifier:];
}

id objc_msgSend_newCurrentContainerPlusInserted(void *a1, const char *a2, ...)
{
  return _[a1 newCurrentContainerPlusInserted];
}

id objc_msgSend_newCurrentContainerPlusInsertsWithCurrent_update_(void *a1, const char *a2, ...)
{
  return [a1 newCurrentContainerPlusInsertsWithCurrent:update:];
}

id objc_msgSend_newEqualWidthController(void *a1, const char *a2, ...)
{
  return _[a1 newEqualWidthController];
}

id objc_msgSend_newGeometryMap(void *a1, const char *a2, ...)
{
  return _[a1 newGeometryMap];
}

id objc_msgSend_newHeightController(void *a1, const char *a2, ...)
{
  return _[a1 newHeightController];
}

id objc_msgSend_newHorizontalWithWindow_layout_offset_(void *a1, const char *a2, ...)
{
  return [a1 newHorizontalWithWindow:layout:offset:];
}

id objc_msgSend_newImage(void *a1, const char *a2, ...)
{
  return _[a1 newImage];
}

id objc_msgSend_newImageResourceWithSize_(void *a1, const char *a2, ...)
{
  return [a1 newImageResourceWithSize:];
}

id objc_msgSend_newImageWithoutContentInsets(void *a1, const char *a2, ...)
{
  return _[a1 newImageWithoutContentInsets];
}

id objc_msgSend_newImpressionWithUUID_identifier_data_(void *a1, const char *a2, ...)
{
  return [a1 newImpressionWithUUID:identifier:data:];
}

id objc_msgSend_newIndex(void *a1, const char *a2, ...)
{
  return _[a1 newIndex];
}

id objc_msgSend_newInstanceWithGeneration_count_observer_(void *a1, const char *a2, ...)
{
  return [a1 newInstanceWithGeneration:count:observer:];
}

id objc_msgSend_newInstanceWithObserver_(void *a1, const char *a2, ...)
{
  return [a1 newInstanceWithObserver:];
}

id objc_msgSend_newLayoutAttributesWithIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 newLayoutAttributesWithIndexPath:];
}

id objc_msgSend_newLiveTransform_(void *a1, const char *a2, ...)
{
  return [a1 newLiveTransform];
}

id objc_msgSend_newOperationWithImage_size_contentsScale_priority_options_waitForCPUSynchronization_logKey_completion_(void *a1, const char *a2, ...)
{
  return [a1 newOperationWithImage:size:contentsScale:priority:options:waitForCPUSynchronization:logKey:completion:];
}

id objc_msgSend_newOperationWithImages_filters_size_contentsScale_waitForCPUSynchronization_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newOperationWithImages:filters:size:contentsScale:waitForCPUSynchronization:completion:");
}

id objc_msgSend_newOperationWithPriority_waitForCPUSynchronization_logKey_renderLayer_completion_(void *a1, const char *a2, ...)
{
  return [a1 newOperationWithPriority:waitForCPUSynchronization:logKey:renderLayer:completion:];
}

id objc_msgSend_newRemoved(void *a1, const char *a2, ...)
{
  return _[a1 newRemoved];
}

id objc_msgSend_newRenderModelCompatibleWithKind_context_(void *a1, const char *a2, ...)
{
  return [a1 newRenderModelCompatibleWithKind:context:];
}

id objc_msgSend_newScrollableObserverInstanceWithView_host_uuid_uid_(void *a1, const char *a2, ...)
{
  return [a1 newScrollableObserverInstanceWithView:host:uuid:uid:];
}

id objc_msgSend_newStrictEqualWidthController(void *a1, const char *a2, ...)
{
  return _[a1 newStrictEqualWidthController];
}

id objc_msgSend_newSubviewWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 newSubviewWithReuseIdentifier];
}

id objc_msgSend_newToContainerPlusDeletedWithInterests_changes_(void *a1, const char *a2, ...)
{
  return [a1 newToContainerPlusDeletedWithInterests:changes:];
}

id objc_msgSend_newToContainerPlusDeletesWithUpdate_interests_(void *a1, const char *a2, ...)
{
  return [a1 newToContainerPlusDeletesWithUpdate:interests:];
}

id objc_msgSend_newTrackerWithDefaultThreshold_block_(void *a1, const char *a2, ...)
{
  return [a1 newTrackerWithDefaultThreshold:block:];
}

id objc_msgSend_newUIMenuElement(void *a1, const char *a2, ...)
{
  return _[a1 newUIMenuElement];
}

id objc_msgSend_newUIMenuElementWithActionObject_delegate_(void *a1, const char *a2, ...)
{
  return [a1 newUIMenuElementWithActionObject:delegate:];
}

id objc_msgSend_newVerticalWithWindow_layout_offset_(void *a1, const char *a2, ...)
{
  return [a1 newVerticalWithWindow:layout:offset:];
}

id objc_msgSend_newViewControllerWithFeed_(void *a1, const char *a2, ...)
{
  return [a1 newViewControllerWithFeed:];
}

id objc_msgSend_newViewControllerWithFeedEntry_(void *a1, const char *a2, ...)
{
  return [a1 newViewControllerWithFeedEntry:];
}

id objc_msgSend_newWidthController(void *a1, const char *a2, ...)
{
  return _[a1 newWidthController];
}

id objc_msgSend_newWithCancelBlock_(void *a1, const char *a2, ...)
{
  return [a1 newWithCancelBlock:];
}

id objc_msgSend_nextFocusedItem(void *a1, const char *a2, ...)
{
  return _[a1 nextFocusedItem];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_nib(void *a1, const char *a2, ...)
{
  return _[a1 nib];
}

id objc_msgSend_nibWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return [a1 nibWithNibName:];
}

id objc_msgSend_noAnimationOptions(void *a1, const char *a2, ...)
{
  return _[a1 noAnimationOptions];
}

id objc_msgSend_noAnimationTransaction(void *a1, const char *a2, ...)
{
  return _[a1 noAnimationTransaction];
}

id objc_msgSend_node(void *a1, const char *a2, ...)
{
  return _[a1 node];
}

id objc_msgSend_notReadyAssertionWithTimeout_queue_(void *a1, const char *a2, ...)
{
  return [a1 notReadyAssertionWithTimeout:queue:];
}

id objc_msgSend_notifyChildrenScaleDidChange(void *a1, const char *a2, ...)
{
  return _[a1 notifyChildrenScaleDidChange];
}

id objc_msgSend_notifyHoverChangesAffectingView_changed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyHoverChangesAffectingView:changed:");
}

id objc_msgSend_notifyWhenAppliedWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyWhenAppliedWithBlock:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfFullPasses(void *a1, const char *a2, ...)
{
  return _[a1 numberOfFullPasses];
}

id objc_msgSend_numberOfPartialPasses(void *a1, const char *a2, ...)
{
  return _[a1 numberOfPartialPasses];
}

id objc_msgSend_numberOfSegments(void *a1, const char *a2, ...)
{
  return _[a1 numberOfSegments];
}

id objc_msgSend_numberOfTouches(void *a1, const char *a2, ...)
{
  return _[a1 numberOfTouches];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLong:];
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedShort:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectClass(void *a1, const char *a2, ...)
{
  return _[a1 objectClass];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 objectForAttribute:node:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return [a1 objectsAtIndexes:];
}

id objc_msgSend_objectsAtIndexes_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:block:");
}

id objc_msgSend_objectsForKeys_notFoundMarker_(void *a1, const char *a2, ...)
{
  return [a1 objectsForKeys:notFoundMarker:];
}

id objc_msgSend_objectsInRange_block_(void *a1, const char *a2, ...)
{
  return [a1 objectsInRange:block:];
}

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 objectsPassingTest:];
}

id objc_msgSend_observationMode(void *a1, const char *a2, ...)
{
  return _[a1 observationMode];
}

id objc_msgSend_observationModeForTriggerWithName_(void *a1, const char *a2, ...)
{
  return [a1 observationModeForTriggerWithName:];
}

id objc_msgSend_observationModeFromString_(void *a1, const char *a2, ...)
{
  return [a1 observationModeFromString:];
}

id objc_msgSend_observeNavigationBarView_options_block_(void *a1, const char *a2, ...)
{
  return [a1 observeNavigationBarView:options:block:];
}

id objc_msgSend_observeTrigger(void *a1, const char *a2, ...)
{
  return _[a1 observeTrigger];
}

id objc_msgSend_observeTriggerValue(void *a1, const char *a2, ...)
{
  return _[a1 observeTriggerValue];
}

id objc_msgSend_observeView_options_block_(void *a1, const char *a2, ...)
{
  return [a1 observeView:options:block:];
}

id objc_msgSend_observer(void *a1, const char *a2, ...)
{
  return _[a1 observer];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _[a1 observers];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return _[a1 offset];
}

id objc_msgSend_offsetForTriggerWithName_inScrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offsetForTriggerWithName:inScrollView:");
}

id objc_msgSend_oldCount(void *a1, const char *a2, ...)
{
  return _[a1 oldCount];
}

id objc_msgSend_oldIndex(void *a1, const char *a2, ...)
{
  return _[a1 oldIndex];
}

id objc_msgSend_onChildInvalidate_(void *a1, const char *a2, ...)
{
  return [a1 onChildInvalidate:];
}

id objc_msgSend_onChildInvalidateIntrinsicSize_(void *a1, const char *a2, ...)
{
  return [a1 onChildInvalidateIntrinsicSize:];
}

id objc_msgSend_onChildRenderModelInvalidate_(void *a1, const char *a2, ...)
{
  return [a1 onChildRenderModelInvalidate:];
}

id objc_msgSend_onChildTransformedSizeDidChange_(void *a1, const char *a2, ...)
{
  return [a1 onChildTransformedSizeDidChange:];
}

id objc_msgSend_onComputedScaleDidChange(void *a1, const char *a2, ...)
{
  return _[a1 onComputedScaleDidChange];
}

id objc_msgSend_onContainedModelsChanged(void *a1, const char *a2, ...)
{
  return _[a1 onContainedModelsChanged];
}

id objc_msgSend_onContainersUpdated(void *a1, const char *a2, ...)
{
  return _[a1 onContainersUpdated];
}

id objc_msgSend_onContainingWidthChange(void *a1, const char *a2, ...)
{
  return _[a1 onContainingWidthChange];
}

id objc_msgSend_onDesdendantSpecifiedWidthModifiedDidChange(void *a1, const char *a2, ...)
{
  return _[a1 onDesdendantSpecifiedWidthModifiedDidChange];
}

id objc_msgSend_onDesdendantSpecifiedWidthModifiedDidChangeForChild_(void *a1, const char *a2, ...)
{
  return [a1 onDesdendantSpecifiedWidthModifiedDidChangeForChild:];
}

id objc_msgSend_onInvalidate(void *a1, const char *a2, ...)
{
  return _[a1 onInvalidate];
}

id objc_msgSend_onInvalidate_(void *a1, const char *a2, ...)
{
  return [a1 onInvalidate:];
}

id objc_msgSend_onSpecifiedHeightChangedForChild_(void *a1, const char *a2, ...)
{
  return [a1 onSpecifiedHeightChangedForChild:];
}

id objc_msgSend_onSpecifiedWidthChanged(void *a1, const char *a2, ...)
{
  return _[a1 onSpecifiedWidthChanged];
}

id objc_msgSend_onSpecifiedWidthChangedForChild_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onSpecifiedWidthChangedForChild:");
}

id objc_msgSend_onlyInstantiateFirstChildPassingConditionForEnumeratorChildren(void *a1, const char *a2, ...)
{
  return _[a1 onlyInstantiateFirstChildPassingConditionForEnumeratorChildren];
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return _[a1 opacity];
}

id objc_msgSend_opaqueSeparatorColor(void *a1, const char *a2, ...)
{
  return _[a1 opaqueSeparatorColor];
}

id objc_msgSend_optimizeUpdatesForTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 optimizeUpdatesForTransactionGroup:];
}

id objc_msgSend_optimizeUpdatesForTransactionGroup_block_(void *a1, const char *a2, ...)
{
  return [a1 optimizeUpdatesForTransactionGroup:block:];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_optionsWithFetchWindow_fetchInitial_fetchDelta_fetchPadding_uniqueID_(void *a1, const char *a2, ...)
{
  return [a1 optionsWithFetchWindow:fetchWindow fetchInitial:fetchInitial fetchDelta:fetchDelta fetchPadding:fetchPadding uniqueID:uniqueID];
}

id objc_msgSend_order(void *a1, const char *a2, ...)
{
  return _[a1 order];
}

id objc_msgSend_orderedKeys(void *a1, const char *a2, ...)
{
  return _[a1 orderedKeys];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return _[a1 orientation];
}

id objc_msgSend_originAsString(void *a1, const char *a2, ...)
{
  return _[a1 originAsString];
}

id objc_msgSend_outsets(void *a1, const char *a2, ...)
{
  return _[a1 outsets];
}

id objc_msgSend_overlay(void *a1, const char *a2, ...)
{
  return _[a1 overlay];
}

id objc_msgSend_overrideWithQuery_alpha_(void *a1, const char *a2, ...)
{
  return [a1 overrideWithQuery:alpha:];
}

id objc_msgSend_overrides(void *a1, const char *a2, ...)
{
  return _[a1 overrides];
}

id objc_msgSend_overscrollingLiveTransform(void *a1, const char *a2, ...)
{
  return _[a1 overscrollingLiveTransform];
}

id objc_msgSend_owningAttachment(void *a1, const char *a2, ...)
{
  return _[a1 owningAttachment];
}

id objc_msgSend_package(void *a1, const char *a2, ...)
{
  return _[a1 package];
}

id objc_msgSend_packageBuffer(void *a1, const char *a2, ...)
{
  return _[a1 packageBuffer];
}

id objc_msgSend_packageWithURL_(void *a1, const char *a2, ...)
{
  return [a1 packageWithURL:];
}

id objc_msgSend_packageWithURL_baseURL_error_(void *a1, const char *a2, ...)
{
  return [a1 packageWithURL:baseURL:error:];
}

id objc_msgSend_padding(void *a1, const char *a2, ...)
{
  return _[a1 padding];
}

id objc_msgSend_pageCount(void *a1, const char *a2, ...)
{
  return _[a1 pageCount];
}

id objc_msgSend_pageGap(void *a1, const char *a2, ...)
{
  return _[a1 pageGap];
}

id objc_msgSend_pageIndex(void *a1, const char *a2, ...)
{
  return _[a1 pageIndex];
}

id objc_msgSend_pagedScrollableActionChangeToPageIndex_(void *a1, const char *a2, ...)
{
  return [a1 pagedScrollableActionChangeToPageIndex:];
}

id objc_msgSend_pagedScrollableController(void *a1, const char *a2, ...)
{
  return _[a1 pagedScrollableController];
}

id objc_msgSend_pagedScrollableDidChange_(void *a1, const char *a2, ...)
{
  return [a1 pagedScrollableDidChange:];
}

id objc_msgSend_pagedScrollableWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 pagedScrollableWithIdentifier:];
}

id objc_msgSend_paginated(void *a1, const char *a2, ...)
{
  return _[a1 paginated];
}

id objc_msgSend_paragraphIndexAtCharIndex_(void *a1, const char *a2, ...)
{
  return [a1 paragraphIndexAtCharIndex:];
}

id objc_msgSend_paragraphStyleAtCharIndex_effectiveRange_(void *a1, const char *a2, ...)
{
  return [a1 paragraphStyleAtCharIndex:effectiveRange:];
}

id objc_msgSend_paragraphStyleAtParIndex_effectiveRange_(void *a1, const char *a2, ...)
{
  return [a1 paragraphStyleAtParIndex:effectiveRange:];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return _[a1 parent];
}

id objc_msgSend_parentModel(void *a1, const char *a2, ...)
{
  return _[a1 parentModel];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_parsedElement(void *a1, const char *a2, ...)
{
  return _[a1 parsedElement];
}

id objc_msgSend_passes(void *a1, const char *a2, ...)
{
  return _[a1 passes];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _[a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_pauseUnload(void *a1, const char *a2, ...)
{
  return _[a1 pauseUnload];
}

id objc_msgSend_pauseUpdates(void *a1, const char *a2, ...)
{
  return _[a1 pauseUpdates];
}

id objc_msgSend_paused(void *a1, const char *a2, ...)
{
  return _[a1 paused];
}

id objc_msgSend_performAnimatedFeedUpdates_(void *a1, const char *a2, ...)
{
  return [a1 performAnimatedFeedUpdates:];
}

id objc_msgSend_performAsCurrentTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 performAsCurrentTraitCollection:];
}

id objc_msgSend_performBatchUpdatesWithRenderModel_flags_block_completion_(void *a1, const char *a2, ...)
{
  return [a1 performBatchUpdatesWithRenderModel:flags:block:completion:];
}

id objc_msgSend_performBatchUpdatesWithTransaction_generation_block_(void *a1, const char *a2, ...)
{
  return [a1 performBatchUpdatesWithTransaction:generation:block:];
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return [a1 performBlockAndWait:];
}

id objc_msgSend_performDropWithSession_actionObject_behavior_(void *a1, const char *a2, ...)
{
  return [a1 performDropWithSession:actionObject:behavior:];
}

id objc_msgSend_performDropWithSession_behavior_(void *a1, const char *a2, ...)
{
  return [a1 performDropWithSession:behavior:];
}

id objc_msgSend_performFetch_(void *a1, const char *a2, ...)
{
  return [a1 performFetch];
}

id objc_msgSend_performSelector_withObject_afterDelay_inModes_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:afterDelay:inModes:];
}

id objc_msgSend_performUpdateForTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 performUpdateForTransactionGroup:];
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return [a1 performWithoutAnimation:];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 persistentStoreCoordinator];
}

id objc_msgSend_phaseRenderModels(void *a1, const char *a2, ...)
{
  return _[a1 phaseRenderModels];
}

id objc_msgSend_phases(void *a1, const char *a2, ...)
{
  return _[a1 phases];
}

id objc_msgSend_physicalMemory(void *a1, const char *a2, ...)
{
  return _[a1 physicalMemory];
}

id objc_msgSend_pinPosition(void *a1, const char *a2, ...)
{
  return _[a1 pinPosition];
}

id objc_msgSend_pinPositionFromLiveTransformKind_(void *a1, const char *a2, ...)
{
  return [a1 pinPositionFromLiveTransformKind:];
}

id objc_msgSend_pinningLiveTransform(void *a1, const char *a2, ...)
{
  return _[a1 pinningLiveTransform];
}

id objc_msgSend_pivotChild(void *a1, const char *a2, ...)
{
  return _[a1 pivotChild];
}

id objc_msgSend_placeholder(void *a1, const char *a2, ...)
{
  return _[a1 placeholder];
}

id objc_msgSend_placeholderString(void *a1, const char *a2, ...)
{
  return _[a1 placeholderString];
}

id objc_msgSend_placeholderText(void *a1, const char *a2, ...)
{
  return _[a1 placeholderText];
}

id objc_msgSend_placeholderTextColor(void *a1, const char *a2, ...)
{
  return _[a1 placeholderTextColor];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return _[a1 play];
}

id objc_msgSend_playButton(void *a1, const char *a2, ...)
{
  return _[a1 playButton];
}

id objc_msgSend_playbackChecks(void *a1, const char *a2, ...)
{
  return _[a1 playbackChecks];
}

id objc_msgSend_playbackTime(void *a1, const char *a2, ...)
{
  return _[a1 playbackTime];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return _[a1 player];
}

id objc_msgSend_player_didChangeState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "player:didChangeState:");
}

id objc_msgSend_player_didPlayToTime_(void *a1, const char *a2, ...)
{
  return [a1 player:didPlayToTime:];
}

id objc_msgSend_player_didSetCaptionsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 player:didSetCaptionsEnabled:];
}

id objc_msgSend_player_didSetFailureReason_mediaTimePlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "player:didSetFailureReason:mediaTimePlayed:");
}

id objc_msgSend_player_didSetMuted_mediaTimePlayed_(void *a1, const char *a2, ...)
{
  return [a1 player:didSetMuted:mediaTimePlayed:];
}

id objc_msgSend_player_didStallPlaybackAtTime_(void *a1, const char *a2, ...)
{
  return [a1 player:didStallPlaybackAtTime:];
}

id objc_msgSend_playerAsset(void *a1, const char *a2, ...)
{
  return _[a1 playerAsset];
}

id objc_msgSend_playerController(void *a1, const char *a2, ...)
{
  return _[a1 playerController];
}

id objc_msgSend_playerDidLoadPlayerItem_(void *a1, const char *a2, ...)
{
  return [a1 playerDidLoadPlayerItem:];
}

id objc_msgSend_playerDidPause_mediaTimePlayed_(void *a1, const char *a2, ...)
{
  return [a1 playerDidPause:mediaTimePlayed:];
}

id objc_msgSend_playerDidPlay_mediaTimePlayed_(void *a1, const char *a2, ...)
{
  return [a1 playerDidPlay:mediaTimePlayed:];
}

id objc_msgSend_playerDidPlayToEnd_mediaTimePlayed_(void *a1, const char *a2, ...)
{
  return [a1 playerDidPlayToEnd:mediaTimePlayed:];
}

id objc_msgSend_playerItem(void *a1, const char *a2, ...)
{
  return _[a1 playerItem];
}

id objc_msgSend_playerItemWithAsset_(void *a1, const char *a2, ...)
{
  return [a1 playerItemWithAsset];
}

id objc_msgSend_playerWithVideoId_didChangeState_(void *a1, const char *a2, ...)
{
  return [a1 playerWithVideoId:didChangeState:];
}

id objc_msgSend_playerWithVideoId_didPlayToTime_(void *a1, const char *a2, ...)
{
  return [a1 playerWithVideoId:didPlayToTime:];
}

id objc_msgSend_playerWithVideoId_didSetFailureReason_mediaTimePlayed_(void *a1, const char *a2, ...)
{
  return [a1 playerWithVideoId:didSetFailureReason:mediaTimePlayed:];
}

id objc_msgSend_playerWithVideoId_didSetMuted_mediaTimePlayed_(void *a1, const char *a2, ...)
{
  return [a1 playerWithVideoId:didSetMuted:mediaTimePlayed:];
}

id objc_msgSend_playerWithVideoId_didStallPlaybackAtTime_(void *a1, const char *a2, ...)
{
  return [a1 playerWithVideoId:didStallPlaybackAtTime:];
}

id objc_msgSend_playerWithVideoIdDidLoadPlayerItem_(void *a1, const char *a2, ...)
{
  return [a1 playerWithVideoIdDidLoadPlayerItem:];
}

id objc_msgSend_playerWithVideoIdDidPause_mediaTimePlayed_(void *a1, const char *a2, ...)
{
  return [a1 playerWithVideoIdDidPause:mediaTimePlayed:];
}

id objc_msgSend_playerWithVideoIdDidPlay_mediaTimePlayed_(void *a1, const char *a2, ...)
{
  return [a1 playerWithVideoIdDidPlay:mediaTimePlayed:];
}

id objc_msgSend_playerWithVideoIdDidPlayToEnd_mediaTimePlayed_(void *a1, const char *a2, ...)
{
  return [a1 playerWithVideoIdDidPlayToEnd:mediaTimePlayed:];
}

id objc_msgSend_playerWithVideoIdIsPlaying_(void *a1, const char *a2, ...)
{
  return [a1 playerWithVideoIdIsPlaying];
}

id objc_msgSend_playing(void *a1, const char *a2, ...)
{
  return _[a1 playing];
}

id objc_msgSend_pointInside_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 pointInside:withEvent:];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_pointer(void *a1, const char *a2, ...)
{
  return _[a1 pointer];
}

id objc_msgSend_pointerCursorWithCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 pointerCursorWithCornerRadius:];
}

id objc_msgSend_pointerCursorWithInsets_(void *a1, const char *a2, ...)
{
  return [a1 pointerCursorWithInsets:];
}

id objc_msgSend_pointerCursorWithScale_(void *a1, const char *a2, ...)
{
  return [a1 pointerCursorWithScale:];
}

id objc_msgSend_pointerCursorWithShape_(void *a1, const char *a2, ...)
{
  return [a1 pointerCursorWithShape:];
}

id objc_msgSend_pointerEffectWithPreview_(void *a1, const char *a2, ...)
{
  return [a1 pointerEffectWithPreview:];
}

id objc_msgSend_pointerForNode_(void *a1, const char *a2, ...)
{
  return [a1 pointerForNode:];
}

id objc_msgSend_pointerRefId(void *a1, const char *a2, ...)
{
  return _[a1 pointerRefId];
}

id objc_msgSend_pointerShapeWithBounds_preview_(void *a1, const char *a2, ...)
{
  return [a1 pointerShapeWithBounds:preview:];
}

id objc_msgSend_pointerStyle(void *a1, const char *a2, ...)
{
  return _[a1 pointerStyle];
}

id objc_msgSend_pointerStyleForNode_(void *a1, const char *a2, ...)
{
  return [a1 pointerStyleForNode:];
}

id objc_msgSend_pointerStyleWithCursor_(void *a1, const char *a2, ...)
{
  return [a1 pointerStyleWithCursor:];
}

id objc_msgSend_pointerStyleWithEffect_(void *a1, const char *a2, ...)
{
  return [a1 pointerStyleWithEffect:];
}

id objc_msgSend_pointerStyleWithPreferredTintMode_(void *a1, const char *a2, ...)
{
  return [a1 pointerStyleWithPreferredTintMode:];
}

id objc_msgSend_pointerStyleWithPrefersScale_(void *a1, const char *a2, ...)
{
  return [a1 pointerStyleWithPrefersScale:];
}

id objc_msgSend_pointerStyleWithPrefersShadow_(void *a1, const char *a2, ...)
{
  return [a1 pointerStyleWithPrefersShadow:];
}

id objc_msgSend_pointerWithRefId_style_(void *a1, const char *a2, ...)
{
  return [a1 pointerWithRefId:style:];
}

id objc_msgSend_popState(void *a1, const char *a2, ...)
{
  return _[a1 popState];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 popoverPresentationController];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_positionAttachmentLayoutsWithOffset_truncatedCharIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "positionAttachmentLayoutsWithOffset:truncatedCharIndex:");
}

id objc_msgSend_positionContainerLayout_(void *a1, const char *a2, ...)
{
  return [a1 positionContainerLayout:];
}

id objc_msgSend_posterFrameImageView(void *a1, const char *a2, ...)
{
  return _[a1 posterFrameImageView];
}

id objc_msgSend_posterFrameResource(void *a1, const char *a2, ...)
{
  return _[a1 posterFrameResource];
}

id objc_msgSend_posterFrameUrlString(void *a1, const char *a2, ...)
{
  return _[a1 posterFrameUrlString];
}

id objc_msgSend_postscriptName(void *a1, const char *a2, ...)
{
  return _[a1 postscriptName];
}

id objc_msgSend_prebuiltTemplates(void *a1, const char *a2, ...)
{
  return _[a1 prebuiltTemplates];
}

id objc_msgSend_preconfigureBox_context_(void *a1, const char *a2, ...)
{
  return [a1 preconfigureBox:context:];
}

id objc_msgSend_predecessors(void *a1, const char *a2, ...)
{
  return _[a1 predecessors];
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithBlock:];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_preferredFormat(void *a1, const char *a2, ...)
{
  return _[a1 preferredFormat];
}

id objc_msgSend_preferredLocalizations(void *a1, const char *a2, ...)
{
  return _[a1 preferredLocalizations];
}

id objc_msgSend_preferredTintMode(void *a1, const char *a2, ...)
{
  return _[a1 preferredTintMode];
}

id objc_msgSend_prefersLargeTitles(void *a1, const char *a2, ...)
{
  return _[a1 prefersLargeTitles];
}

id objc_msgSend_prefersScale(void *a1, const char *a2, ...)
{
  return _[a1 prefersScale];
}

id objc_msgSend_prefersShadow(void *a1, const char *a2, ...)
{
  return _[a1 prefersShadow];
}

id objc_msgSend_prefetchResources_controllerID_loader_(void *a1, const char *a2, ...)
{
  return [a1 prefetchResources:controllerID:loader:];
}

id objc_msgSend_prepare(void *a1, const char *a2, ...)
{
  return _[a1 prepare];
}

id objc_msgSend_prepareForReuse(void *a1, const char *a2, ...)
{
  return _[a1 prepareForReuse];
}

id objc_msgSend_prepareToReuseHost_(void *a1, const char *a2, ...)
{
  return [a1 prepareToReuseHost];
}

id objc_msgSend_presentContextMenuForAccessibility(void *a1, const char *a2, ...)
{
  return _[a1 presentContextMenuForAccessibility];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:animated:completion:];
}

id objc_msgSend_presentation(void *a1, const char *a2, ...)
{
  return _[a1 presentation];
}

id objc_msgSend_presentationDidDismiss(void *a1, const char *a2, ...)
{
  return _[a1 presentationDidDismiss];
}

id objc_msgSend_presentationFromString_(void *a1, const char *a2, ...)
{
  return [a1 presentationFromString:];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return _[a1 presentationLayer];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingViewController];
}

id objc_msgSend_pressScale(void *a1, const char *a2, ...)
{
  return _[a1 pressScale];
}

id objc_msgSend_pressedScale(void *a1, const char *a2, ...)
{
  return _[a1 pressedScale];
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return _[a1 previousState];
}

id objc_msgSend_previouslyAppeared(void *a1, const char *a2, ...)
{
  return _[a1 previouslyAppeared];
}

id objc_msgSend_previouslyFocusedItem(void *a1, const char *a2, ...)
{
  return _[a1 previouslyFocusedItem];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_progressId(void *a1, const char *a2, ...)
{
  return _[a1 progressId];
}

id objc_msgSend_progressMode(void *a1, const char *a2, ...)
{
  return _[a1 progressMode];
}

id objc_msgSend_progressProviderForKind_(void *a1, const char *a2, ...)
{
  return [a1 progressProviderForKind:];
}

id objc_msgSend_property(void *a1, const char *a2, ...)
{
  return _[a1 property];
}

id objc_msgSend_propertyMap(void *a1, const char *a2, ...)
{
  return _[a1 propertyMap];
}

id objc_msgSend_propertyMapWithPropertiesAndValues_(void *a1, const char *a2, ...)
{
  return [a1 propertyMapWithPropertiesAndValues:];
}

id objc_msgSend_propertyNameForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 propertyNameForAttribute:node:];
}

id objc_msgSend_proposeAnchorOffsetWithScrollView_velocity_target_(void *a1, const char *a2, ...)
{
  return [a1 proposeAnchorOffsetWithScrollView:velocity:target:];
}

id objc_msgSend_protocolClasses(void *a1, const char *a2, ...)
{
  return _[a1 protocolClasses];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_publishedLayerWithKey_required_(void *a1, const char *a2, ...)
{
  return [a1 publishedLayerWithKey:required:];
}

id objc_msgSend_publishedObjectWithKey_required_(void *a1, const char *a2, ...)
{
  return [a1 publishedObjectWithKey:required:];
}

id objc_msgSend_publishedObjects(void *a1, const char *a2, ...)
{
  return _[a1 publishedObjects];
}

id objc_msgSend_pushState_(void *a1, const char *a2, ...)
{
  return [a1 pushState:];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return [a1 pushViewController:animated:];
}

id objc_msgSend_q_collectImpressions_time_flush_stats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "q_collectImpressions:time:flush:stats:");
}

id objc_msgSend_q_collectImpressions_time_threshold_flush_stats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "q_collectImpressions:time:threshold:flush:stats:");
}

id objc_msgSend_q_commitWithTime_(void *a1, const char *a2, ...)
{
  return [a1 q_commitWithTime:];
}

id objc_msgSend_q_computeChangeNodeForTracker_anyChange_rootVisibleSize_needsUpdate_needUpdateSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "q_computeChangeNodeForTracker:anyChange:rootVisibleSize:needsUpdate:needUpdateSet:");
}

id objc_msgSend_q_notifyObserversWithRootNode_time_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "q_notifyObserversWithRootNode:time:");
}

id objc_msgSend_q_scheduleRefreshIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 q_scheduleRefreshIfNeeded];
}

id objc_msgSend_q_updateSnapshot(void *a1, const char *a2, ...)
{
  return [a1 q_updateSnapshot];
}

id objc_msgSend_q_updateVisible_(void *a1, const char *a2, ...)
{
  return [a1 q_updateVisible:];
}

id objc_msgSend_q_updateVisibleBounds_(void *a1, const char *a2, ...)
{
  return [a1 q_updateVisibleBounds:];
}

id objc_msgSend_q_visibleBoundsSize(void *a1, const char *a2, ...)
{
  return [a1 q_visibleBoundsSize];
}

id objc_msgSend_quaternaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 quaternaryLabelColor];
}

id objc_msgSend_quaternarySystemFillColor(void *a1, const char *a2, ...)
{
  return _[a1 quaternarySystemFillColor];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _[a1 query];
}

id objc_msgSend_queryGenerationToken(void *a1, const char *a2, ...)
{
  return _[a1 queryGenerationToken];
}

id objc_msgSend_queryMatchedWithUUID_uid_(void *a1, const char *a2, ...)
{
  return [a1 queryMatchedWithUUID:uid];
}

id objc_msgSend_queryWithUUID_uid_identifier_(void *a1, const char *a2, ...)
{
  return [a1 queryWithUUID:uid:identifier:];
}

id objc_msgSend_queryWithUUID_uid_refId_refInstance_(void *a1, const char *a2, ...)
{
  return [a1 queryWithUUID:uid:refId:refInstance:];
}

id objc_msgSend_queueContext(void *a1, const char *a2, ...)
{
  return _[a1 queueContext];
}

id objc_msgSend_queueUpdateForCollector_time_block_(void *a1, const char *a2, ...)
{
  return [a1 queueUpdateForCollector:time:block:];
}

id objc_msgSend_queueUpdateVisible_forCollector_time_(void *a1, const char *a2, ...)
{
  return [a1 queueUpdateVisible:forCollector:time:];
}

id objc_msgSend_queueUpdateWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 queueUpdateWithBlock:];
}

id objc_msgSend_queueVisibleBoundsUpdateForCollector_time_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueVisibleBoundsUpdateForCollector:time:");
}

id objc_msgSend_raised(void *a1, const char *a2, ...)
{
  return _[a1 raised];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return _[a1 range];
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfCharacterFromSet:];
}

id objc_msgSend_rangeOfLineFragmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfLineFragmentAtIndex:];
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:options:];
}

id objc_msgSend_rasterizationScale(void *a1, const char *a2, ...)
{
  return _[a1 rasterizationScale];
}

id objc_msgSend_rate(void *a1, const char *a2, ...)
{
  return _[a1 rate];
}

id objc_msgSend_rating(void *a1, const char *a2, ...)
{
  return _[a1 rating];
}

id objc_msgSend_ratingStarsImageWithName_starSize_starCount_starPadding_traitCollection_(void *a1, const char *a2, ...)
{
  return [a1 ratingStarsImageWithName:starSize:starCount:starPadding:traitCollection:];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_reasonForWaitingToPlay(void *a1, const char *a2, ...)
{
  return _[a1 reasonForWaitingToPlay];
}

id objc_msgSend_rebuildAllRegionsWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 rebuildAllRegionsWithBlock:];
}

id objc_msgSend_recordEvent_(void *a1, const char *a2, ...)
{
  return [a1 recordEvent:];
}

id objc_msgSend_recordReason_(void *a1, const char *a2, ...)
{
  return [a1 recordReason:];
}

id objc_msgSend_rectScrollingDelegate(void *a1, const char *a2, ...)
{
  return _[a1 rectScrollingDelegate];
}

id objc_msgSend_recycleViewWithController_(void *a1, const char *a2, ...)
{
  return [a1 recycleViewWithController:];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_ref(void *a1, const char *a2, ...)
{
  return _[a1 ref];
}

id objc_msgSend_refId(void *a1, const char *a2, ...)
{
  return _[a1 refId];
}

id objc_msgSend_refIdForTrigger_(void *a1, const char *a2, ...)
{
  return [a1 refIdForTrigger];
}

id objc_msgSend_refInstance(void *a1, const char *a2, ...)
{
  return _[a1 refInstance];
}

id objc_msgSend_referenceCollectorWithViewState_(void *a1, const char *a2, ...)
{
  return [a1 referenceCollectorWithViewState:];
}

id objc_msgSend_regionName(void *a1, const char *a2, ...)
{
  return _[a1 regionName];
}

id objc_msgSend_regionWithRect_identifier_(void *a1, const char *a2, ...)
{
  return [a1 regionWithRect:identifier:];
}

id objc_msgSend_registerClass_forHeaderFooterViewReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forHeaderFooterViewReuseIdentifier:];
}

id objc_msgSend_registerClass_forSubviewWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forSubviewWithReuseIdentifier:];
}

id objc_msgSend_registerDelegate_(void *a1, const char *a2, ...)
{
  return [a1 registerDelegate:];
}

id objc_msgSend_registerElementClass_withName_(void *a1, const char *a2, ...)
{
  return [a1 registerElementClass:withName:];
}

id objc_msgSend_registerEmbeddedCollectionDelegate_(void *a1, const char *a2, ...)
{
  return [a1 registerEmbeddedCollectionDelegate];
}

id objc_msgSend_registerEmbeddedScrollView_(void *a1, const char *a2, ...)
{
  return [a1 registerEmbeddedScrollView:];
}

id objc_msgSend_registerFeature_(void *a1, const char *a2, ...)
{
  return [a1 registerFeature:];
}

id objc_msgSend_registerForNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForNotifications];
}

id objc_msgSend_registerForTraitChanges_withAction_(void *a1, const char *a2, ...)
{
  return [a1 registerForTraitChanges:withAction:];
}

id objc_msgSend_registerForTraitChanges_withTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 registerForTraitChanges:withTarget:action:];
}

id objc_msgSend_registerHostingLayout_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerHostingLayout:forIdentifier:];
}

id objc_msgSend_registerHoverObserver_(void *a1, const char *a2, ...)
{
  return [a1 registerHoverObserver];
}

id objc_msgSend_registerImageFilters_(void *a1, const char *a2, ...)
{
  return [a1 registerImageFilters:];
}

id objc_msgSend_registerImageProvider_forKind_(void *a1, const char *a2, ...)
{
  return [a1 registerImageProvider:forKind:];
}

id objc_msgSend_registerNib_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerNib:forCellReuseIdentifier:];
}

id objc_msgSend_registerPackage_(void *a1, const char *a2, ...)
{
  return [a1 registerPackage:];
}

id objc_msgSend_registerPackagesWithFactory_(void *a1, const char *a2, ...)
{
  return [a1 registerPackagesWithFactory:];
}

id objc_msgSend_registerPagedScrollableWithWithIdentifier_action_(void *a1, const char *a2, ...)
{
  return [a1 registerPagedScrollableWithWithIdentifier:action:];
}

id objc_msgSend_registerPrefetchController_(void *a1, const char *a2, ...)
{
  return [a1 registerPrefetchController:];
}

id objc_msgSend_registerProgressObserver_(void *a1, const char *a2, ...)
{
  return [a1 registerProgressObserver:];
}

id objc_msgSend_registerStateProvider_forKind_(void *a1, const char *a2, ...)
{
  return [a1 registerStateProvider:forKind:];
}

id objc_msgSend_registry(void *a1, const char *a2, ...)
{
  return _[a1 registry];
}

id objc_msgSend_relativeDistance(void *a1, const char *a2, ...)
{
  return _[a1 relativeDistance];
}

id objc_msgSend_relativeToDropLines(void *a1, const char *a2, ...)
{
  return _[a1 relativeToDropLines];
}

id objc_msgSend_relativeWidth(void *a1, const char *a2, ...)
{
  return _[a1 relativeWidth];
}

id objc_msgSend_releaseResources(void *a1, const char *a2, ...)
{
  return _[a1 releaseResources];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return _[a1 reload];
}

id objc_msgSend_reloadInputViewsWithoutReset(void *a1, const char *a2, ...)
{
  return _[a1 reloadInputViewsWithoutReset];
}

id objc_msgSend_reloadWithNewURL_(void *a1, const char *a2, ...)
{
  return [a1 reloadWithNewURL:];
}

id objc_msgSend_reloadWithRenderModel_(void *a1, const char *a2, ...)
{
  return [a1 reloadWithRenderModel:];
}

id objc_msgSend_removeAllCachedResponses(void *a1, const char *a2, ...)
{
  return _[a1 removeAllCachedResponses];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAssertion_(void *a1, const char *a2, ...)
{
  return [a1 removeAssertion];
}

id objc_msgSend_removeAttribute_(void *a1, const char *a2, ...)
{
  return [a1 removeAttribute:];
}

id objc_msgSend_removeCollector_(void *a1, const char *a2, ...)
{
  return [a1 removeCollector:];
}

id objc_msgSend_removeCompletionDeferral(void *a1, const char *a2, ...)
{
  return _[a1 removeCompletionDeferral];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 removeGestureRecognizer:];
}

id objc_msgSend_removeIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeIndex:];
}

id objc_msgSend_removeIndexesInRange_(void *a1, const char *a2, ...)
{
  return [a1 removeIndexesInRange:];
}

id objc_msgSend_removeInteraction_(void *a1, const char *a2, ...)
{
  return [a1 removeInteraction:];
}

id objc_msgSend_removeInterest(void *a1, const char *a2, ...)
{
  return _[a1 removeInterest];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeNonVolatileInterest(void *a1, const char *a2, ...)
{
  return _[a1 removeNonVolatileInterest];
}

id objc_msgSend_removeNotifyWhenAppliedDeferral(void *a1, const char *a2, ...)
{
  return _[a1 removeNotifyWhenAppliedDeferral];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectIdenticalTo:];
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInRange:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forKeyPath:];
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forKeyPath:context:];
}

id objc_msgSend_removeObserver_forTrigger_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forTrigger:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeProviderForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeProviderForIdentifier:];
}

id objc_msgSend_removeProviderObserver_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeProviderObserver:forIdentifier:];
}

id objc_msgSend_removeRenderOverride_(void *a1, const char *a2, ...)
{
  return [a1 removeRenderOverride];
}

id objc_msgSend_removeSegmentAtIndex_animated_(void *a1, const char *a2, ...)
{
  return [a1 removeSegmentAtIndex:animated:];
}

id objc_msgSend_removeStylingFromView_(void *a1, const char *a2, ...)
{
  return [a1 removeStylingFromView:];
}

id objc_msgSend_removeSubTransactionCompletionDeferral(void *a1, const char *a2, ...)
{
  return _[a1 removeSubTransactionCompletionDeferral];
}

id objc_msgSend_removeTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 removeTarget:action:forControlEvents:];
}

id objc_msgSend_removeTimeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeTimeObserver:];
}

id objc_msgSend_removeTracker_(void *a1, const char *a2, ...)
{
  return [a1 removeTracker];
}

id objc_msgSend_removeVisibilityObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeVisibilityObserver];
}

id objc_msgSend_removed(void *a1, const char *a2, ...)
{
  return _[a1 removed];
}

id objc_msgSend_renderInContext_(void *a1, const char *a2, ...)
{
  return [a1 renderInContext:];
}

id objc_msgSend_renderItemWithFactory_(void *a1, const char *a2, ...)
{
  return [a1 renderItemWithFactory:];
}

id objc_msgSend_renderModel(void *a1, const char *a2, ...)
{
  return _[a1 renderModel];
}

id objc_msgSend_renderModelAuxiliary_(void *a1, const char *a2, ...)
{
  return [a1 renderModelAuxiliary:];
}

id objc_msgSend_renderModelBlock(void *a1, const char *a2, ...)
{
  return _[a1 renderModelBlock];
}

id objc_msgSend_renderModelConvertModels_toKind_(void *a1, const char *a2, ...)
{
  return [a1 renderModelConvertModels:toKind:];
}

id objc_msgSend_renderModelForContainerLayout_kind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelForContainerLayout:kind:");
}

id objc_msgSend_renderModelForLayout_kind_(void *a1, const char *a2, ...)
{
  return [a1 renderModelForLayout:kind:];
}

id objc_msgSend_renderModelForLayout_submodels_kind_(void *a1, const char *a2, ...)
{
  return [a1 renderModelForLayout:submodels:kind:];
}

id objc_msgSend_renderModelFromString_(void *a1, const char *a2, ...)
{
  return [a1 renderModelFromString:];
}

id objc_msgSend_renderModelIdentifier_size_requestedSize_usingGeometry_insets_hostingIdentifier_hostingProperties_anchorPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelIdentifier:size:requestedSize:usingGeometry:insets:hostingIdentifier:hostingProperties:anchorPoint:");
}

id objc_msgSend_renderModelIdentifier_submodel_hostingIdentifier_hostingProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelIdentifier:submodel:hostingIdentifier:hostingProperties:");
}

id objc_msgSend_renderModelIdentifierMap(void *a1, const char *a2, ...)
{
  return _[a1 renderModelIdentifierMap];
}

id objc_msgSend_renderModelLayer_(void *a1, const char *a2, ...)
{
  return [a1 renderModelLayer:];
}

id objc_msgSend_renderModelMode(void *a1, const char *a2, ...)
{
  return _[a1 renderModelMode];
}

id objc_msgSend_renderModelOfKind_context_(void *a1, const char *a2, ...)
{
  return [a1 renderModelOfKind:context:];
}

id objc_msgSend_renderModelSection(void *a1, const char *a2, ...)
{
  return _[a1 renderModelSection];
}

id objc_msgSend_renderModelSection_offset_uuid_transactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 renderModelSection:offset:uuid:transactionGroup:];
}

id objc_msgSend_renderModelSizeWithContext_(void *a1, const char *a2, ...)
{
  return [a1 renderModelSizeWithContext:];
}

id objc_msgSend_renderModelUpdated(void *a1, const char *a2, ...)
{
  return _[a1 renderModelUpdated];
}

id objc_msgSend_renderModelWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 renderModelWithIdentifier:];
}

id objc_msgSend_renderModelWithIdentifier_dynamicProgress_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithIdentifier:dynamicProgress:style:");
}

id objc_msgSend_renderModelWithIdentifier_playing_color_(void *a1, const char *a2, ...)
{
  return [a1 renderModelWithIdentifier:playing:color:];
}

id objc_msgSend_renderModelWithIdentifier_progressId_mode_value_dynamicProgress_paused_color_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithIdentifier:progressId:mode:value:dynamicProgress:paused:color:");
}

id objc_msgSend_renderModelWithIdentifier_size_content_contentOrigin_contentErasableInsets_overlay_overlayOrigin_padding_gradientWidth_layoutDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:");
}

id objc_msgSend_renderModelWithIdentifier_stats_uid_(void *a1, const char *a2, ...)
{
  return [a1 renderModelWithIdentifier:stats:uid:];
}

id objc_msgSend_renderModelWithIdentifier_title_footer_columns_cornerRadius_progress_spacing_color_backgroundColor_shadowColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithIdentifier:title:footer:columns:cornerRadius:progress:spacing:color:backgroundColor:shadowColor:");
}

id objc_msgSend_renderModelWithIdentifier_url_posterFrameResource_videoId_loop_muted_allowFullScreen_autoPlay_showPlaybackControls_gravity_cornerRadius_topTriggerName_bottomTriggerName_leftTriggerName_rightTriggerName_actionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithIdentifier:url:posterFrameResource:videoId:loop:muted:allowFullScreen:autoPlay:showPlaybackControls:gravity:cornerRadius:topTriggerName:bottomTriggerName:leftTriggerName:rightTriggerName:actionHandler:");
}

id objc_msgSend_renderModelWithItemType_identifier_imageModelIDToResource_actionHandler_title_attributedTitle_image_enabled_buttonType_buttonRole_width_minWidth_maxWidth_text_searchTextMaxLength_placeholderText_keyboardAppearance_navigationBarBackgroundOpacity_observeTrigger_observeTriggerValue_ignoreInsetsForOpacityTrigger_menu_subview_axAttributes_refId_refInstance_hostingIdentifiers_hostingProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithItemType:identifier:imageModelIDToResource:actionHandler:title:attributedTitle:image:enabled:buttonType:buttonRole:width:minWidth:maxWidth:text:searchTextMaxLength:placeholderText:keyboardAppearance:navigationBarBackgroundOpacity:observeTrigger:observeTriggerValue:ignoreInsetsForOpacityTrigger:menu:subview:axAttributes:refId:refInstance:hostingIdentifiers:hostingProperties:");
}

id objc_msgSend_renderModelWithLayerModel_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithLayerModel:identifier:");
}

id objc_msgSend_renderModelWithSize_columnSystem_identifier_transform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithSize:columnSystem:identifier:transform:");
}

id objc_msgSend_renderModelWithStateToButtonAttributes_stateToRenderModel_imageModelIDToResource_actionHandler_viewState_linkEntities_type_role_userInterfaceStyle_enabled_pressScale_touchInsets_identifier_style_pointer_focusStyle_menu_contextMenuIsPrimaryAction_name_axAttributes_enableBackgroundForHighlightPreview_enableShadowForHighlightPreview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithStateToButtonAttributes:stateToRenderModel:imageModelIDToResource:actionHandler:viewState:linkEntities:type:role:userInterfaceStyle:enabled:pressScale:touchInsets:identifier:style:pointer:focusStyle:menu:contextMenuIsPrimaryAction:name:axAttributes:enableBackgroundForHighlightPreview:enableShadowForHighlightPreview:");
}

id objc_msgSend_renderModelWithStateToRenderModel_pressScale_touchInsets_identifier_pointer_scrollIdentifier_kind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithStateToRenderModel:pressScale:touchInsets:identifier:pointer:scrollIdentifier:kind:");
}

id objc_msgSend_renderModelWithStates_actionHandler_viewState_enabled_identifier_name_selectIndex_segments_tintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithStates:actionHandler:viewState:enabled:identifier:name:selectIndex:segments:tintColor:");
}

id objc_msgSend_renderModelWithStates_actionHandler_viewState_enabled_identifier_name_title_isOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithStates:actionHandler:viewState:enabled:identifier:name:title:isOn:");
}

id objc_msgSend_renderModelWithStates_actionHandler_viewState_enabled_name_identifier_editingInsets_placeholderText_style_text_returnKeyType_keyboardAppearance_cancelText_showCancel_(void *a1, const char *a2, ...)
{
  return [a1 renderModelWithStates:actionHandler:viewState:enabled:name:identifier:editingInsets:placeholderText:style:text:returnKeyType:keyboardAppearance:cancelText:showCancel:];
}

id objc_msgSend_renderModelWithStates_actionHandler_viewState_enabled_name_identifier_editingInsets_style_placeholderText_text_returnKeyType_keyboardAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithStates:actionHandler:viewState:enabled:name:identifier:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:");
}

id objc_msgSend_renderModelWithStates_actionHandler_viewState_identifier_name_rating_enabled_direction_color_startColor_backgroundColor_backgroundImageName_foregroundImageName_starWidth_starPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithStates:actionHandler:viewState:identifier:name:rating:enabled:direction:color:startColor:backgroundColor:backgroundImageName:foregroundImageName:starWidth:starPadding:");
}

id objc_msgSend_renderModelWithStyle_identifier_(void *a1, const char *a2, ...)
{
  return [a1 renderModelWithStyle:identifier:];
}

id objc_msgSend_renderModelWithSubviewsModel_identifier_focusStyle_actionHandler_linkEntities_(void *a1, const char *a2, ...)
{
  return [a1 renderModelWithSubviewsModel:identifier:focusStyle:actionHandler:linkEntities:];
}

id objc_msgSend_renderModelWithSubviewsModel_identifier_hoverIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithSubviewsModel:identifier:hoverIdentifier:");
}

id objc_msgSend_renderModelWithSubviewsModel_style_identifier_(void *a1, const char *a2, ...)
{
  return [a1 renderModelWithSubviewsModel:style:identifier:];
}

id objc_msgSend_renderModelWithUpdateController_uid_UUID_identifier_scrollIdentifier_ancestorScrollIdentifier_scrollPolicy_pageGap_gradientInsets_gradientFraction_acceptsDrop_dropHandler_decelerationRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderModelWithUpdateController:uid:UUID:identifier:scrollIdentifier:ancestorScrollIdentifier:scrollPolicy:pageGap:gradientInsets:gradientFraction:acceptsDrop:dropHandler:decelerationRate:");
}

id objc_msgSend_renderOutsets(void *a1, const char *a2, ...)
{
  return _[a1 renderOutsets];
}

id objc_msgSend_renderOverrideProvider(void *a1, const char *a2, ...)
{
  return _[a1 renderOverrideProvider];
}

id objc_msgSend_renderOverrides(void *a1, const char *a2, ...)
{
  return _[a1 renderOverrides];
}

id objc_msgSend_renderReferenceOverrideObservers(void *a1, const char *a2, ...)
{
  return _[a1 renderReferenceOverrideObservers];
}

id objc_msgSend_renderReferenceOverridesChanged(void *a1, const char *a2, ...)
{
  return _[a1 renderReferenceOverridesChanged];
}

id objc_msgSend_renderReferences(void *a1, const char *a2, ...)
{
  return _[a1 renderReferences];
}

id objc_msgSend_renderReferencesMatchingQuery_(void *a1, const char *a2, ...)
{
  return [a1 renderReferencesMatchingQuery:];
}

id objc_msgSend_renderSearchControllerWithFactory_(void *a1, const char *a2, ...)
{
  return [a1 renderSearchControllerWithFactory:];
}

id objc_msgSend_renderTransform(void *a1, const char *a2, ...)
{
  return _[a1 renderTransform];
}

id objc_msgSend_renderViewHost(void *a1, const char *a2, ...)
{
  return _[a1 renderViewHost];
}

id objc_msgSend_renderViewWithFactory_(void *a1, const char *a2, ...)
{
  return [a1 renderViewWithFactory:];
}

id objc_msgSend_renderWithContent_size_contentScale_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 renderWithContent:size:contentScale:completionHandler:];
}

id objc_msgSend_renderingMode(void *a1, const char *a2, ...)
{
  return _[a1 renderingMode];
}

id objc_msgSend_renderingModeFromString_(void *a1, const char *a2, ...)
{
  return [a1 renderingModeFromString:];
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return [a1 replaceCharactersInRange:withString:];
}

id objc_msgSend_replaceCharactersInRange_withString_notifyObservers_undoTransaction_(void *a1, const char *a2, ...)
{
  return [a1 replaceCharactersInRange:withString:notifyObservers:undoTransaction:];
}

id objc_msgSend_replaceCurrentItemWithPlayerItem_(void *a1, const char *a2, ...)
{
  return [a1 replaceCurrentItemWithPlayerItem:];
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return [a1 replaceObjectAtIndex:withObject:];
}

id objc_msgSend_replaceObjectsInRange_withObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 replaceObjectsInRange:withObjectsFromArray:];
}

id objc_msgSend_replaceOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return [a1 replaceOccurrencesOfString:withString:options:range:];
}

id objc_msgSend_reportError_(void *a1, const char *a2, ...)
{
  return [a1 reportError:];
}

id objc_msgSend_reportLargeLayer_renderModel_(void *a1, const char *a2, ...)
{
  return [a1 reportLargeLayer:renderModel:];
}

id objc_msgSend_requestDataWithPriority_block_(void *a1, const char *a2, ...)
{
  return [a1 requestDataWithPriority:];
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:];
}

id objc_msgSend_requestedSize(void *a1, const char *a2, ...)
{
  return _[a1 requestedSize];
}

id objc_msgSend_requiredBuilderProtocol(void *a1, const char *a2, ...)
{
  return _[a1 requiredBuilderProtocol];
}

id objc_msgSend_requiredBuilderProtocols(void *a1, const char *a2, ...)
{
  return _[a1 requiredBuilderProtocols];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetGeometryUpdatedFlag(void *a1, const char *a2, ...)
{
  return _[a1 resetGeometryUpdatedFlag];
}

id objc_msgSend_resetInstantiationStats_(void *a1, const char *a2, ...)
{
  return [a1 resetInstantiationStats:];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_resolveAttributes(void *a1, const char *a2, ...)
{
  return _[a1 resolveAttributes];
}

id objc_msgSend_resolveAttributesForInvocation(void *a1, const char *a2, ...)
{
  return _[a1 resolveAttributesForInvocation];
}

id objc_msgSend_resolvePath(void *a1, const char *a2, ...)
{
  return _[a1 resolvePath];
}

id objc_msgSend_resolveViewWithPath_(void *a1, const char *a2, ...)
{
  return [a1 resolveViewWithPath:];
}

id objc_msgSend_resolvedColorWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 resolvedColorWithTraitCollection:];
}

id objc_msgSend_resolvedCustomActions(void *a1, const char *a2, ...)
{
  return _[a1 resolvedCustomActions];
}

id objc_msgSend_resource(void *a1, const char *a2, ...)
{
  return _[a1 resource];
}

id objc_msgSend_resourceCollectorShouldIncludeEmbeddedForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 resourceCollectorShouldIncludeEmbeddedForIdentifier:];
}

id objc_msgSend_resourceCollectorViewStateForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 resourceCollectorViewStateForIdentifier:];
}

id objc_msgSend_resourceInstance(void *a1, const char *a2, ...)
{
  return _[a1 resourceInstance];
}

id objc_msgSend_resourceKind(void *a1, const char *a2, ...)
{
  return _[a1 resourceKind];
}

id objc_msgSend_resourceLoader(void *a1, const char *a2, ...)
{
  return _[a1 resourceLoader];
}

id objc_msgSend_resourceLoaderTask(void *a1, const char *a2, ...)
{
  return _[a1 resourceLoaderTask];
}

id objc_msgSend_resourceLoaderTaskWithURL_priority_completion_(void *a1, const char *a2, ...)
{
  return [a1 resourceLoaderTaskWithURL:priority:completion:];
}

id objc_msgSend_resourceOptions(void *a1, const char *a2, ...)
{
  return _[a1 resourceOptions];
}

id objc_msgSend_resourceRegistry(void *a1, const char *a2, ...)
{
  return _[a1 resourceRegistry];
}

id objc_msgSend_resources(void *a1, const char *a2, ...)
{
  return _[a1 resources];
}

id objc_msgSend_resourcesLoadedDate(void *a1, const char *a2, ...)
{
  return _[a1 resourcesLoadedDate];
}

id objc_msgSend_resourcesStartLoadingDate(void *a1, const char *a2, ...)
{
  return _[a1 resourcesStartLoadingDate];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_restoreViewStateForVisibleViews(void *a1, const char *a2, ...)
{
  return _[a1 restoreViewStateForVisibleViews];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeAndRebuildForReason_(void *a1, const char *a2, ...)
{
  return [a1 resumeAndRebuildForReason:];
}

id objc_msgSend_resumeAndRebuildWithEnvironment_state_transaction_(void *a1, const char *a2, ...)
{
  return [a1 resumeAndRebuildWithEnvironment:state:transaction:];
}

id objc_msgSend_resumeReuseOfView_(void *a1, const char *a2, ...)
{
  return [a1 resumeReuseOfView:];
}

id objc_msgSend_resumeSuspendedUpdates(void *a1, const char *a2, ...)
{
  return _[a1 resumeSuspendedUpdates];
}

id objc_msgSend_resumeUnload(void *a1, const char *a2, ...)
{
  return _[a1 resumeUnload];
}

id objc_msgSend_resumeUpdates(void *a1, const char *a2, ...)
{
  return _[a1 resumeUpdates];
}

id objc_msgSend_retinaScale(void *a1, const char *a2, ...)
{
  return _[a1 retinaScale];
}

id objc_msgSend_returnKeyType(void *a1, const char *a2, ...)
{
  return _[a1 returnKeyType];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 reuseIdentifier];
}

id objc_msgSend_reuseIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 reuseIdentifiers];
}

id objc_msgSend_reuseLayerForBoundsChange(void *a1, const char *a2, ...)
{
  return _[a1 reuseLayerForBoundsChange];
}

id objc_msgSend_reuseSubviews_host_(void *a1, const char *a2, ...)
{
  return [a1 reuseSubviews:host:];
}

id objc_msgSend_reverseEnumeratorForGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reverseEnumeratorForGroup:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rightTriggerName(void *a1, const char *a2, ...)
{
  return _[a1 rightTriggerName];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_roleFromString_(void *a1, const char *a2, ...)
{
  return [a1 roleFromString:];
}

id objc_msgSend_rootBox(void *a1, const char *a2, ...)
{
  return _[a1 rootBox];
}

id objc_msgSend_rootCollector(void *a1, const char *a2, ...)
{
  return _[a1 rootCollector];
}

id objc_msgSend_rootDictForPath_fileProvider_(void *a1, const char *a2, ...)
{
  return [a1 rootDictForPath:fileProvider:];
}

id objc_msgSend_rootElementNode(void *a1, const char *a2, ...)
{
  return _[a1 rootElementNode];
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return _[a1 rootLayer];
}

id objc_msgSend_rootLayout(void *a1, const char *a2, ...)
{
  return _[a1 rootLayout];
}

id objc_msgSend_rootNode(void *a1, const char *a2, ...)
{
  return _[a1 rootNode];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_rowSpacing(void *a1, const char *a2, ...)
{
  return _[a1 rowSpacing];
}

id objc_msgSend_rowSpan(void *a1, const char *a2, ...)
{
  return _[a1 rowSpan];
}

id objc_msgSend_rows(void *a1, const char *a2, ...)
{
  return _[a1 rows];
}

id objc_msgSend_ruleLayoutAxis(void *a1, const char *a2, ...)
{
  return _[a1 ruleLayoutAxis];
}

id objc_msgSend_runAppearanceAnimationIfNeededForViewState_(void *a1, const char *a2, ...)
{
  return [a1 runAppearanceAnimationIfNeededForViewState:];
}

id objc_msgSend_runAppearanceTransitionForViewState_barButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runAppearanceTransitionForViewState:barButtonItem:");
}

id objc_msgSend_runAppearanceTransitionForViewState_superview_(void *a1, const char *a2, ...)
{
  return [a1 runAppearanceTransitionForViewState:superview:];
}

id objc_msgSend_runDisappearanceTransitionForViewState_(void *a1, const char *a2, ...)
{
  return [a1 runDisappearanceTransitionForViewState:];
}

id objc_msgSend_runFromCache(void *a1, const char *a2, ...)
{
  return _[a1 runFromCache];
}

id objc_msgSend_runList(void *a1, const char *a2, ...)
{
  return _[a1 runList];
}

id objc_msgSend_runningInExtension(void *a1, const char *a2, ...)
{
  return _[a1 runningInExtension];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_sanitizedTraitCollection(void *a1, const char *a2, ...)
{
  return _[a1 sanitizedTraitCollection];
}

id objc_msgSend_saveState(void *a1, const char *a2, ...)
{
  return _[a1 saveState];
}

id objc_msgSend_saveViewStateForVisibleViews(void *a1, const char *a2, ...)
{
  return _[a1 saveViewStateForVisibleViews];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaleFromString_(void *a1, const char *a2, ...)
{
  return [a1 scaleFromString:];
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return [a1 scanHexInt:];
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return _[a1 scanLocation];
}

id objc_msgSend_scanUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 scanUnsignedLongLong:];
}

id objc_msgSend_scanUpToCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return [a1 scanUpToCharactersFromSet:intoString:];
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_scheduleLayoutUpdateWithTransaction_block_(void *a1, const char *a2, ...)
{
  return [a1 scheduleLayoutUpdateWithTransaction:block:];
}

id objc_msgSend_scheduleSyncTransaction_(void *a1, const char *a2, ...)
{
  return [a1 scheduleSyncTransaction:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_scopeBarContentSize(void *a1, const char *a2, ...)
{
  return _[a1 scopeBarContentSize];
}

id objc_msgSend_scopeBarContentView(void *a1, const char *a2, ...)
{
  return _[a1 scopeBarContentView];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _[a1 screen];
}

id objc_msgSend_screenCoordinatesForFrame_(void *a1, const char *a2, ...)
{
  return [a1 screenCoordinatesForFrame:];
}

id objc_msgSend_screenOffsetProvider(void *a1, const char *a2, ...)
{
  return _[a1 screenOffsetProvider];
}

id objc_msgSend_scrollAdditionalAXTranslation(void *a1, const char *a2, ...)
{
  return _[a1 scrollAdditionalAXTranslation];
}

id objc_msgSend_scrollAncestorForChildrenWithAncestor_(void *a1, const char *a2, ...)
{
  return [a1 scrollAncestorForChildrenWithAncestor:];
}

id objc_msgSend_scrollAncestorIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 scrollAncestorIdentifier];
}

id objc_msgSend_scrollAnchorWithScrollView_offset_(void *a1, const char *a2, ...)
{
  return [a1 scrollAnchorWithScrollView:offset:];
}

id objc_msgSend_scrollAxis(void *a1, const char *a2, ...)
{
  return _[a1 scrollAxis];
}

id objc_msgSend_scrollBox(void *a1, const char *a2, ...)
{
  return _[a1 scrollBox];
}

id objc_msgSend_scrollGradientFraction(void *a1, const char *a2, ...)
{
  return _[a1 scrollGradientFraction];
}

id objc_msgSend_scrollGradientInsets(void *a1, const char *a2, ...)
{
  return _[a1 scrollGradientInsets];
}

id objc_msgSend_scrollIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 scrollIdentifier];
}

id objc_msgSend_scrollLayoutSizeWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollLayoutSizeWithSize:");
}

id objc_msgSend_scrollPolicy(void *a1, const char *a2, ...)
{
  return _[a1 scrollPolicy];
}

id objc_msgSend_scrollRectToVisible_animated_(void *a1, const char *a2, ...)
{
  return [a1 scrollRectToVisible:animated:];
}

id objc_msgSend_scrollToItemsMatchingQuery_atScrollPosition_animated_skipVoiceOverFocus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToItemsMatchingQuery:atScrollPosition:animated:skipVoiceOverFocus:");
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _[a1 scrollView];
}

id objc_msgSend_scrollingDelegate(void *a1, const char *a2, ...)
{
  return _[a1 scrollingDelegate];
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return _[a1 searchBar];
}

id objc_msgSend_searchController(void *a1, const char *a2, ...)
{
  return _[a1 searchController];
}

id objc_msgSend_searchField(void *a1, const char *a2, ...)
{
  return _[a1 searchField];
}

id objc_msgSend_searchTextMaxLength(void *a1, const char *a2, ...)
{
  return _[a1 searchTextMaxLength];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _[a1 second];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 secondarySystemBackgroundColor];
}

id objc_msgSend_secondarySystemFillColor(void *a1, const char *a2, ...)
{
  return _[a1 secondarySystemFillColor];
}

id objc_msgSend_secondarySystemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 secondarySystemGroupedBackgroundColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sectionBottomY(void *a1, const char *a2, ...)
{
  return _[a1 sectionBottomY];
}

id objc_msgSend_sectionIndex(void *a1, const char *a2, ...)
{
  return _[a1 sectionIndex];
}

id objc_msgSend_sectionName(void *a1, const char *a2, ...)
{
  return _[a1 sectionName];
}

id objc_msgSend_sectionOffset(void *a1, const char *a2, ...)
{
  return _[a1 sectionOffset];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return _[a1 sections];
}

id objc_msgSend_seekToTime_(void *a1, const char *a2, ...)
{
  return [a1 seekToTime:];
}

id objc_msgSend_seekToTime_toleranceBefore_toleranceAfter_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 seekToTime:toleranceBefore:toleranceAfter:completionHandler:];
}

id objc_msgSend_segments(void *a1, const char *a2, ...)
{
  return _[a1 segments];
}

id objc_msgSend_select(void *a1, const char *a2, ...)
{
  return _[a1 select];
}

id objc_msgSend_selectIndex(void *a1, const char *a2, ...)
{
  return _[a1 selectIndex];
}

id objc_msgSend_selectedMediaOptionInMediaSelectionGroup_(void *a1, const char *a2, ...)
{
  return [a1 selectedMediaOptionInMediaSelectionGroup:];
}

id objc_msgSend_selectedSegmentIndex(void *a1, const char *a2, ...)
{
  return _[a1 selectedSegmentIndex];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return _[a1 semanticContentAttribute];
}

id objc_msgSend_sendActionsForControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 sendActionsForControlEvents:];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return _[a1 separatorColor];
}

id objc_msgSend_serialize(void *a1, const char *a2, ...)
{
  return _[a1 serialize];
}

id objc_msgSend_serviceConformingToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 serviceConformingToProtocol:];
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 sessionWithConfiguration:];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAXActions_(void *a1, const char *a2, ...)
{
  return [a1 setAXActions:];
}

id objc_msgSend_setAXElement_(void *a1, const char *a2, ...)
{
  return [a1 setAXElement:];
}

id objc_msgSend_setAcceptsDrop_(void *a1, const char *a2, ...)
{
  return [a1 setAcceptsDrop:];
}

id objc_msgSend_setAccessibilityContainer_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityContainer:];
}

id objc_msgSend_setAccessibilityContainerType_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityContainerType:];
}

id objc_msgSend_setAccessibilityContrast_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityContrast:];
}

id objc_msgSend_setAccessibilityCustomActions_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityCustomActions:];
}

id objc_msgSend_setAccessibilityElements_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityElements:];
}

id objc_msgSend_setAccessibilityElementsNeeded_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityElementsNeeded:];
}

id objc_msgSend_setAccessibilityFrameRelativeToScrollAncestor_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityFrameRelativeToScrollAncestor:];
}

id objc_msgSend_setAccessibilityHint_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityHint:];
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityIdentifier:];
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityLabel:];
}

id objc_msgSend_setAccessibilityTraits_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityTraits:];
}

id objc_msgSend_setAccessibilityValue_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityValue:];
}

id objc_msgSend_setAccumulatedLength_(void *a1, const char *a2, ...)
{
  return [a1 setAccumulatedLength:];
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return [a1 setAction:];
}

id objc_msgSend_setActionData_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setActionData:forKey:];
}

id objc_msgSend_setActionDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setActionDelegate:];
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setActionHandler:];
}

id objc_msgSend_setActionHandlerDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setActionHandlerDelegate:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setActiveAppearance_(void *a1, const char *a2, ...)
{
  return [a1 setActiveAppearance:];
}

id objc_msgSend_setActiveHost_(void *a1, const char *a2, ...)
{
  return [a1 setActiveHost:];
}

id objc_msgSend_setActiveHostOfPlayerForVideoId_videoUrl_host_(void *a1, const char *a2, ...)
{
  return [a1 setActiveHostOfPlayerForVideoId:videoUrl:host:];
}

id objc_msgSend_setActiveVideoPlayer_(void *a1, const char *a2, ...)
{
  return [a1 setActiveVideoPlayer:];
}

id objc_msgSend_setAdditive_(void *a1, const char *a2, ...)
{
  return [a1 setAdditive:];
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return [a1 setAffineTransform:];
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setAlignment:];
}

id objc_msgSend_setAllContentReadyDate_(void *a1, const char *a2, ...)
{
  return [a1 setAllContentReadyDate:];
}

id objc_msgSend_setAllowFullScreen_(void *a1, const char *a2, ...)
{
  return [a1 setAllowFullScreen:];
}

id objc_msgSend_setAllowHangingPunctuation_(void *a1, const char *a2, ...)
{
  return [a1 setAllowHangingPunctuation:];
}

id objc_msgSend_setAllowShrinkToFit_(void *a1, const char *a2, ...)
{
  return [a1 setAllowShrinkToFit:];
}

id objc_msgSend_setAllowedPressTypes_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedPressTypes:];
}

id objc_msgSend_setAllowedTouchTypes_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedTouchTypes:];
}

id objc_msgSend_setAllowsEnteringFullScreen_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsEnteringFullScreen:];
}

id objc_msgSend_setAllowsGroupBlending_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsGroupBlending:];
}

id objc_msgSend_setAllowsHitTesting_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsHitTesting:];
}

id objc_msgSend_setAllowsLastLineTruncation_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsLastLineTruncation:];
}

id objc_msgSend_setAllowsPictureInPicturePlayback_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsPictureInPicturePlayback:];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setAlpha:];
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return [a1 setAlwaysBounceVertical:];
}

id objc_msgSend_setAncestorScrollIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAncestorScrollIdentifier:];
}

id objc_msgSend_setAnchorOffset_(void *a1, const char *a2, ...)
{
  return [a1 setAnchorOffset:];
}

id objc_msgSend_setAnchorPoint_(void *a1, const char *a2, ...)
{
  return [a1 setAnchorPoint:];
}

id objc_msgSend_setAnchorPosition_(void *a1, const char *a2, ...)
{
  return [a1 setAnchorPosition:];
}

id objc_msgSend_setAnchorRefId_(void *a1, const char *a2, ...)
{
  return [a1 setAnchorRefId:];
}

id objc_msgSend_setAnimate_(void *a1, const char *a2, ...)
{
  return [a1 setAnimate:];
}

id objc_msgSend_setAnimationGroups_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationGroups:];
}

id objc_msgSend_setAnimationRenderModels_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationRenderModels:];
}

id objc_msgSend_setAnimations_(void *a1, const char *a2, ...)
{
  return [a1 setAnimations:];
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationsEnabled:];
}

id objc_msgSend_setApplyPhase_(void *a1, const char *a2, ...)
{
  return [a1 setApplyPhase:];
}

id objc_msgSend_setAscent_(void *a1, const char *a2, ...)
{
  return [a1 setAscent:];
}

id objc_msgSend_setAspectRatio_(void *a1, const char *a2, ...)
{
  return [a1 setAspectRatio:];
}

id objc_msgSend_setAssetKeysLoaded_(void *a1, const char *a2, ...)
{
  return [a1 setAssetKeysLoaded:];
}

id objc_msgSend_setAttributedPlaceholder_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedPlaceholder:];
}

id objc_msgSend_setAttributedTitle_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedTitle:];
}

id objc_msgSend_setAttributedTitle_forState_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedTitle:forState:];
}

id objc_msgSend_setAttributes_(void *a1, const char *a2, ...)
{
  return [a1 setAttributes:];
}

id objc_msgSend_setAutoPlay_(void *a1, const char *a2, ...)
{
  return [a1 setAutoPlay:];
}

id objc_msgSend_setAutoresizesSubviews_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizesSubviews:];
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizingMask:];
}

id objc_msgSend_setAxAdjustable_(void *a1, const char *a2, ...)
{
  return [a1 setAxAdjustable:];
}

id objc_msgSend_setAxAttributes_(void *a1, const char *a2, ...)
{
  return [a1 setAxAttributes:];
}

id objc_msgSend_setAxButton_(void *a1, const char *a2, ...)
{
  return [a1 setAxButton:];
}

id objc_msgSend_setAxCustomActions_(void *a1, const char *a2, ...)
{
  return [a1 setAxCustomActions:];
}

id objc_msgSend_setAxDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setAxDisabled:];
}

id objc_msgSend_setAxHeading_(void *a1, const char *a2, ...)
{
  return [a1 setAxHeading:];
}

id objc_msgSend_setAxHint_(void *a1, const char *a2, ...)
{
  return [a1 setAxHint:];
}

id objc_msgSend_setAxIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAxIdentifier:];
}

id objc_msgSend_setAxImage_(void *a1, const char *a2, ...)
{
  return [a1 setAxImage:];
}

id objc_msgSend_setAxLabel_(void *a1, const char *a2, ...)
{
  return [a1 setAxLabel:];
}

id objc_msgSend_setAxStaticText_(void *a1, const char *a2, ...)
{
  return [a1 setAxStaticText:];
}

id objc_msgSend_setAxToggle_(void *a1, const char *a2, ...)
{
  return [a1 setAxToggle:];
}

id objc_msgSend_setAxTouchContainer_(void *a1, const char *a2, ...)
{
  return [a1 setAxTouchContainer:];
}

id objc_msgSend_setAxValue_(void *a1, const char *a2, ...)
{
  return [a1 setAxValue:];
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return [a1 setAxis:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBackgroundKind_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundKind:];
}

id objc_msgSend_setBalanceSections_(void *a1, const char *a2, ...)
{
  return [a1 setBalanceSections:];
}

id objc_msgSend_setBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setBarButtonItem:];
}

id objc_msgSend_setBarButtonItem_forHostingIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setBarButtonItem:forHostingIdentifier:];
}

id objc_msgSend_setBarButtonItem_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setBarButtonItem:forIdentifier:];
}

id objc_msgSend_setBarTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setBarTintColor:];
}

id objc_msgSend_setBaseBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBaseBackgroundColor:];
}

id objc_msgSend_setBaseURL_(void *a1, const char *a2, ...)
{
  return [a1 setBaseURL:];
}

id objc_msgSend_setBaseUrl_(void *a1, const char *a2, ...)
{
  return [a1 setBaseUrl:];
}

id objc_msgSend_setBaseline_(void *a1, const char *a2, ...)
{
  return [a1 setBaseline:];
}

id objc_msgSend_setBaselineAdjustment_(void *a1, const char *a2, ...)
{
  return [a1 setBaselineAdjustment:];
}

id objc_msgSend_setBaselineOffset_(void *a1, const char *a2, ...)
{
  return [a1 setBaselineOffset:];
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return [a1 setBeginTime:];
}

id objc_msgSend_setBehavior_(void *a1, const char *a2, ...)
{
  return [a1 setBehavior:];
}

id objc_msgSend_setBehaviors_(void *a1, const char *a2, ...)
{
  return [a1 setBehaviors:];
}

id objc_msgSend_setBinding_(void *a1, const char *a2, ...)
{
  return [a1 setBinding:];
}

id objc_msgSend_setBlendMode_(void *a1, const char *a2, ...)
{
  return [a1 setBlendMode:];
}

id objc_msgSend_setBlurStyle_(void *a1, const char *a2, ...)
{
  return [a1 setBlurStyle:];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setBool:forKey:];
}

id objc_msgSend_setBoolValue_forProperty_(void *a1, const char *a2, ...)
{
  return [a1 setBoolValue:forProperty:];
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return [a1 setBorderColor:];
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return [a1 setBorderWidth:];
}

id objc_msgSend_setBottomTriggerName_(void *a1, const char *a2, ...)
{
  return [a1 setBottomTriggerName:];
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return [a1 setBounds:];
}

id objc_msgSend_setButtonRole_(void *a1, const char *a2, ...)
{
  return [a1 setButtonRole:];
}

id objc_msgSend_setButtonType_(void *a1, const char *a2, ...)
{
  return [a1 setButtonType:];
}

id objc_msgSend_setButtonWidth_(void *a1, const char *a2, ...)
{
  return [a1 setButtonWidth:];
}

id objc_msgSend_setByAddingAttributesFromArray_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingAttributesFromArray:];
}

id objc_msgSend_setCalculatedInsetForFooterText_(void *a1, const char *a2, ...)
{
  return [a1 setCalculatedInsetForFooterText:];
}

id objc_msgSend_setCalculatedInsetForTitleText_(void *a1, const char *a2, ...)
{
  return [a1 setCalculatedInsetForTitleText:];
}

id objc_msgSend_setCanHidePlaybackControls_(void *a1, const char *a2, ...)
{
  return [a1 setCanHidePlaybackControls:];
}

id objc_msgSend_setCanPausePlaybackWhenExitingFullScreen_(void *a1, const char *a2, ...)
{
  return [a1 setCanPausePlaybackWhenExitingFullScreen:];
}

id objc_msgSend_setCanToggleVideoGravityWhenEmbeddedInline_(void *a1, const char *a2, ...)
{
  return [a1 setCanToggleVideoGravityWhenEmbeddedInline:];
}

id objc_msgSend_setCancelText_(void *a1, const char *a2, ...)
{
  return [a1 setCancelText:];
}

id objc_msgSend_setCapHeight_(void *a1, const char *a2, ...)
{
  return [a1 setCapHeight:];
}

id objc_msgSend_setCapture_(void *a1, const char *a2, ...)
{
  return [a1 setCapture:];
}

id objc_msgSend_setCategories_(void *a1, const char *a2, ...)
{
  return [a1 setCategories:];
}

id objc_msgSend_setCategory_withOptions_error_(void *a1, const char *a2, ...)
{
  return [a1 setCategory:withOptions:error:];
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return [a1 setCenter:];
}

id objc_msgSend_setCharCount_(void *a1, const char *a2, ...)
{
  return [a1 setCharCount:];
}

id objc_msgSend_setCharacterStyle_range_undoTransaction_(void *a1, const char *a2, ...)
{
  return [a1 setCharacterStyle:range:undoTransaction:];
}

id objc_msgSend_setChartType_(void *a1, const char *a2, ...)
{
  return [a1 setChartType:];
}

id objc_msgSend_setChildren_(void *a1, const char *a2, ...)
{
  return [a1 setChildren:];
}

id objc_msgSend_setCircular_(void *a1, const char *a2, ...)
{
  return [a1 setCircular:];
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setClipsToBounds:];
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return [a1 setColor:];
}

id objc_msgSend_setColors_(void *a1, const char *a2, ...)
{
  return [a1 setColors:];
}

id objc_msgSend_setColumnMultiple_(void *a1, const char *a2, ...)
{
  return [a1 setColumnMultiple:];
}

id objc_msgSend_setColumnSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setColumnSpacing:];
}

id objc_msgSend_setColumnSpan_(void *a1, const char *a2, ...)
{
  return [a1 setColumnSpan:];
}

id objc_msgSend_setColumnWidth_(void *a1, const char *a2, ...)
{
  return [a1 setColumnWidth:];
}

id objc_msgSend_setColumns_(void *a1, const char *a2, ...)
{
  return [a1 setColumns:];
}

id objc_msgSend_setCompositingFilter_(void *a1, const char *a2, ...)
{
  return [a1 setCompositingFilter:];
}

id objc_msgSend_setComputedHeight_(void *a1, const char *a2, ...)
{
  return [a1 setComputedHeight:];
}

id objc_msgSend_setComputedNaturalSize_(void *a1, const char *a2, ...)
{
  return [a1 setComputedNaturalSize:];
}

id objc_msgSend_setComputedOrigin_(void *a1, const char *a2, ...)
{
  return [a1 setComputedOrigin];
}

id objc_msgSend_setComputedWidth_(void *a1, const char *a2, ...)
{
  return [a1 setComputedWidth:];
}

id objc_msgSend_setComputingIntrinsic_(void *a1, const char *a2, ...)
{
  return [a1 setComputingIntrinsic:];
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setConfiguration:];
}

id objc_msgSend_setContainerFraction_(void *a1, const char *a2, ...)
{
  return [a1 setContainerFraction:];
}

id objc_msgSend_setContainerView_(void *a1, const char *a2, ...)
{
  return [a1 setContainerView:];
}

id objc_msgSend_setContainers_(void *a1, const char *a2, ...)
{
  return [a1 setContainers:];
}

id objc_msgSend_setContainingHeight_(void *a1, const char *a2, ...)
{
  return [a1 setContainingHeight:];
}

id objc_msgSend_setContainingMaxWidth_(void *a1, const char *a2, ...)
{
  return [a1 setContainingMaxWidth:];
}

id objc_msgSend_setContainingWidth_(void *a1, const char *a2, ...)
{
  return [a1 setContainingWidth:];
}

id objc_msgSend_setContainmentSupport_(void *a1, const char *a2, ...)
{
  return [a1 setContainmentSupport:];
}

id objc_msgSend_setContentCompositingFilter_(void *a1, const char *a2, ...)
{
  return [a1 setContentCompositingFilter:];
}

id objc_msgSend_setContentHeightFactorForScrollingGuess_(void *a1, const char *a2, ...)
{
  return [a1 setContentHeightFactorForScrollingGuess:];
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return [a1 setContentInset:];
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return [a1 setContentMode:];
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return [a1 setContentOffset:];
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return [a1 setContentOffset:animated:];
}

id objc_msgSend_setContentScrollView_forEdge_(void *a1, const char *a2, ...)
{
  return [a1 setContentScrollView:forEdge:];
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setContentSize:];
}

id objc_msgSend_setContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 setContentSizeCategory:];
}

id objc_msgSend_setContentUpdateDate_(void *a1, const char *a2, ...)
{
  return [a1 setContentUpdateDate:];
}

id objc_msgSend_setContentWidth_(void *a1, const char *a2, ...)
{
  return [a1 setContentWidth:];
}

id objc_msgSend_setContents_(void *a1, const char *a2, ...)
{
  return [a1 setContents:];
}

id objc_msgSend_setContentsFormat_(void *a1, const char *a2, ...)
{
  return [a1 setContentsFormat:];
}

id objc_msgSend_setContentsGravity_(void *a1, const char *a2, ...)
{
  return [a1 setContentsGravity:];
}

id objc_msgSend_setContentsMultiplyColor_(void *a1, const char *a2, ...)
{
  return [a1 setContentsMultiplyColor:];
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return [a1 setContentsScale:];
}

id objc_msgSend_setContentsSwizzle_(void *a1, const char *a2, ...)
{
  return [a1 setContentsSwizzle:];
}

id objc_msgSend_setContextMenuInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setContextMenuInteractionEnabled:];
}

id objc_msgSend_setContinuousCorners_(void *a1, const char *a2, ...)
{
  return [a1 setContinuousCorners:];
}

id objc_msgSend_setControl_(void *a1, const char *a2, ...)
{
  return [a1 setControl:];
}

id objc_msgSend_setControlIsOn_animated_(void *a1, const char *a2, ...)
{
  return [a1 setControlIsOn:animated:];
}

id objc_msgSend_setControllerHost_(void *a1, const char *a2, ...)
{
  return [a1 setControllerHost:];
}

id objc_msgSend_setCornerCurve_(void *a1, const char *a2, ...)
{
  return [a1 setCornerCurve:];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCreationDate_(void *a1, const char *a2, ...)
{
  return [a1 setCreationDate:];
}

id objc_msgSend_setCrossfadesContents_(void *a1, const char *a2, ...)
{
  return [a1 setCrossfadesContents:];
}

id objc_msgSend_setCumulative_(void *a1, const char *a2, ...)
{
  return [a1 setCumulative:];
}

id objc_msgSend_setCurrentOffset_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentOffset:];
}

id objc_msgSend_setCurrentScale_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentScale:];
}

id objc_msgSend_setCurrentViewState_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentViewState:];
}

id objc_msgSend_setCursor_(void *a1, const char *a2, ...)
{
  return [a1 setCursor:];
}

id objc_msgSend_setCustomView_(void *a1, const char *a2, ...)
{
  return [a1 setCustomView:];
}

id objc_msgSend_setDamping_(void *a1, const char *a2, ...)
{
  return [a1 setDamping:];
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return [a1 setData:];
}

id objc_msgSend_setDataAugmenter_(void *a1, const char *a2, ...)
{
  return [a1 setDataAugmenter:];
}

id objc_msgSend_setDataMapper_(void *a1, const char *a2, ...)
{
  return [a1 setDataMapper:];
}

id objc_msgSend_setDebug_(void *a1, const char *a2, ...)
{
  return [a1 setDebug:];
}

id objc_msgSend_setDecelerationRate_(void *a1, const char *a2, ...)
{
  return [a1 setDecelerationRate:];
}

id objc_msgSend_setDecrementAction_(void *a1, const char *a2, ...)
{
  return [a1 setDecrementAction:];
}

id objc_msgSend_setDefaultAction_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultAction:];
}

id objc_msgSend_setDefaultOrigin_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultOrigin:];
}

id objc_msgSend_setDefaultPosition_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultPosition:];
}

id objc_msgSend_setDefaultScale_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultScale:];
}

id objc_msgSend_setDefaultSize_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultSize:];
}

id objc_msgSend_setDelay_(void *a1, const char *a2, ...)
{
  return [a1 setDelay:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDeletedModels_(void *a1, const char *a2, ...)
{
  return [a1 setDeletedModels:];
}

id objc_msgSend_setDeletes_(void *a1, const char *a2, ...)
{
  return [a1 setDeletes:];
}

id objc_msgSend_setDescendentEnvironmentUseMask_(void *a1, const char *a2, ...)
{
  return [a1 setDescendentEnvironmentUseMask:];
}

id objc_msgSend_setDescent_(void *a1, const char *a2, ...)
{
  return [a1 setDescent:];
}

id objc_msgSend_setDeviceClass_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceClass:];
}

id objc_msgSend_setDictionary_(void *a1, const char *a2, ...)
{
  return [a1 setDictionary:];
}

id objc_msgSend_setDidExamineChildren_(void *a1, const char *a2, ...)
{
  return [a1 setDidExamineChildren:];
}

id objc_msgSend_setDirectEnvironmentUseMask_(void *a1, const char *a2, ...)
{
  return [a1 setDirectEnvironmentUseMask:];
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return [a1 setDisableActions:];
}

id objc_msgSend_setDisplayClass_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayClass:];
}

id objc_msgSend_setDisplayGamut_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayGamut:];
}

id objc_msgSend_setDisplayScale_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayScale:];
}

id objc_msgSend_setDocumentDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDocumentDuration:];
}

id objc_msgSend_setDragDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDragDelegate:];
}

id objc_msgSend_setDropHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDropHandler:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setDynamicController_(void *a1, const char *a2, ...)
{
  return [a1 setDynamicController:];
}

id objc_msgSend_setDynamicProgress_(void *a1, const char *a2, ...)
{
  return [a1 setDynamicProgress:];
}

id objc_msgSend_setDynamicRegistry_(void *a1, const char *a2, ...)
{
  return [a1 setDynamicRegistry:];
}

id objc_msgSend_setDynamicUpdateDate_(void *a1, const char *a2, ...)
{
  return [a1 setDynamicUpdateDate:];
}

id objc_msgSend_setDynamicViewState_(void *a1, const char *a2, ...)
{
  return [a1 setDynamicViewState:];
}

id objc_msgSend_setEditingInsets_(void *a1, const char *a2, ...)
{
  return [a1 setEditingInsets:];
}

id objc_msgSend_setEffect_(void *a1, const char *a2, ...)
{
  return [a1 setEffect:];
}

id objc_msgSend_setElementRegistry_(void *a1, const char *a2, ...)
{
  return [a1 setElementRegistry:];
}

id objc_msgSend_setEmbeddedScrollAnchors_(void *a1, const char *a2, ...)
{
  return [a1 setEmbeddedScrollAnchors:];
}

id objc_msgSend_setEmbeddedState_(void *a1, const char *a2, ...)
{
  return [a1 setEmbeddedState:];
}

id objc_msgSend_setEnableBackgroundForHighlightPreview_(void *a1, const char *a2, ...)
{
  return [a1 setEnableBackgroundForHighlightPreview:];
}

id objc_msgSend_setEnableShadowForHighlightPreview_(void *a1, const char *a2, ...)
{
  return [a1 setEnableShadowForHighlightPreview:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setEnd_(void *a1, const char *a2, ...)
{
  return [a1 setEnd:];
}

id objc_msgSend_setEndPoint_(void *a1, const char *a2, ...)
{
  return [a1 setEndPoint:];
}

id objc_msgSend_setEntries_(void *a1, const char *a2, ...)
{
  return [a1 setEntries:];
}

id objc_msgSend_setEntry_(void *a1, const char *a2, ...)
{
  return [a1 setEntry:];
}

id objc_msgSend_setEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 setEnvironment:];
}

id objc_msgSend_setEnvironmentNeedsUpdate_(void *a1, const char *a2, ...)
{
  return [a1 setEnvironmentNeedsUpdate:];
}

id objc_msgSend_setEstimatedHeight_(void *a1, const char *a2, ...)
{
  return [a1 setEstimatedHeight:];
}

id objc_msgSend_setEstimatedHeightAbovePivot_(void *a1, const char *a2, ...)
{
  return [a1 setEstimatedHeightAbovePivot:];
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return [a1 setEstimatedRowHeight:];
}

id objc_msgSend_setEstimatedWidth_(void *a1, const char *a2, ...)
{
  return [a1 setEstimatedWidth:];
}

id objc_msgSend_setEventProvider_(void *a1, const char *a2, ...)
{
  return [a1 setEventProvider:];
}

id objc_msgSend_setExitsFullScreenWhenPlaybackEnds_(void *a1, const char *a2, ...)
{
  return [a1 setExitsFullScreenWhenPlaybackEnds:];
}

id objc_msgSend_setExpandableMoreWidth_(void *a1, const char *a2, ...)
{
  return [a1 setExpandableMoreWidth:];
}

id objc_msgSend_setFactory_(void *a1, const char *a2, ...)
{
  return [a1 setFactory:];
}

id objc_msgSend_setFailureCount_(void *a1, const char *a2, ...)
{
  return [a1 setFailureCount:];
}

id objc_msgSend_setFailureReason_(void *a1, const char *a2, ...)
{
  return [a1 setFailureReason:];
}

id objc_msgSend_setFallbackColor_(void *a1, const char *a2, ...)
{
  return [a1 setFallbackColor:];
}

id objc_msgSend_setFeedScrollAnchor_(void *a1, const char *a2, ...)
{
  return [a1 setFeedScrollAnchor:];
}

id objc_msgSend_setFetchBatchSize_(void *a1, const char *a2, ...)
{
  return [a1 setFetchBatchSize:];
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return [a1 setFetchLimit:];
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return [a1 setFillColor:];
}

id objc_msgSend_setFilter_(void *a1, const char *a2, ...)
{
  return [a1 setFilter:];
}

id objc_msgSend_setFilterInfo_(void *a1, const char *a2, ...)
{
  return [a1 setFilterInfo:];
}

id objc_msgSend_setFilterRegistry_(void *a1, const char *a2, ...)
{
  return [a1 setFilterRegistry:];
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return [a1 setFilters:];
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return [a1 setFlags:];
}

id objc_msgSend_setFlexedHeight_(void *a1, const char *a2, ...)
{
  return [a1 setFlexedHeight:];
}

id objc_msgSend_setFlexedWidth_(void *a1, const char *a2, ...)
{
  return [a1 setFlexedWidth:];
}

id objc_msgSend_setFlipsHorizontal_(void *a1, const char *a2, ...)
{
  return [a1 setFlipsHorizontal:];
}

id objc_msgSend_setFlipsHorizontalAxis_(void *a1, const char *a2, ...)
{
  return [a1 setFlipsHorizontalAxis:];
}

id objc_msgSend_setFloatValue_forProperty_(void *a1, const char *a2, ...)
{
  return [a1 setFloatValue:forProperty:];
}

id objc_msgSend_setFloatingLiveTransform_(void *a1, const char *a2, ...)
{
  return [a1 setFloatingLiveTransform:];
}

id objc_msgSend_setFocusStyle_(void *a1, const char *a2, ...)
{
  return [a1 setFocusStyle:];
}

id objc_msgSend_setFollowingLineCount_(void *a1, const char *a2, ...)
{
  return [a1 setFollowingLineCount:];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setFontAttributes_(void *a1, const char *a2, ...)
{
  return [a1 setFontAttributes:];
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return [a1 setFontSize:];
}

id objc_msgSend_setFontSpec_(void *a1, const char *a2, ...)
{
  return [a1 setFontSpec:];
}

id objc_msgSend_setFooter_(void *a1, const char *a2, ...)
{
  return [a1 setFooter:];
}

id objc_msgSend_setForceVisibleOnHover_(void *a1, const char *a2, ...)
{
  return [a1 setForceVisibleOnHover:];
}

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setForegroundColor:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setFrom_(void *a1, const char *a2, ...)
{
  return [a1 setFrom:];
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return [a1 setFromValue:];
}

id objc_msgSend_setGeneric_(void *a1, const char *a2, ...)
{
  return [a1 setGeneric:];
}

id objc_msgSend_setGeometry_(void *a1, const char *a2, ...)
{
  return [a1 setGeometry:];
}

id objc_msgSend_setGeometryFlipped_(void *a1, const char *a2, ...)
{
  return [a1 setGeometryFlipped:];
}

id objc_msgSend_setGlobalsEnvironmentUseMask_(void *a1, const char *a2, ...)
{
  return [a1 setGlobalsEnvironmentUseMask:];
}

id objc_msgSend_setGradientBlurOffset_(void *a1, const char *a2, ...)
{
  return [a1 setGradientBlurOffset:];
}

id objc_msgSend_setGradientBlurRadius_(void *a1, const char *a2, ...)
{
  return [a1 setGradientBlurRadius:];
}

id objc_msgSend_setGradientDirection_(void *a1, const char *a2, ...)
{
  return [a1 setGradientDirection:];
}

id objc_msgSend_setGradientEndColor_(void *a1, const char *a2, ...)
{
  return [a1 setGradientEndColor:];
}

id objc_msgSend_setGradientEndPosition_(void *a1, const char *a2, ...)
{
  return [a1 setGradientEndPosition:];
}

id objc_msgSend_setGradientFraction_(void *a1, const char *a2, ...)
{
  return [a1 setGradientFraction:];
}

id objc_msgSend_setGradientInsets_(void *a1, const char *a2, ...)
{
  return [a1 setGradientInsets:];
}

id objc_msgSend_setGradientStartColor_(void *a1, const char *a2, ...)
{
  return [a1 setGradientStartColor:];
}

id objc_msgSend_setGradientStartPosition_(void *a1, const char *a2, ...)
{
  return [a1 setGradientStartPosition:];
}

id objc_msgSend_setGradientWidth_(void *a1, const char *a2, ...)
{
  return [a1 setGradientWidth:];
}

id objc_msgSend_setGravity_(void *a1, const char *a2, ...)
{
  return [a1 setGravity:];
}

id objc_msgSend_setGroupName_(void *a1, const char *a2, ...)
{
  return [a1 setGroupName:];
}

id objc_msgSend_setGroupPhases_(void *a1, const char *a2, ...)
{
  return [a1 setGroupPhases:];
}

id objc_msgSend_setGrouped_(void *a1, const char *a2, ...)
{
  return [a1 setGrouped:];
}

id objc_msgSend_setGroups_(void *a1, const char *a2, ...)
{
  return [a1 setGroups:];
}

id objc_msgSend_setGuideBottom_(void *a1, const char *a2, ...)
{
  return [a1 setGuideBottom:];
}

id objc_msgSend_setGuideLayoutController_(void *a1, const char *a2, ...)
{
  return [a1 setGuideLayoutController:];
}

id objc_msgSend_setGuideLeading_(void *a1, const char *a2, ...)
{
  return [a1 setGuideLeading:];
}

id objc_msgSend_setGuideTop_(void *a1, const char *a2, ...)
{
  return [a1 setGuideTop:];
}

id objc_msgSend_setGuideTrailing_(void *a1, const char *a2, ...)
{
  return [a1 setGuideTrailing:];
}

id objc_msgSend_setGuides_(void *a1, const char *a2, ...)
{
  return [a1 setGuides:];
}

id objc_msgSend_setHalign_(void *a1, const char *a2, ...)
{
  return [a1 setHalign:];
}

id objc_msgSend_setHasContextMenu_(void *a1, const char *a2, ...)
{
  return [a1 setHasContextMenu:];
}

id objc_msgSend_setHcompressed_(void *a1, const char *a2, ...)
{
  return [a1 setHcompressed:];
}

id objc_msgSend_setHeader_(void *a1, const char *a2, ...)
{
  return [a1 setHeader:];
}

id objc_msgSend_setHeight_(void *a1, const char *a2, ...)
{
  return [a1 setHeight:];
}

id objc_msgSend_setHeightClass_(void *a1, const char *a2, ...)
{
  return [a1 setHeightClass:];
}

id objc_msgSend_setHflipForRTL_(void *a1, const char *a2, ...)
{
  return [a1 setHflipForRTL:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHideEllipses_(void *a1, const char *a2, ...)
{
  return [a1 setHideEllipses:];
}

id objc_msgSend_setHidesNavigationBarDuringPresentation_(void *a1, const char *a2, ...)
{
  return [a1 setHidesNavigationBarDuringPresentation:];
}

id objc_msgSend_setHidesSearchBarWhenScrolling_(void *a1, const char *a2, ...)
{
  return [a1 setHidesSearchBarWhenScrolling:];
}

id objc_msgSend_setHidesWhenStopped_(void *a1, const char *a2, ...)
{
  return [a1 setHidesWhenStopped:];
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return [a1 setHighlighted:];
}

id objc_msgSend_setHitPadding_(void *a1, const char *a2, ...)
{
  return [a1 setHitPadding:];
}

id objc_msgSend_setHorizontalSizeClass_(void *a1, const char *a2, ...)
{
  return [a1 setHorizontalSizeClass:];
}

id objc_msgSend_setHostingIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setHostingIdentifier:];
}

id objc_msgSend_setHostingIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 setHostingIdentifiers:];
}

id objc_msgSend_setHostingProperities_(void *a1, const char *a2, ...)
{
  return [a1 setHostingProperities:];
}

id objc_msgSend_setHostingProperties_(void *a1, const char *a2, ...)
{
  return [a1 setHostingProperties:];
}

id objc_msgSend_setHspacing_(void *a1, const char *a2, ...)
{
  return [a1 setHspacing:];
}

id objc_msgSend_setId_(void *a1, const char *a2, ...)
{
  return [a1 setId:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setIgnoreInsetsForOpacityTrigger_(void *a1, const char *a2, ...)
{
  return [a1 setIgnoreInsetsForOpacityTrigger];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setImage_forSearchBarIcon_state_(void *a1, const char *a2, ...)
{
  return [a1 setImage:forSearchBarIcon:state:];
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return [a1 setImage:forState:];
}

id objc_msgSend_setImageModel_(void *a1, const char *a2, ...)
{
  return [a1 setImageModel:];
}

id objc_msgSend_setImageModelIDToResource_(void *a1, const char *a2, ...)
{
  return [a1 setImageModelIDToResource:];
}

id objc_msgSend_setImageResourceCache_(void *a1, const char *a2, ...)
{
  return [a1 setImageResourceCache:];
}

id objc_msgSend_setImpressionData_(void *a1, const char *a2, ...)
{
  return [a1 setImpressionData:];
}

id objc_msgSend_setImpressionSnapshot_(void *a1, const char *a2, ...)
{
  return [a1 setImpressionSnapshot:];
}

id objc_msgSend_setIncrementAction_(void *a1, const char *a2, ...)
{
  return [a1 setIncrementAction:];
}

id objc_msgSend_setIndentFirstLine_(void *a1, const char *a2, ...)
{
  return [a1 setIndentFirstLine:];
}

id objc_msgSend_setIndentLeading_(void *a1, const char *a2, ...)
{
  return [a1 setIndentLeading];
}

id objc_msgSend_setIndentTrailing_(void *a1, const char *a2, ...)
{
  return [a1 setIndentTrailing:];
}

id objc_msgSend_setIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 setIndexPath:];
}

id objc_msgSend_setInitialContentReadyDate_(void *a1, const char *a2, ...)
{
  return [a1 setInitialContentReadyDate:];
}

id objc_msgSend_setInitialLayoutStartDate_(void *a1, const char *a2, ...)
{
  return [a1 setInitialLayoutStartDate:];
}

id objc_msgSend_setInitialVelocity_(void *a1, const char *a2, ...)
{
  return [a1 setInitialVelocity:];
}

id objc_msgSend_setInserts_(void *a1, const char *a2, ...)
{
  return [a1 setInserts:];
}

id objc_msgSend_setInsets_(void *a1, const char *a2, ...)
{
  return [a1 setInsets:];
}

id objc_msgSend_setInstance_(void *a1, const char *a2, ...)
{
  return [a1 setInstance:];
}

id objc_msgSend_setInstantiateResult_(void *a1, const char *a2, ...)
{
  return [a1 setInstantiateResult:];
}

id objc_msgSend_setIntValue_forProperty_(void *a1, const char *a2, ...)
{
  return [a1 setIntValue:forProperty:];
}

id objc_msgSend_setInterLevelSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setInterLevelSpacing:];
}

id objc_msgSend_setIntrinsicContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setIntrinsicContentSize:];
}

id objc_msgSend_setIntrinsicHeight_(void *a1, const char *a2, ...)
{
  return [a1 setIntrinsicHeight:];
}

id objc_msgSend_setIntrinsicWidth_(void *a1, const char *a2, ...)
{
  return [a1 setIntrinsicWidth:];
}

id objc_msgSend_setInvalidChildren_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidChildren:];
}

id objc_msgSend_setIsAccessibilityElement_(void *a1, const char *a2, ...)
{
  return [a1 setIsAccessibilityElement:];
}

id objc_msgSend_setIsControl_(void *a1, const char *a2, ...)
{
  return [a1 setIsControl:];
}

id objc_msgSend_setIsDefault_(void *a1, const char *a2, ...)
{
  return [a1 setIsDefault:];
}

id objc_msgSend_setIsEditableControl_(void *a1, const char *a2, ...)
{
  return [a1 setIsEditableControl:];
}

id objc_msgSend_setIsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setIsEnabled:];
}

id objc_msgSend_setIsInline_(void *a1, const char *a2, ...)
{
  return [a1 setIsInline:];
}

id objc_msgSend_setIsOn_(void *a1, const char *a2, ...)
{
  return [a1 setIsOn:];
}

id objc_msgSend_setIsWithinVisibleBounds_(void *a1, const char *a2, ...)
{
  return [a1 setIsWithinVisibleBounds:];
}

id objc_msgSend_setItemIsReadyToPlay_(void *a1, const char *a2, ...)
{
  return [a1 setItemIsReadyToPlay:];
}

id objc_msgSend_setItemType_(void *a1, const char *a2, ...)
{
  return [a1 setItemType:];
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return [a1 setKey:];
}

id objc_msgSend_setKeyboardAppearance_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardAppearance:];
}

id objc_msgSend_setKind_(void *a1, const char *a2, ...)
{
  return [a1 setKind:];
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return [a1 setLabel:];
}

id objc_msgSend_setLanguage_(void *a1, const char *a2, ...)
{
  return [a1 setLanguage:];
}

id objc_msgSend_setLargeContentTitle_(void *a1, const char *a2, ...)
{
  return [a1 setLargeContentTitle:];
}

id objc_msgSend_setLastPlaybackTime_(void *a1, const char *a2, ...)
{
  return [a1 setLastPlaybackTime:];
}

id objc_msgSend_setLayout_(void *a1, const char *a2, ...)
{
  return [a1 setLayout:];
}

id objc_msgSend_setLayoutAttributes_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutAttributes:];
}

id objc_msgSend_setLayoutDirection_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutDirection:];
}

id objc_msgSend_setLayoutIsInvalid_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutIsInvalid:];
}

id objc_msgSend_setLayoutMode_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutMode:];
}

id objc_msgSend_setLayoutPhase_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutPhase:];
}

id objc_msgSend_setLayoutState_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutState:];
}

id objc_msgSend_setLeftBarButtonItems_animated_(void *a1, const char *a2, ...)
{
  return [a1 setLeftBarButtonItems:animated:];
}

id objc_msgSend_setLeftTriggerName_(void *a1, const char *a2, ...)
{
  return [a1 setLeftTriggerName:];
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return [a1 setLength:];
}

id objc_msgSend_setLevelCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setLevelCornerRadius:];
}

id objc_msgSend_setLevelGuttersColor_(void *a1, const char *a2, ...)
{
  return [a1 setLevelGuttersColor:];
}

id objc_msgSend_setLevelWidth_(void *a1, const char *a2, ...)
{
  return [a1 setLevelWidth:];
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return [a1 setLineBreakMode:];
}

id objc_msgSend_setLineCap_(void *a1, const char *a2, ...)
{
  return [a1 setLineCap:];
}

id objc_msgSend_setLineSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setLineSpacing:];
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return [a1 setLineWidth:];
}

id objc_msgSend_setLines_(void *a1, const char *a2, ...)
{
  return [a1 setLines:];
}

id objc_msgSend_setLinkEntities_(void *a1, const char *a2, ...)
{
  return [a1 setLinkEntities:];
}

id objc_msgSend_setList_(void *a1, const char *a2, ...)
{
  return [a1 setList:];
}

id objc_msgSend_setLiveTransform_(void *a1, const char *a2, ...)
{
  return [a1 setLiveTransform:];
}

id objc_msgSend_setLiveTransformAncestorIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setLiveTransformAncestorIdentifier:];
}

id objc_msgSend_setLiveTransformKind_(void *a1, const char *a2, ...)
{
  return [a1 setLiveTransformKind:];
}

id objc_msgSend_setLoad_(void *a1, const char *a2, ...)
{
  return [a1 setLoad:];
}

id objc_msgSend_setLocations_(void *a1, const char *a2, ...)
{
  return [a1 setLocations:];
}

id objc_msgSend_setLoop_(void *a1, const char *a2, ...)
{
  return [a1 setLoop:];
}

id objc_msgSend_setLoopingStateForPlayerWithVideoId_loop_requestingHost_(void *a1, const char *a2, ...)
{
  return [a1 setLoopingStateForPlayerWithVideoId:loop:requestingHost:];
}

id objc_msgSend_setManager_(void *a1, const char *a2, ...)
{
  return [a1 setManager:];
}

id objc_msgSend_setManuallyScheduleUpdates_(void *a1, const char *a2, ...)
{
  return [a1 setManuallyScheduleUpdates:];
}

id objc_msgSend_setMask_(void *a1, const char *a2, ...)
{
  return [a1 setMask:];
}

id objc_msgSend_setMaskColor_(void *a1, const char *a2, ...)
{
  return [a1 setMaskColor:];
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setMasksToBounds:];
}

id objc_msgSend_setMass_(void *a1, const char *a2, ...)
{
  return [a1 setMass:];
}

id objc_msgSend_setMatchedUUID_(void *a1, const char *a2, ...)
{
  return [a1 setMatchedUUID];
}

id objc_msgSend_setMaxAspectRatio_(void *a1, const char *a2, ...)
{
  return [a1 setMaxAspectRatio:];
}

id objc_msgSend_setMaxButtonWidth_(void *a1, const char *a2, ...)
{
  return [a1 setMaxButtonWidth:];
}

id objc_msgSend_setMaxColumns_(void *a1, const char *a2, ...)
{
  return [a1 setMaxColumns:];
}

id objc_msgSend_setMaxLineCount_(void *a1, const char *a2, ...)
{
  return [a1 setMaxLineCount:];
}

id objc_msgSend_setMaxLines_(void *a1, const char *a2, ...)
{
  return [a1 setMaxLines:];
}

id objc_msgSend_setMaxPages_(void *a1, const char *a2, ...)
{
  return [a1 setMaxPages:];
}

id objc_msgSend_setMaxScale_(void *a1, const char *a2, ...)
{
  return [a1 setMaxScale:];
}

id objc_msgSend_setMaximumLevelHeight_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumLevelHeight:];
}

id objc_msgSend_setMaximumLineHeight_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumLineHeight:];
}

id objc_msgSend_setMenu_(void *a1, const char *a2, ...)
{
  return [a1 setMenu:];
}

id objc_msgSend_setMenuContainer_(void *a1, const char *a2, ...)
{
  return [a1 setMenuContainer:];
}

id objc_msgSend_setMenuIsPrimary_(void *a1, const char *a2, ...)
{
  return [a1 setMenuIsPrimary:];
}

id objc_msgSend_setMenuModel_(void *a1, const char *a2, ...)
{
  return [a1 setMenuModel:];
}

id objc_msgSend_setMinButtonWidth_(void *a1, const char *a2, ...)
{
  return [a1 setMinButtonWidth:];
}

id objc_msgSend_setMinScale_(void *a1, const char *a2, ...)
{
  return [a1 setMinScale:];
}

id objc_msgSend_setMinimumLevelHeight_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumLevelHeight:];
}

id objc_msgSend_setMinimumLineHeight_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumLineHeight:];
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setModalPresentationStyle:];
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return [a1 setMode:];
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return [a1 setModel:];
}

id objc_msgSend_setModelIdentifierForScrollable_(void *a1, const char *a2, ...)
{
  return [a1 setModelIdentifierForScrollable];
}

id objc_msgSend_setModels_(void *a1, const char *a2, ...)
{
  return [a1 setModels:];
}

id objc_msgSend_setMuteStateForPlayerWithVideoId_muted_requestingHost_isTriggerInitiated_(void *a1, const char *a2, ...)
{
  return [a1 setMuteStateForPlayerWithVideoId:muted:requestingHost:isTriggerInitiated:];
}

id objc_msgSend_setMuted_(void *a1, const char *a2, ...)
{
  return [a1 setMuted:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNameReference_(void *a1, const char *a2, ...)
{
  return [a1 setNameReference:];
}

id objc_msgSend_setNavigationBarBackgroundOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setNavigationBarBackgroundOpacity:];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsEnvironmentUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsEnvironmentUpdate];
}

id objc_msgSend_setNeedsHostingUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsHostingUpdate];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNewIndex_(void *a1, const char *a2, ...)
{
  return [a1 setNewIndex:];
}

id objc_msgSend_setNumberOfLevels_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLevels:];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLines:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setObject_forProperty_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forProperty:];
}

id objc_msgSend_setObscuresBackgroundDuringPresentation_(void *a1, const char *a2, ...)
{
  return [a1 setObscuresBackgroundDuringPresentation:];
}

id objc_msgSend_setObservationMode_(void *a1, const char *a2, ...)
{
  return [a1 setObservationMode:];
}

id objc_msgSend_setObserveTrigger_(void *a1, const char *a2, ...)
{
  return [a1 setObserveTrigger:];
}

id objc_msgSend_setObserveTriggerValue_(void *a1, const char *a2, ...)
{
  return [a1 setObserveTriggerValue:];
}

id objc_msgSend_setOffset_(void *a1, const char *a2, ...)
{
  return [a1 setOffset:];
}

id objc_msgSend_setOldIndex_(void *a1, const char *a2, ...)
{
  return [a1 setOldIndex:];
}

id objc_msgSend_setOn_animated_(void *a1, const char *a2, ...)
{
  return [a1 setOn:animated:];
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setOpacity:];
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return [a1 setOptions:];
}

id objc_msgSend_setOrientation_(void *a1, const char *a2, ...)
{
  return [a1 setOrientation:];
}

id objc_msgSend_setOutsets_(void *a1, const char *a2, ...)
{
  return [a1 setOutsets:];
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideUserInterfaceStyle:];
}

id objc_msgSend_setOverscrollingLiveTransform_(void *a1, const char *a2, ...)
{
  return [a1 setOverscrollingLiveTransform];
}

id objc_msgSend_setPadding_(void *a1, const char *a2, ...)
{
  return [a1 setPadding:];
}

id objc_msgSend_setPageGap_(void *a1, const char *a2, ...)
{
  return [a1 setPageGap:];
}

id objc_msgSend_setPaginated_(void *a1, const char *a2, ...)
{
  return [a1 setPaginated:];
}

id objc_msgSend_setPagingEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setPagingEnabled:];
}

id objc_msgSend_setParagraphStyle_forCharRange_undoTransaction_(void *a1, const char *a2, ...)
{
  return [a1 setParagraphStyle:forCharRange:undoTransaction:];
}

id objc_msgSend_setParameters_(void *a1, const char *a2, ...)
{
  return [a1 setParameters:];
}

id objc_msgSend_setParent_(void *a1, const char *a2, ...)
{
  return [a1 setParent:];
}

id objc_msgSend_setParentModel_(void *a1, const char *a2, ...)
{
  return [a1 setParentModel:];
}

id objc_msgSend_setPassthroughViews_(void *a1, const char *a2, ...)
{
  return [a1 setPassthroughViews:];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_setPaused_(void *a1, const char *a2, ...)
{
  return [a1 setPaused:];
}

id objc_msgSend_setPermittedArrowDirections_(void *a1, const char *a2, ...)
{
  return [a1 setPermittedArrowDirections:];
}

id objc_msgSend_setPersistentStoreCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 setPersistentStoreCoordinator:];
}

id objc_msgSend_setPhaseRenderModels_(void *a1, const char *a2, ...)
{
  return [a1 setPhaseRenderModels:];
}

id objc_msgSend_setPhases_(void *a1, const char *a2, ...)
{
  return [a1 setPhases:];
}

id objc_msgSend_setPinningLiveTransform_(void *a1, const char *a2, ...)
{
  return [a1 setPinningLiveTransform:];
}

id objc_msgSend_setPivotChild_(void *a1, const char *a2, ...)
{
  return [a1 setPivotChild:];
}

id objc_msgSend_setPlaceholderString_(void *a1, const char *a2, ...)
{
  return [a1 setPlaceholderString:];
}

id objc_msgSend_setPlaceholderText_(void *a1, const char *a2, ...)
{
  return [a1 setPlaceholderText:];
}

id objc_msgSend_setPlaybackLikelyToKeepUp_(void *a1, const char *a2, ...)
{
  return [a1 setPlaybackLikelyToKeepUp:];
}

id objc_msgSend_setPlaybackState_(void *a1, const char *a2, ...)
{
  return [a1 setPlaybackState:];
}

id objc_msgSend_setPlaybackTime_(void *a1, const char *a2, ...)
{
  return [a1 setPlaybackTime:];
}

id objc_msgSend_setPlayer_(void *a1, const char *a2, ...)
{
  return [a1 setPlayer:];
}

id objc_msgSend_setPlayerController_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerController:];
}

id objc_msgSend_setPlayerHasNoWaitingReason_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerHasNoWaitingReason:];
}

id objc_msgSend_setPlayerItem_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerItem:];
}

id objc_msgSend_setPlaying_(void *a1, const char *a2, ...)
{
  return [a1 setPlaying:];
}

id objc_msgSend_setPointSize_(void *a1, const char *a2, ...)
{
  return [a1 setPointSize:];
}

id objc_msgSend_setPointer_(void *a1, const char *a2, ...)
{
  return [a1 setPointer:];
}

id objc_msgSend_setPointerRefId_(void *a1, const char *a2, ...)
{
  return [a1 setPointerRefId:];
}

id objc_msgSend_setPointerStyle_(void *a1, const char *a2, ...)
{
  return [a1 setPointerStyle:];
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return [a1 setPosition:];
}

id objc_msgSend_setPosterFrameUrlString_(void *a1, const char *a2, ...)
{
  return [a1 setPosterFrameUrlString];
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return [a1 setPredicate:];
}

id objc_msgSend_setPreferredMenuElementOrder_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredMenuElementOrder:];
}

id objc_msgSend_setPreferredPlaybackSpeed_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredPlaybackSpeed:];
}

id objc_msgSend_setPreferredRange_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredRange:];
}

id objc_msgSend_setPreferredTintMode_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredTintMode:];
}

id objc_msgSend_setPreferredUnobscuredArea_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredUnobscuredArea:];
}

id objc_msgSend_setPrefersEqualWidth_(void *a1, const char *a2, ...)
{
  return [a1 setPrefersEqualWidth:];
}

id objc_msgSend_setPrefersLargeTitles_(void *a1, const char *a2, ...)
{
  return [a1 setPrefersLargeTitles:];
}

id objc_msgSend_setPrefersScale_(void *a1, const char *a2, ...)
{
  return [a1 setPrefersScale:];
}

id objc_msgSend_setPrefersScaledContent_(void *a1, const char *a2, ...)
{
  return [a1 setPrefersScaledContent:];
}

id objc_msgSend_setPrefersShadow_(void *a1, const char *a2, ...)
{
  return [a1 setPrefersShadow:];
}

id objc_msgSend_setPressedScale_(void *a1, const char *a2, ...)
{
  return [a1 setPressedScale:];
}

id objc_msgSend_setPreviousRenderModel_(void *a1, const char *a2, ...)
{
  return [a1 setPreviousRenderModel:];
}

id objc_msgSend_setPreviousState_(void *a1, const char *a2, ...)
{
  return [a1 setPreviousState:];
}

id objc_msgSend_setPreviouslyAppeared_(void *a1, const char *a2, ...)
{
  return [a1 setPreviouslyAppeared:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return [a1 setProgress:];
}

id objc_msgSend_setProgressId_(void *a1, const char *a2, ...)
{
  return [a1 setProgressId:];
}

id objc_msgSend_setProgressMode_(void *a1, const char *a2, ...)
{
  return [a1 setProgressMode:];
}

id objc_msgSend_setProtocolClasses_(void *a1, const char *a2, ...)
{
  return [a1 setProtocolClasses:];
}

id objc_msgSend_setPublishedObjects_(void *a1, const char *a2, ...)
{
  return [a1 setPublishedObjects:];
}

id objc_msgSend_setPunchoutShadow_(void *a1, const char *a2, ...)
{
  return [a1 setPunchoutShadow:];
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return [a1 setQuery:];
}

id objc_msgSend_setQueryGenerationFromToken_error_(void *a1, const char *a2, ...)
{
  return [a1 setQueryGenerationFromToken:error:];
}

id objc_msgSend_setRaised_(void *a1, const char *a2, ...)
{
  return [a1 setRaised:];
}

id objc_msgSend_setRange_(void *a1, const char *a2, ...)
{
  return [a1 setRange:];
}

id objc_msgSend_setRasterizationScale_(void *a1, const char *a2, ...)
{
  return [a1 setRasterizationScale:];
}

id objc_msgSend_setRating_(void *a1, const char *a2, ...)
{
  return [a1 setRating:];
}

id objc_msgSend_setRectScrollingDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setRectScrollingDelegate:];
}

id objc_msgSend_setRefId_(void *a1, const char *a2, ...)
{
  return [a1 setRefId:];
}

id objc_msgSend_setRefInstance_(void *a1, const char *a2, ...)
{
  return [a1 setRefInstance];
}

id objc_msgSend_setReferenceView_(void *a1, const char *a2, ...)
{
  return [a1 setReferenceView:];
}

id objc_msgSend_setRegionName_(void *a1, const char *a2, ...)
{
  return [a1 setRegionName:];
}

id objc_msgSend_setRelativeToDropLines_(void *a1, const char *a2, ...)
{
  return [a1 setRelativeToDropLines:];
}

id objc_msgSend_setRelativeWidth_(void *a1, const char *a2, ...)
{
  return [a1 setRelativeWidth:];
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setRemovedOnCompletion:];
}

id objc_msgSend_setRenderModel_(void *a1, const char *a2, ...)
{
  return [a1 setRenderModel:];
}

id objc_msgSend_setRenderModel_withInvalidationContext_(void *a1, const char *a2, ...)
{
  return [a1 setRenderModel:withInvalidationContext:];
}

id objc_msgSend_setRenderModelBlock_(void *a1, const char *a2, ...)
{
  return [a1 setRenderModelBlock:];
}

id objc_msgSend_setRenderModelKind_(void *a1, const char *a2, ...)
{
  return [a1 setRenderModelKind:];
}

id objc_msgSend_setRenderModelSection_(void *a1, const char *a2, ...)
{
  return [a1 setRenderModelSection:];
}

id objc_msgSend_setRenderOutsets_(void *a1, const char *a2, ...)
{
  return [a1 setRenderOutsets:];
}

id objc_msgSend_setRenderQueryUID_(void *a1, const char *a2, ...)
{
  return [a1 setRenderQueryUID:];
}

id objc_msgSend_setRenderQueryUUID_(void *a1, const char *a2, ...)
{
  return [a1 setRenderQueryUUID:];
}

id objc_msgSend_setRenderTransform_(void *a1, const char *a2, ...)
{
  return [a1 setRenderTransform:];
}

id objc_msgSend_setRenderingMode_(void *a1, const char *a2, ...)
{
  return [a1 setRenderingMode:];
}

id objc_msgSend_setRepeatCount_(void *a1, const char *a2, ...)
{
  return [a1 setRepeatCount:];
}

id objc_msgSend_setRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 setRepresentation];
}

id objc_msgSend_setReservedWidthWhenTruncating_(void *a1, const char *a2, ...)
{
  return [a1 setReservedWidthWhenTruncating:];
}

id objc_msgSend_setResolvedCustomActions_(void *a1, const char *a2, ...)
{
  return [a1 setResolvedCustomActions:];
}

id objc_msgSend_setResourceInstance_(void *a1, const char *a2, ...)
{
  return [a1 setResourceInstance];
}

id objc_msgSend_setResourceKind_(void *a1, const char *a2, ...)
{
  return [a1 setResourceKind:];
}

id objc_msgSend_setResourceLoader_(void *a1, const char *a2, ...)
{
  return [a1 setResourceLoader:];
}

id objc_msgSend_setResourceLoaderTask_(void *a1, const char *a2, ...)
{
  return [a1 setResourceLoaderTask:];
}

id objc_msgSend_setResourceOptions_(void *a1, const char *a2, ...)
{
  return [a1 setResourceOptions:];
}

id objc_msgSend_setResourceRegistry_(void *a1, const char *a2, ...)
{
  return [a1 setResourceRegistry:];
}

id objc_msgSend_setResourcesLoadedDate_(void *a1, const char *a2, ...)
{
  return [a1 setResourcesLoadedDate];
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return [a1 setResultType:];
}

id objc_msgSend_setRetainedCustomActionTargets_(void *a1, const char *a2, ...)
{
  return [a1 setRetainedCustomActionTargets];
}

id objc_msgSend_setRetinaScale_(void *a1, const char *a2, ...)
{
  return [a1 setRetinaScale:];
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return [a1 setReturnKeyType:];
}

id objc_msgSend_setReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setReuseIdentifier:];
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setRightBarButtonItem:];
}

id objc_msgSend_setRightBarButtonItems_animated_(void *a1, const char *a2, ...)
{
  return [a1 setRightBarButtonItems:animated:];
}

id objc_msgSend_setRightTriggerName_(void *a1, const char *a2, ...)
{
  return [a1 setRightTriggerName:];
}

id objc_msgSend_setRole_(void *a1, const char *a2, ...)
{
  return [a1 setRole:];
}

id objc_msgSend_setRootBox_(void *a1, const char *a2, ...)
{
  return [a1 setRootBox:];
}

id objc_msgSend_setRootLayer_(void *a1, const char *a2, ...)
{
  return [a1 setRootLayer:];
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return [a1 setRowHeight:];
}

id objc_msgSend_setRowSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setRowSpacing:];
}

id objc_msgSend_setRowSpan_(void *a1, const char *a2, ...)
{
  return [a1 setRowSpan:];
}

id objc_msgSend_setRows_(void *a1, const char *a2, ...)
{
  return [a1 setRows:];
}

id objc_msgSend_setRunList_(void *a1, const char *a2, ...)
{
  return [a1 setRunList:];
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return [a1 setScale:];
}

id objc_msgSend_setScanLocation_(void *a1, const char *a2, ...)
{
  return [a1 setScanLocation:];
}

id objc_msgSend_setScopeBarContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setScopeBarContentSize:];
}

id objc_msgSend_setScreenOffsetProvider_(void *a1, const char *a2, ...)
{
  return [a1 setScreenOffsetProvider:];
}

id objc_msgSend_setScrollAncestorIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setScrollAncestorIdentifier:];
}

id objc_msgSend_setScrollIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setScrollIdentifier:];
}

id objc_msgSend_setScrollPolicy_(void *a1, const char *a2, ...)
{
  return [a1 setScrollPolicy:];
}

id objc_msgSend_setScrollingDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setScrollingDelegate:];
}

id objc_msgSend_setSearchBarStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSearchBarStyle:];
}

id objc_msgSend_setSearchController_(void *a1, const char *a2, ...)
{
  return [a1 setSearchController:];
}

id objc_msgSend_setSearchTextMaxLength_(void *a1, const char *a2, ...)
{
  return [a1 setSearchTextMaxLength:];
}

id objc_msgSend_setSectionBottomY_(void *a1, const char *a2, ...)
{
  return [a1 setSectionBottomY:];
}

id objc_msgSend_setSectionIndex_(void *a1, const char *a2, ...)
{
  return [a1 setSectionIndex:];
}

id objc_msgSend_setSectionName_(void *a1, const char *a2, ...)
{
  return [a1 setSectionName:];
}

id objc_msgSend_setSectionOffset_(void *a1, const char *a2, ...)
{
  return [a1 setSectionOffset:];
}

id objc_msgSend_setSectionUUID_(void *a1, const char *a2, ...)
{
  return [a1 setSectionUUID:];
}

id objc_msgSend_setSelect_(void *a1, const char *a2, ...)
{
  return [a1 setSelect:];
}

id objc_msgSend_setSelectIndex_(void *a1, const char *a2, ...)
{
  return [a1 setSelectIndex:];
}

id objc_msgSend_setSelectedSegmentIndex_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedSegmentIndex:];
}

id objc_msgSend_setSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return [a1 setSemanticContentAttribute:];
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return [a1 setShadowColor:];
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return [a1 setShadowOffset:];
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setShadowOpacity:];
}

id objc_msgSend_setShadowPath_(void *a1, const char *a2, ...)
{
  return [a1 setShadowPath:];
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return [a1 setShadowRadius:];
}

id objc_msgSend_setShape_(void *a1, const char *a2, ...)
{
  return [a1 setShape:];
}

id objc_msgSend_setShouldLoop_(void *a1, const char *a2, ...)
{
  return [a1 setShouldLoop:];
}

id objc_msgSend_setShouldRasterize_(void *a1, const char *a2, ...)
{
  return [a1 setShouldRasterize:];
}

id objc_msgSend_setShouldScrollHorizontally_(void *a1, const char *a2, ...)
{
  return [a1 setShouldScrollHorizontally:];
}

id objc_msgSend_setShouldScrollVertically_(void *a1, const char *a2, ...)
{
  return [a1 setShouldScrollVertically:];
}

id objc_msgSend_setShouldShowCancelButton_(void *a1, const char *a2, ...)
{
  return [a1 setShouldShowCancelButton:];
}

id objc_msgSend_setShouldStartAtEnd_(void *a1, const char *a2, ...)
{
  return [a1 setShouldStartAtEnd:];
}

id objc_msgSend_setShouldVendControlView_(void *a1, const char *a2, ...)
{
  return [a1 setShouldVendControlView:];
}

id objc_msgSend_setShowCancel_(void *a1, const char *a2, ...)
{
  return [a1 setShowCancel:];
}

id objc_msgSend_setShowPlaybackControls_(void *a1, const char *a2, ...)
{
  return [a1 setShowPlaybackControls:];
}

id objc_msgSend_setShowsCancelButton_animated_(void *a1, const char *a2, ...)
{
  return [a1 setShowsCancelButton:animated:];
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return [a1 setShowsHorizontalScrollIndicator:];
}

id objc_msgSend_setShowsLargeContentViewer_(void *a1, const char *a2, ...)
{
  return [a1 setShowsLargeContentViewer:];
}

id objc_msgSend_setShowsMenuAsPrimaryAction_(void *a1, const char *a2, ...)
{
  return [a1 setShowsMenuAsPrimaryAction:];
}

id objc_msgSend_setShowsPlaybackControls_(void *a1, const char *a2, ...)
{
  return [a1 setShowsPlaybackControls:];
}

id objc_msgSend_setShowsScopeBar_animated_(void *a1, const char *a2, ...)
{
  return [a1 setShowsScopeBar:animated:];
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return [a1 setShowsVerticalScrollIndicator:];
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return [a1 setSize:];
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return [a1 setSourceView:];
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setSpacing:];
}

id objc_msgSend_setSpan_(void *a1, const char *a2, ...)
{
  return [a1 setSpan:];
}

id objc_msgSend_setSpecifiedHeight_(void *a1, const char *a2, ...)
{
  return [a1 setSpecifiedHeight:];
}

id objc_msgSend_setSpecifiedHeightComputeInherited_(void *a1, const char *a2, ...)
{
  return [a1 setSpecifiedHeightComputeInherited:];
}

id objc_msgSend_setSpecifiedLayoutDirection_(void *a1, const char *a2, ...)
{
  return [a1 setSpecifiedLayoutDirection:];
}

id objc_msgSend_setSpecifiedWidth_(void *a1, const char *a2, ...)
{
  return [a1 setSpecifiedWidth:];
}

id objc_msgSend_setSpecifiedWidthComputeInherited_(void *a1, const char *a2, ...)
{
  return [a1 setSpecifiedWidthComputeInherited:];
}

id objc_msgSend_setSpecifiedWidthModified_(void *a1, const char *a2, ...)
{
  return [a1 setSpecifiedWidthModified:];
}

id objc_msgSend_setSpeed_(void *a1, const char *a2, ...)
{
  return [a1 setSpeed:];
}

id objc_msgSend_setSplit_(void *a1, const char *a2, ...)
{
  return [a1 setSplit:];
}

id objc_msgSend_setStackNames_(void *a1, const char *a2, ...)
{
  return [a1 setStackNames:];
}

id objc_msgSend_setStart_(void *a1, const char *a2, ...)
{
  return [a1 setStart:];
}

id objc_msgSend_setStartColor_(void *a1, const char *a2, ...)
{
  return [a1 setStartColor:];
}

id objc_msgSend_setStartPoint_(void *a1, const char *a2, ...)
{
  return [a1 setStartPoint:];
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return [a1 setStartTime:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStateMap_(void *a1, const char *a2, ...)
{
  return [a1 setStateMap:];
}

id objc_msgSend_setStateName_(void *a1, const char *a2, ...)
{
  return [a1 setStateName:];
}

id objc_msgSend_setStates_(void *a1, const char *a2, ...)
{
  return [a1 setStates:];
}

id objc_msgSend_setStats_(void *a1, const char *a2, ...)
{
  return [a1 setStats:];
}

id objc_msgSend_setStatsCollector_(void *a1, const char *a2, ...)
{
  return [a1 setStatsCollector:];
}

id objc_msgSend_setStatsMode_(void *a1, const char *a2, ...)
{
  return [a1 setStatsMode:];
}

id objc_msgSend_setSteps_(void *a1, const char *a2, ...)
{
  return [a1 setSteps:];
}

id objc_msgSend_setStiffness_(void *a1, const char *a2, ...)
{
  return [a1 setStiffness:];
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return [a1 setString:];
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return [a1 setStrokeColor:];
}

id objc_msgSend_setStrokeEnd_(void *a1, const char *a2, ...)
{
  return [a1 setStrokeEnd:];
}

id objc_msgSend_setStrokeStart_(void *a1, const char *a2, ...)
{
  return [a1 setStrokeStart:];
}

id objc_msgSend_setStructValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setStructValue:forKey:];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setSublayerTransform_(void *a1, const char *a2, ...)
{
  return [a1 setSublayerTransform:];
}

id objc_msgSend_setSublayers_(void *a1, const char *a2, ...)
{
  return [a1 setSublayers:];
}

id objc_msgSend_setSubmodelTracker_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setSubmodelTracker:forIdentifier:];
}

id objc_msgSend_setSubviewsDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setSubviewsDelegate:];
}

id objc_msgSend_setSuspendedDueToMemoryPressure_(void *a1, const char *a2, ...)
{
  return [a1 setSuspendedDueToMemoryPressure:];
}

id objc_msgSend_setSuspendedViewState_(void *a1, const char *a2, ...)
{
  return [a1 setSuspendedViewState:];
}

id objc_msgSend_setSyncTimeout_(void *a1, const char *a2, ...)
{
  return [a1 setSyncTimeout:];
}

id objc_msgSend_setSynchronousTransactionInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setSynchronousTransactionInProgress:];
}

id objc_msgSend_setSystemAutoPlayEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setSystemAutoPlayEnabled:];
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return [a1 setTarget:];
}

id objc_msgSend_setTargetTriggerState_(void *a1, const char *a2, ...)
{
  return [a1 setTargetTriggerState:];
}

id objc_msgSend_setTemplateURL_(void *a1, const char *a2, ...)
{
  return [a1 setTemplateURL:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setTextAlignment:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setTextInitialized_(void *a1, const char *a2, ...)
{
  return [a1 setTextInitialized:];
}

id objc_msgSend_setTextKey_(void *a1, const char *a2, ...)
{
  return [a1 setTextKey:];
}

id objc_msgSend_setTextModel_(void *a1, const char *a2, ...)
{
  return [a1 setTextModel:];
}

id objc_msgSend_setTextScaleFactor_(void *a1, const char *a2, ...)
{
  return [a1 setTextScaleFactor:];
}

id objc_msgSend_setTextValue_(void *a1, const char *a2, ...)
{
  return [a1 setTextValue:];
}

id objc_msgSend_setTimeObserver_(void *a1, const char *a2, ...)
{
  return [a1 setTimeObserver:];
}

id objc_msgSend_setTimeOffset_(void *a1, const char *a2, ...)
{
  return [a1 setTimeOffset:];
}

id objc_msgSend_setTiming_(void *a1, const char *a2, ...)
{
  return [a1 setTiming:];
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return [a1 setTimingFunction:];
}

id objc_msgSend_setTimingProvider_(void *a1, const char *a2, ...)
{
  return [a1 setTimingProvider:];
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setTintColor:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTitle_forSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:forSegmentAtIndex:];
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:forState:];
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitleColor:forState:];
}

id objc_msgSend_setTo_(void *a1, const char *a2, ...)
{
  return [a1 setTo:];
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return [a1 setToValue:];
}

id objc_msgSend_setTopTriggerName_(void *a1, const char *a2, ...)
{
  return [a1 setTopTriggerName:];
}

id objc_msgSend_setTotalContentHeight_(void *a1, const char *a2, ...)
{
  return [a1 setTotalContentHeight:];
}

id objc_msgSend_setTouchInsets_(void *a1, const char *a2, ...)
{
  return [a1 setTouchInsets:];
}

id objc_msgSend_setTransactionCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 setTransactionCoordinator:];
}

id objc_msgSend_setTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 setTransactionGroup:];
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return [a1 setTransform:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setTranslationOffset_(void *a1, const char *a2, ...)
{
  return [a1 setTranslationOffset:];
}

id objc_msgSend_setTrigger_(void *a1, const char *a2, ...)
{
  return [a1 setTrigger:];
}

id objc_msgSend_setTriggerDelay_(void *a1, const char *a2, ...)
{
  return [a1 setTriggerDelay:];
}

id objc_msgSend_setTriggerHandler_(void *a1, const char *a2, ...)
{
  return [a1 setTriggerHandler:];
}

id objc_msgSend_setTriggerName_(void *a1, const char *a2, ...)
{
  return [a1 setTriggerName:];
}

id objc_msgSend_setTriggerPlaybackEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setTriggerPlaybackEnabled:];
}

id objc_msgSend_setTruncate_(void *a1, const char *a2, ...)
{
  return [a1 setTruncate:];
}

id objc_msgSend_setTui_delegate_(void *a1, const char *a2, ...)
{
  return [a1 setTui_delegate:];
}

id objc_msgSend_setTui_hostedSubviewsMap_(void *a1, const char *a2, ...)
{
  return [a1 setTui_hostedSubviewsMap:];
}

id objc_msgSend_setTui_menu_(void *a1, const char *a2, ...)
{
  return [a1 setTui_menu:];
}

id objc_msgSend_setTui_querySectionUID_(void *a1, const char *a2, ...)
{
  return [a1 setTui_querySectionUID];
}

id objc_msgSend_setTui_querySectionUUID_(void *a1, const char *a2, ...)
{
  return [a1 setTui_querySectionUUID];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setURLCache_(void *a1, const char *a2, ...)
{
  return [a1 setURLCache:];
}

id objc_msgSend_setUUID_(void *a1, const char *a2, ...)
{
  return [a1 setUUID:];
}

id objc_msgSend_setUid_(void *a1, const char *a2, ...)
{
  return [a1 setUid:];
}

id objc_msgSend_setUndoManager_(void *a1, const char *a2, ...)
{
  return [a1 setUndoManager:];
}

id objc_msgSend_setUpdateBlock_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateBlock:];
}

id objc_msgSend_setUpdateController_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateController:];
}

id objc_msgSend_setUpdates_(void *a1, const char *a2, ...)
{
  return [a1 setUpdates:];
}

id objc_msgSend_setUpdatesNowPlayingInfoCenter_(void *a1, const char *a2, ...)
{
  return [a1 setUpdatesNowPlayingInfoCenter:];
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return [a1 setUrl:];
}

id objc_msgSend_setUrlString_(void *a1, const char *a2, ...)
{
  return [a1 setUrlString];
}

id objc_msgSend_setUseShrinkToFit_(void *a1, const char *a2, ...)
{
  return [a1 setUseShrinkToFit:];
}

id objc_msgSend_setUseStrictEqualWidth_(void *a1, const char *a2, ...)
{
  return [a1 setUseStrictEqualWidth:];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setUserInterfaceLevel_(void *a1, const char *a2, ...)
{
  return [a1 setUserInterfaceLevel:];
}

id objc_msgSend_setUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return [a1 setUserInterfaceStyle:];
}

id objc_msgSend_setValign_(void *a1, const char *a2, ...)
{
  return [a1 setValign:];
}

id objc_msgSend_setValignEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setValignEnabled:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setValue_forKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKeyPath:];
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return [a1 setValues:];
}

id objc_msgSend_setVcompressed_(void *a1, const char *a2, ...)
{
  return [a1 setVcompressed:];
}

id objc_msgSend_setVerticalPlacement_(void *a1, const char *a2, ...)
{
  return [a1 setVerticalPlacement:];
}

id objc_msgSend_setVerticalSizeClass_(void *a1, const char *a2, ...)
{
  return [a1 setVerticalSizeClass:];
}

id objc_msgSend_setVideoGravity_(void *a1, const char *a2, ...)
{
  return [a1 setVideoGravity:];
}

id objc_msgSend_setVideoId_(void *a1, const char *a2, ...)
{
  return [a1 setVideoId:];
}

id objc_msgSend_setVideoViewController_(void *a1, const char *a2, ...)
{
  return [a1 setVideoViewController:];
}

id objc_msgSend_setViewControllers_(void *a1, const char *a2, ...)
{
  return [a1 setViewControllers:];
}

id objc_msgSend_setViewFactory_(void *a1, const char *a2, ...)
{
  return [a1 setViewFactory:];
}

id objc_msgSend_setViewIsDisappearing_(void *a1, const char *a2, ...)
{
  return [a1 setViewIsDisappearing:];
}

id objc_msgSend_setViewRegistry_(void *a1, const char *a2, ...)
{
  return [a1 setViewRegistry:];
}

id objc_msgSend_setViewState_(void *a1, const char *a2, ...)
{
  return [a1 setViewState:];
}

id objc_msgSend_setViewState_forBinding_(void *a1, const char *a2, ...)
{
  return [a1 setViewState:forBinding:];
}

id objc_msgSend_setViewState_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setViewState:forIdentifier:];
}

id objc_msgSend_setViewStateToRestore_(void *a1, const char *a2, ...)
{
  return [a1 setViewStateToRestore];
}

id objc_msgSend_setVisible_(void *a1, const char *a2, ...)
{
  return [a1 setVisible:];
}

id objc_msgSend_setVspacing_(void *a1, const char *a2, ...)
{
  return [a1 setVspacing:];
}

id objc_msgSend_setWeight_(void *a1, const char *a2, ...)
{
  return [a1 setWeight:];
}

id objc_msgSend_setWhenUnavailable_(void *a1, const char *a2, ...)
{
  return [a1 setWhenUnavailable:];
}

id objc_msgSend_setWidth_(void *a1, const char *a2, ...)
{
  return [a1 setWidth:];
}

id objc_msgSend_setWidthClass_(void *a1, const char *a2, ...)
{
  return [a1 setWidthClass:];
}

id objc_msgSend_setWidthSnap_(void *a1, const char *a2, ...)
{
  return [a1 setWidthSnap];
}

id objc_msgSend_setWindowSize_(void *a1, const char *a2, ...)
{
  return [a1 setWindowSize:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return [a1 setWithSet:];
}

id objc_msgSend_setZIndex_(void *a1, const char *a2, ...)
{
  return [a1 setZIndex:];
}

id objc_msgSend_setZPosition_(void *a1, const char *a2, ...)
{
  return [a1 setZPosition:];
}

id objc_msgSend_setupSize(void *a1, const char *a2, ...)
{
  return _[a1 setupSize];
}

id objc_msgSend_setupWithMode_rect_(void *a1, const char *a2, ...)
{
  return [a1 setupWithMode:rect:];
}

id objc_msgSend_shadingColor(void *a1, const char *a2, ...)
{
  return _[a1 shadingColor];
}

id objc_msgSend_shadowColor(void *a1, const char *a2, ...)
{
  return _[a1 shadowColor];
}

id objc_msgSend_shadowOffset(void *a1, const char *a2, ...)
{
  return _[a1 shadowOffset];
}

id objc_msgSend_shadowOpacity(void *a1, const char *a2, ...)
{
  return _[a1 shadowOpacity];
}

id objc_msgSend_shadowPath(void *a1, const char *a2, ...)
{
  return _[a1 shadowPath];
}

id objc_msgSend_shadowRadius(void *a1, const char *a2, ...)
{
  return _[a1 shadowRadius];
}

id objc_msgSend_shape(void *a1, const char *a2, ...)
{
  return _[a1 shape];
}

id objc_msgSend_shapeWithPath_(void *a1, const char *a2, ...)
{
  return [a1 shapeWithPath:];
}

id objc_msgSend_shapeWithRoundedRect_(void *a1, const char *a2, ...)
{
  return [a1 shapeWithRoundedRect:];
}

id objc_msgSend_shapeWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 shapeWithRoundedRect:cornerRadius:];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedOfflineCache(void *a1, const char *a2, ...)
{
  return _[a1 sharedOfflineCache];
}

id objc_msgSend_sharedQueue(void *a1, const char *a2, ...)
{
  return _[a1 sharedQueue];
}

id objc_msgSend_shiftIndexesStartingAtIndex_by_(void *a1, const char *a2, ...)
{
  return [a1 shiftIndexesStartingAtIndex:by:];
}

id objc_msgSend_shouldAppendChildAnchorsForAncestor(void *a1, const char *a2, ...)
{
  return _[a1 shouldAppendChildAnchorsForAncestor];
}

id objc_msgSend_shouldAppendChildRenderModels(void *a1, const char *a2, ...)
{
  return _[a1 shouldAppendChildRenderModels];
}

id objc_msgSend_shouldArchiveValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 shouldArchiveValueForKey:];
}

id objc_msgSend_shouldAutoEnumerateNode(void *a1, const char *a2, ...)
{
  return _[a1 shouldAutoEnumerateNode];
}

id objc_msgSend_shouldAutoInvalidateRenderModelOnChildInvalidate(void *a1, const char *a2, ...)
{
  return _[a1 shouldAutoInvalidateRenderModelOnChildInvalidate];
}

id objc_msgSend_shouldCaptureCALayerAnimations(void *a1, const char *a2, ...)
{
  return _[a1 shouldCaptureCALayerAnimations];
}

id objc_msgSend_shouldDeferLoadForResource_(void *a1, const char *a2, ...)
{
  return [a1 shouldDeferLoadForResource:];
}

id objc_msgSend_shouldDescendentsInheritRefSpecWithContext_(void *a1, const char *a2, ...)
{
  return [a1 shouldDescendentsInheritRefSpecWithContext:];
}

id objc_msgSend_shouldMuteOnNextDisplay(void *a1, const char *a2, ...)
{
  return _[a1 shouldMuteOnNextDisplay];
}

id objc_msgSend_shouldPromoteLargeTitleAccessoryViewButtonsForAccessibility(void *a1, const char *a2, ...)
{
  return _[a1 shouldPromoteLargeTitleAccessoryViewButtonsForAccessibility];
}

id objc_msgSend_shouldRasterize(void *a1, const char *a2, ...)
{
  return _[a1 shouldRasterize];
}

id objc_msgSend_shouldRelease(void *a1, const char *a2, ...)
{
  return _[a1 shouldRelease];
}

id objc_msgSend_shouldResetBoundsOriginWhenApplyingLayoutAttributes(void *a1, const char *a2, ...)
{
  return _[a1 shouldResetBoundsOriginWhenApplyingLayoutAttributes];
}

id objc_msgSend_shouldRootLayoutInheritHeightWhenAuto(void *a1, const char *a2, ...)
{
  return _[a1 shouldRootLayoutInheritHeightWhenAuto];
}

id objc_msgSend_shouldRootLayoutInheritWidthWhenAuto(void *a1, const char *a2, ...)
{
  return _[a1 shouldRootLayoutInheritWidthWhenAuto];
}

id objc_msgSend_shouldScrollHorizontally(void *a1, const char *a2, ...)
{
  return _[a1 shouldScrollHorizontally];
}

id objc_msgSend_shouldScrollVertically(void *a1, const char *a2, ...)
{
  return _[a1 shouldScrollVertically];
}

id objc_msgSend_shouldShowCancelButton(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowCancelButton];
}

id objc_msgSend_shouldStartAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 shouldStartAtEnd];
}

id objc_msgSend_shouldUpdateContainingMetricsForScrollableContent(void *a1, const char *a2, ...)
{
  return _[a1 shouldUpdateContainingMetricsForScrollableContent];
}

id objc_msgSend_shouldUseDefaultGuideForLayout_edge_(void *a1, const char *a2, ...)
{
  return [a1 shouldUseDefaultGuideForLayout:edge:];
}

id objc_msgSend_shouldUseSubviewRenderModelWithContext_(void *a1, const char *a2, ...)
{
  return [a1 shouldUseSubviewRenderModelWithContext:];
}

id objc_msgSend_shouldVendControlView(void *a1, const char *a2, ...)
{
  return _[a1 shouldVendControlView];
}

id objc_msgSend_showButton(void *a1, const char *a2, ...)
{
  return _[a1 showButton];
}

id objc_msgSend_showCancel(void *a1, const char *a2, ...)
{
  return _[a1 showCancel];
}

id objc_msgSend_showContents(void *a1, const char *a2, ...)
{
  return _[a1 showContents];
}

id objc_msgSend_showPlaybackControls(void *a1, const char *a2, ...)
{
  return _[a1 showPlaybackControls];
}

id objc_msgSend_showsMenuAsPrimaryAction(void *a1, const char *a2, ...)
{
  return _[a1 showsMenuAsPrimaryAction];
}

id objc_msgSend_showsVerticalScrollIndicator(void *a1, const char *a2, ...)
{
  return _[a1 showsVerticalScrollIndicator];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 sizeForAttribute:node:];
}

id objc_msgSend_sizeFromWidth_(void *a1, const char *a2, ...)
{
  return [a1 sizeFromWidth:];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return [a1 sizeThatFits:];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sizeWithAttributes_(void *a1, const char *a2, ...)
{
  return [a1 sizeWithAttributes:];
}

id objc_msgSend_sizedKey(void *a1, const char *a2, ...)
{
  return _[a1 sizedKey];
}

id objc_msgSend_sizedKeyForColor_imageResource_(void *a1, const char *a2, ...)
{
  return [a1 sizedKeyForColor:imageResource:];
}

id objc_msgSend_sizedKeyForFilter_naturalSize_contentsScale_imageResource_(void *a1, const char *a2, ...)
{
  return [a1 sizedKeyForFilter:naturalSize:contentsScale:imageResource:];
}

id objc_msgSend_sizedKeyForNaturalSize_contentsScale_imageResource_(void *a1, const char *a2, ...)
{
  return [a1 sizedKeyForNaturalSize:contentsScale:imageResource:];
}

id objc_msgSend_sizedKeyForNaturalSize_contentsScale_imageResources_(void *a1, const char *a2, ...)
{
  return [a1 sizedKeyForNaturalSize:contentsScale:imageResources:];
}

id objc_msgSend_sizedKeyFromURL_(void *a1, const char *a2, ...)
{
  return [a1 sizedKeyFromURL:];
}

id objc_msgSend_sizedURLFromTemplatedURL_baseURL_naturalSize_contentsScale_(void *a1, const char *a2, ...)
{
  return [a1 sizedURLFromTemplatedURL:baseURL:naturalSize:contentsScale:];
}

id objc_msgSend_snapByAddingValue_(void *a1, const char *a2, ...)
{
  return [a1 snapByAddingValue:];
}

id objc_msgSend_snapForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 snapForAttribute:node:];
}

id objc_msgSend_snapWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 snapWithIdentifier:];
}

id objc_msgSend_snapWithMax_(void *a1, const char *a2, ...)
{
  return [a1 snapWithMax:];
}

id objc_msgSend_snapWithStep_(void *a1, const char *a2, ...)
{
  return [a1 snapWithStep:];
}

id objc_msgSend_snapshotWithClosure_(void *a1, const char *a2, ...)
{
  return [a1 snapshotWithClosure:];
}

id objc_msgSend_solve(void *a1, const char *a2, ...)
{
  return _[a1 solve];
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortUsingComparator:];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingSelector:];
}

id objc_msgSend_sortedTransactions(void *a1, const char *a2, ...)
{
  return _[a1 sortedTransactions];
}

id objc_msgSend_sourceView(void *a1, const char *a2, ...)
{
  return _[a1 sourceView];
}

id objc_msgSend_spacing(void *a1, const char *a2, ...)
{
  return _[a1 spacing];
}

id objc_msgSend_spacingForSize_(void *a1, const char *a2, ...)
{
  return [a1 spacingForSize:];
}

id objc_msgSend_spacingForSize_layoutSize_(void *a1, const char *a2, ...)
{
  return [a1 spacingForSize:layoutSize:];
}

id objc_msgSend_span(void *a1, const char *a2, ...)
{
  return _[a1 span];
}

id objc_msgSend_specifiedHeight(void *a1, const char *a2, ...)
{
  return _[a1 specifiedHeight];
}

id objc_msgSend_specifiedIntrinsicHeight(void *a1, const char *a2, ...)
{
  return _[a1 specifiedIntrinsicHeight];
}

id objc_msgSend_specifiedIntrinsicWidth(void *a1, const char *a2, ...)
{
  return _[a1 specifiedIntrinsicWidth];
}

id objc_msgSend_specifiedTransform(void *a1, const char *a2, ...)
{
  return _[a1 specifiedTransform];
}

id objc_msgSend_specifiedWidth(void *a1, const char *a2, ...)
{
  return _[a1 specifiedWidth];
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return _[a1 speed];
}

id objc_msgSend_split(void *a1, const char *a2, ...)
{
  return _[a1 split];
}

id objc_msgSend_springTimingParameters(void *a1, const char *a2, ...)
{
  return _[a1 springTimingParameters];
}

id objc_msgSend_springTimingParametersForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 springTimingParametersForAttribute:node:];
}

id objc_msgSend_stackNames(void *a1, const char *a2, ...)
{
  return _[a1 stackNames];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_standardizedURL(void *a1, const char *a2, ...)
{
  return _[a1 standardizedURL];
}

id objc_msgSend_starPadding(void *a1, const char *a2, ...)
{
  return _[a1 starPadding];
}

id objc_msgSend_starRatingImageNameFromKind_(void *a1, const char *a2, ...)
{
  return [a1 starRatingImageNameFromKind:];
}

id objc_msgSend_starSizeForSize_(void *a1, const char *a2, ...)
{
  return [a1 starSizeForSize:];
}

id objc_msgSend_starSizeForSize_layoutSize_(void *a1, const char *a2, ...)
{
  return [a1 starSizeForSize:layoutSize:];
}

id objc_msgSend_starWidth(void *a1, const char *a2, ...)
{
  return _[a1 starWidth];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_startAnimation(void *a1, const char *a2, ...)
{
  return _[a1 startAnimation];
}

id objc_msgSend_startColor(void *a1, const char *a2, ...)
{
  return _[a1 startColor];
}

id objc_msgSend_startPhase_(void *a1, const char *a2, ...)
{
  return [a1 startPhase:];
}

id objc_msgSend_startPlayTimer(void *a1, const char *a2, ...)
{
  return _[a1 startPlayTimer];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _[a1 startTime];
}

id objc_msgSend_statRecordInitialResourcesRenderedDate(void *a1, const char *a2, ...)
{
  return _[a1 statRecordInitialResourcesRenderedDate];
}

id objc_msgSend_statRecordResourcesLoadedDate(void *a1, const char *a2, ...)
{
  return _[a1 statRecordResourcesLoadedDate];
}

id objc_msgSend_statRecordResourcesStartLoadingDate(void *a1, const char *a2, ...)
{
  return _[a1 statRecordResourcesStartLoadingDate];
}

id objc_msgSend_statRecordViewWillAppear(void *a1, const char *a2, ...)
{
  return _[a1 statRecordViewWillAppear];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateButtonAttributesMap(void *a1, const char *a2, ...)
{
  return _[a1 stateButtonAttributesMap];
}

id objc_msgSend_stateForPlayerWithVideoId_(void *a1, const char *a2, ...)
{
  return [a1 stateForPlayerWithVideoId:];
}

id objc_msgSend_stateForRegionWithKey_(void *a1, const char *a2, ...)
{
  return [a1 stateForRegionWithKey:];
}

id objc_msgSend_stateForTriggerWithName_(void *a1, const char *a2, ...)
{
  return [a1 stateForTriggerWithName:];
}

id objc_msgSend_stateMap(void *a1, const char *a2, ...)
{
  return _[a1 stateMap];
}

id objc_msgSend_stateName(void *a1, const char *a2, ...)
{
  return _[a1 stateName];
}

id objc_msgSend_stateNameToLayout(void *a1, const char *a2, ...)
{
  return _[a1 stateNameToLayout];
}

id objc_msgSend_stateProviderForKind_(void *a1, const char *a2, ...)
{
  return [a1 stateProviderForKind:];
}

id objc_msgSend_stateToButtonAttributes(void *a1, const char *a2, ...)
{
  return _[a1 stateToButtonAttributes];
}

id objc_msgSend_stateToModel(void *a1, const char *a2, ...)
{
  return _[a1 stateToModel];
}

id objc_msgSend_states(void *a1, const char *a2, ...)
{
  return _[a1 states];
}

id objc_msgSend_stats(void *a1, const char *a2, ...)
{
  return _[a1 stats];
}

id objc_msgSend_statsCollector(void *a1, const char *a2, ...)
{
  return _[a1 statsCollector];
}

id objc_msgSend_statsModeForFeedViewController_(void *a1, const char *a2, ...)
{
  return [a1 statsModeForFeedViewController:];
}

id objc_msgSend_statusOfValueForKey_error_(void *a1, const char *a2, ...)
{
  return [a1 statusOfValueForKey:error:];
}

id objc_msgSend_step(void *a1, const char *a2, ...)
{
  return _[a1 step];
}

id objc_msgSend_stepDuration(void *a1, const char *a2, ...)
{
  return _[a1 stepDuration];
}

id objc_msgSend_stepForValue_(void *a1, const char *a2, ...)
{
  return [a1 stepForValue:];
}

id objc_msgSend_stepStartTime(void *a1, const char *a2, ...)
{
  return _[a1 stepStartTime];
}

id objc_msgSend_steps(void *a1, const char *a2, ...)
{
  return _[a1 steps];
}

id objc_msgSend_stiffness(void *a1, const char *a2, ...)
{
  return _[a1 stiffness];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 stopAnimating];
}

id objc_msgSend_stopPlayTimer(void *a1, const char *a2, ...)
{
  return _[a1 stopPlayTimer];
}

id objc_msgSend_stopTrackingController_(void *a1, const char *a2, ...)
{
  return [a1 stopTrackingController:];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return _[a1 storage];
}

id objc_msgSend_storeCachedResponse_forRequest_(void *a1, const char *a2, ...)
{
  return [a1 storeCachedResponse:forRequest:];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingFormat:];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByExpandingTildeInPath];
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 stringByPaddingToLength:withString:startingAtIndex:];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByStandardizingPath];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 stringForAttribute:node:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:encoding:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_structForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 structForAttribute:node:];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_styleDefinitionWithNode_nameAttribute_inheritAttribute_(void *a1, const char *a2, ...)
{
  return [a1 styleDefinitionWithNode:nameAttribute:inheritAttribute:];
}

id objc_msgSend_styleReference(void *a1, const char *a2, ...)
{
  return _[a1 styleReference];
}

id objc_msgSend_styleWithEffect_shape_(void *a1, const char *a2, ...)
{
  return [a1 styleWithEffect:shape:];
}

id objc_msgSend_stylesheet(void *a1, const char *a2, ...)
{
  return _[a1 stylesheet];
}

id objc_msgSend_subarray(void *a1, const char *a2, ...)
{
  return _[a1 subarray];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_sublayerTransform(void *a1, const char *a2, ...)
{
  return _[a1 sublayerTransform];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return _[a1 sublayers];
}

id objc_msgSend_submodel(void *a1, const char *a2, ...)
{
  return _[a1 submodel];
}

id objc_msgSend_submodelTrackerForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 submodelTrackerForIdentifier:];
}

id objc_msgSend_submodels(void *a1, const char *a2, ...)
{
  return _[a1 submodels];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_subviewPool(void *a1, const char *a2, ...)
{
  return _[a1 subviewPool];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_subviewsDelegate(void *a1, const char *a2, ...)
{
  return _[a1 subviewsDelegate];
}

id objc_msgSend_subviewsModel(void *a1, const char *a2, ...)
{
  return _[a1 subviewsModel];
}

id objc_msgSend_summaryForRange_(void *a1, const char *a2, ...)
{
  return [a1 summaryForRange:];
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return _[a1 superclass];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return _[a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportAdornmentWithRole_kind_(void *a1, const char *a2, ...)
{
  return [a1 supportAdornmentWithRole:kind:];
}

id objc_msgSend_supportAttribute_feature_(void *a1, const char *a2, ...)
{
  return [a1 supportAttribute:feature:];
}

id objc_msgSend_supportFeature_(void *a1, const char *a2, ...)
{
  return [a1 supportFeature:];
}

id objc_msgSend_supportOnlyImmediateChildrenForContainedBuilding(void *a1, const char *a2, ...)
{
  return _[a1 supportOnlyImmediateChildrenForContainedBuilding];
}

id objc_msgSend_supportedAttributes(void *a1, const char *a2, ...)
{
  return _[a1 supportedAttributes];
}

id objc_msgSend_supportedAttributesSize(void *a1, const char *a2, ...)
{
  return _[a1 supportedAttributesSize];
}

id objc_msgSend_supportedAttributesSizeAndIntrinsic(void *a1, const char *a2, ...)
{
  return _[a1 supportedAttributesSizeAndIntrinsic];
}

id objc_msgSend_supportedAttributesTextStyling(void *a1, const char *a2, ...)
{
  return _[a1 supportedAttributesTextStyling];
}

id objc_msgSend_supportsOptions(void *a1, const char *a2, ...)
{
  return _[a1 supportsOptions];
}

id objc_msgSend_suspendAndTeardownForReason_(void *a1, const char *a2, ...)
{
  return [a1 suspendAndTeardownForReason:];
}

id objc_msgSend_suspendAndTeardownWithTransaction_(void *a1, const char *a2, ...)
{
  return [a1 suspendAndTeardownWithTransaction:];
}

id objc_msgSend_suspendLayoutsUntilMeetingLayoutCondition_(void *a1, const char *a2, ...)
{
  return [a1 suspendLayoutsUntilMeetingLayoutCondition:];
}

id objc_msgSend_suspendReuseOfView_(void *a1, const char *a2, ...)
{
  return [a1 suspendReuseOfView];
}

id objc_msgSend_suspendUpdatesUntilMeetingLayoutCondition_(void *a1, const char *a2, ...)
{
  return [a1 suspendUpdatesUntilMeetingLayoutCondition:];
}

id objc_msgSend_suspended(void *a1, const char *a2, ...)
{
  return _[a1 suspended];
}

id objc_msgSend_suspendedDueToMemoryPressure(void *a1, const char *a2, ...)
{
  return _[a1 suspendedDueToMemoryPressure];
}

id objc_msgSend_suspendedViewState(void *a1, const char *a2, ...)
{
  return _[a1 suspendedViewState];
}

id objc_msgSend_symbolImageWithBaselineOffsetFromBottom_(void *a1, const char *a2, ...)
{
  return [a1 symbolImageWithBaselineOffsetFromBottom:];
}

id objc_msgSend_symbolImageWithContentInsets_alignmentInsets_(void *a1, const char *a2, ...)
{
  return [a1 symbolImageWithContentInsets:alignmentInsets:];
}

id objc_msgSend_symbolImageWithName_compatibleWithFontSize_weight_scale_renderingMode_colors_style_contentsScale_layoutDirection_insets_baseline_(void *a1, const char *a2, ...)
{
  return [a1 symbolImageWithName:compatibleWithFontSize:weight:scale:renderingMode:colors:style:contentsScale:layoutDirection:insets:baseline:];
}

id objc_msgSend_symbolImageWithoutBaseline(void *a1, const char *a2, ...)
{
  return _[a1 symbolImageWithoutBaseline];
}

id objc_msgSend_symtab(void *a1, const char *a2, ...)
{
  return _[a1 symtab];
}

id objc_msgSend_syncAssertionWithTimeout_transaction_feedId_(void *a1, const char *a2, ...)
{
  return [a1 syncAssertionWithTimeout:transaction:feedId:];
}

id objc_msgSend_syncLayoutController(void *a1, const char *a2, ...)
{
  return _[a1 syncLayoutController];
}

id objc_msgSend_syncLayoutControllerNeedsFlushing_(void *a1, const char *a2, ...)
{
  return [a1 syncLayoutControllerNeedsFlushing:];
}

id objc_msgSend_syncTimeout(void *a1, const char *a2, ...)
{
  return _[a1 syncTimeout];
}

id objc_msgSend_syncWorkQueue(void *a1, const char *a2, ...)
{
  return _[a1 syncWorkQueue];
}

id objc_msgSend_synchronousTransactionInProgress(void *a1, const char *a2, ...)
{
  return _[a1 synchronousTransactionInProgress];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlackColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemBrownColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBrownColor];
}

id objc_msgSend_systemCyanColor(void *a1, const char *a2, ...)
{
  return _[a1 systemCyanColor];
}

id objc_msgSend_systemDarkBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkBlueColor];
}

id objc_msgSend_systemDarkExtraLightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkExtraLightGrayColor];
}

id objc_msgSend_systemDarkExtraLightGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkExtraLightGrayTintColor];
}

id objc_msgSend_systemDarkGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkGrayColor];
}

id objc_msgSend_systemDarkGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkGrayTintColor];
}

id objc_msgSend_systemDarkGreenColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkGreenColor];
}

id objc_msgSend_systemDarkLightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkLightGrayColor];
}

id objc_msgSend_systemDarkLightGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkLightGrayTintColor];
}

id objc_msgSend_systemDarkLightMidGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkLightMidGrayColor];
}

id objc_msgSend_systemDarkLightMidGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkLightMidGrayTintColor];
}

id objc_msgSend_systemDarkMidGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkMidGrayColor];
}

id objc_msgSend_systemDarkMidGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkMidGrayTintColor];
}

id objc_msgSend_systemDarkOrangeColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkOrangeColor];
}

id objc_msgSend_systemDarkPinkColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkPinkColor];
}

id objc_msgSend_systemDarkPurpleColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkPurpleColor];
}

id objc_msgSend_systemDarkRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkRedColor];
}

id objc_msgSend_systemDarkTealColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkTealColor];
}

id objc_msgSend_systemDarkYellowColor(void *a1, const char *a2, ...)
{
  return _[a1 systemDarkYellowColor];
}

id objc_msgSend_systemExtraLightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemExtraLightGrayColor];
}

id objc_msgSend_systemExtraLightGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemExtraLightGrayTintColor];
}

id objc_msgSend_systemFillColor(void *a1, const char *a2, ...)
{
  return _[a1 systemFillColor];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_systemFontOfSize_weight_design_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:weight:design:];
}

id objc_msgSend_systemGray2Color(void *a1, const char *a2, ...)
{
  return _[a1 systemGray2Color];
}

id objc_msgSend_systemGray3Color(void *a1, const char *a2, ...)
{
  return _[a1 systemGray3Color];
}

id objc_msgSend_systemGray4Color(void *a1, const char *a2, ...)
{
  return _[a1 systemGray4Color];
}

id objc_msgSend_systemGray5Color(void *a1, const char *a2, ...)
{
  return _[a1 systemGray5Color];
}

id objc_msgSend_systemGray6Color(void *a1, const char *a2, ...)
{
  return _[a1 systemGray6Color];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayTintColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGreenColor];
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGroupedBackgroundColor];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:];
}

id objc_msgSend_systemImageNamed_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:compatibleWithTraitCollection:];
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:withConfiguration:];
}

id objc_msgSend_systemIndigoColor(void *a1, const char *a2, ...)
{
  return _[a1 systemIndigoColor];
}

id objc_msgSend_systemLightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemLightGrayColor];
}

id objc_msgSend_systemLightGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemLightGrayTintColor];
}

id objc_msgSend_systemLightMidGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemLightMidGrayColor];
}

id objc_msgSend_systemLightMidGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemLightMidGrayTintColor];
}

id objc_msgSend_systemMidGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemMidGrayColor];
}

id objc_msgSend_systemMidGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemMidGrayTintColor];
}

id objc_msgSend_systemMintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemMintColor];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return _[a1 systemOrangeColor];
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return _[a1 systemPinkColor];
}

id objc_msgSend_systemPurpleColor(void *a1, const char *a2, ...)
{
  return _[a1 systemPurpleColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_systemTealColor(void *a1, const char *a2, ...)
{
  return _[a1 systemTealColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _[a1 systemWhiteColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return _[a1 systemYellowColor];
}

id objc_msgSend_tabBarController(void *a1, const char *a2, ...)
{
  return _[a1 tabBarController];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_targetTriggerState(void *a1, const char *a2, ...)
{
  return _[a1 targetTriggerState];
}

id objc_msgSend_teardown(void *a1, const char *a2, ...)
{
  return _[a1 teardown];
}

id objc_msgSend_template(void *a1, const char *a2, ...)
{
  return _[a1 template];
}

id objc_msgSend_templateFactory(void *a1, const char *a2, ...)
{
  return _[a1 templateFactory];
}

id objc_msgSend_templateFromURL_(void *a1, const char *a2, ...)
{
  return [a1 templateFromURL:];
}

id objc_msgSend_templateFromURL_looseMatch_(void *a1, const char *a2, ...)
{
  return [a1 templateFromURL:looseMatch:];
}

id objc_msgSend_templateImageFilters(void *a1, const char *a2, ...)
{
  return _[a1 templateImageFilters];
}

id objc_msgSend_templateURL(void *a1, const char *a2, ...)
{
  return _[a1 templateURL];
}

id objc_msgSend_temporaryObjectContext(void *a1, const char *a2, ...)
{
  return _[a1 temporaryObjectContext];
}

id objc_msgSend_tertiaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 tertiaryLabelColor];
}

id objc_msgSend_tertiarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 tertiarySystemBackgroundColor];
}

id objc_msgSend_tertiarySystemFillColor(void *a1, const char *a2, ...)
{
  return _[a1 tertiarySystemFillColor];
}

id objc_msgSend_tertiarySystemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 tertiarySystemGroupedBackgroundColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textAlignmentFromString_(void *a1, const char *a2, ...)
{
  return [a1 textAlignmentFromString:];
}

id objc_msgSend_textAttachmentWithImage_(void *a1, const char *a2, ...)
{
  return [a1 textAttachmentWithImage:];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textKey(void *a1, const char *a2, ...)
{
  return _[a1 textKey];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textModelBuilderWithFontSpec_style_color_alignment_writingDirection_language_shouldHyphenate_service_(void *a1, const char *a2, ...)
{
  return [a1 textModelBuilderWithFontSpec:style:color:alignment:writingDirection:language:shouldHyphenate:service:];
}

id objc_msgSend_textStyle(void *a1, const char *a2, ...)
{
  return _[a1 textStyle];
}

id objc_msgSend_textValue(void *a1, const char *a2, ...)
{
  return _[a1 textValue];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return _[a1 textView];
}

id objc_msgSend_threadDictionary(void *a1, const char *a2, ...)
{
  return _[a1 threadDictionary];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return _[a1 time];
}

id objc_msgSend_timeControlStatus(void *a1, const char *a2, ...)
{
  return _[a1 timeControlStatus];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _[a1 timeout];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_timing(void *a1, const char *a2, ...)
{
  return _[a1 timing];
}

id objc_msgSend_timingCollector(void *a1, const char *a2, ...)
{
  return _[a1 timingCollector];
}

id objc_msgSend_timingCount(void *a1, const char *a2, ...)
{
  return _[a1 timingCount];
}

id objc_msgSend_timingCountWithTime_threshold_(void *a1, const char *a2, ...)
{
  return [a1 timingCountWithTime:threshold:];
}

id objc_msgSend_timingParameters(void *a1, const char *a2, ...)
{
  return _[a1 timingParameters];
}

id objc_msgSend_timingProvider(void *a1, const char *a2, ...)
{
  return _[a1 timingProvider];
}

id objc_msgSend_timingThreshold(void *a1, const char *a2, ...)
{
  return _[a1 timingThreshold];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_to(void *a1, const char *a2, ...)
{
  return _[a1 to];
}

id objc_msgSend_toReuseMap(void *a1, const char *a2, ...)
{
  return _[a1 toReuseMap];
}

id objc_msgSend_top(void *a1, const char *a2, ...)
{
  return _[a1 top];
}

id objc_msgSend_topLevelAXElement(void *a1, const char *a2, ...)
{
  return _[a1 topLevelAXElement];
}

id objc_msgSend_topOfCapForLogicalLineIndex_(void *a1, const char *a2, ...)
{
  return [a1 topOfCapForLogicalLineIndex:];
}

id objc_msgSend_topTriggerName(void *a1, const char *a2, ...)
{
  return _[a1 topTriggerName];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_touchInsets(void *a1, const char *a2, ...)
{
  return _[a1 touchInsets];
}

id objc_msgSend_tracker(void *a1, const char *a2, ...)
{
  return _[a1 tracker];
}

id objc_msgSend_tracking(void *a1, const char *a2, ...)
{
  return _[a1 tracking];
}

id objc_msgSend_trailing(void *a1, const char *a2, ...)
{
  return _[a1 trailing];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionByModifyingTraits_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionByModifyingTraits:];
}

id objc_msgSend_traitCollectionWithAccessibilityContrast_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithAccessibilityContrast:];
}

id objc_msgSend_traitCollectionWithDisplayGamut_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithDisplayGamut:];
}

id objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithPreferredContentSizeCategory:];
}

id objc_msgSend_traitCollectionWithTraits_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithTraits:];
}

id objc_msgSend_traitCollectionWithUserInterfaceLevel_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithUserInterfaceLevel:];
}

id objc_msgSend_traitCollectionWithUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithUserInterfaceStyle:];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return _[a1 transaction];
}

id objc_msgSend_transactionCategory(void *a1, const char *a2, ...)
{
  return _[a1 transactionCategory];
}

id objc_msgSend_transactionControllerDidProcessUpdate_(void *a1, const char *a2, ...)
{
  return [a1 transactionControllerDidProcessUpdate:];
}

id objc_msgSend_transactionControllerWillProcessUpdate_(void *a1, const char *a2, ...)
{
  return [a1 transactionControllerWillProcessUpdate:];
}

id objc_msgSend_transactionCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 transactionCoordinator];
}

id objc_msgSend_transactionCoordinator_applyUpdatesFromTransactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionCoordinator:applyUpdatesFromTransactionGroup:");
}

id objc_msgSend_transactionCoordinator_didEndUpdateWithTransactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionCoordinator:didEndUpdateWithTransactionGroup:");
}

id objc_msgSend_transactionCoordinator_performUpdateForTransactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionCoordinator:performUpdateForTransactionGroup:");
}

id objc_msgSend_transactionCoordinator_timeoutForSynchronousTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 transactionCoordinator:timeoutForSynchronousTransactionGroup:];
}

id objc_msgSend_transactionCoordinator_updateWithTransactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionCoordinator:updateWithTransactionGroup:");
}

id objc_msgSend_transactionCoordinator_willBeginUpdateWithTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 transactionCoordinator:willBeginUpdateWithTransactionGroup:];
}

id objc_msgSend_transactionGroup(void *a1, const char *a2, ...)
{
  return _[a1 transactionGroup];
}

id objc_msgSend_transactionWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 transactionWithOptions:];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _[a1 transform];
}

id objc_msgSend_transformForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 transformForAttribute:node:];
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 transitionCoordinator];
}

id objc_msgSend_transitionDuration(void *a1, const char *a2, ...)
{
  return _[a1 transitionDuration];
}

id objc_msgSend_translationOffset(void *a1, const char *a2, ...)
{
  return _[a1 translationOffset];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return _[a1 trigger];
}

id objc_msgSend_triggerBehaviorMap(void *a1, const char *a2, ...)
{
  return _[a1 triggerBehaviorMap];
}

id objc_msgSend_triggerDelay(void *a1, const char *a2, ...)
{
  return _[a1 triggerDelay];
}

id objc_msgSend_triggerForAction_(void *a1, const char *a2, ...)
{
  return [a1 triggerForAction:];
}

id objc_msgSend_triggerForEvent_(void *a1, const char *a2, ...)
{
  return [a1 triggerForEvent:];
}

id objc_msgSend_triggerHandler(void *a1, const char *a2, ...)
{
  return _[a1 triggerHandler];
}

id objc_msgSend_triggerName(void *a1, const char *a2, ...)
{
  return _[a1 triggerName];
}

id objc_msgSend_triggerNameToTriggerMapping(void *a1, const char *a2, ...)
{
  return _[a1 triggerNameToTriggerMapping];
}

id objc_msgSend_triggerPlaybackEnabled(void *a1, const char *a2, ...)
{
  return _[a1 triggerPlaybackEnabled];
}

id objc_msgSend_triggerStateFromString_(void *a1, const char *a2, ...)
{
  return [a1 triggerStateFromString:];
}

id objc_msgSend_triggerStateManager(void *a1, const char *a2, ...)
{
  return _[a1 triggerStateManager];
}

id objc_msgSend_triggerToStateMapping(void *a1, const char *a2, ...)
{
  return _[a1 triggerToStateMapping];
}

id objc_msgSend_triggers(void *a1, const char *a2, ...)
{
  return _[a1 triggers];
}

id objc_msgSend_trimWithStart_end_(void *a1, const char *a2, ...)
{
  return [a1 trimWithStart:end:];
}

id objc_msgSend_truncate(void *a1, const char *a2, ...)
{
  return _[a1 truncate];
}

id objc_msgSend_truncatedCharIndexForLineFragmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 truncatedCharIndexForLineFragmentAtIndex:];
}

id objc_msgSend_tuiReuseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 tuiReuseIdentifier];
}

id objc_msgSend_tui_addLayerAndSublayersToArray_allowHiddenLayers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tui_addLayerAndSublayersToArray:allowHiddenLayers:");
}

id objc_msgSend_tui_allAPITraits(void *a1, const char *a2, ...)
{
  return [a1 tui_allAPITraits];
}

id objc_msgSend_tui_allAnimationsInTree(void *a1, const char *a2, ...)
{
  return [a1 tui_allAnimationsInTree];
}

id objc_msgSend_tui_allLayersInTree(void *a1, const char *a2, ...)
{
  return [a1 tui_allLayersInTree];
}

id objc_msgSend_tui_appendToString_(void *a1, const char *a2, ...)
{
  return [a1 tui_appendToString:];
}

id objc_msgSend_tui_attributedTitleForButtonType_(void *a1, const char *a2, ...)
{
  return [a1 tui_attributedTitleForButtonType:];
}

id objc_msgSend_tui_basicPropertiesToCopy(void *a1, const char *a2, ...)
{
  return [a1 tui_basicPropertiesToCopy];
}

id objc_msgSend_tui_colorComponentFrom_start_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tui_colorComponentFrom:start:length:");
}

id objc_msgSend_tui_colorWithHexString_(void *a1, const char *a2, ...)
{
  return [a1 tui_colorWithHexString];
}

id objc_msgSend_tui_configurationWithPointSize_weight_scale_renderingMode_colors_(void *a1, const char *a2, ...)
{
  return [a1 tui_configurationWithPointSize:weight:scale:renderingMode:colors:];
}

id objc_msgSend_tui_configurationWithRenderingMode_colors_(void *a1, const char *a2, ...)
{
  return [a1 tui_configurationWithRenderingMode:colors:];
}

id objc_msgSend_tui_contentOffsetForScrollingToRect_atScrollPosition_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:");
}

id objc_msgSend_tui_createAssetFromURL_completion_(void *a1, const char *a2, ...)
{
  return [a1 tui_createAssetFromURL:completion:];
}

id objc_msgSend_tui_deepCopyLayer(void *a1, const char *a2, ...)
{
  return [a1 tui_deepCopyLayer];
}

id objc_msgSend_tui_hasProperty_(void *a1, const char *a2, ...)
{
  return [a1 tui_hasProperty:];
}

id objc_msgSend_tui_hostedSubviewsMap(void *a1, const char *a2, ...)
{
  return [a1 tui_hostedSubviewsMap];
}

id objc_msgSend_tui_hostingView(void *a1, const char *a2, ...)
{
  return [a1 tui_hostingView];
}

id objc_msgSend_tui_identifierByAppendingIndex_(void *a1, const char *a2, ...)
{
  return [a1 tui_identifierByAppendingIndex:];
}

id objc_msgSend_tui_identifierByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 tui_identifierByAppendingString:];
}

id objc_msgSend_tui_identifierByPrependingUUID_(void *a1, const char *a2, ...)
{
  return [a1 tui_identifierByPrependingUUID];
}

id objc_msgSend_tui_identifierDescribeForDebuggingWithPackage_(void *a1, const char *a2, ...)
{
  return [a1 tui_identifierDescribeForDebuggingWithPackage:];
}

id objc_msgSend_tui_identifierToString(void *a1, const char *a2, ...)
{
  return [a1 tui_identifierToString];
}

id objc_msgSend_tui_identifierUUID(void *a1, const char *a2, ...)
{
  return [a1 tui_identifierUUID];
}

id objc_msgSend_tui_identifierWithoutUUID(void *a1, const char *a2, ...)
{
  return [a1 tui_identifierWithoutUUID];
}

id objc_msgSend_tui_imageMaskWithColor_(void *a1, const char *a2, ...)
{
  return [a1 tui_imageMaskWithColor:];
}

id objc_msgSend_tui_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return [a1 tui_imageNamed:inBundle:];
}

id objc_msgSend_tui_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return [a1 tui_indexPathForRow:inSection:];
}

id objc_msgSend_tui_initWithCGImage_scale_(void *a1, const char *a2, ...)
{
  return [a1 tui_initWithCGImage:scale:];
}

id objc_msgSend_tui_isMulticolorSymbolWithSymbolRenderingMode_(void *a1, const char *a2, ...)
{
  return [a1 tui_isMulticolorSymbolWithSymbolRenderingMode:];
}

id objc_msgSend_tui_keyboardAvoidingScrollView(void *a1, const char *a2, ...)
{
  return [a1 tui_keyboardAvoidingScrollView];
}

id objc_msgSend_tui_menu(void *a1, const char *a2, ...)
{
  return [a1 tui_menu];
}

id objc_msgSend_tui_moveAndResizeWithinParentLayer_usingGravity_geometryFlipped_retinaScale_animate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tui_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:");
}

id objc_msgSend_tui_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 tui_objectAtIndex:];
}

id objc_msgSend_tui_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 tui_objectForKey:];
}

id objc_msgSend_tui_pop(void *a1, const char *a2, ...)
{
  return [a1 tui_pop];
}

id objc_msgSend_tui_propertiesToCopy(void *a1, const char *a2, ...)
{
  return [a1 tui_propertiesToCopy];
}

id objc_msgSend_tui_pushObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 tui_pushObjectsFromArray:];
}

id objc_msgSend_tui_querySectionUID(void *a1, const char *a2, ...)
{
  return [a1 tui_querySectionUID];
}

id objc_msgSend_tui_querySectionUUID(void *a1, const char *a2, ...)
{
  return [a1 tui_querySectionUUID];
}

id objc_msgSend_tui_renderViewHost(void *a1, const char *a2, ...)
{
  return [a1 tui_renderViewHost];
}

id objc_msgSend_tui_revealableContentPadding(void *a1, const char *a2, ...)
{
  return [a1 tui_revealableContentPadding];
}

id objc_msgSend_tui_row(void *a1, const char *a2, ...)
{
  return [a1 tui_row];
}

id objc_msgSend_tui_scrollToRect_atScrollPosition_animated_delegate_(void *a1, const char *a2, ...)
{
  return [a1 tui_scrollToRect:atScrollPosition:animated:delegate:];
}

id objc_msgSend_tui_section(void *a1, const char *a2, ...)
{
  return [a1 tui_section];
}

id objc_msgSend_tui_stackWithObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 tui_stackWithObjectsFromArray:];
}

id objc_msgSend_tui_subarrayWithStart_end_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tui_subarrayWithStart:end:");
}

id objc_msgSend_tui_uniqueAnimationKeyWithPrefix_(void *a1, const char *a2, ...)
{
  return [a1 tui_uniqueAnimationKeyWithPrefix];
}

id objc_msgSend_tui_unwrapDynamicWithError_(void *a1, const char *a2, ...)
{
  return [a1 tui_unwrapDynamicWithError:];
}

id objc_msgSend_tui_unwwrapEnumeratorWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 tui_unwwrapEnumeratorWithBlock:];
}

id objc_msgSend_tui_valueForProperty_(void *a1, const char *a2, ...)
{
  return [a1 tui_valueForProperty:];
}

id objc_msgSend_tui_widthAsTitle(void *a1, const char *a2, ...)
{
  return [a1 tui_widthAsTitle];
}

id objc_msgSend_tx(void *a1, const char *a2, ...)
{
  return _[a1 tx];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typographicBoundsOfLineFragmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 typographicBoundsOfLineFragmentAtIndex:];
}

id objc_msgSend_uiButtonRoleFromTUIButtonRole_(void *a1, const char *a2, ...)
{
  return [a1 uiButtonRoleFromTUIButtonRole:];
}

id objc_msgSend_uiButtonTypeFromTUIButtonType_(void *a1, const char *a2, ...)
{
  return [a1 uiButtonTypeFromTUIButtonType:];
}

id objc_msgSend_uiControlStateFromTUIElementState_(void *a1, const char *a2, ...)
{
  return [a1 uiControlStateFromTUIElementState:];
}

id objc_msgSend_uiUserInterfaceStyleFromTUIUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return [a1 uiUserInterfaceStyleFromTUIUserInterfaceStyle:];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return _[a1 uid];
}

id objc_msgSend_uids(void *a1, const char *a2, ...)
{
  return _[a1 uids];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return [a1 unarchivedObjectOfClasses:fromData:error:];
}

id objc_msgSend_unbound(void *a1, const char *a2, ...)
{
  return _[a1 unbound];
}

id objc_msgSend_unconditionalValueForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 unconditionalValueForAttribute:node:];
}

id objc_msgSend_unionChanges_(void *a1, const char *a2, ...)
{
  return [a1 unionChanges:];
}

id objc_msgSend_unionInserts_(void *a1, const char *a2, ...)
{
  return [a1 unionInserts:];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return [a1 unionSet:];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _[a1 uniqueID];
}

id objc_msgSend_unprocessedImageResource(void *a1, const char *a2, ...)
{
  return _[a1 unprocessedImageResource];
}

id objc_msgSend_unregisterDelegate_(void *a1, const char *a2, ...)
{
  return [a1 unregisterDelegate:];
}

id objc_msgSend_unregisterEmbeddedCollectionDelegate_(void *a1, const char *a2, ...)
{
  return [a1 unregisterEmbeddedCollectionDelegate:];
}

id objc_msgSend_unregisterEmbeddedScrollView_(void *a1, const char *a2, ...)
{
  return [a1 unregisterEmbeddedScrollView:];
}

id objc_msgSend_unregisterForNotifications(void *a1, const char *a2, ...)
{
  return _[a1 unregisterForNotifications];
}

id objc_msgSend_unregisterHoverObserver_(void *a1, const char *a2, ...)
{
  return [a1 unregisterHoverObserver];
}

id objc_msgSend_unregisterPackage_(void *a1, const char *a2, ...)
{
  return [a1 unregisterPackage:];
}

id objc_msgSend_unregisterPagedScrollableWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 unregisterPagedScrollableWithIdentifier:];
}

id objc_msgSend_unregisterPrefetchController_(void *a1, const char *a2, ...)
{
  return [a1 unregisterPrefetchController:];
}

id objc_msgSend_unregisterProgressObserver_(void *a1, const char *a2, ...)
{
  return [a1 unregisterProgressObserver:];
}

id objc_msgSend_unresolvedValueForAttribute_node_(void *a1, const char *a2, ...)
{
  return [a1 unresolvedValueForAttribute:node:];
}

id objc_msgSend_unsignedIntegerForAttribute_withDefault_node_(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerForAttribute:withDefault:node:];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedIntegerWithSpec_(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerWithSpec:];
}

id objc_msgSend_unsizedKey(void *a1, const char *a2, ...)
{
  return _[a1 unsizedKey];
}

id objc_msgSend_unsizedKeyForColor_imageResource_(void *a1, const char *a2, ...)
{
  return [a1 unsizedKeyForColor:imageResource:];
}

id objc_msgSend_unsizedKeyForContentsScale_imageResource_(void *a1, const char *a2, ...)
{
  return [a1 unsizedKeyForContentsScale:imageResource:];
}

id objc_msgSend_unsizedKeyForContentsScale_imageResources_(void *a1, const char *a2, ...)
{
  return [a1 unsizedKeyForContentsScale:imageResources:];
}

id objc_msgSend_unsizedKeyForFilter_contentsScale_imageResource_(void *a1, const char *a2, ...)
{
  return [a1 unsizedKeyForFilter:contentsScale:imageResource:];
}

id objc_msgSend_unsizedKeyFromTemplatedURL_baseURL_(void *a1, const char *a2, ...)
{
  return [a1 unsizedKeyFromTemplatedURL:baseURL:];
}

id objc_msgSend_updateAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 updateAtIndex:];
}

id objc_msgSend_updateBoundsAndContent_(void *a1, const char *a2, ...)
{
  return [a1 updateBoundsAndContent:];
}

id objc_msgSend_updateComponentBody_(void *a1, const char *a2, ...)
{
  return [a1 updateComponentBody:];
}

id objc_msgSend_updateContent(void *a1, const char *a2, ...)
{
  return _[a1 updateContent];
}

id objc_msgSend_updateContentAllowCrossfade_(void *a1, const char *a2, ...)
{
  return [a1 updateContentAllowCrossfade:];
}

id objc_msgSend_updateContentAndBoundsWithImage_color_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateContentAndBoundsWithImage:color:");
}

id objc_msgSend_updateControlWithIsOn_title_enabled_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateControlWithIsOn:title:enabled:animated:");
}

id objc_msgSend_updateControlWithSelectIndex_segments_tintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateControlWithSelectIndex:segments:tintColor:");
}

id objc_msgSend_updateControlWithValue_enabled_direction_color_startColor_backgroundColor_backgroundImageName_foregroundImageName_starWidth_starPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateControlWithValue:enabled:direction:color:startColor:backgroundColor:backgroundImageName:foregroundImageName:starWidth:starPadding:");
}

id objc_msgSend_updateController(void *a1, const char *a2, ...)
{
  return _[a1 updateController];
}

id objc_msgSend_updateCount_(void *a1, const char *a2, ...)
{
  return [a1 updateCount:];
}

id objc_msgSend_updateDesdendantSpecifiedWidthModifiedWithFlag_(void *a1, const char *a2, ...)
{
  return [a1 updateDesdendantSpecifiedWidthModifiedWithFlag:];
}

id objc_msgSend_updateEmbeddedTriggerStatesWithNewStates_updateEvent_(void *a1, const char *a2, ...)
{
  return [a1 updateEmbeddedTriggerStatesWithNewStates:updateEvent:];
}

id objc_msgSend_updateEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 updateEnvironment:];
}

id objc_msgSend_updateFrameIfNeeded_forViewState_requestedSize_insets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFrameIfNeeded:forViewState:requestedSize:insets:");
}

id objc_msgSend_updateFromState(void *a1, const char *a2, ...)
{
  return _[a1 updateFromState];
}

id objc_msgSend_updateGeometryForViewState_requestedSize_insets_(void *a1, const char *a2, ...)
{
  return [a1 updateGeometryForViewState:requestedSize:insets:];
}

id objc_msgSend_updateGuides(void *a1, const char *a2, ...)
{
  return _[a1 updateGuides];
}

id objc_msgSend_updateHostingGeometryMap_withTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHostingGeometryMap:withTransaction:");
}

id objc_msgSend_updateHostingMap_(void *a1, const char *a2, ...)
{
  return [a1 updateHostingMap:];
}

id objc_msgSend_updateHostingMap_controller_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHostingMap:controller:");
}

id objc_msgSend_updateHoverInteractionWithView_(void *a1, const char *a2, ...)
{
  return [a1 updateHoverInteractionWithView:];
}

id objc_msgSend_updateImage_allowUnload_temporary_(void *a1, const char *a2, ...)
{
  return [a1 updateImage:allowUnload:temporary:];
}

id objc_msgSend_updateInteractionsWithBuilder_(void *a1, const char *a2, ...)
{
  return [a1 updateInteractionsWithBuilder:];
}

id objc_msgSend_updateInvalidatedWithHost_liveTransformResolver_factory_feedView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateInvalidatedWithHost:liveTransformResolver:factory:feedView:");
}

id objc_msgSend_updateItemAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 updateItemAtIndex:];
}

id objc_msgSend_updateLayoutAttributes_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 updateLayoutAttributes:forIdentifier:];
}

id objc_msgSend_updateLiveTransformsIfNecessaryWithViewSize_contentOffset_contentInsets_safeAreaInsets_hasTabBar_(void *a1, const char *a2, ...)
{
  return [a1 updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:];
}

id objc_msgSend_updateModel_(void *a1, const char *a2, ...)
{
  return [a1 updateModel:];
}

id objc_msgSend_updateModelChildren_(void *a1, const char *a2, ...)
{
  return [a1 updateModelChildren:];
}

id objc_msgSend_updateNavigationBarOpacity(void *a1, const char *a2, ...)
{
  return _[a1 updateNavigationBarOpacity];
}

id objc_msgSend_updateOverscrollingTransformsWithContentOffset_invalidationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateOverscrollingTransformsWithContentOffset:invalidationContext:");
}

id objc_msgSend_updateParent_(void *a1, const char *a2, ...)
{
  return [a1 updateParent:];
}

id objc_msgSend_updatePerformanceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 updatePerformanceIdentifier];
}

id objc_msgSend_updatePinningTransformsWithViewBounds_adjustedViewBounds_invalidationContext_hasTabBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePinningTransformsWithViewBounds:adjustedViewBounds:invalidationContext:hasTabBar:");
}

id objc_msgSend_updatePopoverLayout(void *a1, const char *a2, ...)
{
  return _[a1 updatePopoverLayout];
}

id objc_msgSend_updatePopoverLayoutForViewState_superview_(void *a1, const char *a2, ...)
{
  return [a1 updatePopoverLayoutForViewState:superview:];
}

id objc_msgSend_updatePrioritiesForRenderModel_visibleRect_viewState_(void *a1, const char *a2, ...)
{
  return [a1 updatePrioritiesForRenderModel:visibleRect:viewState:];
}

id objc_msgSend_updatePriorty_forController_(void *a1, const char *a2, ...)
{
  return [a1 updatePriorty:forController:];
}

id objc_msgSend_updatePublishedObjects_toReferenceLayersInTree_ratherThanLayersInTree_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePublishedObjects:toReferenceLayersInTree:ratherThanLayersInTree:");
}

id objc_msgSend_updateScrollingWithVisibleBounds_active_(void *a1, const char *a2, ...)
{
  return [a1 updateScrollingWithVisibleBounds:active:];
}

id objc_msgSend_updateSections(void *a1, const char *a2, ...)
{
  return _[a1 updateSections];
}

id objc_msgSend_updateSectionsWithIndices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSectionsWithIndices:");
}

id objc_msgSend_updateStyle_(void *a1, const char *a2, ...)
{
  return [a1 updateStyle:];
}

id objc_msgSend_updateSummariesFromChildren(void *a1, const char *a2, ...)
{
  return _[a1 updateSummariesFromChildren];
}

id objc_msgSend_updateTemplateURL_bindings_(void *a1, const char *a2, ...)
{
  return [a1 updateTemplateURL:bindings:];
}

id objc_msgSend_updateTime_(void *a1, const char *a2, ...)
{
  return [a1 updateTime:];
}

id objc_msgSend_updateTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 updateTraitCollection:];
}

id objc_msgSend_updateTriggerStatesWithNewStates_updateEvent_(void *a1, const char *a2, ...)
{
  return [a1 updateTriggerStatesWithNewStates:updateEvent:];
}

id objc_msgSend_updateView(void *a1, const char *a2, ...)
{
  return _[a1 updateView];
}

id objc_msgSend_updateVisible(void *a1, const char *a2, ...)
{
  return _[a1 updateVisible];
}

id objc_msgSend_updateVisible_bounds_host_liveTransformResolver_factory_feedView_(void *a1, const char *a2, ...)
{
  return [a1 updateVisible:bounds:host:liveTransformResolver:factory:feedView:];
}

id objc_msgSend_updateVisible_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 updateVisible:forIdentifier:];
}

id objc_msgSend_updateVisible_time_(void *a1, const char *a2, ...)
{
  return [a1 updateVisible:time:];
}

id objc_msgSend_updateVisibleBounds(void *a1, const char *a2, ...)
{
  return _[a1 updateVisibleBounds];
}

id objc_msgSend_updateVisibleBounds_(void *a1, const char *a2, ...)
{
  return [a1 updateVisibleBounds:];
}

id objc_msgSend_updateVisibleMenuWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateVisibleMenuWithBlock:");
}

id objc_msgSend_updateWithAXModel_(void *a1, const char *a2, ...)
{
  return [a1 updateWithAXModel:];
}

id objc_msgSend_updateWithAttachmentLayouts_(void *a1, const char *a2, ...)
{
  return [a1 updateWithAttachmentLayouts:];
}

id objc_msgSend_updateWithContent_layoutUpToEntry_environment_transaction_(void *a1, const char *a2, ...)
{
  return [a1 updateWithContent:layoutUpToEntry:environment:transaction:];
}

id objc_msgSend_updateWithContent_transaction_(void *a1, const char *a2, ...)
{
  return [a1 updateWithContent:transaction:];
}

id objc_msgSend_updateWithContents_(void *a1, const char *a2, ...)
{
  return [a1 updateWithContents:];
}

id objc_msgSend_updateWithEntry_withBuilder_environmentContainer_(void *a1, const char *a2, ...)
{
  return [a1 updateWithEntry:withBuilder:environmentContainer:];
}

id objc_msgSend_updateWithEnvironment_state_withTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithEnvironment:state:withTransaction:");
}

id objc_msgSend_updateWithHostingMap_transactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 updateWithHostingMap:transactionGroup:];
}

id objc_msgSend_updateWithImpressionSnapshot_(void *a1, const char *a2, ...)
{
  return [a1 updateWithImpressionSnapshot:];
}

id objc_msgSend_updateWithLinkEntities_(void *a1, const char *a2, ...)
{
  return [a1 updateWithLinkEntities:];
}

id objc_msgSend_updateWithPageIndex_pageCount_(void *a1, const char *a2, ...)
{
  return [a1 updateWithPageIndex:pageCount:];
}

id objc_msgSend_updateWithPass_(void *a1, const char *a2, ...)
{
  return [a1 updateWithPass:];
}

id objc_msgSend_updateWithPass_currentEntriesUID_(void *a1, const char *a2, ...)
{
  return [a1 updateWithPass:currentEntriesUID];
}

id objc_msgSend_updateWithRenderModel_factory_triggerManager_promoteAccessory_(void *a1, const char *a2, ...)
{
  return [a1 updateWithRenderModel:factory:triggerManager:promoteAccessory:];
}

id objc_msgSend_updateWithRenderModel_transactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 updateWithRenderModel:transactionGroup:];
}

id objc_msgSend_updateWithRenderModel_transactionGroup_hasInvalidLayouts_(void *a1, const char *a2, ...)
{
  return [a1 updateWithRenderModel:transactionGroup:hasInvalidLayouts:];
}

id objc_msgSend_updateWithRenderModel_viewState_flags_transactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithRenderModel:viewState:flags:transactionGroup:");
}

id objc_msgSend_updateWithTransaction_value_(void *a1, const char *a2, ...)
{
  return [a1 updateWithTransaction:value:];
}

id objc_msgSend_updateWithTransaction_valueIfChanged_(void *a1, const char *a2, ...)
{
  return [a1 updateWithTransaction:valueIfChanged:];
}

id objc_msgSend_updateWithValueIfChanged_(void *a1, const char *a2, ...)
{
  return [a1 updateWithValueIfChanged:];
}

id objc_msgSend_updateWithView_(void *a1, const char *a2, ...)
{
  return [a1 updateWithView:];
}

id objc_msgSend_updated(void *a1, const char *a2, ...)
{
  return _[a1 updated];
}

id objc_msgSend_updatedVisibleBoundsOfScrollView_(void *a1, const char *a2, ...)
{
  return [a1 updatedVisibleBoundsOfScrollView:];
}

id objc_msgSend_updates(void *a1, const char *a2, ...)
{
  return _[a1 updates];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_upstreamValue(void *a1, const char *a2, ...)
{
  return _[a1 upstreamValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_urlCache(void *a1, const char *a2, ...)
{
  return _[a1 urlCache];
}

id objc_msgSend_urlLoaded_(void *a1, const char *a2, ...)
{
  return [a1 urlLoaded:];
}

id objc_msgSend_urlString(void *a1, const char *a2, ...)
{
  return _[a1 urlString];
}

id objc_msgSend_useFontFallback(void *a1, const char *a2, ...)
{
  return _[a1 useFontFallback];
}

id objc_msgSend_useGlobalsWithName_(void *a1, const char *a2, ...)
{
  return [a1 useGlobalsWithName:];
}

id objc_msgSend_useHostedViewFactoryForType_(void *a1, const char *a2, ...)
{
  return [a1 useHostedViewFactoryForType:];
}

id objc_msgSend_usedDynamicColor(void *a1, const char *a2, ...)
{
  return _[a1 usedDynamicColor];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInitiatedCallbackQueue(void *a1, const char *a2, ...)
{
  return _[a1 userInitiatedCallbackQueue];
}

id objc_msgSend_userInteractiveCallbackQueue(void *a1, const char *a2, ...)
{
  return _[a1 userInteractiveCallbackQueue];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceLevel(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceLevel];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_userInterfaceStyleFromString_(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyleFromString:];
}

id objc_msgSend_usingGeometry(void *a1, const char *a2, ...)
{
  return _[a1 usingGeometry];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_validateGlobalsWithContext_(void *a1, const char *a2, ...)
{
  return [a1 validateGlobalsWithContext:];
}

id objc_msgSend_validateGroupedContainingLayout_withSize_(void *a1, const char *a2, ...)
{
  return [a1 validateGroupedContainingLayout:withSize:];
}

id objc_msgSend_validateGuides(void *a1, const char *a2, ...)
{
  return _[a1 validateGuides];
}

id objc_msgSend_validateInstantiationWithContext_transactionGroup_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateInstantiationWithContext:transactionGroup:layout:");
}

id objc_msgSend_validateInstantiationWithTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 validateInstantiationWithTransactionGroup:];
}

id objc_msgSend_validateLayout(void *a1, const char *a2, ...)
{
  return _[a1 validateLayout];
}

id objc_msgSend_validateLayout_(void *a1, const char *a2, ...)
{
  return [a1 validateLayout:];
}

id objc_msgSend_validateLayouts(void *a1, const char *a2, ...)
{
  return _[a1 validateLayouts];
}

id objc_msgSend_validateRenderModelWithContext_transactionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateRenderModelWithContext:transactionGroup:");
}

id objc_msgSend_validateRenderModelsWithTransactionGroup_(void *a1, const char *a2, ...)
{
  return [a1 validateRenderModelsWithTransactionGroup:];
}

id objc_msgSend_validatedIntrinsicHeight(void *a1, const char *a2, ...)
{
  return _[a1 validatedIntrinsicHeight];
}

id objc_msgSend_validatedIntrinsicHeightConsideringSpecified(void *a1, const char *a2, ...)
{
  return _[a1 validatedIntrinsicHeightConsideringSpecified];
}

id objc_msgSend_validatedIntrinsicSize(void *a1, const char *a2, ...)
{
  return _[a1 validatedIntrinsicSize];
}

id objc_msgSend_validatedIntrinsicWidth(void *a1, const char *a2, ...)
{
  return _[a1 validatedIntrinsicWidth];
}

id objc_msgSend_validatedIntrinsicWidthConsideringSpecified(void *a1, const char *a2, ...)
{
  return _[a1 validatedIntrinsicWidthConsideringSpecified];
}

id objc_msgSend_valign(void *a1, const char *a2, ...)
{
  return _[a1 valign];
}

id objc_msgSend_valignFromString_(void *a1, const char *a2, ...)
{
  return [a1 valignFromString:];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 valueForKeyPath:];
}

id objc_msgSend_valueForStep_(void *a1, const char *a2, ...)
{
  return [a1 valueForStep:];
}

id objc_msgSend_valueForValue_(void *a1, const char *a2, ...)
{
  return [a1 valueForValue:];
}

id objc_msgSend_valueWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 valueWithBlock:];
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return [a1 valueWithBytes:objCType:];
}

id objc_msgSend_valueWithCATransform3D_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCATransform3D:];
}

id objc_msgSend_valueWithCGAffineTransform_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCGAffineTransform:];
}

id objc_msgSend_valueWithCGPoint_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCGPoint:];
}

id objc_msgSend_valueWithCGRect_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCGRect:];
}

id objc_msgSend_valueWithCGSize_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCGSize:];
}

id objc_msgSend_valueWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 valueWithIdentifier:];
}

id objc_msgSend_valueWithMax_(void *a1, const char *a2, ...)
{
  return [a1 valueWithMax:];
}

id objc_msgSend_valueWithSize_(void *a1, const char *a2, ...)
{
  return [a1 valueWithSize:];
}

id objc_msgSend_valueWithStep_(void *a1, const char *a2, ...)
{
  return [a1 valueWithStep:];
}

id objc_msgSend_valueWithUIEdgeInsets_(void *a1, const char *a2, ...)
{
  return [a1 valueWithUIEdgeInsets:];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _[a1 values];
}

id objc_msgSend_variationOfStyle_propertyMap_(void *a1, const char *a2, ...)
{
  return [a1 variationOfStyle:propertyMap:];
}

id objc_msgSend_vcompressed(void *a1, const char *a2, ...)
{
  return _[a1 vcompressed];
}

id objc_msgSend_verifyHierarchyForSubview_(void *a1, const char *a2, ...)
{
  return [a1 verifyHierarchyForSubview:];
}

id objc_msgSend_verticalPlacement(void *a1, const char *a2, ...)
{
  return _[a1 verticalPlacement];
}

id objc_msgSend_verticalPlacementFromString_(void *a1, const char *a2, ...)
{
  return [a1 verticalPlacementFromString:];
}

id objc_msgSend_verticalScrollIndicatorInsets(void *a1, const char *a2, ...)
{
  return _[a1 verticalScrollIndicatorInsets];
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 verticalSizeClass];
}

id objc_msgSend_videoGravityFromString_(void *a1, const char *a2, ...)
{
  return [a1 videoGravityFromString:];
}

id objc_msgSend_videoId(void *a1, const char *a2, ...)
{
  return _[a1 videoId];
}

id objc_msgSend_videoMode(void *a1, const char *a2, ...)
{
  return _[a1 videoMode];
}

id objc_msgSend_videoModeAsString(void *a1, const char *a2, ...)
{
  return _[a1 videoModeAsString];
}

id objc_msgSend_videoPlayerManager(void *a1, const char *a2, ...)
{
  return _[a1 videoPlayerManager];
}

id objc_msgSend_videoUrl(void *a1, const char *a2, ...)
{
  return _[a1 videoUrl];
}

id objc_msgSend_videoViewController(void *a1, const char *a2, ...)
{
  return _[a1 videoViewController];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 viewAtIndexPath:];
}

id objc_msgSend_viewAtIndexPath_factory_host_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewAtIndexPath:factory:host:");
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _[a1 viewController];
}

id objc_msgSend_viewController_hostedViewWithType_identifier_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewController:hostedViewWithType:identifier:parameters:");
}

id objc_msgSend_viewDidEndDisplay(void *a1, const char *a2, ...)
{
  return _[a1 viewDidEndDisplay];
}

id objc_msgSend_viewFactory(void *a1, const char *a2, ...)
{
  return _[a1 viewFactory];
}

id objc_msgSend_viewFactoryDequeueReusableSubviewWithReuseIdentifier_indexPath_host_(void *a1, const char *a2, ...)
{
  return [a1 viewFactoryDequeueReusableSubviewWithReuseIdentifier:indexPath:host:];
}

id objc_msgSend_viewFactoryPrepareToReuseHost_(void *a1, const char *a2, ...)
{
  return [a1 viewFactoryPrepareToReuseHost:];
}

id objc_msgSend_viewFactoryReuseSubviews_host_(void *a1, const char *a2, ...)
{
  return [a1 viewFactoryReuseSubviews:host:];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return _[a1 viewIfLoaded];
}

id objc_msgSend_viewModelForIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 viewModelForIndexPath:];
}

id objc_msgSend_viewModelWithIndex_(void *a1, const char *a2, ...)
{
  return [a1 viewModelWithIndex:];
}

id objc_msgSend_viewModels(void *a1, const char *a2, ...)
{
  return _[a1 viewModels];
}

id objc_msgSend_viewRange(void *a1, const char *a2, ...)
{
  return _[a1 viewRange];
}

id objc_msgSend_viewRegistry(void *a1, const char *a2, ...)
{
  return _[a1 viewRegistry];
}

id objc_msgSend_viewSize(void *a1, const char *a2, ...)
{
  return _[a1 viewSize];
}

id objc_msgSend_viewState(void *a1, const char *a2, ...)
{
  return _[a1 viewState];
}

id objc_msgSend_viewStateForBinding_(void *a1, const char *a2, ...)
{
  return [a1 viewStateForBinding:];
}

id objc_msgSend_viewStateForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 viewStateForIdentifier:];
}

id objc_msgSend_viewStateForNode_binding_(void *a1, const char *a2, ...)
{
  return [a1 viewStateForNode:binding:];
}

id objc_msgSend_viewStateMapping(void *a1, const char *a2, ...)
{
  return _[a1 viewStateMapping];
}

id objc_msgSend_viewStateRestore_(void *a1, const char *a2, ...)
{
  return [a1 viewStateRestore];
}

id objc_msgSend_viewStateSave(void *a1, const char *a2, ...)
{
  return _[a1 viewStateSave];
}

id objc_msgSend_viewStateToRestore(void *a1, const char *a2, ...)
{
  return _[a1 viewStateToRestore];
}

id objc_msgSend_viewStatesByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 viewStatesByIdentifier];
}

id objc_msgSend_viewSupportsDrag_(void *a1, const char *a2, ...)
{
  return [a1 viewSupportsDrag:];
}

id objc_msgSend_viewVisibilityController(void *a1, const char *a2, ...)
{
  return _[a1 viewVisibilityController];
}

id objc_msgSend_viewWillAppearDate(void *a1, const char *a2, ...)
{
  return _[a1 viewWillAppearDate];
}

id objc_msgSend_viewWillDisplay(void *a1, const char *a2, ...)
{
  return _[a1 viewWillDisplay];
}

id objc_msgSend_visibilityController(void *a1, const char *a2, ...)
{
  return _[a1 visibilityController];
}

id objc_msgSend_visibilityOptions(void *a1, const char *a2, ...)
{
  return _[a1 visibilityOptions];
}

id objc_msgSend_visibilityProviderHostingLayer(void *a1, const char *a2, ...)
{
  return _[a1 visibilityProviderHostingLayer];
}

id objc_msgSend_visibilityProviderIsScrolling(void *a1, const char *a2, ...)
{
  return _[a1 visibilityProviderIsScrolling];
}

id objc_msgSend_visibilityProviderIsVisible(void *a1, const char *a2, ...)
{
  return _[a1 visibilityProviderIsVisible];
}

id objc_msgSend_visibilityProviderSections(void *a1, const char *a2, ...)
{
  return _[a1 visibilityProviderSections];
}

id objc_msgSend_visibilityProviderVisibleBounds(void *a1, const char *a2, ...)
{
  return _[a1 visibilityProviderVisibleBounds];
}

id objc_msgSend_visibilityProviderWindowLayer(void *a1, const char *a2, ...)
{
  return _[a1 visibilityProviderWindowLayer];
}

id objc_msgSend_visible(void *a1, const char *a2, ...)
{
  return _[a1 visible];
}

id objc_msgSend_visibleBounds(void *a1, const char *a2, ...)
{
  return _[a1 visibleBounds];
}

id objc_msgSend_visibleBoundsGeneration(void *a1, const char *a2, ...)
{
  return _[a1 visibleBoundsGeneration];
}

id objc_msgSend_visibleBoundsObservers(void *a1, const char *a2, ...)
{
  return _[a1 visibleBoundsObservers];
}

id objc_msgSend_visibleBoundsUpdated_(void *a1, const char *a2, ...)
{
  return [a1 visibleBoundsUpdated:];
}

id objc_msgSend_visibleContentsChanged_(void *a1, const char *a2, ...)
{
  return [a1 visibleContentsChanged:];
}

id objc_msgSend_visiblePriority(void *a1, const char *a2, ...)
{
  return _[a1 visiblePriority];
}

id objc_msgSend_visibleViewAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 visibleViewAtIndexPath:];
}

id objc_msgSend_visibleViews(void *a1, const char *a2, ...)
{
  return _[a1 visibleViews];
}

id objc_msgSend_vspacing(void *a1, const char *a2, ...)
{
  return _[a1 vspacing];
}

id objc_msgSend_waitForFinalizing(void *a1, const char *a2, ...)
{
  return _[a1 waitForFinalizing];
}

id objc_msgSend_waitForImageResources_(void *a1, const char *a2, ...)
{
  return [a1 waitForImageResources:];
}

id objc_msgSend_waitForSyncTransaction_completion_(void *a1, const char *a2, ...)
{
  return [a1 waitForSyncTransaction:completion:];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_weight(void *a1, const char *a2, ...)
{
  return _[a1 weight];
}

id objc_msgSend_weightFromString_withDefault_(void *a1, const char *a2, ...)
{
  return [a1 weightFromString:withDefault:];
}

id objc_msgSend_whenUnavailable(void *a1, const char *a2, ...)
{
  return _[a1 whenUnavailable];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return _[a1 width];
}

id objc_msgSend_widthClass(void *a1, const char *a2, ...)
{
  return _[a1 widthClass];
}

id objc_msgSend_widthSnap(void *a1, const char *a2, ...)
{
  return _[a1 widthSnap];
}

id objc_msgSend_willBecomeInactiveHost(void *a1, const char *a2, ...)
{
  return _[a1 willBecomeInactiveHost];
}

id objc_msgSend_willRemoveLayerWithFeedControllerHost_(void *a1, const char *a2, ...)
{
  return [a1 willRemoveLayerWithFeedControllerHost:];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowCount(void *a1, const char *a2, ...)
{
  return _[a1 windowCount];
}

id objc_msgSend_windowLowerLoadTriggerChildBoxFlipped_(void *a1, const char *a2, ...)
{
  return [a1 windowLowerLoadTriggerChildBoxFlipped:];
}

id objc_msgSend_windowLowerLoadTriggered(void *a1, const char *a2, ...)
{
  return _[a1 windowLowerLoadTriggered];
}

id objc_msgSend_windowLowerUnloadTriggerChildBoxFlipped_(void *a1, const char *a2, ...)
{
  return [a1 windowLowerUnloadTriggerChildBoxFlipped:];
}

id objc_msgSend_windowLowerUnloadTriggered(void *a1, const char *a2, ...)
{
  return _[a1 windowLowerUnloadTriggered];
}

id objc_msgSend_windowRange(void *a1, const char *a2, ...)
{
  return _[a1 windowRange];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_windowSize(void *a1, const char *a2, ...)
{
  return _[a1 windowSize];
}

id objc_msgSend_windowUpperLoadTriggerChildBoxFlipped_(void *a1, const char *a2, ...)
{
  return [a1 windowUpperLoadTriggerChildBoxFlipped:];
}

id objc_msgSend_windowUpperLoadTriggered(void *a1, const char *a2, ...)
{
  return _[a1 windowUpperLoadTriggered];
}

id objc_msgSend_windowUpperUnloadTriggerChildBoxFlipped_(void *a1, const char *a2, ...)
{
  return [a1 windowUpperUnloadTriggerChildBoxFlipped:];
}

id objc_msgSend_windowUpperUnloadTriggered(void *a1, const char *a2, ...)
{
  return _[a1 windowUpperUnloadTriggered];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return _[a1 workQueue];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:options:error:];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:atomically:];
}

id objc_msgSend_writingDirectionForParagraphAtCharIndex_(void *a1, const char *a2, ...)
{
  return [a1 writingDirectionForParagraphAtCharIndex:];
}

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return _[a1 yellowColor];
}

id objc_msgSend_zIndex(void *a1, const char *a2, ...)
{
  return _[a1 zIndex];
}