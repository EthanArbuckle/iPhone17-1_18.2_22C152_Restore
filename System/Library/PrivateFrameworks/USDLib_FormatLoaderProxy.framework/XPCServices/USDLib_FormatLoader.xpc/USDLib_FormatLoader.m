uint64_t PlyConverter::PlyConverter(uint64_t a1, void *a2, long long *a3)
{
  long long v5;

  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  if (*((char *)a3 + 23) < 0)
  {
    sub_100007814((unsigned char *)(a1 + 24), *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    v5 = *a3;
    *(void *)(a1 + 40) = *((void *)a3 + 2);
    *(_OWORD *)(a1 + 24) = v5;
  }
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 160) = 0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(unsigned char *)(a1 + 168) = PlyConverter::parsePly((uint64_t *)a1, a2);
  return a1;
}

void sub_10000402C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007C28((void ***)va);
  _Unwind_Resume(a1);
}

BOOL PlyConverter::parsePly(uint64_t *a1, void *a2)
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v115 = 0;
  std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(void *)(*a2 - 24)));
  v4 = std::locale::use_facet(&v122, &std::ctype<char>::id);
  unsigned __int8 v5 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 10);
  std::locale::~locale(&v122);
  v6 = sub_100007990(a2, (uint64_t)__p, v5);
  if ((*((unsigned char *)v6 + *(void *)(*v6 - 24) + 32) & 5) != 0
    || (v115 >= 0 ? (v7 = __p) : (v7 = (void **)__p[0]), strncmp("ply", (const char *)v7, 3uLL)))
  {
    BOOL v8 = 0;
    goto LABEL_7;
  }
  v111 = 0;
  uint64_t v112 = 0;
  uint64_t v113 = 0;
  PlyConverter::parsePlyHeader(a1, (uint64_t)&v111, a2);
  v121[3].__locale_ = 0;
  v120[3] = 0;
  v119[3] = 0;
  if (v113 < 0)
  {
    uint64_t v13 = v112;
    if (v112 != 5 || (*(_DWORD *)v111 == 1768125281 ? (BOOL v14 = *((unsigned char *)v111 + 4) == 105) : (BOOL v14 = 0), !v14))
    {
      if (v112 == 20)
      {
        if (*(void *)v111 == 0x6C5F7972616E6962
          && *((void *)v111 + 1) == 0x6E655F656C747469
          && *((_DWORD *)v111 + 4) == 1851877732)
        {
LABEL_55:
          v122.__locale_ = (std::locale::__imp *)&off_100018418;
          v123 = sub_100006718;
          v124 = &v122;
          sub_10000835C(&v122, v121);
          v26 = sub_100008194(&v122);
          v122.__locale_ = (std::locale::__imp *)&off_1000184C8;
          v123 = sub_100006838;
          v124 = &v122;
          sub_10000835C(v26, v120);
          v23 = sub_100008194(&v122);
          v122.__locale_ = (std::locale::__imp *)&off_1000184C8;
          v24 = sub_100006978;
          goto LABEL_57;
        }
        uint64_t v13 = v112;
      }
      if (v13 != 17)
      {
LABEL_52:
        BOOL v8 = 0;
        goto LABEL_53;
      }
      v12 = (uint64_t *)v111;
      goto LABEL_39;
    }
LABEL_56:
    v122.__locale_ = (std::locale::__imp *)&off_100018418;
    v123 = sub_100006548;
    v124 = &v122;
    sub_10000835C(&v122, v121);
    v27 = sub_100008194(&v122);
    v122.__locale_ = (std::locale::__imp *)&off_1000184C8;
    v123 = sub_10000660C;
    v124 = &v122;
    sub_10000835C(v27, v120);
    v23 = sub_100008194(&v122);
    v122.__locale_ = (std::locale::__imp *)&off_1000184C8;
    v24 = sub_1000066D8;
    goto LABEL_57;
  }
  if (HIBYTE(v113) == 5)
  {
    if (v111 != 1768125281 || BYTE4(v111) != 105) {
      goto LABEL_52;
    }
    goto LABEL_56;
  }
  if (HIBYTE(v113) != 17)
  {
    if (HIBYTE(v113) != 20) {
      goto LABEL_52;
    }
    BOOL v10 = v111 == (void *)0x6C5F7972616E6962 && v112 == 0x6E655F656C747469;
    if (!v10 || v113 != 1851877732) {
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  v12 = (uint64_t *)&v111;
LABEL_39:
  uint64_t v17 = *v12;
  uint64_t v18 = v12[1];
  int v19 = *((unsigned __int8 *)v12 + 16);
  if (v17 != 0x625F7972616E6962 || v18 != 0x6169646E655F6769 || v19 != 110) {
    goto LABEL_52;
  }
  v122.__locale_ = (std::locale::__imp *)&off_100018418;
  v123 = sub_1000069B8;
  v124 = &v122;
  sub_10000835C(&v122, v121);
  v22 = sub_100008194(&v122);
  v122.__locale_ = (std::locale::__imp *)&off_1000184C8;
  v123 = sub_100006AD8;
  v124 = &v122;
  sub_10000835C(v22, v120);
  v23 = sub_100008194(&v122);
  v122.__locale_ = (std::locale::__imp *)&off_1000184C8;
  v24 = sub_100006C14;
LABEL_57:
  v123 = v24;
  v124 = &v122;
  sub_10000835C(v23, v119);
  sub_100008194(&v122);
  uint64_t v29 = *a1;
  uint64_t v28 = a1[1];
  if (*a1 != v28)
  {
    v106 = (void **)(a1 + 15);
    v104 = a1 + 6;
    v105 = (void **)(a1 + 18);
    v103 = a1 + 9;
    v102 = a1 + 12;
    while (1)
    {
      unint64_t v30 = *(void *)(v29 + 48);
      BOOL v8 = v30 >> 28 == 0;
      if (v30 >> 28) {
        goto LABEL_53;
      }
      v31 = (_DWORD *)(v29 + 24);
      if (*(char *)(v29 + 47) < 0)
      {
        uint64_t v34 = *(void *)(v29 + 32);
        if (v34 == 4)
        {
          v31 = *(_DWORD **)v31;
LABEL_77:
          if (*v31 == 1701011814)
          {
            sub_100006D78(v106, 3 * v30);
            sub_100006D78(v105, *(void *)(v29 + 48));
            unint64_t v41 = *(void *)(v29 + 48);
            if (v41)
            {
              uint64_t v42 = 0;
              uint64_t v100 = v28;
              do
              {
                uint64_t v99 = v42;
                v44 = *(int **)v29;
                v43 = *(int **)(v29 + 8);
                if (*(int **)v29 != v43)
                {
                  do
                  {
                    if (*v44 == 9)
                    {
                      sub_1000064F4((uint64_t)v121, (uint64_t)a2, v44[2]);
                      int v46 = (int)v45;
                      if ((int)v45 > 0x400) {
                        goto LABEL_52;
                      }
                      if (v46)
                      {
                        for (int i = 0; i != v46; ++i)
                        {
                          sub_1000064F4((uint64_t)v121, (uint64_t)a2, v44[1]);
                          int v49 = (int)v48;
                          v51 = (int *)a1[16];
                          unint64_t v50 = a1[17];
                          if ((unint64_t)v51 >= v50)
                          {
                            v53 = (int *)*v106;
                            uint64_t v54 = ((char *)v51 - (unsigned char *)*v106) >> 2;
                            unint64_t v55 = v54 + 1;
                            if ((unint64_t)(v54 + 1) >> 62) {
                              sub_100007E2C();
                            }
                            uint64_t v56 = v50 - (void)v53;
                            if (v56 >> 1 > v55) {
                              unint64_t v55 = v56 >> 1;
                            }
                            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL) {
                              unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
                            }
                            else {
                              unint64_t v57 = v55;
                            }
                            if (v57)
                            {
                              v58 = (char *)sub_100008908((uint64_t)(a1 + 17), v57);
                              v53 = (int *)a1[15];
                              v51 = (int *)a1[16];
                            }
                            else
                            {
                              v58 = 0;
                            }
                            v59 = (int *)&v58[4 * v54];
                            int *v59 = v49;
                            v52 = v59 + 1;
                            while (v51 != v53)
                            {
                              int v60 = *--v51;
                              *--v59 = v60;
                            }
                            a1[15] = (uint64_t)v59;
                            a1[16] = (uint64_t)v52;
                            a1[17] = (uint64_t)&v58[4 * v57];
                            if (v53) {
                              operator delete(v53);
                            }
                          }
                          else
                          {
                            int *v51 = v49;
                            v52 = v51 + 1;
                          }
                          a1[16] = (uint64_t)v52;
                        }
                      }
                      v62 = (int *)a1[19];
                      unint64_t v61 = a1[20];
                      if ((unint64_t)v62 >= v61)
                      {
                        v66 = (int *)*v105;
                        uint64_t v67 = ((char *)v62 - (unsigned char *)*v105) >> 2;
                        unint64_t v68 = v67 + 1;
                        if ((unint64_t)(v67 + 1) >> 62) {
                          sub_100007E2C();
                        }
                        uint64_t v69 = v61 - (void)v66;
                        if (v69 >> 1 > v68) {
                          unint64_t v68 = v69 >> 1;
                        }
                        if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFFCLL) {
                          unint64_t v70 = 0x3FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          unint64_t v70 = v68;
                        }
                        if (v70)
                        {
                          v71 = (char *)sub_100008908((uint64_t)(a1 + 20), v70);
                          v66 = (int *)a1[18];
                          v62 = (int *)a1[19];
                        }
                        else
                        {
                          v71 = 0;
                        }
                        v72 = (int *)&v71[4 * v67];
                        int *v72 = v46;
                        v63 = v72 + 1;
                        while (v62 != v66)
                        {
                          int v73 = *--v62;
                          *--v72 = v73;
                        }
                        a1[18] = (uint64_t)v72;
                        a1[19] = (uint64_t)v63;
                        a1[20] = (uint64_t)&v71[4 * v70];
                        if (v66) {
                          operator delete(v66);
                        }
                      }
                      else
                      {
                        int *v62 = v46;
                        v63 = v62 + 1;
                      }
                      a1[19] = (uint64_t)v63;
                    }
                    else
                    {
                      uint64_t v64 = sub_100008704((uint64_t)v117, (uint64_t)v121);
                      char v65 = PlyConverter::skipUnknownProperty(v64, (uint64_t)v44, (uint64_t)a2, (uint64_t)v117);
                      sub_100008194(v117);
                      if ((v65 & 1) == 0) {
                        goto LABEL_52;
                      }
                    }
                    v44 += 3;
                  }
                  while (v44 != v43);
                  unint64_t v41 = *(void *)(v29 + 48);
                }
                uint64_t v28 = v100;
                uint64_t v42 = v99 + 1;
              }
              while (v99 + 1 < v41);
            }
            goto LABEL_173;
          }
          goto LABEL_78;
        }
        if (v34 == 6 && **(_DWORD **)v31 == 1953654134 && *(_WORD *)(*(void *)v31 + 4) == 30821)
        {
LABEL_133:
          uint64_t v101 = v28;
          v74 = *(int **)v29;
          v75 = *(int **)(v29 + 8);
          if (*(int **)v29 == v75)
          {
            char v77 = 0;
            char v76 = 0;
          }
          else
          {
            char v76 = 0;
            char v77 = 0;
            do
            {
              int v78 = *v74;
              v74 += 3;
              v76 |= v78 == 3;
              v77 |= v78 == 6;
            }
            while (v74 != v75);
          }
          sub_100006C54(v104, v30);
          if (v76) {
            sub_100006C54(v103, *(void *)(v29 + 48));
          }
          if (v77) {
            sub_100006C54(v102, *(void *)(v29 + 48));
          }
          v122.__locale_ = 0;
          LODWORD(v123) = 0;
          uint64_t v109 = 0x3F80000000000000;
          int v110 = 0;
          uint64_t v107 = 0;
          int v108 = 0;
          if (*(void *)(v29 + 48))
          {
            unint64_t v79 = 0;
            do
            {
              v81 = *(int **)v29;
              v80 = *(int **)(v29 + 8);
              while (v81 != v80)
              {
                switch(*v81)
                {
                  case 0:
                    sub_1000064F4((uint64_t)v120, (uint64_t)a2, v81[1]);
                    LODWORD(v122.__locale_) = v82;
                    goto LABEL_157;
                  case 1:
                    sub_1000064F4((uint64_t)v120, (uint64_t)a2, v81[1]);
                    HIDWORD(v122.__locale_) = v87;
                    goto LABEL_157;
                  case 2:
                    sub_1000064F4((uint64_t)v120, (uint64_t)a2, v81[1]);
                    LODWORD(v123) = v84;
                    goto LABEL_157;
                  case 3:
                    sub_1000064F4((uint64_t)v120, (uint64_t)a2, v81[1]);
                    LODWORD(v109) = v85;
                    goto LABEL_157;
                  case 4:
                    sub_1000064F4((uint64_t)v120, (uint64_t)a2, v81[1]);
                    HIDWORD(v109) = v83;
                    goto LABEL_157;
                  case 5:
                    sub_1000064F4((uint64_t)v120, (uint64_t)a2, v81[1]);
                    int v110 = v88;
                    goto LABEL_157;
                  case 6:
                    sub_1000064F4((uint64_t)v119, (uint64_t)a2, v81[1]);
                    LODWORD(v107) = v89;
                    goto LABEL_157;
                  case 7:
                    sub_1000064F4((uint64_t)v119, (uint64_t)a2, v81[1]);
                    HIDWORD(v107) = v86;
                    goto LABEL_157;
                  case 8:
                    sub_1000064F4((uint64_t)v119, (uint64_t)a2, v81[1]);
                    int v108 = v90;
                    goto LABEL_157;
                  default:
                    uint64_t v91 = sub_100008704((uint64_t)v118, (uint64_t)v121);
                    char v92 = PlyConverter::skipUnknownProperty(v91, (uint64_t)v81, (uint64_t)a2, (uint64_t)v118);
                    sub_100008194(v118);
                    if ((v92 & 1) == 0) {
                      goto LABEL_52;
                    }
LABEL_157:
                    v81 += 3;
                    break;
                }
              }
              unint64_t v93 = a1[7];
              if (v93 >= a1[8])
              {
                uint64_t v94 = sub_10000879C(v104, (uint64_t)&v122);
              }
              else
              {
                *(std::locale *)unint64_t v93 = v122;
                *(_DWORD *)(v93 + 8) = v123;
                uint64_t v94 = v93 + 12;
              }
              a1[7] = v94;
              if (v76)
              {
                unint64_t v95 = a1[10];
                if (v95 >= a1[11])
                {
                  uint64_t v96 = sub_10000879C(v103, (uint64_t)&v109);
                }
                else
                {
                  *(void *)unint64_t v95 = v109;
                  *(_DWORD *)(v95 + 8) = v110;
                  uint64_t v96 = v95 + 12;
                }
                a1[10] = v96;
              }
              if (v77)
              {
                unint64_t v97 = a1[13];
                if (v97 >= a1[14])
                {
                  uint64_t v98 = sub_10000879C(v102, (uint64_t)&v107);
                }
                else
                {
                  *(void *)unint64_t v97 = v107;
                  *(_DWORD *)(v97 + 8) = v108;
                  uint64_t v98 = v97 + 12;
                }
                a1[13] = v98;
              }
              ++v79;
            }
            while (v79 < *(void *)(v29 + 48));
          }
          uint64_t v28 = v101;
          goto LABEL_173;
        }
      }
      else
      {
        int v32 = *(unsigned __int8 *)(v29 + 47);
        if (v32 == 4) {
          goto LABEL_77;
        }
        if (v32 == 6 && *v31 == 1953654134 && *(_WORD *)(v29 + 28) == 30821) {
          goto LABEL_133;
        }
      }
LABEL_78:
      if (v30)
      {
        uint64_t v36 = 0;
        while (1)
        {
          uint64_t v38 = *(void *)v29;
          uint64_t v37 = *(void *)(v29 + 8);
          if (*(void *)v29 != v37) {
            break;
          }
LABEL_84:
          if (++v36 >= v30) {
            goto LABEL_173;
          }
        }
        while (1)
        {
          uint64_t v39 = sub_100008704((uint64_t)v116, (uint64_t)v121);
          char v40 = PlyConverter::skipUnknownProperty(v39, v38, (uint64_t)a2, (uint64_t)v116);
          sub_100008194(v116);
          if ((v40 & 1) == 0) {
            goto LABEL_52;
          }
          v38 += 12;
          if (v38 == v37)
          {
            unint64_t v30 = *(void *)(v29 + 48);
            goto LABEL_84;
          }
        }
      }
LABEL_173:
      v29 += 56;
      if (v29 == v28) {
        goto LABEL_53;
      }
    }
  }
  BOOL v8 = 1;
LABEL_53:
  sub_100008194(v119);
  sub_100008194(v120);
  sub_100008194(v121);
  if (SHIBYTE(v113) < 0) {
    operator delete(v111);
  }
LABEL_7:
  if (SHIBYTE(v115) < 0) {
    operator delete(__p[0]);
  }
  return v8;
}

void sub_100004C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  sub_100008194((void *)(v43 - 240));
  sub_100008194((void *)(v43 - 208));
  sub_100008194((void *)(v43 - 176));
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a34 < 0) {
    operator delete(a29);
  }
  _Unwind_Resume(a1);
}

void PlyConverter::parsePlyHeader(uint64_t *a1, uint64_t a2, void *a3)
{
  memset(&__str, 0, sizeof(__str));
  if (!sub_1000058A4(a3, (uint64_t)&__str)) {
    goto LABEL_16;
  }
  sub_100005AB4((uint64_t)v81);
  std::string::operator=(v83, &__str);
  sub_100007D18((uint64_t)v82);
  __p = 0;
  uint64_t v79 = 0;
  uint64_t v80 = 0;
  sub_100005C4C(v81, (uint64_t)&__p);
  if (SHIBYTE(v80) < 0)
  {
    if (v79 != 6) {
      goto LABEL_12;
    }
    p_p = (unsigned __int16 *)__p;
  }
  else
  {
    if (SHIBYTE(v80) != 6) {
      goto LABEL_13;
    }
    p_p = (unsigned __int16 *)&__p;
  }
  int v7 = *(_DWORD *)p_p;
  int v8 = p_p[2];
  if (v7 != 1836216166 || v8 != 29793)
  {
    if (v80 < 0) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  sub_100005C4C(v81, a2);
  BOOL v10 = &v69;
  while (sub_1000058A4(a3, (uint64_t)&__str))
  {
    std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      std::ios_base::clear((std::ios_base *)((char *)v81 + *(void *)(v81[0] - 24)), 0);
      std::string::operator=(v83, &__str);
      sub_100007D18((uint64_t)v82);
      v75 = 0;
      uint64_t v76 = 0;
      uint64_t v77 = 0;
      sub_100005C4C(v81, (uint64_t)&v75);
      char v12 = HIBYTE(v77);
      if (SHIBYTE(v77) < 0)
      {
        uint64_t v14 = v76;
        if (v76 == 7)
        {
          if (*(_DWORD *)v75 == 1835363429 && *(_DWORD *)((char *)v75 + 3) == 1953391981) {
            goto LABEL_56;
          }
          uint64_t v14 = v76;
LABEL_38:
          if (v14 != 10) {
            goto LABEL_173;
          }
          uint64_t v13 = (unsigned __int16 *)v75;
LABEL_40:
          uint64_t v16 = *(void *)v13;
          int v17 = v13[4];
          if (v16 != 0x646165685F646E65 || v17 != 29285) {
            goto LABEL_173;
          }
          char v19 = 1;
          goto LABEL_174;
        }
        if (v76 != 8 || *(void *)v75 != 0x79747265706F7270) {
          goto LABEL_38;
        }
      }
      else
      {
        if (HIBYTE(v77) == 7)
        {
          if (v75 == 1835363429 && *(_DWORD *)((char *)&v75 + 3) == 1953391981)
          {
LABEL_56:
            long long v73 = 0uLL;
            uint64_t v74 = 0;
            sub_100005C4C(v81, (uint64_t)&v73);
            int v72 = 0;
            std::istream::operator>>();
            sub_100007738(v67, &v73, v72);
            unint64_t v22 = a1[1];
            unint64_t v23 = a1[2];
            if (v22 >= v23)
            {
              uint64_t v25 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v22 - *a1) >> 3);
              unint64_t v26 = v25 + 1;
              if ((unint64_t)(v25 + 1) > 0x492492492492492) {
                sub_100007E2C();
              }
              unint64_t v27 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v23 - *a1) >> 3);
              if (2 * v27 > v26) {
                unint64_t v26 = 2 * v27;
              }
              if (v27 >= 0x249249249249249) {
                unint64_t v28 = 0x492492492492492;
              }
              else {
                unint64_t v28 = v26;
              }
              int v88 = a1 + 2;
              uint64_t v29 = (char *)sub_100007F04((uint64_t)(a1 + 2), v28);
              unint64_t v30 = &v29[56 * v25];
              *(void *)&long long v85 = v29;
              *((void *)&v85 + 1) = v30;
              int v87 = &v29[56 * v31];
              *(void *)unint64_t v30 = 0;
              *((void *)v30 + 1) = 0;
              *((void *)v30 + 2) = 0;
              *(_OWORD *)unint64_t v30 = *(_OWORD *)v67;
              *((void *)v30 + 2) = v68;
              v67[0] = 0;
              v67[1] = 0;
              uint64_t v68 = 0;
              long long v32 = *(_OWORD *)v10;
              *((void *)v30 + 5) = v10[2];
              *(_OWORD *)(v30 + 24) = v32;
              v10[1] = 0;
              v10[2] = 0;
              *BOOL v10 = 0;
              *((void *)v30 + 6) = v71;
              int v86 = v30 + 56;
              sub_100007E8C(a1, &v85);
              uint64_t v33 = a1[1];
              sub_1000080A0((void **)&v85);
              int v34 = v70;
              a1[1] = v33;
              if (v34 < 0) {
                operator delete(v69);
              }
            }
            else
            {
              *(void *)unint64_t v22 = 0;
              *(void *)(v22 + 8) = 0;
              *(void *)(v22 + 16) = 0;
              *(_OWORD *)unint64_t v22 = *(_OWORD *)v67;
              *(void *)(v22 + 16) = v68;
              v67[0] = 0;
              v67[1] = 0;
              uint64_t v68 = 0;
              v24 = v10[2];
              *(_OWORD *)(v22 + 24) = *(_OWORD *)v10;
              *(void *)(v22 + 40) = v24;
              v10[1] = 0;
              v10[2] = 0;
              *BOOL v10 = 0;
              *(void *)(v22 + 48) = v71;
              a1[1] = v22 + 56;
            }
            if (v67[0])
            {
              v67[1] = v67[0];
              operator delete(v67[0]);
            }
            if (SHIBYTE(v74) < 0)
            {
              v35 = (void *)v73;
              goto LABEL_172;
            }
          }
LABEL_173:
          char v19 = 0;
          char v12 = HIBYTE(v77);
          goto LABEL_174;
        }
        if (HIBYTE(v77) != 8)
        {
          if (HIBYTE(v77) != 10) {
            goto LABEL_173;
          }
          uint64_t v13 = (unsigned __int16 *)&v75;
          goto LABEL_40;
        }
        if (v75 != (void *)0x79747265706F7270) {
          goto LABEL_173;
        }
      }
      if (a1[1] != *a1)
      {
        v67[0] = 0;
        v67[1] = 0;
        uint64_t v68 = 0;
        sub_100005C4C(v81, (uint64_t)v67);
        if ((SHIBYTE(v68) & 0x80000000) == 0)
        {
          if (SHIBYTE(v68) == 4)
          {
            v20 = v67;
            goto LABEL_73;
          }
          goto LABEL_74;
        }
        if (v67[1] != (void *)4) {
          goto LABEL_74;
        }
        v20 = (void **)v67[0];
LABEL_73:
        if (*(_DWORD *)v20 == 1953720684)
        {
          sub_100005C4C(v81, (uint64_t)v67);
          int v36 = sub_100005FB0(v67);
          sub_100005C4C(v81, (uint64_t)v67);
        }
        else
        {
LABEL_74:
          int v36 = 8;
        }
        long long v85 = 0uLL;
        int v86 = 0;
        sub_100005C4C(v81, (uint64_t)&v85);
        if (SHIBYTE(v86) < 0)
        {
          uint64_t v40 = *((void *)&v85 + 1);
          if (*((void *)&v85 + 1) == 1)
          {
            unsigned int v39 = *(unsigned __int8 *)v85 - 120;
            if (v39 >= 3) {
              LOBYTE(v39) = 10;
            }
LABEL_114:
            int v37 = v39;
          }
          else
          {
            if (*((void *)&v85 + 1) != 2) {
              goto LABEL_81;
            }
            if (*(_WORD *)v85 == 30830)
            {
LABEL_139:
              int v37 = 3;
              goto LABEL_152;
            }
            if (*(_WORD *)v85 == 31086)
            {
LABEL_143:
              int v37 = 4;
              goto LABEL_152;
            }
            int v37 = *(_WORD *)v85 == 31342 ? 5 : 10;
            if (*(_WORD *)v85 != 31342)
            {
LABEL_81:
              if (*((void *)&v85 + 1) == 3)
              {
                if (*(_WORD *)v85 == 25970 && *(unsigned char *)(v85 + 2) == 100)
                {
                  int v37 = 6;
                  goto LABEL_152;
                }
                uint64_t v40 = *((void *)&v85 + 1);
              }
              if (v40 == 5)
              {
                if (*(_DWORD *)v85 == 1701147239 && *(unsigned char *)(v85 + 4) == 110)
                {
LABEL_140:
                  int v37 = 7;
                  goto LABEL_152;
                }
                uint64_t v40 = *((void *)&v85 + 1);
              }
              if (v40 == 4)
              {
                if (*(_DWORD *)v85 == 1702194274)
                {
                  int v37 = 8;
                  goto LABEL_152;
                }
                uint64_t v40 = *((void *)&v85 + 1);
              }
              if (v40 == 14)
              {
                if (*(void *)v85 == 0x695F786574726576 && *(void *)(v85 + 6) == 0x73656369646E695FLL)
                {
LABEL_141:
                  int v37 = 9;
                  goto LABEL_152;
                }
                uint64_t v40 = *((void *)&v85 + 1);
              }
              if (v40 == 12)
              {
                uint64_t v38 = (long long *)v85;
                goto LABEL_125;
              }
              int v37 = 10;
            }
          }
        }
        else
        {
          int v37 = 10;
          uint64_t v38 = &v85;
          switch(HIBYTE(v86))
          {
            case 1:
              unsigned int v39 = v85 - 120;
              if (v39 < 3) {
                goto LABEL_114;
              }
              goto LABEL_152;
            case 2:
              switch((unsigned __int16)v85)
              {
                case 0x786Eu:
                  goto LABEL_139;
                case 0x796Eu:
                  goto LABEL_143;
                case 0x7A6Eu:
                  int v37 = 5;
                  break;
              }
              goto LABEL_152;
            case 3:
              if ((unsigned __int16)v85 ^ 0x6572 | BYTE2(v85) ^ 0x64) {
                int v37 = 10;
              }
              else {
                int v37 = 6;
              }
              goto LABEL_152;
            case 4:
              goto LABEL_136;
            case 5:
              if (v85 == 1701147239 && BYTE4(v85) == 110) {
                goto LABEL_140;
              }
              if (HIBYTE(v86) == 4)
              {
LABEL_136:
                if (v85 == 1702194274) {
                  int v37 = 8;
                }
                else {
                  int v37 = 10;
                }
              }
              goto LABEL_152;
            case 0xC:
              break;
            case 0xE:
              if ((void)v85 == 0x695F786574726576 && *(void *)((char *)&v85 + 6) == 0x73656369646E695FLL) {
                goto LABEL_141;
              }
              if (HIBYTE(v86) != 12) {
                goto LABEL_152;
              }
              uint64_t v38 = &v85;
              break;
            default:
              goto LABEL_152;
          }
LABEL_125:
          unint64_t v45 = 0x7665727465785F69;
          unint64_t v46 = bswap64(*(void *)v38);
          if (v46 == 0x7665727465785F69)
          {
            unint64_t v46 = bswap32(*((_DWORD *)v38 + 2));
            if (v46 == 1852073336)
            {
              int v47 = 0;
              goto LABEL_149;
            }
            unint64_t v45 = 1852073336;
          }
          if (v46 < v45) {
            int v47 = -1;
          }
          else {
            int v47 = 1;
          }
LABEL_149:
          if (v47) {
            int v37 = 10;
          }
          else {
            int v37 = 9;
          }
        }
LABEL_152:
        int v49 = v10;
        int v50 = v36;
        uint64_t v51 = a1[1] - 56;
        int v52 = sub_100005FB0(v67);
        int v53 = v52;
        unint64_t v54 = *(void *)(v51 + 16);
        unint64_t v55 = *(int **)(v51 + 8);
        if ((unint64_t)v55 >= v54)
        {
          unint64_t v57 = *(int **)v51;
          unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v55 - *(void *)v51) >> 2);
          unint64_t v59 = v58 + 1;
          if (v58 + 1 > 0x1555555555555555) {
            sub_100007E2C();
          }
          unint64_t v60 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v54 - (void)v57) >> 2);
          if (2 * v60 > v59) {
            unint64_t v59 = 2 * v60;
          }
          if (v60 >= 0xAAAAAAAAAAAAAAALL) {
            unint64_t v61 = 0x1555555555555555;
          }
          else {
            unint64_t v61 = v59;
          }
          if (v61)
          {
            v62 = (char *)sub_100007E44(v51 + 16, v61);
            unint64_t v57 = *(int **)v51;
            unint64_t v55 = *(int **)(v51 + 8);
          }
          else
          {
            v62 = 0;
          }
          v63 = (int *)&v62[12 * v58];
          int *v63 = v37;
          v63[1] = v53;
          v63[2] = v50;
          uint64_t v64 = v63;
          BOOL v10 = v49;
          if (v55 != v57)
          {
            do
            {
              uint64_t v65 = *(void *)(v55 - 3);
              v55 -= 3;
              int v66 = v55[2];
              *(void *)(v64 - 3) = v65;
              v64 -= 3;
              v64[2] = v66;
            }
            while (v55 != v57);
            unint64_t v57 = *(int **)v51;
          }
          uint64_t v56 = v63 + 3;
          *(void *)uint64_t v51 = v64;
          *(void *)(v51 + 8) = v63 + 3;
          *(void *)(v51 + 16) = &v62[12 * v61];
          if (v57) {
            operator delete(v57);
          }
        }
        else
        {
          *unint64_t v55 = v37;
          v55[1] = v52;
          uint64_t v56 = v55 + 3;
          v55[2] = v50;
          BOOL v10 = v49;
        }
        *(void *)(v51 + 8) = v56;
        if (SHIBYTE(v86) < 0) {
          operator delete((void *)v85);
        }
        if (SHIBYTE(v68) < 0)
        {
          v35 = v67[0];
LABEL_172:
          operator delete(v35);
        }
        goto LABEL_173;
      }
      char v19 = 0;
LABEL_174:
      if (v12 < 0)
      {
        operator delete(v75);
        if (v19) {
          break;
        }
      }
      else if (v19)
      {
        break;
      }
    }
  }
  if (v80 < 0) {
LABEL_12:
  }
    operator delete(__p);
LABEL_13:
  if (SHIBYTE(v83[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v83[0].__r_.__value_.__l.__data_);
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  std::ios::~ios();
LABEL_16:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

void sub_10000578C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,char a40)
{
  if (*(char *)(v40 - 105) < 0) {
    operator delete(*(void **)(v40 - 128));
  }
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a39 < 0) {
    operator delete(a34);
  }
  sub_100006360((uint64_t)&a40);
  if (*(char *)(v40 - 129) < 0) {
    operator delete(*(void **)(v40 - 152));
  }
  _Unwind_Resume(a1);
}

BOOL sub_1000058A4(void *a1, uint64_t a2)
{
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  v4 = std::locale::use_facet(&v28, &std::ctype<char>::id);
  unsigned __int8 v5 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 10);
  std::locale::~locale(&v28);
  v6 = sub_100007990(a1, a2, v5);
  int v7 = *(_DWORD *)((unsigned char *)v6 + *(void *)(*v6 - 24) + 32) & 5;
  if (!v7)
  {
    uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
    int v9 = (char)v8;
    uint64_t v10 = a2 + v8;
    if (v9 >= 0) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = *(void *)a2 + *(void *)(a2 + 8);
    }
    if (v9 >= 0) {
      uint64_t v12 = a2;
    }
    else {
      uint64_t v12 = *(void *)a2;
    }
    while (v11 != v12)
    {
      __darwin_ct_rune_t v14 = *(char *)--v11;
      __darwin_ct_rune_t v13 = v14;
      if (v14 < 0)
      {
        if (!__maskrune(v13, 0x4000uLL))
        {
LABEL_13:
          uint64_t v12 = v11 + 1;
          break;
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v13] & 0x4000) == 0)
      {
        goto LABEL_13;
      }
    }
    uint64_t v15 = *(unsigned __int8 *)(a2 + 23);
    int v16 = (char)v15;
    uint64_t v17 = a2 + v15;
    if (v16 >= 0)
    {
      uint64_t v18 = a2;
    }
    else
    {
      uint64_t v17 = *(void *)a2 + *(void *)(a2 + 8);
      uint64_t v18 = *(void *)a2;
    }
    std::string::erase((std::string *)a2, v12 - v18, v17 - v12);
    int v19 = *(char *)(a2 + 23);
    uint64_t v20 = *(void *)a2;
    if (v19 >= 0) {
      uint64_t v21 = a2;
    }
    else {
      uint64_t v21 = *(void *)a2;
    }
    if (v19 >= 0) {
      uint64_t v22 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v22 = *(void *)(a2 + 8);
    }
    if (v22)
    {
      unint64_t v23 = (char *)(v21 + v22);
      v24 = (char *)v21;
      do
      {
        __darwin_ct_rune_t v25 = *v24;
        if (v25 < 0)
        {
          if (!__maskrune(v25, 0x4000uLL)) {
            goto LABEL_31;
          }
        }
        else if ((_DefaultRuneLocale.__runetype[v25] & 0x4000) == 0)
        {
          goto LABEL_31;
        }
        ++v24;
        --v22;
      }
      while (v22);
      v24 = v23;
LABEL_31:
      LOBYTE(v19) = *(unsigned char *)(a2 + 23);
      uint64_t v20 = *(void *)a2;
    }
    else
    {
      v24 = (char *)v21;
    }
    if ((v19 & 0x80u) == 0) {
      uint64_t v26 = a2;
    }
    else {
      uint64_t v26 = v20;
    }
    std::string::erase((std::string *)a2, v21 - v26, (std::string::size_type)&v24[-v21]);
  }
  return v7 == 0;
}

void sub_100005AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t sub_100005AB4(uint64_t a1)
{
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v2;
  *(void *)(a1 + 8) = 0;
  v4 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v4, (void *)(a1 + 16));
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 8;
  return a1;
}

void sub_100005C24(_Unwind_Exception *a1)
{
}

uint64_t *sub_100005C4C(uint64_t *a1, uint64_t a2)
{
  std::istream::sentry::sentry();
  if (!v20) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v4 = *(void *)(*a1 - 24);
  uint64_t v5 = *(uint64_t *)((char *)a1 + v4 + 24);
  if (v5 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = *(uint64_t *)((char *)a1 + v4 + 24);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + v4));
  int v7 = std::locale::use_facet(&v19, &std::ctype<char>::id);
  std::locale::~locale(&v19);
  uint64_t v8 = 0;
  int v9 = a1 + 5;
  if (v5 >= 1) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFF7;
  }
  while (1)
  {
    uint64_t v11 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    uint64_t v12 = (unsigned char *)v11[3];
    if (v12 == (unsigned char *)v11[4]) {
      break;
    }
    LOBYTE(v13) = *v12;
LABEL_14:
    if ((v13 & 0x80) == 0 && (*((_DWORD *)&v7[1].~facet + v13) & 0x4000) != 0)
    {
      int v16 = 0;
      goto LABEL_23;
    }
    std::string::push_back((std::string *)a2, v13);
    __darwin_ct_rune_t v14 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    uint64_t v15 = v14[3];
    if (v15 == v14[4]) {
      (*(void (**)(void *))(*v14 + 80))(v14);
    }
    else {
      v14[3] = v15 + 1;
    }
    if (v10 == ++v8)
    {
      int v16 = 0;
      uint64_t v8 = 1;
      goto LABEL_23;
    }
  }
  int v13 = (*(uint64_t (**)(void *))(*v11 + 72))(v11);
  if (v13 != -1) {
    goto LABEL_14;
  }
  int v16 = 2;
LABEL_23:
  uint64_t v17 = *a1;
  *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 24) = 0;
  if (!v8) {
    v16 |= 4u;
  }
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(v17 - 24)), *(_DWORD *)((char *)a1 + *(void *)(v17 - 24) + 32) | v16);
  return a1;
}

void sub_100005E6C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::locale::~locale(&a9);
  __cxa_begin_catch(a1);
  uint64_t v11 = *v9;
  *(_DWORD *)((char *)v9 + *(void *)(*v9 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v9 + *(void *)(v11 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x100005E28);
  }
  __cxa_rethrow();
}

void sub_100005F08(_Unwind_Exception *a1)
{
}

BOOL sub_100005F1C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    if (v4 == a1[1])
    {
      if (v4 == -1) {
        goto LABEL_10;
      }
      a1 = (void *)*a1;
      return memcmp(a1, __s, v4) == 0;
    }
  }
  else if (v4 == *((unsigned __int8 *)a1 + 23))
  {
    if (v4 == -1) {
LABEL_10:
    }
      sub_100007B80();
    return memcmp(a1, __s, v4) == 0;
  }
  return 0;
}

uint64_t sub_100005FB0(void *a1)
{
  int v2 = *((unsigned __int8 *)a1 + 23);
  if ((*((char *)a1 + 23) & 0x80000000) == 0)
  {
    switch(*((unsigned char *)a1 + 23))
    {
      case 3:
        goto LABEL_3;
      case 4:
        int v7 = a1;
        if (*(_DWORD *)a1 == 1918986339) {
          return 0;
        }
        goto LABEL_61;
      case 5:
        if (*(_DWORD *)a1 == 1634231157 && *((unsigned char *)a1 + 4) == 114) {
          return 1;
        }
        if (v2 == 3) {
          goto LABEL_3;
        }
        int v7 = a1;
        if (v2 == 4) {
          goto LABEL_61;
        }
        if (v2 != 5) {
          goto LABEL_62;
        }
        if (*(_DWORD *)a1 != 1919903859 || *((unsigned char *)a1 + 4) != 116) {
          goto LABEL_62;
        }
        return 2;
      case 6:
        if (*(_DWORD *)a1 == 1869116277 && *((_WORD *)a1 + 2) == 29810) {
          return 3;
        }
        int v7 = a1;
        if (v2 == 4) {
          goto LABEL_61;
        }
        if (v2 != 3) {
          goto LABEL_62;
        }
        goto LABEL_3;
      default:
        goto LABEL_62;
    }
  }
  uint64_t v4 = a1[1];
  if (v4 == 4 && *(_DWORD *)*a1 == 1918986339) {
    return 0;
  }
  if (v4 == 5)
  {
    if (*(_DWORD *)*a1 == 1634231157 && *(unsigned char *)(*a1 + 4) == 114) {
      return 1;
    }
    uint64_t v4 = a1[1];
    if (v4 == 5)
    {
      if (*(_DWORD *)*a1 == 1919903859 && *(unsigned char *)(*a1 + 4) == 116) {
        return 2;
      }
      if ((v2 & 0x80) == 0)
      {
        if (v2 != 3)
        {
          int v7 = a1;
          if (v2 != 4) {
            goto LABEL_62;
          }
          goto LABEL_61;
        }
LABEL_3:
        if (*(_WORD *)a1 != 28265 || *((unsigned char *)a1 + 2) != 116)
        {
          if ((v2 & 0x80) == 0) {
            goto LABEL_62;
          }
          goto LABEL_36;
        }
        return 4;
      }
    }
  }
  if (v4 == 6)
  {
    if (*(_DWORD *)*a1 == 1869116277 && *(_WORD *)(*a1 + 4) == 29810) {
      return 3;
    }
    uint64_t v4 = a1[1];
  }
  if (v4 != 3) {
    goto LABEL_37;
  }
  if (*(_WORD *)*a1 == 28265 && *(unsigned char *)(*a1 + 2) == 116) {
    return 4;
  }
LABEL_36:
  uint64_t v4 = a1[1];
LABEL_37:
  if (v4 != 4) {
    goto LABEL_62;
  }
  int v7 = (_DWORD *)*a1;
LABEL_61:
  if (*v7 == 1953393013) {
    return 5;
  }
LABEL_62:
  if (sub_100005F1C(a1, "float")) {
    return 6;
  }
  if (sub_100005F1C(a1, "double")) {
    return 7;
  }
  if (sub_100005F1C(a1, "int8")) {
    return 0;
  }
  if (sub_100005F1C(a1, "uint8")) {
    return 1;
  }
  if (sub_100005F1C(a1, "int16")) {
    return 2;
  }
  if (sub_100005F1C(a1, "uint16")) {
    return 3;
  }
  if (sub_100005F1C(a1, "int32")) {
    return 4;
  }
  if (sub_100005F1C(a1, "uint32")) {
    return 5;
  }
  if (sub_100005F1C(a1, "float32")) {
    return 6;
  }
  if (sub_100005F1C(a1, "float64")) {
    return 7;
  }
  else {
    return 8;
  }
}

uint64_t sub_10000631C(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  int v2 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_100006360(uint64_t a1)
{
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  std::ios::~ios();
  return a1;
}

uint64_t PlyConverter::skipUnknownProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7 = *(_DWORD *)(a2 + 8);
  if (v7 == 8)
  {
    sub_1000064F4(a4, a3, *(_DWORD *)(a2 + 4));
    return 1;
  }
  sub_1000064F4(a4, a3, v7);
  int v9 = (int)v8;
  if ((int)v8 <= 0x400)
  {
    for (; v9; --v9)
      sub_1000064F4(a4, a3, *(_DWORD *)(a2 + 4));
    return 1;
  }
  return 0;
}

uint64_t sub_1000064F4(uint64_t a1, uint64_t a2, int a3)
{
  int v5 = a3;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    sub_10000811C();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, int *))(*(void *)v3 + 48))(v3, a2, &v5);
}

uint64_t sub_100006548(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
    case 2:
    case 4:
      std::istream::operator>>();
      goto LABEL_4;
    case 1:
    case 3:
    case 5:
      std::istream::operator>>();
LABEL_4:
      uint64_t result = 0;
      break;
    case 6:
      std::istream::operator>>();
      uint64_t result = (int)0.0;
      break;
    case 7:
      std::istream::operator>>();
      uint64_t result = (int)0.0;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

float sub_10000660C(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
    case 2:
    case 4:
      std::istream::operator>>();
      float result = (float)0;
      break;
    case 1:
    case 3:
    case 5:
      std::istream::operator>>();
      float result = (float)0;
      break;
    case 6:
      std::istream::operator>>();
      float result = 0.0;
      break;
    case 7:
      std::istream::operator>>();
      float result = 0.0;
      break;
    default:
      float result = 0.0;
      break;
  }
  return result;
}

float sub_1000066D8(uint64_t a1, unsigned int a2)
{
  if (a2 <= 5) {
    return (float)(int)sub_100006548(a1, a2) / 255.0;
  }
  return sub_10000660C(a1, a2);
}

uint64_t sub_100006718(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      std::istream::read();
      uint64_t result = 0;
      break;
    case 6:
      std::istream::read();
      uint64_t result = (int)0.0;
      break;
    case 7:
      std::istream::read();
      uint64_t result = (int)0.0;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

float sub_100006838(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
    case 2:
    case 4:
      std::istream::read();
      return (float)0;
    case 1:
      std::istream::read();
      LOBYTE(v3) = 0;
      goto LABEL_8;
    case 3:
      std::istream::read();
      LOWORD(v3) = 0;
      goto LABEL_8;
    case 5:
      std::istream::read();
      unsigned int v3 = 0;
LABEL_8:
      float result = (float)v3;
      break;
    case 6:
      std::istream::read();
      float result = 0.0;
      break;
    case 7:
      std::istream::read();
      float result = 0.0;
      break;
    default:
      float result = 0.0;
      break;
  }
  return result;
}

float sub_100006978(uint64_t a1, unsigned int a2)
{
  if (a2 <= 5) {
    return (float)(int)sub_100006718(a1, a2) / 255.0;
  }
  return sub_100006838(a1, a2);
}

uint64_t sub_1000069B8(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
    case 1:
      std::istream::read();
      uint64_t result = 0;
      break;
    case 2:
      std::istream::read();
      uint64_t result = (__int16)(v3 << 8) | BYTE1(v3);
      break;
    case 3:
      std::istream::read();
      uint64_t result = __rev16((unsigned __int16)v3);
      break;
    case 4:
    case 5:
      std::istream::read();
      uint64_t result = bswap32(v3);
      break;
    case 6:
      std::istream::read();
      uint64_t result = (int)COERCE_FLOAT(bswap32(v3));
      break;
    case 7:
      uint64_t result = (int)sub_1000077B4();
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

float sub_100006AD8(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
      std::istream::read();
      int v2 = 0;
      goto LABEL_8;
    case 1:
      std::istream::read();
      LOBYTE(v4) = 0;
      return (float)v4;
    case 2:
      std::istream::read();
      int v2 = (int)bswap32((unsigned __int16)v6) >> 16;
      goto LABEL_8;
    case 3:
      std::istream::read();
      unsigned int v5 = bswap32((unsigned __int16)v6) >> 16;
      goto LABEL_10;
    case 4:
      std::istream::read();
      int v2 = bswap32(v6);
LABEL_8:
      float result = (float)v2;
      break;
    case 5:
      std::istream::read();
      unsigned int v5 = bswap32(v6);
LABEL_10:
      float result = (float)v5;
      break;
    case 6:
      std::istream::read();
      float result = COERCE_FLOAT(bswap32(v6));
      break;
    case 7:
      float result = sub_1000077B4();
      break;
    default:
      float result = 0.0;
      break;
  }
  return result;
}

float sub_100006C14(uint64_t a1, unsigned int a2)
{
  if (a2 <= 5) {
    return (float)(int)sub_1000069B8(a1, a2) / 255.0;
  }
  return sub_100006AD8(a1, a2);
}

void sub_100006C54(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 2) < a2)
  {
    if (a2 >= 0x1555555555555556) {
      sub_100007E2C();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v11 = v3;
    __p = sub_100007E44(v3, a2);
    float v8 = (char *)__p + v5;
    int v9 = (char *)__p + v5;
    uint64_t v10 = (char *)__p + 12 * v6;
    sub_1000086A4(a1, &__p);
    if (v9 != v8) {
      int v9 = &v8[(v9 - v8 - 12) % 0xCuLL];
    }
    if (__p) {
      operator delete(__p);
    }
  }
}

void sub_100006D2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100006D78(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_100007E2C();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)sub_100008908(v3, a2);
    int v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    int v9 = &v6[4 * v8];
    uint64_t v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
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

void PlyConverter::createPointCloud(uint64_t a1, const void **a2, uint64_t a3, serialize::Prim *a4)
{
  uint64_t v8 = (char *)operator new(0x88uLL);
  sub_100007054(a2, 47, (uint64_t)&v19);
  fileFormatUtils::makeValidIdentifier((uint64_t *)(a1 + 24), &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  uint64_t v11 = std::string::append(&v19, (const std::string::value_type *)p_p, size);
  int v13 = (void *)v11->__r_.__value_.__r.__words[0];
  unint64_t v12 = v11->__r_.__value_.__l.__size_;
  v20[0] = v11->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v20 + 3) = *(_DWORD *)((char *)&v11->__r_.__value_.__r.__words[2] + 3);
  int v14 = SHIBYTE(v11->__r_.__value_.__r.__words[2]);
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  *(void *)uint64_t v8 = off_1000185C8;
  *((_DWORD *)v8 + 2) = 3;
  if (v14 < 0)
  {
    sub_100007814(v8 + 16, v13, v12);
  }
  else
  {
    *((void *)v8 + 2) = v13;
    *((void *)v8 + 3) = v12;
    *((_DWORD *)v8 + 8) = v20[0];
    *(_DWORD *)(v8 + 35) = *(_DWORD *)((char *)v20 + 3);
    v8[39] = v14;
  }
  *((void *)v8 + 5) = 0;
  *((void *)v8 + 6) = 0;
  *((void *)v8 + 7) = 0;
  *(void *)uint64_t v8 = off_100018650;
  *((_OWORD *)v8 + 4) = 0u;
  *((_OWORD *)v8 + 5) = 0u;
  *((_OWORD *)v8 + 6) = 0u;
  *((_OWORD *)v8 + 7) = 0u;
  *((void *)v8 + 16) = 0;
  if (v14 < 0) {
    operator delete(v13);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
  if (v8 + 64 != (char *)(a1 + 48)) {
    sub_1000089C8((void *)v8 + 8, *(uint64_t **)(a1 + 48), *(uint64_t **)(a1 + 56), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 2));
  }
  uint64_t v15 = *(uint64_t **)(a1 + 96);
  int v16 = *(uint64_t **)(a1 + 104);
  uint64_t v17 = (char *)(a1 + 96);
  if (v16 != v15 && v8 + 88 != v17) {
    sub_1000089C8((void *)v8 + 11, v15, v16, 0xAAAAAAAAAAAAAAABLL * (((char *)v16 - (char *)v15) >> 2));
  }
  std::string::operator=((std::string *)(v8 + 112), (const std::string *)(a3 + 16));
  serialize::Prim::addChild(a4, (serialize::Prim *)v8);
}

void sub_100007000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  operator delete(v22);
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  operator delete(v21);
  _Unwind_Resume(a1);
}

uint64_t sub_100007054@<X0>(const void **a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  uint64_t result = sub_100008940(a3, v5 + 1);
  if (*(char *)(result + 23) >= 0) {
    int v7 = (char *)result;
  }
  else {
    int v7 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0) {
      uint64_t v8 = a1;
    }
    else {
      uint64_t v8 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v7, v8, v5);
  }
  int v9 = &v7[v5];
  *int v9 = a2;
  v9[1] = 0;
  return result;
}

void PlyConverter::createMesh(uint64_t a1, const void **a2, uint64_t a3, serialize::Prim *a4)
{
  uint64_t v4 = (char *)(a1 + 144);
  if (*(void *)(a1 + 152) != *(void *)(a1 + 144))
  {
    int v9 = (char *)operator new(0x128uLL);
    sub_100007054(a2, 47, (uint64_t)&v22);
    fileFormatUtils::makeValidIdentifier((uint64_t *)(a1 + 24), &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    unint64_t v12 = std::string::append(&v22, (const std::string::value_type *)p_p, size);
    int v14 = (void *)v12->__r_.__value_.__r.__words[0];
    unint64_t v13 = v12->__r_.__value_.__l.__size_;
    v23[0] = v12->__r_.__value_.__r.__words[2];
    *(_DWORD *)((char *)v23 + 3) = *(_DWORD *)((char *)&v12->__r_.__value_.__r.__words[2] + 3);
    int v15 = SHIBYTE(v12->__r_.__value_.__r.__words[2]);
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    *(void *)int v9 = off_1000185C8;
    *((_DWORD *)v9 + 2) = 4;
    if (v15 < 0)
    {
      sub_100007814(v9 + 16, v14, v13);
    }
    else
    {
      *((void *)v9 + 2) = v14;
      *((void *)v9 + 3) = v13;
      *((_DWORD *)v9 + 8) = v23[0];
      *(_DWORD *)(v9 + 35) = *(_DWORD *)((char *)v23 + 3);
      v9[39] = v15;
    }
    *((void *)v9 + 5) = 0;
    *((void *)v9 + 6) = 0;
    *((void *)v9 + 7) = 0;
    *(void *)int v9 = &off_100018698;
    *((_OWORD *)v9 + 4) = 0u;
    *((void *)v9 + 35) = 0;
    *((void *)v9 + 36) = 0;
    *((void *)v9 + 34) = 0;
    *((_OWORD *)v9 + 5) = 0u;
    *((_OWORD *)v9 + 6) = 0u;
    *((_OWORD *)v9 + 7) = 0u;
    *((_OWORD *)v9 + 8) = 0u;
    *((_OWORD *)v9 + 9) = 0u;
    *((_OWORD *)v9 + 10) = 0u;
    *((_OWORD *)v9 + 11) = 0u;
    *((_OWORD *)v9 + 12) = 0u;
    *((_OWORD *)v9 + 13) = 0u;
    *((_OWORD *)v9 + 14) = 0u;
    *((_OWORD *)v9 + 15) = 0u;
    *(_OWORD *)(v9 + 252) = 0u;
    if (v15 < 0) {
      operator delete(v14);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v22.__r_.__value_.__l.__data_);
    }
    if (v9 + 64 != v4) {
      sub_100008BDC(v9 + 64, *(char **)(a1 + 144), *(void *)(a1 + 152), (uint64_t)(*(void *)(a1 + 152) - *(void *)(a1 + 144)) >> 2);
    }
    if (v9 + 160 != (char *)(a1 + 48)) {
      sub_1000089C8((void *)v9 + 20, *(uint64_t **)(a1 + 48), *(uint64_t **)(a1 + 56), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 2));
    }
    if (v9 + 88 != (char *)(a1 + 120)) {
      sub_100008BDC(v9 + 88, *(char **)(a1 + 120), *(void *)(a1 + 128), (uint64_t)(*(void *)(a1 + 128) - *(void *)(a1 + 120)) >> 2);
    }
    int v16 = *(uint64_t **)(a1 + 96);
    uint64_t v17 = *(uint64_t **)(a1 + 104);
    if (v17 != v16 && v9 + 208 != (char *)(a1 + 96)) {
      sub_1000089C8((void *)v9 + 26, v16, v17, 0xAAAAAAAAAAAAAAABLL * (((char *)v17 - (char *)v16) >> 2));
    }
    uint64_t v18 = *(uint64_t **)(a1 + 72);
    std::string v19 = *(uint64_t **)(a1 + 80);
    char v20 = (char *)(a1 + 72);
    if (v19 != v18)
    {
      if (v9 + 184 != v20) {
        sub_1000089C8((void *)v9 + 23, v18, v19, 0xAAAAAAAAAAAAAAABLL * (((char *)v19 - (char *)v18) >> 2));
      }
      *((_DWORD *)v9 + 64) = 2;
    }
    std::string::operator=((std::string *)(v9 + 272), (const std::string *)(a3 + 16));
    serialize::Prim::addChild(a4, (serialize::Prim *)v9);
  }
}

void sub_100007360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  operator delete(v22);
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  operator delete(v21);
  _Unwind_Resume(a1);
}

serialize::Prim *PlyConverter::makeStage(PlyConverter *this)
{
  if (!*((unsigned char *)this + 168)) {
    return 0;
  }
  if (*((char *)this + 47) < 0)
  {
    sub_100007814(__p, *((void **)this + 3), *((void *)this + 4));
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)((char *)this + 24);
    uint64_t v15 = *((void *)this + 5);
  }
  fileFormatUtils::makeValidIdentifier((uint64_t *)__p, &v17);
  long long v20 = 0u;
  *(_OWORD *)std::string v19 = 0u;
  *(_OWORD *)uint64_t v18 = 0u;
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
  inited = (serialize::Prim *)fileFormatUtils::Asset::initStage((fileFormatUtils::Asset *)v16);
  fileFormatUtils::Asset::getMaterialsPath((fileFormatUtils::Asset *)v16, (uint64_t)v12);
  uint64_t v3 = (char *)operator new(0x40uLL);
  if ((v13 & 0x80u) == 0) {
    size_t v4 = v13;
  }
  else {
    size_t v4 = (size_t)v12[1];
  }
  size_t v5 = v10;
  sub_100008940((uint64_t)v10, v4 + 8);
  if (v11 < 0) {
    size_t v5 = (void **)v10[0];
  }
  if (v4)
  {
    if ((v13 & 0x80u) == 0) {
      uint64_t v6 = v12;
    }
    else {
      uint64_t v6 = (void **)v12[0];
    }
    memmove(v5, v6, v4);
  }
  strcpy((char *)v5 + v4, "/default");
  *(void *)uint64_t v3 = off_1000185C8;
  *((_DWORD *)v3 + 2) = 6;
  int v7 = v3 + 16;
  if (SHIBYTE(v11) < 0)
  {
    sub_100007814(v7, v10[0], (unint64_t)v10[1]);
    int v8 = SHIBYTE(v11);
    *((void *)v3 + 6) = 0;
    *((void *)v3 + 7) = 0;
    *((void *)v3 + 5) = 0;
    *(void *)uint64_t v3 = &off_100018728;
    if (v8 < 0) {
      operator delete(v10[0]);
    }
  }
  else
  {
    *(_OWORD *)int v7 = *(_OWORD *)v10;
    *((void *)v3 + 4) = v11;
    *((void *)v3 + 6) = 0;
    *((void *)v3 + 7) = 0;
    *((void *)v3 + 5) = 0;
    *(void *)uint64_t v3 = &off_100018728;
  }
  serialize::Prim::addChild(inited, (serialize::Prim *)v3);
  fileFormatUtils::Asset::getGeomPath((fileFormatUtils::Asset *)v16, (uint64_t)v10);
  if (*((void *)this + 19) != *((void *)this + 18) || *((void *)this + 7) == *((void *)this + 6)) {
    PlyConverter::createMesh((uint64_t)this, (const void **)v10, (uint64_t)v3, inited);
  }
  else {
    PlyConverter::createPointCloud((uint64_t)this, (const void **)v10, (uint64_t)v3, inited);
  }
  if (SHIBYTE(v11) < 0) {
    operator delete(v10[0]);
  }
  if ((char)v13 < 0) {
    operator delete(v12[0]);
  }
  if (SHIBYTE(v20) < 0) {
    operator delete(v19[1]);
  }
  if (SHIBYTE(v19[0]) < 0) {
    operator delete(v18[0]);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  return inited;
}

void sub_100007648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  operator delete(v27);
  if (a20 < 0) {
    operator delete(a15);
  }
  sub_1000076D0((uint64_t)&a27);
  _Unwind_Resume(a1);
}

uint64_t sub_1000076D0(uint64_t a1)
{
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

void sub_100007724(void *a1)
{
}

void *sub_100007738(void *a1, long long *a2, uint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  size_t v5 = a1 + 3;
  if (*((char *)a2 + 23) < 0)
  {
    sub_100007814(v5, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v6 = *a2;
    v5[2] = *((void *)a2 + 2);
    *(_OWORD *)size_t v5 = v6;
  }
  a1[6] = a3;
  return a1;
}

void sub_100007798(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

double sub_1000077B4()
{
  std::istream::read();
  return COERCE_DOUBLE(bswap64(v1));
}

void *sub_100007814(unsigned char *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_1000078B4();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *size_t v5 = v8;
    size_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void sub_1000078B4()
{
}

void sub_1000078CC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100007928(exception, a1);
}

void sub_100007914(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100007928(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_10000795C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  unint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_100007990(void *a1, uint64_t a2, unsigned __int8 a3)
{
  std::istream::sentry::sentry();
  if (!v11) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    int v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_100007AF0(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x100007AB0);
  }
  __cxa_rethrow();
}

void sub_100007B6C(_Unwind_Exception *a1)
{
}

void sub_100007B80()
{
}

void sub_100007B98(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100007BF4(exception, a1);
}

void sub_100007BE0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100007BF4(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100007C28(void ***a1)
{
  unint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    size_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 56;
        sub_100007CC0((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      size_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_100007CC0(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 47) < 0) {
    operator delete(*(void **)(a2 + 24));
  }
  uint64_t v3 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v3;
    operator delete(v3);
  }
}

void sub_100007D18(uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  uint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(unsigned char *)(a1 + 87);
  if (v3 < 0)
  {
    uint64_t v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }
  else
  {
    uint64_t v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(unsigned char *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        uint64_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 48) = v4;
      }
      if (v5) {
        *(void *)(a1 + 48) = (char *)v4 + v5;
      }
    }
  }
}

void sub_100007E2C()
{
}

void *sub_100007E44(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    sub_10000795C();
  }
  return operator new(12 * a2);
}

uint64_t sub_100007E8C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100007F50((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_100007F04(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    sub_10000795C();
  }
  return operator new(56 * a2);
}

uint64_t sub_100007F50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 56) = 0;
      *(void *)(v7 - 48) = 0;
      *(void *)(v7 - 40) = 0;
      long long v8 = *(_OWORD *)(a3 - 56);
      a3 -= 56;
      *(_OWORD *)(v7 - 56) = v8;
      *(void *)(v7 - 40) = *(void *)(a3 + 16);
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      long long v9 = *(_OWORD *)(a3 + 24);
      *(void *)(v7 - 16) = *(void *)(a3 + 40);
      *(_OWORD *)(v7 - 32) = v9;
      *(void *)(a3 + 32) = 0;
      *(void *)(a3 + 40) = 0;
      *(void *)(a3 + 24) = 0;
      *(void *)(v7 - 8) = *(void *)(a3 + 48);
      uint64_t v7 = *((void *)&v15 + 1) - 56;
      *((void *)&v15 + 1) -= 56;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  sub_100008014((uint64_t)v12);
  return v10;
}

uint64_t sub_100008014(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_10000804C((uint64_t *)a1);
  }
  return a1;
}

void sub_10000804C(uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_100007CC0(v3, v1);
      v1 += 56;
    }
    while (v1 != v2);
  }
}

void **sub_1000080A0(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_1000080D4(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 56;
    sub_100007CC0(v4, i - 56);
  }
}

void sub_10000811C()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_1000183F0;
}

void sub_10000816C(std::exception *a1)
{
  std::exception::~exception(a1);
  operator delete(v1);
}

void *sub_100008194(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *sub_100008220(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &off_100018418;
  result[1] = v3;
  return result;
}

uint64_t sub_100008268(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_100018418;
  a2[1] = v2;
  return result;
}

float sub_100008294(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  return (float)(*(int (**)(uint64_t, void))(a1 + 8))(a2, *a3);
}

uint64_t sub_1000082C0(uint64_t a1, uint64_t a2)
{
  if (sub_10000830C(a2, (uint64_t)&off_100018498)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

_UNKNOWN **sub_100008300()
{
  return &off_100018498;
}

BOOL sub_10000830C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *sub_10000835C(void *result, void *a2)
{
  if (a2 != result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
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

void sub_1000085BC(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_100007724(a1);
}

void *sub_1000085D0(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &off_1000184C8;
  result[1] = v3;
  return result;
}

uint64_t sub_100008618(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_1000184C8;
  a2[1] = v2;
  return result;
}

uint64_t sub_100008644(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 8))(a2, *a3);
}

uint64_t sub_100008658(uint64_t a1, uint64_t a2)
{
  if (sub_10000830C(a2, (uint64_t)&off_100018538)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

_UNKNOWN **sub_100008698()
{
  return &off_100018538;
}

uint64_t *sub_1000086A4(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  while (v2 != v3)
  {
    uint64_t v5 = *(void *)(v2 - 12);
    v2 -= 12;
    *(void *)(v4 - 12) = v5;
    v4 -= 12;
    *(_DWORD *)(v4 + 8) = *(_DWORD *)(v2 + 8);
  }
  a2[1] = v4;
  uint64_t v6 = *result;
  *uint64_t result = v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_100008704(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t sub_10000879C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 2);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x1555555555555555) {
    sub_100007E2C();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 2);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0xAAAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x1555555555555555;
  }
  else {
    unint64_t v9 = v5;
  }
  std::string v19 = a1 + 2;
  uint64_t v10 = (char *)sub_100007E44(v7, v9);
  char v11 = &v10[12 * v4];
  std::string __p = v10;
  int v16 = v11;
  uint64_t v18 = &v10[12 * v12];
  *(void *)char v11 = *(void *)a2;
  *((_DWORD *)v11 + 2) = *(_DWORD *)(a2 + 8);
  std::string v17 = v11 + 12;
  sub_1000086A4(a1, &__p);
  uint64_t v13 = a1[1];
  if (v17 != v16) {
    std::string v17 = &v16[(v17 - v16 - 12) % 0xCuLL];
  }
  if (__p) {
    operator delete(__p);
  }
  return v13;
}

void sub_1000088BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100008908(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_10000795C();
  }
  return operator new(4 * a2);
}

uint64_t sub_100008940(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000078B4();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    uint64_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

_DWORD *sub_1000089C8(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  uint64_t result = (_DWORD *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 2) < a4)
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0x1555555555555555) {
      sub_100007E2C();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 2);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v12 = 0x1555555555555555;
    }
    else {
      unint64_t v12 = v11;
    }
    sub_100008B88(a1, v12);
    long long v14 = (_DWORD *)a1[1];
    uint64_t v13 = (_DWORD **)(a1 + 1);
    uint64_t result = v14;
    long long v15 = (char *)v14;
    if (v6 != a3)
    {
      long long v15 = (char *)result;
      do
      {
        *(void *)long long v15 = *v6;
        *((_DWORD *)v15 + 2) = *((_DWORD *)v6 + 2);
        v15 += 12;
        uint64_t v6 = (uint64_t *)((char *)v6 + 12);
      }
      while (v6 != a3);
    }
LABEL_26:
    int64_t v24 = v15 - (char *)result;
    goto LABEL_27;
  }
  std::string v17 = (_DWORD *)a1[1];
  uint64_t v13 = (_DWORD **)(a1 + 1);
  int v16 = v17;
  unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * (v17 - result);
  if (v18 >= a4)
  {
    long long v15 = (char *)result;
    if (a2 != a3)
    {
      __darwin_ct_rune_t v25 = result;
      do
      {
        uint64_t v26 = *v6;
        v25[2] = *((_DWORD *)v6 + 2);
        *(void *)__darwin_ct_rune_t v25 = v26;
        v25 += 3;
        uint64_t v6 = (uint64_t *)((char *)v6 + 12);
        v15 += 12;
      }
      while (v6 != a3);
    }
    goto LABEL_26;
  }
  uint64_t v19 = (uint64_t)a2 + 12 * v18;
  if (v16 != result)
  {
    uint64_t v20 = 12 * v18;
    do
    {
      uint64_t v21 = *v6;
      result[2] = *((_DWORD *)v6 + 2);
      *(void *)uint64_t result = v21;
      result += 3;
      uint64_t v6 = (uint64_t *)((char *)v6 + 12);
      v20 -= 12;
    }
    while (v20);
    uint64_t result = *v13;
  }
  std::string v22 = (char *)result;
  if ((uint64_t *)v19 != a3)
  {
    std::string v22 = (char *)result;
    unint64_t v23 = result;
    do
    {
      *(void *)unint64_t v23 = *(void *)v19;
      _DWORD v23[2] = *(_DWORD *)(v19 + 8);
      v22 += 12;
      v19 += 12;
      v23 += 3;
    }
    while ((uint64_t *)v19 != a3);
  }
  int64_t v24 = v22 - (char *)result;
LABEL_27:
  *uint64_t v13 = (_DWORD *)((char *)result + v24);
  return result;
}

char *sub_100008B88(void *a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    sub_100007E2C();
  }
  uint64_t result = (char *)sub_100007E44((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[12 * v4];
  return result;
}

char *sub_100008BDC(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  unint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      sub_100007E2C();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = sub_100008CE8(v7, v11);
    uint64_t v13 = (char *)v7[1];
    unint64_t v12 = (void **)(v7 + 1);
    unint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  unint64_t v12 = (void **)(result + 8);
  long long v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  int v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    unint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  std::string *v12 = &v9[v17];
  return result;
}

char *sub_100008CE8(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_100007E2C();
  }
  uint64_t result = (char *)sub_100008908((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void XpcSandbox::~XpcSandbox(XpcSandbox *this)
{
  uint64_t v2 = (char *)*((void *)this + 1);
  uint64_t v3 = (char *)*((void *)this + 2);
  if (v2 != v3)
  {
    do
    {
      sandbox_extension_release();
      v2 += 8;
    }
    while (v2 != v3);
    uint64_t v2 = (char *)*((void *)this + 1);
  }
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

void XpcSandbox::consumeExtension(XpcSandbox *this, const char *a2)
{
  if (a2)
  {
    uint64_t v3 = sandbox_extension_consume();
    if (v3 != -1)
    {
      uint64_t v4 = v3;
      unint64_t v5 = *((void *)this + 3);
      uint64_t v6 = (uint64_t *)*((void *)this + 2);
      if ((unint64_t)v6 >= v5)
      {
        uint64_t v8 = (uint64_t *)*((void *)this + 1);
        uint64_t v9 = v6 - v8;
        if ((unint64_t)(v9 + 1) >> 61) {
          sub_100007E2C();
        }
        unint64_t v10 = v5 - (void)v8;
        unint64_t v11 = (uint64_t)(v5 - (void)v8) >> 2;
        if (v11 <= v9 + 1) {
          unint64_t v11 = v9 + 1;
        }
        if (v10 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v12 = v11;
        }
        if (v12)
        {
          uint64_t v13 = (char *)sub_100008F20((uint64_t)this + 24, v12);
          uint64_t v8 = (uint64_t *)*((void *)this + 1);
          uint64_t v6 = (uint64_t *)*((void *)this + 2);
        }
        else
        {
          uint64_t v13 = 0;
        }
        long long v14 = (uint64_t *)&v13[8 * v9];
        unint64_t v15 = &v13[8 * v12];
        *long long v14 = v4;
        uint64_t v7 = v14 + 1;
        while (v6 != v8)
        {
          uint64_t v16 = *--v6;
          *--long long v14 = v16;
        }
        *((void *)this + 1) = v14;
        *((void *)this + 2) = v7;
        *((void *)this + 3) = v15;
        if (v8) {
          operator delete(v8);
        }
      }
      else
      {
        uint64_t *v6 = v3;
        uint64_t v7 = v6 + 1;
      }
      *((void *)this + 2) = v7;
    }
  }
}

void XpcSandbox::consume(xpc_connection_t *this, const char *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "consume", a2);
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(*this, v4);
  if (v5)
  {
    string = xpc_dictionary_get_string(v5, "consumeToken");
    XpcSandbox::consumeExtension((XpcSandbox *)this, string);
  }
}

void *sub_100008F20(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_10000795C();
  }
  return operator new(8 * a2);
}

unsigned char *serialize::Serializer::Serializer(unsigned char *this)
{
  *this = 1;
  return this;
}

{
  *this = 1;
  return this;
}

char *serialize::Serializer::load(xpc_object_t *this)
{
  *(unsigned char *)this = 0;
  switch(xpc_dictionary_get_int64(this[1], "type"))
  {
    case 1u:
      uint64_t v2 = (char *)operator new(0x40uLL);
      sub_10000A63C(__p, (char *)&unk_100017652);
      *(void *)uint64_t v2 = off_1000185C8;
      *((_DWORD *)v2 + 2) = 1;
      uint64_t v3 = v2 + 16;
      if ((SHIBYTE(v13) & 0x80000000) == 0)
      {
        *(_OWORD *)uint64_t v3 = *(_OWORD *)__p;
        *((void *)v2 + 4) = v13;
        *((void *)v2 + 6) = 0;
        *((void *)v2 + 7) = 0;
        *((void *)v2 + 5) = 0;
        goto LABEL_17;
      }
      sub_100007814(v3, __p[0], (unint64_t)__p[1]);
      int v8 = SHIBYTE(v13);
      *((void *)v2 + 6) = 0;
      *((void *)v2 + 7) = 0;
      *((void *)v2 + 5) = 0;
      if ((v8 & 0x80000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    case 2u:
      uint64_t v2 = (char *)operator new(0x68uLL);
      sub_10000A384((uint64_t)v2);
      goto LABEL_17;
    case 3u:
      uint64_t v2 = (char *)operator new(0x88uLL);
      sub_10000A63C(__p, (char *)&unk_100017652);
      *(void *)uint64_t v2 = off_1000185C8;
      *((_DWORD *)v2 + 2) = 3;
      xpc_object_t v4 = v2 + 16;
      if ((SHIBYTE(v13) & 0x80000000) == 0)
      {
        *(_OWORD *)xpc_object_t v4 = *(_OWORD *)__p;
        *((void *)v2 + 4) = v13;
        *((void *)v2 + 6) = 0;
        *((void *)v2 + 7) = 0;
        *((void *)v2 + 5) = 0;
        *(void *)uint64_t v2 = off_100018650;
        *((_OWORD *)v2 + 4) = 0u;
        *((_OWORD *)v2 + 5) = 0u;
        *((_OWORD *)v2 + 6) = 0u;
        *((_OWORD *)v2 + 7) = 0u;
        *((void *)v2 + 16) = 0;
        goto LABEL_17;
      }
      sub_100007814(v4, __p[0], (unint64_t)__p[1]);
      int v9 = SHIBYTE(v13);
      *((void *)v2 + 6) = 0;
      *((void *)v2 + 7) = 0;
      *((void *)v2 + 5) = 0;
      *(void *)uint64_t v2 = off_100018650;
      *((_OWORD *)v2 + 4) = 0u;
      *((_OWORD *)v2 + 5) = 0u;
      *((_OWORD *)v2 + 6) = 0u;
      *((_OWORD *)v2 + 7) = 0u;
      *((void *)v2 + 16) = 0;
      if (v9 < 0) {
        goto LABEL_16;
      }
      goto LABEL_17;
    case 4u:
      uint64_t v2 = (char *)operator new(0x128uLL);
      sub_10000A63C(__p, (char *)&unk_100017652);
      *(void *)uint64_t v2 = off_1000185C8;
      *((_DWORD *)v2 + 2) = 4;
      xpc_object_t v5 = v2 + 16;
      if ((SHIBYTE(v13) & 0x80000000) == 0)
      {
        *(_OWORD *)xpc_object_t v5 = *(_OWORD *)__p;
        *((void *)v2 + 4) = v13;
        *((void *)v2 + 6) = 0;
        *((void *)v2 + 7) = 0;
        *((void *)v2 + 5) = 0;
        *(void *)uint64_t v2 = &off_100018698;
        *((void *)v2 + 35) = 0;
        *((void *)v2 + 36) = 0;
        *((void *)v2 + 34) = 0;
        *((_OWORD *)v2 + 4) = 0u;
        *((_OWORD *)v2 + 5) = 0u;
        *((_OWORD *)v2 + 6) = 0u;
        *((_OWORD *)v2 + 7) = 0u;
        *((_OWORD *)v2 + 8) = 0u;
        *((_OWORD *)v2 + 9) = 0u;
        *((_OWORD *)v2 + 10) = 0u;
        *((_OWORD *)v2 + 11) = 0u;
        *((_OWORD *)v2 + 12) = 0u;
        *((_OWORD *)v2 + 13) = 0u;
        *((_OWORD *)v2 + 14) = 0u;
        *((_OWORD *)v2 + 15) = 0u;
        *(_OWORD *)(v2 + 252) = 0u;
        goto LABEL_17;
      }
      sub_100007814(v5, __p[0], (unint64_t)__p[1]);
      int v10 = SHIBYTE(v13);
      *((void *)v2 + 6) = 0;
      *((void *)v2 + 7) = 0;
      *((void *)v2 + 5) = 0;
      *(void *)uint64_t v2 = &off_100018698;
      *((void *)v2 + 35) = 0;
      *((void *)v2 + 36) = 0;
      *((void *)v2 + 34) = 0;
      *((_OWORD *)v2 + 4) = 0u;
      *((_OWORD *)v2 + 5) = 0u;
      *((_OWORD *)v2 + 6) = 0u;
      *((_OWORD *)v2 + 7) = 0u;
      *((_OWORD *)v2 + 8) = 0u;
      *((_OWORD *)v2 + 9) = 0u;
      *((_OWORD *)v2 + 10) = 0u;
      *((_OWORD *)v2 + 11) = 0u;
      *((_OWORD *)v2 + 12) = 0u;
      *((_OWORD *)v2 + 13) = 0u;
      *((_OWORD *)v2 + 14) = 0u;
      *((_OWORD *)v2 + 15) = 0u;
      *(_OWORD *)(v2 + 252) = 0u;
      if (v10 < 0) {
        goto LABEL_16;
      }
      goto LABEL_17;
    case 5u:
      uint64_t v2 = (char *)operator new(0x88uLL);
      sub_10000A63C(__p, (char *)&unk_100017652);
      sub_10000A23C((uint64_t)v2, (long long *)__p);
      goto LABEL_15;
    case 6u:
      uint64_t v2 = (char *)operator new(0x40uLL);
      sub_10000A63C(__p, (char *)&unk_100017652);
      *(void *)uint64_t v2 = off_1000185C8;
      *((_DWORD *)v2 + 2) = 6;
      uint64_t v6 = v2 + 16;
      if (SHIBYTE(v13) < 0)
      {
        sub_100007814(v6, __p[0], (unint64_t)__p[1]);
        int v11 = SHIBYTE(v13);
        *((void *)v2 + 6) = 0;
        *((void *)v2 + 7) = 0;
        *((void *)v2 + 5) = 0;
        *(void *)uint64_t v2 = &off_100018728;
        if (v11 < 0) {
LABEL_16:
        }
          operator delete(__p[0]);
      }
      else
      {
        *(_OWORD *)uint64_t v6 = *(_OWORD *)__p;
        *((void *)v2 + 4) = v13;
        *((void *)v2 + 6) = 0;
        *((void *)v2 + 7) = 0;
        *((void *)v2 + 5) = 0;
        *(void *)uint64_t v2 = &off_100018728;
      }
LABEL_17:
      (*(void (**)(char *, xpc_object_t *))(*(void *)v2 + 24))(v2, this);
      return v2;
    case 7u:
      uint64_t v2 = (char *)operator new(0x68uLL);
      sub_10000A480((uint64_t)v2, 1);
      goto LABEL_17;
    case 8u:
      uint64_t v2 = (char *)operator new(0xB0uLL);
      sub_10000A63C(__p, (char *)&unk_100017652);
      sub_10000A578((uint64_t)v2, 1, (long long *)__p);
LABEL_15:
      if (SHIBYTE(v13) < 0) {
        goto LABEL_16;
      }
      goto LABEL_17;
    default:
      return 0;
  }
}

void sub_1000093CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  operator delete(v15);
  _Unwind_Resume(a1);
}

uint64_t serialize::Serializer::save(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = xpc_dictionary_create(0, 0, 0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 24))(a2, a1);
  return *(void *)(a1 + 8);
}

void serialize::Serializer::sync(unsigned __int8 *a1, const char *a2, int *a3)
{
  int v3 = *a1;
  xpc_object_t v4 = (void *)*((void *)a1 + 1);
  if (v3)
  {
    int64_t v5 = *a3;
    xpc_dictionary_set_int64(v4, a2, v5);
  }
  else
  {
    *a3 = xpc_dictionary_get_int64(v4, a2);
  }
}

{
  int v3;
  void *v4;
  int64_t v5;
  uint64_t vars8;

  int v3 = *a1;
  xpc_object_t v4 = (void *)*((void *)a1 + 1);
  if (v3)
  {
    int64_t v5 = *a3;
    xpc_dictionary_set_int64(v4, a2, v5);
  }
  else
  {
    *a3 = xpc_dictionary_get_int64(v4, a2);
  }
}

{
  int v3;
  void *v4;
  int64_t v5;
  uint64_t vars8;

  int v3 = *a1;
  xpc_object_t v4 = (void *)*((void *)a1 + 1);
  if (v3)
  {
    int64_t v5 = *a3;
    xpc_dictionary_set_int64(v4, a2, v5);
  }
  else
  {
    *a3 = xpc_dictionary_get_int64(v4, a2);
  }
}

void serialize::Serializer::sync(unsigned __int8 *a1, const char *a2, std::string *a3)
{
  int v3 = a3;
  int v4 = *a1;
  int64_t v5 = (void *)*((void *)a1 + 1);
  if (v4)
  {
    if ((a3->__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      a3 = (std::string *)a3->__r_.__value_.__r.__words[0];
    }
    xpc_dictionary_set_string(v5, a2, (const char *)a3);
  }
  else
  {
    string = xpc_dictionary_get_string(v5, a2);
    std::string::assign(v3, string);
  }
}

float serialize::Serializer::sync(serialize::Serializer *this, const char *a2, float *a3)
{
  int v4 = *(unsigned __int8 *)this;
  int64_t v5 = (void *)*((void *)this + 1);
  if (v4)
  {
    double v6 = *a3;
    xpc_dictionary_set_double(v5, a2, v6);
  }
  else
  {
    float result = xpc_dictionary_get_double(v5, a2);
    *a3 = result;
  }
  return result;
}

void serialize::Serializer::sync(serialize::Serializer *this, const char *a2, unint64_t *a3)
{
  int v3 = *(unsigned __int8 *)this;
  int v4 = (void *)*((void *)this + 1);
  if (v3)
  {
    uint64_t v5 = *a3;
    xpc_dictionary_set_uint64(v4, a2, v5);
  }
  else
  {
    *a3 = xpc_dictionary_get_uint64(v4, a2);
  }
}

void serialize::Serializer::sync(serialize::Serializer *this, const char *a2, int *a3)
{
  int v3 = *(unsigned __int8 *)this;
  int v4 = (void *)*((void *)this + 1);
  if (v3)
  {
    uint64_t v5 = *a3;
    xpc_dictionary_set_uint64(v4, a2, v5);
  }
  else
  {
    *a3 = xpc_dictionary_get_uint64(v4, a2);
  }
}

void serialize::Serializer::sync(serialize::Serializer *a1, char *a2, float *a3)
{
  sub_10000A63C(&v15, a2);
  double v6 = std::string::append(&v15, ":x");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  int64_t v17 = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  if (v17 >= 0) {
    int v8 = __p;
  }
  else {
    int v8 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v8, a3);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  sub_10000A63C(&v15, a2);
  int v9 = std::string::append(&v15, ":y");
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  int64_t v17 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (v17 >= 0) {
    int v11 = __p;
  }
  else {
    int v11 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v11, a3 + 1);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  sub_10000A63C(&v15, a2);
  unint64_t v12 = std::string::append(&v15, ":z");
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  int64_t v17 = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  if (v17 >= 0) {
    long long v14 = __p;
  }
  else {
    long long v14 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v14, a3 + 2);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
}

{
  std::string *v6;
  long long v7;
  void **v8;
  std::string *v9;
  long long v10;
  void **v11;
  std::string *v12;
  long long v13;
  void **v14;
  std::string *v15;
  long long v16;
  void **v17;
  std::string v18;
  void *__p[2];
  int64_t v20;

  sub_10000A63C(&v18, a2);
  double v6 = std::string::append(&v18, ":x");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  uint64_t v20 = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  if (v20 >= 0) {
    int v8 = __p;
  }
  else {
    int v8 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v8, a3);
  if (SHIBYTE(v20) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  sub_10000A63C(&v18, a2);
  int v9 = std::string::append(&v18, ":y");
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  uint64_t v20 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (v20 >= 0) {
    int v11 = __p;
  }
  else {
    int v11 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v11, a3 + 1);
  if (SHIBYTE(v20) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  sub_10000A63C(&v18, a2);
  unint64_t v12 = std::string::append(&v18, ":z");
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  uint64_t v20 = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  if (v20 >= 0) {
    long long v14 = __p;
  }
  else {
    long long v14 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v14, a3 + 2);
  if (SHIBYTE(v20) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  sub_10000A63C(&v18, a2);
  std::string v15 = std::string::append(&v18, ":w");
  uint64_t v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  uint64_t v20 = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  if (v20 >= 0) {
    int64_t v17 = __p;
  }
  else {
    int64_t v17 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v17, a3 + 3);
  if (SHIBYTE(v20) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
}

void sub_10000980C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100009A54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void serialize::Serializer::sync(uint64_t a1, const char *a2, uint64_t a3)
{
  if (*(unsigned char *)a1)
  {
    int v4 = *(void **)(a1 + 8);
    uint64_t v5 = *(const void **)a3;
    size_t v6 = *(void *)(a3 + 8) - *(void *)a3;
    xpc_dictionary_set_data(v4, a2, v5, v6);
  }
  else
  {
    size_t length = 0;
    data = (char *)xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 8), a2, &length);
    sub_100008BDC((char *)a3, data, (uint64_t)&data[length & 0xFFFFFFFFFFFFFFFCLL], (uint64_t)length >> 2);
  }
}

{
  void *v4;
  const void *v5;
  size_t v6;
  char *data;
  size_t length;
  uint64_t vars8;

  if (*(unsigned char *)a1)
  {
    int v4 = *(void **)(a1 + 8);
    uint64_t v5 = *(const void **)a3;
    size_t v6 = *(void *)(a3 + 8) - *(void *)a3;
    xpc_dictionary_set_data(v4, a2, v5, v6);
  }
  else
  {
    size_t length = 0;
    data = (char *)xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 8), a2, &length);
    sub_100008BDC((char *)a3, data, (uint64_t)&data[length & 0xFFFFFFFFFFFFFFFCLL], (uint64_t)length >> 2);
  }
}

void serialize::Serializer::sync(uint64_t a1, const char *a2, const void **a3)
{
  if (*(unsigned char *)a1)
  {
    int v4 = *(void **)(a1 + 8);
    uint64_t v5 = *a3;
    size_t v6 = (unsigned char *)a3[1] - (unsigned char *)*a3;
    xpc_dictionary_set_data(v4, a2, v5, v6);
  }
  else
  {
    size_t length = 0;
    data = (uint64_t *)xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 8), a2, &length);
    sub_1000089C8(a3, data, (uint64_t *)((char *)data + 12 * (length / 0xC)), length / 0xC);
  }
}

{
  void *v4;
  const void *v5;
  size_t v6;
  uint64_t *data;
  size_t length;
  uint64_t vars8;

  if (*(unsigned char *)a1)
  {
    int v4 = *(void **)(a1 + 8);
    uint64_t v5 = *a3;
    size_t v6 = (unsigned char *)a3[1] - (unsigned char *)*a3;
    xpc_dictionary_set_data(v4, a2, v5, v6);
  }
  else
  {
    size_t length = 0;
    data = (uint64_t *)xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 8), a2, &length);
    sub_10000A6F0(a3, data, (uint64_t *)((char *)data + (length & 0xFFFFFFFFFFFFFFF8)), (uint64_t)length >> 3);
  }
}

void serialize::Serializer::sync(xpc_object_t *a1, char *a2, void **a3)
{
  unint64_t v46 = ((unsigned char *)a3[1] - (unsigned char *)*a3) >> 3;
  sub_10000A63C(&v43, a2);
  size_t v6 = std::string::append(&v43, ":count");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  unint64_t v45 = (char *)v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v45) >= 0) {
    int v8 = __p;
  }
  else {
    int v8 = (void **)__p[0];
  }
  serialize::Serializer::sync((serialize::Serializer *)a1, (const char *)v8, &v46);
  if (SHIBYTE(v45) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v43.__r_.__value_.__l.__data_);
  }
  size_t v9 = v46;
  if (v46)
  {
    if (*(unsigned char *)a1)
    {
      key = a2;
      __p[0] = 0;
      __p[1] = 0;
      unint64_t v45 = 0;
      sub_10000A11C(__p, v46);
      long long v10 = (char *)*a3;
      int v11 = (char *)a3[1];
      if (*a3 != v11)
      {
        do
        {
          uint64_t v12 = *(void *)v10;
          v43.__r_.__value_.__s.__data_[0] = 1;
          v43.__r_.__value_.__l.__size_ = (std::string::size_type)xpc_dictionary_create(0, 0, 0);
          (*(void (**)(uint64_t, std::string *))(*(void *)v12 + 24))(v12, &v43);
          std::string::size_type size = v43.__r_.__value_.__l.__size_;
          long long v14 = (char *)__p[1];
          if (__p[1] >= v45)
          {
            int64_t v16 = ((char *)__p[1] - (char *)__p[0]) >> 3;
            if ((unint64_t)(v16 + 1) >> 61) {
              sub_100007E2C();
            }
            unint64_t v17 = (v45 - (char *)__p[0]) >> 2;
            if (v17 <= v16 + 1) {
              unint64_t v17 = v16 + 1;
            }
            if ((unint64_t)(v45 - (char *)__p[0]) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v18 = v17;
            }
            if (v18) {
              uint64_t v19 = (char *)sub_100008F20((uint64_t)&v45, v18);
            }
            else {
              uint64_t v19 = 0;
            }
            uint64_t v20 = (std::string::size_type *)&v19[8 * v16];
            *uint64_t v20 = size;
            std::string v15 = v20 + 1;
            std::string v22 = (char *)__p[0];
            uint64_t v21 = (char *)__p[1];
            if (__p[1] != __p[0])
            {
              do
              {
                std::string::size_type v23 = *((void *)v21 - 1);
                v21 -= 8;
                *--uint64_t v20 = v23;
              }
              while (v21 != v22);
              uint64_t v21 = (char *)__p[0];
            }
            __p[0] = v20;
            __p[1] = v15;
            unint64_t v45 = &v19[8 * v18];
            if (v21) {
              operator delete(v21);
            }
          }
          else
          {
            *(void *)__p[1] = v43.__r_.__value_.__l.__size_;
            std::string v15 = v14 + 8;
          }
          __p[1] = v15;
          v10 += 8;
        }
        while (v10 != v11);
      }
      xpc_object_t v24 = xpc_array_create((xpc_object_t *)__p[0], v9);
      xpc_dictionary_set_value(a1[1], key, v24);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    else
    {
      xpc_object_t value = xpc_dictionary_get_value(a1[1], a2);
      sub_10000A11C(a3, v9);
      size_t v26 = 0;
      do
      {
        xpc_object_t v27 = xpc_array_get_value(value, v26);
        LOBYTE(__p[0]) = 1;
        __p[1] = v27;
        std::locale v28 = serialize::Serializer::load(__p);
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v31 = (char **)a3[1];
          unint64_t v30 = (unint64_t)a3[2];
          if ((unint64_t)v31 >= v30)
          {
            uint64_t v33 = ((char *)v31 - (unsigned char *)*a3) >> 3;
            if ((unint64_t)(v33 + 1) >> 61) {
              sub_100007E2C();
            }
            uint64_t v34 = v30 - (void)*a3;
            uint64_t v35 = v34 >> 2;
            if (v34 >> 2 <= (unint64_t)(v33 + 1)) {
              uint64_t v35 = v33 + 1;
            }
            if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v36 = v35;
            }
            if (v36) {
              int v37 = (char *)sub_100008F20((uint64_t)(a3 + 2), v36);
            }
            else {
              int v37 = 0;
            }
            uint64_t v38 = (char **)&v37[8 * v33];
            *uint64_t v38 = v29;
            long long v32 = (char *)(v38 + 1);
            uint64_t v40 = (char *)*a3;
            unsigned int v39 = (char *)a3[1];
            if (v39 != *a3)
            {
              do
              {
                unint64_t v41 = (char *)*((void *)v39 - 1);
                v39 -= 8;
                *--uint64_t v38 = v41;
              }
              while (v39 != v40);
              unsigned int v39 = (char *)*a3;
            }
            *a3 = v38;
            a3[1] = v32;
            a3[2] = &v37[8 * v36];
            if (v39) {
              operator delete(v39);
            }
          }
          else
          {
            _DWORD *v31 = v28;
            long long v32 = (char *)(v31 + 1);
          }
          a3[1] = v32;
        }
        ++v26;
      }
      while (v26 != v9);
    }
  }
}

void sub_10000A0C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000A11C(void **a1, unint64_t a2)
{
  int v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_100007E2C();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    size_t v6 = (char *)sub_100008F20(v3, a2);
    long long v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    size_t v9 = &v6[8 * v8];
    int v11 = (char *)*a1;
    long long v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      long long v10 = (char *)*a1;
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

uint64_t sub_10000A1C4(uint64_t a1, long long *a2, int a3)
{
  *(void *)a1 = off_1000185C8;
  *(_DWORD *)(a1 + 8) = a3;
  uint64_t v4 = a1 + 16;
  if (*((char *)a2 + 23) < 0)
  {
    sub_100007814((unsigned char *)v4, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    *(void *)(v4 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v4 = v5;
  }
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  return a1;
}

uint64_t sub_10000A23C(uint64_t a1, long long *a2)
{
  sub_10000A63C(__p, (char *)&unk_100017652);
  *(void *)a1 = off_1000185C8;
  *(_DWORD *)(a1 + 8) = 5;
  uint64_t v4 = (unsigned char *)(a1 + 16);
  if (SHIBYTE(v10) < 0)
  {
    sub_100007814(v4, __p[0], (unint64_t)__p[1]);
    int v5 = SHIBYTE(v10);
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 40) = 0;
    if (v5 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    *(_OWORD *)uint64_t v4 = *(_OWORD *)__p;
    *(void *)(a1 + 32) = v10;
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 40) = 0;
  }
  *(void *)a1 = off_1000186E0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  size_t v6 = (unsigned char *)(a1 + 88);
  if (*((char *)a2 + 23) < 0)
  {
    sub_100007814(v6, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    *(void *)(a1 + 104) = *((void *)a2 + 2);
    *(_OWORD *)size_t v6 = v7;
  }
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 0;
  return a1;
}

void sub_10000A348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  unint64_t v18 = *v16;
  if (*v16)
  {
    *((void *)v15 + 9) = v18;
    operator delete(v18);
  }
  serialize::Prim::~Prim(v15);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A384(uint64_t a1)
{
  sub_10000A63C(__p, (char *)&unk_100017652);
  *(void *)a1 = off_1000185C8;
  *(_DWORD *)(a1 + 8) = 2;
  uint64_t v2 = (unsigned char *)(a1 + 16);
  if (SHIBYTE(v6) < 0)
  {
    sub_100007814(v2, __p[0], (unint64_t)__p[1]);
    int v3 = SHIBYTE(v6);
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 40) = 0;
    if (v3 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    *(_OWORD *)uint64_t v2 = *(_OWORD *)__p;
    *(void *)(a1 + 32) = v6;
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 40) = 0;
  }
  *(void *)a1 = off_100018608;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 88) = 1008981770;
  *(_DWORD *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 96) = 0;
  *(_DWORD *)(a1 + 100) = 24;
  return a1;
}

void sub_10000A464(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000A480(uint64_t a1, int a2)
{
  sub_10000A63C(__p, (char *)&unk_100017652);
  *(void *)a1 = off_1000185C8;
  *(_DWORD *)(a1 + 8) = 7;
  uint64_t v4 = (unsigned char *)(a1 + 16);
  if (SHIBYTE(v8) < 0)
  {
    sub_100007814(v4, __p[0], (unint64_t)__p[1]);
    int v5 = SHIBYTE(v8);
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 40) = 0;
    if (v5 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    *(_OWORD *)uint64_t v4 = *(_OWORD *)__p;
    *(void *)(a1 + 32) = v8;
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 40) = 0;
  }
  *(void *)a1 = off_100018770;
  *(_DWORD *)(a1 + 64) = a2;
  *(_OWORD *)(a1 + 68) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_DWORD *)(a1 + 100) = 0;
  return a1;
}

void sub_10000A55C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000A578(uint64_t a1, int a2, long long *a3)
{
  uint64_t v5 = sub_10000A1C4(a1, a3, 8);
  *(void *)uint64_t v5 = off_1000187B8;
  *(_DWORD *)(v5 + 64) = a2;
  *(_OWORD *)(v5 + 104) = 0u;
  __asm { FMOV            V1.4S, #1.0 }
  *(_OWORD *)(v5 + 68) = _Q1;
  *(void *)(a1 + 92) = 0;
  *(void *)(a1 + 84) = 0;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  sub_10000A63C((void *)(v5 + 152), "st");
  return a1;
}

void sub_10000A608(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 151) < 0) {
    operator delete(*(void **)(v1 + 128));
  }
  if (*(char *)(v1 + 127) < 0) {
    operator delete(*v2);
  }
  serialize::Prim::~Prim((serialize::Prim *)v1);
  _Unwind_Resume(a1);
}

void *sub_10000A63C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000078B4();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void *sub_10000A6F0(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  float result = (void *)*a1;
  if (a4 > (v8 - (uint64_t)result) >> 3)
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 61) {
      sub_100007E2C();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    sub_10000A844(a1, v11);
    uint64_t v13 = (void *)a1[1];
    uint64_t v12 = (void **)(a1 + 1);
    float result = v13;
    long long v14 = (char *)v13;
    if (v6 != a3)
    {
      long long v14 = (char *)result;
      do
      {
        uint64_t v15 = *v6++;
        *(void *)long long v14 = v15;
        v14 += 8;
      }
      while (v6 != a3);
    }
LABEL_26:
    int64_t v25 = v14 - (char *)result;
    goto LABEL_27;
  }
  unint64_t v17 = (void *)a1[1];
  uint64_t v12 = (void **)(a1 + 1);
  int64_t v16 = v17;
  unint64_t v18 = v17 - result;
  if (v18 >= a4)
  {
    long long v14 = (char *)result;
    if (a2 != a3)
    {
      size_t v26 = result;
      do
      {
        uint64_t v27 = *v6++;
        *v26++ = v27;
        v14 += 8;
      }
      while (v6 != a3);
    }
    goto LABEL_26;
  }
  uint64_t v19 = &a2[v18];
  if (v16 != result)
  {
    uint64_t v20 = 8 * v18;
    do
    {
      uint64_t v21 = *v6++;
      *result++ = v21;
      v20 -= 8;
    }
    while (v20);
    float result = *v12;
  }
  std::string v22 = (char *)result;
  if (v19 != a3)
  {
    std::string v22 = (char *)result;
    std::string::size_type v23 = result;
    do
    {
      uint64_t v24 = *v19++;
      *v23++ = v24;
      v22 += 8;
    }
    while (v19 != a3);
  }
  int64_t v25 = v22 - (char *)result;
LABEL_27:
  char *v12 = (void *)((char *)result + v25);
  return result;
}

char *sub_10000A844(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100007E2C();
  }
  float result = (char *)sub_100008F20((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t StlConverter::StlConverter(uint64_t a1, void *a2, long long *a3)
{
  *(void *)a1 = off_100018568;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  if (*((char *)a3 + 23) < 0)
  {
    sub_100007814((unsigned char *)(a1 + 40), *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v5 = *a3;
    *(void *)(a1 + 56) = *((void *)a3 + 2);
    *(_OWORD *)(a1 + 40) = v5;
  }
  StlConverter::parseStl((void *)a1, a2);
  return a1;
}

void sub_10000A91C(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 16) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void StlConverter::parseStl(void *a1, void *a2)
{
  std::istream::seekg();
  std::istream::tellg();
  a1[8] = v4;
  std::istream::seekg();
  if (StlConverter::isBinary((uint64_t)a1)) {
    StlConverter::parseStlBinary(a1);
  }
  else {
    StlConverter::parseStlAscii(a1, a2);
  }
}

void StlConverter::~StlConverter(StlConverter *this)
{
  *(void *)this = off_100018568;
  uint64_t v2 = (uint64_t *)*((void *)this + 1);
  int v3 = (uint64_t *)*((void *)this + 2);
  while (v2 != v3)
  {
    uint64_t v4 = *v2;
    if (*v2)
    {
      long long v5 = *(void **)(v4 + 72);
      if (v5)
      {
        *(void *)(v4 + 80) = v5;
        operator delete(v5);
      }
      uint64_t v6 = *(void **)(v4 + 48);
      if (v6)
      {
        *(void *)(v4 + 56) = v6;
        operator delete(v6);
      }
      uint64_t v7 = *(void **)(v4 + 24);
      if (v7)
      {
        *(void *)(v4 + 32) = v7;
        operator delete(v7);
      }
      if (*(char *)(v4 + 23) < 0) {
        operator delete(*(void **)v4);
      }
      operator delete((void *)v4);
    }
    ++v2;
  }
  if (*((char *)this + 63) < 0) {
    operator delete(*((void **)this + 5));
  }
  uint64_t v8 = (void *)*((void *)this + 1);
  if (v8)
  {
    *((void *)this + 2) = v8;
    operator delete(v8);
  }
}

{
  void *v1;
  uint64_t vars8;

  StlConverter::~StlConverter(this);
  operator delete(v1);
}

uint64_t StlConverter::isBinary(uint64_t a1)
{
  if (*(void *)(a1 + 64) < 0x54uLL) {
    return 0;
  }
  sub_10000A63C(&v10, "solid");
  uint64_t v38 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v3 = std::istream::seekg();
  __chkstk_darwin(v3);
  long long v5 = (char *)&v9 - v4;
  std::istream::read();
  std::string::size_type size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v10.__r_.__value_.__l.__size_;
  }
  v5[size] = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v29 = 0;
  std::istream::seekg();
  if (std::string::compare(&v10, v5) || *(void *)(a1 + 64) < 0x81uLL) {
    goto LABEL_13;
  }
  std::istream::read();
  uint64_t v19 = 0;
  long long v18 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  std::istream::seekg();
  std::string::size_type v7 = (v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
     ? HIBYTE(v10.__r_.__value_.__r.__words[2])
     : v10.__r_.__value_.__l.__size_;
  if (v7 <= 0x73)
  {
    while (strncmp("facet normal", &v20[v7], 0xCuLL))
    {
      if (++v7 == 116) {
        goto LABEL_13;
      }
    }
    uint64_t v1 = 0;
  }
  else
  {
LABEL_13:
    uint64_t v1 = 1;
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  return v1;
}

void sub_10000AD3C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*(void **)(v1 + 8));
  }
  _Unwind_Resume(exception_object);
}

void StlConverter::addSolid(void *a1, uint64_t *a2)
{
  fileFormatUtils::makeValidIdentifier(a2, &__p);
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v3 = (char **)(a1 + 1);
  if (v4 == v5) {
    goto LABEL_39;
  }
  uint64_t v6 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  long long v7 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  while (1)
  {
    uint64_t v9 = *(unsigned __int8 *)(*(void *)v4 + 23);
    int v10 = (char)v9;
    if ((v9 & 0x80u) != 0) {
      uint64_t v9 = *(void *)(*(void *)v4 + 8);
    }
    if (size != v9) {
      goto LABEL_18;
    }
    long long v11 = v10 >= 0 ? *(unsigned __int8 **)v4 : **(unsigned __int8 ***)v4;
    if ((v6 & 0x80) != 0) {
      break;
    }
    if (!v6) {
      goto LABEL_20;
    }
    p_p = &__p;
    uint64_t v13 = v6;
    while (p_p->__r_.__value_.__s.__data_[0] == *v11)
    {
      p_p = (std::string *)((char *)p_p + 1);
      ++v11;
      if (!--v13) {
        goto LABEL_20;
      }
    }
LABEL_18:
    v4 += 8;
    if (v4 == v5) {
      goto LABEL_39;
    }
  }
  if (memcmp((const void *)v7, v11, *((size_t *)&v7 + 1))) {
    goto LABEL_18;
  }
LABEL_20:
  long long v14 = &v37;
  sub_100008940((uint64_t)&v37, size + 7);
  if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    long long v14 = (std::string *)v37.__r_.__value_.__r.__words[0];
  }
  if (size)
  {
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      long long v15 = &__p;
    }
    else {
      long long v15 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    memmove(v14, v15, size);
  }
  strcpy((char *)v14 + size, "_solid_");
  std::to_string(&v36, (uint64_t)(a1[2] - a1[1]) >> 3);
  if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v16 = &v36;
  }
  else {
    long long v16 = (std::string *)v36.__r_.__value_.__r.__words[0];
  }
  if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v17 = HIBYTE(v36.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v17 = v36.__r_.__value_.__l.__size_;
  }
  long long v18 = std::string::append(&v37, (const std::string::value_type *)v16, v17);
  std::string::size_type v19 = v18->__r_.__value_.__r.__words[0];
  v39[0] = v18->__r_.__value_.__l.__size_;
  *(void *)((char *)v39 + 7) = *(std::string::size_type *)((char *)&v18->__r_.__value_.__r.__words[1] + 7);
  char v20 = HIBYTE(v18->__r_.__value_.__r.__words[2]);
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  __p.__r_.__value_.__r.__words[0] = v19;
  __p.__r_.__value_.__l.__size_ = v39[0];
  *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v39 + 7);
  *((unsigned char *)&__p.__r_.__value_.__s + 23) = v20;
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
LABEL_39:
  long long v21 = (std::string *)operator new(0x60uLL);
  long long v22 = v21;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    sub_100007814(v21, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    *long long v21 = __p;
  }
  v22[3].__r_.__value_.__r.__words[2] = 0;
  *(_OWORD *)&v22[3].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&v22[2].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)&v22[1].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&v22[1].__r_.__value_.__l.__data_ = 0u;
  unint64_t v23 = a1[3];
  a1[4] = v22;
  long long v24 = (std::string **)a1[2];
  if ((unint64_t)v24 >= v23)
  {
    uint64_t v26 = ((char *)v24 - *v3) >> 3;
    if ((unint64_t)(v26 + 1) >> 61) {
      sub_100007E2C();
    }
    uint64_t v27 = v23 - (void)*v3;
    uint64_t v28 = v27 >> 2;
    if (v27 >> 2 <= (unint64_t)(v26 + 1)) {
      uint64_t v28 = v26 + 1;
    }
    if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v29 = v28;
    }
    if (v29)
    {
      long long v30 = (char *)sub_100008F20((uint64_t)(a1 + 3), v29);
      long long v22 = (std::string *)a1[4];
    }
    else
    {
      long long v30 = 0;
    }
    long long v31 = (std::string **)&v30[8 * v26];
    long long v32 = &v30[8 * v29];
    _DWORD *v31 = v22;
    long long v25 = v31 + 1;
    long long v34 = (char *)a1[1];
    long long v33 = (char *)a1[2];
    if (v33 != v34)
    {
      do
      {
        long long v35 = (std::string *)*((void *)v33 - 1);
        v33 -= 8;
        *--long long v31 = v35;
      }
      while (v33 != v34);
      long long v33 = *v3;
    }
    a1[1] = v31;
    a1[2] = v25;
    a1[3] = v32;
    if (v33) {
      operator delete(v33);
    }
  }
  else
  {
    char *v24 = v22;
    long long v25 = v24 + 1;
  }
  a1[2] = v25;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_10000B0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  operator delete(v26);
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void StlConverter::addNormal(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 32)) {
    return;
  }
  std::string __p = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  sub_100005C4C(a2, (uint64_t)&__p);
  uint64_t v27 = 0x3F80000000000000;
  float v28 = 0.0;
  if (SHIBYTE(v31) < 0)
  {
    if (v30 != 6) {
      goto LABEL_11;
    }
    p_p = (unsigned __int16 *)__p;
  }
  else
  {
    if (SHIBYTE(v31) != 6) {
      goto LABEL_11;
    }
    p_p = (unsigned __int16 *)&__p;
  }
  int v5 = *(_DWORD *)p_p;
  int v6 = p_p[2];
  if (v5 == 1836216174 && v6 == 27745)
  {
    float Float = fileFormatUtils::getFloat(a2);
    *(float *)&uint64_t v27 = Float;
    float v8 = fileFormatUtils::getFloat(a2);
    *((float *)&v27 + 1) = v8;
    float v9 = fileFormatUtils::getFloat(a2);
    float v28 = v9;
    goto LABEL_12;
  }
LABEL_11:
  float v8 = 1.0;
  float v9 = 0.0;
  float Float = 0.0;
LABEL_12:
  long long v11 = *(uint64_t **)(a1 + 32);
  long long v12 = (float *)v11[7];
  if ((unint64_t)v12 >= v11[8])
  {
    uint64_t v13 = sub_10000879C(v11 + 6, (uint64_t)&v27);
    long long v14 = *(uint64_t **)(a1 + 32);
  }
  else
  {
    float *v12 = Float;
    v12[1] = v8;
    uint64_t v13 = (uint64_t)(v12 + 3);
    long long v14 = v11;
    v12[2] = v9;
  }
  v11[7] = v13;
  unint64_t v15 = v14[11];
  long long v16 = (char *)v14[10];
  if ((unint64_t)v16 >= v15)
  {
    long long v18 = (char *)v14[9];
    uint64_t v19 = (v16 - v18) >> 2;
    if ((unint64_t)(v19 + 1) >> 62) {
      sub_100007E2C();
    }
    unint64_t v20 = v15 - (void)v18;
    unint64_t v21 = (uint64_t)(v15 - (void)v18) >> 1;
    if (v21 <= v19 + 1) {
      unint64_t v21 = v19 + 1;
    }
    if (v20 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v22 = v21;
    }
    if (v22)
    {
      unint64_t v23 = (char *)sub_100008908((uint64_t)(v14 + 11), v22);
      long long v18 = (char *)v14[9];
      long long v16 = (char *)v14[10];
    }
    else
    {
      unint64_t v23 = 0;
    }
    long long v24 = &v23[4 * v19];
    long long v25 = &v23[4 * v22];
    *(_DWORD *)long long v24 = 0;
    std::string::size_type v17 = v24 + 4;
    while (v16 != v18)
    {
      int v26 = *((_DWORD *)v16 - 1);
      v16 -= 4;
      *((_DWORD *)v24 - 1) = v26;
      v24 -= 4;
    }
    v14[9] = (uint64_t)v24;
    v14[10] = (uint64_t)v17;
    v14[11] = (uint64_t)v25;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    *(_DWORD *)long long v16 = 0;
    std::string::size_type v17 = v16 + 4;
  }
  v14[10] = (uint64_t)v17;
  if (SHIBYTE(v31) < 0) {
    operator delete(__p);
  }
}

void sub_10000B2F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t StlConverter::addVertex(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 80) - *(void *)(v2 + 72);
    if (v3)
    {
      uint64_t v5 = result;
      uint64_t v6 = v3 >> 2;
      v12[2] = 0;
      fileFormatUtils::getFloat(a2);
      float Float = fileFormatUtils::getFloat(a2);
      *(float *)&v12[1] = Float;
      float v8 = fileFormatUtils::getFloat(a2);
      *(float *)long long v12 = v8;
      float v9 = *(uint64_t **)(v5 + 32);
      unint64_t v10 = v9[4];
      if (v10 >= v9[5])
      {
        float result = sub_10000879C(v9 + 3, (uint64_t)v12);
        long long v11 = *(uint64_t **)(v5 + 32);
      }
      else
      {
        *(float *)unint64_t v10 = v8;
        *(float *)(v10 + 4) = Float;
        float result = v10 + 12;
        long long v11 = v9;
        *(_DWORD *)(v10 + 8) = 0;
      }
      v9[4] = result;
      ++*(_DWORD *)(v11[9] + 4 * v6 - 4);
    }
  }
  return result;
}

void StlConverter::parseStlAscii(void *a1, void *a2)
{
  memset(&__str, 0, sizeof(__str));
  sub_100005AB4((uint64_t)v31);
  char v4 = 0;
  char v5 = 0;
  while (sub_1000058A4(a2, (uint64_t)&__str))
  {
    std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      std::ios_base::clear((std::ios_base *)((char *)v31 + *(void *)(v31[0] - 24)), 0);
      std::string::operator=(&v33, &__str);
      sub_100007D18((uint64_t)&v32);
      float v28 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      sub_100005C4C(v31, (uint64_t)&v28);
      if ((v5 & 1) == 0) {
        goto LABEL_16;
      }
      if (v30 < 0)
      {
        if (v29 != 6) {
          goto LABEL_16;
        }
        long long v7 = (unsigned __int16 *)v28;
      }
      else
      {
        if (HIBYTE(v30) != 6) {
          goto LABEL_16;
        }
        long long v7 = (unsigned __int16 *)&v28;
      }
      int v8 = *(_DWORD *)v7;
      int v9 = v7[2];
      if (v8 == 1953654134 && v9 == 30821)
      {
        StlConverter::addVertex((uint64_t)a1, v31);
LABEL_43:
        char v5 = 1;
        goto LABEL_82;
      }
LABEL_16:
      if (v4)
      {
        if (v30 < 0)
        {
          uint64_t v12 = v29;
          if (v29 != 5) {
            goto LABEL_45;
          }
          long long v11 = (int *)v28;
        }
        else
        {
          long long v11 = (int *)&v28;
          if (HIBYTE(v30) != 5) {
            goto LABEL_28;
          }
        }
        int v13 = *v11;
        int v14 = *((unsigned __int8 *)v11 + 4);
        if (v13 == 1702131055 && v14 == 114)
        {
          char v4 = 1;
          goto LABEL_43;
        }
      }
      if ((v30 & 0x8000000000000000) == 0)
      {
        long long v11 = (int *)&v28;
        if (HIBYTE(v30) != 5)
        {
LABEL_28:
          int v16 = 0;
          if (HIBYTE(v30) == 7) {
            goto LABEL_52;
          }
          if (HIBYTE(v30) != 8) {
            goto LABEL_82;
          }
          goto LABEL_47;
        }
        goto LABEL_33;
      }
      uint64_t v12 = v29;
      if (v29 == 5)
      {
        long long v11 = (int *)v28;
LABEL_33:
        int v17 = *v11;
        int v18 = *((unsigned __int8 *)v11 + 4);
        if (v17 == 1701011814 && v18 == 116)
        {
          StlConverter::addNormal((uint64_t)a1, v31);
          char v4 = 1;
          goto LABEL_82;
        }
        if ((v30 & 0x8000000000000000) == 0)
        {
          if (HIBYTE(v30) != 5) {
            goto LABEL_82;
          }
          int v16 = 0;
          long long v11 = (int *)&v28;
          goto LABEL_68;
        }
        uint64_t v12 = v29;
      }
LABEL_45:
      if (v12 != 8) {
        goto LABEL_50;
      }
      int v16 = 1;
      long long v11 = (int *)v28;
LABEL_47:
      if (*(void *)v11 == 0x7465636166646E65)
      {
        char v4 = 0;
LABEL_61:
        char v5 = 0;
        goto LABEL_82;
      }
      if (!v16)
      {
        long long v11 = (int *)&v28;
        if (HIBYTE(v30) == 5) {
          goto LABEL_68;
        }
        if (HIBYTE(v30) != 7)
        {
LABEL_66:
          if (HIBYTE(v30) != 8) {
            goto LABEL_82;
          }
          goto LABEL_80;
        }
        goto LABEL_52;
      }
      uint64_t v12 = v29;
LABEL_50:
      if (v12 != 7) {
        goto LABEL_58;
      }
      int v16 = 1;
      long long v11 = (int *)v28;
LABEL_52:
      int v20 = *v11;
      int v21 = *(int *)((char *)v11 + 3);
      if (v20 == 1818521189 && v21 == 1886351212) {
        goto LABEL_61;
      }
      if (v16)
      {
        uint64_t v12 = v29;
LABEL_58:
        if (v12 != 5) {
          goto LABEL_74;
        }
        int v16 = 1;
        long long v11 = (int *)v28;
        goto LABEL_68;
      }
      long long v11 = (int *)&v28;
      if (HIBYTE(v30) != 5) {
        goto LABEL_66;
      }
      int v16 = 0;
LABEL_68:
      int v23 = *v11;
      int v24 = *((unsigned __int8 *)v11 + 4);
      if (v23 != 1768714099 || v24 != 100)
      {
        if (v16)
        {
          uint64_t v12 = v29;
LABEL_74:
          if (v12 != 8) {
            goto LABEL_82;
          }
          long long v11 = (int *)v28;
        }
        else
        {
          if (HIBYTE(v30) != 8) {
            goto LABEL_82;
          }
          long long v11 = (int *)&v28;
        }
LABEL_80:
        if (*(void *)v11 == 0x64696C6F73646E65) {
          a1[4] = 0;
        }
        goto LABEL_82;
      }
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v27 = 0;
      sub_100005C4C(v31, (uint64_t)__p);
      StlConverter::addSolid(a1, (uint64_t *)__p);
      if (SHIBYTE(v27) < 0) {
        operator delete(__p[0]);
      }
LABEL_82:
      if (SHIBYTE(v30) < 0) {
        operator delete(v28);
      }
    }
  }
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v33.__r_.__value_.__l.__data_);
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  std::ios::~ios();
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

void sub_10000B854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  sub_100006360((uint64_t)&a21);
  if (*(char *)(v21 - 89) < 0) {
    operator delete(*(void **)(v21 - 112));
  }
  _Unwind_Resume(a1);
}

void StlConverter::parseStlBinary(void *a1)
{
  StlConverter::addSolid(a1, a1 + 5);
  std::istream::read();
  int v2 = 0;
  std::istream::read();
  sub_100006C54((uint64_t *)(a1[4] + 48), 0);
  sub_100006C54((uint64_t *)(a1[4] + 24), 0);
}

void StlConverter::createMesh(uint64_t a1, const void **a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = (char *)(a3 + 72);
  if (*(void *)(a3 + 80) != *(void *)(a3 + 72))
  {
    unint64_t v10 = (char *)operator new(0x128uLL);
    sub_100007054(a2, 47, (uint64_t)&__p);
    int v11 = *(char *)(a3 + 23);
    if (v11 >= 0) {
      uint64_t v12 = (const std::string::value_type *)a3;
    }
    else {
      uint64_t v12 = *(const std::string::value_type **)a3;
    }
    if (v11 >= 0) {
      std::string::size_type v13 = *(unsigned __int8 *)(a3 + 23);
    }
    else {
      std::string::size_type v13 = *(void *)(a3 + 8);
    }
    int v14 = std::string::append(&__p, v12, v13);
    int v16 = (void *)v14->__r_.__value_.__r.__words[0];
    unint64_t size = v14->__r_.__value_.__l.__size_;
    v46[0] = v14->__r_.__value_.__r.__words[2];
    *(_DWORD *)((char *)v46 + 3) = *(_DWORD *)((char *)&v14->__r_.__value_.__r.__words[2] + 3);
    int v17 = SHIBYTE(v14->__r_.__value_.__r.__words[2]);
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    *(void *)unint64_t v10 = off_1000185C8;
    *((_DWORD *)v10 + 2) = 4;
    if (v17 < 0)
    {
      sub_100007814(v10 + 16, v16, size);
    }
    else
    {
      *((void *)v10 + 2) = v16;
      *((void *)v10 + 3) = size;
      *((_DWORD *)v10 + 8) = v46[0];
      *(_DWORD *)(v10 + 35) = *(_DWORD *)((char *)v46 + 3);
      v10[39] = v17;
    }
    *((void *)v10 + 5) = 0;
    *((void *)v10 + 6) = 0;
    *((void *)v10 + 7) = 0;
    *(void *)unint64_t v10 = &off_100018698;
    *((_OWORD *)v10 + 4) = 0u;
    *((void *)v10 + 35) = 0;
    *((void *)v10 + 36) = 0;
    *((void *)v10 + 34) = 0;
    *((_OWORD *)v10 + 5) = 0u;
    *((_OWORD *)v10 + 6) = 0u;
    *((_OWORD *)v10 + 7) = 0u;
    *((_OWORD *)v10 + 8) = 0u;
    *((_OWORD *)v10 + 9) = 0u;
    *((_OWORD *)v10 + 10) = 0u;
    *((_OWORD *)v10 + 11) = 0u;
    *((_OWORD *)v10 + 12) = 0u;
    *((_OWORD *)v10 + 13) = 0u;
    *((_OWORD *)v10 + 14) = 0u;
    *((_OWORD *)v10 + 15) = 0u;
    *(_OWORD *)(v10 + 252) = 0u;
    if (v17 < 0) {
      operator delete(v16);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    unint64_t v18 = a5[7];
    uint64_t v19 = (void *)a5[6];
    if ((unint64_t)v19 >= v18)
    {
      uint64_t v21 = a5[5];
      uint64_t v22 = ((uint64_t)v19 - v21) >> 3;
      if ((unint64_t)(v22 + 1) >> 61) {
        sub_100007E2C();
      }
      uint64_t v23 = v18 - v21;
      uint64_t v24 = v23 >> 2;
      if (v23 >> 2 <= (unint64_t)(v22 + 1)) {
        uint64_t v24 = v22 + 1;
      }
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v25 = v24;
      }
      if (v25) {
        int v26 = (char *)sub_100008F20((uint64_t)(a5 + 7), v25);
      }
      else {
        int v26 = 0;
      }
      uint64_t v27 = &v26[8 * v22];
      float v28 = &v26[8 * v25];
      *(void *)uint64_t v27 = v10;
      int v20 = v27 + 8;
      uint64_t v30 = (char *)a5[5];
      uint64_t v29 = (char *)a5[6];
      if (v29 != v30)
      {
        do
        {
          uint64_t v31 = *((void *)v29 - 1);
          v29 -= 8;
          *((void *)v27 - 1) = v31;
          v27 -= 8;
        }
        while (v29 != v30);
        uint64_t v29 = (char *)a5[5];
      }
      a5[5] = v27;
      a5[6] = v20;
      a5[7] = v28;
      if (v29) {
        operator delete(v29);
      }
    }
    else
    {
      *uint64_t v19 = v10;
      int v20 = v19 + 1;
    }
    a5[6] = v20;
    if (v10 + 64 != v5) {
      sub_100008BDC(v10 + 64, *(char **)(a3 + 72), *(void *)(a3 + 80), (uint64_t)(*(void *)(a3 + 80) - *(void *)(a3 + 72)) >> 2);
    }
    if (v10 + 160 != (char *)(a3 + 24)) {
      sub_1000089C8((void *)v10 + 20, *(uint64_t **)(a3 + 24), *(uint64_t **)(a3 + 32), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 32) - *(void *)(a3 + 24)) >> 2));
    }
    long long v32 = (void **)(v10 + 88);
    sub_100006D78((void **)v10 + 11, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 32) - *(void *)(a3 + 24)) >> 2));
    if (*(void *)(a3 + 32) != *(void *)(a3 + 24))
    {
      unint64_t v33 = 0;
      long long v34 = v10 + 104;
      long long v35 = (char *)*((void *)v10 + 12);
      do
      {
        if ((unint64_t)v35 >= *v34)
        {
          std::string v37 = (char *)*v32;
          uint64_t v38 = (v35 - (unsigned char *)*v32) >> 2;
          unint64_t v39 = v38 + 1;
          if ((unint64_t)(v38 + 1) >> 62) {
            sub_100007E2C();
          }
          uint64_t v40 = *v34 - (void)v37;
          if (v40 >> 1 > v39) {
            unint64_t v39 = v40 >> 1;
          }
          if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v41 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v41 = v39;
          }
          if (v41)
          {
            uint64_t v42 = (char *)sub_100008908((uint64_t)(v10 + 104), v41);
            std::string v37 = (char *)*((void *)v10 + 11);
            long long v35 = (char *)*((void *)v10 + 12);
          }
          else
          {
            uint64_t v42 = 0;
          }
          std::string v43 = &v42[4 * v38];
          *(_DWORD *)std::string v43 = v33;
          std::string v36 = v43 + 4;
          while (v35 != v37)
          {
            int v44 = *((_DWORD *)v35 - 1);
            v35 -= 4;
            *((_DWORD *)v43 - 1) = v44;
            v43 -= 4;
          }
          *((void *)v10 + 11) = v43;
          *((void *)v10 + 12) = v36;
          *((void *)v10 + 13) = &v42[4 * v41];
          if (v37) {
            operator delete(v37);
          }
        }
        else
        {
          *(_DWORD *)long long v35 = v33;
          std::string v36 = v35 + 4;
        }
        *((void *)v10 + 12) = v36;
        ++v33;
        long long v35 = v36;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 32) - *(void *)(a3 + 24)) >> 2) > v33);
    }
    if (v10 + 184 != (char *)(a3 + 48)) {
      sub_1000089C8((void *)v10 + 23, *(uint64_t **)(a3 + 48), *(uint64_t **)(a3 + 56), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 56) - *(void *)(a3 + 48)) >> 2));
    }
    *((_DWORD *)v10 + 64) = 1;
    std::string::operator=((std::string *)(v10 + 272), (const std::string *)(a4 + 16));
  }
}

void sub_10000BF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  operator delete(v15);
  if (a14 < 0) {
    operator delete(__p);
  }
  operator delete(v14);
  _Unwind_Resume(a1);
}

uint64_t StlConverter::makeStage(StlConverter *this)
{
  if (*((char *)this + 63) < 0)
  {
    sub_100007814(__p, *((void **)this + 5), *((void *)this + 6));
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)((char *)this + 40);
    uint64_t v32 = *((void *)this + 7);
  }
  fileFormatUtils::makeValidIdentifier((uint64_t *)__p, &v34);
  long long v37 = 0u;
  *(_OWORD *)std::string v36 = 0u;
  *(_OWORD *)long long v35 = 0u;
  if (SHIBYTE(v32) < 0) {
    operator delete(__p[0]);
  }
  uint64_t inited = fileFormatUtils::Asset::initStage((fileFormatUtils::Asset *)v33);
  *(_DWORD *)(inited + 88) = 981668463;
  fileFormatUtils::Asset::getMaterialsPath((fileFormatUtils::Asset *)v33, (uint64_t)v29);
  uint64_t v3 = (char *)operator new(0x40uLL);
  if ((v30 & 0x80u) == 0) {
    size_t v4 = v30;
  }
  else {
    size_t v4 = (size_t)v29[1];
  }
  char v5 = v27;
  sub_100008940((uint64_t)v27, v4 + 8);
  if (v28 < 0) {
    char v5 = (void **)v27[0];
  }
  if (v4)
  {
    if ((v30 & 0x80u) == 0) {
      uint64_t v6 = v29;
    }
    else {
      uint64_t v6 = (void **)v29[0];
    }
    memmove(v5, v6, v4);
  }
  strcpy((char *)v5 + v4, "/default");
  *(void *)uint64_t v3 = off_1000185C8;
  *((_DWORD *)v3 + 2) = 6;
  long long v7 = v3 + 16;
  if (SHIBYTE(v28) < 0)
  {
    sub_100007814(v7, v27[0], (unint64_t)v27[1]);
    int v8 = SHIBYTE(v28);
    *((void *)v3 + 6) = 0;
    *((void *)v3 + 7) = 0;
    *((void *)v3 + 5) = 0;
    *(void *)uint64_t v3 = &off_100018728;
    if (v8 < 0) {
      operator delete(v27[0]);
    }
  }
  else
  {
    *(_OWORD *)long long v7 = *(_OWORD *)v27;
    *((void *)v3 + 4) = v28;
    *((void *)v3 + 6) = 0;
    *((void *)v3 + 7) = 0;
    *((void *)v3 + 5) = 0;
    *(void *)uint64_t v3 = &off_100018728;
  }
  unint64_t v9 = *(void *)(inited + 56);
  unint64_t v10 = *(void **)(inited + 48);
  if ((unint64_t)v10 >= v9)
  {
    uint64_t v12 = *(void *)(inited + 40);
    uint64_t v13 = ((uint64_t)v10 - v12) >> 3;
    if ((unint64_t)(v13 + 1) >> 61) {
      sub_100007E2C();
    }
    uint64_t v14 = v9 - v12;
    uint64_t v15 = v14 >> 2;
    if (v14 >> 2 <= (unint64_t)(v13 + 1)) {
      uint64_t v15 = v13 + 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v16) {
      int v17 = (char *)sub_100008F20(inited + 56, v16);
    }
    else {
      int v17 = 0;
    }
    unint64_t v18 = &v17[8 * v13];
    uint64_t v19 = &v17[8 * v16];
    *(void *)unint64_t v18 = v3;
    int v11 = v18 + 8;
    uint64_t v21 = *(char **)(inited + 40);
    int v20 = *(char **)(inited + 48);
    if (v20 != v21)
    {
      do
      {
        uint64_t v22 = *((void *)v20 - 1);
        v20 -= 8;
        *((void *)v18 - 1) = v22;
        v18 -= 8;
      }
      while (v20 != v21);
      int v20 = *(char **)(inited + 40);
    }
    *(void *)(inited + 40) = v18;
    *(void *)(inited + 48) = v11;
    *(void *)(inited + 56) = v19;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    *unint64_t v10 = v3;
    int v11 = v10 + 1;
  }
  *(void *)(inited + 48) = v11;
  fileFormatUtils::Asset::getGeomPath((fileFormatUtils::Asset *)v33, (uint64_t)v27);
  unint64_t v25 = (uint64_t *)*((void *)this + 1);
  uint64_t v24 = (uint64_t *)*((void *)this + 2);
  while (v25 != v24)
    StlConverter::createMesh(v23, (const void **)v27, *v25++, (uint64_t)v3, (void *)inited);
  if (SHIBYTE(v28) < 0) {
    operator delete(v27[0]);
  }
  if ((char)v30 < 0) {
    operator delete(v29[0]);
  }
  if (SHIBYTE(v37) < 0) {
    operator delete(v36[1]);
  }
  if (SHIBYTE(v36[0]) < 0) {
    operator delete(v35[0]);
  }
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v34.__r_.__value_.__l.__data_);
  }
  return inited;
}

void sub_10000C2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  operator delete(v27);
  if (a20 < 0) {
    operator delete(a15);
  }
  sub_1000076D0((uint64_t)&a27);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C348(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 2);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x1555555555555555) {
    sub_100007E2C();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 2);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0xAAAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x1555555555555555;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v19 = a1 + 2;
  unint64_t v10 = (char *)sub_100007E44(v7, v9);
  int v11 = &v10[12 * v4];
  std::string __p = v10;
  unint64_t v16 = v11;
  unint64_t v18 = &v10[12 * v12];
  *(void *)int v11 = *(void *)a2;
  *((_DWORD *)v11 + 2) = *(_DWORD *)(a2 + 8);
  int v17 = v11 + 12;
  sub_1000086A4(a1, &__p);
  uint64_t v13 = a1[1];
  if (v17 != v16) {
    int v17 = &v16[(v17 - v16 - 12) % 0xCuLL];
  }
  if (__p) {
    operator delete(__p);
  }
  return v13;
}

void sub_10000C468(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ObjConverter::Group::removeLastSubMaterialIfEmpty(ObjConverter::Group *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1 != *(void *)this)
  {
    uint64_t v3 = *(void ***)(v1 - 8);
    unint64_t v4 = v3[1];
    if (v4 == *v3)
    {
      if (v4) {
        operator delete(v4);
      }
      operator delete(v3);
      *((void *)this + 1) -= 8;
    }
  }
}

void ObjConverter::Group::setMaterial(ObjConverter::Group *this, int a2)
{
  *((void *)this + 3) = 0;
  for (uint64_t i = *(char **)this; i != *((char **)this + 1); i += 8)
  {
    if (*(_DWORD *)(*(void *)i + 24) == a2)
    {
      *((void *)this + 3) = *(void *)i;
      return;
    }
  }
  ObjConverter::Group::removeLastSubMaterialIfEmpty(this);
  unint64_t v5 = operator new(0x20uLL);
  v5[1] = 0;
  v5[2] = 0;
  *unint64_t v5 = 0;
  *((_DWORD *)v5 + 6) = a2;
  unint64_t v6 = *((void *)this + 2);
  *((void *)this + 3) = v5;
  uint64_t v7 = (void *)*((void *)this + 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = ((uint64_t)v7 - *(void *)this) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      sub_100007E2C();
    }
    uint64_t v10 = v6 - *(void *)this;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12)
    {
      uint64_t v13 = (char *)sub_100008F20((uint64_t)this + 16, v12);
      unint64_t v5 = (void *)*((void *)this + 3);
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)uint64_t v14 = v5;
    unint64_t v8 = v14 + 8;
    int v17 = *(char **)this;
    unint64_t v16 = (char *)*((void *)this + 1);
    if (v16 != *(char **)this)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *((void *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      unint64_t v16 = *(char **)this;
    }
    *(void *)this = v14;
    *((void *)this + 1) = v8;
    *((void *)this + 2) = v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    *uint64_t v7 = v5;
    unint64_t v8 = v7 + 1;
  }
  *((void *)this + 1) = v8;
}

void ObjConverter::Group::appendIndices(ObjConverter::Group *this, int a2, int a3, int a4)
{
  unint64_t v8 = (char *)this + 48;
  unint64_t v9 = *((void *)this + 6);
  uint64_t v10 = (char *)*((void *)this + 5);
  if ((unint64_t)v10 >= v9)
  {
    unint64_t v12 = (char *)*((void *)this + 4);
    uint64_t v13 = (v10 - v12) >> 2;
    if ((unint64_t)(v13 + 1) >> 62) {
      goto LABEL_50;
    }
    unint64_t v14 = v9 - (void)v12;
    unint64_t v15 = (uint64_t)(v9 - (void)v12) >> 1;
    if (v15 <= v13 + 1) {
      unint64_t v15 = v13 + 1;
    }
    if (v14 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v16)
    {
      int v17 = (char *)sub_100008908((uint64_t)v8, v16);
      unint64_t v12 = (char *)*((void *)this + 4);
      uint64_t v10 = (char *)*((void *)this + 5);
    }
    else
    {
      int v17 = 0;
    }
    uint64_t v18 = &v17[4 * v13];
    uint64_t v19 = &v17[4 * v16];
    *(_DWORD *)uint64_t v18 = a2;
    uint64_t v11 = v18 + 4;
    while (v10 != v12)
    {
      int v20 = *((_DWORD *)v10 - 1);
      v10 -= 4;
      *((_DWORD *)v18 - 1) = v20;
      v18 -= 4;
    }
    *((void *)this + 4) = v18;
    *((void *)this + 5) = v11;
    *((void *)this + 6) = v19;
    if (v12) {
      operator delete(v12);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v10 = a2;
    uint64_t v11 = v10 + 4;
  }
  unint64_t v21 = *((void *)this + 9);
  *((void *)this + 5) = v11;
  uint64_t v22 = (char *)*((void *)this + 8);
  if ((unint64_t)v22 >= v21)
  {
    uint64_t v24 = (char *)*((void *)this + 7);
    uint64_t v25 = (v22 - v24) >> 2;
    if ((unint64_t)(v25 + 1) >> 62) {
      goto LABEL_50;
    }
    unint64_t v26 = v21 - (void)v24;
    unint64_t v27 = (uint64_t)(v21 - (void)v24) >> 1;
    if (v27 <= v25 + 1) {
      unint64_t v27 = v25 + 1;
    }
    if (v26 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v28 = v27;
    }
    if (v28)
    {
      uint64_t v29 = (char *)sub_100008908((uint64_t)this + 72, v28);
      uint64_t v24 = (char *)*((void *)this + 7);
      uint64_t v22 = (char *)*((void *)this + 8);
    }
    else
    {
      uint64_t v29 = 0;
    }
    unsigned __int8 v30 = &v29[4 * v25];
    uint64_t v31 = &v29[4 * v28];
    *(_DWORD *)unsigned __int8 v30 = a3;
    uint64_t v23 = v30 + 4;
    while (v22 != v24)
    {
      int v32 = *((_DWORD *)v22 - 1);
      v22 -= 4;
      *((_DWORD *)v30 - 1) = v32;
      v30 -= 4;
    }
    *((void *)this + 7) = v30;
    *((void *)this + 8) = v23;
    *((void *)this + 9) = v31;
    if (v24) {
      operator delete(v24);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v22 = a3;
    uint64_t v23 = v22 + 4;
  }
  unint64_t v33 = *((void *)this + 13);
  *((void *)this + 8) = v23;
  std::string v34 = (char *)*((void *)this + 12);
  if ((unint64_t)v34 < v33)
  {
    *(_DWORD *)std::string v34 = a4;
    long long v35 = v34 + 4;
    goto LABEL_49;
  }
  std::string v36 = (char *)*((void *)this + 11);
  uint64_t v37 = (v34 - v36) >> 2;
  if ((unint64_t)(v37 + 1) >> 62) {
LABEL_50:
  }
    sub_100007E2C();
  unint64_t v38 = v33 - (void)v36;
  unint64_t v39 = (uint64_t)(v33 - (void)v36) >> 1;
  if (v39 <= v37 + 1) {
    unint64_t v39 = v37 + 1;
  }
  if (v38 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v40 = v39;
  }
  if (v40)
  {
    unint64_t v41 = (char *)sub_100008908((uint64_t)this + 104, v40);
    std::string v36 = (char *)*((void *)this + 11);
    std::string v34 = (char *)*((void *)this + 12);
  }
  else
  {
    unint64_t v41 = 0;
  }
  uint64_t v42 = &v41[4 * v37];
  std::string v43 = &v41[4 * v40];
  *(_DWORD *)uint64_t v42 = a4;
  long long v35 = v42 + 4;
  while (v34 != v36)
  {
    int v44 = *((_DWORD *)v34 - 1);
    v34 -= 4;
    *((_DWORD *)v42 - 1) = v44;
    v42 -= 4;
  }
  *((void *)this + 11) = v42;
  *((void *)this + 12) = v35;
  *((void *)this + 13) = v43;
  if (v36) {
    operator delete(v36);
  }
LABEL_49:
  *((void *)this + 12) = v35;
}

uint64_t ObjConverter::ObjConverter(uint64_t a1, void *a2, uint64_t a3, long long *a4, uint64_t a5)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)(a1 + 112) = 0;
  *(void *)a1 = off_100018598;
  *(void *)(a1 + 104) = a1 + 112;
  *(void *)(a1 + 120) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 192) = 0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(void *)(a1 + 176) = 0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(void *)(a1 + 184) = a1 + 192;
  *(void *)(a1 + 208) = -1;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_100007814(__p, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a3;
    uint64_t v14 = *(void *)(a3 + 16);
  }
  fileFormatUtils::makeValidIdentifier((uint64_t *)__p, (std::string *)(a1 + 256));
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
  if (*((char *)a4 + 23) < 0)
  {
    sub_100007814((unsigned char *)(a1 + 328), *(void **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v9 = *a4;
    *(void *)(a1 + 344) = *((void *)a4 + 2);
    *(_OWORD *)(a1 + 328) = v9;
  }
  *(void *)(a1 + 352) = a5;
  sub_10000A63C(v11, (char *)&unk_100017652);
  ObjConverter::setGroup(a1, (uint64_t)v11);
  if (v12 < 0) {
    operator delete(v11[0]);
  }
  ObjConverter::parseObj((uint64_t *)a1, a2);
  return a1;
}

void sub_10000CA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  sub_1000076D0((uint64_t)(v19 + 4));
  unint64_t v21 = *v19;
  if (*v19)
  {
    *(void *)(v15 + 224) = v21;
    operator delete(v21);
  }
  sub_10001193C(v17, *(char **)(v15 + 192));
  sub_100011A44(&__p);
  std::string __p = v19 - 10;
  sub_1000119A0(&__p);
  sub_10001193C(v16, *(char **)(v15 + 112));
  uint64_t v22 = *(void **)(v15 + 80);
  if (v22)
  {
    *(void *)(v15 + 88) = v22;
    operator delete(v22);
  }
  uint64_t v23 = *(void **)(v15 + 56);
  if (v23)
  {
    *(void *)(v15 + 64) = v23;
    operator delete(v23);
  }
  uint64_t v24 = *(void **)(v15 + 32);
  if (v24)
  {
    *(void *)(v15 + 40) = v24;
    operator delete(v24);
  }
  uint64_t v25 = *v18;
  if (*v18)
  {
    *(void *)(v15 + 16) = v25;
    operator delete(v25);
  }
  _Unwind_Resume(a1);
}

void sub_10000CB00(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x10000CA74);
}

void ObjConverter::setGroup(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    unint64_t v3 = *(void *)(a2 + 8);
    if (v3)
    {
      sub_100007814(&__p, *(void **)a2, v3);
      goto LABEL_7;
    }
  }
  else if (*(unsigned char *)(a2 + 23))
  {
    std::string __p = *(std::string *)a2;
    goto LABEL_7;
  }
  sub_10000A63C(&__p, "default");
LABEL_7:
  fileFormatUtils::makeValidIdentifier((uint64_t *)&__p, &v7);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string __p = v7;
  uint64_t v4 = sub_100011B24(a1 + 104, (const void **)&__p.__r_.__value_.__l.__data_);
  if (a1 + 112 == v4)
  {
    unint64_t v6 = operator new(0x90uLL);
    sub_100010BEC((uint64_t)v6, *(_DWORD *)(a1 + 208));
    *(void *)(a1 + 128) = v6;
    v7.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
    sub_100012444((uint64_t **)(a1 + 104), (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (long long **)&v7)[7] = (uint64_t)v6;
  }
  else
  {
    unint64_t v5 = *(ObjConverter::Group **)(v4 + 56);
    *(void *)(a1 + 128) = v5;
    ObjConverter::Group::setMaterial(v5, *(_DWORD *)(a1 + 208));
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_10000CC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  operator delete(v18);
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ObjConverter::parseObj(uint64_t *a1, void *a2)
{
  memset(&__str, 0, sizeof(__str));
  sub_100005AB4((uint64_t)v17);
  while (sub_10000F374(a2, (uint64_t)&__str))
  {
    std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      std::ios_base::clear((std::ios_base *)((char *)v17 + *(void *)(v17[0] - 24)), 0);
      std::string::operator=(&v19, &__str);
      sub_100007D18((uint64_t)&v18);
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      sub_100005C4C(v17, (uint64_t)&v14);
      if (SHIBYTE(v16) < 0)
      {
        uint64_t v7 = v15;
        if (v15 == 1 && *(unsigned char *)v14 == 118)
        {
LABEL_48:
          ObjConverter::addVertex(a1, v17);
          goto LABEL_52;
        }
        if (v15 == 2)
        {
          if (*(_WORD *)v14 == 29814) {
            goto LABEL_43;
          }
          uint64_t v7 = v15;
          if (*(_WORD *)v14 == 28278) {
            goto LABEL_42;
          }
        }
        if (v7 == 1)
        {
          int v8 = *(unsigned __int8 *)v14;
          if (v8 == 102) {
            goto LABEL_44;
          }
          uint64_t v7 = v15;
          if (v15 == 1 && (v8 | 8) == 0x6F) {
            goto LABEL_49;
          }
        }
        if (v7 != 6) {
          goto LABEL_52;
        }
        unint64_t v6 = (unsigned __int16 *)v14;
        if (*(_DWORD *)v14 == 1835365237 && *((_WORD *)v14 + 2) == 27764)
        {
LABEL_45:
          sub_10000F74C(v17, &__p);
          ObjConverter::setMaterial((uint64_t)a1, (uint64_t)&__p);
          goto LABEL_50;
        }
        if (v15 != 6) {
          goto LABEL_52;
        }
        goto LABEL_30;
      }
      switch(HIBYTE(v16))
      {
        case 1u:
          if (v14 <= 0x6Eu)
          {
            if (v14 == 102)
            {
LABEL_44:
              ObjConverter::addFace(a1, v17);
              goto LABEL_52;
            }
            if (v14 != 103) {
              goto LABEL_52;
            }
LABEL_49:
            sub_10000F74C(v17, &__p);
            ObjConverter::setGroup((uint64_t)a1, (uint64_t)&__p);
LABEL_50:
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            goto LABEL_52;
          }
          if (v14 == 111) {
            goto LABEL_49;
          }
          if (v14 == 118) {
            goto LABEL_48;
          }
LABEL_52:
          if (SHIBYTE(v16) < 0) {
            operator delete(v14);
          }
          break;
        case 2u:
          if ((unsigned __int16)v14 == 29814)
          {
LABEL_43:
            ObjConverter::addUV(a1, v17);
            goto LABEL_52;
          }
          if ((unsigned __int16)v14 == 28278)
          {
LABEL_42:
            ObjConverter::addNormal(a1, v17);
            goto LABEL_52;
          }
          goto LABEL_52;
        case 6u:
          if (v14 == 1835365237 && WORD2(v14) == 27764) {
            goto LABEL_45;
          }
          unint64_t v6 = (unsigned __int16 *)&v14;
LABEL_30:
          int v10 = *(_DWORD *)v6;
          int v11 = v6[2];
          if (v10 == 1819047021 && v11 == 25193)
          {
            sub_10000F74C(v17, &__p);
            ObjConverter::loadMaterialFile((uint64_t)a1, (uint64_t)&__p);
            goto LABEL_50;
          }
          goto LABEL_52;
      }
    }
  }
  ObjConverter::checkLastSubMaterials((ObjConverter *)a1);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  std::ios::~ios();
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

void sub_10000D04C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  sub_100006360((uint64_t)&a21);
  if (*(char *)(v21 - 89) < 0) {
    operator delete(*(void **)(v21 - 112));
  }
  _Unwind_Resume(a1);
}

void ObjConverter::~ObjConverter(ObjConverter *this)
{
  *(void *)this = off_100018598;
  int v2 = (char *)this + 104;
  unint64_t v3 = (char *)*((void *)this + 13);
  uint64_t v4 = (char *)this + 112;
  if (v3 != (char *)this + 112)
  {
    do
    {
      uint64_t v5 = *((void *)v3 + 7);
      if (v5)
      {
        unint64_t v6 = (void *)sub_1000109F4(v5);
        operator delete(v6);
      }
      uint64_t v7 = (char *)*((void *)v3 + 1);
      if (v7)
      {
        do
        {
          int v8 = v7;
          uint64_t v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (char *)*((void *)v3 + 2);
          BOOL v9 = *(void *)v8 == (void)v3;
          unint64_t v3 = v8;
        }
        while (!v9);
      }
      unint64_t v3 = v8;
    }
    while (v8 != v4);
  }
  if (*((char *)this + 351) < 0) {
    operator delete(*((void **)this + 41));
  }
  if (*((char *)this + 327) < 0) {
    operator delete(*((void **)this + 38));
  }
  if (*((char *)this + 303) < 0) {
    operator delete(*((void **)this + 35));
  }
  if (*((char *)this + 279) < 0) {
    operator delete(*((void **)this + 32));
  }
  int v10 = (void *)*((void *)this + 27);
  if (v10)
  {
    *((void *)this + 28) = v10;
    operator delete(v10);
  }
  sub_10001193C((uint64_t)this + 184, *((char **)this + 24));
  uint64_t v15 = (void **)((char *)this + 160);
  sub_100011A44(&v15);
  uint64_t v15 = (void **)((char *)this + 136);
  sub_1000119A0(&v15);
  sub_10001193C((uint64_t)v2, *((char **)this + 14));
  int v11 = (void *)*((void *)this + 10);
  if (v11)
  {
    *((void *)this + 11) = v11;
    operator delete(v11);
  }
  char v12 = (void *)*((void *)this + 7);
  if (v12)
  {
    *((void *)this + 8) = v12;
    operator delete(v12);
  }
  uint64_t v13 = (void *)*((void *)this + 4);
  if (v13)
  {
    *((void *)this + 5) = v13;
    operator delete(v13);
  }
  uint64_t v14 = (void *)*((void *)this + 1);
  if (v14)
  {
    *((void *)this + 2) = v14;
    operator delete(v14);
  }
}

{
  void *v1;
  uint64_t vars8;

  ObjConverter::~ObjConverter(this);
  operator delete(v1);
}

void ObjConverter::setMaterial(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    unint64_t v3 = *(void *)(a2 + 8);
    if (v3)
    {
      sub_100007814(&__p, *(void **)a2, v3);
      goto LABEL_7;
    }
  }
  else if (*(unsigned char *)(a2 + 23))
  {
    std::string __p = *(std::string *)a2;
    goto LABEL_7;
  }
  sub_10000A63C(&__p, "white");
LABEL_7:
  fileFormatUtils::makeValidIdentifier((uint64_t *)&__p, &v17);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string __p = v17;
  uint64_t v4 = sub_100011B24(a1 + 184, (const void **)&__p.__r_.__value_.__l.__data_);
  if (a1 + 192 == v4)
  {
    unint64_t v5 = *(void *)(a1 + 144);
    if (v5 >= *(void *)(a1 + 152))
    {
      uint64_t v7 = sub_100011818((uint64_t *)(a1 + 136), (long long *)&__p);
    }
    else
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        sub_100007814(*(unsigned char **)(a1 + 144), __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else
      {
        long long v6 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *(void *)(v5 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
        *(_OWORD *)unint64_t v5 = v6;
      }
      uint64_t v7 = v5 + 24;
      *(void *)(a1 + 144) = v5 + 24;
    }
    *(void *)(a1 + 144) = v7;
    sub_100010AA4(&v17, (long long *)&__p);
    unint64_t v8 = *(void *)(a1 + 168);
    if (v8 >= *(void *)(a1 + 176))
    {
      uint64_t v12 = sub_100011C20((uint64_t *)(a1 + 160), (uint64_t)&v17);
      int v13 = SHIBYTE(v19);
      *(void *)(a1 + 168) = v12;
      if (v13 < 0) {
        operator delete(v18[0]);
      }
    }
    else
    {
      *(void *)unint64_t v8 = v17.__r_.__value_.__r.__words[0];
      std::string::size_type size = v17.__r_.__value_.__l.__size_;
      *(void *)(v8 + 8) = v17.__r_.__value_.__l.__size_;
      unint64_t v10 = v8 + 8;
      std::string::size_type v11 = v17.__r_.__value_.__r.__words[2];
      *(void *)(v8 + 16) = *((void *)&v17.__r_.__value_.__l + 2);
      if (v11)
      {
        *(void *)(size + 16) = v10;
        *(_OWORD *)&v17.__r_.__value_.__l.__data_ = (unint64_t)&v17.__r_.__value_.__l.__size_;
        v17.__r_.__value_.__r.__words[2] = 0;
      }
      else
      {
        *(void *)unint64_t v8 = v10;
      }
      long long v14 = *(_OWORD *)v18;
      *(void *)(v8 + 40) = v19;
      *(_OWORD *)(v8 + 24) = v14;
      v18[1] = 0;
      uint64_t v19 = 0;
      v18[0] = 0;
      *(void *)(a1 + 168) = v8 + 48;
    }
    sub_100010B18((uint64_t)&v17, (void *)v17.__r_.__value_.__l.__size_);
    int v15 = -1431655765 * ((*(void *)(a1 + 144) - *(void *)(a1 + 136)) >> 3) - 1;
    *(_DWORD *)(a1 + 208) = v15;
    v17.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
    *((_DWORD *)sub_100012014((uint64_t **)(a1 + 184), (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (long long **)&v17)+ 14) = v15;
  }
  else
  {
    *(_DWORD *)(a1 + 208) = *(_DWORD *)(v4 + 56);
  }
  uint64_t v16 = *(ObjConverter::Group **)(a1 + 128);
  if (v16) {
    ObjConverter::Group::setMaterial(v16, *(_DWORD *)(a1 + 208));
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_10000D480(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  *(void *)(v20 + 144) = v21;
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000D4C0(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  sub_100010B18(a1, *(void **)(a1 + 8));
  return a1;
}

void ObjConverter::updateMaterial(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    unint64_t v3 = *(void *)(a2 + 8);
    if (v3)
    {
      sub_100007814(&__p, *(void **)a2, v3);
      goto LABEL_7;
    }
  }
  else if (*(unsigned char *)(a2 + 23))
  {
    std::string __p = *(std::string *)a2;
    goto LABEL_7;
  }
  sub_10000A63C(&__p, "white");
LABEL_7:
  fileFormatUtils::makeValidIdentifier((uint64_t *)&__p, &v16);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string __p = v16;
  uint64_t v4 = sub_100011B24(a1 + 184, (const void **)&__p.__r_.__value_.__l.__data_);
  if (a1 + 192 == v4)
  {
    unint64_t v5 = *(void *)(a1 + 144);
    if (v5 >= *(void *)(a1 + 152))
    {
      uint64_t v7 = sub_100011818((uint64_t *)(a1 + 136), (long long *)&__p);
    }
    else
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        sub_100007814(*(unsigned char **)(a1 + 144), __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else
      {
        long long v6 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *(void *)(v5 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
        *(_OWORD *)unint64_t v5 = v6;
      }
      uint64_t v7 = v5 + 24;
      *(void *)(a1 + 144) = v5 + 24;
    }
    *(void *)(a1 + 144) = v7;
    sub_100010AA4(&v16, (long long *)&__p);
    unint64_t v8 = *(void *)(a1 + 168);
    if (v8 >= *(void *)(a1 + 176))
    {
      uint64_t v12 = sub_100011C20((uint64_t *)(a1 + 160), (uint64_t)&v16);
      int v13 = SHIBYTE(v18);
      *(void *)(a1 + 168) = v12;
      if (v13 < 0) {
        operator delete(v17[0]);
      }
    }
    else
    {
      *(void *)unint64_t v8 = v16.__r_.__value_.__r.__words[0];
      std::string::size_type size = v16.__r_.__value_.__l.__size_;
      *(void *)(v8 + 8) = v16.__r_.__value_.__l.__size_;
      unint64_t v10 = v8 + 8;
      std::string::size_type v11 = v16.__r_.__value_.__r.__words[2];
      *(void *)(v8 + 16) = *((void *)&v16.__r_.__value_.__l + 2);
      if (v11)
      {
        *(void *)(size + 16) = v10;
        *(_OWORD *)&v16.__r_.__value_.__l.__data_ = (unint64_t)&v16.__r_.__value_.__l.__size_;
        v16.__r_.__value_.__r.__words[2] = 0;
      }
      else
      {
        *(void *)unint64_t v8 = v10;
      }
      long long v14 = *(_OWORD *)v17;
      *(void *)(v8 + 40) = v18;
      *(_OWORD *)(v8 + 24) = v14;
      v17[1] = 0;
      uint64_t v18 = 0;
      v17[0] = 0;
      *(void *)(a1 + 168) = v8 + 48;
    }
    sub_100010B18((uint64_t)&v16, (void *)v16.__r_.__value_.__l.__size_);
    int v15 = -1431655765 * ((*(void *)(a1 + 144) - *(void *)(a1 + 136)) >> 3) - 1;
    *(_DWORD *)(a1 + 212) = v15;
    v16.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
    *((_DWORD *)sub_100012014((uint64_t **)(a1 + 184), (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (long long **)&v16)+ 14) = v15;
  }
  else
  {
    *(_DWORD *)(a1 + 212) = *(_DWORD *)(v4 + 56);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_10000D718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  *(void *)(v20 + 144) = v21;
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ObjConverter::addVertex(uint64_t *a1, uint64_t *a2)
{
  float Float = fileFormatUtils::getFloat(a2);
  float v5 = fileFormatUtils::getFloat(a2);
  float v6 = fileFormatUtils::getFloat(a2);
  *(float *)std::string v17 = Float;
  *(float *)&v17[1] = v5;
  *(float *)&uint64_t v17[2] = v6;
  uint64_t v7 = (float *)a1[2];
  if ((unint64_t)v7 >= a1[3])
  {
    uint64_t v8 = sub_10000879C(a1 + 1, (uint64_t)v17);
  }
  else
  {
    *uint64_t v7 = Float;
    v7[1] = v5;
    uint64_t v8 = (uint64_t)(v7 + 3);
    v7[2] = v6;
  }
  a1[2] = v8;
  unint64_t v9 = a2[5];
  unint64_t v10 = a2[6];
  if (v9 >= v10)
  {
    uint64_t result = (*(uint64_t (**)(void))(a2[2] + 56))();
    if (!result) {
      return result;
    }
  }
  else
  {
    uint64_t result = v10 - v9;
    if (v10 == v9) {
      return result;
    }
  }
  float v12 = fileFormatUtils::getFloat(a2);
  float v13 = fileFormatUtils::getFloat(a2);
  float v14 = fileFormatUtils::getFloat(a2);
  *(float *)std::string v16 = v12;
  *(float *)&v16[1] = v13;
  *(float *)&v16[2] = v14;
  int v15 = (float *)a1[5];
  if ((unint64_t)v15 >= a1[6])
  {
    uint64_t result = sub_10000879C(a1 + 4, (uint64_t)v16);
  }
  else
  {
    *int v15 = v12;
    v15[1] = v13;
    uint64_t result = (uint64_t)(v15 + 3);
    v15[2] = v14;
  }
  a1[5] = result;
  return result;
}

void ObjConverter::addUV(void *a1, uint64_t *a2)
{
  float Float = fileFormatUtils::getFloat(a2);
  float v5 = fileFormatUtils::getFloat(a2);
  float v6 = v5;
  unint64_t v7 = a1[9];
  uint64_t v8 = (float *)a1[8];
  if ((unint64_t)v8 >= v7)
  {
    uint64_t v10 = a1[7];
    uint64_t v11 = ((uint64_t)v8 - v10) >> 3;
    if ((unint64_t)(v11 + 1) >> 61) {
      sub_100007E2C();
    }
    unint64_t v12 = v7 - v10;
    unint64_t v13 = (uint64_t)(v7 - v10) >> 2;
    if (v13 <= v11 + 1) {
      unint64_t v13 = v11 + 1;
    }
    if (v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    int v15 = (char *)sub_100008F20((uint64_t)(a1 + 9), v14);
    std::string v16 = &v15[8 * v11];
    uint64_t v18 = &v15[8 * v17];
    *(float *)std::string v16 = Float;
    *((float *)v16 + 1) = v6;
    unint64_t v9 = v16 + 8;
    uint64_t v19 = (char *)a1[7];
    for (uint64_t i = (char *)a1[8]; i != v19; i -= 8)
    {
      uint64_t v21 = *((void *)i - 1);
      *((void *)v16 - 1) = v21;
      v16 -= 8;
    }
    a1[7] = v16;
    a1[8] = v9;
    a1[9] = v18;
    if (v19) {
      operator delete(v19);
    }
  }
  else
  {
    *uint64_t v8 = Float;
    v8[1] = v5;
    unint64_t v9 = v8 + 2;
  }
  a1[8] = v9;
}

uint64_t ObjConverter::addNormal(uint64_t *a1, uint64_t *a2)
{
  float Float = fileFormatUtils::getFloat(a2);
  float v5 = fileFormatUtils::getFloat(a2);
  float v6 = fileFormatUtils::getFloat(a2);
  *(float *)unint64_t v9 = Float;
  *(float *)&v9[1] = v5;
  *(float *)&v9[2] = v6;
  unint64_t v7 = (float *)a1[11];
  if ((unint64_t)v7 >= a1[12])
  {
    uint64_t result = sub_10000879C(a1 + 10, (uint64_t)v9);
  }
  else
  {
    *unint64_t v7 = Float;
    v7[1] = v5;
    uint64_t result = (uint64_t)(v7 + 3);
    v7[2] = v6;
  }
  a1[11] = result;
  return result;
}

void ObjConverter::addFace(void *a1, uint64_t *a2)
{
  int v4 = 0;
  int v50 = 0;
  uint64_t v51 = 0;
  unint64_t v52 = 0;
  float v5 = a2 + 2;
  do
  {
    unint64_t v6 = a2[5];
    unint64_t v7 = a2[6];
    if (v6 >= v7) {
      uint64_t v8 = (*(uint64_t (**)(uint64_t *))(*v5 + 56))(v5);
    }
    else {
      uint64_t v8 = v7 - v6;
    }
    if (!v8) {
      break;
    }
    memset(&v49, 0, sizeof(v49));
    sub_100005C4C(a2, (uint64_t)&v49);
    sub_100010C90((uint64_t *)&v50, 0);
    sub_100010D30((void (__cdecl ***)(std::basic_stringstream<char> *__hidden))v55, &v49, 24);
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v54 = 0;
    while (1)
    {
      unint64_t v9 = sub_100007990(v55, (uint64_t)__p, 0x2Fu);
      if ((*((unsigned char *)v9 + *(void *)(*v9 - 24) + 32) & 5) != 0) {
        break;
      }
      uint64_t v10 = v51;
      if ((unint64_t)v51 >= v52)
      {
        unint64_t v12 = (unsigned char *)sub_100011818((uint64_t *)&v50, (long long *)__p);
      }
      else
      {
        if (SHIBYTE(v54) < 0)
        {
          sub_100007814(v51, __p[0], (unint64_t)__p[1]);
        }
        else
        {
          long long v11 = *(_OWORD *)__p;
          *((void *)v51 + 2) = v54;
          *uint64_t v10 = v11;
        }
        unint64_t v12 = (char *)v10 + 24;
      }
      uint64_t v51 = v12;
    }
    if (SHIBYTE(v54) < 0) {
      operator delete(__p[0]);
    }
    v55[0] = v48;
    *(void ***)((char *)v55 + (void)*(v48 - 3)) = v47;
    v55[2] = v46;
    if (v56 < 0) {
      operator delete(v55[11]);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    std::ios::~ios();
    int v13 = sub_10000DFAC(v50, -1431655765 * ((a1[2] - a1[1]) >> 2));
    if (v13 != -1)
    {
      if (0xAAAAAAAAAAAAAAABLL * ((v51 - (unsigned char *)v50) >> 3) < 2)
      {
        int v15 = -1;
      }
      else
      {
        int v14 = sub_10000DFAC(v50 + 3, (a1[8] - a1[7]) >> 3);
        int v15 = v13;
        if (v14 != v13)
        {
          *(unsigned char *)(a1[16] + 80) = 1;
          int v15 = v14;
        }
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v51 - (unsigned char *)v50) >> 3) <= 2)
      {
        uint64_t v17 = (ObjConverter::Group *)a1[16];
        int v16 = -1;
      }
      else
      {
        int v16 = sub_10000DFAC(v50 + 6, -1431655765 * ((a1[11] - a1[10]) >> 2));
        uint64_t v17 = (ObjConverter::Group *)a1[16];
        if (v16 == v13) {
          int v16 = v13;
        }
        else {
          *((unsigned char *)v17 + 112) = 1;
        }
      }
      ObjConverter::Group::appendIndices(v17, v13, v15, v16);
      ++v4;
    }
    if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v49.__r_.__value_.__l.__data_);
    }
  }
  while (v13 != -1);
  if (v4 >= 1)
  {
    uint64_t v18 = (void *)a1[16];
    uint64_t v19 = v18[3];
    uint64_t v20 = (v18[16] - v18[15]) >> 2;
    uint64_t v21 = *(_DWORD **)(v19 + 8);
    unint64_t v22 = *(void *)(v19 + 16);
    if ((unint64_t)v21 >= v22)
    {
      uint64_t v24 = *(_DWORD **)v19;
      uint64_t v25 = ((uint64_t)v21 - *(void *)v19) >> 2;
      unint64_t v26 = v25 + 1;
      if ((unint64_t)(v25 + 1) >> 62) {
        sub_100007E2C();
      }
      uint64_t v27 = v22 - (void)v24;
      if (v27 >> 1 > v26) {
        unint64_t v26 = v27 >> 1;
      }
      if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v28 = v26;
      }
      if (v28)
      {
        uint64_t v29 = (char *)sub_100008908(v19 + 16, v28);
        uint64_t v24 = *(_DWORD **)v19;
        uint64_t v21 = *(_DWORD **)(v19 + 8);
      }
      else
      {
        uint64_t v29 = 0;
      }
      unsigned __int8 v30 = &v29[4 * v25];
      uint64_t v31 = &v29[4 * v28];
      *(_DWORD *)unsigned __int8 v30 = v20;
      uint64_t v23 = v30 + 4;
      while (v21 != v24)
      {
        int v32 = *--v21;
        *((_DWORD *)v30 - 1) = v32;
        v30 -= 4;
      }
      *(void *)uint64_t v19 = v30;
      *(void *)(v19 + 8) = v23;
      *(void *)(v19 + 16) = v31;
      if (v24) {
        operator delete(v24);
      }
    }
    else
    {
      *uint64_t v21 = v20;
      uint64_t v23 = v21 + 1;
    }
    *(void *)(v19 + 8) = v23;
    unint64_t v33 = (void *)a1[16];
    std::string v34 = (int *)v33[16];
    unint64_t v35 = v33[17];
    if ((unint64_t)v34 >= v35)
    {
      uint64_t v37 = (int *)v33[15];
      uint64_t v38 = v34 - v37;
      if ((unint64_t)(v38 + 1) >> 62) {
        sub_100007E2C();
      }
      unint64_t v39 = v35 - (void)v37;
      unint64_t v40 = (uint64_t)(v35 - (void)v37) >> 1;
      if (v40 <= v38 + 1) {
        unint64_t v40 = v38 + 1;
      }
      if (v39 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v41 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v41 = v40;
      }
      if (v41)
      {
        uint64_t v42 = (char *)sub_100008908((uint64_t)(v33 + 17), v41);
        uint64_t v37 = (int *)v33[15];
        std::string v34 = (int *)v33[16];
      }
      else
      {
        uint64_t v42 = 0;
      }
      std::string v43 = (int *)&v42[4 * v38];
      int v44 = &v42[4 * v41];
      int *v43 = v4;
      std::string v36 = v43 + 1;
      while (v34 != v37)
      {
        int v45 = *--v34;
        *--std::string v43 = v45;
      }
      v33[15] = v43;
      v33[16] = v36;
      v33[17] = v44;
      if (v37) {
        operator delete(v37);
      }
    }
    else
    {
      *std::string v34 = v4;
      std::string v36 = v34 + 1;
    }
    v33[16] = v36;
  }
  v55[0] = (void **)&v50;
  sub_1000119A0(v55);
}

void sub_10000DF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,uint64_t a21,uint64_t a22,char *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29)
{
  a23 = &a20;
  sub_1000119A0((void ***)&a23);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DFAC(uint64_t *a1, int a2)
{
  if (*((char *)a1 + 23) < 0)
  {
    if (!a1[1]) {
      return 0xFFFFFFFFLL;
    }
    a1 = (uint64_t *)*a1;
  }
  else if (!*((unsigned char *)a1 + 23))
  {
    return 0xFFFFFFFFLL;
  }
  int v3 = strtol((const char *)a1, 0, 10);
  if (v3 >= 0) {
    int v4 = -1;
  }
  else {
    int v4 = a2;
  }
  int v5 = v4 + v3;
  if (v5 >= a2 || v5 <= -1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v5;
  }
}

void ObjConverter::checkLastSubMaterials(ObjConverter *this)
{
  uint64_t v1 = (char *)*((void *)this + 13);
  int v2 = (char *)this + 112;
  if (v1 != (char *)this + 112)
  {
    do
    {
      int v3 = (ObjConverter::Group *)*((void *)v1 + 7);
      if (*((void *)v3 + 1) - *(void *)v3 >= 9uLL) {
        ObjConverter::Group::removeLastSubMaterialIfEmpty(v3);
      }
      int v4 = (char *)*((void *)v1 + 1);
      if (v4)
      {
        do
        {
          int v5 = v4;
          int v4 = *(char **)v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          int v5 = (char *)*((void *)v1 + 2);
          BOOL v6 = *(void *)v5 == (void)v1;
          uint64_t v1 = v5;
        }
        while (!v6);
      }
      uint64_t v1 = v5;
    }
    while (v5 != v2);
  }
}

void ObjConverter::loadMaterialFile(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100007814(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    *(void *)&__p[16] = *(void *)(a2 + 16);
  }
  int v3 = (const std::string *)(a1 + 328);
  if (*(char *)(a1 + 351) < 0)
  {
    std::string::size_type v4 = *(void *)(a1 + 336);
    if (!v4) {
      goto LABEL_35;
    }
    uint64_t v5 = v3->__r_.__value_.__r.__words[0];
  }
  else
  {
    std::string::size_type v4 = *(unsigned __int8 *)(a1 + 351);
    if (!*(unsigned char *)(a1 + 351)) {
      goto LABEL_35;
    }
    uint64_t v5 = a1 + 328;
  }
  uint64_t v6 = v5 - 1;
  while (v4)
  {
    int v7 = *(unsigned __int8 *)(v6 + v4--);
    if (v7 == 47)
    {
      if (v4 != -1)
      {
        std::string::basic_string(&v19, v3, 0, v4, (std::allocator<char> *)&v17);
        if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v19.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v19.__r_.__value_.__l.__size_;
        }
        unint64_t v9 = &v17;
        sub_100008940((uint64_t)&v17, size + 1);
        if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          unint64_t v9 = (std::string *)v17.__r_.__value_.__r.__words[0];
        }
        if (size)
        {
          if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v10 = &v19;
          }
          else {
            uint64_t v10 = (std::string *)v19.__r_.__value_.__r.__words[0];
          }
          memmove(v9, v10, size);
        }
        *(_WORD *)((char *)&v9->__r_.__value_.__l.__data_ + size) = 47;
        if (__p[23] >= 0) {
          long long v11 = __p;
        }
        else {
          long long v11 = *(const std::string::value_type **)__p;
        }
        if (__p[23] >= 0) {
          std::string::size_type v12 = __p[23];
        }
        else {
          std::string::size_type v12 = *(void *)&__p[8];
        }
        int v13 = std::string::append(&v17, v11, v12);
        std::string::size_type v14 = v13->__r_.__value_.__r.__words[0];
        v21[0] = v13->__r_.__value_.__l.__size_;
        *(void *)((char *)v21 + 7) = *(std::string::size_type *)((char *)&v13->__r_.__value_.__r.__words[1] + 7);
        char v15 = HIBYTE(v13->__r_.__value_.__r.__words[2]);
        v13->__r_.__value_.__l.__size_ = 0;
        v13->__r_.__value_.__r.__words[2] = 0;
        v13->__r_.__value_.__r.__words[0] = 0;
        if ((__p[23] & 0x80000000) != 0) {
          operator delete(*(void **)__p);
        }
        *(void *)std::string __p = v14;
        *(void *)&__p[8] = v21[0];
        *(void *)&__p[15] = *(void *)((char *)v21 + 7);
        __p[23] = v15;
        if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v17.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v19.__r_.__value_.__l.__data_);
        }
      }
      break;
    }
  }
LABEL_35:
  if (__p[23] >= 0) {
    int v16 = __p;
  }
  else {
    int v16 = *(const char **)__p;
  }
  XpcSandbox::consume(*(xpc_connection_t **)(a1 + 352), v16);
  sub_10000E3E4((void (__cdecl ***)(std::ifstream *__hidden))&v19);
  if (v20) {
    ObjConverter::parseMtl(a1, &v19);
  }
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
}

void sub_10000E378(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

void (__cdecl ***sub_10000E3E4(void (__cdecl ***a1)(std::ifstream *__hidden this)))(std::ifstream *__hidden this)
{
  *a1 = v3;
  *(void *)((char *)*(v3 - 3) + (void)a1) = v2;
  a1[1] = 0;
  std::string::size_type v4 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v4, a1 + 2);
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf();
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)*(*a1 - 3) + (void)a1), *(_DWORD *)((char *)*(*a1 - 3) + (void)a1 + 32) | 4);
  }
  return a1;
}

void sub_10000E570(_Unwind_Exception *a1)
{
}

void ObjConverter::parseMtl(uint64_t a1, void *a2)
{
  memset(&__str, 0, sizeof(__str));
  sub_100005AB4((uint64_t)v20);
  while (sub_10000F374(a2, (uint64_t)&__str))
  {
    std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      std::ios_base::clear((std::ios_base *)((char *)v20 + *(void *)(v20[0] - 24)), 0);
      std::string::operator=(&v22, &__str);
      sub_100007D18((uint64_t)&v21);
      std::string v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      sub_100005C4C(v20, (uint64_t)&v17);
      if ((SHIBYTE(v19) & 0x80000000) == 0)
      {
        switch(HIBYTE(v19))
        {
          case 1:
            goto LABEL_77;
          case 2:
            goto LABEL_8;
          case 4:
            if (v17 == 1886221666) {
              goto LABEL_72;
            }
            if (HIBYTE(v19) == 1) {
              goto LABEL_77;
            }
            if (HIBYTE(v19) != 2) {
              goto LABEL_88;
            }
LABEL_8:
            if ((unsigned __int16)v17 == 25675) {
              goto LABEL_73;
            }
            if (HIBYTE(v19) == 1)
            {
LABEL_77:
              if (v17 != 100) {
                goto LABEL_88;
              }
              goto LABEL_78;
            }
LABEL_83:
            if (HIBYTE(v19) != 2) {
              goto LABEL_88;
            }
LABEL_84:
            if ((unsigned __int16)v17 == 28513) {
              goto LABEL_99;
            }
LABEL_85:
            if (HIBYTE(v19) != 2) {
              goto LABEL_88;
            }
            uint64_t v10 = &v17;
            break;
          case 5:
LABEL_79:
            if (v17 == 1601200493 && BYTE4(v17) == 100) {
              goto LABEL_94;
            }
            goto LABEL_83;
          case 6:
            if (v17 == 1836541294 && WORD2(v17) == 27764) {
              goto LABEL_74;
            }
LABEL_60:
            if (v17 != 1601200493 || WORD2(v17) != 25675)
            {
              switch(HIBYTE(v19))
              {
                case 1:
                  goto LABEL_77;
                case 2:
                  goto LABEL_84;
                case 5:
                  goto LABEL_79;
                case 6:
                  if (v17 != 1601200493 || WORD2(v17) != 28513) {
                    goto LABEL_85;
                  }
                  goto LABEL_70;
                default:
                  goto LABEL_88;
              }
            }
            goto LABEL_75;
          case 8:
            if (v17 != (void *)0x706D75625F70616DLL)
            {
              switch(HIBYTE(v19))
              {
                case 1:
                  goto LABEL_77;
                case 2:
                  goto LABEL_8;
                case 5:
                  goto LABEL_79;
                case 6:
                  goto LABEL_60;
                default:
                  goto LABEL_88;
              }
            }
            goto LABEL_72;
          default:
            goto LABEL_88;
        }
LABEL_87:
        if (*v10 == 25931)
        {
          int v14 = 3;
          goto LABEL_103;
        }
        goto LABEL_88;
      }
      uint64_t v5 = v18;
      if (v18 == 4)
      {
        if (*(_DWORD *)v17 == 1886221666) {
          goto LABEL_72;
        }
        uint64_t v5 = v18;
      }
      else if (v18 == 6 && *(_DWORD *)v17 == 1836541294 && *((_WORD *)v17 + 2) == 27764)
      {
LABEL_74:
        sub_10000F74C(v20, &__p);
        ObjConverter::updateMaterial(a1, (uint64_t)&__p);
        goto LABEL_95;
      }
      if (v5 == 8)
      {
        if (*(void *)v17 == 0x706D75625F70616DLL)
        {
LABEL_72:
          sub_10000F74C(v20, &__p);
          ObjConverter::addMapToMaterial(a1, 0, &__p);
          goto LABEL_95;
        }
        uint64_t v5 = v18;
      }
      if (v5 == 2)
      {
        if (*(_WORD *)v17 == 25675)
        {
LABEL_73:
          int v14 = 1;
LABEL_103:
          ObjConverter::addInputToMaterial(a1, v14);
          goto LABEL_104;
        }
        uint64_t v5 = v18;
      }
      if (v5 == 6)
      {
        if (*(_DWORD *)v17 == 1601200493 && *((_WORD *)v17 + 2) == 25675)
        {
LABEL_75:
          sub_10000F74C(v20, &__p);
          ObjConverter::addMapToMaterial(a1, 1, &__p);
          goto LABEL_95;
        }
        uint64_t v5 = v18;
      }
      if (v5 == 1)
      {
        if (*(unsigned char *)v17 == 100)
        {
LABEL_78:
          int v14 = 2;
          goto LABEL_103;
        }
        uint64_t v5 = v18;
      }
      if (v5 == 5)
      {
        if (*(_DWORD *)v17 == 1601200493 && *((unsigned char *)v17 + 4) == 100)
        {
LABEL_94:
          sub_10000F74C(v20, &__p);
          ObjConverter::addMapToMaterial(a1, 2, &__p);
          goto LABEL_95;
        }
        uint64_t v5 = v18;
      }
      if (v5 == 2)
      {
        if (*(_WORD *)v17 == 28513)
        {
LABEL_99:
          int v14 = 4;
          goto LABEL_103;
        }
        uint64_t v5 = v18;
      }
      if (v5 == 6)
      {
        if (*(_DWORD *)v17 == 1601200493 && *((_WORD *)v17 + 2) == 28513)
        {
LABEL_70:
          sub_10000F74C(v20, &__p);
          ObjConverter::addMapToMaterial(a1, 4, &__p);
          goto LABEL_95;
        }
        uint64_t v5 = v18;
      }
      if (v5 == 2)
      {
        uint64_t v10 = v17;
        goto LABEL_87;
      }
LABEL_88:
      if (sub_100005F1C(&v17, "map_Ke"))
      {
        sub_10000F74C(v20, &__p);
        ObjConverter::addMapToMaterial(a1, 3, &__p);
        goto LABEL_95;
      }
      if (sub_100005F1C(&v17, "metallic"))
      {
        int v14 = 5;
        goto LABEL_103;
      }
      if (sub_100005F1C(&v17, "map_metallic"))
      {
        sub_10000F74C(v20, &__p);
        ObjConverter::addMapToMaterial(a1, 5, &__p);
        goto LABEL_95;
      }
      if (sub_100005F1C(&v17, "roughness"))
      {
        int v14 = 6;
        goto LABEL_103;
      }
      if (sub_100005F1C(&v17, "map_roughness"))
      {
        sub_10000F74C(v20, &__p);
        ObjConverter::addMapToMaterial(a1, 6, &__p);
LABEL_95:
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
LABEL_104:
      if (SHIBYTE(v19) < 0) {
        operator delete(v17);
      }
    }
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  std::ios::~ios();
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

void sub_10000EC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  sub_100006360((uint64_t)&a21);
  if (*(char *)(v21 - 89) < 0) {
    operator delete(*(void **)(v21 - 112));
  }
  _Unwind_Resume(a1);
}

void *sub_10000ECF4(void *a1)
{
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
  return a1;
}

uint64_t ObjConverter::addInputToMaterial(uint64_t result, int a2)
{
  int v34 = a2;
  int v2 = *(_DWORD *)(result + 212);
  if (v2 != -1)
  {
    int v3 = (uint64_t **)(*(void *)(result + 160) + 48 * v2);
    if (!fileFormatUtils::Material::hasInput((uint64_t)v3, a2))
    {
      sub_10000A63C(v22, (char *)&unk_100017652);
      sub_10000A63C(v20, (char *)&unk_100017652);
      sub_10000A63C(v18, "st");
      sub_1000115A4((char *)__dst, (long long *)v22, (long long *)v20, (long long *)v18);
      unint64_t v35 = &v34;
      std::string::size_type v4 = sub_100012584(v3, &v34, (uint64_t)&std::piecewise_construct, &v35);
      uint64_t v5 = (void **)(v4 + 5);
      if (*((char *)v4 + 63) < 0) {
        operator delete(*v5);
      }
      v4[7] = v25;
      *(_OWORD *)uint64_t v5 = *(_OWORD *)__dst;
      HIBYTE(v25) = 0;
      LOBYTE(__dst[0]) = 0;
      uint64_t v6 = (void **)(v4 + 8);
      if (*((char *)v4 + 87) < 0) {
        operator delete(*v6);
      }
      v4[10] = v27;
      *(_OWORD *)uint64_t v6 = v26;
      HIBYTE(v27) = 0;
      LOBYTE(v26) = 0;
      int v7 = (void **)(v4 + 11);
      if (*((char *)v4 + 111) < 0) {
        operator delete(*v7);
      }
      v4[13] = v29;
      *(_OWORD *)int v7 = __p;
      HIBYTE(v29) = 0;
      LOBYTE(__p) = 0;
      uint64_t v8 = v4 + 14;
      if (*((char *)v4 + 135) < 0)
      {
        operator delete(v4[14]);
        int v10 = SHIBYTE(v29);
        *uint64_t v8 = v30;
        long long v11 = v32;
        v4[16] = v31;
        HIBYTE(v31) = 0;
        LOBYTE(v30) = 0;
        v4[17] = v11;
        *((_DWORD *)v4 + 36) = v33;
        if (v10 < 0) {
          operator delete((void *)__p);
        }
      }
      else
      {
        *uint64_t v8 = v30;
        unint64_t v9 = v32;
        v4[16] = v31;
        HIBYTE(v31) = 0;
        LOBYTE(v30) = 0;
        v4[17] = v9;
        *((_DWORD *)v4 + 36) = v33;
      }
      if (SHIBYTE(v27) < 0) {
        operator delete((void *)v26);
      }
      if (SHIBYTE(v25) < 0) {
        operator delete(__dst[0]);
      }
      if (v19 < 0) {
        operator delete(v18[0]);
      }
      if (v21 < 0) {
        operator delete(v20[0]);
      }
      if (v23 < 0) {
        operator delete(v22[0]);
      }
    }
    __dst[0] = &v34;
    std::string::size_type v12 = sub_100012584(v3, &v34, (uint64_t)&std::piecewise_construct, (_DWORD **)__dst);
    __asm { FMOV            V0.2S, #1.0 }
    v12[17] = _D0;
    *((_DWORD *)v12 + 36) = 1065353216;
    std::istream::operator>>();
    std::istream::operator>>();
    return std::istream::operator>>();
  }
  return result;
}

void sub_10000F048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10000F0A4(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void ObjConverter::addMapToMaterial(uint64_t a1, int a2, std::string *a3)
{
  int v29 = a2;
  int v3 = *(_DWORD *)(a1 + 212);
  if (v3 != -1)
  {
    uint64_t v5 = (uint64_t **)(*(void *)(a1 + 160) + 48 * v3);
    if (fileFormatUtils::Material::hasInput((uint64_t)v5, a2))
    {
      __dst[0] = &v29;
      uint64_t v6 = sub_100012584(v5, &v29, (uint64_t)&std::piecewise_construct, (_DWORD **)__dst);
      std::string::operator=((std::string *)(v6 + 8), a3);
    }
    else
    {
      sub_10000A63C(v17, (char *)&unk_100017652);
      sub_10000A63C(v15, "st");
      sub_1000115A4((char *)__dst, (long long *)v17, (long long *)a3, (long long *)v15);
      long long v30 = &v29;
      int v7 = sub_100012584(v5, &v29, (uint64_t)&std::piecewise_construct, &v30);
      uint64_t v8 = (void **)(v7 + 5);
      if (*((char *)v7 + 63) < 0) {
        operator delete(*v8);
      }
      v7[7] = v20;
      *(_OWORD *)uint64_t v8 = *(_OWORD *)__dst;
      HIBYTE(v20) = 0;
      LOBYTE(__dst[0]) = 0;
      unint64_t v9 = (void **)(v7 + 8);
      if (*((char *)v7 + 87) < 0) {
        operator delete(*v9);
      }
      v7[10] = v22;
      *(_OWORD *)unint64_t v9 = v21;
      HIBYTE(v22) = 0;
      LOBYTE(v21) = 0;
      int v10 = (void **)(v7 + 11);
      if (*((char *)v7 + 111) < 0) {
        operator delete(*v10);
      }
      v7[13] = v24;
      *(_OWORD *)int v10 = __p;
      HIBYTE(v24) = 0;
      LOBYTE(__p) = 0;
      long long v11 = v7 + 14;
      if (*((char *)v7 + 135) < 0)
      {
        operator delete(v7[14]);
        int v13 = SHIBYTE(v24);
        *long long v11 = v25;
        int v14 = v27;
        v7[16] = v26;
        HIBYTE(v26) = 0;
        LOBYTE(v25) = 0;
        v7[17] = v14;
        *((_DWORD *)v7 + 36) = v28;
        if (v13 < 0) {
          operator delete((void *)__p);
        }
      }
      else
      {
        *long long v11 = v25;
        std::string::size_type v12 = v27;
        v7[16] = v26;
        HIBYTE(v26) = 0;
        LOBYTE(v25) = 0;
        v7[17] = v12;
        *((_DWORD *)v7 + 36) = v28;
      }
      if (SHIBYTE(v22) < 0) {
        operator delete((void *)v21);
      }
      if (SHIBYTE(v20) < 0) {
        operator delete(__dst[0]);
      }
      if (v16 < 0) {
        operator delete(v15[0]);
      }
      if (v18 < 0) {
        operator delete(v17[0]);
      }
    }
  }
}

void sub_10000F330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(a1);
}

BOOL sub_10000F374(void *a1, uint64_t a2)
{
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  std::string::size_type v4 = std::locale::use_facet((const std::locale *)&__p, &std::ctype<char>::id);
  unsigned __int8 v5 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 10);
  std::locale::~locale((std::locale *)&__p);
  uint64_t v6 = sub_100007990(a1, a2, v5);
  int v7 = *(_DWORD *)((unsigned char *)v6 + *(void *)(*v6 - 24) + 32) & 5;
  if (!v7)
  {
    uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
    int v10 = (char)v9;
    uint64_t v11 = a2 + v9;
    if (v10 >= 0) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = *(void *)a2 + *(void *)(a2 + 8);
    }
    if (v10 >= 0) {
      uint64_t v13 = a2;
    }
    else {
      uint64_t v13 = *(void *)a2;
    }
    while (v12 != v13)
    {
      __darwin_ct_rune_t v15 = *(char *)--v12;
      __darwin_ct_rune_t v14 = v15;
      if (v15 < 0)
      {
        if (!__maskrune(v14, 0x4000uLL))
        {
LABEL_14:
          uint64_t v13 = v12 + 1;
          break;
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v14] & 0x4000) == 0)
      {
        goto LABEL_14;
      }
    }
    uint64_t v16 = *(unsigned __int8 *)(a2 + 23);
    int v17 = (char)v16;
    uint64_t v18 = a2 + v16;
    if (v17 >= 0)
    {
      uint64_t v19 = a2;
    }
    else
    {
      uint64_t v18 = *(void *)a2 + *(void *)(a2 + 8);
      uint64_t v19 = *(void *)a2;
    }
    std::string::erase((std::string *)a2, v13 - v19, v18 - v13);
    do
    {
      while (1)
      {
        uint64_t v20 = *(unsigned __int8 *)(a2 + 23);
        if (*(char *)(a2 + 23) < 0)
        {
          uint64_t v21 = *(void *)(a2 + 8);
          if (!v21) {
            return v7 == 0;
          }
        }
        else
        {
          if (!*(unsigned char *)(a2 + 23)) {
            return v7 == 0;
          }
          uint64_t v21 = *(unsigned __int8 *)(a2 + 23);
        }
        uint64_t v22 = v21 - 1;
        if ((v20 & 0x80) != 0)
        {
          uint64_t v23 = *(void *)a2;
          if (*(unsigned char *)(*(void *)a2 + v22) != 92) {
            return v7 == 0;
          }
          uint64_t v20 = *(void *)(a2 + 8);
        }
        else
        {
          if (*(unsigned char *)(a2 + v22) != 92) {
            return v7 == 0;
          }
          uint64_t v23 = a2;
        }
        *(unsigned char *)(v20 + v23 - 1) = 32;
        long long __p = 0;
        uint64_t v49 = 0;
        uint64_t v50 = 0;
        std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
        uint64_t v24 = std::locale::use_facet(&v51, &std::ctype<char>::id);
        unsigned __int8 v25 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
        std::locale::~locale(&v51);
        long long v26 = sub_100007990(a1, (uint64_t)&__p, v25);
        int v27 = *(_DWORD *)((unsigned char *)v26 + *(void *)(*v26 - 24) + 32) & 5;
        if (v27)
        {
          uint64_t v28 = *(unsigned __int8 *)(a2 + 23);
          int v29 = (char)v28;
          uint64_t v30 = a2 + v28;
          uint64_t v31 = v29 >= 0 ? v30 : *(void *)a2 + *(void *)(a2 + 8);
          uint64_t v32 = v29 >= 0 ? a2 : *(void *)a2;
          while (v31 != v32)
          {
            __darwin_ct_rune_t v34 = *(char *)--v31;
            __darwin_ct_rune_t v33 = v34;
            if (v34 < 0) {
              __uint32_t v35 = __maskrune(v33, 0x4000uLL);
            }
            else {
              __uint32_t v35 = _DefaultRuneLocale.__runetype[v33] & 0x4000;
            }
            if (!v35) {
              goto LABEL_58;
            }
          }
        }
        else
        {
          std::string v36 = v50 >= 0 ? (const std::string::value_type *)&__p : (const std::string::value_type *)__p;
          std::string::size_type v37 = v50 >= 0 ? HIBYTE(v50) : v49;
          std::string::append((std::string *)a2, v36, v37);
          uint64_t v38 = *(unsigned __int8 *)(a2 + 23);
          int v39 = (char)v38;
          uint64_t v40 = a2 + v38;
          uint64_t v31 = v39 >= 0 ? v40 : *(void *)a2 + *(void *)(a2 + 8);
          uint64_t v32 = v39 >= 0 ? a2 : *(void *)a2;
          while (v31 != v32)
          {
            __darwin_ct_rune_t v42 = *(char *)--v31;
            __darwin_ct_rune_t v41 = v42;
            if (v42 < 0) {
              __uint32_t v43 = __maskrune(v41, 0x4000uLL);
            }
            else {
              __uint32_t v43 = _DefaultRuneLocale.__runetype[v41] & 0x4000;
            }
            if (!v43)
            {
LABEL_58:
              uint64_t v32 = v31 + 1;
              break;
            }
          }
        }
        uint64_t v44 = *(unsigned __int8 *)(a2 + 23);
        int v45 = (char)v44;
        uint64_t v46 = a2 + v44;
        if (v45 >= 0)
        {
          uint64_t v47 = a2;
        }
        else
        {
          uint64_t v46 = *(void *)a2 + *(void *)(a2 + 8);
          uint64_t v47 = *(void *)a2;
        }
        std::string::erase((std::string *)a2, v32 - v47, v46 - v32);
        if (SHIBYTE(v50) < 0) {
          break;
        }
        if (v27) {
          return v7 == 0;
        }
      }
      operator delete(__p);
    }
    while (!v27);
  }
  return v7 == 0;
}

void sub_10000F708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::locale a15)
{
}

void sub_10000F74C(uint64_t *a1@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  sub_100005C4C(a1, (uint64_t)a2);
  while (1)
  {
    unint64_t v4 = a1[5];
    unint64_t v5 = a1[6];
    if (!(v4 >= v5 ? (*(uint64_t (**)(uint64_t *))(a1[2] + 56))(a1 + 2) : v5 - v4)) {
      break;
    }
    long long __p = 0;
    std::string::size_type v12 = 0;
    uint64_t v13 = 0;
    sub_100005C4C(a1, (uint64_t)&__p);
    if (SHIBYTE(v13) < 0)
    {
      if (v12)
      {
        p_p = __p;
        goto LABEL_11;
      }
      int v8 = 0;
LABEL_26:
      operator delete(__p);
      if (v8) {
        return;
      }
    }
    else
    {
      if (!HIBYTE(v13))
      {
        int v8 = 0;
        goto LABEL_23;
      }
      p_p = &__p;
LABEL_11:
      if (*p_p == 35)
      {
        int v8 = 3;
        if (v13 < 0) {
          goto LABEL_26;
        }
      }
      else
      {
        std::string::append(a2, " ");
        if (v13 >= 0) {
          uint64_t v9 = (const std::string::value_type *)&__p;
        }
        else {
          uint64_t v9 = (const std::string::value_type *)__p;
        }
        if (v13 >= 0) {
          std::string::size_type v10 = HIBYTE(v13);
        }
        else {
          std::string::size_type v10 = v12;
        }
        std::string::append(a2, v9, v10);
        int v8 = 0;
        if (v13 < 0) {
          goto LABEL_26;
        }
      }
LABEL_23:
      if (v8) {
        return;
      }
    }
  }
}

void sub_10000F88C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

char **ObjConverter::getSerializeMaterial(ObjConverter *this, unsigned int a2)
{
  if ((a2 & 0x80000000) == 0)
  {
    uint64_t v2 = *((void *)this + 27);
    if (a2 < (unint64_t)((*((void *)this + 28) - v2) >> 3)) {
      return (char **)(v2 + 8 * a2);
    }
  }
  int v3 = (char **)((char *)this + 240);
  if (!*((void *)this + 30))
  {
    unint64_t v4 = (char *)this + 248;
    fileFormatUtils::Asset::getMaterialsPath((ObjConverter *)((char *)this + 248), (uint64_t)v29);
    unint64_t v5 = (char *)operator new(0x40uLL);
    if ((v30 & 0x80u) == 0) {
      size_t v6 = v30;
    }
    else {
      size_t v6 = (size_t)v29[1];
    }
    int v7 = __p;
    sub_100008940((uint64_t)__p, v6 + 8);
    if (v28 < 0) {
      int v7 = (void **)__p[0];
    }
    if (v6)
    {
      if ((v30 & 0x80u) == 0) {
        int v8 = v29;
      }
      else {
        int v8 = (void **)v29[0];
      }
      memmove(v7, v8, v6);
    }
    strcpy((char *)v7 + v6, "/default");
    *(void *)unint64_t v5 = off_1000185C8;
    *((_DWORD *)v5 + 2) = 6;
    uint64_t v9 = v5 + 16;
    if (SHIBYTE(v28) < 0)
    {
      sub_100007814(v9, __p[0], (unint64_t)__p[1]);
      int v10 = SHIBYTE(v28);
      *((void *)v5 + 6) = 0;
      *((void *)v5 + 7) = 0;
      *((void *)v5 + 5) = 0;
      *(void *)unint64_t v5 = &off_100018728;
      *int v3 = v5;
      if (v10 < 0)
      {
        operator delete(__p[0]);
        unint64_t v5 = *v3;
      }
    }
    else
    {
      *(_OWORD *)uint64_t v9 = *(_OWORD *)__p;
      *((void *)v5 + 4) = v28;
      *((void *)v5 + 6) = 0;
      *((void *)v5 + 7) = 0;
      *((void *)v5 + 5) = 0;
      *(void *)unint64_t v5 = &off_100018728;
      *int v3 = v5;
    }
    uint64_t v11 = *(void **)v4;
    std::string::size_type v12 = *(void **)(*(void *)v4 + 48);
    unint64_t v13 = *(void *)(*(void *)v4 + 56);
    if ((unint64_t)v12 >= v13)
    {
      uint64_t v15 = v11[5];
      uint64_t v16 = ((uint64_t)v12 - v15) >> 3;
      if ((unint64_t)(v16 + 1) >> 61) {
        sub_100007E2C();
      }
      uint64_t v17 = v13 - v15;
      uint64_t v18 = v17 >> 2;
      if (v17 >> 2 <= (unint64_t)(v16 + 1)) {
        uint64_t v18 = v16 + 1;
      }
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v19 = v18;
      }
      if (v19) {
        uint64_t v20 = (char *)sub_100008F20(*(void *)v4 + 56, v19);
      }
      else {
        uint64_t v20 = 0;
      }
      uint64_t v21 = &v20[8 * v16];
      uint64_t v22 = &v20[8 * v19];
      *(void *)uint64_t v21 = v5;
      __darwin_ct_rune_t v14 = v21 + 8;
      uint64_t v24 = (char *)v11[5];
      uint64_t v23 = (char *)v11[6];
      if (v23 != v24)
      {
        do
        {
          uint64_t v25 = *((void *)v23 - 1);
          v23 -= 8;
          *((void *)v21 - 1) = v25;
          v21 -= 8;
        }
        while (v23 != v24);
        uint64_t v23 = (char *)v11[5];
      }
      v11[5] = v21;
      v11[6] = v14;
      v11[7] = v22;
      if (v23) {
        operator delete(v23);
      }
    }
    else
    {
      void *v12 = v5;
      __darwin_ct_rune_t v14 = v12 + 1;
    }
    v11[6] = v14;
    if ((char)v30 < 0) {
      operator delete(v29[0]);
    }
  }
  return v3;
}

void sub_10000FB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  operator delete(v21);
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(a1);
}

void ObjConverter::createMesh(ObjConverter *a1, const void **a2, uint64_t **a3, uint64_t *a4, void *a5)
{
  unint64_t v5 = (char *)(a3 + 15);
  if (a3[16] != a3[15])
  {
    uint64_t v11 = (char *)operator new(0x128uLL);
    sub_100007054(a2, 47, (uint64_t)&v110);
    fileFormatUtils::makeValidIdentifier(a4, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    __darwin_ct_rune_t v14 = std::string::append(&v110, (const std::string::value_type *)p_p, size);
    uint64_t v16 = (void *)v14->__r_.__value_.__r.__words[0];
    unint64_t v15 = v14->__r_.__value_.__l.__size_;
    LODWORD(v107) = v14->__r_.__value_.__r.__words[2];
    *(_DWORD *)((char *)&v107 + 3) = *(_DWORD *)((char *)&v14->__r_.__value_.__r.__words[2] + 3);
    int v17 = SHIBYTE(v14->__r_.__value_.__r.__words[2]);
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    *(void *)uint64_t v11 = off_1000185C8;
    *((_DWORD *)v11 + 2) = 4;
    if (v17 < 0)
    {
      sub_100007814(v11 + 16, v16, v15);
    }
    else
    {
      *((void *)v11 + 2) = v16;
      *((void *)v11 + 3) = v15;
      *((_DWORD *)v11 + 8) = v107;
      *(_DWORD *)(v11 + 35) = *(_DWORD *)((char *)&v107 + 3);
      v11[39] = v17;
    }
    *((void *)v11 + 5) = 0;
    *((void *)v11 + 6) = 0;
    *((void *)v11 + 7) = 0;
    *(void *)uint64_t v11 = &off_100018698;
    *((_OWORD *)v11 + 4) = 0u;
    *((void *)v11 + 35) = 0;
    *((void *)v11 + 36) = 0;
    *((void *)v11 + 34) = 0;
    *((_OWORD *)v11 + 5) = 0u;
    *((_OWORD *)v11 + 6) = 0u;
    *((_OWORD *)v11 + 7) = 0u;
    *((_OWORD *)v11 + 8) = 0u;
    *((_OWORD *)v11 + 9) = 0u;
    *((_OWORD *)v11 + 10) = 0u;
    *((_OWORD *)v11 + 11) = 0u;
    *((_OWORD *)v11 + 12) = 0u;
    *((_OWORD *)v11 + 13) = 0u;
    *((_OWORD *)v11 + 14) = 0u;
    *((_OWORD *)v11 + 15) = 0u;
    *(_OWORD *)(v11 + 252) = 0u;
    if (v17 < 0) {
      operator delete(v16);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v110.__r_.__value_.__l.__data_);
    }
    unint64_t v18 = a5[7];
    unint64_t v19 = (void *)a5[6];
    if ((unint64_t)v19 >= v18)
    {
      uint64_t v21 = a5[5];
      uint64_t v22 = ((uint64_t)v19 - v21) >> 3;
      if ((unint64_t)(v22 + 1) >> 61) {
        sub_100007E2C();
      }
      uint64_t v23 = v18 - v21;
      uint64_t v24 = v23 >> 2;
      if (v23 >> 2 <= (unint64_t)(v22 + 1)) {
        uint64_t v24 = v22 + 1;
      }
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v25 = v24;
      }
      if (v25) {
        long long v26 = (char *)sub_100008F20((uint64_t)(a5 + 7), v25);
      }
      else {
        long long v26 = 0;
      }
      int v27 = &v26[8 * v22];
      uint64_t v28 = &v26[8 * v25];
      *(void *)int v27 = v11;
      uint64_t v20 = v27 + 8;
      unsigned __int8 v30 = (char *)a5[5];
      int v29 = (char *)a5[6];
      if (v29 != v30)
      {
        do
        {
          uint64_t v31 = *((void *)v29 - 1);
          v29 -= 8;
          *((void *)v27 - 1) = v31;
          v27 -= 8;
        }
        while (v29 != v30);
        int v29 = (char *)a5[5];
      }
      a5[5] = v27;
      a5[6] = v20;
      a5[7] = v28;
      if (v29) {
        operator delete(v29);
      }
    }
    else
    {
      *unint64_t v19 = v11;
      uint64_t v20 = v19 + 1;
    }
    a5[6] = v20;
    if (v11 + 64 != v5) {
      sub_100008BDC(v11 + 64, (char *)a3[15], (uint64_t)a3[16], ((char *)a3[16] - (char *)a3[15]) >> 2);
    }
    uint64_t v32 = (int *)a3[4];
    __darwin_ct_rune_t v33 = (int *)a3[5];
    __darwin_ct_rune_t v34 = v32 + 1;
    int v35 = *v32;
    if (v32 != v33 && v34 != v33)
    {
      int v37 = *v32;
      uint64_t v38 = v32 + 1;
      int v39 = (int *)a3[4];
      uint64_t v40 = v32 + 1;
      do
      {
        int v42 = *v40++;
        int v41 = v42;
        if (v42 < v37)
        {
          int v37 = v41;
          int v39 = v38;
        }
        uint64_t v38 = v40;
      }
      while (v40 != v33);
      int v43 = *v39;
      uint64_t v44 = v32 + 1;
      do
      {
        int v46 = *v44++;
        int v45 = v46;
        BOOL v47 = v35 < v46;
        if (v35 <= v46) {
          int v35 = v45;
        }
        if (v47) {
          uint64_t v32 = v34;
        }
        __darwin_ct_rune_t v34 = v44;
      }
      while (v44 != v33);
      int v35 = v43;
    }
    int v48 = *v32;
    memset(&v110, 0, sizeof(v110));
    int v49 = v48 + 1;
    sub_10001058C((uint64_t *)&v110, (void *)a1 + 1, v35, v48 + 1);
    sub_1000089C8((void *)v11 + 20, (uint64_t *)v110.__r_.__value_.__l.__data_, (uint64_t *)v110.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v110.__r_.__value_.__l.__size_ - v110.__r_.__value_.__r.__words[0]) >> 2));
    if (v35)
    {
      memset(&__p, 0, sizeof(__p));
      sub_100010650((uint64_t)&__p, a3 + 4, -v35);
      sub_100008BDC(v11 + 64, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_, (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 2);
      if (__p.__r_.__value_.__r.__words[0])
      {
        __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    else if (v11 + 88 != (char *)(a3 + 4))
    {
      sub_100008BDC(v11 + 88, (char *)a3[4], (uint64_t)a3[5], ((char *)a3[5] - (char *)a3[4]) >> 2);
    }
    if (*((void *)a1 + 5) - *((void *)a1 + 4) == *((void *)a1 + 2) - *((void *)a1 + 1))
    {
      memset(&__p, 0, sizeof(__p));
      sub_10001058C((uint64_t *)&__p, (void *)a1 + 4, v35, v49);
      *((_DWORD *)v11 + 65) = 2;
      sub_1000089C8((void *)v11 + 26, (uint64_t *)__p.__r_.__value_.__l.__data_, (uint64_t *)__p.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 2));
      if (__p.__r_.__value_.__r.__words[0])
      {
        __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    uint64_t v50 = (int *)a3[7];
    std::locale v51 = (int *)a3[8];
    unint64_t v52 = v50 + 1;
    int v53 = *v50;
    if (v50 != v51 && v52 != v51)
    {
      int v54 = *v50;
      unint64_t v55 = v50 + 1;
      char v56 = (int *)a3[7];
      unint64_t v57 = v50 + 1;
      do
      {
        int v59 = *v57++;
        int v58 = v59;
        if (v59 < v54)
        {
          int v54 = v58;
          char v56 = v55;
        }
        unint64_t v55 = v57;
      }
      while (v57 != v51);
      int v60 = *v56;
      unint64_t v61 = v50 + 1;
      do
      {
        int v63 = *v61++;
        int v62 = v63;
        BOOL v64 = v53 < v63;
        if (v53 <= v63) {
          int v53 = v62;
        }
        if (v64) {
          uint64_t v50 = v52;
        }
        unint64_t v52 = v61;
      }
      while (v61 != v51);
      int v53 = v60;
    }
    if ((v53 & 0x80000000) == 0)
    {
      v106 = (char *)(a3 + 7);
      uint64_t v65 = *v50;
      memset(&__p, 0, sizeof(__p));
      sub_1000128F4((uint64_t)&__p, 0);
      if ((uint64_t)(*((void *)a1 + 8) - *((void *)a1 + 7)) >> 3 >= (unint64_t)(v65 + 1)) {
        int v66 = v65 + 1;
      }
      else {
        int v66 = (uint64_t)(*((void *)a1 + 8) - *((void *)a1 + 7)) >> 3;
      }
      sub_100012924((void **)&__p.__r_.__value_.__l.__data_, v66 - v53);
      if (v66 <= v53)
      {
        uint64_t v68 = (uint64_t *)__p.__r_.__value_.__l.__size_;
      }
      else
      {
        uint64_t v67 = v53;
        uint64_t v68 = (uint64_t *)__p.__r_.__value_.__l.__size_;
        do
        {
          uint64_t v69 = *((void *)a1 + 7);
          if ((unint64_t)v68 >= __p.__r_.__value_.__r.__words[2])
          {
            uint64_t v70 = (uint64_t)((uint64_t)v68 - __p.__r_.__value_.__r.__words[0]) >> 3;
            if ((unint64_t)(v70 + 1) >> 61) {
              sub_100007E2C();
            }
            unint64_t v71 = (uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2;
            if (v71 <= v70 + 1) {
              unint64_t v71 = v70 + 1;
            }
            if (__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v72 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v72 = v71;
            }
            long long v73 = (char *)sub_100008F20((uint64_t)&__p.__r_.__value_.__r.__words[2], v72);
            v75 = &v73[8 * v70];
            *(void *)v75 = *(void *)(v69 + 8 * v67);
            uint64_t v68 = (uint64_t *)(v75 + 8);
            std::string::size_type v77 = __p.__r_.__value_.__l.__size_;
            uint64_t v76 = (void *)__p.__r_.__value_.__r.__words[0];
            while ((void *)v77 != v76)
            {
              uint64_t v78 = *(void *)(v77 - 8);
              v77 -= 8;
              *((void *)v75 - 1) = v78;
              v75 -= 8;
            }
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v75;
            __p.__r_.__value_.__l.__size_ = (std::string::size_type)v68;
            __p.__r_.__value_.__r.__words[2] = (std::string::size_type)&v73[8 * v74];
            if (v76) {
              operator delete(v76);
            }
          }
          else
          {
            *v68++ = *(void *)(v69 + 8 * v67);
          }
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)v68;
          ++v67;
        }
        while (v66 != v67);
      }
      sub_10000A6F0((void *)v11 + 29, (uint64_t *)__p.__r_.__value_.__l.__data_, v68, (uint64_t)((uint64_t)v68 - __p.__r_.__value_.__r.__words[0]) >> 3);
      if (*((unsigned char *)a3 + 80))
      {
        *((_DWORD *)v11 + 66) = 3;
        if (v53)
        {
          long long v107 = 0uLL;
          uint64_t v108 = 0;
          sub_100010650((uint64_t)&v107, v106, -v53);
          sub_100008BDC(v11 + 112, (char *)v107, *((uint64_t *)&v107 + 1), (uint64_t)(*((void *)&v107 + 1) - v107) >> 2);
          if ((void)v107)
          {
            *((void *)&v107 + 1) = v107;
            operator delete((void *)v107);
          }
        }
        else if (v11 + 112 != v106)
        {
          sub_100008BDC(v11 + 112, (char *)a3[7], (uint64_t)a3[8], ((char *)a3[8] - (char *)a3[7]) >> 2);
        }
      }
      else
      {
        *((_DWORD *)v11 + 66) = 2;
      }
      if (__p.__r_.__value_.__r.__words[0])
      {
        __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    uint64_t v79 = (int *)a3[11];
    uint64_t v80 = (int *)a3[12];
    v81 = v79 + 1;
    int v82 = *v79;
    if (v79 != v80 && v81 != v80)
    {
      int v84 = *v79;
      long long v85 = v79 + 1;
      int v86 = (int *)a3[11];
      int v87 = v79 + 1;
      do
      {
        int v89 = *v87++;
        int v88 = v89;
        if (v89 < v84)
        {
          int v84 = v88;
          int v86 = v85;
        }
        long long v85 = v87;
      }
      while (v87 != v80);
      int v90 = *v86;
      uint64_t v91 = v79 + 1;
      do
      {
        int v93 = *v91++;
        int v92 = v93;
        BOOL v94 = v82 < v93;
        if (v82 <= v93) {
          int v82 = v92;
        }
        if (v94) {
          uint64_t v79 = v81;
        }
        v81 = v91;
      }
      while (v91 != v80);
      int v82 = v90;
    }
    if ((v82 & 0x80000000) == 0)
    {
      int v95 = *v79;
      memset(&__p, 0, sizeof(__p));
      sub_10001058C((uint64_t *)&__p, (void *)a1 + 10, v82, v95 + 1);
      sub_1000089C8((void *)v11 + 23, (uint64_t *)__p.__r_.__value_.__l.__data_, (uint64_t *)__p.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 2));
      if (*((unsigned char *)a3 + 112))
      {
        *((_DWORD *)v11 + 64) = 3;
        if (v82)
        {
          long long v107 = 0uLL;
          uint64_t v108 = 0;
          sub_100010650((uint64_t)&v107, a3 + 11, -v82);
          sub_100008BDC(v11 + 136, (char *)v107, *((uint64_t *)&v107 + 1), (uint64_t)(*((void *)&v107 + 1) - v107) >> 2);
          if ((void)v107)
          {
            *((void *)&v107 + 1) = v107;
            operator delete((void *)v107);
          }
        }
        else if (v11 + 136 != (char *)(a3 + 11))
        {
          sub_100008BDC(v11 + 136, (char *)a3[11], (uint64_t)a3[12], ((char *)a3[12] - (char *)a3[11]) >> 2);
        }
      }
      else
      {
        *((_DWORD *)v11 + 64) = 2;
      }
      if (__p.__r_.__value_.__r.__words[0])
      {
        __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    uint64_t v96 = *a3;
    unint64_t v97 = a3[1];
    if ((char *)v97 - (char *)*a3 == 8)
    {
      uint64_t v98 = *ObjConverter::getSerializeMaterial(a1, *(_DWORD *)(*v96 + 24));
      if (v98) {
        std::string::operator=((std::string *)(v11 + 272), (const std::string *)(v98 + 16));
      }
    }
    else
    {
      for (; v96 != v97; ++v96)
      {
        uint64_t v99 = *v96;
        if (*(void *)(*v96 + 8) != *(void *)*v96)
        {
          unint64_t v100 = *(unsigned int *)(v99 + 24);
          if ((v100 & 0x80000000) != 0 || v100 >= (uint64_t)(*((void *)a1 + 28) - *((void *)a1 + 27)) >> 3) {
            sub_10000A63C(&__p, "defaultMaterial");
          }
          else {
            fileFormatUtils::makeValidIdentifier((uint64_t *)(*((void *)a1 + 17) + 24 * v100), &__p);
          }
          uint64_t v101 = (char *)operator new(0x88uLL);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v102 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v102 = __p.__r_.__value_.__l.__size_;
          }
          sub_100008940((uint64_t)&v107, v102 + 6);
          if (v108 >= 0) {
            v103 = &v107;
          }
          else {
            v103 = (long long *)v107;
          }
          if (v102)
          {
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v104 = &__p;
            }
            else {
              v104 = (std::string *)__p.__r_.__value_.__r.__words[0];
            }
            memmove(v103, v104, v102);
          }
          strcpy((char *)v103 + v102, "Subset");
          sub_10000A23C((uint64_t)v101, &v107);
          if (SHIBYTE(v108) < 0) {
            operator delete((void *)v107);
          }
          if (v101 + 64 != (char *)v99) {
            sub_100008BDC(v101 + 64, *(char **)v99, *(void *)(v99 + 8), (uint64_t)(*(void *)(v99 + 8) - *(void *)v99) >> 2);
          }
          SerializeMaterial = ObjConverter::getSerializeMaterial(a1, v100);
          std::string::operator=((std::string *)(v101 + 112), (const std::string *)(*SerializeMaterial + 16));
          serialize::Prim::addChild((serialize::Prim *)v11, (serialize::Prim *)v101);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
      }
    }
    if (v110.__r_.__value_.__r.__words[0])
    {
      v110.__r_.__value_.__l.__size_ = v110.__r_.__value_.__r.__words[0];
      operator delete(v110.__r_.__value_.__l.__data_);
    }
  }
}

void sub_100010498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  operator delete(v29);
  if (a22 < 0) {
    operator delete(__p);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  operator delete(v28);
  _Unwind_Resume(a1);
}

void sub_10001058C(uint64_t *a1, void *a2, int a3, int a4)
{
  sub_1000126E0(a1, 0);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 2) < a4) {
    a4 = -1431655765 * ((uint64_t)(a2[1] - *a2) >> 2);
  }
  sub_100006C54(a1, a4 - a3);
  BOOL v8 = __OFSUB__(a4, a3);
  int v9 = a4 - a3;
  if (!((v9 < 0) ^ v8 | (v9 == 0)))
  {
    unint64_t v10 = a1[1];
    uint64_t v11 = 12 * a3;
    do
    {
      uint64_t v12 = *a2 + v11;
      if (v10 >= a1[2])
      {
        unint64_t v10 = sub_10000879C(a1, v12);
      }
      else
      {
        *(void *)unint64_t v10 = *(void *)v12;
        *(_DWORD *)(v10 + 8) = *(_DWORD *)(v12 + 8);
        v10 += 12;
      }
      a1[1] = v10;
      v11 += 12;
      --v9;
    }
    while (v9);
  }
}

void sub_100010650(uint64_t a1, void *a2, int a3)
{
  sub_1000116CC(a1, 0);
  sub_100006D78((void **)a1, (uint64_t)(a2[1] - *a2) >> 2);
  size_t v6 = (_DWORD *)*a2;
  int v7 = (_DWORD *)a2[1];
  if ((_DWORD *)*a2 != v7)
  {
    BOOL v8 = (void *)(a1 + 16);
    int v9 = *(_DWORD **)(a1 + 8);
    do
    {
      int v10 = *v6 + a3;
      if ((unint64_t)v9 >= *v8)
      {
        uint64_t v12 = *(_DWORD **)a1;
        uint64_t v13 = ((uint64_t)v9 - *(void *)a1) >> 2;
        unint64_t v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 62) {
          sub_100007E2C();
        }
        uint64_t v15 = *v8 - (void)v12;
        if (v15 >> 1 > v14) {
          unint64_t v14 = v15 >> 1;
        }
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16)
        {
          int v17 = (char *)sub_100008908(a1 + 16, v16);
          uint64_t v12 = *(_DWORD **)a1;
          int v9 = *(_DWORD **)(a1 + 8);
        }
        else
        {
          int v17 = 0;
        }
        unint64_t v18 = &v17[4 * v13];
        *(_DWORD *)unint64_t v18 = v10;
        uint64_t v11 = v18 + 4;
        while (v9 != v12)
        {
          int v19 = *--v9;
          *((_DWORD *)v18 - 1) = v19;
          v18 -= 4;
        }
        *(void *)a1 = v18;
        *(void *)(a1 + 8) = v11;
        *(void *)(a1 + 16) = &v17[4 * v16];
        if (v12) {
          operator delete(v12);
        }
      }
      else
      {
        *int v9 = v10;
        uint64_t v11 = v9 + 1;
      }
      *(void *)(a1 + 8) = v11;
      ++v6;
      int v9 = v11;
    }
    while (v6 != v7);
  }
}

void *ObjConverter::makeStage(ObjConverter *this)
{
  uint64_t v2 = (ObjConverter *)((char *)this + 248);
  uint64_t inited = (void *)fileFormatUtils::Asset::initStage((ObjConverter *)((char *)this + 248));
  fileFormatUtils::Asset::getMaterialsPath(v2, (uint64_t)&v30);
  unint64_t v4 = (fileFormatUtils::Material *)*((void *)this + 20);
  unint64_t v5 = (fileFormatUtils::Material *)*((void *)this + 21);
  if (v4 != v5)
  {
    size_t v6 = (char **)((char *)this + 216);
    do
    {
      SerializeMaterial = fileFormatUtils::Material::makeSerializeMaterial(v4, v2);
      BOOL v8 = SerializeMaterial;
      int v10 = (serialize::Mat **)*((void *)this + 28);
      unint64_t v9 = *((void *)this + 29);
      if ((unint64_t)v10 >= v9)
      {
        uint64_t v12 = ((char *)v10 - *v6) >> 3;
        if ((unint64_t)(v12 + 1) >> 61) {
          sub_100007E2C();
        }
        uint64_t v13 = v9 - (void)*v6;
        uint64_t v14 = v13 >> 2;
        if (v13 >> 2 <= (unint64_t)(v12 + 1)) {
          uint64_t v14 = v12 + 1;
        }
        if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v14;
        }
        if (v15) {
          unint64_t v16 = (char *)sub_100008F20((uint64_t)this + 232, v15);
        }
        else {
          unint64_t v16 = 0;
        }
        int v17 = (serialize::Mat **)&v16[8 * v12];
        *int v17 = v8;
        uint64_t v11 = v17 + 1;
        int v19 = (char *)*((void *)this + 27);
        unint64_t v18 = (char *)*((void *)this + 28);
        if (v18 != v19)
        {
          do
          {
            uint64_t v20 = (serialize::Mat *)*((void *)v18 - 1);
            v18 -= 8;
            *--int v17 = v20;
          }
          while (v18 != v19);
          unint64_t v18 = *v6;
        }
        *((void *)this + 27) = v17;
        *((void *)this + 28) = v11;
        *((void *)this + 29) = &v16[8 * v15];
        if (v18) {
          operator delete(v18);
        }
      }
      else
      {
        *int v10 = SerializeMaterial;
        uint64_t v11 = v10 + 1;
      }
      *((void *)this + 28) = v11;
      unint64_t v4 = (fileFormatUtils::Material *)((char *)v4 + 48);
    }
    while (v4 != v5);
  }
  fileFormatUtils::Asset::getGeomPath(v2, (uint64_t)v28);
  uint64_t v21 = (ObjConverter *)*((void *)this + 13);
  if (v21 != (ObjConverter *)((char *)this + 112))
  {
    do
    {
      if (*((char *)v21 + 55) < 0)
      {
        sub_100007814(__p, *((void **)v21 + 4), *((void *)v21 + 5));
      }
      else
      {
        *(_OWORD *)std::string __p = *((_OWORD *)v21 + 2);
        uint64_t v27 = *((void *)v21 + 6);
      }
      ObjConverter::createMesh(this, (const void **)v28, *((uint64_t ***)v21 + 7), (uint64_t *)__p, inited);
      if (SHIBYTE(v27) < 0) {
        operator delete(__p[0]);
      }
      uint64_t v22 = (ObjConverter *)*((void *)v21 + 1);
      if (v22)
      {
        do
        {
          uint64_t v23 = v22;
          uint64_t v22 = *(ObjConverter **)v22;
        }
        while (v22);
      }
      else
      {
        do
        {
          uint64_t v23 = (ObjConverter *)*((void *)v21 + 2);
          BOOL v24 = *(void *)v23 == (void)v21;
          uint64_t v21 = v23;
        }
        while (!v24);
      }
      uint64_t v21 = v23;
    }
    while (v23 != (ObjConverter *)((char *)this + 112));
  }
  if (v29 < 0) {
    operator delete(v28[0]);
  }
  if (v31 < 0) {
    operator delete(v30);
  }
  return inited;
}

void sub_1000109A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000109F4(uint64_t a1)
{
  uint64_t v2 = *(void ***)a1;
  int v3 = *(void ***)(a1 + 8);
  while (v2 != v3)
  {
    unint64_t v4 = (void **)*v2;
    if (*v2)
    {
      unint64_t v5 = *v4;
      if (*v4)
      {
        v4[1] = v5;
        operator delete(v5);
      }
      operator delete(v4);
    }
    ++v2;
  }
  size_t v6 = *(void **)(a1 + 120);
  if (v6)
  {
    *(void *)(a1 + 128) = v6;
    operator delete(v6);
  }
  int v7 = *(void **)(a1 + 88);
  if (v7)
  {
    *(void *)(a1 + 96) = v7;
    operator delete(v7);
  }
  BOOL v8 = *(void **)(a1 + 56);
  if (v8)
  {
    *(void *)(a1 + 64) = v8;
    operator delete(v8);
  }
  unint64_t v9 = *(void **)(a1 + 32);
  if (v9)
  {
    *(void *)(a1 + 40) = v9;
    operator delete(v9);
  }
  int v10 = *(void ***)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v10;
    operator delete(v10);
  }
  return a1;
}

void *sub_100010AA4(void *a1, long long *a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = a1 + 1;
  int v3 = a1 + 3;
  if (*((char *)a2 + 23) < 0)
  {
    sub_100007814(v3, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    v3[2] = *((void *)a2 + 2);
    *(_OWORD *)int v3 = v4;
  }
  return a1;
}

void sub_100010B00(_Unwind_Exception *a1)
{
  sub_100010B18(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

void sub_100010B18(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_100010B18(a1, *a2);
    sub_100010B18(a1, a2[1]);
    sub_100010B74((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void sub_100010B74(uint64_t a1)
{
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0)
  {
    uint64_t v2 = *(void **)(a1 + 8);
    operator delete(v2);
  }
}

uint64_t sub_100010BEC(uint64_t a1, int a2)
{
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(unsigned char *)(a1 + 80) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = 0;
  ObjConverter::Group::setMaterial((ObjConverter::Group *)a1, a2);
  return a1;
}

void sub_100010C5C(_Unwind_Exception *a1)
{
  size_t v6 = v5;
  BOOL v8 = *v6;
  if (*v6)
  {
    *(void *)(v1 + 128) = v8;
    operator delete(v8);
  }
  sub_100015AE8(v3, v4, v2, v1);
  _Unwind_Resume(a1);
}

void sub_100010C90(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    sub_10001112C(a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *a1 + 24 * a2;
    while (v3 != v7)
    {
      if (*(char *)(v3 - 1) < 0) {
        operator delete(*(void **)(v3 - 24));
      }
      v3 -= 24;
    }
    a1[1] = v7;
  }
}

void (__cdecl ***sub_100010D30(void (__cdecl ***a1)(std::basic_stringstream<char> *__hidden this), const std::string *a2, int a3))(std::basic_stringstream<char> *__hidden this)
{
  unint64_t v6 = a1 + 2;
  uint64_t v7 = (uint64_t)(a1 + 3);
  *a1 = v9;
  *(void *)((char *)*(v9 - 3) + (void)a1) = v8;
  a1[1] = 0;
  int v10 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v10, a1 + 3);
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  a1[2] = v12;
  *(void *)((char *)*(v12 - 3) + (void)v6) = v11;
  *a1 = v13;
  sub_100011504(v7, a2, a3);
  return a1;
}

void sub_100010FCC(_Unwind_Exception *a1)
{
}

uint64_t sub_100010FF4(uint64_t a1)
{
  *(void *)(a1 + 16) = v3;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  std::ios::~ios();
  return a1;
}

void sub_10001112C(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100007E2C();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      uint64_t v12 = (char *)sub_10001130C(v4, v11);
    }
    else {
      uint64_t v12 = 0;
    }
    unint64_t v15 = v12;
    unint64_t v16 = &v12[24 * v8];
    unint64_t v18 = &v12[24 * v11];
    size_t v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    int v17 = &v16[v14];
    sub_100011294(a1, &v15);
    sub_100011474((uint64_t)&v15);
  }
}

void sub_100011280(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100011474((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100011294(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100011354((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_10001130C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_10000795C();
  }
  return operator new(24 * a2);
}

uint64_t sub_100011354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  sub_1000113F4((uint64_t)v12);
  return a6;
}

uint64_t sub_1000113F4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_10001142C(a1);
  }
  return a1;
}

void sub_10001142C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

uint64_t sub_100011474(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_1000114AC(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t sub_100011504(uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf();
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  sub_100007D18(a1);
  return a1;
}

void sub_100011580(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

char *sub_1000115A4(char *__dst, long long *a2, long long *a3, long long *a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_100007814(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v7;
  }
  if (*((char *)a3 + 23) < 0)
  {
    sub_100007814(__dst + 24, *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v8 = *a3;
    *((void *)__dst + 5) = *((void *)a3 + 2);
    *(_OWORD *)(__dst + 24) = v8;
  }
  if (*((char *)a4 + 23) < 0)
  {
    sub_100007814(__dst + 48, *(void **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v9 = *a4;
    *((void *)__dst + 8) = *((void *)a4 + 2);
    *((_OWORD *)__dst + 3) = v9;
  }
  sub_10000A63C((void *)__dst + 9, (char *)&unk_100017652);
  float v10 = nanf((const char *)&unk_100017652);
  *((float *)__dst + 24) = v10;
  *((float *)__dst + 25) = v10;
  *((float *)__dst + 26) = v10;
  return __dst;
}

void sub_100011680(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000116CC(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    sub_1000116FC((char **)a1, a2 - v2);
  }
}

void sub_1000116FC(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  long long v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    long long v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 2);
    if (v10 >> 62) {
      sub_100007E2C();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = v5 - v8;
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
      long long v14 = (char *)sub_100008908(v4, v13);
      long long v8 = *a1;
      long long v7 = a1[1];
    }
    else
    {
      long long v14 = 0;
    }
    long long v15 = &v14[4 * v11];
    unint64_t v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    int v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      int v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

uint64_t sub_100011818(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100007E2C();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  int v18 = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)sub_10001130C(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  uint64_t v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  unint64_t v16 = v11;
  int v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_100007814(v11, *(void **)a2, *((void *)a2 + 1));
    uint64_t v11 = v16;
  }
  else
  {
    long long v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v11 = v12;
  }
  unint64_t v16 = v11 + 24;
  sub_100011294(a1, v15);
  uint64_t v13 = a1[1];
  sub_100011474((uint64_t)v15);
  return v13;
}

void sub_100011928(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100011474((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10001193C(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_10001193C(a1, *(void *)a2);
    sub_10001193C(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

void sub_1000119A0(void ***a1)
{
  unint64_t v2 = *a1;
  if (*v2)
  {
    sub_1000119F4((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_1000119F4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void sub_100011A44(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        sub_100011ADC((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_100011ADC(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 47) < 0) {
    operator delete(*(void **)(a2 + 24));
  }
  uint64_t v3 = *(void **)(a2 + 8);
  sub_100010B18(a2, v3);
}

uint64_t sub_100011B24(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = sub_100011BB4(v5, (const void **)(v3 + 32), a2);
    unint64_t v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      unint64_t v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || sub_100011BB4(v5, a2, (const void **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

BOOL sub_100011BB4(uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

uint64_t sub_100011C20(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555) {
    sub_100007E2C();
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
  v20[4] = a1 + 2;
  if (v9) {
    int v10 = (char *)sub_100011DE8(v7, v9);
  }
  else {
    int v10 = 0;
  }
  uint64_t v11 = &v10[48 * v4];
  v20[0] = v10;
  v20[1] = v11;
  v20[3] = &v10[48 * v9];
  *(void *)uint64_t v11 = *(void *)a2;
  long long v12 = (void *)(a2 + 8);
  uint64_t v13 = *(void *)(a2 + 8);
  *((void *)v11 + 1) = v13;
  long long v14 = v11 + 8;
  uint64_t v15 = *(void *)(a2 + 16);
  *((void *)v11 + 2) = v15;
  if (v15)
  {
    *(void *)(v13 + 16) = v14;
    *(void *)a2 = v12;
    void *v12 = 0;
    *(void *)(a2 + 16) = 0;
  }
  else
  {
    *(void *)uint64_t v11 = v14;
  }
  long long v16 = *(_OWORD *)(a2 + 24);
  int v17 = &v10[48 * v4];
  *((void *)v17 + 5) = *(void *)(a2 + 40);
  *(_OWORD *)(v17 + 24) = v16;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 24) = 0;
  uint64_t v20[2] = v11 + 48;
  sub_100011D70(a1, v20);
  uint64_t v18 = a1[1];
  sub_100011F98(v20);
  return v18;
}

void sub_100011D5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100011F98((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100011D70(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100011E30((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_100011DE8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    sub_10000795C();
  }
  return operator new(48 * a2);
}

uint64_t sub_100011E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v20 = a6;
  *((void *)&v20 + 1) = a7;
  long long v19 = v20;
  v17[0] = a1;
  v17[1] = &v19;
  uint64_t v17[2] = &v20;
  if (a3 == a5)
  {
    uint64_t v15 = a6;
  }
  else
  {
    uint64_t v8 = a3;
    do
    {
      uint64_t v9 = *(void *)(v8 - 48);
      v8 -= 48;
      *(void *)(v7 - 48) = v9;
      int v10 = (void *)(a3 - 40);
      uint64_t v11 = *(void *)(a3 - 40);
      *(void *)(v7 - 40) = v11;
      uint64_t v12 = v7 - 40;
      uint64_t v13 = *(void *)(a3 - 32);
      *(void *)(v7 - 32) = v13;
      if (v13)
      {
        *(void *)(v11 + 16) = v12;
        *(void *)(a3 - 48) = v10;
        *int v10 = 0;
        *(void *)(a3 - 32) = 0;
      }
      else
      {
        *(void *)(v7 - 48) = v12;
      }
      long long v14 = *(_OWORD *)(a3 - 24);
      *(void *)(v7 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v7 - 24) = v14;
      *(void *)(a3 - 24) = 0;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      uint64_t v7 = *((void *)&v20 + 1) - 48;
      *((void *)&v20 + 1) -= 48;
      a3 = v8;
    }
    while (v8 != a5);
    uint64_t v15 = v20;
  }
  char v18 = 1;
  sub_100011F0C((uint64_t)v17);
  return v15;
}

uint64_t sub_100011F0C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100011F44((uint64_t *)a1);
  }
  return a1;
}

void sub_100011F44(uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_100011ADC(v3, v1);
      v1 += 48;
    }
    while (v1 != v2);
  }
}

void **sub_100011F98(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_100011FCC(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 48;
    sub_100011ADC(v4, i - 48);
  }
}

uint64_t *sub_100012014(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (uint64_t **)sub_1000120AC((uint64_t)a1, &v9, a2);
  uint64_t result = *v6;
  if (!*v6)
  {
    sub_10001214C((uint64_t)a1, a4, (uint64_t)&v8);
    sub_1000121F4(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

void *sub_1000120AC(uint64_t a1, void *a2, const void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!sub_100011BB4(v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!sub_100011BB4(v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

unsigned char *sub_10001214C@<X0>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = v6 + 32;
  uint64_t v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    uint64_t result = sub_100007814(result, *(void **)v8, *((void *)v8 + 1));
  }
  else
  {
    long long v9 = *v8;
    *((void *)v6 + 6) = *((void *)v8 + 2);
    *(_OWORD *)uint64_t result = v9;
  }
  *((_DWORD *)v6 + 14) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_1000121D8(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  sub_1000123E4(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_1000121F4(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_10001224C(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_10001224C(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            long long v9 = (uint64_t **)a2[2];
          }
          else
          {
            long long v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *long long v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_1000123E4(uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0) {
      operator delete(__p[4]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t *sub_100012444(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  int v6 = (uint64_t **)sub_1000120AC((uint64_t)a1, &v9, a2);
  uint64_t result = *v6;
  if (!*v6)
  {
    sub_1000124DC((uint64_t)a1, a4, (uint64_t)&v8);
    sub_1000121F4(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

unsigned char *sub_1000124DC@<X0>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = v6 + 32;
  int v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    uint64_t result = sub_100007814(result, *(void **)v8, *((void *)v8 + 1));
  }
  else
  {
    long long v9 = *v8;
    *((void *)v6 + 6) = *((void *)v8 + 2);
    *(_OWORD *)uint64_t result = v9;
  }
  *((void *)v6 + 7) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_100012568(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  sub_1000123E4(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t **sub_100012584(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  int v6 = a1[1];
  int v8 = a1 + 1;
  long long v9 = a1 + 1;
  if (v6)
  {
    int v10 = *a2;
    while (1)
    {
      while (1)
      {
        long long v9 = (uint64_t **)v6;
        int v11 = *((_DWORD *)v6 + 8);
        if (v10 >= v11) {
          break;
        }
        int v6 = *v9;
        int v8 = v9;
        if (!*v9) {
          goto LABEL_9;
        }
      }
      if (v11 >= v10) {
        break;
      }
      int v6 = v9[1];
      if (!v6)
      {
        int v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v12 = (char *)operator new(0x98uLL);
    v14[1] = v7;
    *((_DWORD *)v12 + 8) = **a4;
    *(_OWORD *)(v12 + 132) = 0u;
    *(_OWORD *)(v12 + 120) = 0u;
    *(_OWORD *)(v12 + 104) = 0u;
    *(_OWORD *)(v12 + 88) = 0u;
    *(_OWORD *)(v12 + 72) = 0u;
    *(_OWORD *)(v12 + 56) = 0u;
    *(_OWORD *)(v12 + 40) = 0u;
    char v15 = 1;
    sub_1000121F4(a1, (uint64_t)v9, v8, (uint64_t *)v12);
    v14[0] = 0;
    sub_100012688((uint64_t)v14, 0);
    return (uint64_t **)v12;
  }
  return v9;
}

void sub_100012688(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_100010B74((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void sub_1000126E0(uint64_t *a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 2);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_10001271C(a1, v4);
  }
  else if (!v3)
  {
    a1[1] = *a1 + 12 * a2;
  }
}

void sub_10001271C(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 2) >= a2)
  {
    if (a2)
    {
      size_t v13 = 12 * ((12 * a2 - 12) / 0xC) + 12;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 2);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x1555555555555555) {
      sub_100007E2C();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 2);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v11 = 0x1555555555555555;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      uint64_t v12 = (char *)sub_100007E44(v4, v11);
    }
    else {
      uint64_t v12 = 0;
    }
    std::string __p = v12;
    long long v16 = &v12[12 * v8];
    char v18 = &v12[12 * v11];
    size_t v14 = 12 * ((12 * a2 - 12) / 0xC) + 12;
    bzero(v16, v14);
    int v17 = &v16[v14];
    sub_1000086A4(a1, &__p);
    if (v17 != v16) {
      int v17 = &v16[(v17 - v16 - 12) % 0xCuLL];
    }
    if (__p) {
      operator delete(__p);
    }
  }
}

void sub_1000128A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000128F4(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    sub_1000129C8((char **)a1, a2 - v2);
  }
}

void sub_100012924(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_100007E2C();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)sub_100008F20(v3, a2);
    uint64_t v7 = &v6[v5];
    unint64_t v9 = &v6[8 * v8];
    unint64_t v10 = (char *)*a1;
    unint64_t v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
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

void sub_1000129C8(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      sub_100007E2C();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      size_t v14 = (char *)sub_100008F20(v4, v13);
      uint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      size_t v14 = 0;
    }
    char v15 = &v14[8 * v11];
    long long v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    int v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      uint64_t v18 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void fileFormatUtils::makeValidIdentifier(uint64_t *a1@<X0>, std::string *a2@<X8>)
{
  memset(&v15, 0, sizeof(v15));
  BOOL v3 = *((char *)a1 + 23) < 0;
  uint64_t v4 = *((unsigned __int8 *)a1 + 23);
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = a1[1];
  }
  if (v4)
  {
    unint64_t v6 = 0;
    do
    {
      if (v3) {
        uint64_t v7 = (uint64_t *)*a1;
      }
      else {
        uint64_t v7 = a1;
      }
      __darwin_ct_rune_t v8 = *((char *)v7 + v6);
      if (v8 < 0) {
        __uint32_t v9 = __maskrune(v8, 0x500uLL);
      }
      else {
        __uint32_t v9 = _DefaultRuneLocale.__runetype[v8] & 0x500;
      }
      if (v9)
      {
        if (*((char *)a1 + 23) >= 0) {
          unint64_t v10 = a1;
        }
        else {
          unint64_t v10 = (uint64_t *)*a1;
        }
        std::string::push_back(&v15, *((unsigned char *)v10 + v6));
      }
      else
      {
        std::string::append(&v15, "_");
      }
      ++v6;
      BOOL v3 = *((char *)a1 + 23) < 0;
      unint64_t v11 = *((unsigned __int8 *)a1 + 23);
      if ((v11 & 0x80u) != 0) {
        unint64_t v11 = a1[1];
      }
    }
    while (v6 < v11);
    uint64_t v12 = (std::string *)v15.__r_.__value_.__r.__words[0];
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v12 = &v15;
    }
    int v13 = v12->__r_.__value_.__s.__data_[0];
    if ((v13 & 0x80000000) == 0 && (_DefaultRuneLocale.__runetype[v13] & 0x400) != 0)
    {
      std::operator+<char>();
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v15.__r_.__value_.__l.__data_);
      }
      std::string v15 = v14;
    }
    *a2 = v15;
  }
  else
  {
    sub_10000A63C(a2, "defaultIdentifier");
  }
}

void sub_100012C60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void fileFormatUtils::fixExponent(std::string *a1)
{
  sub_10000A63C(&v57, "+e");
  sub_10000A63C(&__p, "e+");
  std::string::size_type size = (char *)HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((char)size >= 0) {
    std::string::size_type v3 = (std::string::size_type)a1;
  }
  else {
    std::string::size_type v3 = a1->__r_.__value_.__r.__words[0];
  }
  if ((v59 & 0x80u) == 0) {
    uint64_t v4 = (char *)&v57;
  }
  else {
    uint64_t v4 = (char *)v57;
  }
  if ((v59 & 0x80u) == 0) {
    int64_t v5 = v59;
  }
  else {
    int64_t v5 = v58;
  }
  if (v5)
  {
    if ((char)size < 0) {
      std::string::size_type size = (char *)a1->__r_.__value_.__l.__size_;
    }
    if ((uint64_t)size >= v5)
    {
      unint64_t v6 = &size[v3];
      int v7 = *v4;
      __darwin_ct_rune_t v8 = (void *)v3;
      do
      {
        __uint32_t v9 = &size[-v5];
        if (v9 == (char *)-1) {
          break;
        }
        unint64_t v10 = (char *)memchr(v8, v7, (size_t)(v9 + 1));
        if (!v10) {
          break;
        }
        unint64_t v11 = v10;
        if (!memcmp(v10, v4, v5))
        {
          if (v11 != v6)
          {
            std::string::size_type v12 = (std::string::size_type)&v11[-v3];
            if (&v11[-v3] != (char *)-1) {
              goto LABEL_21;
            }
          }
          break;
        }
        __darwin_ct_rune_t v8 = v11 + 1;
        std::string::size_type size = (char *)(v6 - (v11 + 1));
      }
      while ((uint64_t)size >= v5);
    }
  }
  else
  {
    std::string::size_type v12 = 0;
LABEL_21:
    if ((v56 & 0x80u) == 0) {
      p_p = (const std::string::value_type *)&__p;
    }
    else {
      p_p = (const std::string::value_type *)__p;
    }
    if ((v56 & 0x80u) == 0) {
      std::string::size_type v14 = v56;
    }
    else {
      std::string::size_type v14 = v55;
    }
    std::string::replace(a1, v12, v5, p_p, v14);
  }
  if ((char)v56 < 0) {
    operator delete(__p);
  }
  if ((char)v59 < 0) {
    operator delete(v57);
  }
  sub_10000A63C(&v57, "+E");
  sub_10000A63C(&__p, "e+");
  std::string v15 = (char *)HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((char)v15 >= 0) {
    std::string::size_type v16 = (std::string::size_type)a1;
  }
  else {
    std::string::size_type v16 = a1->__r_.__value_.__r.__words[0];
  }
  if ((v59 & 0x80u) == 0) {
    int v17 = (char *)&v57;
  }
  else {
    int v17 = (char *)v57;
  }
  if ((v59 & 0x80u) == 0) {
    int64_t v18 = v59;
  }
  else {
    int64_t v18 = v58;
  }
  if (v18)
  {
    if ((char)v15 < 0) {
      std::string v15 = (char *)a1->__r_.__value_.__l.__size_;
    }
    if ((uint64_t)v15 >= v18)
    {
      uint64_t v19 = &v15[v16];
      int v20 = *v17;
      uint64_t v21 = (void *)v16;
      do
      {
        uint64_t v22 = &v15[-v18];
        if (v22 == (char *)-1) {
          break;
        }
        uint64_t v23 = (char *)memchr(v21, v20, (size_t)(v22 + 1));
        if (!v23) {
          break;
        }
        BOOL v24 = v23;
        if (!memcmp(v23, v17, v18))
        {
          if (v24 != v19)
          {
            std::string::size_type v25 = (std::string::size_type)&v24[-v16];
            if (&v24[-v16] != (char *)-1) {
              goto LABEL_52;
            }
          }
          break;
        }
        uint64_t v21 = v24 + 1;
        std::string v15 = (char *)(v19 - (v24 + 1));
      }
      while ((uint64_t)v15 >= v18);
    }
  }
  else
  {
    std::string::size_type v25 = 0;
LABEL_52:
    if ((v56 & 0x80u) == 0) {
      long long v26 = (const std::string::value_type *)&__p;
    }
    else {
      long long v26 = (const std::string::value_type *)__p;
    }
    if ((v56 & 0x80u) == 0) {
      std::string::size_type v27 = v56;
    }
    else {
      std::string::size_type v27 = v55;
    }
    std::string::replace(a1, v25, v18, v26, v27);
  }
  if ((char)v56 < 0) {
    operator delete(__p);
  }
  if ((char)v59 < 0) {
    operator delete(v57);
  }
  sub_10000A63C(&v57, "-e");
  sub_10000A63C(&__p, "e-");
  uint64_t v28 = (char *)HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((char)v28 >= 0) {
    std::string::size_type v29 = (std::string::size_type)a1;
  }
  else {
    std::string::size_type v29 = a1->__r_.__value_.__r.__words[0];
  }
  if ((v59 & 0x80u) == 0) {
    unsigned __int8 v30 = (char *)&v57;
  }
  else {
    unsigned __int8 v30 = (char *)v57;
  }
  if ((v59 & 0x80u) == 0) {
    int64_t v31 = v59;
  }
  else {
    int64_t v31 = v58;
  }
  if (v31)
  {
    if ((char)v28 < 0) {
      uint64_t v28 = (char *)a1->__r_.__value_.__l.__size_;
    }
    if ((uint64_t)v28 >= v31)
    {
      uint64_t v32 = &v28[v29];
      int v33 = *v30;
      __darwin_ct_rune_t v34 = (void *)v29;
      do
      {
        int v35 = &v28[-v31];
        if (v35 == (char *)-1) {
          break;
        }
        std::string v36 = (char *)memchr(v34, v33, (size_t)(v35 + 1));
        if (!v36) {
          break;
        }
        int v37 = v36;
        if (!memcmp(v36, v30, v31))
        {
          if (v37 != v32)
          {
            std::string::size_type v38 = (std::string::size_type)&v37[-v29];
            if (&v37[-v29] != (char *)-1) {
              goto LABEL_83;
            }
          }
          break;
        }
        __darwin_ct_rune_t v34 = v37 + 1;
        uint64_t v28 = (char *)(v32 - (v37 + 1));
      }
      while ((uint64_t)v28 >= v31);
    }
  }
  else
  {
    std::string::size_type v38 = 0;
LABEL_83:
    if ((v56 & 0x80u) == 0) {
      int v39 = (const std::string::value_type *)&__p;
    }
    else {
      int v39 = (const std::string::value_type *)__p;
    }
    if ((v56 & 0x80u) == 0) {
      std::string::size_type v40 = v56;
    }
    else {
      std::string::size_type v40 = v55;
    }
    std::string::replace(a1, v38, v31, v39, v40);
  }
  if ((char)v56 < 0) {
    operator delete(__p);
  }
  if ((char)v59 < 0) {
    operator delete(v57);
  }
  sub_10000A63C(&v57, "-E");
  sub_10000A63C(&__p, "e-");
  int v41 = (char *)HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((char)v41 >= 0) {
    std::string::size_type v42 = (std::string::size_type)a1;
  }
  else {
    std::string::size_type v42 = a1->__r_.__value_.__r.__words[0];
  }
  if ((v59 & 0x80u) == 0) {
    int v43 = (char *)&v57;
  }
  else {
    int v43 = (char *)v57;
  }
  if ((v59 & 0x80u) == 0) {
    int64_t v44 = v59;
  }
  else {
    int64_t v44 = v58;
  }
  if (v44)
  {
    if ((char)v41 < 0) {
      int v41 = (char *)a1->__r_.__value_.__l.__size_;
    }
    if ((uint64_t)v41 >= v44)
    {
      int v45 = &v41[v42];
      int v46 = *v43;
      BOOL v47 = (void *)v42;
      do
      {
        int v48 = &v41[-v44];
        if (v48 == (char *)-1) {
          break;
        }
        int v49 = (char *)memchr(v47, v46, (size_t)(v48 + 1));
        if (!v49) {
          break;
        }
        uint64_t v50 = v49;
        if (!memcmp(v49, v43, v44))
        {
          if (v50 != v45)
          {
            std::string::size_type v51 = (std::string::size_type)&v50[-v42];
            if (&v50[-v42] != (char *)-1) {
              goto LABEL_114;
            }
          }
          break;
        }
        BOOL v47 = v50 + 1;
        int v41 = (char *)(v45 - (v50 + 1));
      }
      while ((uint64_t)v41 >= v44);
    }
  }
  else
  {
    std::string::size_type v51 = 0;
LABEL_114:
    if ((v56 & 0x80u) == 0) {
      unint64_t v52 = (const std::string::value_type *)&__p;
    }
    else {
      unint64_t v52 = (const std::string::value_type *)__p;
    }
    if ((v56 & 0x80u) == 0) {
      std::string::size_type v53 = v56;
    }
    else {
      std::string::size_type v53 = v55;
    }
    std::string::replace(a1, v51, v44, v52, v53);
  }
  if ((char)v56 < 0) {
    operator delete(__p);
  }
  if ((char)v59 < 0) {
    operator delete(v57);
  }
}

void sub_100013134(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

float fileFormatUtils::getFloat(uint64_t *a1)
{
  memset(&__p, 0, sizeof(__p));
  sub_100005C4C(a1, (uint64_t)&__p);
  fileFormatUtils::fixExponent(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  double v2 = strtod((const char *)p_p, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v2;
}

void sub_1000131F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void fileFormatUtils::Asset::getPath(fileFormatUtils::Asset *this@<X0>, std::string *a2@<X8>)
{
  sub_10000A63C(&v11, "/");
  unint64_t v6 = (const std::string::value_type *)*((void *)this + 1);
  int64_t v5 = (char *)this + 8;
  uint64_t v4 = v6;
  int v7 = v5[23];
  if (v7 >= 0) {
    __darwin_ct_rune_t v8 = v5;
  }
  else {
    __darwin_ct_rune_t v8 = v4;
  }
  if (v7 >= 0) {
    std::string::size_type v9 = v5[23];
  }
  else {
    std::string::size_type v9 = *((void *)v5 + 1);
  }
  unint64_t v10 = std::string::append(&v11, v8, v9);
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
}

void sub_10001329C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void fileFormatUtils::Asset::getMaterialsPath(fileFormatUtils::Asset *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (char *)this + 32;
  if (*((char *)this + 55) < 0)
  {
    if (*((void *)this + 5)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)this + 55))
  {
LABEL_9:
    *(_OWORD *)a2 = *(_OWORD *)v4;
    *(void *)(a2 + 16) = *((void *)v4 + 2);
    return;
  }
  fileFormatUtils::Asset::getPath(this, &__p);
  int64_t v5 = std::string::append(&__p, "/Materials");
  std::string::size_type v6 = v5->__r_.__value_.__r.__words[0];
  v10[0] = v5->__r_.__value_.__l.__size_;
  *(void *)((char *)v10 + 7) = *(std::string::size_type *)((char *)&v5->__r_.__value_.__r.__words[1] + 7);
  char v7 = HIBYTE(v5->__r_.__value_.__r.__words[2]);
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  if (*((char *)this + 55) < 0) {
    operator delete(*(void **)v4);
  }
  uint64_t v8 = v10[0];
  *((void *)this + 4) = v6;
  *((void *)this + 5) = v8;
  *(void *)((char *)this + 47) = *(void *)((char *)v10 + 7);
  *((unsigned char *)this + 55) = v7;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((*((unsigned char *)this + 55) & 0x80) == 0) {
      goto LABEL_9;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_9;
  }
LABEL_11:
  sub_100007814((unsigned char *)a2, *((void **)this + 4), *((void *)this + 5));
}

void sub_1000133D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void fileFormatUtils::Asset::getGeomPath(fileFormatUtils::Asset *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (char *)this + 56;
  if (*((char *)this + 79) < 0)
  {
    if (*((void *)this + 8)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)this + 79))
  {
LABEL_9:
    *(_OWORD *)a2 = *(_OWORD *)v4;
    *(void *)(a2 + 16) = *((void *)v4 + 2);
    return;
  }
  fileFormatUtils::Asset::getPath(this, &__p);
  int64_t v5 = std::string::append(&__p, "/Geom");
  std::string::size_type v6 = v5->__r_.__value_.__r.__words[0];
  v10[0] = v5->__r_.__value_.__l.__size_;
  *(void *)((char *)v10 + 7) = *(std::string::size_type *)((char *)&v5->__r_.__value_.__r.__words[1] + 7);
  char v7 = HIBYTE(v5->__r_.__value_.__r.__words[2]);
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  if (*((char *)this + 79) < 0) {
    operator delete(*(void **)v4);
  }
  uint64_t v8 = v10[0];
  *((void *)this + 7) = v6;
  *((void *)this + 8) = v8;
  *(void *)((char *)this + 71) = *(void *)((char *)v10 + 7);
  *((unsigned char *)this + 79) = v7;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((*((unsigned char *)this + 79) & 0x80) == 0) {
      goto LABEL_9;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_9;
  }
LABEL_11:
  sub_100007814((unsigned char *)a2, *((void **)this + 7), *((void *)this + 8));
}

void sub_100013514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t fileFormatUtils::Asset::initStage(fileFormatUtils::Asset *this)
{
  double v2 = (char *)operator new(0x68uLL);
  sub_10000A384((uint64_t)v2);
  *(void *)this = v2;
  std::string::operator=((std::string *)(v2 + 64), (const std::string *)((char *)this + 8));
  return *(void *)this;
}

void sub_10001357C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

serialize::Mat *fileFormatUtils::Material::makeSerializeMaterial(fileFormatUtils::Material *this, fileFormatUtils::Asset *a2)
{
  fileFormatUtils::Asset::getMaterialsPath(a2, (uint64_t)&v16);
  uint64_t v4 = std::string::append(&v16, "/");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  int v6 = *((char *)this + 47);
  if (v6 >= 0) {
    char v7 = (char *)this + 24;
  }
  else {
    char v7 = (const std::string::value_type *)*((void *)this + 3);
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *((unsigned __int8 *)this + 47);
  }
  else {
    std::string::size_type v8 = *((void *)this + 4);
  }
  std::string::size_type v9 = std::string::append(&v17, v7, v8);
  unint64_t v10 = (void *)v9->__r_.__value_.__r.__words[0];
  unint64_t size = v9->__r_.__value_.__l.__size_;
  v18[0] = v9->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v18 + 3) = *(_DWORD *)((char *)&v9->__r_.__value_.__r.__words[2] + 3);
  int v12 = SHIBYTE(v9->__r_.__value_.__r.__words[2]);
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  int v13 = (char *)operator new(0x40uLL);
  std::string::size_type v14 = (serialize::Mat *)v13;
  *(void *)int v13 = off_1000185C8;
  *((_DWORD *)v13 + 2) = 6;
  if (v12 < 0)
  {
    sub_100007814(v13 + 16, v10, size);
  }
  else
  {
    *((void *)v13 + 2) = v10;
    *((void *)v13 + 3) = size;
    *((_DWORD *)v13 + 8) = v18[0];
    *(_DWORD *)(v13 + 35) = *(_DWORD *)((char *)v18 + 3);
    v13[39] = v12;
  }
  *((void *)v14 + 5) = 0;
  *((void *)v14 + 6) = 0;
  *((void *)v14 + 7) = 0;
  *(void *)std::string::size_type v14 = &off_100018728;
  fileFormatUtils::Material::updateSerializeMaterial((uint64_t **)this, v14, *(serialize::Stage **)a2);
  serialize::Prim::addChild(*(serialize::Prim **)a2, v14);
  if (v12 < 0) {
    operator delete(v10);
  }
  return v14;
}

void sub_100013718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  operator delete(v22);
  operator delete(v21);
  _Unwind_Resume(a1);
}

void fileFormatUtils::Material::updateSerializeMaterial(uint64_t **this, serialize::Mat *a2, serialize::Stage *a3)
{
  fileFormatUtils::Material::_makeTextureShaderNames(this);
  for (int i = 0; i != 7; ++i)
    fileFormatUtils::Material::_addMapToSerializeMaterial((uint64_t)this, i, (uint64_t)a2);
}

void fileFormatUtils::Material::_makeTextureShaderNames(uint64_t **this)
{
  int v2 = 0;
  std::string::size_type v3 = this + 1;
  do
  {
    v67[0] = v2;
    uint64_t v4 = *v3;
    if (*v3)
    {
      long long v5 = v3;
      do
      {
        int v6 = *(_DWORD *)(v4 + 32);
        BOOL v7 = v6 < v2;
        if (v6 >= v2) {
          std::string::size_type v8 = (uint64_t *)v4;
        }
        else {
          std::string::size_type v8 = (uint64_t *)(v4 + 8);
        }
        if (!v7) {
          long long v5 = (void *)v4;
        }
        uint64_t v4 = *v8;
      }
      while (*v8);
      if (v5 != v3 && *((_DWORD *)v5 + 8) <= v2)
      {
        __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v67;
        std::string::size_type v9 = sub_100012584(this, v67, (uint64_t)&std::piecewise_construct, &__str);
        unint64_t v10 = v9;
        if (*((char *)v9 + 87) < 0)
        {
          if (!v9[9]) {
            goto LABEL_12;
          }
        }
        else if (!*((unsigned char *)v9 + 87))
        {
          goto LABEL_12;
        }
        if (*((char *)v9 + 135) < 0)
        {
          if (v9[15]) {
            goto LABEL_12;
          }
        }
        else if (*((unsigned char *)v9 + 135))
        {
          goto LABEL_12;
        }
        sub_100014004(v67[0], (uint64_t)&__str);
        int v63 = 0;
        BOOL v64 = 0;
        uint64_t v65 = 0;
        std::string v11 = (std::string **)sub_100008F20((uint64_t)&v65, 1uLL);
        *std::string v11 = (std::string *)(v10 + 5);
        int v13 = v11 + 1;
        std::string v15 = v63;
        std::string::size_type v14 = v64;
        std::string v16 = v11;
        if (v64 != v63)
        {
          do
          {
            std::string v17 = *--v14;
            *--std::string v16 = v17;
          }
          while (v14 != v15);
          std::string::size_type v14 = v63;
        }
        int v63 = v16;
        BOOL v64 = v11 + 1;
        uint64_t v65 = (char *)&v11[v12];
        if (v14) {
          operator delete(v14);
        }
        BOOL v64 = v13;
        if (v67[0]) {
          BOOL v18 = v2 > 5;
        }
        else {
          BOOL v18 = 1;
        }
        int v19 = v2;
        if (v18)
        {
LABEL_120:
          int64_t v58 = v63;
          if (v63 != v13)
          {
            do
              std::string::operator=(*v58++ + 3, &__str);
            while (v58 != v13);
            int v13 = v63;
          }
          if (v13)
          {
            BOOL v64 = v13;
            operator delete(v13);
          }
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__str.__r_.__value_.__l.__data_);
          }
          goto LABEL_12;
        }
        while (1)
        {
          int v20 = v19 + 1;
          int v62 = v19 + 1;
          uint64_t v21 = *v3;
          if (!*v3) {
            goto LABEL_114;
          }
          uint64_t v22 = v3;
          do
          {
            int v23 = *(_DWORD *)(v21 + 32);
            BOOL v24 = v23 <= v19;
            if (v23 <= v19) {
              std::string::size_type v25 = (uint64_t *)(v21 + 8);
            }
            else {
              std::string::size_type v25 = (uint64_t *)v21;
            }
            if (!v24) {
              uint64_t v22 = (void *)v21;
            }
            uint64_t v21 = *v25;
          }
          while (*v25);
          if (v22 == v3 || *((_DWORD *)v22 + 8) > v20) {
            goto LABEL_114;
          }
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v62;
          long long v26 = sub_100012584(this, &v62, (uint64_t)&std::piecewise_construct, &__p);
          std::string::size_type v27 = v26;
          uint64_t v28 = *((unsigned __int8 *)v26 + 87);
          if (*((char *)v26 + 87) < 0)
          {
            size_t v29 = (size_t)v26[9];
            if (!v29) {
              goto LABEL_114;
            }
          }
          else
          {
            if (!*((unsigned char *)v26 + 87)) {
              goto LABEL_114;
            }
            size_t v29 = (size_t)v26[9];
          }
          if ((v28 & 0x80u) == 0) {
            size_t v30 = *((unsigned __int8 *)v26 + 87);
          }
          else {
            size_t v30 = v29;
          }
          int64_t v31 = (uint64_t *)*((unsigned __int8 *)v10 + 87);
          int v32 = (char)v31;
          if ((char)v31 < 0) {
            int64_t v31 = v10[9];
          }
          if ((uint64_t *)v30 == v31)
          {
            int v33 = (const void **)(v26 + 8);
            if (v32 >= 0) {
              __darwin_ct_rune_t v34 = (uint64_t *)(v10 + 8);
            }
            else {
              __darwin_ct_rune_t v34 = v10[8];
            }
            if ((v28 & 0x80) == 0)
            {
              while (*(unsigned __int8 *)v33 == *(unsigned __int8 *)v34)
              {
                int v33 = (const void **)((char *)v33 + 1);
                __darwin_ct_rune_t v34 = (uint64_t *)((char *)v34 + 1);
                if (!--v28) {
                  goto LABEL_59;
                }
              }
              goto LABEL_114;
            }
            if (!memcmp(*v33, v34, v29))
            {
LABEL_59:
              unsigned __int8 v59 = (std::string *)(v27 + 5);
              float v35 = *((float *)v10 + 34);
              float v36 = *((float *)v27 + 34);
              uint64_t v37 = *((unsigned __int8 *)v10 + 63);
              if (*((char *)v10 + 63) < 0) {
                std::string::size_type v38 = v10[6];
              }
              else {
                std::string::size_type v38 = (uint64_t *)*((unsigned __int8 *)v10 + 63);
              }
              if (v38 != (uint64_t *)1) {
                goto LABEL_84;
              }
              char v39 = *((unsigned char *)v27 + 63);
              std::string::size_type v40 = v39 < 0 ? v27[6] : (uint64_t *)*((unsigned __int8 *)v27 + 63);
              if (v40 != (uint64_t *)1) {
                goto LABEL_84;
              }
              int v41 = (v37 & 0x80u) == 0 ? (uint64_t *)*((unsigned __int8 *)v10 + 63) : v10[6];
              std::string::size_type v42 = v39 >= 0 ? (uint64_t *)*((unsigned __int8 *)v27 + 63) : v27[6];
              if (v41 != v42) {
                goto LABEL_84;
              }
              if (v39 >= 0) {
                int v43 = (unsigned __int8 *)(v27 + 5);
              }
              else {
                int v43 = (unsigned __int8 *)v59->__r_.__value_.__r.__words[0];
              }
              if ((v37 & 0x80) != 0)
              {
                if (memcmp(v10[5], v43, (size_t)v10[6])) {
                  goto LABEL_84;
                }
              }
              else if (*((unsigned char *)v10 + 63))
              {
                int64_t v44 = (unsigned __int8 *)(v10 + 5);
                while (*v44 == *v43)
                {
                  ++v44;
                  ++v43;
                  if (!--v37) {
                    goto LABEL_116;
                  }
                }
LABEL_84:
                sub_100014004(v62, (uint64_t)&v60);
                if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  v45.__i_ = (std::__wrap_iter<const char *>::iterator_type)&v60;
                }
                else {
                  v45.__i_ = (std::__wrap_iter<const char *>::iterator_type)v60.__r_.__value_.__r.__words[0];
                }
                std::string::insert(&v60, v45, 95);
                std::string __p = v60;
                memset(&v60, 0, sizeof(v60));
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  p_p = &__p;
                }
                else {
                  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
                }
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                }
                else {
                  std::string::size_type size = __p.__r_.__value_.__l.__size_;
                }
                std::string::append(&__str, (const std::string::value_type *)p_p, size);
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(__p.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v60.__r_.__value_.__l.__data_);
                }
                int v48 = v64;
                if (v64 >= (std::string **)v65)
                {
                  uint64_t v50 = v64 - v63;
                  if ((unint64_t)(v50 + 1) >> 61) {
                    sub_100007E2C();
                  }
                  unint64_t v51 = (v65 - (char *)v63) >> 2;
                  if (v51 <= v50 + 1) {
                    unint64_t v51 = v50 + 1;
                  }
                  if ((unint64_t)(v65 - (char *)v63) >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v52 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v52 = v51;
                  }
                  if (v52) {
                    std::string::size_type v53 = (char *)sub_100008F20((uint64_t)&v65, v52);
                  }
                  else {
                    std::string::size_type v53 = 0;
                  }
                  int v54 = &v53[8 * v50];
                  *(void *)int v54 = v59;
                  int v49 = (std::string **)(v54 + 8);
                  unsigned __int8 v56 = v63;
                  std::string::size_type v55 = v64;
                  if (v64 != v63)
                  {
                    do
                    {
                      uint64_t v57 = (uint64_t)*--v55;
                      *((void *)v54 - 1) = v57;
                      v54 -= 8;
                    }
                    while (v55 != v56);
                    std::string::size_type v55 = v63;
                  }
                  int v63 = (std::string **)v54;
                  BOOL v64 = v49;
                  uint64_t v65 = &v53[8 * v52];
                  if (v55) {
                    operator delete(v55);
                  }
                }
                else
                {
                  *BOOL v64 = v59;
                  int v49 = v48 + 1;
                }
                BOOL v64 = v49;
                goto LABEL_114;
              }
LABEL_116:
              if (v35 == v36
                && *((float *)v10 + 35) == *((float *)v27 + 35)
                && *((float *)v10 + 36) == *((float *)v27 + 36))
              {
                goto LABEL_84;
              }
            }
          }
LABEL_114:
          int v19 = v20;
          if (v20 == 6)
          {
            int v13 = v64;
            goto LABEL_120;
          }
        }
      }
    }
LABEL_12:
    ++v2;
  }
  while (v2 != 7);
}

void sub_100013CF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (__p) {
    operator delete(__p);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  _Unwind_Resume(exception_object);
}

void fileFormatUtils::Material::_addMapToSerializeMaterial(uint64_t a1, int a2, uint64_t a3)
{
  int v25 = a2;
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    uint64_t v5 = a1 + 8;
    do
    {
      int v6 = *(_DWORD *)(v3 + 32);
      BOOL v7 = v6 < a2;
      if (v6 >= a2) {
        std::string::size_type v8 = (uint64_t *)v3;
      }
      else {
        std::string::size_type v8 = (uint64_t *)(v3 + 8);
      }
      if (!v7) {
        uint64_t v5 = v3;
      }
      uint64_t v3 = *v8;
    }
    while (*v8);
    if (v5 != a1 + 8 && *(_DWORD *)(v5 + 32) <= a2)
    {
      uint64_t v22 = &v25;
      std::string::size_type v9 = sub_100012584((uint64_t **)a1, &v25, (uint64_t)&std::piecewise_construct, (_DWORD **)&v22);
      sub_1000144C8(v25, (uint64_t)&v22);
      std::string v11 = (char *)v9 + 63;
      if (*((char *)v9 + 63) < 0) {
        uint64_t v12 = v9[6];
      }
      else {
        uint64_t v12 = (uint64_t *)*((unsigned __int8 *)v9 + 63);
      }
      int v13 = (uint64_t *)v24;
      if ((v24 & 0x80u) != 0) {
        int v13 = v23;
      }
      if (v12 == v13) {
        std::string::size_type v14 = (std::string *)(v9 + 5);
      }
      else {
        std::string::size_type v14 = (std::string *)&v22;
      }
      if (v12 != v13) {
        std::string v11 = (char *)&v24;
      }
      if (*v11 < 0)
      {
        if (v12 == v13) {
          std::string v15 = (unint64_t *)(v9 + 6);
        }
        else {
          std::string v15 = (unint64_t *)&v23;
        }
        unint64_t v10 = sub_100007814(&__str, v14->__r_.__value_.__l.__data_, *v15);
      }
      else
      {
        std::string __str = *v14;
      }
      if (*((char *)v9 + 87) < 0)
      {
        if (v9[9])
        {
LABEL_29:
          if (*(char *)(a3 + 39) < 0)
          {
            unint64_t v10 = sub_100007814(__p, *(void **)(a3 + 16), *(void *)(a3 + 24));
          }
          else
          {
            *(_OWORD *)std::string __p = *(_OWORD *)(a3 + 16);
            uint64_t v20 = *(void *)(a3 + 32);
          }
          Shader = fileFormatUtils::Material::_makeShader((uint64_t)v10, (const void **)__p, (uint64_t)(v9 + 5), v25, &__str);
          serialize::Prim::addChild((serialize::Prim *)a3, (serialize::Prim *)Shader);
          if (SHIBYTE(v20) < 0) {
            operator delete(__p[0]);
          }
          goto LABEL_36;
        }
      }
      else if (*((unsigned char *)v9 + 87))
      {
        goto LABEL_29;
      }
      std::string v16 = (char *)operator new(0x68uLL);
      sub_10000A480((uint64_t)v16, v25);
      std::string v17 = v9[17];
      *((_DWORD *)v16 + 19) = *((_DWORD *)v9 + 36);
      *(void *)(v16 + 68) = v17;
      std::string::operator=((std::string *)(v16 + 80), &__str);
      serialize::Prim::addChild((serialize::Prim *)a3, (serialize::Prim *)v16);
LABEL_36:
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      if ((char)v24 < 0) {
        operator delete(v22);
      }
    }
  }
}

void sub_100013F5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  _Unwind_Resume(exception_object);
}

BOOL fileFormatUtils::Material::hasInput(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v2 = a1 + 8;
  uint64_t v3 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v5 = v2;
  do
  {
    int v6 = *(_DWORD *)(v3 + 32);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      std::string::size_type v8 = (uint64_t *)v3;
    }
    else {
      std::string::size_type v8 = (uint64_t *)(v3 + 8);
    }
    if (!v7) {
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v5 == v2 || *(_DWORD *)(v5 + 32) > a2) {
LABEL_11:
  }
    uint64_t v5 = v2;
  return v5 != v2;
}

void sub_100014004(int a1@<W0>, uint64_t a2@<X8>)
{
  sub_10000A63C(v6, "normal");
  sub_10000A63C(v7, "diffuseColor");
  sub_10000A63C(v8, "opacity");
  sub_10000A63C(v9, "emissiveColor");
  sub_10000A63C(v10, "occlusion");
  sub_10000A63C(v11, "metallic");
  sub_10000A63C(v12, "roughness");
  uint64_t v4 = (void **)&v6[3 * a1];
  if (*((char *)v4 + 23) < 0)
  {
    sub_100007814((unsigned char *)a2, *v4, (unint64_t)v4[1]);
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)v4;
    *(void *)(a2 + 16) = v4[2];
  }
  for (uint64_t i = 0; i != -21; i -= 3)
  {
    if (SHIBYTE(v12[i + 2]) < 0) {
      operator delete((void *)v12[i]);
    }
  }
}

void sub_100014154(_Unwind_Exception *exception_object, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = 0;
  while (1)
  {
    if (*((char *)&a9 + v10 + 167) < 0) {
      operator delete(*(void **)((char *)&a9 + v10 + 144));
    }
    v10 -= 24;
    if (v10 == -168) {
      _Unwind_Resume(exception_object);
    }
  }
}

char *fileFormatUtils::Material::_makeShader(uint64_t a1, const void **a2, uint64_t a3, int a4, const std::string *a5)
{
  std::string::size_type v9 = (char *)operator new(0xB0uLL);
  if (*((char *)a2 + 23) >= 0) {
    size_t v10 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v10 = (size_t)a2[1];
  }
  std::string v11 = &v33;
  sub_100008940((uint64_t)&v33, v10 + 1);
  if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string v11 = (std::string *)v33.__r_.__value_.__r.__words[0];
  }
  if (v10)
  {
    if (*((char *)a2 + 23) >= 0) {
      uint64_t v12 = a2;
    }
    else {
      uint64_t v12 = *a2;
    }
    memmove(v11, v12, v10);
  }
  *(_WORD *)((char *)&v11->__r_.__value_.__l.__data_ + v10) = 47;
  int v13 = *(char *)(a3 + 95);
  if (v13 >= 0) {
    std::string::size_type v14 = (const std::string::value_type *)(a3 + 72);
  }
  else {
    std::string::size_type v14 = *(const std::string::value_type **)(a3 + 72);
  }
  if (v13 >= 0) {
    std::string::size_type v15 = *(unsigned __int8 *)(a3 + 95);
  }
  else {
    std::string::size_type v15 = *(void *)(a3 + 80);
  }
  std::string v16 = std::string::append(&v33, v14, v15);
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v34.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  BOOL v18 = std::string::append(&v34, "_texture");
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  std::string::size_type v36 = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  sub_10000A578((uint64_t)v9, a4, (long long *)__p);
  if (SHIBYTE(v36) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v34.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v33.__r_.__value_.__l.__data_);
    if (a4)
    {
LABEL_23:
      int v20 = *(_DWORD *)(a3 + 96);
      int v21 = HIBYTE(a5->__r_.__value_.__r.__words[2]);
      if (SHIBYTE(a5->__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::size_type size = a5->__r_.__value_.__l.__size_;
        if (size != 1)
        {
          if (size != 3) {
            goto LABEL_54;
          }
          if (*(_WORD *)a5->__r_.__value_.__l.__data_ != 26482
            || *(unsigned char *)(a5->__r_.__value_.__r.__words[0] + 2) != 98)
          {
            goto LABEL_54;
          }
LABEL_49:
          *((_DWORD *)v9 + 17) = v20;
          *((void *)v9 + 9) = *(void *)(a3 + 100);
          goto LABEL_55;
        }
        if (*a5->__r_.__value_.__l.__data_ == 103) {
          goto LABEL_48;
        }
        if (a5->__r_.__value_.__l.__size_ != 1) {
          goto LABEL_54;
        }
        size_t v30 = (const std::string *)a5->__r_.__value_.__r.__words[0];
        if (*a5->__r_.__value_.__l.__data_ == 98) {
          goto LABEL_51;
        }
        if ((v21 & 0x80) == 0)
        {
          size_t v30 = a5;
          if (v21 != 1)
          {
LABEL_54:
            *((_DWORD *)v9 + 17) = v20;
            goto LABEL_55;
          }
        }
      }
      else
      {
        if (v21 != 1)
        {
          if (v21 != 3) {
            goto LABEL_54;
          }
          if (LOWORD(a5->__r_.__value_.__l.__data_) != 26482 || a5->__r_.__value_.__s.__data_[2] != 98) {
            goto LABEL_54;
          }
          goto LABEL_49;
        }
        int v31 = a5->__r_.__value_.__s.__data_[0];
        if (v31 == 103)
        {
LABEL_48:
          *((_DWORD *)v9 + 18) = v20;
          goto LABEL_55;
        }
        size_t v30 = a5;
        if (v31 == 98)
        {
LABEL_51:
          *((_DWORD *)v9 + 19) = v20;
          goto LABEL_55;
        }
      }
      if (v30->__r_.__value_.__s.__data_[0] == 97)
      {
        *((_DWORD *)v9 + 20) = v20;
        goto LABEL_55;
      }
      goto LABEL_54;
    }
  }
  else if (a4)
  {
    goto LABEL_23;
  }
  *(void *)&long long v23 = 0x4000000040000000;
  *((void *)&v23 + 1) = 0x4000000040000000;
  *(_OWORD *)(v9 + 68) = v23;
  __asm { FMOV            V0.4S, #-1.0 }
  *(_OWORD *)(v9 + 84) = _Q0;
LABEL_55:
  std::string::operator=((std::string *)(v9 + 104), (const std::string *)(a3 + 24));
  std::string::operator=((std::string *)(v9 + 128), a5);
  return v9;
}

void sub_10001446C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  operator delete(v28);
  _Unwind_Resume(a1);
}

void sub_1000144C8(int a1@<W0>, uint64_t a2@<X8>)
{
  sub_10000A63C(v6, "rgb");
  sub_10000A63C(v7, "rgb");
  sub_10000A63C(v8, "a");
  sub_10000A63C(v9, "rgb");
  sub_10000A63C(v10, "r");
  sub_10000A63C(v11, "r");
  sub_10000A63C(v12, "r");
  uint64_t v4 = (void **)&v6[3 * a1];
  if (*((char *)v4 + 23) < 0)
  {
    sub_100007814((unsigned char *)a2, *v4, (unint64_t)v4[1]);
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)v4;
    *(void *)(a2 + 16) = v4[2];
  }
  for (uint64_t i = 0; i != -21; i -= 3)
  {
    if (SHIBYTE(v12[i + 2]) < 0) {
      operator delete((void *)v12[i]);
    }
  }
}

void sub_100014618(_Unwind_Exception *exception_object, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = 0;
  while (1)
  {
    if (*((char *)&a9 + v10 + 167) < 0) {
      operator delete(*(void **)((char *)&a9 + v10 + 144));
    }
    v10 -= 24;
    if (v10 == -168) {
      _Unwind_Resume(exception_object);
    }
  }
}

void serialize::Prim::~Prim(serialize::Prim *this)
{
  *(void *)this = off_1000185C8;
  uint64_t v2 = (void *)*((void *)this + 5);
  if (v2)
  {
    *((void *)this + 6) = v2;
    operator delete(v2);
  }
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
}

{
  void *v1;
  uint64_t vars8;

  serialize::Prim::~Prim(this);
  operator delete(v1);
}

uint64_t serialize::Prim::release(serialize::Prim *this)
{
  uint64_t v2 = (uint64_t *)*((void *)this + 5);
  uint64_t v3 = (uint64_t *)*((void *)this + 6);
  if (v2 == v3) {
    goto LABEL_4;
  }
  do
  {
    uint64_t v4 = *v2++;
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16))(v4);
  }
  while (v2 != v3);
  if (this)
  {
LABEL_4:
    int v6 = *(uint64_t (**)(serialize::Prim *))(*(void *)this + 8);
    return v6(this);
  }
  return result;
}

void serialize::Prim::serialize(serialize::Prim *this, serialize::Serializer *a2)
{
  serialize::Serializer::sync((unsigned __int8 *)a2, "type", (int *)this + 2);
  serialize::Serializer::sync((unsigned __int8 *)a2, "path", (std::string *)((char *)this + 16));
  serialize::Serializer::sync((xpc_object_t *)a2, "children", (void **)this + 5);
}

void serialize::Prim::addChild(serialize::Prim *this, serialize::Prim *a2)
{
  unint64_t v6 = *((void *)this + 7);
  uint64_t v4 = (char *)this + 56;
  unint64_t v5 = v6;
  BOOL v7 = (void *)*((void *)v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    std::string::size_type v9 = (void **)(v4 - 16);
    uint64_t v10 = *((void *)v4 - 2);
    uint64_t v11 = ((uint64_t)v7 - v10) >> 3;
    if ((unint64_t)(v11 + 1) >> 61) {
      sub_100007E2C();
    }
    uint64_t v12 = v5 - v10;
    uint64_t v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      std::string::size_type v15 = (char *)sub_100008F20((uint64_t)v4, v14);
    }
    else {
      std::string::size_type v15 = 0;
    }
    std::string v16 = &v15[8 * v11];
    long long v17 = &v15[8 * v14];
    *(void *)std::string v16 = a2;
    std::string::size_type v8 = v16 + 8;
    long long v19 = (char *)*((void *)this + 5);
    BOOL v18 = (char *)*((void *)this + 6);
    if (v18 != v19)
    {
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      BOOL v18 = (char *)*v9;
    }
    *((void *)this + 5) = v16;
    *((void *)this + 6) = v8;
    *((void *)this + 7) = v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    *BOOL v7 = a2;
    std::string::size_type v8 = v7 + 1;
  }
  *((void *)this + 6) = v8;
}

void serialize::Stage::serialize(serialize::Stage *this, serialize::Serializer *a2)
{
  serialize::Prim::serialize(this, a2);
  serialize::Serializer::sync((unsigned __int8 *)a2, "defaultPrim", (std::string *)((char *)this + 64));
  serialize::Serializer::sync(a2, "metersPerUnit", (float *)this + 22);
  serialize::Serializer::sync(a2, "startTimeCode", (int *)this + 23);
  serialize::Serializer::sync(a2, "endTimeCode", (int *)this + 24);
  serialize::Serializer::sync(a2, "timeCodesPerSecond", (int *)this + 25);
}

void serialize::PointCloud::serialize(serialize::PointCloud *this, serialize::Serializer *a2)
{
  serialize::Prim::serialize(this, a2);
  serialize::Serializer::sync((uint64_t)a2, "vertices", (const void **)this + 8);
  serialize::Serializer::sync((uint64_t)a2, "colors", (const void **)this + 11);
  serialize::Serializer::sync((unsigned __int8 *)a2, "materialPath", (std::string *)((char *)this + 112));
}

void serialize::Mesh::serialize(serialize::Mesh *this, serialize::Serializer *a2)
{
  serialize::Prim::serialize(this, a2);
  serialize::Serializer::sync((uint64_t)a2, "faceVertexCounts", (uint64_t)this + 64);
  serialize::Serializer::sync((uint64_t)a2, "indices", (uint64_t)this + 88);
  serialize::Serializer::sync((uint64_t)a2, "uvIndices", (uint64_t)this + 112);
  serialize::Serializer::sync((uint64_t)a2, "normalIndices", (uint64_t)this + 136);
  serialize::Serializer::sync((uint64_t)a2, "vertices", (const void **)this + 20);
  serialize::Serializer::sync((uint64_t)a2, "normals", (const void **)this + 23);
  serialize::Serializer::sync((uint64_t)a2, "colors", (const void **)this + 26);
  serialize::Serializer::sync((uint64_t)a2, "uvs", (const void **)this + 29);
  serialize::Serializer::sync((unsigned __int8 *)a2, "normalInterpolation", (int *)this + 64);
  serialize::Serializer::sync((unsigned __int8 *)a2, "colorInterpolation", (int *)this + 65);
  serialize::Serializer::sync((unsigned __int8 *)a2, "uvInterpolation", (int *)this + 66);
  serialize::Serializer::sync((unsigned __int8 *)a2, "materialPath", (std::string *)((char *)this + 272));
}

void serialize::Subset::serialize(serialize::Subset *this, serialize::Serializer *a2)
{
  serialize::Prim::serialize(this, a2);
  serialize::Serializer::sync((uint64_t)a2, "faces", (uint64_t)this + 64);
  serialize::Serializer::sync((unsigned __int8 *)a2, "name", (std::string *)((char *)this + 88));
  serialize::Serializer::sync((unsigned __int8 *)a2, "materialPath", (std::string *)((char *)this + 112));
}

void serialize::MapInput::serialize(serialize::MapInput *this, serialize::Serializer *a2)
{
  serialize::Prim::serialize(this, a2);
  serialize::Serializer::sync((unsigned __int8 *)a2, "inputName", (int *)this + 16);
  serialize::Serializer::sync(a2, "value", (float *)this + 17);
  serialize::Serializer::sync((unsigned __int8 *)a2, "channels", (std::string *)((char *)this + 80));
}

void serialize::Shader::serialize(serialize::Shader *this, serialize::Serializer *a2)
{
  serialize::Prim::serialize(this, a2);
  serialize::Serializer::sync((unsigned __int8 *)a2, "inputName", (int *)this + 16);
  serialize::Serializer::sync(a2, "scale", (float *)this + 17);
  serialize::Serializer::sync(a2, "bias", (float *)this + 21);
  serialize::Serializer::sync((unsigned __int8 *)a2, "file", (std::string *)((char *)this + 104));
  serialize::Serializer::sync((unsigned __int8 *)a2, "channels", (std::string *)((char *)this + 128));
  serialize::Serializer::sync((unsigned __int8 *)a2, "texCoordSet", (std::string *)((char *)this + 152));
}

void sub_100014CB8(void **this)
{
  *this = off_100018608;
  if (*((char *)this + 87) < 0) {
    operator delete(this[8]);
  }
  serialize::Prim::~Prim((serialize::Prim *)this);
}

void sub_100014D18(void **this)
{
  *this = off_100018608;
  if (*((char *)this + 87) < 0) {
    operator delete(this[8]);
  }
  serialize::Prim::~Prim((serialize::Prim *)this);
  operator delete(v2);
}

void sub_100014D7C(void **this)
{
  *this = off_100018650;
  if (*((char *)this + 135) < 0) {
    operator delete(this[14]);
  }
  uint64_t v2 = this[11];
  if (v2)
  {
    this[12] = v2;
    operator delete(v2);
  }
  uint64_t v3 = this[8];
  if (v3)
  {
    this[9] = v3;
    operator delete(v3);
  }
  serialize::Prim::~Prim((serialize::Prim *)this);
}

void sub_100014DFC(void **this)
{
  *this = off_100018650;
  if (*((char *)this + 135) < 0) {
    operator delete(this[14]);
  }
  uint64_t v2 = this[11];
  if (v2)
  {
    this[12] = v2;
    operator delete(v2);
  }
  uint64_t v3 = this[8];
  if (v3)
  {
    this[9] = v3;
    operator delete(v3);
  }
  serialize::Prim::~Prim((serialize::Prim *)this);
  operator delete(v4);
}

void sub_100014E84(void **a1)
{
  sub_1000151A4(a1);
  operator delete(v1);
}

void sub_100014EAC(void **this)
{
  *this = off_1000186E0;
  if (*((char *)this + 135) < 0) {
    operator delete(this[14]);
  }
  if (*((char *)this + 111) < 0) {
    operator delete(this[11]);
  }
  uint64_t v2 = this[8];
  if (v2)
  {
    this[9] = v2;
    operator delete(v2);
  }
  serialize::Prim::~Prim((serialize::Prim *)this);
}

void sub_100014F2C(void **this)
{
  *this = off_1000186E0;
  if (*((char *)this + 135) < 0) {
    operator delete(this[14]);
  }
  if (*((char *)this + 111) < 0) {
    operator delete(this[11]);
  }
  uint64_t v2 = this[8];
  if (v2)
  {
    this[9] = v2;
    operator delete(v2);
  }
  serialize::Prim::~Prim((serialize::Prim *)this);
  operator delete(v3);
}

void sub_100014FB4(serialize::Prim *a1)
{
  serialize::Prim::~Prim(a1);
  operator delete(v1);
}

void sub_100014FDC(void **this)
{
  *this = off_100018770;
  if (*((char *)this + 103) < 0) {
    operator delete(this[10]);
  }
  serialize::Prim::~Prim((serialize::Prim *)this);
}

void sub_10001503C(void **this)
{
  *this = off_100018770;
  if (*((char *)this + 103) < 0) {
    operator delete(this[10]);
  }
  serialize::Prim::~Prim((serialize::Prim *)this);
  operator delete(v2);
}

void sub_1000150A0(void **this)
{
  *this = off_1000187B8;
  if (*((char *)this + 175) < 0) {
    operator delete(this[19]);
  }
  if (*((char *)this + 151) < 0) {
    operator delete(this[16]);
  }
  if (*((char *)this + 127) < 0) {
    operator delete(this[13]);
  }
  serialize::Prim::~Prim((serialize::Prim *)this);
}

void sub_100015120(void **this)
{
  *this = off_1000187B8;
  if (*((char *)this + 175) < 0) {
    operator delete(this[19]);
  }
  if (*((char *)this + 151) < 0) {
    operator delete(this[16]);
  }
  if (*((char *)this + 127) < 0) {
    operator delete(this[13]);
  }
  serialize::Prim::~Prim((serialize::Prim *)this);
  operator delete(v2);
}

void sub_1000151A4(void **this)
{
  *this = &off_100018698;
  if (*((char *)this + 295) < 0) {
    operator delete(this[34]);
  }
  uint64_t v2 = this[29];
  if (v2)
  {
    this[30] = v2;
    operator delete(v2);
  }
  uint64_t v3 = this[26];
  if (v3)
  {
    this[27] = v3;
    operator delete(v3);
  }
  uint64_t v4 = this[23];
  if (v4)
  {
    this[24] = v4;
    operator delete(v4);
  }
  unint64_t v5 = this[20];
  if (v5)
  {
    this[21] = v5;
    operator delete(v5);
  }
  unint64_t v6 = this[17];
  if (v6)
  {
    this[18] = v6;
    operator delete(v6);
  }
  BOOL v7 = this[14];
  if (v7)
  {
    this[15] = v7;
    operator delete(v7);
  }
  std::string::size_type v8 = this[11];
  if (v8)
  {
    this[12] = v8;
    operator delete(v8);
  }
  std::string::size_type v9 = this[8];
  if (v9)
  {
    this[9] = v9;
    operator delete(v9);
  }
  serialize::Prim::~Prim((serialize::Prim *)this);
}

int main(int argc, const char **argv, const char **envp)
{
}

void sub_1000152A4(void *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100015354;
  handler[3] = &unk_1000187F8;
  id v1 = a1;
  id v3 = v1;
  xpc_connection_set_event_handler((xpc_connection_t)v1, handler);
  xpc_connection_resume((xpc_connection_t)v1);
}

void sub_100015338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100015354(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  xpc_dictionary_get_remote_connection(v5);
  unint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(v5);
  if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v6 && reply)
    {
      xpc_dictionary_set_string(reply, "error", "Wrong XPC message");
      xpc_connection_send_message(v6, reply);
    }
    goto LABEL_59;
  }
  std::string::size_type v8 = (char *)xpc_dictionary_get_string(v5, "filename");
  if (!v8)
  {
    xpc_dictionary_set_string(reply, "error", "Filename was not specified");
    xpc_connection_send_message(v6, reply);
    goto LABEL_59;
  }
  std::string::size_type v9 = v6;
  v30[0] = v9;
  memset(&v30[1], 0, 24);
  sub_10000A63C(&__str, v8);
  *(void *)string = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v10 = xpc_dictionary_get_string(v5, "extensionToken");
  XpcSandbox::consumeExtension((XpcSandbox *)v30, v10);
  memset(&__p, 0, sizeof(__p));
  memset(&v44, 0, sizeof(v44));
  std::string::size_type v11 = std::string::rfind(&__str, 47, 0xFFFFFFFFFFFFFFFFLL);
  std::string::size_type v12 = std::string::rfind(&__str, 46, 0xFFFFFFFFFFFFFFFFLL);
  if (v11 != -1)
  {
    std::string::size_type v13 = v12;
    if (v12 != -1)
    {
      std::string::basic_string(&v47, &__str, v11 + 1, v12 - (v11 + 1), (std::allocator<char> *)v31);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      std::string __p = v47;
      std::string::basic_string(&v47, &__str, v13 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v31);
      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v44.__r_.__value_.__l.__data_);
      }
      std::string v44 = v47;
      if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v14 = (std::string *)((char *)&v44 + HIBYTE(v44.__r_.__value_.__r.__words[2]));
      }
      else {
        unint64_t v14 = (std::string *)(v44.__r_.__value_.__r.__words[0] + v44.__r_.__value_.__l.__size_);
      }
      if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v15 = &v44;
      }
      else {
        std::string::size_type v15 = (std::string *)v44.__r_.__value_.__r.__words[0];
      }
      while (v15 != v14)
      {
        v15->__r_.__value_.__s.__data_[0] = __tolower(v15->__r_.__value_.__s.__data_[0]);
        std::string::size_type v15 = (std::string *)((char *)v15 + 1);
      }
    }
  }
  sub_10000E3E4((void (__cdecl ***)(std::ifstream *__hidden))&v47);
  if (!v48) {
    goto LABEL_46;
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
  {
    if (v44.__r_.__value_.__l.__size_ == 3)
    {
      BOOL v18 = (std::string *)v44.__r_.__value_.__r.__words[0];
      if (*(_WORD *)v44.__r_.__value_.__l.__data_ != 25199 || *(unsigned char *)(v44.__r_.__value_.__r.__words[0] + 2) != 106)
      {
        if (*(_WORD *)v44.__r_.__value_.__l.__data_ != 29811 || *(unsigned char *)(v44.__r_.__value_.__r.__words[0] + 2) != 108) {
          goto LABEL_42;
        }
LABEL_61:
        StlConverter::StlConverter(v31, &v47, &__p);
        Stage = (void *)StlConverter::makeStage((StlConverter *)v31);
        StlConverter::~StlConverter((StlConverter *)v31);
        goto LABEL_47;
      }
LABEL_60:
      ObjConverter::ObjConverter(v31, &v47, &__p, &__str, v30);
      Stage = ObjConverter::makeStage((ObjConverter *)v31);
      ObjConverter::~ObjConverter((ObjConverter *)v31);
      goto LABEL_47;
    }
LABEL_46:
    Stage = 0;
    goto LABEL_47;
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) != 3) {
    goto LABEL_46;
  }
  if (LOWORD(v44.__r_.__value_.__l.__data_) == 25199 && v44.__r_.__value_.__s.__data_[2] == 106) {
    goto LABEL_60;
  }
  if (LOWORD(v44.__r_.__value_.__l.__data_) == 29811 && v44.__r_.__value_.__s.__data_[2] == 108) {
    goto LABEL_61;
  }
  BOOL v18 = &v44;
LABEL_42:
  int data_low = LOWORD(v18->__r_.__value_.__l.__data_);
  int v22 = v18->__r_.__value_.__s.__data_[2];
  if (data_low != 27760 || v22 != 121) {
    goto LABEL_46;
  }
  PlyConverter::PlyConverter(v31, &v47, &__p);
  Stage = PlyConverter::makeStage((PlyConverter *)v31);
  if (v42)
  {
    int v43 = v42;
    operator delete(v42);
  }
  if (v40)
  {
    int v41 = v40;
    operator delete(v40);
  }
  if (v38)
  {
    char v39 = v38;
    operator delete(v38);
  }
  if (v36)
  {
    uint64_t v37 = v36;
    operator delete(v36);
  }
  if (v34)
  {
    float v35 = v34;
    operator delete(v34);
  }
  if (v33 < 0) {
    operator delete(v32);
  }
  int v46 = (void **)v31;
  sub_100007C28(&v46);
LABEL_47:
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (Stage) {
      goto LABEL_51;
    }
LABEL_53:
    xpc_dictionary_set_string(reply, "error", "Can't load file.");
    goto LABEL_54;
  }
  if (!Stage) {
    goto LABEL_53;
  }
LABEL_51:
  serialize::Serializer::Serializer(&v47);
  int v25 = serialize::Serializer::save((uint64_t)&v47, (uint64_t)Stage);
  (*(void (**)(void *))(*(void *)Stage + 16))(Stage);
  xpc_dictionary_set_value(reply, "object", v25);
  xpc_dictionary_set_string(reply, "error", string);

LABEL_54:
  xpc_connection_send_message(v9, reply);
  if (SHIBYTE(v28) < 0) {
    operator delete(*(void **)string);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  XpcSandbox::~XpcSandbox((XpcSandbox *)v30);
LABEL_59:
}

void sub_10001593C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  sub_100015A50((uint64_t)&a26);
  sub_10000ECF4(&STACK[0x208]);
  if (a72 < 0) {
    operator delete(__p);
  }
  if (a74 < 0) {
    operator delete(a73);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  XpcSandbox::~XpcSandbox((XpcSandbox *)&a22);

  _Unwind_Resume(a1);
}

uint64_t sub_100015A50(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 144);
  if (v2)
  {
    *(void *)(a1 + 152) = v2;
    operator delete(v2);
  }
  id v3 = *(void **)(a1 + 120);
  if (v3)
  {
    *(void *)(a1 + 128) = v3;
    operator delete(v3);
  }
  id v4 = *(void **)(a1 + 96);
  if (v4)
  {
    *(void *)(a1 + 104) = v4;
    operator delete(v4);
  }
  id v5 = *(void **)(a1 + 72);
  if (v5)
  {
    *(void *)(a1 + 80) = v5;
    operator delete(v5);
  }
  unint64_t v6 = *(void **)(a1 + 48);
  if (v6)
  {
    *(void *)(a1 + 56) = v6;
    operator delete(v6);
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  std::string::size_type v8 = (void **)a1;
  sub_100007C28(&v8);
  return a1;
}

void sub_100015AE8(void **a1, void **a2, void **a3, uint64_t a4)
{
  BOOL v7 = *a1;
  if (v7)
  {
    *(void *)(a4 + 96) = v7;
    operator delete(v7);
  }
  std::string::size_type v8 = *a2;
  if (*a2)
  {
    *(void *)(a4 + 64) = v8;
    operator delete(v8);
  }
  std::string::size_type v9 = *a3;
  if (*a3)
  {
    *(void *)(a4 + 40) = v9;
    operator delete(v9);
  }
  uint64_t v10 = *(void **)a4;
  if (*(void *)a4)
  {
    *(void *)(a4 + 8) = v10;
    operator delete(v10);
  }
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return std::string::rfind(this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return std::string::compare(this, __s);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return std::string::erase(this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

std::string::iterator std::string::insert(std::string *this, std::string::const_iterator __pos, std::string::value_type __c)
{
  return std::string::insert(this, __pos, __c);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return std::string::replace(this, __pos, __n1, __s, __n2);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
}

uint64_t std::istream::read()
{
  return std::istream::read();
}

uint64_t std::istream::seekg()
{
  return std::istream::seekg();
}

{
  return std::istream::seekg();
}

uint64_t std::istream::tellg()
{
  return std::istream::tellg();
}

uint64_t std::istream::sentry::sentry()
{
  return std::istream::sentry::sentry();
}

uint64_t std::istream::~istream()
{
  return std::istream::~istream();
}

uint64_t std::istream::operator>>()
{
  return std::istream::operator>>();
}

{
  return std::istream::operator>>();
}

{
  return std::istream::operator>>();
}

{
  return std::istream::operator>>();
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

void std::locale::~locale(std::locale *this)
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
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return std::to_string(retstr, __val);
}

uint64_t std::operator+<char>()
{
  return std::operator+<char>();
}

void std::exception::~exception(std::exception *this)
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

void *__cdecl operator new(size_t __sz)
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

float nanf(const char *a1)
{
  return _nanf(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

double strtod(const char *a1, char **a2)
{
  return _strtod(a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_double(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}