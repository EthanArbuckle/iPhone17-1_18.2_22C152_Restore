uint64_t ETLDIAGLoggingGetDefaultView(capabilities::radio *a1)
{
  if (capabilities::radio::mav20Plus(a1)) {
    return 2;
  }
  else {
    return 0;
  }
}

void ETLDIAGCreateQMDL2Header(uint64_t a1)
{
  v2 = (unint64_t *)(a1 + 56);
  insertVectorFromData<unsigned int>((void *)(a1 + 56), ((*(_DWORD *)(a1 + 16) - *(_DWORD *)(a1 + 8)) & 0xFFFFFFF0)+ 47 * (*(_DWORD *)(a1 + 40) - *(_DWORD *)(a1 + 32))+ 14);
  v4 = *(char **)(a1 + 64);
  unint64_t v3 = *(void *)(a1 + 72);
  v5 = v4;
  if ((unint64_t)v4 < v3)
  {
    char *v4 = 2;
    v6 = v4 + 1;
    goto LABEL_32;
  }
  v7 = (char *)*v2;
  unint64_t v8 = (unint64_t)&v4[-*v2];
  unint64_t v9 = v8 + 1;
  if ((uint64_t)(v8 + 1) < 0) {
    goto LABEL_288;
  }
  unint64_t v10 = v3 - (void)v7;
  if (2 * v10 > v9) {
    unint64_t v9 = 2 * v10;
  }
  if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v11 = v9;
  }
  if (v11) {
    v12 = operator new(v11);
  }
  else {
    v12 = 0;
  }
  v13 = &v12[v8];
  v14 = &v12[v11];
  v12[v8] = 2;
  v6 = &v12[v8 + 1];
  if (v4 != v7)
  {
    if (v8 < 8 || (unint64_t)(v7 - v12) < 0x20) {
      goto LABEL_28;
    }
    if (v8 >= 0x20)
    {
      unint64_t v15 = v8 & 0xFFFFFFFFFFFFFFE0;
      v16 = (long long *)(v4 - 16);
      v17 = &v12[v4 - 16 - v7];
      unint64_t v18 = v8 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v19 = *v16;
        *(v17 - 1) = *(v16 - 1);
        _OWORD *v17 = v19;
        v17 -= 2;
        v16 -= 2;
        v18 -= 32;
      }
      while (v18);
      if (v8 == v15)
      {
LABEL_30:
        v5 = (char *)*v2;
        *(void *)(a1 + 56) = v12;
        *(void *)(a1 + 64) = v6;
        *(void *)(a1 + 72) = v14;
        if (!v5) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
      if ((v8 & 0x18) == 0)
      {
        v13 -= v15;
        v5 = &v4[-v15];
        goto LABEL_28;
      }
    }
    else
    {
      unint64_t v15 = 0;
    }
    v5 = &v4[-(v8 & 0xFFFFFFFFFFFFFFF8)];
    v13 -= v8 & 0xFFFFFFFFFFFFFFF8;
    v20 = &v4[-v15 - 8];
    v21 = &v12[v20 - v7];
    unint64_t v22 = v15 - (v8 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      uint64_t v23 = *(void *)v20;
      v20 -= 8;
      *v21-- = v23;
      v22 += 8;
    }
    while (v22);
    if (v8 == (v8 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_30;
    }
LABEL_28:
    v24 = v13 - 1;
    do
    {
      char v25 = *--v5;
      *v24-- = v25;
    }
    while (v5 != v7);
    goto LABEL_30;
  }
  *(void *)(a1 + 56) = v13;
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = v14;
  if (v4) {
LABEL_31:
  }
    operator delete(v5);
LABEL_32:
  *(void *)(a1 + 64) = v6;
  unint64_t v26 = *(void *)(a1 + 72);
  if ((unint64_t)v6 >= v26)
  {
    v28 = (unsigned char *)*v2;
    unint64_t v29 = (unint64_t)&v6[-*v2];
    unint64_t v30 = v29 + 1;
    if ((uint64_t)(v29 + 1) >= 0)
    {
      unint64_t v31 = v26 - (void)v28;
      if (2 * v31 > v30) {
        unint64_t v30 = 2 * v31;
      }
      if (v31 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v32 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v32 = v30;
      }
      if (v32) {
        v33 = operator new(v32);
      }
      else {
        v33 = 0;
      }
      v34 = &v33[v29];
      v35 = &v33[v32];
      v33[v29] = 1;
      uint64_t v27 = (uint64_t)&v33[v29 + 1];
      if (v6 == v28)
      {
        *(void *)(a1 + 56) = v34;
        *(void *)(a1 + 64) = v27;
        *(void *)(a1 + 72) = v35;
LABEL_52:
        operator delete(v6);
        goto LABEL_53;
      }
      if (v29 < 8 || (unint64_t)(v28 - v33) < 0x20)
      {
        v36 = v6;
        goto LABEL_47;
      }
      if (v29 >= 0x20)
      {
        unint64_t v193 = v29 & 0xFFFFFFFFFFFFFFE0;
        v194 = (long long *)(v6 - 16);
        v195 = &v33[v6 - 16 - v28];
        unint64_t v196 = v29 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v197 = *v194;
          *(v195 - 1) = *(v194 - 1);
          _OWORD *v195 = v197;
          v195 -= 2;
          v194 -= 2;
          v196 -= 32;
        }
        while (v196);
        if (v29 == v193) {
          goto LABEL_49;
        }
        if ((v29 & 0x18) == 0)
        {
          v34 -= v193;
          v36 = &v6[-v193];
LABEL_47:
          v37 = v34 - 1;
          do
          {
            char v38 = *--v36;
            *v37-- = v38;
          }
          while (v36 != v28);
          goto LABEL_49;
        }
      }
      else
      {
        unint64_t v193 = 0;
      }
      v36 = &v6[-(v29 & 0xFFFFFFFFFFFFFFF8)];
      v34 -= v29 & 0xFFFFFFFFFFFFFFF8;
      v198 = &v6[-v193 - 8];
      v199 = &v33[v198 - v28];
      unint64_t v200 = v193 - (v29 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v201 = *(void *)v198;
        v198 -= 8;
        *v199-- = v201;
        v200 += 8;
      }
      while (v200);
      if (v29 != (v29 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_47;
      }
LABEL_49:
      v6 = *(unsigned char **)(a1 + 56);
      *(void *)(a1 + 56) = v33;
      *(void *)(a1 + 64) = v27;
      *(void *)(a1 + 72) = v35;
      if (!v6) {
        goto LABEL_53;
      }
      goto LABEL_52;
    }
LABEL_288:
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  unsigned char *v6 = 1;
  uint64_t v27 = (uint64_t)(v6 + 1);
LABEL_53:
  *(void *)(a1 + 64) = v27;
  v206 = v2;
  insertVectorFromData<unsigned int>(v2, (*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 4);
  uint64_t v39 = *(void *)(a1 + 8);
  uint64_t v204 = *(void *)(a1 + 16);
  if (v39 == v204) {
    goto LABEL_91;
  }
  while (2)
  {
    insertVectorFromData<unsigned int>(v206, *(_DWORD *)v39);
    insertVectorFromData<unsigned short>(v206, *(_WORD *)(v39 + 4));
    insertVectorFromData<unsigned short>(v206, *(_WORD *)(v39 + 6));
    uint64_t v40 = 0;
    v41 = *(unsigned char **)(a1 + 64);
    do
    {
      char v43 = *(unsigned char *)(v39 + v40 + 8);
      unint64_t v44 = *(void *)(a1 + 72);
      if ((unint64_t)v41 < v44)
      {
        unsigned char *v41 = v43;
        uint64_t v42 = (uint64_t)(v41 + 1);
        goto LABEL_58;
      }
      unint64_t v45 = *v206;
      unint64_t v46 = (unint64_t)&v41[-*v206];
      unint64_t v47 = v46 + 1;
      if ((uint64_t)(v46 + 1) < 0) {
        goto LABEL_288;
      }
      unint64_t v48 = v44 - v45;
      if (2 * v48 > v47) {
        unint64_t v47 = 2 * v48;
      }
      if (v48 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v49 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v49 = v47;
      }
      if (!v49)
      {
        v50 = 0;
        v51 = &v41[-*v206];
        *(unsigned char *)unint64_t v46 = v43;
        uint64_t v42 = v46 + 1;
        if (v41 == (unsigned char *)v45) {
          goto LABEL_75;
        }
LABEL_70:
        if (v46 < 8
          || &v50[v46 - 1] - &v41[~v45] > (unint64_t)&v50[v46 - 1]
          || v45 > (unint64_t)(v41 - 1)
          || v45 - (unint64_t)v50 < 0x20)
        {
          v52 = v41;
        }
        else
        {
          if (v46 < 0x20)
          {
            unint64_t v55 = 0;
            goto LABEL_86;
          }
          unint64_t v55 = v46 & 0xFFFFFFFFFFFFFFE0;
          v56 = &v50[v46 - 16];
          v57 = (long long *)(v41 - 16);
          unint64_t v58 = v46 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            long long v59 = *v57;
            *((_OWORD *)v56 - 1) = *(v57 - 1);
            *(_OWORD *)v56 = v59;
            v56 -= 32;
            v57 -= 2;
            v58 -= 32;
          }
          while (v58);
          if (v46 == v55) {
            goto LABEL_74;
          }
          if ((v46 & 0x18) != 0)
          {
LABEL_86:
            v52 = &v41[-(v46 & 0xFFFFFFFFFFFFFFF8)];
            v51 -= v46 & 0xFFFFFFFFFFFFFFF8;
            v60 = &v41[-v55 - v45 - 8 + (void)v50];
            v61 = (uint64_t *)&v41[-v55 - 8];
            unint64_t v62 = v55 - (v46 & 0xFFFFFFFFFFFFFFF8);
            do
            {
              uint64_t v63 = *v61--;
              *v60-- = v63;
              v62 += 8;
            }
            while (v62);
            if (v46 == (v46 & 0xFFFFFFFFFFFFFFF8)) {
              goto LABEL_74;
            }
            goto LABEL_72;
          }
          v51 -= v55;
          v52 = &v41[-v55];
        }
LABEL_72:
        v53 = v51 - 1;
        do
        {
          char v54 = *--v52;
          *v53-- = v54;
        }
        while (v52 != (unsigned char *)v45);
LABEL_74:
        v41 = (unsigned char *)*v206;
        v51 = v50;
        goto LABEL_75;
      }
      v50 = (char *)operator new(v49);
      v51 = &v50[v46];
      v50[v46] = v43;
      uint64_t v42 = (uint64_t)&v50[v46 + 1];
      if (v41 != (unsigned char *)v45) {
        goto LABEL_70;
      }
LABEL_75:
      *(void *)(a1 + 56) = v51;
      *(void *)(a1 + 64) = v42;
      *(void *)(a1 + 72) = &v50[v49];
      if (v41) {
        operator delete(v41);
      }
LABEL_58:
      *(void *)(a1 + 64) = v42;
      ++v40;
      v41 = (unsigned char *)v42;
    }
    while (v40 != 8);
    v39 += 16;
    if (v39 != v204) {
      continue;
    }
    break;
  }
LABEL_91:
  v64 = v206;
  insertVectorFromData<unsigned int>(v206, *(_DWORD *)(a1 + 40) - *(_DWORD *)(a1 + 32));
  unint64_t v208 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v209 = 0x5AAAAAAAAAAAAAALL;
  __p = (void *)0xAAAA006D65646F6DLL;
  v65 = *(unsigned char **)(a1 + 32);
  v202 = *(unsigned char **)(a1 + 40);
  if (v65 == v202) {
    return;
  }
  unsigned int v205 = 0;
  v66 = *(unsigned char **)(a1 + 64);
  while (2)
  {
    v203 = v65;
    char v67 = *v65;
    unint64_t v68 = *(void *)(a1 + 72);
    if ((unint64_t)v66 < v68)
    {
      unsigned char *v66 = v67;
      v69 = v66 + 1;
      goto LABEL_114;
    }
    v70 = (unsigned char *)*v64;
    unint64_t v71 = (unint64_t)&v66[-*v64];
    unint64_t v72 = v71 + 1;
    if ((uint64_t)(v71 + 1) < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v73 = v68 - (void)v70;
    if (2 * v73 > v72) {
      unint64_t v72 = 2 * v73;
    }
    if (v73 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v74 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v74 = v72;
    }
    if (!v74)
    {
      v75 = 0;
      v76 = &v66[-*v64];
      *(unsigned char *)unint64_t v71 = v67;
      v69 = (char *)(v71 + 1);
      if (v66 != v70) {
        goto LABEL_104;
      }
LABEL_112:
      *(void *)(a1 + 56) = v76;
      *(void *)(a1 + 64) = v69;
      *(void *)(a1 + 72) = &v75[v74];
      if (!v66) {
        goto LABEL_114;
      }
      goto LABEL_113;
    }
    v75 = operator new(v74);
    v76 = &v75[v71];
    v75[v71] = v67;
    v69 = &v75[v71 + 1];
    if (v66 == v70) {
      goto LABEL_112;
    }
LABEL_104:
    if (v71 < 8 || (unint64_t)(v70 - v75) < 0x20)
    {
      v77 = v66;
      goto LABEL_107;
    }
    if (v71 >= 0x20)
    {
      unint64_t v100 = v71 & 0xFFFFFFFFFFFFFFE0;
      v101 = &v75[v71 - 16];
      v102 = (long long *)(v66 - 16);
      unint64_t v103 = v71 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v104 = *v102;
        *(v101 - 1) = *(v102 - 1);
        _OWORD *v101 = v104;
        v101 -= 2;
        v102 -= 2;
        v103 -= 32;
      }
      while (v103);
      if (v71 != v100)
      {
        if ((v71 & 0x18) == 0)
        {
          v76 -= v100;
          v77 = &v66[-v100];
          goto LABEL_107;
        }
        goto LABEL_148;
      }
    }
    else
    {
      unint64_t v100 = 0;
LABEL_148:
      v77 = &v66[-(v71 & 0xFFFFFFFFFFFFFFF8)];
      v76 -= v71 & 0xFFFFFFFFFFFFFFF8;
      v105 = &v75[&v66[-v100] - v70 - 8];
      v106 = (uint64_t *)&v66[-v100 - 8];
      unint64_t v107 = v100 - (v71 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v108 = *v106--;
        *v105-- = v108;
        v107 += 8;
      }
      while (v107);
      if (v71 != (v71 & 0xFFFFFFFFFFFFFFF8))
      {
LABEL_107:
        v78 = v76 - 1;
        do
        {
          char v79 = *--v77;
          *v78-- = v79;
        }
        while (v77 != v70);
      }
    }
    v66 = (unsigned char *)*v64;
    *(void *)(a1 + 56) = v75;
    *(void *)(a1 + 64) = v69;
    *(void *)(a1 + 72) = &v75[v74];
    if (v66) {
LABEL_113:
    }
      operator delete(v66);
LABEL_114:
    *(void *)(a1 + 64) = v69;
    if (v209 >= 0) {
      p_p = (char *)&__p;
    }
    else {
      p_p = (char *)__p;
    }
    if (v209 >= 0) {
      unint64_t v81 = HIBYTE(v209);
    }
    else {
      unint64_t v81 = v208;
    }
    if ((uint64_t)v81 < 1) {
      goto LABEL_185;
    }
    uint64_t v82 = *(void *)(a1 + 72);
    if (v82 - (uint64_t)v69 >= (uint64_t)v81)
    {
      v92 = p_p;
      v93 = v69;
      if (v81 < 0x20) {
        goto LABEL_295;
      }
      v92 = p_p;
      v93 = v69;
      if ((unint64_t)(v69 - p_p) < 0x20) {
        goto LABEL_295;
      }
      v92 = &p_p[v81 & 0xFFFFFFFFFFFFFFE0];
      v93 = &v69[v81 & 0xFFFFFFFFFFFFFFE0];
      v94 = v69 + 16;
      v95 = (long long *)(p_p + 16);
      unint64_t v96 = v81 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v97 = *v95;
        *(v94 - 1) = *(v95 - 1);
        _OWORD *v94 = v97;
        v94 += 2;
        v95 += 2;
        v96 -= 32;
      }
      while (v96);
      if (v81 != (v81 & 0x7FFFFFFFFFFFFFE0))
      {
LABEL_295:
        do
        {
          char v98 = *v92++;
          *v93++ = v98;
        }
        while (v92 != &p_p[v81]);
      }
      *(void *)(a1 + 64) = v93;
      goto LABEL_185;
    }
    v83 = *(char **)(a1 + 56);
    unint64_t v84 = v69 - v83;
    uint64_t v85 = v69 - v83 + v81;
    if (v85 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v86 = v82 - (void)v83;
    if (2 * v86 > v85) {
      uint64_t v85 = 2 * v86;
    }
    if (v86 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v87 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v87 = v85;
    }
    if (!v87)
    {
      v88 = 0;
      v89 = (char *)(v69 - v83);
      v90 = (char *)(v84 + v81);
      if (v81 >= 8) {
        goto LABEL_139;
      }
LABEL_130:
      v91 = v89;
      goto LABEL_162;
    }
    v88 = (char *)operator new(v87);
    v89 = &v88[v84];
    v90 = &v88[v84 + v81];
    if (v81 < 8) {
      goto LABEL_130;
    }
LABEL_139:
    v91 = v89;
    if ((char *)(&v88[(void)v69] - v83 - (void)p_p) < (char *)0x20)
    {
      do
      {
LABEL_162:
        char v117 = *p_p++;
        *v91++ = v117;
      }
      while (v91 != v90);
      goto LABEL_163;
    }
    if (v81 >= 0x20)
    {
      uint64_t v99 = v81 & 0x7FFFFFFFFFFFFFE0;
      v109 = (long long *)(p_p + 16);
      v110 = &v88[v84 + 16];
      unint64_t v111 = v81 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v112 = *v109;
        *((_OWORD *)v110 - 1) = *(v109 - 1);
        *(_OWORD *)v110 = v112;
        v109 += 2;
        v110 += 32;
        v111 -= 32;
      }
      while (v111);
      if (v81 == v99) {
        goto LABEL_163;
      }
      if ((v81 & 0x18) != 0) {
        goto LABEL_156;
      }
      p_p += v99;
      v91 = &v89[v99];
      goto LABEL_162;
    }
    uint64_t v99 = 0;
LABEL_156:
    v91 = &v89[v81 & 0xFFFFFFFFFFFFFFF8];
    v113 = (uint64_t *)&p_p[v99];
    v114 = &v88[&v69[v99] - v83];
    unint64_t v115 = v99 - (v81 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      uint64_t v116 = *v113++;
      *(void *)v114 = v116;
      v114 += 8;
      v115 += 8;
    }
    while (v115);
    p_p += v81 & 0xFFFFFFFFFFFFFFF8;
    if (v81 != (v81 & 0x7FFFFFFFFFFFFFF8)) {
      goto LABEL_162;
    }
LABEL_163:
    if (v69 == v83)
    {
      uint64_t v119 = 0;
      v64 = v206;
    }
    else
    {
      if (v84 < 8)
      {
        v118 = v69;
        goto LABEL_179;
      }
      v118 = v69;
      if ((unint64_t)(v83 - v88) < 0x20) {
        goto LABEL_179;
      }
      if (v84 >= 0x20)
      {
        unint64_t v120 = v84 & 0xFFFFFFFFFFFFFFE0;
        v121 = &v88[v84 - 16];
        v122 = v69 - 16;
        unint64_t v123 = v84 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v124 = *(_OWORD *)v122;
          *((_OWORD *)v121 - 1) = *((_OWORD *)v122 - 1);
          *(_OWORD *)v121 = v124;
          v121 -= 32;
          v122 -= 32;
          v123 -= 32;
        }
        while (v123);
        if (v84 != v120)
        {
          if ((v84 & 0x18) == 0)
          {
            v89 -= v120;
            v118 = &v69[-v120];
            goto LABEL_179;
          }
          goto LABEL_174;
        }
      }
      else
      {
        unint64_t v120 = 0;
LABEL_174:
        v118 = &v69[-(v84 & 0xFFFFFFFFFFFFFFF8)];
        v89 -= v84 & 0xFFFFFFFFFFFFFFF8;
        v125 = &v88[&v69[-v120] - v83 - 8];
        v126 = &v69[-v120 - 8];
        unint64_t v127 = v120 - (v84 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          uint64_t v128 = *(void *)v126;
          v126 -= 8;
          *(void *)v125 = v128;
          v125 -= 8;
          v127 += 8;
        }
        while (v127);
        if (v84 != (v84 & 0xFFFFFFFFFFFFFFF8))
        {
LABEL_179:
          v129 = v89 - 1;
          do
          {
            char v130 = *--v118;
            *v129-- = v130;
          }
          while (v118 != v83);
        }
      }
      v131 = *(unsigned char **)(a1 + 64);
      v89 = v88;
      uint64_t v119 = v131 - v69;
      v64 = v206;
      if (v131 != v69) {
        memmove(v90, v69, v131 - v69);
      }
    }
    v132 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v89;
    *(void *)(a1 + 64) = &v90[v119];
    *(void *)(a1 + 72) = &v88[v87];
    if (v132) {
      operator delete(v132);
    }
LABEL_185:
    unint64_t v133 = HIBYTE(v209);
    if (v209 < 0) {
      unint64_t v133 = v208;
    }
    if (v133 == 30) {
      goto LABEL_238;
    }
    size_t v134 = 30 - v133;
    v136 = *(char **)(a1 + 64);
    uint64_t v135 = *(void *)(a1 + 72);
    if (v135 - (uint64_t)v136 >= v134)
    {
      if (v134)
      {
        bzero(*(void **)(a1 + 64), v134);
        *(void *)(a1 + 64) = &v136[v134];
      }
      else
      {
        v146 = *(unsigned char **)(a1 + 64);
        *(void *)(a1 + 64) = v146;
        if (v146 != v136) {
          memmove(v136, v136, v146 - v136);
        }
        bzero(v136, 0);
      }
      goto LABEL_238;
    }
    v137 = *(char **)(a1 + 56);
    unint64_t v138 = v136 - v137;
    uint64_t v139 = v136 - v137 + v134;
    if (v139 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v140 = v135 - (void)v137;
    if (2 * v140 > v139) {
      uint64_t v139 = 2 * v140;
    }
    if (v140 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v141 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v141 = v139;
    }
    if (!v141)
    {
      v142 = 0;
      v143 = (char *)(v136 - v137);
      v144 = (char *)(v138 + v134);
      v145 = (char *)(v136 - v137);
      if (v134 >= 8) {
        goto LABEL_204;
      }
      goto LABEL_215;
    }
    v142 = (char *)operator new(v141);
    v143 = &v142[v138];
    v144 = &v142[v138 + v134];
    v145 = &v142[v138];
    if (v134 < 8)
    {
      do
LABEL_215:
        *v145++ = 0;
      while (v145 != v144);
      goto LABEL_216;
    }
LABEL_204:
    if (v134 >= 0x20)
    {
      unint64_t v147 = v134 & 0xFFFFFFFFFFFFFFE0;
      v148 = &v142[v138 + 16];
      unint64_t v149 = v134 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        *((_OWORD *)v148 - 1) = 0uLL;
        *(_OWORD *)v148 = 0uLL;
        v148 += 32;
        v149 -= 32;
      }
      while (v149);
      if (v134 == v147) {
        goto LABEL_216;
      }
      if ((v134 & 0x18) != 0) {
        goto LABEL_210;
      }
      v145 = &v143[v147];
      goto LABEL_215;
    }
    unint64_t v147 = 0;
LABEL_210:
    v145 = &v143[v134 & 0xFFFFFFFFFFFFFFF8];
    v150 = &v142[&v136[v147] - v137];
    unint64_t v151 = v147 - (v134 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      *(void *)v150 = 0;
      v150 += 8;
      v151 += 8;
    }
    while (v151);
    if (v134 != (v134 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_215;
    }
LABEL_216:
    if (v136 == v137)
    {
      uint64_t v153 = 0;
    }
    else
    {
      if (v138 < 8)
      {
        v152 = v136;
        goto LABEL_232;
      }
      v152 = v136;
      if ((unint64_t)(v137 - v142) < 0x20) {
        goto LABEL_232;
      }
      if (v138 >= 0x20)
      {
        unint64_t v154 = v138 & 0xFFFFFFFFFFFFFFE0;
        v155 = &v142[v138 - 16];
        v156 = v136 - 16;
        unint64_t v157 = v138 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v158 = *(_OWORD *)v156;
          *((_OWORD *)v155 - 1) = *((_OWORD *)v156 - 1);
          *(_OWORD *)v155 = v158;
          v155 -= 32;
          v156 -= 32;
          v157 -= 32;
        }
        while (v157);
        if (v138 != v154)
        {
          if ((v138 & 0x18) == 0)
          {
            v143 -= v154;
            v152 = &v136[-v154];
            goto LABEL_232;
          }
          goto LABEL_227;
        }
      }
      else
      {
        unint64_t v154 = 0;
LABEL_227:
        v152 = &v136[-(v138 & 0xFFFFFFFFFFFFFFF8)];
        v143 -= v138 & 0xFFFFFFFFFFFFFFF8;
        v159 = &v142[&v136[-v154] - v137 - 8];
        v160 = &v136[-v154 - 8];
        unint64_t v161 = v154 - (v138 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          uint64_t v162 = *(void *)v160;
          v160 -= 8;
          *(void *)v159 = v162;
          v159 -= 8;
          v161 += 8;
        }
        while (v161);
        if (v138 != (v138 & 0xFFFFFFFFFFFFFFF8))
        {
LABEL_232:
          v163 = v143 - 1;
          do
          {
            char v164 = *--v152;
            *v163-- = v164;
          }
          while (v152 != v137);
        }
      }
      v165 = *(unsigned char **)(a1 + 64);
      v143 = v142;
      uint64_t v153 = v165 - v136;
      if (v165 != v136) {
        memmove(v144, v136, v165 - v136);
      }
    }
    v166 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v143;
    *(void *)(a1 + 64) = &v144[v153];
    *(void *)(a1 + 72) = &v142[v141];
    v64 = v206;
    if (v166) {
      operator delete(v166);
    }
LABEL_238:
    uint64_t v167 = *(void *)(a1 + 8);
    insertVectorFromData<unsigned int>(v64, *(_DWORD *)(v167 + 16 * v205));
    uint64_t v168 = v205;
    uint64_t v169 = v167 + 16 * v205;
    insertVectorFromData<unsigned short>(v64, *(_WORD *)(v169 + 4));
    insertVectorFromData<unsigned short>(v64, *(_WORD *)(v169 + 6));
    uint64_t v170 = 0;
    ++v205;
    v66 = *(unsigned char **)(a1 + 64);
    while (2)
    {
      while (1)
      {
        char v171 = *(unsigned char *)(v167 + 16 * v168 + v170 + 8);
        unint64_t v172 = *(void *)(a1 + 72);
        if ((unint64_t)v66 >= v172) {
          break;
        }
        *v66++ = v171;
        *(void *)(a1 + 64) = v66;
        if (++v170 == 8) {
          goto LABEL_93;
        }
      }
      unint64_t v173 = *v64;
      unint64_t v174 = (unint64_t)&v66[-v173];
      uint64_t v175 = (uint64_t)&v66[-v173 + 1];
      if (v175 < 0) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v176 = v172 - v173;
      if (2 * v176 > v175) {
        uint64_t v175 = 2 * v176;
      }
      if (v176 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v177 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v177 = v175;
      }
      if (v177)
      {
        v178 = operator new(v177);
        v179 = (char *)v178 + v174;
        *((unsigned char *)v178 + v174) = v171;
        uint64_t v180 = (uint64_t)v178 + v174 + 1;
        if (v66 != (unsigned char *)v173)
        {
LABEL_249:
          if (v174 < 8
            || v178 > &v66[(void)v178 - v173 - 1]
            || v173 > (unint64_t)(v66 - 1)
            || v173 - (unint64_t)v178 < 0x20)
          {
            v181 = v66;
          }
          else if (v174 >= 0x20)
          {
            unint64_t v184 = v174 & 0xFFFFFFFFFFFFFFE0;
            v185 = (char *)v178 + v174 - 16;
            v186 = (long long *)(v66 - 16);
            unint64_t v187 = v174 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v188 = *v186;
              *(v185 - 1) = *(v186 - 1);
              _OWORD *v185 = v188;
              v185 -= 2;
              v186 -= 2;
              v187 -= 32;
            }
            while (v187);
            if (v174 == v184) {
              goto LABEL_253;
            }
            if ((v174 & 0x18) != 0) {
              goto LABEL_269;
            }
            v179 -= v184;
            v181 = &v66[-v184];
          }
          else
          {
            unint64_t v184 = 0;
LABEL_269:
            v181 = &v66[-(v174 & 0xFFFFFFFFFFFFFFF8)];
            v179 -= v174 & 0xFFFFFFFFFFFFFFF8;
            v189 = &v66[-v184 - v173 - 8 + (void)v178];
            v190 = (uint64_t *)&v66[-v184 - 8];
            unint64_t v191 = v184 - (v174 & 0xFFFFFFFFFFFFFFF8);
            do
            {
              uint64_t v192 = *v190--;
              *v189-- = v192;
              v191 += 8;
            }
            while (v191);
            if (v174 == (v174 & 0xFFFFFFFFFFFFFFF8))
            {
LABEL_253:
              v64 = v206;
              v66 = (unsigned char *)*v206;
              *(void *)(a1 + 56) = v178;
              *(void *)(a1 + 64) = v180;
              *(void *)(a1 + 72) = (char *)v178 + v177;
              if (v66) {
                goto LABEL_254;
              }
              goto LABEL_255;
            }
          }
          v182 = v179 - 1;
          do
          {
            char v183 = *--v181;
            *v182-- = v183;
          }
          while (v181 != (unsigned char *)v173);
          goto LABEL_253;
        }
      }
      else
      {
        v178 = 0;
        v179 = &v66[-v173];
        *(unsigned char *)unint64_t v174 = v171;
        uint64_t v180 = v174 + 1;
        if (v66 != (unsigned char *)v173) {
          goto LABEL_249;
        }
      }
      v64 = v206;
      *(void *)(a1 + 56) = v179;
      *(void *)(a1 + 64) = v180;
      *(void *)(a1 + 72) = (char *)v178 + v177;
      if (v66) {
LABEL_254:
      }
        operator delete(v66);
LABEL_255:
      v66 = (unsigned char *)v180;
      *(void *)(a1 + 64) = v180;
      if (++v170 != 8) {
        continue;
      }
      break;
    }
LABEL_93:
    v65 = v203 + 1;
    if (v203 + 1 != v202) {
      continue;
    }
    break;
  }
  if (SHIBYTE(v209) < 0) {
    operator delete(__p);
  }
}

void sub_21E230E08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void insertVectorFromData<unsigned int>(void *a1, int a2)
{
  v5 = (char *)a1[1];
  unint64_t v4 = a1[2];
  v6 = v5;
  if ((unint64_t)v5 < v4)
  {
    char *v5 = a2;
    v7 = v5 + 1;
    goto LABEL_31;
  }
  unint64_t v8 = (char *)*a1;
  unint64_t v9 = (unint64_t)&v5[-*a1];
  unint64_t v10 = v9 + 1;
  if ((uint64_t)(v9 + 1) < 0) {
    goto LABEL_128;
  }
  unint64_t v11 = v4 - (void)v8;
  if (2 * v11 > v10) {
    unint64_t v10 = 2 * v11;
  }
  if (v11 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v12 = v10;
  }
  if (v12)
  {
    v13 = operator new(v12);
    v14 = &v13[v9];
    unint64_t v15 = &v13[v12];
    v13[v9] = a2;
    v7 = &v13[v9 + 1];
    if (v5 != v8)
    {
LABEL_11:
      if (v9 < 8 || (unint64_t)(v8 - v13) < 0x20) {
        goto LABEL_27;
      }
      if (v9 >= 0x20)
      {
        unint64_t v16 = v9 & 0xFFFFFFFFFFFFFFE0;
        v17 = (long long *)(v5 - 16);
        unint64_t v18 = &v13[v5 - 16 - v8];
        unint64_t v19 = v9 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v20 = *v17;
          *(v18 - 1) = *(v17 - 1);
          *unint64_t v18 = v20;
          v18 -= 2;
          v17 -= 2;
          v19 -= 32;
        }
        while (v19);
        if (v9 == v16)
        {
LABEL_29:
          v6 = (char *)*a1;
          *a1 = v13;
          a1[1] = v7;
          a1[2] = v15;
          if (!v6) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        if ((v9 & 0x18) == 0)
        {
          v14 -= v16;
          v6 = &v5[-v16];
          goto LABEL_27;
        }
      }
      else
      {
        unint64_t v16 = 0;
      }
      v6 = &v5[-(v9 & 0xFFFFFFFFFFFFFFF8)];
      v14 -= v9 & 0xFFFFFFFFFFFFFFF8;
      v21 = &v5[-v16 - 8];
      unint64_t v22 = &v13[v21 - v8];
      unint64_t v23 = v16 - (v9 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v24 = *(void *)v21;
        v21 -= 8;
        *v22-- = v24;
        v23 += 8;
      }
      while (v23);
      if (v9 == (v9 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_29;
      }
LABEL_27:
      char v25 = v14 - 1;
      do
      {
        char v26 = *--v6;
        *v25-- = v26;
      }
      while (v6 != v8);
      goto LABEL_29;
    }
  }
  else
  {
    v13 = 0;
    v14 = &v5[-*a1];
    unint64_t v15 = 0;
    *(unsigned char *)unint64_t v9 = a2;
    v7 = (char *)(v9 + 1);
    if (v5 != v8) {
      goto LABEL_11;
    }
  }
  *a1 = v14;
  a1[1] = v7;
  a1[2] = v15;
  if (v5) {
LABEL_30:
  }
    operator delete(v6);
LABEL_31:
  a1[1] = v7;
  unint64_t v27 = a1[2];
  if ((unint64_t)v7 >= v27)
  {
    unint64_t v30 = (char *)*a1;
    unint64_t v31 = (unint64_t)&v7[-*a1];
    unint64_t v32 = v31 + 1;
    if ((uint64_t)(v31 + 1) < 0) {
      goto LABEL_128;
    }
    unint64_t v33 = v27 - (void)v30;
    if (2 * v33 > v32) {
      unint64_t v32 = 2 * v33;
    }
    if (v33 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v34 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v34 = v32;
    }
    if (v34) {
      v35 = operator new(v34);
    }
    else {
      v35 = 0;
    }
    v36 = &v35[v31];
    v37 = &v35[v34];
    v35[v31] = BYTE1(a2);
    v28 = &v35[v31 + 1];
    if (v7 == v30)
    {
      *a1 = v36;
      a1[1] = v28;
      a1[2] = v37;
LABEL_54:
      operator delete(v7);
      a1[1] = v28;
      unint64_t v29 = a1[2];
      if ((unint64_t)v28 < v29) {
        goto LABEL_51;
      }
      goto LABEL_55;
    }
    if (v31 < 8 || (unint64_t)(v30 - v35) < 0x20)
    {
      char v38 = v7;
      goto LABEL_47;
    }
    if (v31 >= 0x20)
    {
      unint64_t v66 = v31 & 0xFFFFFFFFFFFFFFE0;
      v69 = (long long *)(v7 - 16);
      v70 = &v35[v7 - 16 - v30];
      unint64_t v71 = v31 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v72 = *v69;
        *(v70 - 1) = *(v69 - 1);
        _OWORD *v70 = v72;
        v70 -= 2;
        v69 -= 2;
        v71 -= 32;
      }
      while (v71);
      if (v31 == v66) {
        goto LABEL_49;
      }
      if ((v31 & 0x18) == 0)
      {
        v36 -= v66;
        char v38 = &v7[-v66];
LABEL_47:
        uint64_t v39 = v36 - 1;
        do
        {
          char v40 = *--v38;
          *v39-- = v40;
        }
        while (v38 != v30);
        goto LABEL_49;
      }
    }
    else
    {
      unint64_t v66 = 0;
    }
    char v38 = &v7[-(v31 & 0xFFFFFFFFFFFFFFF8)];
    v36 -= v31 & 0xFFFFFFFFFFFFFFF8;
    unint64_t v73 = &v7[-v66 - 8];
    size_t v74 = &v35[v73 - v30];
    unint64_t v75 = v66 - (v31 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      uint64_t v76 = *(void *)v73;
      v73 -= 8;
      *v74-- = v76;
      v75 += 8;
    }
    while (v75);
    if (v31 != (v31 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_47;
    }
LABEL_49:
    v7 = (char *)*a1;
    *a1 = v35;
    a1[1] = v28;
    a1[2] = v37;
    if (!v7)
    {
      a1[1] = v28;
      unint64_t v29 = a1[2];
      if ((unint64_t)v28 < v29) {
        goto LABEL_51;
      }
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  char *v7 = BYTE1(a2);
  v28 = v7 + 1;
  a1[1] = v7 + 1;
  unint64_t v29 = a1[2];
  if ((unint64_t)(v7 + 1) < v29)
  {
LABEL_51:
    char *v28 = BYTE2(a2);
    v41 = v28 + 1;
    a1[1] = v28 + 1;
    unint64_t v42 = a1[2];
    if ((unint64_t)(v28 + 1) < v42) {
      goto LABEL_72;
    }
LABEL_75:
    unint64_t v55 = (char *)*a1;
    unint64_t v56 = (unint64_t)&v41[-*a1];
    unint64_t v57 = v56 + 1;
    if ((uint64_t)(v56 + 1) >= 0)
    {
      unint64_t v58 = v42 - (void)v55;
      if (2 * v58 > v57) {
        unint64_t v57 = 2 * v58;
      }
      if (v58 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v59 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v59 = v57;
      }
      if (v59) {
        v60 = operator new(v59);
      }
      else {
        v60 = 0;
      }
      v61 = &v60[v56];
      unint64_t v62 = &v60[v59];
      v60[v56] = HIBYTE(a2);
      uint64_t v54 = (uint64_t)&v60[v56 + 1];
      if (v41 == v55)
      {
        *a1 = v61;
        a1[1] = v54;
        a1[2] = v62;
LABEL_93:
        operator delete(v41);
        goto LABEL_94;
      }
      if (v56 < 8 || (unint64_t)(v55 - v60) < 0x20)
      {
        uint64_t v63 = v41;
        goto LABEL_88;
      }
      if (v56 >= 0x20)
      {
        unint64_t v68 = v56 & 0xFFFFFFFFFFFFFFE0;
        uint64_t v85 = (long long *)(v41 - 16);
        unint64_t v86 = &v60[v41 - 16 - v55];
        unint64_t v87 = v56 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v88 = *v85;
          *(v86 - 1) = *(v85 - 1);
          *unint64_t v86 = v88;
          v86 -= 2;
          v85 -= 2;
          v87 -= 32;
        }
        while (v87);
        if (v56 == v68) {
          goto LABEL_90;
        }
        if ((v56 & 0x18) == 0)
        {
          v61 -= v68;
          uint64_t v63 = &v41[-v68];
LABEL_88:
          v64 = v61 - 1;
          do
          {
            char v65 = *--v63;
            *v64-- = v65;
          }
          while (v63 != v55);
          goto LABEL_90;
        }
      }
      else
      {
        unint64_t v68 = 0;
      }
      uint64_t v63 = &v41[-(v56 & 0xFFFFFFFFFFFFFFF8)];
      v61 -= v56 & 0xFFFFFFFFFFFFFFF8;
      v89 = &v41[-v68 - 8];
      v90 = &v60[v89 - v55];
      unint64_t v91 = v68 - (v56 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v92 = *(void *)v89;
        v89 -= 8;
        *v90-- = v92;
        v91 += 8;
      }
      while (v91);
      if (v56 != (v56 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_88;
      }
LABEL_90:
      v41 = (char *)*a1;
      *a1 = v60;
      a1[1] = v54;
      a1[2] = v62;
      if (!v41) {
        goto LABEL_94;
      }
      goto LABEL_93;
    }
LABEL_128:
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
LABEL_55:
  char v43 = (char *)*a1;
  unint64_t v44 = (unint64_t)&v28[-*a1];
  unint64_t v45 = v44 + 1;
  if ((uint64_t)(v44 + 1) < 0) {
    goto LABEL_128;
  }
  unint64_t v46 = v29 - (void)v43;
  if (2 * v46 > v45) {
    unint64_t v45 = 2 * v46;
  }
  if (v46 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v47 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v47 = v45;
  }
  if (v47) {
    unint64_t v48 = operator new(v47);
  }
  else {
    unint64_t v48 = 0;
  }
  size_t v49 = &v48[v44];
  v50 = &v48[v47];
  v48[v44] = BYTE2(a2);
  v41 = &v48[v44 + 1];
  if (v28 == v43)
  {
    *a1 = v49;
    a1[1] = v41;
    a1[2] = v50;
    goto LABEL_74;
  }
  if (v44 < 8 || (unint64_t)(v43 - v48) < 0x20)
  {
    v51 = v28;
    goto LABEL_68;
  }
  if (v44 >= 0x20)
  {
    unint64_t v67 = v44 & 0xFFFFFFFFFFFFFFE0;
    v77 = (long long *)(v28 - 16);
    v78 = &v48[v28 - 16 - v43];
    unint64_t v79 = v44 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v80 = *v77;
      *(v78 - 1) = *(v77 - 1);
      _OWORD *v78 = v80;
      v78 -= 2;
      v77 -= 2;
      v79 -= 32;
    }
    while (v79);
    if (v44 == v67) {
      goto LABEL_70;
    }
    if ((v44 & 0x18) == 0)
    {
      v49 -= v67;
      v51 = &v28[-v67];
LABEL_68:
      v52 = v49 - 1;
      do
      {
        char v53 = *--v51;
        *v52-- = v53;
      }
      while (v51 != v43);
      goto LABEL_70;
    }
  }
  else
  {
    unint64_t v67 = 0;
  }
  v51 = &v28[-(v44 & 0xFFFFFFFFFFFFFFF8)];
  v49 -= v44 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v81 = &v28[-v67 - 8];
  uint64_t v82 = &v48[v81 - v43];
  unint64_t v83 = v67 - (v44 & 0xFFFFFFFFFFFFFFF8);
  do
  {
    uint64_t v84 = *(void *)v81;
    v81 -= 8;
    *v82-- = v84;
    v83 += 8;
  }
  while (v83);
  if (v44 != (v44 & 0xFFFFFFFFFFFFFFF8)) {
    goto LABEL_68;
  }
LABEL_70:
  v28 = (char *)*a1;
  *a1 = v48;
  a1[1] = v41;
  a1[2] = v50;
  if (!v28)
  {
    a1[1] = v41;
    unint64_t v42 = a1[2];
    if ((unint64_t)v41 >= v42) {
      goto LABEL_75;
    }
    goto LABEL_72;
  }
LABEL_74:
  operator delete(v28);
  a1[1] = v41;
  unint64_t v42 = a1[2];
  if ((unint64_t)v41 >= v42) {
    goto LABEL_75;
  }
LABEL_72:
  char *v41 = HIBYTE(a2);
  uint64_t v54 = (uint64_t)(v41 + 1);
LABEL_94:
  a1[1] = v54;
}

void insertVectorFromData<unsigned short>(void *a1, __int16 a2)
{
  v5 = (char *)a1[1];
  unint64_t v4 = a1[2];
  v6 = v5;
  if ((unint64_t)v5 < v4)
  {
    char *v5 = a2;
    v7 = v5 + 1;
    goto LABEL_31;
  }
  unint64_t v8 = (char *)*a1;
  unint64_t v9 = (unint64_t)&v5[-*a1];
  unint64_t v10 = v9 + 1;
  if ((uint64_t)(v9 + 1) < 0) {
    goto LABEL_64;
  }
  unint64_t v11 = v4 - (void)v8;
  if (2 * v11 > v10) {
    unint64_t v10 = 2 * v11;
  }
  if (v11 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v12 = v10;
  }
  if (v12)
  {
    v13 = operator new(v12);
    v14 = &v13[v9];
    unint64_t v15 = &v13[v12];
    v13[v9] = a2;
    v7 = &v13[v9 + 1];
    if (v5 != v8)
    {
LABEL_11:
      if (v9 < 8 || (unint64_t)(v8 - v13) < 0x20) {
        goto LABEL_27;
      }
      if (v9 >= 0x20)
      {
        unint64_t v16 = v9 & 0xFFFFFFFFFFFFFFE0;
        v17 = (long long *)(v5 - 16);
        unint64_t v18 = &v13[v5 - 16 - v8];
        unint64_t v19 = v9 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v20 = *v17;
          *(v18 - 1) = *(v17 - 1);
          *unint64_t v18 = v20;
          v18 -= 2;
          v17 -= 2;
          v19 -= 32;
        }
        while (v19);
        if (v9 == v16)
        {
LABEL_29:
          v6 = (char *)*a1;
          *a1 = v13;
          a1[1] = v7;
          a1[2] = v15;
          if (!v6) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        if ((v9 & 0x18) == 0)
        {
          v14 -= v16;
          v6 = &v5[-v16];
          goto LABEL_27;
        }
      }
      else
      {
        unint64_t v16 = 0;
      }
      v6 = &v5[-(v9 & 0xFFFFFFFFFFFFFFF8)];
      v14 -= v9 & 0xFFFFFFFFFFFFFFF8;
      v21 = &v5[-v16 - 8];
      unint64_t v22 = &v13[v21 - v8];
      unint64_t v23 = v16 - (v9 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v24 = *(void *)v21;
        v21 -= 8;
        *v22-- = v24;
        v23 += 8;
      }
      while (v23);
      if (v9 == (v9 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_29;
      }
LABEL_27:
      char v25 = v14 - 1;
      do
      {
        char v26 = *--v6;
        *v25-- = v26;
      }
      while (v6 != v8);
      goto LABEL_29;
    }
  }
  else
  {
    v13 = 0;
    v14 = &v5[-*a1];
    unint64_t v15 = 0;
    *(unsigned char *)unint64_t v9 = a2;
    v7 = (char *)(v9 + 1);
    if (v5 != v8) {
      goto LABEL_11;
    }
  }
  *a1 = v14;
  a1[1] = v7;
  a1[2] = v15;
  if (v5) {
LABEL_30:
  }
    operator delete(v6);
LABEL_31:
  a1[1] = v7;
  unint64_t v27 = a1[2];
  if ((unint64_t)v7 >= v27)
  {
    unint64_t v29 = (char *)*a1;
    unint64_t v30 = (unint64_t)&v7[-*a1];
    unint64_t v31 = v30 + 1;
    if ((uint64_t)(v30 + 1) >= 0)
    {
      unint64_t v32 = v27 - (void)v29;
      if (2 * v32 > v31) {
        unint64_t v31 = 2 * v32;
      }
      if (v32 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v33 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v33 = v31;
      }
      if (v33) {
        size_t v34 = operator new(v33);
      }
      else {
        size_t v34 = 0;
      }
      v35 = &v34[v30];
      v36 = &v34[v33];
      v34[v30] = HIBYTE(a2);
      uint64_t v28 = (uint64_t)&v34[v30 + 1];
      if (v7 == v29)
      {
        *a1 = v35;
        a1[1] = v28;
        a1[2] = v36;
LABEL_51:
        operator delete(v7);
        goto LABEL_52;
      }
      if (v30 < 8 || (unint64_t)(v29 - v34) < 0x20)
      {
        v37 = v7;
        goto LABEL_46;
      }
      if (v30 >= 0x20)
      {
        unint64_t v40 = v30 & 0xFFFFFFFFFFFFFFE0;
        v41 = (long long *)(v7 - 16);
        unint64_t v42 = &v34[v7 - 16 - v29];
        unint64_t v43 = v30 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v44 = *v41;
          *(v42 - 1) = *(v41 - 1);
          *unint64_t v42 = v44;
          v42 -= 2;
          v41 -= 2;
          v43 -= 32;
        }
        while (v43);
        if (v30 == v40) {
          goto LABEL_48;
        }
        if ((v30 & 0x18) == 0)
        {
          v35 -= v40;
          v37 = &v7[-v40];
LABEL_46:
          char v38 = v35 - 1;
          do
          {
            char v39 = *--v37;
            *v38-- = v39;
          }
          while (v37 != v29);
          goto LABEL_48;
        }
      }
      else
      {
        unint64_t v40 = 0;
      }
      v37 = &v7[-(v30 & 0xFFFFFFFFFFFFFFF8)];
      v35 -= v30 & 0xFFFFFFFFFFFFFFF8;
      unint64_t v45 = &v7[-v40 - 8];
      unint64_t v46 = &v34[v45 - v29];
      unint64_t v47 = v40 - (v30 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v48 = *(void *)v45;
        v45 -= 8;
        *v46-- = v48;
        v47 += 8;
      }
      while (v47);
      if (v30 != (v30 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_46;
      }
LABEL_48:
      v7 = (char *)*a1;
      *a1 = v34;
      a1[1] = v28;
      a1[2] = v36;
      if (!v7) {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
LABEL_64:
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  char *v7 = HIBYTE(a2);
  uint64_t v28 = (uint64_t)(v7 + 1);
LABEL_52:
  a1[1] = v28;
}

void ETLDIAGLoggingGetGUIDString(unsigned int *a1@<X0>, std::string *a2@<X8>)
{
  memset(a2, 170, sizeof(std::string));
  *((unsigned char *)&a2->__r_.__value_.__s + 23) = 0;
  a2->__r_.__value_.__s.__data_[0] = 0;
  if (!a1) {
    return;
  }
  ctu::hex0((ctu *)*a1);
  unint64_t v4 = std::string::append(&v32, "-", 1uLL);
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  int64_t v34 = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  if (v34 >= 0) {
    v6 = __p;
  }
  else {
    v6 = (void **)__p[0];
  }
  if (v34 >= 0) {
    std::string::size_type v7 = HIBYTE(v34);
  }
  else {
    std::string::size_type v7 = (std::string::size_type)__p[1];
  }
  std::string::append(a2, (const std::string::value_type *)v6, v7);
  if (SHIBYTE(v34) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_10;
    }
  }
  else if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_10;
  }
  operator delete(v32.__r_.__value_.__l.__data_);
LABEL_10:
  ctu::hex0((ctu *)*((unsigned __int16 *)a1 + 2));
  unint64_t v8 = std::string::append(&v32, "-", 1uLL);
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  int64_t v34 = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if (v34 >= 0) {
    unint64_t v10 = __p;
  }
  else {
    unint64_t v10 = (void **)__p[0];
  }
  if (v34 >= 0) {
    std::string::size_type v11 = HIBYTE(v34);
  }
  else {
    std::string::size_type v11 = (std::string::size_type)__p[1];
  }
  std::string::append(a2, (const std::string::value_type *)v10, v11);
  if (SHIBYTE(v34) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_18;
    }
  }
  else if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_18;
  }
  operator delete(v32.__r_.__value_.__l.__data_);
LABEL_18:
  ctu::hex0((ctu *)*((unsigned __int16 *)a1 + 3));
  size_t v12 = std::string::append(&v32, "-", 1uLL);
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  int64_t v34 = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  if (v34 >= 0) {
    v14 = __p;
  }
  else {
    v14 = (void **)__p[0];
  }
  if (v34 >= 0) {
    std::string::size_type v15 = HIBYTE(v34);
  }
  else {
    std::string::size_type v15 = (std::string::size_type)__p[1];
  }
  std::string::append(a2, (const std::string::value_type *)v14, v15);
  if (SHIBYTE(v34) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_26;
    }
LABEL_95:
    operator delete(v32.__r_.__value_.__l.__data_);
    goto LABEL_26;
  }
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_95;
  }
LABEL_26:
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 8));
  if (v34 >= 0) {
    unint64_t v16 = __p;
  }
  else {
    unint64_t v16 = (void **)__p[0];
  }
  if (v34 >= 0) {
    std::string::size_type v17 = HIBYTE(v34);
  }
  else {
    std::string::size_type v17 = (std::string::size_type)__p[1];
  }
  std::string::append(a2, (const std::string::value_type *)v16, v17);
  if (SHIBYTE(v34) < 0) {
    operator delete(__p[0]);
  }
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 9));
  if (v34 >= 0) {
    unint64_t v18 = __p;
  }
  else {
    unint64_t v18 = (void **)__p[0];
  }
  if (v34 >= 0) {
    std::string::size_type v19 = HIBYTE(v34);
  }
  else {
    std::string::size_type v19 = (std::string::size_type)__p[1];
  }
  std::string::append(a2, (const std::string::value_type *)v18, v19);
  if (SHIBYTE(v34) < 0) {
    operator delete(__p[0]);
  }
  std::string::append(a2, "-", 1uLL);
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 10));
  if (v34 >= 0) {
    long long v20 = __p;
  }
  else {
    long long v20 = (void **)__p[0];
  }
  if (v34 >= 0) {
    std::string::size_type v21 = HIBYTE(v34);
  }
  else {
    std::string::size_type v21 = (std::string::size_type)__p[1];
  }
  std::string::append(a2, (const std::string::value_type *)v20, v21);
  if (SHIBYTE(v34) < 0) {
    operator delete(__p[0]);
  }
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 11));
  if (v34 >= 0) {
    unint64_t v22 = __p;
  }
  else {
    unint64_t v22 = (void **)__p[0];
  }
  if (v34 >= 0) {
    std::string::size_type v23 = HIBYTE(v34);
  }
  else {
    std::string::size_type v23 = (std::string::size_type)__p[1];
  }
  std::string::append(a2, (const std::string::value_type *)v22, v23);
  if (SHIBYTE(v34) < 0) {
    operator delete(__p[0]);
  }
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 12));
  if (v34 >= 0) {
    uint64_t v24 = __p;
  }
  else {
    uint64_t v24 = (void **)__p[0];
  }
  if (v34 >= 0) {
    std::string::size_type v25 = HIBYTE(v34);
  }
  else {
    std::string::size_type v25 = (std::string::size_type)__p[1];
  }
  std::string::append(a2, (const std::string::value_type *)v24, v25);
  if (SHIBYTE(v34) < 0) {
    operator delete(__p[0]);
  }
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 13));
  if (v34 >= 0) {
    char v26 = __p;
  }
  else {
    char v26 = (void **)__p[0];
  }
  if (v34 >= 0) {
    std::string::size_type v27 = HIBYTE(v34);
  }
  else {
    std::string::size_type v27 = (std::string::size_type)__p[1];
  }
  std::string::append(a2, (const std::string::value_type *)v26, v27);
  if (SHIBYTE(v34) < 0) {
    operator delete(__p[0]);
  }
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 14));
  if (v34 >= 0) {
    uint64_t v28 = __p;
  }
  else {
    uint64_t v28 = (void **)__p[0];
  }
  if (v34 >= 0) {
    std::string::size_type v29 = HIBYTE(v34);
  }
  else {
    std::string::size_type v29 = (std::string::size_type)__p[1];
  }
  std::string::append(a2, (const std::string::value_type *)v28, v29);
  if (SHIBYTE(v34) < 0) {
    operator delete(__p[0]);
  }
  ctu::hex0((ctu *)*((unsigned __int8 *)a1 + 15));
  if (v34 >= 0) {
    unint64_t v30 = __p;
  }
  else {
    unint64_t v30 = (void **)__p[0];
  }
  if (v34 >= 0) {
    std::string::size_type v31 = HIBYTE(v34);
  }
  else {
    std::string::size_type v31 = (std::string::size_type)__p[1];
  }
  std::string::append(a2, (const std::string::value_type *)v30, v31);
  if (SHIBYTE(v34) < 0) {
    operator delete(__p[0]);
  }
}

void sub_21E231BB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (*(char *)(v21 + 23) < 0) {
    operator delete(*(void **)v21);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ETLDIAGGetGUID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v131 = 0xAAAAAAAAAAAAAAAALL;
  long long v141 = v4;
  long long v140 = v4;
  long long v139 = v4;
  long long v138 = v4;
  long long v137 = v4;
  long long v136 = v4;
  long long v135 = v4;
  long long v134 = v4;
  long long v133 = v4;
  long long v130 = v4;
  long long v128 = v4;
  *(_OWORD *)__p = v4;
  long long v126 = v4;
  long long v127 = v4;
  long long v125 = v4;
  uint64_t v5 = MEMORY[0x263F8C340] + 64;
  uint64_t v132 = MEMORY[0x263F8C340] + 64;
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v124 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(uint64_t *)((char *)&v124 + *(void *)(v124 - 24)) = v6;
  std::string::size_type v7 = (std::ios_base *)((char *)&v124 + *(void *)(v124 - 24));
  std::ios_base::init(v7, &v125);
  uint64_t v8 = MEMORY[0x263F8C340] + 24;
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  uint64_t v124 = v8;
  uint64_t v132 = v5;
  long long v9 = (capabilities::radio *)std::streambuf::basic_streambuf();
  uint64_t v117 = MEMORY[0x263F8C318] + 16;
  *(void *)&long long v125 = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)__p = 0u;
  long long v130 = 0u;
  LODWORD(v131) = 16;
  uint64_t v121 = (uint64_t)&v121;
  v122 = &v121;
  uint64_t v123 = 0;
  if (!capabilities::radio::mavLegacy(v9))
  {
    LODWORD(__dst.__r_.__value_.__l.__data_) = 2070;
    p_dst = (int *)&__dst;
    unint64_t v18 = v122;
    if (v122 == &v121
      || (*((_DWORD *)v122 + 4) = 2070,
          std::string::size_type v19 = (uint64_t *)v18[1],
          p_dst = (int *)__dst.__r_.__value_.__r.__words + 1,
          v19 == &v121))
    {
      std::list<ETLDiagQueryGUIDSubSysCMDCode>::__insert_with_sentinel[abi:ne180100]<ETLDiagQueryGUIDSubSysCMDCode const*,ETLDiagQueryGUIDSubSysCMDCode const*>(&v121, &v121, p_dst, (int *)__dst.__r_.__value_.__r.__words + 1);
    }
    else
    {
      uint64_t v20 = v121;
      uint64_t v21 = *v19;
      *(void *)(v21 + 8) = *(void *)(v121 + 8);
      **(void **)(v20 + 8) = v21;
      do
      {
        unint64_t v22 = (uint64_t *)v19[1];
        --v123;
        operator delete(v19);
        std::string::size_type v19 = v22;
      }
      while (v22 != &v121);
    }
    goto LABEL_25;
  }
  LODWORD(__dst.__r_.__value_.__r.__words[2]) = 6680;
  *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = xmmword_21E236E5C;
  unint64_t v10 = v122;
  if (v122 == &v121)
  {
    std::string::size_type v23 = (int *)&__dst;
LABEL_24:
    std::list<ETLDiagQueryGUIDSubSysCMDCode>::__insert_with_sentinel[abi:ne180100]<ETLDiagQueryGUIDSubSysCMDCode const*,ETLDiagQueryGUIDSubSysCMDCode const*>(&v121, &v121, v23, (int *)&__dst.__r_.__value_.__r.__words[2] + 1);
    goto LABEL_25;
  }
  *((_DWORD *)v122 + 4) = __dst.__r_.__value_.__l.__data_;
  uint64_t v11 = v10[1];
  if ((uint64_t *)v11 == &v121)
  {
    uint64_t v16 = 1;
LABEL_23:
    std::string::size_type v23 = (int *)((char *)&__dst + 4 * v16);
    goto LABEL_24;
  }
  *(_DWORD *)(v11 + 16) = HIDWORD(__dst.__r_.__value_.__r.__words[0]);
  uint64_t v12 = *(void *)(v11 + 8);
  if ((uint64_t *)v12 == &v121)
  {
    uint64_t v16 = 2;
    goto LABEL_23;
  }
  *(_DWORD *)(v12 + 16) = __dst.__r_.__value_.__r.__words[1];
  uint64_t v13 = *(void *)(v12 + 8);
  if ((uint64_t *)v13 == &v121)
  {
    uint64_t v16 = 3;
    goto LABEL_23;
  }
  *(_DWORD *)(v13 + 16) = HIDWORD(__dst.__r_.__value_.__r.__words[1]);
  uint64_t v14 = *(void *)(v13 + 8);
  if ((uint64_t *)v14 == &v121)
  {
    uint64_t v16 = 4;
    goto LABEL_23;
  }
  *(_DWORD *)(v14 + 16) = __dst.__r_.__value_.__r.__words[2];
  std::string::size_type v15 = *(uint64_t **)(v14 + 8);
  uint64_t v16 = 5;
  if (v15 == &v121) {
    goto LABEL_23;
  }
  uint64_t v24 = v121;
  uint64_t v25 = *v15;
  *(void *)(v25 + 8) = *(void *)(v121 + 8);
  **(void **)(v24 + 8) = v25;
  do
  {
    char v26 = (uint64_t *)v15[1];
    --v123;
    operator delete(v15);
    std::string::size_type v15 = v26;
  }
  while (v26 != &v121);
LABEL_25:
  v118 = (const void **)&v127 + 1;
  int v27 = 9;
LABEL_26:
  int v28 = v27;
  std::ios_base::clear((std::ios_base *)((char *)&v124 + *(void *)(v124 - 24)), 0);
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 16) = *(void *)(a2 + 8);
  *(void *)(a2 + 40) = *(void *)(a2 + 32);
  *(void *)(a2 + 64) = *(void *)(a2 + 56);
  *(_DWORD *)(a2 + 80) = capabilities::diag::diagVersion(v29);
  _ETLDebugPrint();
  int v119 = v28;
  unint64_t v30 = v122;
  if (v122 == &v121) {
    goto LABEL_159;
  }
  char v31 = 0;
  do
  {
    while (1)
    {
      unsigned __int16 v120 = *(_DWORD *)(a2 + 80);
      ETLDiagGetSubsysCmdString();
      _ETLDebugPrint();
      _ETLDebugPrint();
      if ((ETLDiagCreateGUIDDB() & 1) == 0) {
        break;
      }
      std::ios_base::clear((std::ios_base *)((char *)&v124 + *(void *)(v124 - 24)), 0);
      ETLDiagGetSubsysCmdString();
      _ETLDebugPrint();
      _ETLDebugPrint();
      _ETLDebugPrint();
      _ETLDebugPrint();
      _ETLDebugPrint();
      _ETLDebugPrint();
      if (MEMORY[4])
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)"ETLDiagCreateGUIDDB failed with status: ", 40);
        std::ostream::operator<<();
        if ((v131 & 0x10) != 0)
        {
          uint64_t v89 = *((void *)&v130 + 1);
          v90 = (const void **)&v127 + 1;
          if (*((void *)&v130 + 1) < (unint64_t)v128)
          {
            *((void *)&v130 + 1) = v128;
            uint64_t v89 = v128;
            v90 = (const void **)&v127 + 1;
          }
        }
        else
        {
          if ((v131 & 8) == 0)
          {
            std::string::size_type v83 = 0;
            *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
            uint64_t v84 = &__dst;
            goto LABEL_145;
          }
          uint64_t v89 = v127;
          v90 = (const void **)&v126;
        }
        v93 = *v90;
        std::string::size_type v83 = v89 - (void)*v90;
        if (v83 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v83 >= 0x17)
        {
          uint64_t v94 = (v83 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v83 | 7) != 0x17) {
            uint64_t v94 = v83 | 7;
          }
          uint64_t v95 = v94 + 1;
          unint64_t v96 = (std::string *)operator new(v94 + 1);
          __dst.__r_.__value_.__l.__size_ = v83;
          __dst.__r_.__value_.__r.__words[2] = v95 | 0x8000000000000000;
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v96;
          uint64_t v84 = v96;
        }
        else
        {
          *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v89 - *(unsigned char *)v90;
          uint64_t v84 = &__dst;
          if (!v83) {
            goto LABEL_145;
          }
        }
        memmove(v84, v93, v83);
LABEL_145:
        v84->__r_.__value_.__s.__data_[v83] = 0;
        goto LABEL_156;
      }
      if (v120 != MEMORY[0xC])
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)"ETLDiagCreateGUIDDB request/response version mismatch: ", 55);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)"request ", 8);
        uint64_t v85 = (void *)std::ostream::operator<<();
        unint64_t v86 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v85, (uint64_t)", ", 2);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v86, (uint64_t)"response ", 9);
        std::ostream::operator<<();
        if ((v131 & 0x10) != 0)
        {
          uint64_t v91 = *((void *)&v130 + 1);
          uint64_t v92 = (const void **)&v127 + 1;
          if (*((void *)&v130 + 1) < (unint64_t)v128)
          {
            *((void *)&v130 + 1) = v128;
            uint64_t v91 = v128;
            uint64_t v92 = (const void **)&v127 + 1;
          }
        }
        else
        {
          if ((v131 & 8) == 0)
          {
            std::string::size_type v87 = 0;
            *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
            long long v88 = &__dst;
            goto LABEL_155;
          }
          uint64_t v91 = v127;
          uint64_t v92 = (const void **)&v126;
        }
        long long v97 = *v92;
        std::string::size_type v87 = v91 - (void)*v92;
        if (v87 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v87 >= 0x17)
        {
          uint64_t v98 = (v87 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v87 | 7) != 0x17) {
            uint64_t v98 = v87 | 7;
          }
          uint64_t v99 = v98 + 1;
          unint64_t v100 = (std::string *)operator new(v98 + 1);
          __dst.__r_.__value_.__l.__size_ = v87;
          __dst.__r_.__value_.__r.__words[2] = v99 | 0x8000000000000000;
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v100;
          long long v88 = v100;
        }
        else
        {
          *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v91 - *(unsigned char *)v92;
          long long v88 = &__dst;
          if (!v87)
          {
LABEL_155:
            v88->__r_.__value_.__s.__data_[v87] = 0;
LABEL_156:
            _ETLDebugPrint();
            if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__dst.__r_.__value_.__l.__data_);
            }
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)" [subsystem: ", 13);
            SubsysCmdString = (const char *)ETLDiagGetSubsysCmdString();
            size_t v102 = strlen(SubsysCmdString);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)SubsysCmdString, v102);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)"]", 1);
LABEL_159:
            if (!v119)
            {
              if ((v131 & 0x10) != 0)
              {
                uint64_t v105 = *((void *)&v130 + 1);
                if (*((void *)&v130 + 1) < (unint64_t)v128)
                {
                  *((void *)&v130 + 1) = v128;
                  uint64_t v105 = v128;
                }
              }
              else
              {
                if ((v131 & 8) == 0)
                {
                  std::string::size_type v103 = 0;
                  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
                  long long v104 = &__dst;
                  goto LABEL_175;
                }
                uint64_t v105 = v127;
                v118 = (const void **)&v126;
              }
              v106 = *v118;
              std::string::size_type v103 = v105 - (void)*v118;
              if (v103 > 0x7FFFFFFFFFFFFFF7) {
                std::string::__throw_length_error[abi:ne180100]();
              }
              if (v103 >= 0x17)
              {
                uint64_t v107 = (v103 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v103 | 7) != 0x17) {
                  uint64_t v107 = v103 | 7;
                }
                uint64_t v108 = v107 + 1;
                long long v104 = (std::string *)operator new(v107 + 1);
                __dst.__r_.__value_.__l.__size_ = v103;
                __dst.__r_.__value_.__r.__words[2] = v108 | 0x8000000000000000;
                __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v104;
              }
              else
              {
                *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v105 - *(unsigned char *)v118;
                long long v104 = &__dst;
                if (!v103)
                {
LABEL_175:
                  v104->__r_.__value_.__s.__data_[v103] = 0;
                  if (*(char *)(a3 + 23) < 0) {
                    operator delete(*(void **)a3);
                  }
                  uint64_t v109 = 0;
                  *(std::string *)a3 = __dst;
                  uint64_t v110 = v117;
                  *(unsigned char *)a2 = 0;
                  if (v123) {
                    goto LABEL_181;
                  }
                  goto LABEL_183;
                }
              }
              memmove(v104, v106, v103);
              goto LABEL_175;
            }
            usleep(0x7A120u);
            int v27 = v119 - 1;
            goto LABEL_26;
          }
        }
        memmove(v88, v97, v87);
        goto LABEL_155;
      }
      _ETLDebugPrint();
      if (MEMORY[0x11])
      {
        for (unint64_t i = 0; i < MEMORY[0x11]; ++i)
        {
          v35 = (_OWORD *)(MEMORY[0x12] + 20 * i);
          v37 = *(_OWORD **)(a2 + 16);
          unint64_t v36 = *(void *)(a2 + 24);
          if ((unint64_t)v37 < v36)
          {
            _OWORD *v37 = *v35;
            char v38 = v37 + 1;
            goto LABEL_49;
          }
          char v39 = *(_OWORD **)(a2 + 8);
          uint64_t v40 = v37 - v39;
          unint64_t v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 60) {
            std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v42 = v36 - (void)v39;
          if (v42 >> 3 > v41) {
            unint64_t v41 = v42 >> 3;
          }
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v43 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v43 = v41;
          }
          if (v43)
          {
            if (v43 >> 60) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            long long v44 = (char *)operator new(16 * v43);
            unint64_t v45 = &v44[16 * v40];
            *(_OWORD *)unint64_t v45 = *v35;
            uint64_t v46 = (uint64_t)v45;
            if (v37 == v39)
            {
LABEL_47:
              char v38 = v45 + 16;
              *(void *)(a2 + 8) = v46;
              *(void *)(a2 + 16) = v45 + 16;
              *(void *)(a2 + 24) = &v44[16 * v43];
              if (!v37) {
                goto LABEL_49;
              }
LABEL_48:
              operator delete(v37);
              goto LABEL_49;
            }
          }
          else
          {
            long long v44 = 0;
            unint64_t v45 = (char *)(16 * v40);
            *(_OWORD *)(16 * v40) = *v35;
            uint64_t v46 = 16 * v40;
            if (v37 == v39) {
              goto LABEL_47;
            }
          }
          do
          {
            *(_OWORD *)(v46 - 16) = *(v37 - 1);
            v46 -= 16;
            --v37;
          }
          while (v37 != v39);
          v37 = *(_OWORD **)(a2 + 8);
          char v38 = v45 + 16;
          *(void *)(a2 + 8) = v46;
          *(void *)(a2 + 16) = v45 + 16;
          *(void *)(a2 + 24) = &v44[16 * v43];
          if (v37) {
            goto LABEL_48;
          }
LABEL_49:
          *(void *)(a2 + 16) = v38;
          ETLDIAGLoggingGetGUIDString((unsigned int *)(MEMORY[0x12] + 20 * i), &__dst);
          _ETLDebugPrint();
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__dst.__r_.__value_.__l.__data_);
            if (MEMORY[0xC] == 3)
            {
LABEL_53:
              unint64_t v47 = (unsigned char *)(MEMORY[0x12] + 21 * i + 20);
              size_t v49 = *(unsigned char **)(a2 + 40);
              unint64_t v48 = *(void *)(a2 + 48);
              if ((unint64_t)v49 < v48)
              {
                *size_t v49 = *v47;
                uint64_t v50 = (uint64_t)(v49 + 1);
LABEL_65:
                *(void *)(a2 + 40) = v50;
                _ETLDebugPrint();
                continue;
              }
              v51 = *(unsigned char **)(a2 + 32);
              unint64_t v52 = v49 - v51;
              uint64_t v53 = v49 - v51 + 1;
              if (v53 < 0) {
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v54 = v48 - (void)v51;
              if (2 * v54 > v53) {
                uint64_t v53 = 2 * v54;
              }
              if (v54 >= 0x3FFFFFFFFFFFFFFFLL) {
                size_t v55 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                size_t v55 = v53;
              }
              if (v55)
              {
                unint64_t v56 = operator new(v55);
                unint64_t v57 = &v56[v52];
                v56[v52] = *v47;
                uint64_t v50 = (uint64_t)&v56[v52 + 1];
                if (v49 == v51)
                {
LABEL_63:
                  *(void *)(a2 + 32) = v57;
                  *(void *)(a2 + 40) = v50;
                  *(void *)(a2 + 48) = &v56[v55];
                  if (!v49) {
                    goto LABEL_65;
                  }
LABEL_64:
                  operator delete(v49);
                  goto LABEL_65;
                }
              }
              else
              {
                unint64_t v56 = 0;
                unint64_t v57 = (char *)(v49 - v51);
                *(unsigned char *)unint64_t v52 = *v47;
                uint64_t v50 = v52 + 1;
                if (v49 == v51) {
                  goto LABEL_63;
                }
              }
              if (v52 >= 8 && (unint64_t)(v51 - v56) >= 0x20)
              {
                if (v52 >= 0x20)
                {
                  unint64_t v58 = v52 & 0xFFFFFFFFFFFFFFE0;
                  size_t v59 = &v56[v52 - 16];
                  v60 = (long long *)(v49 - 16);
                  unint64_t v61 = v52 & 0xFFFFFFFFFFFFFFE0;
                  do
                  {
                    long long v62 = *v60;
                    *(v59 - 1) = *(v60 - 1);
                    *size_t v59 = v62;
                    v59 -= 2;
                    v60 -= 2;
                    v61 -= 32;
                  }
                  while (v61);
                  if (v52 == v58) {
                    goto LABEL_86;
                  }
                  if ((v52 & 0x18) != 0) {
                    goto LABEL_79;
                  }
                  v57 -= v58;
                  v49 -= v58;
                }
                else
                {
                  unint64_t v58 = 0;
LABEL_79:
                  v57 -= v52 & 0xFFFFFFFFFFFFFFF8;
                  uint64_t v63 = &v56[&v49[-v58] - v51 - 8];
                  v64 = (uint64_t *)&v49[-v58 - 8];
                  unint64_t v65 = v58 - (v52 & 0xFFFFFFFFFFFFFFF8);
                  do
                  {
                    uint64_t v66 = *v64--;
                    *v63-- = v66;
                    v65 += 8;
                  }
                  while (v65);
                  v49 -= v52 & 0xFFFFFFFFFFFFFFF8;
                  if (v52 == (v52 & 0xFFFFFFFFFFFFFFF8))
                  {
LABEL_86:
                    size_t v49 = *(unsigned char **)(a2 + 32);
                    *(void *)(a2 + 32) = v56;
                    *(void *)(a2 + 40) = v50;
                    *(void *)(a2 + 48) = &v56[v55];
                    if (!v49) {
                      goto LABEL_65;
                    }
                    goto LABEL_64;
                  }
                }
              }
              unint64_t v67 = v57 - 1;
              do
              {
                char v68 = *--v49;
                *v67-- = v68;
              }
              while (v49 != v51);
              goto LABEL_86;
            }
          }
          else if (MEMORY[0xC] == 3)
          {
            goto LABEL_53;
          }
        }
      }
      ETLDiagReleaseGUIDDB();
      unint64_t v30 = (uint64_t *)v30[1];
      char v31 = 1;
      if (v30 == &v121) {
        goto LABEL_91;
      }
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)" ", 1);
    std::string v32 = (const char *)ETLDiagGetSubsysCmdString();
    size_t v33 = strlen(v32);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)v32, v33);
    ETLDiagGetSubsysCmdString();
    _ETLDebugPrint();
    unint64_t v30 = (uint64_t *)v30[1];
  }
  while (v30 != &v121);
  if ((v31 & 1) == 0) {
    goto LABEL_159;
  }
LABEL_91:
  if (*(void *)(a2 + 8) == *(void *)(a2 + 16))
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)"All subsystems returned empty GUID", 34);
    if ((v131 & 0x10) != 0)
    {
      uint64_t v75 = *((void *)&v130 + 1);
      uint64_t v76 = (const void **)&v127 + 1;
      if (*((void *)&v130 + 1) < (unint64_t)v128)
      {
        *((void *)&v130 + 1) = v128;
        uint64_t v75 = v128;
        uint64_t v76 = (const void **)&v127 + 1;
      }
    }
    else
    {
      if ((v131 & 8) == 0)
      {
        std::string::size_type v71 = 0;
        *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
        long long v72 = &__dst;
        goto LABEL_123;
      }
      uint64_t v75 = v127;
      uint64_t v76 = (const void **)&v126;
    }
    long long v80 = *v76;
    std::string::size_type v71 = v75 - (void)*v76;
    if (v71 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v71 >= 0x17)
    {
      uint64_t v81 = (v71 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v71 | 7) != 0x17) {
        uint64_t v81 = v71 | 7;
      }
      uint64_t v82 = v81 + 1;
      long long v72 = (std::string *)operator new(v81 + 1);
      __dst.__r_.__value_.__l.__size_ = v71;
      __dst.__r_.__value_.__r.__words[2] = v82 | 0x8000000000000000;
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v72;
    }
    else
    {
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v75 - *(unsigned char *)v76;
      long long v72 = &__dst;
      if (!v71) {
        goto LABEL_123;
      }
    }
    memmove(v72, v80, v71);
LABEL_123:
    v72->__r_.__value_.__s.__data_[v71] = 0;
LABEL_124:
    _ETLDebugPrint();
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
    goto LABEL_159;
  }
  if (*(_DWORD *)(a2 + 80) != 3) {
    goto LABEL_180;
  }
  if (*(void *)(a2 + 32) == *(void *)(a2 + 40))
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124, (uint64_t)"All subsystems returned empty DIAG ID", 37);
    if ((v131 & 0x10) != 0)
    {
      uint64_t v73 = *((void *)&v130 + 1);
      size_t v74 = (const void **)&v127 + 1;
      if (*((void *)&v130 + 1) < (unint64_t)v128)
      {
        *((void *)&v130 + 1) = v128;
        uint64_t v73 = v128;
        size_t v74 = (const void **)&v127 + 1;
      }
    }
    else
    {
      if ((v131 & 8) == 0)
      {
        std::string::size_type v69 = 0;
        *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 0;
        v70 = &__dst;
        goto LABEL_113;
      }
      uint64_t v73 = v127;
      size_t v74 = (const void **)&v126;
    }
    v77 = *v74;
    std::string::size_type v69 = v73 - (void)*v74;
    if (v69 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v69 >= 0x17)
    {
      uint64_t v78 = (v69 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v69 | 7) != 0x17) {
        uint64_t v78 = v69 | 7;
      }
      uint64_t v79 = v78 + 1;
      v70 = (std::string *)operator new(v78 + 1);
      __dst.__r_.__value_.__l.__size_ = v69;
      __dst.__r_.__value_.__r.__words[2] = v79 | 0x8000000000000000;
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v70;
    }
    else
    {
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v73 - *(unsigned char *)v74;
      v70 = &__dst;
      if (!v69) {
        goto LABEL_113;
      }
    }
    memmove(v70, v77, v69);
LABEL_113:
    v70->__r_.__value_.__s.__data_[v69] = 0;
    goto LABEL_124;
  }
  ETLDIAGCreateQMDL2Header(a2);
LABEL_180:
  uint64_t v109 = 1;
  uint64_t v110 = v117;
  *(unsigned char *)a2 = 1;
  if (v123)
  {
LABEL_181:
    uint64_t v112 = v121;
    unint64_t v111 = v122;
    uint64_t v113 = *v122;
    *(void *)(v113 + 8) = *(void *)(v121 + 8);
    **(void **)(v112 + 8) = v113;
    uint64_t v123 = 0;
    if (v111 != &v121)
    {
      do
      {
        v114 = (uint64_t *)v111[1];
        operator delete(v111);
        unint64_t v111 = v114;
      }
      while (v114 != &v121);
    }
  }
LABEL_183:
  uint64_t v124 = *MEMORY[0x263F8C2C8];
  *(uint64_t *)((char *)&v124 + *(void *)(v124 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *(void *)&long long v125 = v110;
  if (SBYTE7(v130) < 0) {
    operator delete(__p[0]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x223C23880](&v132);
  return v109;
}

void sub_21E232D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  std::list<ETLDiagQueryGUIDSubSysCMDCode>::~list((uint64_t *)va);
  std::ostringstream::~ostringstream((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t *std::list<ETLDiagQueryGUIDSubSysCMDCode>::~list(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v3 = *a1;
    v2 = (uint64_t *)a1[1];
    uint64_t v4 = *v2;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v3 + 8) = v4;
    a1[2] = 0;
    if (v2 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v2[1];
        operator delete(v2);
        v2 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
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
  MEMORY[0x223C23880](a1 + 112);
  return a1;
}

uint64_t ETLADPLLoggingEnable()
{
  return ETLMaverickADPLEnable();
}

uint64_t ETLQDSSLoggingEnable()
{
  return ETLMaverickQDSSEnable();
}

uint64_t ETLDIAGLoggingConfigure(capabilities::diag *a1, uint64_t a2)
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AC2DD68, memory_order_acquire) & 1) == 0)
  {
    v37 = (capabilities::diag *)__cxa_guard_acquire(&qword_26AC2DD68);
    if (v37)
    {
      capabilities::diag::supportedInterfaces(v37);
      capabilities::diag::operator|();
      _MergedGlobals = capabilities::diag::operator&() == 0;
      __cxa_guard_release(&qword_26AC2DD68);
    }
  }
  uint64_t v4 = *(unsigned int (**)(void))(*(void *)a1 + 56);
  if (!v4) {
    return 0;
  }
  if (!v4() || *((void *)a1 + 1) == 0) {
    return 0;
  }
  _ETLDebugPrint();
  if (_MergedGlobals) {
    _ETLDIAGLoggingPing((uint64_t)a1, a2);
  }
  if ((*((_DWORD *)a1 + 4) | 2) == 2)
  {
    uint64_t v6 = _ETLDIAGLoggingMSGSwitch(a1, 0, a2);
    BOOL v7 = 0;
    if (!v6) {
      goto LABEL_64;
    }
  }
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v48 = v8;
  long long v49 = v8;
  *(_OWORD *)__p = v8;
  long long v47 = v8;
  int EnabledEquipIDs = ETLDMCLogGetEnabledEquipIDs();
  if (!EnabledEquipIDs)
  {
    uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "No log equip ID found in DMC file", 0x21uLL);
LABEL_63:
    BOOL v7 = 0;
    goto LABEL_64;
  }
  if (!*((unsigned char *)a1 + 20)) {
    ETLFlushResponseFull();
  }
  for (uint64_t i = 0; i != EnabledEquipIDs; ++i)
  {
    v42.__r_.__value_.__r.__words[0] = 0;
    LODWORD(v41.__r_.__value_.__l.__data_) = 0;
    ETLLOGEquipIDAsString();
    _ETLDebugPrint();
    if ((ETLDMCLogGetMask() & 1) == 0)
    {
      uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to get log mask from DMC", 0x1FuLL);
      goto LABEL_63;
    }
    if ((ETLLOGSetMaskWithRetry() & 1) == 0)
    {
      uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to set log masks", 0x17uLL);
      goto LABEL_63;
    }
  }
  int NumRanges = ETLDMCEventGetNumRanges();
  if (!NumRanges)
  {
    uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "No event ranges found in DMC file", 0x21uLL);
    goto LABEL_63;
  }
  _ETLDebugPrint();
  int v12 = 1;
  while (1)
  {
    if (*(char *)(a2 + 23) < 0)
    {
      **(unsigned char **)a2 = 0;
      *(void *)(a2 + 8) = 0;
      if (*((unsigned char *)a1 + 20)) {
        goto LABEL_27;
      }
    }
    else
    {
      *(unsigned char *)a2 = 0;
      *(unsigned char *)(a2 + 23) = 0;
      if (*((unsigned char *)a1 + 20)) {
        goto LABEL_27;
      }
    }
    ETLFlushResponseFull();
LABEL_27:
    _ETLDebugPrint();
    if (ETLEVENTEnable()) {
      break;
    }
    uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to enable events", 0x17uLL);
LABEL_21:
    if (++v12 == 4) {
      goto LABEL_63;
    }
  }
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v76 = v13;
  long long v77 = v13;
  long long v74 = v13;
  long long v75 = v13;
  long long v72 = v13;
  long long v73 = v13;
  long long v70 = v13;
  long long v71 = v13;
  long long v68 = v13;
  long long v69 = v13;
  long long v66 = v13;
  long long v67 = v13;
  long long v64 = v13;
  long long v65 = v13;
  long long v62 = v13;
  long long v63 = v13;
  long long v60 = v13;
  long long v61 = v13;
  long long v58 = v13;
  long long v59 = v13;
  long long v56 = v13;
  long long v57 = v13;
  long long v54 = v13;
  long long v55 = v13;
  long long v52 = v13;
  long long v53 = v13;
  long long v50 = v13;
  long long v51 = v13;
  long long v48 = v13;
  long long v49 = v13;
  *(_OWORD *)__p = v13;
  long long v47 = v13;
  unsigned int v44 = 0;
  uint64_t v6 = ETLEVENTGetMask();
  if ((v6 & 1) == 0)
  {
    uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to get current event mask", 0x20uLL);
    goto LABEL_21;
  }
  if (v44 > 0x1000)
  {
    if (*(char *)(a2 + 23) < 0)
    {
      *(void *)(a2 + 8) = 22;
      std::string::size_type v29 = *(char **)a2;
    }
    else
    {
      *(unsigned char *)(a2 + 23) = 22;
      std::string::size_type v29 = (char *)a2;
    }
    BOOL v7 = 0;
    strcpy(v29, "Invalid event bit mask");
    goto LABEL_64;
  }
  bzero(__p, ((unint64_t)v44 + 7) >> 3);
  int v14 = 0;
  while (2)
  {
    int __val = -1431655766;
    if ((ETLDMCEventGetRange() & 1) == 0)
    {
      uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to get event range from DMC", 0x22uLL);
      goto LABEL_21;
    }
    if (v44 < HIWORD(__val))
    {
      std::to_string(&v40, HIWORD(__val));
      uint64_t v17 = std::string::insert(&v40, 0, "Invalid event range: event range last (from DMC): ", 0x32uLL);
      long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
      v41.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v18;
      v17->__r_.__value_.__l.__size_ = 0;
      v17->__r_.__value_.__r.__words[2] = 0;
      v17->__r_.__value_.__r.__words[0] = 0;
      std::string::size_type v19 = std::string::append(&v41, ", maskBits (from BBFW): ", 0x18uLL);
      long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
      v42.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v20;
      v19->__r_.__value_.__l.__size_ = 0;
      v19->__r_.__value_.__r.__words[2] = 0;
      v19->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v39, v44);
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v21 = &v39;
      }
      else {
        uint64_t v21 = (std::string *)v39.__r_.__value_.__r.__words[0];
      }
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v39.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v39.__r_.__value_.__l.__size_;
      }
      uint64_t v6 = (uint64_t)std::string::append(&v42, (const std::string::value_type *)v21, size);
      uint64_t v23 = *(void *)v6;
      v45[0] = *(void *)(v6 + 8);
      *(void *)((char *)v45 + 7) = *(void *)(v6 + 15);
      char v24 = *(unsigned char *)(v6 + 23);
      *(void *)(v6 + 8) = 0;
      *(void *)(v6 + 16) = 0;
      *(void *)uint64_t v6 = 0;
      if (*(char *)(a2 + 23) < 0)
      {
        char v38 = v24;
        operator delete(*(void **)a2);
        char v24 = v38;
      }
      *(void *)a2 = v23;
      *(void *)(a2 + 8) = v45[0];
      *(void *)(a2 + 15) = *(void *)((char *)v45 + 7);
      *(unsigned char *)(a2 + 23) = v24;
      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v39.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_50:
          if ((SHIBYTE(v41.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_51;
          }
          goto LABEL_57;
        }
      }
      else if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_50;
      }
      operator delete(v42.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v41.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_51:
        if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_21;
        }
LABEL_58:
        operator delete(v40.__r_.__value_.__l.__data_);
        goto LABEL_21;
      }
LABEL_57:
      operator delete(v41.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_58;
    }
    unsigned int v15 = (unsigned __int16)__val;
    if ((unsigned __int16)__val <= HIWORD(__val))
    {
      int v16 = HIWORD(__val) + 1;
      do
      {
        *((unsigned char *)__p + ((unint64_t)v15 >> 3)) |= 1 << (v15 & 7);
        ++v15;
      }
      while (v16 != v15);
    }
    if (++v14 != NumRanges) {
      continue;
    }
    break;
  }
  if ((ETLEVENTSetMask() & 1) == 0)
  {
    uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to set event masks", 0x19uLL);
    goto LABEL_21;
  }
  if (!dword_26AC2DD60)
  {
    ETLMESSAGEGetSubsystemIDRanges();
    if (dword_26AC2DD60 < 0x81)
    {
      _ETLDebugPrint();
      if (dword_26AC2DD60)
      {
        unint64_t v35 = 0;
        unint64_t v36 = &word_26AC2DD7A;
        do
        {
          _ETLDebugPrint();
          ++v35;
          v36 += 2;
        }
        while (v35 < dword_26AC2DD60);
      }
      goto LABEL_94;
    }
    uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "Received more message ranges than expected", 0x2AuLL);
    goto LABEL_63;
  }
LABEL_94:
  int v30 = ETLDMCMessageGetNumRanges();
  if (v30)
  {
    _ETLDebugPrint();
    int v31 = 0;
    while (1)
    {
LABEL_97:
      LODWORD(v41.__r_.__value_.__l.__data_) = -1431655766;
      v42.__r_.__value_.__r.__words[0] = 0;
      if ((ETLDMCMessageGetRangeAndMasks() & 1) == 0)
      {
        uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to get event range from DMC file", 0x27uLL);
        goto LABEL_119;
      }
      _ETLDebugPrint();
      uint64_t v33 = dword_26AC2DD60;
      if (dword_26AC2DD60)
      {
        int64_t v34 = &word_26AC2DD7A;
        while (*(unsigned __int16 *)&v41.__r_.__value_.__s.__data_[2] > (unsigned __int16)*v34
             || LOWORD(v41.__r_.__value_.__l.__data_) < (unsigned __int16)*(v34 - 1))
        {
          v34 += 2;
          if (!--v33)
          {
            ETLDMCDebugGetMessageRange();
            uint64_t v6 = _ETLDebugPrint();
            if (SBYTE7(v47) < 0) {
              operator delete(__p[0]);
            }
            int v32 = 0;
            if (++v31 == v30) {
              goto LABEL_120;
            }
            goto LABEL_97;
          }
        }
      }
      if (!*((unsigned char *)a1 + 20)) {
        ETLFlushResponseFull();
      }
      uint64_t v6 = ETLMESSAGESetSubsystemRuntimeMasksWithRetry();
      if ((v6 & 1) == 0) {
        break;
      }
      int v32 = 1;
      if (++v31 == v30) {
        goto LABEL_120;
      }
    }
    uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to configure message range", 0x21uLL);
LABEL_119:
    int v32 = 0;
LABEL_120:
    BOOL v7 = v32 != 0;
  }
  else
  {
    uint64_t v6 = _ETLDebugPrint();
    BOOL v7 = 1;
  }
LABEL_64:
  int v25 = capabilities::radio::mav20Plus((capabilities::radio *)v6);
  if ((v7 & v25) != 1)
  {
    int v27 = v7 & (v25 ^ 1);
    if (!*((unsigned char *)a1 + 23)) {
      goto LABEL_76;
    }
    goto LABEL_82;
  }
  if (!*(_DWORD *)(_ETLDMCGetView() + 48))
  {
    _ETLDebugPrint();
LABEL_72:
    int v27 = 1;
    if (!*((unsigned char *)a1 + 23)) {
      goto LABEL_76;
    }
    goto LABEL_82;
  }
  if (ETLQtraceSend()) {
    goto LABEL_72;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    *(void *)(a2 + 8) = 22;
    char v26 = *(char **)a2;
  }
  else
  {
    *(unsigned char *)(a2 + 23) = 22;
    char v26 = (char *)a2;
  }
  int v27 = 0;
  strcpy(v26, "Failed to send QTraces");
  if (!*((unsigned char *)a1 + 23))
  {
LABEL_76:
    if (*((unsigned char *)a1 + 21) && v27) {
      int v27 = ETLMaverickADPLEnable();
    }
    if (*((unsigned char *)a1 + 22) && v27) {
      int v27 = ETLMaverickQDSSEnable();
    }
  }
LABEL_82:
  if (*((_DWORD *)a1 + 4) <= 1u)
  {
    if (v27) {
      int v27 = _ETLDIAGLoggingMSGSwitch(a1, 1, a2);
    }
  }
  if (v27)
  {
    _ETLDebugPrint();
    return 1;
  }
  _ETLDebugPrint();
  return 0;
}

void sub_21E2339D8(_Unwind_Exception *a1)
{
}

void sub_21E2339F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  if (a48 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ETLDIAGLoggingPing(uint64_t a1, uint64_t a2)
{
  for (int i = 1; i != 21; ++i)
  {
    while (1)
    {
      if ((*(char *)(a2 + 23) & 0x80000000) == 0)
      {
        *(unsigned char *)a2 = 0;
        *(unsigned char *)(a2 + 23) = 0;
        _ETLDebugPrint();
        if (*(unsigned char *)(a1 + 20)) {
          goto LABEL_10;
        }
LABEL_9:
        ETLFlushResponseFull();
        goto LABEL_10;
      }
      **(unsigned char **)a2 = 0;
      *(void *)(a2 + 8) = 0;
      _ETLDebugPrint();
      if (!*(unsigned char *)(a1 + 20)) {
        goto LABEL_9;
      }
LABEL_10:
      uint64_t result = ETLBBPing();
      if ((result & 1) == 0) {
        break;
      }
      uint64_t result = ETLBBPingCheckResponse();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to get ping response", 0x1BuLL);
        if (++i != 21) {
          continue;
        }
      }
      return result;
    }
    if (*(char *)(a2 + 23) < 0)
    {
      *(void *)(a2 + 8) = 19;
      uint64_t v5 = *(char **)a2;
    }
    else
    {
      *(unsigned char *)(a2 + 23) = 19;
      uint64_t v5 = (char *)a2;
    }
    strcpy(v5, "Failed to send ping");
  }
  return result;
}

BOOL _ETLDIAGLoggingMSGSwitch(capabilities::diag *a1, uint64_t a2, uint64_t a3)
{
  BOOL v5 = 1;
  unsigned int v6 = 1;
  if (capabilities::diag::supportsBSPFlagSet(a1))
  {
    while (*(char *)(a3 + 23) < 0)
    {
      **(unsigned char **)a3 = 0;
      *(void *)(a3 + 8) = 0;
      _ETLDebugPrint();
      if (!*((unsigned char *)a1 + 20)) {
        goto LABEL_4;
      }
LABEL_5:
      if ((ETLMaverickSetFlags() & 1) == 0)
      {
        std::string::__assign_external((std::string *)a3, "Failed to set message master switch", 0x23uLL);
        BOOL v5 = v6++ < 0xA;
        if (v6 != 11) {
          continue;
        }
      }
      return v5;
    }
    *(unsigned char *)a3 = 0;
    *(unsigned char *)(a3 + 23) = 0;
    _ETLDebugPrint();
    if (*((unsigned char *)a1 + 20)) {
      goto LABEL_5;
    }
LABEL_4:
    ETLFlushResponseFull();
    goto LABEL_5;
  }
  do
  {
    if (*(char *)(a3 + 23) < 0)
    {
      **(unsigned char **)a3 = 0;
      *(void *)(a3 + 8) = 0;
      _ETLDebugPrint();
      if (*((unsigned char *)a1 + 20)) {
        goto LABEL_13;
      }
LABEL_12:
      ETLFlushResponseFull();
      goto LABEL_13;
    }
    *(unsigned char *)a3 = 0;
    *(unsigned char *)(a3 + 23) = 0;
    _ETLDebugPrint();
    if (!*((unsigned char *)a1 + 20)) {
      goto LABEL_12;
    }
LABEL_13:
    if (ETLMESSAGESetFlags()) {
      break;
    }
    std::string::__assign_external((std::string *)a3, "Failed to set message master switch", 0x23uLL);
    BOOL v5 = v6++ < 0xA;
  }
  while (v6 != 11);
  return v5;
}

uint64_t ETLDIAGLoggingUnconfigure(unsigned char *a1, uint64_t a2)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AC2DD70, memory_order_acquire) & 1) == 0)
  {
    uint64_t v11 = (capabilities::diag *)__cxa_guard_acquire(&qword_26AC2DD70);
    if (v11)
    {
      capabilities::diag::supportedInterfaces(v11);
      capabilities::diag::operator|();
      byte_26AC2DD59 = capabilities::diag::operator&() == 0;
      __cxa_guard_release(&qword_26AC2DD70);
    }
  }
  uint64_t v4 = *(unsigned int (**)(void))(*(void *)a1 + 56);
  if (!v4) {
    return 0;
  }
  if (!v4() || *((void *)a1 + 1) == 0) {
    return 0;
  }
  _ETLDebugPrint();
  if (byte_26AC2DD59) {
    _ETLDIAGLoggingPing((uint64_t)a1, a2);
  }
  uint64_t v6 = _ETLDIAGLoggingMSGSwitch((capabilities::diag *)a1, 0, a2);
  BOOL v7 = 0;
  if (v6)
  {
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
    _ETLDebugPrint();
    if (a1[20])
    {
      if (ETLMESSAGESetAllSubsystemRunTimeMasks()) {
        goto LABEL_29;
      }
    }
    else
    {
      ETLFlushResponseFull();
      if (ETLMESSAGESetAllSubsystemRunTimeMasks()) {
        goto LABEL_29;
      }
    }
    std::string::__assign_external((std::string *)a2, "Failed to clear message masks", 0x1DuLL);
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
    _ETLDebugPrint();
    if (!a1[20]) {
      ETLFlushResponseFull();
    }
    if ((ETLMESSAGESetAllSubsystemRunTimeMasks() & 1) == 0)
    {
      std::string::__assign_external((std::string *)a2, "Failed to clear message masks", 0x1DuLL);
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
      _ETLDebugPrint();
      if (!a1[20]) {
        ETLFlushResponseFull();
      }
      if ((ETLMESSAGESetAllSubsystemRunTimeMasks() & 1) == 0)
      {
        uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to clear message masks", 0x1DuLL);
        BOOL v7 = 0;
        goto LABEL_59;
      }
    }
LABEL_29:
    if (ETLDMCLogGetEnabledEquipIDs())
    {
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
      _ETLDebugPrint();
      if (!a1[20]) {
        ETLFlushResponseFull();
      }
      if (ETLLOGClearAllEnabledMasksWithRetry()) {
        goto LABEL_51;
      }
      std::string::__assign_external((std::string *)a2, "Failed to clear log masks", 0x19uLL);
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
      _ETLDebugPrint();
      if (!a1[20]) {
        ETLFlushResponseFull();
      }
      if (ETLLOGClearAllEnabledMasksWithRetry()) {
        goto LABEL_51;
      }
      std::string::__assign_external((std::string *)a2, "Failed to clear log masks", 0x19uLL);
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
      _ETLDebugPrint();
      if (!a1[20]) {
        ETLFlushResponseFull();
      }
      if (ETLLOGClearAllEnabledMasksWithRetry())
      {
LABEL_51:
        ETLLOGDisable();
        BOOL v7 = 1;
        for (unsigned int i = 1; i != 11; ++i)
        {
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
          _ETLDebugPrint();
          if (!a1[20]) {
            ETLFlushResponseFull();
          }
          uint64_t v6 = ETLEVENTEnable();
          if (v6) {
            break;
          }
          uint64_t v6 = (uint64_t)std::string::__assign_external((std::string *)a2, "Failed to clear event masks", 0x1BuLL);
          BOOL v7 = i < 0xA;
        }
        goto LABEL_59;
      }
      std::string::__assign_external((std::string *)a2, "Failed to clear log masks", 0x19uLL);
    }
    else
    {
      std::string::__assign_external((std::string *)a2, "No log equip ID found in DMC file", 0x21uLL);
    }
    uint64_t v6 = ETLLOGDisable();
    BOOL v7 = 0;
  }
LABEL_59:
  if (capabilities::radio::mav20Plus((capabilities::radio *)v6))
  {
    if (!v7) {
      goto LABEL_66;
    }
    if ((ETLQtraceClearSend() & 1) == 0)
    {
      std::string::__assign_external((std::string *)a2, "Failed to send to clear QTraces", 0x1FuLL);
      goto LABEL_66;
    }
  }
  else if (!v7)
  {
LABEL_66:
    int v9 = 0;
    if (a1[20]) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
  int v9 = _ETLDIAGLoggingMSGSwitch((capabilities::diag *)a1, 0, a2);
  if (a1[20]) {
    goto LABEL_68;
  }
LABEL_67:
  ETLFlushResponseFull();
LABEL_68:
  if (!a1[23] && a1[21] | a1[22])
  {
    usleep(0x55730u);
    if (a1[21] && v9) {
      int v9 = ETLMaverickADPLEnable();
    }
    if (a1[22])
    {
      if (v9) {
        int v9 = ETLMaverickQDSSEnable();
      }
    }
  }
  if (v9)
  {
    _ETLDebugPrint();
    return 1;
  }
  _ETLDebugPrint();
  return 0;
}

void sub_21E2343FC(_Unwind_Exception *a1)
{
}

void **ETLDIAGLoggingCreateHash()
{
  v72[72] = *MEMORY[0x263EF8340];
  v0 = (void **)operator new(0x18uLL);
  v0[1] = 0;
  v0[2] = 0;
  long long v64 = (char **)(v0 + 1);
  *v0 = v0 + 1;
  memset(&v72[1], 170, 0x238uLL);
  uint64_t v1 = MEMORY[0x263F8C308] + 64;
  v72[53] = MEMORY[0x263F8C308] + 64;
  uint64_t v2 = *(void *)(MEMORY[0x263F8C2A8] + 16);
  v72[0] = *(void *)(MEMORY[0x263F8C2A8] + 8);
  *(void *)((char *)v72 + *(void *)(v72[0] - 24)) = v2;
  v72[1] = 0;
  uint64_t v3 = (std::ios_base *)((char *)v72 + *(void *)(v72[0] - 24));
  std::ios_base::init(v3, &v72[2]);
  uint64_t v4 = MEMORY[0x263F8C308] + 24;
  v3[1].__vftable = 0;
  v3[1].__fmtflags_ = -1;
  v72[0] = v4;
  v72[53] = v1;
  MEMORY[0x223C23790](&v72[2]);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)v72 + *(void *)(v72[0] - 24)), *(_DWORD *)((char *)&v72[4] + *(void *)(v72[0] - 24)) | 4);
  }
  if (!*(_DWORD *)((char *)&v72[4] + *(void *)(v72[0] - 24)))
  {
    memset(&v71, 0, sizeof(v71));
    std::string::reserve(&v71, 0x12CuLL);
    BOOL v5 = (const std::ios_base *)((char *)v72 + *(void *)(v72[0] - 24));
    if ((v5->__rdstate_ & 2) == 0)
    {
      long long v65 = v0;
      do
      {
        std::ios_base::getloc(v5);
        BOOL v7 = std::locale::use_facet(&v66, MEMORY[0x263F8C108]);
        char v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 10);
        std::locale::~locale(&v66);
        LOBYTE(v66.__locale_) = -86;
        MEMORY[0x223C237B0](&v66, v72, 1);
        if (!LOBYTE(v66.__locale_)) {
          goto LABEL_47;
        }
        if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
        {
          *v71.__r_.__value_.__l.__data_ = 0;
          v71.__r_.__value_.__l.__size_ = 0;
        }
        else
        {
          v71.__r_.__value_.__s.__data_[0] = 0;
          *((unsigned char *)&v71.__r_.__value_.__s + 23) = 0;
        }
        uint64_t v9 = 0;
        while (1)
        {
          uint64_t v11 = *(void **)((char *)&v72[5] + *(void *)(v72[0] - 24));
          int v12 = (char *)v11[3];
          if (v12 == (char *)v11[4]) {
            break;
          }
          v11[3] = v12 + 1;
          char v13 = *v12;
LABEL_19:
          if (v8 == v13)
          {
            int v24 = 0;
            goto LABEL_46;
          }
          unsigned __int8 v15 = HIBYTE(v71.__r_.__value_.__r.__words[2]);
          if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::size_type size = (v71.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
            if (v71.__r_.__value_.__l.__size_ == size)
            {
              if ((v71.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8) {
                std::string::__throw_length_error[abi:ne180100]();
              }
              int v16 = (std::string *)v71.__r_.__value_.__r.__words[0];
              size_t v18 = 0x7FFFFFFFFFFFFFF7;
              if (size <= 0x3FFFFFFFFFFFFFF2)
              {
LABEL_26:
                if (size + 1 > 2 * size) {
                  unint64_t v19 = size + 1;
                }
                else {
                  unint64_t v19 = 2 * size;
                }
                uint64_t v20 = (v19 & 0x7FFFFFFFFFFFFFF8) + 8;
                if ((v19 | 7) != 0x17) {
                  uint64_t v20 = v19 | 7;
                }
                if (v19 >= 0x17) {
                  size_t v18 = v20 + 1;
                }
                else {
                  size_t v18 = 23;
                }
              }
              uint64_t v21 = operator new(v18);
              std::string::size_type v22 = (std::string::size_type)v21;
              if (!size || (memmove(v21, v16, size), size != 22)) {
                operator delete(v16);
              }
              v71.__r_.__value_.__r.__words[0] = v22;
              v71.__r_.__value_.__r.__words[2] = v18 | 0x8000000000000000;
              goto LABEL_39;
            }
            std::string::size_type size = v71.__r_.__value_.__l.__size_;
            std::string::size_type v22 = v71.__r_.__value_.__r.__words[0];
LABEL_39:
            v71.__r_.__value_.__l.__size_ = size + 1;
            uint64_t v23 = (char *)(v22 + size);
            *uint64_t v23 = v13;
            v23[1] = 0;
            --v9;
            if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0) {
              goto LABEL_15;
            }
          }
          else
          {
            if (HIBYTE(v71.__r_.__value_.__r.__words[2]) == 22)
            {
              int v16 = &v71;
              std::string::size_type size = 22;
              goto LABEL_26;
            }
            *((unsigned char *)&v71.__r_.__value_.__s + 23) = (*((unsigned char *)&v71.__r_.__value_.__s + 23) + 1) & 0x7F;
            unint64_t v10 = (char *)&v71 + v15;
            *unint64_t v10 = v13;
            v10[1] = 0;
            --v9;
            if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
            {
LABEL_15:
              if (v71.__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7)
              {
                int v24 = 4;
                goto LABEL_46;
              }
            }
          }
        }
        int v14 = (*(uint64_t (**)(void *))(*v11 + 80))(v11);
        char v13 = v14;
        if (v14 != -1) {
          goto LABEL_19;
        }
        if (v9) {
          int v24 = 2;
        }
        else {
          int v24 = 6;
        }
LABEL_46:
        std::ios_base::clear((std::ios_base *)((char *)v72 + *(void *)(v72[0] - 24)), *(_DWORD *)((char *)&v72[4] + *(void *)(v72[0] - 24)) | v24);
        v0 = v65;
LABEL_47:
        uint64_t v6 = v72[0];
        if ((*((unsigned char *)&v72[4] + *(void *)(v72[0] - 24)) & 5) != 0) {
          goto LABEL_8;
        }
        if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
        {
          int v25 = (std::string *)v71.__r_.__value_.__r.__words[0];
          if (*v71.__r_.__value_.__l.__data_ - 58 < 0xFFFFFFF6) {
            goto LABEL_8;
          }
          __lasts = (char *)0xAAAAAAAAAAAAAAAALL;
LABEL_53:
          memset(__p, 170, sizeof(__p));
          char v26 = strtok_r((char *)v25, ":", &__lasts);
          size_t v27 = strlen(v26);
          if (v27 > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          int v28 = (void *)v27;
          if (v27 >= 0x17)
          {
            uint64_t v32 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v27 | 7) != 0x17) {
              uint64_t v32 = v27 | 7;
            }
            uint64_t v33 = v32 + 1;
            std::string::size_type v29 = operator new(v32 + 1);
            __p[1] = v28;
            __p[2] = (void *)(v33 | 0x8000000000000000);
            __p[0] = v29;
          }
          else
          {
            HIBYTE(__p[2]) = v27;
            std::string::size_type v29 = __p;
            if (!v27)
            {
              LOBYTE(__p[0]) = 0;
              int v30 = SHIBYTE(__p[2]);
              if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
                goto LABEL_57;
              }
LABEL_63:
              if (!__p[1]) {
                goto LABEL_6;
              }
              int v31 = (void **)__p[0];
LABEL_65:
              locale = (std::locale::__imp *)atoll((const char *)v31);
              memset(&__dst, 170, sizeof(__dst));
              unint64_t v35 = strtok_r(0, "\n", &__lasts);
              size_t v36 = strlen(v35);
              if (v36 > 0x7FFFFFFFFFFFFFF7) {
                std::string::__throw_length_error[abi:ne180100]();
              }
              std::string::size_type v37 = v36;
              if (v36 >= 0x17)
              {
                uint64_t v40 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v36 | 7) != 0x17) {
                  uint64_t v40 = v36 | 7;
                }
                uint64_t v41 = v40 + 1;
                p_dst = (std::string *)operator new(v40 + 1);
                __dst.__r_.__value_.__l.__size_ = v37;
                __dst.__r_.__value_.__r.__words[2] = v41 | 0x8000000000000000;
                __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
              }
              else
              {
                *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v36;
                p_dst = &__dst;
                if (!v36)
                {
                  v0 = v65;
                  __dst.__r_.__value_.__s.__data_[0] = 0;
                  int v39 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
                  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                    goto LABEL_69;
                  }
LABEL_75:
                  std::string v42 = (void *)__dst.__r_.__value_.__r.__words[0];
                  if (__dst.__r_.__value_.__l.__size_)
                  {
                    v66.__locale_ = locale;
                    std::string::__init_copy_ctor_external(&v67, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
                    locale = v66.__locale_;
                    goto LABEL_77;
                  }
LABEL_120:
                  operator delete(v42);
                  if (SHIBYTE(__p[2]) < 0) {
LABEL_6:
                  }
                    operator delete(__p[0]);
LABEL_7:
                  uint64_t v6 = v72[0];
                  goto LABEL_8;
                }
              }
              memmove(p_dst, v35, v37);
              v0 = v65;
              p_dst->__r_.__value_.__s.__data_[v37] = 0;
              int v39 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
              if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
                goto LABEL_75;
              }
LABEL_69:
              if (v39)
              {
                v66.__locale_ = locale;
                std::string v67 = __dst;
LABEL_77:
                unint64_t v43 = v64;
                while (1)
                {
                  unsigned int v44 = *v43;
                  unint64_t v45 = v43;
                  if (!*v43) {
                    break;
                  }
                  while (1)
                  {
                    unint64_t v43 = (char **)v44;
                    unint64_t v46 = *((void *)v44 + 4);
                    if ((unint64_t)locale < v46) {
                      break;
                    }
                    if (v46 >= (unint64_t)locale) {
                      goto LABEL_114;
                    }
                    unsigned int v44 = v43[1];
                    if (!v44)
                    {
                      unint64_t v45 = v43 + 1;
                      goto LABEL_83;
                    }
                  }
                }
LABEL_83:
                long long v47 = (char *)operator new(0x40uLL);
                *((void *)v47 + 4) = locale;
                *(std::string *)(v47 + 40) = v67;
                memset(&v67, 0, sizeof(v67));
                *(void *)long long v47 = 0;
                *((void *)v47 + 1) = 0;
                *((void *)v47 + 2) = v43;
                *unint64_t v45 = v47;
                long long v48 = (void *)**v0;
                if (v48)
                {
                  *v0 = v48;
                  long long v47 = *v45;
                }
                long long v49 = *v64;
                BOOL v50 = v47 == *v64;
                v47[24] = v50;
                if (!v50)
                {
                  do
                  {
                    uint64_t v51 = *((void *)v47 + 2);
                    if (*(unsigned char *)(v51 + 24)) {
                      break;
                    }
                    long long v52 = *(char **)(v51 + 16);
                    uint64_t v53 = *(void *)v52;
                    if (*(void *)v52 == v51)
                    {
                      uint64_t v56 = *((void *)v52 + 1);
                      if (!v56 || (v57 = *(unsigned __int8 *)(v56 + 24), long long v54 = (unsigned char *)(v56 + 24), v57))
                      {
                        if (*(char **)v51 == v47)
                        {
                          long long v58 = (uint64_t *)*((void *)v47 + 2);
                        }
                        else
                        {
                          long long v58 = *(uint64_t **)(v51 + 8);
                          uint64_t v59 = *v58;
                          *(void *)(v51 + 8) = *v58;
                          if (v59)
                          {
                            *(void *)(v59 + 16) = v51;
                            long long v52 = *(char **)(v51 + 16);
                          }
                          v58[2] = (uint64_t)v52;
                          *(void *)(*(void *)(v51 + 16) + 8 * (**(void **)(v51 + 16) != v51)) = v58;
                          *long long v58 = v51;
                          *(void *)(v51 + 16) = v58;
                          long long v52 = (char *)v58[2];
                          uint64_t v51 = *(void *)v52;
                        }
                        *((unsigned char *)v58 + 24) = 1;
                        v52[24] = 0;
                        uint64_t v62 = *(void *)(v51 + 8);
                        *(void *)long long v52 = v62;
                        if (v62) {
                          *(void *)(v62 + 16) = v52;
                        }
                        *(void *)(v51 + 16) = *((void *)v52 + 2);
                        *(void *)(*((void *)v52 + 2) + 8 * (**((void **)v52 + 2) != (void)v52)) = v51;
                        *(void *)(v51 + 8) = v52;
                        goto LABEL_112;
                      }
                    }
                    else if (!v53 || (v55 = *(unsigned __int8 *)(v53 + 24), long long v54 = (unsigned char *)(v53 + 24), v55))
                    {
                      if (*(char **)v51 == v47)
                      {
                        uint64_t v60 = *((void *)v47 + 1);
                        *(void *)uint64_t v51 = v60;
                        if (v60)
                        {
                          *(void *)(v60 + 16) = v51;
                          long long v52 = *(char **)(v51 + 16);
                        }
                        *((void *)v47 + 2) = v52;
                        *(void *)(*(void *)(v51 + 16) + 8 * (**(void **)(v51 + 16) != v51)) = v47;
                        *((void *)v47 + 1) = v51;
                        *(void *)(v51 + 16) = v47;
                        long long v52 = (char *)*((void *)v47 + 2);
                      }
                      else
                      {
                        long long v47 = (char *)*((void *)v47 + 2);
                      }
                      v47[24] = 1;
                      v52[24] = 0;
                      uint64_t v51 = *((void *)v52 + 1);
                      long long v61 = *(char **)v51;
                      *((void *)v52 + 1) = *(void *)v51;
                      if (v61) {
                        *((void *)v61 + 2) = v52;
                      }
                      *(void *)(v51 + 16) = *((void *)v52 + 2);
                      *(void *)(*((void *)v52 + 2) + 8 * (**((void **)v52 + 2) != (void)v52)) = v51;
                      *(void *)uint64_t v51 = v52;
LABEL_112:
                      *((void *)v52 + 2) = v51;
                      break;
                    }
                    *(unsigned char *)(v51 + 24) = 1;
                    long long v47 = v52;
                    v52[24] = v52 == v49;
                    *long long v54 = 1;
                  }
                  while (v52 != v49);
                }
                v0[2] = (void *)((char *)v0[2] + 1);
LABEL_114:
                if ((SHIBYTE(v67.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                {
                  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                    goto LABEL_116;
                  }
LABEL_119:
                  std::string v42 = (void *)__dst.__r_.__value_.__r.__words[0];
                  goto LABEL_120;
                }
                operator delete(v67.__r_.__value_.__l.__data_);
                if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
                  goto LABEL_119;
                }
              }
LABEL_116:
              if (SHIBYTE(__p[2]) < 0) {
                goto LABEL_6;
              }
              goto LABEL_7;
            }
          }
          memmove(v29, v26, (size_t)v28);
          *((unsigned char *)v28 + (void)v29) = 0;
          int v30 = SHIBYTE(__p[2]);
          if (SHIBYTE(__p[2]) < 0) {
            goto LABEL_63;
          }
LABEL_57:
          if (v30)
          {
            int v31 = __p;
            goto LABEL_65;
          }
          goto LABEL_7;
        }
        if (v71.__r_.__value_.__s.__data_[0] - 58 >= 0xFFFFFFF6)
        {
          __lasts = (char *)0xAAAAAAAAAAAAAAAALL;
          int v25 = &v71;
          goto LABEL_53;
        }
LABEL_8:
        BOOL v5 = (const std::ios_base *)((char *)v72 + *(void *)(v6 - 24));
      }
      while ((v5->__rdstate_ & 2) == 0);
    }
    if (!std::filebuf::close()) {
      std::ios_base::clear((std::ios_base *)((char *)v72 + *(void *)(v72[0] - 24)), *(_DWORD *)((char *)&v72[4] + *(void *)(v72[0] - 24)) | 4);
    }
    if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v71.__r_.__value_.__l.__data_);
    }
  }
  v72[0] = *MEMORY[0x263F8C2A8];
  *(void *)((char *)v72 + *(void *)(v72[0] - 24)) = *(void *)(MEMORY[0x263F8C2A8] + 24);
  MEMORY[0x223C237A0](&v72[2]);
  std::istream::~istream();
  MEMORY[0x223C23880](&v72[53]);
  return v0;
}

void sub_21E234F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34)
{
  if (a33 < 0) {
    operator delete(__p);
  }
  std::ifstream::~ifstream(&a34);
  _Unwind_Resume(a1);
}

void sub_21E234F70(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void sub_21E234F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40)
{
  operator delete(v40);
  if (a32 < 0) {
    operator delete(__p);
  }
  if (a39 < 0) {
    operator delete(a34);
  }
  std::ifstream::~ifstream(&a40);
  _Unwind_Resume(a1);
}

void sub_21E234FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
}

void sub_21E235030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::locale a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,...)
{
  va_start(va, a26);
  std::locale::~locale(&a10);
  if (a26 < 0) {
    operator delete(a21);
  }
  std::ifstream::~ifstream((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::ifstream::~ifstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2A8];
  uint64_t v3 = *MEMORY[0x263F8C2A8];
  *a1 = *MEMORY[0x263F8C2A8];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x223C237A0](a1 + 2);
  std::istream::~istream();
  MEMORY[0x223C23880](a1 + 53);
  return a1;
}

uint64_t ETLDIAGLoggingGetStringForKey(unint64_t a1, const char **a2, void *a3)
{
  uint64_t v3 = 0;
  if (a2 && a3)
  {
    *a2 = "notfound.c:--WRONG HASH FILE--";
    uint64_t v6 = (void *)a3[1];
    uint64_t v4 = (char *)(a3 + 1);
    BOOL v5 = v6;
    if (!v6) {
      return 0;
    }
    BOOL v7 = v4;
    do
    {
      unint64_t v8 = v5[4];
      BOOL v9 = v8 >= a1;
      if (v8 >= a1) {
        unint64_t v10 = v5;
      }
      else {
        unint64_t v10 = v5 + 1;
      }
      if (v9) {
        BOOL v7 = (char *)v5;
      }
      BOOL v5 = (void *)*v10;
    }
    while (*v10);
    if (v7 == v4 || *((void *)v7 + 4) > a1) {
      return 0;
    }
    int v12 = v7 + 40;
    if (v7[63] < 0) {
      int v12 = *(const char **)v12;
    }
    *a2 = v12;
    return 1;
  }
  return v3;
}

void ETLDIAGLoggingGetAvailableDMCNames(void **a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v2 = operator new(0x40uLL);
  uint64_t v3 = 0;
  _OWORD *v2 = xmmword_21E236E70;
  v2[1] = unk_21E236E80;
  v2[2] = xmmword_21E236E90;
  v2[3] = unk_21E236EA0;
  do
  {
    BOOL v5 = (const char *)ETLDMCKeyword();
    size_t v6 = strlen(v5);
    if (v6 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v7 = v6;
    if (v6 >= 0x17)
    {
      uint64_t v11 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17) {
        uint64_t v11 = v6 | 7;
      }
      uint64_t v12 = v11 + 1;
      p_dst = (long long *)operator new(v11 + 1);
      *((void *)&__dst + 1) = v7;
      unint64_t v24 = v12 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
    }
    else
    {
      HIBYTE(v24) = v6;
      p_dst = &__dst;
      if (!v6)
      {
        LOBYTE(__dst) = 0;
        unint64_t v10 = (void **)a1[1];
        unint64_t v9 = (unint64_t)a1[2];
        if ((unint64_t)v10 < v9) {
          goto LABEL_2;
        }
        goto LABEL_13;
      }
    }
    memmove(p_dst, v5, v7);
    *((unsigned char *)p_dst + v7) = 0;
    unint64_t v10 = (void **)a1[1];
    unint64_t v9 = (unint64_t)a1[2];
    if ((unint64_t)v10 < v9)
    {
LABEL_2:
      *(_OWORD *)unint64_t v10 = __dst;
      v10[2] = (void *)v24;
      uint64_t v4 = (char *)(v10 + 3);
      goto LABEL_3;
    }
LABEL_13:
    char v13 = (void **)*a1;
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (unsigned char *)*a1) >> 3);
    unint64_t v15 = v14 + 1;
    if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - (void)v13) >> 3);
    if (2 * v16 > v15) {
      unint64_t v15 = 2 * v16;
    }
    if (v16 >= 0x555555555555555) {
      unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v17 = v15;
    }
    if (v17)
    {
      if (v17 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      size_t v18 = (char *)operator new(24 * v17);
    }
    else
    {
      size_t v18 = 0;
    }
    unint64_t v19 = &v18[24 * v14];
    uint64_t v20 = &v18[24 * v17];
    *(_OWORD *)unint64_t v19 = __dst;
    *((void *)v19 + 2) = v24;
    uint64_t v4 = v19 + 24;
    if (v10 == v13)
    {
      *a1 = v19;
      a1[1] = v4;
      a1[2] = v20;
    }
    else
    {
      do
      {
        long long v21 = *(_OWORD *)(v10 - 3);
        *((void *)v19 - 1) = *(v10 - 1);
        *(_OWORD *)(v19 - 24) = v21;
        v19 -= 24;
        *(v10 - 2) = 0;
        *(v10 - 1) = 0;
        *(v10 - 3) = 0;
        v10 -= 3;
      }
      while (v10 != v13);
      unint64_t v10 = (void **)*a1;
      std::string::size_type v22 = (void **)a1[1];
      *a1 = v19;
      a1[1] = v4;
      a1[2] = v20;
      while (v22 != v10)
      {
        if (*((char *)v22 - 1) < 0) {
          operator delete(*(v22 - 3));
        }
        v22 -= 3;
      }
    }
    if (v10) {
      operator delete(v10);
    }
LABEL_3:
    a1[1] = v4;
    ++v3;
  }
  while (v3 != 16);

  operator delete(v2);
}

void sub_21E235420(_Unwind_Exception *a1)
{
  std::vector<std::string>::~vector[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_21E235434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    operator delete(v16);
    std::vector<std::string>::~vector[abi:ne180100](v15);
    _Unwind_Resume(a1);
  }
  operator delete(v16);
  std::vector<std::string>::~vector[abi:ne180100](v15);
  _Unwind_Resume(a1);
}

void **std::vector<std::string>::~vector[abi:ne180100](void **a1)
{
  uint64_t v2 = (void **)*a1;
  if (*a1)
  {
    uint64_t v3 = (void **)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*(v3 - 3));
        }
        v3 -= 3;
      }
      while (v3 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2644A1C30, MEMORY[0x263F8C060]);
}

void sub_21E235570(_Unwind_Exception *a1)
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void __clang_call_terminate(void *a1)
{
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  if ((SHIBYTE(this->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    uint64_t v6 = 22;
    size_t v7 = this;
LABEL_6:
    std::string::size_type v9 = 2 * v6;
    if (__n > 2 * v6) {
      std::string::size_type v9 = __n;
    }
    unint64_t v10 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    uint64_t v11 = v9 | 7;
    if (v11 == 23) {
      uint64_t v11 = v10;
    }
    uint64_t v12 = v11 + 1;
    char v13 = operator new(v11 + 1);
    memcpy(v13, __s, __n);
    if (v6 != 22) {
      operator delete(v7);
    }
    this->__r_.__value_.__r.__words[2] = v12 | 0x8000000000000000;
    this->__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
    goto LABEL_13;
  }
  std::string::size_type v8 = this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v6 = v8 - 1;
  if (__n > v8 - 1)
  {
    if (0x7FFFFFFFFFFFFFF7 - v8 < __n - (v8 - 1)) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v7 = (std::string *)this->__r_.__value_.__r.__words[0];
    goto LABEL_6;
  }
  char v13 = (void *)this->__r_.__value_.__r.__words[0];
  memmove(this->__r_.__value_.__l.__data_, __s, __n);
  if ((SHIBYTE(this->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
    goto LABEL_14;
  }
LABEL_13:
  this->__r_.__value_.__l.__size_ = __n;
LABEL_14:
  *((unsigned char *)v13 + __n) = 0;
  return this;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  BOOL v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    std::string::size_type v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    BOOL v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void *std::list<ETLDiagQueryGUIDSubSysCMDCode>::__insert_with_sentinel[abi:ne180100]<ETLDiagQueryGUIDSubSysCMDCode const*,ETLDiagQueryGUIDSubSysCMDCode const*>(void *result, uint64_t *a2, int *a3, int *a4)
{
  if (a3 != a4)
  {
    std::string::size_type v7 = result;
    uint64_t result = operator new(0x18uLL);
    std::string::size_type v8 = result;
    *uint64_t result = 0;
    result[1] = 0;
    int v10 = *a3;
    std::string::size_type v9 = a3 + 1;
    *((_DWORD *)result + 4) = v10;
    uint64_t v11 = 1;
    if (v9 != a4)
    {
      uint64_t v12 = result;
      do
      {
        uint64_t result = operator new(0x18uLL);
        int v13 = *v9++;
        *uint64_t result = v12;
        result[1] = 0;
        *((_DWORD *)result + 4) = v13;
        v12[1] = result;
        ++v11;
        uint64_t v12 = result;
      }
      while (v9 != a4);
    }
    uint64_t v14 = *a2;
    *(void *)(v14 + 8) = v8;
    *std::string::size_type v8 = v14;
    *a2 = (uint64_t)result;
    result[1] = a2;
    v7[2] += v11;
  }
  return result;
}

void sub_21E235888(void *a1)
{
  __cxa_begin_catch(a1);
  do
  {
    uint64_t v2 = (void *)*v1;
    operator delete(v1);
    uint64_t v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_21E2358A8(_Unwind_Exception *a1)
{
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v24[0] = 0xAAAAAAAAAAAAAAAALL;
  v24[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x223C237D0](v24, a1);
  if (LOBYTE(v24[0]))
  {
    std::string::size_type v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v12 = std::locale::use_facet(__b, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
      uint64_t v10 = a2 + a3;
      if ((v8 & 0xB0) == 0x20) {
        uint64_t v11 = a2 + a3;
      }
      else {
        uint64_t v11 = a2;
      }
      if (!v7) {
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v10 = a2 + a3;
      if ((*((_DWORD *)v6 + 2) & 0xB0) == 0x20) {
        uint64_t v11 = a2 + a3;
      }
      else {
        uint64_t v11 = a2;
      }
      if (!v7) {
        goto LABEL_34;
      }
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    size_t v15 = v13 - a3;
    if (v14) {
      size_t v16 = 0;
    }
    else {
      size_t v16 = v15;
    }
    if (v11 - a2 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v11 - a2) == v11 - a2)
    {
      if ((uint64_t)v16 >= 1)
      {
        memset(__b, 170, sizeof(__b));
        if (v16 >= 0x7FFFFFFFFFFFFFF8) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v16 >= 0x17)
        {
          uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17) {
            uint64_t v18 = v16 | 7;
          }
          uint64_t v19 = v18 + 1;
          unint64_t v17 = (std::locale::__imp *)operator new(v18 + 1);
          __b[1].__locale_ = (std::locale::__imp *)v16;
          __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
          __b[0].__locale_ = v17;
        }
        else
        {
          HIBYTE(__b[2].__locale_) = v16;
          unint64_t v17 = (std::locale::__imp *)__b;
        }
        memset(v17, v9, v16);
        *((unsigned char *)v17 + v16) = 0;
        if (SHIBYTE(__b[2].__locale_) >= 0) {
          locale = __b;
        }
        else {
          locale = __b[0].__locale_;
        }
        uint64_t v21 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(void *)v7 + 96))(v7, locale, v16);
        uint64_t v22 = v21;
        if (SHIBYTE(__b[2].__locale_) < 0)
        {
          operator delete(__b[0].__locale_);
          if (v22 != v16) {
            goto LABEL_34;
          }
        }
        else if (v21 != v16)
        {
          goto LABEL_34;
        }
      }
      if (v10 - v11 < 1
        || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v11, v10 - v11) == v10 - v11)
      {
        *((void *)v6 + 3) = 0;
        goto LABEL_35;
      }
    }
LABEL_34:
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
  }
LABEL_35:
  MEMORY[0x223C237E0](v24);
  return a1;
}

void sub_21E235B94(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x223C237E0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21E235B68);
}

void sub_21E235C00(_Unwind_Exception *a1)
{
}

uint64_t _GLOBAL__sub_I_ETLDIAGLogging_cpp(capabilities::radio *a1)
{
  uint64_t result = capabilities::radio::mav20Plus(a1);
  if (result) {
    int v2 = 2;
  }
  else {
    int v2 = 0;
  }
  dword_26AC2DD5C = v2;
  return result;
}

uint64_t ETLBBPing()
{
  return MEMORY[0x270F91A90]();
}

uint64_t ETLBBPingCheckResponse()
{
  return MEMORY[0x270F91A98]();
}

uint64_t ETLDMCEventGetNumRanges()
{
  return MEMORY[0x270F919D8]();
}

uint64_t ETLDMCEventGetRange()
{
  return MEMORY[0x270F919E0]();
}

uint64_t ETLDMCKeyword()
{
  return MEMORY[0x270F919E8]();
}

uint64_t ETLDMCLogGetEnabledEquipIDs()
{
  return MEMORY[0x270F919F0]();
}

uint64_t ETLDMCLogGetMask()
{
  return MEMORY[0x270F919F8]();
}

uint64_t ETLDMCMessageGetNumRanges()
{
  return MEMORY[0x270F91A00]();
}

uint64_t ETLDMCMessageGetRangeAndMasks()
{
  return MEMORY[0x270F91A08]();
}

uint64_t ETLDiagCreateGUIDDB()
{
  return MEMORY[0x270F91AD0]();
}

uint64_t ETLDiagGetSubsysCmdString()
{
  return MEMORY[0x270F91AD8]();
}

uint64_t ETLDiagReleaseGUIDDB()
{
  return MEMORY[0x270F91AE0]();
}

uint64_t ETLEVENTEnable()
{
  return MEMORY[0x270F91A10]();
}

uint64_t ETLEVENTGetMask()
{
  return MEMORY[0x270F91A18]();
}

uint64_t ETLEVENTSetMask()
{
  return MEMORY[0x270F91A20]();
}

uint64_t ETLFlushResponseFull()
{
  return MEMORY[0x270F91AE8]();
}

uint64_t ETLLOGClearAllEnabledMasksWithRetry()
{
  return MEMORY[0x270F91A28]();
}

uint64_t ETLLOGDisable()
{
  return MEMORY[0x270F91A30]();
}

uint64_t ETLLOGEquipIDAsString()
{
  return MEMORY[0x270F91A38]();
}

uint64_t ETLLOGSetMaskWithRetry()
{
  return MEMORY[0x270F91A40]();
}

uint64_t ETLMESSAGEGetSubsystemIDRanges()
{
  return MEMORY[0x270F91A48]();
}

uint64_t ETLMESSAGESetAllSubsystemRunTimeMasks()
{
  return MEMORY[0x270F91A50]();
}

uint64_t ETLMESSAGESetFlags()
{
  return MEMORY[0x270F91A58]();
}

uint64_t ETLMESSAGESetSubsystemRuntimeMasksWithRetry()
{
  return MEMORY[0x270F91A60]();
}

uint64_t ETLMaverickADPLEnable()
{
  return MEMORY[0x270F91B40]();
}

uint64_t ETLMaverickQDSSEnable()
{
  return MEMORY[0x270F91B90]();
}

uint64_t ETLMaverickSetFlags()
{
  return MEMORY[0x270F91BB0]();
}

uint64_t ETLQtraceClearSend()
{
  return MEMORY[0x270F91A68]();
}

uint64_t ETLQtraceSend()
{
  return MEMORY[0x270F91A70]();
}

uint64_t _ETLDMCGetView()
{
  return MEMORY[0x270F91A78]();
}

uint64_t _ETLDebugPrint()
{
  return MEMORY[0x270F91C00]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ETLDMCDebugGetMessageRange()
{
  return MEMORY[0x270F91A80]();
}

uint64_t capabilities::diag::diagVersion(capabilities::diag *this)
{
  return MEMORY[0x270F96C78](this);
}

uint64_t capabilities::diag::supportsBSPFlagSet(capabilities::diag *this)
{
  return MEMORY[0x270F96C88](this);
}

uint64_t capabilities::diag::supportedInterfaces(capabilities::diag *this)
{
  return MEMORY[0x270F96C90](this);
}

uint64_t capabilities::diag::operator&()
{
  return MEMORY[0x270F96C98]();
}

uint64_t capabilities::diag::operator|()
{
  return MEMORY[0x270F96CA0]();
}

uint64_t capabilities::radio::mav20Plus(capabilities::radio *this)
{
  return MEMORY[0x270F96D40](this);
}

uint64_t capabilities::radio::mavLegacy(capabilities::radio *this)
{
  return MEMORY[0x270F96D48](this);
}

uint64_t ctu::hex0(ctu *this)
{
  return MEMORY[0x270F97660](this);
}

{
  return MEMORY[0x270F97668](this);
}

{
  return MEMORY[0x270F97670](this);
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
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

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987D0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
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

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
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

uint64_t atoll(const char *a1)
{
  return MEMORY[0x270ED86F8](a1);
}

void bzero(void *a1, size_t a2)
{
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

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x270EDB6D0](__str, __sep, __lasts);
}