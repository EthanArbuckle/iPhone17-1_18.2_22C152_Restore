uint64_t ProcessSupTab(uint64_t result, unsigned int a2, uint64_t a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;

  if (a3)
  {
    v7 = result;
    v8 = a3;
    do
    {
      v9 = *(void *)(v8 + 160);
      if (v9)
      {
        do
        {
          v10 = *(unsigned __int8 *)(v9 + 12);
          v11 = *(unsigned __int8 *)(v9 + 13);
          v18 = *(void *)(v9 + 40);
          v12 = v7;
          v13 = a2;
          if (a4 == 1)
          {
            v14 = a3;
            v15 = v10;
            v16 = 0;
            v17 = 1;
          }
          else
          {
            Search(v7, a2, v8, v10, 0, 0, &v18);
            v12 = v7;
            v13 = a2;
            v14 = v8;
            v15 = v10;
            v16 = v11;
            v17 = 0;
          }
          result = Search(v12, v13, v14, v15, v16, v17, &v18);
          v9 = v18;
        }
        while (v18);
      }
      v8 = *(void *)(v8 + 176);
    }
    while (v8);
  }
  return result;
}

uint64_t Search(uint64_t result, unsigned int a2, uint64_t a3, int a4, int a5, int a6, void *a7)
{
  uint64_t v8 = a3;
  uint64_t v9 = result;
  unsigned __int16 v10 = 0;
  int v33 = (__int16)a2;
  __int16 v39 = 0;
  unint64_t v38 = a2;
  unsigned int v11 = a5 | (a4 << 8);
  while (1)
  {
    if (v10) {
      goto LABEL_3;
    }
    result = BinarySearch(v9, v33, 6, v11, 2, &v39);
    if (!result) {
      return result;
    }
    unsigned __int16 v10 = v39;
    if (v39)
    {
      while (v11 == bswap32(*(unsigned __int16 *)(v9 + 6 * v10 - 6)) >> 16)
      {
        if (!--v10)
        {
          unsigned __int16 v10 = 0;
          goto LABEL_4;
        }
      }
LABEL_3:
      if (v10 == 0xFFFF) {
        return result;
      }
    }
LABEL_4:
    if (6 * (unint64_t)v10 >= v38) {
      return result;
    }
    v12 = (unsigned __int8 *)(v9 + 6 * v10);
    if (*v12 != a4) {
      return result;
    }
    if (v12[1] != a5) {
      return result;
    }
    int v13 = v12[2];
    int v14 = v12[3];
    int v15 = v12[4];
    int v16 = (char)v12[5];
    __int16 v39 = ++v10;
    if (v10 == 0xFFFF) {
      return result;
    }
    if (a6)
    {
      int v17 = (char)(v16 + v15) & ~((char)(v16 + v15) >> 31);
      if (v16 >= 0) {
        int v17 = v15;
      }
      BOOL v18 = v16 < 1;
      if (v16 >= 1) {
        v16 += v15;
      }
      else {
        int v16 = v15;
      }
      if (v18) {
        int v15 = v17;
      }
    }
    uint64_t v19 = v8;
    if ((_BYTE)v15)
    {
      uint64_t v20 = v8;
      if ((v15 & 0x80) != 0)
      {
        do
        {
          uint64_t v19 = v20;
          uint64_t v20 = *(void *)(v20 + 72);
          int v23 = v15++;
          if (v20) {
            BOOL v24 = v23 == 0;
          }
          else {
            BOOL v24 = 1;
          }
        }
        while (!v24);
      }
      else
      {
        do
        {
          uint64_t v19 = v20;
          uint64_t v20 = *(void *)(v20 + 80);
          int v21 = v15--;
          if (v20) {
            BOOL v22 = v21 == 0;
          }
          else {
            BOOL v22 = 1;
          }
        }
        while (!v22);
      }
    }
    uint64_t v25 = v8;
    if ((_BYTE)v16)
    {
      uint64_t v26 = v8;
      if ((v16 & 0x80) != 0)
      {
        do
        {
          uint64_t v25 = v26;
          uint64_t v26 = *(void *)(v26 + 72);
          int v29 = v16++;
          if (v26) {
            BOOL v30 = v29 == 0;
          }
          else {
            BOOL v30 = 1;
          }
        }
        while (!v30);
      }
      else
      {
        do
        {
          uint64_t v25 = v26;
          uint64_t v26 = *(void *)(v26 + 80);
          int v27 = v16--;
          if (v26) {
            BOOL v28 = v27 == 0;
          }
          else {
            BOOL v28 = 1;
          }
        }
        while (!v28);
      }
    }
    if (v19)
    {
      do
      {
        result = *(void *)(v19 + 160);
        if (result)
        {
          uint64_t v31 = 0;
          do
          {
            if (*(unsigned __int8 *)(result + 12) == v13 && (!v14 || *(unsigned __int8 *)(result + 13) == v14))
            {
              if (result == *a7) {
                *a7 = *(void *)(result + 40);
              }
              uint64_t v32 = *(void *)(result + 40);
              if (v31)
              {
                *(void *)(v31 + 40) = v32;
                PRfreeErr((void *)result);
                uint64_t v32 = *(void *)(v31 + 40);
                result = v31;
              }
              else
              {
                PRfreeErr((void *)result);
                result = 0;
                *(void *)(v19 + 160) = v32;
              }
            }
            else
            {
              uint64_t v32 = *(void *)(result + 40);
            }
            uint64_t v31 = result;
            result = v32;
          }
          while (v32);
        }
        if (v19 == v25) {
          break;
        }
        uint64_t v19 = *(void *)(v19 + 176);
      }
      while (v19);
      unsigned __int16 v10 = v39;
      uint64_t v8 = a3;
    }
  }
}

uint64_t PRPunct(uint64_t a1, uint64_t a2)
{
  v143[3] = *MEMORY[0x263EF8340];
  unsigned __int16 v134 = 0;
  v133 = 0;
  char v132 = 0;
  uint64_t result = 220;
  if (!a1) {
    return result;
  }
  if (!a2) {
    return result;
  }
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5) {
    return result;
  }
  uint64_t v6 = *(void *)(v5 + 56);
  if (!v6)
  {
    uint64_t v117 = *(void *)(a1 + 32);
    *(void *)uint64_t v117 = 0xE6FFFFFF89;
    *(_WORD *)(v117 + 8) = 200;
    return 230;
  }
  uint64_t v7 = 0;
  unsigned int v130 = *(unsigned __int16 *)(v5 + 14);
  long long v139 = 0u;
  long long v140 = 0u;
  while (1)
  {
    while ((*(_DWORD *)(v6 + 4) & 0x80000000) == 0)
    {
      uint64_t v6 = *(void *)(v6 + 80);
      if (!v6) {
        goto LABEL_200;
      }
    }
    uint64_t v8 = (int *)(v6 + 4);
    int v9 = *(_DWORD *)(v6 + 4);
    if (v9 < 0)
    {
      unsigned __int16 v10 = 0;
      do
      {
        uint64_t v7 = v6;
        if (v10 <= 3u) {
          *((void *)&v139 + v10) = v6;
        }
        if ((v9 & 0xC01FFF00) >= 0xC0000001)
        {
          unsigned int v11 = 0;
          if ((v9 & 0x100) != 0) {
            goto LABEL_20;
          }
          unsigned int v12 = 256;
          do
          {
            unsigned int v13 = v11++;
            if (v12 > 0x80000) {
              break;
            }
            int v14 = v9 & (2 * v12);
            v12 *= 2;
          }
          while (!v14);
          if (v13 <= 0xB) {
LABEL_20:
          }
            *uint64_t v8 = (((lpQuoTab[v11] >> (2 * *(unsigned char *)(a2 + 20) - 2)) & 3) << 24) | v9;
        }
        ++v10;
        uint64_t v6 = *(void *)(v6 + 80);
        if (!v6) {
          break;
        }
        uint64_t v8 = (int *)(v6 + 4);
        int v9 = *(_DWORD *)(v6 + 4);
      }
      while (v9 < 0);
    }
    else
    {
      unsigned __int16 v10 = 0;
    }
    unsigned int v15 = v10;
    if (v10 >= 5u)
    {
      uint64_t v16 = v139;
      if (v15 > 7)
      {
        if (!(void)v139)
        {
LABEL_116:
          uint64_t v6 = 0;
          goto LABEL_199;
        }
      }
      else if (!PRliveRule(a1, a2, 0, 0x34u, 99, 1, *(unsigned __int16 *)v139 >= v130))
      {
        uint64_t result = PRmkErr(a1, a2, &v133, v16, 0, 0x34u, 99);
        if (result) {
          return result;
        }
        __int16 v17 = *(_WORD *)(v16 + 8);
        BOOL v18 = v133;
        v133[2] = v17;
        __int16 v19 = *(_WORD *)(v7 + 8) - v17 + *(_WORD *)(v7 + 32);
        v18[3] = v19;
        *BOOL v18 = v17;
        v18[1] = v19;
      }
      uint64_t v6 = *(void *)(v7 + 80);
      while (v16 != v6)
      {
        *(_DWORD *)(v16 + 4) = 1024;
        uint64_t v16 = *(void *)(v16 + 80);
        if (!v16) {
          goto LABEL_116;
        }
      }
      goto LABEL_199;
    }
    if (!v10) {
      break;
    }
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)(a1 + 16);
    uint64_t v23 = *(void *)(v22 + 56);
    uint64_t v24 = *(void *)(v22 + 80);
    do
    {
      uint64_t v25 = *((void *)&v139 + v20);
      int v26 = *(_DWORD *)(v25 + 4);
      BOOL v27 = (v26 & 0xC01FFF00) >= 0xC0000001 && (v26 & 0x3000000) == 50331648;
      if (!v27) {
        goto LABEL_82;
      }
      if (v25 != v23)
      {
        uint64_t v28 = *(void *)(v25 + 72);
        if (v28)
        {
          while (!*(void *)(v28 + 40))
          {
            int v29 = *(_DWORD *)(v28 + 4);
            if ((v29 & 0xC01FFF00) >= 0xC0000001)
            {
              int v30 = 1;
              int v31 = 0;
              switch(HIBYTE(v29) & 3)
              {
                case 1:
                  goto LABEL_86;
                case 2:
                  goto LABEL_49;
                default:
                  goto LABEL_44;
              }
              goto LABEL_49;
            }
            int v30 = 0;
            if (v29 <= -2147483393)
            {
              if (v29 != -2147483644) {
                goto LABEL_49;
              }
            }
            else if (v29 != -2147483392)
            {
              int v31 = 1;
              if (v29 == -1073741820 || v29 == -1073741823) {
LABEL_86:
              }
                int v30 = v31;
              goto LABEL_49;
            }
LABEL_44:
            int v30 = 1;
            if (*(void *)(v28 + 72))
            {
              BOOL v27 = v28 == v23;
              uint64_t v28 = *(void *)(v28 + 72);
              if (!v27) {
                continue;
              }
            }
            goto LABEL_49;
          }
        }
      }
      int v30 = 1;
LABEL_49:
      LOBYTE(v32) = 1;
      uint64_t v33 = *((void *)&v139 + v20);
      while (1)
      {
        uint64_t v34 = v21;
        if ((v32 & 1) == 0) {
          break;
        }
        uint64_t v35 = *(void *)(v33 + 80);
        if (v35) {
          BOOL v36 = v33 == v24;
        }
        else {
          BOOL v36 = 1;
        }
        if (v36)
        {
          uint64_t v34 = 1;
          goto LABEL_77;
        }
        LOBYTE(v32) = 0;
        uint64_t v21 = 1;
        if (!*(void *)(v33 + 40))
        {
          uint64_t v33 = *(void *)(v33 + 80);
          int v37 = *(_DWORD *)(v35 + 4);
          if ((v37 & 0xC01FFF00) < 0xC0000001)
          {
            uint64_t v32 = 1;
            if (v37 > -2147483393)
            {
              if ((v37 + 0x1FFFFFFF) > 0x1F || ((1 << (v37 - 1)) & 0x80008009) == 0)
              {
                uint64_t v21 = v34;
                if (v37 != -2147483392) {
                  goto LABEL_70;
                }
              }
              else
              {
LABEL_71:
                uint64_t v21 = v32;
                LOBYTE(v32) = 0;
              }
            }
            else
            {
              if (v37 == -2147483646) {
                goto LABEL_71;
              }
              uint64_t v21 = v34;
              if (v37 != -2147483644)
              {
                if (v37 == -2147483632) {
                  goto LABEL_71;
                }
LABEL_70:
                uint64_t v32 = 0;
                goto LABEL_71;
              }
            }
          }
          else
          {
            LOBYTE(v32) = 0;
            uint64_t v21 = 0;
            switch(HIBYTE(v37) & 3)
            {
              case 1:
                LOBYTE(v32) = 0;
                uint64_t v21 = 1;
                break;
              case 2:
                continue;
              default:
                LOBYTE(v32) = 1;
                uint64_t v21 = v34;
                break;
            }
          }
        }
      }
      if (v30 && !v21)
      {
        int v39 = -16777217;
LABEL_80:
        *(_DWORD *)(v25 + 4) = v39 & v26;
        goto LABEL_81;
      }
LABEL_77:
      if (!v30 && v34)
      {
        int v39 = -33554433;
        goto LABEL_80;
      }
LABEL_81:
      uint64_t v21 = v34;
LABEL_82:
      ++v20;
    }
    while (v20 != v10);
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (!v132)
      {
        uint64_t v41 = *((void *)&v139 + i);
        int v42 = *(_DWORD *)(v41 + 4);
        if (v42 == -2147483647)
        {
          if (*(_WORD *)(v41 + 48)
            || (uint64_t v45 = *(void *)(v41 + 80)) == 0
            || *(_WORD *)(v45 + 32) != 2
            || (v46 = *(unsigned __int8 **)(v45 + 16), *v46 - 48 > 9)
            || v46[1] - 48 >= 0xA)
          {
            if (v134 && (LOBYTE(v138[3 * v134 - 3]) | 4) == 4) {
              *(void *)&v137[24 * v134 - 8] = v41;
            }
          }
        }
        else
        {
          uint64_t v43 = *(void *)(a2 + 80);
          if (*(_WORD *)(v43 + 1096))
          {
            uint64_t v44 = 0;
            while (*(_DWORD *)(*(void *)(v43 + 1104) + 4 * v44) != v42)
            {
              if (*(unsigned __int16 *)(v43 + 1096) == ++v44) {
                goto LABEL_88;
              }
            }
            int v47 = *(unsigned __int8 *)(*(void *)(v43 + 1112) + v44);
            if (v47 == 2)
            {
              PRclsScope(a1, a2, (uint64_t)v137, &v134, (unsigned __int16 *)v41, *(unsigned __int8 *)(*(void *)(v43 + 1120) + v44), v130, &v132);
            }
            else if (v47 == 1)
            {
              PRopnScope(a1, a2, (uint64_t)v137, &v134, (char **)v41, *(unsigned __int8 *)(*(void *)(v43 + 1120) + v44), v130, &v132);
            }
            else
            {
              uint64_t v48 = *(void *)(a1 + 32);
              *(void *)uint64_t v48 = 0xDC0000007BLL;
              *(_WORD *)(v48 + 8) = 580;
            }
          }
        }
      }
LABEL_88:
      ;
    }
    unsigned __int16 v128 = v10 - 1;
    if (v10 != 1) {
      goto LABEL_118;
    }
LABEL_199:
    long long v139 = 0u;
    long long v140 = 0u;
    if (!v6)
    {
LABEL_200:
      if (!v132)
      {
        uint64_t v109 = v134;
        if (v134)
        {
          *(void *)__s = 0;
          v110 = (unsigned __int8 *)v138;
          do
          {
            uint64_t v111 = *((void *)v110 + 1);
            if (v111)
            {
              if (**(unsigned char **)(v111 + 16) == 39) {
                *(_DWORD *)(v111 + 4) = -1056962560;
              }
              else {
                *(_DWORD *)(v111 + 4) = -1056956416;
              }
            }
            else
            {
              v112 = (unsigned __int16 *)*((void *)v110 - 1);
              int v113 = pClsMissed[*v110 + (unint64_t)pMissedOffset[*(unsigned __int8 *)(a2 + 20)]];
              if (!PRliveRule(a1, a2, 0, 0x34u, v113, 1, *v112 >= v130))
              {
                uint64_t result = PRmkErr(a1, a2, __s, (uint64_t)v112, 0, 0x34u, v113);
                if (result) {
                  return result;
                }
                unsigned __int16 v114 = v112[4];
                v115 = *(unsigned __int16 **)__s;
                *(_WORD *)(*(void *)__s + 4) = v114;
                unsigned __int16 v116 = v112[16];
                v115[3] = v116;
                unsigned __int16 *v115 = v114;
                v115[1] = v116;
              }
            }
            v110 += 24;
            --v109;
          }
          while (v109);
        }
      }
      return 0;
    }
  }
  unsigned __int16 v128 = -1;
LABEL_118:
  int v49 = 0;
  int v129 = (__int16)v10 - 2;
  unsigned int v50 = v10;
  int v124 = v10 - 2;
  uint64_t v127 = v7;
  while (1)
  {
    *(void *)v135 = 0;
    if (v129 < (__int16)v49) {
      break;
    }
    v131 = *(void **)(a2 + 80);
    int v51 = *(unsigned __int8 *)(a2 + 20);
    unsigned int v52 = PRDblIdx(*(_DWORD *)(*((void *)&v139 + (unsigned __int16)v49) + 4), v51);
    if (v52 <= 0x16
      && (unsigned int v53 = v52,
          unsigned int v54 = PRDblIdx(*(_DWORD *)(*((void *)&v139 + (unsigned __int16)v49 + 1) + 4), v51),
          v54 <= 0x16)
      && (v55 = (char *)v131 + 46 * v53, int v56 = *(__int16 *)&v55[2 * v54], *(_WORD *)&v55[2 * v54]))
    {
      __int16 v57 = *(_WORD *)&v55[2 * v54];
      if (v56 < 0)
      {
        if (v124 == (unsigned __int16)v49)
        {
          uint64_t v58 = 23;
        }
        else
        {
          int v59 = v51;
          int v60 = *(__int16 *)&v55[2 * v54];
          unsigned int v61 = PRDblIdx(*(_DWORD *)(*((void *)&v139 + (unsigned __int16)v49 + 2) + 4), v59);
          int v56 = v60;
          uint64_t v58 = v61;
        }
        __int16 v57 = *(_WORD *)(v131[133] + 48 * (unsigned __int16)((v56 & 0x7FFF) - 1) + 2 * v58);
        if (!v57) {
          goto LABEL_137;
        }
      }
      uint64_t v62 = 0;
      v63 = (unsigned __int16 *)(v131[134] + 6 * (unsigned __int16)((v57 & 0x7FFF) - 1));
      unsigned int v64 = *v63;
      unsigned int v65 = v63[1];
      int v66 = v65 & 7;
      int v67 = (v65 >> 3) & 7;
      v136[0] = (v63[1] >> 6) & 7;
      v136[1] = (v65 >> 9) & 7;
      v136[2] = (v65 >> 12) & 7;
      uint64_t v68 = v63[2];
      uint64_t v69 = v131[135];
      unsigned int v125 = *(unsigned __int8 *)(v69 + (unsigned __int16)(v68 + 1));
      unsigned int v126 = *(unsigned __int8 *)(v69 + v68);
      unsigned __int16 v70 = v68 + 2;
      while (((v66 << v62) & 4) == 0)
      {
        if (++v62 == 3)
        {
          uint64_t v118 = *(void *)(a1 + 32);
          *(void *)uint64_t v118 = 0xDC0000007BLL;
          goto LABEL_214;
        }
      }
      int v123 = v56;
      v122 = (unsigned __int16 *)*((void *)&v139 + (unsigned __int16)v49 + v62);
      unsigned int v121 = v64 >> 8;
      int v119 = v67;
      int v120 = v64;
      if (!PRliveRule(a1, a2, 0, v64 >> 8, v64, 1, *v122 >= v130))
      {
        uint64_t result = PRmkErr(a1, a2, v135, (uint64_t)v122, 0, v121, v120);
        if (result) {
          return result;
        }
        uint64_t v71 = 0;
        memset(v143, 0, 24);
        memset(v142, 0, sizeof(v142));
        do
        {
          int v72 = (unsigned __int16)v136[v71];
          if (!v136[v71]) {
            break;
          }
          for (int j = 0; j != 3; ++j)
          {
            if (((v72 << j) & 4) != 0) {
              break;
            }
          }
          uint64_t v74 = *((void *)&v139 + j + (unsigned __int16)v49);
          int v75 = 2;
          uint64_t v76 = (unsigned __int16)v49 + 2;
          do
          {
            if (((v72 << v75) & 4) != 0 && v50 > (unsigned __int16)v76 && *((void *)&v139 + v76)) {
              break;
            }
            --v75;
            --v76;
          }
          while (v75 != -1);
          uint64_t v77 = *((void *)&v139 + v75 + (unsigned __int16)v49);
          v143[v71] = v74;
          v142[v71++] = v77;
        }
        while (v71 != 3);
        uint64_t v78 = 0;
        LOWORD(v79) = 0;
        __s[0] = 0;
        while (1)
        {
          v80 = (unsigned __int16 *)v143[v78];
          if (!v80) {
            break;
          }
          v81 = (unsigned __int16 *)v142[v78];
          do
          {
            if (*v80 > *v81) {
              break;
            }
            v82 = (unsigned char *)*((void *)v80 + 3);
            char v83 = *v82;
            if (*v82 && (unsigned __int16)v79 <= 0x3Eu)
            {
              unint64_t v79 = (unsigned __int16)v79;
              v84 = v82 + 1;
              do
              {
                unint64_t v85 = v79;
                __s[v79++] = v83;
                if (v85 > 0x3D) {
                  break;
                }
                int v86 = *v84++;
                char v83 = v86;
              }
              while (v86);
            }
            if (v80 != v81)
            {
              v87 = (unsigned char *)*((void *)v80 + 5);
              if (v87)
              {
                char v88 = *v87;
                if (*v87)
                {
                  if ((unsigned __int16)v79 <= 0x3Eu)
                  {
                    unint64_t v79 = (unsigned __int16)v79;
                    v89 = v87 + 1;
                    do
                    {
                      unint64_t v90 = v79;
                      __s[v79++] = v88;
                      if (v90 > 0x3D) {
                        break;
                      }
                      int v91 = *v89++;
                      char v88 = v91;
                    }
                    while (v91);
                  }
                }
              }
            }
            v80 = (unsigned __int16 *)*((void *)v80 + 10);
          }
          while (v80);
          __s[(unsigned __int16)v79] = 0;
          LOWORD(v79) = v79 + 1;
          if (++v78 == 3) {
            goto LABEL_171;
          }
        }
        if (!(_WORD)v78) {
          goto LABEL_172;
        }
LABEL_171:
        uint64_t result = PRaddRefs(a1, *(uint64_t *)v135, __s, (unsigned __int16)v78, 0);
        if (result) {
          return result;
        }
LABEL_172:
        if (v126)
        {
          int v92 = 0;
          uint64_t v93 = v131[135];
          do
          {
            PRInsRefs(*(uint64_t *)v135, (unsigned char *)(v93 + v70), (uint64_t)__s);
            uint64_t result = PRaddAlts(a1, *(uint64_t *)v135, __s, 0, 1uLL, 0);
            if (result) {
              return result;
            }
            uint64_t v93 = v131[135];
            while (*(unsigned __int8 *)(v93 + v70++))
              ;
          }
          while (v126 > (unsigned __int16)++v92);
        }
        if (v125)
        {
          int v95 = 0;
          uint64_t v96 = v131[135];
          do
          {
            PRInsRefs(*(uint64_t *)v135, (unsigned char *)(v96 + v70), (uint64_t)__s);
            uint64_t result = PRaddFils(a1, *(uint64_t *)v135, __s, 1u, 0);
            if (result) {
              return result;
            }
            uint64_t v96 = v131[135];
            while (*(unsigned __int8 *)(v96 + v70++))
              ;
          }
          while (v125 > (unsigned __int16)++v95);
        }
        int v98 = 2;
        uint64_t v99 = (unsigned __int16)v49 + 2;
        uint64_t v100 = v99;
        do
        {
          if (((v66 << v98) & 4) != 0 && v50 > (unsigned __int16)v100 && *((void *)&v139 + v100)) {
            break;
          }
          --v98;
          --v100;
        }
        while (v98 != -1);
        uint64_t v101 = *((void *)&v139 + v98 + (unsigned __int16)v49);
        unsigned __int16 v102 = v122[4];
        v103 = *(_WORD **)v135;
        *(_WORD *)(*(void *)v135 + 4) = v102;
        LOWORD(v101) = *(_WORD *)(v101 + 8) - v102 + *(_WORD *)(v101 + 32);
        v103[3] = v101;
        _WORD *v103 = v102;
        v103[1] = v101;
        if (v119)
        {
          for (int k = 0; k != 3; ++k)
          {
            if (((v119 << k) & 4) != 0) {
              break;
            }
          }
          uint64_t v105 = *((void *)&v139 + k + (unsigned __int16)v49);
          for (int m = 2; m != -1; --m)
          {
            if (((v119 << m) & 4) != 0 && v50 > (unsigned __int16)v99 && *((void *)&v139 + v99)) {
              break;
            }
            --v99;
          }
          uint64_t v107 = *((void *)&v139 + m + (unsigned __int16)v49);
          __int16 v108 = *(_WORD *)(v105 + 8);
          v103[4] = v108;
          v103[5] = *(_WORD *)(v107 + 8) - v108 + *(_WORD *)(v107 + 32);
        }
      }
      if (v123 < 0) {
LABEL_137:
      }
        ++v49;
      uint64_t v7 = v127;
    }
    else
    {
      uint64_t v7 = v127;
    }
    if ((unsigned __int16)++v49 >= v128) {
      goto LABEL_199;
    }
  }
  uint64_t v118 = *(void *)(a1 + 32);
  *(void *)uint64_t v118 = 0xDC00000068;
LABEL_214:
  *(_WORD *)(v118 + 8) = 200;
  return 220;
}

uint64_t PRDblIdx(int a1, int a2)
{
  signed int v2 = a1 & 0xF0FFFFFF;
  if ((int)(a1 & 0xF0FFFFFF) > -1073741313)
  {
    if (v2 > -1073217537)
    {
      if (v2 <= -536870897)
      {
        switch(v2)
        {
          case -536870911:
            return 15;
          case -536870910:
            BOOL v10 = a2 == 6;
            unsigned int v11 = 23;
            unsigned int v12 = 17;
            goto LABEL_68;
          case -536870909:
          case -536870907:
          case -536870906:
          case -536870905:
            return 23;
          case -536870908:
          case -536870904:
            return 16;
          default:
            if (v2 == -1073217536) {
              goto LABEL_45;
            }
            int v5 = -1072693248;
            goto LABEL_44;
        }
      }
      if (v2 == -536870896) {
        return 5;
      }
      if (v2 == -536870880) {
        return 6;
      }
      if (v2 != -536870848) {
        return 23;
      }
    }
    else
    {
      if (v2 > -1073725441)
      {
        if (v2 > -1073676289)
        {
          if (v2 != -1073676288 && v2 != -1073610752)
          {
            int v5 = -1073479680;
LABEL_44:
            if (v2 != v5) {
              return 23;
            }
          }
LABEL_45:
          int v6 = a1 & 0x3000000;
          unsigned int v7 = 14;
          BOOL v8 = (a1 & 0x1000000) == 0;
          unsigned int v9 = 18;
          goto LABEL_53;
        }
        if (v2 == -1073725440) {
          goto LABEL_52;
        }
        unsigned __int16 v4 = 0x8000;
LABEL_51:
        if (v2 != (v4 | 0xC0000000)) {
          return 23;
        }
        goto LABEL_52;
      }
      if (v2 > -1073739777)
      {
        if (v2 != -1073739776 && v2 != -1073737728)
        {
          unsigned __int16 v4 = 0x2000;
          goto LABEL_51;
        }
LABEL_52:
        int v6 = a1 & 0x3000000;
        unsigned int v7 = 13;
        BOOL v8 = (a1 & 0x1000000) == 0;
        unsigned int v9 = 17;
LABEL_53:
        if (v8) {
          unsigned int v9 = 23;
        }
        if (v6 == 0x2000000) {
          return v7;
        }
        else {
          return v9;
        }
      }
      if (v2 != -1073741312)
      {
        unsigned __int16 v4 = 1024;
        goto LABEL_51;
      }
    }
    BOOL v10 = a2 == 6;
    unsigned int v11 = 22;
    unsigned int v12 = 18;
    goto LABEL_68;
  }
  if (v2 > -2147481601)
  {
    if (v2 <= -1073741809)
    {
      switch(v2)
      {
        case -1073741823:
          uint64_t result = 11;
          break;
        case -1073741822:
          BOOL v10 = a2 == 6;
          unsigned int v11 = 23;
          unsigned int v12 = 13;
          goto LABEL_68;
        case -1073741820:
        case -1073741816:
          uint64_t result = 12;
          break;
        default:
          return 23;
      }
      return result;
    }
    if (v2 <= -1073741761)
    {
      if (v2 != -1073741808)
      {
        if (v2 == -1073741792) {
          return 20;
        }
        return 23;
      }
      return 19;
    }
    if (v2 != -1073741760 && v2 != -1073741568) {
      return 23;
    }
    BOOL v10 = a2 == 6;
    unsigned int v11 = 21;
    unsigned int v12 = 14;
LABEL_68:
    if (v10) {
      return v12;
    }
    else {
      return v11;
    }
  }
  if (v2 > -2147483585)
  {
    if (v2 <= -2147483393)
    {
      if (v2 != -2147483584)
      {
        if (v2 == -2147483520) {
          return 2;
        }
        return 23;
      }
      return 3;
    }
    else if (v2 == -2147483392)
    {
      return 8;
    }
    else
    {
      if (v2 != -2147483136) {
        return 23;
      }
      return 9;
    }
  }
  else
  {
    if (v2 > -2147483641)
    {
      if (v2 != -2147483640)
      {
        if (v2 == -2147483632) {
          return 4;
        }
        if (v2 == -2147483616) {
          return 0;
        }
        return 23;
      }
      return 7;
    }
    if (v2 != -2147483646)
    {
      if (v2 == -2147483644) {
        return 7;
      }
      return 23;
    }
    return 1;
  }
}

uint64_t PRInsRefs(uint64_t result, unsigned char *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(result + 72);
  if (v5)
  {
    uint64_t v6 = *(void *)(v5 + 8);
    if (v6)
    {
      signed int v7 = *(__int16 *)(v6 + 18);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  signed int v7 = 0;
LABEL_6:
  if (*a2)
  {
    uint64_t v8 = 0;
    int v9 = 0;
    int v10 = 0;
    unsigned int v11 = a2;
    do
    {
      uint64_t result = SLstrncmp(v11, "REF", 3);
      if (result)
      {
        *(unsigned char *)(a3 + (unsigned __int16)v9++) = *v11;
        ++v10;
      }
      else
      {
        unsigned int v12 = a2[v8 + 3];
        BOOL v13 = v12 >= 0x31;
        signed int v14 = v12 - 49;
        if (!v13 || v7 <= v14)
        {
          *(unsigned char *)(a3 + (unsigned __int16)v9) = *v11;
          ++v10;
          ++v9;
        }
        else
        {
          v10 += 4;
          uint64_t v16 = *(unsigned __int16 *)(*(void *)(v6 + 8) + 2 * v14);
          for (char i = *(unsigned char *)(*(void *)v6 + v16); i; char i = *(unsigned char *)(*(void *)v6 + (unsigned __int16)v16))
          {
            *(unsigned char *)(a3 + (unsigned __int16)v9) = i;
            LODWORD(v16) = v16 + 1;
            ++v9;
          }
        }
      }
      uint64_t v8 = (unsigned __int16)v10;
      unsigned int v11 = &a2[(unsigned __int16)v10];
    }
    while (*v11);
  }
  else
  {
    LOWORD(v9) = 0;
  }
  *(unsigned char *)(a3 + (unsigned __int16)v9) = 0;
  return result;
}

uint64_t PRopnScope(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4, char **a5, unsigned int a6, unsigned int a7, unsigned char *a8)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)int v42 = 0;
  unsigned int v11 = *(void **)(a2 + 80);
  unsigned int v12 = *a4;
  if (!*a4)
  {
    int v13 = *(__int16 *)(v11[136] + 2 * a6);
    if ((v13 & 0x80000000) == 0)
    {
LABEL_10:
      unsigned int v18 = (unsigned __int16)(v13 - 1);
      __int16 v19 = (unsigned __int16 *)(v11[134] + 6 * (unsigned __int16)(v13 - 1));
      unsigned int v20 = *v19;
      unsigned int v21 = v20 >> 8;
      uint64_t v22 = v19[2];
      *a8 = 1;
      int v23 = v20;
      if (!PRliveRule(a1, a2, 0, v20 >> 8, v20, 1, *(unsigned __int16 *)a5 >= a7))
      {
        uint64_t v24 = v11[135];
        unsigned int v25 = *(unsigned __int8 *)(v24 + v22);
        unsigned int v26 = *(unsigned __int8 *)(v24 + (unsigned __int16)(v22 + 1));
        uint64_t result = PRmkErr(a1, a2, v42, (uint64_t)a5, 0, v21, v23);
        if (!result)
        {
          uint64_t result = PRaddRefs(a1, *(uint64_t *)v42, a5[2], 1u, 0);
          if (!result)
          {
            unsigned __int16 v27 = v22 + 2;
            if (v25)
            {
              int v28 = 0;
              uint64_t v29 = v11[135];
              while (1)
              {
                PRInsRefs(*(uint64_t *)v42, (unsigned char *)(v29 + v27), (uint64_t)__s);
                uint64_t result = PRaddAlts(a1, *(uint64_t *)v42, __s, 0, 1uLL, 0);
                if (result) {
                  break;
                }
                uint64_t v29 = v11[135];
                while (*(unsigned __int8 *)(v29 + v27++))
                  ;
                if (v25 <= (unsigned __int16)++v28) {
                  goto LABEL_19;
                }
              }
            }
            else
            {
LABEL_19:
              if (!v26)
              {
LABEL_25:
                unsigned __int16 v34 = *((_WORD *)a5 + 4);
                uint64_t v35 = *(_WORD **)v42;
                *(_WORD *)(*(void *)v42 + 4) = v34;
                unsigned __int16 v36 = *((_WORD *)a5 + 16);
                v35[3] = v36;
                *uint64_t v35 = v34;
                v35[1] = v36;
                if ((*(unsigned char *)(v11[134] + 6 * v18 + 2) & 0x38) != 0)
                {
                  v35[4] = v34;
                  v35[5] = v36;
                }
                return 0;
              }
              int v31 = 0;
              uint64_t v32 = v11[135];
              while (1)
              {
                PRInsRefs(*(uint64_t *)v42, (unsigned char *)(v32 + v27), (uint64_t)__s);
                uint64_t result = PRaddFils(a1, *(uint64_t *)v42, __s, 1u, 0);
                if (result) {
                  break;
                }
                uint64_t v32 = v11[135];
                while (*(unsigned __int8 *)(v32 + v27++))
                  ;
                if (v26 <= (unsigned __int16)++v31) {
                  goto LABEL_25;
                }
              }
            }
          }
        }
        return result;
      }
      return 0;
    }
    unsigned int v12 = 0;
LABEL_32:
    *(_WORD *)(a3 + 24 * v12 + 10) = v13 & 0x7FFF;
    __int16 v40 = *a4;
    uint64_t v41 = a3 + 24 * *a4;
    *(unsigned char *)(v41 + 8) = a6;
    *(void *)uint64_t v41 = a5;
    *(void *)(v41 + 16) = 0;
    *a4 = v40 + 1;
    return 0;
  }
  int v13 = *(__int16 *)(v11[136] + 20 * *(unsigned __int16 *)(a3 + 24 * (v12 - 1) + 10) + 2 * a6);
  if (v13 < 0)
  {
    if (v12 == 4)
    {
      *a8 = 1;
      if (!PRliveRule(a1, a2, 0, 0x34u, 98, 1, *(unsigned __int16 *)a5 >= a7))
      {
        uint64_t result = PRmkErr(a1, a2, v42, (uint64_t)a5, 0, 0x34u, 98);
        if (result) {
          return result;
        }
        unsigned __int16 v37 = *((_WORD *)a5 + 4);
        unint64_t v38 = *(_WORD **)v42;
        *(_WORD *)(*(void *)v42 + 4) = v37;
        unsigned __int16 v39 = *((_WORD *)a5 + 16);
        v38[3] = v39;
        *unint64_t v38 = v37;
        v38[1] = v39;
      }
      return 0;
    }
    goto LABEL_32;
  }
  if (!*(void *)(a3 + 24 * (v12 - 1) + 16)) {
    goto LABEL_10;
  }
  unsigned __int16 v14 = v12 - 1;
  *a4 = v14;
  uint64_t v15 = *(void *)(a3 + 24 * v14 + 16);
  if (**(unsigned char **)(v15 + 16) == 39) {
    int v16 = -1056962560;
  }
  else {
    int v16 = -1056956416;
  }
  *(_DWORD *)(v15 + 4) = v16;
  uint64_t result = PRopnScope(a1, a2);
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t PRclsScope(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4, unsigned __int16 *a5, unsigned int a6, unsigned int a7, unsigned char *a8)
{
  uint64_t v8 = a5;
  *(void *)uint64_t v32 = 0;
  uint64_t v11 = *(void *)(a2 + 80);
  unsigned int v12 = *a4;
  if (!*a4)
  {
    uint64_t v15 = (unsigned int *)(a5 + 2);
    int v14 = *((_DWORD *)a5 + 1);
    if ((~v14 & 0x3000000) == 0)
    {
LABEL_17:
      unsigned int v26 = v14 & 0xFEFFFFFF;
      *uint64_t v15 = v26;
      if (!*(_WORD *)(v11 + 1096)) {
        return 0;
      }
      uint64_t v27 = 0;
      while (*(_DWORD *)(*(void *)(v11 + 1104) + 4 * v27) != v26)
      {
        if (*(unsigned __int16 *)(v11 + 1096) == ++v27) {
          return 0;
        }
      }
      uint64_t result = PRopnScope(a1, a2, a3, a4, (char **)a5, *(unsigned __int8 *)(*(void *)(v11 + 1120) + v27), a7, a8);
      if (!result) {
        return 0;
      }
      return result;
    }
    goto LABEL_6;
  }
  if (*(unsigned __int8 *)(a3 + 24 * (v12 - 1) + 8) == a6)
  {
    *a4 = v12 - 1;
    int v13 = *((_DWORD *)a5 + 1);
    if ((~v13 & 0x3000000) == 0) {
      *((_DWORD *)a5 + 1) = v13 & 0xFDFFFFFF;
    }
    return 0;
  }
  uint64_t v15 = (unsigned int *)(a5 + 2);
  int v14 = *((_DWORD *)a5 + 1);
  if ((~v14 & 0x3000000) == 0) {
    goto LABEL_17;
  }
  if (!*(void *)(a3 + 24 * (v12 - 1) + 16))
  {
    if (v12 >= 2)
    {
      if (*(unsigned __int8 *)(a3 + 24 * (v12 - 2) + 8) == a6)
      {
        int v16 = *(char ***)(a3 + 24 * (v12 - 1));
        unsigned __int8 v19 = 52;
        unsigned __int8 v18 = 119;
        __int16 v17 = (char **)a5;
        switch(*(unsigned char *)(a2 + 20))
        {
          case 5:
            unsigned __int8 v18 = 122;
            goto LABEL_56;
          case 6:
            break;
          case 7:
            unsigned __int8 v18 = 125;
            goto LABEL_56;
          case 8:
            unsigned __int8 v18 = -118;
            goto LABEL_56;
          case 9:
            unsigned __int8 v18 = 118;
            goto LABEL_56;
          case 0xC:
            unsigned __int8 v18 = -90;
            goto LABEL_56;
          default:
            unsigned __int8 v19 = 52;
            unsigned __int8 v18 = 117;
LABEL_56:
            __int16 v17 = (char **)a5;
            break;
        }
LABEL_9:
        *a8 = 1;
        unsigned int v20 = v19;
        int v21 = v18;
        if (PRliveRule(a1, a2, 0, v19, v18, 1, *v8 >= a7)) {
          return 0;
        }
        uint64_t result = PRmkErr(a1, a2, v32, (uint64_t)v8, 0, v20, v21);
        if (!result)
        {
          unsigned __int16 v23 = v8[4];
          uint64_t v24 = *(unsigned __int16 **)v32;
          *(_WORD *)(*(void *)v32 + 4) = v23;
          unsigned __int16 v25 = v8[16];
          v24[3] = v25;
          *uint64_t v24 = v23;
          v24[1] = v25;
          if (!v16 || (uint64_t result = PRaddRefs(a1, (uint64_t)v24, v16[2], 1u, 0), !result))
          {
            if (!v17) {
              return 0;
            }
            uint64_t result = PRaddRefs(a1, *(uint64_t *)v32, v17[2], 1u, 0);
            if (!result) {
              return 0;
            }
          }
        }
        return result;
      }
      if (v12 >= 3)
      {
        unsigned __int8 v18 = 0;
        unsigned __int8 v19 = 0;
        int v16 = 0;
        for (unsigned __int16 i = 3; i <= v12; ++i)
        {
          if (*(unsigned __int8 *)(a3 + 24 * (int)(v12 - i) + 8) == a6)
          {
            unsigned __int8 v18 = 120;
            unsigned __int8 v19 = 52;
            int v31 = a5;
            int v16 = (char **)a5;
            switch(*(unsigned char *)(a2 + 20))
            {
              case 5:
                unsigned __int8 v18 = 123;
                goto LABEL_46;
              case 6:
                break;
              case 7:
                unsigned __int8 v18 = 126;
                goto LABEL_46;
              case 8:
                unsigned __int8 v18 = -117;
                goto LABEL_46;
              case 9:
                unsigned __int8 v18 = 119;
                goto LABEL_46;
              case 0xC:
                unsigned __int8 v18 = -89;
                goto LABEL_46;
              default:
                unsigned __int8 v18 = 118;
                unsigned __int8 v19 = 52;
LABEL_46:
                int v31 = a5;
                int v16 = (char **)a5;
                break;
            }
          }
          else
          {
            int v31 = 0;
          }
          if (v31) {
            break;
          }
        }
        if (v31)
        {
          __int16 v17 = 0;
          uint64_t v8 = v31;
          goto LABEL_9;
        }
LABEL_7:
        if (!a5) {
          return 0;
        }
        __int16 v17 = 0;
        unsigned __int8 v18 = pOpnMissed[pMissedOffset[*(unsigned __int8 *)(a2 + 20)] + (unint64_t)a6];
        unsigned __int8 v19 = 52;
        goto LABEL_9;
      }
    }
LABEL_6:
    int v16 = 0;
    goto LABEL_7;
  }
  *a4 = v12 - 1;
  uint64_t v28 = *(void *)(a3 + 24 * (unsigned __int16)(v12 - 1) + 16);
  if (**(unsigned char **)(v28 + 16) == 39) {
    int v29 = -1056962560;
  }
  else {
    int v29 = -1056956416;
  }
  *(_DWORD *)(v28 + 4) = v29;
  uint64_t result = PRclsScope(a1, a2);
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t isUpperCase(int a1)
{
  unsigned int v2 = a1 - 65;
  uint64_t result = 1;
  if (v2 >= 0x1A && (a1 - 192) >= 0x17 && (a1 - 216) >= 7)
  {
    unsigned int v4 = a1 - 138;
    if (v4 > 0x15 || ((1 << v4) & 0x200015) == 0) {
      return 0;
    }
  }
  return result;
}

uint64_t toLower(uint64_t result)
{
  if ((result - 65) < 0x1A || (result - 192) < 0x17)
  {
    if ((result - 138) > 0x15 || ((1 << (result + 118)) & 0x200015) == 0) {
      return (result + 32);
    }
LABEL_13:
    if (result == 159) {
      return 255;
    }
    else {
      return (result + 16);
    }
  }
  if ((result - 216) < 7) {
    return (result + 32);
  }
  if ((result - 138) <= 0x15 && ((1 << (result + 118)) & 0x200015) != 0) {
    goto LABEL_13;
  }
  return result;
}

uint64_t isVowelTurkish(int a1)
{
  uint64_t result = 1;
  if ((a1 - 65) > 0x34 || ((1 << (a1 - 65)) & 0x10411100104111) == 0)
  {
    unsigned int v3 = a1 - 214;
    if (v3 > 0x27 || ((1 << v3) & 0xC1000000C1) == 0) {
      return 0;
    }
  }
  return result;
}

uint64_t simpleTokenRangeAfterIndex(UniChar *buffer, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = a2 + a3;
  if (a2 + a3 <= a4) {
    return 0;
  }
  int64_t v5 = a4;
  CFCharacterSetRef Predefined = 0;
  CFCharacterSetRef theSet = 0;
  uint64_t v7 = -(uint64_t)a4;
  unint64_t v8 = a4 + 64;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v11 = v10;
    if ((unint64_t)v5 >= 4) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = v5;
    }
    if (v5 < 0 || (int64_t v13 = *((void *)buffer + 20), v13 <= v5))
    {
      LOWORD(v15) = 0;
    }
    else
    {
      uint64_t v14 = *((void *)buffer + 17);
      if (v14)
      {
        unsigned int v15 = *(unsigned __int16 *)(v14 + 2 * (v5 + *((void *)buffer + 19)));
      }
      else
      {
        uint64_t v17 = *((void *)buffer + 18);
        if (v17)
        {
          unsigned int v15 = *(char *)(v17 + *((void *)buffer + 19) + v5);
        }
        else
        {
          if (*((void *)buffer + 22) <= v5 || (int64_t v18 = *((void *)buffer + 21), v18 > v5))
          {
            uint64_t v19 = -v12;
            uint64_t v20 = v12 + v7;
            int64_t v21 = v8 - v12;
            int64_t v22 = v5 + v19;
            int64_t v23 = v22 + 64;
            if (v22 + 64 >= v13) {
              int64_t v23 = *((void *)buffer + 20);
            }
            *((void *)buffer + 21) = v22;
            *((void *)buffer + 22) = v23;
            if (v13 >= v21) {
              int64_t v13 = v21;
            }
            v29.length = v13 + v20;
            v29.location = v22 + *((void *)buffer + 19);
            CFStringGetCharacters(*((CFStringRef *)buffer + 16), v29, buffer);
            int64_t v18 = *((void *)buffer + 21);
          }
          unsigned int v15 = buffer[v5 - v18];
        }
      }
      if ((unsigned __int16)v15 >= 0x100u)
      {
        int16x4_t v24 = vdup_n_s16(v15);
        if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x35003600820076, (uint16x4_t)vadd_s16(v24, (int16x4_t)0xF5FBF6FCFC00FB76))) & 1) != 0|| (unsigned __int16)(v15 - 3077) < 0x39u|| (unsigned __int16)((unsigned __int16)(v15 + 21504) >> 2) < 0xAE9u|| (v15 & 0xFF00) == 0x1100|| (unsigned __int16)(v15 - 12592) < 0x60u)
        {
          goto LABEL_50;
        }
        unsigned int v25 = (unsigned __int16)v15 - 8204;
        if (v25 <= 0x1B && ((1 << v25) & 0x9003003) != 0)
        {
LABEL_35:
          if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
            return v11;
          }
          if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v9 = v5;
          }
LABEL_39:
          uint64_t v10 = v11;
          goto LABEL_53;
        }
        if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x16000300160007, (uint16x4_t)vadd_s16(v24, (int16x4_t)0xF5C4F5FFF6C6FB7DLL))) & 1) != 0|| (unsigned __int16)(v15 - 3072) < 5u|| (unsigned __int16)(v15 - 3134) < 0x19u|| (v15 & 0xFFFC) == 0x900)
        {
          goto LABEL_39;
        }
        if ((unsigned __int16)((unsigned __int16)v15 >> 3) <= 0x404u)
        {
          if (!theSet) {
            CFCharacterSetRef theSet = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
          }
          if (!Predefined) {
            CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNonBase);
          }
          if (CFCharacterSetIsCharacterMember(theSet, v15)) {
            goto LABEL_50;
          }
          if (CFCharacterSetIsCharacterMember(Predefined, v15)) {
            goto LABEL_39;
          }
        }
        goto LABEL_14;
      }
    }
    uint64_t v16 = simpleTokenCategories[(unsigned __int16)v15];
    if (v16 == 50) {
      goto LABEL_35;
    }
    if (v16 == 49)
    {
LABEL_50:
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v10 = v5;
      }
      else {
        uint64_t v10 = v11;
      }
      goto LABEL_53;
    }
    if (v16 != 48) {
      goto LABEL_39;
    }
LABEL_14:
    if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
      return v11;
    }
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
      return v11;
    }
LABEL_53:
    ++v5;
    --v7;
    ++v8;
  }
  while (v4 != v5);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL && v10 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  return v10;
}

uint64_t toUpper(uint64_t result)
{
  if ((int)result <= 247 && (result - 97) >= 0x1A && (result - 223) >= 0x18)
  {
    if ((result - 154) > 4 || ((1 << (result + 102)) & 0x15) == 0) {
      return result;
    }
    return (result - 16);
  }
  if ((result - 154) <= 4 && ((1 << (result + 102)) & 0x15) != 0) {
    return (result - 16);
  }
  if (result == 255) {
    unsigned int v1 = 159;
  }
  else {
    unsigned int v1 = result - 32;
  }
  if (result == 223) {
    return 223;
  }
  else {
    return v1;
  }
}

uint64_t PRrule(unsigned __int8 *a1, int a2, unsigned __int16 a3)
{
  if (!a1) {
    return 230;
  }
  uint64_t v6 = a1 + 20;
  uint64_t v7 = PRGetAppElem(*a1);
  if (!v7)
  {
    uint64_t v10 = 0xE6FFFFFF93;
LABEL_19:
    *(void *)(a1 + 20) = v10;
    __int16 v12 = 520;
LABEL_34:
    *((_WORD *)a1 + 14) = v12;
    return 230;
  }
  uint64_t v8 = v7;
  unsigned int v9 = a3;
  *(void *)(v7 + 32) = v6;
  if (a2 <= 1023)
  {
    if (a2 > 511)
    {
      if (a2 == 512) {
        goto LABEL_17;
      }
      if (a2 != 768) {
        goto LABEL_32;
      }
    }
    else if (a2 != 17)
    {
      if (a2 != 256) {
        goto LABEL_32;
      }
LABEL_17:
      if (a3 - 1 >= 2)
      {
        uint64_t v10 = 0xE6FFFFFF94;
        goto LABEL_19;
      }
      goto LABEL_24;
    }
LABEL_22:
    if (a3)
    {
      *(void *)(a1 + 20) = 0xE6FFFFFF94;
      __int16 v12 = 521;
      goto LABEL_34;
    }
    goto LABEL_24;
  }
  if (a2 > 1535)
  {
    if (a2 != 1536 && a2 != 1792) {
      goto LABEL_32;
    }
    goto LABEL_22;
  }
  if (a2 == 1024) {
    goto LABEL_17;
  }
  if (a2 != 1280)
  {
LABEL_32:
    uint64_t v11 = 0xE6FFFFFF95;
    goto LABEL_33;
  }
  if (a3 - 3 >= 3)
  {
    uint64_t v11 = 0xE6FFFFFF94;
    goto LABEL_33;
  }
LABEL_24:
  if (a2 <= 511)
  {
    if (a2 == 17)
    {
      release((uint64_t)a1);
      return 0;
    }
LABEL_30:
    if (!*((void *)a1 + 1))
    {
      a1[16] = 0;
      if (a2 == 1024 && !a1[7])
      {
        *(void *)(a1 + 20) = 0xE6FFFFFF85;
        __int16 v12 = 523;
        goto LABEL_34;
      }
      goto LABEL_43;
    }
    uint64_t v11 = 0xE6FFFFFF85;
LABEL_33:
    *(void *)(a1 + 20) = v11;
    __int16 v12 = 522;
    goto LABEL_34;
  }
  if (a2 == 512)
  {
    int v15 = a1[6];
    if ((~v15 & 0xC) == 0 || !a1[6] || (v15 & 3) == 3)
    {
      *(void *)(a1 + 20) = 0xE6FFFFFF85;
      __int16 v12 = 524;
      goto LABEL_34;
    }
    goto LABEL_43;
  }
  if (a2 == 768 || a2 == 1024) {
    goto LABEL_30;
  }
LABEL_43:
  uint64_t v16 = PRGetDbElem(*a1, a1[1]);
  if (!v16)
  {
    uint64_t v19 = *(void *)(v8 + 32);
    *(void *)uint64_t v19 = 0xE6FFFFFF92;
    *(_WORD *)(v19 + 8) = 524;
    return 230;
  }
  uint64_t v17 = v16;
  HIDWORD(v18) = a2;
  LODWORD(v18) = a2 - 256;
  switch((v18 >> 8))
  {
    case 0u:
      uint64_t RuleStatus = getRuleStatus(v8, v16, a1, v9 != 1);
      goto LABEL_64;
    case 1u:
      uint64_t RuleStatus = setStatus(v8, v16, a1, v9 != 1);
      goto LABEL_64;
    case 2u:
      uint64_t RuleStatus = getLongTypeDescription(v8, v16, (uint64_t)a1);
      goto LABEL_64;
    case 3u:
      if (v9 == 1) {
        uint64_t RuleStatus = getTypeDescriptions(v8, v16, a1);
      }
      else {
        uint64_t RuleStatus = getRuleDescriptions(v8, v16, a1);
      }
      goto LABEL_64;
    case 4u:
      unint64_t v21 = 0x30201000000uLL >> (8 * v9);
      if (v9 >= 6) {
        LOBYTE(v21) = 0;
      }
      int v22 = a1[2];
      int v23 = v21 & 3;
      uint64_t v24 = v8;
      uint64_t v25 = v17;
      char v26 = 0;
      goto LABEL_56;
    case 5u:
      int v22 = a1[2];
      int v23 = *(unsigned char *)(*(void *)(v16 + 48) + 324) & 3;
      uint64_t v24 = v8;
      uint64_t v25 = v17;
      char v26 = 1;
LABEL_56:
      uint64_t RuleStatus = PRloadProfile(v24, v25, v22, v23, v26);
LABEL_64:
      uint64_t v13 = RuleStatus;
      goto LABEL_65;
    case 6u:
      int v27 = *(unsigned char *)(*(void *)(v16 + 48) + 324) & 3;
      switch(v27)
      {
        case 3:
          uint64_t v13 = 0;
          __int16 v28 = 5;
          goto LABEL_73;
        case 2:
          uint64_t v13 = 0;
          __int16 v28 = 4;
          goto LABEL_73;
        case 1:
          uint64_t v13 = 0;
          __int16 v28 = 3;
LABEL_73:
          *((_WORD *)a1 + 9) = v28;
          goto LABEL_65;
      }
      uint64_t v13 = 0;
      *((_WORD *)a1 + 9) = 0;
LABEL_65:
      if (a2 != 1280 && a2 != 1536)
      {
        if (a1[2])
        {
          uint64_t v29 = *(void *)(v8 + 32);
          *(void *)uint64_t v29 = 0xE6FFFFFF8FLL;
          *(_WORD *)(v29 + 8) = 536;
        }
        else
        {
          int v30 = *(void **)(v17 + 136);
          if (v30)
          {
            free(v30);
            *(void *)(v17 + 136) = 0;
          }
        }
      }
      return v13;
    default:
      uint64_t v13 = 0;
      goto LABEL_65;
  }
}

void release(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    do
    {
      uint64_t v3 = *(void *)(v2 + 16);
      if (*(void *)v2) {
        free(*(void **)v2);
      }
      free((void *)v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
}

uint64_t getLongTypeDescription(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a3 + 2))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(void *)uint64_t v4 = 0xE6FFFFFF8ELL;
    __int16 v5 = 744;
LABEL_8:
    *(_WORD *)(v4 + 8) = v5;
    return 230;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a2 + 136) = 0;
  uint64_t v9 = *(void *)(v8 + 32);
  uint64_t v10 = *(uint64_t **)(v8 + 312);
  if (v10) {
    uint64_t v11 = *v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(void *)(v8 + 200);
  uint64_t v13 = *(void *)(v8 + 224);
  unsigned __int16 v22 = 0;
  uint64_t v14 = *(void *)(v8 + 304);
  if (getTypeIndex(v9, &v22, *(unsigned __int8 *)(v8 + 26), *(unsigned __int8 *)(a3 + 3), 0))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(void *)uint64_t v4 = 0xE6FFFFFF8ELL;
    __int16 v5 = 536;
    goto LABEL_8;
  }
  unsigned int v16 = bswap32(*(_DWORD *)(v13 + 4 * v22));
  if (v16 == -1) {
    return 4;
  }
  int v23 = 0;
  __int16 v21 = 0;
  char v20 = 0;
  uint64_t result = getOneDesc(a1, a2, a3, (unsigned int *)v8, (char **)&v23, &v20, &v21, *(_DWORD *)(v8 + 4) + 4 * v16, 1);
  if (!result)
  {
    uint64_t v24 = 0;
    if (newListNode(a3, (uint64_t)&v24))
    {
      uint64_t v17 = v24;
      *uint64_t v24 = v23;
      *((_WORD *)v17 + 4) = v21;
      *((unsigned char *)v17 + 10) = *(unsigned char *)(a3 + 3);
      *((unsigned char *)v17 + 12) = v20;
      char OneStatus = getOneStatus(v11, v14, v12, v22, 0);
      uint64_t result = 0;
      *((unsigned char *)v17 + 11) = OneStatus;
    }
    else
    {
      free(v23);
      uint64_t v19 = *(void *)(a1 + 32);
      *(void *)uint64_t v19 = 0xDC00000078;
      *(_WORD *)(v19 + 8) = 536;
      return 220;
    }
  }
  return result;
}

uint64_t getTypeDescriptions(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (a3[2])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(void *)uint64_t v4 = 0xE6FFFFFF8ELL;
    *(_WORD *)(v4 + 8) = 744;
    return 230;
  }
  else
  {
    uint64_t v8 = *(void *)(a2 + 48);
    *(void *)(a2 + 136) = 0;
    uint64_t v9 = *(void *)(v8 + 32);
    uint64_t v10 = *(uint64_t **)(v8 + 312);
    if (v10) {
      uint64_t v23 = *v10;
    }
    else {
      uint64_t v23 = 0;
    }
    uint64_t v11 = *(void *)(v8 + 200);
    uint64_t v12 = *(void *)(v8 + 208);
    unsigned __int16 v26 = 0;
    uint64_t v13 = *(void *)(v8 + 304);
    if (getTypeIndex(v9, &v26, *(unsigned __int8 *)(v8 + 26), a3[3], 1))
    {
      return 4;
    }
    else
    {
      if ((unsigned __int16)(v26 + a3[7]) >= *(unsigned __int8 *)(v8 + 26)) {
        unsigned int v14 = *(unsigned __int8 *)(v8 + 26);
      }
      else {
        unsigned int v14 = (unsigned __int16)(v26 + a3[7]);
      }
      if (v26 >= v14)
      {
        return 0;
      }
      else
      {
        uint64_t v21 = v13;
        uint64_t v22 = v11;
        int v27 = 0;
        __int16 v28 = 0;
        __int16 v25 = 0;
        unsigned __int16 v15 = 4 * v26;
        char v24 = 0;
        while (1)
        {
          uint64_t OneDesc = getOneDesc(a1, a2, (uint64_t)a3, (unsigned int *)v8, (char **)&v27, &v24, &v25, ((*(unsigned __int8 *)(v12 + v15) << 24) | (*(unsigned __int8 *)(v12 + (v15 | 1)) << 16) | (*(unsigned __int8 *)(v12 + (v15 | 2)) << 8) | *(unsigned __int8 *)(v12 + (v15 | 3)))+ *(_DWORD *)(v8 + 4), 0);
          if (OneDesc)
          {
            uint64_t v5 = OneDesc;
            goto LABEL_20;
          }
          if (!newListNode((uint64_t)a3, (uint64_t)&v28)) {
            break;
          }
          uint64_t v17 = v28;
          *__int16 v28 = v27;
          *((_WORD *)v17 + 4) = v25;
          int v18 = v26;
          *((unsigned char *)v17 + 10) = *(unsigned char *)(v9 + v26);
          *((unsigned char *)v17 + 12) = v24;
          uint64_t v5 = 0;
          *((unsigned char *)v17 + 11) = getOneStatus(v23, v21, v22, v18, 0);
          v15 += 4;
          if (v14 <= ++v26) {
            return v5;
          }
        }
        free(v27);
        uint64_t v19 = *(void *)(a1 + 32);
        *(void *)uint64_t v19 = 0xDC00000078;
        *(_WORD *)(v19 + 8) = 537;
        uint64_t v5 = 220;
LABEL_20:
        release((uint64_t)a3);
      }
    }
  }
  return v5;
}

uint64_t getRuleDescriptions(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (a3[2])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(void *)uint64_t v4 = 0xE6FFFFFF8ELL;
    __int16 v5 = 744;
LABEL_8:
    *(_WORD *)(v4 + 8) = v5;
    return 230;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a2 + 136) = 0;
  uint64_t v9 = *(void *)(v8 + 32);
  uint64_t v10 = *(uint64_t **)(v8 + 312);
  if (v10) {
    uint64_t v11 = *v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(void *)(v8 + 40);
  uint64_t v13 = *(void *)(v8 + 200);
  uint64_t v14 = *(void *)(v8 + 216);
  unsigned __int16 v41 = 0;
  uint64_t v15 = *(void *)(v8 + 304);
  if (getTypeIndex(v9, &v41, *(unsigned __int8 *)(v8 + 26), a3[3], 0))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(void *)uint64_t v4 = 0xE6FFFFFF8ELL;
    __int16 v5 = 537;
    goto LABEL_8;
  }
  uint64_t v34 = v14;
  uint64_t v35 = v15;
  uint64_t v18 = 2 * v41;
  int v19 = *(unsigned __int8 *)(v12 + (v18 | 1)) | (*(unsigned __int8 *)(v12 + v18) << 8);
  int v20 = *(unsigned __int8 *)(v13 + (v18 | 1)) | (*(unsigned __int8 *)(v13 + v18) << 8);
  uint64_t v33 = a2;
  if (v41) {
    v20 -= bswap32(*(unsigned __int16 *)(v13 + v18 - 2)) >> 16;
  }
  unsigned __int16 v37 = v20 + v19;
  int v21 = a3[4];
  int v22 = v19 + v21 + 0xFFFF;
  uint64_t v36 = (uint64_t)a3;
  __int16 v38 = a3[7];
  BOOL v23 = (unsigned __int16)(v20 + v19) <= (unsigned __int16)(v19 + v21 - 1) || a3[7] == 0;
  uint64_t v25 = v14;
  uint64_t v24 = v35;
  if (v23) {
    return 4 * (*(unsigned char *)(v36 + 16) == 0);
  }
  int v42 = 0;
  uint64_t v43 = 0;
  __int16 v40 = 0;
  unsigned __int16 v26 = 4 * (v19 + v21 - 1);
  char v39 = 0;
  while (1)
  {
    unsigned int OneStatus = getOneStatus(v11, v24, v13, v41, (__int16)v21);
    if (OneStatus < 8) {
      goto LABEL_22;
    }
    int v28 = (*(unsigned __int8 *)(v25 + v26) << 24) | (*(unsigned __int8 *)(v25 + (v26 | 1)) << 16) | (*(unsigned __int8 *)(v25 + (v26 | 2)) << 8) | *(unsigned __int8 *)(v25 + (v26 | 3));
    if (v28 == -1) {
      goto LABEL_22;
    }
    char v29 = OneStatus;
    uint64_t OneDesc = getOneDesc(a1, v33, v36, (unsigned int *)v8, (char **)&v42, &v39, &v40, *(_DWORD *)(v8 + 4) + v28, 0);
    if (OneDesc)
    {
      uint64_t v16 = OneDesc;
      goto LABEL_27;
    }
    if (!newListNode(v36, (uint64_t)&v43)) {
      break;
    }
    --v38;
    int v31 = v43;
    *uint64_t v43 = v42;
    *((_WORD *)v31 + 4) = v40;
    *((unsigned char *)v31 + 10) = v21;
    *((unsigned char *)v31 + 12) = v39;
    *((unsigned char *)v31 + 11) = v29;
    uint64_t v25 = v34;
    uint64_t v24 = v35;
LABEL_22:
    if ((unsigned __int16)++v22 < v37)
    {
      v26 += 4;
      LOWORD(v21) = v21 + 1;
      if (v38 > 0) {
        continue;
      }
    }
    return 4 * (*(unsigned char *)(v36 + 16) == 0);
  }
  free(v42);
  uint64_t v32 = *(void *)(a1 + 32);
  *(void *)uint64_t v32 = 0xDC00000078;
  *(_WORD *)(v32 + 8) = 538;
  uint64_t v16 = 220;
LABEL_27:
  release(v36);
  return v16;
}

uint64_t getRuleStatus(uint64_t a1, uint64_t a2, unsigned char *a3, int a4)
{
  uint64_t v28 = 0;
  int v27 = 0;
  if (a3[2])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(void *)uint64_t v5 = 0xE6FFFFFF8ELL;
    __int16 v6 = 744;
LABEL_11:
    *(_WORD *)(v5 + 8) = v6;
    return 230;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a2 + 136) = 0;
  uint64_t v9 = *(void *)(v8 + 32);
  uint64_t v10 = *(unsigned __int16 **)(v8 + 200);
  uint64_t v11 = *(uint64_t **)(v8 + 312);
  if (v11) {
    uint64_t v12 = *v11;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(void *)(v8 + 216);
  uint64_t v14 = *(void *)(v8 + 40);
  uint64_t v15 = *(void *)(v8 + 304);
  unsigned int v16 = a3[3];
  unsigned __int8 v17 = a3[4];
  if (a4) {
    unsigned __int8 v18 = a3[4];
  }
  else {
    unsigned __int8 v18 = 0;
  }
  unsigned __int16 v26 = 0;
  if (getPosition(&v26, (_DWORD *)&v28 + 1, &v28, &v27, v9, v10, *(unsigned __int8 *)(v8 + 26), v16, v17))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(void *)uint64_t v5 = 0xE6FFFFFF8ELL;
    __int16 v6 = 538;
    goto LABEL_11;
  }
  if (v18
    && (!v28
     || bswap32(*(_DWORD *)(v13
                          + ((4
                            * ((*(unsigned __int8 *)(v14 + 2 * v26 + 1) | (*(unsigned __int8 *)(v14 + 2 * v26) << 8))
                             + v18)
                            - 4) & 0x3FFFC))) == -1))
  {
    return 4;
  }
  uint64_t v29 = 0;
  if (newListNode((uint64_t)a3, (uint64_t)&v29))
  {
    if (v12)
    {
      if (getMapVal(v12, v28, 1)) {
        char v20 = 2;
      }
      else {
        char v20 = 1;
      }
      *(unsigned char *)(v29 + 11) |= v20;
    }
    int MapVal = getMapVal(v15, v28, 1);
    uint64_t result = 0;
    uint64_t v22 = v29;
    if (MapVal) {
      char v23 = 8;
    }
    else {
      char v23 = 4;
    }
    *(unsigned char *)(v29 + 11) |= v23;
    *(void *)uint64_t v22 = 0;
    *(_WORD *)(v22 + 8) = 0;
    if (v18) {
      char v24 = v18;
    }
    else {
      char v24 = v16;
    }
    *(unsigned char *)(v22 + 10) = v24;
    *(unsigned char *)(v22 + 12) = 0;
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 32);
    *(void *)uint64_t v25 = 0xDC00000078;
    *(_WORD *)(v25 + 8) = 539;
    return 220;
  }
  return result;
}

uint64_t setStatus(uint64_t a1, uint64_t a2, unsigned char *a3, int a4)
{
  unsigned int v23 = 0;
  if (a3[2])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(void *)uint64_t v5 = 0xE6FFFFFF8ELL;
    __int16 v6 = 744;
LABEL_15:
    *(_WORD *)(v5 + 8) = v6;
    return 230;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a2 + 136) = 0;
  uint64_t v9 = *(uint64_t **)(v8 + 312);
  if (v9) {
    uint64_t v10 = *v9;
  }
  else {
    uint64_t v10 = 0;
  }
  if ((a3[6] & 3) != 0 && v10 == 0)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v17 = 0xE6FFFFFF85;
    goto LABEL_14;
  }
  uint64_t v12 = *(void *)(v8 + 32);
  uint64_t v13 = *(unsigned __int16 **)(v8 + 200);
  uint64_t v14 = *(void *)(v8 + 304);
  int v15 = *(unsigned __int8 *)(v8 + 26);
  unsigned int v16 = a3[3];
  if (a4)
  {
    if (getPosition(0, 0, &v23, 0, v12, v13, v15, v16, a3[4]))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v17 = 0xE6FFFFFF8ELL;
LABEL_14:
      *(void *)uint64_t v5 = v17;
      __int16 v6 = 740;
      goto LABEL_15;
    }
    if (!v23)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(void *)uint64_t v5 = 0xE6FFFFFF8ELL;
      __int16 v6 = 741;
      goto LABEL_15;
    }
  }
  else if (getPosition(0, &v23, 0, 0, v12, v13, v15, v16, 0))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(void *)uint64_t v5 = 0xE6FFFFFF8ELL;
    __int16 v6 = 742;
    goto LABEL_15;
  }
  if (v10)
  {
    if (a3[6])
    {
      unint64_t v19 = (unint64_t)v23 >> 3;
      unsigned int v20 = *(unsigned __int8 *)(v10 + v19) & (-129 >> (v23 & 7));
    }
    else
    {
      if ((a3[6] & 2) == 0) {
        goto LABEL_27;
      }
      unint64_t v19 = (unint64_t)v23 >> 3;
      unsigned int v20 = *(unsigned __int8 *)(v10 + v19) | (0x80u >> (v23 & 7));
    }
    *(unsigned char *)(v10 + v19) = v20;
    *(unsigned char *)(v8 + 324) |= 0x80u;
  }
LABEL_27:
  if ((a3[6] & 4) != 0)
  {
    uint64_t result = 0;
    unint64_t v21 = (unint64_t)v23 >> 3;
    unsigned int v22 = *(unsigned __int8 *)(v14 + v21) & (-129 >> (v23 & 7));
    goto LABEL_31;
  }
  uint64_t result = 0;
  if ((a3[6] & 8) != 0)
  {
    unint64_t v21 = (unint64_t)v23 >> 3;
    unsigned int v22 = *(unsigned __int8 *)(v14 + v21) | (0x80u >> (v23 & 7));
LABEL_31:
    *(unsigned char *)(v14 + v21) = v22;
  }
  return result;
}

uint64_t PRsleepRuleData(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(void *)uint64_t v3 = 0xE6FFFFFF8FLL;
    *(_WORD *)(v3 + 8) = 536;
    return 230;
  }
  else
  {
    uint64_t result = *(void *)(a2 + 136);
    if (result)
    {
      free((void *)result);
      uint64_t result = 0;
      *(void *)(a2 + 136) = 0;
    }
  }
  return result;
}

uint64_t PRwakeRuleData(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, void *a12, void *a13, char a14)
{
  if (a14)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(void *)uint64_t v14 = 0xE6FFFFFF8ELL;
    *(_WORD *)(v14 + 8) = 744;
    return 230;
  }
  else
  {
    unsigned int v16 = *(void **)(a2 + 48);
    *(void *)(a2 + 136) = 0;
    if (a3) {
      *a3 = v16;
    }
    if (a4) {
      *a4 = v16[4];
    }
    if (a5) {
      *a5 = v16[5];
    }
    if (a6) {
      *a6 = v16[25];
    }
    if (a7) {
      *a7 = v16[26];
    }
    if (a8) {
      *a8 = v16[27];
    }
    if (a9) {
      *a9 = v16[28];
    }
    if (a10) {
      *a10 = v16[32];
    }
    if (a11) {
      *a11 = v16[34];
    }
    if (a12)
    {
      uint64_t v17 = (void *)v16[39];
      if (v17) {
        uint64_t v17 = (void *)*v17;
      }
      *a12 = v17;
    }
    uint64_t result = 0;
    if (a13) {
      *a13 = v16[38];
    }
  }
  return result;
}

uint64_t getOneDesc(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, char **a5, unsigned char *a6, _WORD *a7, unsigned int a8, char a9)
{
  uint64_t v17 = *(unsigned __int8 **)(a2 + 136);
  if (v17)
  {
    uint64_t v58 = a5;
    int v59 = a6;
    unsigned int v18 = *(_DWORD *)(a2 + 144);
  }
  else
  {
    unint64_t v19 = (unsigned __int8 *)malloc_type_malloc(0x400uLL, 0xD576EDBAuLL);
    *(void *)(a2 + 136) = v19;
    if (!v19)
    {
      uint64_t v49 = *(void *)(a1 + 32);
      *(void *)uint64_t v49 = 0xDC00000078;
      __int16 v50 = 742;
      goto LABEL_65;
    }
    uint64_t v17 = v19;
    uint64_t v58 = a5;
    int v59 = a6;
    unsigned int v18 = 0;
    *(_DWORD *)(a2 + 144) = 0;
  }
  unsigned int v61 = v18;
  unsigned int v20 = *a4;
  unsigned int v21 = v18 + 1024;
  if (v18 > a8 || v21 <= a8)
  {
    uint64_t result = loadCache(a1, v17, (int *)&v61, a8, 1024, v20);
    if (result) {
      return result;
    }
    unsigned int v18 = v61;
    unsigned int v21 = v61 + 1024;
  }
  if (a9) {
    int v24 = 3;
  }
  else {
    int v24 = 2;
  }
  if (a9) {
    int v25 = 4;
  }
  else {
    int v25 = 3;
  }
  int v26 = v17[a8 - v18];
  int v27 = a8 + 1;
  unsigned int v28 = v27 + v26 * v25;
  if (v18 > v28 || v28 >= v21)
  {
    uint64_t result = loadCache(a1, v17, (int *)&v61, v27, 1024, v20);
    if (result) {
      return result;
    }
    unsigned int v18 = v61;
  }
  LODWORD(v30) = v27 - v18;
  if (v26)
  {
    int v31 = 0;
    int v32 = v26;
    do
    {
      --v32;
      v31 += v24 + (v17[(unsigned __int16)v30 + (unint64_t)v31] >> 7);
    }
    while ((_BYTE)v32);
    v27 += v31;
    while (1)
    {
      int v33 = (char)v17[(unsigned __int16)v30];
      if (v33 < 0)
      {
        int v34 = v17[(unsigned __int16)v30 + 1];
        unsigned int v35 = 2;
      }
      else
      {
        int v34 = 0;
        unsigned int v35 = 1;
      }
      unsigned int v36 = v17[(unsigned __int16)v30];
      int v37 = v33 & 0x7F;
      if (v37 == 127)
      {
        if ((v36 & 0x80) == 0 || v34) {
          goto LABEL_47;
        }
      }
      else
      {
        BOOL v39 = (v36 & 0x80u) == 0 || v34 != 0;
        if (v37 == *(unsigned __int8 *)(a3 + 5) && v39)
        {
LABEL_47:
          if (a9) {
            goto LABEL_48;
          }
LABEL_50:
          uint64_t v30 = (unsigned __int16)v30;
          unsigned __int16 v41 = v17[v35 + (unint64_t)(unsigned __int16)v30];
          goto LABEL_51;
        }
      }
      if (a9) {
        int v40 = v17[v35 + 1 + (unint64_t)(unsigned __int16)v30] | (v17[v35
      }
                                                                          + (unint64_t)(unsigned __int16)v30] << 8);
      else {
        int v40 = v17[(unsigned __int16)v30 + (unint64_t)v35];
      }
      --v26;
      v27 += v40;
      LODWORD(v30) = v30 + v24 + (v36 >> 7);
      if (!(_BYTE)v26) {
        goto LABEL_47;
      }
    }
  }
  unsigned int v35 = 0;
  if (!a9) {
    goto LABEL_50;
  }
LABEL_48:
  uint64_t v30 = (unsigned __int16)v30;
  unsigned __int16 v41 = _byteswap_ushort(*(_WORD *)&v17[v35 + (unint64_t)(unsigned __int16)v30]);
LABEL_51:
  __int16 v60 = v41;
  if (v17[v30] == 127) {
    int v42 = (unsigned __int8 *)(a2 + 20);
  }
  else {
    int v42 = (unsigned __int8 *)(a3 + 5);
  }
  signed int v43 = *v42;
  *a7 = v41 + 1;
  uint64_t v44 = (char *)malloc_type_calloc((unsigned __int16)(v41 + 1), 1uLL, 0x100004077774924uLL);
  uint64_t v62 = v44;
  if (!v44)
  {
    uint64_t v49 = *(void *)(a1 + 32);
    *(void *)uint64_t v49 = 0xDC00000078;
    __int16 v50 = 743;
LABEL_65:
    *(_WORD *)(v49 + 8) = v50;
    return 220;
  }
  uint64_t v45 = v44;
  __int16 v46 = v61;
  unsigned int v47 = v27 + v41;
  if (v61 <= v47 && v47 < v61 + 1024)
  {
LABEL_68:
    memcpy(v45, &v17[(unsigned __int16)(v27 - v46)], v41);
    goto LABEL_69;
  }
  if (!a9)
  {
    uint64_t result = loadCache(a1, v17, (int *)&v61, v27, 1024, v20);
    if (result) {
      return result;
    }
    __int16 v46 = v61;
    goto LABEL_68;
  }
  uint64_t result = loadCache(a1, v44, 0, v27, v41, v20);
  if (result) {
    return result;
  }
LABEL_69:
  SLcrypt(v45, v41, (uint64_t)&ruleKey, 7);
  uint64_t v51 = SLLngToA(v43);
  if (v43 <= 7)
  {
    unsigned int v52 = v58;
    if (v43 != 5)
    {
      if (v43 == 6 && *(_WORD *)(a2 + 16) == 64) {
        OneToMultiChrCnv((const char **)&v62, (unsigned __int16 *)&v60, 223, a1);
      }
      goto LABEL_84;
    }
    __int16 v53 = *(_WORD *)(a2 + 18);
    if ((v53 & 0x10) != 0)
    {
      OneToMultiChrCnv((const char **)&v62, (unsigned __int16 *)&v60, 247, a1);
      OneToMultiChrCnv((const char **)&v62, (unsigned __int16 *)&v60, 230, a1);
      __int16 v53 = *(_WORD *)(a2 + 18);
    }
    if ((v53 & 0x40) == 0) {
      goto LABEL_84;
    }
    unsigned int v54 = v62;
    int v55 = v60;
    int v56 = 5;
    goto LABEL_83;
  }
  unsigned int v52 = v58;
  if (v43 != 8)
  {
    if (v43 == 16) {
      ConvertString(v45, a2);
    }
    goto LABEL_84;
  }
  if ((*(_WORD *)(a2 + 18) & 0x40) != 0)
  {
    int v55 = (__int16)v41;
    unsigned int v54 = v45;
    int v56 = 8;
LABEL_83:
    ToUpUnaccentedCnv(v54, v55, v56, v51);
  }
LABEL_84:
  __int16 v57 = v62;
  if (*(unsigned char *)(a1 + 28))
  {
    SLchcnv(v62, v60, (unsigned __int8 *)v62, 0, v43);
    __int16 v57 = v62;
  }
  uint64_t result = 0;
  *(_DWORD *)(a2 + 144) = v61;
  *unsigned int v52 = v57;
  *int v59 = v43;
  return result;
}

uint64_t newListNode(uint64_t a1, uint64_t a2)
{
  uint64_t result = (uint64_t)malloc_type_calloc(1uLL, 0x18uLL, 0x1030040DD0DA86DuLL);
  if (result)
  {
    if (*(void *)(a1 + 8))
    {
      *(void *)(*(void *)a2 + 16) = result;
      char v5 = *(unsigned char *)(a1 + 16) + 1;
    }
    else
    {
      *(void *)(a1 + 8) = result;
      char v5 = 1;
    }
    *(unsigned char *)(a1 + 16) = v5;
    *(void *)a2 = result;
    return 1;
  }
  return result;
}

uint64_t getOneStatus(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v5 = a5;
  if (a4) {
    int v5 = a5
  }
       + a4
       + (*(unsigned __int8 *)(a3 + (2 * a4 - 1)) | (*(unsigned __int8 *)(a3 + (2 * a4 - 2)) << 8));
  if (a1)
  {
    if (getMapVal(a1, v5, 1)) {
      char v7 = 2;
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }
  if (getMapVal(a2, v5, 1)) {
    char v8 = 8;
  }
  else {
    char v8 = 4;
  }
  return (v8 | v7);
}

uint64_t loadCache(uint64_t a1, void *a2, int *a3, int a4, int a5, unsigned int a6)
{
  unsigned int v15 = 0;
  if (SLSeek(a6, a4, 0))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = 0xDC0000006FLL;
LABEL_5:
    *(void *)uint64_t v12 = v13;
    *(_WORD *)(v12 + 8) = 743;
    return 220;
  }
  if (SLFRead(a6, a5, a2, &v15))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = 0xDC00000070;
    goto LABEL_5;
  }
  uint64_t result = 0;
  if (a3) {
    *a3 = a4;
  }
  return result;
}

uint64_t PRSfxGet(const char *a1, int a2, unsigned char *a3, unsigned char *a4, _WORD *a5, uint64_t a6)
{
  *a3 = 0;
  *a4 = 0;
  char v7 = *(unsigned __int16 **)(a6 + 56);
  if (v7)
  {
    uint64_t v12 = *((void *)v7 + 1);
    signed int v13 = *v7;
    int v14 = *((_DWORD *)v7 + 1);
    unsigned int v15 = v7[1];
    __int16 v16 = strlen(a1);
    if (a2)
    {
      if (a2 != 1) {
        return 8;
      }
      int v17 = 0;
      int v18 = 0;
      __int16 v19 = v16;
      if (v16 <= 1) {
        __int16 v19 = 1;
      }
      unsigned __int16 v20 = v19 - 1;
      __int16 v21 = -1;
    }
    else
    {
      unsigned __int16 v20 = 0;
      __int16 v23 = v16;
      if (v16 <= 1) {
        __int16 v23 = 1;
      }
      int v17 = (unsigned __int16)(v23 - 1);
      int v18 = 128;
      __int16 v21 = 1;
    }
    if (v17 == v20)
    {
      __int16 v22 = 0;
    }
    else
    {
      __int16 v22 = 0;
      int v25 = 0;
      unsigned __int16 v26 = 0;
      char v27 = 1;
      do
      {
        unsigned __int16 v28 = 0;
        unsigned __int16 v26 = ((v26 & 0x7F) << 8) + 19 * (v26 >> 7) + a1[(__int16)v20];
        if (v26 > 0x7FECu) {
          v26 -= 32749;
        }
        v25 ^= v26 & 0x7FFF;
        signed int v29 = (unsigned __int16)v25 % v13;
        int v30 = v13 + (v14 >> 1) + (unsigned __int16)(v14 & v26);
        while (1)
        {
          uint64_t v31 = 3 * v29;
          int v32 = *(unsigned __int8 *)(v12 + (int)v31 + 1) | (*(unsigned __int8 *)(v12 + v31) << 8);
          if (v32 == v26)
          {
            char v33 = *(unsigned char *)((int)v31 + v12 + 2);
            if (v18 == (v33 & 0x80)) {
              break;
            }
          }
          v29 += v30;
          do
            v29 -= v13;
          while (v29 >= v13);
          if (v15 >= v28)
          {
            ++v28;
            v30 += 2 * (unsigned __int16)(v14 & v26);
            if (v32) {
              continue;
            }
          }
          goto LABEL_26;
        }
        a3[v22] = v27;
        a4[v22++] = v33 | 4;
LABEL_26:
        v20 += v21;
        if (v17 == (__int16)v20) {
          break;
        }
        ++v27;
      }
      while (v22 < 6);
    }
    a3[v22] = 0;
  }
  else
  {
    __int16 v22 = 0;
  }
  uint64_t result = 0;
  *a5 = v22;
  return result;
}

uint64_t PRspace(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2)
  {
    uint64_t v21 = MEMORY[0x20];
    *MEMORY[0x20] = 0xE6FFFFFF93;
    uint64_t v8 = 230;
LABEL_40:
    *(_WORD *)(v21 + 8) = 680;
    return v8;
  }
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 2);
  if (*(unsigned char *)(a3 + 27))
  {
    if (v5) {
      goto LABEL_4;
    }
    goto LABEL_39;
  }
  *(unsigned char *)(a3 + 27) = 1;
  if (!v5)
  {
LABEL_39:
    uint64_t v21 = *(void *)(a2 + 32);
    *(void *)uint64_t v21 = 0xDCFFFFFF89;
    uint64_t v8 = 220;
    goto LABEL_40;
  }
LABEL_4:
  uint64_t v7 = *(void *)(v5 + 64);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)(v5 + 64);
  do
  {
    if (v9 == v7)
    {
      int v14 = *(unsigned char **)(v5 + 24);
      if (v14)
      {
        int v15 = strlen(*(const char **)(v5 + 24));
        unsigned __int16 v16 = v15;
        BOOL v17 = v6 && (unsigned __int16)v15 >= v6;
        BOOL v18 = !v17;
        if ((unsigned __int16)v15 != *(unsigned __int8 *)(a3 + 27) && v18)
        {
          if ((_WORD)v15)
          {
            int v20 = v15;
            while (*v14 == 32)
            {
              ++v14;
              if (!(_WORD)--v20) {
                goto LABEL_35;
              }
            }
          }
          else
          {
LABEL_35:
            if (!PRliveRule(a2, a3, 0, 0x34u, 82, 0, 1)) {
              uint64_t v8 = Makerr(a2, a3, v7, 82, *(_WORD *)(v7 + 8) - v16, v16, a3 + 22);
            }
          }
        }
      }
    }
    if (v9 != *(void *)(v5 + 80))
    {
      unsigned int v10 = *(unsigned __int16 *)(v9 + 48);
      if ((v10 & 0xFFFE) == 2)
      {
        uint64_t v11 = *(unsigned char **)(v9 + 40);
        int v12 = *(unsigned __int16 *)(v9 + 48);
        while (*v11 == 32)
        {
          ++v11;
          if (!(_WORD)--v12)
          {
            int v13 = *(unsigned __int8 *)(*(void *)(v9 + 24) + (unsigned __int16)(strlen(*(const char **)(v9 + 24)) - 1));
            if (v13 != 33
              && v13 != 63
              && (v13 != 46 || (*(_DWORD *)(v9 + 4) & 0x10000001) != 0)
              && !PRliveRule(a2, a3, 0, 0x34u, 81, 0, 1))
            {
              uint64_t v8 = Makerr(a2, a3, v9, 81, *(_WORD *)(v9 + 32) + *(_WORD *)(v9 + 8), v10, a3 + 22);
            }
            break;
          }
        }
      }
    }
    uint64_t v9 = *(void *)(v9 + 80);
  }
  while (v9);
  return v8;
}

uint64_t Makerr(uint64_t a1, uint64_t a2, uint64_t a3, int a4, __int16 a5, unsigned int a6, uint64_t a7)
{
  *(void *)__int16 v22 = 0;
  uint64_t v13 = PRmkErr(a1, a2, v22, a3, 0, 0x34u, a4);
  if (!v13)
  {
    int v14 = *(_WORD **)v22;
    **(_WORD **)__int16 v22 = a5;
    v14[1] = a6;
    if (a4 == 81)
    {
      uint64_t v13 = 0;
      v14[4] = a5;
      __int16 v15 = a6 - 1;
LABEL_12:
      v14[5] = v15;
      return v13;
    }
    uint64_t v16 = *(unsigned __int8 *)(a7 + 5);
    if (*(unsigned char *)(a2 + 20) != 16 && a6 > v16)
    {
      uint64_t v13 = 0;
      v14[4] = a5;
      __int16 v15 = a6 - v16;
      goto LABEL_12;
    }
    BOOL v18 = (char *)malloc_type_calloc(v16 + 1, 1uLL, 0x100004077774924uLL);
    if (v18)
    {
      __int16 v19 = v18;
      memset(v18, 32, *(unsigned __int8 *)(a7 + 5));
      v19[*(unsigned __int8 *)(a7 + 5)] = 0;
      uint64_t v13 = PRaddAlts(a1, *(uint64_t *)v22, v19, 0, 1uLL, 0);
      free(v19);
    }
    else
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(void *)uint64_t v20 = 0xDC00000078;
      *(_WORD *)(v20 + 8) = 680;
      return 220;
    }
  }
  return v13;
}

uint64_t PRss(unsigned char *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, char a7)
{
  uint64_t v263 = *MEMORY[0x263EF8340];
  memset(v256, 0, sizeof(v256));
  long long v254 = 0u;
  *(_OWORD *)v255 = 0u;
  long long v253 = 0u;
  uint64_t v8 = *(void *)(a3 + 16);
  if (!v8)
  {
    uint64_t v9 = *(void *)(a3 + 32);
    uint64_t v10 = 0xDCFFFFFC14;
    goto LABEL_5;
  }
  if (*(void *)(v8 + 56))
  {
    uint64_t v9 = *(void *)(a3 + 32);
    uint64_t v10 = 0xDCFFFFFC13;
LABEL_5:
    *(void *)uint64_t v9 = v10;
    uint64_t result = 220;
LABEL_6:
    *(_WORD *)(v9 + 8) = 1000;
    return result;
  }
  if (!*a1)
  {
    uint64_t v9 = *(void *)(a3 + 32);
    *(void *)uint64_t v9 = 0xE6FFFFFF9BLL;
    uint64_t result = 230;
    goto LABEL_6;
  }
  if (!a6)
  {
    *(unsigned char *)(v8 + 3) = *(unsigned char *)(v8 + 2);
    *(unsigned char *)(v8 + 5) = *(unsigned char *)(v8 + 4);
    *(unsigned char *)(v8 + 7) = *(unsigned char *)(v8 + 6);
    *(unsigned char *)(v8 + 9) = *(unsigned char *)(v8 + 8);
    *(unsigned char *)(v8 + 11) = *(unsigned char *)(v8 + 10);
  }
  *(void *)&long long v254 = 0;
  v255[0] = 0;
  WORD4(v254) = 0;
  uint64_t result = PRgrowWkBuf((void **)&v254, v255, (_WORD *)&v254 + 4, a3, a4);
  if (result) {
    return result;
  }
  v255[1] = 0;
  LOWORD(v256[0]) = 0;
  uint64_t result = PRgrowRaw(a3, (uint64_t)&v253);
  if (result) {
    return result;
  }
  DWORD2(v256[0]) = 0;
  WORD1(v256[0]) = 0;
  WORD5(v254) = 0;
  *(void *)&long long v253 = a1;
  WORD4(v253) = a2;
  *((void *)&v256[1] + 1) = a5;
  *(_DWORD *)((char *)v256 + 13) = *(unsigned __int8 *)(v8 + 7);
  BYTE12(v256[0]) = *(unsigned char *)(v8 + 11);
  BYTE4(v256[0]) = a7;
  unsigned __int8 v259 = 0;
  int v258 = 0;
  memset(v257, 0, sizeof(v257));
  uint64_t v17 = SLLngToC(1, *(unsigned __int8 *)(a4 + 20));
  BOOL v18 = 0;
  unsigned __int16 v217 = 0;
  uint64_t v218 = 0;
  int v246 = 0;
  int v210 = 0;
  uint64_t v19 = 0;
  uint64_t v229 = 0;
  int v209 = 0;
  unsigned int v213 = 0;
  uint64_t v219 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  BYTE2(v257[0]) = 0;
  LOWORD(v257[0]) = 256;
  LOWORD(v258) = 0;
  BYTE11(v256[0]) = 0;
  uint64_t v29 = a3;
  uint64_t v252 = a3;
  uint64_t v224 = v17;
  while (2)
  {
    if ((unsigned __int16)v26 > 0xCu)
    {
      uint64_t v31 = v28;
      uint64_t v30 = v27;
      if (!v20) {
        goto LABEL_130;
      }
LABEL_19:
      int v32 = 0;
      goto LABEL_133;
    }
    if (!v20 && (_WORD)v26)
    {
      uint64_t v22 = 0;
      uint64_t v23 = v21;
      uint64_t v30 = v27;
      uint64_t v31 = v28;
      goto LABEL_131;
    }
    uint64_t v236 = v26;
    unsigned int v247 = v27;
    unsigned int v241 = v21;
    char v33 = 0;
    int v34 = *(unsigned __int8 *)(v29 + 28);
    uint64_t v35 = *(void *)(a4 + 64);
    uint64_t v36 = v253;
    do
    {
      if (*(unsigned char *)(v29 + 28) && *(char *)(v253 + (unsigned __int16)a2) < 0) {
        int v37 = (unsigned __int8 *)(*(unsigned __int8 *)(v253 + (unsigned __int16)a2) + v17 - 128);
      }
      else {
        int v37 = (unsigned __int8 *)(v253 + (unsigned __int16)a2);
      }
      uint64_t v38 = *v37;
      uint64_t v21 = *(unsigned int *)(v35 + 4 * v38 + 16);
      if ((v21 & 0x800) != 0)
      {
        if (v38 == *(unsigned __int8 *)(a4 + 23))
        {
          char v33 = 1;
        }
        else if (v38 == *(unsigned __int8 *)(a4 + 24))
        {
          char v33 = 0;
        }
      }
      else if (!v33)
      {
        break;
      }
      ++a2;
    }
    while (v38);
    uint64_t v249 = v28;
    unsigned int v244 = v19;
    if ((v21 & 0x1000) == 0) {
      goto LABEL_34;
    }
    int v43 = a2 + 1;
    uint64_t v31 = (v28 + 1);
    if ((int)v38 > 59)
    {
      if (v38 != 62 && v38 != 60) {
        goto LABEL_34;
      }
    }
    else if (v38 != 45)
    {
      if (v38 != 46) {
        goto LABEL_34;
      }
      unsigned int v225 = v20;
      v211 = v18;
      uint64_t v44 = 0;
      LODWORD(v20) = 1;
      LODWORD(v45) = v28 + 1;
      int v214 = a2 + 1;
      uint64_t v30 = 1;
      int v46 = 1;
      while (1)
      {
        unsigned __int8 v47 = 0;
        do
        {
          if (v34 && *(char *)(v36 + (unsigned __int16)v43) < 0) {
            uint64_t v48 = (unsigned __int8 *)(*(unsigned __int8 *)(v36 + (unsigned __int16)v43) + v17 - 128);
          }
          else {
            uint64_t v48 = (unsigned __int8 *)(v36 + (unsigned __int16)v43);
          }
          unsigned int v49 = *v48;
          if ((*(_DWORD *)(v35 + 4 * v49 + 16) & 0x800) != 0)
          {
            if (v49 == *(unsigned __int8 *)(a4 + 23))
            {
              unsigned __int8 v47 = 1;
            }
            else if (v49 == *(unsigned __int8 *)(a4 + 24))
            {
              unsigned __int8 v47 = 0;
            }
          }
          int v50 = *(_DWORD *)(v35 + 4 * v49 + 16) & 0x800 | v47;
          BOOL v52 = v50 == 0;
          BOOL v51 = v50 != 0;
          if (v52) {
            int v43 = (unsigned __int16)v43;
          }
          else {
            int v43 = (unsigned __int16)v43 + 1;
          }
        }
        while (v49 && v51);
        if (v44 && v49 != 32)
        {
          int v43 = v214;
          BOOL v18 = v211;
          uint64_t v20 = v225;
          goto LABEL_375;
        }
        BOOL v52 = (unsigned __int16)v20 != 1 && v44 == 0;
        int v53 = !v52;
        if (v49 == 32 && v53 != 0)
        {
          unsigned int v55 = (unsigned __int16)v45;
          if ((unsigned __int16)v45 >= WORD4(v254))
          {
            int v230 = v46;
            int v56 = v45;
            int v57 = PRgrowWkBuf((void **)&v254, v255, (_WORD *)&v254 + 4, v29, a4);
            int v46 = v230;
            LODWORD(v45) = v56;
            uint64_t v17 = v224;
            uint64_t v29 = v252;
            if (v57) {
              return 220;
            }
          }
          if ((v55 & 0xF) == 0 && *(unsigned char *)(*(void *)(a4 + 64) + 1040)) {
            *((_WORD *)v255[0] + (v55 >> 4)) = v43;
          }
          unsigned __int8 v58 = 0;
          *(unsigned char *)(v254 + (unsigned __int16)v45) = 32;
          LOWORD(v43) = v43 + 1;
          do
          {
            if (*(unsigned char *)(v29 + 28) && *(char *)(v253 + (unsigned __int16)v43) < 0) {
              int v59 = (unsigned __int8 *)(*(unsigned __int8 *)(v253 + (unsigned __int16)v43) + v17 - 128);
            }
            else {
              int v59 = (unsigned __int8 *)(v253 + (unsigned __int16)v43);
            }
            unsigned int v49 = *v59;
            if ((*(_DWORD *)(*(void *)(a4 + 64) + 4 * v49 + 16) & 0x800) != 0)
            {
              if (v49 == *(unsigned __int8 *)(a4 + 23))
              {
                unsigned __int8 v58 = 1;
              }
              else if (v49 == *(unsigned __int8 *)(a4 + 24))
              {
                unsigned __int8 v58 = 0;
              }
            }
            int v60 = *(_DWORD *)(*(void *)(a4 + 64) + 4 * v49 + 16) & 0x800 | v58;
            BOOL v52 = v60 == 0;
            BOOL v61 = v60 != 0;
            if (v52) {
              int v43 = (unsigned __int16)v43;
            }
            else {
              int v43 = (unsigned __int16)v43 + 1;
            }
          }
          while (v49 && v61);
          LODWORD(v20) = v20 + 1;
          LODWORD(v45) = v45 + 1;
          uint64_t v44 = 1;
        }
        if (v49 != 46) {
          break;
        }
        unsigned int v62 = (unsigned __int16)v45;
        if ((unsigned __int16)v45 >= WORD4(v254))
        {
          unsigned int v220 = v30;
          int v231 = v46;
          uint64_t v63 = v44;
          int v64 = v45;
          int v65 = PRgrowWkBuf((void **)&v254, v255, (_WORD *)&v254 + 4, v29, a4);
          uint64_t v44 = v63;
          int v46 = v231;
          uint64_t v30 = v220;
          LODWORD(v45) = v64;
          uint64_t v17 = v224;
          uint64_t v29 = v252;
          if (v65) {
            return 220;
          }
        }
        if ((v62 & 0xF) == 0 && *(unsigned char *)(*(void *)(a4 + 64) + 1040)) {
          *((_WORD *)v255[0] + (v62 >> 4)) = v43;
        }
        *(unsigned char *)(v254 + (unsigned __int16)v45) = 46;
        uint64_t v20 = (v20 + 1);
        ++v43;
        uint64_t v45 = (v45 + 1);
        if ((unsigned __int16)v46 == 3)
        {
          LOWORD(v28) = v249;
        }
        else
        {
          LOWORD(v28) = v249;
          if ((unsigned __int16)v46 != 1 || *(unsigned char *)(a4 + 20) == 10 && !v44)
          {
            int v214 = v43;
            uint64_t v31 = v45;
            uint64_t v30 = v20;
          }
        }
        ++v46;
        int v34 = *(unsigned __int8 *)(v29 + 28);
        uint64_t v35 = *(void *)(a4 + 64);
        uint64_t v36 = v253;
      }
      int v43 = v214;
      BOOL v18 = v211;
      uint64_t v20 = v225;
      goto LABEL_374;
    }
    unsigned int v226 = v20;
    int v75 = v18;
    uint64_t v30 = 1;
    while (1)
    {
      unsigned __int8 v76 = 0;
      LOWORD(v77) = v43;
      do
      {
        if (v34 && *(char *)(v36 + (unsigned __int16)v77) < 0) {
          uint64_t v78 = (unsigned __int8 *)(*(unsigned __int8 *)(v36 + (unsigned __int16)v77) + v17 - 128);
        }
        else {
          uint64_t v78 = (unsigned __int8 *)(v36 + (unsigned __int16)v77);
        }
        unsigned int v79 = *v78;
        if ((*(_DWORD *)(v35 + 4 * v79 + 16) & 0x800) != 0)
        {
          if (v79 == *(unsigned __int8 *)(a4 + 23))
          {
            unsigned __int8 v76 = 1;
          }
          else if (v79 == *(unsigned __int8 *)(a4 + 24))
          {
            unsigned __int8 v76 = 0;
          }
        }
        int v80 = *(_DWORD *)(v35 + 4 * v79 + 16) & 0x800 | v76;
        BOOL v52 = v80 == 0;
        BOOL v81 = v80 != 0;
        if (v52) {
          int v77 = (unsigned __int16)v77;
        }
        else {
          int v77 = (unsigned __int16)v77 + 1;
        }
      }
      while (v79 && v81);
      if (v79 != v38) {
        break;
      }
      if ((unsigned __int16)v31 >= WORD4(v254))
      {
        int v82 = PRgrowWkBuf((void **)&v254, v255, (_WORD *)&v254 + 4, v29, a4);
        uint64_t v29 = v252;
        if (v82) {
          return 220;
        }
      }
      if ((v31 & 0xF) == 0 && *(unsigned char *)(*(void *)(a4 + 64) + 1040)) {
        *((_WORD *)v255[0] + ((unsigned __int16)v31 >> 4)) = v77;
      }
      *(unsigned char *)(v254 + (unsigned __int16)v31) = v38;
      uint64_t v30 = (v30 + 1);
      int v43 = v77 + 1;
      uint64_t v31 = (v31 + 1);
      int v34 = *(unsigned __int8 *)(v29 + 28);
      uint64_t v35 = *(void *)(a4 + 64);
      uint64_t v36 = v253;
    }
    BOOL v18 = v75;
    uint64_t v20 = v226;
    if (v38 == 45)
    {
      LOWORD(v28) = v249;
      if (*(unsigned char *)(a4 + 20) == 6 && (unsigned __int16)v30 == 2) {
        goto LABEL_34;
      }
      goto LABEL_375;
    }
LABEL_374:
    LOWORD(v28) = v249;
LABEL_375:
    if ((unsigned __int16)v30 >= 2u)
    {
      BOOL v39 = v18;
      if (WORD4(v254) <= (unsigned __int16)v28)
      {
        int v175 = PRgrowWkBuf((void **)&v254, v255, (_WORD *)&v254 + 4, v29, a4);
        uint64_t v29 = v252;
        if (v175) {
          return 220;
        }
      }
      uint64_t v41 = v249;
      uint64_t v42 = v247;
      if ((v249 & 0xF) == 0 && *(unsigned char *)(*(void *)(a4 + 64) + 1040)) {
        *((_WORD *)v255[0] + ((unsigned __int16)v249 >> 4)) = a2;
      }
      *(unsigned char *)(v254 + (unsigned __int16)v249) = v38;
      goto LABEL_40;
    }
LABEL_34:
    BOOL v39 = v18;
    if (WORD4(v254) <= (unsigned __int16)v28)
    {
      int v40 = PRgrowWkBuf((void **)&v254, v255, (_WORD *)&v254 + 4, v29, a4);
      uint64_t v29 = v252;
      if (v40) {
        return 220;
      }
    }
    uint64_t v41 = v249;
    uint64_t v42 = v247;
    if ((v249 & 0xF) == 0 && *(unsigned char *)(*(void *)(a4 + 64) + 1040)) {
      *((_WORD *)v255[0] + ((unsigned __int16)v249 >> 4)) = a2;
    }
    *(unsigned char *)(v254 + (unsigned __int16)v249) = v38;
    uint64_t v31 = (v249 + 1);
    int v43 = a2 + 1;
    uint64_t v30 = 1;
LABEL_40:
    BOOL v18 = v39;
    uint64_t v19 = v244;
    if ((v21 & 0x400) == 0)
    {
      a2 = v43;
      uint64_t v25 = v41;
      uint64_t v24 = v42;
      goto LABEL_129;
    }
    char v66 = 0;
    do
    {
      while (1)
      {
        a2 = v43;
        if (*(unsigned char *)(v29 + 28) && *(char *)(v253 + (unsigned __int16)v43) < 0) {
          int v67 = (unsigned __int8 *)(*(unsigned __int8 *)(v253 + (unsigned __int16)v43) + v17 - 128);
        }
        else {
          int v67 = (unsigned __int8 *)(v253 + (unsigned __int16)v43);
        }
        unsigned int v68 = *v67;
        int v69 = *(_DWORD *)(*(void *)(a4 + 64) + 4 * v68 + 16);
        if ((v69 & 0x800) != 0) {
          break;
        }
        if (v66) {
          goto LABEL_126;
        }
        char v66 = 0;
        uint64_t v70 = v69 & 0x2000000;
        ++v43;
        if (v68) {
          BOOL v71 = v70 == 0;
        }
        else {
          BOOL v71 = 1;
        }
        if (v71) {
          goto LABEL_128;
        }
      }
      if (v68 == *(unsigned __int8 *)(a4 + 23))
      {
        char v66 = 1;
      }
      else if (v68 == *(unsigned __int8 *)(a4 + 24))
      {
        char v66 = 0;
      }
LABEL_126:
      ++v43;
    }
    while (v68);
    ++a2;
LABEL_128:
    uint64_t v25 = v41;
    uint64_t v24 = v247;
LABEL_129:
    uint64_t v23 = v241;
    uint64_t v22 = v20;
    uint64_t v20 = v38;
    uint64_t v26 = v236;
    if (v38) {
      goto LABEL_19;
    }
LABEL_130:
    uint64_t v27 = v24;
    uint64_t v28 = v25;
LABEL_131:
    if (!BYTE4(v256[0])) {
      goto LABEL_502;
    }
    uint64_t v20 = 0;
    int v32 = 1;
    BYTE11(v256[0]) = 1;
    uint64_t v24 = v27;
    uint64_t v25 = v28;
LABEL_133:
    uint64_t v27 = v30;
    uint64_t v28 = v31;
    int v72 = 0x10000;
    uint64_t v73 = v19;
    switch((__int16)v26)
    {
      case 0:
        if ((v21 & 0x2000000) == 0) {
          goto LABEL_168;
        }
        WORD3(v256[0]) = v31 - 1;
        goto LABEL_237;
      case 1:
        if ((v21 & 0x2000000) == 0)
        {
          WORD4(v256[0]) = v31 + ~WORD3(v256[0]);
LABEL_168:
          uint64_t v26 = 23;
          goto LABEL_322;
        }
        if (!v32)
        {
LABEL_237:
          uint64_t v26 = 1;
LABEL_322:
          uint64_t v73 = v19;
          goto LABEL_323;
        }
        WORD4(v256[0]) = v31 + ~WORD3(v256[0]);
LABEL_506:
        uint64_t v207 = v29;
        uint64_t result = PRnormalize(v29, a4, (uint64_t)&v253);
        if (!result)
        {
          uint64_t result = PRssPost(v207, a4, (uint64_t)&v253);
          if (!result)
          {
            PRssTidyUp((uint64_t)&v253);
            return 0;
          }
        }
        return result;
      case 2:
        uint64_t v83 = *((unsigned __int16 *)v18 + 9);
        if (v83 > 7)
        {
          *((_DWORD *)v18 + 5) = 0x10000000;
          v84 = v18 + 2;
        }
        else
        {
          *((_WORD *)v18 + 9) = v83 + 1;
          v84 = &v18[2 * v83 + 2];
        }
        *(_WORD *)v84 += v24;
        if ((v21 & 4) != 0) {
          goto LABEL_288;
        }
        if ((v21 & 0x1000000) != 0)
        {
          unsigned int v148 = *((_DWORD *)v18 + 5) & 0xBFFFFFFF;
          goto LABEL_344;
        }
        if ((v21 & 0x2000000) != 0) {
          goto LABEL_309;
        }
        if ((v21 & 0x40000000) != 0) {
          *((_DWORD *)v18 + 5) |= 0x8000u;
        }
        if ((v23 & 0x8000) != 0)
        {
          unsigned int v138 = *((_DWORD *)v18 + 5) | 0x8000000;
        }
        else
        {
          if ((v23 & 1) == 0) {
            goto LABEL_399;
          }
          unsigned int v138 = *((_DWORD *)v18 + 5) | 0x4000000;
        }
        goto LABEL_398;
      case 3:
        uint64_t v85 = *((unsigned __int16 *)v18 + 9);
        if (v85 > 7)
        {
          *((_DWORD *)v18 + 5) = 0x10000000;
          int v86 = v18 + 2;
        }
        else
        {
          *((_WORD *)v18 + 9) = v85 + 1;
          int v86 = &v18[2 * v85 + 2];
        }
        *(_WORD *)v86 += v24;
        if ((v23 & 0x800000) != 0)
        {
          *((_DWORD *)v18 + 5) |= 0x4000u;
          BYTE4(v257[1]) = v22;
          WORD3(v257[1]) = v25 - v24;
          WORD4(v257[1]) = v24;
          HIDWORD(v257[1]) = v23;
        }
        if ((v21 & 0x1000000) != 0)
        {
          int v147 = *((_DWORD *)v18 + 5);
          *((_DWORD *)v18 + 5) = v147 & 0xBFFFFFFF;
          if ((v21 & 2) == 0)
          {
            unsigned int v148 = v147 & 0xBFFFBFFF;
LABEL_344:
            *((_DWORD *)v18 + 5) = v148;
          }
          goto LABEL_346;
        }
        if ((v21 & 0x2000000) != 0)
        {
LABEL_309:
          uint64_t v26 = 12;
          goto LABEL_322;
        }
        if ((v23 & 0x8000) != 0) {
          int v139 = 0x8000000;
        }
        else {
          int v139 = (v23 & 1) << 26;
        }
        unsigned int v138 = *((_DWORD *)v18 + 5) & 0xFFFFBFFF | v139;
LABEL_398:
        *((_DWORD *)v18 + 5) = v138;
        goto LABEL_399;
      case 4:
        if (v219) {
          goto LABEL_176;
        }
        uint64_t v73 = HIDWORD(v219);
        if (HIDWORD(v219))
        {
          uint64_t v19 = 0;
          int v246 = 0;
          *((_DWORD *)v18 + 7) = v23;
          WORD2(v218) = 1;
LABEL_176:
          int v87 = v21;
          if ((v21 & 0x10000000) != 0)
          {
            ++WORD2(v218);
            if (HIDWORD(v219))
            {
              *((_DWORD *)v18 + 7) |= v21;
              uint64_t v219 = 0x100000001;
              goto LABEL_399;
            }
            int v176 = *((_DWORD *)v18 + 6);
            uint64_t v73 = v19;
            goto LABEL_396;
          }
          unsigned int v88 = *((unsigned __int16 *)v18 + 9);
          uint64_t v73 = v19;
        }
        else
        {
          unsigned int v88 = *((unsigned __int16 *)v18 + 9);
          *((_DWORD *)v18 + 6) = v23;
          int v87 = v21;
          if ((v21 & 0x10000000) != 0)
          {
            WORD2(v218) = 2;
            int v176 = v23;
            int v246 = HIDWORD(v219);
            unsigned __int16 v217 = v88;
LABEL_396:
            *((_DWORD *)v18 + 6) = v176 | v21;
            uint64_t v219 = 1;
            uint64_t v26 = 4;
            goto LABEL_323;
          }
          WORD2(v218) = 1;
          unsigned __int16 v217 = v88;
          int v246 = HIDWORD(v219);
        }
        if (v88 > 7)
        {
          *((_DWORD *)v18 + 5) = 0x10000000;
          v89 = v18 + 2;
        }
        else
        {
          *((_WORD *)v18 + 9) = v88 + 1;
          v89 = &v18[2 * v88 + 2];
        }
        *(_WORD *)v89 += WORD2(v218);
        if ((*(void *)&v87 & 0x800000) != 0) {
          unsigned int v150 = 5;
        }
        else {
          unsigned int v150 = 7;
        }
        if ((v87 & 0x2000000) != 0) {
          uint64_t v151 = 8;
        }
        else {
          uint64_t v151 = v150;
        }
        uint64_t v27 = v30;
        LODWORD(v219) = 0;
        unsigned int v152 = v213;
        if ((v87 & 0x2000000) == 0) {
          unsigned int v152 = v20;
        }
        unsigned int v213 = v152;
        if ((v87 & 0x2000000) != 0) {
          int v153 = v209;
        }
        else {
          int v153 = v31 - v30;
        }
        int v209 = v153;
        uint64_t v26 = v151;
        int v154 = HIDWORD(v229);
        if ((v87 & 0x2000000) == 0) {
          int v154 = v30;
        }
        HIDWORD(v229) = v154;
        BOOL v52 = (v87 & 0x2000000) == 0;
        int v155 = v218;
        if (v52) {
          int v155 = v21;
        }
        LODWORD(v218) = v155;
        goto LABEL_323;
      case 5:
        uint64_t v90 = *((unsigned __int16 *)v18 + 9);
        if (v90 > 7)
        {
          *((_DWORD *)v18 + 5) = 0x10000000;
          int v91 = v18 + 2;
        }
        else
        {
          *((_WORD *)v18 + 9) = v90 + 1;
          int v91 = &v18[2 * v90 + 2];
        }
        *(_WORD *)v91 += v24;
        ++v246;
        if ((v21 & 0x800000) != 0)
        {
          uint64_t v26 = 5;
          goto LABEL_322;
        }
        BYTE4(v257[1]) = v22;
        WORD3(v257[1]) = v25 - v24;
        WORD4(v257[1]) = v24;
        HIDWORD(v257[1]) = v23;
        uint64_t v73 = v23 | v19;
        if ((v21 & 0x2000000) != 0) {
          unsigned int v140 = 9;
        }
        else {
          unsigned int v140 = 25;
        }
        if ((v21 & 0x1000000) != 0) {
          unsigned int v140 = 7;
        }
        BOOL v141 = (v21 & 2) == 0;
        unsigned int v142 = 6;
LABEL_279:
        if (v141) {
          uint64_t v26 = v140;
        }
        else {
          uint64_t v26 = v142;
        }
        goto LABEL_323;
      case 6:
        uint64_t v92 = *((unsigned __int16 *)v18 + 9);
        if (v92 > 7)
        {
          *((_DWORD *)v18 + 5) = 0x10000000;
          uint64_t v93 = v18 + 2;
        }
        else
        {
          *((_WORD *)v18 + 9) = v92 + 1;
          uint64_t v93 = &v18[2 * v92 + 2];
        }
        *(_WORD *)v93 += v24;
        ++v246;
        uint64_t v73 = v23 | v19;
        int v143 = v21;
        if ((v21 & 0x2000000) != 0) {
          unsigned int v140 = 10;
        }
        else {
          unsigned int v140 = 25;
        }
        if ((v21 & 0x1000000) != 0) {
          unsigned int v140 = 7;
        }
        BOOL v144 = (v21 & 2) == 0;
        int v145 = 6;
        goto LABEL_276;
      case 7:
        uint64_t v94 = *((unsigned __int16 *)v18 + 9);
        if (v94 > 7)
        {
          *((_DWORD *)v18 + 5) = 0x10000000;
          int v95 = v18 + 2;
        }
        else
        {
          *((_WORD *)v18 + 9) = v94 + 1;
          int v95 = &v18[2 * v94 + 2];
        }
        *(_WORD *)v95 += v24;
        ++v246;
        uint64_t v73 = v23 | v19;
        int v143 = v21;
        if ((v21 & 0x2000000) != 0) {
          unsigned int v140 = 11;
        }
        else {
          unsigned int v140 = 25;
        }
        BOOL v144 = (v21 & 0x1000000) == 0;
        int v145 = 7;
LABEL_276:
        if (!v144) {
          unsigned int v140 = v145;
        }
        BOOL v141 = (v143 & 0x800000) == 0;
        unsigned int v142 = 5;
        goto LABEL_279;
      case 8:
        goto LABEL_296;
      case 9:
      case 10:
      case 11:
        if (WORD2(v229) != 1) {
          goto LABEL_293;
        }
        if (v218)
        {
          int v74 = 0x800000;
        }
        else if ((v218 & 0x8000) != 0)
        {
          int v74 = 0x1000000;
        }
        else
        {
          if (v213 != 46) {
            goto LABEL_293;
          }
          int v74 = 0x400000;
        }
        *((_DWORD *)v18 + 5) |= v74;
LABEL_293:
        if ((unsigned __int16)(v26 - 9) <= 2u)
        {
          int v72 = *(_DWORD *)&PRnormalize_PairPunTab[4 * (__int16)(v26 - 9) + 8];
LABEL_295:
          *((_DWORD *)v18 + 5) |= v72;
        }
LABEL_296:
        if (v32)
        {
          LOBYTE(v256[1]) = 1;
          LODWORD(v26) = 24;
        }
        if (*(unsigned char *)(a4 + 22))
        {
          if (v22 == *(unsigned __int8 *)(a4 + 22)) {
            LOBYTE(v256[1]) = 1;
          }
          goto LABEL_317;
        }
        if ((int)v22 > 12)
        {
          if (v22 == 13)
          {
            ++HIWORD(v257[0]);
            LODWORD(v257[1]) = 0;
            goto LABEL_313;
          }
          if (v22 == 32) {
            ++LOWORD(v257[1]);
          }
        }
        else
        {
          int v149 = v229;
          if (v22 != 9)
          {
            if (v22 != 10) {
              goto LABEL_314;
            }
            if (!(_BYTE)v229)
            {
              ++HIWORD(v257[0]);
              int v149 = 0;
              LODWORD(v257[1]) = 0;
              goto LABEL_314;
            }
LABEL_313:
            int v149 = 1;
LABEL_314:
            if (v22 != 13) {
              int v149 = 0;
            }
            LODWORD(v229) = v149;
LABEL_317:
            if (v22) {
              ++*((_WORD *)v18 + 18);
            }
            if ((v21 & 0x2000000) != 0) {
              uint64_t v26 = v26;
            }
            else {
              uint64_t v26 = 24;
            }
            goto LABEL_322;
          }
          ++WORD1(v257[1]);
        }
        int v149 = v229;
        goto LABEL_314;
      case 12:
        goto LABEL_295;
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
        goto LABEL_323;
      case 23:
        unsigned int v96 = WORD1(v256[0]);
        if (WORD1(v256[0]) < LOWORD(v256[0])) {
          goto LABEL_189;
        }
        unsigned int v227 = v20;
        unsigned int v242 = v21;
        uint64_t v97 = v24;
        uint64_t v98 = v25;
        uint64_t v99 = v22;
        uint64_t v100 = v23;
        uint64_t v101 = v19;
        uint64_t v102 = v27;
        uint64_t result = PRgrowRaw(v29, (uint64_t)&v253);
        if (result) {
          goto LABEL_501;
        }
        unsigned int v96 = WORD1(v256[0]);
        uint64_t v29 = v252;
        uint64_t v27 = v102;
        uint64_t v28 = v31;
        uint64_t v19 = v101;
        uint64_t v23 = v100;
        uint64_t v22 = v99;
        uint64_t v25 = v98;
        uint64_t v24 = v97;
        uint64_t v21 = v242;
        uint64_t v20 = v227;
LABEL_189:
        v103 = v255[1];
        WORD1(v256[0]) = v96 + 1;
        BOOL v18 = (char *)v255[1] + 40 * v96;
        *(_WORD *)BOOL v18 = v28 - v27;
        WORD1(v257[1]) = 0;
        *(_DWORD *)((char *)v257 + 14) = 0;
        *(_WORD *)((char *)v256 + 15) = 0;
        BYTE4(v257[1]) = 0;
        *(_DWORD *)((char *)&v257[1] + 6) = 0;
        HIDWORD(v257[1]) = 0;
        if ((v21 & 4) != 0)
        {
          HIDWORD(v219) = 0;
          LODWORD(v229) = 0;
          v103[10 * v96 + 5] |= 0xC0000000;
LABEL_288:
          uint64_t v26 = 2;
        }
        else if ((v21 & 0x1000000) != 0)
        {
          HIDWORD(v219) = 0;
          LODWORD(v229) = 0;
          v103[10 * v96 + 5] |= 0x80000000;
LABEL_346:
          uint64_t v26 = 3;
        }
        else
        {
          HIDWORD(v219) = 0;
          LODWORD(v229) = 0;
          if ((v21 & 0x40000000) != 0) {
            v103[10 * v96 + 5] |= 0x8000u;
          }
LABEL_399:
          uint64_t v26 = 4;
        }
        goto LABEL_322;
      case 24:
        unsigned int v248 = v30;
        unsigned int v104 = *((unsigned __int16 *)v18 + 9);
        if (*((_DWORD *)v18 + 6)) {
          unsigned __int16 v105 = v217;
        }
        else {
          unsigned __int16 v105 = *((_WORD *)v18 + 9);
        }
        *((_WORD *)v18 + 16) = v105;
        __int16 v106 = v104 - v246;
        if (v104 < (unsigned __int16)v246) {
          __int16 v106 = 0;
        }
        *((_WORD *)v18 + 17) = v106;
        unsigned int v107 = HIWORD(v257[0]);
        if (!HIWORD(v257[0])) {
          goto LABEL_200;
        }
        *((_DWORD *)v18 + 5) |= 0x1000u;
        if (*(unsigned char *)(a4 + 22) || !*(unsigned char *)(*((void *)&v256[1] + 1) + 1)) {
          goto LABEL_200;
        }
        if (v107 > *(unsigned __int8 *)(*((void *)&v256[1] + 1) + 1)) {
          goto LABEL_349;
        }
        int v177 = *(unsigned __int8 *)(*((void *)&v256[1] + 1) + 2);
        int v178 = *(unsigned __int8 *)(*((void *)&v256[1] + 1) + 4);
        if (v177 | v178) {
          goto LABEL_391;
        }
        if (*(unsigned char *)(*((void *)&v256[1] + 1) + 3) || *(unsigned char *)(*((void *)&v256[1] + 1) + 5))
        {
          int v178 = 0;
LABEL_391:
          if (v178 + v177 <= LOWORD(v257[1])
            && *(unsigned __int8 *)(*((void *)&v256[1] + 1) + 5)
             + *(unsigned __int8 *)(*((void *)&v256[1] + 1) + 3) <= WORD1(v257[1]))
          {
LABEL_349:
            LOBYTE(v256[1]) = 1;
          }
        }
LABEL_200:
        unsigned int v245 = v19;
        unsigned int v228 = v20;
        v212 = v18;
        unsigned __int8 v260 = 0;
        __int16 v108 = v255[1];
        int v109 = WORD1(v256[0]) - 1;
        v110 = (unsigned __int16 *)((char *)v255[1] + 40 * v109);
        uint64_t v111 = *(void *)(a4 + 8);
        uint64_t v221 = *(void *)(a4 + 64);
        v112 = v110 + 10;
        int v113 = *((_DWORD *)v110 + 5);
        if ((v113 & 0x400000) == 0
          && ((*((_DWORD *)v110 + 5) & 0x9000000) == 0 || *((_DWORD *)v255[1] + 10 * v109 + 7))
          && ((v113 & 0x8000) == 0 || *(unsigned char *)(a4 + 20) != 6 || !BYTE2(v257[0])))
        {
          goto LABEL_363;
        }
        unsigned __int16 v114 = *v110;
        if (*((unsigned __int16 *)v255[1] + 20 * v109 + 16) >= 8u) {
          uint64_t v115 = 8;
        }
        else {
          uint64_t v115 = *((unsigned __int16 *)v255[1] + 20 * v109 + 16);
        }
        LOWORD(v116) = *v110;
        if (v115)
        {
          uint64_t v117 = (unsigned __int16 *)((char *)v255[1] + 40 * WORD1(v256[0]) - 38);
          int v116 = *v110;
          do
          {
            int v118 = *v117++;
            v116 += v118;
            --v115;
          }
          while (v115);
        }
        if (*((unsigned __int16 *)v255[1] + 20 * v109 + 17) >= 8u) {
          uint64_t v119 = 8;
        }
        else {
          uint64_t v119 = *((unsigned __int16 *)v255[1] + 20 * v109 + 17);
        }
        uint64_t v250 = v31;
        if (v119)
        {
          int v120 = (__int16 *)((char *)v255[1] + 40 * WORD1(v256[0]) - 38);
          do
          {
            __int16 v121 = *v120++;
            v114 += v121;
            --v119;
          }
          while (v119);
        }
        if ((__int16)(v114 - v116) <= 15)
        {
          v232 = v255[1];
          v237 = (char *)v255[1] + 40 * v109;
          int v122 = v114;
          uint64_t v123 = v254;
          unsigned int v243 = v21;
          if (v114 <= (unsigned __int16)v116)
          {
            int v129 = v110 + 10;
            int v130 = WORD1(v256[0]) - 1;
            uint64_t v131 = v24;
            uint64_t v132 = v25;
            uint64_t v133 = v23;
            unsigned __int16 v125 = 0;
          }
          else
          {
            unsigned int v124 = (unsigned __int16)v116;
            unsigned __int16 v125 = v114 - v116;
            unsigned int v126 = v262;
            uint64_t v127 = v122 - (unsigned __int16)v116;
            do
            {
              uint64_t v128 = *(unsigned __int8 *)(v123 + v124);
              if ((*(_DWORD *)(v111 + 4 * v128) & 0x40000000) != 0) {
                LOBYTE(v128) = v128 + 32;
              }
              *(unsigned char *)unsigned int v126 = v128;
              unsigned int v126 = (unsigned __int16 *)((char *)v126 + 1);
              ++v124;
              --v127;
            }
            while (v127);
            int v129 = v110 + 10;
            int v130 = v109;
            uint64_t v131 = v24;
            uint64_t v132 = v25;
            uint64_t v133 = v23;
          }
          *((unsigned char *)v262 + v125) = 0;
          unsigned int v159 = SLcap(v123, (__int16)v116, (__int16)(v122 - 1), &v261, v111);
          __int16 v108 = v232;
          uint64_t result = PRSSWdGet((const char *)v262, v159, (char *)&v232[20 * v130 + 19], a4);
          int v109 = v130;
          uint64_t v29 = v252;
          uint64_t v23 = v133;
          uint64_t v25 = v132;
          uint64_t v24 = v131;
          uint64_t v21 = v243;
          v110 = (unsigned __int16 *)v237;
          v112 = v129;
          if (result) {
            goto LABEL_501;
          }
        }
        uint64_t v28 = v250;
LABEL_363:
        if (!BYTE12(v256[0]))
        {
          if (!BYTE13(v256[0]))
          {
            BYTE12(v256[0]) = 0;
            uint64_t v27 = v248;
            goto LABEL_412;
          }
          BYTE14(v256[0]) = 1;
          if (!LOBYTE(v257[0])) {
            goto LABEL_365;
          }
          v215 = v112;
          int v208 = v109;
          uint64_t v162 = v24;
          uint64_t v163 = v25;
          unsigned int v238 = v23;
          uint64_t v164 = v28;
          PRisListEnum(v110, (uint64_t)&v253, (char *)&v260);
          int v165 = BYTE13(v256[0]);
          int v161 = v260;
          if (BYTE13(v256[0]) == v260)
          {
            --WORD1(v256[0]);
            int v160 = 1;
            unsigned __int8 v259 = 1;
            int v166 = 0;
            if (BYTE2(v257[0])) {
              HIBYTE(v256[0]) = 1;
            }
            int v161 = BYTE13(v256[0]);
          }
          else
          {
            int v160 = 0;
            LOWORD(v257[0]) = 0;
            int v166 = 1;
          }
          uint64_t v29 = v252;
          uint64_t v27 = v248;
          uint64_t v28 = v164;
          uint64_t v23 = v238;
          uint64_t v25 = v163;
          uint64_t v24 = v162;
          int v109 = v208;
          v112 = v215;
LABEL_402:
          BYTE12(v256[0]) = 0;
          if (v165) {
            goto LABEL_403;
          }
          if (!v166) {
            goto LABEL_452;
          }
LABEL_412:
          int v180 = BYTE2(v257[0]);
          goto LABEL_417;
        }
        if (!BYTE13(v256[0]))
        {
          v216 = v112;
          uint64_t v167 = v22;
          uint64_t v168 = v23;
          uint64_t v169 = v28;
          v170 = v110;
          uint64_t v171 = v25;
          v233 = v108;
          v239 = v110;
          uint64_t v172 = v21;
          uint64_t v173 = v24;
          int v174 = v109;
          PRisListEnum(v170, (uint64_t)&v253, (char *)&v260);
          v112 = v216;
          int v109 = v174;
          uint64_t v24 = v173;
          uint64_t v21 = v172;
          __int16 v108 = v233;
          v110 = v239;
          uint64_t v25 = v171;
          uint64_t v23 = v168;
          uint64_t v22 = v167;
          uint64_t v28 = v169;
          uint64_t v29 = v252;
          int v160 = 0;
          BYTE13(v256[0]) = v260;
          int v165 = v260;
          int v166 = 1;
          int v161 = v260;
          uint64_t v27 = v248;
          goto LABEL_402;
        }
LABEL_365:
        int v160 = 0;
        int v161 = 0;
        BYTE12(v256[0]) = 0;
        uint64_t v27 = v248;
LABEL_403:
        int v179 = *(_DWORD *)v112;
        if ((*(_DWORD *)v112 & 0x1000) != 0)
        {
          LOBYTE(v257[0]) = 1;
          if ((v179 & 0x4000) != 0)
          {
            BYTE2(v257[0]) = 1;
            BYTE8(v257[0]) = BYTE4(v257[1]);
            DWORD1(v257[0]) = *(_DWORD *)((char *)&v257[1] + 6);
            WORD6(v257[0]) = WORD1(v256[0]);
            WORD5(v257[0]) = WORD1(v256[0]);
          }
        }
        int v180 = BYTE2(v257[0]);
        if (BYTE2(v257[0]))
        {
          if (WORD5(v257[0]) == WORD1(v256[0]))
          {
            uint64_t v27 = v248;
          }
          else
          {
            uint64_t v27 = v248;
            if (BYTE8(v257[0]) == 58)
            {
              if (v161)
              {
                WORD1(v256[0]) = WORD5(v257[0]);
                BYTE12(v256[0]) = 1;
                unsigned __int8 v259 = 1;
                goto LABEL_452;
              }
              int v180 = 0;
              BYTE2(v257[0]) = 0;
            }
          }
        }
        if (v160 || BYTE1(v257[0])) {
          goto LABEL_452;
        }
LABEL_417:
        if (!v180 || WORD5(v257[0]) == WORD1(v256[0])) {
          goto LABEL_447;
        }
        int v181 = *(unsigned __int8 *)(a4 + 20);
        if ((*(_DWORD *)v112 & 0x8000) != 0)
        {
          if (v181 != 6)
          {
            if (BYTE8(v257[0]) != 46
              || WORD3(v257[0]) != 1
              || (*((char *)v255[1] + 40 * WORD5(v257[0]) - 2) & 0x80000000) == 0
              && WORD2(v257[0]) >= 2u
              && ((int v191 = *(unsigned __int8 *)(v254 + WORD2(v257[0]) - 1),
                   uint64_t v192 = *(unsigned __int8 *)(v254 + WORD2(v257[0]) - 2),
                   (*(_DWORD *)(v221 + 16 + 4 * *(unsigned __int8 *)(v254 + WORD2(v257[0]) - 1)) & 0x40000000) == 0)
               || (*(_DWORD *)(v221 + 16 + 4 * v192) & 0x3000000) == 0)
              && ((v191 != 114 || v192 != 68) && (v191 != 116 || v192 != 83)
               || WORD5(v257[0]) >= 3u && (*((unsigned char *)v255[1] + 40 * WORD5(v257[0]) - 59) & 0x80) != 0))
            {
              WORD1(v256[0]) = WORD6(v257[0]);
              goto LABEL_450;
            }
            BYTE2(v257[0]) = 0;
            uint64_t v27 = v248;
            goto LABEL_447;
          }
          v234 = v108;
          v240 = v110;
          v184 = v112;
          int v185 = v109;
          uint64_t v186 = v21;
          uint64_t v187 = v24;
          uint64_t v188 = v25;
          uint64_t v189 = v23;
          uint64_t v251 = v28;
          uint64_t result = PRgermScan(v29, a4, (uint64_t)&v253, (uint64_t)v257, &v259);
          if (result) {
            goto LABEL_501;
          }
          int v190 = v259;
          uint64_t v27 = v248;
          uint64_t v23 = v189;
          uint64_t v25 = v188;
          uint64_t v24 = v187;
          uint64_t v21 = v186;
          int v109 = v185;
          v112 = v184;
          __int16 v108 = v234;
LABEL_430:
          uint64_t v28 = v251;
          uint64_t v29 = v252;
          v110 = v240;
          if (v190)
          {
LABEL_451:
            HIBYTE(v256[0]) = 1;
            BYTE13(v256[0]) = 0;
            goto LABEL_452;
          }
          goto LABEL_447;
        }
        uint64_t v251 = v28;
        if (v181 != 11)
        {
          if (v181 != 5 || v108[20 * v109 + 9] != 1) {
            goto LABEL_446;
          }
          int v182 = (unsigned __int16)v108[20 * v109 + 1];
          if (v182 == 1)
          {
            int v183 = *(unsigned __int8 *)(v254 + *v110);
            if ((v183 | 0x10) != 0xBB)
            {
LABEL_446:
              BYTE2(v257[0]) = 0;
              uint64_t v28 = v251;
              goto LABEL_447;
            }
          }
          else
          {
            if (v182 != 2) {
              goto LABEL_446;
            }
            int v183 = *(unsigned __int8 *)(v254 + *v110);
            if ((v183 | 2) != 0x3E) {
              goto LABEL_446;
            }
          }
          if (v183 == 187 || v183 == 62) {
            WORD6(v257[0]) = WORD1(v256[0]);
          }
LABEL_447:
          if ((*(_DWORD *)v112 & 0x4000) == 0) {
            goto LABEL_452;
          }
          if (LOBYTE(v256[1]))
          {
            BYTE12(v256[0]) = 1;
LABEL_450:
            unsigned __int8 v259 = 1;
            uint64_t v27 = v248;
            goto LABEL_451;
          }
          unsigned int v195 = **((unsigned char **)&v256[1] + 1);
          if (v195 >= 2
            && (!HIWORD(v257[0]) && LOWORD(v257[1]) >= v195
             || *(unsigned __int8 *)(*((void *)&v256[1] + 1) + 2) + v195 <= LOWORD(v257[1])))
          {
            goto LABEL_450;
          }
          if (BYTE4(v257[1]) == 46)
          {
            __int16 v196 = WORD4(v257[1]);
            if (WORD4(v257[1]) > 5u) {
              goto LABEL_450;
            }
            __int16 v197 = WORD3(v257[1]);
            if (WORD4(v257[1]) == 5)
            {
              if (*(unsigned char *)(WORD3(v257[1]) + (void)v254 + 1) == 46) {
                goto LABEL_450;
              }
              __int16 v196 = 5;
            }
          }
          else
          {
            if (BYTE4(v257[1]) == 58)
            {
              uint64_t v27 = v248;
              if ((*(_DWORD *)v112 & 0x1000) != 0 && (__int16)(v108[20 * v109 + 9] - v108[20 * v109 + 17]) <= 1)
              {
                BYTE2(v257[0]) = 1;
                BYTE8(v257[0]) = 58;
                DWORD1(v257[0]) = *(_DWORD *)((char *)&v257[1] + 6);
                WORD6(v257[0]) = WORD1(v256[0]);
                WORD5(v257[0]) = WORD1(v256[0]);
                BYTE12(v256[0]) = 1;
              }
LABEL_452:
              if (LOBYTE(v256[1]))
              {
                if (WORD1(v256[0]) == WORD6(v257[0]) && BYTE2(v257[0])) {
                  HIBYTE(v256[0]) = 1;
                }
                if (BYTE13(v256[0]))
                {
                  BYTE13(v256[0]) = 0;
                  if ((*((unsigned char *)v112 + 1) & 0x40) != 0) {
                    HIBYTE(v256[0]) = 1;
                  }
                }
                BYTE12(v256[0]) = 1;
                unsigned __int8 v259 = 1;
              }
              unsigned __int16 v193 = v108[20 * v109 + 9] + v258;
              unsigned int v194 = *(unsigned __int16 *)(a4 + 28);
              BOOL v18 = v212;
              uint64_t v20 = v228;
              if (v194 > v193) {
                goto LABEL_470;
              }
              if (v194 < v193 && (char *)v255[1] + 40 * WORD1(v256[0]) - 40 == (char *)v110)
              {
                HIBYTE(v256[0]) = 0;
                BYTE13(v256[0]) = 0;
                --WORD1(v256[0]);
              }
              else if (HIBYTE(v256[0]))
              {
LABEL_467:
                if (!v259) {
                  BYTE13(v256[0]) = 0;
                }
                unsigned __int8 v259 = 1;
LABEL_470:
                LOWORD(v258) = v193;
                uint64_t v73 = v245;
                uint64_t v26 = 23;
LABEL_323:
                uint64_t v19 = v73;
                if (v259) {
                  goto LABEL_506;
                }
                continue;
              }
              BYTE10(v256[0]) = 1;
              goto LABEL_467;
            }
            __int16 v196 = WORD4(v257[1]);
            __int16 v197 = WORD3(v257[1]);
          }
          uint64_t v27 = v248;
          BYTE2(v257[0]) = 1;
          BYTE8(v257[0]) = BYTE4(v257[1]);
          WORD3(v257[0]) = v196;
          WORD2(v257[0]) = v197;
          WORD6(v257[0]) = WORD1(v256[0]);
          WORD5(v257[0]) = WORD1(v256[0]);
          goto LABEL_452;
        }
        if ((*(_DWORD *)v112 & 0x8000000) == 0) {
          goto LABEL_446;
        }
        if ((v108[20 * v109 + 19] & 0x10) == 0)
        {
          if ((unsigned __int16)v108[20 * v109 + 9] >= 4u)
          {
            v235 = v108;
            v198 = v112;
            uint64_t v199 = v23;
            unsigned int v222 = v25;
            uint64_t v200 = v24;
            int v201 = v109;
            BOOL v202 = PRisDutchOpenCompound(*(void *)(a4 + 64), (uint64_t)&v253, v110);
            v112 = v198;
            __int16 v108 = v235;
            int v109 = v201;
            uint64_t v24 = v200;
            uint64_t v25 = v222;
            uint64_t v23 = v199;
            uint64_t v27 = v248;
            uint64_t v29 = v252;
            if (v202)
            {
              WORD1(v256[0]) = WORD6(v257[0]);
              uint64_t v28 = v251;
              goto LABEL_450;
            }
          }
          goto LABEL_446;
        }
        v203 = v112;
        int v204 = v109;
        v240 = v110;
        uint64_t v205 = v24;
        unsigned int v223 = v25;
        uint64_t v206 = v23;
        v262[0] = 0;
        uint64_t result = PRpendTermIsDot(v29, a4, (uint64_t)&v253, *((unsigned __int16 *)v255[1] + 20 * WORD5(v257[0]) - 20), WORD2(v257[0]), 0, 1u, v262, (BOOL *)&v261);
        if (!result)
        {
          int v190 = v262[0];
          if (v262[0])
          {
            WORD1(v256[0]) = WORD6(v257[0]);
            int v190 = 1;
            unsigned __int8 v259 = 1;
          }
          uint64_t v27 = v248;
          uint64_t v23 = v206;
          uint64_t v25 = v223;
          uint64_t v24 = v205;
          int v109 = v204;
          v112 = v203;
          uint64_t v17 = v224;
          goto LABEL_430;
        }
LABEL_501:
        if (result == 200)
        {
LABEL_502:
          if (v255[0]) {
            free(v255[0]);
          }
          PRssTidyUp((uint64_t)&v253);
          return 200;
        }
        return result;
      case 25:
        if ((unsigned __int16)v246 != 1 || WORD2(v229) != 1)
        {
          if ((unsigned __int16)v246 == 1)
          {
LABEL_354:
            int v146 = *((_DWORD *)v18 + 5);
            if ((v146 & 0x20000000) == 0)
            {
              uint64_t v73 = 0;
              int v246 = 0;
              *((_DWORD *)v18 + 5) = v146 | 0x22000000;
              HIDWORD(v219) = 1;
              uint64_t v26 = 4;
              int v210 = v19;
              goto LABEL_323;
            }
          }
          else
          {
            int v146 = *((_DWORD *)v18 + 5);
          }
          __int16 v156 = 0;
          *((_DWORD *)v18 + 6) |= *((_DWORD *)v18 + 7) | v210 | v19;
          *((_DWORD *)v18 + 7) = 0;
          if (*((unsigned __int16 *)v18 + 9) > v217)
          {
            __int16 v156 = 0;
            unint64_t v157 = v217;
            v158 = v18 + 2;
            do
            {
              v156 += *(_WORD *)&v158[2 * v157];
              *(_WORD *)&v158[2 * v157++] = 0;
            }
            while (v157 < *((unsigned __int16 *)v18 + 9));
          }
          uint64_t v73 = 0;
          int v210 = 0;
          int v246 = 0;
          WORD2(v218) = v156 + 1;
          *((_WORD *)v18 + 9) = v217;
          *((_DWORD *)v18 + 5) = v146 & 0xDDFFFFFF | 0x20000000;
          uint64_t v219 = 1;
          uint64_t v26 = 4;
          uint64_t v27 = v30;
          goto LABEL_323;
        }
        if ((v23 & 0xC000) == 0
          && (v213 > 0x3A
           || ((1 << v213) & 0x400D00000000000) == 0
           || (v21 & 0x8000000) == 0
           || (*(_DWORD *)(*(void *)(a4 + 64) + 4 * *(unsigned __int8 *)(v254 + (unsigned __int16)v209 - 1) + 16) & 0x8000000) == 0))
        {
          goto LABEL_354;
        }
        uint64_t v73 = 0;
        int v246 = 0;
        uint64_t v134 = 24;
        if (HIDWORD(v219)) {
          uint64_t v134 = 28;
        }
        *(_DWORD *)&v18[v134] |= v19 | v21;
        unsigned __int16 v135 = *((_WORD *)v18 + 9) - 2;
        *((_WORD *)v18 + 9) = v135;
        v136 = &v18[2 * v135 + 2];
        __int16 v137 = *(_WORD *)v136 + *((_WORD *)v136 + 1) + 1;
        *(_WORD *)v136 = 0;
        *(_WORD *)&v18[2 * *((unsigned __int16 *)v18 + 9) + 4] = 0;
        WORD2(v218) = v137;
        LODWORD(v219) = 1;
        uint64_t v26 = 4;
        HIDWORD(v229) = 1;
        goto LABEL_323;
      default:
        goto LABEL_322;
    }
  }
}

uint64_t PRgrowWkBuf(void **a1, void **a2, _WORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = malloc_type_malloc((unsigned __int16)*a3 + 1024, 0xD5D9936FuLL);
  if (!v10)
  {
LABEL_6:
    uint64_t v17 = *(void *)(a4 + 32);
    *(void *)uint64_t v17 = 0xDC00000078;
    *(_WORD *)(v17 + 8) = 940;
    return 220;
  }
  uint64_t v11 = v10;
  if (*(unsigned char *)(*(void *)(a5 + 64) + 1040))
  {
    int v12 = (__int16)*a3;
    int v14 = v12 + 1024;
    BOOL v13 = v12 < -1024;
    int v15 = v12 + 1039;
    if (!v13) {
      int v15 = v14;
    }
    uint64_t v16 = malloc_type_calloc((v15 >> 4) + 1, 2uLL, 0x1000040BDFB0063uLL);
    if (!v16) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v19 = *a1;
  if (*a1)
  {
    if (*a3)
    {
      unint64_t v20 = 0;
      do
      {
        v11[v20] = *((unsigned char *)*a1 + v20);
        ++v20;
      }
      while (v20 < (unsigned __int16)*a3);
      uint64_t v19 = *a1;
    }
    free(v19);
  }
  if (a2 && *(unsigned char *)(*(void *)(a5 + 64) + 1040))
  {
    uint64_t v21 = *a2;
    if (*a2)
    {
      if (*a3)
      {
        int v22 = 0;
        do
        {
          v16[(unsigned __int16)v22] = v21[(unsigned __int16)v22];
          ++v22;
        }
        while (16 * (v22 & 0xFFFu) < (unsigned __int16)*a3);
      }
      free(v21);
    }
    *a2 = v16;
  }
  uint64_t result = 0;
  *a3 += 1024;
  *a1 = v11;
  return result;
}

uint64_t PRgrowRaw(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = malloc_type_calloc(*(unsigned __int16 *)(a2 + 48) + 32, 0x28uLL, 0x1000040F24650D8uLL);
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned int v6 = *(const void **)(a2 + 40);
    if (v6)
    {
      memcpy(v4, v6, 40 * *(unsigned __int16 *)(a2 + 48));
      free(*(void **)(a2 + 40));
    }
    uint64_t result = 0;
    *(_WORD *)(a2 + 48) += 32;
    *(void *)(a2 + 40) = v5;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(void *)uint64_t v8 = 0xDC00000078;
    *(_WORD *)(v8 + 8) = 960;
    return 220;
  }
  return result;
}

void PRssTidyUp(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    free(v2);
  }
  uint64_t v3 = *(void **)(a1 + 16);
  if (v3)
  {
    free(v3);
  }
}

uint64_t PRnormalize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v211 = *MEMORY[0x263EF8340];
  char v208 = 0;
  unsigned int v3 = *(unsigned __int16 *)(a3 + 50);
  if (*(_WORD *)(a3 + 50))
  {
    uint64_t v4 = a2;
    uint64_t v5 = *(void *)(a2 + 8);
    uint64_t v6 = *(void *)(a2 + 64);
    if (*(unsigned char *)(a3 + 62))
    {
      uint64_t v7 = *(void *)(a3 + 40);
      *(_DWORD *)(v7 + 24) |= *(_DWORD *)(v7 + 28);
      *(_DWORD *)(v7 + 28) = 0;
      if (*(unsigned __int16 *)(v7 + 18) >= 2u)
      {
        __int16 v8 = *(_WORD *)(v7 + 2);
        unint64_t v9 = 2;
        do
        {
          v8 += *(_WORD *)(v7 + 2 * v9);
          *(_WORD *)(v7 + 2 * v9) = 0;
          BOOL v10 = v9++ >= *(unsigned __int16 *)(v7 + 18);
        }
        while (!v10);
        *(_WORD *)(v7 + 2) = v8;
        unsigned int v3 = *(unsigned __int16 *)(a3 + 50);
      }
      *(_DWORD *)(v7 + 32) = 65537;
      unsigned int v11 = 1;
      *(_WORD *)(v7 + 18) = 1;
    }
    else
    {
      unsigned int v11 = 0;
    }
    if (v11 < v3)
    {
      unsigned __int16 v12 = 0;
      unint64_t v13 = v11;
      uint64_t v14 = (8 * v11) | (32 * v11);
      uint64_t v206 = v5;
      uint64_t v207 = v6 + 16;
      uint64_t v15 = v14 | 2;
      uint64_t v16 = v14 | 4;
      uint64_t v17 = v14 | 6;
      uint64_t v203 = a3;
      uint64_t v204 = v6;
      while (1)
      {
        uint64_t v18 = *(void *)(a3 + 40);
        uint64_t v19 = (unsigned __int16 *)(v18 + 40 * v13);
        unint64_t v20 = v19 + 10;
        if ((*((_DWORD *)v19 + 5) & 0xFC00000) != 0) {
          break;
        }
LABEL_313:
        ++v13;
        v15 += 40;
        v16 += 40;
        v17 += 40;
        if (v13 >= *(unsigned __int16 *)(a3 + 50)) {
          return 0;
        }
      }
      if ((*((_DWORD *)v19 + 5) & 0x8000000) == 0) {
        goto LABEL_46;
      }
      uint64_t v21 = v18 + 40 * v13;
      int v23 = *(_DWORD *)(v21 + 28);
      int v22 = (_DWORD *)(v21 + 28);
      if (v23)
      {
        unsigned __int16 v12 = *v19;
        uint64_t v24 = *(unsigned __int16 *)(v18 + 40 * v13 + 32);
        if (v24 >= 8) {
          uint64_t v25 = 8;
        }
        else {
          uint64_t v25 = *(unsigned __int16 *)(v18 + 40 * v13 + 32);
        }
        if (v25)
        {
          uint64_t v26 = (__int16 *)(v18 + v15);
          do
          {
            __int16 v27 = *v26++;
            v12 += v27;
            --v25;
          }
          while (v25);
        }
        int v28 = *(__int16 *)(v18 + 40 * v13 + 2 * v24 + 2);
        if (v28 <= 15)
        {
          unsigned int v29 = (unsigned __int16)(v28 + v12);
          uint64_t v30 = *(void *)(a3 + 16);
          if (v29 <= v12)
          {
            uint64_t v36 = (unsigned __int16 *)(v18 + 40 * v13);
            uint64_t v37 = v17;
            unsigned __int16 v32 = 0;
          }
          else
          {
            unsigned int v31 = v12;
            unsigned __int16 v32 = v29 - v12;
            char v33 = v210;
            uint64_t v34 = v29 - v12;
            do
            {
              uint64_t v35 = *(unsigned __int8 *)(v30 + v31);
              if ((*(_DWORD *)(v5 + 4 * v35) & 0x40000000) != 0) {
                LOBYTE(v35) = v35 + 32;
              }
              *(unsigned char *)char v33 = v35;
              char v33 = (unsigned __int16 *)((char *)v33 + 1);
              ++v31;
              --v34;
            }
            while (v34);
            uint64_t v36 = (unsigned __int16 *)(v18 + 40 * v13);
            uint64_t v37 = v17;
          }
          *((unsigned char *)v210 + v32) = 0;
          unsigned int v38 = SLcap(v30, (__int16)v12, (__int16)(v29 - 1), &v209, v206);
          uint64_t result = PRSSWdGet((const char *)v210, v38, &v208, v4);
          uint64_t v5 = v206;
          a3 = v203;
          uint64_t v6 = v204;
          uint64_t v17 = v37;
          uint64_t v19 = v36;
          if (result) {
            return result;
          }
        }
      }
      else
      {
        char v208 = *(unsigned char *)(v18 + 40 * v13 + 38);
      }
      uint64_t v40 = v18 + 40 * v13;
      uint64_t v41 = *(unsigned __int16 *)(v40 + 32);
      unsigned int v42 = *(unsigned __int16 *)(v40 + 2 * v41 + 2);
      if (v42 >= 2 && (*(unsigned char *)(v18 + 40 * v13 + 27) & 8) != 0 && (v208 & 0x10) == 0)
      {
        unsigned __int16 v12 = *v19;
        if (v41 >= 8) {
          uint64_t v43 = 8;
        }
        else {
          uint64_t v43 = *(unsigned __int16 *)(v40 + 32);
        }
        if (v43)
        {
          uint64_t v44 = v18;
          do
          {
            v12 += *(_WORD *)(v44 + v15);
            v44 += 2;
            --v43;
          }
          while (v43);
        }
        uint64_t v45 = *(void *)(a3 + 16);
        if ((*(_DWORD *)(v5 + 4 * *(unsigned __int8 *)(v45 + v12)) & 0x8000000) != 0
          && (*(_DWORD *)(v5 + 4 * *(unsigned __int8 *)(v45 + v12 + 1)) & 0x8000000) != 0
          && (v42 == 2 || (*(_DWORD *)(v5 + 4 * *(unsigned __int8 *)(v45 + v12 + 2)) & 0x8000000) == 0))
        {
          v208 |= 0x10u;
        }
      }
      if ((v208 & 0x10) == 0)
      {
LABEL_46:
        int v46 = 0;
        BOOL v47 = 0;
        char v48 = 1;
        goto LABEL_47;
      }
      *(_DWORD *)(v18 + 40 * v13 + 24) |= *(_DWORD *)(v6 + 172);
      if (*(unsigned char *)(v4 + 20) != 11 || !*v22)
      {
        char v48 = 0;
        BOOL v47 = 0;
        int v46 = 1;
        goto LABEL_47;
      }
      uint64_t v66 = v4;
      int v67 = v19;
      uint64_t v68 = a3;
      if (SLstrncmp("'s-", (unsigned __int8 *)(*(void *)(a3 + 16) + v12 - 1), 3))
      {
        char v48 = 0;
        int v46 = 1;
        a3 = v68;
        uint64_t v5 = v206;
        uint64_t v6 = v204;
        uint64_t v19 = v67;
      }
      else
      {
        uint64_t v5 = v206;
        a3 = v68;
        uint64_t v19 = v67;
        char v48 = 0;
        if ((*(_DWORD *)(v206 + 4 * *(unsigned __int8 *)(*(void *)(v68 + 16) + v12 + 2)) & 0x40000000) != 0)
        {
          *(_DWORD *)v20 &= ~0x2000000u;
          int v46 = 1;
          uint64_t v6 = v204;
          uint64_t v4 = v66;
          BOOL v47 = 1;
LABEL_47:
          if (*((unsigned char *)v20 + 3))
          {
            uint64_t v49 = v18 + 40 * v13;
            int v51 = *(_DWORD *)(v49 + 28);
            int v50 = (_DWORD *)(v49 + 28);
            if (v51)
            {
              unsigned __int16 v12 = *v19;
              if (*(_WORD *)(v18 + 40 * v13 + 32) != 0xFFFE)
              {
                unint64_t v52 = (unsigned __int16)(*(_WORD *)(v18 + 40 * v13 + 32) + 2) - 1;
                if (v52 >= 7) {
                  unint64_t v52 = 7;
                }
                unint64_t v53 = ~v52;
                uint64_t v54 = v18;
                do
                {
                  v12 += *(_WORD *)(v54 + v15);
                  v54 += 2;
                  BOOL v10 = __CFADD__(v53++, 1);
                }
                while (!v10);
              }
              int v55 = *(__int16 *)(v18 + 40 * v13 + 2 * (*(unsigned __int16 *)(v18 + 40 * v13 + 32) + 2) + 2);
              if (v55 <= 15)
              {
                char v196 = v48;
                unsigned int v56 = (unsigned __int16)(v55 + v12);
                uint64_t v57 = *(void *)(a3 + 16);
                uint64_t v198 = v16;
                BOOL v200 = v47;
                if (v56 <= v12)
                {
                  int v63 = v46;
                  int v64 = v19;
                  uint64_t v65 = v17;
                  unsigned __int16 v59 = 0;
                }
                else
                {
                  unsigned int v58 = v12;
                  unsigned __int16 v59 = v56 - v12;
                  int v60 = v210;
                  uint64_t v61 = v56 - v12;
                  do
                  {
                    uint64_t v62 = *(unsigned __int8 *)(v57 + v58);
                    if ((*(_DWORD *)(v5 + 4 * v62) & 0x40000000) != 0) {
                      LOBYTE(v62) = v62 + 32;
                    }
                    *(unsigned char *)int v60 = v62;
                    int v60 = (unsigned __int16 *)((char *)v60 + 1);
                    ++v58;
                    --v61;
                  }
                  while (v61);
                  int v63 = v46;
                  int v64 = v19;
                  uint64_t v65 = v17;
                }
                *((unsigned char *)v210 + v59) = 0;
                unsigned int v71 = SLcap(v57, (__int16)v12, (__int16)(v56 - 1), &v209, v206);
                uint64_t result = PRSSWdGet((const char *)v210, v71, &v208, v4);
                uint64_t v5 = v206;
                a3 = v203;
                uint64_t v6 = v204;
                uint64_t v17 = v65;
                uint64_t v19 = v64;
                int v46 = v63;
                uint64_t v16 = v198;
                BOOL v47 = v200;
                char v48 = v196;
                if (result) {
                  return result;
                }
              }
              if ((v208 & 8) == 0) {
                goto LABEL_75;
              }
LABEL_67:
              int v69 = *(_DWORD *)(v6 + 172);
              if (*v50) {
                *v50 |= v69;
              }
              else {
                *(_DWORD *)(v18 + 40 * v13 + 24) |= v69;
              }
              int v70 = 1;
LABEL_76:
              unsigned int v72 = *(_DWORD *)v20;
              if ((*(_DWORD *)v20 & 0x400000) == 0) {
                goto LABEL_155;
              }
              uint64_t v73 = v18 + 40 * v13;
              int v76 = *(char *)(v73 + 38);
              int v75 = (unsigned char *)(v73 + 38);
              char v74 = v76;
              if (v76 < 0)
              {
                int v83 = v72 | 0x80000;
                *(_DWORD *)unint64_t v20 = v72 | 0x80000;
                if ((v72 & 0x2000000) != 0)
                {
                  unsigned int v72 = v72 & 0xFDF7FFFF | 0x80000;
                  *(_DWORD *)unint64_t v20 = v83 & 0xFDFFFFFF;
                  BOOL v47 = 1;
                }
                else
                {
                  v72 |= 0x80000u;
                }
                goto LABEL_151;
              }
              int v77 = *(unsigned __int8 *)(v4 + 20);
              if ((v74 & 0x20) != 0 && v77 != 6)
              {
                int v78 = v72 | 0x100000;
                *(_DWORD *)unint64_t v20 = v72 | 0x100000;
                int v79 = *(unsigned __int16 *)(a3 + 50);
                if (v79 - 1 != v13)
                {
                  if (v77 != 5
                    || v79 - 2 != v13
                    || (uint64_t v80 = *(void *)(a3 + 40),
                        BOOL v81 = (unsigned __int16 *)(v80 + 40 * (v13 + 1)),
                        v81[9] != 1)
                    || *(unsigned __int16 *)(v80 + 40 * (v13 + 1) + 2) > 2u
                    || (int v82 = *(unsigned __int8 *)(*(void *)(a3 + 16) + *v81), v82 != 62) && v82 != 187)
                  {
                    int v70 = 1;
                  }
                }
                if ((v72 & 0x2000000) != 0)
                {
                  unsigned int v72 = v72 & 0xFDEFFFFF | 0x100000;
                  *(_DWORD *)unint64_t v20 = v78 & 0xFDFFFFFF;
                  BOOL v47 = 1;
                }
                else
                {
                  v72 |= 0x100000u;
                }
                goto LABEL_150;
              }
              uint64_t v84 = v18 + 40 * v13;
              uint64_t v85 = *(unsigned __int16 *)(v84 + 32);
              if (!*(_DWORD *)(v84 + 28)
                && *(_WORD *)(v18 + 40 * v13 + 2 * v85 + 2) == 1
                && (*(unsigned char *)(v18 + 40 * v13 + 27) & 0x60) != 0)
              {
                int v86 = *(unsigned __int8 *)(*(void *)(a3 + 16) + *v19);
                if ((v86 - 108) < 2 || v86 == 103) {
                  goto LABEL_150;
                }
                if (v86 == 97 && v77 == 5) {
                  goto LABEL_150;
                }
LABEL_151:
                uint64_t v101 = v18 + 40 * v13;
                int v104 = *(_DWORD *)(v101 + 28);
                uint64_t v102 = (int *)(v101 + 28);
                int v103 = v104;
                int v105 = *(_DWORD *)(v6 + 200);
                if (v104) {
                  *uint64_t v102 = v105 | v103;
                }
                else {
                  *(_DWORD *)(v18 + 40 * v13 + 24) |= v105;
                }
                int v70 = 1;
LABEL_155:
                if (v72 & 0x4000000) != 0 && ((v72 & 0x2000000) != 0 || (*(unsigned char *)(v18 + 40 * v13 + 24)))
                {
                  unsigned __int16 v12 = *v19;
                  uint64_t v112 = *(unsigned __int16 *)(v18 + 40 * v13 + 32);
                  if ((((_WORD)v112 - 1) & 0xFFF8) != 0) {
                    uint64_t v113 = 8;
                  }
                  else {
                    uint64_t v113 = (unsigned __int16)(v112 - 1);
                  }
                  unsigned __int16 v114 = *v19;
                  if (v113)
                  {
                    uint64_t v115 = v18;
                    unsigned __int16 v114 = *v19;
                    do
                    {
                      v114 += *(_WORD *)(v115 + v15);
                      v115 += 2;
                      --v113;
                    }
                    while (v113);
                  }
                  uint64_t v116 = 0;
                  uint64_t v117 = *(void *)(a3 + 16);
                  uint64_t v118 = *(unsigned __int8 *)(v117 + v114);
                  while (PRnormalize_PairPunTab[v116] != v118)
                  {
                    v116 += 2;
                    if (v116 == 8)
                    {
                      unsigned __int16 v12 = v114;
                      if ((v72 & 0x800000) != 0) {
                        goto LABEL_157;
                      }
                      goto LABEL_181;
                    }
                  }
                  if ((v72 & 0x2000000) != 0)
                  {
                    LOWORD(v112) = v112 + 1;
                    if ((v112 & 0xFFF8) != 0) {
                      uint64_t v112 = 8;
                    }
                    else {
                      uint64_t v112 = (unsigned __int16)v112;
                    }
                    if (v112)
                    {
                      uint64_t v148 = v18;
                      do
                      {
                        v12 += *(_WORD *)(v148 + v15);
                        v148 += 2;
                        --v112;
                      }
                      while (v112);
                    }
                    if (*(unsigned __int8 *)(v117 + v12) == PRnormalize_PairPunTab[v116 + 1])
                    {
                      v72 &= ~0x2000000u;
                      *(_DWORD *)unint64_t v20 = v72;
                      *(_DWORD *)(v18 + 40 * v13 + 24) |= *(_DWORD *)(v207 + 4 * v118);
                      int v46 = 1;
                      BOOL v47 = 1;
                    }
                    goto LABEL_156;
                  }
                  if (v112 >= 8) {
                    uint64_t v142 = 8;
                  }
                  else {
                    uint64_t v142 = *(unsigned __int16 *)(v18 + 40 * v13 + 32);
                  }
                  if (v142)
                  {
                    uint64_t v143 = v18;
                    do
                    {
                      v12 += *(_WORD *)(v143 + v15);
                      v143 += 2;
                      --v142;
                    }
                    while (v142);
                  }
                  unsigned __int16 v144 = *(_WORD *)(v18 + 40 * v13 + 2 * v112 + 2) + v12;
                  char v145 = v48 ^ 1;
                  if (v12 >= v144) {
                    char v145 = 1;
                  }
                  if (v145) {
                    goto LABEL_156;
                  }
                  uint64_t v146 = v12;
                  while (*(unsigned __int8 *)(v117 + v146) != PRnormalize_PairPunTab[v116 + 1])
                  {
                    if (++v146 >= (unint64_t)v144)
                    {
                      int v46 = 0;
                      if ((v72 & 0x800000) != 0) {
                        goto LABEL_157;
                      }
                      goto LABEL_181;
                    }
                  }
                  *(_DWORD *)(v18 + 40 * v13 + 24) |= *(_DWORD *)(v207 + 4 * v118);
                  int v46 = 1;
                  if ((v72 & 0x800000) != 0) {
                    goto LABEL_157;
                  }
                  goto LABEL_181;
                }
LABEL_156:
                if ((v72 & 0x800000) == 0) {
                  goto LABEL_181;
                }
LABEL_157:
                if ((v72 & 0x2000000) == 0 && (*(unsigned char *)(v18 + 40 * v13 + 24) & 1) == 0)
                {
LABEL_181:
                  if ((v72 & 0x2000000) == 0) {
                    goto LABEL_293;
                  }
                  goto LABEL_182;
                }
                unsigned __int16 v106 = *v19;
                if (*(unsigned __int16 *)(v18 + 40 * v13 + 34) >= 8u) {
                  uint64_t v107 = 8;
                }
                else {
                  uint64_t v107 = *(unsigned __int16 *)(v18 + 40 * v13 + 34);
                }
                unsigned __int16 v12 = *v19;
                if (v107)
                {
                  uint64_t v108 = v18;
                  unsigned __int16 v12 = *v19;
                  do
                  {
                    v12 += *(_WORD *)(v108 + v15);
                    v108 += 2;
                    --v107;
                  }
                  while (v107);
                }
                uint64_t v109 = 0;
                uint64_t v110 = *(void *)(a3 + 16);
                uint64_t v111 = *(unsigned __int8 *)(v110 + v12);
                while (PRnormalize_PairPunTab[v109 + 1] != v111)
                {
                  v109 += 2;
                  if (v109 == 8) {
                    goto LABEL_181;
                  }
                }
                uint64_t v136 = *(unsigned __int16 *)(v18 + 40 * v13 + 32);
                if ((v72 & 0x2000000) != 0)
                {
                  LOWORD(v136) = v136 + 1;
                  if ((v136 & 0xFFF8) != 0) {
                    uint64_t v136 = 8;
                  }
                  else {
                    uint64_t v136 = (unsigned __int16)v136;
                  }
                  if (v136)
                  {
                    uint64_t v147 = v18;
                    do
                    {
                      v106 += *(_WORD *)(v147 + v15);
                      v147 += 2;
                      --v136;
                    }
                    while (v136);
                  }
                  if (*(unsigned __int8 *)(v110 + v106) == PRnormalize_PairPunTab[v109])
                  {
                    v72 &= ~0x2000000u;
                    *(_DWORD *)unint64_t v20 = v72;
                    BOOL v47 = 1;
LABEL_242:
                    *(_DWORD *)(v18 + 40 * v13 + 24) |= *(_DWORD *)(v207 + 4 * v111);
                    int v70 = 1;
                  }
                }
                else
                {
                  if (v136 >= 8) {
                    uint64_t v137 = 8;
                  }
                  else {
                    uint64_t v137 = *(unsigned __int16 *)(v18 + 40 * v13 + 32);
                  }
                  if (v137)
                  {
                    uint64_t v138 = v18;
                    do
                    {
                      v106 += *(_WORD *)(v138 + v15);
                      v138 += 2;
                      --v137;
                    }
                    while (v137);
                  }
                  if (!v70)
                  {
                    unsigned __int16 v139 = *(_WORD *)(v18 + 40 * v13 + 2 * v136 + 2) + v106;
                    if (v106 < v139)
                    {
                      int v140 = PRnormalize_PairPunTab[v109];
                      uint64_t v141 = v106;
                      while (*(unsigned __int8 *)(v110 + v141) != v140)
                      {
                        if (++v141 >= (unint64_t)v139)
                        {
                          int v70 = 0;
                          goto LABEL_243;
                        }
                      }
                      goto LABEL_242;
                    }
                  }
                }
LABEL_243:
                unsigned __int16 v12 = v106;
                if ((v72 & 0x2000000) == 0) {
                  goto LABEL_293;
                }
LABEL_182:
                v210[0] = 0;
                unsigned __int16 v12 = *v19;
                uint64_t v119 = v18 + 40 * v13;
                unsigned int v122 = *(unsigned __int16 *)(v119 + 32);
                __int16 v121 = (unsigned __int16 *)(v119 + 32);
                uint64_t v120 = v122;
                if (v122 >= 8) {
                  uint64_t v123 = 8;
                }
                else {
                  uint64_t v123 = v120;
                }
                if (v123)
                {
                  uint64_t v124 = v18;
                  do
                  {
                    v12 += *(_WORD *)(v124 + v15);
                    v124 += 2;
                    --v123;
                  }
                  while (v123);
                }
                uint64_t v125 = v18 + 40 * v13 + 2 * v120;
                unsigned int v126 = *(unsigned __int16 *)(v125 + 2);
                uint64_t v127 = *(void *)(a3 + 16);
                uint64_t v128 = (unsigned __int16)(v126 + v12);
                int v129 = *(unsigned __int8 *)(v127 + v128);
                if (*(unsigned __int16 *)(v125 + 4) < 2u)
                {
                  if (v129 == 151 || v129 == 133) {
                    goto LABEL_291;
                  }
                  char v130 = 0;
                  if (v129 == 46)
                  {
                    uint64_t v131 = v18 + 40 * v13;
                    int v134 = *(_DWORD *)(v131 + 24);
                    uint64_t v132 = (int *)(v131 + 24);
                    int v133 = v134;
                    if ((v134 & 0x60000000) != 0)
                    {
                      BOOL v135 = v126 != 1 || (*(_DWORD *)(v18 + 40 * v13 + 28) & 0x60000000) == 0;
                      if (!v135
                        && *(_WORD *)(v18 + 40 * v13 + 2 * v120 + 6) == 1
                        && *(unsigned __int16 *)(v18 + 40 * v13 + 18) >= 4u
                        && *(unsigned char *)(v12 + v127 + 3) == 46)
                      {
                        if (v70)
                        {
                          int v70 = 1;
                          uint64_t v4 = a2;
                        }
                        else
                        {
                          uint64_t v4 = a2;
                          if ((v72 & 0x400000) != 0)
                          {
                            *uint64_t v132 = *(_DWORD *)(v6 + 200) | v133;
                            int v70 = 1;
                          }
                          else
                          {
                            int v70 = 0;
                          }
                        }
                        *(_DWORD *)unint64_t v20 = v72 & 0xFFE7FFFF | 0x80000;
LABEL_289:
                        BOOL v47 = 1;
                        if (v46)
                        {
LABEL_294:
                          uint64_t v164 = v18 + 40 * v13;
                          int v165 = (_WORD *)(v164 + 32);
                          *(_WORD *)(v164 + 2 * *(unsigned __int16 *)(v164 + 32)) += *(_WORD *)(v164
                                                                                                + 2
                                                                                                * *(unsigned __int16 *)(v164 + 32)
                                                                                                + 2);
                          unint64_t v166 = *(unsigned __int16 *)(v164 + 32);
                          __int16 v168 = *(_WORD *)(v164 + 18);
                          uint64_t v167 = (unsigned __int16 *)(v164 + 18);
                          unsigned __int16 v169 = v168 - 1;
                          if (v166 < (unsigned __int16)(v168 - 1))
                          {
                            do
                            {
                              *(_WORD *)(v18 + v15 + 2 * v166) = *(_WORD *)(v18 + v16 + 2 * v166);
                              ++v166;
                              unsigned __int16 v169 = *v167 - 1;
                            }
                            while (v166 < v169);
                            LOWORD(v166) = *v165;
                          }
                          *uint64_t v167 = v169;
                          *int v165 = v166 - 1;
                          --*(_WORD *)(v18 + 40 * v13 + 34);
                        }
LABEL_298:
                        if (v47)
                        {
                          unsigned __int16 v12 = *v19;
                          uint64_t v170 = v18 + 40 * v13;
                          unsigned int v173 = *(unsigned __int16 *)(v170 + 32);
                          uint64_t v171 = (_WORD *)(v170 + 32);
                          unint64_t v172 = v173;
                          uint64_t v174 = v173 + 1;
                          int v175 = (unsigned __int16)(v173 + 1);
                          if ((_WORD)v173 != 0xFFFF)
                          {
                            unint64_t v176 = (v175 - 1);
                            if (v176 >= 7) {
                              unint64_t v176 = 7;
                            }
                            unint64_t v177 = ~v176;
                            uint64_t v178 = v18;
                            do
                            {
                              v12 += *(_WORD *)(v178 + v15);
                              v178 += 2;
                              BOOL v10 = __CFADD__(v177++, 1);
                            }
                            while (!v10);
                          }
                          uint64_t v179 = v18 + 40 * v13;
                          *(_WORD *)(v179 + 2 + 2 * v172) += *(_WORD *)(v179 + 2 + 2 * v172 + 4)
                                                                           + *(_WORD *)(v179 + 2 + 2 * v174);
                          __int16 v181 = *(_WORD *)(v179 + 18);
                          int v180 = (unsigned __int16 *)(v179 + 18);
                          LOWORD(v172) = *v171 + 1;
                          unsigned __int16 v182 = v181 - 2;
                          if ((unsigned __int16)v172 < (unsigned __int16)(v181 - 2))
                          {
                            unint64_t v172 = (unsigned __int16)v172;
                            do
                            {
                              *(_WORD *)(v18 + v15 + 2 * v172) = *(_WORD *)(v18 + v17 + 2 * v172);
                              ++v172;
                              unsigned __int16 v182 = *v180 - 2;
                            }
                            while (v172 < v182);
                          }
                          uint64_t v183 = v18 + 40 * v13;
                          *(_WORD *)(v183 + 34) -= 2;
                          *int v180 = v182;
                          *(void *)(v183 + 24) = *(_DWORD *)(v207
                                                             + 4 * *(unsigned __int8 *)(*(void *)(a3 + 16) + v12)) | (*(_DWORD *)(v183 + 28) | *(_DWORD *)(v183 + 24));
                        }
                        if (v70)
                        {
                          uint64_t v184 = v18 + 40 * v13;
                          int v185 = (_WORD *)(v184 + 2 * *(unsigned __int16 *)(v184 + 34));
                          *v185 += v185[1];
                          unint64_t v186 = *(unsigned __int16 *)(v184 + 34);
                          __int16 v188 = *(_WORD *)(v184 + 18);
                          uint64_t v187 = (unsigned __int16 *)(v184 + 18);
                          unsigned __int16 v189 = v188 - 1;
                          if (v186 < (unsigned __int16)(v188 - 1))
                          {
                            do
                            {
                              *(_WORD *)(v18 + v15 + 2 * v186) = *(_WORD *)(v18 + v16 + 2 * v186);
                              ++v186;
                              unsigned __int16 v189 = *v187 - 1;
                            }
                            while (v186 < v189);
                          }
                          *uint64_t v187 = v189;
                        }
                        goto LABEL_313;
                      }
                    }
                    char v130 = 1;
                  }
                }
                else
                {
                  if ((v129 - 45) < 2) {
                    goto LABEL_291;
                  }
                  if (v129 == 133) {
                    goto LABEL_291;
                  }
                  char v130 = 0;
                  if (v129 == 151) {
                    goto LABEL_291;
                  }
                }
                uint64_t v149 = v18 + 40 * v13;
                if ((*(unsigned char *)(v149 + 27) & 0x60) != 0)
                {
                  if (v126 >= 2)
                  {
                    uint64_t v199 = v16;
                    int v194 = v70;
                    int v150 = v46;
                    uint64_t v151 = v19;
                    uint64_t result = PRpendTermIsDot(a1, a2, a3, v12, (unsigned __int16)(v126 + v12), 0, 0, v210, (BOOL *)&v209);
                    if (result) {
                      return result;
                    }
                    a3 = v203;
                    uint64_t v6 = v204;
                    uint64_t v5 = v206;
                    uint64_t v19 = v151;
                    int v46 = v150;
                    uint64_t v16 = v199;
                    uint64_t v149 = v18 + 40 * v13;
                    int v70 = v194;
                    if (!v210[0]) {
                      goto LABEL_268;
                    }
                  }
                }
                else if (*(_WORD *)(v18 + 40 * v13 + 2 * v120 + 6) == 1)
                {
                  char v152 = (*(unsigned char *)(v18 + 40 * v13 + 31) & 0x60) != 0 ? v130 : 0;
                  if ((v152 & 1) != 0
                    || (*(unsigned __int8 *)(v128 + v127 + 1) == 186 ? (char v153 = v130) : (char v153 = 0), (v153 & 1) != 0))
                  {
LABEL_268:
                    BOOL v47 = 1;
                    goto LABEL_292;
                  }
                }
                if ((*(unsigned char *)(v18 + 40 * v13 + 31) & 0x60) != 0
                  && (uint64_t v154 = *v121, v155 = *(unsigned __int16 *)(v18 + 40 * v13 + 2 * v154 + 6), v155 >= 2))
                {
                  uint64_t v202 = v149;
                  int v195 = v70;
                  int v156 = v46;
                  unsigned __int16 v12 = *(_WORD *)(v18 + 40 * v13 + 2 * v154 + 4) + v128;
                  int v191 = v19;
                  uint64_t result = PRpendTermIsDot(a1, a2, a3, v12, (unsigned __int16)(v12 + v155), 0, 0, v210, (BOOL *)&v209);
                  BOOL v47 = v210[0] == 0;
                  if (result) {
                    return result;
                  }
                  a3 = v203;
                  uint64_t v6 = v204;
                  uint64_t v5 = v206;
                  uint64_t v19 = v191;
                  int v46 = v156;
                  int v70 = v195;
                  uint64_t v149 = v202;
                  if (!v210[0]) {
                    goto LABEL_292;
                  }
                }
                else
                {
                  BOOL v47 = 0;
                }
                if (*(unsigned char *)(a2 + 20) != 7 || (BOOL v47 = 0, (*(unsigned char *)(v149 + 27) & 0x60) != 0) || v129 != 58)
                {
LABEL_292:
                  uint64_t v4 = a2;
LABEL_293:
                  if (v46) {
                    goto LABEL_294;
                  }
                  goto LABEL_298;
                }
                uint64_t v157 = *v121;
                if (*(_WORD *)(v18 + 40 * v13 + 2 * v157 + 6) == 1)
                {
                  unsigned __int16 v12 = *v19;
                  LOWORD(v157) = v157 + 2;
                  if ((v157 & 0xFFF8) != 0) {
                    uint64_t v157 = 8;
                  }
                  else {
                    uint64_t v157 = (unsigned __int16)v157;
                  }
                  uint64_t v4 = a2;
                  if (v157)
                  {
                    uint64_t v158 = v18;
                    do
                    {
                      v12 += *(_WORD *)(v158 + v15);
                      v158 += 2;
                      --v157;
                    }
                    while (v157);
                  }
                  unsigned __int8 v159 = *(unsigned char *)(*(void *)(a3 + 16) + v12) - 65;
                  unsigned int v160 = ((v159 >> 2) | (v159 << 6));
                  BOOL v161 = v160 > 9;
                  int v162 = (1 << v160) & 0x303;
                  if (v161 || v162 == 0)
                  {
                    BOOL v47 = 0;
                    if (v46) {
                      goto LABEL_294;
                    }
                    goto LABEL_298;
                  }
                  goto LABEL_289;
                }
LABEL_291:
                BOOL v47 = 0;
                goto LABEL_292;
              }
              v210[0] = 0;
              LOBYTE(v209) = 0;
              unsigned __int16 v88 = *v19;
              if (v85 >= 8) {
                uint64_t v89 = 8;
              }
              else {
                uint64_t v89 = v85;
              }
              unsigned __int16 v12 = *v19;
              if (v89)
              {
                uint64_t v90 = v18;
                unsigned __int16 v12 = *v19;
                do
                {
                  v12 += *(_WORD *)(v90 + v15);
                  v90 += 2;
                  --v89;
                }
                while (v89);
              }
              if (*(unsigned __int16 *)(v18 + 40 * v13 + 34) >= 8u) {
                uint64_t v91 = 8;
              }
              else {
                uint64_t v91 = *(unsigned __int16 *)(v18 + 40 * v13 + 34);
              }
              if (v91)
              {
                uint64_t v92 = v18;
                do
                {
                  v88 += *(_WORD *)(v92 + v15);
                  v92 += 2;
                  --v91;
                }
                while (v91);
              }
              if (v88
                && (*(_DWORD *)(v207 + 4 * *(unsigned __int8 *)(*(void *)(a3 + 16) + v88 - 1)) & 0x8000000) != 0)
              {
                int v70 = 0;
                goto LABEL_150;
              }
              if (v12 > v88) {
                goto LABEL_150;
              }
              int v193 = v70;
              char v197 = v48;
              int v201 = v47;
              int v93 = v46;
              int v190 = v19;
              uint64_t result = PRpendTermIsDot(a1, v4, a3, v12, v88, 1, 0, v210, (BOOL *)&v209);
              if (result) {
                return result;
              }
              unsigned int v94 = *(_DWORD *)v20;
              if (v210[0])
              {
                a3 = v203;
                if ((v94 & 0x2000000) != 0)
                {
                  v94 &= ~0x2000000u;
                  *(_DWORD *)unint64_t v20 = v94;
                  int v201 = 1;
                }
                uint64_t v6 = v204;
                uint64_t v19 = v190;
                int v46 = v93;
                int v70 = v193;
                char v48 = v197;
                uint64_t v4 = a2;
                uint64_t v5 = v206;
                if ((_BYTE)v209)
                {
                  BOOL v47 = v201;
                  if (*(unsigned char *)(a2 + 20) == 6 && (*v75 & 0x20) != 0)
                  {
                    unsigned int v72 = v94 | 0x100000;
                    *(_DWORD *)unint64_t v20 = v94 | 0x100000;
                    if (*(unsigned __int16 *)(v203 + 50) - 1 != v13) {
                      int v70 = 1;
                    }
                  }
                  else
                  {
                    unsigned int v72 = v94 | 0x80000;
                    *(_DWORD *)unint64_t v20 = v94 | 0x80000;
                    int v70 = 1;
                  }
LABEL_150:
                  if (!v70) {
                    goto LABEL_155;
                  }
                  goto LABEL_151;
                }
                unsigned int v72 = v94 | 0x200000;
                *(_DWORD *)unint64_t v20 = v94 | 0x200000;
LABEL_149:
                BOOL v47 = v201;
                goto LABEL_150;
              }
              unsigned int v72 = v94 | 0x100000;
              *(_DWORD *)unint64_t v20 = v94 | 0x100000;
              a3 = v203;
              int v95 = *(unsigned __int16 *)(v203 + 50);
              if (v95 - 1 == v13)
              {
                uint64_t v6 = v204;
                uint64_t v19 = v190;
                uint64_t v4 = a2;
                uint64_t v5 = v206;
                int v46 = v93;
                int v70 = v193;
                char v48 = v197;
                goto LABEL_149;
              }
              uint64_t v5 = v206;
              int v96 = *(unsigned __int8 *)(a2 + 20);
              uint64_t v6 = v204;
              uint64_t v19 = v190;
              int v46 = v93;
              char v48 = v197;
              if (v96 == 5 && v95 - 2 == v13)
              {
                uint64_t v97 = *(void *)(v203 + 40);
                uint64_t v98 = (unsigned __int16 *)(v97 + 40 * (v13 + 1));
                if (v98[9] != 1
                  || *(unsigned __int16 *)(v97 + 40 * (v13 + 1) + 2) > 2u
                  || (int v99 = *(unsigned __int8 *)(*(void *)(v203 + 16) + *v98), v99 != 62) && v99 != 187)
                {
LABEL_148:
                  int v70 = 1;
                  uint64_t v4 = a2;
                  goto LABEL_149;
                }
              }
              else
              {
                if (v96 != 6) {
                  goto LABEL_148;
                }
                BOOL v100 = PRisRoman((unsigned __int8 *)(*(void *)(v203 + 16) + v12));
                char v48 = v197;
                int v46 = v93;
                uint64_t v19 = v190;
                a3 = v203;
                uint64_t v6 = v204;
                uint64_t v5 = v206;
                if (!v100) {
                  goto LABEL_148;
                }
              }
              uint64_t v4 = a2;
              int v70 = v193;
              goto LABEL_149;
            }
            char v208 = *(unsigned char *)(v18 + 40 * v13 + 38);
            if ((v208 & 8) != 0) {
              goto LABEL_67;
            }
          }
LABEL_75:
          int v70 = 0;
          goto LABEL_76;
        }
        int v46 = 1;
        uint64_t v6 = v204;
      }
      uint64_t v4 = v66;
      BOOL v47 = 0;
      goto LABEL_47;
    }
  }
  return 0;
}

uint64_t PRssPost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  if (*(unsigned __int16 *)(a3 + 56) >= 0x40u) {
    int v5 = 64;
  }
  else {
    int v5 = *(unsigned __int16 *)(a3 + 56);
  }
  if (*(_WORD *)(a3 + 56)) {
    int v6 = v5 + 1;
  }
  else {
    int v6 = 0;
  }
  if (*(_WORD *)(a3 + 50))
  {
    uint64_t v7 = 0;
    unsigned __int16 v8 = 0;
    uint64_t v9 = *(void *)(a3 + 40);
    BOOL v10 = (unsigned __int16 *)(v9 + 2);
    do
    {
      int v11 = *(unsigned __int16 *)(v9 + 40 * v7 + 18);
      if (*(_WORD *)(v9 + 40 * v7 + 18))
      {
        uint64_t v12 = *(unsigned __int16 *)(v9 + 40 * v7 + 18);
        unint64_t v13 = v10;
        do
        {
          unsigned int v15 = *v13++;
          int v14 = v15;
          if (v15 >= 0x40) {
            int v14 = 64;
          }
          v6 += 2 * v14;
          --v12;
        }
        while (v12);
      }
      int v16 = v6 + 2 * v11;
      if (*(unsigned __int16 *)(v9 + 40 * v7 + 36) >= 0x40u) {
        int v17 = 64;
      }
      else {
        int v17 = *(unsigned __int16 *)(v9 + 40 * v7 + 36);
      }
      if (*(_WORD *)(v9 + 40 * v7 + 36)) {
        int v18 = v17 + 1;
      }
      else {
        int v18 = 0;
      }
      int v6 = v16 + v18;
      v8 += v11;
      ++v7;
      v10 += 20;
    }
    while (v7 != *(unsigned __int16 *)(a3 + 50));
  }
  else
  {
    unsigned __int16 v8 = 0;
  }
  uint64_t v19 = *(void *)(a2 + 64);
  uint64_t v20 = *(void *)(a2 + 8);
  uint64_t v83 = *(void *)(a1 + 16);
  if ((_WORD)v6)
  {
    uint64_t v21 = (char *)malloc_type_malloc((unsigned __int16)v6, 0xAAAA0DE5uLL);
    if (!v21) {
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  if (v8)
  {
    int v22 = (char *)malloc_type_calloc(v8, 0xB8uLL, 0x10B00409DE433CAuLL);
    if (!v22)
    {
LABEL_36:
      uint64_t v32 = *(void *)(a1 + 32);
      *(void *)uint64_t v32 = 0xDC00000078;
      *(_WORD *)(v32 + 8) = 980;
      return 220;
    }
    int v23 = v22;
    uint64_t v24 = 0;
    unint64_t v25 = 0;
    uint64_t v26 = v83;
    do
    {
      __int16 v27 = &v22[v24];
      *(_WORD *)&v22[v24] = v25;
      if (v24)
      {
        *((void *)v27 + 21) = v27 - 184;
        *((void *)v27 + 9) = v27 - 184;
      }
      if (v25 < (unsigned __int16)(v8 - 1))
      {
        int v28 = &v22[v24];
        uint64_t v29 = (uint64_t)&v22[v24 + 184];
        *((void *)v28 + 22) = v29;
        *((void *)v28 + 10) = v29;
      }
      *(void *)&v22[v24 + 152] = v27;
      v24 += 184;
      ++v25;
    }
    while (184 * v8 != v24);
    unsigned __int16 v82 = v8;
    LOWORD(v30) = 0;
    *(void *)(v83 + 72) = 0;
    unsigned int v31 = (uint64_t *)(v83 + 72);
    *(void *)(v83 + 56) = v22;
    *(void *)(v83 + 64) = v22;
    *(void *)(v83 + 80) = &v22[184 * v8 - 184];
  }
  else
  {
    unsigned __int16 v82 = v8;
    int v23 = 0;
    LOWORD(v30) = *(_WORD *)(v3 + 56);
    uint64_t v26 = v83;
    *(void *)(v83 + 72) = 0;
    unsigned int v31 = (uint64_t *)(v83 + 72);
    *(void *)(v83 + 56) = 0;
    *(void *)(v83 + 64) = 0;
  }
  unsigned int v34 = *(unsigned __int16 *)(v3 + 56);
  if (*(_WORD *)(v3 + 56))
  {
    uint64_t v35 = *(char **)(v3 + 16);
    *(void *)(v26 + 24) = v21;
    if (v34 >= 0x41)
    {
      *(_WORD *)(v26 + 32) = v34 - 64;
      unsigned int v34 = 64;
    }
    ++v21;
    do
    {
      char v36 = *v35++;
      *(v21 - 1) = v36;
      --v34;
      ++v21;
    }
    while ((_WORD)v34);
    *(v21 - 1) = 0;
  }
  unsigned int v37 = *(unsigned __int16 *)(v3 + 50);
  if (!*(_WORD *)(v3 + 50)) {
    goto LABEL_125;
  }
  unint64_t v38 = 0;
  uint64_t v84 = v19 + 16;
  uint64_t v39 = (uint64_t)v23;
  int v87 = v31;
  unsigned __int16 v88 = v23;
  uint64_t v86 = v3;
  do
  {
    uint64_t v40 = *(void *)(v3 + 40);
    uint64_t v41 = (unsigned __int16 *)(v40 + 40 * v38);
    uint64_t v30 = *v41;
    int v43 = v41[9];
    unsigned int v42 = v41 + 9;
    if (!v43) {
      goto LABEL_124;
    }
    unint64_t v44 = 0;
    int v45 = 0;
    int v46 = (char *)(*(void *)(v3 + 16) + v30);
    uint64_t v47 = v40 + 40 * v38;
    char v48 = (unsigned __int16 *)(v47 + 32);
    int v93 = (__int16 *)(v47 + 36);
    unsigned int v94 = (char *)(v47 + 38);
    uint64_t v49 = (int *)(v47 + 24);
    int v50 = (int *)(v47 + 28);
    uint64_t v91 = *(void *)(v3 + 40);
    unint64_t v92 = v38;
    uint64_t v89 = (int *)(v47 + 28);
    uint64_t v90 = (int *)(v47 + 24);
    do
    {
      *(_WORD *)(v39 + 8) = v30;
      uint64_t v51 = v40 + 40 * v38 + 2 * v44;
      unsigned int v54 = *(unsigned __int16 *)(v51 + 2);
      unint64_t v52 = (__int16 *)(v51 + 2);
      unsigned int v53 = v54;
      if (v54 >= 0x40) {
        uint64_t v55 = 64;
      }
      else {
        uint64_t v55 = v53;
      }
      *(_WORD *)(v39 + 32) = v55;
      int v56 = *v52;
      __int16 v57 = v56 - 64;
      if (v56 < 64) {
        __int16 v57 = 0;
      }
      *(_WORD *)(v39 + 34) = v57;
      uint64_t v58 = (uint64_t)&v21[v55 + 1];
      *(void *)(v39 + 16) = v21;
      *(void *)(v39 + 24) = v58;
      if (v55)
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          *(unsigned char *)(*(void *)(v39 + 24) + i) = v46[i];
          uint64_t v60 = v46[i];
          if ((*(_DWORD *)(v20 + 4 * v60) & 0x40000000) != 0) {
            LOBYTE(v60) = v60 + 32;
          }
          *(unsigned char *)(*(void *)(v39 + 16) + i) = v60;
        }
        uint64_t v58 = *(void *)(v39 + 24);
        v46 += i;
      }
      *(unsigned char *)(v58 + v55) = 0;
      *(unsigned char *)(*(void *)(v39 + 16) + v55) = 0;
      uint64_t v61 = *(unsigned __int16 *)(v39 + 34);
      if (!*v31 && v44 == *v48) {
        *unsigned int v31 = v39;
      }
      LODWORD(v30) = v56 + v30;
      v46 += v61;
      if (*v42 - 1 == v45 && (int v62 = *v93) != 0)
      {
        unsigned int v63 = 0;
        *(void *)(v39 + 40) = &v21[2 * v55 + 2];
        LODWORD(v30) = v62 + v30;
        __int16 v64 = v62;
        if ((v62 & 0xFFC0) != 0) {
          __int16 v64 = 64;
        }
        *(_WORD *)(v39 + 48) = v64;
        BOOL v65 = __OFSUB__(v62, 64);
        int v66 = v62 - 64;
        if (v66 < 0 != v65) {
          LOWORD(v66) = 0;
        }
        *(_WORD *)(v39 + 36) = v66;
        v21 += 2 * v55 + 3;
        do
        {
          char v67 = *v46++;
          *(v21 - 1) = v67;
          ++v63;
          ++v21;
        }
        while (v63 < *(unsigned __int16 *)(v39 + 48));
        *(v21 - 1) = 0;
      }
      else
      {
        v21 += 2 * v55 + 2;
      }
      if ((_DWORD *)v39 == v23 && *(unsigned char *)(v86 + 62))
      {
        v23[1] = 16;
        *unsigned int v31 = 0;
        char v72 = 5;
LABEL_116:
        *(unsigned char *)(v39 + 51) = v72;
        goto LABEL_117;
      }
      uint64_t v68 = *v48;
      if (*v94 < 0 && v44 == v68 && *v52 != 2)
      {
        *(_DWORD *)(v39 + 4) = 268435457;
        int v71 = 268435457;
      }
      else if (v44 == v68 && (int v69 = *v49, (*v49 & 0x1000000) != 0) && (*v49 & 0x68000000) != 0 {
             || v68 + 2 == v45 && (*v50 & 0x1000000) != 0 && (int v69 = *v50, (*v50 & 0x68000000) != 0))
      }
      {
        if ((v69 & 0x60000000) == 0)
        {
          int v71 = 8;
LABEL_108:
          *(_DWORD *)(v39 + 4) = v71;
          goto LABEL_109;
        }
        unsigned int v70 = *(unsigned __int16 *)(v39 + 32);
        if (v70 == 2)
        {
          if (*(unsigned char *)(*(void *)(v39 + 16) + 1) == 46) {
            int v71 = 0x10000;
          }
          else {
            int v71 = 256;
          }
          goto LABEL_108;
        }
        int v71 = 256;
        *(_DWORD *)(v39 + 4) = 256;
        if (v70 >= 4)
        {
          char v74 = *(unsigned char **)(v39 + 16);
          unsigned int v75 = *v74;
          if (*v74)
          {
            unsigned int v76 = (unsigned __int16)(v70 - 1);
            uint64_t v77 = *(void *)(v39 + 16);
            while ((*(_DWORD *)(v84 + 4 * v75) & 0x20000000) != 0 && *(unsigned char *)(v77 + 1) == 46)
            {
              uint64_t v78 = 2;
              if (*(unsigned char *)(v77 + 2) == 45 && v76 > (unsigned __int16)(v77 + 2 - (_WORD)v74)) {
                uint64_t v78 = 3;
              }
              unsigned int v75 = *(unsigned __int8 *)(v77 + v78);
              if (*(unsigned char *)(v77 + 2) == 45 && v76 > (unsigned __int16)(v77 + 2 - (_WORD)v74)) {
                v77 += 3;
              }
              else {
                v77 += 2;
              }
              if (!v75) {
                goto LABEL_105;
              }
            }
          }
          else
          {
LABEL_105:
            *(_DWORD *)(v39 + 92) = 8;
          }
          int v71 = 256;
        }
      }
      else
      {
        if (*(void *)(v39 + 40)) {
          unsigned int v73 = 0;
        }
        else {
          unsigned int v73 = *v46;
        }
        int v71 = PRtoktyp(*(unsigned __int8 *)(a2 + 20), v39, 0, *(unsigned __int8 *)(a2 + 26), v73);
        *(_DWORD *)(v39 + 4) = v71;
        unsigned int v31 = v87;
        int v23 = v88;
        uint64_t v40 = v91;
        unint64_t v38 = v92;
        int v50 = v89;
        uint64_t v49 = v90;
      }
LABEL_109:
      char v72 = 5;
      if (v71 < 0 || v71 == 16) {
        goto LABEL_116;
      }
      uint64_t v79 = *v48;
      if (v44 == v79 && (*((unsigned char *)v49 + 3) & 0x40) != 0
        || v79 + 2 == v45 && (*((unsigned char *)v50 + 3) & 0x40) != 0)
      {
        char v80 = SLcap(*(void *)(v39 + 24), 0, (__int16)(v55 - 1), (void *)(v39 + 52), v20);
        int v50 = v89;
        uint64_t v49 = v90;
        uint64_t v40 = v91;
        unint64_t v38 = v92;
        unsigned int v31 = v87;
        int v23 = v88;
        char v72 = v80;
        goto LABEL_116;
      }
LABEL_117:
      if ((*((unsigned char *)v49 + 1) & 0x40) != 0 && v44 == *v48 || (*((unsigned char *)v50 + 1) & 0x40) != 0 && *v48 + 2 == v45) {
        *(unsigned char *)(v39 + 50) = 1;
      }
      uint64_t v39 = *(void *)(v39 + 80);
      int v45 = ++v44;
    }
    while (v44 < *v42);
    uint64_t v3 = v86;
    unsigned int v37 = *(unsigned __int16 *)(v86 + 50);
LABEL_124:
    ++v38;
  }
  while (v38 < v37);
LABEL_125:
  *(_WORD *)(v83 + 18) = v82;
  if (!*(unsigned char *)(v3 + 59)) {
    LOWORD(v30) = v30 - *(_WORD *)(*(void *)(v3 + 40) + 40 * v37 - 4);
  }
  *(_WORD *)(v83 + 20) = v30;
  *(unsigned char *)(v83 + 4) = *(unsigned char *)(v3 + 64);
  *(unsigned char *)(v83 + 6) = *(unsigned char *)(v3 + 61);
  int v81 = *(unsigned __int8 *)(v3 + 58);
  *(unsigned char *)(v83 + 8) = v81;
  *(unsigned char *)(v83 + 10) = *(unsigned char *)(v3 + 60);
  if (!*(unsigned char *)(v3 + 63) || v81 || *(unsigned char *)(v83 + 9))
  {
    *(unsigned char *)(v83 + 2) = 1;
    *(_WORD *)(v83 + 14) = v82;
    *(_WORD *)(v83 + 16) = v30;
    *(void *)(v83 + 64) = 0;
    *(void *)(v83 + 72) = 0;
  }
  else
  {
    *(unsigned char *)(v83 + 2) = 2;
    *(_DWORD *)(v83 + 14) = 0;
  }
  uint64_t result = 0;
  *(void *)(v83 + 40) = *(void *)(v3 + 32);
  return result;
}

unsigned __int16 *PRisListEnum(unsigned __int16 *result, uint64_t a2, char *a3)
{
  *a3 = 0;
  unsigned int v4 = result[9];
  if (v4 == 1)
  {
    unsigned int v5 = result[1];
    if (v5 <= 2)
    {
      int v6 = *(unsigned __int8 *)(*(void *)(a2 + 16) + *result);
      if (v5 == 1)
      {
        int v7 = 0;
        if (*(unsigned __int8 *)(*(void *)(a2 + 16) + *result) <= 0x6Eu)
        {
          switch(*(unsigned char *)(*(void *)(a2 + 16) + *result))
          {
            case '*':
              int v7 = 4;
              goto LABEL_10;
            case '+':
              int v7 = 2;
              goto LABEL_10;
            case ',':
              goto LABEL_12;
            case '-':
              int v7 = 7;
              goto LABEL_10;
            case '.':
              int v7 = 5;
              goto LABEL_10;
            default:
              if (v6 != 61) {
                goto LABEL_12;
              }
              int v7 = 1;
              break;
          }
          goto LABEL_10;
        }
        if (*(unsigned __int8 *)(*(void *)(a2 + 16) + *result) <= 0x96u)
        {
          if (v6 == 111)
          {
            int v7 = 3;
          }
          else
          {
            if (v6 != 126) {
              goto LABEL_12;
            }
            int v7 = 6;
          }
          goto LABEL_10;
        }
        if (v6 != 151)
        {
          if (v6 != 183) {
            goto LABEL_12;
          }
          int v7 = 9;
          goto LABEL_10;
        }
LABEL_9:
        int v7 = 8;
LABEL_10:
        *a3 = v7;
LABEL_12:
        unsigned int v4 = result[9];
        goto LABEL_13;
      }
      if (v6 == 45) {
        goto LABEL_9;
      }
    }
    int v7 = 0;
    goto LABEL_12;
  }
  int v7 = 0;
LABEL_13:
  if (v4 == 2 && result[1] == 1 && result[2] == 1)
  {
    uint64_t v8 = *(void *)(a2 + 16);
    uint64_t v9 = *result;
    if (*(unsigned char *)(v8 + v9) == 45 && *(unsigned char *)(v9 + v8 + 1) == 45)
    {
      *a3 = 8;
      return result;
    }
  }
  if (!v7)
  {
    if (!v4)
    {
      uint64_t v14 = 0;
LABEL_26:
      unsigned int v15 = (const char *)(*(void *)(a2 + 16) + *result);
      char v16 = v15[v14];
      v15[v14] = 0;
      uint64_t result = (unsigned __int16 *)SLlisten(v15);
      if (result == 1)
      {
        char v17 = 10;
      }
      else
      {
        if (result != 2)
        {
LABEL_31:
          v15[v14] = v16;
          return result;
        }
        char v17 = 11;
      }
      *a3 = v17;
      goto LABEL_31;
    }
    unsigned __int16 v10 = 0;
    uint64_t v11 = v4;
    uint64_t v12 = (__int16 *)(result + 1);
    do
    {
      __int16 v13 = *v12++;
      v10 += v13;
      --v11;
    }
    while (v11);
    if (v4 <= 0xA)
    {
      uint64_t v14 = v10;
      goto LABEL_26;
    }
  }
  return result;
}

uint64_t PRgermScan(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v8 = a1;
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v9 = *(void *)(a3 + 40);
  unsigned int v10 = *(unsigned __int16 *)(a4 + 10);
  unsigned int v11 = v10 - 1;
  uint64_t v15 = v9 + 40 * (int)(v10 - 1);
  unsigned int v12 = *(unsigned __int16 *)(a3 + 50);
  unsigned int v13 = v12 - 1;
  unsigned __int16 v14 = *(_WORD *)v15;
  LODWORD(v15) = *(unsigned __int16 *)(v15 + 34);
  if (v15 >= 8) {
    uint64_t v15 = 8;
  }
  else {
    uint64_t v15 = v15;
  }
  unsigned __int16 v16 = v14;
  if (v15)
  {
    char v17 = (__int16 *)(v9 + 40 * *(unsigned __int16 *)(a4 + 10) - 38);
    unsigned __int16 v16 = v14;
    do
    {
      __int16 v18 = *v17++;
      v16 += v18;
      --v15;
    }
    while (v15);
  }
  if (*(unsigned char *)(a4 + 8) != 46 || *(_WORD *)(a4 + 6) != 1)
  {
    if (*(unsigned __int16 *)(a4 + 4) == v16 && !*(_WORD *)(v9 + 40 * (int)v13 + 32)
      || (*(unsigned char *)(v9 + 40 * (int)v13 + 38) & 0x40) != 0)
    {
      goto LABEL_44;
    }
    goto LABEL_28;
  }
  int v19 = *(unsigned __int16 *)(a4 + 4);
  if (v19 != v16) {
    goto LABEL_44;
  }
  int v20 = *(char *)(v9 + 40 * (int)v11 + 38);
  if (v20 < 0) {
    goto LABEL_62;
  }
  if ((*(unsigned char *)(v9 + 40 * (int)v13 + 38) & 0x40) != 0)
  {
LABEL_44:
    uint64_t result = 0;
    *a5 = 1;
    *(_WORD *)(a3 + 50) = *(_WORD *)(a4 + 10);
    return result;
  }
  if (v16 < 2u) {
    goto LABEL_62;
  }
  uint64_t v21 = *(void *)(a2 + 8);
  uint64_t v22 = *(void *)(a3 + 16);
  if ((*(_DWORD *)(v21 + 4 * *(unsigned __int8 *)(v22 + (v19 - 1))) & 0x60000040) != 0)
  {
    uint64_t v23 = *(unsigned __int8 *)(v22 + (v19 - 2));
    if (v23 == 46 || (*(_DWORD *)(v21 + 4 * v23) & 0x2000000) != 0) {
      goto LABEL_62;
    }
  }
  int v24 = *(_DWORD *)(v9 + 40 * (int)v11 + 28);
  if (v24)
  {
    if ((v24 & 0x61100200) != 0)
    {
      unsigned int v58 = *(unsigned __int16 *)(v9 + 40 * (int)v11 + 32);
      if ((((_WORD)v58 + 2) & 0xFFF8) != 0) {
        uint64_t v25 = 8;
      }
      else {
        uint64_t v25 = (unsigned __int16)(v58 + 2);
      }
      uint64_t v60 = a1;
      uint64_t v61 = a2;
      char v59 = *(unsigned char *)(v9 + 40 * (int)v11 + 38);
      if (v25)
      {
        uint64_t v26 = (__int16 *)(v9 + 40 * *(unsigned __int16 *)(a4 + 10) - 38);
        unsigned __int16 v27 = v14;
        do
        {
          __int16 v28 = *v26++;
          v27 += v28;
          --v25;
        }
        while (v25);
        goto LABEL_61;
      }
LABEL_60:
      unsigned __int16 v27 = v14;
      goto LABEL_61;
    }
LABEL_62:
    uint64_t result = 0;
    *a5 = 0;
    *(unsigned char *)(a4 + 2) = 0;
    return result;
  }
  uint64_t v44 = v9 + 40 * (int)v11;
  uint64_t v45 = *(unsigned __int16 *)(v44 + 32);
  int v46 = *(unsigned __int16 *)(v44 + 2 * v45 + 2);
  int v47 = *(_DWORD *)(v44 + 24);
  BOOL v48 = (v47 & 0x60000000) != 0 && v46 == 1;
  int v49 = v47 & 0x61100200;
  if (v48 || v49 == 0) {
    goto LABEL_62;
  }
  unsigned int v58 = v45;
  if (v45 >= 8) {
    uint64_t v51 = 8;
  }
  else {
    uint64_t v51 = v45;
  }
  uint64_t v60 = a1;
  uint64_t v61 = a2;
  char v59 = v20;
  if (!v51) {
    goto LABEL_60;
  }
  unint64_t v52 = (__int16 *)(v9 + 40 * *(unsigned __int16 *)(a4 + 10) - 38);
  unsigned __int16 v27 = v14;
  do
  {
    __int16 v53 = *v52++;
    v27 += v53;
    --v51;
  }
  while (v51);
LABEL_61:
  BOOL v54 = PRisRoman((unsigned __int8 *)(v22 + v27));
  uint64_t v8 = v60;
  a2 = v61;
  if (v54) {
    goto LABEL_62;
  }
  if (v58 >= 8) {
    uint64_t v55 = 8;
  }
  else {
    uint64_t v55 = v58;
  }
  if (v55)
  {
    int v56 = (__int16 *)(v9 + 40 * v10 - 38);
    do
    {
      __int16 v57 = *v56++;
      v14 += v57;
      --v55;
    }
    while (v55);
  }
  if ((v59 & 0x20) != 0) {
    goto LABEL_28;
  }
  BOOL v62 = 0;
  uint64_t result = PRpendTermIsDot(v60, v61, a3, v14, v16, 1, 0, &v63, &v62);
  if (!result)
  {
    a2 = v61;
    uint64_t v8 = v60;
    if (!v62) {
      goto LABEL_44;
    }
LABEL_28:
    uint64_t v29 = *(unsigned __int16 *)(v9 + 40 * (int)v13);
    if (*(unsigned __int16 *)(v9 + 40 * (int)v13 + 18) >= 8u) {
      uint64_t v30 = 8;
    }
    else {
      uint64_t v30 = *(unsigned __int16 *)(v9 + 40 * (int)v13 + 18);
    }
    unsigned __int16 v31 = *(_WORD *)(v9 + 40 * (int)v13);
    if (v30)
    {
      uint64_t v32 = (__int16 *)(v9 + 40 * v12 - 38);
      unsigned __int16 v31 = *(_WORD *)(v9 + 40 * (int)v13);
      do
      {
        __int16 v33 = *v32++;
        v31 += v33;
        --v30;
      }
      while (v30);
    }
    LODWORD(v34) = (__int16)(v31 - v29);
    if ((int)v34 <= 64)
    {
      size_t v35 = *(void *)(a2 + 128);
      if (v29 == v31)
      {
        uint64_t v34 = (unsigned __int16)(v31 - v29);
      }
      else
      {
        uint64_t v36 = *(void *)(a2 + 8);
        uint64_t v34 = (unsigned __int16)v34;
        unsigned int v37 = (unsigned __int8 *)(*(void *)(a3 + 16) + v29);
        unint64_t v38 = __s;
        uint64_t v39 = (unsigned __int16)v34;
        do
        {
          unsigned int v41 = *v37++;
          char v40 = v41;
          char v42 = v41 + 32;
          if ((*(_DWORD *)(v36 + 4 * v41) & 0x40000000) != 0) {
            char v40 = v42;
          }
          *v38++ = v40;
          --v39;
        }
        while (v39);
      }
      __s[v34] = 0;
      *(unsigned char *)(v35 + 1412) = 0;
      *(_DWORD *)(v35 + 1408) = 1;
      if (PRIcs(v8, a2, 0, 0, 0, __s, 0, v35, 3, 0) == 8) {
        return 220;
      }
      if ((*(void *)(v35 + 1328) & 0x400) != 0) {
        goto LABEL_62;
      }
    }
    goto LABEL_44;
  }
  return result;
}

BOOL PRisDutchOpenCompound(uint64_t a1, uint64_t a2, unsigned __int16 *a3)
{
  unsigned __int16 v3 = a3[16];
  if (a3[9] < (unsigned __int16)(v3 + 3)) {
    return 0;
  }
  unsigned __int16 v4 = *a3;
  LOWORD(v5) = v3 - 1;
  uint64_t v5 = (v5 & 0xFFF8) != 0 ? 8 : (unsigned __int16)v5;
  if (v5)
  {
    int v6 = (__int16 *)(a3 + 1);
    do
    {
      __int16 v7 = *v6++;
      v4 += v7;
      --v5;
    }
    while (v5);
  }
  uint64_t v8 = (unsigned __int8 *)(*(void *)(a2 + 16) + v4);
  return (*(_DWORD *)(a1 + 4 * *v8 + 16) & 0x8000) != 0
      && v8[1] == 115
      && (*(_DWORD *)(a1 + 4 * v8[2] + 16) & 0x4000) != 0
      && (*(_DWORD *)(a1 + 4 * v8[3] + 16) & 0x40000000) != 0;
}

uint64_t PRpendTermIsDot(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, int a6, unsigned __int8 a7, unsigned __int16 *a8, BOOL *a9)
{
  __int16 v12 = a4;
  size_t v14 = *(void *)(a2 + 128);
  uint64_t v15 = *(void *)(a3 + 16);
  char v16 = *(unsigned char *)(v15 + a5);
  *(unsigned char *)(v15 + a5) = 0;
  *(unsigned char *)(v14 + 1412) = a6;
  *(_DWORD *)(v14 + 1408) = a7;
  int v17 = PRIcs(a1, a2, 0, 0, 0, (char *)(*(void *)(a3 + 16) + a4), 0, v14, 3, 0);
  *(unsigned char *)(*(void *)(a3 + 16) + a5) = v16;
  if (v17 == 8) {
    return 220;
  }
  if ((v17 & 0xFFFFFFF7) == 2)
  {
    unsigned __int16 v19 = strlen((const char *)(v14 + 1547));
    *a8 = v19;
    BOOL v20 = a6
       && v19
       && *(unsigned char *)(v14 + v19 - 1 + 1547) == 46
       && (v19 > (unsigned __int16)(a5 - v12) || *(unsigned char *)(v14 + 1614));
  }
  else
  {
    BOOL v20 = 0;
    *a8 = 0;
  }
  uint64_t result = 0;
  *a9 = v20;
  return result;
}

BOOL PRisRoman(unsigned __int8 *a1)
{
  uint64_t v1 = 0;
  while (1)
  {
    unsigned int v2 = *a1;
    if (v2 > 0x55)
    {
      if (v2 == 86)
      {
        unsigned __int16 v3 = (unsigned __int8 *)&romanFsa + 3 * v1 + 1;
      }
      else
      {
        if (v2 != 88) {
          return 0;
        }
        unsigned __int16 v3 = (unsigned __int8 *)&romanFsa + 3 * v1 + 2;
      }
      goto LABEL_9;
    }
    if (v2 != 73) {
      break;
    }
    unsigned __int16 v3 = (unsigned __int8 *)&romanFsa + 3 * v1;
LABEL_9:
    uint64_t v1 = *v3;
    ++a1;
    if (!v1) {
      return 0;
    }
  }
  return v2 == 46 && v1 != 0;
}

uint64_t PRssClr(uint64_t a1)
{
  if (!a1) {
    return 220;
  }
  unsigned int v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 24) = 0;
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4)
    {
      uint64_t v5 = *(void **)(v4 + 16);
      if (v5) {
        free(v5);
      }
    }
  }
  if (*(void *)(a1 + 56)) {
    FreeList((void **)(a1 + 56));
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    free((void *)result);
    uint64_t result = 0;
    *(void *)(a1 + 40) = 0;
  }
  return result;
}

uint64_t PRSSWdGet(const char *a1, unsigned int a2, char *a3, uint64_t a4)
{
  int v24 = 0;
  *a3 = 0;
  uint64_t v4 = *(unsigned __int16 **)(a4 + 64);
  if (v4)
  {
    uint64_t v8 = *((void *)v4 + 1);
    signed int v9 = *v4;
    int v10 = *((_DWORD *)v4 + 1);
    unsigned int v11 = v4[1];
    __int16 v12 = strlen(a1);
    SLfun((uint64_t)a1, 0, (__int16)(v12 - 1), (unsigned __int16 *)&v24 + 1, &v24);
    unsigned __int16 v13 = 0;
    int v14 = (unsigned __int16)(v10 & HIWORD(v24));
    signed int v15 = (unsigned __int16)v24 % v9;
    int v16 = 2 * v14;
    int v17 = v14 + (v10 >> 1) + v9;
    while (1)
    {
      uint64_t v18 = 3 * v15;
      int v19 = *(unsigned __int8 *)(v8 + (int)v18 + 1) | (*(unsigned __int8 *)(v8 + v18) << 8);
      if (v19 == HIWORD(v24)) {
        break;
      }
      v15 += v17;
      do
        v15 -= v9;
      while (v15 >= v9);
      if (v11 >= v13)
      {
        ++v13;
        v17 += v16;
        if (v19) {
          continue;
        }
      }
      return 0;
    }
    char v20 = *(unsigned char *)((int)v18 + v8 + 2);
    *a3 = v20;
    if (a2 >= 3)
    {
      if (a2 != 3) {
        return 0;
      }
      BOOL v21 = (v20 & 4) == 0;
    }
    else
    {
      char v20 = *a3;
      BOOL v21 = (*a3 & 3u) > a2;
    }
    char v22 = v20 & 0xF8;
    if (v21) {
      char v22 = 0;
    }
    *a3 = v22;
  }
  return 0;
}

uint64_t PRtoktyp(unsigned int a1, uint64_t a2, unsigned __int8 *a3, int a4, unsigned int a5)
{
  uint64_t v10 = SLLngToA(a1);
  if (a2) {
    a3 = *(unsigned __int8 **)(a2 + 24);
  }
  int v11 = strlen((const char *)a3);
  uint64_t result = (unsigned __int16)v11;
  switch((__int16)v11)
  {
    case 0:
      return result;
    case 1:
      unsigned __int16 v13 = a3;
      if (a2) {
        unsigned __int16 v13 = *(unsigned __int8 **)(a2 + 24);
      }
      uint64_t v14 = *v13;
      int v15 = *(_DWORD *)(v10 + 4 * v14);
      if ((v15 & 0x20000000) != 0) {
        return 0x4000;
      }
      if ((v15 & 0x40000000) != 0) {
        return 4096;
      }
      if (a2 && v14 == 45)
      {
        uint64_t result = 2147483656;
        if ((*(_DWORD *)(v10 + 4 * a5) & 0x60000040) == 0)
        {
          uint64_t v16 = *(void *)(a2 + 72);
          if (!v16
            || *(void *)(v16 + 40)
            || (*(_DWORD *)(v10
                          + 4 * *(unsigned __int8 *)(*(void *)(v16 + 16) + *(unsigned __int16 *)(v16 + 32) - 1)) & 0x60000040) == 0)
          {
            return 2147483652;
          }
        }
        return result;
      }
      __int16 v24 = 0;
      unsigned __int8 v25 = 0;
      __int16 v26 = 40;
      unsigned __int8 v27 = 40;
      while (2)
      {
        if (OneByteTokenType_PunTab[2 * v25] == v14)
        {
          uint64_t v29 = &OneByteTokenType_PunTab[2 * v25];
        }
        else
        {
          if (OneByteTokenType_PunTab[2 * v27] != v14)
          {
            int v28 = (unsigned __int16)(v24 + v26) >> 1;
            if (OneByteTokenType_PunTab[2 * v28] >= v14) {
              unsigned __int8 v27 = v28;
            }
            else {
              unsigned __int8 v25 = v28 + 1;
            }
            __int16 v24 = v25;
            __int16 v26 = v27;
            if (v25 == v27)
            {
              uint64_t result = v15 & 0x200;
              goto LABEL_72;
            }
            continue;
          }
          uint64_t v29 = &OneByteTokenType_PunTab[2 * v27];
        }
        break;
      }
      uint64_t result = v29[1];
LABEL_72:
      if (!result)
      {
        unsigned int v17 = *a3;
        goto LABEL_74;
      }
      return result;
    case 2:
      unsigned int v17 = *a3;
      if (v17 > 0x3B)
      {
        if (v17 == 60)
        {
          if (a3[1] != 60)
          {
            unsigned int v17 = 60;
            goto LABEL_75;
          }
          return 3221225536;
        }
        else
        {
          if (v17 != 62) {
            goto LABEL_74;
          }
          if (a3[1] != 62)
          {
            unsigned int v17 = 62;
            goto LABEL_75;
          }
          return 3758096448;
        }
      }
      else
      {
        if (v17 != 45)
        {
          if (v17 != 46) {
            goto LABEL_74;
          }
          if (a1 == 10 && a3[1] == 46) {
            return 2147484160;
          }
          goto LABEL_75;
        }
        if (a3[1] != 45)
        {
          unsigned int v17 = 45;
          goto LABEL_75;
        }
        return 2147483904;
      }
    case 3:
      unsigned int v17 = *a3;
      if (v17 != 46) {
        goto LABEL_32;
      }
      if (a3[1] == 46 && a3[2] == 46) {
        return 2147484160;
      }
      unsigned int v17 = 46;
      goto LABEL_32;
    default:
      unsigned int v17 = *a3;
LABEL_32:
      int v18 = v11 << 16;
      if (v18 <= 196608) {
        goto LABEL_74;
      }
      if (v18 == 327680 && v17 == 46)
      {
        if (a3[2] == 46 && a3[4] == 46 && a3[1] == 32 && a3[3] == 32) {
          return 2147484160;
        }
      }
      else if (v17 - 45 > 1)
      {
        goto LABEL_74;
      }
      int v19 = a3[1];
      if (!a3[1]) {
        return 2147485696;
      }
      if (v19 == 32)
      {
        char v20 = a3 + 3;
        while (v19 == 32)
        {
          if (*(v20 - 1) != v17) {
            goto LABEL_74;
          }
          int v21 = *v20;
          v20 += 2;
          int v19 = v21;
        }
        if (!v19) {
          return 2147485696;
        }
      }
      else
      {
        char v22 = a3 + 2;
        while (v17 == v19)
        {
          int v23 = *v22++;
          int v19 = v23;
          if (!v23) {
            return 2147485696;
          }
        }
      }
LABEL_74:
      if (!v17) {
        return 32;
      }
LABEL_75:
      uint64_t v30 = a3 + 1;
      unsigned int v31 = v17;
      while ((*(_DWORD *)(v10 + 4 * v31) & 0x8000000) != 0)
      {
        unsigned int v32 = *v30++;
        unsigned int v31 = v32;
        if (!v32) {
          return 32;
        }
      }
      __int16 v33 = a3 + 1;
      unsigned int v34 = v17;
      while ((*(_DWORD *)(v10 + 4 * v34) & 0x40000000) != 0)
      {
        unsigned int v35 = *v33++;
        unsigned int v34 = v35;
        if (!v35) {
          return 0x2000;
        }
      }
      uint64_t v36 = a3 + 1;
      char v37 = 1;
      unsigned int v38 = v17;
      do
      {
        char v39 = v37;
        if ((*(_DWORD *)(v10 + 4 * v38) & 0x200) == 0)
        {
          int v46 = a3 + 1;
          int v47 = 1;
          while (1)
          {
            if (v17 != a4)
            {
              int v48 = *(_DWORD *)(v10 + 4 * v17);
              if ((v48 & 0x60000040) == 0)
              {
                if ((v48 & 0x68000000) != 0)
                {
                  int v47 = 0;
                }
                else if ((v48 & 0x1000000) == 0)
                {
                  return 0;
                }
              }
            }
            unsigned int v49 = *v46++;
            unsigned int v17 = v49;
            if (!v49)
            {
              BOOL v43 = v47 == 0;
              unsigned int v44 = 128;
              unsigned int v45 = 64;
              goto LABEL_100;
            }
          }
        }
        unsigned int v41 = *v36++;
        unsigned int v40 = v41;
        if (v38 != v41 && v40 != 0) {
          char v37 = 0;
        }
        unsigned int v38 = v40;
      }
      while (v40);
      BOOL v43 = v39 == 0;
      unsigned int v44 = 2048;
      unsigned int v45 = 1024;
LABEL_100:
      if (v43) {
        return v45;
      }
      else {
        return v44;
      }
  }
}

void FreeList(void **a1)
{
  unsigned int v2 = *a1;
  unsigned __int16 v3 = v2;
  if (v2)
  {
    do
    {
      unsigned int v2 = (void *)v2[22];
      FreeTokenNode((uint64_t *)&v3);
      unsigned __int16 v3 = v2;
    }
    while (v2);
    if (*a1) {
      free(*a1);
    }
  }
  *a1 = 0;
}

void FreeTokenNode(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unsigned __int16 v3 = *(void **)(*a1 + 144);
  if (v3)
  {
    if (((*(_DWORD *)(v2 + 92) >> 17) & 1) + *(_WORD *)(v2 + 136))
    {
      uint64_t v4 = 0;
      uint64_t v5 = 8 * (unsigned __int16)(((*(_DWORD *)(v2 + 92) >> 17) & 1) + *(_WORD *)(v2 + 136));
      do
      {
        int v6 = *(void **)(*(void *)(v2 + 144) + v4);
        if (v6) {
          free(v6);
        }
        v4 += 8;
      }
      while (v5 != v4);
      unsigned __int16 v3 = *(void **)(v2 + 144);
    }
    free(v3);
  }
  __int16 v7 = *(void **)(v2 + 104);
  if (v7) {
    free(v7);
  }
  uint64_t v8 = *(void **)(v2 + 112);
  if (v8) {
    free(v8);
  }
  signed int v9 = *(void **)(v2 + 128);
  if (v9) {
    free(v9);
  }
  uint64_t v10 = *(void **)(v2 + 160);
  if (v10)
  {
    do
    {
      int v11 = (void *)v10[5];
      PRfreeErr(v10);
      *(void *)(v2 + 160) = v11;
      uint64_t v10 = v11;
    }
    while (v11);
  }
  if (*(void *)(v2 + 152) != v2) {
    free((void *)v2);
  }
  *a1 = 0;
}

uint64_t PRFillError(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8 = *(void *)(a2 + 128);
  int v9 = *(unsigned __int16 *)(v8 + 1322);
  unint64_t v10 = *(void *)(v8 + 1328);
  int v11 = *(_DWORD *)(v8 + 4);
  if (*(unsigned char *)(v8 + 1690)) {
    BOOL v12 = v11 == 2;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12) {
    unsigned int v13 = (v10 >> 10) & 1;
  }
  else {
    unsigned int v13 = 0;
  }
  if ((v13 & 1) == 0 && *(unsigned char *)(v8 + 1690)) {
    unsigned int v13 = *(unsigned __int16 *)(v8 + 1686);
  }
  int v14 = *(unsigned __int8 *)(v8 + 8);
  if (((a4 != 0) & ((unsigned __int16)(v9 & 0x800) >> 11)) != 0) {
    int v15 = v10 & 0xFFFFFBFF;
  }
  else {
    int v15 = *(void *)(v8 + 1328);
  }
  if ((v10 & 0x400) != 0) {
    int v16 = v15;
  }
  else {
    int v16 = *(void *)(v8 + 1328);
  }
  if ((v16 & 0x8000) != 0 && v11 != 11)
  {
    if (v14 == 6
      && (uint64_t v17 = *(void *)(a3 + 72)) != 0
      && *(unsigned __int8 *)(a3 + 51) != *(unsigned __int8 *)(v17 + 51))
    {
      *(void *)(v8 + 1328) = v10 & 0xFFFFFFFFFFFF7FFFLL;
    }
    else if (PRMakenFillErr(a1, a2, v8, a3, "", 0, 4u, 1, a4))
    {
      return 8;
    }
  }
  unsigned int v48 = v13;
  if ((v16 & 0x1000000) != 0)
  {
    if (v11 == 2) {
      int v18 = 6;
    }
    else {
      int v18 = 4;
    }
    if (PRMakenFillErr(a1, a2, v8, a3, "", 0, 1u, v18, a4)) {
      return 8;
    }
  }
  else
  {
    int v18 = 0;
  }
  if ((v16 & 0x40000) != 0 && PRMakenFillErr(a1, a2, v8, a3, "", 0, 0x34u, 100, a4)) {
    return 8;
  }
  int v19 = v16 & 0x10000000;
  if (v14 != 16 || v19 == 0)
  {
    if (v14 != 15 || v19 == 0)
    {
      if (v14 != 4) {
        goto LABEL_53;
      }
      if (v16 == 0x4000000)
      {
        int v22 = PRMakenFillErr(a1, a2, v8, a3, "", 0, 7u, 5, a4);
      }
      else
      {
        if (v16 != 0x8000000) {
          goto LABEL_53;
        }
        int v22 = PRMakenFillErr(a1, a2, v8, a3, "", 0, 7u, 4, a4);
      }
    }
    else
    {
      int v24 = *(unsigned __int16 *)(v8 + 1404);
      if ((v24 - 1) > 0x1B) {
        goto LABEL_53;
      }
      int v22 = PRMakenFillErr(a1, a2, v8, a3, *((char **)&pGreekErrors + 2 * (v24 - 1) + 1), *((unsigned __int8 *)&pGreekErrors + 16 * (v24 - 1) + 1), 6u, *((unsigned __int8 *)&pGreekErrors + 16 * (v24 - 1)), a4);
    }
  }
  else
  {
    int v23 = *(unsigned __int16 *)(v8 + 1404);
    if (v23 == 30)
    {
      int v22 = PRMakenFillErr(a1, a2, v8, a3, "", 0, 6u, 2, a4);
    }
    else
    {
      if (v23 != 29) {
        goto LABEL_53;
      }
      int v22 = PRMakenFillErr(a1, a2, v8, a3, "", 0, 6u, 1, a4);
    }
  }
  if (v22) {
    return 8;
  }
LABEL_53:
  uint64_t v46 = a1;
  int v47 = v9;
  if ((v9 & 0x100) != 0)
  {
    if (v14 == 16)
    {
      __int16 v26 = *(char **)(a3 + 16);
      unsigned __int8 v27 = strchr(v26, 45);
      if (v27)
      {
        int v28 = v27;
        if (v27 > v26 + 1 && *(v27 - 1) == 121 && *(v27 - 2) == 108)
        {
          *unsigned __int8 v27 = 32;
          uint64_t v29 = PRMakenFillErr(v46, a2, v8, a3, *(char **)(a3 + 16), 1uLL, 0x3Cu, 46, a4);
          *int v28 = 45;
          if (v29) {
            return v29;
          }
        }
      }
    }
    else if (PRMakenFillErr(a1, a2, v8, a3, "", 0, 7u, 2, a4))
    {
      return 8;
    }
  }
  uint64_t v25 = v46;
  if (v16 & 8 | v47 & 0x10)
  {
    if ((v47 & 0x40) != 0)
    {
      if ((v47 & 4) != 0)
      {
        int v18 = 2;
      }
      else if ((v47 & 2) != 0)
      {
        int v18 = 4;
      }
      else if (!v18)
      {
        goto LABEL_75;
      }
    }
    else if ((v47 & 0x10) != 0)
    {
      int v18 = 3;
    }
    else
    {
      int v18 = 1;
    }
    if (PRMakenFillErr(v46, a2, v8, a3, "", 0, 2u, v18, a4)) {
      return 8;
    }
  }
LABEL_75:
  if ((v16 & 2) != 0)
  {
    if ((v14 & 0xFE) == 8)
    {
      *(_WORD *)(a3 + 98) &= 0xF0FFu;
      int v30 = PRMakenFillErr(v46, a2, v8, a3, "", 0, 1u, 1, a4);
    }
    else
    {
      int v30 = PRMakenFillErr(v46, a2, v8, a3, "", 0, 0xAu, 1, a4);
    }
    if (v30) {
      return 8;
    }
    if (v14 == 8) {
      v16 &= ~0x400u;
    }
  }
  if ((v16 & 1) != 0 && PRMakenFillErr(v46, a2, v8, a3, "", 0, 9u, 1, a4)) {
    return 8;
  }
  if (v11 == 11)
  {
    if ((v16 & 0x20) != 0) {
      int v33 = PRMakenFillErr(v46, a2, v8, a3, "", 0, 1u, 3, a4);
    }
    else {
      int v33 = PRMakenFillErr(v46, a2, v8, a3, "", 0, 1u, 1, a4);
    }
    if (v33) {
      return 8;
    }
    return 0;
  }
  if (v11 == 3)
  {
    int v31 = 128;
    for (uint64_t i = &byte_20CC66B24;
          (v31 & v16) == 0
       || !PRMakenFillErr(v46, a2, v8, a3, "", 0, *i, i[1], a4);
          i += 8)
    {
      int v31 = *((_DWORD *)i + 1);
      if (!v31) {
        return 0;
      }
    }
    return 8;
  }
  if (v11 != 2) {
    return 0;
  }
  if (v14 == 16 && (v16 & 0x4000) != 0)
  {
    if (!PRMakenFillErr(v46, a2, v8, a3, (char *)(v8 + 1690), v48, 0x33u, 4, a4))
    {
LABEL_131:
      int v41 = 4;
      char v42 = &byte_20CC66B44;
      while ((v41 & v16) == 0
           || !PRMakenFillErr(v25, a2, v8, a3, (char *)(v8 + 1690), v48, *v42, v42[1], a4))
      {
        int v41 = *((_DWORD *)v42 + 1);
        v42 += 8;
        if (!v41) {
          goto LABEL_135;
        }
      }
      return 8;
    }
    return 8;
  }
  if (v14 != 6)
  {
LABEL_130:
    uint64_t v25 = v46;
    if (v16) {
      goto LABEL_131;
    }
LABEL_135:
    if (v47)
    {
      int v43 = 512;
      for (int j = &word_20CC66B84;
            (v43 & v47) == 0
         || !PRMakenFillErr(v25, a2, v8, a3, (char *)(v8 + 1690), v48, *((unsigned __int8 *)j - 2), *((unsigned __int8 *)j - 1), a4);
            j += 2)
      {
        int v45 = (unsigned __int16)*j;
        int v43 = v45;
        if (!v45) {
          return 0;
        }
      }
      return 8;
    }
    return 0;
  }
  if ((v16 & 0x400000) != 0 && PRMakenFillErr(v46, a2, v8, a3, (char *)(v8 + 1690), v48, 0x33u, 3, a4)) {
    return 8;
  }
  if ((v16 & 0x400) == 0 || !a4 || (v47 & 0x400) == 0) {
    goto LABEL_125;
  }
  uint64_t v35 = *(void *)(v46 + 16);
  uint64_t v36 = *(unsigned __int16 **)(v35 + 64);
  v16 &= ~0x400u;
  if (!v36) {
    uint64_t v36 = *(unsigned __int16 **)(v35 + 56);
  }
  char v37 = *(unsigned __int16 **)(a3 + 72);
  if (!v37) {
    goto LABEL_125;
  }
  int v38 = *((_DWORD *)v37 + 1);
  if (v38 <= -1072693249)
  {
    if (v38 == -2147483584) {
      goto LABEL_125;
    }
    int v39 = -1073709056;
  }
  else
  {
    if (v38 == -1072693248 || v38 == -536870910) {
      goto LABEL_125;
    }
    int v39 = -536870848;
  }
  if (v38 != v39)
  {
    while ((*((_DWORD *)v37 + 1) & 0x80000000) != 0)
    {
      char v37 = (unsigned __int16 *)*((void *)v37 + 9);
      if (!v37) {
        goto LABEL_124;
      }
    }
    if (!v36 || *v37 < *v36)
    {
LABEL_124:
      uint64_t v25 = v46;
      goto LABEL_125;
    }
    uint64_t v25 = v46;
    if (PRMakenFillErr(v46, a2, v8, a3, (char *)(v8 + 1690), v48, 3u, 3, a4)) {
      return 8;
    }
  }
LABEL_125:
  if ((v47 & 1) == 0) {
    goto LABEL_130;
  }
  int v40 = v48 <= 1 ? 1 : 2;
  uint64_t v29 = 8;
  if (!PRMakenFillErr(v25, a2, v8, a3, (char *)(v8 + 1690), v48, 8u, v40, a4)) {
    goto LABEL_130;
  }
  return v29;
}

uint64_t PRMakenFillErr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, size_t a6, unsigned int a7, int a8, char a9)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (!*(void *)(a4 + 16)) {
    return 8;
  }
  int v17 = *(unsigned __int8 *)(a2 + 26);
  *(void *)int v45 = 0;
  if (a9)
  {
    int v18 = PRliveRule(a1, a2, 0, a7, a8, 0, 1);
    if (v18)
    {
      if (v18 == 4) {
        return 0;
      }
      else {
        return 8;
      }
    }
    if (PRmkErr(a1, a2, v45, a4, 0, a7, a8)) {
      return 8;
    }
    if (a7 == 5 && (a8 & 0xFE) == 2)
    {
      if (a8 == 2)
      {
        __int16 v27 = *(_WORD *)(*(void *)(a4 + 72) + 8);
        __int16 v28 = *(_WORD *)(a4 + 32) - v27 + *(_WORD *)(a4 + 8);
      }
      else
      {
        __int16 v27 = *(_WORD *)(a4 + 8);
        __int16 v28 = *(_WORD *)(*(void *)(a4 + 80) + 32) - v27 + *(_WORD *)(*(void *)(a4 + 80) + 8);
      }
      goto LABEL_26;
    }
    if (a7 == 6)
    {
      uint64_t v29 = *(void *)(a4 + 72);
      __int16 v27 = *(_WORD *)(v29 + 8);
      __int16 v28 = *(_WORD *)(v29 + 32);
LABEL_26:
      int v22 = *(_WORD **)v45;
      **(_WORD **)int v45 = v27;
      v22[1] = v28;
LABEL_27:
      switch(a7)
      {
        case 1u:
          if ((a8 & 0xFFFFFFFB) == 2) {
            goto LABEL_45;
          }
          if (a8 != 5) {
            goto LABEL_80;
          }
          goto LABEL_34;
        case 2u:
          switch(a8)
          {
            case 1:
              __strcpy_chk();
              int v31 = 0;
              do
              {
                unsigned __int16 v32 = v31;
                int v33 = v46[(unsigned __int16)v31++];
                if (v33) {
                  BOOL v34 = v33 == v17;
                }
                else {
                  BOOL v34 = 1;
                }
              }
              while (!v34);
              goto LABEL_95;
            case 2:
              __strcpy_chk();
              unsigned __int16 v41 = v46[0];
              if (v46[0])
              {
                uint64_t v42 = 0;
                unsigned __int16 v41 = 0;
                do
                {
                  if (*(unsigned __int8 *)(*(void *)(a4 + 16) + v42) == v17) {
                    break;
                  }
                  uint64_t v42 = ++v41;
                }
                while (v46[v41]);
              }
              PRinsOneHyp(v46, (_DWORD *)(a3 + 3156), v17, v41);
              if (PRaddAlts(a1, *(uint64_t *)v45, v46, 0, 1uLL, 0)) {
                return 8;
              }
              __strcpy_chk();
              unsigned __int16 v32 = v46[0];
              if (!v46[0]) {
                goto LABEL_95;
              }
              uint64_t v43 = 0;
              unsigned __int16 v44 = 0;
              while (*(unsigned __int8 *)(*(void *)(a4 + 16) + v43) != v17)
              {
                uint64_t v43 = ++v44;
                unsigned __int16 v32 = v44;
                if (!v46[v44]) {
                  goto LABEL_95;
                }
              }
              goto LABEL_102;
            case 3:
              __strcpy_chk();
              unsigned __int16 v32 = *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 3184) + 288) + 18);
              goto LABEL_95;
            case 4:
              __strcpy_chk();
              if (PRaddAlts(a1, *(uint64_t *)v45, v46, 0, 1uLL, 0)) {
                return 8;
              }
              __strcpy_chk();
              unsigned __int16 v32 = v46[0];
              if (!v46[0]) {
                goto LABEL_95;
              }
              unsigned __int16 v44 = 0;
              break;
            default:
              return 8;
          }
          break;
        case 3u:
          if (a8 == 3)
          {
            int v30 = *(char **)(a4 + 16);
          }
          else
          {
            if (a8 != 1) {
              goto LABEL_80;
            }
LABEL_45:
            __strcpy_chk();
            __strcat_chk();
LABEL_52:
            __strcat_chk();
            int v22 = *(_WORD **)v45;
            int v30 = v47;
          }
          goto LABEL_76;
        case 4u:
        case 5u:
        case 7u:
        case 8u:
          goto LABEL_11;
        case 6u:
          int v35 = *(unsigned __int8 *)(a3 + 8);
          if (v35 == 16)
          {
            v46[0] = 97;
            if (a8 == 1)
            {
              v46[2] = 0;
              char v36 = 110;
            }
            else
            {
              char v36 = 0;
            }
            v46[1] = v36;
            if (a9 && *(unsigned char *)(*(void *)(a4 + 72) + 51)) {
              v46[0] = 65;
            }
            int v30 = v46;
LABEL_76:
            uint64_t v39 = a1;
            size_t v40 = 1;
          }
          else
          {
            if (!a6 || v35 != 15) {
              goto LABEL_80;
            }
            uint64_t v39 = a1;
            int v30 = a5;
            size_t v40 = a6;
          }
          if (!PRaddAlts(v39, (uint64_t)v22, v30, 0, v40, 0)) {
            goto LABEL_80;
          }
          return 8;
        case 9u:
          if (a8 == 1) {
            goto LABEL_60;
          }
          if (a8 != 2) {
            goto LABEL_80;
          }
          __strcpy_chk();
          goto LABEL_52;
        case 0xAu:
          if (a8 == 3)
          {
            __strcpy_chk();
            __strcat_chk();
            if (PRaddAlts(a1, *(uint64_t *)v45, v47, 0, 1uLL, 0)) {
              return 8;
            }
            goto LABEL_69;
          }
          if (a8 != 2) {
            goto LABEL_57;
          }
          __strcpy_chk();
          __strcat_chk();
          __strcat_chk();
          if (PRaddAlts(a1, *(uint64_t *)v45, v47, 0, 1uLL, 0)) {
            return 8;
          }
          goto LABEL_58;
        default:
          if (a7 != 51) {
            goto LABEL_11;
          }
          if (a8 == 1) {
            goto LABEL_45;
          }
          if ((a8 - 3) > 1u) {
            goto LABEL_80;
          }
LABEL_34:
          int v30 = (char *)(a3 + 1690);
          goto LABEL_76;
      }
      while (((*(_DWORD *)(a3 + 1640 + 4 * (v44 >> 5)) >> ~(_BYTE)v44) & 1) == 0)
      {
        unsigned __int16 v32 = ++v44;
        if (!v46[v44]) {
          goto LABEL_95;
        }
      }
LABEL_102:
      unsigned __int16 v32 = v44;
LABEL_95:
      PRinsOneHyp(v46, (_DWORD *)(a3 + 1640), v17, v32);
      int v22 = *(_WORD **)v45;
      uint64_t v25 = v46;
      uint64_t v24 = a1;
      size_t v26 = 1;
LABEL_13:
      if (!PRaddAlts(v24, (uint64_t)v22, v25, 0, v26, 0)) {
        goto LABEL_14;
      }
      return 8;
    }
  }
  else if (PRmkErr(a1, a2, v45, a4, 0, a7, a8))
  {
    return 8;
  }
  __int16 v20 = *(_WORD *)(a4 + 32);
  __int16 v21 = *(_WORD *)(a4 + 8);
  int v22 = *(_WORD **)v45;
  **(_WORD **)int v45 = v21;
  v22[1] = v20;
  if (a7 != 4 || !a9) {
    goto LABEL_27;
  }
  __int16 v23 = *(_WORD *)(*(void *)(a4 + 72) + 48);
  v22[4] = v21 - v23;
  v22[5] = v20 + v23;
LABEL_11:
  if (a6)
  {
    uint64_t v24 = a1;
    uint64_t v25 = a5;
    size_t v26 = a6;
    goto LABEL_13;
  }
LABEL_14:
  if (a7 == 10)
  {
LABEL_57:
    if ((a8 - 1) <= 1u)
    {
LABEL_58:
      __strcpy_chk();
      uint64_t result = PRaddRefs(a1, *(uint64_t *)v45, __s, 1u, 0);
      if (result) {
        return result;
      }
      __strcpy_chk();
      uint64_t v37 = *(void *)v45;
      int v38 = v47;
      goto LABEL_82;
    }
    if (a8 != 3) {
      goto LABEL_80;
    }
LABEL_69:
    __strcpy_chk();
    uint64_t result = PRaddRefs(a1, *(uint64_t *)v45, v47, 1u, 0);
    if (result) {
      return result;
    }
  }
  else
  {
    if (a7 != 9 || a8 != 1)
    {
LABEL_80:
      uint64_t v37 = *(void *)v45;
      int v38 = *(char **)(a4 + 24);
      if (!v38) {
        int v38 = *(char **)(a4 + 16);
      }
      goto LABEL_82;
    }
LABEL_60:
    __strcpy_chk();
    uint64_t result = PRaddRefs(a1, *(uint64_t *)v45, v47, 1u, 0);
    if (result) {
      return result;
    }
  }
  __strcpy_chk();
  uint64_t v37 = *(void *)v45;
  int v38 = __s;
LABEL_82:
  uint64_t result = PRaddRefs(a1, v37, v38, 1u, 0);
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t PRIcs(uint64_t a1, uint64_t a2, char a3, int a4, int a5, char *__s, uint64_t a7, size_t a8, __int16 a9, char a10)
{
  *(_WORD *)(a8 + 1322) = 0;
  *(void *)(a8 + 1328) = 0;
  if (a7) {
    int v14 = *(_DWORD *)(a7 + 92);
  }
  else {
    int v14 = 0;
  }
  *(unsigned char *)(a8 + 1338) = *(unsigned char *)(a2 + 26);
  *(_DWORD *)a8 = a9;
  if (a9 == 1)
  {
    *(unsigned char *)(a8 + 8) = a3;
    *(_DWORD *)(a8 + 20) = a4;
    *(_DWORD *)(a8 + 24) = a5;
    *(_DWORD *)(a8 + 1308) = 1;
    return (__int16)ICspl("", a8);
  }
  unsigned int v16 = *(unsigned __int8 *)(a8 + 8);
  BOOL v18 = (unsigned __int16)(a9 - 8) < 0xFFFDu && (a9 & 0xFFFFFFFC) != 100;
  uint64_t v19 = *(void *)(a8 + 3184);
  if (a7 || v18)
  {
    *(unsigned char *)(v19 + 304) = 11;
    if (a7) {
      *(_DWORD *)(a8 + 1408) = 0;
    }
  }
  else
  {
    *(unsigned char *)(v19 + 304) = 6;
  }
  if (a9 <= 0x16 && ((1 << a9) & 0x6000EC) != 0 || (a9 - 100) < 4)
  {
    if (a9 == 3)
    {
      __int16 v20 = strlen(__s);
      __int16 v21 = v20;
      if (a10)
      {
        uint64_t v22 = v20 - 1;
        if (__s[v22] == 46)
        {
          v14 |= 0x400000u;
          *(unsigned char *)(a8 + 1412) = 1;
          __s[v22] = 0;
        }
        else
        {
          v14 &= ~0x400000u;
        }
      }
    }
    else
    {
      __int16 v21 = 0;
    }
    __int16 v23 = ICspl(__s, a8);
    __int16 v24 = v23;
    if (a9 == 3 && (v14 & 0x400000) != 0)
    {
      uint64_t v25 = v21 - 1;
      __s[v25] = 46;
      *(unsigned char *)(a8 + 1412) = 0;
      int v26 = *(unsigned __int8 *)(a8 + v25 + 1547);
      if (v23 != 11 && v26 != 46) {
        v14 |= 0x800000u;
      }
    }
    if (!a7) {
      return v24;
    }
  }
  else
  {
    __int16 v24 = 220;
    if (!a7) {
      return v24;
    }
  }
  if (a9 != 3) {
    return v24;
  }
  uint64_t v28 = SLLngToA(*(unsigned __int8 *)(a2 + 20));
  uint64_t v29 = *(void *)(*(void *)(a8 + 3184) + 288);
  *(_WORD *)(a7 + 98) = *(_WORD *)v29;
  if (*(unsigned char *)(a8 + 1614)) {
    int v30 = v14 | 0x4000;
  }
  else {
    int v30 = v14;
  }
  if (*(unsigned char *)(a8 + 1624)) {
    v30 |= 0x8000u;
  }
  int v31 = *(unsigned __int16 *)(v29 + 12);
  int v32 = v30 | 0x10000;
  if ((v31 & 0xF) == 0) {
    int v32 = v30;
  }
  if (v24 != 11) {
    v32 |= (*(_DWORD *)(a8 + 1328) & 3) << 18;
  }
  int v66 = v32;
  int v33 = *(void **)(a7 + 104);
  if (v33)
  {
    free(v33);
    *(void *)(a7 + 104) = 0;
  }
  BOOL v34 = *(void **)(a7 + 112);
  if (v34)
  {
    free(v34);
    *(void *)(a7 + 112) = 0;
  }
  __int16 v35 = *(_WORD *)(v29 + 14);
  if ((v35 & 4) != 0) {
    *(_WORD *)(a7 + 98) |= 8u;
  }
  unsigned int v67 = v16;
  if ((v35 & 8) != 0) {
    *(_WORD *)(a7 + 98) |= 4u;
  }
  int v36 = *(unsigned __int8 *)(v29 + 18);
  if (*(unsigned char *)(v29 + 18))
  {
    size_t v37 = *(unsigned __int8 *)(v29 + 16);
    __int16 v38 = *(_WORD *)(a8 + 1612);
    uint64_t v39 = malloc_type_malloc(v37 + 1, 0x58569D36uLL);
    *(void *)(a7 + 104) = v39;
    if (!v39) {
      goto LABEL_103;
    }
    int v64 = v31;
    uint64_t v40 = (v38 - v36);
    unsigned __int16 v41 = malloc_type_malloc(v40 + 1, 0x842F0C45uLL);
    *(void *)(a7 + 112) = v41;
    if (!v41) {
      goto LABEL_103;
    }
    memcpy(*(void **)(a7 + 104), (const void *)(a8 + 1547), v37);
    *(unsigned char *)(*(void *)(a7 + 104) + v37) = 0;
    if (v37)
    {
      unsigned int v42 = 0;
      uint64_t v43 = *(unsigned __int8 **)(a7 + 104);
      do
      {
        uint64_t v44 = *v43;
        if ((*(_DWORD *)(v28 + 4 * v44) & 0x40000000) != 0) {
          LOBYTE(v44) = v44 + 32;
        }
        *v43++ = v44;
        ++v42;
      }
      while (v42 < v37);
    }
    memcpy(*(void **)(a7 + 112), (const void *)(a8 + *(unsigned __int8 *)(v29 + 18) + 1547), (v38 - v36));
    *(unsigned char *)(*(void *)(a7 + 112) + v40) = 0;
    int v31 = v64;
    if (v36 != v38)
    {
      int v45 = 0;
      uint64_t v46 = *(unsigned __int8 **)(a7 + 112);
      do
      {
        uint64_t v47 = *v46;
        if ((*(_DWORD *)(v28 + 4 * v47) & 0x40000000) != 0) {
          LOBYTE(v47) = v47 + 32;
        }
        *v46++ = v47;
        ++v45;
      }
      while (v45 < (v38 - v36));
    }
  }
  unsigned int v48 = v67;
  if (v67 != 5) {
    goto LABEL_85;
  }
  if ((*(_WORD *)(a7 + 98) & 0x3000) == 0x2000)
  {
    int v65 = v31;
    uint64_t v49 = *(void *)(a7 + 16);
    unsigned int v50 = *(unsigned __int16 *)(a7 + 32);
    TwoToOneChrCnv_pNewStr[0] = 0;
    TwoToOneChrCnv_pOeStr = 247;
    TwoToOneChrCnv_pAeStr = 230;
    if (v50)
    {
      int v51 = 0;
      int v52 = 0;
      while (1)
      {
        __int16 v53 = (unsigned __int8 *)(v49 + (unsigned __int16)v51);
        int v54 = *v53;
        if (v54 == 97)
        {
          if (v53[1] != 101) {
            goto LABEL_75;
          }
        }
        else if (v54 != 111 || v53[1] != 101)
        {
LABEL_75:
          uint64_t v55 = (__int16)v52++;
          TwoToOneChrCnv_pNewStr[v55] = v54;
          TwoToOneChrCnv_pNewStr[(__int16)v52] = 0;
          goto LABEL_76;
        }
        __strcat_chk();
        ++v51;
        ++v52;
LABEL_76:
        if (v50 <= (unsigned __int16)++v51) {
          goto LABEL_81;
        }
      }
    }
    LOWORD(v52) = 0;
LABEL_81:
    int v56 = (char *)malloc_type_calloc((__int16)v52 + 1, 1uLL, 0x100004077774924uLL);
    *(void *)(a7 + 128) = v56;
    unsigned int v48 = 5;
    if (v56)
    {
      strcpy(v56, TwoToOneChrCnv_pNewStr);
    }
    else
    {
      uint64_t v57 = *(void *)(a1 + 32);
      *(void *)uint64_t v57 = 0xDC00000078;
      *(_WORD *)(v57 + 8) = 841;
    }
    int v31 = v65;
LABEL_85:
    if (v48 > 0xC || ((1 << v48) & 0x1320) == 0) {
      goto LABEL_91;
    }
  }
  if ((*(_WORD *)(a7 + 98) & 4) == 0 || !SLstrcmp((unsigned char *)(v29 + 19), *(unsigned __int8 **)(a7 + 16))) {
    goto LABEL_91;
  }
  size_t v58 = strlen((const char *)(v29 + 19));
  char v59 = (char *)malloc_type_calloc(v58 + 1, 1uLL, 0x100004077774924uLL);
  *(void *)(a7 + 128) = v59;
  if (v59)
  {
    strcpy(v59, (const char *)(v29 + 19));
LABEL_91:
    unsigned int v60 = v66 | (v31 << 24) | (16 * *(_DWORD *)(a8 + 1328)) & 0x800 | (*(_DWORD *)(a8 + 1328) << 6) & 0x1000 | (*(_DWORD *)(a8 + 1328) << 18) & 0x200000;
    __int16 v61 = *(_WORD *)(a8 + 1322);
    if ((v61 & 0x100) != 0)
    {
      unsigned int v60 = v66 & 0xFFFC1FFF | (v31 << 24) | (16 * *(_DWORD *)(a8 + 1328)) & 0x800 | (*(_DWORD *)(a8 + 1328) << 6) & 0x1000 | (*(_DWORD *)(a8 + 1328) << 18) & 0x200000 | 0x2000;
      *(_WORD *)(a7 + 98) &= 0xF09Cu;
    }
    *(_DWORD *)(a7 + 92) = v60;
    if (v48 == 5)
    {
      if ((v61 & 0x20) != 0 && (*(_DWORD *)(v28 + 4 * *(unsigned __int8 *)(a8 + 1547)) & 0x10000000) == 0) {
        *(_DWORD *)(a7 + 92) = v60 & 0xF0FFFFFF;
      }
      if ((v61 & 0x100) != 0)
      {
        uint64_t v62 = *(unsigned __int8 *)(a8 + 1547);
        if ((v62 | 0x20) != 0x68 && (*(_DWORD *)(v28 + 4 * v62) & 0x10000000) == 0) {
          *(_DWORD *)(a7 + 92) = v60 & 0xF0FFFFFF;
        }
      }
    }
    *(unsigned char *)(a7 + 60) = *(unsigned char *)(v29 + 84);
    return v24;
  }
LABEL_103:
  uint64_t v63 = *(void *)(a1 + 32);
  *(void *)uint64_t v63 = 0xDC00000078;
  *(_WORD *)(v63 + 8) = 0;
  return 220;
}

uint64_t PRgetSeverity(uint64_t a1, uint64_t a2, int *a3, int a4, unsigned int a5, int a6)
{
  uint64_t v16 = 0;
  if (a4)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = 0xE6FFFFFF8FLL;
LABEL_5:
    *(void *)uint64_t v7 = v8;
    *(_WORD *)(v7 + 8) = 525;
    return 230;
  }
  uint64_t v11 = *(void *)(a2 + 48);
  uint64_t v12 = *(void *)(v11 + 256);
  if (getPosition(0, (_DWORD *)&v16 + 1, &v16, 0, *(void *)(v11 + 32), *(unsigned __int16 **)(v11 + 200), *(unsigned __int8 *)(v11 + 26), a5, a6))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = 0xE6FFFFFF8ELL;
    goto LABEL_5;
  }
  if (a6)
  {
    if (!v16)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = 0xE6FFFFFF8DLL;
      goto LABEL_5;
    }
    int v14 = *(unsigned __int8 *)(v12 + ((unint64_t)(2 * v16) >> 3)) << ((2 * v16) & 6);
    *a3 = v14 >> 6;
    if (v14 >> 6) {
      return 0;
    }
  }
  uint64_t result = 0;
  if (((*(unsigned __int8 *)(v12
                                                              + ((unint64_t)(2 * HIDWORD(v16)) >> 3)) << ((2 * BYTE4(v16)) & 6)) >> 6) <= 1u)
    int v15 = 1;
  else {
    int v15 = (*(unsigned __int8 *)(v12 + ((unint64_t)(2 * HIDWORD(v16)) >> 3)) << ((2 * BYTE4(v16)) & 6)) >> 6;
  }
  *a3 = v15;
  return result;
}

uint64_t getPosition(unsigned __int16 *a1, _DWORD *a2, _DWORD *a3, int *a4, uint64_t a5, unsigned __int16 *a6, int a7, unsigned int a8, unsigned __int8 a9)
{
  unsigned __int16 v19 = 0;
  if (!BinarySearch(a5, a7, 1, a8, 1, &v19)) {
    return 230;
  }
  uint64_t v14 = v19;
  if (a1) {
    *a1 = v19;
  }
  if (!v14)
  {
    int v15 = 0;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  int v15 = (unsigned __int16)((*((unsigned __int8 *)a6 + (2 * v14 - 1)) | (*((unsigned __int8 *)a6
                                                                                      + (2 * v14 - 2)) << 8))
                         + v14);
  if (a2) {
LABEL_6:
  }
    *a2 = v15;
  if (!a3) {
    return 0;
  }
LABEL_7:
  unsigned __int16 v16 = v14
      ? _byteswap_ushort(a6[v14])
      - (*((unsigned __int8 *)a6 + (2 * v14 - 1)) | (*((unsigned __int8 *)a6 + (2 * v14 - 2)) << 8))
      : __rev16(*a6);
  int v18 = v15 + a9;
  if (a9 > v16) {
    int v18 = 0;
  }
  *a3 = v18;
  if (!a4) {
    return 0;
  }
  uint64_t result = 0;
  *a4 = HIBYTE(a6[v14]) | (LOBYTE(a6[v14]) << 8);
  return result;
}

uint64_t getMapVal(uint64_t a1, int a2, int a3)
{
  unint64_t v3 = (unint64_t)(a3 * a2) >> 3;
  char v4 = (a3 * a2) & 7;
  if (a3 == 2) {
    return (*(unsigned __int8 *)(a1 + v3) << v4) >> 6;
  }
  if (a3 == 1) {
    return (0x80u >> v4) & *(unsigned __int8 *)(a1 + v3);
  }
  return 0;
}

uint64_t PRliveRule(uint64_t a1, uint64_t a2, int a3, unsigned int a4, int a5, int a6, int a7)
{
  if (*(unsigned __int8 *)(a1 + 26) < a4) {
    return 4;
  }
  uint64_t v25 = 0;
  if (a3)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(void *)uint64_t v9 = 0xE6FFFFFF8FLL;
    *(_WORD *)(v9 + 8) = 524;
    return 230;
  }
  uint64_t v15 = *(void *)(a2 + 48);
  uint64_t v16 = *(void *)(v15 + 32);
  int v17 = *(unsigned __int16 **)(v15 + 200);
  uint64_t v23 = *(void *)(v15 + 304);
  int v18 = *(unsigned __int8 *)(v15 + 26);
  if (getPosition(0, (_DWORD *)&v25 + 1, 0, 0, v16, v17, v18, a4, 0)) {
    return 4;
  }
  if (a5)
  {
    int Position = getPosition(0, 0, &v25, 0, v16, v17, v18, a4, a5);
    unsigned int v20 = v25;
    if (Position) {
      BOOL v21 = 1;
    }
    else {
      BOOL v21 = v25 == 0;
    }
    if (v21) {
      return 4;
    }
  }
  else
  {
    unsigned int v20 = 0;
  }
  if (((*(unsigned __int8 *)(v23 + ((unint64_t)HIDWORD(v25) >> 3)) << (BYTE4(v25) & 7)) & 0x80) != 0
    || a5 && ((*(unsigned __int8 *)(v23 + ((unint64_t)v20 >> 3)) << (v20 & 7)) & 0x80) != 0
    || a6
    && !a7
    && ((*(unsigned __int8 *)(*(void *)(v15 + 272) + ((unint64_t)v20 >> 3)) << (v20 & 7)) & 0x80) == 0)
  {
    return 4;
  }
  if (!*(unsigned char *)(a1 + 27))
  {
LABEL_23:
    uint64_t v22 = *(void *)(v15 + 288);
    if (!v22 || ((*(unsigned __int8 *)(v22 + ((unint64_t)v25 >> 3)) << (v25 & 7)) & 0x80) != 0) {
      return 0;
    }
    return 4;
  }
  int v24 = 0;
  uint64_t result = PRgetSeverity(a1, a2, &v24, 0, a4, a5);
  if (!result)
  {
    if (v24 == 3) {
      return 4;
    }
    goto LABEL_23;
  }
  return result;
}

uint64_t BinarySearch(uint64_t a1, int a2, int a3, unsigned int a4, int a5, _WORD *a6)
{
  *a6 = 0;
  int v6 = a2 / a3 - 1;
  if ((v6 & 0x8000) != 0) {
    return 0;
  }
  __int16 v7 = 0;
  while (1)
  {
    int v8 = (v7 + (__int16)v6) / 2;
    uint64_t v9 = v8 * (uint64_t)a3;
    unsigned int v10 = *(unsigned __int8 *)(a1 + v9);
    if (a5 == 2) {
      unsigned int v10 = *(unsigned __int8 *)(v9 + a1 + 1) | (v10 << 8);
    }
    if (v10 == a4) {
      break;
    }
    BOOL v11 = v10 >= a4;
    if (v10 <= a4) {
      __int16 v12 = v6;
    }
    else {
      __int16 v12 = v8 - 1;
    }
    if (!v11) {
      __int16 v12 = v6;
    }
    LOWORD(v6) = v12;
    if (!v11) {
      __int16 v7 = v8 + 1;
    }
    if (v7 > v12) {
      return 0;
    }
  }
  *a6 = v8;
  return 1;
}

uint64_t getTypeIndex(uint64_t a1, _WORD *a2, int a3, unsigned int a4, int a5)
{
  if (BinarySearch(a1, a3, 1, a4, 1, a2)) {
    return 0;
  }
  uint64_t result = 230;
  if (a5 && a3)
  {
    uint64_t v11 = 0;
    while (*(unsigned __int8 *)(a1 + v11) <= a4)
    {
      if (a3 == ++v11) {
        return 230;
      }
    }
    uint64_t result = 0;
    *a2 = v11;
  }
  return result;
}

char *CalExtBytesAfterCnv(char *result, _WORD *a2, int a3)
{
  *a2 = 0;
  unsigned int v5 = *((unsigned __int16 *)result + 9);
  if (*((_WORD *)result + 9))
  {
    int v6 = result;
    __int16 v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)result;
    uint64_t v10 = *((void *)result + 1);
    do
    {
      uint64_t result = strchr((char *)(v9 + *(__int16 *)(v10 + 2 * v8)), (char)a3);
      if (result)
      {
        do
        {
          *a2 = ++v7;
          uint64_t result = strchr(result + 1, (char)a3);
        }
        while (result);
        unsigned int v5 = *((unsigned __int16 *)v6 + 9);
      }
      ++v8;
    }
    while (v8 < v5);
  }
  else
  {
    __int16 v7 = 0;
  }
  if (a3 == 133) {
    *a2 = 2 * v7;
  }
  return result;
}

uint64_t AltOneToMultiChrCnv(uint64_t a1, int a2, __int16 a3, uint64_t a4)
{
  uint64_t result = 0;
  __int16 v8 = *(_WORD *)(a1 + 24);
  if (a2 <= 222)
  {
    if (a2 == 133)
    {
      char v10 = 0;
      char v12 = 46;
      char v11 = 46;
      char v9 = 46;
    }
    else
    {
      if (a2 != 151) {
        return result;
      }
      char v9 = 0;
      char v10 = 1;
      char v12 = 45;
      char v11 = 45;
    }
  }
  else
  {
    switch(a2)
    {
      case 223:
        char v9 = 0;
        char v10 = 1;
        char v12 = 115;
        char v11 = 115;
        break;
      case 230:
        char v9 = 0;
        char v10 = 1;
        char v11 = 101;
        char v12 = 97;
        break;
      case 247:
        char v9 = 0;
        char v10 = 1;
        char v11 = 101;
        char v12 = 111;
        break;
      default:
        return result;
    }
  }
  __int16 v13 = v8 + a3;
  uint64_t v14 = malloc_type_calloc((unsigned __int16)(v8 + a3) + 1, 1uLL, 0x100004077774924uLL);
  if (v14)
  {
    uint64_t v15 = v14;
    if (*(_WORD *)(a1 + 24))
    {
      unint64_t v16 = 0;
      int v17 = 0;
      unsigned __int16 v18 = 2;
      do
      {
        int v19 = *(unsigned __int8 *)(*(void *)a1 + v16);
        if (v19 == a2)
        {
          v14[(unsigned __int16)v17] = v12;
          v14[(unsigned __int16)(v17 + 1)] = v11;
          if (v10)
          {
            ++v17;
          }
          else
          {
            v17 += 2;
            v14[(unsigned __int16)v17] = v9;
          }
        }
        else
        {
          v14[(unsigned __int16)v17] = v19;
          if (!*(unsigned char *)(*(void *)a1 + v16) && *(unsigned __int16 *)(a1 + 18) >= v18) {
            *(_WORD *)(*(void *)(a1 + 8) + 2 * v18++ - 2) = v17 + 1;
          }
        }
        ++v16;
        ++v17;
      }
      while (v16 < *(unsigned __int16 *)(a1 + 24));
    }
    *(_WORD *)(a1 + 24) = v13;
    free(*(void **)a1);
    uint64_t result = 0;
    *(void *)a1 = v15;
  }
  else
  {
    uint64_t v20 = *(void *)(a4 + 32);
    *(void *)uint64_t v20 = 0xDC00000078;
    *(_WORD *)(v20 + 8) = 842;
    return 220;
  }
  return result;
}

char *OneToMultiChrCnv(const char **a1, unsigned __int16 *a2, int a3, uint64_t a4)
{
  __int16 v8 = (char *)*a1;
  unsigned __int16 v9 = strlen(*a1);
  uint64_t result = strchr(v8, (char)a3);
  if (!result) {
    return result;
  }
  __int16 v11 = 0;
  char v12 = v8 + 1;
  do
    ++v11;
  while (strchr(v12++, (char)a3));
  if (!v11) {
    return 0;
  }
  int v26 = a2;
  char v14 = 0;
  char v15 = 1;
  if (a3 <= 222)
  {
    if (a3 == 133)
    {
      char v15 = 0;
      v11 *= 2;
      char v14 = 46;
      char v16 = 46;
      char v17 = 46;
      goto LABEL_19;
    }
    if (a3 == 151)
    {
      char v17 = 45;
      char v16 = 45;
      goto LABEL_16;
    }
  }
  else
  {
    switch(a3)
    {
      case 223:
        char v17 = 115;
        char v16 = 115;
        goto LABEL_16;
      case 230:
        char v16 = 101;
        char v17 = 97;
        goto LABEL_16;
      case 247:
        char v16 = 101;
        char v17 = 111;
LABEL_16:
        char v14 = 0;
        goto LABEL_19;
    }
  }
  char v16 = 0;
  char v17 = 0;
LABEL_19:
  unsigned __int16 v18 = v11 + v9;
  int v19 = (const char *)malloc_type_calloc(v18 + 1, 1uLL, 0x100004077774924uLL);
  if (v19)
  {
    uint64_t v20 = v19;
    if (v9)
    {
      uint64_t v21 = 0;
      int v22 = 0;
      do
      {
        int v23 = (*a1)[v21];
        if (v23 == a3)
        {
          v19[(unsigned __int16)v22] = v17;
          int v24 = v22 + 1;
          v19[(unsigned __int16)(v22 + 1)] = v16;
          if ((v15 & 1) == 0)
          {
            int v24 = v22 + 2;
            v19[(unsigned __int16)(v22 + 2)] = v14;
          }
        }
        else
        {
          v19[(unsigned __int16)v22] = v23;
          int v24 = v22;
        }
        ++v21;
        int v22 = v24 + 1;
      }
      while (v9 != v21);
    }
    v19[v18] = 0;
    free((void *)*a1);
    uint64_t result = 0;
    *a1 = v20;
    *int v26 = v18;
  }
  else
  {
    uint64_t v25 = *(void *)(a4 + 32);
    *(void *)uint64_t v25 = 0xDC00000078;
    *(_WORD *)(v25 + 8) = 840;
    return (char *)220;
  }
  return result;
}

unsigned char *ToUpUnaccentedCnv(unsigned char *result, int a2, int a3, uint64_t a4)
{
  if (a2 >= 1)
  {
    uint64_t v4 = (unsigned __int16)a2;
    do
    {
      uint64_t v5 = *result;
      if ((v5 + 64) <= 0x1Cu
        && (a3 != 8 || (*(_DWORD *)(a4 + 4 * v5) & 0x40000) == 0)
        && ((0x1A300E8uLL >> v5) & 1) == 0)
      {
        *uint64_t result = byte_20CC66B8C[v5 - 192];
      }
      ++result;
      --v4;
    }
    while (v4);
  }
  return result;
}

char *PRinsOneHyp(char *result, _DWORD *a2, int a3, unsigned int a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v4 = *result;
  if (*result)
  {
    LOWORD(v5) = 0;
    int v6 = 0;
    do
    {
      if (v4 != a3)
      {
        result[(unsigned __int16)v5] = v4;
        LOWORD(v5) = v5 + 1;
      }
      int v4 = result[(unsigned __int16)++v6];
    }
    while (result[(unsigned __int16)v6]);
  }
  else
  {
    LOWORD(v5) = 0;
  }
  uint64_t v5 = (unsigned __int16)v5;
  result[(unsigned __int16)v5] = 0;
  if (*a2)
  {
    if ((a2[a4 >> 5] >> ~(_BYTE)a4))
    {
      if ((_WORD)v5)
      {
LABEL_11:
        int v7 = 0;
        uint64_t v8 = (unsigned __int16)a4;
        unsigned __int16 v9 = result;
        do
        {
          char v10 = *v9++;
          int v11 = v7 + 1;
          __src[(unsigned __int16)v7] = v10;
          if (!v8)
          {
            __src[(unsigned __int16)(v7 + 1)] = a3;
            int v11 = v7 + 2;
          }
          --v8;
          int v7 = v11;
          --v5;
        }
        while (v5);
        goto LABEL_36;
      }
    }
    else
    {
      if (a4)
      {
        unsigned int v12 = a4 - 1;
        do
        {
          __int16 v13 = v12 - 1;
          if (!v12) {
            break;
          }
          int v14 = a2[v12 >> 5];
          int v15 = 1 << ~(_BYTE)v12--;
        }
        while ((v15 & v14) == 0);
        __int16 v16 = v13 + 1;
      }
      else
      {
        __int16 v16 = 0;
      }
      unsigned int v17 = (unsigned __int16)(v5 - 1);
      for (unsigned int i = a4; v17 > i; ++i)
      {
        if ((a2[i >> 5] >> ~(_BYTE)i)) {
          break;
        }
      }
      if ((unsigned __int16)(a4 - v16) <= (unsigned __int16)(i - a4)) {
        __int16 v19 = v16;
      }
      else {
        __int16 v19 = i;
      }
      if ((unsigned __int16)v5 - 1 == (unsigned __int16)i) {
        __int16 v20 = v16;
      }
      else {
        __int16 v20 = v19;
      }
      if (v16) {
        LOWORD(a4) = v20;
      }
      else {
        LOWORD(a4) = i;
      }
      if ((_WORD)v5) {
        goto LABEL_11;
      }
    }
    LOWORD(v11) = 0;
LABEL_36:
    __src[(unsigned __int16)v11] = 0;
    return strcpy(result, __src);
  }
  return result;
}

uint64_t PRword(uint64_t a1, int a2, int a3)
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 230;
  }
  uint64_t v124 = 0;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v113 = 0u;
  *(_DWORD *)(a1 + 112) = 0;
  *(_DWORD *)(a1 + 116) = 0;
  uint64_t v6 = a1 + 112;
  *(_WORD *)(a1 + 120) = 0;
  if (a2 <= 7)
  {
    if (a2 != 3 && a2 != 7)
    {
LABEL_25:
      uint64_t v12 = *(void *)(a1 + 8);
      if (v12)
      {
        *(_DWORD *)(v12 + 18) = 0;
        *(_WORD *)(v12 + 24) = 0;
        if (*(_WORD *)(v12 + 16))
        {
          unint64_t v13 = 0;
          uint64_t v14 = *(void *)(v12 + 8);
          do
            *(_WORD *)(v14 + 2 * v13++) = -1;
          while (v13 < *(unsigned __int16 *)(v12 + 16));
        }
      }
      goto LABEL_29;
    }
  }
  else
  {
    if (a2 == 8) {
      goto LABEL_29;
    }
    if (a2 != 103 && a2 != 17) {
      goto LABEL_25;
    }
  }
  int v7 = *(void **)(a1 + 96);
  if (v7)
  {
    do
    {
      uint64_t v8 = (void *)v7[5];
      PRfreeErr(v7);
      int v7 = v8;
    }
    while (v8);
  }
  *(void *)(a1 + 96) = 0;
  if (a2 != 8)
  {
    if (a2 == 17)
    {
      unsigned __int16 v9 = *(void ***)(a1 + 8);
      if (v9) {
        PRfreeList(v9);
      }
      *(void *)(a1 + 8) = 0;
      uint64_t v10 = *(void *)(a1 + 136);
      if (v10)
      {
        if (*(void *)v10)
        {
          PRfreeList(*(void ***)v10);
          uint64_t v10 = *(void *)(a1 + 136);
        }
        if (*(void *)(v10 + 8))
        {
          PRfreeList(*(void ***)(v10 + 8));
          uint64_t v10 = *(void *)(a1 + 136);
        }
        if (*(void *)(v10 + 16))
        {
          free(*(void **)(v10 + 16));
          uint64_t v10 = *(void *)(a1 + 136);
        }
        if (*(void *)(v10 + 24))
        {
          free(*(void **)(v10 + 24));
          uint64_t v10 = *(void *)(a1 + 136);
        }
        free((void *)v10);
        uint64_t v11 = 0;
        *(void *)(a1 + 136) = 0;
        return v11;
      }
      return 0;
    }
    goto LABEL_25;
  }
LABEL_29:
  uint64_t v15 = PRGetAppElem(*(unsigned __int8 *)(a1 + 129));
  if (!v15)
  {
    uint64_t v24 = 0xE6FFFFFF93;
LABEL_41:
    *(void *)(a1 + 112) = v24;
    *(_WORD *)(a1 + 120) = 500;
    return 230;
  }
  uint64_t v16 = v15;
  *(void *)(v15 + 32) = v6;
  *(_WORD *)(v15 + 24) = 0;
  uint64_t v17 = PRGetDbElem(*(unsigned __int8 *)(a1 + 129), *(unsigned __int8 *)(a1 + 130));
  if (!v17)
  {
    uint64_t v24 = 0xE6FFFFFF92;
    goto LABEL_41;
  }
  uint64_t v18 = v17;
  size_t v19 = *(void *)(v17 + 128);
  int v20 = *(unsigned __int8 *)(v16 + 28);
  if (a2 == 7 || a2 == 103)
  {
    *(_DWORD *)(v19 + 1308) = 1;
    if (a2 == 103) {
      __int16 v21 = 3;
    }
    else {
      __int16 v21 = a2;
    }
    if ((*(_WORD *)v17 & 2) == 0)
    {
      uint64_t v22 = *(void *)(v16 + 32);
      if (v21 == 7)
      {
        uint64_t v23 = 0xE6000001F9;
LABEL_106:
        *(void *)uint64_t v22 = v23;
        *(_WORD *)(v22 + 8) = 500;
        return 230;
      }
      *(void *)uint64_t v22 = 0x4000001F9;
      *(_WORD *)(v22 + 8) = 500;
      *(_DWORD *)(v19 + 1308) = 0;
    }
  }
  else
  {
    *(_DWORD *)(v19 + 1308) = 0;
    __int16 v21 = a2;
  }
  int v25 = *(char *)(a1 + 127);
  *(_DWORD *)(v19 + 1408) = v25;
  if (!v25)
  {
    uint64_t v26 = *(void *)(a1 + 104);
    *(_DWORD *)(v19 + 1412) = *(_DWORD *)(v26 + 252);
    *(unsigned char *)(v19 + 1416) = *(unsigned char *)(v26 + 256);
  }
  *(unsigned char *)(v19 + 1339) = 0;
  __int16 v27 = *(char **)a1;
  if (*(void *)a1)
  {
    unsigned __int16 v28 = strlen(*(const char **)a1);
    LOWORD(v29) = v28;
    if (!v20)
    {
      if (v28 < 0x41u)
      {
        int v20 = 0;
      }
      else
      {
        LOWORD(v29) = 64;
        strncpy(__dst, v27, 0x40uLL);
        int v20 = 0;
        __int16 v27 = __dst;
      }
      goto LABEL_56;
    }
LABEL_52:
    if ((v29 & 0xFFC0) != 0) {
      int v29 = 64;
    }
    else {
      int v29 = (unsigned __int16)v29;
    }
    int v20 = 1;
    SLchcnv(v27, v29, (unsigned __int8 *)__dst, 1, *(unsigned __int8 *)(v18 + 20));
    __int16 v27 = __dst;
    goto LABEL_56;
  }
  if (v20)
  {
    LOWORD(v29) = 0;
    goto LABEL_52;
  }
  __int16 v27 = 0;
  LOWORD(v29) = 0;
LABEL_56:
  switch(v21)
  {
    case 3:
    case 7:
      goto LABEL_74;
    case 4:
    case 12:
    case 13:
    case 14:
      goto LABEL_105;
    case 5:
    case 6:
      if (a3) {
        goto LABEL_75;
      }
      *(_DWORD *)(v19 + 1408) = 0;
      *(_WORD *)(v19 + 1684) = *(_WORD *)(a1 + 124);
      *(unsigned char *)(v19 + 1339) = 0;
      if (PRIcs(v16, v18, 0, 0, 0, v27, 0, v19, v21, 0) == 8) {
        goto LABEL_192;
      }
      uint64_t v31 = *(void *)(a1 + 8);
      int v30 = (uint64_t *)(a1 + 8);
      if (!v31 && PRmkList(v16, v30, 100) == 220) {
        return 220;
      }
      int v32 = *(unsigned __int16 *)(v19 + 1686);
      if (!*(_WORD *)(v19 + 1686)) {
        return 0;
      }
      if (v20)
      {
        SLchcnv((char *)(v19 + *(__int16 *)(v19 + 2890) + 1690), (__int16)(*(_WORD *)(v19 + 1688) - *(_WORD *)(v19 + 2890)), (unsigned __int8 *)(v19 + *(__int16 *)(v19 + 2890) + 1690), 0, *(unsigned __int8 *)(v18 + 20));
        int v32 = *(unsigned __int16 *)(v19 + 1686);
      }
      return PRaddList((char **)*v30, (char *)(v19 + *(__int16 *)(v19 + 2890) + 1690), v32, 0);
    case 8:
      if (a3 > 1)
      {
        if (a3 == 2)
        {
          int v50 = 0;
          __int16 v49 = 103;
          int v48 = 1;
        }
        else
        {
          if (a3 != 64) {
            goto LABEL_75;
          }
          int v48 = 0;
          int v50 = 0;
          __int16 v49 = 101;
        }
      }
      else if (a3)
      {
        if (a3 != 1) {
          goto LABEL_75;
        }
        int v48 = 0;
        __int16 v49 = 102;
        int v50 = 1;
      }
      else
      {
        *(_DWORD *)(v19 + 1680) = 0;
        uint64_t v80 = *(void *)(a1 + 8);
        if (v80)
        {
          *(_DWORD *)(v80 + 18) = 0;
          *(_WORD *)(v80 + 24) = 0;
          if (*(_WORD *)(v80 + 16))
          {
            unint64_t v81 = 0;
            uint64_t v82 = *(void *)(v80 + 8);
            do
              *(_WORD *)(v82 + 2 * v81++) = -1;
            while (v81 < *(unsigned __int16 *)(v80 + 16));
          }
        }
        if (SLstrcmp((unsigned char *)(v19 + 1339), (unsigned __int8 *)v27))
        {
          *(unsigned char *)(v19 + 1339) = 0;
          int v83 = PRIcs(v16, v18, 0, 0, 0, v27, 0, v19, 3, 0);
          if (v83 == 4) {
            goto LABEL_214;
          }
          if (v83 == 8)
          {
LABEL_192:
            uint64_t v72 = *(void *)(v16 + 32);
            uint64_t v73 = 0xDC000000A0;
            goto LABEL_193;
          }
          *(void *)(a1 + 16) = *(void *)(v19 + 1640);
          *(void *)(a1 + 88) = *(void *)(v19 + 3156);
          **(void **)(a1 + 104) = *(void *)(v19 + 1664);
          *(void *)(*(void *)(a1 + 104) + 8) = *(void *)(v19 + 1672);
          *(void *)(*(void *)(a1 + 104) + 16) = *(void *)(v19 + 1648);
          *(void *)(*(void *)(a1 + 104) + 24) = *(void *)(v19 + 1656);
          if (v20)
          {
            __int16 v84 = strlen((const char *)(v19 + 3090));
            SLchcnv((char *)(v19 + 3090), v84, (unsigned __int8 *)(a1 + 24), 0, *(unsigned __int8 *)(v18 + 20));
            __int16 v85 = strlen((const char *)(v19 + 1614));
            SLchcnv((char *)(v19 + 1614), v85, (unsigned __int8 *)(*(void *)(a1 + 104) + 32), 0, *(unsigned __int8 *)(v18 + 20));
            __int16 v86 = strlen((const char *)(v19 + 1624));
            SLchcnv((char *)(v19 + 1624), v86, (unsigned __int8 *)(*(void *)(a1 + 104) + 42), 0, *(unsigned __int8 *)(v18 + 20));
            __int16 v87 = strlen((const char *)(v19 + 1547));
            SLchcnv((char *)(v19 + 1547), v87, (unsigned __int8 *)(*(void *)(a1 + 104) + 55), 0, *(unsigned __int8 *)(v18 + 20));
            __int16 v88 = strlen((const char *)(v19 + 1417));
            SLchcnv((char *)(v19 + 1417), v88, (unsigned __int8 *)(*(void *)(a1 + 104) + 122), 0, *(unsigned __int8 *)(v18 + 20));
            __int16 v89 = strlen((const char *)(v19 + 1482));
            SLchcnv((char *)(v19 + 1482), v89, (unsigned __int8 *)(*(void *)(a1 + 104) + 187), 0, *(unsigned __int8 *)(v18 + 20));
          }
          else
          {
            __strcpy_chk();
            __strcpy_chk();
            __strcpy_chk();
            __strcpy_chk();
            __strcpy_chk();
            __strcpy_chk();
          }
          int v48 = 0;
          int v50 = 0;
          uint64_t v99 = *(void *)(a1 + 104);
          *(_DWORD *)(v99 + 252) = *(_DWORD *)(v19 + 1412);
          *(unsigned char *)(v99 + 256) = *(unsigned char *)(v19 + 1416);
        }
        else
        {
          int v48 = 0;
          int v50 = 0;
        }
        __int16 v49 = 100;
      }
      uint64_t v100 = PRIcs(v16, v18, 0, 0, 0, "", 0, v19, v49, 0);
      uint64_t v11 = v100;
      if ((v100 - 20) >= 3)
      {
        if (v100 != 8) {
          return v11;
        }
        goto LABEL_192;
      }
      uint64_t v101 = (char ***)(a1 + 8);
      if (!*(void *)(a1 + 8) && PRmkList(v16, (uint64_t *)(a1 + 8), 100) == 220) {
        return 220;
      }
      if ((v48 | v50)) {
        unsigned int v102 = 0;
      }
      else {
        unsigned int v102 = *((unsigned __int16 *)*v101 + 9);
      }
      LODWORD(v103) = *(unsigned __int16 *)(v19 + 1686);
      if (v102 >= v103)
      {
LABEL_208:
        if (v11 == 22)
        {
          uint64_t v11 = 0;
          *(unsigned char *)(a1 + 128) = 1;
          return v11;
        }
        if (v11 != 21) {
          return 240;
        }
        if (v103) {
          return 0;
        }
LABEL_214:
        uint64_t v111 = *(void *)(v16 + 32);
        *(void *)uint64_t v111 = 0x4000001F5;
        *(_WORD *)(v111 + 8) = 500;
        return 4;
      }
      int v104 = *v101;
      if (*((unsigned __int16 *)*v101 + 9) >= *((unsigned __int16 *)*v101 + 8))
      {
        LODWORD(v103) = 1;
        goto LABEL_208;
      }
      unint64_t v105 = v102;
      size_t v106 = v19 + 2890;
      while (1)
      {
        if (v20)
        {
          uint64_t v107 = (char *)(v19 + *(__int16 *)(v106 + 2 * v105) + 1690);
          __int16 v108 = strlen(v107);
          SLchcnv(v107, v108, (unsigned __int8 *)v107, 0, *(unsigned __int8 *)(v18 + 20));
          int v104 = *v101;
        }
        uint64_t v33 = PRaddList(v104, (char *)(v19 + *(__int16 *)(v106 + 2 * v105) + 1690), 1, 0);
        if (v33) {
          return v33;
        }
        if (v20)
        {
          uint64_t v109 = (char *)(v19 + *(__int16 *)(v106 + 2 * v105) + 1690);
          __int16 v110 = strlen(v109);
          SLchcnv(v109, v110, (unsigned __int8 *)v109, 1, *(unsigned __int8 *)(v18 + 20));
        }
        ++v105;
        unint64_t v103 = *(unsigned __int16 *)(v19 + 1686);
        if (v105 < v103)
        {
          int v104 = *v101;
          if (*((unsigned __int16 *)*v101 + 9) < *((unsigned __int16 *)*v101 + 8)) {
            continue;
          }
        }
        goto LABEL_208;
      }
    case 9:
    case 10:
      uint64_t v34 = *(void *)(v16 + 8 * *(unsigned __int8 *)(a1 + 131) + 56);
      if (!v34) {
        goto LABEL_104;
      }
      unsigned int v35 = *(unsigned __int8 *)(a1 + 132);
      uint64_t v36 = *(void *)(v34 + 776);
      if (v21 == 9 && *(unsigned char *)(a1 + 126) && (uint64_t v37 = a1 + 24, *(unsigned char *)(a1 + 24)))
      {
        __int16 v38 = strlen((const char *)(a1 + 24));
        __int16 v39 = v38;
        if (!v20)
        {
          *(void *)(v36 + 2128) = v37;
          *(_WORD *)(v36 + 2136) = v38;
          __strcpy_chk();
          goto LABEL_83;
        }
        SLchcnv((char *)(a1 + 24), v38, (unsigned __int8 *)(a1 + 24), 1, v35);
        *(void *)(v36 + 2128) = v37;
        *(_WORD *)(v36 + 2136) = v39;
      }
      else
      {
        *(void *)(v36 + 2128) = 0;
        *(_WORD *)(v36 + 2136) = 0;
        if ((v20 & 1) == 0)
        {
LABEL_82:
          __strcpy_chk();
          if (v21 == 9)
          {
LABEL_83:
            *(unsigned char *)(v36 + 2125) = *(unsigned char *)(a1 + 126);
            char v47 = 1;
            goto LABEL_110;
          }
          char v47 = 2;
LABEL_110:
          *(_WORD *)(v36 + 4) = *(_WORD *)v34;
          *(unsigned char *)uint64_t v36 = v47;
          if (ICpd(v19, (unsigned __int8 *)v36) == 8)
          {
            if (v21 == 9) {
              int v65 = 710;
            }
            else {
              int v65 = 709;
            }
            if (*(_WORD *)(v36 + 2148) == 5151)
            {
              int v65 = 714;
              __int16 v66 = 710;
            }
            else
            {
              __int16 v66 = 500;
            }
            uint64_t v11 = 230;
            *(_DWORD *)(a1 + 112) = v65;
            *(_DWORD *)(a1 + 116) = 230;
            *(_WORD *)(a1 + 120) = v66;
            return v11;
          }
          return 0;
        }
      }
      __int16 v46 = strlen(*(const char **)a1);
      SLchcnv(*(char **)a1, v46, *(unsigned __int8 **)a1, 1, v35);
      goto LABEL_82;
    case 11:
      uint64_t v51 = *(void *)(v16 + 8 * *(unsigned __int8 *)(a1 + 131) + 56);
      if (!v51) {
        goto LABEL_104;
      }
      uint64_t v52 = *(void *)(v51 + 776);
      *(_WORD *)(v52 + 4) = *(_WORD *)v51;
      if (*(_WORD *)(v51 + 784)) {
        goto LABEL_90;
      }
      if (a3 == 3)
      {
        char v71 = 4;
      }
      else
      {
        if (a3 != 4)
        {
LABEL_75:
          uint64_t v22 = *(void *)(v16 + 32);
          uint64_t v23 = 0xE6FFFFFF94;
          goto LABEL_106;
        }
        char v71 = 5;
      }
      *(unsigned char *)uint64_t v52 = v71;
      unsigned int v90 = *(unsigned __int16 *)(a1 + 134);
      *(unsigned char *)(v52 + 2138) = v90;
      if (v90 > 0x14 || !(_BYTE)v90)
      {
        uint64_t v22 = *(void *)(v16 + 32);
        uint64_t v23 = 0xE6FFFFFF85;
        goto LABEL_106;
      }
      if (ICpd(v19, (unsigned __int8 *)v52) == 8) {
        goto LABEL_140;
      }
      *(_WORD *)(v51 + 784) = a3;
      uint64_t v91 = *(void *)(a1 + 136);
      if (v91) {
        goto LABEL_171;
      }
      uint64_t v112 = (uint64_t *)malloc_type_calloc(1uLL, 0x28uLL, 0x10B00405BDECF31uLL);
      *(void *)(a1 + 136) = v112;
      if (!v112) {
        goto LABEL_140;
      }
      if (PRmkList(v16, v112, *(__int16 *)(a1 + 134)) == 220
        || PRmkList(v16, (uint64_t *)(*(void *)(a1 + 136) + 8), *(__int16 *)(a1 + 134)) == 220)
      {
        return 220;
      }
      uint64_t v91 = *(void *)(a1 + 136);
LABEL_171:
      unsigned int v92 = *(unsigned __int16 *)(a1 + 134);
      if (!*(_WORD *)(v91 + 32)) {
        goto LABEL_174;
      }
      if (*(unsigned __int16 *)(v91 + 32) >= v92) {
        goto LABEL_177;
      }
      free(*(void **)(v91 + 16));
      free(*(void **)(*(void *)(a1 + 136) + 24));
      uint64_t v93 = *(void *)(a1 + 136);
      *(void *)(v93 + 16) = 0;
      *(void *)(v93 + 24) = 0;
      *(_WORD *)(v93 + 32) = 0;
      unsigned int v92 = *(unsigned __int16 *)(a1 + 134);
LABEL_174:
      unsigned int v94 = malloc_type_malloc(8 * v92, 0x100004000313F17uLL);
      *(void *)(*(void *)(a1 + 136) + 16) = v94;
      if (!v94) {
        goto LABEL_140;
      }
      int v95 = malloc_type_malloc(*(unsigned __int16 *)(a1 + 134), 0x100004077774924uLL);
      uint64_t v96 = *(void *)(a1 + 136);
      *(void *)(v96 + 24) = v95;
      if (!v95) {
        goto LABEL_140;
      }
      unsigned int v92 = *(unsigned __int16 *)(a1 + 134);
      *(_WORD *)(v96 + 32) = v92;
LABEL_177:
      *(void *)(v52 + 2192) = malloc_type_calloc(v92, 8uLL, 0x2004093837F09uLL);
      **(void **)(v52 + 2192) = malloc_type_calloc(*(unsigned __int16 *)(a1 + 134), 0x94uLL, 0x10000403212CEEEuLL);
      unint64_t v97 = *(unsigned __int16 *)(a1 + 134);
      if (v97 >= 2)
      {
        for (uint64_t i = 1; i != v97; ++i)
          *(void *)(*(void *)(v52 + 2192) + 8 * i) = **(void **)(v52 + 2192) + 148 * i;
      }
LABEL_90:
      __int16 v53 = *(uint64_t **)(a1 + 136);
      uint64_t v54 = *v53;
      if (*v53)
      {
        *(_DWORD *)(v54 + 18) = 0;
        *(_WORD *)(v54 + 24) = 0;
        if (*(_WORD *)(v54 + 16))
        {
          unint64_t v55 = 0;
          uint64_t v56 = *(void *)(v54 + 8);
          do
            *(_WORD *)(v56 + 2 * v55++) = -1;
          while (v55 < *(unsigned __int16 *)(v54 + 16));
        }
      }
      uint64_t v57 = v53[1];
      if (v57)
      {
        *(_DWORD *)(v57 + 18) = 0;
        *(_WORD *)(v57 + 24) = 0;
        if (*(_WORD *)(v57 + 16))
        {
          unint64_t v58 = 0;
          uint64_t v59 = *(void *)(v57 + 8);
          do
            *(_WORD *)(v59 + 2 * v58++) = -1;
          while (v58 < *(unsigned __int16 *)(v57 + 16));
        }
      }
      *(unsigned char *)uint64_t v52 = 6;
      if (ICpd(v19, (unsigned __int8 *)v52) == 8)
      {
        *(void *)(a1 + 112) = 0xE60000007BLL;
        *(_WORD *)(a1 + 120) = 500;
        return 220;
      }
      if (!*(_WORD *)(v52 + 2184)) {
        return 0;
      }
      unint64_t v75 = 0;
      while (1)
      {
        uint64_t v76 = *(void *)(v52 + 2192);
        uint64_t v77 = *(void *)(v76 + 8 * v75);
        if (v20)
        {
          __int16 v78 = strlen(*(const char **)(v76 + 8 * v75));
          SLchcnv((char *)v77, v78, (unsigned __int8 *)v77, 0, *(unsigned __int8 *)(v18 + 20));
          __int16 v79 = strlen((const char *)(v77 + 80));
          SLchcnv((char *)(v77 + 80), v79, (unsigned __int8 *)(v77 + 80), 0, *(unsigned __int8 *)(v18 + 20));
        }
        uint64_t v33 = PRaddList(**(char ****)(a1 + 136), (char *)v77, 1, (unsigned __int16)v75);
        if (v33) {
          break;
        }
        uint64_t v11 = PRaddList(*(char ***)(*(void *)(a1 + 136) + 8), (char *)(v77 + 80), 1, (unsigned __int16)v75);
        if (!v11)
        {
          *(void *)(*(void *)(*(void *)(a1 + 136) + 16) + 8 * v75) = *(void *)(v77 + 72);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 24) + v75++) = *(unsigned char *)(v77 + 68);
          if (v75 < *(unsigned __int16 *)(v52 + 2184)) {
            continue;
          }
        }
        return v11;
      }
      return v33;
    case 15:
      uint64_t v60 = *(void *)(v16 + 8 * *(unsigned __int8 *)(a1 + 131) + 56);
      if (!v60)
      {
LABEL_104:
        uint64_t v22 = *(void *)(v16 + 32);
        uint64_t v23 = 0xE6000002C0;
        goto LABEL_106;
      }
      uint64_t v61 = *(void *)(v60 + 776);
      *(_WORD *)(v61 + 4) = *(_WORD *)v60;
      int v62 = *(unsigned __int16 *)(v60 + 784);
      if (v62 == 3)
      {
        char v63 = 7;
      }
      else
      {
        if (v62 != 4)
        {
LABEL_105:
          uint64_t v22 = *(void *)(v16 + 32);
          uint64_t v23 = 0xE6FFFFFF95;
          goto LABEL_106;
        }
        char v63 = 8;
      }
      *(unsigned char *)uint64_t v61 = v63;
      if (ICpd(v19, (unsigned __int8 *)v61) != 8)
      {
        char v74 = *(void ***)(v61 + 2192);
        if (v74)
        {
          free(*v74);
          free(*(void **)(v61 + 2192));
          *(void *)(v61 + 2192) = 0;
        }
        uint64_t v11 = 0;
        *(_WORD *)(v60 + 784) = 0;
        return v11;
      }
LABEL_140:
      uint64_t v72 = *(void *)(v16 + 32);
      uint64_t v73 = 0xDC00000078;
LABEL_193:
      *(void *)uint64_t v72 = v73;
      *(_WORD *)(v72 + 8) = 500;
      return 220;
    default:
      if (v21 != 103) {
        goto LABEL_105;
      }
LABEL_74:
      if (a3) {
        goto LABEL_75;
      }
      *(unsigned char *)(v19 + 1339) = 0;
      if (PRIcs(v16, v18, 0, 0, 0, v27, 0, v19, v21, 0) == 8) {
        goto LABEL_192;
      }
      *(void *)(a1 + 16) = *(void *)(v19 + 1640);
      *(void *)(a1 + 88) = *(void *)(v19 + 3156);
      **(void **)(a1 + 104) = *(void *)(v19 + 1664);
      *(void *)(*(void *)(a1 + 104) + 8) = *(void *)(v19 + 1672);
      *(void *)(*(void *)(a1 + 104) + 16) = *(void *)(v19 + 1648);
      *(void *)(*(void *)(a1 + 104) + 24) = *(void *)(v19 + 1656);
      if (v20)
      {
        __int16 v40 = strlen((const char *)(v19 + 3090));
        SLchcnv((char *)(v19 + 3090), v40, (unsigned __int8 *)(a1 + 24), 0, *(unsigned __int8 *)(v18 + 20));
        __int16 v41 = strlen((const char *)(v19 + 1614));
        SLchcnv((char *)(v19 + 1614), v41, (unsigned __int8 *)(*(void *)(a1 + 104) + 32), 0, *(unsigned __int8 *)(v18 + 20));
        __int16 v42 = strlen((const char *)(v19 + 1624));
        SLchcnv((char *)(v19 + 1624), v42, (unsigned __int8 *)(*(void *)(a1 + 104) + 42), 0, *(unsigned __int8 *)(v18 + 20));
        __int16 v43 = strlen((const char *)(v19 + 1547));
        SLchcnv((char *)(v19 + 1547), v43, (unsigned __int8 *)(*(void *)(a1 + 104) + 55), 0, *(unsigned __int8 *)(v18 + 20));
        __int16 v44 = strlen((const char *)(v19 + 1417));
        SLchcnv((char *)(v19 + 1417), v44, (unsigned __int8 *)(*(void *)(a1 + 104) + 122), 0, *(unsigned __int8 *)(v18 + 20));
        __int16 v45 = strlen((const char *)(v19 + 1482));
        SLchcnv((char *)(v19 + 1482), v45, (unsigned __int8 *)(*(void *)(a1 + 104) + 187), 0, *(unsigned __int8 *)(v18 + 20));
      }
      else
      {
        __strcpy_chk();
        __strcpy_chk();
        __strcpy_chk();
        __strcpy_chk();
        __strcpy_chk();
        __strcpy_chk();
      }
      uint64_t v67 = *(void *)(a1 + 104);
      *(_DWORD *)(v67 + 252) = *(_DWORD *)(v19 + 1412);
      *(unsigned char *)(v67 + 256) = *(unsigned char *)(v19 + 1416);
      int v68 = *(_DWORD *)(v19 + 4);
      if (v68 == 4 || !*(void *)(v19 + 1328) && v68 != 11 && !*(_WORD *)(v19 + 1322)) {
        return 0;
      }
      uint64_t v124 = 0;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v115 = 0u;
      long long v113 = 0u;
      long long v114 = (unint64_t)v27;
      LOWORD(v115) = v29;
      if (PRFillError(v16, v18, (uint64_t)&v113, 0)) {
        return 220;
      }
      uint64_t v69 = v123;
      *(void *)(a1 + 96) = v123;
      if (v69) {
        int v70 = v20;
      }
      else {
        int v70 = 0;
      }
      if (v69) {
        uint64_t v11 = 210;
      }
      else {
        uint64_t v11 = 0;
      }
      if (v70 == 1)
      {
        uint64_t v11 = 210;
        do
        {
          ConvertAlts(*(void *)(v69 + 24), 0, *(unsigned __int8 *)(v18 + 20));
          uint64_t v69 = *(void *)(v123 + 40);
          *(void *)&long long v123 = v69;
        }
        while (v69);
      }
      return v11;
  }
}

uint64_t add_phrase(uint64_t *a1, const char *a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  int v4 = a1;
LABEL_3:
  int v5 = *(unsigned __int8 *)a2;
  if ((v5 - 65) >= 0x1A && (v5 - 192) >= 0x17)
  {
    if ((v5 - 216) >= 7)
    {
      if ((v5 - 138) > 0x15 || ((1 << (v5 + 118)) & 0x200015) == 0)
      {
        if (!*a2)
        {
          v4[2] = a3;
          return 1;
        }
        goto LABEL_22;
      }
      goto LABEL_19;
    }
  }
  else if ((v5 - 138) <= 0x15 && ((1 << (v5 + 118)) & 0x200015) != 0)
  {
LABEL_19:
    if (v5 == 159) {
      int v5 = 255;
    }
    else {
      v5 += 16;
    }
    goto LABEL_22;
  }
  v5 += 32;
LABEL_22:
  uint64_t v9 = *((unsigned __int16 *)v4 + 5);
  if (!*((_WORD *)v4 + 5))
  {
    __int16 v22 = 0;
    goto LABEL_52;
  }
  uint64_t v10 = (uint64_t **)(v4 + 3);
  uint64_t v11 = *((unsigned __int16 *)v4 + 5);
  do
  {
    uint64_t v12 = *v10;
    unint64_t v13 = (unsigned __int8 *)**v10;
    int v14 = *v13;
    if ((v14 - 65) < 0x1A || (v14 - 192) < 0x17)
    {
      if ((v14 - 138) > 0x15 || ((1 << (v14 + 118)) & 0x200015) == 0)
      {
LABEL_35:
        v14 += 32;
        goto LABEL_43;
      }
LABEL_40:
      if (v14 == 159) {
        int v14 = 255;
      }
      else {
        v14 += 16;
      }
      goto LABEL_43;
    }
    if ((v14 - 216) < 7) {
      goto LABEL_35;
    }
    if ((v14 - 138) <= 0x15 && ((1 << (v14 + 118)) & 0x200015) != 0) {
      goto LABEL_40;
    }
LABEL_43:
    if (v5 == v14)
    {
      unint64_t v18 = *((unsigned __int16 *)v12 + 4);
      unint64_t matched = matchLength((uint64_t)a2, **v10, v18);
      if (matched < v18)
      {
        int v20 = malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
        *(void *)int v20 = v13;
        v20[4] = matched;
        v20[5] = 1;
        *((void *)v20 + 3) = v12;
        uint64_t *v12 = (uint64_t)&v13[matched];
        *((_WORD *)v12 + 4) = v18 - matched;
        uint64_t v12 = (uint64_t *)v20;
        *uint64_t v10 = (uint64_t *)v20;
      }
      a2 += matched;
      int v4 = v12;
      goto LABEL_3;
    }
    ++v10;
    --v11;
  }
  while (v11);
  __int16 v22 = *((_WORD *)v4 + 5);
  if (v9 >= 0x1C) {
    return 0;
  }
LABEL_52:
  uint64_t v21 = 1;
  uint64_t v23 = malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  *(void *)uint64_t v23 = a2;
  v23[4] = strlen(a2);
  *((void *)v23 + 2) = a3;
  v4[v9 + 3] = (uint64_t)v23;
  *((_WORD *)v4 + 5) = v22 + 1;
  return v21;
}

uint64_t matchLength(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t result = 0;
    while (1)
    {
      int v5 = *(unsigned __int8 *)(a1 + result);
      if ((v5 - 65) < 0x1A || (v5 - 192) < 0x17) {
        break;
      }
      if ((v5 - 216) < 7) {
        goto LABEL_14;
      }
      if ((v5 - 138) <= 0x15 && ((1 << (v5 + 118)) & 0x200015) != 0)
      {
LABEL_19:
        if (v5 == 159) {
          int v5 = 255;
        }
        else {
          v5 += 16;
        }
      }
LABEL_22:
      int v9 = *(unsigned __int8 *)(a2 + result);
      if ((v9 - 65) >= 0x1A && (v9 - 192) >= 0x17)
      {
        if ((v9 - 216) >= 7)
        {
          if ((v9 - 138) > 0x15 || ((1 << (v9 + 118)) & 0x200015) == 0) {
            goto LABEL_36;
          }
LABEL_33:
          if (v9 == 159) {
            int v9 = 255;
          }
          else {
            v9 += 16;
          }
          goto LABEL_36;
        }
      }
      else if ((v9 - 138) <= 0x15 && ((1 << (v9 + 118)) & 0x200015) != 0)
      {
        goto LABEL_33;
      }
      v9 += 32;
LABEL_36:
      if (v5 != v9) {
        return result;
      }
      if (a3 == ++result) {
        return a3;
      }
    }
    if ((v5 - 138) <= 0x15 && ((1 << (v5 + 118)) & 0x200015) != 0) {
      goto LABEL_19;
    }
LABEL_14:
    v5 += 32;
    goto LABEL_22;
  }
  return 0;
}

uint64_t find_phrase(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned int a4, uint64_t a5, unsigned __int8 **a6, void *a7)
{
  int v7 = 0;
  if (!a1 || !a3) {
    return (uint64_t)v7;
  }
  int v11 = *a2;
  if (!a5) {
    goto LABEL_21;
  }
  if ((v11 - 65) >= 0x1A && (v11 - 192) >= 0x17)
  {
    if ((v11 - 216) >= 7)
    {
      if ((v11 - 138) > 0x15 || ((1 << (v11 + 118)) & 0x200015) == 0) {
        goto LABEL_21;
      }
      goto LABEL_18;
    }
  }
  else if ((v11 - 138) <= 0x15 && ((1 << (v11 + 118)) & 0x200015) != 0)
  {
LABEL_18:
    if (v11 == 159) {
      LOBYTE(v11) = -1;
    }
    else {
      LOBYTE(v11) = v11 + 16;
    }
    goto LABEL_21;
  }
  LOBYTE(v11) = v11 + 32;
LABEL_21:
  uint64_t v14 = *(unsigned __int16 *)(a1 + 10);
  if (!*(_WORD *)(a1 + 10)) {
    return 0;
  }
  uint64_t v15 = (unsigned __int8 ***)(a1 + 24);
  int v16 = v11;
  while (1)
  {
    uint64_t v17 = *v15;
    unint64_t v18 = **v15;
    int v19 = *v18;
    if (!a5) {
      goto LABEL_43;
    }
    if ((v19 - 65) < 0x1A || (v19 - 192) < 0x17)
    {
      if ((v19 - 138) > 0x15 || ((1 << (v19 + 118)) & 0x200015) == 0)
      {
LABEL_35:
        LOBYTE(v19) = v19 + 32;
        goto LABEL_43;
      }
LABEL_40:
      if (v19 == 159) {
        LOBYTE(v19) = -1;
      }
      else {
        LOBYTE(v19) = v19 + 16;
      }
      goto LABEL_43;
    }
    if ((v19 - 216) < 7) {
      goto LABEL_35;
    }
    if ((v19 - 138) <= 0x15 && ((1 << (v19 + 118)) & 0x200015) != 0) {
      goto LABEL_40;
    }
LABEL_43:
    if (v16 == v19)
    {
      unint64_t v23 = *((unsigned __int16 *)v17 + 4);
      if (a3 >= v23 && matchLength((uint64_t)v18, (uint64_t)a2, *((unsigned __int16 *)v17 + 4)) >= v23) {
        break;
      }
    }
    ++v15;
    if (!--v14) {
      return 0;
    }
  }
  int v25 = &a2[v23];
  if (find_phrase(v17, v25, a3 - v23, a4, a5, a6, a7)) {
    return 1;
  }
  int v7 = v17[2];
  if (v7)
  {
    if (!a4 || a3 == v23 || !isAnyAlpha(*v25))
    {
      if (a6) {
        *a6 = v25;
      }
      if (a7) {
        *a7 = v17[2];
      }
      return 1;
    }
    return 0;
  }
  return (uint64_t)v7;
}

BOOL isAnyAlpha(int a1)
{
  BOOL result = 1;
  if (a1 <= 247
    && (a1 - 216) >= 0x1F
    && (a1 - 192) >= 0x17
    && (a1 & 0xFFFFFFDF) - 65 >= 0x1A
    && ((a1 - 131) > 0x1B || ((1 << (a1 + 125)) & 0xA800A81) == 0))
  {
    return a1 == 159;
  }
  return result;
}

BOOL find_partial_phrase(BOOL result, unsigned __int8 *a2, unint64_t a3, int a4)
{
  if (!result) {
    return result;
  }
  unint64_t v4 = a3;
  if (!a3) {
    return 1;
  }
  int v7 = (unsigned __int8 **)result;
  while (2)
  {
    int v8 = *a2;
    if (!a4) {
      goto LABEL_24;
    }
    if ((v8 - 65) >= 0x1A && (v8 - 192) >= 0x17)
    {
      if ((v8 - 216) >= 7)
      {
        if ((v8 - 138) > 0x15 || ((1 << (v8 + 118)) & 0x200015) == 0) {
          goto LABEL_24;
        }
        goto LABEL_21;
      }
    }
    else if ((v8 - 138) <= 0x15 && ((1 << (v8 + 118)) & 0x200015) != 0)
    {
LABEL_21:
      if (v8 == 159) {
        LOBYTE(v8) = -1;
      }
      else {
        LOBYTE(v8) = v8 + 16;
      }
      goto LABEL_24;
    }
    LOBYTE(v8) = v8 + 32;
LABEL_24:
    uint64_t v12 = *((unsigned __int16 *)v7 + 5);
    if (!*((_WORD *)v7 + 5)) {
      return 0;
    }
    for (uint64_t i = (unsigned __int8 ***)(v7 + 3); ; ++i)
    {
      int v7 = *i;
      uint64_t v14 = **i;
      int v15 = *v14;
      if (a4)
      {
        if ((v15 - 65) >= 0x1A && (v15 - 192) >= 0x17)
        {
          if ((v15 - 216) >= 7)
          {
            if ((v15 - 138) > 0x15 || ((1 << (v15 + 118)) & 0x200015) == 0) {
              goto LABEL_46;
            }
LABEL_43:
            if (v15 == 159) {
              LOBYTE(v15) = -1;
            }
            else {
              LOBYTE(v15) = v15 + 16;
            }
            goto LABEL_46;
          }
        }
        else if ((v15 - 138) <= 0x15 && ((1 << (v15 + 118)) & 0x200015) != 0)
        {
          goto LABEL_43;
        }
        LOBYTE(v15) = v15 + 32;
      }
LABEL_46:
      if (v8 == v15)
      {
        unint64_t v19 = *((unsigned __int16 *)v7 + 4);
        if (v4 <= v19) {
          return matchLength((uint64_t)v14, (uint64_t)a2, v4) >= v4;
        }
        if (matchLength((uint64_t)v14, (uint64_t)a2, *((unsigned __int16 *)v7 + 4)) >= v19) {
          break;
        }
      }
      if (!--v12) {
        return 0;
      }
    }
    a2 += v19;
    BOOL result = 1;
    v4 -= v19;
    if (v4) {
      continue;
    }
    return result;
  }
}

uint64_t print_node(const char **a1, uint64_t a2)
{
  if (a2)
  {
    ++print_node_num_nodes;
    uint64_t v4 = a2;
    do
    {
      putchar(32);
      --v4;
    }
    while (v4);
  }
  else
  {
    print_node_num_nodes = 1;
  }
  printf("node %p ", a1);
  if (*a1 && *((_WORD *)a1 + 4)) {
    printf(" phrase <%.*s> ", *((unsigned __int16 *)a1 + 4), *a1);
  }
  if (a1[2]) {
    printf("suggestion <%p> ", a1[2]);
  }
  if (!*((_WORD *)a1 + 5))
  {
    uint64_t result = putchar(10);
    if (a2) {
      return result;
    }
    return printf("%lu total nodes\n", print_node_num_nodes);
  }
  uint64_t result = printf("%u children\n", *((unsigned __int16 *)a1 + 5));
  if (*((_WORD *)a1 + 5))
  {
    unint64_t v6 = 0;
    do
      uint64_t result = print_node(a1[v6++ + 3], a2 + 1);
    while (v6 < *((unsigned __int16 *)a1 + 5));
  }
  if (!a2) {
    return printf("%lu total nodes\n", print_node_num_nodes);
  }
  return result;
}

uint64_t *create_phrase_root_from_strings(const char *a1)
{
  uint64_t v2 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  if (*a1)
  {
    do
    {
      size_t v3 = strlen(a1);
      uint64_t v4 = &a1[v3 + 1];
      if (!*v4) {
        break;
      }
      int v5 = &v4[strlen(&a1[v3 + 1])];
      add_phrase(v2, a1, (uint64_t)v4);
      a1 = v5 + 1;
    }
    while (v5[1]);
  }
  return v2;
}

unsigned __int8 *next_phrase(unsigned __int8 *a1, unint64_t a2, uint64_t a3, unsigned __int8 **a4, void *a5)
{
  if (a3 && a2)
  {
    uint64_t v10 = a1;
    unint64_t v11 = a2;
    while (!find_phrase(a3, v10, v11, 1u, 1, a4, a5))
    {
      ++v10;
      if (!--v11) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    if (a4) {
      *a4 = &a1[a2];
    }
    uint64_t v10 = 0;
    if (a5) {
      *a5 = 0;
    }
  }
  return v10;
}

uint64_t *pinyin_root()
{
  v0 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  phrases_3 = (uint64_t)v0;
  uint64_t v1 = "a";
  uint64_t v2 = &off_2640F16C0;
  do
  {
    add_phrase(v0, v1, *((unsigned int *)v2 - 2));
    size_t v3 = *v2;
    v2 += 2;
    uint64_t v1 = v3;
  }
  while (v3);
  return v0;
}

uint64_t *jyutping_root()
{
  v0 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  phrases_2 = (uint64_t)v0;
  uint64_t v1 = "aa";
  uint64_t v2 = &off_2640F3060;
  do
  {
    add_phrase(v0, v1, *((unsigned int *)v2 - 2));
    size_t v3 = *v2;
    v2 += 2;
    uint64_t v1 = v3;
  }
  while (v3);
  return v0;
}

uint64_t *pinyin_root_extended(int a1)
{
  uint64_t v1 = &phrases_2;
  if (a1 != 1) {
    uint64_t v1 = &phrases_3;
  }
  uint64_t v2 = *v1;
  if (v2) {
    return (uint64_t *)v2;
  }
  if (a1 == 1) {
    return jyutping_root();
  }
  return pinyin_root();
}

unsigned __int8 *next_pinyin(unsigned __int8 *a1, unint64_t a2, int a3, int a4, unsigned __int8 **a5, _DWORD *a6)
{
  unint64_t v11 = pinyin_root_extended(a3);
  if (!v11
    || (uint64_t v17 = 0, v18 = 0, !find_phrase((uint64_t)v11, a1, a2, 0, 0, &v17, &v18))
    || (uint64_t v12 = v17, !a4) && &a1[a2] > v17 && is_interjection(a1, v17 - a1))
  {
    if (a5) {
      *a5 = a1;
    }
    a1 = 0;
    if (a6)
    {
      int v13 = 0;
      goto LABEL_19;
    }
    return a1;
  }
  int v13 = v18;
  uint64_t v14 = MEMORY[0x263EF8318];
  while (1)
  {
    uint64_t v15 = *v12;
    if ((char)*v12 < 0) {
      break;
    }
    if ((*(_DWORD *)(v14 + 4 * v15 + 60) & 0x2000) == 0) {
      goto LABEL_16;
    }
LABEL_15:
    uint64_t v17 = ++v12;
  }
  if (__maskrune(v15, 0x2000uLL)) {
    goto LABEL_15;
  }
LABEL_16:
  if (a5) {
    *a5 = v12;
  }
  if (a6) {
LABEL_19:
  }
    *a6 = v13;
  return a1;
}

BOOL is_interjection(unsigned __int8 *a1, uint64_t a2)
{
  if (a2 == 2)
  {
    int v6 = a1[1];
    if ((v6 - 65) >= 0x1A && (v6 - 192) >= 0x17)
    {
      if ((v6 - 216) >= 7)
      {
        if ((v6 - 138) <= 0x15 && ((1 << (v6 + 118)) & 0x200015) != 0) {
          return 0;
        }
LABEL_30:
        if (v6 != 111) {
          return 0;
        }
        int v9 = *a1;
        if ((v9 - 65) < 0x1A || (v9 - 192) < 0x17)
        {
          BOOL result = 1;
          if ((v9 - 138) <= 0x15 && ((1 << (v9 + 118)) & 0x200015) != 0) {
            return 0;
          }
          if (v9 == 76) {
            return result;
          }
        }
        else if ((v9 - 216) >= 7)
        {
          if ((v9 - 108) <= 0x33)
          {
            if (((1 << (v9 - 108)) & 0x8000540000000) != 0) {
              return 0;
            }
            if (v9 == 108) {
              return 1;
            }
          }
          return v9 == 121;
        }
        v9 += 32;
        return v9 == 121;
      }
    }
    else if ((v6 - 138) <= 0x15 && ((1 << (v6 + 118)) & 0x200015) != 0)
    {
      return 0;
    }
    v6 += 32;
    goto LABEL_30;
  }
  if (a2 != 1) {
    return 0;
  }
  int v2 = *a1;
  if ((v2 - 65) >= 0x1A && (v2 - 192) >= 0x17)
  {
    if ((v2 - 216) >= 7)
    {
      if ((v2 - 97) <= 0x3E)
      {
        if (((1 << (v2 - 97)) & 0x40002A0000000000) != 0) {
          return 0;
        }
        if (v2 == 97) {
          return 1;
        }
      }
      return v2 == 111;
    }
LABEL_25:
    v2 += 32;
    return v2 == 111;
  }
  BOOL result = 1;
  if ((v2 - 138) <= 0x15 && ((1 << (v2 + 118)) & 0x200015) != 0) {
    return 0;
  }
  if (v2 != 65) {
    goto LABEL_25;
  }
  return result;
}

uint64_t *is_partial_pinyin(unsigned __int8 *a1, unint64_t a2, int a3, _DWORD *a4)
{
  BOOL result = pinyin_root_extended(a3);
  if (result)
  {
    BOOL result = (uint64_t *)find_partial_phrase((BOOL)result, a1, a2, 0);
    if (result)
    {
      if (a4) {
        *a4 = 255;
      }
      return (uint64_t *)1;
    }
  }
  return result;
}

uint64_t internalFromExternalZhuyin(unsigned int a1)
{
  if (a1 - 12549 > 0x24)
  {
    if (a1 - 711 > 0x12)
    {
LABEL_7:
      if (a1 >= 0x100) {
        return 39;
      }
      else {
        return a1;
      }
    }
    else
    {
      uint64_t v2 = 0;
      while (toneCharacters[v2] != a1)
      {
        if (++v2 == 5) {
          goto LABEL_7;
        }
      }
      return (v2 + 49);
    }
  }
  else
  {
    return internalLetters[a1 - 12549];
  }
}

uint64_t externalZhuyinFromInternal(uint64_t result)
{
  for (uint64_t i = 0; i != 37; ++i)
  {
    if (internalLetters[i] == result)
    {
      LOWORD(result) = i + 12549;
      return (unsigned __int16)result;
    }
  }
  if ((result - 49) <= 4) {
    LOWORD(result) = toneCharacters[(result - 49)];
  }
  return (unsigned __int16)result;
}

uint64_t add_zhuyin(uint64_t *a1, unsigned __int8 **a2)
{
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v4 = *a2;
  if (*a2)
  {
    size_t v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      while (1)
      {
        ++v5;
        int v7 = *v4;
        if (v7 != 203) {
          break;
        }
        uint64_t v8 = 1;
LABEL_8:
        v4 += v8 + 1;
      }
      if (v7 == 227 && v4[1] == 132)
      {
        uint64_t v8 = 2;
        goto LABEL_8;
      }
      uint64_t v4 = a2[++v6];
      if (!v4) {
        goto LABEL_12;
      }
    }
  }
  size_t v5 = 0;
LABEL_12:
  uint64_t result = (uint64_t)malloc_type_malloc(v5, 0x1C2AE1EBuLL);
  add_zhuyin_internal_syllables = result;
  uint64_t v10 = *a2;
  if (!*a2) {
    return result;
  }
  unint64_t v11 = (char *)result;
  uint64_t v12 = 0;
  do
  {
    int v13 = v11++;
    uint64_t v14 = 255;
    while (1)
    {
      int v15 = *v10;
      if (v15 != 203) {
        break;
      }
      int v16 = 576;
      uint64_t v17 = 1;
LABEL_20:
      uint64_t v18 = &v10[v17];
      int v19 = *v18;
      uint64_t v10 = v18 + 1;
      int v20 = internalFromExternalZhuyin(v16 + v19);
      if ((v20 - 49) >= 5) {
        char v21 = v20;
      }
      else {
        char v21 = 0;
      }
      if ((v20 - 49) < 5) {
        uint64_t v14 = (1 << (v20 - 49));
      }
      *(v11++ - 1) = v21;
    }
    if (v15 == 227 && v10[1] == 132)
    {
      int v16 = 12416;
      uint64_t v17 = 2;
      goto LABEL_20;
    }
    *(v11 - 1) = 0;
    size_t v22 = strlen(v13);
    int phrase = find_phrase((uint64_t)a1, (unsigned __int8 *)v13, v22, 0, 0, (unsigned __int8 **)&v26, &v27);
    BOOL v24 = &v13[v22] != v26 || phrase == 0;
    uint64_t v25 = v27;
    if (v24) {
      uint64_t v25 = 0;
    }
    uint64_t result = add_phrase(a1, v13, v25 | v14);
    uint64_t v10 = a2[++v12];
  }
  while (v10);
  return result;
}

uint64_t *zhuyin_root1()
{
  v0 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  phrases_0 = (uint64_t)v0;
  add_zhuyin(v0, (unsigned __int8 **)zhuyin_syllables1);
  return v0;
}

uint64_t *zhuyin_root2()
{
  v0 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  phrases_1 = (uint64_t)v0;
  add_zhuyin(v0, (unsigned __int8 **)zhuyin_syllables2);
  return v0;
}

unsigned __int8 *next_zhuyin(unsigned __int8 *a1, unint64_t a2, int a3, int a4, void *a5, _DWORD *a6)
{
  uint64_t v12 = (uint64_t *)phrases_0;
  int v13 = (uint64_t *)phrases_1;
  if (phrases_0)
  {
    if (phrases_1) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
    phrases_0 = (uint64_t)v12;
    add_zhuyin(v12, (unsigned __int8 **)zhuyin_syllables1);
    if (v13) {
      goto LABEL_3;
    }
  }
  int v13 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  phrases_1 = (uint64_t)v13;
  add_zhuyin(v13, (unsigned __int8 **)zhuyin_syllables2);
LABEL_3:
  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    unint64_t v23 = 0;
    uint64_t v24 = 0;
    if (find_phrase((uint64_t)v12, a1, a2, 0, 0, &v23, &v24)
      || find_phrase((uint64_t)v13, a1, a2, 0, 0, &v23, &v24))
    {
      int v15 = v23;
      unint64_t v16 = (unint64_t)&a1[a2];
      if (a3 || v16 <= (unint64_t)v23)
      {
        if (v16 <= (unint64_t)v23) {
          goto LABEL_28;
        }
      }
      else if (is_interjection(a1, v23 - a1))
      {
        goto LABEL_28;
      }
      if (*v15 - 49 <= 4)
      {
        int v17 = v24;
        if (a4 || (v24 & (1 << (*v15 - 49))) != 0)
        {
          uint64_t v18 = v15 + 1;
          uint64_t v19 = MEMORY[0x263EF8318];
          do
          {
            unint64_t v23 = v18;
            uint64_t v20 = *v18;
            if ((char)*v18 < 0) {
              int v21 = __maskrune(v20, 0x2000uLL);
            }
            else {
              int v21 = *(_DWORD *)(v19 + 4 * v20 + 60) & 0x2000;
            }
            ++v18;
          }
          while (v21);
          if (a5) {
            *a5 = v18 - 1;
          }
          if (!a6) {
            return a1;
          }
LABEL_32:
          *a6 = v17;
          return a1;
        }
      }
    }
  }
LABEL_28:
  if (a5) {
    *a5 = a1;
  }
  a1 = 0;
  if (a6)
  {
    int v17 = 0;
    goto LABEL_32;
  }
  return a1;
}

BOOL is_partial_zhuyin(unsigned __int8 *a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6 = (uint64_t *)phrases_0;
  int v7 = (uint64_t *)phrases_1;
  if (phrases_0)
  {
    if (phrases_1) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
    phrases_0 = (uint64_t)v6;
    add_zhuyin(v6, (unsigned __int8 **)zhuyin_syllables1);
    if (v7) {
      goto LABEL_3;
    }
  }
  int v7 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  phrases_1 = (uint64_t)v7;
  add_zhuyin(v7, (unsigned __int8 **)zhuyin_syllables2);
LABEL_3:
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 0;
  }
  partial_int phrase = find_partial_phrase((BOOL)v6, a1, a2, 0);
  if (partial_phrase || (BOOL result = find_partial_phrase((BOOL)v7, a1, a2, 0)))
  {
    if (a3) {
      *a3 = 255;
    }
    return 1;
  }
  return result;
}

void sub_20CC46D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t findZhuyin(unint64_t a1, uint64_t a2, int a3, int a4, unsigned __int8 **a5, unsigned __int8 **a6, unsigned __int8 **a7, void *a8, void *a9, void *a10, unsigned char *a11, void *a12)
{
  uint64_t v14 = 0;
  uint64_t v43 = 0;
  uint64_t v15 = MEMORY[0x263EF8318];
  do
  {
    uint64_t v16 = *(unsigned __int8 *)(a1 + v14);
    if (*(char *)(a1 + v14) < 0) {
      int v17 = __maskrune(v16, 0x2000uLL);
    }
    else {
      int v17 = *(_DWORD *)(v15 + 4 * v16 + 60) & 0x2000;
    }
    ++v14;
  }
  while (v17);
  uint64_t v18 = (unsigned __int8 *)(a1 + v14 - 1);
  __int16 v44 = v18;
  uint64_t v19 = (unsigned __int8 *)(a1 + a2);
  if ((unint64_t)v18 >= a1 + a2)
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    unsigned __int16 v28 = 0;
    int v21 = 0;
    char v30 = 0;
    uint64_t v29 = 0;
    if (a12) {
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  uint64_t v20 = 0;
  int v21 = 0;
  size_t v22 = 0;
  unint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  char v40 = 0;
  while (1)
  {
    uint64_t v26 = v24;
    uint64_t v27 = v23;
    unsigned __int16 v28 = v22;
    uint64_t v29 = v20;
    uint64_t v24 = next_zhuyin(v18, v19 - v18, a3, a4, &v44, (_DWORD *)&v43 + 1);
    uint64_t v18 = v44;
    if (v24)
    {
      if (a12) {
        goto LABEL_10;
      }
    }
    else
    {
      if (!is_partial_zhuyin(v44, v19 - v44, &v43)) {
        goto LABEL_23;
      }
      uint64_t v24 = v44;
      __int16 v44 = v19;
      char v40 = 1;
      uint64_t v18 = v19;
      if (a12) {
LABEL_10:
      }
        a12[v29] = v18 - v24;
    }
    if (!v24 || (unint64_t)v24 < a1 || (unint64_t)v18 < a1) {
      break;
    }
    uint64_t v20 = v29 + 1;
    int v21 = v28;
    size_t v22 = v27;
    unint64_t v23 = v26;
    uint64_t v25 = v18;
    if (v18 >= v19) {
      goto LABEL_22;
    }
  }
  uint64_t v18 = v25;
  uint64_t v24 = v26;
  uint64_t v26 = v27;
  uint64_t v27 = v28;
  unsigned __int16 v28 = v21;
LABEL_22:
  int v21 = v28;
  unsigned __int16 v28 = v27;
  uint64_t v27 = v26;
  ++v29;
  uint64_t v25 = v18;
  uint64_t v26 = v24;
LABEL_23:
  char v30 = v40;
  if (a12) {
LABEL_24:
  }
    *a12 = *a12 + v14 - 1;
LABEL_25:
  if (v25) {
    BOOL v31 = v26 == 0;
  }
  else {
    BOOL v31 = 1;
  }
  uint64_t result = !v31;
  if (!v31)
  {
    if (a5)
    {
      uint64_t v33 = &v21[-a1];
      if (!v21) {
        uint64_t v33 = 0;
      }
      *a5 = v33;
    }
    if (a6)
    {
      uint64_t v34 = &v28[-a1];
      if (!v28) {
        uint64_t v34 = 0;
      }
      *a6 = v34;
    }
    if (a7)
    {
      unsigned int v35 = &v27[-a1];
      if (!v27) {
        unsigned int v35 = 0;
      }
      *a7 = v35;
    }
    if (a8) {
      *a8 = &v26[-a1];
    }
    if (a9) {
      *a9 = &v25[-a1];
    }
    if (a10) {
      *a10 = v29;
    }
    if (a11) {
      *a11 = v30 & 1;
    }
  }
  return result;
}

void *modificationArrayFilteredByMaskAndLength(void *a1, unint64_t a2, unint64_t a3)
{
  size_t v5 = a1;
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [a1 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = [*(id *)(*((void *)&v25 + 1) + 8 * v9) syllableRange];
      if (v11 + v10 + 7 < a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if (!a2) {
      return v5;
    }
  }
  uint64_t v12 = (void *)[MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v5);
        }
        int v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (((1 << [v17 modificationType]) & a2) == 0)
        {
          uint64_t v18 = [v17 syllableRange];
          if (v19 + v18 + 7 >= a3) {
            [v12 addObject:v17];
          }
        }
      }
      uint64_t v14 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }
  return v12;
}

uint64_t _NSSpellingDictDirectoryPath2()
{
  v0 = NSUserName();
  uint64_t v1 = [(NSString *)NSHomeDirectoryForUser(v0) stringByAppendingPathComponent:@"Library"];
  return (uint64_t)[(NSString *)v1 stringByAppendingPathComponent:@"Spelling"];
}

BOOL adjacentMatch(int a1, int a2, int a3)
{
  unsigned int v3 = a2 - 97;
  if ((a2 - 97) > 0x19)
  {
    if (a3 != 517) {
      return 0;
    }
    unsigned int v3 = a2 - 208;
    if ((a2 - 208) > 0x1F) {
      return 0;
    }
    uint64_t v4 = 6 * v3;
    size_t v5 = &adjacentMatchesCyrillic;
  }
  else
  {
    uint64_t v4 = 6 * v3;
    size_t v5 = &adjacentMatches;
  }
  return v5[v4] == a1
      || v5[6 * v3 + 1] == a1
      || v5[6 * v3 + 2] == a1
      || v5[6 * v3 + 3] == a1
      || v5[6 * v3 + 4] == a1
      || v5[6 * v3 + 5] == a1;
}

uint64_t restrictedEditDistance(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = a2 + 1;
  unint64_t v9 = a4 + 1;
  uint64_t v10 = malloc_type_calloc((a4 + 1) * (a2 + 1), 8uLL, 0x100004000313F17uLL);
  if (!v10) {
    return a4 + a2;
  }
  uint64_t v11 = 0;
  if (v8 <= 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v8;
  }
  uint64_t v13 = v10;
  do
  {
    *uint64_t v13 = v11++;
    v13 += a4 + 1;
  }
  while (v12 != v11);
  uint64_t v14 = 0;
  if (v9 <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v9;
  }
  do
  {
    v10[v14] = v14;
    ++v14;
  }
  while (v15 != v14);
  if (a2)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 8 * v9;
    uint64_t v18 = (char *)(v10 + 1);
    do
    {
      if (a4)
      {
        uint64_t v19 = 0;
        uint64_t v20 = v16 + 1;
        unint64_t v21 = *(void *)((char *)v10 + v17 * (v16 + 1));
        long long v22 = &v18[v17 * v16];
        do
        {
          int v23 = *(unsigned __int8 *)(a1 + v16);
          int v24 = *(unsigned __int8 *)(a3 + v19);
          unint64_t v25 = *((void *)v22 - 1);
          uint64_t v26 = *(void *)v22;
          if (v23 != v24) {
            ++v25;
          }
          if (v26 + 1 < v25) {
            unint64_t v25 = v26 + 1;
          }
          if (v21 + 1 < v25) {
            ++v21;
          }
          else {
            unint64_t v21 = v25;
          }
          if (v16
            && v19
            && v23 == *(unsigned __int8 *)(a3 - 1 + v19)
            && *(unsigned __int8 *)(a1 + v16 - 1) == v24
            && *(void *)((char *)&v10[v19 - 1] + v17 * (v16 - 1)) + (unint64_t)(v23 != v24) < v21)
          {
            unint64_t v21 = *(void *)((char *)&v10[v19 - 1] + v17 * (v16 - 1)) + (v23 != v24);
          }
          *(void *)&v18[8 * v19 + v17 * (v16 + 1)] = v21;
          v22 += 8;
          ++v19;
        }
        while (a4 != v19);
      }
      else
      {
        uint64_t v20 = v16 + 1;
      }
      uint64_t v16 = v20;
    }
    while (v20 != a2);
  }
  uint64_t v27 = v10[a4 + v9 * a2];
  free(v10);
  return v27;
}

uint64_t effectiveEditDistance(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  int v5 = a2 != 3 || a4 == 3;
  int v7 = a2 == 4 && a4 < 4;
  BOOL v9 = v7 == v5 || a2 - 3 > 0x1C || a4 - 3 > 0x1C;
  unint64_t v10 = a4 + 2;
  if (v9 || a2 + 2 < a4 || v10 < a2) {
    return 3;
  }
  int v14 = *(unsigned __int8 *)(a4 + a3 - 1);
  if (v14 == 46) {
    return 3;
  }
  BOOL v15 = a4 + 1 == a2 && *(unsigned char *)(a2 + a1 - 1) == 115;
  BOOL v16 = !v15 || v14 == 115;
  BOOL v17 = v16;
  if (v10 == a2 && v17)
  {
    int v18 = *(unsigned __int8 *)(a2 + a1 - 2);
    if (v18 == 44 || v18 == 59) {
      return 3;
    }
  }
  if (!v17) {
    return 3;
  }
  else {
    return restrictedEditDistance(a1, a2, a3, a4);
  }
}

uint64_t restrictedUTF16EditDistance(uint64_t a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4)
{
  unint64_t v8 = a2 + 1;
  unint64_t v9 = a4 + 1;
  unint64_t v10 = malloc_type_calloc((a4 + 1) * (a2 + 1), 8uLL, 0x100004000313F17uLL);
  if (!v10) {
    return a4 + a2;
  }
  uint64_t v11 = 0;
  if (v8 <= 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v8;
  }
  uint64_t v13 = v10;
  do
  {
    *uint64_t v13 = v11++;
    v13 += a4 + 1;
  }
  while (v12 != v11);
  uint64_t v14 = 0;
  if (v9 <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v9;
  }
  do
  {
    v10[v14] = v14;
    ++v14;
  }
  while (v15 != v14);
  if (a2)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 8 * v9;
    int v18 = (char *)(v10 + 1);
    do
    {
      if (a4)
      {
        uint64_t v19 = 0;
        int v20 = *(unsigned __int16 *)(a1 + 2 * v16);
        uint64_t v21 = v16 + 1;
        unint64_t v22 = *(void *)((char *)v10 + v17 * (v16 + 1));
        int v23 = &v18[v17 * v16];
        int v24 = a3;
        do
        {
          int v25 = *v24;
          unint64_t v26 = *((void *)v23 - 1);
          uint64_t v27 = *(void *)v23;
          if (v20 != v25) {
            ++v26;
          }
          if (v27 + 1 < v26) {
            unint64_t v26 = v27 + 1;
          }
          if (v22 + 1 < v26) {
            ++v22;
          }
          else {
            unint64_t v22 = v26;
          }
          if (v16
            && v19
            && v20 == *(v24 - 1)
            && *(unsigned __int16 *)(a1 + 2 * (v16 - 1)) == v25
            && *(void *)((char *)&v10[v19 - 1] + v17 * (v16 - 1)) + (unint64_t)(v20 != v25) < v22)
          {
            unint64_t v22 = *(void *)((char *)&v10[v19 - 1] + v17 * (v16 - 1)) + (v20 != v25);
          }
          *(void *)&v18[8 * v19 + v17 * (v16 + 1)] = v22;
          v23 += 8;
          ++v24;
          ++v19;
        }
        while (a4 != v19);
      }
      else
      {
        uint64_t v21 = v16 + 1;
      }
      uint64_t v16 = v21;
    }
    while (v21 != a2);
  }
  uint64_t v28 = v10[a4 + v9 * a2];
  free(v10);
  return v28;
}

uint64_t effectiveUTF16EditDistance(uint64_t a1, unint64_t a2, unsigned __int16 *a3, unint64_t a4)
{
  int v5 = a2 != 3 || a4 == 3;
  int v7 = a2 == 4 && a4 < 4;
  BOOL v9 = v7 == v5 || a2 - 3 > 0x1C || a4 - 3 > 0x1C;
  unint64_t v10 = a4 + 2;
  if (v9 || a2 + 2 < a4 || v10 < a2) {
    return 3;
  }
  int v14 = a3[a4 - 1];
  if (v14 == 46) {
    return 3;
  }
  BOOL v15 = a4 + 1 == a2 && *(_WORD *)(a1 + 2 * a2 - 2) == 115;
  BOOL v16 = !v15 || v14 == 115;
  BOOL v17 = v16;
  if (v10 == a2 && v17)
  {
    int v18 = *(unsigned __int16 *)(a1 + 2 * a2 - 4);
    if (v18 == 44 || v18 == 59) {
      return 3;
    }
  }
  if (!v17) {
    return 3;
  }
  else {
    return restrictedUTF16EditDistance(a1, a2, a3, a4);
  }
}

uint64_t toLowerX_1(uint64_t result, int a2)
{
  if (a2 <= 1279)
  {
    if (a2 == 514)
    {
      if ((result - 65) >= 0x1A
        && (result - 192) >= 0x17
        && ((result - 161) > 0x3D || ((1 << (result + 95)) & 0x3F80000000006F35) == 0))
      {
        return result;
      }
      if (result - 161) < 0xF && ((0x6F35u >> (result + 95))) {
        return dword_20CC67620[(int)result - 161];
      }
      return (result + 32);
    }
    if (a2 == 517)
    {
      if ((result - 65) >= 0x1A && (result - 176) > 0x1F)
      {
        if ((result & 0xFFFFFFFE) != 0xAE && (result - 161) >= 0xC) {
          return result;
        }
        else {
          return (result + 80);
        }
      }
      return (result + 32);
    }
LABEL_32:
    if ((result - 65) >= 0x1A) {
      return result;
    }
    else {
      return (result + 32);
    }
  }
  if (a2 != 1284)
  {
    if (a2 != 1280) {
      goto LABEL_32;
    }
    if ((result - 65) >= 0x1A && (result - 192) >= 0x17)
    {
      if ((result - 216) < 7) {
        return (result + 32);
      }
      goto LABEL_44;
    }
    if ((result - 138) > 0x15 || ((1 << (result + 118)) & 0x200015) == 0) {
      return (result + 32);
    }
LABEL_46:
    if (result == 159) {
      return 255;
    }
    else {
      return (result + 16);
    }
  }
  if ((result - 65) < 0x1A || (result - 192) < 0x17)
  {
    if ((result - 138) > 0x15 || ((1 << (result + 118)) & 0x200015) == 0)
    {
      if (result == 73) {
        return 253;
      }
      return (result + 32);
    }
    goto LABEL_46;
  }
  if ((int)result <= 215)
  {
LABEL_44:
    if ((result - 138) > 0x15 || ((1 << (result + 118)) & 0x200015) == 0) {
      return result;
    }
    goto LABEL_46;
  }
  if ((result - 216) < 5) {
    return (result + 32);
  }
  if (result == 221) {
    return 105;
  }
  if (result == 222) {
    return (result + 32);
  }
  return result;
}

uint64_t removeDiacriticsX_0(uint64_t result, int a2)
{
  if (a2 == 514)
  {
    if ((int)result < 161) {
      return result;
    }
    if (result > 0xF7
      || (result - 216) < 0x1F
      || (result - 192) < 0x17
      || (result & 0xFFFFFFDF) - 65 < 0x1A)
    {
      if (result == 161) {
        return 65;
      }
    }
    else
    {
      if ((result - 161) > 0x1E) {
        return result;
      }
      if (((1 << (result + 95)) & 0x6F356F34) == 0)
      {
        if (result == 161) {
          return 65;
        }
        return result;
      }
    }
    if (result < 0xA6) {
      return 76;
    }
    if (result < 0xAB) {
      return 83;
    }
    if (result == 171) {
      return 84;
    }
    if (result < 0xB0) {
      return 90;
    }
    if (result == 177) {
      return 97;
    }
    if (result < 0xB6) {
      return 108;
    }
    if (result < 0xBB) {
      return 115;
    }
    if (result == 187) {
      return 116;
    }
    if (result < 0xC0) {
      return 122;
    }
    if (result == 192) {
      return 82;
    }
    if (result < 0xC5) {
      return 65;
    }
    if (result == 197) {
      return 76;
    }
    if (result >= 0xC9)
    {
      if (result < 0xCD) {
        return 69;
      }
      if (result < 0xCF) {
        return 73;
      }
      if (result == 208) {
        return 68;
      }
      if (result < 0xD3) {
        return 78;
      }
      if (result < 0xD7) {
        return 79;
      }
      if (result == 216) {
        return 82;
      }
      unsigned int v3 = result - 221;
      if (result < 0xDD) {
        return 85;
      }
      if (v3 < 4) {
        return dword_20CC61CC0[v3];
      }
      if (result < 0xE5) {
        return 65;
      }
      if (result == 229) {
        return 76;
      }
      if (result >= 0xE9)
      {
        if (result < 0xED) {
          return 69;
        }
        if (result < 0xEF) {
          return 73;
        }
        if (result == 240) {
          return 68;
        }
        if (result < 0xF3) {
          return 78;
        }
        if (result >= 0xF7)
        {
          if (result != 248)
          {
            if (result < 0xFD) {
              return 85;
            }
            if (result == 254) {
              unsigned int v4 = 84;
            }
            else {
              unsigned int v4 = 255;
            }
            if (result == 253) {
              return 89;
            }
            else {
              return v4;
            }
          }
          return 82;
        }
        return 79;
      }
    }
    return 67;
  }
  if (a2 != 1284 && a2 != 1280 || (int)result < 193) {
    return result;
  }
  if (result < 0xC6) {
    return 65;
  }
  if (result == 199) {
    return 67;
  }
  int v2 = result & 0x7FFFFFFC;
  if ((result & 0xFFFFFFFC) == 0xC8) {
    return 69;
  }
  if (v2 == 204) {
    return 73;
  }
  if (result - 209) < 8 && ((0xBFu >> (result + 47))) {
    return dword_20CC6765C[(int)result - 209];
  }
  if ((result - 217) < 4) {
    return 85;
  }
  if (result == 221) {
    return 89;
  }
  if ((result - 224) < 6) {
    return 97;
  }
  if (result == 231) {
    return 99;
  }
  if (v2 == 232) {
    return 101;
  }
  if (v2 == 236) {
    return 105;
  }
  if (result - 241) < 8 && ((0xBFu >> (result + 15))) {
    return dword_20CC6767C[(int)result - 241];
  }
  if ((result - 249) < 4) {
    return 117;
  }
  if ((result & 0xFFFFFFFD) == 0xFD) {
    return 121;
  }
  return result;
}

uint64_t toUpperX_0(uint64_t result, int a2)
{
  if (a2 > 1279)
  {
    if (a2 == 1284)
    {
      if ((int)result > 247 || (result - 97) < 0x1A || (result - 223) < 0x18)
      {
        if ((int)result <= 157)
        {
          if (result == 105) {
            return 221;
          }
          if (result != 154 && result != 156) {
            return (result - 32);
          }
        }
        else
        {
          if ((int)result > 252)
          {
            if (result == 253) {
              return 73;
            }
            if (result == 255) {
              return 159;
            }
            return (result - 32);
          }
          if (result != 158)
          {
            if (result == 223) {
              return result;
            }
            return (result - 32);
          }
        }
        return (result - 16);
      }
    }
    else
    {
      if (a2 != 1280) {
        goto LABEL_39;
      }
      if ((int)result > 247 || (result - 97) < 0x1A || (result - 223) < 0x18)
      {
        if ((result - 154) > 4 || ((1 << (result + 102)) & 0x15) == 0)
        {
          if (result == 255) {
            unsigned int v3 = 159;
          }
          else {
            unsigned int v3 = result - 32;
          }
          if (result == 223) {
            return 223;
          }
          else {
            return v3;
          }
        }
        return (result - 16);
      }
    }
    if ((result - 154) > 4 || ((1 << (result + 102)) & 0x15) == 0) {
      return result;
    }
    return (result - 16);
  }
  if (a2 != 514)
  {
    if (a2 == 517)
    {
      if ((result - 97) >= 0x1A && (result - 208) > 0x1F)
      {
        if ((result - 241) >= 0xC && (int)result <= 253) {
          return result;
        }
        else {
          return (result - 80);
        }
      }
      return (result - 32);
    }
LABEL_39:
    if ((result - 97) >= 0x1A) {
      return result;
    }
    else {
      return (result - 32);
    }
  }
  if ((result - 97) < 0x1A
    || (result - 223) < 0x18
    || (result - 177) <= 0xE && ((1 << (result + 79)) & 0x6F35) != 0
    || (result - 248) < 7)
  {
    if (result - 177) < 0xF && ((0x6F35u >> (result + 79))) {
      return dword_20CC6769C[(int)result - 177];
    }
    return (result - 32);
  }
  return result;
}

void sub_20CC4F040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_20CC51FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t findPinyin(unsigned __int8 *a1, uint64_t a2, int a3, int a4, void *a5, unsigned __int8 **a6, unsigned __int8 **a7, void *a8, void *a9, void *a10, void *a11, unsigned char *a12, uint64_t *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  uint64_t v21 = 0;
  uint64_t v85 = 0;
  unsigned int v84 = 0;
  uint64_t v22 = MEMORY[0x263EF8318];
  do
  {
    uint64_t v23 = a1[v21];
    if ((char)a1[v21] < 0) {
      int v24 = __maskrune(v23, 0x2000uLL);
    }
    else {
      int v24 = *(_DWORD *)(v22 + 4 * v23 + 60) & 0x2000;
    }
    ++v21;
  }
  while (v24);
  int v82 = a4;
  int v25 = &a1[v21 - 1];
  __int16 v86 = 0;
  v87[0] = v25;
  uint64_t v80 = &a1[a2];
  if (v25 >= &a1[a2])
  {
    int v25 = 0;
    uint64_t v31 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    unint64_t v58 = 0;
    unsigned int v27 = 0;
    unsigned int v57 = 0;
    unsigned int v56 = 0;
    char v70 = 0;
    uint64_t v28 = 0;
    uint64_t v78 = 0;
LABEL_61:
    uint64_t v34 = a18;
    goto LABEL_62;
  }
  unsigned int v72 = 0;
  unsigned int v26 = 0;
  unsigned int v27 = 0;
  uint64_t v78 = 0;
  uint64_t v28 = 0;
  char v71 = 0;
  uint64_t v29 = 0;
  char v30 = 0;
  uint64_t v31 = 0;
  unint64_t v32 = 0;
  uint64_t v33 = 0;
  char v70 = 0;
  uint64_t v73 = a1;
  uint64_t v34 = a18;
  unsigned int v35 = v80;
  do
  {
    uint64_t v36 = v31;
    uint64_t v37 = v30;
    uint64_t v77 = v29;
    unsigned int v75 = v27;
    unsigned int v74 = v26;
    pinyin = next_pinyin(v25, v35 - v25, a3, v82, v87, (_DWORD *)&v85 + 1);
    if (pinyin)
    {
      uint64_t v31 = pinyin;
      if (v34) {
        v34[v28] = v87[0] - pinyin;
      }
      v78 += HIDWORD(v85);
      uint64_t v79 = v28 + 1;
    }
    else
    {
      uint64_t v31 = v87[0];
      if (*v87[0] == 127)
      {
        ++v87[0];
        if (v34) {
          v34[v28] = 1;
        }
        uint64_t v79 = v28 + 1;
      }
      else if (is_partial_pinyin(v87[0], v80 - v87[0], a3, &v84))
      {
        uint64_t v31 = v87[0];
        v87[0] = v80;
        if (v34) {
          v34[v28] = v80 - v31;
        }
        v78 += v84;
        uint64_t v79 = v28 + 1;
        char v70 = 1;
      }
      else
      {
        uint64_t v79 = v28;
        uint64_t v31 = 0;
      }
    }
    uint64_t v39 = 0;
    char v40 = 1;
    do
    {
      char v41 = v40;
      if (v33 && !v31 && v36)
      {
        if (v33 > &v36[v39 + 1]
          && v36 == next_pinyin(v36, &v33[-v39 - 1] - v36, a3, v82, &v86, &v85)
          && (v87[0] = v86,
              __int16 v42 = next_pinyin(v86, v80 - v86, a3, v82, v87, (_DWORD *)&v85 + 1),
              uint64_t v43 = v87[0],
              v87[0] > v33))
        {
          uint64_t v31 = v42;
          if (v42)
          {
            if (a18)
            {
              __int16 v44 = &a18[v79];
              *(v44 - 1) = v42 - v36;
              *__int16 v44 = v43 - v42;
            }
            uint64_t v78 = v78 - v27 + (HIDWORD(v85) + v85);
            ++v79;
          }
        }
        else
        {
          uint64_t v31 = 0;
        }
      }
      char v40 = 0;
      uint64_t v39 = 1;
    }
    while ((v41 & 1) != 0);
    uint64_t v45 = 0;
    char v46 = 1;
    int v47 = a3;
    int v48 = v77;
    do
    {
      char v49 = v46;
      if (v32 && !v31 && v37)
      {
        if (v32 <= (unint64_t)&v37[v45 + 1]
          || v37 != next_pinyin(v37, v32 - 1 - v45 - (void)v37, v47, v82, &v86, &v85))
        {
          uint64_t v31 = 0;
          goto LABEL_41;
        }
        int v83 = 0;
        int v50 = next_pinyin(v86, v80 - v86, v47, v82, &v86, &v83);
        int v51 = v47;
        if (!v50)
        {
          uint64_t v31 = 0;
LABEL_52:
          int v48 = v77;
          goto LABEL_41;
        }
        uint64_t v52 = v50;
        v87[0] = v86;
        __int16 v53 = next_pinyin(v86, v80 - v86, v51, v82, v87, (_DWORD *)&v85 + 1);
        uint64_t v54 = v87[0];
        if (v87[0] <= v33)
        {
          uint64_t v31 = 0;
          int v47 = a3;
          goto LABEL_52;
        }
        uint64_t v31 = v53;
        int v48 = v77;
        if (v53)
        {
          if (a18)
          {
            unint64_t v55 = &a18[v79];
            *(v55 - 2) = v52 - v37;
            *(v55 - 1) = v53 - v52;
            void *v55 = v54 - v53;
          }
          ++v79;
          uint64_t v78 = v78 - (v74 + v75) + (v83 + v85 + HIDWORD(v85));
        }
        int v47 = a3;
      }
LABEL_41:
      char v46 = 0;
      uint64_t v45 = 1;
    }
    while ((v49 & 1) != 0);
    uint64_t v28 = v79;
    if (!v31)
    {
      int v25 = v33;
      uint64_t v31 = v36;
      uint64_t v36 = v37;
      uint64_t v37 = v48;
      unint64_t v58 = v71;
      unsigned int v27 = v75;
      unsigned int v57 = v74;
      unsigned int v56 = v72;
      a1 = v73;
      goto LABEL_61;
    }
    a1 = v73;
    if (v31 < v73 || (int v25 = v87[0], v87[0] < v73))
    {
      int v25 = v33;
      uint64_t v31 = v36;
      uint64_t v36 = v37;
      uint64_t v37 = v77;
      unint64_t v58 = v71;
      unsigned int v27 = v75;
      unsigned int v57 = v74;
      unsigned int v56 = v72;
      goto LABEL_61;
    }
    unsigned int v27 = HIDWORD(v85);
    unsigned int v56 = v74;
    unsigned int v72 = v74;
    unsigned int v57 = v75;
    unsigned int v26 = v75;
    unint64_t v58 = v77;
    char v71 = v77;
    uint64_t v29 = v37;
    char v30 = v36;
    unint64_t v32 = (unint64_t)v33;
    uint64_t v33 = v87[0];
    unsigned int v35 = v80;
    uint64_t v34 = a18;
  }
  while (v87[0] < v80);
LABEL_62:
  unsigned int v76 = v57;
  unsigned int v59 = v56;
  __int16 v86 = 0;
  if (v34) {
    *uint64_t v34 = *v34 + v21 - 1;
  }
  if (v25) {
    BOOL v60 = v31 == 0;
  }
  else {
    BOOL v60 = 1;
  }
  uint64_t v61 = !v60;
  if (!v60)
  {
    if (a5)
    {
      uint64_t v62 = v58 - a1;
      if (!v58) {
        uint64_t v62 = 0;
      }
      *a5 = v62;
    }
    if (a6)
    {
      char v63 = (unsigned __int8 *)(v37 - a1);
      if (!v37) {
        char v63 = 0;
      }
      *a6 = v63;
    }
    if (a7)
    {
      int v64 = (unsigned __int8 *)(v36 - a1);
      if (!v36) {
        int v64 = 0;
      }
      *a7 = v64;
    }
    if (a8) {
      *a8 = v31 - a1;
    }
    if (a9) {
      *a9 = v25 - a1;
    }
    if (v25 < v80
      && v25 > v31 + 1
      && v31 == next_pinyin(v31, (unint64_t)&v25[~(unint64_t)v31], a3, v82, &v86, (_DWORD *)&v85 + 1))
    {
      if (a10) {
        *a10 = v86 - a1;
      }
      if (a14) {
        *a14 = v78 - v27 + HIDWORD(v85);
      }
    }
    if (a11) {
      *a11 = v28;
    }
    if (a12) {
      *a12 = v70 & 1;
    }
    if (a15) {
      *a15 = v78 - v27;
    }
    if (a16) {
      *a16 = v78 - (v76 + (unint64_t)v27);
    }
    if (a17) {
      *a17 = v78 - (v76 + (unint64_t)v27 + v59);
    }
    if (a13) {
      *a13 = v78;
    }
  }
  return v61;
}

uint64_t isFullOrAbbreviatedPinyin(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  unint64_t v8 = (unsigned __int8 *)(a1 - 1);
  uint64_t v9 = MEMORY[0x263EF8318];
  do
  {
    uint64_t v10 = v8[1];
    if ((char)v8[1] < 0) {
      int v11 = __maskrune(v10, 0x2000uLL);
    }
    else {
      int v11 = *(_DWORD *)(v9 + 4 * v10 + 60) & 0x2000;
    }
    ++v8;
  }
  while (v11);
  BOOL v17 = v8;
  unint64_t v12 = a1 + a2;
  if ((unint64_t)v8 >= a1 + a2)
  {
    uint64_t v13 = 0;
    if (!a4) {
      return 1;
    }
    goto LABEL_19;
  }
  uint64_t v13 = 0;
  do
  {
    if (next_pinyin(v8, v12 - (void)v8, a3, 1, &v17, 0))
    {
      ++v13;
    }
    else
    {
      int v14 = v17;
      unsigned int v15 = *v17;
      if (memchr("bcdfghjklmnpqrstwxyz", v15, 0x15uLL))
      {
        ++v13;
      }
      else if ((v15 & 0x80) != 0)
      {
        uint64_t result = __maskrune(v15, 0x2000uLL);
        if (!result) {
          return result;
        }
      }
      else
      {
        uint64_t result = *(_DWORD *)(v9 + 4 * v15 + 60) & 0x2000;
        if (!result) {
          return result;
        }
      }
      BOOL v17 = v14 + 1;
    }
    unint64_t v8 = v17;
  }
  while ((unint64_t)v17 < v12);
  if (a4) {
LABEL_19:
  }
    *a4 = v13;
  return 1;
}

uint64_t PRCopyAlternativesForPinyinInputString(uint64_t a1)
{
  int v2 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    int v2 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v2;
  }
  return (uint64_t)[(AppleSpell *)v2 spellServer:0 _retainedAlternativesForPinyinInputString:a1 extended:0];
}

uint64_t PRCopyPrefixesForPinyinInputString(uint64_t a1)
{
  int v2 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    int v2 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v2;
  }
  return (uint64_t)[(AppleSpell *)v2 spellServer:0 _retainedPrefixesForPinyinInputString:a1];
}

uint64_t PRCopyCorrectionsForPinyinInputString(uint64_t a1)
{
  int v2 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    int v2 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v2;
  }
  return (uint64_t)[(AppleSpell *)v2 spellServer:0 _retainedCorrectionsForPinyinInputString:a1];
}

uint64_t PRCopyModificationsForPinyinInputString(uint64_t a1)
{
  int v2 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    int v2 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v2;
  }
  return (uint64_t)[(AppleSpell *)v2 spellServer:0 _retainedModificationsForPinyinInputString:a1 geometryModelData:0];
}

uint64_t PRCopyModificationsForPinyinInputStringWithGeometryModelData(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    unsigned int v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return (uint64_t)[(AppleSpell *)v4 spellServer:0 _retainedModificationsForPinyinInputString:a1 geometryModelData:a2];
}

uint64_t PRCopyFinalModificationsForPinyinInputString(uint64_t a1)
{
  int v2 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    int v2 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v2;
  }
  return (uint64_t)[(AppleSpell *)v2 spellServer:0 _retainedFinalModificationsForPinyinInputString:a1 geometryModelData:0];
}

uint64_t ConvertStringToHangulCompatibilityJamo(void *a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 length];
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  int v5 = (char *)v21 - v4;
  if (v3)
  {
    char v6 = 0;
    int v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = [a1 characterAtIndex:v9];
      int v11 = v10;
      if ((v10 & 0xFF00) == 0x1100)
      {
        if ((v6 & ((v7 - 4520) < 0x1B)) != 0 || (v10 - 4371) <= 0xFFFFFFEC)
        {
          int v12 = 0;
          int v13 = 22;
          while (1)
          {
            int v14 = v12 + v13;
            if (v12 + v13 < 0 != __OFADD__(v12, v13)) {
              ++v14;
            }
            int v15 = v14 >> 1;
            uint64_t v16 = (uint64_t)v14 >> 1;
            unsigned int v17 = *((unsigned __int16 *)&CompoundJamoTable + 3 * v15 + 2);
            if (v17 == v10) {
              break;
            }
            if (v17 >= v10) {
              int v13 = v16 - 1;
            }
            else {
              int v12 = v16 + 1;
            }
            if (v12 > v13) {
              goto LABEL_14;
            }
          }
          uint64_t v19 = (unsigned __int16 *)((char *)&CompoundJamoTable + 6 * (int)v16);
          uint64_t v18 = v19[1];
          *(_WORD *)&v5[2 * v8++] = HangulJamoToCompatibility(*v19);
          char v6 = 1;
        }
        else
        {
LABEL_14:
          char v6 = 0;
          uint64_t v18 = v10;
        }
        LOWORD(v10) = HangulJamoToCompatibility(v18);
      }
      else
      {
        char v6 = 0;
      }
      *(_WORD *)&v5[2 * v8++] = v10;
      ++v9;
      int v7 = v11;
    }
    while (v9 != v2);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return [NSString stringWithCharacters:v5 length:v8];
}

uint64_t HangulJamoToCompatibility(uint64_t result)
{
  if ((result & 0xFF00) == 0x1100)
  {
    if (result >> 3 >= 0x235)
    {
      int v1 = result - 4520;
      if ((result - 4520) > 0x1A) {
        return result;
      }
      uint64_t v2 = (__int16 *)&JongToCompatibilityTable;
      return (unsigned __int16)v2[v1];
    }
    if (result < 0x1161)
    {
      int v1 = result - 4352;
      if ((result - 4352) > 0x12) {
        return result;
      }
      uint64_t v2 = (__int16 *)&ChoToCompatibilityTable;
      return (unsigned __int16)v2[v1];
    }
    int v1 = result - 4449;
    if ((result - 4449) <= 0x14)
    {
      uint64_t v2 = &JungToCompatibilityTable;
      return (unsigned __int16)v2[v1];
    }
    if (result == 4513) {
      unsigned int v3 = 12686;
    }
    else {
      unsigned int v3 = result;
    }
    if (result == 4510) {
      return 12685;
    }
    else {
      return v3;
    }
  }
  return result;
}

uint64_t ConvertStringFromHangulCompatibilityJamo(void *a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  unint64_t v2 = [a1 length];
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  int v5 = (char *)v21 - v4;
  if (v3)
  {
    unsigned int v6 = 0;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      unsigned int v9 = [a1 characterAtIndex:v8++];
      if (v8 >= v2) {
        int v10 = 0;
      }
      else {
        int v10 = [a1 characterAtIndex:v8];
      }
      if (v9 - 12593 <= 0x5D)
      {
        unsigned int v11 = v10 - 12687;
        BOOL v13 = v6 - 4371 < 0xFFFFFFED && v11 < 0xFFFFFFC0;
        int v14 = HangulCompatibilityToJamo(v9, v13);
        if (!v7) {
          goto LABEL_21;
        }
        unint64_t v15 = 0;
        BOOL v16 = 1;
        unsigned int v17 = &word_20CC67BBC;
        while ((unsigned __int16)*(v17 - 2) != v6 || (unsigned __int16)*(v17 - 1) != v14)
        {
          BOOL v16 = v15 < 0x16;
          v17 += 3;
          if (++v15 == 23) {
            goto LABEL_21;
          }
        }
        if (v16)
        {
          unsigned int v9 = (unsigned __int16)*v17;
          --v7;
        }
        else
        {
LABEL_21:
          BOOL v19 = v6 - 4449 < 0x42 && v11 < 0xFFFFFFC0;
          unsigned int v9 = HangulCompatibilityToJamo(v9, v19);
        }
      }
      *(_WORD *)&v5[2 * v7] = v9;
      unsigned int v6 = v9;
      ++v7;
    }
    while (v8 != v2);
  }
  return objc_msgSend(NSString, "stringWithCharacters:length:", v5);
}

uint64_t HangulCompatibilityToJamo(unsigned int a1, int a2)
{
  if (a1 - 12593 > 0x1D)
  {
    if (a1 - 12623 <= 0x3F)
    {
      uint64_t v3 = &JungToCompatibilityTable;
      uint64_t v2 = 21;
      unsigned __int16 v4 = 4449;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 19;
    if (a2) {
      uint64_t v2 = 27;
    }
    uint64_t v3 = (__int16 *)&ChoToCompatibilityTable;
    if (a2) {
      uint64_t v3 = (__int16 *)&JongToCompatibilityTable;
    }
    unsigned __int16 v4 = 4352;
    if (a2) {
      unsigned __int16 v4 = 4520;
    }
LABEL_11:
    while (1)
    {
      int v5 = (unsigned __int16)*v3++;
      if (v5 == a1) {
        break;
      }
      ++v4;
      if (!--v2) {
        goto LABEL_15;
      }
    }
    a1 = v4;
  }
LABEL_15:
  if (a1 == 12686) {
    unsigned int v6 = 4513;
  }
  else {
    unsigned int v6 = a1;
  }
  if (a1 == 12685) {
    return 4510;
  }
  else {
    return v6;
  }
}

void sub_20CC5E2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x270EE44B8](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x270EE44C0](heap);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x270EE44C8](heap);
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x270EE4760](theSet, theChar);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x270EE50F8](alloc, chars, numChars);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFIndex CFStringTokenizerGetCurrentSubTokens(CFStringTokenizerRef tokenizer, CFRange *ranges, CFIndex maxRangeLength, CFMutableArrayRef derivedSubTokens)
{
  return MEMORY[0x270EE5298](tokenizer, ranges, maxRangeLength, derivedSubTokens);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x270F474B0]();
}

uint64_t LXCursorCopyTraversedCharacters()
{
  return MEMORY[0x270F46E88]();
}

uint64_t LXCursorCreateByAdvancing()
{
  return MEMORY[0x270F46E90]();
}

uint64_t LXCursorEnumerateChildren()
{
  return MEMORY[0x270F46EA8]();
}

uint64_t LXCursorEnumerateEntries()
{
  return MEMORY[0x270F46EB0]();
}

uint64_t LXCursorEnumerateEntriesRecursively()
{
  return MEMORY[0x270F46EB8]();
}

uint64_t LXCursorHasChildren()
{
  return MEMORY[0x270F46EC0]();
}

uint64_t LXCursorHasEntries()
{
  return MEMORY[0x270F46EC8]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x270F46EF0]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x270F46EF8]();
}

uint64_t LXEntryGetProbability()
{
  return MEMORY[0x270F46F00]();
}

uint64_t LXEntryGetTokenID()
{
  return MEMORY[0x270F46F08]();
}

uint64_t LXLexiconAdd()
{
  return MEMORY[0x270F46F30]();
}

uint64_t LXLexiconCopyEntryForTokenID()
{
  return MEMORY[0x270F46F48]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x270F46F50]();
}

uint64_t LXLexiconCreateMutable()
{
  return MEMORY[0x270F46F58]();
}

uint64_t LXLexiconCreateRootCursor()
{
  return MEMORY[0x270F46F60]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x270EF2AD8](userName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSOrthographyFlagsForScriptAndOrthographyIndexes()
{
  return MEMORY[0x270EF2B70]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x270EF2C70]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x270ED7E40]();
}

uint64_t __strcat_chk()
{
  return MEMORY[0x270ED7EC8]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x270ED7ED0]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t __strncat_chk()
{
  return MEMORY[0x270ED7EE8]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x270ED7EF0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x270ED98A0](*(void *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int getc(FILE *a1)
{
  return MEMORY[0x270ED9BC0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x270EDA5A8](__y, __x);
  return result;
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
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

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x270EDB068](a1, a2);
}

int putc(int a1, FILE *a2)
{
  return MEMORY[0x270EDB088](*(void *)&a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

void srandom(unsigned int a1)
{
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB5A0](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x270EDB5C8](__s, __charset);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncasecmp_l(const char *a1, const char *a2, size_t a3, locale_t a4)
{
  return MEMORY[0x270EDB628](a1, a2, a3, a4);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x270EDB630](__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x270EDBC38](*(void *)&a1, a2, *(void *)&a3);
}