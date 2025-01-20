BOOL sub_1000BDE10(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return sub_10002025C(*(void *)(a1 + 8), a2, a3);
}

uint64_t sub_1000BDE18(uint64_t *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *a1;
  if (v2)
  {
    unsigned int v3 = sub_10008489C(v2);
    uint64_t v4 = sub_1000C085C(v3, 4, 0xFFFFFFFF);
    uint64_t v5 = a1[3];
    if (!v5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v4 = 0xFFFFFFFFLL;
  uint64_t v5 = a1[3];
  if (v5)
  {
LABEL_4:
    unsigned int v6 = sub_100096364(v5);
    uint64_t v4 = sub_1000C085C(v6, 4, v4);
  }
LABEL_5:
  uint64_t v7 = a1[4];
  if (v7)
  {
    unsigned int v8 = sub_10009BFEC(v7);
    uint64_t v4 = sub_1000C085C(v8, 4, v4);
  }
  uint64_t v9 = a1[1];
  if (v9)
  {
    unsigned int v10 = sub_100020410(v9);
    uint64_t v4 = sub_1000C085C(v10, 4, v4);
  }
  uint64_t v11 = a1[2];
  if (v11)
  {
    unsigned int v12 = sub_100076994(v11);
    uint64_t v4 = sub_1000C085C(v12, 4, v4);
  }
  uint64_t v13 = a1[6];
  if (v13)
  {
    unsigned int v14 = sub_100064C5C(v13);
    uint64_t v4 = sub_1000C085C(v14, 4, v4);
  }
  uint64_t v15 = a1[5];
  if (v15)
  {
    unsigned int v16 = sub_100023EAC(v15);
    uint64_t v4 = sub_1000C085C(v16, 4, v4);
  }
  uint64_t v17 = a1[7];
  if (v17)
  {
    unsigned int v18 = sub_1000AF9D4(v17);
    uint64_t v4 = sub_1000C085C(v18, 4, v4);
  }
  v19 = (unsigned int *)a1[8];
  if (!v19) {
    return v4;
  }
  unsigned int v20 = sub_100052634(v19);
  return sub_1000C085C(v20, 4, v4);
}

uint64_t sub_1000BDF64(uint64_t *a1)
{
  return sub_1000848B0(*a1);
}

uint64_t sub_1000BDF6C(uint64_t *a1, unsigned int a2, int a3, unsigned __int16 *a4, int a5)
{
  signed int v35 = 0;
  if (a2 >> 30 == 1) {
    sub_10001ED14(a1[1], (unsigned __int16)a2, (unsigned int *)&v35);
  }
  int v10 = sub_1000CAD00((unint64_t)"<START_DOCUMENT>");
  int v11 = sub_100084674(*a1);
  if (v11 <= v10) {
    int v12 = v10;
  }
  else {
    int v12 = v11;
  }
  int v13 = v12 + 1;
  int v14 = sub_100039EB4(*a1) + 1;
  uint64_t v15 = 2 * v13;
  v23 = (void *)sub_1000CD3E8(v15, v16, v17, v18, v19, v20, v21, v22);
  uint64_t v24 = 2 * v14;
  v32 = (_WORD *)sub_1000CD3E8(v24, v25, v26, v27, v28, v29, v30, v31);
  sub_1000B5360((uint64_t)a1, a2, (uint64_t)v23, v32);
  unint64_t v33 = sub_1000D9A10((unint64_t)v23, v32, a4, a3);
  sub_1000CD4D0(v32, v24);
  sub_1000CD4D0(v23, v15);
  if (a5 && v35 >= 1)
  {
    __sprintf_chk(v37, 0, 0xAuLL, "(%d)", v35);
    sub_1000D0D30(v37, 10, (uint64_t)v36);
    return sub_1000CEEBC(a4, v36, a3);
  }
  return v33;
}

uint64_t sub_1000BE0F8(uint64_t *a1, int a2, int a3, uint64_t a4, int a5)
{
  int v10 = (unsigned __int16 *)sub_1000C33A0(2 * a3);
  if (!v10) {
    return 0;
  }
  int v11 = v10;
  if (a2 == 65534)
  {
    unsigned int v12 = sub_1000CEF6C(v10, "SILENCE", a3);
    if (v12)
    {
LABEL_4:
      if (sub_1000D2768(v11, a3, a4)) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v12;
      }
      goto LABEL_13;
    }
  }
  else
  {
    if (a2 == 0xFFFF) {
      unsigned int v15 = -1;
    }
    else {
      unsigned int v15 = a2 | 0x40000000;
    }
    unsigned int v12 = sub_1000BDF6C(a1, v15, a3, v10, a5);
    if (v12) {
      goto LABEL_4;
    }
  }
  uint64_t v13 = 0;
LABEL_13:
  sub_1000C321C((uint64_t)v11);
  return v13;
}

uint64_t sub_1000BE1E4(uint64_t *a1, unsigned int a2, int a3, uint64_t a4, int a5)
{
  int v10 = (unsigned __int16 *)sub_1000C33A0(2 * a3);
  if (!v10) {
    return 0;
  }
  int v11 = v10;
  unsigned int v12 = sub_1000BDF6C(a1, a2, a3, v10, a5);
  if (v12)
  {
    unsigned int v13 = v12;
    if (sub_1000D2768(v11, a3, a4)) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = v13;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  sub_1000C321C((uint64_t)v11);
  return v14;
}

uint64_t sub_1000BE29C(uint64_t *a1, uint64_t a2, char *a3)
{
  uint64_t result = sub_1000848C8(*a1);
  if (result)
  {
    uint64_t result = sub_100020634(a1[1], a2, a3);
    if (result)
    {
      uint64_t v7 = a1[2];
      if (!v7) {
        return 1;
      }
      uint64_t result = sub_100076C80(v7, a2, a3);
      if (result) {
        return 1;
      }
    }
  }
  return result;
}

uint64_t sub_1000BE308(uint64_t *a1, uint64_t a2, char *a3)
{
  uint64_t result = sub_1000848D0(*a1);
  if (result)
  {
    uint64_t result = sub_1000208AC(a1[1], a2, a3, v7, v8, v9, v10, v11);
    if (result)
    {
      uint64_t v12 = a1[2];
      if (!v12) {
        return 1;
      }
      uint64_t result = sub_100076BA4(v12, a2, a3);
      if (result) {
        return 1;
      }
    }
  }
  return result;
}

uint64_t *sub_1000BE374(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = (unsigned char *)sub_1000CD3E8(6, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  *(_DWORD *)uint64_t v10 = 0;
  *((_WORD *)v10 + 2) = 0;
  uint64_t v16 = sub_1000BEC58(a1, "voc", a2, v11, v12, v13, v14, v15);
  uint64_t v17 = v16;
  if (!v16) {
    return v17;
  }
  BOOL v18 = sub_1000BEFCC((uint64_t)v16, v10, 6, 1);
  sub_1000BED3C((uint64_t)v17);
  if (v18)
  {
    sub_1000C2F04(0x58uLL, v19, v20, v21, v22, v23, v24, v25);
    uint64_t v17 = v26;
    if (*v10)
    {
      unint64_t v33 = sub_100096378(a1, a2, v27, v28, v29, v30, v31, v32);
      uint64_t v34 = (uint64_t)v33;
      if (!v33)
      {
LABEL_23:
        sub_1000CD4D0(v10, 6);
        sub_1000B4E70((uint64_t)v17);
        return 0;
      }
      v17[3] = (uint64_t)v33;
      if (v10[4]) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v34 = 0;
      v26[3] = 0;
      if (v10[4])
      {
LABEL_6:
        signed int v35 = sub_10009C730(a1, a2, v27, v28, v29, v30, v31, v32);
        if (!v35) {
          goto LABEL_23;
        }
        goto LABEL_11;
      }
    }
    signed int v35 = 0;
LABEL_11:
    v17[4] = (uint64_t)v35;
    v36 = sub_1000848D8(a1, a2, v34, (uint64_t)v35, v29, v30, v31, v32);
    *uint64_t v17 = (uint64_t)v36;
    if (!v36) {
      goto LABEL_23;
    }
    uint64_t v43 = sub_100020D10(a1, a2, v37, v38, v39, v40, v41, v42);
    v17[1] = v43;
    if (!v43) {
      goto LABEL_23;
    }
    if (v10[2])
    {
      uint64_t v50 = sub_1000769B8(a1, a2, v44, v45, v46, v47, v48, v49);
      v17[2] = v50;
      if (!v50) {
        goto LABEL_23;
      }
    }
    if (v10[1])
    {
      v51 = sub_100023F84(a1, a2, v44, v45, v46, v47, v48, v49);
      v17[5] = (uint64_t)v51;
      if (!v51) {
        goto LABEL_23;
      }
    }
    if (v10[3])
    {
      v52 = sub_100064D84(a1, a2, v44, v45, v46, v47, v48, v49);
      v17[6] = (uint64_t)v52;
      if (!v52) {
        goto LABEL_23;
      }
    }
    if (v10[5])
    {
      uint64_t v53 = sub_1000AFDA0(a1, a2, v44, v45, v46, v47, v48, v49);
      v17[7] = v53;
      if (!v53) {
        goto LABEL_23;
      }
    }
    v17[8] = sub_100052760(a1, a2, v44, v45, v46, v47, v48, v49);
    sub_1000CD4D0(v10, 6);
    v54 = (uint64_t (**)(void))sub_10008490C(a1, a2, v17[3], v17[4]);
    sub_1000B4F20(v17, (uint64_t)v54);
    sub_10005A68C(v54);
    return v17;
  }
  sub_1000CD4D0(v10, 6);
  return 0;
}

uint64_t sub_1000BE584(signed int a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v10 = sub_1000CD550();
  unint64_t v18 = sub_1000CD3E8(12, v11, v12, v13, v14, v15, v16, v17);
  *(void *)unint64_t v18 = 0;
  *(_DWORD *)(v18 + 8) = 0;
  uint64_t v26 = (uint64_t *)sub_1000CD3E8(24, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v27 = 16 * (int)a6;
  unsigned int v148 = a1;
  size_t v28 = a1;
  *uint64_t v26 = sub_1000CD3E8(v27, v29, v30, v31, v32, v33, v34, v35);
  uint64_t v145 = a6;
  uint64_t v147 = a4;
  if ((int)a6 <= 0)
  {
    v26[1] = sub_1000CD3E8(16 * (int)a6, v36, v37, v38, v39, v40, v41, v42);
    v26[2] = sub_1000CD3E8(16 * (int)a6, v64, v65, v66, v67, v68, v69, v70);
  }
  else
  {
    uint64_t v43 = 0;
    uint64_t v44 = a6;
    uint64_t v45 = 16 * a6;
    do
    {
      *(void *)(*v26 + v43 + 8) = sub_1000CD3E8(v28, v36, v37, v38, v39, v40, v41, v42);
      v43 += 16;
    }
    while (v45 != v43);
    uint64_t v46 = 0;
    v26[1] = sub_1000CD3E8(v27, v36, v37, v38, v39, v40, v41, v42);
    uint64_t v54 = 16 * v44;
    do
    {
      *(void *)(v26[1] + v46 + 8) = sub_1000CD3E8(v28, v47, v48, v49, v50, v51, v52, v53);
      v46 += 16;
    }
    while (v54 != v46);
    unint64_t v55 = sub_1000CD3E8(v27, v47, v48, v49, v50, v51, v52, v53);
    uint64_t v63 = 0;
    v26[2] = v55;
    do
    {
      *(void *)(v26[2] + v63 + 8) = sub_1000CD3E8(v28, v56, v57, v58, v59, v60, v61, v62);
      v63 += 16;
    }
    while (v54 != v63);
  }
  v71 = (unsigned __int8 *)sub_1000CD3E8(v28, v56, v57, v58, v59, v60, v61, v62);
  bzero(v71, v28);
  int v79 = v148;
  uint64_t v80 = v148;
  uint64_t v81 = v148;
  while ((int)v81 >= 1)
  {
    unsigned int v82 = v81 - 1;
    if (a3[--v81])
    {
      uint64_t v84 = 0;
      v85 = *(_DWORD **)(v147 + 8 * v82);
      uint64_t v143 = v10;
      while (1)
      {
        uint64_t v86 = 2;
        if (v79 < 1) {
          goto LABEL_25;
        }
        v87 = a3;
        v88 = v71;
        v89 = a5;
        uint64_t v90 = v80;
        do
        {
          uint64_t v91 = v86;
          if (*v87++)
          {
            uint64_t v86 = *(unsigned __int8 *)(*v89 + *v88);
            if (v91 != 2)
            {
              BOOL v93 = v91 == v86 || v86 == 2;
              uint64_t v86 = v91;
              if (!v93) {
                goto LABEL_42;
              }
            }
          }
          ++v89;
          ++v88;
          --v90;
        }
        while (v90);
        if (v86 != 255)
        {
LABEL_25:
          if (qword_100101CC0)
          {
            int v94 = *(_DWORD *)(qword_100101CC0 + 5488);
            v95 = (char *)v26[v86];
            uint64_t v96 = *(int *)(v18 + 4 * v86);
            dword_100101E50 = v79;
            if ((int)v96 < v94) {
              goto LABEL_27;
            }
          }
          else
          {
            int v94 = 0;
            v95 = (char *)v26[v86];
            uint64_t v96 = *(int *)(v18 + 4 * v86);
            dword_100101E50 = v79;
            if ((int)v96 < 0)
            {
LABEL_27:
              uint64_t v141 = v86;
              uint64_t v142 = v80;
              v97 = (void **)&v95[16 * v96];
              *(_DWORD *)v97 = v84;
              uint64_t v98 = v84;
              v99 = v85;
              memcpy(v97[1], v71, v28);
              v85 = v99;
              uint64_t v84 = v98;
              uint64_t v80 = v142;
              int v79 = v148;
              int v100 = *(_DWORD *)(v18 + 4 * v141) + 1;
              *(_DWORD *)(v18 + 4 * v141) = v100;
              if (v100 == v94)
              {
                qsort(v95, v94, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_1000BEC04);
                int v79 = v148;
                v85 = v99;
                uint64_t v84 = v98;
                uint64_t v80 = v142;
              }
              goto LABEL_42;
            }
          }
          int v101 = v96 - 1;
          uint64_t v102 = (int)v96 - 1;
          int v103 = (v101 & (v101 >> 31)) - 1;
          while (1)
          {
            int v104 = *(_DWORD *)&v95[16 * v102];
            int v105 = v84 - v104;
            if (v84 == v104) {
              break;
            }
LABEL_35:
            if ((v105 & 0x80000000) == 0) {
              goto LABEL_39;
            }
            if (v102-- < 1) {
              goto LABEL_40;
            }
          }
          uint64_t v106 = v148 - 1;
          while ((int)v106 + 1 >= 1)
          {
            int v107 = v71[v106];
            int v108 = *(unsigned __int8 *)(*(void *)&v95[16 * v102 + 8] + v106--);
            int v105 = v107 - v108;
            if (v105) {
              goto LABEL_35;
            }
          }
LABEL_39:
          int v103 = v102;
LABEL_40:
          uint64_t v110 = v103 + 1;
          if (v110 != v94)
          {
            v111 = &v95[16 * v103 + 32];
            v112 = (void **)&v95[16 * v110];
            size_t v113 = 16 * (v94 - v103) - 32;
            uint64_t v114 = v80;
            uint64_t v115 = v84;
            v116 = v85;
            j__memmove(v111, v112, v113);
            *(_DWORD *)v112 = v115;
            memcpy(v112[1], v71, v28);
            int v79 = v148;
            v85 = v116;
            uint64_t v84 = v115;
            uint64_t v80 = v114;
          }
        }
LABEL_42:
        uint64_t v117 = v71[v82];
        if (v85) {
          uint64_t v84 = v84 - *(void *)&v85[2 * v117];
        }
        unsigned __int8 v118 = v117 + 1;
        v71[v82] = v118;
        v119 = &v71[v82];
        if (*v119 == a3[v82])
        {
          do
          {
            unsigned __int8 *v119 = 0;
            if (v85) {
              uint64_t v84 = (v84 + *v85);
            }
            uint64_t v120 = v82;
            uint64_t v121 = (int)(v82 - 1) + 1;
            do
            {
              if ((int)v120 < 1) {
                goto LABEL_57;
              }
              unsigned int v82 = v120 - 1;
              int v122 = a3[v120 - 1];
              --v121;
              --v120;
            }
            while (!v122);
            v85 = *(_DWORD **)(v147 + 8 * v82);
            uint64_t v123 = v71[v82];
            if (v85) {
              uint64_t v84 = v84 - *(void *)&v85[2 * v123];
            }
            unsigned __int8 v118 = v123 + 1;
            v71[v82] = v118;
            v119 = &v71[v121];
          }
          while (v71[v121] == a3[v121]);
        }
        if ((v82 & 0x80000000) != 0)
        {
LABEL_57:
          unint64_t v125 = sub_1000CD3E8(12, v72, v73, v74, v75, v76, v77, v78);
          *(void *)unint64_t v125 = 0;
          *(_DWORD *)(v125 + 8) = 0;
          if ((int)v145 < 1)
          {
            uint64_t v124 = 0;
            uint64_t v10 = v143;
            goto LABEL_88;
          }
          v126 = (int *)v125;
          uint64_t v124 = 0;
          uint64_t v10 = v143;
          while (2)
          {
            uint64_t v127 = *v126;
            if ((int)v127 >= *(_DWORD *)v18)
            {
              int v128 = 0x40000000;
              int v129 = v126[1];
              int v130 = *(_DWORD *)(v18 + 4);
              if (v129 >= v130) {
                goto LABEL_69;
              }
            }
            else
            {
              if (*(int *)(*v26 + 16 * v127) >= 0x40000000) {
                int v128 = 0x40000000;
              }
              else {
                int v128 = *(_DWORD *)(*v26 + 16 * v127);
              }
              int v129 = v126[1];
              int v130 = *(_DWORD *)(v18 + 4);
              if (v129 >= v130) {
                goto LABEL_69;
              }
            }
            if (*(_DWORD *)(v26[1] + 16 * v129) < v128) {
              int v128 = *(_DWORD *)(v26[1] + 16 * v129);
            }
LABEL_69:
            uint64_t v131 = v126[2];
            if ((int)v131 >= *(_DWORD *)(v18 + 8))
            {
              if (v128 == 0x40000000) {
                goto LABEL_88;
              }
            }
            else
            {
              int v132 = *(_DWORD *)(v26[2] + 16 * v131);
              if (v132 < v128) {
                int v128 = v132;
              }
              if (v128 == 0x40000000) {
                goto LABEL_88;
              }
            }
            if ((int)v127 < *(_DWORD *)v18 && (uint64_t v133 = *v26, *(_DWORD *)(*v26 + 16 * v127) == v128))
            {
              uint64_t v134 = a2 + 16 * (int)v124;
              *(_DWORD *)uint64_t v134 = v128;
              memcpy(*(void **)(v134 + 8), *(const void **)(v133 + 16 * v127 + 8), v28);
              ++*v126;
              uint64_t v124 = (v124 + 1);
              if (v124 == v145) {
                goto LABEL_86;
              }
              int v129 = v126[1];
              if (v129 >= *(_DWORD *)(v18 + 4)) {
                goto LABEL_83;
              }
            }
            else if (v129 >= v130)
            {
LABEL_83:
              uint64_t v137 = v126[2];
              if ((int)v137 < *(_DWORD *)(v18 + 8))
              {
                uint64_t v138 = v26[2];
                if (*(_DWORD *)(v138 + 16 * v137) == v128)
                {
                  uint64_t v139 = a2 + 16 * (int)v124;
                  *(_DWORD *)uint64_t v139 = v128;
                  memcpy(*(void **)(v139 + 8), *(const void **)(v138 + 16 * v137 + 8), v28);
                  ++v126[2];
                  uint64_t v124 = (v124 + 1);
                  if (v124 == v145) {
                    goto LABEL_86;
                  }
                }
              }
              if ((int)v124 >= (int)v145) {
                goto LABEL_88;
              }
              continue;
            }
            break;
          }
          uint64_t v135 = v26[1];
          if (*(_DWORD *)(v135 + 16 * v129) == v128)
          {
            uint64_t v136 = a2 + 16 * (int)v124;
            *(_DWORD *)uint64_t v136 = v128;
            memcpy(*(void **)(v136 + 8), *(const void **)(v135 + 16 * v129 + 8), v28);
            ++v126[1];
            uint64_t v124 = (v124 + 1);
            if (v124 == v145)
            {
LABEL_86:
              uint64_t v124 = v145;
              goto LABEL_88;
            }
          }
          goto LABEL_83;
        }
        if (v85) {
          uint64_t v84 = v84 + *(void *)&v85[2 * v118];
        }
      }
    }
  }
  uint64_t v124 = 0;
LABEL_88:
  sub_1000CD534(v10);
  return v124;
}

uint64_t sub_1000BEC04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (*(_DWORD *)a1 - *(_DWORD *)a2);
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    return v2;
  }
  for (uint64_t i = dword_100101E50 - 1; (int)i + 1 >= 1; --i)
  {
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 8) + i);
    int v5 = *(unsigned __int8 *)(*(void *)(a2 + 8) + i);
    uint64_t v2 = (v4 - v5);
    if (v2) {
      return v2;
    }
  }
  return 0;
}

uint64_t *sub_1000BEC58(uint64_t a1, unsigned char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000C2F04(0x10uLL, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  uint64_t v12 = v11;
  v15[0] = 0;
  if (a3) {
    sub_1000CAD88(v15, a3, 256);
  }
  sub_1000CAE14(v15, a2, 256);
  *uint64_t v12 = a1;
  if (!sub_1000CBF58(a1, v15))
  {
    if (v12[1]) {
      return v12;
    }
    goto LABEL_5;
  }
  uint64_t v13 = sub_1000CC3D0(a1, v15);
  v12[1] = v13;
  if (!v13)
  {
LABEL_5:
    sub_1000C321C((uint64_t)v12);
    return 0;
  }
  return v12;
}

uint64_t sub_1000BED3C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 8);
    sub_1000CC9B8(v2);
    sub_1000CC9C0(v2);
    sub_1000CC5F4(*(void *)(v1 + 8));
    return sub_1000C321C(v1);
  }
  return result;
}

BOOL sub_1000BED94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = sub_1000CC9B8(v1);
  return v2 == sub_1000CC9C0(v1);
}

BOOL sub_1000BEDD0(uint64_t a1, unsigned char *a2, char *a3, void *a4)
{
  v8[0] = 0;
  if (a3) {
    sub_1000CAD88(v8, a3, 256);
  }
  sub_1000CAE14(v8, a2, 256);
  return sub_1000CCF04(a1, v8, 0, 4, a4) == 4;
}

BOOL sub_1000BEE7C(uint64_t a1, _DWORD *a2)
{
  return sub_1000CC9C8(*(void *)(a1 + 8), a2, 4uLL) == 4 && *a2 < 2u;
}

BOOL sub_1000BEECC(uint64_t a1, void *a2)
{
  return sub_1000CC9C8(*(void *)(a1 + 8), a2, 4uLL) == 4;
}

BOOL sub_1000BEEF4(uint64_t a1, void *a2)
{
  return sub_1000CC9C8(*(void *)(a1 + 8), a2, 8uLL) == 8;
}

uint64_t sub_1000BEF1C(uint64_t a1, unsigned char *a2)
{
  int __dst = 0;
  int v3 = sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0;
  if (v3 == 4)
  {
    *a2 = __dst;
    return 1;
  }
  return result;
}

uint64_t sub_1000BEF74(uint64_t a1, _WORD *a2)
{
  int __dst = 0;
  int v3 = sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0;
  if (v3 == 4)
  {
    *a2 = __dst;
    return 1;
  }
  return result;
}

BOOL sub_1000BEFCC(uint64_t a1, void *a2, int a3, int a4)
{
  int __dst = 0;
  int v8 = sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL);
  BOOL result = 0;
  if (v8 == 4)
  {
    if (a2)
    {
      size_t v10 = (a4 * a3);
      if (__dst != v10) {
        return 0;
      }
      return sub_1000CC9C8(*(void *)(a1 + 8), a2, v10) == v10;
    }
    else
    {
      return __dst == 0;
    }
  }
  return result;
}

uint64_t sub_1000BF078(uint64_t a1, int a2, uint64_t *a3, int *a4)
{
  int __dst = 0;
  int v8 = sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0;
  if (v8 == 4)
  {
    int v10 = __dst / a2;
    if (__dst % a2) {
      return 0;
    }
    if (!__dst)
    {
      uint64_t v11 = 0;
      goto LABEL_10;
    }
    uint64_t result = sub_1000C33A0(__dst);
    if (result)
    {
      uint64_t v11 = result;
      if (sub_1000CC9C8(*(void *)(a1 + 8), (void *)result, (v10 * a2)) != v10 * a2) {
        return 0;
      }
LABEL_10:
      *a3 = v11;
      *a4 = v10;
      return 1;
    }
  }
  return result;
}

uint64_t sub_1000BF14C(uint64_t a1, uint64_t *a2)
{
  int __dst = 0;
  int v4 = sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0;
  if (v4 == 4)
  {
    size_t v6 = __dst;
    if (__dst)
    {
      uint64_t result = sub_1000C33A0(__dst);
      if (!result) {
        return result;
      }
      uint64_t v7 = result;
      if (sub_1000CC9C8(*(void *)(a1 + 8), (void *)result, v6) != v6) {
        return 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    *a2 = v7;
    return 1;
  }
  return result;
}

BOOL sub_1000BF1F8(uint64_t a1, int a2, void *a3)
{
  unsigned int __dst = 0;
  int v6 = sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL);
  BOOL result = 0;
  if (v6 == 4)
  {
    unsigned int v8 = __dst;
    return (int)__dst <= a2 && sub_1000CC9C8(*(void *)(a1 + 8), a3, __dst) == v8;
  }
  return result;
}

uint64_t sub_1000BF290(uint64_t a1, uint64_t *a2)
{
  int __dst = 0;
  int v4 = sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0;
  if (v4 == 4)
  {
    if (__dst >= 0) {
      int v6 = __dst;
    }
    else {
      int v6 = __dst + 1;
    }
    if (__dst)
    {
      int v7 = v6 >> 1;
      uint64_t result = sub_1000C33A0(2 * (v6 >> 1));
      if (!result) {
        return result;
      }
      uint64_t v8 = result;
      if (sub_1000CC9C8(*(void *)(a1 + 8), (void *)result, (2 * v7)) != 2 * v7) {
        return 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    *a2 = v8;
    return 1;
  }
  return result;
}

BOOL sub_1000BF34C(uint64_t a1, int a2, void *a3)
{
  unsigned int __dst = 0;
  int v6 = sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL);
  BOOL result = 0;
  if (v6 == 4)
  {
    if ((__dst & 0x80000000) != 0)
    {
      return 0;
    }
    else
    {
      BOOL result = 0;
      if ((__dst & 1) == 0 && (int)(__dst >> 1) <= a2)
      {
        uint64_t v8 = *(void *)(a1 + 8);
        unsigned int v9 = __dst & 0xFFFFFFFE;
        return sub_1000CC9C8(v8, a3, __dst & 0xFFFFFFFE) == v9;
      }
    }
  }
  return result;
}

uint64_t sub_1000BF3F8(uint64_t a1, uint64_t *a2, int *a3)
{
  int __dst = 0;
  int v6 = sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0;
  if (v6 != 4 || __dst < 0) {
    return result;
  }
  if (!__dst)
  {
    *a2 = 0;
    *a3 = 0;
    return 1;
  }
  uint64_t result = sub_1000C33A0(8 * __dst);
  if (!result) {
    return result;
  }
  uint64_t v8 = result;
  int v9 = __dst;
  if (__dst < 1)
  {
LABEL_18:
    *a3 = v9;
    *a2 = v8;
    return 1;
  }
  uint64_t v10 = 0;
  while (1)
  {
    int v16 = 0;
    if (sub_1000CC9C8(*(void *)(a1 + 8), &v16, 4uLL) != 4) {
      break;
    }
    size_t v12 = v16;
    if (v16)
    {
      uint64_t v13 = (void *)sub_1000C33A0(v16);
      if (!v13) {
        break;
      }
      uint64_t v11 = v13;
      if (sub_1000CC9C8(*(void *)(a1 + 8), v13, v12) != v12) {
        break;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    *(void *)(v8 + 8 * v10++) = v11;
    int v9 = __dst;
    if (v10 >= __dst) {
      goto LABEL_18;
    }
  }
  if (v10)
  {
    uint64_t v14 = v10 + 1;
    do
      sub_1000C321C(*(void *)(v8 + 8 * (v14-- - 2)));
    while (v14 > 1);
  }
  sub_1000C321C(v8);
  return 0;
}

BOOL sub_1000BF540(uint64_t a1, size_t __nitems, void *__dst)
{
  return sub_1000CC9C8(*(void *)(a1 + 8), __dst, __nitems) == __nitems;
}

uint64_t sub_1000BF578(uint64_t a1, void **a2, int a3, int a4, int a5)
{
  uint64_t __dst = 0;
  int v10 = sub_1000CC9C8(*(void *)(a1 + 8), (char *)&__dst + 4, 4uLL);
  uint64_t result = 0;
  if (v10 == 4)
  {
    if (sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL) == 4)
    {
      if (a2 || !__dst)
      {
        uint64_t result = 0;
        if (__dst == __PAIR64__(a3, a4)) {
          return sub_1000BF670(a1, a2, a3, a4, a5);
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000BF670(uint64_t a1, void **a2, int a3, int a4, int a5)
{
  if (a3 < 1) {
    return 1;
  }
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  size_t v9 = (a5 * a4);
  uint64_t v10 = a3;
  if (a4)
  {
    while (1)
    {
      uint64_t v11 = *a2;
      if (!*a2) {
        break;
      }
      int __dst = 0;
      BOOL v12 = sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL) == 4 && __dst == v9;
      if (!v12 || sub_1000CC9C8(*(void *)(a1 + 8), v11, v9) != v9) {
        break;
      }
      ++a2;
      if (!--v10) {
        return 1;
      }
    }
  }
  else
  {
    while (1)
    {
      uint64_t v14 = *a2;
      int __dst = 0;
      if (sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL) != 4) {
        break;
      }
      if (v14)
      {
        if (__dst != v9 || sub_1000CC9C8(*(void *)(a1 + 8), v14, v9) != v9) {
          return 0;
        }
      }
      else if (__dst)
      {
        return 0;
      }
      ++a2;
      if (!--v10) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_1000BF780(uint64_t a1, void **a2, int a3, int a4, int a5, int *a6)
{
  int __dst = 0;
  int v12 = sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0;
  int v14 = 0;
  if (v12 == 4)
  {
    int v15 = __dst;
    if (__dst % a4)
    {
      uint64_t result = 0;
      int v14 = 0;
    }
    else
    {
      int v16 = a4 + __dst - 1;
      int v14 = v16 / a4;
      if (v16 / a4 <= a3)
      {
        if (v14 < 1)
        {
          uint64_t result = 1;
          goto LABEL_15;
        }
        uint64_t v17 = (v16 / a4);
        while (1)
        {
          int v18 = v15 >= a4 ? a4 : v15;
          if (sub_1000CC9C8(*(void *)(a1 + 8), *a2, (v18 * a5)) != v18 * a5) {
            break;
          }
          v15 -= v18;
          ++a2;
          uint64_t result = 1;
          if (!--v17) {
            goto LABEL_15;
          }
        }
      }
      uint64_t result = 0;
    }
  }
LABEL_15:
  *a6 = v14;
  return result;
}

uint64_t sub_1000BF88C(uint64_t a1, uint64_t *a2, int a3, int a4, int a5, _DWORD *a6)
{
  int __dst = 0;
  if (sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL) == 4 && !(__dst % a4))
  {
    uint64_t v13 = ((a4 - 1 + __dst) / a4);
    if ((int)v13 <= a3)
    {
      if (a3)
      {
        uint64_t result = sub_1000C33A0(8 * a3);
        uint64_t v12 = result;
        if (!result) {
          goto LABEL_5;
        }
        if ((int)v13 >= 1)
        {
          uint64_t v15 = v13 - 1;
          int v16 = (uint64_t *)result;
          do
          {
            uint64_t v17 = v15;
            uint64_t v18 = sub_1000C33A0(a5 * a4);
            *v16++ = v18;
            if (!v18) {
              break;
            }
            uint64_t v15 = v17 - 1;
          }
          while (v17);
        }
        int v19 = __dst;
        if ((a4 - 1 + __dst) / a4 >= 1)
        {
          uint64_t v20 = 0;
          uint64_t v25 = a6;
          uint64_t v26 = 8 * ((a4 - 1 + __dst) / a4);
          while (1)
          {
            int v21 = v19 >= a4 ? a4 : v19;
            if (sub_1000CC9C8(*(void *)(a1 + 8), *(void **)(v12 + v20), (v21 * a5)) != v21 * a5) {
              break;
            }
            v19 -= v21;
            v20 += 8;
            uint64_t result = 1;
            if (v26 == v20)
            {
              a6 = v25;
              goto LABEL_5;
            }
          }
          a6 = v25;
          if ((int)v13 >= 1)
          {
            uint64_t v22 = v13;
            uint64_t v23 = (uint64_t *)v12;
            do
            {
              uint64_t v24 = *v23++;
              sub_1000C321C(v24);
              --v22;
            }
            while (v22);
          }
          sub_1000C321C(v12);
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
      uint64_t result = 1;
      goto LABEL_5;
    }
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    LODWORD(v13) = 0;
  }
LABEL_4:
  uint64_t result = 0;
LABEL_5:
  *a6 = v13;
  *a2 = v12;
  return result;
}

uint64_t sub_1000BFA34(uint64_t a1, uint64_t *a2, int a3, signed int a4, int a5, uint64_t (*a6)(uint64_t, void, uint64_t), _DWORD *a7)
{
  int __dst = 0;
  if (sub_1000CC9C8(*(void *)(a1 + 8), &__dst, 4uLL) == 4 && !(__dst % a4))
  {
    uint64_t v16 = ((a4 - 1 + __dst) / a4);
    if ((int)v16 <= a3)
    {
      int v17 = sub_1000CC9C0(*(void *)(a1 + 8));
      if (a3)
      {
        uint64_t result = sub_1000C33A0(8 * a3);
        uint64_t v15 = result;
        if (!result) {
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      int v33 = v17;
      uint64_t v34 = a7;
      uint64_t v36 = a2;
      if ((int)v16 >= 1)
      {
        uint64_t v18 = v16 - 1;
        int v19 = (uint64_t *)v15;
        do
        {
          uint64_t v20 = v18;
          uint64_t v21 = sub_1000C33A0(a5 * a4);
          *v19++ = v21;
          if (!v21) {
            break;
          }
          uint64_t v18 = v20 - 1;
        }
        while (v20);
      }
      unsigned int v22 = __dst;
      uint64_t v35 = ((a4 - 1 + __dst) / a4);
      if ((int)v35 < 1)
      {
LABEL_26:
        int v28 = sub_1000CC9C0(*(void *)(a1 + 8));
        int v38 = 0;
        uint64_t result = sub_1000CC9C8(*(void *)(a1 + 8), &v38, 4uLL) != 4 || v38 == v28 - v33;
      }
      else
      {
        uint64_t v23 = 0;
        uint64_t v24 = a5;
        while (1)
        {
          uint64_t v25 = (int)v22 >= a4 ? a4 : v22;
          int v37 = v25;
          if ((int)v25 >= 1) {
            break;
          }
LABEL_17:
          v22 -= v37;
          if (++v23 == v35) {
            goto LABEL_26;
          }
        }
        uint64_t v26 = *(void *)(v15 + 8 * v23);
        uint64_t v27 = v25;
        while (1)
        {
          uint64_t result = a6(a1, 0, v26);
          if (!result) {
            break;
          }
          v26 += v24;
          if (!--v27) {
            goto LABEL_17;
          }
        }
      }
      a7 = v34;
      a2 = v36;
      if (v15 && !result)
      {
        if ((int)v16 >= 1)
        {
          uint64_t v30 = v16;
          uint64_t v31 = (uint64_t *)v15;
          do
          {
            uint64_t v32 = *v31++;
            sub_1000C321C(v32);
            --v30;
          }
          while (v30);
        }
        sub_1000C321C(v15);
        uint64_t result = 0;
        a2 = v36;
      }
    }
    else
    {
      uint64_t result = 0;
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t result = 0;
    uint64_t v15 = 0;
    LODWORD(v16) = 0;
  }
LABEL_4:
  *a7 = v16;
  *a2 = v15;
  return result;
}

uint64_t sub_1000BFC50(uint64_t a1, unsigned char *a2, char *a3)
{
  uint64_t v6 = sub_1000C33A0(24);
  if (v6)
  {
    v8[0] = 0;
    if (a3) {
      sub_1000CAD88(v8, a3, 256);
    }
    sub_1000CAE14(v8, a2, 256);
    *(void *)uint64_t v6 = a1;
    *(void *)(v6 + 8) = sub_1000CCB84(a1, (char *)v8);
    *(_DWORD *)(v6 + 16) = *(_DWORD *)(a1 + 20);
  }
  return v6;
}

uint64_t sub_1000BFD14(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_1000CC5F4(*(void *)(result + 8));
    return sub_1000C321C(v1);
  }
  return result;
}

BOOL sub_1000BFD58(uint64_t a1, __int32 a2, uint8x8_t a3)
{
  __ptr.i32[0] = a2;
  if (*(_DWORD *)(a1 + 16)) {
    sub_1000CB2B8(&__ptr, 4, a3);
  }
  return sub_1000CCCFC(*(void *)(a1 + 8), &__ptr, 4uLL) == 4;
}

int8x8_t *sub_1000BFDB0(uint64_t a1, void *a2, unsigned int a3, int a4, uint8x8_t a5)
{
  __ptr.i32[0] = a4 * a3;
  int v6 = *(_DWORD *)(a1 + 16);
  if (a2)
  {
    if (v6) {
      sub_1000CB2B8(&__ptr, 4, a5);
    }
    int v10 = sub_1000CCCFC(*(void *)(a1 + 8), &__ptr, 4uLL);
    if (*(_DWORD *)(a1 + 16)) {
      sub_1000CB2B8(&__ptr, 4, v11);
    }
    if (v10 == 4) {
      return sub_1000BFECC(a1, a2, a3, a4);
    }
    else {
      return 0;
    }
  }
  else
  {
    if (v6) {
      sub_1000CB2B8(&__ptr, 4, a5);
    }
    int v13 = sub_1000CCCFC(*(void *)(a1 + 8), &__ptr, 4uLL);
    if (*(_DWORD *)(a1 + 16)) {
      sub_1000CB2B8(&__ptr, 4, v14);
    }
    return (int8x8_t *)(v13 == 4);
  }
}

int8x8_t *sub_1000BFECC(uint64_t a1, void *__ptr, unsigned int a3, int a4)
{
  size_t v6 = a4 * a3;
  if (a4 >= 2 && *(_DWORD *)(a1 + 16))
  {
    uint64_t result = (int8x8_t *)sub_1000C33A0((int)v6);
    if (!result) {
      return result;
    }
    int v10 = result;
    memcpy(result, __ptr, (int)v6);
    switch(a4)
    {
      case 8:
        sub_1000CB294(v10, a3);
        break;
      case 4:
        sub_1000CB1AC((uint64_t)v10, a3, v11);
        break;
      case 2:
        sub_1000CB0E8((uint64_t)v10, a3);
        break;
    }
    int v12 = sub_1000CCCFC(*(void *)(a1 + 8), v10, v6);
    sub_1000C321C((uint64_t)v10);
  }
  else
  {
    int v12 = sub_1000CCCFC(*(void *)(a1 + 8), __ptr, a4 * a3);
  }
  return (int8x8_t *)(v12 == v6);
}

BOOL sub_1000BFFC4(uint64_t a1, size_t a2, void *__ptr)
{
  return sub_1000CCCFC(*(void *)(a1 + 8), __ptr, a2) == a2;
}

uint64_t sub_1000BFFFC(uint64_t a1, void **a2, int a3, unsigned int a4, int a5, uint8x8_t a6)
{
  LODWORD(v8) = a3;
  __ptr.i32[0] = a4 * a3;
  if (*(_DWORD *)(a1 + 16)) {
    sub_1000CB2B8(&__ptr, 4, a6);
  }
  if (sub_1000CCCFC(*(void *)(a1 + 8), &__ptr, 4uLL) != 4 || (int)v8 < 1) {
    return 1;
  }
  uint64_t v8 = v8;
  while (1)
  {
    uint64_t result = (uint64_t)sub_1000BFECC(a1, *a2, a4, a5);
    if (!result) {
      break;
    }
    ++a2;
    if (!--v8) {
      return 1;
    }
  }
  return result;
}

BOOL sub_1000C00C4(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t), uint8x8_t a7)
{
  uint64_t v13 = *(unsigned int *)(a1 + 16);
  __ptr.i32[0] = a4 * a3;
  if (v13) {
    sub_1000CB2B8(&__ptr, 4, a7);
  }
  if (sub_1000CCCFC(*(void *)(a1 + 8), &__ptr, 4uLL) != 4) {
    return 0;
  }
  int v14 = sub_1000CC9C0(*(void *)(a1 + 8));
  int v15 = v14;
  if (a3 < 1)
  {
    LODWORD(v16) = 0;
    BOOL result = 0;
    goto LABEL_18;
  }
  if (a4 < 1)
  {
    LODWORD(v16) = a3;
    BOOL result = 0;
LABEL_18:
    if (v16 == a3)
    {
      __ptr.i32[1] = sub_1000CC9C0(*(void *)(a1 + 8)) - v15;
      if (*(_DWORD *)(a1 + 16)) {
        sub_1000CB2B8((int8x8_t *)((char *)&__ptr + 4), 4, v23);
      }
      return sub_1000CCCFC(*(void *)(a1 + 8), (char *)&__ptr + 4, 4uLL) == 4;
    }
    return result;
  }
  uint64_t v16 = 0;
  int v24 = v14;
  uint64_t v17 = a4;
  while (2)
  {
    uint64_t v18 = *(void *)(a2 + 8 * v16);
    uint64_t v19 = v17;
    do
    {
      int v20 = a6(a1, v13, v18);
      BOOL v21 = v20 == 0;
      if (!v20)
      {
        LODWORD(v16) = v16 + 1;
        goto LABEL_15;
      }
      v18 += a5;
      --v19;
    }
    while (v19);
    if (++v16 < (unint64_t)a3) {
      continue;
    }
    break;
  }
LABEL_15:
  int v15 = v24;
  BOOL result = 0;
  if (!v21) {
    goto LABEL_18;
  }
  return result;
}

uint64_t sub_1000C024C(uint64_t result)
{
  if ((result & 0x80) == 0 && (byte_1000F6054[result] & 2) != 0) {
    LOBYTE(result) = result + 32;
  }
  return result;
}

uint64_t sub_1000C0270(int a1, __int16 *a2, int a3, uint64_t a4)
{
  switch(a1)
  {
    case 5:
      return sub_1000D0FF0(a2, a3, a4);
    case 3:
      return sub_1000D2768(a2, a3, a4);
    case 2:
      return sub_1000D0D90(a2, a3, a4);
  }
  return 3;
}

uint64_t sub_1000C02C0(int a1, __int16 *a2, int a3, int a4, uint64_t a5)
{
  switch(a1)
  {
    case 5:
      return sub_1000D11D8(a2, a3, a4, a5);
    case 3:
      return sub_1000D2628(a2, a3, a4, a5);
    case 2:
      return sub_1000D0E18(a2, a3, a4, a5);
  }
  return 3;
}

uint64_t sub_1000C031C(int a1, char *a2, int a3, uint64_t a4)
{
  switch(a1)
  {
    case 5:
      return sub_1000D0EA0(a2, a3, a4);
    case 3:
      return sub_1000D244C(a2, a3, a4);
    case 2:
      return sub_1000D0D30(a2, a3, a4);
  }
  return 0;
}

uint64_t sub_1000C036C(uint64_t a1, int a2, int a3)
{
  int v9 = 0;
  int v6 = sub_1000C4D00(a2, &v9);
  uint64_t result = 0;
  if (v6 == a2)
  {
    *(void *)a1 = 0;
    int v8 = v9;
    *(_DWORD *)(a1 + 8) = a2;
    *(_DWORD *)(a1 + 12) = v8;
    *(void *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 24) = 0;
    if (a3 < 1) {
      return 1;
    }
    uint64_t result = sub_1000C3D84((const void **)a1, (int *)(a1 + 20), a3);
    if (result) {
      return 1;
    }
  }
  return result;
}

uint64_t *sub_1000C03F8(uint64_t *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (uint64_t *)sub_1000C3F24(*result, *((unsigned int *)v1 + 5), *((_DWORD *)v1 + 4));
    *uint64_t v1 = 0;
    v1[2] = 0;
    *((_DWORD *)v1 + 6) = 0;
  }
  return result;
}

uint64_t sub_1000C0438(uint64_t result, int a2)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = sub_1000C3A90((const void **)result, (int *)(result + 20), (signed int *)(result + 16), *(_DWORD *)(result + 12), 1, a2);
    if (result) {
      *(_DWORD *)(v3 + 24) = a2;
    }
  }
  return result;
}

BOOL sub_1000C0484(uint64_t a1, uint64_t a2, uint8x8_t a3)
{
  BOOL result = 0;
  if (a1)
  {
    if (a2)
    {
      BOOL result = sub_1000BFD58(a2, *(_DWORD *)(a1 + 8), a3);
      if (result)
      {
        BOOL result = sub_1000BFD58(a2, *(_DWORD *)(a1 + 12), v6);
        if (result)
        {
          BOOL result = sub_1000BFD58(a2, *(_DWORD *)(a1 + 16), v7);
          if (result)
          {
            BOOL result = sub_1000BFD58(a2, *(_DWORD *)(a1 + 20), v8);
            if (result)
            {
              BOOL result = sub_1000BFD58(a2, *(_DWORD *)(a1 + 24), v9);
              if (result) {
                return sub_1000BFFFC(a2, *(void ***)a1, *(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 8), 1, v10) != 0;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000C0524(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (*(int *)(a1 + 24) > 0) {
      return 0;
    }
    int v10 = 0;
    int v9 = 0;
    uint64_t v8 = 0;
    int v7 = 0;
    uint64_t result = sub_1000BEECC(a2, &v10);
    if (result)
    {
      uint64_t result = sub_1000BEECC(a2, &v9);
      if (result)
      {
        uint64_t result = sub_1000BEECC(a2, (char *)&v8 + 4);
        if (result)
        {
          uint64_t result = sub_1000BEECC(a2, &v8);
          if (result)
          {
            uint64_t result = sub_1000BEECC(a2, &v7);
            if (result)
            {
              uint64_t result = 0;
              if (v10 >= 1 && v9 >= 1 && (v8 & 0x80000000) == 0 && (v8 & 0x8000000000000000) == 0)
              {
                int v5 = v7;
                if ((v7 & 0x80000000) == 0)
                {
                  if (*(int *)(a1 + 16) < 1)
                  {
                    uint64_t result = sub_1000C036C(a1, v10, v8);
                    if (!result) {
                      return result;
                    }
                    int v5 = v7;
                  }
                  else if (v10 != *(_DWORD *)(a1 + 8) {
                         || v9 != *(_DWORD *)(a1 + 12)
                  }
                         || v8 != *(_DWORD *)(a1 + 20))
                  {
                    return 0;
                  }
                  if (v5 < 1 || (uint64_t result = sub_1000C0438(a1, v5), result))
                  {
                    int v6 = 0;
                    uint64_t result = sub_1000BF780(a2, *(void ***)a1, *(_DWORD *)(a1 + 20), *(_DWORD *)(a1 + 8), 1, &v6);
                    if (result) {
                      return *(_DWORD *)(a1 + 16) == v6;
                    }
                  }
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

uint64_t sub_1000C06B4(unint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = (char *)a1;
    int v4 = sub_1000CAD00(a1);
    if ((v4 & 0x80000000) == 0)
    {
      int v5 = v4 + 1;
      do
      {
        char v6 = *v3++;
        a2 = dword_1000F5A54[(v6 ^ a2)] ^ (a2 >> 8);
        --v5;
      }
      while (v5);
    }
  }
  return a2;
}

uint64_t sub_1000C0710(char a1, unsigned int a2)
{
  return dword_1000F5A54[(a2 ^ a1)] ^ (a2 >> 8);
}

uint64_t sub_1000C072C(unsigned int a1, unsigned int a2)
{
  return dword_1000F5A54[(LOBYTE(dword_1000F5A54[(a1 ^ a2)]) ^ BYTE1(a2)) ^ (a1 >> 8)] ^ ((dword_1000F5A54[(a1 ^ a2)] ^ (a2 >> 8)) >> 8);
}

uint64_t sub_1000C0758(unsigned int a1, unsigned int a2)
{
  unsigned int v2 = dword_1000F5A54[(a2 ^ a1)] ^ (a2 >> 8);
  unsigned int v3 = dword_1000F5A54[(v2 ^ BYTE1(a1))] ^ (v2 >> 8);
  unsigned int v4 = dword_1000F5A54[(v3 ^ BYTE2(a1))] ^ (v3 >> 8);
  return dword_1000F5A54[v4 ^ HIBYTE(a1)] ^ (v4 >> 8);
}

uint64_t sub_1000C07A4(unint64_t *a1, int a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    uint64_t v3 = a2;
    do
    {
      unint64_t v4 = *a1++;
      unsigned int v5 = dword_1000F5A54[(a3 ^ v4)] ^ (a3 >> 8);
      unsigned int v6 = dword_1000F5A54[(v5 ^ BYTE1(v4))] ^ (v5 >> 8);
      unsigned int v7 = dword_1000F5A54[(v6 ^ BYTE2(v4))] ^ (v6 >> 8);
      unsigned int v8 = dword_1000F5A54[v7 ^ BYTE3(v4)] ^ (v7 >> 8);
      unsigned int v9 = dword_1000F5A54[(v8 ^ BYTE4(v4))];
      unsigned int v10 = HIWORD(v8) ^ (v9 >> 8) ^ dword_1000F5A54[(v9 ^ ((unsigned __int16)(v8 ^ WORD2(v4)) >> 8))];
      unsigned int v11 = dword_1000F5A54[(v10 ^ BYTE6(v4))] ^ (v10 >> 8);
      a3 = dword_1000F5A54[v11 ^ HIBYTE(v4)] ^ (v11 >> 8);
      --v3;
    }
    while (v3);
  }
  return a3;
}

uint64_t sub_1000C085C(unsigned int a1, int a2, unsigned int a3)
{
  uint64_t v3 = 0;
  switch(a2)
  {
    case 1:
      unsigned int v4 = dword_1000F5A54[(a3 ^ a1)];
      unsigned int v5 = a3 >> 8;
      goto LABEL_7;
    case 2:
      unsigned int v6 = dword_1000F5A54[(a3 ^ a1)] ^ (a3 >> 8);
      int v7 = (LOBYTE(dword_1000F5A54[(a3 ^ a1)]) ^ BYTE1(a3) ^ BYTE1(a1));
      goto LABEL_6;
    case 4:
      unsigned int v8 = dword_1000F5A54[(a3 ^ a1)] ^ (a3 >> 8);
      unsigned int v9 = dword_1000F5A54[(v8 ^ BYTE1(a1))] ^ (v8 >> 8);
      unsigned int v6 = dword_1000F5A54[(v9 ^ BYTE2(a1))] ^ (v9 >> 8);
      int v7 = (LOBYTE(dword_1000F5A54[(v9 ^ BYTE2(a1))]) ^ BYTE1(v9)) ^ HIBYTE(a1);
      goto LABEL_6;
    case 8:
      unsigned int v10 = dword_1000F5A54[(a3 ^ a1)] ^ (a3 >> 8);
      unsigned int v11 = dword_1000F5A54[(v10 ^ BYTE1(a1))] ^ (v10 >> 8);
      unsigned int v12 = dword_1000F5A54[v11] ^ (v11 >> 8);
      unsigned int v13 = dword_1000F5A54[v12] ^ (v12 >> 8);
      unsigned int v14 = dword_1000F5A54[v13];
      int v15 = dword_1000F5A54[(v14 ^ BYTE1(v13))];
      unsigned int v6 = dword_1000F5A54[(v15 ^ BYTE1(v14) ^ BYTE2(v13))] ^ ((v15 ^ (v14 >> 8) ^ HIWORD(v13)) >> 8);
      int v7 = v6;
LABEL_6:
      unsigned int v5 = dword_1000F5A54[v7];
      unsigned int v4 = v6 >> 8;
LABEL_7:
      uint64_t v3 = v4 ^ v5;
      break;
    default:
      return v3;
  }
  return v3;
}

uint64_t sub_1000C09B0(unint64_t *a1, int a2, int a3, uint64_t a4)
{
  uint64_t v4 = 0;
  switch(a2)
  {
    case 1:
      if (a3 < 1) {
        return a4;
      }
      LODWORD(v4) = a4;
      do
      {
        char v5 = *(unsigned char *)a1;
        a1 = (unint64_t *)((char *)a1 + 1);
        uint64_t v4 = dword_1000F5A54[(v5 ^ v4)] ^ (v4 >> 8);
        --a3;
      }
      while (a3);
      return v4;
    case 2:
      if (a3 < 1) {
        return a4;
      }
      uint64_t v6 = a3;
      LODWORD(v4) = a4;
      do
      {
        unsigned int v7 = *(unsigned __int16 *)a1;
        a1 = (unint64_t *)((char *)a1 + 2);
        unsigned int v8 = dword_1000F5A54[(v4 ^ v7)] ^ (v4 >> 8);
        uint64_t v4 = dword_1000F5A54[v8 ^ (v7 >> 8)] ^ (v8 >> 8);
        --v6;
      }
      while (v6);
      return v4;
    case 4:
      if (a3 < 1) {
        return a4;
      }
      uint64_t v9 = a3;
      LODWORD(v4) = a4;
      do
      {
        unsigned int v10 = *(_DWORD *)a1;
        a1 = (unint64_t *)((char *)a1 + 4);
        unsigned int v11 = dword_1000F5A54[(v10 ^ v4)] ^ (v4 >> 8);
        unsigned int v12 = dword_1000F5A54[(v11 ^ BYTE1(v10))] ^ (v11 >> 8);
        unsigned int v13 = dword_1000F5A54[(v12 ^ BYTE2(v10))] ^ (v12 >> 8);
        uint64_t v4 = dword_1000F5A54[v13 ^ HIBYTE(v10)] ^ (v13 >> 8);
        --v9;
      }
      while (v9);
      return v4;
    case 8:
      return sub_1000C07A4(a1, a3, a4);
    default:
      return v4;
  }
}

uint64_t sub_1000C0AFC(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v3 = 0;
    do
    {
      *(unsigned char *)(a3 + v3) = byte_1000F5E54[*(unsigned __int8 *)(result + v3)];
      ++v3;
    }
    while (a2 > v3);
  }
  return result;
}

uint64_t sub_1000C0B28(uint64_t result, unint64_t a2, uint64_t a3)
{
  for (unsigned int i = 0; i < a2; ++i)
    *(unsigned char *)(a3 + i) = byte_1000F5F54[*(unsigned __int8 *)(result + i)];
  return result;
}

uint64_t sub_1000C0B7C(const char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9 = (const char *)sub_1000C0B9C(a1, a2, a3, &a9);
  return sub_1000C0B9C(v9, v10, v11, v12);
}

uint64_t sub_1000C0B9C(const char *a1, int a2, const char *a3, va_list a4)
{
  uint64_t v4 = (unsigned int *)off_100101768;
  if (!off_100101768) {
    sub_1000DC550(a1, a2, "Recognizer error", 0, 0);
  }
  *((_DWORD *)off_100101768 + 10) = a2;
  *((void *)v4 + 4) = a1;
  char v5 = (char *)*((void *)v4 + 3);
  if (v5) {
    sub_1000D2894(v5, v4[5], a3, a4);
  }
  sub_1000C0BE4();
  return sub_1000C0BE4();
}

uint64_t sub_1000C0BE4()
{
  if (qword_100101CC0 && *(_DWORD *)(qword_100101CC0 + 2312)) {
    abort();
  }
  if (!off_100101768) {
    sub_1000DC550("vsterr.c", 359, "No error handling installed", 0, 0);
  }
  uint64_t v0 = *((int *)off_100101768 + 1);
  if (v0)
  {
    uint64_t v1 = *((void *)off_100101768 + 1);
    uint64_t v2 = v0 - 1;
    *((_DWORD *)off_100101768 + 1) = v2;
    longjmp((int *)(v1 + 192 * v2), 1);
  }
  if (!off_100101E58) {
    sub_1000C0D4C();
  }
  uint64_t v3 = off_100101E58();
  return sub_1000C0C70(v3);
}

uint64_t sub_1000C0C70()
{
  uint64_t v0 = off_100101768;
  if (!off_100101768) {
    sub_1000DC550("vsterr.c", 287, "No error handling installed", 0, 0);
  }
  int v1 = *((_DWORD *)off_100101768 + 1);
  *((_DWORD *)off_100101768 + 1) = v1 + 1;
  if (v0[4] <= v1) {
    v0[4] = v1 + 1;
  }
  return *((void *)v0 + 1) + 192 * v1;
}

void sub_1000C0CD8()
{
  if (!off_100101768) {
    sub_1000DC550("vsterr.c", 313, "No error handling installed", 0, 0);
  }
  --*((_DWORD *)off_100101768 + 1);
}

uint64_t sub_1000C0D24()
{
  return 0;
}

void *sub_1000C0D2C(void *a1)
{
  int v1 = off_100101768;
  off_100101768 = a1;
  return v1;
}

void *sub_1000C0D40()
{
  return off_100101768;
}

void sub_1000C0D4C()
{
  int v0 = sub_1000C0D24();
  int v1 = sub_10003FD70();
  sub_1000DC550(v1, v0, "Recognizer error", 0, 0);
}

uint64_t sub_1000C0D80(unint64_t a1, int a2, uint64_t a3)
{
  for (unsigned int i = (unsigned __int8 *)(a1 + a2 - 1);
        (unint64_t)i >= a1;
        a3 = (dword_1000F60E0[v4] ^ __ROR4__(a3, 31)))
  {
    int v4 = *i--;
  }
  return a3;
}

uint64_t sub_1000C0DB4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v27 = 0;
  sub_1000C2F04(0x28uLL, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v12 = v11;
  if (a1 <= 4) {
    uint64_t v13 = 4;
  }
  else {
    uint64_t v13 = a1;
  }
  int v14 = sub_1000C4D00(v13, &v27);
  sub_1000C2F04(8 * v14, v15, v16, v17, v18, v19, v20, v21);
  *(void *)uint64_t v12 = v22;
  if (!v22) {
    return 0;
  }
  *(_DWORD *)(v12 + 8) = v14;
  *(_DWORD *)(v12 + 12) = 0;
  signed int v23 = v14 - 1;
  *(_DWORD *)(v12 + 20) = v14 - 1;
  if (a3) {
    int v24 = (uint64_t (*)(unint64_t, int, uint64_t))a3;
  }
  else {
    int v24 = sub_1000C0D80;
  }
  *(void *)(v12 + 24) = a2;
  *(void *)(v12 + 32) = v24;
  signed int v25 = vcvtmd_s64_f64((double)v14 * 0.5 + 0.5);
  if (v14 > v25) {
    signed int v23 = v25;
  }
  *(_DWORD *)(v12 + 16) = v23;
  return v12;
}

uint64_t sub_1000C0E88(uint64_t result, double a2)
{
  if (result)
  {
    int v2 = *(_DWORD *)(result + 8);
    signed int v3 = vcvtmd_s64_f64((double)v2 * a2 + 0.5);
    *(_DWORD *)(result + 16) = v3;
    if (v2 <= v3) {
      *(_DWORD *)(result + 16) = v2 - 1;
    }
  }
  return result;
}

uint64_t *sub_1000C0EBC(uint64_t *result)
{
  if (result)
  {
    int v1 = result;
    sub_1000C321C(*result);
    *int v1 = 0;
    return (uint64_t *)sub_1000C321C((uint64_t)v1);
  }
  return result;
}

uint64_t sub_1000C0F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v22 = 0;
  int v10 = *(_DWORD *)(a1 + 16);
  if (*(_DWORD *)(a1 + 12) > v10)
  {
    uint64_t v11 = *(void *)a1;
    uint64_t v12 = *(int *)(a1 + 8);
    *(_DWORD *)(a1 + 8) = 2 * v12;
    *(_DWORD *)(a1 + 12) = 0;
    *(_DWORD *)(a1 + 16) = 2 * v10;
    *(_DWORD *)(a1 + 20) = 2 * v12 - 1;
    sub_1000C2F04(16 * v12, a2, a3, a4, a5, a6, a7, a8);
    if (v13)
    {
      uint64_t v12 = v12;
      *(void *)a1 = v13;
      if ((int)v12 >= 1)
      {
        int v14 = (void *)v11;
        do
        {
          if (*v14) {
            sub_1000C0F04(a1);
          }
          ++v14;
          --v12;
        }
        while (v12);
      }
      sub_1000C321C(v11);
    }
  }
  uint64_t v15 = (*(uint64_t (**)(uint64_t, const void **))(a1 + 24))(a2, &v22);
  uint64_t v16 = v22;
  int v17 = *(_DWORD *)(a1 + 20) & (*(uint64_t (**)(const void *, uint64_t, void))(a1 + 32))(v22, v15, 0);
  uint64_t v18 = v17;
  __s1 = 0;
  uint64_t v19 = *(void *)a1;
  uint64_t result = *(void *)(*(void *)a1 + 8 * v17);
  if (result)
  {
    int v21 = 1;
    while (1)
    {
      if ((*(unsigned int (**)(void))(a1 + 24))() == v15)
      {
        uint64_t result = memcmp(__s1, v16, (int)v15);
        if (!result) {
          break;
        }
      }
      if (v17 + 1 == *(_DWORD *)(a1 + 8)) {
        int v17 = 0;
      }
      else {
        ++v17;
      }
      __s1 = 0;
      uint64_t v19 = *(void *)a1;
      uint64_t v18 = v17;
      uint64_t result = *(void *)(*(void *)a1 + 8 * v17);
      ++v21;
      if (!result) {
        goto LABEL_18;
      }
    }
    uint64_t v19 = *(void *)a1;
  }
LABEL_18:
  *(void *)(v19 + 8 * v18) = a2;
  ++*(_DWORD *)(a1 + 12);
  return result;
}

uint64_t sub_1000C1078(uint64_t result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  int v37 = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, const void **))(result + 24))(a2, &v37);
  char v5 = v37;
  int v6 = (*(uint64_t (**)(const void *, uint64_t, void))(v3 + 32))(v37, v4, 0);
  if (*(int *)(v3 + 8) < 1)
  {
LABEL_14:
    uint64_t v20 = 0;
    uint64_t result = MEMORY[0];
    if (MEMORY[0]) {
      return result;
    }
    goto LABEL_15;
  }
  int v14 = 0;
  int v15 = *(_DWORD *)(v3 + 20) & v6;
  while (1)
  {
    __s1 = 0;
    uint64_t v17 = *(void *)v3;
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)(*(void *)v3 + 8 * v15);
    if (!v19) {
      break;
    }
    if ((*(unsigned int (**)(uint64_t, void **))(v3 + 24))(v19, &__s1) == v4
      && !memcmp(__s1, v5, (int)v4))
    {
      uint64_t v17 = *(void *)v3;
      break;
    }
    int v16 = *(_DWORD *)(v3 + 8);
    if (v18 + 1 == v16) {
      int v15 = 0;
    }
    else {
      int v15 = v18 + 1;
    }
    if (++v14 >= v16) {
      goto LABEL_14;
    }
  }
  uint64_t v20 = (uint64_t *)(v17 + 8 * v18);
  uint64_t result = *v20;
  if (!*v20)
  {
LABEL_15:
    int v21 = *(_DWORD *)(v3 + 16);
    if (*(_DWORD *)(v3 + 12) > v21)
    {
      uint64_t v22 = *(void *)v3;
      uint64_t v23 = *(int *)(v3 + 8);
      *(_DWORD *)(v3 + 8) = 2 * v23;
      *(_DWORD *)(v3 + 12) = 0;
      *(_DWORD *)(v3 + 16) = 2 * v21;
      *(_DWORD *)(v3 + 20) = 2 * v23 - 1;
      sub_1000C2F04(16 * v23, v7, v8, v9, v10, v11, v12, v13);
      if (v24)
      {
        uint64_t v23 = v23;
        *(void *)uint64_t v3 = v24;
        if ((int)v23 >= 1)
        {
          uint64_t v31 = (uint64_t *)v22;
          do
          {
            if (*v31) {
              sub_1000C0F04(v3, *v31, v25, v26, v27, v28, v29, v30);
            }
            ++v31;
            --v23;
          }
          while (v23);
        }
        sub_1000C321C(v22);
      }
      uint64_t v32 = v37;
      int v33 = *(_DWORD *)(v3 + 20) & (*(uint64_t (**)(const void *, uint64_t, void))(v3 + 32))(v37, v4, 0);
      uint64_t v34 = v33;
      __s1 = 0;
      uint64_t v35 = *(void *)v3;
      if (*(void *)(*(void *)v3 + 8 * v33))
      {
        int v36 = 1;
        while ((*(unsigned int (**)(void))(v3 + 24))() != v4 || memcmp(__s1, v32, (int)v4))
        {
          if (v33 + 1 == *(_DWORD *)(v3 + 8)) {
            int v33 = 0;
          }
          else {
            ++v33;
          }
          __s1 = 0;
          uint64_t v35 = *(void *)v3;
          uint64_t v34 = v33;
          ++v36;
          if (!*(void *)(*(void *)v3 + 8 * v33)) {
            goto LABEL_32;
          }
        }
        uint64_t v35 = *(void *)v3;
      }
LABEL_32:
      uint64_t v20 = (uint64_t *)(v35 + 8 * v34);
    }
    *uint64_t v20 = a2;
    ++*(_DWORD *)(v3 + 12);
    return *v20;
  }
  return result;
}

uint64_t sub_1000C12B0(unsigned int a1)
{
  BOOL v1 = a1 != 247;
  if (a1 < 0xDF) {
    BOOL v1 = 0;
  }
  return a1 - 97 < 0x1A || v1;
}

uint64_t sub_1000C12D4(int a1)
{
  BOOL v1 = (a1 + 64) <= 0x1Eu && a1 != 215;
  return (a1 - 65) < 0x1A || v1;
}

uint64_t sub_1000C1300(int a1)
{
  if ((a1 + 64) >= 0x1Fu || a1 == 215) {
    unsigned __int8 v2 = a1;
  }
  else {
    unsigned __int8 v2 = a1 + 32;
  }
  if ((a1 - 65) <= 0x19) {
    return (a1 + 32);
  }
  else {
    return v2;
  }
}

uint64_t sub_1000C1330(int a1)
{
  if ((a1 + 32) >= 0x1Fu || a1 == 247) {
    unsigned __int8 v2 = a1;
  }
  else {
    unsigned __int8 v2 = a1 - 32;
  }
  if ((a1 - 97) <= 0x19) {
    return (a1 - 32);
  }
  else {
    return v2;
  }
}

BOOL sub_1000C1360(unsigned int a1)
{
  if ((a1 & 0x80) == 0) {
    return (byte_1000F6054[a1] & 3) != 0;
  }
  BOOL v3 = a1 > 0xDE && a1 != 247;
  if ((a1 + 64) <= 0x1Eu) {
    return a1 != 215;
  }
  else {
    return v3;
  }
}

BOOL sub_1000C13A8(int a1)
{
  return (a1 - 48) < 0xA;
}

uint64_t sub_1000C13B8(int a1, int a2)
{
  uint64_t v4 = (int *)sub_1000C33A0(24);
  uint64_t v5 = (uint64_t)v4;
  if (!v4) {
    return v5;
  }
  *uint64_t v4 = a1;
  v4[1] = a2;
  uint64_t v6 = sub_1000C33A0(8 * a1);
  *(void *)(v5 + 8) = v6;
  if (v6)
  {
    uint64_t v7 = sub_1000C33A0(8 * a2 * a1);
    *(void *)(v5 + 16) = v7;
    if (v7)
    {
      if (a1 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          *(void *)(*(void *)(v5 + 8) + v8) = v7;
          v8 += 8;
          v7 += 8 * a2;
        }
        while (8 * a1 != v8);
      }
      return v5;
    }
    uint64_t v6 = *(void *)(v5 + 8);
  }
  sub_1000C321C(v6);
  sub_1000C321C(*(void *)(v5 + 16));
  sub_1000C321C(v5);
  return 0;
}

uint64_t sub_1000C147C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_1000C321C(*(void *)(result + 8));
    sub_1000C321C(*(void *)(v1 + 16));
    return sub_1000C321C(v1);
  }
  return result;
}

void sub_1000C14C8(int *a1, double a2)
{
  uint64_t v2 = *a1;
  if ((int)v2 >= 1)
  {
    uint64_t v5 = 0;
    size_t v6 = 8 * v2;
    uint64_t v7 = 8 * *a1;
    do
    {
      bzero(*(void **)(*((void *)a1 + 1) + v5), v6);
      *(double *)(*(void *)(*((void *)a1 + 1) + v5) + v5) = a2;
      v5 += 8;
    }
    while (v7 != v5);
  }
}

uint64_t sub_1000C1540(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)a3;
  if (*(int *)a3 >= 1)
  {
    LODWORD(v4) = *(_DWORD *)(a3 + 4);
    if ((int)v4 >= 1)
    {
      uint64_t v5 = 0;
      do
      {
        if ((int)v4 >= 1)
        {
          uint64_t v6 = 0;
          do
          {
            *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v5) + 8 * v6) = *(double *)(result + 8 * v5)
                                                                            * *(double *)(a2 + 8 * v6);
            ++v6;
            uint64_t v4 = *(int *)(a3 + 4);
          }
          while (v6 < v4);
          int v3 = *(_DWORD *)a3;
        }
        ++v5;
      }
      while (v5 < v3);
    }
  }
  return result;
}

double sub_1000C15B4(uint64_t a1, int a2, int a3)
{
  return *(double *)(*(void *)(*(void *)(a1 + 8) + 8 * a2) + 8 * a3);
}

uint64_t sub_1000C15C4(uint64_t result, int a2, int a3, double a4)
{
  *(double *)(*(void *)(*(void *)(result + 8) + 8 * a2) + 8 * a3) = a4;
  return result;
}

double sub_1000C15D4(int *a1, uint64_t a2)
{
  if (*a1 >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      double result = *(double *)(a2 + 8 * v2);
      *(double *)(*(void *)(*((void *)a1 + 1) + 8 * v2) + 8 * v2) = result;
      ++v2;
    }
    while (v2 < *a1);
  }
  return result;
}

uint64_t sub_1000C160C(uint64_t result, double a2)
{
  int v2 = *(_DWORD *)result;
  if (*(int *)result >= 1)
  {
    LODWORD(v3) = *(_DWORD *)(result + 4);
    if ((int)v3 >= 1)
    {
      uint64_t v4 = 0;
      do
      {
        if ((int)v3 >= 1)
        {
          uint64_t v5 = 0;
          do
          {
            uint64_t v6 = *(void *)(*(void *)(result + 8) + 8 * v4);
            *(double *)(v6 + 8 * v5) = *(double *)(v6 + 8 * v5) * a2;
            ++v5;
            uint64_t v3 = *(int *)(result + 4);
          }
          while (v5 < v3);
          int v2 = *(_DWORD *)result;
        }
        ++v4;
      }
      while (v4 < v2);
    }
  }
  return result;
}

uint64_t sub_1000C1678(int *a1, int *a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v12 = *a1;
  uint64_t v13 = a1[1];
  if (*a1 >= (int)v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v12;
  }
  if (v12 >= 1)
  {
    uint64_t v15 = 0;
    size_t v16 = 8 * v13;
    do
    {
      memcpy(*(void **)(*((void *)a3 + 1) + 8 * v15), *(const void **)(*((void *)a1 + 1) + 8 * v15), v16);
      ++v15;
    }
    while (v15 < *a1);
  }
  uint64_t v17 = *a2;
  if ((int)v17 >= 1)
  {
    uint64_t v18 = 0;
    size_t v19 = 8 * v17;
    uint64_t v20 = 8 * *a2;
    do
    {
      bzero(*(void **)(*((void *)a2 + 1) + v18), v19);
      *(void *)(*(void *)(*((void *)a2 + 1) + v18) + v18) = 0;
      v18 += 8;
    }
    while (v20 != v18);
  }
  if (a4)
  {
    uint64_t v21 = sub_1000C2EFC(4 * *a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8);
    uint64_t v22 = v21;
    if (*a1 >= 1)
    {
      uint64_t v23 = 0;
      do
      {
        *(_DWORD *)(v21 + 4 * v23) = v23;
        ++v23;
      }
      while (v23 < *a1);
    }
    LODWORD(v24) = *a3;
    if ((int)v14 >= 1)
    {
      uint64_t v25 = 0;
      uint64_t v26 = 1;
      while (1)
      {
        uint64_t v27 = *((void *)a3 + 1);
        double v28 = fabs(*(double *)(*(void *)(v27 + 8 * v25) + 8 * v25));
        uint64_t v29 = v25 + 1;
        if (v25 + 1 < (int)v24) {
          break;
        }
        int v31 = v25;
        if (v28 != 0.0) {
          goto LABEL_25;
        }
LABEL_16:
        ++v26;
        ++v25;
        if (v29 == v14) {
          goto LABEL_39;
        }
      }
      uint64_t v30 = v26;
      int v31 = v25;
      do
      {
        double v32 = fabs(*(double *)(*(void *)(v27 + 8 * v30) + 8 * v25));
        if (v32 > v28)
        {
          int v31 = v30;
          double v28 = v32;
        }
        ++v30;
      }
      while (v24 != v30);
      if (v28 == 0.0) {
        goto LABEL_16;
      }
LABEL_25:
      if (v25 != v31)
      {
        int v33 = *(_DWORD *)(v21 + 4 * v25);
        uint64_t v34 = 4 * v31;
        *(_DWORD *)(v21 + 4 * v25) = *(_DWORD *)(v21 + v34);
        *(_DWORD *)(v21 + v34) = v33;
        uint64_t v35 = 8 * v31;
        if (a3[1] >= 1)
        {
          uint64_t v36 = 0;
          do
          {
            uint64_t v37 = *((void *)a3 + 1);
            uint64_t v38 = *(void *)(v37 + 8 * v25);
            uint64_t v39 = 8 * v36;
            uint64_t v40 = *(void *)(v38 + 8 * v36);
            *(void *)(v38 + v39) = *(void *)(*(void *)(v37 + v35) + 8 * v36);
            *(void *)(*(void *)(*((void *)a3 + 1) + v35) + v39) = v40;
            ++v36;
          }
          while (v36 < a3[1]);
        }
        if (a2[1] >= 1)
        {
          uint64_t v41 = 0;
          do
          {
            uint64_t v42 = *((void *)a2 + 1);
            uint64_t v43 = *(void *)(v42 + 8 * v25);
            uint64_t v44 = 8 * v41;
            uint64_t v45 = *(void *)(v43 + 8 * v41);
            *(void *)(v43 + v44) = *(void *)(*(void *)(v42 + v35) + 8 * v41);
            *(void *)(*(void *)(*((void *)a2 + 1) + v35) + v44) = v45;
            ++v41;
          }
          while (v41 < a2[1]);
        }
      }
      uint64_t v24 = *a3;
      if (v29 < v24)
      {
        uint64_t v46 = v26;
        do
        {
          uint64_t v48 = *((void *)a3 + 1);
          uint64_t v49 = *(void *)(v48 + 8 * v46);
          double v50 = *(double *)(v49 + 8 * v25) / *(double *)(*(void *)(v48 + 8 * v25) + 8 * v25);
          if (a3[1] >= 1)
          {
            uint64_t v51 = 0;
            do
            {
              *(double *)(*(void *)(*((void *)a3 + 1) + 8 * v46) + 8 * v51) = *(double *)(*(void *)(*((void *)a3 + 1) + 8 * v46)
                                                                                            + 8 * v51)
                                                                                + -v50
                                                                                * *(double *)(*(void *)(*((void *)a3 + 1) + 8 * v25)
                                                                                            + 8 * v51);
              ++v51;
            }
            while (v51 < a3[1]);
            uint64_t v49 = *(void *)(*((void *)a3 + 1) + 8 * v46);
          }
          *(void *)(v49 + 8 * v25) = 0;
          uint64_t v47 = *(void *)(*((void *)a2 + 1) + 8 * v46++);
          *(double *)(v47 + 8 * v25) = v50;
          LODWORD(v24) = *a3;
        }
        while (*a3 > (int)v46);
      }
      goto LABEL_16;
    }
LABEL_39:
    sub_1000CA878(a4, v24, v21);
    sub_1000C321C(v22);
    goto LABEL_40;
  }
  if ((int)v14 < 1)
  {
LABEL_40:
    if (*a2 >= 1)
    {
      uint64_t v52 = 0;
      do
      {
        *(void *)(*(void *)(*((void *)a2 + 1) + 8 * v52) + 8 * v52) = 0x3FF0000000000000;
        ++v52;
      }
      while (v52 < *a2);
    }
    return 0;
  }
  uint64_t v54 = 0;
  uint64_t v55 = 1;
  while (*(double *)(*(void *)(*((void *)a3 + 1) + 8 * v54) + 8 * v54) != 0.0)
  {
    uint64_t v56 = v54 + 1;
    if (v54 + 1 < *a3)
    {
      uint64_t v57 = v55;
      do
      {
        uint64_t v59 = *((void *)a3 + 1);
        uint64_t v60 = *(void *)(v59 + 8 * v57);
        double v61 = *(double *)(v60 + 8 * v54) / *(double *)(*(void *)(v59 + 8 * v54) + 8 * v54);
        if (a3[1] >= 1)
        {
          uint64_t v62 = 0;
          do
          {
            *(double *)(*(void *)(*((void *)a3 + 1) + 8 * v57) + 8 * v62) = *(double *)(*(void *)(*((void *)a3 + 1) + 8 * v57)
                                                                                          + 8 * v62)
                                                                              + -v61
                                                                              * *(double *)(*(void *)(*((void *)a3 + 1) + 8 * v54)
                                                                                          + 8 * v62);
            ++v62;
          }
          while (v62 < a3[1]);
          uint64_t v60 = *(void *)(*((void *)a3 + 1) + 8 * v57);
        }
        *(void *)(v60 + 8 * v54) = 0;
        uint64_t v58 = *(void *)(*((void *)a2 + 1) + 8 * v57++);
        *(double *)(v58 + 8 * v54) = v61;
      }
      while (*a3 > (int)v57);
    }
    ++v55;
    ++v54;
    if (v56 == v14) {
      goto LABEL_40;
    }
  }
  return 1;
}

uint64_t sub_1000C1AAC(int *a1, int *a2)
{
  uint64_t v4 = (int *)sub_1000C13B8(*a1, *a1);
  if (!v4) {
    return 1;
  }
  uint64_t v10 = (uint64_t)v4;
  if (*v4 >= 1)
  {
    uint64_t v11 = 0;
    do
    {
      *(void *)(*(void *)(*((void *)v4 + 1) + 8 * v11) + 8 * v11) = 0x3FF0000000000000;
      ++v11;
    }
    while (v11 < *v4);
  }
  uint64_t v12 = sub_1000C1B64(a1, v4, a2, v5, v6, v7, v8, v9);
  sub_1000C321C(*(void *)(v10 + 8));
  sub_1000C321C(*(void *)(v10 + 16));
  sub_1000C321C(v10);
  return v12;
}

uint64_t sub_1000C1B64(int *a1, int *a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = (void *)sub_1000C2EFC(8 * *a2, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  uint64_t v19 = sub_1000C2EFC(8 * *a2, v12, v13, v14, v15, v16, v17, v18);
  if (a2[1] < 1)
  {
LABEL_12:
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v20 = 0;
    while (1)
    {
      if (*a2 >= 1)
      {
        uint64_t v21 = 0;
        do
        {
          v11[v21] = *(void *)(*(void *)(*((void *)a2 + 1) + 8 * v21) + 8 * v20);
          ++v21;
        }
        while (v21 < *a2);
      }
      uint64_t v22 = sub_1000C1F40(a1, v11, v19);
      if (v22) {
        break;
      }
      if (*a3 >= 1)
      {
        uint64_t v23 = 0;
        do
        {
          *(void *)(*(void *)(*((void *)a3 + 1) + 8 * v23) + 8 * v20) = *(void *)(v19 + 8 * v23);
          ++v23;
        }
        while (v23 < *a3);
      }
      if (++v20 >= a2[1]) {
        goto LABEL_12;
      }
    }
    uint64_t v24 = v22;
  }
  sub_1000C321C((uint64_t)v11);
  sub_1000C321C(v19);
  return v24;
}

uint64_t sub_1000C1C88(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)result;
  if (*(int *)result >= 1)
  {
    uint64_t v3 = 0;
    LODWORD(v4) = *(_DWORD *)(result + 4);
    do
    {
      if (v3 < (int)v4)
      {
        uint64_t v5 = v3;
        do
        {
          uint64_t v6 = *(void *)(result + 8);
          uint64_t v7 = *(void *)(*(void *)(v6 + 8 * v3) + 8 * v5);
          *(void *)(*(void *)(*(void *)(a2 + 8) + 8 * v3) + 8 * v5) = *(void *)(*(void *)(v6 + 8 * v5) + 8 * v3);
          *(void *)(*(void *)(*(void *)(a2 + 8) + 8 * v5++) + 8 * v3) = v7;
          uint64_t v4 = *(int *)(result + 4);
        }
        while (v5 < v4);
        int v2 = *(_DWORD *)result;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

uint64_t sub_1000C1D08(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)result;
  if (*(int *)result >= 1)
  {
    LODWORD(v4) = *(_DWORD *)(result + 4);
    if ((int)v4 >= 1)
    {
      uint64_t v5 = 0;
      do
      {
        if ((int)v4 >= 1)
        {
          uint64_t v6 = 0;
          do
          {
            *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v5) + 8 * v6) = *(double *)(*(void *)(*(void *)(result + 8) + 8 * v5)
                                                                                        + 8 * v6)
                                                                            + *(double *)(*(void *)(*(void *)(a2 + 8) + 8 * v5)
                                                                                        + 8 * v6);
            ++v6;
            uint64_t v4 = *(int *)(result + 4);
          }
          while (v6 < v4);
          int v3 = *(_DWORD *)result;
        }
        ++v5;
      }
      while (v5 < v3);
    }
  }
  return result;
}

uint64_t sub_1000C1D8C(uint64_t result, uint64_t a2, uint64_t a3, double a4)
{
  int v4 = *(_DWORD *)result;
  if (*(int *)result >= 1)
  {
    LODWORD(v5) = *(_DWORD *)(result + 4);
    if ((int)v5 >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        if ((int)v5 >= 1)
        {
          uint64_t v7 = 0;
          do
          {
            *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v6) + 8 * v7) = *(double *)(*(void *)(*(void *)(result + 8) + 8 * v6)
                                                                                        + 8 * v7)
                                                                            + a4
                                                                            * *(double *)(*(void *)(*(void *)(a2 + 8) + 8 * v6)
                                                                                        + 8 * v7);
            ++v7;
            uint64_t v5 = *(int *)(result + 4);
          }
          while (v7 < v5);
          int v4 = *(_DWORD *)result;
        }
        ++v6;
      }
      while (v6 < v4);
    }
  }
  return result;
}

int *sub_1000C1E10(int *result, uint64_t a2, uint64_t a3)
{
  if (*result >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      *(void *)(a3 + 8 * v3) = 0;
      if (result[1] >= 1)
      {
        uint64_t v4 = 0;
        double v5 = 0.0;
        do
        {
          double v5 = v5 + *(double *)(*(void *)(*((void *)result + 1) + 8 * v3) + 8 * v4) * *(double *)(a2 + 8 * v4);
          *(double *)(a3 + 8 * v3) = v5;
          ++v4;
        }
        while (v4 < result[1]);
      }
      ++v3;
    }
    while (v3 < *result);
  }
  return result;
}

uint64_t sub_1000C1E84(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)result;
  if (*(int *)result >= 1)
  {
    LODWORD(v4) = *(_DWORD *)(a2 + 4);
    if ((int)v4 >= 1)
    {
      uint64_t v5 = 0;
      do
      {
        if ((int)v4 >= 1)
        {
          uint64_t v6 = 0;
          do
          {
            *(void *)(*(void *)(*(void *)(a3 + 8) + 8 * v5) + 8 * v6) = 0;
            if (*(int *)(result + 4) >= 1)
            {
              uint64_t v7 = 0;
              do
              {
                uint64_t v8 = *(void *)(*(void *)(a3 + 8) + 8 * v5);
                *(double *)(v8 + 8 * v6) = *(double *)(v8 + 8 * v6)
                                         + *(double *)(*(void *)(*(void *)(result + 8) + 8 * v5) + 8 * v7)
                                         * *(double *)(*(void *)(*(void *)(a2 + 8) + 8 * v7) + 8 * v6);
                ++v7;
              }
              while (v7 < *(int *)(result + 4));
            }
            ++v6;
            uint64_t v4 = *(int *)(a2 + 4);
          }
          while (v6 < v4);
          int v3 = *(_DWORD *)result;
        }
        ++v5;
      }
      while (v5 < v3);
    }
  }
  return result;
}

uint64_t sub_1000C1F40(int *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000C13B8(*a1, *a1);
  uint64_t v7 = sub_1000C13B8(*a1, a1[1]);
  uint64_t v15 = (uint64_t *)sub_1000CA478(*a1, v8, v9, v10, v11, v12, v13, v14);
  if (sub_1000C1678(a1, (int *)v6, (int *)v7, (uint64_t)v15, v16, v17, v18, v19))
  {
    uint64_t v23 = 1;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v23 = sub_1000C2024((int *)v6, (unsigned int *)v7, (uint64_t)v15, a2, a3, v20, v21, v22);
  if (v6)
  {
LABEL_3:
    sub_1000C321C(*(void *)(v6 + 8));
    sub_1000C321C(*(void *)(v6 + 16));
    sub_1000C321C(v6);
  }
LABEL_4:
  if (v7)
  {
    sub_1000C321C(*(void *)(v7 + 8));
    sub_1000C321C(*(void *)(v7 + 16));
    sub_1000C321C(v7);
  }
  sub_1000CA4B8(v15);
  return v23;
}

uint64_t sub_1000C2024(int *a1, unsigned int *a2, uint64_t a3, const void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v13 = 8 * *a1;
  uint64_t v14 = (void *)sub_1000C2EFC(v13, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8);
  memcpy(v14, a4, v13);
  if (a3) {
    sub_1000CA62C(a3, 0xFFFFFFFFLL, (uint64_t)v14, 8, v18, v19, v20, v21);
  }
  uint64_t v22 = sub_1000C2EFC(v13, v15, v16, v17, v18, v19, v20, v21);
  uint64_t v23 = v22;
  if (*a1 >= 1)
  {
    uint64_t v24 = 0;
    while (*(double *)(*(void *)(*((void *)a1 + 1) + 8 * v24) + 8 * v24) != 0.0)
    {
      double v25 = *((double *)v14 + v24);
      *(double *)(v22 + 8 * v24) = v25;
      if (v24)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          double v25 = v25 - *(double *)(*(void *)(*((void *)a1 + 1) + 8 * v24) + 8 * i) * *(double *)(v22 + 8 * i);
          *(double *)(v22 + 8 * v24) = v25;
        }
      }
      *(double *)(v22 + 8 * v24) = v25 / *(double *)(*(void *)(*((void *)a1 + 1) + 8 * v24) + 8 * v24);
      if (++v24 >= *a1) {
        goto LABEL_11;
      }
    }
    sub_1000C321C((uint64_t)v14);
    goto LABEL_20;
  }
LABEL_11:
  sub_1000C321C((uint64_t)v14);
  uint64_t v27 = *a2;
  if ((int)v27 >= 1)
  {
    while (*(double *)(*(void *)(*((void *)a2 + 1) + 8 * (v27 - 1)) + 8 * (v27 - 1)) != 0.0)
    {
      double v30 = *(double *)(v23 + 8 * (v27 - 1));
      *(double *)(a5 + 8 * (v27 - 1)) = v30;
      if (v27 < (int)*a2)
      {
        uint64_t v31 = v27;
        do
        {
          double v30 = v30
              - *(double *)(*(void *)(*((void *)a2 + 1) + 8 * (v27 - 1)) + 8 * v31)
              * *(double *)(a5 + 8 * v31);
          *(double *)(a5 + 8 * (v27 - 1)) = v30;
          ++v31;
        }
        while (v31 < (int)*a2);
      }
      *(double *)(a5 + 8 * (v27 - 1)) = v30
                                                      / *(double *)(*(void *)(*((void *)a2 + 1)
                                                                              + 8 * (v27 - 1))
                                                                  + 8 * (v27 - 1));
      if (v27-- <= 1) {
        goto LABEL_12;
      }
    }
LABEL_20:
    uint64_t v28 = 2;
    goto LABEL_21;
  }
LABEL_12:
  uint64_t v28 = 0;
LABEL_21:
  sub_1000C321C(v23);
  return v28;
}

uint64_t sub_1000C21F8(unsigned int *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *a1;
  uint64_t v101 = (int)*a1;
  sub_1000C2F04(8 * v101, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  unint64_t v13 = v12;
  sub_1000C2F04(8 * v101, v14, v15, v16, v17, v18, v19, v20);
  uint64_t v22 = v21;
  sub_1000C2F04(8 * v101, v23, v24, v25, v26, v27, v28, v29);
  uint64_t v31 = v30;
  uint64_t v32 = *a2;
  if ((int)v32 >= 1)
  {
    uint64_t v33 = 0;
    size_t v34 = 8 * v32;
    uint64_t v35 = 8 * *a2;
    do
    {
      bzero(*(void **)(*((void *)a2 + 1) + v33), v34);
      *(void *)(*(void *)(*((void *)a2 + 1) + v33) + v33) = 0;
      v33 += 8;
    }
    while (v35 != v33);
  }
  if ((int)*a1 >= 1)
  {
    uint64_t v36 = 0;
    size_t v37 = 8 * (int)a1[1];
    do
    {
      memcpy(*(void **)(*(void *)(a3 + 8) + 8 * v36), *(const void **)(*((void *)a1 + 1) + 8 * v36), v37);
      ++v36;
    }
    while (v36 < (int)*a1);
  }
  if ((int)v11 > 1)
  {
    unint64_t v38 = (v11 - 1);
    uint64_t v39 = v101;
    while (1)
    {
      uint64_t v42 = v39 - 1;
      uint64_t v43 = *(void **)(*(void *)(a3 + 8) + 8 * (v39 - 1));
      uint64_t v44 = 8 * (v39 - 1);
      uint64_t v45 = v39 - 2;
      if (v39 == 2) {
        break;
      }
      if (v38 < 4)
      {
        unint64_t v46 = 0;
        double v47 = 0.0;
        goto LABEL_41;
      }
      unint64_t v48 = v38 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v46 = v38 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v49 = (float64x2_t *)(v43 + 2);
      double v47 = 0.0;
      do
      {
        float64x2_t v50 = vabsq_f64(v49[-1]);
        float64x2_t v51 = vabsq_f64(*v49);
        double v47 = v47 + v50.f64[0] + v50.f64[1] + v51.f64[0] + v51.f64[1];
        v49 += 2;
        v48 -= 4;
      }
      while (v48);
      while (v38 != v46)
LABEL_41:
        double v47 = v47 + fabs(*(double *)&v43[v46++]);
      if (v47 == 0.0)
      {
        v13[(unint64_t)v44 / 8] = *(void *)(*(void *)(*(void *)(a3 + 8) + v44) + 8 * v45);
        double v40 = 0.0;
      }
      else
      {
        uint64_t v52 = 0;
        double v53 = 0.0;
        do
        {
          uint64_t v54 = *(void *)(*(void *)(a3 + 8) + 8 * v42);
          double v55 = *(double *)(v54 + 8 * v52) / v47;
          *(double *)(v54 + 8 * v52) = v55;
          double v53 = v53 + v55 * v55;
          ++v52;
        }
        while (v38 != v52);
        uint64_t v56 = 0;
        double v57 = *(double *)(*(void *)(*(void *)(a3 + 8) + v44) + 8 * v45);
        double v58 = sqrt(v53);
        if (v57 > 0.0) {
          double v58 = -v58;
        }
        *(double *)&v13[(unint64_t)v44 / 8] = v47 * v58;
        double v40 = v53 - v57 * v58;
        *(double *)(*(void *)(*(void *)(a3 + 8) + v44) + 8 * v45) = v57 - v58;
        uint64_t v59 = *(void *)(a3 + 8);
        uint64_t v60 = *(void *)(v59 + v44);
        double v61 = 0.0;
        uint64_t v62 = &_mh_execute_header;
        uint64_t v63 = 1;
        unint64_t v64 = 1;
        do
        {
          uint64_t v66 = 8 * v56;
          *(double *)(*(void *)(v59 + 8 * v56) + v44) = *(double *)(v60 + 8 * v56) / v40;
          uint64_t v67 = *(void *)(a3 + 8);
          uint64_t v68 = *(float64x2_t **)(v67 + 8 * v56);
          uint64_t v69 = *(float64x2_t **)(v67 + v44);
          if (v64 < 4)
          {
            uint64_t v70 = 0;
            double v71 = 0.0;
            goto LABEL_29;
          }
          unint64_t v72 = v64 & 0xFFFFFFFFFFFFFFFCLL;
          uint64_t v70 = v64 & 0x7FFFFFFFFFFFFFFCLL;
          uint64_t v73 = v68 + 1;
          uint64_t v74 = v69 + 1;
          double v71 = 0.0;
          do
          {
            float64x2_t v75 = vmulq_f64(v73[-1], v74[-1]);
            float64x2_t v76 = vmulq_f64(*v73, *v74);
            double v71 = v71 + v75.f64[0] + v75.f64[1] + v76.f64[0] + v76.f64[1];
            v73 += 2;
            v74 += 2;
            v72 -= 4;
          }
          while (v72);
          while (v64 != v70)
          {
LABEL_29:
            double v71 = v71 + v68->f64[v70] * v69->f64[v70];
            ++v70;
          }
          if (v56 < v45)
          {
            uint64_t v77 = &v69->f64[v63];
            uint64_t v78 = (uint64_t *)(v67 + v63 * 8);
            uint64_t v79 = (uint64_t)v62;
            do
            {
              uint64_t v80 = *v78++;
              double v81 = *(double *)(v80 + 8 * v56);
              double v82 = *v77++;
              double v71 = v71 + v81 * v82;
              BOOL v41 = v45 <= v79 >> 32;
              v79 += (uint64_t)&_mh_execute_header;
            }
            while (!v41);
          }
          double v65 = v71 / v40;
          *(double *)(v31 + 8 * v56) = v65;
          uint64_t v59 = *(void *)(a3 + 8);
          uint64_t v60 = *(void *)(v59 + 8 * v42);
          ++v56;
          double v61 = v61 + v65 * *(double *)(v60 + v66);
          ++v64;
          uint64_t v62 = (const mach_header_64 *)((char *)&_mh_execute_header + (void)v62);
          ++v63;
        }
        while (v56 != v38);
        uint64_t v83 = 0;
        uint64_t v84 = 1;
        double v85 = -v61 / (v40 + v40);
        do
        {
          uint64_t v86 = 0;
          double v87 = *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v42) + 8 * v83);
          double v88 = *(double *)(v31 + 8 * v83) + v85 * v87;
          *(double *)&v13[v83] = v88;
          do
          {
            *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v83) + 8 * v86) = *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v83)
                                                                                          + 8 * v86)
                                                                              - (v88
                                                                               * *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v42)
                                                                                           + 8 * v86)
                                                                               + v87 * *(double *)&v13[v86]);
            ++v86;
          }
          while (v84 != v86);
          ++v83;
          ++v84;
        }
        while (v83 != v38);
      }
      *(double *)&v22[v42] = v40;
      --v38;
      BOOL v41 = v39-- <= 2;
      if (v41) {
        goto LABEL_45;
      }
    }
    v13[(unint64_t)v44 / 8] = *v43;
    v22[(unint64_t)v44 / 8] = 0;
  }
LABEL_45:
  *uint64_t v22 = 0;
  *unint64_t v13 = 0;
  if ((int)v101 >= 1)
  {
    uint64_t v89 = 0;
    do
    {
      if (v89 && *(double *)&v22[v89] != 0.0)
      {
        for (uint64_t i = 0; i != v89; ++i)
        {
          uint64_t v91 = 0;
          double v92 = 0.0;
          do
          {
            double v92 = v92
                + *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v89) + 8 * v91)
                * *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v91) + 8 * i);
            ++v91;
          }
          while (v89 != v91);
          for (uint64_t j = 0; j != v89; ++j)
          {
            uint64_t v94 = *(void *)(*(void *)(a3 + 8) + 8 * j);
            *(double *)(v94 + 8 * i) = *(double *)(v94 + 8 * i) - v92 * *(double *)(v94 + 8 * v89);
          }
        }
      }
      uint64_t v95 = v89;
      v22[v95] = *(void *)(*(void *)(*(void *)(a3 + 8) + 8 * v89) + 8 * v89);
      *(void *)(*(void *)(*(void *)(a3 + 8) + 8 * v89) + v95 * 8) = 0x3FF0000000000000;
      if (v89)
      {
        for (uint64_t k = 0; k != v89; ++k)
        {
          *(void *)(*(void *)(*(void *)(a3 + 8) + 8 * v89) + 8 * k) = 0;
          *(void *)(*(void *)(*(void *)(a3 + 8) + 8 * k) + 8 * v89) = 0;
        }
      }
      ++v89;
    }
    while (v89 != v11);
  }
  if (*a2 >= 1)
  {
    uint64_t v97 = 0;
    do
    {
      *(void *)(*(void *)(*((void *)a2 + 1) + 8 * v97) + 8 * v97) = v22[v97];
      ++v97;
    }
    while (v97 < *a2);
  }
  if ((int)v11 > 1)
  {
    unint64_t v98 = 0;
    v99 = v13 + 1;
    do
    {
      *(void *)(*(void *)(*((void *)a2 + 1) + v98 + 8) + v98) = v99[v98 / 8];
      *(void *)(*(void *)(*((void *)a2 + 1) + v98) + v98 + 8) = v99[v98 / 8];
      v98 += 8;
    }
    while (8 * v101 - 8 != v98);
  }
  sub_1000C321C(v31);
  sub_1000C321C((uint64_t)v22);
  return sub_1000C321C((uint64_t)v13);
}

uint64_t sub_1000C279C(unsigned int *a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *a1;
  unint64_t v12 = 8 * (int)*a1;
  sub_1000C2F04(v12, a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  uint64_t v14 = v13;
  sub_1000C2F04(v12, v15, v16, v17, v18, v19, v20, v21);
  uint64_t v23 = v22;
  uint64_t v24 = *a3;
  if ((int)v24 >= 1)
  {
    uint64_t v25 = 0;
    size_t v26 = 8 * v24;
    uint64_t v27 = 8 * *a3;
    do
    {
      bzero(*(void **)(*((void *)a3 + 1) + v25), v26);
      *(void *)(*(void *)(*((void *)a3 + 1) + v25) + v25) = 0x3FF0000000000000;
      v25 += 8;
    }
    while (v27 != v25);
  }
  if ((int)v11 > 1)
  {
    uint64_t v28 = 0;
    do
    {
      *(void *)(v23 + v28) = *(void *)(*(void *)(*((void *)a1 + 1) + v28 + 8) + v28);
      *(void *)(v14 + v28) = *(void *)(*(void *)(*((void *)a1 + 1) + v28) + v28);
      v28 += 8;
    }
    while (8 * v11 - 8 != v28);
  }
  int v29 = v11 - 1;
  uint64_t v30 = 8 * ((int)v11 - 1);
  *(void *)(v23 + v30) = 0;
  *(void *)(v14 + v30) = *(void *)(*(void *)(*((void *)a1 + 1) + v30) + v30);
  if ((int)v11 >= 1)
  {
    unint64_t v31 = 0;
    uint64_t v32 = (double *)(v14 + 8);
    while (2)
    {
      int v33 = 0;
      if ((int)v31 <= v29) {
        unint64_t v34 = v29;
      }
      else {
        unint64_t v34 = v31;
      }
      unint64_t v35 = v31 + 1;
LABEL_15:
      uint64_t v36 = v32;
      unint64_t v37 = v31;
      while (v34 != v37)
      {
        int v38 = v37 + 1;
        double v39 = fabs(*(v36 - 1)) + fabs(*v36);
        double v40 = fabs(*(double *)(v23 + 8 * v37)) + v39;
        ++v36;
        ++v37;
        if (v40 == v39)
        {
          unint64_t v41 = (v38 - 1);
          if (v41 == v31) {
            goto LABEL_43;
          }
LABEL_21:
          if (v33 == 30) {
            return 0;
          }
          double v42 = *(double *)(v14 + 8 * v31);
          double v43 = *(double *)(v23 + 8 * v31);
          double v44 = (*(double *)(v14 + 8 * v35) - v42) / (v43 + v43);
          double v45 = fabs(v44);
          if (v45 >= 1.0) {
            double v46 = v45;
          }
          else {
            double v46 = 1.0;
          }
          double v47 = 0.0;
          double v48 = 0.0;
          if (v46 != 0.0)
          {
            double v49 = fmin(v45, 1.0);
            double v48 = v46 * sqrt(v49 / v46 * (v49 / v46) + 1.0);
          }
          ++v33;
          double v50 = *(double *)(v14 + 8 * v41) - v42;
          double v51 = fabs(v48);
          if (v44 < 0.0) {
            double v51 = -v51;
          }
          double v52 = v50 + v43 / (v44 + v51);
          if (v41 <= v31)
          {
LABEL_14:
            *(double *)(v14 + 8 * v31) = *(double *)(v14 + 8 * v31) - v47;
            *(double *)(v23 + 8 * v31) = v52;
            *(void *)(v23 + 8 * v41) = 0;
          }
          else
          {
            double v53 = 1.0;
            unint64_t v54 = v41;
            double v55 = 1.0;
            while (1)
            {
              uint64_t v56 = v54 - 1;
              double v57 = *(double *)(v23 + 8 * (v54 - 1));
              double v58 = v55 * v57;
              double v59 = fabs(v58);
              double v60 = fabs(v52);
              double v61 = v59 >= v60 ? v59 : v60;
              if (v61 == 0.0) {
                break;
              }
              if (v59 >= v60) {
                double v59 = v60;
              }
              double v62 = v61 * sqrt(v59 / v61 * (v59 / v61) + 1.0);
              *(double *)(v23 + 8 * v54) = v62;
              if (v62 == 0.0)
              {
                *(double *)(v14 + 8 * v54) = *(double *)(v14 + 8 * v54) - v47;
                *(void *)(v23 + 8 * v41) = 0;
                goto LABEL_15;
              }
              uint64_t v63 = 0;
              double v64 = v53 * v57;
              double v55 = v58 / v62;
              double v53 = v52 / v62;
              uint64_t v65 = 8 * v54;
              double v66 = *(double *)(v14 + v65) - v47;
              double v67 = v64 * (v53 + v53) + (*(double *)(v14 + 8 * v56) - v66) * v55;
              double v47 = v55 * v67;
              *(double *)(v14 + v65) = v66 + v55 * v67;
              double v52 = -(v64 - v53 * v67);
              do
              {
                uint64_t v68 = *(void *)(*((void *)a3 + 1) + v63);
                double v69 = *(double *)(v68 + v65);
                *(double *)(v68 + v65) = v53 * v69 + v55 * *(double *)(v68 + 8 * v56);
                *(double *)(*(void *)(*((void *)a3 + 1) + v63) + 8 * v56) = v69 * -v55
                                                                              + v53
                                                                              * *(double *)(*(void *)(*((void *)a3 + 1) + v63)
                                                                                          + 8 * v56);
                v63 += 8;
              }
              while (8 * v11 != v63);
              unint64_t v54 = v56;
              if (v56 <= (uint64_t)v31) {
                goto LABEL_14;
              }
            }
            uint64_t v70 = 8 * (int)v54;
            *(void *)(v23 + v70) = 0;
            *(double *)(v14 + v70) = *(double *)(v14 + v70) - v47;
            *(void *)(v23 + 8 * v41) = 0;
          }
          goto LABEL_15;
        }
      }
      unint64_t v41 = v34;
      if (v34 != v31) {
        goto LABEL_21;
      }
LABEL_43:
      ++v32;
      ++v31;
      if (v35 != v11) {
        continue;
      }
      break;
    }
    uint64_t v71 = 0;
    if (v11 < 4) {
      goto LABEL_49;
    }
    if ((unint64_t)(a2 - v14) < 0x20) {
      goto LABEL_49;
    }
    uint64_t v71 = v11 & 0x7FFFFFFC;
    unint64_t v72 = (long long *)(v14 + 16);
    uint64_t v73 = (_OWORD *)(a2 + 16);
    uint64_t v74 = v11 & 0xFFFFFFFC;
    do
    {
      long long v75 = *v72;
      *(v73 - 1) = *(v72 - 1);
      *uint64_t v73 = v75;
      v72 += 2;
      v73 += 2;
      v74 -= 4;
    }
    while (v74);
    if (v71 != v11)
    {
LABEL_49:
      float64x2_t v76 = (void *)(a2 + 8 * v71);
      uint64_t v77 = (uint64_t *)(v14 + 8 * v71);
      uint64_t v78 = v11 - v71;
      do
      {
        uint64_t v79 = *v77++;
        *v76++ = v79;
        --v78;
      }
      while (v78);
    }
  }
  sub_1000C321C(v23);
  sub_1000C321C(v14);
  return 1;
}

uint64_t sub_1000C2B84(unsigned int *a1, uint64_t a2, int *a3)
{
  size_t v6 = *a1;
  uint64_t v7 = (int *)sub_1000C13B8(v6, v6);
  uint64_t v8 = sub_1000C13B8(v6, v6);
  sub_1000C21F8(a1, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v26 = sub_1000C279C((unsigned int *)v7, a2, a3, v14, v15, v16, v17, v18);
  if (v26)
  {
    int v27 = *(_DWORD *)v8;
    if (*(int *)v8 >= 1)
    {
      LODWORD(v28) = a3[1];
      if ((int)v28 >= 1)
      {
        uint64_t v29 = 0;
        do
        {
          if ((int)v28 >= 1)
          {
            uint64_t v30 = 0;
            do
            {
              *(void *)(*(void *)(*((void *)v7 + 1) + 8 * v29) + 8 * v30) = 0;
              if (*(int *)(v8 + 4) >= 1)
              {
                uint64_t v31 = 0;
                do
                {
                  uint64_t v32 = *(void *)(*((void *)v7 + 1) + 8 * v29);
                  *(double *)(v32 + 8 * v30) = *(double *)(v32 + 8 * v30)
                                             + *(double *)(*(void *)(*(void *)(v8 + 8) + 8 * v29) + 8 * v31)
                                             * *(double *)(*(void *)(*((void *)a3 + 1) + 8 * v31) + 8 * v30);
                  ++v31;
                }
                while (v31 < *(int *)(v8 + 4));
              }
              ++v30;
              uint64_t v28 = a3[1];
            }
            while (v30 < v28);
            int v27 = *(_DWORD *)v8;
          }
          ++v29;
        }
        while (v29 < v27);
      }
    }
    if (*v7 >= 1)
    {
      uint64_t v33 = 0;
      size_t v34 = 8 * v7[1];
      do
      {
        memcpy(*(void **)(*((void *)a3 + 1) + 8 * v33), *(const void **)(*((void *)v7 + 1) + 8 * v33), v34);
        ++v33;
      }
      while (v33 < *v7);
    }
    if ((int)v6 <= 0)
    {
      double v43 = (uint64_t *)sub_1000CA478(0, v19, v20, v21, v22, v23, v24, v25);
      if (*a3 >= 1) {
        goto LABEL_27;
      }
      goto LABEL_29;
    }
    qword_100106960 = a2;
    sub_1000C2F04(4 * v6, v19, v20, v21, v22, v23, v24, v25);
    uint64_t v36 = (uint64_t)v35;
    if (v6 >= 8)
    {
      size_t v37 = v6 & 0x7FFFFFF8;
      int32x4_t v44 = (int32x4_t)xmmword_1000F4C90;
      double v45 = v35 + 1;
      v46.i64[0] = 0x400000004;
      v46.i64[1] = 0x400000004;
      v47.i64[0] = 0x800000008;
      v47.i64[1] = 0x800000008;
      uint64_t v48 = v6 & 0xFFFFFFF8;
      do
      {
        v45[-1] = v44;
        *double v45 = vaddq_s32(v44, v46);
        int32x4_t v44 = vaddq_s32(v44, v47);
        v45 += 2;
        v48 -= 8;
      }
      while (v48);
      if (v37 == v6)
      {
LABEL_26:
        qsort(v35, v6, 4uLL, (int (__cdecl *)(const void *, const void *))sub_1000C2E6C);
        qword_100106960 = 0;
        double v43 = (uint64_t *)sub_1000CA478(v6, v49, v50, v51, v52, v53, v54, v55);
        sub_1000CA878((uint64_t)v43, v6, v36);
        sub_1000CA96C((uint64_t)v43);
        sub_1000C321C(v36);
        if (*a3 >= 1)
        {
LABEL_27:
          uint64_t v56 = 0;
          do
            sub_1000CA504((uint64_t)v43, *(void *)(*((void *)a3 + 1) + 8 * v56++), 8, v38, v39, v40, v41, v42);
          while (v56 < *a3);
        }
LABEL_29:
        sub_1000CA504((uint64_t)v43, a2, 8, v38, v39, v40, v41, v42);
        sub_1000CA4B8(v43);
        sub_1000C321C(*(void *)(v8 + 8));
        sub_1000C321C(*(void *)(v8 + 16));
        sub_1000C321C(v8);
        sub_1000C321C(*((void *)v7 + 1));
        sub_1000C321C(*((void *)v7 + 2));
        sub_1000C321C((uint64_t)v7);
        return v26;
      }
    }
    else
    {
      size_t v37 = 0;
    }
    do
    {
      v35->i32[v37] = v37;
      ++v37;
    }
    while (v6 != v37);
    goto LABEL_26;
  }
  return v26;
}

uint64_t sub_1000C2E6C(int *a1, int *a2)
{
  uint64_t v2 = *a1;
  double v3 = *(double *)(qword_100106960 + 8 * v2);
  uint64_t v4 = *a2;
  double v5 = *(double *)(qword_100106960 + 8 * v4);
  if (v3 == v5) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = -1;
  }
  if (v3 < v5) {
    unsigned int v6 = 1;
  }
  BOOL v7 = (int)v2 < (int)v4;
  if (v2 == v4) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = -1;
  }
  if (v7) {
    unsigned int v8 = 1;
  }
  if (v6) {
    return v6;
  }
  else {
    return v8;
  }
}

uint64_t sub_1000C2EA8(uint64_t a1)
{
  uint64_t v1 = qword_100106970;
  qword_100106970 = a1;
  return v1;
}

uint64_t sub_1000C2EBC(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 24))
    {
      double result = (*(uint64_t (**)(uint64_t))(result + 8))(result);
      *(void *)(v1 + 24) = 0;
    }
  }
  return result;
}

uint64_t sub_1000C2EFC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1000C30A4(a1, 1, a3, a4, a5, a6, a7, a8);
}

void sub_1000C2F04(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (void *)sub_1000C30A4(a1, 1, a3, a4, a5, a6, a7, a8);
  bzero(v9, a1);
}

uint64_t sub_1000C2F44(char *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    if (!a2) {
      return 0;
    }
    uint64_t v13 = sub_1000C30A4(a2, 1, a3, a4, a5, a6, a7, a8);
    unint64_t v11 = 0;
    size_t v20 = a2;
    if (!a2) {
      return v13;
    }
    goto LABEL_12;
  }
  uint64_t v10 = a1 - 8;
  unint64_t v11 = *((unsigned int *)a1 - 2);
  if (!a2)
  {
    uint64_t v21 = qword_100106970;
    v22.i64[0] = -1;
    v22.i64[1] = -1;
    v23.i64[1] = -1;
    v23.i64[0] = v11;
    *(void *)&long long v24 = vsubq_s64((int64x2_t)xmmword_100106980, v23).u64[0];
    *((void *)&v24 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v22).i64[1];
    xmmword_100106980 = v24;
    int64x2_t v25 = *(int64x2_t *)(qword_100106970 + 32);
    v23.i64[0] = vsubq_s64(v25, v23).u64[0];
    v23.i64[1] = vaddq_s64(v25, v22).i64[1];
    *(int64x2_t *)(qword_100106970 + 32) = v23;
    (*(void (**)(uint64_t, char *))(v21 + 8))(v21, v10);
    return 0;
  }
  uint64_t v12 = (void *)sub_1000C30A4(a2, 1, a3, a4, a5, a6, a7, a8);
  uint64_t v13 = (uint64_t)v12;
  if (*((unsigned int *)a1 - 2) >= a2) {
    size_t v14 = a2;
  }
  else {
    size_t v14 = *((unsigned int *)a1 - 2);
  }
  memcpy(v12, a1, v14);
  uint64_t v15 = qword_100106970;
  v16.i64[0] = -1;
  v16.i64[1] = -1;
  v17.i64[1] = -1;
  v17.i64[0] = *((unsigned int *)a1 - 2);
  *(void *)&long long v18 = vsubq_s64((int64x2_t)xmmword_100106980, v17).u64[0];
  *((void *)&v18 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v16).i64[1];
  xmmword_100106980 = v18;
  int64x2_t v19 = *(int64x2_t *)(qword_100106970 + 32);
  v17.i64[0] = vsubq_s64(v19, v17).u64[0];
  v17.i64[1] = vaddq_s64(v19, v16).i64[1];
  *(int64x2_t *)(qword_100106970 + 32) = v17;
  (*(void (**)(uint64_t, char *))(v15 + 8))(v15, v10);
  size_t v20 = a2 - v11;
  if (a2 > v11) {
LABEL_12:
  }
    bzero((void *)(v13 + v11), v20);
  return v13;
}

uint64_t sub_1000C30A4(unint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 <= 0x7FFFFFF6
    && (uint64_t v10 = (void *)qword_100106970,
        (unint64_t v11 = (_DWORD *)(*(uint64_t (**)(uint64_t, unint64_t))qword_100106970)(qword_100106970, a1 + 8)) != 0))
  {
    *unint64_t v11 = a1;
    v11[1] = 0;
    unint64_t v12 = v10[4] + a1;
    v10[4] = v12;
    if (v12 > v10[6]) {
      v10[6] = v12;
    }
    unint64_t v13 = v10[7];
    v10[8] += a1;
    unint64_t v14 = v10[5] + 1;
    v10[5] = v14;
    if (v14 > v13) {
      v10[7] = v14;
    }
    ++v10[9];
    *(void *)&xmmword_100106980 = xmmword_100106980 + a1;
    if ((unint64_t)xmmword_100106980 > qword_100106990) {
      qword_100106990 = xmmword_100106980;
    }
    uint64_t result = (uint64_t)(v11 + 2);
    qword_1001069A0 += a1;
    if (++*((void *)&xmmword_100106980 + 1) > (unint64_t)qword_100106998) {
      qword_100106998 = *((void *)&xmmword_100106980 + 1);
    }
    ++qword_1001069A8;
  }
  else if (a2)
  {
    int64x2_t v16 = &xmmword_100106980;
    if (qword_100106970) {
      int64x2_t v16 = (long long *)(qword_100106970 + 32);
    }
    uint64_t v17 = sub_1000C0B7C("vstmem.c", 695, "Error allocating memory: Request %6lu, Size %6lu, Current bytes allocated %lu, %lu objects.", a4, a5, a6, a7, a8, *((void *)v16 + 5));
    return sub_1000C321C(v17);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t sub_1000C321C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = qword_100106970;
    v3.i64[0] = -1;
    v3.i64[1] = -1;
    v4.i64[1] = -1;
    v4.i64[0] = *(unsigned int *)(v1 - 8);
    *(void *)&long long v5 = vsubq_s64((int64x2_t)xmmword_100106980, v4).u64[0];
    *((void *)&v5 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v3).i64[1];
    xmmword_100106980 = v5;
    int64x2_t v6 = *(int64x2_t *)(qword_100106970 + 32);
    v4.i64[0] = vsubq_s64(v6, v4).u64[0];
    v4.i64[1] = vaddq_s64(v6, v3).i64[1];
    *(int64x2_t *)(qword_100106970 + 32) = v4;
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v2, v1 - 8);
  }
  return result;
}

void *sub_1000C3274(void *result, void *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  *result += 8;
  return result;
}

_DWORD *sub_1000C328C(unint64_t a1)
{
  if (a1 > 0x7FFFFFF6) {
    return 0;
  }
  uint64_t v2 = (void *)qword_100106970;
  uint64_t result = (_DWORD *)(*(uint64_t (**)(uint64_t, unint64_t))qword_100106970)(qword_100106970, a1 + 8);
  if (result)
  {
    *uint64_t result = a1;
    result[1] = 0;
    unint64_t v4 = v2[4] + a1;
    v2[4] = v4;
    if (v4 > v2[6]) {
      v2[6] = v4;
    }
    unint64_t v5 = v2[7];
    v2[8] += a1;
    unint64_t v6 = v2[5] + 1;
    v2[5] = v6;
    if (v6 > v5) {
      v2[7] = v6;
    }
    ++v2[9];
    *(void *)&xmmword_100106980 = xmmword_100106980 + a1;
    if ((unint64_t)xmmword_100106980 > qword_100106990) {
      qword_100106990 = xmmword_100106980;
    }
    result += 2;
    qword_1001069A0 += a1;
    if (++*((void *)&xmmword_100106980 + 1) > (unint64_t)qword_100106998) {
      qword_100106998 = *((void *)&xmmword_100106980 + 1);
    }
    ++qword_1001069A8;
  }
  return result;
}

_DWORD *sub_1000C33A4(size_t a1)
{
  if (a1 > 0x7FFFFFF6) {
    return 0;
  }
  uint64_t v2 = (void *)qword_100106970;
  int64x2_t v3 = (_DWORD *)(*(uint64_t (**)(uint64_t, size_t))qword_100106970)(qword_100106970, a1 + 8);
  if (!v3) {
    return 0;
  }
  *int64x2_t v3 = a1;
  v3[1] = 0;
  size_t v4 = v2[4] + a1;
  v2[4] = v4;
  if (v4 > v2[6]) {
    v2[6] = v4;
  }
  unint64_t v5 = v2[7];
  v2[8] += a1;
  unint64_t v6 = v2[5] + 1;
  v2[5] = v6;
  if (v6 > v5) {
    v2[7] = v6;
  }
  BOOL v7 = v3 + 2;
  ++v2[9];
  *(void *)&xmmword_100106980 = xmmword_100106980 + a1;
  if ((unint64_t)xmmword_100106980 > qword_100106990) {
    qword_100106990 = xmmword_100106980;
  }
  qword_1001069A0 += a1;
  if (++*((void *)&xmmword_100106980 + 1) > (unint64_t)qword_100106998) {
    qword_100106998 = *((void *)&xmmword_100106980 + 1);
  }
  ++qword_1001069A8;
  bzero(v3 + 2, a1);
  return v7;
}

uint64_t sub_1000C34DC(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result - 8);
  }
  return result;
}

uint64_t sub_1000C34EC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0;
  if (a2 < 1) {
    return v8;
  }
  unsigned int v9 = a3;
  if ((a3 & 0x80000000) != 0) {
    return v8;
  }
  unsigned int v10 = a2;
  uint64_t v12 = sub_1000C30A4((8 * a2 + 24), 1, a3, a4, a5, a6, a7, a8);
  uint64_t v8 = v12;
  if (!v12) {
    return v8;
  }
  *(_DWORD *)uint64_t v12 = v10;
  *(_DWORD *)(v12 + 4) = v9;
  *(void *)(v12 + 8) = a1;
  if (v9)
  {
    int64x2_t v19 = (char *)sub_1000C30A4(a1 * v10 * v9, 1, v13, v14, v15, v16, v17, v18);
    *(void *)(v8 + 16) = v19;
    if (v19)
    {
      if (v10 >= 2)
      {
        uint64_t v20 = v10 & 0xFFFFFFFE;
        uint64_t v28 = (void *)(v8 + 32);
        uint64_t v29 = v20;
        uint64_t v30 = v19;
        do
        {
          *(v28 - 1) = v30;
          *uint64_t v28 = &v30[a1 * v9];
          v30 += 2 * a1 * v9;
          v28 += 2;
          v29 -= 2;
        }
        while (v29);
        if (v20 == v10) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
      uint64_t v31 = v10 - v20;
      uint64_t v32 = (char **)(v8 + 8 * v20 + 24);
      uint64_t v33 = a1 * v9;
      size_t v34 = &v19[v33 * v20];
      do
      {
        *v32++ = v34;
        v34 += v33;
        --v31;
      }
      while (v31);
LABEL_16:
      unsigned int v10 = *(_DWORD *)v8;
      int v21 = *(_DWORD *)(v8 + 4);
      a1 = *(void *)(v8 + 8);
      goto LABEL_17;
    }
    uint64_t v22 = qword_100106970;
    v23.i64[0] = -1;
    v23.i64[1] = -1;
    v24.i64[1] = -1;
    v24.i64[0] = *(unsigned int *)(v8 - 8);
    *(void *)&long long v25 = vsubq_s64((int64x2_t)xmmword_100106980, v24).u64[0];
    *((void *)&v25 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v23).i64[1];
    xmmword_100106980 = v25;
    int64x2_t v26 = *(int64x2_t *)(qword_100106970 + 32);
    v24.i64[0] = vsubq_s64(v26, v24).u64[0];
    v24.i64[1] = vaddq_s64(v26, v23).i64[1];
    *(int64x2_t *)(qword_100106970 + 32) = v24;
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v22, v8 - 8);
    return 0;
  }
  int v21 = 0;
  int64x2_t v19 = *(char **)(v12 + 16);
LABEL_17:
  bzero(v19, v21 * (uint64_t)(int)v10 * a1);
  return v8 + 24;
}

uint64_t sub_1000C3670(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result - 8);
    if (v2)
    {
      uint64_t v3 = qword_100106970;
      v4.i64[0] = -1;
      v4.i64[1] = -1;
      v5.i64[1] = -1;
      v5.i64[0] = *(unsigned int *)(v2 - 8);
      *(void *)&long long v6 = vsubq_s64((int64x2_t)xmmword_100106980, v5).u64[0];
      *((void *)&v6 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v4).i64[1];
      xmmword_100106980 = v6;
      int64x2_t v7 = *(int64x2_t *)(qword_100106970 + 32);
      v5.i64[0] = vsubq_s64(v7, v5).u64[0];
      v5.i64[1] = vaddq_s64(v7, v4).i64[1];
      *(int64x2_t *)(qword_100106970 + 32) = v5;
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v3, v2 - 8);
    }
    uint64_t v8 = qword_100106970;
    v9.i64[0] = -1;
    v9.i64[1] = -1;
    v10.i64[1] = -1;
    v10.i64[0] = *(unsigned int *)(v1 - 32);
    *(void *)&long long v11 = vsubq_s64((int64x2_t)xmmword_100106980, v10).u64[0];
    *((void *)&v11 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v9).i64[1];
    xmmword_100106980 = v11;
    int64x2_t v12 = *(int64x2_t *)(qword_100106970 + 32);
    v10.i64[0] = vsubq_s64(v12, v10).u64[0];
    v10.i64[1] = vaddq_s64(v12, v9).i64[1];
    *(int64x2_t *)(qword_100106970 + 32) = v10;
    uint64_t v13 = *(uint64_t (**)(void))(v8 + 8);
    return v13();
  }
  return result;
}

unsigned int *sub_1000C3744(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a2 >= 1 && (a3 & 0x80000000) == 0)
  {
    LODWORD(v5) = a2;
    uint64_t v6 = (8 * a2 + 24);
    if (v6 >= 0x7FFFFFF7) {
      return 0;
    }
    uint64_t v8 = (void *)qword_100106970;
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))qword_100106970)(qword_100106970, v6 + 8);
    uint64_t v3 = (unsigned int *)v9;
    if (v9)
    {
      *(_DWORD *)uint64_t v9 = v6;
      *(_DWORD *)(v9 + 4) = 0;
      unint64_t v10 = v8[4] + v6;
      v8[4] = v10;
      if (v10 > v8[6]) {
        v8[6] = v10;
      }
      unint64_t v11 = v8[7];
      v8[8] += v6;
      unint64_t v12 = v8[5] + 1;
      v8[5] = v12;
      if (v12 > v11) {
        v8[7] = v12;
      }
      ++v8[9];
      *(void *)&xmmword_100106980 = xmmword_100106980 + v6;
      uint64_t v13 = xmmword_100106980;
      if ((unint64_t)xmmword_100106980 > qword_100106990) {
        qword_100106990 = xmmword_100106980;
      }
      qword_1001069A0 += v6;
      if (++*((void *)&xmmword_100106980 + 1) > (unint64_t)qword_100106998) {
        qword_100106998 = *((void *)&xmmword_100106980 + 1);
      }
      ++qword_1001069A8;
      *(_DWORD *)(v9 + 8) = v5;
      *(_DWORD *)(v9 + 12) = a3;
      *(void *)(v9 + 16) = a1;
      if (!a3) {
        goto LABEL_34;
      }
      uint64_t v14 = a1 * v5 * a3;
      uint64_t v15 = qword_100106970;
      if (v14 < 0x7FFFFFF7)
      {
        uint64_t v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))qword_100106970)(qword_100106970, v14 + 8);
        if (v16)
        {
          *uint64_t v16 = v14;
          unint64_t v17 = *(void *)(v15 + 32) + v14;
          *(void *)(v15 + 32) = v17;
          if (v17 > *(void *)(v15 + 48)) {
            *(void *)(v15 + 48) = v17;
          }
          unint64_t v18 = *(void *)(v15 + 56);
          *(void *)(v15 + 64) += v14;
          unint64_t v19 = *(void *)(v15 + 40) + 1;
          *(void *)(v15 + 40) = v19;
          if (v19 > v18) {
            *(void *)(v15 + 56) = v19;
          }
          uint64_t v20 = v16 + 1;
          ++*(void *)(v15 + 72);
          unint64_t v21 = xmmword_100106980 + v14;
          *(void *)&xmmword_100106980 = v21;
          if (v21 > qword_100106990) {
            qword_100106990 = v21;
          }
          qword_1001069A0 += v14;
          unint64_t v22 = *((void *)&xmmword_100106980 + 1) + 1;
          *((void *)&xmmword_100106980 + 1) = v22;
          if (v22 > qword_100106998) {
            qword_100106998 = v22;
          }
          ++qword_1001069A8;
          *((void *)v3 + 3) = v20;
          if (v5 >= 2)
          {
            uint64_t v23 = v5 & 0xFFFFFFFE;
            uint64_t v28 = v3 + 10;
            uint64_t v29 = v23;
            do
            {
              *(v28 - 1) = v20;
              *uint64_t v28 = (char *)v20 + a1 * a3;
              uint64_t v20 = (void *)((char *)v20 + 2 * a1 * a3);
              v28 += 2;
              v29 -= 2;
            }
            while (v29);
            if (v23 == v5) {
              goto LABEL_34;
            }
          }
          else
          {
            uint64_t v23 = 0;
          }
          uint64_t v30 = v5 - v23;
          uint64_t v31 = (uint64_t *)&v3[2 * v23 + 8];
          uint64_t v32 = a1 * a3;
          uint64_t v33 = (uint64_t)v16 + v32 * v23 + 8;
          do
          {
            *v31++ = v33;
            v33 += v32;
            --v30;
          }
          while (v30);
LABEL_34:
          v3 += 8;
          size_t v34 = (int)(a1 * a3);
          uint64_t v5 = v5;
          unint64_t v35 = (void **)v3;
          do
          {
            uint64_t v36 = *v35++;
            bzero(v36, v34);
            --v5;
          }
          while (v5);
          return v3;
        }
        uint64_t v15 = qword_100106970;
        uint64_t v13 = xmmword_100106980;
      }
      *((void *)v3 + 3) = 0;
      uint64_t v24 = *v3;
      *(void *)&xmmword_100106980 = v13 - v24;
      --*((void *)&xmmword_100106980 + 1);
      int64x2_t v25 = *(int64x2_t *)(v15 + 32);
      v26.i64[0] = -1;
      v26.i64[1] = -1;
      v27.i64[1] = -1;
      v27.i64[0] = v24;
      v27.i64[0] = vsubq_s64(v25, v27).u64[0];
      v27.i64[1] = vaddq_s64(v25, v26).i64[1];
      *(int64x2_t *)(v15 + 32) = v27;
      (*(void (**)(uint64_t, unsigned int *))(v15 + 8))(v15, v3);
      return 0;
    }
  }
  return v3;
}

uint64_t sub_1000C3A78(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result - 24);
  }
  return result;
}

uint64_t sub_1000C3A84(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result - 20);
  }
  return result;
}

uint64_t sub_1000C3A90(const void **a1, int *a2, signed int *a3, char a4, int a5, int a6)
{
  return sub_1000C3A9C(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1000C3A9C(const void **a1, int *a2, signed int *a3, char a4, int a5, int a6)
{
  int v11 = *a2;
  signed int v12 = *a3;
  signed int v13 = (~(-1 << a4) + a6) >> a4;
  uint64_t v14 = *a1;
  if (!*a1)
  {
    if (v11 <= v13) {
      unsigned int v23 = (~(-1 << a4) + a6) >> a4;
    }
    else {
      unsigned int v23 = *a2;
    }
    if (v11) {
      int v11 = v23;
    }
    else {
      int v11 = 2 * v13;
    }
    uint64_t v24 = sub_1000C33A4(8 * v11);
    if (!v24) {
      return 0;
    }
    uint64_t v14 = v24;
    if (v13 > v12) {
      goto LABEL_6;
    }
    return 1;
  }
  if (v13 > v11)
  {
    int v11 = 2 * v13;
    uint64_t v15 = sub_1000C33A4(16 * v13);
    if (!v15) {
      return 0;
    }
    uint64_t v14 = v15;
    memcpy(v15, *a1, 8 * v12);
  }
  if (v13 <= v12) {
    return 1;
  }
LABEL_6:
  int v16 = a5 << a4;
  size_t v17 = a5 << a4;
  unint64_t v18 = sub_1000C33A4(v16);
  v14[v12] = v18;
  if (!v18)
  {
    signed int v22 = v12;
LABEL_22:
    if (v22 > v12)
    {
      uint64_t v25 = v22;
      int64x2_t v26 = (char *)(v14 - 1);
      do
      {
        uint64_t v27 = *(void *)&v26[8 * v25];
        if (v27)
        {
          uint64_t v28 = qword_100106970;
          v29.i64[1] = -1;
          v29.i64[0] = *(unsigned int *)(v27 - 8);
          *(void *)&long long v30 = vsubq_s64((int64x2_t)xmmword_100106980, v29).u64[0];
          v31.i64[0] = -1;
          v31.i64[1] = -1;
          *((void *)&v30 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v31).i64[1];
          xmmword_100106980 = v30;
          int64x2_t v32 = *(int64x2_t *)(qword_100106970 + 32);
          v29.i64[0] = vsubq_s64(v32, v29).u64[0];
          v29.i64[1] = vaddq_s64(v32, v31).i64[1];
          *(int64x2_t *)(qword_100106970 + 32) = v29;
          (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v28, v27 - 8);
        }
        *(void *)&v26[8 * v25--] = 0;
      }
      while (v25 > v12);
    }
    uint64_t v21 = 0;
    if (!v14 || v14 == *a1) {
      return v21;
    }
    uint64_t v33 = qword_100106970;
    v34.i64[0] = -1;
    v34.i64[1] = -1;
    v35.i64[1] = -1;
    v35.i64[0] = *((unsigned int *)v14 - 2);
    *(void *)&long long v36 = vsubq_s64((int64x2_t)xmmword_100106980, v35).u64[0];
    *((void *)&v36 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v34).i64[1];
    xmmword_100106980 = v36;
    int64x2_t v37 = *(int64x2_t *)(qword_100106970 + 32);
    v35.i64[0] = vsubq_s64(v37, v35).u64[0];
    v35.i64[1] = vaddq_s64(v37, v34).i64[1];
    *(int64x2_t *)(qword_100106970 + 32) = v35;
    (*(void (**)(uint64_t, void *))(v33 + 8))(v33, v14 - 1);
    return 0;
  }
  uint64_t v19 = 0;
  while (v12 + 1 - v13 + v19)
  {
    uint64_t v20 = sub_1000C33A4(v17);
    v14[v12 + 1 + v19++] = v20;
    if (!v20)
    {
      uint64_t v21 = 0;
      signed int v22 = v12 + v19;
      if (v12 + v19 < v13) {
        goto LABEL_22;
      }
      goto LABEL_32;
    }
  }
  uint64_t v21 = 1;
  signed int v22 = v13;
  if (v12 + v19 + 1 < v13) {
    goto LABEL_22;
  }
LABEL_32:
  uint64_t v38 = (unsigned int *)*a1;
  if (v14 != *a1)
  {
    if (v38)
    {
      uint64_t v39 = qword_100106970;
      v40.i64[0] = -1;
      v40.i64[1] = -1;
      v41.i64[1] = -1;
      v41.i64[0] = *(v38 - 2);
      *(void *)&long long v42 = vsubq_s64((int64x2_t)xmmword_100106980, v41).u64[0];
      *((void *)&v42 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v40).i64[1];
      xmmword_100106980 = v42;
      int64x2_t v43 = *(int64x2_t *)(qword_100106970 + 32);
      v41.i64[0] = vsubq_s64(v43, v41).u64[0];
      v41.i64[1] = vaddq_s64(v43, v40).i64[1];
      *(int64x2_t *)(qword_100106970 + 32) = v41;
      (*(void (**)(uint64_t, unsigned int *))(v39 + 8))(v39, v38 - 2);
    }
    *a1 = v14;
  }
  *a3 = v13;
  *a2 = v11;
  return v21;
}

uint64_t sub_1000C3D84(const void **a1, int *a2, int a3)
{
  return sub_1000C3D90(a1, a2, a3);
}

uint64_t sub_1000C3D90(const void **a1, int *a2, int a3)
{
  if (!*a1)
  {
    uint64_t result = (uint64_t)sub_1000C33A4(8 * a3);
    uint64_t v8 = (const void *)result;
    if (!result) {
      return result;
    }
    goto LABEL_6;
  }
  uint64_t v6 = *a2;
  if ((int)v6 < a3)
  {
    uint64_t result = (uint64_t)sub_1000C33A4(8 * a3);
    if (!result) {
      return result;
    }
    uint64_t v8 = (const void *)result;
    memcpy((void *)result, *a1, 8 * v6);
LABEL_6:
    uint64_t v9 = (unsigned int *)*a1;
    if (v8 != *a1)
    {
      if (v9)
      {
        uint64_t v10 = qword_100106970;
        v11.i64[0] = -1;
        v11.i64[1] = -1;
        v12.i64[1] = -1;
        v12.i64[0] = *(v9 - 2);
        *(void *)&long long v13 = vsubq_s64((int64x2_t)xmmword_100106980, v12).u64[0];
        *((void *)&v13 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v11).i64[1];
        xmmword_100106980 = v13;
        int64x2_t v14 = *(int64x2_t *)(qword_100106970 + 32);
        v12.i64[0] = vsubq_s64(v14, v12).u64[0];
        v12.i64[1] = vaddq_s64(v14, v11).i64[1];
        *(int64x2_t *)(qword_100106970 + 32) = v12;
        (*(void (**)(uint64_t, unsigned int *))(v10 + 8))(v10, v9 - 2);
      }
      *a1 = v8;
    }
  }
  *a2 = a3;
  return 1;
}

uint64_t sub_1000C3E74(uint64_t result, uint64_t a2, int a3)
{
  if (result && a3 >= 1)
  {
    uint64_t v3 = result;
    unint64_t v4 = a3 + 1;
    do
    {
      uint64_t v5 = (v4 - 2);
      uint64_t v6 = *(void *)(v3 + 8 * v5);
      if (v6)
      {
        uint64_t v7 = qword_100106970;
        v8.i64[1] = -1;
        v8.i64[0] = *(unsigned int *)(v6 - 8);
        *(void *)&long long v9 = vsubq_s64((int64x2_t)xmmword_100106980, v8).u64[0];
        v10.i64[0] = -1;
        v10.i64[1] = -1;
        *((void *)&v9 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v10).i64[1];
        xmmword_100106980 = v9;
        int64x2_t v11 = *(int64x2_t *)(qword_100106970 + 32);
        v8.i64[0] = vsubq_s64(v11, v8).u64[0];
        v8.i64[1] = vaddq_s64(v11, v10).i64[1];
        *(int64x2_t *)(qword_100106970 + 32) = v8;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v7, v6 - 8);
      }
      *(void *)(v3 + 8 * v5) = 0;
      --v4;
    }
    while (v4 > 1);
  }
  return result;
}

uint64_t sub_1000C3F24(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3 = result;
  if (result && a3 >= 1)
  {
    unint64_t v4 = a3 + 1;
    do
    {
      uint64_t v5 = (v4 - 2);
      uint64_t v6 = *(void *)(v3 + 8 * v5);
      if (v6)
      {
        uint64_t v7 = qword_100106970;
        v8.i64[1] = -1;
        v8.i64[0] = *(unsigned int *)(v6 - 8);
        *(void *)&long long v9 = vsubq_s64((int64x2_t)xmmword_100106980, v8).u64[0];
        v10.i64[0] = -1;
        v10.i64[1] = -1;
        *((void *)&v9 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v10).i64[1];
        xmmword_100106980 = v9;
        int64x2_t v11 = *(int64x2_t *)(qword_100106970 + 32);
        v8.i64[0] = vsubq_s64(v11, v8).u64[0];
        v8.i64[1] = vaddq_s64(v11, v10).i64[1];
        *(int64x2_t *)(qword_100106970 + 32) = v8;
        (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v7, v6 - 8);
      }
      *(void *)(v3 + 8 * v5) = 0;
      --v4;
    }
    while (v4 > 1);
  }
  else if (!result)
  {
    return result;
  }
  uint64_t v12 = qword_100106970;
  v13.i64[0] = -1;
  v13.i64[1] = -1;
  v14.i64[1] = -1;
  v14.i64[0] = *(unsigned int *)(v3 - 8);
  *(void *)&long long v15 = vsubq_s64((int64x2_t)xmmword_100106980, v14).u64[0];
  *((void *)&v15 + 1) = vaddq_s64((int64x2_t)xmmword_100106980, v13).i64[1];
  xmmword_100106980 = v15;
  int64x2_t v16 = *(int64x2_t *)(qword_100106970 + 32);
  v14.i64[0] = vsubq_s64(v16, v14).u64[0];
  v14.i64[1] = vaddq_s64(v16, v13).i64[1];
  *(int64x2_t *)(qword_100106970 + 32) = v14;
  size_t v17 = *(uint64_t (**)(void))(v12 + 8);
  return v17();
}

void *sub_1000C403C(void *result, uint64_t a2, int a3, int a4, int a5, int a6, int a7)
{
  int v7 = a6 - 1;
  if (a6 >= 1)
  {
    int v8 = a4 * a3;
    int v9 = a6 * a4;
    uint64_t v49 = result;
    int v48 = a4 * a3;
    if (a5 >= a7)
    {
      int v30 = a5 / a3;
      int v31 = a5 % a3 * a4;
      LODWORD(v32) = a7 / a3;
      int v33 = a7 % a3 * a4;
      uint64_t v34 = result[a5 / a3];
      uint64_t v35 = result[a7 / a3];
      int v36 = v8 - v31;
      if (v8 - v31 >= v9) {
        int v36 = a6 * a4;
      }
      int v37 = v8 - v33;
      if (v37 < v36) {
        int v36 = v37;
      }
      int v38 = v31 - v33;
      if (v31 - v33 < 0) {
        int v38 = v33 - v31;
      }
      BOOL v39 = v38 >= v36;
      for (BOOL i = v30 != v32 || v39; ; BOOL i = v30 != v32 || v41 >= v36)
      {
        int32x4_t v44 = (void *)(v35 + v33);
        int v45 = v36;
        int32x4_t v46 = (const void *)(v34 + v31);
        if (i)
        {
          uint64_t result = memcpy(v44, v46, v36);
          int32x4_t v47 = v49;
          v9 -= v45;
          if (v9 < 1) {
            return result;
          }
        }
        else
        {
          uint64_t result = memmove(v44, v46, v36);
          int32x4_t v47 = v49;
          v9 -= v45;
          if (v9 < 1) {
            return result;
          }
        }
        if (v31 < v33)
        {
          int v33 = 0;
          uint64_t v32 = (int)v32 + 1;
          uint64_t v35 = v47[v32];
          v31 += v45;
          int v41 = v31;
          int v42 = v48;
        }
        else
        {
          uint64_t v34 = v47[++v30];
          v33 += v45;
          int v42 = v48;
          int v31 = 0;
          if (v33 == v48)
          {
            int v33 = 0;
            int v41 = 0;
            uint64_t v32 = (int)v32 + 1;
            uint64_t v35 = v47[v32];
          }
          else
          {
            int v41 = v33;
          }
        }
        int v36 = v42 - v41;
        if (v42 - v41 >= v9) {
          int v36 = v9;
        }
      }
    }
    int v10 = (v7 + a5) / a3;
    int v11 = a4 + a4 * ((v7 + a5) % a3);
    int v12 = v7 + a7;
    int v13 = v12 / a3;
    uint64_t v14 = result[v10];
    uint64_t v15 = result[v12 / a3];
    int v16 = a4 + a4 * (v12 % a3);
    if (v11 >= v9) {
      int v17 = a6 * a4;
    }
    else {
      int v17 = v11;
    }
    if (v16 < v17) {
      int v17 = v16;
    }
    int v18 = v11 - v16;
    if (v11 - v16 < 0) {
      int v18 = v16 - v11;
    }
    BOOL v19 = v18 >= v17;
    BOOL v20 = v10 != v13 || v19;
    while (1)
    {
      int v25 = v17;
      uint64_t v22 = v16 - (uint64_t)v17;
      int64x2_t v26 = (void *)(v15 + v22);
      uint64_t v27 = v11 - (uint64_t)v17;
      uint64_t v28 = (const void *)(v14 + v27);
      if (v20)
      {
        uint64_t result = memcpy(v26, v28, v17);
        int64x2_t v29 = v49;
        v9 -= v25;
        if (v9 < 1) {
          return result;
        }
      }
      else
      {
        uint64_t result = memmove(v26, v28, v17);
        int64x2_t v29 = v49;
        v9 -= v25;
        if (v9 < 1) {
          return result;
        }
      }
      if (v11 >= v16)
      {
        uint64_t v15 = v29[--v13];
        int v21 = v48;
        LODWORD(v22) = v48;
        if ((int)v27 > 0)
        {
          LODWORD(v22) = v48;
          int v17 = v11 - v25;
          goto LABEL_15;
        }
      }
      else
      {
        int v21 = v48;
      }
      uint64_t v14 = v29[--v10];
      LODWORD(v27) = v21;
      int v17 = v22;
LABEL_15:
      int v23 = v21 - v17;
      if (v17 >= v9) {
        int v17 = v9;
      }
      BOOL v20 = v10 != v13 || v23 >= v17;
      int v11 = v27;
      int v16 = v22;
    }
  }
  return result;
}

uint64_t sub_1000C42C0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  sub_1000C2F04(0x40uLL, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v19 = v11;
  if (v8) {
    int v20 = v8;
  }
  else {
    int v20 = 8;
  }
  *(_DWORD *)(v11 + 16) = v20;
  uint64_t v21 = 2048;
  if (a1) {
    uint64_t v21 = a1;
  }
  if (a2) {
    uint64_t v21 = a2;
  }
  *(void *)uint64_t v11 = a1;
  *(void *)(v11 + 8) = v21;
  if (a1)
  {
    sub_1000C2F04(0xC0uLL, v12, v13, v14, v15, v16, v17, v18);
    *(void *)(v19 + 24) = v22;
    sub_1000C2F04(a1, v23, v24, v25, v26, v27, v28, v29);
    *(void *)(*(void *)(v19 + 24) + 16) = v30;
    **(void **)(v19 + 24) = a1;
    *(void *)(*(void *)(v19 + 24) + 8) = 0;
    *(void *)(v19 + 32) = 0x100000008;
  }
  return v19;
}

uint64_t sub_1000C4364(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 40);
    if (v2)
    {
      unint64_t v3 = (*(_DWORD *)(result + 16) + v2 - 1) & -*(_DWORD *)(result + 16);
      if (((*(_DWORD *)(result + 16) + v2 - 1) & -*(_DWORD *)(result + 16)) != 0)
      {
        uint64_t v4 = *(int *)(result + 36);
        uint64_t v5 = 24 * v4;
        uint64_t v6 = v4 - 1;
        do
        {
          uint64_t v8 = *(void *)(v1 + 24);
          uint64_t v9 = v8 + v5;
          unint64_t v10 = *(void *)(v8 + v5 - 16);
          if (v3 >= v10) {
            unint64_t v11 = *(void *)(v8 + v5 - 16);
          }
          else {
            unint64_t v11 = v3;
          }
          *(void *)(v9 - 16) = v10 - v11;
          *(void *)(v1 + 40) -= v11;
          if (!*(void *)(v9 - 16) && (v6 || !*(void *)v1))
          {
            int v7 = (void *)(v9 - 24);
            sub_1000C321C(*(void *)(v8 + v5 - 8));
            *int v7 = 0;
            v7[1] = 0;
            v7[2] = 0;
            --*(_DWORD *)(v1 + 36);
          }
          v5 -= 24;
          --v6;
          v3 -= v11;
        }
        while (v3);
      }
    }
    uint64_t v12 = *(void **)(v1 + 24);
    if (v12)
    {
      uint64_t v13 = v12[2];
      if (v13)
      {
        sub_1000C321C(v13);
        v12[2] = 0;
      }
      *uint64_t v12 = 0;
      uint64_t v14 = *(void *)(v1 + 24);
    }
    else
    {
      uint64_t v14 = 0;
    }
    sub_1000C321C(v14);
    return sub_1000C321C(v1);
  }
  return result;
}

unint64_t sub_1000C4484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = (*(_DWORD *)(a1 + 16) + a2 - 1) & -*(_DWORD *)(a1 + 16);
  ++*(_DWORD *)(a1 + 56);
  int v10 = *(_DWORD *)(a1 + 36);
  if (v10 < 1)
  {
    int v10 = 0;
    uint64_t v13 = *(int *)(a1 + 32);
    if ((int)v13 > 0) {
      goto LABEL_5;
    }
    goto LABEL_7;
  }
  uint64_t v11 = *(void *)(a1 + 24);
  if (!v11 || (uint64_t v12 = (unint64_t *)(v11 + 24 * (v10 - 1)), *v12 < v12[1] + v9))
  {
    uint64_t v13 = *(int *)(a1 + 32);
    if (v10 < (int)v13)
    {
LABEL_5:
      uint64_t v14 = *(void *)(a1 + 24);
LABEL_8:
      uint64_t v12 = (unint64_t *)(v14 + 24 * v10);
      if (v9 <= *(void *)(a1 + 8)) {
        unint64_t v16 = *(void *)(a1 + 8);
      }
      else {
        unint64_t v16 = v9;
      }
      *uint64_t v12 = v16;
      sub_1000C2F04(v16, a2, a3, a4, a5, a6, a7, a8);
      v12[1] = 0;
      v12[2] = v17;
      ++*(_DWORD *)(a1 + 36);
      goto LABEL_12;
    }
LABEL_7:
    uint64_t v15 = v13 + 8;
    *(_DWORD *)(a1 + 32) = v15;
    uint64_t v14 = sub_1000C2F40(*(void *)(a1 + 24), 24 * v15);
    *(void *)(a1 + 24) = v14;
    goto LABEL_8;
  }
LABEL_12:
  unint64_t v19 = v12[1];
  unint64_t v18 = v12[2];
  v12[1] = v19 + v9;
  unint64_t v20 = *(void *)(a1 + 48);
  unint64_t v21 = *(void *)(a1 + 40) + v9;
  *(void *)(a1 + 40) = v21;
  if (v21 > v20) {
    *(void *)(a1 + 48) = v21;
  }
  return v18 + v19;
}

uint64_t sub_1000C458C(uint64_t result, uint64_t a2, int a3)
{
  int v3 = *(_DWORD *)(result + 16);
  int v4 = v3 - 1;
  uint64_t v5 = (v3 - 1 + a3);
  uint64_t v6 = -v3;
  uint64_t v7 = v5 & v6;
  unint64_t v8 = (v7 + v4) & v6;
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v10 = result;
    uint64_t v11 = *(int *)(result + 36);
    uint64_t v12 = 24 * v11;
    uint64_t v13 = v11 - 1;
    do
    {
      uint64_t v15 = *(void *)(v10 + 24);
      uint64_t v16 = v15 + v12;
      unint64_t v17 = *(void *)(v15 + v12 - 16);
      if (v8 >= v17) {
        unint64_t v18 = *(void *)(v15 + v12 - 16);
      }
      else {
        unint64_t v18 = v8;
      }
      *(void *)(v16 - 16) = v17 - v18;
      *(void *)(v10 + 40) -= v18;
      if (!*(void *)(v16 - 16) && (v13 || !*(void *)v10))
      {
        uint64_t v14 = (void *)(v16 - 24);
        uint64_t result = sub_1000C321C(*(void *)(v15 + v12 - 8));
        *uint64_t v14 = 0;
        v14[1] = 0;
        v14[2] = 0;
        --*(_DWORD *)(v10 + 36);
      }
      v12 -= 24;
      --v13;
      v8 -= v18;
    }
    while (v8);
  }
  return result;
}

uint64_t sub_1000C466C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  if (v2 != a2)
  {
    uint64_t v3 = result;
    unint64_t v4 = (*(_DWORD *)(result + 16) + v2 - a2 - 1) & -*(_DWORD *)(result + 16);
    if (((*(_DWORD *)(result + 16) + v2 - a2 - 1) & -*(_DWORD *)(result + 16)) != 0)
    {
      uint64_t v5 = *(int *)(result + 36);
      uint64_t v6 = 24 * v5;
      uint64_t v7 = v5 - 1;
      do
      {
        uint64_t v9 = *(void *)(v3 + 24);
        uint64_t v10 = v9 + v6;
        unint64_t v11 = *(void *)(v9 + v6 - 16);
        if (v4 >= v11) {
          unint64_t v12 = *(void *)(v9 + v6 - 16);
        }
        else {
          unint64_t v12 = v4;
        }
        *(void *)(v10 - 16) = v11 - v12;
        *(void *)(v3 + 40) -= v12;
        if (!*(void *)(v10 - 16) && (v7 || !*(void *)v3))
        {
          unint64_t v8 = (void *)(v10 - 24);
          uint64_t result = sub_1000C321C(*(void *)(v9 + v6 - 8));
          *unint64_t v8 = 0;
          v8[1] = 0;
          v8[2] = 0;
          --*(_DWORD *)(v3 + 36);
        }
        v6 -= 24;
        --v7;
        v4 -= v12;
      }
      while (v4);
    }
  }
  return result;
}

uint64_t sub_1000C474C(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t sub_1000C4754(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (!result) {
    return result;
  }
  unsigned __int16 v4 = *(_WORD *)result;
  if (!*(_WORD *)result) {
    return 0;
  }
  for (BOOL i = (unsigned __int16 *)(result + 2); v4 <= 0x80u && (v4 & 0x80) == 0; ++i)
  {
    if ((byte_1000F6054[v4] & 0x10) == 0)
    {
      if (v4 != 43 && v4 != 45)
      {
        BOOL v12 = 0;
        --i;
        if (!v4) {
          return 0;
        }
LABEL_23:
        if (!v12) {
          goto LABEL_28;
        }
        if (v4 > 0x80u || (v4 & 0x80) != 0)
        {
          if (v4 == 65279) {
            return 0;
          }
        }
        else if ((byte_1000F6054[v4] & 0x10) != 0)
        {
          return 0;
        }
        uint64_t result = sub_1000CDF18(v4);
        if (result)
        {
          uint64_t v21 = v4 - 48;
          if ((unsigned __int16)(v4 >> 4) > 0xFF0u) {
            uint64_t v21 = v4 - 65296;
          }
          if (v21 + a2 > 9) {
            return 0;
          }
          uint64_t v13 = -v21;
          unsigned __int16 v22 = i[1];
          if (!v22) {
            goto LABEL_72;
          }
          uint64_t v23 = i + 2;
          while (1)
          {
            unsigned int v24 = v22;
            int v25 = v22 & 0x80;
            if (v24 <= 0x80 && v25 == 0)
            {
              if ((byte_1000F6054[v24] & 0x10) != 0) {
                goto LABEL_72;
              }
            }
            else if (v24 == 65279)
            {
              goto LABEL_72;
            }
            uint64_t result = sub_1000CDF18(v24);
            if (!result) {
              break;
            }
            uint64_t v27 = (int)(v24 - 48);
            if (v24 >> 4 > 0xFF0) {
              uint64_t v27 = v24 - 65296;
            }
            if ((v27 + a2) / 10 > v13) {
              return 0;
            }
            uint64_t v13 = 10 * v13 - v27;
            int v28 = *v23++;
            unsigned __int16 v22 = v28;
            if (!v28) {
              goto LABEL_72;
            }
          }
        }
        return result;
      }
LABEL_16:
      BOOL v12 = v4 == 45 || v4 == 65293;
      unsigned __int16 v4 = *i;
      if (!*i) {
        return 0;
      }
      goto LABEL_23;
    }
LABEL_5:
    unsigned __int16 v9 = *i;
    unsigned __int16 v4 = v9;
  }
  if (v4 == 65279) {
    goto LABEL_5;
  }
  if (v4 == 65291 || v4 == 65293) {
    goto LABEL_16;
  }
  --i;
LABEL_28:
  if (v4 > 0x80u || (v4 & 0x80) != 0)
  {
    if (v4 == 65279) {
      return 0;
    }
  }
  else if ((byte_1000F6054[v4] & 0x10) != 0)
  {
    return 0;
  }
  uint64_t result = sub_1000CDF18(v4);
  if (result)
  {
    if (v4 >> 4 <= 0xFF0u) {
      uint64_t v13 = v4 - 48;
    }
    else {
      uint64_t v13 = v4 - 65296;
    }
    if (a3 - v13 >= -9)
    {
      unsigned __int16 v14 = i[1];
      if (v14)
      {
        uint64_t v15 = i + 2;
        do
        {
          unsigned int v16 = v14;
          int v17 = v14 & 0x80;
          if (v16 <= 0x80 && v17 == 0)
          {
            if ((byte_1000F6054[v16] & 0x10) != 0) {
              break;
            }
          }
          else if (v16 == 65279)
          {
            break;
          }
          uint64_t result = sub_1000CDF18(v16);
          if (!result) {
            return result;
          }
          uint64_t v19 = (int)(v16 - 48);
          if (v16 >> 4 > 0xFF0) {
            uint64_t v19 = v16 - 65296;
          }
          if ((a3 - v19) / 10 < v13) {
            return 0;
          }
          uint64_t v13 = v19 + 10 * v13;
          int v20 = *v15++;
          unsigned __int16 v14 = v20;
        }
        while (v20);
      }
LABEL_72:
      if (a4) {
        *a4 = v13;
      }
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_1000C4A54(_WORD *a1)
{
  uint64_t v3 = 0;
  if (!sub_1000C4754((uint64_t)a1, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v3)) {
    sub_1000D2768(a1, 1024, (uint64_t)v4);
  }
  return v3;
}

uint64_t sub_1000C4AD4(uint64_t result, uint64_t a2, unint64_t *a3)
{
  if (!result) {
    return result;
  }
  unsigned __int16 v3 = *(_WORD *)result;
  if (!*(_WORD *)result) {
    return 0;
  }
  for (BOOL i = (unsigned __int16 *)(result + 2); ; ++i)
  {
    BOOL v8 = v3 <= 0x80u && (v3 & 0x80) == 0;
    if ((!v8 || (byte_1000F6054[v3] & 0x10) == 0) && v3 != 65279) {
      break;
    }
    unsigned __int16 v7 = *i;
    unsigned __int16 v3 = v7;
  }
  if (v3 == 43 || v3 == 65291)
  {
    unsigned __int16 v3 = *i;
    if (!*i) {
      return 0;
    }
  }
  else
  {
    --i;
    if (!v3) {
      return 0;
    }
  }
  if (v3 <= 0x80u && (v3 & 0x80) == 0)
  {
    if ((byte_1000F6054[v3] & 0x10) != 0) {
      return 0;
    }
    goto LABEL_25;
  }
  if (v3 == 65279) {
    return 0;
  }
LABEL_25:
  uint64_t result = sub_1000CDF18(v3);
  if (result)
  {
    if ((unsigned __int16)(v3 >> 4) <= 0xFF0u) {
      uint64_t v9 = -48;
    }
    else {
      uint64_t v9 = -65296;
    }
    unint64_t v10 = v9 + v3;
    unsigned __int16 v11 = i[1];
    if (v11)
    {
      BOOL v12 = i + 2;
      while (1)
      {
        uint64_t v13 = v11;
        unsigned int v14 = v11;
        int v15 = v11 & 0x80;
        if (v14 <= 0x80 && v15 == 0)
        {
          if ((byte_1000F6054[v13] & 0x10) != 0) {
            goto LABEL_44;
          }
        }
        else if (v13 == 65279)
        {
          goto LABEL_44;
        }
        uint64_t result = sub_1000CDF18(v13);
        if (!result) {
          break;
        }
        if (v13 >> 4 <= 0xFF0) {
          uint64_t v17 = -48;
        }
        else {
          uint64_t v17 = -65296;
        }
        uint64_t v18 = v17 + v13;
        if (v10 > (a2 - v18) / 0xAuLL) {
          return 0;
        }
        unint64_t v10 = v18 + 10 * v10;
        int v19 = *v12++;
        unsigned __int16 v11 = v19;
        if (!v19) {
          goto LABEL_44;
        }
      }
    }
    else
    {
LABEL_44:
      if (a3) {
        *a3 = v10;
      }
      return 1;
    }
  }
  return result;
}

uint64_t sub_1000C4C84(_WORD *a1)
{
  unint64_t v3 = 0;
  if (!sub_1000C4AD4((uint64_t)a1, 0xFFFFLL, &v3)) {
    sub_1000D2768(a1, 1024, (uint64_t)v4);
  }
  return (unsigned __int16)v3;
}

uint64_t sub_1000C4D00(uint64_t result, _DWORD *a2)
{
  int v2 = 0;
  if (result)
  {
    unint64_t v3 = result - 1;
    if (result != 1)
    {
      uint64_t result = 1;
      do
      {
        result *= 2;
        ++v2;
        BOOL v4 = v3 > 1;
        v3 >>= 1;
      }
      while (v4);
    }
  }
  if (a2) {
    *a2 = v2;
  }
  return result;
}

uint64_t sub_1000C4D38(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v8 = sub_1000BEC58(a1, "vstpar", a2, a4, a5, a6, a7, a8);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = (uint64_t)v8;
  uint64_t v14 = 0;
  unsigned int v13 = 0;
  uint64_t v12 = 0;
  if (!sub_1000BEECC((uint64_t)v8, (char *)&v14 + 4)) {
    return 0;
  }
  if (HIDWORD(v14) != 870)
  {
    sub_1000BED3C(v9);
    return 0;
  }
  uint64_t v10 = sub_1000C33A0(5584);
  if (v10)
  {
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)uint64_t v10 = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 8) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 12) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 16) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 24) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 32) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 40) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 48) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 56) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 60) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 64) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 68) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 72) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 76) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 80) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 84) = v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 88) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 96) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 100) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 104) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 112) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 120) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 124) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 128) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 136) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 144) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 152) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 160) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 164) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 168) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 172) = v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 176) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 184) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 192) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 200) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 208) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 216) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 224) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 228) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 232) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 240) = v12;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 248) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 256) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 264) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 272) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 280) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 288) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 292) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 296) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 304) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 312) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 320) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 328) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 336) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 344) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 348) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 352) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 360) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 368) = (int)v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 376), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 376))) {
      goto LABEL_67;
    }
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 384) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 392) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 400) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 408) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 416) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 424) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 432) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 440) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 448) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 456) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 464) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 472) = v12;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 480), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 480))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 488) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 496) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 500) = v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 504) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 512) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 516) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 520) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 528) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 536) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 544) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 552) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 560) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 568) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 576) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 580), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 580))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 584) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 592) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 600) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 608) = (int)v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 616), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 616))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 620) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 624) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 628) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 632) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 640) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 648) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 656) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 664) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 672) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 676) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 680) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 688) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 692) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 696) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 700) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 704) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 708) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 712) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 716) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 720) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 724) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 728) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 732) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 736) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 740) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 744) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 748) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 752) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 756) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 760) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 764) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 768) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 772) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 776) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 784) = (int)v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 792), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 792))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 796) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 800) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 808) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 812) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 816) = v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 824) = v12;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 832) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 840) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 848) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 856) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 864) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 872) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 880) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 884) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 888) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 892) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 896) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 904) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 908) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 912) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 920) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 928) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 936) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 944) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 952) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 960) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 968) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 976) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 984) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 992) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 996) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1000) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1008) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1016) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1024) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1032) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1036) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1040) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1048) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1056) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1060) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1064) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1068) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1072) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1076) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1080) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1088) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1092) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1096) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1100) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1104) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1112) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1116) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1120) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1124) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1128) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1136) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1144) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1152) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1160) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1164) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1168) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1172) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1176) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1180) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1184) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1192) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1200) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1208) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1216) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1224) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1228) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1232) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1240) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1248) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1256) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1260) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1264) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1272) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1280) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1288) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1296) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1304) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1312) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1320) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1328) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1332) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1336) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1340) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1344) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1352) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1360) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1368) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1372) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1376) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1380) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1384) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1388) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1392) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1396) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1400) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1404) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1408) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1412) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1416) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1420) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1424) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1428) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1432) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1440) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1448) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1452) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1456) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1464) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1472) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1480) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1484) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1488) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1492) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1496) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1504) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1512) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1520) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1528) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1536) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1544) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1552) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1560) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1568) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1576) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1584) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1592) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1600) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1608) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1616) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1624) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1632) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1640) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1648) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1652) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1656) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1664) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1672) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1680) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1684) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1688) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1696) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1704) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1712) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 1716), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 1716))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1720) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1728) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1736) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1744) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1748) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1752) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1756) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1760) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1764) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1768) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1772) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1776) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1780) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1784) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1788) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1792) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1796) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1800) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1804) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1808) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1812) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1816) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1820) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 1824), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 1824))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1828) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1832) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1836) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1840) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1844) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1848) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1852) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1856) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1860) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1864) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1872) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1876) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1880) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1888) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1896) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1904) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1908) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1912) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1920) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1928) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1932) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1936) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1940) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1944) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1948) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1952) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1956) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1960) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1964) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1968) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1972) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1976) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1980) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1984) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1992) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2000) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2008) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2016) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2020) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2024) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2032) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2040) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2048) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2056) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2064) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2072) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2080) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2088) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2092) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2096) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2104) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2112) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2120) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2128) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2132) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2136) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2144) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2152) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2160) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2168) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2176) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2184) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2192) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2196) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2200) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2204) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2208) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2212) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2216) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2220) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2224) = v14;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2232) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2240) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2248) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2252) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2256) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2260) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2264) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2272) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2280) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2284) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2288) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2296) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2304) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2312) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2316) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2320) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2328) = (int)v14;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2336) = v13;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2344) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2352) = (int)v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 2360), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 2360))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2368) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2376) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2384) = v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2392) = v12;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2400) = v12;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2408) = v12;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2416) = v12;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2424) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2432) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2436) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2440) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2444) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2448) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2452) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 2456), v15, 128);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 2456))) {
      goto LABEL_67;
    }
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 2584), v15, 128);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 2584))) {
      goto LABEL_67;
    }
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 2712), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 2712))) {
      goto LABEL_67;
    }
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2720) = v12;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2728) = v13;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 2736), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 2736))) {
      goto LABEL_67;
    }
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 2737), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 2737))) {
      goto LABEL_67;
    }
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 2738), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 2738))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2744) = (int)v14;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2752) = v13;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2760) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2768) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2776) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2780) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2784) = (int)v14;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2792) = v13;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2800) = v13;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2808) = v13;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2816) = v13;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 2824), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 2824))) {
      goto LABEL_67;
    }
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2832) = v12;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2840) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2848) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2852) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2856) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2860) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2864) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2868) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2872) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2876) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2880) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2884) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2888) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2892) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2896) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2900) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2904) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2908) = v14;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2912) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2920) = (int)v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 2928), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 2928))) {
      goto LABEL_67;
    }
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2936) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2944) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2948) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2952) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2956) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2960) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2968) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2976) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2984) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2992) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3000) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3008) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3016) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3024) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3028) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3032) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3040) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3048) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3056) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3064) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3072) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3080) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3088) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3096) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3104) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3112) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3120) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3128) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3136) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3144) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3152) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3160) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3168) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3176) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3184) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3192) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3200) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3208) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3216) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3224) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3228) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3232) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 3236), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 3236))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3240) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3248) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3256) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3264) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3272) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3276) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3280) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3284) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3288) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3296) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3304) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3312) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3320) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 3324), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 3324))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3328) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3336) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3344) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3352) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3360) = v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3368) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3376) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3384) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3388) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3392) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3396) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3400) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3408) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3416) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3424) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3432) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3440) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3448) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3452) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3456) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3464) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3472) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3480) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3484) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3488) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3492) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3496) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3504) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3512) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3520) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3528) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3536) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3544) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3552) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3560) = v12;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 3568), v15, 30);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 3568))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3600) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3608) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3616) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3624) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3632) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3636) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3640) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3648) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3656) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3664) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 3668), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 3668))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3672) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3680) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3688) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3696) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3700) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3704) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3708) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3712) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3716) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3720) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3724) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3728) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3732) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3736) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3740) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3744) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3748) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3752) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3760) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3768) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3772) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3776) = v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3784) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3792) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3800) = (int)v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 3808), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 3808))) {
      goto LABEL_67;
    }
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3816) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3824) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3828) = v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3832) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3840) = (int)v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 3848), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 3848))) {
      goto LABEL_67;
    }
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 3849), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 3849))) {
      goto LABEL_67;
    }
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 3850), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 3850))) {
      goto LABEL_67;
    }
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 3851), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 3851))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3852) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3856) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3864) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3868) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3872) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3876) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3880) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3884) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3888) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3892) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3896) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3904) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3908) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3912) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3916) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3920) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3928) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3936) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3944) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3952) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3960) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3968) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3972) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3976) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3980) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3984) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3992) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4000) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4008) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4016) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4024) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4032) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4040) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4048) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4056) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4064) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4072) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4080) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4088) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4096) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4104) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4112) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4120) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4128) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4136) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4144) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4152) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4160) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4168) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4176) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4184) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4188) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4192) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4196) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4200) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4208) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4216) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 4220), v15, 30);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 4220))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4256) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4264) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4272) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4280) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4288) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4296) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4304) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4308) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4312) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4316) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4320) = v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4328) = v12;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4336) = v13;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4344) = v12;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4352) = v13;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4360) = v12;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4368) = v12;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4376) = v12;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4384) = v13;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4392) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4400) = (int)v14;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4408) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4416) = (int)v14;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4424) = v13;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4432) = v12;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4440) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4448) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4452) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4456) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4460) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4464) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4472) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4480) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4488) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4496) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4504) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4508) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4512) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4516) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 4520), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 4520))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4528) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4536) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4544) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4548) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4552) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4560) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4568) = (int)v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 4576), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 4576))) {
      goto LABEL_67;
    }
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4584) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4592) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4596) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4600) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4604) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4608) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4612) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 4616), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 4616))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4620) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4624) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4632) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4640) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4648) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4656) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4664) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4672) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4680) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4688) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4696) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4704) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4708) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4712) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4716) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4720) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4724) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4728) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4732) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4736) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4740) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4744) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4748) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4752) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4756) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4760) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4768) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4776) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 4780), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 4780))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4784) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4788) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 4792), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 4792))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4800) = (int)v14;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4808) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4816) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4824) = (int)v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 4832), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 4832))) {
      goto LABEL_67;
    }
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4840) = v12;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4848) = v12;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 4856), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 4856))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4864) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4872) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4880) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4888) = v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 4892), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 4892))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4896) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4900) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4904) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4912) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4920) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4928) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4932) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4936) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4944) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4952) = v12;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4960) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4968) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4972) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4976) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4984) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4992) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5000) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5008) = (int)v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5016) = v12;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5024) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5032) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5036) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5040) = (int)v14;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 5048), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 5048))) {
      goto LABEL_67;
    }
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5056) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5064) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5068) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5072) = v14;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5080) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5088) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5092) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5096) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5104) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5112) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5120) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5128) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5132) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5136) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5144) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5152) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5156) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5160) = v14;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5168) = v12;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5176) = v12;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5184) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5192) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5196) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5200) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5204) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5208) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5216) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5224) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5232) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5236) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5240) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5244) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5248) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5252) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5256) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5260) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5264) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5268) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5272) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5276) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5280) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5284) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5288) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5292) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5296) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5300) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5304) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5308) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5312) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5316) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5320) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5324) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5328) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5332) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5336) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5340) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5344) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5348) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5352) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5356) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5360) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5364) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5368) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5372) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5376) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5384) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5392) = v14;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5400) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5408) = v14;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5416) = v13;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5424) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5428) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5432) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5440) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5444) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5448) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5452) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5456) = (int)v14;
    if (!sub_1000BEECC(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5464) = v13;
    if (!sub_1000BEEF4(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5472) = v12;
    if (!sub_1000BF1F8(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000CAD88((unsigned char *)(v10 + 5480), v15, 1);
    if (sub_1000CAED0(v15, (unsigned __int8 *)(v10 + 5480))) {
      goto LABEL_67;
    }
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5488) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5496) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5504) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5508) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5512) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5520) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5528) = (int)v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5536) = v14;
    if (!sub_1000BEECC(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5540) = v14;
    if (sub_1000BEECC(v9, &v14)
      && (*(_DWORD *)(v10 + 5544) = v14, sub_1000BEECC(v9, &v14))
      && (*(_DWORD *)(v10 + 5548) = v14, sub_1000BEECC(v9, &v14))
      && (*(_DWORD *)(v10 + 5552) = v14, sub_1000BEECC(v9, &v14))
      && (*(_DWORD *)(v10 + 5556) = v14, sub_1000BEECC(v9, &v14))
      && (*(void *)(v10 + 5560) = (int)v14, sub_1000BEECC(v9, &v14))
      && (*(void *)(v10 + 5568) = (int)v14, sub_1000BEECC(v9, &v14)))
    {
      *(_DWORD *)(v10 + 5576) = v14;
    }
    else
    {
LABEL_67:
      sub_1000C321C(v10);
      uint64_t v10 = 0;
    }
    sub_1000BED3C(v9);
  }
  return v10;
}

_OWORD *sub_1000CA478(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (_OWORD *)sub_1000C2EFC(0x20uLL, a2, a3, a4, a5, a6, a7, a8);
  *uint64_t v9 = 0u;
  v9[1] = 0u;
  sub_1000CAAB0((uint64_t)v9, a1);
  return v9;
}

uint64_t sub_1000CA4B8(uint64_t *a1)
{
  sub_1000C321C(*a1);
  sub_1000C321C(a1[2]);
  sub_1000C321C(a1[1]);
  return sub_1000C321C((uint64_t)a1);
}

uint64_t sub_1000CA504(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a3 & 0x80000000) == 0)
  {
    int v8 = a3;
    uint64_t v10 = result;
    size_t v11 = a3;
    uint64_t v12 = (void *)sub_1000C2EFC(a3, a2, a3, a4, a5, a6, a7, a8);
    if (*(int *)(v10 + 28) >= 1)
    {
      uint64_t v13 = 0;
      int v14 = 0;
      uint64_t v15 = *(void *)(v10 + 8);
      do
      {
        uint64_t v16 = *(unsigned int *)(v15 + 4 * v13);
        memcpy(v12, (const void *)(a2 + *(int *)(*(void *)(v10 + 16) + 4 * ((int)v16 + v14 - 1)) * (uint64_t)v8), v11);
        if ((int)v16 >= 2)
        {
          uint64_t v17 = v16 - 1;
          uint64_t v18 = 4 * v14 + 4 * (int)v16;
          do
          {
            memcpy((void *)(a2 + *(int *)(*(void *)(v10 + 16) + v18 - 4) * (uint64_t)v8), (const void *)(a2 + *(int *)(*(void *)(v10 + 16) + v18 - 8) * (uint64_t)v8), v11);
            v18 -= 4;
            --v17;
          }
          while (v17);
        }
        memcpy((void *)(a2 + *(int *)(*(void *)(v10 + 16) + 4 * v14) * (uint64_t)v8), v12, v11);
        uint64_t v15 = *(void *)(v10 + 8);
        v14 += *(_DWORD *)(v15 + 4 * v13++);
      }
      while (v13 < *(int *)(v10 + 28));
    }
    return sub_1000C321C((uint64_t)v12);
  }
  return result;
}

uint64_t sub_1000CA62C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v31 = a2;
  if ((a4 & 0x80000000) == 0)
  {
    int v8 = a4;
    uint64_t v10 = result;
    size_t v11 = a4;
    uint64_t v12 = sub_1000C2EFC(a4, a2, a3, a4, a5, a6, a7, a8);
    uint64_t v13 = (void *)v12;
    if (*(int *)(v10 + 28) >= 1)
    {
      uint64_t v14 = 0;
      int v15 = 0;
      uint64_t v16 = *(void *)(v10 + 8);
      __src = (void *)v12;
      do
      {
        int v17 = *(_DWORD *)(v16 + 4 * v14);
        int v18 = (v17 & ((v31 % v17) >> 31)) + v31 % v17;
        if (v18 >= 0) {
          unsigned int v19 = (v17 & ((v31 % v17) >> 31)) + v31 % v17;
        }
        else {
          unsigned int v19 = -v18;
        }
        if (v17 >= 0) {
          unsigned int v20 = v17;
        }
        else {
          unsigned int v20 = -v17;
        }
        if (v19 <= v20) {
          int v21 = v20;
        }
        else {
          int v21 = v19;
        }
        if (v19 < v20) {
          unsigned int v20 = v19;
        }
        uint64_t v32 = v14;
        if (v20)
        {
          do
          {
            int v22 = v20;
            unsigned int v20 = v21 % v20;
            int v21 = v22;
          }
          while (v20);
          if (v22 >= 1)
          {
LABEL_21:
            uint64_t v23 = v22;
            int v35 = v17 / v22 - 1;
            if (v17 / v22 <= 1)
            {
              int v30 = v15 + v17 - 1;
              do
              {
                memcpy(v13, (const void *)(a3 + *(int *)(*(void *)(v10 + 16) + 4 * v30) * (uint64_t)v8), v11);
                memcpy((void *)(a3 + *(int *)(*(void *)(v10 + 16) + 4 * v30--) * (uint64_t)v8), v13, v11);
                --v23;
              }
              while (v23);
            }
            else
            {
              uint64_t v24 = 0;
              uint64_t v34 = v23;
              do
              {
                uint64_t v36 = v24;
                int v25 = v17 + v15 + ~v24;
                memcpy(v13, (const void *)(a3 + *(int *)(*(void *)(v10 + 16) + 4 * v25) * (uint64_t)v8), v11);
                int v26 = v35;
                do
                {
                  if (v25 - v18 >= v15) {
                    int v27 = 0;
                  }
                  else {
                    int v27 = v17;
                  }
                  int v28 = v27 + v25 - v18;
                  memcpy((void *)(a3 + *(int *)(*(void *)(v10 + 16) + 4 * v25) * (uint64_t)v8), (const void *)(a3 + *(int *)(*(void *)(v10 + 16) + 4 * v28) * (uint64_t)v8), v11);
                  int v25 = v28;
                  --v26;
                }
                while (v26);
                uint64_t v29 = (void *)(a3 + *(int *)(*(void *)(v10 + 16) + 4 * v28) * (uint64_t)v8);
                uint64_t v13 = __src;
                memcpy(v29, __src, v11);
                uint64_t v24 = v36 + 1;
              }
              while (v36 + 1 != v34);
            }
          }
        }
        else
        {
          int v22 = v21;
          if (v21 >= 1) {
            goto LABEL_21;
          }
        }
        uint64_t v16 = *(void *)(v10 + 8);
        v15 += *(_DWORD *)(v16 + 4 * v32);
        uint64_t v14 = v32 + 1;
      }
      while (v32 + 1 < *(int *)(v10 + 28));
    }
    return sub_1000C321C((uint64_t)v13);
  }
  return result;
}

uint64_t sub_1000CA878(uint64_t a1, int a2, uint64_t a3)
{
  sub_1000CAAB0(a1, a2);
  int64_t v12 = *(int *)(a1 + 24);
  if ((int)v12 >= 1)
  {
    for (int64_t i = 0; i < v12; ++i)
    {
      *(_DWORD *)(*(void *)a1 + 4 * i) = *(_DWORD *)(a3 + 4 * i);
      int64_t v12 = *(int *)(a1 + 24);
    }
  }
  sub_1000C2F04(v12, v5, v6, v7, v8, v9, v10, v11);
  int v15 = *(_DWORD *)(a1 + 24);
  if (v15 < 1)
  {
    int v17 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    int v17 = 0;
    int v18 = 0;
    do
    {
      if (!*(unsigned char *)(v14 + v16))
      {
        uint64_t v19 = 0;
        uint64_t v20 = v16;
        do
        {
          uint64_t v21 = *(int *)(*(void *)a1 + 4 * v20);
          *(_DWORD *)(*(void *)(a1 + 16) + 4 * v18 + 4 * v19) = v21;
          *(unsigned char *)(v14 + v20) = 1;
          ++v19;
          uint64_t v20 = v21;
        }
        while (!*(unsigned char *)(v14 + v21));
        v18 += v19;
        *(_DWORD *)(*(void *)(a1 + 8) + 4 * v17++) = v19;
        int v15 = *(_DWORD *)(a1 + 24);
      }
      ++v16;
    }
    while (v16 < v15);
  }
  *(_DWORD *)(a1 + 28) = v17;
  return sub_1000C321C(v14);
}

uint64_t sub_1000CA96C(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 28);
  if (v1 >= 1)
  {
    uint64_t v2 = 0;
    int v3 = 0;
    uint64_t v4 = *(void *)(result + 8);
    do
    {
      unint64_t v5 = *(unsigned int *)(v4 + 4 * v2);
      if ((int)v5 >= 2)
      {
        uint64_t v6 = *(void *)(result + 16) + 4 * v3;
        unint64_t v7 = v5 >> 1;
        int v8 = v5 - 1;
        uint64_t v9 = (int *)v6;
        do
        {
          int v10 = *v9;
          uint64_t v11 = 4 * v8;
          *v9++ = *(_DWORD *)(v6 + v11);
          *(_DWORD *)(v6 + v11) = v10;
          --v8;
          --v7;
        }
        while (v7);
        uint64_t v4 = *(void *)(result + 8);
        int v1 = *(_DWORD *)(result + 28);
        LODWORD(v5) = *(_DWORD *)(v4 + 4 * v2);
      }
      v3 += v5;
      ++v2;
    }
    while (v2 < v1);
  }
  if (*(int *)(result + 24) >= 1)
  {
    uint64_t v12 = 0;
    do
      *(_DWORD *)(*(void *)result + 4 * v12++) = 0x7FFFFFFF;
    while (v12 < *(int *)(result + 24));
    int v1 = *(_DWORD *)(result + 28);
  }
  if (v1 >= 1)
  {
    uint64_t v13 = 0;
    int v14 = 0;
    uint64_t v15 = *(void *)(result + 8);
    do
    {
      LODWORD(v16) = *(_DWORD *)(v15 + 4 * v13);
      if ((int)v16 >= 1)
      {
        uint64_t v17 = 0;
        int v18 = *(_DWORD *)(*(void *)(result + 16) + 4 * v14);
        do
        {
          uint64_t v19 = *(void *)(result + 16) + 4 * v14;
          uint64_t v20 = v17 + 1;
          BOOL v21 = v17 + 1 < (int)v16;
          int v22 = v18;
          if (v21) {
            int v22 = *(_DWORD *)(v19 + 4 * v17 + 4);
          }
          *(_DWORD *)(*(void *)result + 4 * *(int *)(v19 + 4 * v17)) = v22;
          uint64_t v15 = *(void *)(result + 8);
          uint64_t v16 = *(int *)(v15 + 4 * v13);
          ++v17;
        }
        while (v20 < v16);
        int v1 = *(_DWORD *)(result + 28);
      }
      v14 += v16;
      ++v13;
    }
    while (v13 < v1);
  }
  return result;
}

uint64_t sub_1000CAAB0(uint64_t result, int a2)
{
  uint64_t v3 = result;
  if (*(_DWORD *)(result + 24) < a2)
  {
    sub_1000C321C(*(void *)result);
    sub_1000C321C(*(void *)(v3 + 8));
    sub_1000C321C(*(void *)(v3 + 16));
    *(void *)uint64_t v3 = sub_1000C2EFC(4 * a2, v4, v5, v6, v7, v8, v9, v10);
    *(void *)(v3 + 8) = sub_1000C2EFC(4 * a2, v11, v12, v13, v14, v15, v16, v17);
    uint64_t result = sub_1000C2EFC(4 * a2, v18, v19, v20, v21, v22, v23, v24);
    *(void *)(v3 + 16) = result;
  }
  if (a2 <= 0)
  {
    *(_DWORD *)(v3 + 24) = a2;
    *(_DWORD *)(v3 + 28) = a2;
  }
  else
  {
    uint64_t v25 = 0;
    do
    {
      *(_DWORD *)(*(void *)v3 + 4 * v25) = v25;
      ++v25;
    }
    while (a2 != v25);
    uint64_t v26 = 0;
    *(_DWORD *)(v3 + 24) = a2;
    *(_DWORD *)(v3 + 28) = a2;
    do
    {
      uint64_t v27 = 4 * v26;
      *(_DWORD *)(*(void *)(v3 + 8) + v27) = 1;
      *(_DWORD *)(*(void *)(v3 + 16) + v27) = v26++;
    }
    while (a2 != v26);
  }
  return result;
}

BOOL sub_1000CAB8C()
{
  return qword_1001069B0 != 0;
}

uint64_t sub_1000CABA0()
{
  if (qword_1001069B0) {
    return off_1001069D8();
  }
  return result;
}

uint64_t sub_1000CABBC(char *a1, uint64_t a2, _WORD *a3)
{
  unsigned int v3 = *a1;
  if (*a1 < 0)
  {
    v3 += 65408 + *(_DWORD *)(a2 + 4 * *(int *)(a2 + 4) + 8);
  }
  else if (v3 < 0x20)
  {
    return sub_1000D2284(a1 + 1, a3) + 1;
  }
  *a3 = v3;
  return 1;
}

uint64_t sub_1000CAC1C(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if ((a1 - 32) > 0x5F)
  {
    unsigned int v4 = a1 - *(_DWORD *)(a2 + 4 * *(int *)(a2 + 4) + 8);
    if (v4 > 0x7F)
    {
      *a3 = 14;
      return sub_1000D25BC(a1, a3 + 1) + 1;
    }
    else
    {
      *a3 = v4 ^ 0x80;
      return 1;
    }
  }
  else
  {
    *a3 = a1;
    return 1;
  }
}

uint64_t sub_1000CAC8C(void *__s1, int a2, char *__s2, int a4)
{
  if (a4 < 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = 0;
  size_t v8 = a2;
  while (memcmp(__s1, __s2, v8))
  {
    __s2 += v8;
    uint64_t v7 = (v7 + 1);
    if (a4 == v7) {
      return 0xFFFFFFFFLL;
    }
  }
  return v7;
}

unint64_t sub_1000CAD00(unint64_t result)
{
  if (result)
  {
    int v1 = (unsigned __int8 *)result;
    LODWORD(result) = -1;
    do
    {
      int v2 = *v1++;
      uint64_t result = (result + 1);
    }
    while (v2);
  }
  return result;
}

unsigned char *sub_1000CAD1C(unsigned char *result, unsigned __int8 a2)
{
  if (result)
  {
    int v2 = *result;
    if (*result)
    {
      while (v2 != a2)
      {
        int v3 = *++result;
        int v2 = v3;
        if (!v3) {
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

uint64_t sub_1000CAD44@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  if (a3 < 1) {
    return 0;
  }
  uint64_t v4 = a3;
  while (1)
  {
    int v6 = *a1++;
    int v5 = v6;
    int v8 = *a2++;
    int v7 = v8;
    if (!v5) {
      LODWORD(a4) = 0;
    }
    a4 = v5 == v7 ? a4 : (v5 - v7);
    if (!v5 || v5 != v7) {
      break;
    }
    if (!--v4) {
      return 0;
    }
  }
  return a4;
}

BOOL sub_1000CAD88(unsigned char *a1, char *a2, int a3)
{
  if (a3 == 1)
  {
    *a1 = 0;
    return *a2 == 0;
  }
  else if (a2)
  {
    char v4 = *a2;
    if (*a2) {
      BOOL v5 = a3 < 2;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      *a1 = 0;
      return *a2 == 0;
    }
    else
    {
      uint64_t v6 = 0;
      do
      {
        a1[v6] = v4;
        unint64_t v7 = v6 + 1;
        char v4 = a2[v6 + 1];
        if (v4) {
          BOOL v8 = v7 >= (a3 - 1);
        }
        else {
          BOOL v8 = 1;
        }
        ++v6;
      }
      while (!v8);
      a1[v7] = 0;
      return a2[v7] == 0;
    }
  }
  else
  {
    *a1 = 0;
    return 0;
  }
}

uint64_t sub_1000CAE14(unsigned __int8 *a1, unsigned char *a2, int a3)
{
  if (a1)
  {
    int v3 = -1;
    char v4 = a1;
    do
    {
      int v5 = *v4++;
      ++v3;
    }
    while (v5);
    if (!a2) {
      return 0;
    }
  }
  else
  {
    int v3 = 0;
    if (!a2) {
      return 0;
    }
  }
  if (v3 + 1 >= a3) {
    return 0;
  }
  LOBYTE(v7) = *a2;
  if (*a2)
  {
    uint64_t v8 = 0;
    int v9 = a3 - 1;
    if (v3 > a3 - 1) {
      int v9 = v3;
    }
    uint64_t v10 = (v9 - v3);
    int v11 = v9 - v3;
    while (v10 != v8)
    {
      a1[v3 + v8] = v7;
      int v12 = v8 + 1;
      int v7 = a2[++v8];
      if (!v7)
      {
        int v11 = v12;
        break;
      }
    }
    a1[v11 + (uint64_t)v3] = 0;
    return 1;
  }
  else
  {
    a1[v3] = 0;
    return 1;
  }
}

uint64_t sub_1000CAED0(unsigned char *a1, unsigned __int8 *a2)
{
  while (1)
  {
    int v2 = *a1;
    if (!*a1) {
      break;
    }
    int v3 = *a2++;
    ++a1;
    uint64_t v4 = (v2 - v3);
    if (v4) {
      return v4;
    }
  }
  return -*a2;
}

uint64_t sub_1000CAF00(unsigned __int8 *a1, unsigned __int8 *a2)
{
  while (1)
  {
    uint64_t v5 = *a1;
    uint64_t v6 = *a2;
    if (!*a1) {
      break;
    }
    unsigned __int8 v7 = *a1;
    if (((char)v5 & 0x80000000) == 0 && (byte_1000F6054[v5] & 2) != 0) {
      unsigned __int8 v7 = sub_1000C024C(v5);
    }
    if ((v6 & 0x80) == 0 && (byte_1000F6054[v6] & 2) != 0) {
      LODWORD(v6) = sub_1000C024C(v6);
    }
    ++a1;
    ++a2;
    uint64_t result = v7 - v6;
    if (v7 != v6) {
      return result;
    }
  }
  return -(int)v6;
}

unsigned char *sub_1000CAF9C(char *a1)
{
  if (!a1) {
    return 0;
  }
  int v2 = sub_1000CAD00((unint64_t)a1) + 1;
  sub_1000C2F04(v2, v3, v4, v5, v6, v7, v8, v9);
  int v11 = v10;
  sub_1000CAD88(v10, a1, v2);
  return v11;
}

unsigned char *sub_1000CB004(char *a1, unint64_t a2)
{
  if (a1)
  {
    int v4 = sub_1000CAD00((unint64_t)a1);
    int v12 = v4;
    if (a2)
    {
      int v13 = sub_1000CAD00(a2);
      sub_1000C2F04(v12 + 1 + v13, v14, v15, v16, v17, v18, v19, v20);
      uint64_t v22 = v21;
      sub_1000CAD88(v21, a1, v12 + 1);
      uint64_t v23 = &v22[v12];
      int v24 = v13 + 1;
      uint64_t v25 = (char *)a2;
    }
    else
    {
      sub_1000C2F04(v4 + 1, v5, v6, v7, v8, v9, v10, v11);
      uint64_t v22 = v23;
      uint64_t v25 = a1;
      int v24 = v12 + 1;
    }
    goto LABEL_7;
  }
  if (a2)
  {
    int v26 = sub_1000CAD00(a2) + 1;
    sub_1000C2F04(v26, v27, v28, v29, v30, v31, v32, v33);
    uint64_t v22 = v23;
    uint64_t v25 = (char *)a2;
    int v24 = v26;
LABEL_7:
    sub_1000CAD88(v23, v25, v24);
    return v22;
  }
  return 0;
}

uint64_t sub_1000CB0E8(uint64_t result, unsigned int a2)
{
  if ((int)a2 >= 1)
  {
    if (a2 < 8)
    {
      uint64_t v2 = 0;
      goto LABEL_13;
    }
    if (a2 >= 0x20)
    {
      uint64_t v2 = a2 & 0xFFFFFFE0;
      uint64_t v3 = (char *)(result + 32);
      uint64_t v4 = v2;
      do
      {
        uint64_t v5 = v3 - 32;
        int8x16x2_t v16 = vld2q_s8(v5);
        int8x16x2_t v17 = vld2q_s8(v3);
        int8x16_t v6 = v16.val[0];
        int8x16_t v7 = v17.val[0];
        vst2q_s8(v5, *(int8x16x2_t *)((char *)&v16 + 16));
        vst2q_s8(v3, *(int8x16x2_t *)((char *)&v17 + 16));
        v3 += 64;
        v4 -= 32;
      }
      while (v4);
      if (v2 == a2) {
        return result;
      }
      if ((a2 & 0x18) == 0)
      {
LABEL_13:
        int v12 = (unsigned char *)(result + 2 * v2 + 1);
        uint64_t v13 = a2 - v2;
        do
        {
          char v14 = *(v12 - 1);
          *(v12 - 1) = *v12;
          *int v12 = v14;
          v12 += 2;
          --v13;
        }
        while (v13);
        return result;
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
    uint64_t v8 = v2;
    uint64_t v2 = a2 & 0xFFFFFFF8;
    uint64_t v9 = (char *)(result + 2 * v8);
    uint64_t v10 = v8 - v2;
    do
    {
      int8x8x2_t v15 = vld2_s8(v9);
      int8x8_t v11 = v15.val[0];
      vst2_s8(v9, *(int8x8x2_t *)((char *)&v15 + 8));
      v9 += 16;
      v10 += 8;
    }
    while (v10);
    if (v2 != a2) {
      goto LABEL_13;
    }
  }
  return result;
}

double sub_1000CB1AC(uint64_t a1, unsigned int a2, int16x8_t a3)
{
  if ((int)a2 >= 1)
  {
    if (a2 < 8)
    {
      uint64_t v3 = 0;
      goto LABEL_13;
    }
    if (a2 >= 0x20)
    {
      uint64_t v3 = a2 & 0xFFFFFFE0;
      uint64_t v4 = (char *)(a1 + 64);
      uint64_t v5 = v3;
      do
      {
        int8x16_t v6 = v4 - 64;
        int8x16x4_t v17 = vld4q_s8(v6);
        v18.val[0] = v17.val[3];
        v18.val[1] = v17.val[2];
        int8x16x4_t v19 = vld4q_s8(v4);
        v18.val[2] = v17.val[1];
        v18.val[3] = v17.val[0];
        a3 = (int16x8_t)v19.val[3];
        v17.val[1] = v19.val[2];
        v17.val[2] = v19.val[1];
        v17.val[3] = v19.val[0];
        vst4q_s8(v6, v18);
        vst4q_s8(v4, *(int8x16x4_t *)a3.i8);
        v4 += 128;
        v5 -= 32;
      }
      while (v5);
      if (v3 == a2) {
        return *(double *)a3.i64;
      }
      if ((a2 & 0x18) == 0)
      {
LABEL_13:
        uint64_t v13 = (unsigned __int32 *)(a1 + 4 * v3);
        uint64_t v14 = a2 - v3;
        do
        {
          a3.i32[0] = *v13;
          a3 = (int16x8_t)vmovl_u8(*(uint8x8_t *)a3.i8);
          *(int16x4_t *)a3.i8 = vrev64_s16(*(int16x4_t *)a3.i8);
          *(int8x8_t *)a3.i8 = vmovn_s16(a3);
          *v13++ = a3.i32[0];
          --v14;
        }
        while (v14);
        return *(double *)a3.i64;
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
    uint64_t v7 = v3;
    uint64_t v3 = a2 & 0xFFFFFFF8;
    uint64_t v8 = (char *)(a1 + 4 * v7);
    uint64_t v9 = v7 - v3;
    do
    {
      *(int8x8x4_t *)a3.i8 = vld4_s8(v8);
      v16.val[0] = v10;
      v16.val[1] = v11;
      v16.val[2] = v12;
      v16.val[3] = (int8x8_t)a3.i64[0];
      vst4_s8(v8, v16);
      v8 += 32;
      v9 += 8;
    }
    while (v9);
    if (v3 != a2) {
      goto LABEL_13;
    }
  }
  return *(double *)a3.i64;
}

int8x8_t *sub_1000CB294(int8x8_t *result, int a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = a2;
    do
    {
      *uint64_t result = vrev64_s8(*result);
      ++result;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint8x8_t sub_1000CB2B8(int8x8_t *a1, int a2, uint8x8_t result)
{
  switch(a2)
  {
    case 8:
      uint64_t result = (uint8x8_t)vrev64_s8(*a1);
      *a1 = (int8x8_t)result;
      break;
    case 4:
      result.i32[0] = a1->i32[0];
      int16x8_t v4 = (int16x8_t)vmovl_u8(result);
      *(int16x4_t *)v4.i8 = vrev64_s16(*(int16x4_t *)v4.i8);
      uint64_t result = (uint8x8_t)vmovn_s16(v4);
      a1->i32[0] = result.i32[0];
      break;
    case 2:
      __int8 v3 = a1->i8[0];
      a1->i8[0] = a1->i8[1];
      a1->i8[1] = v3;
      break;
  }
  return result;
}

uint64_t sub_1000CB30C(const char *a1)
{
  if (!a1) {
    return 0;
  }
  if (!*a1) {
    return 0;
  }
  int v1 = j__fopen(a1, "rb");
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1000C33A0(96);
  uint64_t v4 = v3;
  if (!v3) {
    return v4;
  }
  *(void *)(v3 + 32) = v2;
  if (j__fseek(v2, 0, 2))
  {
    if (*(int *)(v4 + 76) >= 1)
    {
      if (*(_WORD *)(v4 + 12))
      {
        unint64_t v5 = 0;
        do
          sub_1000C321C(*(void *)(*(void *)(v4 + 80) + 8 * v5++));
        while (v5 < *(unsigned __int16 *)(v4 + 12));
      }
LABEL_19:
      sub_1000C321C(*(void *)(v4 + 80));
      sub_1000C321C(*(void *)(v4 + 88));
    }
  }
  else
  {
    *(_DWORD *)(v4 + 52) = j__ftell(*(FILE **)(v4 + 32));
    if (!j__fseek(*(FILE **)(v4 + 32), 0, 0))
    {
      if (sub_1000CB520((int *)v4))
      {
        *(_DWORD *)(v4 + 24) = 0;
        int v9 = j__ftell(*(FILE **)(v4 + 32));
        *(void *)(v4 + 64) = 0;
        *(_DWORD *)(v4 + 56) = v9;
        *(_DWORD *)(v4 + 60) = 0;
        return v4;
      }
      else
      {
        sub_1000CB49C(v4);
        return 0;
      }
    }
    if (*(int *)(v4 + 76) >= 1)
    {
      if (*(_WORD *)(v4 + 12))
      {
        unint64_t v7 = 0;
        do
          sub_1000C321C(*(void *)(*(void *)(v4 + 80) + 8 * v7++));
        while (v7 < *(unsigned __int16 *)(v4 + 12));
      }
      goto LABEL_19;
    }
  }
  uint64_t v8 = *(FILE **)(v4 + 32);
  if (v8) {
    j__fclose(v8);
  }
  sub_1000C321C(v4);
  return 0;
}

uint64_t sub_1000CB49C(uint64_t a1)
{
  if (*(int *)(a1 + 76) >= 1)
  {
    if (*(_WORD *)(a1 + 12))
    {
      unint64_t v2 = 0;
      do
        sub_1000C321C(*(void *)(*(void *)(a1 + 80) + 8 * v2++));
      while (v2 < *(unsigned __int16 *)(a1 + 12));
    }
    sub_1000C321C(*(void *)(a1 + 80));
    sub_1000C321C(*(void *)(a1 + 88));
  }
  uint64_t v3 = *(FILE **)(a1 + 32);
  if (v3) {
    j__fclose(v3);
  }
  return sub_1000C321C(a1);
}

uint64_t sub_1000CB520(int *__dst)
{
  unint64_t v2 = (FILE *)*((void *)__dst + 4);
  if (v2)
  {
    if ((int)j__fread(__dst, 1uLL, 4uLL, v2) < 4) {
      return 0;
    }
  }
  else
  {
    uint64_t v3 = __dst[12];
    if (__dst[13] - (int)v3 >= 4) {
      int v4 = 4;
    }
    else {
      int v4 = __dst[13] - v3;
    }
    memcpy(__dst, (const void *)(*((void *)__dst + 5) + v3), v4);
    __dst[12] += v4;
    if (v4 < 4) {
      return 0;
    }
  }
  if (sub_1000CAED0(__dst, "VST")) {
    return 0;
  }
  int8x16_t v6 = (FILE *)*((void *)__dst + 4);
  if (v6)
  {
    if ((int)j__fread(__dst + 1, 1uLL, 4uLL, v6) < 4) {
      return 0;
    }
  }
  else
  {
    uint64_t v7 = __dst[12];
    if (__dst[13] - (int)v7 >= 4) {
      int v8 = 4;
    }
    else {
      int v8 = __dst[13] - v7;
    }
    memcpy(__dst + 1, (const void *)(*((void *)__dst + 5) + v7), v8);
    __dst[12] += v8;
    if (v8 < 4) {
      return 0;
    }
  }
  if (sub_1000CAED0((unsigned char *)__dst + 4, "vtr")) {
    return 0;
  }
  __dst[5] = 0;
  int v9 = (FILE *)*((void *)__dst + 4);
  if (v9)
  {
    if ((int)j__fread(__dst + 2, 1uLL, 2uLL, v9) < 2) {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = __dst[12];
    if (__dst[13] - (int)v11 >= 2) {
      int v12 = 2;
    }
    else {
      int v12 = __dst[13] - v11;
    }
    memcpy(__dst + 2, (const void *)(*((void *)__dst + 5) + v11), v12);
    __dst[12] += v12;
    if (v12 < 2) {
      return 0;
    }
  }
  if (__dst[5]) {
    sub_1000CB2B8((int8x8_t *)__dst + 1, 2, v10);
  }
  int v13 = *((unsigned __int16 *)__dst + 4);
  if (v13 != 65279)
  {
    if (v13 != 65534) {
      return 0;
    }
    __dst[5] = 1;
  }
  if ((int)sub_1000CD23C((uint64_t)__dst, 2uLL, (char *)__dst + 10) < 2) {
    return 0;
  }
  if (__dst[5]) {
    sub_1000CB2B8((int8x8_t *)((char *)__dst + 10), 2, v14);
  }
  if ((*((_WORD *)__dst + 5) & 0xFFFE) != 2 || (int)sub_1000CD23C((uint64_t)__dst, 2uLL, __dst + 3) < 2) {
    return 0;
  }
  if (__dst[5]) {
    sub_1000CB2B8((int8x8_t *)(__dst + 3), 2, v15);
  }
  if ((int)sub_1000CD23C((uint64_t)__dst, 2uLL, (char *)__dst + 14) < 2) {
    return 0;
  }
  if (__dst[5]) {
    sub_1000CB2B8((int8x8_t *)((char *)__dst + 14), 2, v16);
  }
  *((_WORD *)__dst + 8) = 0;
  if (*((unsigned __int16 *)__dst + 5) < 3u)
  {
    *((_WORD *)__dst + 14) = 16;
    return 1;
  }
  else
  {
    if ((int)sub_1000CD23C((uint64_t)__dst, 2uLL, __dst + 4) < 2) {
      return 0;
    }
    if (__dst[5]) {
      sub_1000CB2B8((int8x8_t *)__dst + 2, 2, v17);
    }
    *((_WORD *)__dst + 14) = 18;
    return 1;
  }
}

uint64_t sub_1000CB808(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(_DWORD *)(result + 24))
    {
      if (j__fseek(*(FILE **)(result + 32), 0, 0)) {
        return 1;
      }
      int v2 = sub_1000CB8F0(v1);
      if (*(int *)(v1 + 76) >= 1)
      {
LABEL_9:
        if (*(_WORD *)(v1 + 12))
        {
          unint64_t v5 = 0;
          do
            sub_1000C321C(*(void *)(*(void *)(v1 + 80) + 8 * v5++));
          while (v5 < *(unsigned __int16 *)(v1 + 12));
        }
        sub_1000C321C(*(void *)(v1 + 80));
        sub_1000C321C(*(void *)(v1 + 88));
        uint64_t v3 = *(FILE **)(v1 + 32);
        if (!v3) {
          goto LABEL_13;
        }
        goto LABEL_7;
      }
    }
    else
    {
      int v2 = 0;
      if (*(int *)(result + 76) >= 1) {
        goto LABEL_9;
      }
    }
    uint64_t v3 = *(FILE **)(v1 + 32);
    if (!v3)
    {
LABEL_13:
      BOOL v4 = 0;
LABEL_14:
      sub_1000C321C(v1);
      return v2 || v4;
    }
LABEL_7:
    BOOL v4 = j__fclose(v3) != 0;
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_1000CB8F0(uint64_t a1)
{
  int v2 = *(FILE **)(a1 + 32);
  if (j__fwrite((const void *)a1, 1uLL, 4uLL, v2) != 4
    || j__fwrite((const void *)(a1 + 4), 1uLL, 4uLL, v2) != 4)
  {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = (const void *)(a1 + 8);
  __int16 v4 = *(_WORD *)(a1 + 8);
  *(_WORD *)(a1 + 8) = -257;
  unint64_t v5 = *(FILE **)(a1 + 32);
  if (*(_DWORD *)(a1 + 20))
  {
    *(_WORD *)(a1 + 8) = -2;
    int v6 = j__fwrite(v3, 1uLL, 2uLL, v5);
    char v7 = *(unsigned char *)(a1 + 8);
    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a1 + 9);
    *(unsigned char *)(a1 + 9) = v7;
    if (v6 != 2) {
      return 0xFFFFFFFFLL;
    }
  }
  else if (j__fwrite(v3, 1uLL, 2uLL, v5) != 2)
  {
    return 0xFFFFFFFFLL;
  }
  *(_WORD *)(a1 + 8) = v4;
  int v8 = *(FILE **)(a1 + 32);
  if (*(_DWORD *)(a1 + 20))
  {
    char v9 = *(unsigned char *)(a1 + 10);
    *(unsigned char *)(a1 + 10) = *(unsigned char *)(a1 + 11);
    *(unsigned char *)(a1 + 11) = v9;
    int v10 = j__fwrite((const void *)(a1 + 10), 1uLL, 2uLL, v8);
    char v11 = *(unsigned char *)(a1 + 10);
    *(unsigned char *)(a1 + 10) = *(unsigned char *)(a1 + 11);
    *(unsigned char *)(a1 + 11) = v11;
    if (v10 != 2) {
      return 0xFFFFFFFFLL;
    }
  }
  else if (j__fwrite((const void *)(a1 + 10), 1uLL, 2uLL, v8) != 2)
  {
    return 0xFFFFFFFFLL;
  }
  int v12 = (const void *)(a1 + 12);
  int v13 = *(FILE **)(a1 + 32);
  if (*(_DWORD *)(a1 + 20))
  {
    char v14 = *(unsigned char *)(a1 + 12);
    *(unsigned char *)(a1 + 12) = *(unsigned char *)(a1 + 13);
    *(unsigned char *)(a1 + 13) = v14;
    int v15 = j__fwrite(v12, 1uLL, 2uLL, v13);
    char v16 = *(unsigned char *)(a1 + 12);
    *(unsigned char *)(a1 + 12) = *(unsigned char *)(a1 + 13);
    *(unsigned char *)(a1 + 13) = v16;
    if (v15 != 2) {
      return 0xFFFFFFFFLL;
    }
  }
  else if (j__fwrite(v12, 1uLL, 2uLL, v13) != 2)
  {
    return 0xFFFFFFFFLL;
  }
  uint8x8_t v17 = (const void *)(a1 + 14);
  int8x16x4_t v18 = *(FILE **)(a1 + 32);
  if (*(_DWORD *)(a1 + 20))
  {
    char v19 = *(unsigned char *)(a1 + 14);
    *(unsigned char *)(a1 + 14) = *(unsigned char *)(a1 + 15);
    *(unsigned char *)(a1 + 15) = v19;
    int v20 = j__fwrite(v17, 1uLL, 2uLL, v18);
    char v21 = *(unsigned char *)(a1 + 14);
    *(unsigned char *)(a1 + 14) = *(unsigned char *)(a1 + 15);
    *(unsigned char *)(a1 + 15) = v21;
  }
  else
  {
    int v20 = j__fwrite(v17, 1uLL, 2uLL, v18);
  }
  if (v20 == 2)
  {
    __int16 v22 = 16;
    if (*(unsigned __int16 *)(a1 + 10) < 3u)
    {
LABEL_22:
      uint64_t result = 0;
      *(_WORD *)(a1 + 28) = v22;
      return result;
    }
    if (sub_1000CD2DC(*(FILE **)(a1 + 32), (char *)(a1 + 16), *(_DWORD *)(a1 + 20)) == 2)
    {
      __int16 v22 = 18;
      goto LABEL_22;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000CBB24(uint64_t a1, int a2)
{
  __ptr.i16[0] = 0;
  uint64_t v4 = *(void *)(a1 + 24);
  int v5 = *(unsigned __int16 *)(v4 + 16);
  int v6 = *(FILE **)(v4 + 32);
  if (v6)
  {
    int v7 = j__fread(&__ptr, 1uLL, 2uLL, v6);
    if (v7 < 2) {
      return 0;
    }
  }
  else
  {
    int v9 = *(_DWORD *)(v4 + 48);
    if (*(_DWORD *)(v4 + 52) - v9 >= 2) {
      int v10 = 2;
    }
    else {
      int v10 = *(_DWORD *)(v4 + 52) - v9;
    }
    __memcpy_chk();
    *(_DWORD *)(v4 + 48) = v10 + v9;
    int v7 = v10;
    if (v10 < 2) {
      return 0;
    }
  }
  if (v5 == 1) {
    sub_1000C0B28((uint64_t)&__ptr, v7, (uint64_t)&__ptr);
  }
  if (a2) {
    sub_1000CB2B8(&__ptr, 2, v8);
  }
  if (__ptr.i16[0] < 1) {
    return 0;
  }
  uint64_t result = sub_1000C33A0(__ptr.u16[0] + 1);
  *(void *)a1 = result;
  if (!result) {
    return result;
  }
  uint64_t v12 = result;
  int v13 = *(unsigned __int16 *)(v4 + 16);
  int v14 = __ptr.i16[0];
  if (__ptr.i16[0] < 1)
  {
    int v16 = 0;
    if (__ptr.i16[0] > 0) {
      return 0;
    }
  }
  else
  {
    int v15 = *(FILE **)(v4 + 32);
    if (v15)
    {
      int v16 = j__fread((void *)result, 1uLL, __ptr.i16[0], v15);
      if (v16 < v14) {
        return 0;
      }
    }
    else
    {
      uint64_t v17 = *(int *)(v4 + 48);
      if (*(_DWORD *)(v4 + 52) - (int)v17 >= __ptr.i16[0]) {
        int v16 = __ptr.i16[0];
      }
      else {
        int v16 = *(_DWORD *)(v4 + 52) - v17;
      }
      memcpy((void *)result, (const void *)(*(void *)(v4 + 40) + v17), v16);
      *(_DWORD *)(v4 + 48) += v16;
      if (v16 < v14) {
        return 0;
      }
    }
  }
  if (v13 == 1) {
    sub_1000C0B28(v12, v16, v12);
  }
  if (!v16) {
    return 0;
  }
  __int16 v18 = __ptr.i16[0];
  int v19 = *(unsigned __int16 *)(v4 + 16);
  int v20 = *(FILE **)(v4 + 32);
  if (v20)
  {
    int v21 = j__fread((void *)(a1 + 8), 1uLL, 4uLL, v20);
    if (v21 < 4) {
      return 0;
    }
  }
  else
  {
    uint64_t v23 = *(int *)(v4 + 48);
    if (*(_DWORD *)(v4 + 52) - (int)v23 >= 4) {
      int v24 = 4;
    }
    else {
      int v24 = *(_DWORD *)(v4 + 52) - v23;
    }
    memcpy((void *)(a1 + 8), (const void *)(*(void *)(v4 + 40) + v23), v24);
    *(_DWORD *)(v4 + 48) += v24;
    int v21 = v24;
    if (v24 < 4) {
      return 0;
    }
  }
  if (v19 == 1) {
    sub_1000C0B28(a1 + 8, v21, a1 + 8);
  }
  if (a2) {
    sub_1000CB2B8((int8x8_t *)(a1 + 8), 4, v22);
  }
  int v25 = *(unsigned __int16 *)(v4 + 16);
  int v26 = *(FILE **)(v4 + 32);
  if (v26)
  {
    int v27 = j__fread((void *)(a1 + 12), 1uLL, 4uLL, v26);
  }
  else
  {
    uint64_t v29 = *(int *)(v4 + 48);
    if (*(_DWORD *)(v4 + 52) - (int)v29 >= 4) {
      int v30 = 4;
    }
    else {
      int v30 = *(_DWORD *)(v4 + 52) - v29;
    }
    memcpy((void *)(a1 + 12), (const void *)(*(void *)(v4 + 40) + v29), v30);
    *(_DWORD *)(v4 + 48) += v30;
    int v27 = v30;
  }
  if (v27 >= 4)
  {
    if (v25 == 1) {
      sub_1000C0B28(a1 + 12, v27, a1 + 12);
    }
    if (a2) {
      sub_1000CB2B8((int8x8_t *)(a1 + 12), 4, v28);
    }
    if (*(int *)(a1 + 12) >= 1)
    {
      *(_WORD *)(a1 + 16) = v18 + 10;
      return 1;
    }
  }
  return 0;
}

uint64_t sub_1000CBE14(const char *a1)
{
  uint64_t v1 = j__fopen(a1, "wb");
  if (!v1) {
    return 0;
  }
  int v2 = v1;
  uint64_t v3 = sub_1000C33A0(96);
  uint64_t v4 = v3;
  if (v3)
  {
    *(void *)(v3 + 32) = v2;
    sub_1000CAD88((unsigned char *)v3, "VST", 4);
    sub_1000CAD88((unsigned char *)(v4 + 4), "vtr", 4);
    *(_DWORD *)(v4 + 8) = 261887;
    *(_DWORD *)(v4 + 20) = 0;
    __int16 v5 = qword_100101CC0;
    if (qword_100101CC0) {
      __int16 v5 = *(_WORD *)(qword_100101CC0 + 5184);
    }
    *(_WORD *)(v4 + 16) = v5;
    if (sub_1000CB8F0(v4)
      || (*(_DWORD *)(v4 + 24) = 1,
          *(_DWORD *)(v4 + 52) = j__ftell(*(FILE **)(v4 + 32)),
          *(_DWORD *)(v4 + 76) = 500,
          uint64_t v9 = sub_1000C33A0(4000),
          (*(void *)(v4 + 80) = v9) == 0)
      || (uint64_t v10 = sub_1000C33A0(4 * *(int *)(v4 + 76)), (*(void *)(v4 + 88) = v10) == 0))
    {
      if (*(int *)(v4 + 76) >= 1)
      {
        if (*(_WORD *)(v4 + 12))
        {
          unint64_t v6 = 0;
          do
            sub_1000C321C(*(void *)(*(void *)(v4 + 80) + 8 * v6++));
          while (v6 < *(unsigned __int16 *)(v4 + 12));
        }
        sub_1000C321C(*(void *)(v4 + 80));
        sub_1000C321C(*(void *)(v4 + 88));
      }
      int v7 = *(FILE **)(v4 + 32);
      if (v7) {
        j__fclose(v7);
      }
      sub_1000C321C(v4);
      return 0;
    }
  }
  return v4;
}

uint64_t sub_1000CBF58(uint64_t a1, unsigned char *a2)
{
  if (*(int *)(a1 + 76) < 1)
  {
    long long v11 = 0u;
    uint64_t v12 = 0;
    uint64_t v13 = a1;
    uint64_t v14 = 0;
    uint64_t v9 = sub_1000CC02C(a1, a2, (uint64_t)&v11);
    sub_1000C321C(v11);
  }
  else
  {
    int v4 = *(unsigned __int16 *)(a1 + 12);
    if (*(_WORD *)(a1 + 12))
    {
      int v5 = 0;
      while (1)
      {
        while (1)
        {
          int v6 = v4 >= 0 ? v4 : v4 + 1;
          int v7 = v6 >> 1;
          int v8 = sub_1000CAED0(a2, *(unsigned __int8 **)(*(void *)(a1 + 80) + 8 * ((v6 >> 1) + v5)));
          if ((v8 & 0x80000000) == 0) {
            break;
          }
          int v4 = v7;
          if (!v7) {
            return 0;
          }
        }
        if (!v8) {
          break;
        }
        v4 += ~v7;
        v5 += v7 + 1;
        if (!v4) {
          return 0;
        }
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

uint64_t sub_1000CC02C(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a1 + 60) + *(_DWORD *)(a1 + 56) + *(_DWORD *)(a1 + 68);
  int v7 = *(FILE **)(a1 + 32);
  if (!v7)
  {
    if (!*(void *)(a1 + 40))
    {
      int v8 = -1;
      if (v6 < 0) {
        return 0;
      }
LABEL_8:
      if (v6 > *(_DWORD *)(a1 + 52)) {
        return 0;
      }
      *(_DWORD *)(a1 + 48) = v6;
      while (1)
      {
LABEL_13:
        uint64_t v12 = *(FILE **)(a1 + 32);
        if (v12)
        {
          int v13 = j__ftell(v12);
          *(_DWORD *)(a3 + 32) = v13;
          *(void *)(a3 + 24) = a1;
          if (*(_DWORD *)(a1 + 52) == v13) {
            goto LABEL_30;
          }
        }
        else if (*(void *)(a1 + 40))
        {
          int v13 = *(_DWORD *)(a1 + 48);
          *(_DWORD *)(a3 + 32) = v13;
          *(void *)(a3 + 24) = a1;
          if (*(_DWORD *)(a1 + 52) == v13) {
            goto LABEL_30;
          }
        }
        else
        {
          int v13 = -1;
          *(_DWORD *)(a3 + 32) = -1;
          *(void *)(a3 + 24) = a1;
          if (*(_DWORD *)(a1 + 52) == -1)
          {
LABEL_30:
            uint64_t v18 = *(unsigned __int16 *)(a1 + 28);
            if (!*(void *)(a1 + 32))
            {
              if (v13 >= (int)v18)
              {
                *(_DWORD *)(a1 + 48) = v18;
                goto LABEL_37;
              }
              return 0;
            }
            int v19 = j__fseek(*(FILE **)(a1 + 32), v18, 0);
            uint64_t result = 0;
            if (!v19)
            {
              while (1)
              {
LABEL_37:
                int v20 = *(FILE **)(a1 + 32);
                if (v20)
                {
                  int v21 = j__ftell(v20);
                  *(_DWORD *)(a3 + 32) = v21;
                  *(void *)(a3 + 24) = a1;
                  if (*(_DWORD *)(a1 + 52) == v21) {
                    goto LABEL_55;
                  }
                }
                else if (*(void *)(a1 + 40))
                {
                  int v21 = *(_DWORD *)(a1 + 48);
                  *(_DWORD *)(a3 + 32) = v21;
                  *(void *)(a3 + 24) = a1;
                  if (*(_DWORD *)(a1 + 52) == v21) {
                    goto LABEL_55;
                  }
                }
                else
                {
                  int v21 = -1;
                  *(_DWORD *)(a3 + 32) = -1;
                  *(void *)(a3 + 24) = a1;
                  if (*(_DWORD *)(a1 + 52) == -1)
                  {
LABEL_55:
                    uint64_t v26 = *(unsigned __int16 *)(a1 + 28);
                    if (*(void *)(a1 + 32))
                    {
                      int v27 = j__fseek(*(FILE **)(a1 + 32), v26, 0);
                      uint64_t result = 0;
                      if (v27) {
                        return result;
                      }
                    }
                    else
                    {
                      if (v21 < (int)v26) {
                        return 0;
                      }
                      *(_DWORD *)(a1 + 48) = v26;
                    }
LABEL_60:
                    uint8x8_t v28 = *(FILE **)(a1 + 32);
                    if (v28)
                    {
                      j__fseek(v28, v8, 0);
                      return 0;
                    }
                    if ((v8 & 0x80000000) == 0 && v8 <= *(_DWORD *)(a1 + 52))
                    {
                      uint64_t result = 0;
                      *(_DWORD *)(a1 + 48) = v8;
                      return result;
                    }
                    return 0;
                  }
                }
                if (v6 <= v21) {
                  goto LABEL_60;
                }
                if (!sub_1000CBB24(a3, *(_DWORD *)(a1 + 20))) {
                  goto LABEL_53;
                }
                uint8x8_t v22 = *(unsigned __int8 **)a3;
                if (**(unsigned char **)a3)
                {
                  if (!sub_1000CAED0(a2, v22)) {
                    return 1;
                  }
                  uint8x8_t v22 = *(unsigned __int8 **)a3;
                }
                sub_1000CAED0(v22, "vstpar");
                uint64_t v23 = *(int *)(a3 + 12);
                int v24 = *(FILE **)(a1 + 32);
                if (v24)
                {
                  if (j__fseek(v24, v23, 1)) {
                    goto LABEL_53;
                  }
                }
                else
                {
                  int v25 = *(_DWORD *)(a1 + 48) + v23;
                  if (v25 < 0 || v25 > *(_DWORD *)(a1 + 52)) {
                    goto LABEL_53;
                  }
                  *(_DWORD *)(a1 + 48) = v25;
                }
                sub_1000C321C(*(void *)a3);
                *(void *)(a3 + 32) = 0;
                *(_OWORD *)a3 = 0u;
                *(_OWORD *)(a3 + 16) = 0u;
              }
            }
            return result;
          }
        }
        if (!sub_1000CBB24(a3, *(_DWORD *)(a1 + 20))) {
          goto LABEL_53;
        }
        uint64_t v14 = *(unsigned __int8 **)a3;
        if (**(unsigned char **)a3)
        {
          if (!sub_1000CAED0(a2, v14)) {
            return 1;
          }
          uint64_t v14 = *(unsigned __int8 **)a3;
        }
        sub_1000CAED0(v14, "vstpar");
        uint64_t v15 = *(int *)(a3 + 12);
        int v16 = *(FILE **)(a1 + 32);
        if (v16)
        {
          if (j__fseek(v16, v15, 1)) {
            goto LABEL_53;
          }
        }
        else
        {
          int v17 = *(_DWORD *)(a1 + 48) + v15;
          if (v17 < 0 || v17 > *(_DWORD *)(a1 + 52))
          {
LABEL_53:
            sub_1000C321C(*(void *)a3);
            uint64_t result = 0;
            *(void *)(a3 + 32) = 0;
            *(_OWORD *)a3 = 0u;
            *(_OWORD *)(a3 + 16) = 0u;
            return result;
          }
          *(_DWORD *)(a1 + 48) = v17;
        }
        sub_1000C321C(*(void *)a3);
        *(void *)(a3 + 32) = 0;
        *(_OWORD *)a3 = 0u;
        *(_OWORD *)(a3 + 16) = 0u;
      }
    }
    int v8 = *(_DWORD *)(a1 + 48);
LABEL_7:
    if (v6 < 0) {
      return 0;
    }
    goto LABEL_8;
  }
  int v8 = j__ftell(v7);
  uint64_t v9 = *(FILE **)(a1 + 32);
  if (!v9) {
    goto LABEL_7;
  }
  int v10 = j__fseek(v9, v6, 0);
  uint64_t result = 0;
  if (!v10) {
    goto LABEL_13;
  }
  return result;
}

uint64_t sub_1000CC3D0(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = sub_1000C33A0(40);
  uint64_t v5 = v4;
  if (!v4) {
    return v5;
  }
  *(void *)(v4 + 24) = a1;
  if (*(int *)(a1 + 76) >= 1)
  {
    int v6 = *(unsigned __int16 *)(a1 + 12);
    if (*(_WORD *)(a1 + 12))
    {
      int v7 = 0;
      while (1)
      {
        while (1)
        {
          int v8 = v6 >= 0 ? v6 : v6 + 1;
          int v9 = v8 >> 1;
          int v10 = (v8 >> 1) + v7;
          int v11 = sub_1000CAED0(a2, *(unsigned __int8 **)(*(void *)(a1 + 80) + 8 * v10));
          if ((v11 & 0x80000000) == 0) {
            break;
          }
          int v6 = v9;
          if (!v9) {
            goto LABEL_38;
          }
        }
        if (!v11) {
          break;
        }
        v6 += ~v9;
        int v7 = v10 + 1;
        if (!v6) {
          goto LABEL_38;
        }
      }
      int v14 = *(_DWORD *)(*(void *)(a1 + 88) + 4 * v10);
      uint64_t v15 = *(FILE **)(a1 + 32);
      if (v15)
      {
        if (!j__fseek(v15, v14, 0))
        {
          int v16 = *(FILE **)(a1 + 32);
          if (v16)
          {
            int v17 = j__ftell(v16);
LABEL_35:
            *(_DWORD *)(v5 + 32) = v17;
            if (sub_1000CBB24(v5, *(_DWORD *)(a1 + 20))) {
              goto LABEL_36;
            }
            sub_1000C321C(*(void *)v5);
            *(void *)(v5 + 32) = 0;
            *(_OWORD *)uint64_t v5 = 0u;
            *(_OWORD *)(v5 + 16) = 0u;
            goto LABEL_38;
          }
LABEL_26:
          if (*(void *)(a1 + 40)) {
            int v17 = *(_DWORD *)(a1 + 48);
          }
          else {
            int v17 = -1;
          }
          goto LABEL_35;
        }
      }
      else if ((v14 & 0x80000000) == 0 && v14 <= *(_DWORD *)(a1 + 52))
      {
        *(_DWORD *)(a1 + 48) = v14;
        goto LABEL_26;
      }
    }
LABEL_38:
    sub_1000C321C(v5);
    return 0;
  }
  uint64_t v12 = *(FILE **)(a1 + 32);
  if (v12)
  {
    int v13 = j__ftell(v12);
    if (!sub_1000CC02C(a1, a2, v5)) {
      goto LABEL_29;
    }
LABEL_36:
    *(_DWORD *)(a1 + 56) = *(_DWORD *)(v5 + 32);
    *(_DWORD *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 68) = *(_DWORD *)(v5 + 12);
    *(_DWORD *)(a1 + 60) = *(unsigned __int16 *)(v5 + 16);
    ++*(_DWORD *)(a1 + 72);
    return v5;
  }
  if (*(void *)(a1 + 40))
  {
    int v13 = *(_DWORD *)(a1 + 48);
    if (!sub_1000CC02C(a1, a2, v5)) {
      goto LABEL_29;
    }
    goto LABEL_36;
  }
  int v13 = -1;
  if (sub_1000CC02C(a1, a2, v5)) {
    goto LABEL_36;
  }
LABEL_29:
  sub_1000C321C(*(void *)v5);
  *(void *)(v5 + 32) = 0;
  *(_OWORD *)uint64_t v5 = 0u;
  *(_OWORD *)(v5 + 16) = 0u;
  sub_1000C321C(v5);
  uint64_t v18 = *(FILE **)(a1 + 32);
  if (v18)
  {
    j__fseek(v18, v13, 0);
    return 0;
  }
  if (v13 < 0 || v13 > *(_DWORD *)(a1 + 52)) {
    return 0;
  }
  uint64_t v5 = 0;
  *(_DWORD *)(a1 + 48) = v13;
  return v5;
}

uint64_t sub_1000CC5F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (*(_DWORD *)(v2 + 24) != 1)
  {
LABEL_33:
    uint64_t v9 = 0;
    --*(_DWORD *)(v2 + 72);
    goto LABEL_34;
  }
  int v3 = *(_DWORD *)(a1 + 32);
  uint64_t v4 = *(FILE **)(v2 + 32);
  if (v4)
  {
    j__fseek(v4, v3, 0);
  }
  else if ((v3 & 0x80000000) == 0 && v3 <= *(_DWORD *)(v2 + 52))
  {
    *(_DWORD *)(v2 + 48) = v3;
  }
  if (sub_1000CC844(a1, *(_DWORD *)(*(void *)(a1 + 24) + 20)))
  {
    uint64_t v5 = *(FILE **)(v2 + 32);
    if (v5)
    {
      j__fseek(v5, 0, 2);
      int v6 = *(FILE **)(v2 + 32);
      if (v6)
      {
        *(_DWORD *)(v2 + 52) = j__ftell(v6);
        int v7 = *(unsigned __int16 *)(v2 + 12);
        int v8 = *(_DWORD *)(v2 + 76);
        if (v8 > v7) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
    else
    {
      int v10 = *(_DWORD *)(v2 + 52);
      if ((v10 & 0x80000000) == 0) {
        *(_DWORD *)(v2 + 48) = v10;
      }
    }
    if (*(void *)(v2 + 40))
    {
      *(_DWORD *)(v2 + 52) = *(_DWORD *)(v2 + 48);
      int v7 = *(unsigned __int16 *)(v2 + 12);
      int v8 = *(_DWORD *)(v2 + 76);
      if (v8 > v7) {
        goto LABEL_18;
      }
    }
    else
    {
      *(_DWORD *)(v2 + 52) = -1;
      int v7 = *(unsigned __int16 *)(v2 + 12);
      int v8 = *(_DWORD *)(v2 + 76);
      if (v8 > v7)
      {
LABEL_18:
        int v12 = 0;
        if (v7)
        {
          int v13 = *(char **)a1;
          while (1)
          {
            while (1)
            {
              int v14 = v7 >= 0 ? v7 : v7 + 1;
              int v15 = v14 >> 1;
              int v16 = (v14 >> 1) + v12;
              int v17 = sub_1000CAED0(v13, *(unsigned __int8 **)(*(void *)(v2 + 80) + 8 * v16));
              if ((v17 & 0x80000000) == 0) {
                break;
              }
              int v7 = v15;
              if (!v15) {
                goto LABEL_27;
              }
            }
            if (!v17) {
              break;
            }
            v7 += ~v15;
            int v12 = v16 + 1;
            if (!v7)
            {
LABEL_27:
              int v18 = *(unsigned __int16 *)(v2 + 12);
              BOOL v19 = __OFSUB__(v18, v12);
              int v20 = v18 - v12;
              if ((v20 < 0) ^ v19 | (v20 == 0)) {
                goto LABEL_31;
              }
              goto LABEL_28;
            }
          }
          v12 += v15;
          int v23 = *(unsigned __int16 *)(v2 + 12);
          BOOL v19 = __OFSUB__(v23, v16);
          int v20 = v23 - v16;
          if (!((v20 < 0) ^ v19 | (v20 == 0)))
          {
LABEL_28:
            uint64_t v21 = v12;
            uint64_t v22 = v12 + 1;
            j__memmove((void *)(*(void *)(v2 + 80) + 8 * v22), (const void *)(*(void *)(v2 + 80) + 8 * v12), 8 * v20);
            j__memmove((void *)(*(void *)(v2 + 88) + 4 * v22), (const void *)(*(void *)(v2 + 88) + 4 * v12), 4 * (*(unsigned __int16 *)(v2 + 12) - v12));
            goto LABEL_32;
          }
        }
LABEL_31:
        uint64_t v21 = v12;
LABEL_32:
        *(void *)(*(void *)(v2 + 80) + 8 * v21) = sub_1000CAF9C(*(char **)a1);
        *(_DWORD *)(*(void *)(v2 + 88) + 4 * v21) = *(_DWORD *)(a1 + 32);
        ++*(_WORD *)(v2 + 12);
        goto LABEL_33;
      }
    }
LABEL_17:
    int v11 = v8 + 500;
    *(_DWORD *)(v2 + 76) = v11;
    *(void *)(v2 + 80) = sub_1000C2F40(*(void *)(v2 + 80), 8 * v11);
    *(void *)(v2 + 88) = sub_1000C2F40(*(void *)(v2 + 88), 4 * *(int *)(v2 + 76));
    int v7 = *(unsigned __int16 *)(v2 + 12);
    goto LABEL_18;
  }
  uint64_t v9 = 1;
LABEL_34:
  sub_1000C321C(*(void *)a1);
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  sub_1000C321C(a1);
  return v9;
}

uint64_t sub_1000CC844(uint64_t a1, int a2)
{
  __ptr.i16[0] = sub_1000CAD00(*(void *)a1);
  if (a2) {
    sub_1000CB2B8(&__ptr, 2, v4);
  }
  int v5 = sub_1000CCD48(*(FILE **)(*(void *)(a1 + 24) + 32), *(unsigned __int16 *)(*(void *)(a1 + 24) + 16), 2uLL, &__ptr);
  if (a2) {
    sub_1000CB2B8(&__ptr, 2, v6);
  }
  if (v5 != 2) {
    return 0;
  }
  int v7 = sub_1000CCD48(*(FILE **)(*(void *)(a1 + 24) + 32), *(unsigned __int16 *)(*(void *)(a1 + 24) + 16), __ptr.i16[0], *(void **)a1);
  __int16 v9 = __ptr.i16[0];
  if (v7 != __ptr.i16[0]) {
    return 0;
  }
  if (a2) {
    sub_1000CB2B8((int8x8_t *)(a1 + 8), 4, v8);
  }
  int v10 = sub_1000CCD48(*(FILE **)(*(void *)(a1 + 24) + 32), *(unsigned __int16 *)(*(void *)(a1 + 24) + 16), 4uLL, (void *)(a1 + 8));
  int v12 = v10;
  if (a2)
  {
    uint8x8_t v13 = sub_1000CB2B8((int8x8_t *)(a1 + 8), 4, v11);
    if (v12 != 4) {
      return 0;
    }
    sub_1000CB2B8((int8x8_t *)(a1 + 12), 4, v13);
  }
  else if (v10 != 4)
  {
    return 0;
  }
  int v14 = sub_1000CCD48(*(FILE **)(*(void *)(a1 + 24) + 32), *(unsigned __int16 *)(*(void *)(a1 + 24) + 16), 4uLL, (void *)(a1 + 12));
  if (a2) {
    sub_1000CB2B8((int8x8_t *)(a1 + 12), 4, v15);
  }
  if (v14 == 4)
  {
    *(_WORD *)(a1 + 16) = v9 + 10;
    return 1;
  }
  return 0;
}

uint64_t sub_1000CC9B8(uint64_t a1)
{
  return *(int *)(a1 + 12);
}

uint64_t sub_1000CC9C0(uint64_t a1)
{
  return *(int *)(a1 + 36);
}

size_t sub_1000CC9C8(uint64_t a1, void *__dst, size_t __nitems)
{
  int v3 = *(_DWORD *)(a1 + 36);
  int v4 = *(_DWORD *)(a1 + 12) - v3;
  if (!v4) {
    return 0;
  }
  if (v4 < (int)__nitems) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *(void *)(a1 + 24);
  int v10 = *(_DWORD *)(a1 + 32);
  if (*(_DWORD *)(v9 + 56) != v10 || *(_DWORD *)(v9 + 64) != v3)
  {
    int v11 = v10 + v3 + *(unsigned __int16 *)(a1 + 16);
    int v12 = *(FILE **)(v9 + 32);
    if (v12)
    {
      if (j__fseek(v12, v11, 0)) {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      if (v11 < 0 || v11 > *(_DWORD *)(v9 + 52)) {
        return 0xFFFFFFFFLL;
      }
      *(_DWORD *)(v9 + 48) = v11;
    }
    *(_DWORD *)(v9 + 56) = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(v9 + 64) = *(_DWORD *)(a1 + 36);
    *(_DWORD *)(v9 + 68) = *(_DWORD *)(a1 + 12);
    *(_DWORD *)(v9 + 60) = *(unsigned __int16 *)(a1 + 16);
  }
  int v13 = *(unsigned __int16 *)(v9 + 16);
  if ((int)__nitems < 1)
  {
    int v15 = 0;
  }
  else
  {
    int v14 = *(FILE **)(v9 + 32);
    if (v14)
    {
      int v15 = j__fread(__dst, 1uLL, __nitems, v14);
      if (v15 < (int)__nitems)
      {
LABEL_16:
        int v15 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v17 = *(int *)(v9 + 48);
      if (*(_DWORD *)(v9 + 52) - (int)v17 >= (int)__nitems) {
        int v15 = __nitems;
      }
      else {
        int v15 = *(_DWORD *)(v9 + 52) - v17;
      }
      memcpy(__dst, (const void *)(*(void *)(v9 + 40) + v17), v15);
      *(_DWORD *)(v9 + 48) += v15;
      if (v15 < (int)__nitems) {
        goto LABEL_16;
      }
    }
  }
  if (v13 == 1) {
    sub_1000C0B28((uint64_t)__dst, v15, (uint64_t)__dst);
  }
LABEL_20:
  if (v15 == __nitems)
  {
    int v16 = *(_DWORD *)(a1 + 36) + __nitems;
    *(_DWORD *)(a1 + 36) = v16;
    *(_DWORD *)(v9 + 64) = v16;
    return __nitems;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000CCB84(uint64_t a1, char *a2)
{
  if ((int)sub_1000CAD00((unint64_t)a2) > 0x10000) {
    return 0;
  }
  int v4 = *(unsigned __int16 *)(a1 + 12);
  if (*(_WORD *)(a1 + 12))
  {
    int v5 = 0;
    do
    {
      while (1)
      {
        int v6 = v4 >= 0 ? v4 : v4 + 1;
        int v7 = v6 >> 1;
        int v8 = sub_1000CAED0(a2, *(unsigned __int8 **)(*(void *)(a1 + 80) + 8 * ((v6 >> 1) + v5)));
        if ((v8 & 0x80000000) == 0) {
          break;
        }
        int v4 = v7;
        if (!v7) {
          goto LABEL_11;
        }
      }
      if (!v8) {
        break;
      }
      v4 += ~v7;
      v5 += v7 + 1;
    }
    while (v4);
  }
LABEL_11:
  uint64_t v9 = sub_1000C33A0(40);
  if (!v9) {
    return v9;
  }
  int v10 = sub_1000CAD00((unint64_t)a2) + 1;
  int v11 = (unsigned char *)sub_1000C33A0(v10);
  *(void *)uint64_t v9 = v11;
  if (v11)
  {
    sub_1000CAD88(v11, a2, v10);
    *(_DWORD *)(v9 + 8) = -1;
    *(void *)(v9 + 24) = a1;
    int v12 = *(FILE **)(a1 + 32);
    if (v12)
    {
      *(_DWORD *)(v9 + 32) = j__ftell(v12);
      if (!sub_1000CC844(v9, *(_DWORD *)(a1 + 20))) {
        goto LABEL_21;
      }
      goto LABEL_18;
    }
    if (*(void *)(a1 + 40))
    {
      *(_DWORD *)(v9 + 32) = *(_DWORD *)(a1 + 48);
      if (sub_1000CC844(v9, *(_DWORD *)(a1 + 20)))
      {
LABEL_18:
        *(_DWORD *)(a1 + 72) = 1;
        return v9;
      }
    }
    else
    {
      *(_DWORD *)(v9 + 32) = -1;
      if (sub_1000CC844(v9, *(_DWORD *)(a1 + 20))) {
        goto LABEL_18;
      }
    }
LABEL_21:
    int v11 = *(unsigned char **)v9;
  }
  sub_1000C321C((uint64_t)v11);
  *(void *)(v9 + 32) = 0;
  *(_OWORD *)uint64_t v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  sub_1000C321C(v9);
  return 0;
}

size_t sub_1000CCCFC(uint64_t a1, void *__ptr, size_t a3)
{
  size_t result = sub_1000CCD48(*(FILE **)(*(void *)(a1 + 24) + 32), *(unsigned __int16 *)(*(void *)(a1 + 24) + 16), a3, __ptr);
  *(_DWORD *)(a1 + 36) += result;
  *(_DWORD *)(a1 + 12) += result;
  return result;
}

size_t sub_1000CCD48(FILE *__stream, int a2, size_t __nitems, void *__ptr)
{
  uint64_t v4 = 0;
  if ((__nitems & 0x80000000) != 0 || !__stream) {
    return v4;
  }
  int v7 = __nitems;
  if (!a2) {
    return j__fwrite(__ptr, 1uLL, __nitems, __stream);
  }
  if (__nitems < 0x21)
  {
    if (!__nitems) {
      return 0;
    }
    int v11 = v20;
    int v12 = 32;
    if (a2 == 1) {
      goto LABEL_15;
    }
LABEL_26:
    uint64_t v4 = 0;
    do
    {
      if (v12 >= v7) {
        size_t v17 = v7;
      }
      else {
        size_t v17 = v12;
      }
      int v18 = j__fwrite(v11, 1uLL, v17, __stream);
      if (v18 < 1) {
        break;
      }
      uint64_t v4 = (v4 + v18);
      BOOL v16 = __OFSUB__(v7, v18);
      v7 -= v18;
    }
    while (!((v7 < 0) ^ v16 | (v7 == 0)));
    goto LABEL_33;
  }
  if ((int)__nitems >= 1024) {
    uint64_t v9 = 1024;
  }
  else {
    uint64_t v9 = __nitems;
  }
  uint64_t v10 = sub_1000C33A0(v9);
  if (v10) {
    int v11 = (unsigned char *)v10;
  }
  else {
    int v11 = v20;
  }
  if (v10) {
    int v12 = v9;
  }
  else {
    int v12 = 32;
  }
  if (a2 != 1) {
    goto LABEL_26;
  }
LABEL_15:
  int v13 = 0;
  uint64_t v4 = 0;
  do
  {
    if (v12 >= v7) {
      unint64_t v14 = v7;
    }
    else {
      unint64_t v14 = v12;
    }
    sub_1000C0AFC((uint64_t)__ptr + v13, v14, (uint64_t)v11);
    int v15 = j__fwrite(v11, 1uLL, v14, __stream);
    if (v15 < 1) {
      break;
    }
    uint64_t v4 = (v4 + v15);
    v13 += v15;
    BOOL v16 = __OFSUB__(v7, v15);
    v7 -= v15;
  }
  while (!((v7 < 0) ^ v16 | (v7 == 0)));
LABEL_33:
  if (v11 != v20) {
    sub_1000C321C((uint64_t)v11);
  }
  return v4;
}

size_t sub_1000CCF04(uint64_t a1, unsigned char *a2, int a3, int a4, void *a5)
{
  uint64_t v10 = *(FILE **)(a1 + 32);
  if (v10)
  {
    int v11 = j__ftell(v10);
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    if (*(int *)(a1 + 76) < 1) {
      goto LABEL_17;
    }
  }
  else if (*(void *)(a1 + 40))
  {
    int v11 = *(_DWORD *)(a1 + 48);
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    if (*(int *)(a1 + 76) < 1) {
      goto LABEL_17;
    }
  }
  else
  {
    int v11 = -1;
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    if (*(int *)(a1 + 76) < 1) {
      goto LABEL_17;
    }
  }
  int v12 = *(unsigned __int16 *)(a1 + 12);
  if (*(_WORD *)(a1 + 12))
  {
    int v13 = 0;
    while (1)
    {
      while (1)
      {
        int v14 = v12 >= 0 ? v12 : v12 + 1;
        int v15 = v14 >> 1;
        int v16 = (v14 >> 1) + v13;
        int v17 = sub_1000CAED0(a2, *(unsigned __int8 **)(*(void *)(a1 + 80) + 8 * v16));
        if ((v17 & 0x80000000) == 0) {
          break;
        }
        int v12 = v15;
        if (!v15) {
          goto LABEL_17;
        }
      }
      if (!v17) {
        break;
      }
      v12 += ~v15;
      int v13 = v16 + 1;
      if (!v12) {
        goto LABEL_17;
      }
    }
    unsigned int v19 = *(_DWORD *)(*(void *)(a1 + 88) + 4 * v16);
    if ((v19 & 0x80000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_19;
  }
LABEL_17:
  *((void *)&v36 + 1) = a1;
  int v18 = sub_1000CC02C(a1, a2, (uint64_t)&v35);
  unsigned int v19 = v37;
  sub_1000C321C(v35);
  if (!v18 || (v19 & 0x80000000) != 0) {
    goto LABEL_31;
  }
LABEL_19:
  int v20 = *(FILE **)(a1 + 32);
  if (v20)
  {
    int v21 = j__ftell(v20);
    uint64_t v22 = *(FILE **)(a1 + 32);
    long long v35 = 0u;
    *(void *)&long long v36 = 0;
    *((void *)&v36 + 1) = a1;
    uint64_t v37 = v19;
    if (v22)
    {
      if (!j__fseek(v22, v19, 0))
      {
        if (!sub_1000CBB24((uint64_t)&v35, *(_DWORD *)(a1 + 20))) {
          goto LABEL_54;
        }
        goto LABEL_39;
      }
LABEL_31:
      size_t v23 = 0xFFFFFFFFLL;
      goto LABEL_32;
    }
  }
  else
  {
    if (*(void *)(a1 + 40)) {
      int v21 = *(_DWORD *)(a1 + 48);
    }
    else {
      int v21 = -1;
    }
    long long v35 = 0u;
    *(void *)&long long v36 = 0;
    *((void *)&v36 + 1) = a1;
    uint64_t v37 = v19;
  }
  if ((signed int)v19 > *(_DWORD *)(a1 + 52)) {
    goto LABEL_31;
  }
  *(_DWORD *)(a1 + 48) = v19;
  if (!sub_1000CBB24((uint64_t)&v35, *(_DWORD *)(a1 + 20)))
  {
LABEL_54:
    size_t v23 = 0;
    goto LABEL_55;
  }
LABEL_39:
  sub_1000C321C(v35);
  *(void *)&long long v35 = 0;
  int v26 = HIDWORD(v35) - a3;
  if (HIDWORD(v35) - a3 >= a4) {
    int v26 = a4;
  }
  if (v26 < 1) {
    goto LABEL_54;
  }
  size_t v27 = v26 & ~(v26 >> 31);
  uint64_t v28 = (int)v37 + (uint64_t)a3 + (unsigned __int16)v36;
  uint64_t v29 = *(FILE **)(a1 + 32);
  if (v29)
  {
    size_t v23 = 0;
    if (j__fseek(v29, v28, 0)) {
      goto LABEL_55;
    }
    int v30 = *(FILE **)(a1 + 32);
    int v31 = *(unsigned __int16 *)(a1 + 16);
    if (v30)
    {
      size_t v23 = j__fread(a5, 1uLL, v27, v30);
      goto LABEL_53;
    }
  }
  else
  {
    if ((v28 & 0x80000000) != 0)
    {
      size_t v23 = 0;
      goto LABEL_60;
    }
    if ((int)v28 > *(_DWORD *)(a1 + 52)) {
      goto LABEL_54;
    }
    *(_DWORD *)(a1 + 48) = v28;
    int v31 = *(unsigned __int16 *)(a1 + 16);
  }
  uint64_t v32 = *(int *)(a1 + 48);
  int v33 = *(_DWORD *)(a1 + 52) - v32;
  if (v33 >= (int)v27) {
    size_t v23 = v27;
  }
  else {
    size_t v23 = v33;
  }
  memcpy(a5, (const void *)(*(void *)(a1 + 40) + v32), (int)v23);
  *(_DWORD *)(a1 + 48) += v23;
LABEL_53:
  if ((int)v23 < (int)v27) {
    goto LABEL_54;
  }
  if (v31 == 1) {
    sub_1000C0B28((uint64_t)a5, (int)v23, (uint64_t)a5);
  }
LABEL_55:
  uint64_t v34 = *(FILE **)(a1 + 32);
  if (v34)
  {
    j__fseek(v34, v21, 0);
    goto LABEL_32;
  }
LABEL_60:
  if ((v21 & 0x80000000) == 0 && v21 <= *(_DWORD *)(a1 + 52)) {
    *(_DWORD *)(a1 + 48) = v21;
  }
LABEL_32:
  int v24 = *(FILE **)(a1 + 32);
  if (v24)
  {
    j__fseek(v24, v11, 0);
  }
  else if ((v11 & 0x80000000) == 0 && *(_DWORD *)(a1 + 52) >= v11)
  {
    *(_DWORD *)(a1 + 48) = v11;
  }
  return v23;
}

size_t sub_1000CD23C(uint64_t a1, size_t __nitems, void *__dst)
{
  if ((int)__nitems < 1) {
    return 0;
  }
  uint64_t v4 = *(FILE **)(a1 + 32);
  if (v4) {
    return j__fread(__dst, 1uLL, __nitems, v4);
  }
  uint64_t v6 = *(int *)(a1 + 48);
  int v7 = *(_DWORD *)(a1 + 52) - v6;
  if (v7 >= (int)__nitems) {
    uint64_t v8 = __nitems;
  }
  else {
    uint64_t v8 = v7;
  }
  memcpy(__dst, (const void *)(*(void *)(a1 + 40) + v6), (int)v8);
  *(_DWORD *)(a1 + 48) += v8;
  return v8;
}

uint64_t sub_1000CD2DC(FILE *__stream, char *__ptr, int a3)
{
  if (!a3) {
    return j__fwrite(__ptr, 1uLL, 2uLL, __stream);
  }
  char v4 = *__ptr;
  *int8x8_t __ptr = __ptr[1];
  __ptr[1] = v4;
  uint64_t result = j__fwrite(__ptr, 1uLL, 2uLL, __stream);
  char v6 = *__ptr;
  *int8x8_t __ptr = __ptr[1];
  __ptr[1] = v6;
  return result;
}

uint64_t sub_1000CD350(uint64_t a1)
{
  uint64_t v1 = qword_1001069F8;
  qword_1001069F8 = a1;
  return v1;
}

uint64_t sub_1000CD364()
{
  return qword_1001069F8;
}

uint64_t sub_1000CD370(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_1001069F8) {
    return 0;
  }
  qword_1001069F8 = sub_1000C42C0(a1, a2, 0, a4, a5, a6, a7, a8);
  return 1;
}

uint64_t sub_1000CD3B8()
{
  uint64_t result = qword_1001069F8;
  if (qword_1001069F8) {
    uint64_t result = sub_1000C4364(qword_1001069F8);
  }
  qword_1001069F8 = 0;
  return result;
}

unint64_t sub_1000CD3E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!qword_1001069F8) {
    qword_1001069F8 = sub_1000C42C0(0x800uLL, 2048, 0, a4, a5, a6, a7, a8);
  }
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  sub_1000C3274(&v17, &v16);
  return sub_1000C4484(qword_1001069F8, v17 + a1 + v16, v9, v10, v11, v12, v13, v14);
}

void *sub_1000CD454(size_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!qword_1001069F8) {
    qword_1001069F8 = sub_1000C42C0(0x800uLL, 2048, 0, a4, a5, a6, a7, a8);
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  sub_1000C3274(&v18, &v17);
  int v15 = (void *)sub_1000C4484(qword_1001069F8, v18 + a1 + v17, v9, v10, v11, v12, v13, v14);
  bzero(v15, a1);
  return v15;
}

void *sub_1000CD4D0(void *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t result = sub_1000C3274(&v5, &v4);
    if (v5 + a2 + v4) {
      return (void *)sub_1000C458C(qword_1001069F8, v3, (int)v5 + (int)a2 + (int)v4);
    }
  }
  return result;
}

uint64_t sub_1000CD534(uint64_t a1)
{
  uint64_t result = qword_1001069F8;
  if (a1 || qword_1001069F8) {
    return sub_1000C466C(qword_1001069F8, a1);
  }
  return result;
}

uint64_t sub_1000CD550()
{
  uint64_t result = qword_1001069F8;
  if (qword_1001069F8) {
    return sub_1000C474C(qword_1001069F8);
  }
  return result;
}

uint64_t sub_1000CD564(int a1)
{
  int v1 = a1 - 1;
  if (a1 - 1) <= 9 && ((0x3EFu >> v1)) {
    return dword_1000FE150[14 * qword_1000F6580[v1] + 2];
  }
  else {
    return 0;
  }
}

uint64_t sub_1000CD5A8(unsigned int a1, int a2)
{
  if (a1 < 0x80)
  {
    int v3 = 0;
    return dword_1000FE150[14 * v3];
  }
  if (a1 < 0x100) {
    return 1;
  }
  if (a1 < 0x180) {
    return 1;
  }
  if (a1 < 0x370) {
    return 0;
  }
  if (a1 < 0x400) {
    return 2;
  }
  if (a1 < 0x500) {
    return 3;
  }
  if (a1 < 0x2000) {
    return 0;
  }
  unsigned int v4 = a1 >> 4;
  if (a1 >> 4 < 0x207) {
    return 4;
  }
  if (a1 >> 5 < 0x105) {
    return 0;
  }
  if (v4 < 0x20D) {
    return 0;
  }
  if (a1 < 0x3000) {
    return 0;
  }
  if (a1 >> 6 < 0xC1)
  {
    int v3 = 7;
    if (a1 == 12293 && a2 == 8) {
      return 8;
    }
    return dword_1000FE150[14 * v3];
  }
  if (a1 >> 5 < 0x185)
  {
    int v3 = 8;
    if ((unsigned __int16)(a1 - 12441) <= 3u && a2 == 7) {
      return 7;
    }
    return dword_1000FE150[14 * v3];
  }
  if (a1 >> 8 < 0x31)
  {
    int v3 = 9;
    if (a1 == 12540 && a2 == 6) {
      return 6;
    }
    return dword_1000FE150[14 * v3];
  }
  if (a1 >> 9 < 0x27) {
    return 0;
  }
  if (a1 >> 6 < 0x27F) {
    return 8;
  }
  if (a1 >> 10 < 0x2B) {
    return 0;
  }
  if (v4 < 0xD7B) {
    return 9;
  }
  if ((unsigned __int16)((unsigned __int16)(a1 + 16) >> 4) >= 0xFF1u) {
    return 10;
  }
  return 0;
}

uint64_t sub_1000CD818(unsigned int a1)
{
  if (a1 < 0x100) {
    return sub_1000C12B0(a1);
  }
  if (a1 < 0x180)
  {
    int v2 = 2;
  }
  else
  {
    if (a1 < 0x370) {
      return 0;
    }
    if (a1 < 0x400)
    {
      int v2 = 3;
    }
    else if (a1 < 0x500)
    {
      int v2 = 4;
    }
    else
    {
      if (a1 < 0x2000) {
        return 0;
      }
      unsigned int v1 = a1 >> 4;
      if (a1 >> 4 < 0x207)
      {
        int v2 = 5;
      }
      else
      {
        if (a1 >> 5 < 0x105) {
          return 0;
        }
        if (v1 < 0x20D)
        {
          int v2 = 6;
        }
        else
        {
          if (a1 < 0x3000) {
            return 0;
          }
          if (a1 >> 6 < 0xC1)
          {
            int v2 = 7;
          }
          else if (a1 >> 5 < 0x185)
          {
            int v2 = 8;
          }
          else if (a1 >> 8 < 0x31)
          {
            int v2 = 9;
          }
          else
          {
            if (a1 >> 9 < 0x27) {
              return 0;
            }
            if (a1 >> 6 < 0x27F)
            {
              int v2 = 10;
            }
            else
            {
              if (a1 >> 10 < 0x2B) {
                return 0;
              }
              if (v1 < 0xD7B)
              {
                int v2 = 11;
              }
              else
              {
                if ((unsigned __int16)((unsigned __int16)(a1 + 16) >> 4) < 0xFF1u) {
                  return 0;
                }
                int v2 = 12;
              }
            }
          }
        }
      }
    }
  }
  if (((0xFE3uLL >> v2) & 1) == 0) {
    return (*(uint64_t (**)(void))&dword_1000FE150[14 * v2 + 4])();
  }
  return 0;
}

uint64_t sub_1000CD950(unsigned int a1)
{
  if (a1 < 0x100) {
    return sub_1000C12D4(a1);
  }
  if (a1 < 0x180)
  {
    int v2 = 2;
  }
  else
  {
    if (a1 < 0x370) {
      return 0;
    }
    if (a1 < 0x400)
    {
      int v2 = 3;
    }
    else if (a1 < 0x500)
    {
      int v2 = 4;
    }
    else
    {
      if (a1 < 0x2000) {
        return 0;
      }
      unsigned int v1 = a1 >> 4;
      if (a1 >> 4 < 0x207)
      {
        int v2 = 5;
      }
      else
      {
        if (a1 >> 5 < 0x105) {
          return 0;
        }
        if (v1 < 0x20D)
        {
          int v2 = 6;
        }
        else
        {
          if (a1 < 0x3000) {
            return 0;
          }
          if (a1 >> 6 < 0xC1)
          {
            int v2 = 7;
          }
          else if (a1 >> 5 < 0x185)
          {
            int v2 = 8;
          }
          else if (a1 >> 8 < 0x31)
          {
            int v2 = 9;
          }
          else
          {
            if (a1 >> 9 < 0x27) {
              return 0;
            }
            if (a1 >> 6 < 0x27F)
            {
              int v2 = 10;
            }
            else
            {
              if (a1 >> 10 < 0x2B) {
                return 0;
              }
              if (v1 < 0xD7B)
              {
                int v2 = 11;
              }
              else
              {
                if ((unsigned __int16)((unsigned __int16)(a1 + 16) >> 4) < 0xFF1u) {
                  return 0;
                }
                int v2 = 12;
              }
            }
          }
        }
      }
    }
  }
  if (((0xFE3uLL >> v2) & 1) == 0) {
    return (*(uint64_t (**)(void))&dword_1000FE150[14 * v2 + 6])();
  }
  return 0;
}

uint64_t sub_1000CDA88(uint64_t result)
{
  if (result < 0x100) {
    return sub_1000C1300(result);
  }
  if (result < 0x180)
  {
    int v2 = 2;
  }
  else
  {
    if (result < 0x370) {
      return result;
    }
    if (result < 0x400)
    {
      int v2 = 3;
    }
    else if (result < 0x500)
    {
      int v2 = 4;
    }
    else
    {
      if (result < 0x2000) {
        return result;
      }
      unsigned int v1 = result >> 4;
      if (result >> 4 < 0x207)
      {
        int v2 = 5;
      }
      else
      {
        if (result >> 5 < 0x105) {
          return result;
        }
        if (v1 < 0x20D)
        {
          int v2 = 6;
        }
        else
        {
          if (result < 0x3000) {
            return result;
          }
          if (result >> 6 < 0xC1)
          {
            int v2 = 7;
          }
          else if (result >> 5 < 0x185)
          {
            int v2 = 8;
          }
          else if (result >> 8 < 0x31)
          {
            int v2 = 9;
          }
          else
          {
            if (result >> 9 < 0x27) {
              return result;
            }
            if (result >> 6 < 0x27F)
            {
              int v2 = 10;
            }
            else
            {
              if (result >> 10 < 0x2B) {
                return result;
              }
              if (v1 < 0xD7B)
              {
                int v2 = 11;
              }
              else
              {
                if ((unsigned __int16)((unsigned __int16)(result + 16) >> 4) < 0xFF1u) {
                  return result;
                }
                int v2 = 12;
              }
            }
          }
        }
      }
    }
  }
  if (((0xFE3uLL >> v2) & 1) == 0)
  {
    int v3 = *(uint64_t (**)(void))&dword_1000FE150[14 * v2 + 8];
    return v3();
  }
  return result;
}

uint64_t sub_1000CDBE4(uint64_t result)
{
  if (result < 0x80) {
    return sub_1000C1330(result);
  }
  if (result < 0x100)
  {
    if (result == 255) {
      return 376;
    }
    return sub_1000C1330(result);
  }
  if (result < 0x180)
  {
    int v2 = 2;
  }
  else
  {
    if (result < 0x370) {
      return result;
    }
    if (result < 0x400)
    {
      int v2 = 3;
    }
    else if (result < 0x500)
    {
      int v2 = 4;
    }
    else
    {
      if (result < 0x2000) {
        return result;
      }
      unsigned int v1 = result >> 4;
      if (result >> 4 < 0x207)
      {
        int v2 = 5;
      }
      else
      {
        if (result >> 5 < 0x105) {
          return result;
        }
        if (v1 < 0x20D)
        {
          int v2 = 6;
        }
        else
        {
          if (result < 0x3000) {
            return result;
          }
          if (result >> 6 < 0xC1)
          {
            int v2 = 7;
          }
          else if (result >> 5 < 0x185)
          {
            int v2 = 8;
          }
          else if (result >> 8 < 0x31)
          {
            int v2 = 9;
          }
          else
          {
            if (result >> 9 < 0x27) {
              return result;
            }
            if (result >> 6 < 0x27F)
            {
              int v2 = 10;
            }
            else
            {
              if (result >> 10 < 0x2B) {
                return result;
              }
              if (v1 < 0xD7B)
              {
                int v2 = 11;
              }
              else
              {
                if ((unsigned __int16)((unsigned __int16)(result + 16) >> 4) < 0xFF1u) {
                  return result;
                }
                int v2 = 12;
              }
            }
          }
        }
      }
    }
  }
  if (((0xFE3uLL >> v2) & 1) == 0)
  {
    int v3 = *(uint64_t (**)(void))&dword_1000FE150[14 * v2 + 10];
    return v3();
  }
  return result;
}

BOOL sub_1000CDD58(uint64_t a1)
{
  if (a1 >= 0x100)
  {
    if (a1 < 0x180)
    {
      int v3 = 2;
    }
    else
    {
      if (a1 < 0x370) {
        return 0;
      }
      if (a1 < 0x400)
      {
        int v3 = 3;
      }
      else if (a1 < 0x500)
      {
        int v3 = 4;
      }
      else
      {
        if (a1 < 0x2000) {
          return 0;
        }
        unsigned int v2 = a1 >> 4;
        if (a1 >> 4 < 0x207)
        {
          int v3 = 5;
        }
        else
        {
          if (a1 >> 5 < 0x105) {
            return 0;
          }
          if (v2 < 0x20D)
          {
            int v3 = 6;
          }
          else
          {
            if (a1 < 0x3000) {
              return 0;
            }
            if (a1 >> 6 < 0xC1)
            {
              int v3 = 7;
            }
            else if (a1 >> 5 < 0x185)
            {
              int v3 = 8;
            }
            else if (a1 >> 8 < 0x31)
            {
              int v3 = 9;
            }
            else
            {
              if (a1 >> 9 < 0x27) {
                return 0;
              }
              if (a1 >> 6 < 0x27F)
              {
                int v3 = 10;
              }
              else
              {
                if (a1 >> 10 < 0x2B) {
                  return 0;
                }
                if (v2 < 0xD7B)
                {
                  int v3 = 11;
                }
                else
                {
                  if ((unsigned __int16)((unsigned __int16)(a1 + 16) >> 4) < 0xFF1u) {
                    return 0;
                  }
                  int v3 = 12;
                }
              }
            }
          }
        }
      }
    }
    if (((0xFE3uLL >> v3) & 1) == 0) {
      return (*(unsigned int (**)(uint64_t))&dword_1000FE150[14 * v3 + 4])(a1)
    }
          || (*(unsigned int (**)(uint64_t))&dword_1000FE150[14 * v3 + 6])(a1) != 0;
    return 0;
  }
  return sub_1000C1360(a1);
}

BOOL sub_1000CDF18(unsigned int a1)
{
  if (a1 > 0xFF) {
    return (unsigned __int16)(a1 + 240) < 0xAu;
  }
  else {
    return sub_1000C13A8(a1);
  }
}

uint64_t sub_1000CDF3C(int a1)
{
  if (a1 <= 0xFF)
  {
    if ((a1 & 0x80) == 0) {
      return (byte_1000F6054[a1] >> 4) & 1;
    }
    return 0;
  }
  unsigned int v3 = a1 - 0x2000;
  uint64_t result = 1;
  if (v3 >= 0xC)
  {
    if (a1 < 12288)
    {
      if (a1 == 8239 || a1 == 8287) {
        return result;
      }
      return 0;
    }
    if (a1 != 12288 && a1 != 12351) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000CDFAC(unsigned int a1)
{
  if (a1 < 0x100) {
    return sub_1000C1360(a1);
  }
  if (a1 < 0x180)
  {
    int v2 = 2;
  }
  else
  {
    if (a1 < 0x370) {
      return 0;
    }
    if (a1 < 0x400)
    {
      int v2 = 3;
    }
    else if (a1 < 0x500)
    {
      int v2 = 4;
    }
    else
    {
      if (a1 < 0x2000) {
        return 0;
      }
      unsigned int v1 = a1 >> 4;
      if (a1 >> 4 < 0x207)
      {
        int v2 = 5;
      }
      else
      {
        if (a1 >> 5 < 0x105) {
          return 0;
        }
        if (v1 < 0x20D)
        {
          int v2 = 6;
        }
        else
        {
          if (a1 < 0x3000) {
            return 0;
          }
          if (a1 >> 6 < 0xC1)
          {
            int v2 = 7;
          }
          else if (a1 >> 5 < 0x185)
          {
            int v2 = 8;
          }
          else if (a1 >> 8 < 0x31)
          {
            int v2 = 9;
          }
          else
          {
            if (a1 >> 9 < 0x27) {
              return 0;
            }
            if (a1 >> 6 < 0x27F)
            {
              int v2 = 10;
            }
            else
            {
              if (a1 >> 10 < 0x2B) {
                return 0;
              }
              if (v1 < 0xD7B)
              {
                int v2 = 11;
              }
              else
              {
                if ((unsigned __int16)((unsigned __int16)(a1 + 16) >> 4) < 0xFF1u) {
                  return 0;
                }
                int v2 = 12;
              }
            }
          }
        }
      }
    }
  }
  if (((0x43uLL >> v2) & 1) == 0) {
    return (*(uint64_t (**)(void))&dword_1000FE150[14 * v2 + 12])();
  }
  return 0;
}

BOOL sub_1000CE0E4(int a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0) {
    return 0;
  }
  if (a3 < 0x80)
  {
    int v5 = 0;
  }
  else if (a3 < 0x100)
  {
    int v5 = 1;
  }
  else if (a3 < 0x180)
  {
    int v5 = 2;
  }
  else
  {
    if (a3 < 0x370) {
      return 0;
    }
    if (a3 < 0x400)
    {
      int v5 = 3;
    }
    else if (a3 < 0x500)
    {
      int v5 = 4;
    }
    else
    {
      if (a3 < 0x2000) {
        return 0;
      }
      unsigned int v4 = a3 >> 4;
      if (a3 >> 4 < 0x207)
      {
        int v5 = 5;
      }
      else
      {
        if (a3 >> 5 < 0x105) {
          return 0;
        }
        if (v4 < 0x20D)
        {
          int v5 = 6;
        }
        else
        {
          if (a3 < 0x3000) {
            return 0;
          }
          if (a3 >> 6 < 0xC1)
          {
            int v5 = 7;
          }
          else if (a3 >> 5 < 0x185)
          {
            int v5 = 8;
          }
          else if (a3 >> 8 < 0x31)
          {
            int v5 = 9;
          }
          else
          {
            if (a3 >> 9 < 0x27) {
              return 0;
            }
            if (a3 >> 6 < 0x27F)
            {
              int v5 = 10;
            }
            else
            {
              if (a3 >> 10 < 0x2B) {
                return 0;
              }
              if (v4 < 0xD7B)
              {
                int v5 = 11;
              }
              else
              {
                if ((unsigned __int16)((unsigned __int16)(a3 + 16) >> 4) < 0xFF1u) {
                  return 0;
                }
                int v5 = 12;
              }
            }
          }
        }
      }
    }
  }
  unsigned int v6 = dword_1000FE150[14 * v5];
  if (a2 == 12540 && v6 == 6
    || (unsigned __int16)(a2 - 12441) <= 3u && v6 == 7
    || a2 == 12293 && v6 == 8
    || dword_1000FE150[14 * a1] == v6)
  {
    switch(v6)
    {
      case 1u:
      case 2u:
      case 3u:
        if (a2 > 0xFF)
        {
          if (!a1
            || ((0x43uLL >> a1) & 1) != 0
            || !(*(unsigned int (**)(uint64_t))&dword_1000FE150[14 * a1 + 12])(a2))
          {
            return 0;
          }
        }
        else if (!sub_1000C1360(a2))
        {
          return 0;
        }
        if (a3 <= 0xFF) {
          return sub_1000C1360(a3);
        }
        if (((0x43uLL >> v5) & 1) == 0 && (*(unsigned int (**)(uint64_t))&dword_1000FE150[14 * v5 + 12])(a3)) {
          return 1;
        }
        break;
      case 6u:
        BOOL result = 1;
        switch((int)a2)
        {
          case 12353:
          case 12355:
          case 12357:
          case 12359:
          case 12361:
          case 12419:
          case 12421:
          case 12423:
          case 12430:
          case 12435:
          case 12441:
          case 12442:
          case 12443:
          case 12444:
          case 12445:
          case 12446:
            return result;
          case 12354:
          case 12356:
          case 12358:
          case 12360:
          case 12362:
          case 12363:
          case 12364:
          case 12365:
          case 12366:
          case 12367:
          case 12368:
          case 12369:
          case 12370:
          case 12371:
          case 12372:
          case 12373:
          case 12374:
          case 12375:
          case 12376:
          case 12377:
          case 12378:
          case 12379:
          case 12380:
          case 12381:
          case 12382:
          case 12383:
          case 12384:
          case 12385:
          case 12386:
          case 12387:
          case 12388:
          case 12389:
          case 12390:
          case 12391:
          case 12392:
          case 12393:
          case 12394:
          case 12395:
          case 12396:
          case 12397:
          case 12398:
          case 12399:
          case 12400:
          case 12401:
          case 12402:
          case 12403:
          case 12404:
          case 12405:
          case 12406:
          case 12407:
          case 12408:
          case 12409:
          case 12410:
          case 12411:
          case 12412:
          case 12413:
          case 12414:
          case 12415:
          case 12416:
          case 12417:
          case 12418:
          case 12420:
          case 12422:
          case 12424:
          case 12425:
          case 12426:
          case 12427:
          case 12428:
          case 12429:
          case 12431:
          case 12432:
          case 12433:
          case 12434:
          case 12436:
          case 12437:
          case 12438:
          case 12439:
          case 12440:
            return 0;
          default:
            if (a2 != 12540) {
              return 0;
            }
            break;
        }
        return result;
      case 7u:
        BOOL result = 1;
        switch((int)a2)
        {
          case 12441:
          case 12442:
          case 12443:
          case 12444:
          case 12449:
          case 12451:
          case 12453:
          case 12455:
          case 12457:
          case 12515:
          case 12517:
          case 12519:
          case 12526:
          case 12531:
          case 12540:
          case 12541:
          case 12542:
            return result;
          default:
            return 0;
        }
        return result;
      case 8u:
        return a2 == 12293;
      default:
        return 0;
    }
  }
  return 0;
}

uint64_t sub_1000CE750(int a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0) {
    return 0;
  }
  if (a3 < 0x80)
  {
    int v5 = 0;
LABEL_26:
    unsigned int v7 = dword_1000FE150[14 * a1];
    goto LABEL_27;
  }
  if (a3 < 0x100)
  {
    int v5 = 1;
    goto LABEL_26;
  }
  if (a3 < 0x180)
  {
    int v5 = 2;
    goto LABEL_26;
  }
  if (a3 < 0x370) {
    return 0;
  }
  if (a3 < 0x400)
  {
    int v5 = 3;
    goto LABEL_26;
  }
  if (a3 < 0x500)
  {
    int v5 = 4;
    goto LABEL_26;
  }
  if (a3 < 0x2000) {
    return 0;
  }
  unsigned int v4 = a3 >> 4;
  if (a3 >> 4 < 0x207)
  {
    int v5 = 5;
    goto LABEL_26;
  }
  if (a3 >> 5 < 0x105) {
    return 0;
  }
  if (v4 < 0x20D)
  {
    int v5 = 6;
    goto LABEL_26;
  }
  if (a3 < 0x3000) {
    return 0;
  }
  if (a3 >> 6 < 0xC1)
  {
    unsigned int v7 = dword_1000FE150[14 * a1];
    int v5 = 7;
    if (a3 == 12293 && v7 == 8) {
      return 0;
    }
  }
  else if (a3 >> 5 < 0x185)
  {
    unsigned int v7 = dword_1000FE150[14 * a1];
    int v5 = 8;
    if ((unsigned __int16)(a3 - 12441) <= 3u && v7 == 7) {
      return a2 == 12483;
    }
  }
  else
  {
    if (a3 >> 8 >= 0x31)
    {
      if (a3 >> 9 < 0x27) {
        return 0;
      }
      if (a3 >> 6 < 0x27F)
      {
        int v5 = 10;
      }
      else
      {
        if (a3 >> 10 < 0x2B) {
          return 0;
        }
        if (v4 < 0xD7B)
        {
          int v5 = 11;
        }
        else
        {
          if ((unsigned __int16)((unsigned __int16)(a3 + 16) >> 4) < 0xFF1u) {
            return 0;
          }
          int v5 = 12;
        }
      }
      goto LABEL_26;
    }
    unsigned int v7 = dword_1000FE150[14 * a1];
    int v5 = 9;
    if (a3 == 12540 && v7 == 6) {
      return a2 == 12387;
    }
  }
LABEL_27:
  if (v7 != dword_1000FE150[14 * v5]) {
    return 0;
  }
  if (v7 - 1 < 3)
  {
    if (a2 > 0xFF)
    {
      if (!a1
        || ((0x43uLL >> a1) & 1) != 0
        || !(*(unsigned int (**)(uint64_t))&dword_1000FE150[14 * a1 + 12])(a2))
      {
        return 0;
      }
    }
    else if (!sub_1000C1360(a2))
    {
      return 0;
    }
    if (a3 > 0xFF)
    {
      if (!v5
        || ((0x43uLL >> v5) & 1) != 0
        || !(*(unsigned int (**)(uint64_t))&dword_1000FE150[14 * v5 + 12])(a3))
      {
        return 0;
      }
    }
    else if (!sub_1000C1360(a3))
    {
      return 0;
    }
    return 1;
  }
  if (v7 == 7) {
    return a2 == 12483;
  }
  if (v7 == 6) {
    return a2 == 12387;
  }
  return 0;
}

uint64_t sub_1000CEA38(uint64_t result, int a2, uint64_t a3, uint64_t a4, unsigned int *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11)
{
  uint64_t v16 = result;
  if (result < 0x80)
  {
    int v18 = 0;
    goto LABEL_9;
  }
  if (result < 0x100)
  {
    int v18 = 1;
    goto LABEL_9;
  }
  if (result < 0x180)
  {
    int v18 = 2;
    goto LABEL_9;
  }
  if (result < 0x370)
  {
LABEL_5:
    unsigned int v17 = 0;
    int v18 = -1;
    goto LABEL_10;
  }
  if (result < 0x400)
  {
    int v18 = 3;
    goto LABEL_9;
  }
  if (result < 0x500)
  {
    int v18 = 4;
    goto LABEL_9;
  }
  if (result < 0x2000) {
    goto LABEL_5;
  }
  unsigned int v19 = result >> 4;
  if (result >> 4 < 0x207)
  {
    int v18 = 5;
    goto LABEL_9;
  }
  if (result >> 5 < 0x105) {
    goto LABEL_5;
  }
  if (v19 < 0x20D)
  {
    int v18 = 6;
    goto LABEL_9;
  }
  if (result < 0x3000) {
    goto LABEL_5;
  }
  if (result >> 6 < 0xC1)
  {
    int v18 = 7;
    if (result == 12293 && a2 == 8)
    {
      unsigned int v17 = 8;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (result >> 5 < 0x185)
  {
    int v18 = 8;
    if ((unsigned __int16)(result - 12441) <= 3u && a2 == 7)
    {
      unsigned int v17 = 7;
      goto LABEL_10;
    }
LABEL_9:
    unsigned int v17 = dword_1000FE150[14 * v18];
    goto LABEL_10;
  }
  if (result >> 8 >= 0x31)
  {
    if (result >> 9 < 0x27) {
      goto LABEL_5;
    }
    if (result >> 6 < 0x27F)
    {
      int v18 = 10;
    }
    else
    {
      if (result >> 10 < 0x2B) {
        goto LABEL_5;
      }
      if (v19 < 0xD7B)
      {
        int v18 = 11;
      }
      else
      {
        if ((unsigned __int16)((unsigned __int16)(result + 16) >> 4) < 0xFF1u) {
          goto LABEL_5;
        }
        int v18 = 12;
      }
    }
    goto LABEL_9;
  }
  int v18 = 9;
  if (result != 12540 || a2 != 6) {
    goto LABEL_9;
  }
  unsigned int v17 = 6;
LABEL_10:
  *a5 = v17;
  if (a6)
  {
    if (result > 0xFF)
    {
      if (v18 < 1 || ((0xFE3uLL >> v18) & 1) != 0) {
        BOOL result = 0;
      }
      else {
        BOOL result = (*(uint64_t (**)(uint64_t))&dword_1000FE150[14 * v18 + 4])(result);
      }
    }
    else
    {
      BOOL result = sub_1000C12B0(result);
    }
    *a6 = result;
  }
  if (a7)
  {
    if (v16 > 0xFF)
    {
      if (v18 < 1 || ((0xFE3uLL >> v18) & 1) != 0) {
        BOOL result = 0;
      }
      else {
        BOOL result = (*(uint64_t (**)(uint64_t))&dword_1000FE150[14 * v18 + 6])(v16);
      }
    }
    else
    {
      BOOL result = sub_1000C12D4(v16);
    }
    *a7 = result;
  }
  if (a8)
  {
    if (v16 > 0xFF) {
      BOOL result = (unsigned __int16)(v16 + 240) < 0xAu;
    }
    else {
      BOOL result = sub_1000C13A8(v16);
    }
    *a8 = result;
  }
  if (a9)
  {
    if (v16 > 0xFF)
    {
      if (v18 < 1 || ((0x43uLL >> v18) & 1) != 0) {
        BOOL result = 0;
      }
      else {
        BOOL result = (*(uint64_t (**)(uint64_t))&dword_1000FE150[14 * v18 + 12])(v16);
      }
    }
    else
    {
      BOOL result = sub_1000C1360(v16);
    }
    *a9 = result;
  }
  if (a10)
  {
    BOOL result = sub_1000CE0E4(v18, v16, a3);
    *a10 = result;
  }
  if (a11)
  {
    BOOL result = sub_1000CE750(v18, v16, a4);
    *a11 = result;
  }
  return result;
}

unint64_t sub_1000CED6C(unint64_t result)
{
  if (result)
  {
    unsigned int v1 = (unsigned __int16 *)result;
    LODWORD(result) = -1;
    do
    {
      int v2 = *v1++;
      BOOL result = (result + 1);
    }
    while (v2);
  }
  return result;
}

BOOL sub_1000CED88(_WORD *a1, __int16 *a2, int a3)
{
  uint64_t v3 = 0;
  if (!a1 || a3 < 1) {
    return v3;
  }
  if (a3 == 1)
  {
    *a1 = 0;
    return !a2 || !*a2;
  }
  if (a2)
  {
    __int16 v5 = *a2;
    if (*a2)
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = v6;
        a1[v7] = v5;
        ++v6;
        __int16 v5 = a2[v7 + 1];
        if (v5) {
          BOOL v8 = v6 >= (a3 - 1);
        }
        else {
          BOOL v8 = 1;
        }
      }
      while (!v8);
      uint64_t v9 = v6;
      a1[v9] = 0;
      return a2[v9] == 0;
    }
    else
    {
      *a1 = 0;
      return *a2 == 0;
    }
  }
  else
  {
    *a1 = 0;
    return 0;
  }
}

uint64_t sub_1000CEE30(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 < 1) {
    return 1;
  }
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    uint64_t v4 = 0;
    if (a3 < 0x10) {
      goto LABEL_9;
    }
    if ((unint64_t)(a1 - a2) < 0x20) {
      goto LABEL_9;
    }
    uint64_t v4 = a3 & 0x7FFFFFF0;
    __int16 v5 = (long long *)(a2 + 16);
    unint64_t v6 = (_OWORD *)(a1 + 16);
    uint64_t v7 = a3 & 0xFFFFFFF0;
    do
    {
      long long v8 = *v5;
      *(v6 - 1) = *(v5 - 1);
      *unint64_t v6 = v8;
      v5 += 2;
      v6 += 2;
      v7 -= 16;
    }
    while (v7);
    if (v4 != a3)
    {
LABEL_9:
      uint64_t v9 = (_WORD *)(a1 + 2 * v4);
      uint64_t v10 = (__int16 *)(a2 + 2 * v4);
      uint64_t v11 = a3 - v4;
      do
      {
        __int16 v12 = *v10++;
        *v9++ = v12;
        --v11;
      }
      while (v11);
    }
    return 1;
  }
  return v3;
}

uint64_t sub_1000CEEBC(unsigned __int16 *a1, unsigned __int16 *a2, int a3)
{
  if (!a1) {
    return 0;
  }
  int v3 = -1;
  uint64_t v4 = 0xFFFFFFFF00000000;
  __int16 v5 = a1;
  do
  {
    int v6 = *v5++;
    ++v3;
    v4 += (uint64_t)&_mh_execute_header;
  }
  while (v6);
  if (!a2 || v3 + 1 >= a3) {
    return 0;
  }
  unsigned __int16 v7 = *a2;
  if (*a2)
  {
    uint64_t v8 = 0;
    int v9 = a3 - 1;
    uint64_t v10 = v4 >> 32;
    if (v3 > a3 - 1) {
      int v9 = v3;
    }
    uint64_t v11 = (v9 - v3);
    __int16 v12 = &a1[v10];
    while (v11 != v8)
    {
      uint64_t v13 = v8;
      v12[v13] = v7;
      ++v8;
      unsigned __int16 v7 = a2[v13 + 1];
      if (!v7)
      {
        LODWORD(v11) = v8;
        break;
      }
    }
    a1[(int)v11 + v3] = 0;
    return 1;
  }
  else
  {
    a1[v3] = 0;
    return 1;
  }
}

uint64_t sub_1000CEF6C(unsigned __int16 *a1, unsigned char *a2, int a3)
{
  if (!a1) {
    return 0;
  }
  int v3 = -1;
  uint64_t v4 = 0xFFFFFFFF00000000;
  __int16 v5 = a1;
  do
  {
    int v6 = *v5++;
    ++v3;
    v4 += (uint64_t)&_mh_execute_header;
  }
  while (v6);
  if (!a2 || v3 + 1 >= a3) {
    return 0;
  }
  LOBYTE(v7) = *a2;
  if (*a2)
  {
    uint64_t v8 = 0;
    int v9 = a3 - 1;
    uint64_t v10 = v4 >> 32;
    if (v3 > a3 - 1) {
      int v9 = v3;
    }
    uint64_t v11 = (v9 - v3);
    __int16 v12 = &a1[v10];
    while (v11 != v8)
    {
      v12[v8] = v7;
      int v13 = v8 + 1;
      int v7 = a2[++v8];
      if (!v7)
      {
        LODWORD(v11) = v13;
        break;
      }
    }
    a1[(int)v11 + v3] = 0;
    return 1;
  }
  else
  {
    a1[v3] = 0;
    return 1;
  }
}

unsigned __int16 *sub_1000CF020(unsigned __int16 *result, int a2)
{
  if (result)
  {
    int v2 = *result;
    if (*result)
    {
      while (v2 != a2)
      {
        int v3 = result[1];
        ++result;
        int v2 = v3;
        if (!v3) {
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

char *sub_1000CF044(char *a1, _WORD *a2, char **a3)
{
  if (a1)
  {
    int v3 = a1;
    if (a2)
    {
      uint64_t v4 = a1;
      do
      {
        if (!*(_WORD *)v4) {
          break;
        }
        int v5 = (unsigned __int16)*a2;
        if (!*a2) {
          break;
        }
        int v6 = a2 + 1;
        do
        {
          int v7 = v5;
          int v8 = *(unsigned __int16 *)v4;
          v4 += 2 * (v8 == v5);
          int v9 = *v6++;
          int v5 = v9;
          if (v9) {
            BOOL v10 = v8 == v7;
          }
          else {
            BOOL v10 = 1;
          }
        }
        while (!v10);
      }
      while (v8 == v7);
      uint64_t v11 = v4 - a1;
      BOOL result = &a1[v11 << 31 >> 31];
      int v13 = *(unsigned __int16 *)result;
      if (*(_WORD *)result)
      {
        if (*a2)
        {
          uint64_t v14 = &v3[v11 << 31 >> 31];
LABEL_16:
          int v15 = a2 + 1;
          int v16 = (unsigned __int16)*a2;
          while (v13 != v16)
          {
            int v17 = *v15++;
            int v16 = v17;
            if (!v17)
            {
              int v18 = *((unsigned __int16 *)v14 + 1);
              v14 += 2;
              int v13 = v18;
              if (v18) {
                goto LABEL_16;
              }
              goto LABEL_48;
            }
          }
          if (v13) {
            goto LABEL_55;
          }
        }
        else
        {
          uint64_t v32 = &v3[2 * (int)(v11 >> 1) + 2];
          do
          {
            int v33 = *(unsigned __int16 *)v32;
            v32 += 2;
          }
          while (v33);
        }
LABEL_48:
        int v3 = result;
        goto LABEL_49;
      }
    }
    else if (*(_WORD *)a1)
    {
LABEL_49:
      *a3 = 0;
      uint64_t v34 = v3 - 2;
      do
      {
        int v35 = *((unsigned __int16 *)v34 + 1);
        v34 += 2;
      }
      while (v35);
      goto LABEL_62;
    }
LABEL_53:
    BOOL result = 0;
    *a3 = 0;
    return result;
  }
  int v3 = *a3;
  if (!*a3) {
    return 0;
  }
  if (a2)
  {
    unsigned int v19 = *a3;
    do
    {
      if (!*(_WORD *)v19) {
        break;
      }
      int v20 = (unsigned __int16)*a2;
      if (!*a2) {
        break;
      }
      int v21 = a2 + 1;
      do
      {
        int v22 = v20;
        int v23 = *(unsigned __int16 *)v19;
        v19 += 2 * (v23 == v20);
        int v24 = *v21++;
        int v20 = v24;
        if (v24) {
          BOOL v25 = v23 == v22;
        }
        else {
          BOOL v25 = 1;
        }
      }
      while (!v25);
    }
    while (v23 == v22);
    uint64_t v26 = v19 - v3;
    BOOL result = &v3[v26 << 31 >> 31];
    int v27 = *(unsigned __int16 *)result;
    if (!*(_WORD *)result) {
      goto LABEL_53;
    }
    if (*a2)
    {
      uint64_t v14 = &v3[v26 << 31 >> 31];
LABEL_36:
      uint64_t v28 = a2 + 1;
      int v29 = (unsigned __int16)*a2;
      while (v27 != v29)
      {
        int v30 = *v28++;
        int v29 = v30;
        if (!v30)
        {
          int v31 = *((unsigned __int16 *)v14 + 1);
          v14 += 2;
          int v27 = v31;
          if (v31) {
            goto LABEL_36;
          }
          goto LABEL_59;
        }
      }
      if (!v27) {
        goto LABEL_59;
      }
LABEL_55:
      *a3 = v14 + 2;
      unint64_t v36 = v14 - result;
      if ((int)((unint64_t)(v14 - result) >> 1) >= 1) {
        goto LABEL_63;
      }
      return result;
    }
    uint64_t v37 = &v3[2 * (int)(v26 >> 1) + 2];
    do
    {
      int v38 = *(unsigned __int16 *)v37;
      v37 += 2;
    }
    while (v38);
LABEL_59:
    int v3 = result;
  }
  else if (!*(_WORD *)v3)
  {
    goto LABEL_53;
  }
  *a3 = 0;
  uint64_t v34 = v3 - 2;
  do
  {
    int v39 = *((unsigned __int16 *)v34 + 1);
    v34 += 2;
  }
  while (v39);
LABEL_62:
  BOOL result = v3;
  unint64_t v36 = v34 - v3;
  if ((int)(v36 >> 1) >= 1) {
LABEL_63:
  }
    *(_WORD *)&result[v36 & 0x1FFFFFFFELL] = 0;
  return result;
}

uint64_t sub_1000CF240(char *a1, _WORD *a2)
{
  int v27 = 0;
  uint64_t v26 = 0;
  uint64_t result = (uint64_t)sub_1000CF3A8(a1, a2, &v26, &v27);
  if (result)
  {
    uint64_t v4 = v26;
    if (a2)
    {
      int v5 = 0;
      if (v26)
      {
        do
        {
          int v6 = v4;
          do
          {
            if (!*(_WORD *)v6) {
              break;
            }
            int v7 = (unsigned __int16)*a2;
            if (!*a2) {
              break;
            }
            int v8 = a2 + 1;
            do
            {
              int v9 = v7;
              int v10 = *(unsigned __int16 *)v6;
              v6 += 2 * (v10 == v7);
              int v11 = *v8++;
              int v7 = v11;
              if (v11) {
                BOOL v12 = v10 == v9;
              }
              else {
                BOOL v12 = 1;
              }
            }
            while (!v12);
          }
          while (v10 == v9);
          uint64_t v13 = v6 - v4;
          uint64_t v14 = &v4[(v6 - v4) << 31 >> 31];
          int v15 = *(unsigned __int16 *)v14;
          if (!*(_WORD *)v14) {
            break;
          }
          uint64_t v16 = (int)(v13 >> 1);
          if (!*a2)
          {
            int v22 = &v4[2 * v16 + 2];
            do
            {
              int v23 = *(unsigned __int16 *)v22;
              v22 += 2;
            }
            while (v23);
LABEL_27:
            uint64_t v26 = 0;
            uint64_t v24 = (uint64_t)&v4[2 * v16 - 2];
            do
            {
              int v25 = *(unsigned __int16 *)(v24 + 2);
              v24 += 2;
            }
            while (v25);
            int v27 = (unint64_t)(v24 - (void)v14) >> 1;
            return (++v5 + 1);
          }
          int v17 = v14;
LABEL_20:
          int v18 = a2 + 1;
          int v19 = (unsigned __int16)*a2;
          while (v15 != v19)
          {
            int v20 = *v18++;
            int v19 = v20;
            if (!v20)
            {
              int v21 = *((unsigned __int16 *)v17 + 1);
              v17 += 2;
              int v15 = v21;
              if (v21) {
                goto LABEL_20;
              }
              goto LABEL_27;
            }
          }
          if (!v15) {
            goto LABEL_27;
          }
          uint64_t v4 = v17 + 2;
          uint64_t v26 = v17 + 2;
          int v27 = (unint64_t)(v17 - v14) >> 1;
          ++v5;
        }
        while (v17 != (char *)-2);
      }
      return (v5 + 1);
    }
    else
    {
      uint64_t result = 1;
      if (v26)
      {
        if (*(_WORD *)v26) {
          return 2;
        }
        else {
          return 1;
        }
      }
    }
  }
  return result;
}

char *sub_1000CF3A8(char *a1, _WORD *a2, char **a3, _DWORD *a4)
{
  if (a1)
  {
    uint64_t v4 = a1;
    if (a2)
    {
      int v5 = a1;
      do
      {
        if (!*(_WORD *)v5) {
          break;
        }
        int v6 = (unsigned __int16)*a2;
        if (!*a2) {
          break;
        }
        int v7 = a2 + 1;
        do
        {
          int v8 = v6;
          int v9 = *(unsigned __int16 *)v5;
          v5 += 2 * (v9 == v6);
          int v10 = *v7++;
          int v6 = v10;
          if (v10) {
            BOOL v11 = v9 == v8;
          }
          else {
            BOOL v11 = 1;
          }
        }
        while (!v11);
      }
      while (v9 == v8);
      uint64_t v12 = v5 - a1;
      uint64_t result = &a1[(v5 - a1) << 31 >> 31];
      int v14 = *(unsigned __int16 *)result;
      if (*(_WORD *)result)
      {
        if (*a2)
        {
          int v15 = result;
LABEL_16:
          uint64_t v16 = a2 + 1;
          int v17 = (unsigned __int16)*a2;
          while (v14 != v17)
          {
            int v18 = *v16++;
            int v17 = v18;
            if (!v18)
            {
              int v19 = *((unsigned __int16 *)v15 + 1);
              v15 += 2;
              int v14 = v19;
              if (v19) {
                goto LABEL_16;
              }
              goto LABEL_48;
            }
          }
          if (!v14) {
            goto LABEL_48;
          }
          *a3 = v15 + 2;
          *a4 = (unint64_t)(v15 - result) >> 1;
          return result;
        }
        uint64_t v34 = &v4[2 * (int)(v12 >> 1) + 2];
        do
        {
          int v35 = *(unsigned __int16 *)v34;
          v34 += 2;
        }
        while (v35);
LABEL_48:
        uint64_t v4 = result;
        goto LABEL_49;
      }
    }
    else if (*(_WORD *)a1)
    {
LABEL_49:
      uint64_t v36 = 0;
      *a3 = 0;
      while (*(unsigned __int16 *)&v4[2 * v36++])
        ;
LABEL_61:
      uint64_t result = v4;
      *a4 = v36 - 1;
      return result;
    }
LABEL_53:
    uint64_t result = 0;
    *a3 = 0;
    *a4 = 0;
    return result;
  }
  uint64_t v4 = *a3;
  if (!*a3)
  {
    uint64_t result = 0;
    *a4 = 0;
    return result;
  }
  if (!a2)
  {
    if (!*(_WORD *)v4) {
      goto LABEL_53;
    }
LABEL_59:
    uint64_t v36 = 0;
    *a3 = 0;
    while (*(unsigned __int16 *)&v4[2 * v36++])
      ;
    goto LABEL_61;
  }
  int v20 = *a3;
  do
  {
    if (!*(_WORD *)v20) {
      break;
    }
    int v21 = (unsigned __int16)*a2;
    if (!*a2) {
      break;
    }
    int v22 = a2 + 1;
    do
    {
      int v23 = v21;
      int v24 = *(unsigned __int16 *)v20;
      v20 += 2 * (v24 == v21);
      int v25 = *v22++;
      int v21 = v25;
      if (v25) {
        BOOL v26 = v24 == v23;
      }
      else {
        BOOL v26 = 1;
      }
    }
    while (!v26);
  }
  while (v24 == v23);
  uint64_t v27 = v20 - v4;
  uint64_t result = &v4[(v20 - v4) << 31 >> 31];
  int v28 = *(unsigned __int16 *)result;
  if (!*(_WORD *)result) {
    goto LABEL_53;
  }
  if (!*a2)
  {
    int v38 = &v4[2 * (int)(v27 >> 1) + 2];
    do
    {
      int v39 = *(unsigned __int16 *)v38;
      v38 += 2;
    }
    while (v39);
LABEL_58:
    uint64_t v4 = result;
    goto LABEL_59;
  }
  int v29 = result;
LABEL_36:
  int v30 = a2 + 1;
  int v31 = (unsigned __int16)*a2;
  while (v28 != v31)
  {
    int v32 = *v30++;
    int v31 = v32;
    if (!v32)
    {
      int v33 = *((unsigned __int16 *)v29 + 1);
      v29 += 2;
      int v28 = v33;
      if (v33) {
        goto LABEL_36;
      }
      goto LABEL_58;
    }
  }
  if (!v28) {
    goto LABEL_58;
  }
  *a3 = v29 + 2;
  *a4 = (unint64_t)(v29 - result) >> 1;
  return result;
}

unsigned __int16 *sub_1000CF5BC(unsigned __int16 *a1, _WORD *a2)
{
  if (a2)
  {
    int v2 = (unsigned __int16)*a2;
    if (*a2)
    {
      uint64_t v3 = 0;
      while (a2[++v3])
        ;
      if (a1)
      {
        unint64_t v5 = (unint64_t)(v3 * 2) >> 1;
        if ((int)((unint64_t)(v3 * 2) >> 1) >= 2)
        {
          while (1)
          {
            do
            {
              int v6 = a1;
              int v8 = *a1++;
              int v7 = v8;
              if (v8) {
                BOOL v9 = v7 == v2;
              }
              else {
                BOOL v9 = 1;
              }
            }
            while (!v9);
            if (!v7) {
              return 0;
            }
            uint64_t v10 = 1;
            while (v6[v10] == (unsigned __int16)a2[v10])
            {
              if (++v10 >= (int)v5)
              {
                LODWORD(v10) = v5;
                break;
              }
            }
            if (v10 == v5) {
              return v6;
            }
          }
        }
        if (v5 == 1)
        {
          uint64_t v12 = a1 - 1;
          do
          {
            int v14 = v12[1];
            ++v12;
            int v13 = v14;
            if (v14) {
              BOOL v15 = v13 == v2;
            }
            else {
              BOOL v15 = 1;
            }
          }
          while (!v15);
          if (v13) {
            return v12;
          }
          else {
            return 0;
          }
        }
        while (*a1++)
          ;
      }
      return 0;
    }
  }
  return a1;
}

uint64_t sub_1000CF684(_WORD *a1, _WORD *a2)
{
  if (a1)
  {
    if (a2)
    {
      while (1)
      {
        unsigned int v2 = (unsigned __int16)*a1;
        unsigned int v3 = (unsigned __int16)*a2;
        if (!*a1) {
          break;
        }
        ++a1;
        ++a2;
        if (v2 != v3)
        {
          if (v2 < v3) {
            return 0xFFFFFFFFLL;
          }
          else {
            return 1;
          }
        }
      }
      if (*a2) {
        return 0xFFFFFFFFLL;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  else if (a2)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_1000CF6D4(_WORD *a1, unsigned __int16 *a2)
{
  unsigned int v2 = a2;
  if (a1)
  {
    if (!a2) {
      return 1;
    }
    for (int64_t i = a1; ; ++i)
    {
      uint64_t v5 = (unsigned __int16)*i;
      uint64_t v4 = *v2;
      if (!*i)
      {
        BOOL v16 = v4 == 0;
        goto LABEL_133;
      }
      if (v5 < 0x100)
      {
        if (!sub_1000C12D4(*i)) {
          goto LABEL_53;
        }
        int v8 = sub_1000C1300(v5);
        goto LABEL_28;
      }
      if (v5 < 0x180)
      {
        int v7 = 2;
      }
      else
      {
        if (v5 < 0x370) {
          goto LABEL_53;
        }
        if (v5 < 0x400)
        {
          int v7 = 3;
        }
        else if (v5 < 0x500)
        {
          int v7 = 4;
        }
        else
        {
          if (v5 < 0x2000) {
            goto LABEL_53;
          }
          unsigned int v6 = v5 >> 4;
          if (v5 >> 4 < 0x207)
          {
            int v7 = 5;
          }
          else
          {
            if (v5 >> 5 < 0x105) {
              goto LABEL_53;
            }
            if (v6 < 0x20D)
            {
              int v7 = 6;
            }
            else
            {
              if (v5 < 0x3000) {
                goto LABEL_53;
              }
              if (v5 >> 6 < 0xC1)
              {
                int v7 = 7;
              }
              else if (v5 >> 5 < 0x185)
              {
                int v7 = 8;
              }
              else if (v5 >> 8 < 0x31)
              {
                int v7 = 9;
              }
              else
              {
                if (v5 >> 9 < 0x27) {
                  goto LABEL_53;
                }
                if (v5 >> 6 < 0x27F)
                {
                  int v7 = 10;
                }
                else
                {
                  if (v5 >> 10 < 0x2B) {
                    goto LABEL_53;
                  }
                  if (v6 < 0xD7B)
                  {
                    int v7 = 11;
                  }
                  else
                  {
                    if ((unsigned __int16)((unsigned __int16)(v5 + 16) >> 4) < 0xFF1u) {
                      goto LABEL_53;
                    }
                    int v7 = 12;
                  }
                }
              }
            }
          }
        }
      }
      if (((0xFE3uLL >> v7) & 1) == 0
        && (*(unsigned int (**)(void))&dword_1000FE150[14 * v7 + 6])((unsigned __int16)*i))
      {
        if (v5 < 0x180)
        {
          int v10 = 2;
        }
        else if (v5 < 0x400)
        {
          int v10 = 3;
        }
        else if (v5 < 0x500)
        {
          int v10 = 4;
        }
        else
        {
          unsigned int v9 = v5 >> 4;
          if (v5 >> 4 < 0x207)
          {
            int v10 = 5;
          }
          else
          {
            if (v5 >> 5 < 0x105) {
              goto LABEL_53;
            }
            if (v9 < 0x20D)
            {
              int v10 = 6;
            }
            else
            {
              if (v5 < 0x3000) {
                goto LABEL_53;
              }
              if (v5 >> 6 < 0xC1)
              {
                int v10 = 7;
              }
              else if (v5 >> 5 < 0x185)
              {
                int v10 = 8;
              }
              else if (v5 >> 8 < 0x31)
              {
                int v10 = 9;
              }
              else
              {
                if (v5 >> 9 < 0x27) {
                  goto LABEL_53;
                }
                if (v5 >> 6 < 0x27F)
                {
                  int v10 = 10;
                }
                else
                {
                  if (v5 >> 10 < 0x2B) {
                    goto LABEL_53;
                  }
                  if (v9 < 0xD7B)
                  {
                    int v10 = 11;
                  }
                  else
                  {
                    if ((unsigned __int16)((unsigned __int16)(v5 + 16) >> 4) < 0xFF1u) {
                      goto LABEL_53;
                    }
                    int v10 = 12;
                  }
                }
              }
            }
          }
        }
        if (((0xFE3uLL >> v10) & 1) == 0)
        {
          int v8 = (*(uint64_t (**)(uint64_t))&dword_1000FE150[14 * v10 + 8])(v5);
LABEL_28:
          LODWORD(v5) = v8;
        }
      }
LABEL_53:
      if (v4 < 0x100)
      {
        if (!sub_1000C12D4(v4)) {
          goto LABEL_5;
        }
        int v13 = sub_1000C1300(v4);
      }
      else
      {
        if (v4 < 0x180)
        {
          int v12 = 2;
        }
        else
        {
          if (v4 < 0x370) {
            goto LABEL_5;
          }
          if (v4 < 0x400)
          {
            int v12 = 3;
          }
          else if (v4 < 0x500)
          {
            int v12 = 4;
          }
          else
          {
            if (v4 < 0x2000) {
              goto LABEL_5;
            }
            unsigned int v11 = v4 >> 4;
            if (v4 >> 4 < 0x207)
            {
              int v12 = 5;
            }
            else
            {
              if (v4 >> 5 < 0x105) {
                goto LABEL_5;
              }
              if (v11 < 0x20D)
              {
                int v12 = 6;
              }
              else
              {
                if (v4 < 0x3000) {
                  goto LABEL_5;
                }
                if (v4 >> 6 < 0xC1)
                {
                  int v12 = 7;
                }
                else if (v4 >> 5 < 0x185)
                {
                  int v12 = 8;
                }
                else if (v4 >> 8 < 0x31)
                {
                  int v12 = 9;
                }
                else
                {
                  if (v4 >> 9 < 0x27) {
                    goto LABEL_5;
                  }
                  if (v4 >> 6 < 0x27F)
                  {
                    int v12 = 10;
                  }
                  else
                  {
                    if (v4 >> 10 < 0x2B) {
                      goto LABEL_5;
                    }
                    if (v11 < 0xD7B)
                    {
                      int v12 = 11;
                    }
                    else
                    {
                      if ((unsigned __int16)((unsigned __int16)(v4 + 16) >> 4) < 0xFF1u) {
                        goto LABEL_5;
                      }
                      int v12 = 12;
                    }
                  }
                }
              }
            }
          }
        }
        if (((0xFE3uLL >> v12) & 1) != 0
          || !(*(unsigned int (**)(uint64_t))&dword_1000FE150[14 * v12 + 6])(v4))
        {
          goto LABEL_5;
        }
        if (v4 < 0x180)
        {
          int v15 = 2;
        }
        else if (v4 < 0x400)
        {
          int v15 = 3;
        }
        else if (v4 < 0x500)
        {
          int v15 = 4;
        }
        else
        {
          unsigned int v14 = v4 >> 4;
          if (v4 >> 4 < 0x207)
          {
            int v15 = 5;
          }
          else
          {
            if (v4 >> 5 < 0x105) {
              goto LABEL_5;
            }
            if (v14 < 0x20D)
            {
              int v15 = 6;
            }
            else
            {
              if (v4 < 0x3000) {
                goto LABEL_5;
              }
              if (v4 >> 6 < 0xC1)
              {
                int v15 = 7;
              }
              else if (v4 >> 5 < 0x185)
              {
                int v15 = 8;
              }
              else if (v4 >> 8 < 0x31)
              {
                int v15 = 9;
              }
              else
              {
                if (v4 >> 9 < 0x27) {
                  goto LABEL_5;
                }
                if (v4 >> 6 < 0x27F)
                {
                  int v15 = 10;
                }
                else
                {
                  if (v4 >> 10 < 0x2B) {
                    goto LABEL_5;
                  }
                  if (v14 < 0xD7B)
                  {
                    int v15 = 11;
                  }
                  else
                  {
                    if ((unsigned __int16)((unsigned __int16)(v4 + 16) >> 4) < 0xFF1u) {
                      goto LABEL_5;
                    }
                    int v15 = 12;
                  }
                }
              }
            }
          }
        }
        if ((0xFE3uLL >> v15)) {
          goto LABEL_5;
        }
        int v13 = (*(uint64_t (**)(uint64_t))&dword_1000FE150[14 * v15 + 8])(v4);
      }
      LODWORD(v4) = v13;
LABEL_5:
      ++v2;
      if (v5 != v4)
      {
        if (v5 < v4) {
          return 0xFFFFFFFFLL;
        }
        else {
          return 1;
        }
      }
    }
  }
  BOOL v16 = a2 == 0;
LABEL_133:
  if (v16) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_1000CFC34(_WORD *a1, _WORD *a2, int a3)
{
  if (!a3) {
    return 0;
  }
  if (a1)
  {
    if (a2)
    {
      while (1)
      {
        unsigned int v3 = (unsigned __int16)*a1;
        unsigned int v4 = (unsigned __int16)*a2;
        if (!*a1) {
          break;
        }
        if (v3 != v4)
        {
          if (v3 < v4) {
            return 0xFFFFFFFFLL;
          }
          else {
            return 1;
          }
        }
        ++a1;
        ++a2;
        if (!--a3) {
          return 0;
        }
      }
      if (*a2) {
        return 0xFFFFFFFFLL;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  else if (a2)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_1000CFC98(_WORD *a1, unsigned __int16 *a2, int a3)
{
  if (!a3) {
    return 0;
  }
  unsigned int v3 = a2;
  unsigned int v4 = a1;
  if (a1)
  {
    if (!a2) {
      return 1;
    }
    int v5 = a3;
    while (1)
    {
      uint64_t v6 = (unsigned __int16)*v4;
      uint64_t v7 = *v3;
      if (!*v4)
      {
        BOOL v18 = v7 == 0;
        goto LABEL_137;
      }
      if (v6 < 0x100)
      {
        if (!sub_1000C12D4(*v4)) {
          goto LABEL_52;
        }
        int v10 = sub_1000C1300(v6);
        goto LABEL_27;
      }
      if (v6 < 0x180)
      {
        int v9 = 2;
      }
      else
      {
        if (v6 < 0x370) {
          goto LABEL_52;
        }
        if (v6 < 0x400)
        {
          int v9 = 3;
        }
        else if (v6 < 0x500)
        {
          int v9 = 4;
        }
        else
        {
          if (v6 < 0x2000) {
            goto LABEL_52;
          }
          unsigned int v8 = v6 >> 4;
          if (v6 >> 4 < 0x207)
          {
            int v9 = 5;
          }
          else
          {
            if (v6 >> 5 < 0x105) {
              goto LABEL_52;
            }
            if (v8 < 0x20D)
            {
              int v9 = 6;
            }
            else
            {
              if (v6 < 0x3000) {
                goto LABEL_52;
              }
              if (v6 >> 6 < 0xC1)
              {
                int v9 = 7;
              }
              else if (v6 >> 5 < 0x185)
              {
                int v9 = 8;
              }
              else if (v6 >> 8 < 0x31)
              {
                int v9 = 9;
              }
              else
              {
                if (v6 >> 9 < 0x27) {
                  goto LABEL_52;
                }
                if (v6 >> 6 < 0x27F)
                {
                  int v9 = 10;
                }
                else
                {
                  if (v6 >> 10 < 0x2B) {
                    goto LABEL_52;
                  }
                  if (v8 < 0xD7B)
                  {
                    int v9 = 11;
                  }
                  else
                  {
                    if ((unsigned __int16)((unsigned __int16)(v6 + 16) >> 4) < 0xFF1u) {
                      goto LABEL_52;
                    }
                    int v9 = 12;
                  }
                }
              }
            }
          }
        }
      }
      if (((0xFE3uLL >> v9) & 1) == 0
        && (*(unsigned int (**)(void))&dword_1000FE150[14 * v9 + 6])((unsigned __int16)*v4))
      {
        if (v6 < 0x180)
        {
          int v12 = 2;
        }
        else if (v6 < 0x400)
        {
          int v12 = 3;
        }
        else if (v6 < 0x500)
        {
          int v12 = 4;
        }
        else
        {
          unsigned int v11 = v6 >> 4;
          if (v6 >> 4 < 0x207)
          {
            int v12 = 5;
          }
          else
          {
            if (v6 >> 5 < 0x105) {
              goto LABEL_52;
            }
            if (v11 < 0x20D)
            {
              int v12 = 6;
            }
            else
            {
              if (v6 < 0x3000) {
                goto LABEL_52;
              }
              if (v6 >> 6 < 0xC1)
              {
                int v12 = 7;
              }
              else if (v6 >> 5 < 0x185)
              {
                int v12 = 8;
              }
              else if (v6 >> 8 < 0x31)
              {
                int v12 = 9;
              }
              else
              {
                if (v6 >> 9 < 0x27) {
                  goto LABEL_52;
                }
                if (v6 >> 6 < 0x27F)
                {
                  int v12 = 10;
                }
                else
                {
                  if (v6 >> 10 < 0x2B) {
                    goto LABEL_52;
                  }
                  if (v11 < 0xD7B)
                  {
                    int v12 = 11;
                  }
                  else
                  {
                    if ((unsigned __int16)((unsigned __int16)(v6 + 16) >> 4) < 0xFF1u) {
                      goto LABEL_52;
                    }
                    int v12 = 12;
                  }
                }
              }
            }
          }
        }
        if (((0xFE3uLL >> v12) & 1) == 0)
        {
          int v10 = (*(uint64_t (**)(uint64_t))&dword_1000FE150[14 * v12 + 8])(v6);
LABEL_27:
          LODWORD(v6) = v10;
        }
      }
LABEL_52:
      if (v7 < 0x100)
      {
        if (!sub_1000C12D4(v7)) {
          goto LABEL_98;
        }
        int v15 = sub_1000C1300(v7);
        goto LABEL_73;
      }
      if (v7 < 0x180)
      {
        int v14 = 2;
      }
      else
      {
        if (v7 < 0x370) {
          goto LABEL_98;
        }
        if (v7 < 0x400)
        {
          int v14 = 3;
        }
        else if (v7 < 0x500)
        {
          int v14 = 4;
        }
        else
        {
          if (v7 < 0x2000) {
            goto LABEL_98;
          }
          unsigned int v13 = v7 >> 4;
          if (v7 >> 4 < 0x207)
          {
            int v14 = 5;
          }
          else
          {
            if (v7 >> 5 < 0x105) {
              goto LABEL_98;
            }
            if (v13 < 0x20D)
            {
              int v14 = 6;
            }
            else
            {
              if (v7 < 0x3000) {
                goto LABEL_98;
              }
              if (v7 >> 6 < 0xC1)
              {
                int v14 = 7;
              }
              else if (v7 >> 5 < 0x185)
              {
                int v14 = 8;
              }
              else if (v7 >> 8 < 0x31)
              {
                int v14 = 9;
              }
              else
              {
                if (v7 >> 9 < 0x27) {
                  goto LABEL_98;
                }
                if (v7 >> 6 < 0x27F)
                {
                  int v14 = 10;
                }
                else
                {
                  if (v7 >> 10 < 0x2B) {
                    goto LABEL_98;
                  }
                  if (v13 < 0xD7B)
                  {
                    int v14 = 11;
                  }
                  else
                  {
                    if ((unsigned __int16)((unsigned __int16)(v7 + 16) >> 4) < 0xFF1u) {
                      goto LABEL_98;
                    }
                    int v14 = 12;
                  }
                }
              }
            }
          }
        }
      }
      if (((0xFE3uLL >> v14) & 1) == 0 && (*(unsigned int (**)(uint64_t))&dword_1000FE150[14 * v14 + 6])(v7))
      {
        if (v7 < 0x180)
        {
          int v17 = 2;
        }
        else if (v7 < 0x400)
        {
          int v17 = 3;
        }
        else if (v7 < 0x500)
        {
          int v17 = 4;
        }
        else
        {
          unsigned int v16 = v7 >> 4;
          if (v7 >> 4 < 0x207)
          {
            int v17 = 5;
          }
          else
          {
            if (v7 >> 5 < 0x105) {
              goto LABEL_98;
            }
            if (v16 < 0x20D)
            {
              int v17 = 6;
            }
            else
            {
              if (v7 < 0x3000) {
                goto LABEL_98;
              }
              if (v7 >> 6 < 0xC1)
              {
                int v17 = 7;
              }
              else if (v7 >> 5 < 0x185)
              {
                int v17 = 8;
              }
              else if (v7 >> 8 < 0x31)
              {
                int v17 = 9;
              }
              else
              {
                if (v7 >> 9 < 0x27) {
                  goto LABEL_98;
                }
                if (v7 >> 6 < 0x27F)
                {
                  int v17 = 10;
                }
                else
                {
                  if (v7 >> 10 < 0x2B) {
                    goto LABEL_98;
                  }
                  if (v16 < 0xD7B)
                  {
                    int v17 = 11;
                  }
                  else
                  {
                    if ((unsigned __int16)((unsigned __int16)(v7 + 16) >> 4) < 0xFF1u) {
                      goto LABEL_98;
                    }
                    int v17 = 12;
                  }
                }
              }
            }
          }
        }
        if (((0xFE3uLL >> v17) & 1) == 0)
        {
          int v15 = (*(uint64_t (**)(uint64_t))&dword_1000FE150[14 * v17 + 8])(v7);
LABEL_73:
          LODWORD(v7) = v15;
        }
      }
LABEL_98:
      if (v6 != v7)
      {
        if (v6 < v7) {
          return 0xFFFFFFFFLL;
        }
        else {
          return 1;
        }
      }
      ++v4;
      ++v3;
      if (!--v5) {
        return 0;
      }
    }
  }
  BOOL v18 = a2 == 0;
LABEL_137:
  if (v18) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

unsigned __int16 *sub_1000D01FC(unsigned __int16 *a1)
{
  if (a1)
  {
    unsigned __int16 v2 = *a1;
    if (*a1)
    {
      unsigned int v3 = a1 + 1;
      do
      {
        if (v2 < 0x100u)
        {
          if (!sub_1000C12D4(v2)) {
            goto LABEL_6;
          }
          unsigned __int16 v9 = sub_1000C1300(v2);
        }
        else
        {
          if (v2 < 0x180u)
          {
            int v8 = 2;
          }
          else
          {
            if (v2 < 0x370u) {
              goto LABEL_6;
            }
            if (v2 < 0x400u)
            {
              int v8 = 3;
            }
            else if (v2 < 0x500u)
            {
              int v8 = 4;
            }
            else
            {
              if (v2 < 0x2000u) {
                goto LABEL_6;
              }
              unsigned int v5 = v2 >> 4;
              if (v5 < 0x207)
              {
                int v8 = 5;
              }
              else
              {
                unsigned int v6 = v2 >> 5;
                if (v6 < 0x105) {
                  goto LABEL_6;
                }
                if (v5 < 0x20D)
                {
                  int v8 = 6;
                }
                else
                {
                  if (v2 < 0x3000u) {
                    goto LABEL_6;
                  }
                  unsigned int v7 = v2 >> 6;
                  if (v7 < 0xC1)
                  {
                    int v8 = 7;
                  }
                  else if (v6 < 0x185)
                  {
                    int v8 = 8;
                  }
                  else if (HIBYTE(v2) < 0x31u)
                  {
                    int v8 = 9;
                  }
                  else
                  {
                    if ((unsigned __int16)(v2 >> 9) < 0x27u) {
                      goto LABEL_6;
                    }
                    if (v7 < 0x27F)
                    {
                      int v8 = 10;
                    }
                    else
                    {
                      if ((unsigned __int16)(v2 >> 10) < 0x2Bu) {
                        goto LABEL_6;
                      }
                      if (v5 < 0xD7B)
                      {
                        int v8 = 11;
                      }
                      else
                      {
                        if ((unsigned __int16)((unsigned __int16)(v2 + 16) >> 4) < 0xFF1u) {
                          goto LABEL_6;
                        }
                        int v8 = 12;
                      }
                    }
                  }
                }
              }
            }
          }
          if (((0xFE3uLL >> v8) & 1) != 0
            || !(*(unsigned int (**)(void))&dword_1000FE150[14 * v8 + 6])(v2))
          {
            goto LABEL_6;
          }
          if (v2 < 0x180u)
          {
            int v13 = 2;
          }
          else
          {
            if (v2 < 0x370u) {
              goto LABEL_5;
            }
            if (v2 < 0x400u)
            {
              int v13 = 3;
            }
            else if (v2 < 0x500u)
            {
              int v13 = 4;
            }
            else
            {
              unsigned int v10 = v2 >> 4;
              if (v10 < 0x207)
              {
                int v13 = 5;
              }
              else
              {
                unsigned int v11 = v2 >> 5;
                if (v11 < 0x105) {
                  goto LABEL_5;
                }
                if (v10 < 0x20D)
                {
                  int v13 = 6;
                }
                else
                {
                  if (v2 < 0x3000u) {
                    goto LABEL_5;
                  }
                  unsigned int v12 = v2 >> 6;
                  if (v12 < 0xC1)
                  {
                    int v13 = 7;
                  }
                  else if (v11 < 0x185)
                  {
                    int v13 = 8;
                  }
                  else if (HIBYTE(v2) < 0x31u)
                  {
                    int v13 = 9;
                  }
                  else
                  {
                    if ((unsigned __int16)(v2 >> 9) < 0x27u) {
                      goto LABEL_5;
                    }
                    if (v12 < 0x27F)
                    {
                      int v13 = 10;
                    }
                    else
                    {
                      if ((unsigned __int16)(v2 >> 10) < 0x2Bu) {
                        goto LABEL_5;
                      }
                      if (v10 < 0xD7B)
                      {
                        int v13 = 11;
                      }
                      else
                      {
                        if ((unsigned __int16)((unsigned __int16)(v2 + 16) >> 4) < 0xFF1u) {
                          goto LABEL_5;
                        }
                        int v13 = 12;
                      }
                    }
                  }
                }
              }
            }
          }
          if ((0xFE3uLL >> v13)) {
            goto LABEL_5;
          }
          unsigned __int16 v9 = (*(uint64_t (**)(void))&dword_1000FE150[14 * v13 + 8])(v2);
        }
        unsigned __int16 v2 = v9;
LABEL_5:
        *(v3 - 1) = v2;
LABEL_6:
        int v4 = *v3++;
        unsigned __int16 v2 = v4;
      }
      while (v4);
    }
  }
  return a1;
}

unint64_t sub_1000D04D8(char *a1, _WORD *a2)
{
  unsigned __int16 v2 = a1;
  while (1)
  {
    int v4 = v2;
    uint64_t v5 = *(unsigned __int16 *)v2;
    if (!*(_WORD *)v2) {
      break;
    }
    if (v5 > 0xFF)
    {
      if ((v5 - 0x2000) < 0xC)
      {
        int v3 = 1;
      }
      else
      {
        int v3 = 1;
        if (*(unsigned __int16 *)v2 >= 0x3000u)
        {
          if (v5 != 12351 && v5 != 12288)
          {
LABEL_15:
            v4 += 2;
            break;
          }
        }
        else if (v5 != 8239 && v5 != 8287)
        {
          goto LABEL_15;
        }
      }
    }
    else
    {
      if ((v5 & 0x80) != 0) {
        goto LABEL_15;
      }
      int v3 = (byte_1000F6054[v5] >> 4) & 1;
    }
    v2 += 2;
    if (!v3) {
      goto LABEL_15;
    }
  }
  *a2 = v5;
  return (unint64_t)(v4 - a1) >> 1;
}

uint64_t sub_1000D0574(uint64_t result)
{
  if ((result - 0x2000) <= 0x6F)
  {
    unsigned __int16 v1 = result;
    switch((int)result)
    {
      case 8192:
      case 8193:
      case 8194:
      case 8195:
      case 8196:
      case 8197:
      case 8198:
      case 8199:
      case 8200:
      case 8201:
      case 8202:
      case 8203:
      case 8239:
      case 8287:
        uint64_t result = 32;
        break;
      case 8208:
      case 8209:
      case 8210:
      case 8211:
      case 8212:
      case 8213:
        uint64_t result = 45;
        break;
      case 8216:
      case 8217:
      case 8218:
      case 8219:
        uint64_t result = 39;
        break;
      case 8220:
      case 8221:
      case 8222:
      case 8223:
        uint64_t result = 34;
        break;
      default:
        return v1;
    }
    return result;
  }
  unsigned __int16 v1 = 32;
  if (result == 12288 || result == 12351) {
    return v1;
  }
  if ((unsigned __int16)(result + 256) > 0xEEu) {
    return (unsigned __int16)result;
  }
  if ((unsigned __int16)(result + 255) <= 0x5Du) {
    return (unsigned __int16)(result + 288);
  }
  if ((unsigned __int16)(result + 161) <= 1u) {
    return (unsigned __int16)(result + 10790);
  }
  if ((unsigned __int16)(result + 159) <= 3u) {
    return (unsigned __int16)(0x3001300D300C3002uLL >> (16 * (result - 97)));
  }
  if ((unsigned __int16)(result + 155) > 0x3Au)
  {
    if ((unsigned __int16)(result + 96) <= 0x3Cu)
    {
      if (result == 65440) {
        return 12644;
      }
      if (result >> 6 <= 0x3FE) {
        return (unsigned __int16)(result + 12688);
      }
      if ((unsigned __int16)(result + 62) <= 5u) {
        return (unsigned __int16)(result + 12685);
      }
      if ((unsigned __int16)(result + 54) <= 5u) {
        return (unsigned __int16)(result + 12683);
      }
      if ((unsigned __int16)(result + 46) <= 5u) {
        return (unsigned __int16)(result + 12681);
      }
      unsigned __int16 v2 = result + 12679;
      if (result <= 0xFFD9) {
        return (unsigned __int16)result;
      }
      return v2;
    }
    if ((unsigned __int16)(result + 32) <= 6u) {
      return word_1000F65D0[(__int16)(result + 32)];
    }
    if (result >= 0xFFE8)
    {
      if (result != 65512 && result <= 0xFFEC) {
        return (unsigned __int16)(result + 8615);
      }
      if (result == 65518) {
        return 9675;
      }
      if (result == 65517) {
        return 9632;
      }
      unsigned __int16 v1 = result;
      if (result == 65512) {
        return 9474;
      }
      return v1;
    }
    return (unsigned __int16)result;
  }
  if ((unsigned __int16)(result + 153) <= 4u) {
    return (unsigned __int16)(2 * result + 12755);
  }
  if ((unsigned __int16)(result + 148) <= 2u) {
    return (unsigned __int16)(2 * result + 12811);
  }
  if ((unsigned __int16)(result + 143) <= 4u) {
    return (unsigned __int16)(2 * result + 12736);
  }
  if ((unsigned __int16)(result + 138) <= 0xBu) {
    return (unsigned __int16)(2 * result + 12735);
  }
  if ((unsigned __int16)(result + 126) <= 2u) {
    return (unsigned __int16)(2 * result + 12736);
  }
  if ((unsigned __int16)(result + 123) <= 5u) {
    return (unsigned __int16)(result + 12613);
  }
  if ((unsigned __int16)(result + 117) <= 3u) {
    return (unsigned __int16)(3 * result + 12849);
  }
  if ((unsigned __int16)(result + 113) <= 4u) {
    return (unsigned __int16)(result + 12623);
  }
  if ((unsigned __int16)(result + 106) <= 5u) {
    return (unsigned __int16)(result + 12626);
  }
  unsigned __int16 v1 = result;
  switch((int)result)
  {
    case 65381:
      uint64_t result = 12539;
      break;
    case 65382:
      uint64_t result = 12530;
      break;
    case 65391:
      uint64_t result = 12483;
      break;
    case 65392:
      uint64_t result = 12540;
      break;
    case 65428:
      uint64_t result = 12516;
      break;
    case 65429:
      uint64_t result = 12518;
      break;
    case 65436:
      uint64_t result = 12527;
      break;
    case 65437:
      uint64_t result = 12531;
      break;
    case 65438:
      uint64_t result = 12441;
      break;
    case 65439:
      uint64_t result = 12442;
      break;
    default:
      return v1;
  }
  return result;
}

uint64_t sub_1000D0C34(_WORD *a1, int a2, _WORD *a3)
{
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 >= 1)
  {
    int v4 = a3;
    if (a3)
    {
      if (a1 && *a1)
      {
        uint64_t v7 = 0;
        uint64_t v8 = 0;
        do
        {
          int v9 = (unsigned __int16)a1[v7 + 1];
          v8 += (uint64_t)&_mh_execute_header;
          ++v7;
        }
        while (v9);
        if ((int)((unint64_t)(v7 * 2) >> 1) < 1)
        {
          uint64_t v3 = 0;
        }
        else
        {
          uint64_t v3 = 0;
          uint64_t v10 = v8 >> 32;
          do
          {
            if (v3 < a2) {
              v4[v3] = sub_1000D0574((unsigned __int16)a1[v3]);
            }
            ++v3;
          }
          while (v3 < v10);
        }
        if ((int)v3 >= a2) {
          return 0xFFFFFFFFLL;
        }
        v4 += v3;
      }
      else
      {
        uint64_t v3 = 0;
      }
      *int v4 = 0;
    }
  }
  return v3;
}

uint64_t sub_1000D0D1C(unsigned int a1)
{
  if (a1 >= 0x100) {
    return 0;
  }
  else {
    return a1;
  }
}

uint64_t sub_1000D0D30(unsigned char *a1, int a2, uint64_t a3)
{
  if (!a1 || ((LOBYTE(v3) = *a1) != 0 ? (BOOL v4 = a2 < 1) : (BOOL v4 = 1), v4))
  {
    LODWORD(v5) = 0;
  }
  else
  {
    unint64_t v5 = 0;
    do
    {
      *(_WORD *)(a3 + 2 * v5) = v3;
      int v3 = a1[++v5];
      if (v3) {
        BOOL v6 = v5 >= a2;
      }
      else {
        BOOL v6 = 1;
      }
    }
    while (!v6);
  }
  if ((int)v5 >= a2) {
    return 0;
  }
  *(_WORD *)(a3 + 2 * v5) = 0;
  return 1;
}

uint64_t sub_1000D0D90(__int16 *a1, int a2, uint64_t a3)
{
  if (!a1 || ((__int16 v3 = *a1) != 0 ? (v4 = a2 < 1) : (v4 = 1), v4))
  {
    LODWORD(v5) = 0;
LABEL_8:
    if ((int)v5 >= a2)
    {
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *(unsigned char *)(a3 + v5) = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
    while (1)
    {
      if ((v3 & 0xFF00) != 0) {
        LOBYTE(v3) = 0;
      }
      if (!(_BYTE)v3) {
        break;
      }
      *(unsigned char *)(a3 + v7) = v3;
      unint64_t v5 = v7 + 1;
      __int16 v3 = a1[v7 + 1];
      if (v3) {
        BOOL v8 = v5 >= a2;
      }
      else {
        BOOL v8 = 1;
      }
      ++v7;
      if (v8) {
        goto LABEL_8;
      }
    }
    uint64_t result = 2;
    *(unsigned char *)(a3 + v7) = 0;
  }
  return result;
}

uint64_t sub_1000D0E18(__int16 *a1, int a2, int a3, uint64_t a4)
{
  if (!a1 || ((__int16 v4 = *a1) != 0 ? (v5 = a2 < 1) : (v5 = 1), v5))
  {
    LODWORD(v6) = 0;
LABEL_8:
    if ((int)v6 >= a3)
    {
      return 1;
    }
    else
    {
      uint64_t result = 0;
      *(unsigned char *)(a4 + v6) = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
    while (1)
    {
      if ((v4 & 0xFF00) != 0) {
        LOBYTE(v4) = 0;
      }
      if (!(_BYTE)v4) {
        break;
      }
      *(unsigned char *)(a4 + v8) = v4;
      unint64_t v6 = v8 + 1;
      __int16 v4 = a1[v8 + 1];
      if (v4) {
        BOOL v9 = v6 >= a2;
      }
      else {
        BOOL v9 = 1;
      }
      ++v8;
      if (v9) {
        goto LABEL_8;
      }
    }
    uint64_t result = 2;
    *(unsigned char *)(a4 + v8) = 0;
  }
  return result;
}

uint64_t sub_1000D0EA0(unsigned char *a1, int a2, uint64_t a3)
{
  if (!a1 || ((int v3 = *a1, *a1) ? (v4 = a2 < 1) : (v4 = 1), v4))
  {
    LODWORD(v5) = 0;
LABEL_8:
    if ((int)v5 < a2)
    {
      *(_WORD *)(a3 + 2 * v5) = 0;
      return 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = a1 + 1;
    while (1)
    {
      uint64_t v9 = 0;
      switch(v3)
      {
        case 164:
          goto LABEL_19;
        case 166:
          uint64_t v9 = 1;
          goto LABEL_19;
        case 168:
          uint64_t v9 = 2;
          goto LABEL_19;
        case 180:
          uint64_t v9 = 3;
          goto LABEL_19;
        case 184:
          uint64_t v9 = 4;
          goto LABEL_19;
        case 188:
          uint64_t v9 = 5;
          goto LABEL_19;
        case 189:
          uint64_t v9 = 6;
          goto LABEL_19;
        case 190:
          uint64_t v9 = 7;
LABEL_19:
          int v3 = dword_1000F6540[2 * v9 + 1];
          break;
        default:
          LOWORD(v3) = v3;
          break;
      }
      if (!(_WORD)v3) {
        break;
      }
      *(_WORD *)(a3 + 2 * v7) = v3;
      unint64_t v5 = v7 + 1;
      int v3 = v8[v7];
      if (v8[v7]) {
        BOOL v10 = v5 >= a2;
      }
      else {
        BOOL v10 = 1;
      }
      ++v7;
      if (v10) {
        goto LABEL_8;
      }
    }
  }
  return 0;
}

uint64_t sub_1000D0FF0(_WORD *a1, int a2, uint64_t a3)
{
  if (a1)
  {
    LOWORD(v3) = *a1;
    if (*a1 && a2 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = a1 + 1;
      uint64_t result = 2;
      while (1)
      {
        if ((unsigned __int16)v3 >= 0x100u)
        {
          switch((__int16)v3)
          {
            case 338:
              uint64_t v9 = 5;
              break;
            case 339:
              uint64_t v9 = 6;
              break;
            case 340:
            case 341:
            case 342:
            case 343:
            case 344:
            case 345:
            case 346:
            case 347:
            case 348:
            case 349:
            case 350:
            case 351:
            case 354:
            case 355:
            case 356:
            case 357:
            case 358:
            case 359:
            case 360:
            case 361:
            case 362:
            case 363:
            case 364:
            case 365:
            case 366:
            case 367:
            case 368:
            case 369:
            case 370:
            case 371:
            case 372:
            case 373:
            case 374:
            case 375:
            case 377:
            case 378:
            case 379:
            case 380:
              goto LABEL_10;
            case 352:
              uint64_t v9 = 1;
              break;
            case 353:
              uint64_t v9 = 2;
              break;
            case 376:
              uint64_t v9 = 7;
              break;
            case 381:
              uint64_t v9 = 3;
              break;
            case 382:
              uint64_t v9 = 4;
              break;
            default:
              if ((unsigned __int16)v3 != 8364) {
                goto LABEL_10;
              }
              uint64_t v9 = 0;
              break;
          }
          int v3 = dword_1000F6540[2 * v9];
          if (!(_BYTE)v3)
          {
LABEL_31:
            uint64_t result = 2;
            *(unsigned char *)(a3 + v6) = 0;
            return result;
          }
        }
        else if ((unsigned __int16)v3 - 164 <= 0x1A && ((1 << (v3 + 92)) & 0x7110015) != 0)
        {
          goto LABEL_31;
        }
        *(unsigned char *)(a3 + v6) = v3;
        unint64_t v5 = v6 + 1;
        LOWORD(v3) = v7[v6];
        if ((_WORD)v3) {
          BOOL v10 = v5 >= a2;
        }
        else {
          BOOL v10 = 1;
        }
        ++v6;
        if (v10) {
          goto LABEL_8;
        }
      }
    }
  }
  LODWORD(v5) = 0;
LABEL_8:
  if ((int)v5 >= a2) {
    return 1;
  }
  uint64_t result = 0;
  uint64_t v6 = v5;
LABEL_10:
  *(unsigned char *)(a3 + v6) = 0;
  return result;
}

uint64_t sub_1000D11D8(_WORD *a1, int a2, int a3, uint64_t a4)
{
  if (a1)
  {
    LOWORD(v4) = *a1;
    if (*a1 && a2 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = a1 + 1;
      uint64_t result = 2;
      while (1)
      {
        if ((unsigned __int16)v4 >= 0x100u)
        {
          switch((__int16)v4)
          {
            case 338:
              uint64_t v10 = 5;
              break;
            case 339:
              uint64_t v10 = 6;
              break;
            case 340:
            case 341:
            case 342:
            case 343:
            case 344:
            case 345:
            case 346:
            case 347:
            case 348:
            case 349:
            case 350:
            case 351:
            case 354:
            case 355:
            case 356:
            case 357:
            case 358:
            case 359:
            case 360:
            case 361:
            case 362:
            case 363:
            case 364:
            case 365:
            case 366:
            case 367:
            case 368:
            case 369:
            case 370:
            case 371:
            case 372:
            case 373:
            case 374:
            case 375:
            case 377:
            case 378:
            case 379:
            case 380:
              goto LABEL_10;
            case 352:
              uint64_t v10 = 1;
              break;
            case 353:
              uint64_t v10 = 2;
              break;
            case 376:
              uint64_t v10 = 7;
              break;
            case 381:
              uint64_t v10 = 3;
              break;
            case 382:
              uint64_t v10 = 4;
              break;
            default:
              if ((unsigned __int16)v4 != 8364) {
                goto LABEL_10;
              }
              uint64_t v10 = 0;
              break;
          }
          int v4 = dword_1000F6540[2 * v10];
          if (!(_BYTE)v4)
          {
LABEL_31:
            uint64_t result = 2;
            *(unsigned char *)(a4 + v7) = 0;
            return result;
          }
        }
        else if ((unsigned __int16)v4 - 164 <= 0x1A && ((1 << (v4 + 92)) & 0x7110015) != 0)
        {
          goto LABEL_31;
        }
        *(unsigned char *)(a4 + v7) = v4;
        unint64_t v6 = v7 + 1;
        LOWORD(v4) = v8[v7];
        if ((_WORD)v4) {
          BOOL v11 = v6 >= a2;
        }
        else {
          BOOL v11 = 1;
        }
        ++v7;
        if (v11) {
          goto LABEL_8;
        }
      }
    }
  }
  LODWORD(v6) = 0;
LABEL_8:
  if ((int)v6 >= a3) {
    return 1;
  }
  uint64_t result = 0;
  uint64_t v7 = (int)v6;
LABEL_10:
  *(unsigned char *)(a4 + v7) = 0;
  return result;
}

uint64_t sub_1000D13C0(unsigned int a1)
{
  if (a1 <= 0x137) {
    return (a1 & 1) != 0;
  }
  if (a1 <= 0x148) {
    return (a1 & 1) == 0;
  }
  if (a1 <= 0x178) {
    return (a1 & 1) != 0;
  }
  uint64_t result = 1;
  if (a1 <= 0x17E && (a1 & 1) != 0) {
    return 0;
  }
  return result;
}

uint64_t sub_1000D1418(unsigned int a1)
{
  if (a1 > 0x137)
  {
    if (a1 > 0x148)
    {
      if (a1 > 0x178)
      {
        if (a1 <= 0x17E && (a1 & 1) != 0) {
          return 1;
        }
      }
      else if ((a1 & 1) == 0)
      {
        return 1;
      }
    }
    else if (a1)
    {
      return 1;
    }
  }
  else if ((a1 & 1) == 0)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_1000D1470(unsigned int a1)
{
  if (a1 > 0x12F)
  {
    if (a1 == 304)
    {
      return 105;
    }
    else
    {
      if (a1 == 376) {
        unsigned __int16 v3 = 255;
      }
      else {
        unsigned __int16 v3 = ((a1 - 377 < 6) & a1) + a1;
      }
      if (a1) {
        unsigned __int16 v4 = a1;
      }
      else {
        unsigned __int16 v4 = a1 + 1;
      }
      if (a1 <= 0x177) {
        unsigned __int16 v3 = v4;
      }
      if (a1 <= 0x148) {
        unsigned __int16 v3 = (a1 & 1) + a1;
      }
      if (a1) {
        unsigned __int16 v5 = a1;
      }
      else {
        unsigned __int16 v5 = a1 + 1;
      }
      if (a1 <= 0x137) {
        return v5;
      }
      return v3;
    }
  }
  else if (a1)
  {
    return (unsigned __int16)a1;
  }
  else
  {
    return (unsigned __int16)(a1 + 1);
  }
}

uint64_t sub_1000D14F4(unsigned int a1)
{
  if (a1 <= 0x130) {
    return a1 & 0xFFFE;
  }
  if (a1 == 305) {
    return 73;
  }
  if (a1 <= 0x138) {
    return a1 & 0xFFFE;
  }
  if (a1 <= 0x148) {
    return (unsigned __int16)(a1 + (a1 & 1) - 1);
  }
  if (a1 != 329 && a1 <= 0x177) {
    return a1 & 0xFFFE;
  }
  __int16 v3 = (a1 & 1) == 0 && a1 - 377 < 6;
  return (unsigned __int16)(a1 - v3);
}

uint64_t sub_1000D1584()
{
  return 1;
}

uint64_t sub_1000D158C(int a1)
{
  __int16 v1 = a1 - 880;
  if ((a1 - 880) > 0x20)
  {
    if ((a1 - 940) < 0x23) {
      return 1;
    }
    if ((a1 - 975) <= 0x12)
    {
      BOOL v4 = (a1 & 0xFFFE) == 0x3D0 || (v1 & 0xFFFD) == 101;
      int v5 = v1 & 0xFFF9;
      return v4 || v5 == 105 || (unsigned __int16)(a1 - 880) == 113;
    }
    if ((a1 - 994) <= 0xD) {
      return a1 & 1;
    }
    unsigned int v8 = (unsigned __int16)(a1 - 880);
    if (v8 >= 0x80)
    {
      if (v8 == 136) {
        return 1;
      }
      if ((a1 - 1008) <= 0xC) {
        return dword_1000F65E0[(__int16)(a1 - 1008)];
      }
    }
    return 0;
  }
  if ((a1 - 891) < 3) {
    return 1;
  }
  char v3 = a1 - 113;
  if ((a1 - 881) > 0x1F) {
    return 0;
  }
  uint64_t result = 1;
  if (((1 << v3) & 0x80000045) == 0) {
    return 0;
  }
  return result;
}

uint64_t sub_1000D1688(int a1)
{
  if ((a1 - 880) > 0x20)
  {
    if ((unsigned __int16)(a1 - 880) > 0x3Bu)
    {
      if ((a1 - 975) > 0x12)
      {
        unsigned int v4 = (0x809u >> (a1 + 12)) & 1;
        if ((a1 - 1012) >= 0xC) {
          unsigned int v4 = 0;
        }
        if ((unsigned __int16)((a1 & 0xFFFB) - 1017) >= 2u) {
          int v5 = v4;
        }
        else {
          int v5 = 1;
        }
        if ((unsigned __int16)(a1 - 880) >= 0x80u) {
          unsigned int v6 = v5;
        }
        else {
          unsigned int v6 = 0;
        }
        if ((a1 - 994) <= 0xD) {
          return (a1 & 1) == 0;
        }
        else {
          return v6;
        }
      }
      else
      {
        unsigned int v3 = (0x2AA21u >> (a1 + 49)) & 1;
        if ((a1 - 975) >= 0x12) {
          unsigned int v3 = 0;
        }
        if ((a1 & 0xFFFE) == 0x3D2) {
          return 1;
        }
        else {
          return v3;
        }
      }
    }
    else
    {
      return (unsigned __int16)(a1 - 880) != 50;
    }
  }
  else
  {
    unsigned int v1 = (0xD4400045 >> (a1 - 112)) & 1;
    if ((unsigned __int16)(a1 - 880) >= 0x20u) {
      unsigned int v1 = 0;
    }
    if ((a1 & 0xFFFE) == 0x388) {
      return 1;
    }
    else {
      return v1;
    }
  }
}

uint64_t sub_1000D1768(uint64_t result)
{
  if ((result - 880) <= 0x20)
  {
    switch((int)result)
    {
      case 880:
      case 882:
      case 886:
        uint64_t result = (unsigned __int16)(result + 1);
        break;
      case 902:
        uint64_t result = 940;
        break;
      case 904:
      case 905:
      case 906:
        uint64_t result = (unsigned __int16)(result + 37);
        break;
      case 908:
        uint64_t result = 972;
        break;
      case 910:
      case 911:
        uint64_t result = (unsigned __int16)(result + 63);
        break;
      default:
        return (unsigned __int16)result;
    }
    return result;
  }
  if ((unsigned __int16)(result - 880) > 0x3Bu)
  {
    LODWORD(v1) = result - 975;
    if ((result - 975) > 0x12)
    {
      if ((result - 994) <= 0xD) {
        return (unsigned __int16)result | 1u;
      }
      if ((unsigned __int16)(result - 880) < 0x80u) {
        return (unsigned __int16)result;
      }
      LOWORD(v1) = result - 1012;
      if ((result - 1012) >= 0xC || ((0xE69u >> (result + 12)) & 1) == 0) {
        return (unsigned __int16)result;
      }
      uint64_t v1 = (__int16)v1;
      unsigned __int16 v2 = &unk_1000F6638;
    }
    else
    {
      if (v1 >= 0x12 || ((0x2AA39u >> (result + 49)) & 1) == 0) {
        return (unsigned __int16)result;
      }
      uint64_t v1 = (__int16)v1;
      unsigned __int16 v2 = &unk_1000F6614;
    }
    LOWORD(result) = v2[v1];
    return (unsigned __int16)result;
  }
  if ((unsigned __int16)(result - 880) != 50) {
    LOWORD(result) = result + 32;
  }
  return (unsigned __int16)result;
}

uint64_t sub_1000D18FC(uint64_t result)
{
  if ((result - 880) > 0x20) {
    return (unsigned __int16)(result - 32);
  }
  __int16 v1 = result - 881;
  if (result - 881) < 0xD && ((0x1C45u >> v1)) {
    LOWORD(result) = word_1000F6650[v1];
  }
  return (unsigned __int16)result;
}

uint64_t sub_1000D1AC0(int a1)
{
  if (a1 != 930 && (a1 - 910) < 0x6F) {
    return 1;
  }
  int v2 = a1 - 884;
  uint64_t result = 0;
  switch(v2)
  {
    case 0:
    case 1:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 19:
    case 23:
    case 25:
    case 137:
    case 138:
    case 139:
      return result;
    default:
      return 1;
  }
  return result;
}

BOOL sub_1000D1D40(int a1)
{
  unsigned int v1 = (unsigned __int16)(a1 - 1024);
  if ((a1 - 1024) < 0x60) {
    return (0x38u >> (v1 >> 4)) & 1;
  }
  if (v1 == 135) {
    return 0;
  }
  if (v1 <= 0x81) {
    return a1 & 1;
  }
  if (v1 < 0x8A) {
    return 0;
  }
  if (v1 <= 0xBF) {
    return a1 & 1;
  }
  if (v1 != 192 && v1 <= 0xCE) {
    return (a1 & 1) == 0;
  }
  if (v1 >= 0xD0) {
    return a1 & 1;
  }
  return v1 == 207;
}

BOOL sub_1000D1DD0(int a1)
{
  unsigned int v1 = (unsigned __int16)(a1 - 1024);
  if ((a1 - 1024) < 0x60)
  {
    unsigned int v1 = 7u >> (v1 >> 4);
    return v1 & 1;
  }
  if (v1 == 135) {
    return 0;
  }
  if (v1 <= 0x81) {
    return (a1 & 1) == 0;
  }
  if (v1 < 0x8A) {
    return 0;
  }
  if (v1 <= 0xBF) {
    return (a1 & 1) == 0;
  }
  if (v1 != 192 && v1 <= 0xCE) {
    return v1 & 1;
  }
  if (v1 >= 0xD0) {
    return (a1 & 1) == 0;
  }
  else {
    return v1 == 192;
  }
}

uint64_t sub_1000D1E5C(uint64_t result)
{
  unsigned int v1 = (unsigned __int16)(result - 1024);
  if ((result - 1024) <= 0x5F)
  {
    unsigned int v2 = v1 >> 4;
    unsigned int v3 = v2 - 1;
    if (v2) {
      __int16 v4 = result;
    }
    else {
      __int16 v4 = result + 80;
    }
    if (v3 >= 2) {
      LOWORD(result) = v4;
    }
    else {
      LOWORD(result) = result + 32;
    }
    return (unsigned __int16)result;
  }
  if (v1 == 135) {
    return 1159;
  }
  if (v1 <= 0x81) {
    return (unsigned __int16)result | 1u;
  }
  if (v1 < 0x8A) {
    return (unsigned __int16)result;
  }
  if (v1 > 0xBF)
  {
    if (v1 != 192 && v1 <= 0xCE) {
      return (unsigned __int16)((result & 1) + result);
    }
    if (result) {
      __int16 v5 = result;
    }
    else {
      __int16 v5 = result + 1;
    }
    if (v1 >= 0xD0) {
      LOWORD(result) = v5;
    }
    else {
      LOWORD(result) = 1231;
    }
    return (unsigned __int16)result;
  }
  if ((result & 1) == 0) {
    LOWORD(result) = result + 1;
  }
  return (unsigned __int16)result;
}

uint64_t sub_1000D1F18(uint64_t result)
{
  if ((result - 1024) > 0x5F)
  {
    if ((unsigned __int16)(result - 1024) == 135) {
      return 1159;
    }
    if ((unsigned __int16)(result - 1024) <= 0x81u) {
      return (unsigned __int16)result & 0xFFFE;
    }
    if ((unsigned __int16)(result - 1024) >= 0x8Au)
    {
      if ((unsigned __int16)(result - 1024) <= 0xBFu) {
        return (unsigned __int16)result & 0xFFFE;
      }
      unsigned int v4 = (unsigned __int16)(result - 1024);
      if (v4 != 192 && v4 <= 0xCE) {
        return (unsigned __int16)(result + (result & 1) - 1);
      }
      if (v4 <= 0xCF) {
        LOWORD(result) = 1216;
      }
      else {
        LOWORD(result) = result & 0xFFFE;
      }
    }
    return (unsigned __int16)result;
  }
  else
  {
    int v1 = (unsigned __int16)(result - 1024) >> 4;
    unsigned int v2 = v1 - 3;
    if (v1 == 5) {
      __int16 v3 = result - 80;
    }
    else {
      __int16 v3 = result;
    }
    if (v2 >= 2) {
      LOWORD(result) = v3;
    }
    else {
      LOWORD(result) = result - 32;
    }
    return (unsigned __int16)result;
  }
}

BOOL sub_1000D1FD8(unsigned int a1)
{
  return a1 < 0x482 || a1 - 1162 < 0x76 || a1 - 1155 < 5;
}

uint64_t sub_1000D1FF8()
{
  return 0;
}

BOOL sub_1000D2000(int a1)
{
  return (a1 - 12293) < 2;
}

BOOL sub_1000D2014(int a1)
{
  return (a1 - 12439) >= 2 && a1 != 12352;
}

BOOL sub_1000D2034(int a1)
{
  return a1 != 12539 && a1 != 12448;
}

BOOL sub_1000D204C(unsigned int a1)
{
  return a1 < 0x9FBC;
}

BOOL sub_1000D205C(unsigned int a1)
{
  return a1 < 0xD7A4;
}

BOOL sub_1000D206C(__int16 a1)
{
  return (unsigned __int16)(a1 + 191) < 0x1Au;
}

BOOL sub_1000D2080(__int16 a1)
{
  return (unsigned __int16)(a1 + 223) < 0x1Au;
}

uint64_t sub_1000D2094(unsigned __int16 a1)
{
  if ((unsigned __int16)(a1 + 223) >= 0x1Au) {
    return a1;
  }
  else {
    return (unsigned __int16)(a1 + 32);
  }
}

uint64_t sub_1000D20B0(unsigned __int16 a1)
{
  if ((unsigned __int16)(a1 + 191) >= 0x1Au) {
    return a1;
  }
  else {
    return (unsigned __int16)(a1 - 32);
  }
}

BOOL sub_1000D20CC(__int16 a1)
{
  if (vmaxv_u16(vcgt_u16((uint16x4_t)0x1E003A001A001ALL, (uint16x4_t)vadd_s16(vdup_n_s16(a1), (int16x4_t)0x5F009A00DF00BFLL))))return 1; {
  return (unsigned __int16)(a1 + 62) < 0x1Bu && (unsigned __int16)(a1 + 54) < 0xFFFEu && (a1 & 0xFFF6) != 65488;
  }
}

uint64_t sub_1000D2130(char *a1, _DWORD *a2)
{
  __int16 v3 = a1;
  unsigned __int16 v12 = 0;
  if (a2) {
    *a2 = 0;
  }
  int v4 = *a1;
  if (!*a1)
  {
    int v5 = 0;
LABEL_26:
    if (a2) {
      *a2 = v5;
    }
    return 1;
  }
  int v5 = 0;
  while (1)
  {
    if ((v4 & 0x80) == 0)
    {
      unsigned int v6 = 1;
      goto LABEL_18;
    }
    uint64_t result = 0;
    if (v4 == 255 || (v4 & 0xC0) == 0x80) {
      return result;
    }
    unsigned int v6 = byte_1000F66A6[v4];
    if ((v4 & 0xC0) == 0xC0) {
      break;
    }
LABEL_17:
    if ((~(_BYTE)v4 & 0xF0) == 0) {
      return 0;
    }
LABEL_18:
    sub_1000D2284(v3, &v12);
    if (v6 == 2 && v12 < 0x80u) {
      return 0;
    }
    if (v6 == 3 && v12 < 0x800u) {
      return 0;
    }
    v3 += v6;
    ++v5;
    int v4 = *v3;
    if (!*v3) {
      goto LABEL_26;
    }
  }
  if (v6 <= 2) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = byte_1000F66A6[v4];
  }
  uint64_t v9 = v8 - 1;
  uint64_t v10 = v3 + 1;
  while (1)
  {
    char v11 = *v10++;
    if ((v11 & 0xC0) != 0x80) {
      return 0;
    }
    if (!--v9) {
      goto LABEL_17;
    }
  }
}

uint64_t sub_1000D2284(char *a1, _WORD *a2)
{
  *a2 = 0;
  uint64_t v2 = *a1;
  if (!*a1) {
    return 0;
  }
  char v3 = *a1;
  uint64_t v4 = byte_1000F66A6[v2];
  char v19 = *a1;
  if (((char)v2 & 0x80000000) == 0)
  {
LABEL_3:
    __int16 v5 = v3;
    uint64_t v4 = 1;
LABEL_4:
    *a2 = v5;
    return v4;
  }
  uint64_t v6 = 0xFFFFFFFFLL;
  if ((char)v2 != -1)
  {
    uint64_t v8 = v2 & 0xC0;
    if (v8 != 128)
    {
      if (v8 != 192)
      {
        uint64_t v9 = 1;
LABEL_18:
        int v14 = &v19;
        v20[v9 - 1] = 0;
        __int16 v5 = 0;
        switch((int)v4)
        {
          case 1:
            char v3 = v19;
            goto LABEL_3;
          case 2:
            int v14 = v20;
            __int16 v5 = v19 & 0x1F;
            break;
          case 3:
            int v14 = v20;
            __int16 v5 = v19 & 0xF;
            break;
          case 4:
            int v14 = v20;
            __int16 v5 = v19 & 7;
            break;
          case 5:
            int v14 = v20;
            __int16 v5 = v19 & 3;
            break;
          case 6:
            int v14 = v20;
            __int16 v5 = v19 & 1;
            break;
          case 7:
            break;
          default:
            return 0xFFFFFFFFLL;
        }
        char v17 = *v14;
        int v15 = (unsigned __int8 *)(v14 + 1);
        char v16 = v17;
        do
        {
          __int16 v5 = v16 & 0x3F | (v5 << 6);
          int v18 = *v15++;
          char v16 = v18;
        }
        while (v18);
        goto LABEL_4;
      }
      if (v4 <= 2) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = v4;
      }
      uint64_t v10 = v9 - 1;
      char v11 = v20;
      unsigned __int16 v12 = a1 + 1;
      while (1)
      {
        char v13 = *v12++;
        *char v11 = v13;
        if ((v13 & 0xC0) != 0x80) {
          return 0xFFFFFFFFLL;
        }
        ++v11;
        if (!--v10) {
          goto LABEL_18;
        }
      }
    }
  }
  return v6;
}

uint64_t sub_1000D244C(char *a1, int a2, uint64_t a3)
{
  if (a1)
  {
    __int16 v5 = a1;
    unsigned __int16 v18 = 0;
    int v6 = *a1;
    if (*a1)
    {
      int v7 = *a1;
      uint64_t v8 = a1;
      while (1)
      {
        if ((v7 & 0x80) != 0)
        {
          if (v7 == 255 || (v7 & 0xC0) == 0x80) {
            return 0;
          }
          unsigned int v9 = byte_1000F66A6[v7];
          if ((v7 & 0xC0) == 0xC0)
          {
            if (v9 <= 2) {
              uint64_t v10 = 2;
            }
            else {
              uint64_t v10 = byte_1000F66A6[v7];
            }
            uint64_t v11 = v10 - 1;
            unsigned __int16 v12 = v8 + 1;
            do
            {
              char v13 = *v12++;
              if ((v13 & 0xC0) != 0x80) {
                return 0;
              }
            }
            while (--v11);
          }
          if ((~(_BYTE)v7 & 0xF0) == 0) {
            return 0;
          }
        }
        else
        {
          unsigned int v9 = 1;
        }
        sub_1000D2284(v8, &v18);
        if (v9 == 2 && v18 < 0x80u || v9 == 3 && v18 < 0x800u) {
          return 0;
        }
        v8 += v9;
        int v7 = *v8;
        if (!*v8)
        {
          int v14 = 0;
          if (v6)
          {
            do
            {
              __int16 v17 = 0;
              int v16 = sub_1000D2284(v5, &v17);
              if (v14 < a2) {
                *(_WORD *)(a3 + 2 * v14++) = v17;
              }
              v5 += v16;
            }
            while (*v5);
          }
          goto LABEL_23;
        }
      }
    }
  }
  int v14 = 0;
LABEL_23:
  if (v14 >= a2) {
    return 0;
  }
  *(_WORD *)(a3 + 2 * v14) = 0;
  return 1;
}

uint64_t sub_1000D25BC(uint64_t result, unsigned char *a2)
{
  if (result)
  {
    if (result > 0x7F)
    {
      if (result > 0x7FF)
      {
        *a2 = (result >> 12) | 0xE0;
        a2[1] = (result >> 6) & 0x3F | 0x80;
        a2[2] = result & 0x3F | 0x80;
        return 3;
      }
      else
      {
        *a2 = (result >> 6) | 0xC0;
        a2[1] = result & 0x3F | 0x80;
        return 2;
      }
    }
    else
    {
      *a2 = result;
      return 1;
    }
  }
  return result;
}

uint64_t sub_1000D2628(_WORD *a1, int a2, int a3, uint64_t a4)
{
  int v6 = 0;
  if (a1 && a3 >= 1)
  {
    unsigned int v7 = (unsigned __int16)*a1;
    if (*a1 && a2 >= 1)
    {
      unsigned int v9 = 0;
      uint64_t v10 = &a1[a2];
      uint64_t v11 = a1 + 1;
      do
      {
        if (v7 > 0x7F)
        {
          if (v7 > 0x7FF)
          {
            char __src = (v7 >> 12) | 0xE0;
            char v16 = (v7 >> 6) & 0x3F | 0x80;
            char v17 = v7 & 0x3F | 0x80;
            unsigned int v12 = 3;
            int v6 = v9 + 3;
            if ((int)(v9 + 3) >= a3) {
              break;
            }
          }
          else
          {
            char __src = (v7 >> 6) | 0xC0;
            char v16 = v7 & 0x3F | 0x80;
            unsigned int v12 = 2;
            int v6 = v9 + 2;
            if ((int)(v9 + 2) >= a3) {
              break;
            }
          }
        }
        else
        {
          char __src = v7;
          unsigned int v12 = 1;
          int v6 = v9 + 1;
          if ((int)(v9 + 1) >= a3) {
            break;
          }
        }
        memcpy((void *)(a4 + v9), &__src, v12);
        unsigned int v7 = (unsigned __int16)*v11;
        if (!*v11) {
          break;
        }
        unsigned int v9 = v6;
      }
      while (v11++ < v10);
    }
  }
  if (v6 >= a3) {
    return 1;
  }
  uint64_t result = 0;
  *(unsigned char *)(a4 + v6) = 0;
  return result;
}

uint64_t sub_1000D2768(_WORD *a1, int a2, uint64_t a3)
{
  if (a1)
  {
    unsigned int v5 = (unsigned __int16)*a1;
    if (*a1)
    {
      unsigned int v6 = 0;
      unsigned int v7 = a1 + 1;
      while (1)
      {
        if (v5 > 0x7F)
        {
          if (v5 > 0x7FF)
          {
            char __src = (v5 >> 12) | 0xE0;
            char v13 = (v5 >> 6) & 0x3F | 0x80;
            char v14 = v5 & 0x3F | 0x80;
            unsigned int v9 = 3;
            int v10 = v6 + 3;
            if ((int)(v6 + 3) < a2) {
LABEL_12:
            }
              memcpy((void *)(a3 + v6), &__src, v9);
          }
          else
          {
            char __src = (v5 >> 6) | 0xC0;
            char v13 = v5 & 0x3F | 0x80;
            unsigned int v9 = 2;
            int v10 = v6 + 2;
            if ((int)(v6 + 2) < a2) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          char __src = v5;
          unsigned int v9 = 1;
          int v10 = v6 + 1;
          if ((int)(v6 + 1) < a2) {
            goto LABEL_12;
          }
        }
        unsigned int v8 = *v7++;
        unsigned int v5 = v8;
        unsigned int v6 = v10;
        if (!v8) {
          goto LABEL_14;
        }
      }
    }
    int v10 = 0;
    if (a2 <= 0) {
      return 1;
    }
LABEL_15:
    uint64_t result = 0;
    *(unsigned char *)(a3 + v10) = 0;
    return result;
  }
  int v10 = 0;
LABEL_14:
  if (v10 < a2) {
    goto LABEL_15;
  }
  return 1;
}

uint64_t sub_1000D2894(char *__str, size_t __size, const char *a3, va_list a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (__str)
  {
    int v6 = __size;
    if ((int)__size >= 1)
    {
      uint64_t result = vsnprintf(__str, __size, a3, a4);
      uint64_t v7 = (int)result >= v6 ? 0xFFFFFFFFLL : result;
      if ((v7 & 0x80000000) != 0)
      {
        if (v6 < 0xA) {
          strcpy(__str, &aTruncated[-v6 + 10]);
        }
        else {
          strcpy(&__str[v6 - 10], aTruncated);
        }
        return v7;
      }
    }
  }
  return result;
}

void *sub_1000D2948(void *a1, uint64_t a2, void *a3)
{
  char v3 = off_100106A00;
  if (a3) {
    *a3 = qword_100106A08;
  }
  off_100106A00 = a1;
  qword_100106A08 = a2;
  return v3;
}

BOOL sub_1000D2974()
{
  return off_100106A00 && off_100106A00(qword_100106A08);
}

uint64_t *sub_1000D29B4(int a1, int a2)
{
  uint64_t v4 = (uint64_t *)sub_1000C33A0(56);
  unsigned int v5 = v4;
  if (!v4) {
    return v5;
  }
  *((_DWORD *)v4 + 1) = a1;
  *((_DWORD *)v4 + 2) = a2;
  uint64_t v6 = qword_100101CC0;
  if (!qword_100101CC0)
  {
    int v13 = 0;
    *((_DWORD *)v4 + 5) = 0;
    goto LABEL_17;
  }
  int v7 = *(_DWORD *)(qword_100101CC0 + 2868);
  *((_DWORD *)v4 + 5) = v7;
  if (!v7)
  {
    int v13 = *(_DWORD *)(v6 + 2816);
LABEL_17:
    *((_DWORD *)v4 + 3) = v13;
    if (a2 >= 0) {
      int v14 = a2;
    }
    else {
      int v14 = a2 + 1;
    }
    int v11 = v14 >> 1;
    *(_DWORD *)uint64_t v4 = 0;
    uint64_t v15 = sub_1000C33A0(4 * (v14 >> 1));
    v5[3] = v15;
    if (!v15) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
  if ((a1 - 11000) >= 0x33) {
    int v8 = a1 / 4;
  }
  else {
    int v8 = 4800;
  }
  if (a1 == 8000) {
    int v9 = 3490;
  }
  else {
    int v9 = v8;
  }
  *((_DWORD *)v4 + 4) = v9;
  if (a2 >= 0) {
    int v10 = a2;
  }
  else {
    int v10 = a2 + 1;
  }
  int v11 = (v10 >> 1) + 1;
  *(_DWORD *)uint64_t v4 = 7;
  uint64_t v12 = sub_1000C33A0(4 * v11);
  v5[3] = v12;
  if (!v12) {
    goto LABEL_25;
  }
LABEL_21:
  uint64_t v16 = 2 * v11;
  uint64_t v17 = sub_1000C33A0(v16);
  v5[4] = v17;
  if (v17)
  {
    uint64_t v18 = sub_1000C33A0(v16);
    v5[5] = v18;
    if (v18)
    {
      uint64_t v19 = sub_1000C33A0(v16);
      v5[6] = v19;
      if (v19) {
        return v5;
      }
    }
  }
LABEL_25:
  sub_1000C321C(v5[6]);
  sub_1000C321C(v5[5]);
  sub_1000C321C(v5[4]);
  sub_1000C321C(v5[3]);
  sub_1000C321C((uint64_t)v5);
  return 0;
}

uint64_t sub_1000D2B28(uint64_t result)
{
  if (result)
  {
    int v1 = (uint64_t *)result;
    sub_1000C321C(*(void *)(result + 48));
    sub_1000C321C(v1[5]);
    sub_1000C321C(v1[4]);
    sub_1000C321C(v1[3]);
    return sub_1000C321C((uint64_t)v1);
  }
  return result;
}

uint64_t sub_1000D2B84(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 20)) {
    return 2;
  }
  int v1 = *(_DWORD *)(a1 + 4);
  if ((v1 - 11000) >= 0x33) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = 15;
  }
  if (v1 == 8000) {
    return 15;
  }
  else {
    return v2;
  }
}

uint64_t sub_1000D2BBC(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 20))
  {
    int v2 = *(_DWORD *)(result + 4);
    if (v2 == 8000)
    {
      int v3 = word_1000F67A6[a2];
    }
    else if ((v2 - 10000) > 0x41A)
    {
      int v3 = v2 / 4;
    }
    else
    {
      int v3 = word_1000F67C6[a2];
    }
    *(_DWORD *)(result + 12) = v3;
    int v21 = *(_DWORD *)(result + 16);
    if (v21 >= 0) {
      int v22 = *(_DWORD *)(result + 16);
    }
    else {
      int v22 = v21 + 1;
    }
    int v23 = *(_DWORD *)(result + 8);
    int v24 = (v2 + v23 * v21 - 1) / v2;
    int v25 = v2 + (v2 < 0);
    if (v24 >= 1)
    {
      uint64_t v26 = 0;
      unsigned int v27 = 0;
      do
      {
        *(_WORD *)(*(void *)(result + 32) + v26) = v27 >> 12;
        *(_WORD *)(*(void *)(result + 48) + v26) = v27 - (*(_WORD *)(*(void *)(result + 32) + v26) << 12);
        *(_WORD *)(*(void *)(result + 40) + v26) = 4096 - *(_WORD *)(*(void *)(result + 48) + v26);
        v27 += ((v22 >> 1) + (v3 << 12)) / v21;
        v26 += 2;
      }
      while (2 * v24 != v26);
      int v23 = *(_DWORD *)(result + 8);
    }
    if (v23 >= 0) {
      int v28 = v23;
    }
    else {
      int v28 = v23 + 1;
    }
    int v29 = v28 >> 1;
    if (v24 >= v29)
    {
      uint64_t v41 = v29;
    }
    else
    {
      int v30 = v25 >> 1;
      int v31 = (v30 - v3) << 12;
      uint64_t v32 = v24;
      int v33 = v31 / (v30 - v21);
      do
      {
        int v34 = *(_DWORD *)(result + 4);
        int v35 = v34 * v32 - *(_DWORD *)(result + 16) * v23;
        int v36 = (v23 * *(_DWORD *)(result + 12)) << 12;
        if (v34 >= 0) {
          int v37 = *(_DWORD *)(result + 4);
        }
        else {
          int v37 = v34 + 1;
        }
        unsigned int v38 = (v36 + (v37 >> 1) + v35 * v33) / v34;
        uint64_t v39 = 2 * v32;
        *(_WORD *)(*(void *)(result + 32) + v39) = v38 >> 12;
        *(_WORD *)(*(void *)(result + 48) + v39) = v38 - (*(_WORD *)(*(void *)(result + 32) + 2 * v32) << 12);
        *(_WORD *)(*(void *)(result + 40) + v39) = 4096 - *(_WORD *)(*(void *)(result + 48) + 2 * v32++);
        int v23 = *(_DWORD *)(result + 8);
        if (v23 >= 0) {
          int v40 = *(_DWORD *)(result + 8);
        }
        else {
          int v40 = v23 + 1;
        }
        uint64_t v41 = (uint64_t)v40 >> 1;
      }
      while (v32 < v41);
      int v29 = v40 >> 1;
    }
    *(_WORD *)(*(void *)(result + 32) + 2 * v41) = v29 - 1;
    *(_WORD *)(*(void *)(result + 48) + 2 * (*(_DWORD *)(result + 8) / 2)) = 4096;
    int v20 = *(_DWORD *)(result + 8) / 2;
    goto LABEL_46;
  }
  int v4 = word_1000F67E6[a2 + 2];
  int v5 = *(_DWORD *)(result + 8);
  int v6 = *(_DWORD *)(result + 12) * v5 / *(_DWORD *)(result + 4);
  LODWORD(v7) = (v6 * v4 + 2048) >> 12;
  if (v5 >= 0) {
    int v8 = *(_DWORD *)(result + 8);
  }
  else {
    int v8 = v5 + 1;
  }
  int v9 = v8 >> 1;
  int v10 = v8 >> 1;
  if (v8 >> 1 >= (int)v7)
  {
    int v12 = (v6 * v4 + 2048) >> 12;
    int v11 = ((v9 - (int)v7) << 12) / (v9 - v6);
    if ((int)v7 < 1) {
      goto LABEL_16;
    }
  }
  else
  {
    int v11 = 4096;
    int v12 = v8 >> 1;
    int v6 = (v9 << 12) / v4;
    if (v9 < 1) {
      goto LABEL_16;
    }
  }
  uint64_t v13 = 0;
  int v14 = 0;
  do
  {
    *(_WORD *)(*(void *)(result + 32) + v13) = (v14 / v4) >> 12;
    *(_WORD *)(*(void *)(result + 48) + v13) = v14 / v4 - (*(_WORD *)(*(void *)(result + 32) + v13) << 12);
    *(_WORD *)(*(void *)(result + 40) + v13) = 4096 - *(_WORD *)(*(void *)(result + 48) + v13);
    v14 += 0x1000000;
    v13 += 2;
  }
  while (2 * v12 != v13);
  int v10 = *(_DWORD *)(result + 8) / 2;
LABEL_16:
  int v15 = v10 - 1;
  if (v12 < v10 - 1)
  {
    int v16 = 0;
    int v17 = v6 << 12;
    if ((int)v7 >= v9) {
      LODWORD(v7) = v9;
    }
    uint64_t v7 = (int)v7;
    do
    {
      unsigned int v18 = v16 / v11 + v17;
      uint64_t v19 = 2 * v7;
      *(_WORD *)(*(void *)(result + 32) + v19) = v18 >> 12;
      *(_WORD *)(*(void *)(result + 48) + v19) = v18 - (*(_WORD *)(*(void *)(result + 32) + 2 * v7) << 12);
      *(_WORD *)(*(void *)(result + 40) + v19) = 4096 - *(_WORD *)(*(void *)(result + 48) + 2 * v7++);
      int v10 = *(_DWORD *)(result + 8) / 2;
      int v15 = v10 - 1;
      v16 += 0x1000000;
    }
    while (v7 < v10 - 1);
  }
  if (v12 < v10)
  {
    *(_WORD *)(*(void *)(result + 32) + 2 * v15) = v10 - 2;
    *(_WORD *)(*(void *)(result + 48) + 2 * (*(_DWORD *)(result + 8) / 2 - 1)) = 4096;
    int v20 = *(_DWORD *)(result + 8) / 2 - 1;
LABEL_46:
    *(_WORD *)(*(void *)(result + 40) + 2 * v20) = 0;
  }
  *(_DWORD *)uint64_t result = a2;
  return result;
}

char *sub_1000D2F58(char *result, char *__dst)
{
  int v2 = *(_DWORD *)result;
  if (*((_DWORD *)result + 5))
  {
    if (v2 == 7) {
      return result;
    }
    int v3 = (const void **)(result + 24);
    int v4 = *((_DWORD *)result + 2);
    if (v4 >= 0) {
      int v5 = *((_DWORD *)result + 2);
    }
    else {
      int v5 = v4 + 1;
    }
    int v6 = v5 >> 1;
    int v7 = (v5 >> 1) + 1;
    if (v4 >= -1)
    {
      int v8 = (int *)*((void *)result + 3);
      int v9 = (unsigned __int16 *)*((void *)result + 4);
      int v10 = v6 + 2;
      int v11 = (__int16 *)*((void *)result + 5);
      int v12 = (__int16 *)*((void *)result + 6);
      do
      {
        int v14 = (int *)&__dst[4 * *v9];
        int v16 = *v14;
        int v15 = v14[1];
        int v17 = *v11;
        if (v16 >= 0x80000 || v15 >= 0x80000) {
          int v13 = (v16 >> 12) * v17 + (v15 >> 12) * *v12;
        }
        else {
          int v13 = (v15 * *v12 + v16 * v17 + 2048) >> 12;
        }
        *v8++ = v13;
        ++v12;
        ++v11;
        ++v9;
        --v10;
      }
      while (v10 > 1);
    }
  }
  else
  {
    if (!v2) {
      return result;
    }
    int v3 = (const void **)(result + 24);
    int v18 = *((_DWORD *)result + 2);
    if (v18 >= 0) {
      int v19 = *((_DWORD *)result + 2);
    }
    else {
      int v19 = v18 + 1;
    }
    int v7 = v19 >> 1;
    if (v18 >= 2)
    {
      int v20 = (int *)*((void *)result + 3);
      int v21 = (unsigned __int16 *)*((void *)result + 4);
      int v22 = v7 + 1;
      int v23 = (__int16 *)*((void *)result + 5);
      int v24 = (__int16 *)*((void *)result + 6);
      do
      {
        int v26 = *v23++;
        int v25 = v26;
        int v27 = *v21++;
        int v28 = &__dst[4 * v27];
        int v29 = *v24++;
        *v20++ = (*((_DWORD *)v28 + 1) * v29 + *(_DWORD *)v28 * v25 + 2048) >> 12;
        --v22;
      }
      while (v22 > 1);
    }
  }
  return (char *)j__memmove(__dst, *v3, 4 * v7);
}

uint64_t sub_1000D307C(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  uint64_t v16 = sub_1000C33A0(144);
  uint64_t v17 = v16;
  if (!v16) {
    return v17;
  }
  *(_DWORD *)(v16 + 56) = 0;
  *(_WORD *)(v16 + 60) = 0;
  *(_WORD *)(v16 + 84) = -1;
  *(void *)(v16 + 88) = a1;
  *(void *)(v16 + 96) = a2;
  *(_DWORD *)(v16 + 76) = a5;
  *(_DWORD *)(v16 + 80) = a4;
  *(_DWORD *)(v16 + 124) = a8;
  uint64_t v18 = qword_100101CC0;
  if (qword_100101CC0)
  {
    *(_DWORD *)(v16 + 136) = *(_DWORD *)(qword_100101CC0 + 5576);
    *(_DWORD *)(v16 + 72) = a3;
    *(_DWORD *)(v16 + 116) = a6;
    if (*(_DWORD *)(v18 + 5540)) {
      a7 = 0;
    }
    *(_DWORD *)(v16 + 68) = a7;
    *(void *)(v16 + 48) = 0;
    if (!a4) {
      return v17;
    }
  }
  else
  {
    *(_DWORD *)(v16 + 136) = 0;
    *(_DWORD *)(v16 + 68) = a7;
    *(_DWORD *)(v16 + 72) = a3;
    *(_DWORD *)(v16 + 116) = a6;
    *(void *)(v16 + 48) = 0;
    if (!a4) {
      return v17;
    }
  }
  uint64_t v19 = sub_1000C33A0(16 * a4);
  *(void *)(v17 + 48) = v19;
  if (!v19)
  {
    sub_1000D31E4(v17);
    return 0;
  }
  if (a4 >= 1)
  {
    if (a4 == 1)
    {
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v20 = a4 & 0xFFFFFFFE;
      uint64_t v21 = v19 + 16;
      uint64_t v22 = v20;
      do
      {
        *(void *)(v21 - 16) = 0;
        *(void *)uint64_t v21 = 0;
        *(_DWORD *)(v21 - 8) = 0;
        *(_DWORD *)(v21 + 8) = 0;
        v21 += 32;
        v22 -= 2;
      }
      while (v22);
      if (v20 == a4) {
        return v17;
      }
    }
    uint64_t v23 = a4 - v20;
    int v24 = (_DWORD *)(v19 + 16 * v20 + 8);
    do
    {
      *((void *)v24 - 1) = 0;
      *int v24 = 0;
      v24 += 4;
      --v23;
    }
    while (v23);
  }
  return v17;
}

uint64_t sub_1000D31E4(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_10009E614(*(void *)(result + 128));
    uint64_t v2 = *(void *)v1;
    if (*(void *)v1)
    {
      if (*(int *)(v1 + 8) >= 1)
      {
        uint64_t v3 = 0;
        do
          sub_1000C321C(*(void *)(*(void *)v1 + 8 * v3++));
        while (v3 < *(int *)(v1 + 8));
        uint64_t v2 = *(void *)v1;
      }
      sub_1000C321C(v2);
    }
    uint64_t v4 = *(void *)(v1 + 32);
    if (v4)
    {
      if (*(int *)(v1 + 40) >= 1)
      {
        uint64_t v5 = 0;
        do
          sub_1000C321C(*(void *)(*(void *)(v1 + 32) + 8 * v5++));
        while (v5 < *(int *)(v1 + 40));
        uint64_t v4 = *(void *)(v1 + 32);
      }
      sub_1000C321C(v4);
    }
    uint64_t v6 = *(void *)(v1 + 16);
    if (v6)
    {
      if (*(int *)(v1 + 24) >= 1)
      {
        uint64_t v7 = 0;
        do
          sub_1000C321C(*(void *)(*(void *)(v1 + 16) + 8 * v7++));
        while (v7 < *(int *)(v1 + 24));
        uint64_t v6 = *(void *)(v1 + 16);
      }
      sub_1000C321C(v6);
    }
    sub_1000C321C(*(void *)(v1 + 48));
    return sub_1000C321C(v1);
  }
  return result;
}

uint64_t sub_1000D32E4(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 68);
  signed int v3 = *(_DWORD *)(a1 + 56);
  if (v2)
  {
    if (v3 < 1)
    {
      unsigned int v5 = -1;
    }
    else
    {
      signed int v4 = 0;
      unsigned int v5 = -1;
      do
      {
        unsigned int v5 = sub_1000C085C(*(unsigned __int16 *)(*(void *)(*(void *)(a1 + 32) + 8 * (v4 >> 8))+ 2 * v4), 2, v5);
        ++v4;
        signed int v3 = *(_DWORD *)(a1 + 56);
      }
      while (v4 < v3);
    }
  }
  else
  {
    if (v3 < 1)
    {
      unsigned int v5 = -1;
      if (*(__int16 *)(a1 + 60) < 1) {
        goto LABEL_15;
      }
      goto LABEL_12;
    }
    signed int v6 = 0;
    unsigned int v5 = -1;
    do
    {
      uint64_t v7 = (unsigned __int16 *)(*(void *)(*(void *)a1 + 8 * (v6 >> 8)) + 8 * v6);
      unsigned int v8 = sub_1000C085C(*v7, 2, v5);
      unsigned int v9 = sub_1000C085C((__int16)v7[1], 2, v8);
      unsigned int v5 = sub_1000C085C((__int16)v7[2], 2, v9);
      ++v6;
      signed int v3 = *(_DWORD *)(a1 + 56);
    }
    while (v6 < v3);
  }
  if (*(__int16 *)(a1 + 60) < 1) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  do
  {
    unsigned int v12 = sub_1000C085C(*(_DWORD *)(*(void *)(a1 + 48) + v10), 4, v5);
    unsigned int v13 = sub_1000C085C(*(_DWORD *)(*(void *)(a1 + 48) + v10 + 4), 4, v12);
    unsigned int v5 = sub_1000C085C(*(_DWORD *)(*(void *)(a1 + 48) + v10 + 12), 4, v13);
    ++v11;
    v10 += 16;
  }
  while (v11 < *(__int16 *)(a1 + 60));
  signed int v3 = *(_DWORD *)(a1 + 56);
LABEL_15:
  unsigned int v14 = sub_1000C085C(v3, 4, v5);
  unsigned int v15 = sub_1000C085C(*(__int16 *)(a1 + 60), 2, v14);
  unsigned int v16 = sub_1000C085C(*(_DWORD *)(a1 + 76), 4, v15);
  unsigned int v17 = sub_1000C085C(*(_DWORD *)(a1 + 80), 4, v16);
  unsigned int v18 = sub_1000C085C(*(__int16 *)(a1 + 84), 2, v17);
  unsigned int v19 = sub_1000C085C(*(unsigned __int16 *)(a1 + 104), 2, v18);
  unsigned int v20 = sub_1000C085C(*(_DWORD *)(a1 + 108), 4, v19);
  unsigned int v21 = sub_1000C085C(*(_DWORD *)(a1 + 112), 4, v20);
  unsigned int v22 = sub_1000C085C(*(_DWORD *)(a1 + 116), 4, v21);
  unsigned int v23 = *(_DWORD *)(a1 + 120);
  return sub_1000C085C(v23, 4, v22);
}

uint64_t sub_1000D34EC(long long *a1)
{
  if (!a1) {
    return 0;
  }
  int v2 = sub_1000C328C(0x90uLL);
  uint64_t v3 = (uint64_t)v2;
  if (!v2) {
    return v3;
  }
  long long v5 = a1[3];
  long long v4 = a1[4];
  long long v6 = a1[1];
  *((_OWORD *)v2 + 2) = a1[2];
  *((_OWORD *)v2 + 3) = v5;
  long long v7 = a1[7];
  long long v8 = a1[8];
  long long v9 = a1[6];
  *((_OWORD *)v2 + 5) = a1[5];
  *((_OWORD *)v2 + 1) = v6;
  long long v10 = *a1;
  *((_OWORD *)v2 + 4) = v4;
  *((_OWORD *)v2 + 7) = v7;
  *((_OWORD *)v2 + 8) = v8;
  *((_OWORD *)v2 + 6) = v9;
  v2[11] = 0;
  *((void *)v2 + 6) = 0;
  v2[20] = 0;
  *((void *)v2 + 4) = 0;
  *(_OWORD *)int v2 = v10;
  *((_OWORD *)v2 + 1) = 0u;
  *(_OWORD *)int v2 = 0u;
  if (*(void *)a1)
  {
    unsigned int v11 = *((_DWORD *)a1 + 14) + 255;
    unsigned int v12 = v11 >> 8;
    unsigned int v13 = sub_1000C328C(8 * (v11 >> 8));
    if (!v13) {
      goto LABEL_44;
    }
    unsigned int v14 = v13;
    if (v11 >= 0x100)
    {
      uint64_t v15 = 0;
      if (v12 <= 1) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = v12;
      }
      while (1)
      {
        unsigned int v17 = sub_1000C328C(0x800uLL);
        *(void *)&v14[2 * v15] = v17;
        if (!v17) {
          break;
        }
        j__memmove(v17, *(const void **)(*(void *)a1 + 8 * v15++), 0x800uLL);
        if (v16 == v15) {
          goto LABEL_11;
        }
      }
      if (v15)
      {
        uint64_t v36 = v15 + 1;
        do
          sub_1000C321C(*(void *)&v14[2 * (v36-- - 2)]);
        while (v36 > 1);
      }
      goto LABEL_44;
    }
LABEL_11:
    *(void *)uint64_t v3 = v14;
    *(_DWORD *)(v3 + 8) = v12;
    *(_DWORD *)(v3 + 12) = v12;
  }
  if (*((void *)a1 + 2))
  {
    unsigned int v18 = *((_DWORD *)a1 + 14) + 255;
    unsigned int v19 = v18 >> 8;
    unsigned int v20 = sub_1000C328C(8 * (v18 >> 8));
    if (!v20) {
      goto LABEL_44;
    }
    unsigned int v21 = v20;
    if (v18 >= 0x100)
    {
      uint64_t v22 = 0;
      if (v19 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v19;
      }
      while (1)
      {
        int v24 = sub_1000C328C(0xC00uLL);
        *(void *)&v21[2 * v22] = v24;
        if (!v24) {
          break;
        }
        j__memmove(v24, *(const void **)(*((void *)a1 + 2) + 8 * v22++), 0xC00uLL);
        if (v23 == v22) {
          goto LABEL_20;
        }
      }
      if (v22)
      {
        uint64_t v37 = v22 + 1;
        do
          sub_1000C321C(*(void *)&v21[2 * (v37-- - 2)]);
        while (v37 > 1);
      }
      goto LABEL_44;
    }
LABEL_20:
    *(void *)(v3 + 16) = v21;
    *(_DWORD *)(v3 + 24) = v19;
    *(_DWORD *)(v3 + 28) = v19;
  }
  if (*((void *)a1 + 4))
  {
    unsigned int v25 = *((_DWORD *)a1 + 14) + 255;
    unsigned int v26 = v25 >> 8;
    int v27 = sub_1000C328C(8 * (v25 >> 8));
    if (!v27) {
      goto LABEL_44;
    }
    int v28 = v27;
    if (v25 >= 0x100)
    {
      uint64_t v29 = 0;
      if (v26 <= 1) {
        uint64_t v30 = 1;
      }
      else {
        uint64_t v30 = v26;
      }
      while (1)
      {
        int v31 = sub_1000C328C(0x200uLL);
        *(void *)&v28[2 * v29] = v31;
        if (!v31) {
          break;
        }
        j__memmove(v31, *(const void **)(*((void *)a1 + 4) + 8 * v29++), 0x200uLL);
        if (v30 == v29) {
          goto LABEL_29;
        }
      }
      if (v29)
      {
        uint64_t v38 = v29 + 1;
        do
          sub_1000C321C(*(void *)&v28[2 * (v38-- - 2)]);
        while (v38 > 1);
      }
      goto LABEL_44;
    }
LABEL_29:
    *(void *)(v3 + 32) = v28;
    *(_DWORD *)(v3 + 40) = v26;
    *(_DWORD *)(v3 + 44) = v26;
  }
  uint64_t v32 = *(__int16 *)(v3 + 84) + 1;
  int v33 = (void *)sub_1000C33A0(16 * v32);
  if (v33)
  {
    int v34 = v33;
    j__memmove(v33, *((const void **)a1 + 6), 16 * (int)v32);
    *(void *)(v3 + 48) = v34;
    *(_DWORD *)(v3 + 80) = v32;
    *(void *)(v3 + 128) = 0;
    return v3;
  }
LABEL_44:
  sub_1000D31E4(v3);
  return 0;
}

uint64_t sub_1000D3780(uint64_t a1, int a2, unsigned __int16 a3, __int16 a4, int a5, _DWORD *a6)
{
  return sub_1000D3788(a1, a2, a3, a4, a5, a6, 0);
}

uint64_t sub_1000D3788(uint64_t result, int a2, unsigned __int16 a3, __int16 a4, int a5, _DWORD *a6, __int16 a7)
{
  unsigned __int16 v11 = a3;
  __int16 v12 = a2;
  uint64_t v13 = result;
  *a6 = 0;
  if (*(_DWORD *)(result + 116))
  {
    if (*(__int16 *)(result + 84) == -1)
    {
      *(_DWORD *)(result + 120) = a2;
      LOWORD(v14) = a2;
    }
    else
    {
      int v14 = *(_DWORD *)(result + 120);
    }
    __int16 v12 = v14 - a2;
    unsigned __int16 v11 = v14 - a3;
  }
  int v15 = (__int16)v11 + 1;
  if (v15 >= *(_DWORD *)(result + 80)) {
    goto LABEL_25;
  }
  *(_WORD *)(result + 60) = v15;
  if (v12)
  {
    uint64_t v16 = *(void *)(result + 48);
    if (!*(_DWORD *)(v16 + 16 * v12 - 12)) {
      return result;
    }
    uint64_t v17 = (__int16)v11;
    LODWORD(v18) = *(unsigned __int16 *)(result + 84);
    if (v18 == v11)
    {
LABEL_10:
      int v19 = *(_DWORD *)(result + 56) + 1;
      if (*(_DWORD *)(result + 68)) {
        goto LABEL_11;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v16 = *(void *)(result + 48);
    uint64_t v17 = (__int16)v11;
    LODWORD(v18) = *(unsigned __int16 *)(result + 84);
    if (v18 == v11) {
      goto LABEL_10;
    }
  }
  uint64_t v18 = (__int16)v18;
  if ((__int16)v18 != -1 && !*(_DWORD *)(result + 68))
  {
    int v20 = *(_DWORD *)(v16 + 16 * v18 + 4);
    if (v20) {
      sub_1000D83AC((uint64_t *)result, *(unsigned int *)(v16 + 16 * v18), (v20 + *(_DWORD *)(v16 + 16 * v18) - 1));
    }
  }
  sub_1000D3A04(v13);
  for (int i = (__int16)++*(_WORD *)(v13 + 84); i < (__int16)v11; ++*(_WORD *)(v13 + 84))
  {
    uint64_t v22 = (_DWORD *)(*(void *)(v13 + 48) + 16 * (__int16)i);
    *uint64_t v22 = *(_DWORD *)(v13 + 56);
    v22[1] = 0;
    int i = (__int16)(*(_WORD *)(v13 + 84) + 1);
  }
  *(_DWORD *)(v16 + 16 * (__int16)v11) = *(_DWORD *)(v13 + 56);
  *(_DWORD *)(v16 + 16 * v17 + 12) = a5;
  int v19 = *(_DWORD *)(v13 + 56) + 1;
  if (*(_DWORD *)(v13 + 68))
  {
LABEL_11:
    uint64_t result = sub_1000C3A90((const void **)(v13 + 32), (int *)(v13 + 44), (signed int *)(v13 + 40), 8, 2, v19);
    if (result) {
      goto LABEL_12;
    }
LABEL_25:
    *a6 = 1;
    return result;
  }
LABEL_22:
  uint64_t result = sub_1000C3A90((const void **)v13, (int *)(v13 + 12), (signed int *)(v13 + 8), 8, 8, v19);
  if (!result) {
    goto LABEL_25;
  }
  if (*(_DWORD *)(v13 + 124))
  {
    uint64_t result = sub_1000C3A90((const void **)(v13 + 16), (int *)(v13 + 28), (signed int *)(v13 + 24), 8, 12, v19);
    if (!result) {
      goto LABEL_25;
    }
  }
LABEL_12:
  if (*(_DWORD *)(v13 + 68))
  {
    *(_WORD *)(*(void *)(*(void *)(v13 + 32) + (((unint64_t)*(unsigned int *)(v13 + 56) >> 5) & 0x7FFFFF8))
             + 2 * *(_DWORD *)(v13 + 56)) = a4;
  }
  else
  {
    uint64_t v23 = (_WORD *)(*(void *)(*(void *)v13 + (((unint64_t)*(unsigned int *)(v13 + 56) >> 5) & 0x7FFFFF8))
                  + 8 * *(_DWORD *)(v13 + 56));
    _WORD *v23 = a4;
    v23[1] = v12;
    v23[2] = a5 - *(_WORD *)(v16 + 16 * v17 + 12);
    v23[3] = a7;
  }
  ++*(_DWORD *)(v16 + 16 * v17 + 4);
  ++*(_DWORD *)(v13 + 56);
  return result;
}

uint64_t sub_1000D3A04(uint64_t result)
{
  if (!*(_DWORD *)(result + 124))
  {
    uint64_t v1 = result;
    if ((*(__int16 *)(result + 84) & 0x80000000) == 0)
    {
      int v2 = (unsigned int *)(*(void *)(result + 48) + 16 * *(unsigned __int16 *)(result + 84));
      long long v4 = (int *)(v2 + 1);
      int v3 = v2[1];
      if (v3 >= 2)
      {
        uint64_t v5 = *v2;
        uint64_t v6 = (v3 + v5 - 1);
        if (*(_DWORD *)(result + 68))
        {
          uint64_t result = sub_1000D8920(result, v5, v6);
          LODWORD(v7) = *v2;
          if (*v4 >= 2)
          {
            int v8 = *v4 + v7;
            unsigned int v9 = v7 + 1;
            int v10 = *(unsigned __int16 *)(*(void *)(*(void *)(v1 + 32) + (((unint64_t)*v2 >> 5) & 0x7FFFFF8))
                                      + 2 * *v2);
            do
            {
              int v11 = v10;
              uint64_t v12 = *(void *)(v1 + 32);
              int v10 = *(unsigned __int16 *)(*(void *)(v12 + 8 * (v9 >> 8)) + 2 * v9);
              if (v10 != v11)
              {
                LODWORD(v7) = v7 + 1;
                *(_WORD *)(*(void *)(v12 + 8 * (v7 >> 8)) + 2 * v7) = v10;
              }
              ++v9;
            }
            while ((int)v9 < v8);
          }
        }
        else
        {
          uint64_t result = sub_1000D83AC((uint64_t *)result, v5, v6);
          unint64_t v7 = *v2;
          if (*v4 >= 2)
          {
            int v13 = *v4 + v7;
            unsigned int v14 = v7 + 1;
            int v15 = (unsigned __int16 *)(*(void *)(*(void *)v1 + ((v7 >> 5) & 0x7FFFFF8)) + 8 * v7);
            LODWORD(v16) = *v15;
            do
            {
              uint64_t v17 = *(void *)(*(void *)v1 + 8 * (v14 >> 8));
              uint64_t v18 = (unsigned __int16 *)(v17 + 8 * v14);
              if (*v18 != v16 || *(unsigned __int16 *)(v17 + 8 * v14 + 2) != v15[1])
              {
                LODWORD(v7) = v7 + 1;
                int v15 = (unsigned __int16 *)(*(void *)(*(void *)v1 + 8 * (v7 >> 8))
                                         + 8 * v7);
                uint64_t v16 = *(void *)v18;
                *(void *)int v15 = *(void *)v18;
                LODWORD(v16) = (unsigned __int16)v16;
              }
              ++v14;
            }
            while ((int)v14 < v13);
          }
        }
        int v19 = v7 + 1;
        *(_DWORD *)(v1 + 56) = v19;
        *long long v4 = v19 - *v2;
      }
    }
  }
  return result;
}

uint64_t sub_1000D3BAC(uint64_t a1, int a2, int a3, int a4, int a5, unsigned __int16 a6, __int16 a7, __int16 a8, int a9, int a10, _DWORD *a11)
{
  unint64_t v16 = *(unsigned int *)(a1 + 56);
  uint64_t result = sub_1000D3788(a1, a5, a6, a7, a9, a11, 0);
  if (*(_DWORD *)(a1 + 56) != v16)
  {
    int v18 = a2 == 0;
    if (a3) {
      int v18 = 2;
    }
    if (a4) {
      BOOL v19 = a3 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    uint64_t v20 = *(void *)(*(void *)(a1 + 16) + ((v16 >> 5) & 0x7FFFFF8)) + 12 * v16;
    *(_DWORD *)uint64_t v20 = v18;
    if (v19) {
      __int16 v21 = a8;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)(v20 + 6) = v21;
    *(_WORD *)(v20 + 4) = a8;
    *(_DWORD *)(v20 + 8) = a10;
  }
  return result;
}

uint64_t sub_1000D3C70(uint64_t a1, _WORD *a2, _DWORD *a3, int a4, int a5)
{
  LODWORD(v6) = a4;
  int v10 = *(__int16 *)(a1 + 84);
  if (v10 <= a5)
  {
    if (v10 < a5) {
      return 0;
    }
    if (*(_DWORD *)(a1 + 68))
    {
      sub_1000D3A04(a1);
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 48);
      int v13 = *(_DWORD *)(v12 + 16 * *(__int16 *)(a1 + 84) + 4);
      if (v13)
      {
        uint64_t v14 = *(unsigned int *)(v12 + 16 * *(__int16 *)(a1 + 84));
        sub_1000D83AC((uint64_t *)a1, v14, (v13 + v14 - 1));
      }
    }
  }
  uint64_t v15 = *(void *)(a1 + 48);
  int v16 = *(_DWORD *)(v15 + 16 * a5 + 4);
  if (!v16) {
    return 0;
  }
  unsigned int v17 = *(_DWORD *)(v15 + 16 * a5);
  int v18 = v17 + v16;
  if (!*(_DWORD *)(a1 + 68))
  {
    if (v16 >= 1)
    {
      LODWORD(result) = 0;
      int v20 = *(_DWORD *)(v15 + 16 * a5 + 12);
      while (1)
      {
        uint64_t v21 = *(void *)(*(void *)a1 + 8 * (v17 >> 8));
        uint64_t result = result;
        int v22 = *(unsigned __int16 *)(v21 + 8 * v17);
        if (v22 != 65534)
        {
          int v23 = v20 + *(__int16 *)(v21 + 8 * v17 + 4);
          if ((int)result >= 1)
          {
            uint64_t v24 = 0;
            int v25 = 0x7FFFFFFF;
            int v26 = -1;
            while (1)
            {
              int v27 = a3[v24];
              if ((unsigned __int16)a2[v24] == v22) {
                break;
              }
              if (v27 > v26)
              {
                int v25 = v24;
                int v26 = a3[v24];
              }
              if (result == ++v24)
              {
                uint64_t v24 = v25;
                if ((int)result < (int)v6) {
                  goto LABEL_22;
                }
                goto LABEL_34;
              }
            }
            if (v27 <= v23) {
              goto LABEL_23;
            }
            goto LABEL_37;
          }
          int v26 = -1;
          uint64_t v24 = 0x7FFFFFFFLL;
          if ((int)result < (int)v6)
          {
LABEL_22:
            a2[(int)result] = v22;
            a3[(int)result] = v23;
            uint64_t result = (result + 1);
          }
          else
          {
LABEL_34:
            if (v26 > v23)
            {
              a2[v24] = v22;
LABEL_37:
              a3[v24] = v23;
            }
          }
        }
LABEL_23:
        if ((int)++v17 >= v18) {
          return result;
        }
      }
    }
    return 0;
  }
  if (v16 >= 1) {
    v16 -= *(__int16 *)(*(void *)(*(void *)(a1 + 32) + 8 * ((v18 - 1) >> 8))
  }
                      + 2 * (v18 - 1)) == -2;
  if (v16 >= (int)v6) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = v16;
  }
  if ((int)v6 >= 1)
  {
    uint64_t v19 = v6;
    do
    {
      *a2++ = *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8 * (v17 >> 8)) + 2 * v17);
      ++v17;
      --v19;
    }
    while (v19);
  }
  bzero(a3, 4 * (int)v6);
  return v6;
}

uint64_t sub_1000D3EB4(uint64_t result, uint64_t a2, int a3, int a4)
{
  if (*(__int16 *)(result + 60) < 1) {
    goto LABEL_9;
  }
  uint64_t v4 = *(void *)(result + 48);
  uint64_t v5 = *(unsigned __int16 *)(result + 60);
  if (v5 == 1)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (unsigned __int16)v5 & 0xFFFE;
    uint64_t v7 = v4 + 16;
    uint64_t v8 = v6;
    do
    {
      *(void *)(v7 - 16) = 0;
      *(void *)uint64_t v7 = 0;
      *(_DWORD *)(v7 - 8) = 0;
      *(_DWORD *)(v7 + 8) = 0;
      v7 += 32;
      v8 -= 2;
    }
    while (v8);
    if (v6 == v5) {
      goto LABEL_9;
    }
  }
  uint64_t v9 = v5 - v6;
  int v10 = (_DWORD *)(v4 + 16 * v6 + 8);
  do
  {
    *((void *)v10 - 1) = 0;
    *int v10 = 0;
    v10 += 4;
    --v9;
  }
  while (v9);
LABEL_9:
  *(_DWORD *)(result + 56) = 0;
  *(_WORD *)(result + 60) = 0;
  *(_WORD *)(result + 84) = -1;
  *(_DWORD *)(result + 112) = a4;
  *(_DWORD *)(result + 64) = 0;
  *(_DWORD *)(result + 140) = 0;
  if (a3)
  {
    *(_WORD *)(result + 104) = *(_WORD *)(a2 + 2 * (a3 - 1));
    *(_DWORD *)(result + 108) = 1;
  }
  else
  {
    *(_WORD *)(result + 104) = -1;
    *(_DWORD *)(result + 108) = 0;
  }
  return result;
}

uint64_t sub_1000D3F70(uint64_t a1, int a2, unint64_t a3, int a4, _DWORD *a5, void *a6, unsigned int a7)
{
  if (qword_100101CC0)
  {
    int v14 = *(_DWORD *)(qword_100101CC0 + 1136);
    uint64_t v15 = (_DWORD *)sub_1000C33A0((uint64_t)v14 << 7);
    if (v15) {
      goto LABEL_3;
    }
LABEL_31:
    *a5 = 0x40000000;
LABEL_34:
    sub_1000C321C((uint64_t)v15);
    return 0;
  }
  int v14 = 0;
  uint64_t v15 = (_DWORD *)sub_1000C33A0(0);
  if (!v15) {
    goto LABEL_31;
  }
LABEL_3:
  int v16 = v15;
  if (*(_WORD *)(a1 + 60))
  {
    if ((int)sub_1000D4308(a1, v15, v14, 0, *(__int16 *)(a1 + 84), a1 + 104, *(_DWORD *)(a1 + 108), 0xFFFFu, a6, a7) > a2) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
  if (a2 >= 0)
  {
LABEL_33:
    *a5 = 0x40000000;
    uint64_t v15 = v16;
    goto LABEL_34;
  }
LABEL_5:
  unsigned int v17 = &v16[32 * (uint64_t)a2];
  *a5 = v17[3];
  uint64_t result = v17[1];
  if ((int)result >= a4) {
    int v19 = a4;
  }
  else {
    int v19 = v17[1];
  }
  if (v19 >= 1)
  {
    unsigned int v20 = (int)result >= a4 ? a4 : result;
    uint64_t v21 = (int)v20;
    if (v20 < 0x20) {
      goto LABEL_26;
    }
    int v22 = result - v20;
    BOOL v23 = (int)result - 1 >= v22 && (unint64_t)(v21 - 1) >> 32 == 0;
    if (!v23) {
      goto LABEL_26;
    }
    unint64_t v24 = (unint64_t)&v16[32 * (uint64_t)a2 + 4] + 2 * v22;
    if (v24 + 2 * v21 > a3 && v24 < a3 + 2 * v21) {
      goto LABEL_26;
    }
    int v26 = (int8x16_t *)(a3 + 2 * v21 - 16);
    unint64_t v27 = v21 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      int v28 = (int16x8_t *)((char *)&v16[32 * (uint64_t)a2] + 2 * v22);
      int8x16_t v29 = (int8x16_t)vrev64q_s16(v28[1]);
      int8x16_t v30 = vextq_s8(v29, v29, 8uLL);
      int8x16_t v31 = (int8x16_t)vrev64q_s16(v28[2]);
      v26[-1] = vextq_s8(v31, v31, 8uLL);
      *int v26 = v30;
      v26 -= 2;
      v22 += 16;
      v27 -= 16;
    }
    while (v27);
    BOOL v23 = (v21 & 0xFFFFFFFFFFFFFFF0) == v21;
    v21 &= 0xFu;
    if (!v23)
    {
LABEL_26:
      int v32 = result - v21;
      do
        *(_WORD *)(a3 - 2 + 2 * v21) = *((_WORD *)&v16[32 * (uint64_t)a2 + 4] + v32++);
      while (v21-- > 1);
    }
  }
  return result;
}

uint64_t sub_1000D4160(void *a1, int a2, int a3, char *__src)
{
  if (!a2) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = __src + 4;
  size_t v9 = 4 * (a3 - 1);
  do
  {
    int v10 = (unsigned int *)(a1[6] + 16 * (__int16)(a2 - 1));
    int v11 = v10[1];
    if (v11 < 1)
    {
      uint64_t v12 = 0;
      int v16 = MEMORY[0];
      if (MEMORY[0] == 65534) {
        goto LABEL_5;
      }
LABEL_14:
      if ((int)v7 >= a3)
      {
        j__memmove(v8, __src, v9);
        *(_DWORD *)char __src = sub_1000BD96C(a1[12], *v12);
      }
      else
      {
        *(_DWORD *)&__src[4 * ~v7 + 4 * a3] = sub_1000BD96C(a1[12], v16);
      }
      uint64_t v7 = (v7 + 1);
      goto LABEL_5;
    }
    uint64_t v12 = 0;
    unsigned int v13 = *v10;
    int v14 = v11 + v13;
    __int16 v15 = 0x4000;
    do
    {
      if (*(__int16 *)(*(void *)(*a1 + 8 * (v13 >> 8)) + 8 * v13 + 4) < v15)
      {
        uint64_t v12 = (unsigned __int16 *)(*(void *)(*a1 + 8 * (v13 >> 8)) + 8 * v13);
        __int16 v15 = v12[2];
      }
      ++v13;
    }
    while ((int)v13 < v14);
    int v16 = *v12;
    if (v16 != 65534) {
      goto LABEL_14;
    }
LABEL_5:
    LOWORD(a2) = v12[1];
  }
  while ((_WORD)a2);
  if ((int)v7 < a3) {
    j__memmove(__src, &__src[4 * a3 + -4 * (int)v7], 4 * (int)v7);
  }
  return v7;
}

uint64_t sub_1000D42AC(uint64_t a1, _DWORD *a2, int a3, unsigned int a4, void *a5, unsigned int a6)
{
  if (*(_WORD *)(a1 + 60)) {
    return sub_1000D4308(a1, a2, a3, 0, *(__int16 *)(a1 + 84), a1 + 104, *(_DWORD *)(a1 + 108), a4, a5, a6);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000D4308(uint64_t a1, _DWORD *a2, int a3, unsigned __int16 a4, int a5, uint64_t a6, unsigned int a7, unsigned int a8, void *a9, unsigned int a10)
{
  if (*(_DWORD *)(a1 + 124) && !*(_DWORD *)(a1 + 64))
  {
    int v29 = a3;
    uint64_t v30 = a1;
    if (!sub_1000D6224((void **)a1)) {
      return 0;
    }
    *(_DWORD *)(v30 + 64) = 1;
    a1 = v30;
    a3 = v29;
    if (!v29) {
      return 0;
    }
  }
  else if (!a3)
  {
    return 0;
  }
  if (!*(_DWORD *)(a1 + 56)) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 116))
  {
    int v15 = *(_DWORD *)(a1 + 120);
    unsigned __int16 v16 = v15 - a5;
    if (v15 >= a5)
    {
      LOWORD(a5) = v15 - a4;
      a4 = v16;
      goto LABEL_8;
    }
    return 0;
  }
LABEL_8:
  if (*(__int16 *)(a1 + 84) < (__int16)a5) {
    return 0;
  }
  int v372 = a3;
  uint64_t v395 = a1;
  if (!sub_100025E5C(a9, a10)) {
    return 0;
  }
  int v17 = *(__int16 *)(v395 + 60);
  if (v17 <= (__int16)a5) {
    __int16 v18 = v17 - 1;
  }
  else {
    __int16 v18 = a5;
  }
  uint64_t v19 = *(void *)(v395 + 48);
  unsigned int v20 = (int *)(v19 + 16 * v18);
  int v21 = v20[1];
  if (v21 < 1) {
    goto LABEL_50;
  }
  uint64_t v361 = a6;
  unsigned int v362 = a7;
  unsigned int v363 = a8;
  uint64_t v22 = 0;
  int v23 = *v20;
  int v24 = v21 + *v20;
  int v25 = (_DWORD *)(v19 + 16 * v18 + 12);
  int v26 = a2;
  uint64_t v407 = (uint64_t)a2;
  uint64_t v27 = v395;
  int v28 = v372;
  do
  {
    uint64_t v35 = v23 >> 8;
    uint64_t v36 = *(void *)(*(void *)v27 + 8 * v35);
    uint64_t v37 = (unsigned __int16 *)(v36 + 8 * v23);
    if (*(_DWORD *)(v27 + 116))
    {
      if ((__int16)*v37 == -2) {
        goto LABEL_26;
      }
      __int16 v38 = *(_WORD *)(v36 + 8 * v23 + 2);
    }
    else
    {
      __int16 v38 = *(_WORD *)(v36 + 8 * v23 + 2);
      if (!v38) {
        goto LABEL_26;
      }
    }
    if (v38 >= (__int16)a4)
    {
      if (!a10 || (__int16)*v37 == -2 || (v39 = sub_100026260((uint64_t)a9, a10), v28 = v372, uint64_t v27 = v395, v39))
      {
        if (!*(_DWORD *)(v27 + 124)
          || !*(_WORD *)(*(void *)(*(void *)(v27 + 16) + 8 * v35) + 12 * v23 + 6))
        {
          int v40 = *v25 + *(__int16 *)(v36 + 8 * v23 + 4);
          if ((int)v22 < v28) {
            goto LABEL_43;
          }
          int v26 = 0;
          int v41 = -1;
          int v42 = v22;
          int64x2_t v43 = a2;
          do
          {
            if (v43[3] > v41)
            {
              int v26 = v43;
              int v41 = v43[3];
            }
            v43 += 32;
            --v42;
          }
          while (v42);
          uint64_t v27 = v395;
          if (v40 < v26[3])
          {
LABEL_43:
            int v44 = *v37;
            if (v44 == 65534)
            {
              int v33 = 0;
            }
            else
            {
              *((_WORD *)v26 + 8) = v44;
              *((unsigned char *)v26 + 89) = 0;
              int v33 = 1;
            }
            *((unsigned char *)v26 + 88) = 0;
            *int v26 = v23;
            v26[1] = v33;
            BOOL v34 = (int)v22 < v28;
            v26[2] = 0;
            v26[3] = v40;
            if ((int)v22 >= v28) {
              uint64_t v22 = v22;
            }
            else {
              uint64_t v22 = (v22 + 1);
            }
            *((_WORD *)v26 + 62) = 0;
            if (v34) {
              v26 += 32;
            }
          }
        }
      }
    }
LABEL_26:
    ++v23;
  }
  while (v23 < v24);
  uint64_t v45 = v22;
  if (!v22 || (int v46 = v28, (v47 = sub_1000C33A0(2 * v28)) == 0))
  {
LABEL_50:
    uint64_t v31 = 0;
    goto LABEL_460;
  }
  int v48 = (unsigned __int16 *)v47;
  int v49 = v46;
  if (v46 >= 1)
  {
    if (v46 < 0x10)
    {
      uint64_t v50 = 0;
      goto LABEL_54;
    }
    uint64_t v50 = v46 & 0xFFFFFFF0;
    int16x8_t v51 = (int16x8_t)xmmword_1000F48A0;
    uint64_t v52 = (int16x8_t *)(v47 + 16);
    v53.i64[0] = 0x8000800080008;
    v53.i64[1] = 0x8000800080008;
    v54.i64[0] = 0x10001000100010;
    v54.i64[1] = 0x10001000100010;
    uint64_t v55 = v50;
    do
    {
      v52[-1] = v51;
      int16x8_t *v52 = vaddq_s16(v51, v53);
      int16x8_t v51 = vaddq_s16(v51, v54);
      v52 += 2;
      v55 -= 16;
    }
    while (v55);
    for (; v46 != v50; ++v50)
LABEL_54:
      *(_WORD *)(v47 + 2 * v50) = v50;
  }
  int v56 = a2[1];
  if ((int)v22 > 1)
  {
    if (v22 == 2)
    {
      uint64_t v57 = 1;
      goto LABEL_67;
    }
    int v58 = a2[1];
    uint64_t v57 = (v22 - 1) | 1;
    double v59 = a2 + 65;
    unint64_t v60 = (v22 - 1) & 0xFFFFFFFFFFFFFFFELL;
    int v61 = v58;
    do
    {
      if (*(v59 - 32) < v58) {
        int v58 = *(v59 - 32);
      }
      if (*v59 < v61) {
        int v61 = *v59;
      }
      v59 += 64;
      v60 -= 2;
    }
    while (v60);
    if (v58 >= v61) {
      int v58 = v61;
    }
    int v56 = v58;
    if (v22 - 1 != ((v22 - 1) & 0xFFFFFFFFFFFFFFFELL))
    {
LABEL_67:
      double v62 = &a2[32 * v57 + 1];
      uint64_t v63 = v22 - v57;
      do
      {
        int v65 = *v62;
        v62 += 32;
        int v64 = v65;
        if (v65 < v56) {
          int v56 = v64;
        }
        --v63;
      }
      while (v63);
    }
  }
  int v371 = v56;
  BOOL v66 = v56 != 1 || qword_100101CC0 == 0;
  if (!v66 && *(_DWORD *)(qword_100101CC0 + 992))
  {
    sub_1000D6960(v395, (uint64_t)a2, v22, v361, v362, v363, v48, 1);
    int v49 = v372;
  }
  uint64_t v360 = v49;
  qword_100106A10 = (uint64_t)a2;
  qsort(v48, (int)v22, 2uLL, (int (__cdecl *)(const void *, const void *))sub_1000D6EDC);
  v394 = (char *)a2 + 14;
  uint64_t v387 = (uint64_t)v48;
  uint64_t v67 = v395;
  while (2)
  {
    signed int v68 = v371;
    int v409 = 0;
    int v408 = v45;
    int v392 = v371;
    if (!*(_DWORD *)(v67 + 116))
    {
      if ((int)v45 < 1) {
        goto LABEL_179;
      }
      int v131 = 0;
      int v370 = 1;
      int v371 = 0x7FFFFFFF;
      int v132 = v48;
LABEL_247:
      v180 = v132++;
      v379 = v132;
      __dstb = v180;
      int v375 = v131;
      while (1)
      {
        uint64_t v181 = *v180;
        v183 = &a2[32 * v181];
        unint64_t v184 = *v183;
        if (v184 == 0x7FFFFFFF) {
          goto LABEL_246;
        }
        v402 = (long long *)&a2[32 * v181];
        signed int v187 = v183[1];
        v186 = (int *)(v183 + 1);
        signed int v185 = v187;
        if (v187 > v68) {
          goto LABEL_320;
        }
        uint64_t v188 = *(void *)v67;
        uint64_t v189 = *(void *)(*(void *)v67 + ((v184 >> 5) & 0x7FFFFF8));
        v190 = (__int16 *)(v189 + 8 * v184);
        if (*v190 == -2)
        {
          int v191 = *(unsigned __int16 *)(v189 + 8 * v184 + 2);
          if (!v191)
          {
            *(_DWORD *)v402 = 0x7FFFFFFF;
            uint64_t v67 = v395;
            goto LABEL_246;
          }
          if ((__int16)v191 < 1)
          {
LABEL_263:
            int v201 = 0x40000000;
            goto LABEL_277;
          }
        }
        else
        {
          int v191 = (unsigned __int16)v190[1];
          if ((__int16)v191 < 1) {
            goto LABEL_263;
          }
        }
        uint64_t v192 = *(void *)(v395 + 48);
        uint64_t v193 = (v191 - 1);
        v194 = (unsigned int *)(v192 + 16 * v193);
        int v195 = v194[1];
        if (v195 < 1) {
          goto LABEL_263;
        }
        unsigned int v196 = *v194;
        int v197 = v195 + v196;
        int v198 = *(_DWORD *)(v192 + 16 * v193 + 12);
        if (v197 <= (int)(v196 + 1)) {
          unsigned int v199 = v196 + 1;
        }
        else {
          unsigned int v199 = v197;
        }
        unsigned int v200 = v199 - v196;
        if (v199 - v196 >= 2)
        {
          unsigned int v202 = v196 + (v200 & 0xFFFFFFFE);
          int v203 = 0x40000000;
          unsigned int v204 = v200 & 0xFFFFFFFE;
          int v205 = 0x40000000;
          do
          {
            if (v198 + *(__int16 *)(*(void *)(v188 + 8 * (v196 >> 8)) + 8 * v196 + 4) < v203) {
              int v203 = v198 + *(__int16 *)(*(void *)(v188 + 8 * (v196 >> 8)) + 8 * v196 + 4);
            }
            if (v198
               + *(__int16 *)(*(void *)(v188 + 8 * ((v196 + 1) >> 8)) + 8 * (v196 + 1) + 4) < v205)
              int v205 = v198
                   + *(__int16 *)(*(void *)(v188 + 8 * ((v196 + 1) >> 8)) + 8 * (v196 + 1) + 4);
            v196 += 2;
            v204 -= 2;
          }
          while (v204);
          if (v203 >= v205) {
            int v201 = v205;
          }
          else {
            int v201 = v203;
          }
          if (v200 == (v200 & 0xFFFFFFFE)) {
            goto LABEL_277;
          }
        }
        else
        {
          int v201 = 0x40000000;
          unsigned int v202 = v196;
        }
        do
        {
          if (v198 + *(__int16 *)(*(void *)(v188 + 8 * (v202 >> 8)) + 8 * v202 + 4) < v201) {
            int v201 = v198 + *(__int16 *)(*(void *)(v188 + 8 * (v202 >> 8)) + 8 * v202 + 4);
          }
          ++v202;
        }
        while ((int)v202 < v197);
LABEL_277:
        if (v191 == a4)
        {
          uint64_t v67 = v395;
          if (v185)
          {
            v221 = &a2[32 * v181];
            int v222 = v221[3] - v201;
            v221[3] = v222;
            *(_DWORD *)v402 = 0x7FFFFFFF;
            int v409 = v131;
            if (v131 >= 1)
            {
              do
              {
                if (a2[32 * (unint64_t)v48[v409 - 1] + 3] <= v222) {
                  break;
                }
                --v409;
              }
              while (v409 > 0);
            }
            if (v409 != v131)
            {
              unsigned __int16 v223 = *__dstb;
              v224 = &v48[v409];
              j__memmove(v224 + 1, v224, 2 * (v131 - v409));
              uint64_t v67 = v395;
              unsigned __int16 *v224 = v223;
              int v132 = v379;
            }
            goto LABEL_320;
          }
          uint64_t v45 = (v45 - 1);
          int v408 = v45;
          if (v45)
          {
            size_t v182 = 2 * ((int)v45 - v131);
            v180 = __dstb;
            goto LABEL_249;
          }
LABEL_458:
          uint64_t v31 = 0;
          goto LABEL_459;
        }
        uint64_t v67 = v395;
        v206 = (unsigned int *)(*(void *)(v395 + 48) + 16 * ((__int16)v191 - 1));
        int v207 = v206[1];
        if (v207 < 1) {
          goto LABEL_304;
        }
        v208 = 0;
        uint64_t v209 = *v206;
        int v210 = v207 + *v206;
        v398 = v206 + 3;
        v382 = &a2[32 * v181 + 3];
        uint64_t v211 = 0x7FFFFFFFLL;
        do
        {
          uint64_t v212 = v211;
          v213 = v208;
          uint64_t v214 = *(void *)(*(void *)v67 + 8 * (v209 >> 8));
          v208 = (unsigned __int16 *)(v214 + 8 * v209);
          uint64_t v215 = *v186;
          if (v215 == 35)
          {
            if ((__int16)*v208 != -2) {
              goto LABEL_283;
            }
            if (*(_WORD *)(v214 + 8 * v209 + 2)) {
              goto LABEL_283;
            }
            int v216 = 0;
            if ((__int16)a4 > 0) {
              goto LABEL_283;
            }
          }
          else
          {
            int v216 = *(unsigned __int16 *)(v214 + 8 * v209 + 2);
            if ((__int16)v216 < (__int16)a4) {
              goto LABEL_283;
            }
          }
          int v217 = *v208;
          if (!v215 && (!v216 ? (BOOL v218 = v217 == 65534) : (BOOL v218 = 0), v218)
            || a10
            && v217 != 65534
            && (*(_WORD *)(v407 + (v181 << 7) + 2 * v215 + 16) = v217,
                int v219 = sub_100026260((uint64_t)a9, a10),
                uint64_t v67 = v395,
                !v219))
          {
LABEL_283:
            uint64_t v211 = v212;
            v208 = v213;
            a2 = (_DWORD *)v407;
            goto LABEL_284;
          }
          int v220 = *v398 + *(__int16 *)(v214 + 8 * v209 + 4);
          a2 = (_DWORD *)v407;
          if (v213 || (uint64_t v211 = v209, v220 != v201))
          {
            sub_1000D8A54((void *)v67, v407, v402, &v408, v372, v220 - v201 + *v382, v209, v387, 0, *(_DWORD *)(v67 + 112));
            uint64_t v67 = v395;
            uint64_t v211 = v212;
            v208 = v213;
          }
LABEL_284:
          uint64_t v209 = (v209 + 1);
        }
        while ((int)v209 < v210);
        if (v208)
        {
          *(_DWORD *)v402 = v211;
          int v225 = *v208;
          int v48 = (unsigned __int16 *)v387;
          int v131 = v375;
          int v132 = v379;
          if (v225 == 65534)
          {
            int v226 = v208[1];
            signed int v68 = v392;
            if (v226)
            {
              uint64_t v227 = *v186;
              if (v227) {
                *((unsigned char *)&a2[32 * v181 + 21] + v227 + 3) = 1;
              }
            }
          }
          else
          {
            v228 = &a2[32 * v181];
            *((_WORD *)v228 + *v186 + 8) = v225;
            uint64_t v229 = *v186;
            if (v208[3] && *v186 >= 1) {
              *((unsigned char *)&a2[32 * v181 + 22] + (v229 - 1)) = 1;
            }
            uint64_t v230 = v229 + 1;
            int *v186 = v230;
            *((unsigned char *)v228 + v230 + 88) = 0;
            uint64_t v67 = v395;
            signed int v68 = v392;
          }
LABEL_320:
          if (*(_DWORD *)v402 != 0x7FFFFFFF)
          {
            int v231 = v371;
            if (*v186 < v371) {
              int v231 = *v186;
            }
            int v370 = 0;
            int v371 = v231;
          }
LABEL_246:
          ++v131;
          uint64_t v45 = v408;
          if (v131 >= v408) {
            goto LABEL_327;
          }
          goto LABEL_247;
        }
        LODWORD(v45) = v408;
        int v48 = (unsigned __int16 *)v387;
        signed int v68 = v392;
        int v131 = v375;
        int v132 = v379;
LABEL_304:
        uint64_t v45 = (v45 - 1);
        int v408 = v45;
        if (!v45) {
          goto LABEL_458;
        }
        v180 = __dstb;
        if ((int)v45 <= v131) {
          goto LABEL_320;
        }
        LOWORD(v181) = *__dstb;
        size_t v182 = 2 * ((int)v45 - v131);
LABEL_249:
        j__memmove(v180, v132, v182);
        v48[(int)v45] = v181;
        uint64_t v67 = v395;
        if (v131 >= (int)v45) {
          goto LABEL_327;
        }
      }
    }
    int v413 = 0;
    int v412 = v45;
    __int16 v411 = 0;
    int v410 = 0;
    if (!*(_DWORD *)(v67 + 124))
    {
      if ((int)v45 >= 1)
      {
        int v133 = 0;
        int v370 = 1;
        int v371 = 0x7FFFFFFF;
        __dsta = v48;
        while (1)
        {
          uint64_t v134 = __dsta++;
          int v367 = v133;
          __srca = v134;
          while (1)
          {
            uint64_t v401 = *v134;
            uint64_t v137 = &a2[32 * v401];
            unint64_t v138 = *v137;
            if (v138 == 0x7FFFFFFF) {
              goto LABEL_181;
            }
            v397 = (long long *)&a2[32 * v401];
            signed int v140 = v137[1];
            uint64_t v139 = (int *)(v137 + 1);
            if (v140 > v68) {
              goto LABEL_240;
            }
            uint64_t v141 = *(void *)(*(void *)v67 + ((v138 >> 5) & 0x7FFFFF8));
            uint64_t v142 = v138;
            uint64_t v143 = (unsigned __int16 *)(v141 + 8 * v138);
            if ((__int16)*v143 == -2 && !*(_WORD *)(v141 + 8 * v138 + 2))
            {
              *(_DWORD *)v397 = 0x7FFFFFFF;
              goto LABEL_181;
            }
            int v144 = v45;
            uint64_t v145 = sub_1000D8F9C((void *)v67, v143, &v410, &v411);
            int v146 = v410;
            if (v145 == 0x7FFFFFFF && v410 == 0)
            {
              uint64_t v67 = v395;
              *(_DWORD *)v397 = 0x7FFFFFFF;
              signed int v68 = v392;
              goto LABEL_181;
            }
            uint64_t v148 = v145;
            LOWORD(v149) = qword_100101CC0;
            if (qword_100101CC0) {
              uint64_t v149 = *(void *)(qword_100101CC0 + 1704);
            }
            uint64_t v67 = v395;
            __int16 v150 = v411 + v149;
            v411 += v149;
            int v151 = *(unsigned __int16 *)(v141 + 8 * v142 + 2);
            if (v151 == a4) {
              break;
            }
            v152 = (unsigned int *)(*(void *)(v395 + 48) + 16 * ((__int16)v151 - 1));
            int v153 = v152[1];
            if (v153 < 1) {
              goto LABEL_224;
            }
            __int16 v378 = v150;
            v154 = a2;
            v155 = 0;
            unsigned int v156 = *v152;
            signed int v157 = v153 + *v152;
            v374 = v152 + 3;
            v369 = &v154[32 * v401 + 3];
            uint64_t v158 = 0x7FFFFFFFLL;
            do
            {
              uint64_t v159 = v158;
              v160 = v155;
              uint64_t v161 = *(void *)(*(void *)v67 + 8 * (v156 >> 8));
              v155 = (__int16 *)(v161 + 8 * v156);
              uint64_t v162 = *v139;
              if (v162 == 35)
              {
                if (*v155 != -2) {
                  goto LABEL_220;
                }
                if (*(_WORD *)(v161 + 8 * v156 + 2)) {
                  goto LABEL_220;
                }
                int v163 = 0;
                if ((__int16)a4 > 0) {
                  goto LABEL_220;
                }
              }
              else
              {
                int v163 = *(unsigned __int16 *)(v161 + 8 * v156 + 2);
                if ((__int16)v163 < (__int16)a4) {
                  goto LABEL_220;
                }
              }
              int v164 = (unsigned __int16)*v155;
              if (v162 || (!v163 ? (BOOL v165 = v164 == 65534) : (BOOL v165 = 0), !v165))
              {
                if (!a10
                  || v164 == 65534
                  || (*(_WORD *)(v407 + (v401 << 7) + 2 * v162 + 16) = v164,
                      int v166 = sub_100026260((uint64_t)a9, a10),
                      uint64_t v67 = v395,
                      v166))
                {
                  uint64_t v158 = v148;
                  if (v148 == v156) {
                    goto LABEL_221;
                  }
                  int v167 = *v374 - v146 + *(__int16 *)(v161 + 8 * v156 + 4);
                  if (v167 < 0) {
                    __int16 v168 = *(_WORD *)v374 - v146 + *(_WORD *)(v161 + 8 * v156 + 4);
                  }
                  else {
                    __int16 v168 = 0;
                  }
                  sub_1000D8A54((void *)v67, v407, v397, &v412, v372, (v167 & ~(v167 >> 31)) + *v369, v156, v387, v378 - v168, *(_DWORD *)(v67 + 112));
                  uint64_t v67 = v395;
                }
              }
LABEL_220:
              uint64_t v158 = v159;
              v155 = v160;
LABEL_221:
              ++v156;
            }
            while ((int)v156 < v157);
            if (v155)
            {
              *(_DWORD *)v397 = v158;
              int v173 = (unsigned __int16)*v155;
              int v48 = (unsigned __int16 *)v387;
              signed int v68 = v392;
              int v133 = v367;
              if (v173 == 65534)
              {
                int v174 = (unsigned __int16)v155[1];
                a2 = (_DWORD *)v407;
                if (v174)
                {
                  uint64_t v175 = *v139;
                  if (v175) {
                    *(unsigned char *)(v407 + (v401 << 7) + v175 + 88) = 1;
                  }
                }
              }
              else
              {
                uint64_t v176 = v407 + (v401 << 7);
                *(_WORD *)(v176 + 2 * *v139 + 16) = v173;
                uint64_t v177 = *v139;
                if ((int)v177 >= 1)
                {
                  *(unsigned char *)(v176 + (v177 - 1) + 88) = *((unsigned char *)v155 + 6);
                  uint64_t v67 = v395;
                }
                uint64_t v178 = v177 + 1;
                *uint64_t v139 = v178;
                *(unsigned char *)(v176 + v178 + 88) = 0;
                *(_WORD *)(v176 + 124) += v378;
                a2 = (_DWORD *)v407;
              }
              goto LABEL_240;
            }
            int v144 = v412;
            a2 = (_DWORD *)v407;
            int v48 = (unsigned __int16 *)v387;
            int v133 = v367;
LABEL_224:
            uint64_t v45 = (v144 - 1);
            int v412 = v144 - 1;
            if (v144 == 1) {
              goto LABEL_244;
            }
            signed int v68 = v392;
            uint64_t v134 = __srca;
            if ((int)v45 <= v133) {
              goto LABEL_240;
            }
            unsigned __int16 v135 = *__srca;
            size_t v136 = 2 * ((int)v45 - v133);
LABEL_184:
            j__memmove(v134, __dsta, v136);
            v48[(int)v45] = v135;
            uint64_t v67 = v395;
            if (v133 >= (int)v45) {
              goto LABEL_327;
            }
          }
          uint64_t v134 = __srca;
          if (!*v139)
          {
            unsigned __int16 v135 = *__srca;
            uint64_t v45 = (v144 - 1);
            int v412 = v144 - 1;
            if (v144 != 1)
            {
              size_t v136 = 2 * ((int)v45 - v133);
              signed int v68 = v392;
              goto LABEL_184;
            }
LABEL_244:
            signed int v68 = v392;
            int v370 = 1;
            int v371 = v392;
            goto LABEL_327;
          }
          v169 = &a2[32 * v401];
          int v170 = v169[3] - v410;
          v169[3] = v170;
          *(_DWORD *)v397 = 0x7FFFFFFF;
          int v413 = v133;
          if (v133 >= 1)
          {
            do
            {
              if (a2[32 * (unint64_t)v48[v413 - 1] + 3] <= v170) {
                break;
              }
              --v413;
            }
            while (v413 > 0);
          }
          signed int v68 = v392;
          if (v413 != v133)
          {
            unsigned __int16 v171 = *__srca;
            v172 = &v48[v413];
            j__memmove(v172 + 1, v172, 2 * (v133 - v413));
            uint64_t v67 = v395;
            unsigned __int16 *v172 = v171;
          }
LABEL_240:
          if (*(_DWORD *)v397 != 0x7FFFFFFF)
          {
            int v179 = v371;
            if (*v139 < v371) {
              int v179 = *v139;
            }
            int v370 = 0;
            int v371 = v179;
          }
LABEL_181:
          ++v133;
          uint64_t v45 = v412;
          if (v133 >= v412) {
            goto LABEL_327;
          }
        }
      }
LABEL_179:
      int v370 = 1;
      int v371 = 0x7FFFFFFF;
      goto LABEL_327;
    }
    int v69 = 0;
    int v417 = 0;
    int v416 = v45;
    __int16 v415 = 0;
    int v414 = 0;
    int v370 = 1;
    int v371 = 0x7FFFFFFF;
    uint64_t v70 = v48;
    uint64_t v377 = *(void *)(v67 + 88);
    uint64_t v381 = *(void *)(v67 + 96);
LABEL_83:
    uint64_t v71 = v70;
    while (2)
    {
      char __src = v71 + 1;
      int __dst = v69;
      v396 = v71;
LABEL_85:
      uint64_t v45 = v416;
      if (v69 >= v416) {
        goto LABEL_327;
      }
      uint64_t v72 = *v71;
      uint64_t v73 = (long long *)&a2[32 * v72];
      unint64_t v74 = *(unsigned int *)v73;
      if (v74 == 0x7FFFFFFF) {
        goto LABEL_88;
      }
      long long v75 = (int *)v73 + 1;
      if (*((_DWORD *)v73 + 1) > v68) {
        goto LABEL_88;
      }
      v400 = (long long *)&a2[32 * v72];
      int v78 = v416;
      uint64_t v79 = (v74 >> 5) & 0x7FFFFF8;
      uint64_t v80 = *(void *)(*(void *)v67 + v79);
      uint64_t v81 = *(_DWORD *)v73;
      uint64_t v82 = *(void *)(*(void *)(v67 + 16) + v79);
      unsigned int v83 = *(unsigned __int16 *)(v80 + 8 * v81);
      if (v83 == 65534 && !*(_WORD *)(v80 + 8 * v81 + 2))
      {
        a2 = (_DWORD *)v407;
        uint64_t v115 = v407 + (v72 << 7);
        int v116 = *(__int16 *)(v115 + 124);
        if (*(_WORD *)(v115 + 124))
        {
          int v117 = *(_DWORD *)(v115 + 12) - v116;
          *(_DWORD *)(v115 + 12) = v117;
          *(_WORD *)(v115 + 124) = 0;
          int v417 = __dst;
          if (v116 <= 0)
          {
            for (; v417 < v78 - 1; ++v417)
            {
              if (v117 <= *(_DWORD *)(v407 + ((unint64_t)v48[v417 + 1] << 7) + 12)) {
                break;
              }
            }
            int v69 = __dst;
            if (v417 != __dst)
            {
              unsigned __int16 v129 = *v396;
              j__memmove(v396, __src, 2 * (v417 - __dst));
              uint64_t v71 = v396;
              v48[v417] = v129;
              int v77 = 1;
              goto LABEL_167;
            }
            int v77 = 0;
            uint64_t v67 = v395;
            uint64_t v71 = v396;
          }
          else
          {
            if (v417 >= 1)
            {
              do
              {
                if (v117 >= *(_DWORD *)(v407 + ((unint64_t)v48[v417 - 1] << 7) + 12)) {
                  break;
                }
                --v417;
              }
              while (v417 > 0);
            }
            int v69 = __dst;
            uint64_t v71 = v396;
            if (v417 == __dst)
            {
              int v77 = 0;
            }
            else
            {
              unsigned __int16 v127 = *v396;
              int v128 = &v48[v417];
              j__memmove(v128 + 1, v128, 2 * (__dst - v417));
              uint64_t v71 = v396;
              int v77 = 0;
              *int v128 = v127;
            }
LABEL_167:
            uint64_t v67 = v395;
          }
        }
        else
        {
          int v77 = 0;
          uint64_t v67 = v395;
          uint64_t v71 = v396;
          int v69 = __dst;
        }
        uint64_t v73 = v400;
        char v76 = 0;
        *(_DWORD *)v400 = 0x7FFFFFFF;
        goto LABEL_89;
      }
      unsigned __int16 v84 = sub_1000BD964(v381, v83, 0);
      unsigned int v85 = sub_1000D913C((void *)v395, v74, &v414, &v415, v84);
      if (v85 == 0x7FFFFFFF)
      {
        int v77 = v414;
        uint64_t v86 = __src;
        uint64_t v71 = v396;
        if (!v414)
        {
          char v76 = 0;
          uint64_t v73 = v400;
          *(_DWORD *)v400 = 0x7FFFFFFF;
          a2 = (_DWORD *)v407;
          uint64_t v67 = v395;
          int v69 = __dst;
          goto LABEL_89;
        }
        unsigned __int16 v87 = *v396;
        int v88 = v78 - 1;
        int v416 = v78 - 1;
        a2 = (_DWORD *)v407;
        if (v78 != 1)
        {
          int v69 = __dst;
          size_t v89 = 2 * (v88 - __dst);
LABEL_147:
          j__memmove(v71, v86, v89);
          uint64_t v67 = v395;
          uint64_t v71 = v396;
          int v77 = 0;
          v48[v88] = v87;
          char v76 = 1;
          uint64_t v73 = v400;
          goto LABEL_89;
        }
        uint64_t v45 = 0;
        int v370 = 1;
        int v371 = v68;
        uint64_t v67 = v395;
        goto LABEL_327;
      }
      unsigned int v90 = v85;
      LOWORD(v91) = qword_100101CC0;
      uint64_t v71 = v396;
      if (qword_100101CC0) {
        uint64_t v91 = *(void *)(qword_100101CC0 + 1704);
      }
      uint64_t v67 = v395;
      __int16 v92 = v415 + v91;
      v415 += v91;
      int v93 = *(unsigned __int16 *)(v80 + 8 * v81 + 2);
      if (v93 == a4)
      {
        uint64_t v73 = v400;
        if (*v75)
        {
          a2 = (_DWORD *)v407;
          uint64_t v94 = v407 + (v72 << 7);
          int v95 = *(_DWORD *)(v94 + 12) - v414;
          *(_DWORD *)(v94 + 12) = v95;
          *(_DWORD *)v400 = 0x7FFFFFFF;
          int v69 = __dst;
          int v417 = __dst;
          if (__dst >= 1)
          {
            do
            {
              if (*(_DWORD *)(v407 + ((unint64_t)v48[v417 - 1] << 7) + 12) <= v95) {
                break;
              }
              --v417;
            }
            while (v417 > 0);
          }
          uint64_t v71 = v396;
          if (v417 != __dst)
          {
            unsigned __int16 v96 = *v396;
            uint64_t v97 = &v48[v417];
            j__memmove(v97 + 1, v97, 2 * (__dst - v417));
            uint64_t v67 = v395;
            uint64_t v71 = v396;
            char v76 = 0;
            int v77 = 0;
            *uint64_t v97 = v96;
            uint64_t v73 = v400;
            goto LABEL_89;
          }
LABEL_88:
          char v76 = 0;
          int v77 = 0;
          goto LABEL_89;
        }
        unsigned __int16 v87 = *v396;
        int v88 = v78 - 1;
        int v416 = v78 - 1;
        a2 = (_DWORD *)v407;
        if (v78 != 1)
        {
          int v69 = __dst;
          size_t v89 = 2 * (v88 - __dst);
          uint64_t v86 = __src;
          goto LABEL_147;
        }
        uint64_t v45 = 0;
        int v370 = 1;
        int v371 = v68;
        goto LABEL_327;
      }
      unint64_t v98 = (unsigned int *)(*(void *)(v395 + 48) + 16 * ((__int16)v93 - 1));
      int v99 = v98[1];
      if (v99 < 1) {
        goto LABEL_150;
      }
      unsigned int v368 = v90;
      __int16 v366 = v92;
      int v100 = 0;
      unsigned int v101 = *v98;
      signed int v102 = v99 + *v98;
      v373 = (unsigned __int16 *)(v82 + 12 * v81 + 4);
      v365 = v98 + 3;
      int v364 = v414;
      uint64_t v103 = 0x7FFFFFFFLL;
      while (2)
      {
        uint64_t v104 = v103;
        int v105 = v100;
        uint64_t v106 = 8 * (v101 >> 8);
        uint64_t v107 = *(void *)(*(void *)v67 + v106);
        int v100 = (unsigned __int16 *)(v107 + 8 * v101);
        uint64_t v108 = *(void *)(*(void *)(v67 + 16) + v106);
        uint64_t v109 = *v75;
        if (v109 == 35)
        {
          if ((__int16)*v100 == -2 && !*(_WORD *)(v107 + 8 * v101 + 2))
          {
            int v110 = 0;
            if ((__int16)a4 <= 0) {
              goto LABEL_117;
            }
          }
          goto LABEL_109;
        }
        int v110 = *(unsigned __int16 *)(v107 + 8 * v101 + 2);
        if ((__int16)v110 < (__int16)a4) {
          goto LABEL_109;
        }
LABEL_117:
        int v111 = *v100;
        if (!v109 && (!v110 ? (BOOL v112 = v111 == 65534) : (BOOL v112 = 0), v112))
        {
LABEL_109:
          uint64_t v103 = v104;
          int v100 = v105;
        }
        else if ((!a10 {
                || v111 == 65534
        }
                || (*(_WORD *)(v407 + (v72 << 7) + 2 * v109 + 16) = v111, sub_100026260((uint64_t)a9, a10)))
               && sub_100005928(v377, *v373, *(unsigned __int16 *)(v108 + 12 * v101 + 6)))
        {
          uint64_t v103 = v368;
          uint64_t v67 = v395;
          if (v368 != v101)
          {
            int v113 = *v365 - v364 + *(__int16 *)(v107 + 8 * v101 + 4);
            if (v113 < 0) {
              __int16 v114 = *(_WORD *)v365 - v364 + *(_WORD *)(v107 + 8 * v101 + 4);
            }
            else {
              __int16 v114 = 0;
            }
            sub_1000D8A54((void *)v395, v407, v400, &v416, v372, (v113 & ~(v113 >> 31)) + *(_DWORD *)(v407 + (v72 << 7) + 12), v101, v387, v366 - v114, *(_DWORD *)(v395 + 112));
            uint64_t v67 = v395;
            goto LABEL_109;
          }
        }
        else
        {
          uint64_t v103 = v104;
          int v100 = v105;
          uint64_t v67 = v395;
        }
        if ((int)++v101 < v102) {
          continue;
        }
        break;
      }
      int v69 = __dst;
      if (v100)
      {
        uint64_t v73 = v400;
        *(_DWORD *)v400 = v103;
        int v118 = *v100;
        int v48 = (unsigned __int16 *)v387;
        if (v118 == 65534)
        {
          int v77 = v100[1];
          a2 = (_DWORD *)v407;
          if (v100[1])
          {
            uint64_t v119 = *v75;
            signed int v68 = v392;
            char v76 = 0;
            int v77 = 0;
            if (v119)
            {
              uint64_t v67 = v395;
              *(unsigned char *)(v407 + (v72 << 7) + v119 + 88) = 1;
            }
          }
          else
          {
            char v76 = 0;
            signed int v68 = v392;
          }
        }
        else
        {
          a2 = (_DWORD *)v407;
          uint64_t v122 = v407 + (v72 << 7);
          *(_WORD *)(v122 + 2 * *v75 + 16) = v118;
          int v123 = *(unsigned __int16 *)(*(void *)(*(void *)(v67 + 16) + 8 * (v103 >> 8))
                                     + 12 * v103
                                     + 6);
          uint64_t v124 = *v75;
          if (v123) {
            BOOL v125 = 1;
          }
          else {
            BOOL v125 = *v75 < 1;
          }
          signed int v68 = v392;
          if (!v125) {
            *(unsigned char *)(v122 + (v124 - 1) + 88) = 1;
          }
          char v76 = 0;
          int v77 = 0;
          uint64_t v126 = v124 + 1;
          *long long v75 = v126;
          *(unsigned char *)(v122 + v126 + 88) = 0;
          *(_WORD *)(v122 + 124) += v366;
          uint64_t v67 = v395;
        }
        uint64_t v71 = v396;
LABEL_89:
        if ((v76 & 1) == 0 && !v77)
        {
          ++v69;
          uint64_t v71 = __src;
          if (*(_DWORD *)v73 == 0x7FFFFFFF) {
            continue;
          }
          unsigned int v130 = v371;
          if (*((_DWORD *)v73 + 1) < v371) {
            unsigned int v130 = *((_DWORD *)v73 + 1);
          }
          int v370 = 0;
          int v371 = v130;
          uint64_t v70 = __src;
          goto LABEL_83;
        }
        goto LABEL_85;
      }
      break;
    }
    int v78 = v416;
    int v48 = (unsigned __int16 *)v387;
    signed int v68 = v392;
    uint64_t v71 = v396;
LABEL_150:
    int v120 = v78 - 1;
    int v416 = v78 - 1;
    if (v78 != 1)
    {
      int v69 = __dst;
      a2 = (_DWORD *)v407;
      if (v120 <= __dst)
      {
        char v76 = 0;
        int v77 = 0;
        uint64_t v73 = v400;
      }
      else
      {
        unsigned __int16 v121 = *v71;
        j__memmove(v71, __src, 2 * (v120 - __dst));
        uint64_t v67 = v395;
        uint64_t v71 = v396;
        int v77 = 0;
        v48[v120] = v121;
        uint64_t v73 = (long long *)(v407 + ((unint64_t)*v396 << 7));
        char v76 = 1;
      }
      goto LABEL_89;
    }
    uint64_t v45 = 0;
    int v370 = 1;
    int v371 = v68;
    a2 = (_DWORD *)v407;
LABEL_327:
    if (v371 != v68 && qword_100101CC0 && *(_DWORD *)(qword_100101CC0 + 992))
    {
      sub_1000D6960(v67, (uint64_t)a2, v45, v361, v362, v363, v48, v371);
      uint64_t v67 = v395;
    }
    uint64_t v232 = v45;
    BOOL v233 = __OFSUB__(v45, 1);
    uint64_t v234 = (v45 - 1);
    uint64_t v235 = v232;
    if ((int)v234 < 0 == v233)
    {
      v236 = &v48[v234];
      if (a10)
      {
        uint64_t v237 = 1 - (int)v232;
        do
        {
          uint64_t v238 = *v236;
          v239 = (_DWORD *)(v407 + (v238 << 7));
          if (*v239 != 0x7FFFFFFF
            && *(unsigned __int16 *)(*(void *)(*(void *)v67
                                               + (((unint64_t)*v239 >> 5) & 0x7FFFFF8))
                                   + 8 * *v239
                                   + 2) == a4)
          {
            v240 = (int16x8_t *)(v407 + (v238 << 7));
            int v241 = v240->i32[1];
            if (v241 && (v242 = sub_1000265FC((uint64_t)a9, a10, v240 + 1, v241), uint64_t v67 = v395, v242))
            {
              _DWORD *v239 = 0x7FFFFFFF;
              uint64_t v243 = v407 + (v238 << 7);
              int v246 = *(__int16 *)(v243 + 124);
              v244 = (_WORD *)(v243 + 124);
              int v245 = v246;
              if (v246)
              {
                uint64_t v67 = v395;
                *(_DWORD *)(v407 + (v238 << 7) + 12) -= v245;
                _WORD *v244 = 0;
              }
            }
            else
            {
              uint64_t v247 = (v232 - 1);
              uint64_t v235 = v234;
              LODWORD(v232) = v234;
              if (v234 != v247)
              {
                unsigned __int16 v248 = *v236;
                j__memmove(v236, v236 + 1, 2 * (v237 + (int)v247));
                uint64_t v67 = v395;
                v48[(int)v247] = v248;
                uint64_t v235 = v247;
                LODWORD(v232) = v247;
              }
            }
          }
          uint64_t v234 = (v234 - 1);
          --v236;
          ++v237;
        }
        while (v234 != -1);
        goto LABEL_343;
      }
      uint64_t v272 = 1 - (int)v232;
      while (2)
      {
        uint64_t v273 = *v236;
        v274 = (_DWORD *)(v407 + (v273 << 7));
        if (*v274 != 0x7FFFFFFF)
        {
          if (*(unsigned __int16 *)(*(void *)(*(void *)v67
                                               + (((unint64_t)*v274 >> 5) & 0x7FFFFF8))
                                   + 8 * *v274
                                   + 2) != a4)
            goto LABEL_374;
          uint64_t v275 = v407 + (v273 << 7);
          if (*(_DWORD *)(v275 + 4))
          {
            _DWORD *v274 = 0x7FFFFFFF;
            int v278 = *(__int16 *)(v275 + 124);
            v277 = (_WORD *)(v275 + 124);
            int v276 = v278;
            if (v278)
            {
              *(_DWORD *)(v407 + (v273 << 7) + 12) -= v276;
              _WORD *v277 = 0;
            }
LABEL_374:
            uint64_t v67 = v395;
          }
          else
          {
            uint64_t v279 = (v232 - 1);
            uint64_t v235 = v234;
            LODWORD(v232) = v234;
            uint64_t v67 = v395;
            if (v234 != v279)
            {
              j__memmove(v236, v236 + 1, 2 * (v272 + (int)v279));
              uint64_t v67 = v395;
              v48[(int)v279] = v273;
              uint64_t v235 = v279;
              LODWORD(v232) = v279;
            }
          }
        }
        uint64_t v234 = (v234 - 1);
        --v236;
        ++v272;
        if (v234 == -1) {
          break;
        }
        continue;
      }
    }
LABEL_343:
    if (v232)
    {
      qsort(v48, (int)v232, 2uLL, (int (__cdecl *)(const void *, const void *))sub_1000D6EDC);
      uint64_t v45 = v235;
      a2 = (_DWORD *)v407;
      if ((int)v235 < 1)
      {
        uint64_t v67 = v395;
      }
      else
      {
        uint64_t v249 = 0;
        int v250 = v235;
        v251 = v48;
        uint64_t v67 = v395;
        do
        {
          if (++v249 < v250)
          {
            v376 = v251;
            unint64_t v252 = *v251;
            v253 = &a2[32 * v252];
            uint64_t v254 = *(void *)(v67 + 96);
            int v255 = v45;
            v256 = &v48[v249];
            unint64_t __dstc = v252;
            v252 <<= 7;
            int v399 = *(_DWORD *)(v67 + 112);
            v257 = (_DWORD *)((char *)a2 + v252 + 4);
            v383 = (__int16 *)((char *)a2 + v252 + 124);
            __srcb = (_DWORD *)((char *)a2 + v252 + 12);
            uint64_t v403 = v255;
            v258 = &v394[v252];
            uint64_t v380 = v249;
            for (int i = v257; ; v257 = i)
            {
              int v259 = v250;
              while (1)
              {
                uint64_t v260 = *v256;
                if (a2[32 * v260] == *v253)
                {
                  uint64_t v261 = (int)a2[32 * v260 + 1];
                  if (v261 == *v257
                    && (!v399
                     || *((unsigned __int8 *)&a2[32 * v260 + 22] + v261) == *((unsigned __int8 *)&a2[32 * __dstc + 22]
                                                                            + v261)))
                  {
                    break;
                  }
                }
LABEL_353:
                LODWORD(v249) = v249 + 1;
                ++v256;
                if ((int)v249 >= v259)
                {
                  int v48 = (unsigned __int16 *)v387;
                  uint64_t v67 = v395;
                  uint64_t v45 = v403;
                  goto LABEL_347;
                }
              }
              if (qword_100101CC0 && *(_DWORD *)(qword_100101CC0 + 1760))
              {
                uint64_t v262 = a2[32 * v260 + 1];
                while ((int)v262 >= 1)
                {
                  uint64_t v263 = 2 * v262--;
                  if (*(unsigned __int16 *)&v394[128 * v260 + v263] != *(unsigned __int16 *)&v258[v263]) {
                    goto LABEL_352;
                  }
                }
              }
              else
              {
                uint64_t v264 = a2[32 * v260 + 1];
                while ((int)v264 >= 1)
                {
                  uint64_t v265 = v264 - 1;
                  uint64_t v266 = 2 * v264;
                  int v267 = sub_1000BD964(v254, *(unsigned __int16 *)&v394[128 * v260 + 2 * v264], 0);
                  int v268 = sub_1000BD964(v254, *(unsigned __int16 *)&v258[v266], 0);
                  uint64_t v264 = v265;
                  if (v267 != v268)
                  {
                    int v259 = v403;
                    int v250 = v403;
LABEL_352:
                    a2 = (_DWORD *)v407;
                    v257 = i;
                    goto LABEL_353;
                  }
                }
              }
              a2 = (_DWORD *)v407;
              int v269 = SLOWORD(a2[32 * v260 + 31]) - a2[32 * v260 + 3];
              if (*__srcb - *v383 + v269 >= 1) {
                __int16 *v383 = v269 + *__srcb;
              }
              uint64_t v270 = v403 - 1;
              if (v403 - 1 <= (int)v249) {
                break;
              }
              unsigned __int16 v271 = *v256;
              j__memmove(v256, v256 + 1, 2 * (v403 - 1 - (int)v249));
              *(_WORD *)(v387 + 2 * v270) = v271;
              --v403;
              int v250 = v270;
            }
            int v250 = v403 - 1;
            int v48 = (unsigned __int16 *)v387;
            uint64_t v67 = v395;
            uint64_t v45 = v403 - 1;
LABEL_347:
            v251 = v376;
            uint64_t v249 = v380;
          }
          ++v251;
        }
        while (v249 < v250);
      }
    }
    else
    {
      a2 = (_DWORD *)v407;
      uint64_t v45 = v235;
    }
    if (!v370) {
      continue;
    }
    break;
  }
  if (!v45) {
    goto LABEL_458;
  }
  uint64_t v404 = v45;
  v280 = (void *)sub_1000C33A0(v360 << 7);
  if (!v280) {
    goto LABEL_458;
  }
  uint64_t v281 = (uint64_t)v280;
  memcpy(v280, a2, v360 << 7);
  uint64_t v31 = v45;
  if ((int)v45 >= 1)
  {
    uint64_t v282 = v45;
    v283 = a2;
    v284 = v48;
    do
    {
      unsigned int v285 = *v284++;
      v286 = (long long *)(v281 + ((unint64_t)v285 << 7));
      long long v287 = *v286;
      long long v288 = v286[1];
      long long v289 = v286[3];
      v283[2] = v286[2];
      v283[3] = v289;
      _OWORD *v283 = v287;
      v283[1] = v288;
      long long v290 = v286[4];
      long long v291 = v286[5];
      long long v292 = v286[7];
      v283[6] = v286[6];
      v283[7] = v292;
      v283[4] = v290;
      v283[5] = v291;
      v283 += 8;
      --v282;
    }
    while (v282);
  }
  sub_1000C321C(v281);
  if (!*(_DWORD *)(v395 + 116) && (int)v45 >= 1)
  {
    v293 = a2;
    uint64_t v294 = 0;
    v406 = (char *)v293 - 30;
    v295 = (char *)v293 - 15;
    v296 = (char *)v293 - 14;
    v297 = (char *)v293 - 7;
    v298 = (int16x8_t *)(v293 + 4);
    v299 = (int8x16_t *)(v293 + 22);
    while (1)
    {
      v301 = (unsigned int *)(v407 + (v294 << 7));
      v302 = (char *)(v301 + 22);
      v303 = (char *)v301 + 89;
      unint64_t v304 = v301[1];
      uint64_t v305 = (int)v304;
      if ((int)v304 >= 2) {
        break;
      }
LABEL_392:
      uint64_t v300 = v305 - 1;
      j__memmove(v302, v303, v305 - 1);
      v302[v300] = 0;
      ++v294;
      v298 += 8;
      v299 += 8;
      if (v294 == v404)
      {
        uint64_t v31 = v404;
        goto LABEL_459;
      }
    }
    unint64_t v306 = v304 >> 1;
    if (v304 < 0x10
      || ((unint64_t v307 = (unint64_t)(v301 + 4),
           uint64_t v308 = (v304 - 1),
           uint64_t v309 = 2 * v308,
           (int)v304 - (int)v306 < (int)v304)
        ? (BOOL v310 = (char *)v301 + v309 + -2 * v306 + 18 > (char *)v301 + v309 + 16)
        : (BOOL v310 = 1),
          !v310 ? (BOOL v311 = &v302[v308 - v306 + 1] > &v302[v308]) : (BOOL v311 = 1),
          v311))
    {
      uint64_t v312 = 0;
    }
    else
    {
      uint64_t v312 = 0;
      v319 = (char *)v301 + 18;
      unint64_t v320 = v307 + 2 * v306;
      v321 = &v302[v306];
      unint64_t v322 = (unint64_t)&v319[v309 - 2 * v306];
      unint64_t v323 = (unint64_t)&v319[v309];
      v324 = &v303[v308 - v306];
      v325 = &v303[v308];
      BOOL v327 = v307 < (unint64_t)&v319[v309] && v322 < v320;
      BOOL v329 = v307 < (unint64_t)v325 && (unint64_t)v324 < v320;
      BOOL v331 = (unint64_t)v302 < v323 && v322 < (unint64_t)v321;
      BOOL v333 = v302 < v325 && v324 < v321;
      BOOL v335 = v322 < (unint64_t)v325 && (unint64_t)v324 < v323;
      BOOL v336 = (unint64_t)v302 >= v320 || v307 >= (unint64_t)v321;
      if (v336 && !v327 && !v329 && !v331 && !v333)
      {
        uint64_t v313 = v407;
        if (!v335)
        {
          uint64_t v337 = v294 << 7;
          if (v304 >= 0x20)
          {
            uint64_t v312 = (v304 >> 1) & 0x7FFFFFF0;
            uint64_t v338 = v312;
            v339 = v299;
            v340 = v298;
            do
            {
              int16x8_t v342 = *v340;
              int16x8_t v341 = v340[1];
              v343 = (int16x8_t *)&v406[2 * (int)v308 + v337];
              int8x16_t v344 = (int8x16_t)vrev64q_s16(v343[1]);
              int8x16_t v345 = (int8x16_t)vrev64q_s16(v343[2]);
              *(int8x16_t *)v340 = vextq_s8(v345, v345, 8uLL);
              v340[1] = (int16x8_t)vextq_s8(v344, v344, 8uLL);
              v340 += 2;
              int8x16_t v346 = (int8x16_t)vrev64q_s16(v342);
              int8x16_t v347 = (int8x16_t)vrev64q_s16(v341);
              v343[1] = (int16x8_t)vextq_s8(v347, v347, 8uLL);
              v343[2] = (int16x8_t)vextq_s8(v346, v346, 8uLL);
              int8x16_t v348 = *v339;
              v349 = &v295[v337 + (int)v308];
              int8x16_t v350 = vrev64q_s8(*(int8x16_t *)(v349 + 88));
              *v339++ = vextq_s8(v350, v350, 8uLL);
              int8x16_t v351 = vrev64q_s8(v348);
              *(int8x16_t *)(v349 + 88) = vextq_s8(v351, v351, 8uLL);
              LODWORD(v308) = v308 - 16;
              v338 -= 16;
            }
            while (v338);
            uint64_t v313 = v407;
            if (v312 == v306) {
              goto LABEL_392;
            }
            if ((v306 & 8) != 0) {
              goto LABEL_454;
            }
          }
          else
          {
            uint64_t v312 = 0;
LABEL_454:
            uint64_t v352 = v312;
            uint64_t v312 = (v304 >> 1) & 0x7FFFFFF8;
            uint64_t v353 = 2 * v352;
            int v354 = ~v352 + v304;
            do
            {
              int16x8_t v355 = *(int16x8_t *)((char *)v298 + v353);
              v356 = (int16x8_t *)&v296[2 * v354 + v337];
              int8x16_t v357 = (int8x16_t)vrev64q_s16(v356[1]);
              *(int8x16_t *)((char *)v298 + v353) = vextq_s8(v357, v357, 8uLL);
              int8x16_t v358 = (int8x16_t)vrev64q_s16(v355);
              v356[1] = (int16x8_t)vextq_s8(v358, v358, 8uLL);
              v358.i64[0] = *(uint64_t *)((char *)v299->i64 + v352);
              v359 = (int8x8_t *)&v297[v337 + v354];
              *(int8x8_t *)&v299->i8[v352] = vrev64_s8(v359[11]);
              v359[11] = vrev64_s8(*(int8x8_t *)v358.i8);
              v352 += 8;
              v353 += 16;
              v354 -= 8;
            }
            while (v312 != v352);
            uint64_t v313 = v407;
            if (v312 == v306) {
              goto LABEL_392;
            }
          }
        }
LABEL_405:
        int v314 = ~v312 + v304;
        do
        {
          __int16 v315 = v298->i16[v312];
          uint64_t v316 = v313 + (v294 << 7);
          uint64_t v317 = v316 + 2 * v314;
          v298->i16[v312] = *(_WORD *)(v317 + 16);
          *(_WORD *)(v317 + 16) = v315;
          LOBYTE(v315) = v299->i8[v312];
          uint64_t v318 = v316 + v314;
          v299->i8[v312] = *(unsigned char *)(v318 + 88);
          *(unsigned char *)(v318 + 88) = v315;
          ++v312;
          --v314;
        }
        while (v306 != v312);
        goto LABEL_392;
      }
    }
    uint64_t v313 = v407;
    goto LABEL_405;
  }
LABEL_459:
  sub_1000C321C((uint64_t)v48);
LABEL_460:
  sub_1000261E4((uint64_t)a9, a10);
  return v31;
}

uint64_t sub_1000D6224(void **a1)
{
  if (*((__int16 *)a1 + 42) < 0)
  {
LABEL_80:
    signed int v85 = (*((_DWORD *)a1 + 14) + 255) >> 8;
    if (v85 < *((_DWORD *)a1 + 2))
    {
      uint64_t v86 = (*((_DWORD *)a1 + 14) + 255) >> 8;
      do
      {
        sub_1000C321C((*a1)[v86]);
        (*a1)[v86] = 0;
        sub_1000C321C(a1[2][v86]);
        a1[2][v86++] = 0;
      }
      while (*((_DWORD *)a1 + 2) > (int)v86);
    }
    *((_DWORD *)a1 + 2) = v85;
    *((_DWORD *)a1 + 6) = v85;
    return 1;
  }
  uint64_t v2 = *((unsigned __int16 *)a1 + 42);
  int v3 = a1[6];
  int v95 = (int *)a1 + 11;
  unsigned __int16 v96 = (const void **)(a1 + 4);
  int v93 = v3;
  uint64_t v94 = (signed int *)(a1 + 5);
  __int16 v92 = (int *)a1 + 3;
  unsigned int v90 = (const void **)(a1 + 2);
  uint64_t v91 = (signed int *)(a1 + 1);
  int v88 = (signed int *)(a1 + 3);
  size_t v89 = (int *)a1 + 7;
  uint64_t v4 = (uint64_t)&v3[2 * v2 + 2];
  while (1)
  {
    uint64_t v6 = (int *)&v3[2 * v2];
    int v7 = v6[1];
    int v99 = v6 + 1;
    if (v7 < 1)
    {
      uint64_t v30 = 0;
      uint64_t v28 = 0;
      int v8 = 0;
      BOOL v98 = 0;
      goto LABEL_64;
    }
    int v8 = 0;
    int v9 = *v6;
    int v10 = v7 + *v6;
    uint64_t v11 = (uint64_t)*a1;
    uint64_t v12 = a1[2];
    unsigned int v13 = *v6;
    do
    {
      int v14 = *(_DWORD *)(v12[v13 >> 8] + 12 * v13);
      if (v14 == 2
        || (uint64_t v15 = *(void *)(v11 + 8 * (v13 >> 8)),
            int v16 = *(unsigned __int16 *)(v15 + 8 * v13),
            v16 == 65534))
      {
        ++v8;
      }
      else if (v14 == 1)
      {
        uint64_t v17 = (uint64_t)&a1[6][2 * *(__int16 *)(v15 + 8 * v13 + 2)];
        signed int v18 = *(_DWORD *)(v17 - 16);
        int v19 = *(_DWORD *)(v17 - 12);
        signed int v20 = v19 + v18;
        if (v19 >= 1)
        {
          signed int v21 = v20 - 1;
          do
          {
            uint64_t v23 = (v21 + v18) >> 9;
            int v24 = v16
                - *(unsigned __int16 *)(*(void *)(v11 + 8 * v23)
                                      + 8 * ((v21 + v18) >> 1));
            if (!v24) {
              int v24 = -*(_DWORD *)(v12[v23] + 12 * ((v21 + v18) >> 1));
            }
            unsigned int v22 = (v21 + v18) >> 1;
            if (v24 >= 1) {
              signed int v18 = v22 + 1;
            }
            else {
              signed int v21 = v22 - 1;
            }
          }
          while (v18 <= v21);
        }
        unsigned int v25 = v18;
        if (v18 < v20)
        {
          unsigned int v25 = v18;
          while (1)
          {
            uint64_t v26 = v25 >> 8;
            if (*(unsigned __int16 *)(*(void *)(v11 + 8 * v26) + 8 * v25) != v16
              || *(_DWORD *)(v12[v26] + 12 * v25) == 1)
            {
              break;
            }
            if (v20 == ++v25)
            {
              unsigned int v25 = v20;
              break;
            }
          }
        }
        int v8 = v8 - v18 + v25;
      }
      ++v13;
    }
    while ((int)v13 < v10);
    BOOL v98 = v8 > 0;
    if (v8 >= 1) {
      break;
    }
    uint64_t v28 = 0;
    uint64_t v30 = 0;
LABEL_33:
    int v31 = 0;
    do
    {
      uint64_t v34 = (uint64_t)*a1;
      uint64_t v35 = v9 >> 8;
      uint64_t v36 = (*a1)[v35];
      uint64_t v37 = (void *)(v36 + 8 * v9);
      __int16 v38 = a1[2];
      uint64_t v39 = v38[v35];
      int v40 = (uint64_t *)(v39 + 12 * v9);
      if (*(_DWORD *)v40 == 2 || (int v41 = *(unsigned __int16 *)v37, v41 == 65534))
      {
        *(void *)(v28 + 8 * v31) = *v37;
        uint64_t v32 = v30 + 12 * v31;
        uint64_t v33 = *v40;
        *(_DWORD *)(v32 + 8) = *((_DWORD *)v40 + 2);
        *(void *)uint64_t v32 = v33;
        ++v31;
      }
      else if (*(_DWORD *)v40 == 1)
      {
        uint64_t v42 = (uint64_t)&a1[6][2 * *(__int16 *)(v36 + 8 * v9 + 2)];
        signed int v44 = *(_DWORD *)(v42 - 16);
        int v43 = *(_DWORD *)(v42 - 12);
        signed int v45 = v43 + v44;
        if (v43 >= 1)
        {
          signed int v46 = v45 - 1;
          do
          {
            uint64_t v48 = (v46 + v44) >> 9;
            int v49 = v41
                - *(unsigned __int16 *)(*(void *)(v34 + 8 * v48)
                                      + 8 * ((v46 + v44) >> 1));
            if (!v49) {
              int v49 = -*(_DWORD *)(v38[v48] + 12 * ((v46 + v44) >> 1));
            }
            unsigned int v47 = (v46 + v44) >> 1;
            if (v49 >= 1) {
              signed int v44 = v47 + 1;
            }
            else {
              signed int v46 = v47 - 1;
            }
          }
          while (v44 <= v46);
        }
        unsigned int v50 = v44;
        if (v44 < v45)
        {
          unsigned int v50 = v44;
          while (1)
          {
            uint64_t v51 = v50 >> 8;
            if (*(unsigned __int16 *)(*(void *)(v34 + 8 * v51) + 8 * v50) != v41
              || *(_DWORD *)(v38[v51] + 12 * v50) == 1)
            {
              break;
            }
            if (v45 == ++v50)
            {
              unsigned int v50 = v45;
              break;
            }
          }
        }
        if ((int)(v50 - v44) >= 1)
        {
          __int16 v52 = 0x4000;
          int v53 = 0x40000000;
          unsigned int v54 = v44;
          do
          {
            uint64_t v55 = v54 >> 8;
            if (*(__int16 *)(*(void *)(v34 + 8 * v55) + 8 * v54 + 4) < v52)
            {
              int v53 = *(_DWORD *)(v38[v55] + 12 * v54 + 8);
              __int16 v52 = *(_WORD *)(*(void *)(v34 + 8 * v55) + 8 * v54 + 4);
            }
            ++v54;
          }
          while (v50 != v54);
          if ((int)(v50 - v44) >= 1)
          {
            uint64_t v56 = 0;
            uint64_t v57 = (_DWORD *)(v39 + 12 * v9 + 8);
            uint64_t v58 = v28 + 8 * v31;
            uint64_t v59 = v30 + 12 * v31;
            unsigned int v60 = v44 - v50;
            uint64_t v61 = 4;
            do
            {
              uint64_t v62 = (v44 + v56) >> 8;
              uint64_t v63 = (*a1)[v62];
              uint64_t v64 = a1[2][v62];
              *(void *)(v58 + 8 * v56) = *v37;
              uint64_t v65 = v63 + 8 * (v44 + v56);
              BOOL v66 = (_WORD *)(v58 + v61);
              *(v66 - 1) = *(_WORD *)(v65 + 2);
              *BOOL v66 = *(_WORD *)(v65 + 4) - v52 + *(_WORD *)(v58 + v61);
              LODWORD(v65) = *((_DWORD *)v40 + 2);
              *(void *)uint64_t v59 = *v40;
              *(_DWORD *)(v59 + 8) = v65;
              *(_DWORD *)uint64_t v59 = 1;
              uint64_t v67 = v64 + 12 * (v44 + v56);
              *(_WORD *)(v59 + 4) = *(_WORD *)(v67 + 4);
              *(_DWORD *)(v59 + 8) = *v57 - v53 + *(_DWORD *)(v67 + 8);
              ++v56;
              v59 += 12;
              v61 += 8;
            }
            while (v60 + v56);
            v31 += v56;
          }
        }
      }
      ++v9;
    }
    while (v9 < v10);
    int v7 = *v99;
LABEL_64:
    int v68 = v8 - v7;
    if (v8 != v7)
    {
      uint64_t v97 = (_DWORD *)v4;
      int v69 = *((_DWORD *)a1 + 14) + v68;
      if (*((_DWORD *)a1 + 17))
      {
        uint64_t v70 = (int *)&v3[2 * v2];
        if (!sub_1000C3A90(v96, v95, v94, 8, 2, *((_DWORD *)a1 + 14) + v68)) {
          goto LABEL_84;
        }
      }
      else
      {
        uint64_t v70 = (int *)&v3[2 * v2];
        if (!sub_1000C3A90((const void **)a1, v92, v91, 8, 8, *((_DWORD *)a1 + 14) + v68)
          || *((_DWORD *)a1 + 31) && !sub_1000C3A90(v90, v89, v88, 8, 12, v69))
        {
LABEL_84:
          sub_1000C321C(v28);
          uint64_t v87 = v30;
          goto LABEL_86;
        }
      }
      if (v2 < *((__int16 *)a1 + 42))
      {
        int v71 = v3[2 * v2 + 2];
        int v72 = *((_DWORD *)a1 + 14);
        int v73 = v72 - v71;
        sub_1000C403C(*a1, *((unsigned int *)a1 + 2), 256, 8, v71, v72 - v71, v71 + v68);
        int v74 = v73;
        int v3 = v93;
        sub_1000C403C(a1[2], *((unsigned int *)a1 + 6), 256, 12, v71, v74, v71 + v68);
      }
      *((_DWORD *)a1 + 14) += v68;
      int *v99 = v8;
      uint64_t v4 = (uint64_t)v97;
      uint64_t v6 = v70;
      if (v2 < *((__int16 *)a1 + 42))
      {
        long long v75 = v97;
        int v76 = v2;
        do
        {
          *v75 += v68;
          v75 += 4;
          ++v76;
        }
        while (v76 < *((__int16 *)a1 + 42));
      }
    }
    if (v98)
    {
      unsigned int v77 = *v6;
      uint64_t v78 = v8;
      uint64_t v79 = (uint64_t *)v28;
      uint64_t v80 = v30;
      do
      {
        uint64_t v81 = v77 >> 8;
        uint64_t v82 = *v79++;
        *(void *)((*a1)[v81] + 8 * v77) = v82;
        uint64_t v83 = a1[2][v81] + 12 * v77;
        uint64_t v84 = *(void *)v80;
        *(_DWORD *)(v83 + 8) = *(_DWORD *)(v80 + 8);
        *(void *)uint64_t v83 = v84;
        ++v77;
        v80 += 12;
        --v78;
      }
      while (v78);
    }
    sub_1000C321C(v28);
    sub_1000C321C(v30);
    v4 -= 16;
    if (v2-- <= 0) {
      goto LABEL_80;
    }
  }
  uint64_t result = (uint64_t)sub_1000C328C(8 * v8);
  if (!result) {
    return result;
  }
  uint64_t v28 = result;
  int v29 = sub_1000C328C(12 * v8);
  if (v29)
  {
    uint64_t v30 = (uint64_t)v29;
    int v9 = *v6;
    int v7 = *v99;
    int v10 = *v99 + *v6;
    if (*v99 < 1) {
      goto LABEL_64;
    }
    goto LABEL_33;
  }
  uint64_t v87 = v28;
LABEL_86:
  sub_1000C321C(v87);
  return 0;
}

uint64_t sub_1000D6960(uint64_t result, uint64_t a2, int a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned __int16 *a7, int a8)
{
  int v9 = a3;
  __int16 v78 = 0;
  uint64_t v10 = *(void *)(result + 96);
  int v69 = (void *)result;
  if (!*(_DWORD *)(result + 116))
  {
    uint64_t v37 = a2;
    if (a3 < 1) {
      return result;
    }
    unsigned int v38 = a6;
    int v39 = 0;
    uint64_t v66 = a2 + 16;
    while (1)
    {
      uint64_t v40 = *a7;
      int v41 = (unsigned int *)(v37 + (v40 << 7));
      int v43 = (int *)(v41 + 2);
      signed int v42 = v41[2];
      signed int v45 = (int *)(v41 + 1);
      signed int v44 = v41[1];
      if (v42 > v44 || v44 == 0) {
        goto LABEL_41;
      }
      if (v42) {
        int v47 = v41[2];
      }
      else {
        int v47 = 1;
      }
      if (v42) {
        BOOL v48 = 1;
      }
      else {
        BOOL v48 = v38 == 0xFFFF;
      }
      uint64_t v76 = *a7;
      if (v48)
      {
        if (v44 >= a8) {
          int v49 = a8;
        }
        else {
          int v49 = v41[1];
        }
        int v50 = v49 - v47;
        if (v49 <= v47)
        {
LABEL_58:
          unint64_t v51 = *v41;
          if (v51 == 0x7FFFFFFF) {
            goto LABEL_59;
          }
          goto LABEL_68;
        }
      }
      else
      {
        uint64_t v55 = v37 + (v40 << 7);
        __int16 v78 = sub_1000BD964(v10, *(unsigned __int16 *)(v55 + 16), 0);
        int v47 = 1;
        uint64_t result = sub_1000BDCD4(v10, (uint64_t)&v78, 1u, v38);
        *(_DWORD *)(v55 + 12) += result;
        if (*v45 >= a8) {
          int v49 = a8;
        }
        else {
          int v49 = *v45;
        }
        int v50 = v49 - 1;
        if (v49 <= 1) {
          goto LABEL_58;
        }
      }
      int v71 = v49;
      uint64_t v56 = (unsigned __int16 *)(v66 + (v76 << 7) + 2 * v47);
      do
      {
        __int16 v78 = sub_1000BD964(v10, *v56, 0);
        unsigned int v57 = sub_1000BD964(v10, *(v56 - 1), 0);
        int v58 = sub_1000BDCD4(v10, (uint64_t)&v78, 1u, v57);
        uint64_t result = sub_1000BDCD4(v10, 0, 0, v57);
        *(_DWORD *)(a2 + (v76 << 7) + 12) = *(_DWORD *)(a2 + (v76 << 7) + 12) - result + v58;
        ++v56;
        --v50;
      }
      while (v50);
      int v49 = v71;
      int v47 = v71;
      unsigned int v38 = a6;
      int v43 = (int *)(v41 + 2);
      unint64_t v51 = *v41;
      if (v51 == 0x7FFFFFFF)
      {
LABEL_59:
        BOOL v52 = 1;
        uint64_t v53 = v76;
        uint64_t v37 = a2;
        int v54 = *v45;
        if (v49 >= *v45) {
          goto LABEL_70;
        }
        goto LABEL_40;
      }
LABEL_68:
      uint64_t v59 = *(void *)(*v69 + ((v51 >> 5) & 0x7FFFFF8));
      if (*(__int16 *)(v59 + 8 * v51) == -2)
      {
        BOOL v52 = *(unsigned __int16 *)(v59 + 8 * v51 + 2) == 0;
        uint64_t v53 = v76;
        uint64_t v37 = a2;
        int v54 = *v45;
        if (v49 >= *v45)
        {
LABEL_70:
          if (v52)
          {
            uint64_t v60 = v37 + (v53 << 7);
            unsigned int v61 = sub_1000BD964(v10, *(unsigned __int16 *)(v60 + 2 * (v54 - 1) + 16), 0);
            uint64_t v62 = v43;
            int v63 = sub_1000BDCD4(v10, a4, a5, v61);
            uint64_t result = sub_1000BDCD4(v10, 0, 0, v61);
            uint64_t v37 = a2;
            int v64 = *(_DWORD *)(v60 + 12) - result + v63;
            int v43 = v62;
            unsigned int v38 = a6;
            *(_DWORD *)(v60 + 12) = v64;
            ++v47;
          }
        }
      }
      else
      {
        uint64_t v37 = a2;
      }
LABEL_40:
      *int v43 = v47;
      int v9 = a3;
LABEL_41:
      ++a7;
      if (++v39 == v9) {
        return result;
      }
    }
  }
  uint64_t v11 = a2;
  if (a3 >= 1)
  {
    int v12 = 0;
    int v13 = 0;
    __int16 v79 = 0;
    uint64_t v65 = a2 + 16;
    do
    {
      uint64_t v15 = *a7;
      int v16 = (unsigned int *)(v11 + (v15 << 7));
      int v17 = v16[2];
      int v19 = (int *)(v16 + 1);
      int v18 = v16[1];
      if (v17 > v18 || v18 == 0) {
        goto LABEL_7;
      }
      if (v17)
      {
        if (v18 >= a8) {
          int v21 = a8;
        }
        else {
          int v21 = v16[1];
        }
        int v22 = v21 - v17;
        if (v21 <= v17) {
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v25 = v11 + (v15 << 7);
        uint64_t v26 = *a7;
        unsigned int v27 = sub_1000BD964(v10, *(unsigned __int16 *)(v25 + 16), 0);
        uint64_t result = sub_1000BDCD4(v10, a4, a5, v27);
        uint64_t v15 = v26;
        uint64_t v11 = a2;
        *(_DWORD *)(v25 + 12) += result;
        int v17 = 1;
        int v12 = 1;
        if (*v19 >= a8) {
          int v21 = a8;
        }
        else {
          int v21 = *v19;
        }
        int v22 = v21 - 1;
        if (v21 <= 1)
        {
LABEL_17:
          unint64_t v23 = *v16;
          if (v23 == 0x7FFFFFFF) {
            goto LABEL_18;
          }
          goto LABEL_29;
        }
      }
      int v70 = v21;
      uint64_t v72 = v15;
      uint64_t v28 = (_DWORD *)(v11 + (v15 << 7) + 12);
      int v29 = (unsigned __int16 *)(v65 + (v15 << 7) + 2 * v17);
      do
      {
        unsigned int v30 = sub_1000BD964(v10, *v29, 0);
        __int16 v79 = sub_1000BD964(v10, *(v29 - 1), 0);
        uint64_t result = sub_1000BDCD4(v10, (uint64_t)&v79, 1u, v30);
        LODWORD(v31) = qword_100101CC0;
        if (qword_100101CC0) {
          uint64_t v31 = *(void *)(qword_100101CC0 + 1704);
        }
        ++v29;
        *v28 += v31 + result;
        --v22;
      }
      while (v22);
      int v12 = 1;
      int v21 = v70;
      int v17 = v70;
      int v9 = a3;
      uint64_t v11 = a2;
      uint64_t v15 = v72;
      unint64_t v23 = *v16;
      if (v23 == 0x7FFFFFFF)
      {
LABEL_18:
        int v24 = *v19;
        if (v21 >= *v19) {
          goto LABEL_34;
        }
        goto LABEL_4;
      }
LABEL_29:
      uint64_t v32 = *(void *)(*v69 + ((v23 >> 5) & 0x7FFFFF8));
      if (*(__int16 *)(v32 + 8 * v23) == -2)
      {
        BOOL v33 = *(unsigned __int16 *)(v32 + 8 * v23 + 2) == 0;
        int v24 = *v19;
        if (v21 >= *v19 && v33)
        {
LABEL_34:
          if (a6 != 0xFFFF)
          {
            uint64_t v35 = v11 + (v15 << 7);
            uint64_t v36 = v15;
            __int16 v79 = sub_1000BD964(v10, *(unsigned __int16 *)(v35 + 2 * (v24 - 1) + 16), 0);
            uint64_t result = sub_1000BDCD4(v10, (uint64_t)&v79, 1u, a6);
            uint64_t v15 = v36;
            uint64_t v11 = a2;
            *(_DWORD *)(v35 + 12) += result;
          }
          ++v17;
          int v12 = 1;
LABEL_5:
          uint64_t v14 = v11 + (v15 << 7);
          *(_DWORD *)(v14 + 12) -= *(__int16 *)(v14 + 124);
          *(_WORD *)(v14 + 124) = 0;
          goto LABEL_6;
        }
      }
LABEL_4:
      if (v12) {
        goto LABEL_5;
      }
LABEL_6:
      v16[2] = v17;
LABEL_7:
      ++a7;
      ++v13;
    }
    while (v13 != v9);
  }
  return result;
}

uint64_t sub_1000D6EDC(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return sub_100023880(qword_100106A10 + ((unint64_t)*a1 << 7), qword_100106A10 + ((unint64_t)*a2 << 7));
}

uint64_t sub_1000D6EF8(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v6 = a1;
  int v7 = (char *)*(__int16 *)(a1 + 60);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v146 = *(void *)(a1 + 88);
  uint64_t v152 = *(void *)(a1 + 96);
  unsigned int v16 = sub_1000CD550();
  if (!*(_DWORD *)(v6 + 64))
  {
    if (!sub_1000D6224((void **)v6)) {
      return 0;
    }
    *(_DWORD *)(v6 + 64) = 1;
  }
  int v17 = (char *)sub_1000CD3E8(4 * ((int)v7 + 1), v9, v10, v11, v12, v13, v14, v15);
  bzero(v17, 4 * (int)v7);
  *(_DWORD *)&v17[4 * (int)v7] = 1;
  if (*(int *)(v6 + 56) >= 1)
  {
    unsigned int v25 = 0;
    do
    {
      uint64_t v26 = 4 * *(__int16 *)(*(void *)(*(void *)v6 + 8 * (v25 >> 8)) + 8 * v25 + 2);
      ++*(_DWORD *)&v17[v26];
      ++v25;
    }
    while ((signed int)v25 < *(_DWORD *)(v6 + 56));
  }
  if ((int)v7 > 1)
  {
    uint64_t v27 = (v7 - 1);
    do
    {
      if (!*(_DWORD *)&v17[4 * v27])
      {
        int v29 = (unsigned int *)(v8 + 16 * (v27 - 1));
        int v30 = v29[1];
        if (v30 >= 1)
        {
          unsigned int v31 = *v29;
          int v32 = v30 + v31;
          do
          {
            uint64_t v33 = 4 * *(__int16 *)(*(void *)(*(void *)v6 + 8 * (v31 >> 8)) + 8 * v31 + 2);
            --*(_DWORD *)&v17[v33];
            ++v31;
          }
          while ((int)v31 < v32);
        }
      }
      BOOL v28 = v27-- <= 1;
    }
    while (!v28);
  }
  uint64_t v34 = (int)v7 - 1;
  unint64_t v143 = sub_1000CD3E8(4 * ((int)v7 + 1), v18, v19, v20, v21, v22, v23, v24);
  if (qword_100101CC0) {
    unint64_t v35 = *(void *)(qword_100101CC0 + 5400) / 0x1CuLL;
  }
  else {
    LODWORD(v35) = 0;
  }
  int v137 = v35;
  if ((int)v35 >= 1000) {
    LODWORD(v35) = 1000;
  }
  int v156 = v35;
  uint64_t v36 = sub_1000C328C(28 * (int)v35);
  uint64_t v37 = (uint64_t)v36;
  if (v36)
  {
    uint64_t v38 = *(void *)(v6 + 128);
    if (v38)
    {
      uint64_t v139 = *(unsigned int **)(v6 + 128);
      sub_10009E6D4(v38, 1, 1);
      if ((int)v7 >= 1) {
        goto LABEL_23;
      }
    }
    else
    {
      if (qword_100101CC0) {
        int v126 = *(_DWORD *)(qword_100101CC0 + 4120);
      }
      else {
        int v126 = 0;
      }
      uint64_t v127 = sub_10009E548(v126);
      *(void *)(v6 + 128) = v127;
      sub_10009E68C(v127, *(void *)(v6 + 96));
      uint64_t v139 = *(unsigned int **)(v6 + 128);
      sub_10009E6D4((uint64_t)v139, 1, 1);
      if ((int)v7 >= 1)
      {
LABEL_23:
        unsigned int v129 = v16;
        int v39 = 0;
        uint64_t v149 = (char *)(v37 + 28 * v156);
        if (a3 >= a2) {
          int v40 = a2;
        }
        else {
          int v40 = a3;
        }
        int v41 = (const void *)(a4 + 2 * (a3 - v40));
        uint64_t v42 = 0;
        __int16 v135 = v40;
        size_t v133 = 2 * v40;
        uint64_t v134 = v41;
        if (v137 >= 0) {
          int v43 = v137;
        }
        else {
          int v43 = v137 + 1;
        }
        int v140 = v43 >> 1;
        signed int v44 = (char *)v37;
        uint64_t v130 = v8;
        int v131 = v7;
        uint64_t v141 = v6;
        uint64_t v132 = (int)v7 - 1;
        while (1)
        {
          while (1)
          {
            *(_DWORD *)(v143 + 4 * v42) = v39;
            if (v42 >= v34) {
              break;
            }
            signed int v45 = (char *)(v42 + 1);
            if (*(_DWORD *)&v17[4 * v42 + 4]) {
              break;
            }
            ++v42;
            if (v45 == v7) {
              goto LABEL_141;
            }
          }
          sub_10009E740((uint64_t)v139);
          signed int v46 = (unsigned int *)(v8 + 16 * v42);
          int v47 = v46[1];
          if (v47 >= 1) {
            break;
          }
          int v151 = 0x40000000;
          uint64_t v101 = qword_100101CC0;
          if (qword_100101CC0)
          {
LABEL_108:
            int v102 = *(_DWORD *)(v101 + 5568);
            goto LABEL_111;
          }
LABEL_110:
          int v102 = 0;
LABEL_111:
          uint64_t v8 = v130;
          int v7 = v131;
          int v103 = *(_DWORD *)(v143 + 4 * v42);
          uint64_t v104 = &v44[28 * v103];
          if (v39 > v103)
          {
            int v105 = v102 + v151;
            uint64_t v106 = &v44[28 * *(int *)(v143 + 4 * v42)];
            do
            {
              if (*((_DWORD *)v106 + 3) <= v105)
              {
                long long v107 = *(_OWORD *)v106;
                *(_OWORD *)(v104 + 12) = *(_OWORD *)(v106 + 12);
                *(_OWORD *)uint64_t v104 = v107;
                v104 += 28;
              }
              v106 += 28;
            }
            while (v106 < &v44[28 * v39]);
            int v103 = *(_DWORD *)(v143 + 4 * v42);
          }
          int v108 = -1227133513 * ((unint64_t)(v104 - v44) >> 2);
          uint64_t v109 = (v108 - v103);
          if ((int)v109 > 1)
          {
            int v111 = &v44[28 * v103];
            qsort(v111, (v108 - v103), 0x1CuLL, (int (__cdecl *)(const void *, const void *))sub_1000D9558);
            int v112 = 0;
            uint64_t v113 = 1;
            while (1)
            {
              int v117 = &v111[28 * v113];
              uint64_t v118 = v112;
              if (*((unsigned __int16 *)v117 + 1) == *(unsigned __int16 *)&v111[28 * v112 + 2]
                && *(unsigned __int16 *)&v111[28 * v113 + 4] == *(unsigned __int16 *)&v111[28 * v112 + 4])
              {
                int v119 = *(__int16 *)&v111[28 * v113 + 16];
                if (v119 == *(__int16 *)&v111[28 * v112 + 16])
                {
                  if (v119 < 2) {
                    goto LABEL_122;
                  }
                  int v120 = v119 - 1;
                  while (1)
                  {
                    --v120;
                    if (*(unsigned __int16 *)&v111[28 * v113 + 18 + 2 * v120] != *(unsigned __int16 *)&v111[28 * v112 + 18 + 2 * v120]) {
                      break;
                    }
                    if (v120 < 1) {
                      goto LABEL_122;
                    }
                  }
                }
              }
              ++v112;
              long long v114 = *(_OWORD *)v117;
              long long v115 = *(_OWORD *)(v117 + 12);
              int v116 = &v111[28 * v118 + 28];
              *(_OWORD *)(v116 + 12) = v115;
              *(_OWORD *)int v116 = v114;
LABEL_122:
              if (++v113 == v109)
              {
                int v110 = v44;
                int v121 = v103 + v112 + 1;
                int v103 = *(_DWORD *)(v143 + 4 * v42);
                int v39 = v121;
                LODWORD(v109) = v121 - v103;
                if (v121 - v103 >= 1) {
                  goto LABEL_133;
                }
                goto LABEL_138;
              }
            }
          }
          int v39 = v108;
          int v110 = v44;
          if ((int)v109 >= 1)
          {
LABEL_133:
            uint64_t v122 = (int *)&v110[28 * v103 + 8];
            do
            {
              int v123 = *((unsigned __int16 *)v122 - 3);
              if (v123 != 65534)
              {
                int v124 = *((unsigned __int16 *)v122 - 2);
                int v125 = sub_10009E750(v139, *v122, v123, 0x7FFFFFFFFFFFFFFFLL, *((_WORD *)v122 - 2) == 0, 0, *((_WORD *)v122 - 4));
                *uint64_t v122 = v125;
                if (!v124) {
                  sub_10009EBBC((uint64_t)v139, v125, v122[1]);
                }
              }
              v122 += 7;
              LODWORD(v109) = v109 - 1;
            }
            while (v109);
          }
LABEL_138:
          signed int v44 = v110;
          uint64_t v37 = (uint64_t)&v110[28 * v39];
          ++v42;
          uint64_t v34 = v132;
          if ((char *)v42 == v131)
          {
LABEL_141:
            uint64_t v36 = v44;
            unsigned int v16 = v129;
LABEL_149:
            *(_DWORD *)(v143 + 4 * (void)v7) = v39;
            uint64_t v37 = 1;
            goto LABEL_150;
          }
        }
        unsigned int v48 = *v46;
        int v142 = v47 + *v46;
        size_t v136 = v46 + 3;
        int v157 = 0x40000000;
        int v151 = 0x40000000;
        uint64_t v150 = v42;
        while (1)
        {
          uint64_t v49 = *(void *)(*(void *)v6 + 8 * (v48 >> 8));
          unsigned int v50 = v48;
          unint64_t v51 = (unsigned __int16 *)(v49 + 8 * v48);
          unsigned int v52 = *v51;
          unsigned int v147 = v48;
          if (v52 != 65534) {
            break;
          }
          int v53 = *v136 + (__int16)v51[2];
          if (v53 <= v157)
          {
            if ((char *)v37 == v149)
            {
              unsigned int v77 = v44;
              if (2 * v156 >= v137) {
                int v78 = v137;
              }
              else {
                int v78 = 2 * v156;
              }
              unsigned int v79 = v78 - v156;
              if (v78 - v156 < 1)
              {
                if (!v79) {
                  goto LABEL_152;
                }
                goto LABEL_98;
              }
              do
              {
                uint64_t v80 = sub_1000C328C(28 * v78);
                if (v80)
                {
                  uint64_t v42 = (uint64_t)v80;
                  int v99 = v78;
                  goto LABEL_100;
                }
                unsigned int v81 = v79 >> 1;
                int v78 = (v79 >> 1) + v156;
                BOOL v28 = v79 > 1;
                v79 >>= 1;
              }
              while (v28);
              if (!v81)
              {
LABEL_152:
                uint64_t v37 = 0;
                unsigned int v16 = v129;
                uint64_t v36 = v77;
                goto LABEL_150;
              }
LABEL_98:
              uint64_t v42 = 0;
              int v99 = v78;
LABEL_100:
              j__memmove((void *)v42, v77, 28 * v156);
              sub_1000C321C((uint64_t)v77);
              uint64_t v37 = v42 + 28 * v156;
              int v156 = v78;
              signed int v44 = (char *)v42;
              uint64_t v149 = (char *)(v42 + 28 * v99);
              LOWORD(v42) = v150;
            }
            *(_WORD *)uint64_t v37 = v42;
            *(_WORD *)(v37 + 2) = -2;
            *(_WORD *)(v37 + 16) = v135;
            j__memmove((void *)(v37 + 18), v134, v133);
            *(_WORD *)(v37 + 4) = 0;
            *(_DWORD *)(v37 + 12) = v53;
            if (v53 < v151)
            {
              LODWORD(v100) = qword_100101CC0;
              if (qword_100101CC0) {
                uint64_t v100 = *(void *)(qword_100101CC0 + 5568);
              }
              int v157 = v53 + v100;
              int v151 = v53;
            }
            int v54 = v44;
            *(_DWORD *)(v37 + 8) = -1;
            v37 += 28;
            if (++v39 <= v140) {
              goto LABEL_106;
            }
LABEL_75:
            uint64_t v6 = v141;
            uint64_t v42 = v150;
            signed int v44 = v54;
            if (qword_100101CC0) {
              int v82 = *(_DWORD *)(qword_100101CC0 + 5568);
            }
            else {
              int v82 = 0;
            }
            int v83 = *(_DWORD *)(v143 + 4 * v150);
            uint64_t v84 = &v54[28 * v83];
            if (v39 > v83)
            {
              int v85 = v82 + v151;
              uint64_t v86 = &v54[28 * *(int *)(v143 + 4 * v150)];
              do
              {
                if (*((_DWORD *)v86 + 3) <= v85)
                {
                  long long v87 = *(_OWORD *)v86;
                  *(_OWORD *)(v84 + 12) = *(_OWORD *)(v86 + 12);
                  *(_OWORD *)uint64_t v84 = v87;
                  v84 += 28;
                }
                v86 += 28;
              }
              while (v86 < &v54[28 * v39]);
              int v83 = *(_DWORD *)(v143 + 4 * v150);
            }
            int v39 = -1227133513 * ((unint64_t)(v84 - v54) >> 2);
            uint64_t v88 = (v39 - v83);
            if ((int)v88 >= 2)
            {
              size_t v89 = &v54[28 * v83];
              qsort(v89, (v39 - v83), 0x1CuLL, (int (__cdecl *)(const void *, const void *))sub_1000D9558);
              int v90 = 0;
              uint64_t v91 = 1;
              while (1)
              {
                int v95 = &v89[28 * v91];
                uint64_t v96 = v90;
                if (*((unsigned __int16 *)v95 + 1) == *(unsigned __int16 *)&v89[28 * v90 + 2]
                  && *(unsigned __int16 *)&v89[28 * v91 + 4] == *(unsigned __int16 *)&v89[28 * v90 + 4])
                {
                  int v97 = *(__int16 *)&v89[28 * v91 + 16];
                  if (v97 == *(__int16 *)&v89[28 * v90 + 16])
                  {
                    if (v97 < 2) {
                      goto LABEL_87;
                    }
                    int v98 = v97 - 1;
                    while (1)
                    {
                      --v98;
                      if (*(unsigned __int16 *)&v89[28 * v91 + 18 + 2 * v98] != *(unsigned __int16 *)&v89[28 * v90 + 18 + 2 * v98]) {
                        break;
                      }
                      if (v98 < 1) {
                        goto LABEL_87;
                      }
                    }
                  }
                }
                ++v90;
                long long v92 = *(_OWORD *)v95;
                long long v93 = *(_OWORD *)(v95 + 12);
                uint64_t v94 = &v89[28 * v96 + 28];
                *(_OWORD *)(v94 + 12) = v93;
                *(_OWORD *)uint64_t v94 = v92;
LABEL_87:
                if (++v91 == v88)
                {
                  int v39 = v83 + v90 + 1;
                  break;
                }
              }
            }
            uint64_t v37 = (uint64_t)&v54[28 * v39];
            unsigned int v48 = v147 + 1;
            if ((int)(v147 + 1) >= v142) {
              goto LABEL_107;
            }
          }
          else
          {
            int v54 = v44;
            if (v39 > v140) {
              goto LABEL_75;
            }
LABEL_106:
            uint64_t v6 = v141;
            uint64_t v42 = v150;
            signed int v44 = v54;
            unsigned int v48 = v147 + 1;
            if ((int)(v147 + 1) >= v142)
            {
LABEL_107:
              uint64_t v101 = qword_100101CC0;
              if (qword_100101CC0) {
                goto LABEL_108;
              }
              goto LABEL_110;
            }
          }
        }
        uint64_t v148 = (_WORD *)(v49 + 8 * v48);
        int v153 = v39;
        uint64_t v55 = *(void *)(*(void *)(v6 + 16) + 8 * (v48 >> 8));
        uint64_t v56 = (int *)(v143 + 4 * (__int16)(v148[1] - 1));
        uint64_t v57 = *v56;
        uint64_t v58 = (v56[1] - v57);
        int v59 = *(_DWORD *)(v55 + 12 * v48 + 8);
        unsigned int v154 = sub_1000BD964(v152, v52, 0);
        if ((int)v58 < 1)
        {
          int v54 = v44;
        }
        else
        {
          uint64_t v60 = v57;
          uint64_t v61 = 0;
          int v54 = v44;
          uint64_t v138 = v60;
          uint64_t v62 = &v44[28 * (int)v60];
          uint64_t v63 = v55 + 12 * v50;
          v155 = (unsigned __int16 *)(v63 + 4);
          uint64_t v145 = (_WORD *)(v63 + 6);
          uint64_t v64 = v146;
          do
          {
            int v65 = *((_DWORD *)v62 + 3) + v59;
            if (v65 <= v157 && sub_100005928(v64, *((unsigned __int16 *)v62 + 2), *v155))
            {
              int v66 = v65 + sub_1000BDCD4(v152, (uint64_t)(v62 + 18), *((__int16 *)v62 + 8), v154);
              if (v66 <= v157)
              {
                if ((char *)v37 == v149)
                {
                  if (2 * v156 >= v137) {
                    int v67 = v137;
                  }
                  else {
                    int v67 = 2 * v156;
                  }
                  unsigned int v68 = v67 - v156;
                  if (v67 - v156 < 1)
                  {
                    if (!v68)
                    {
LABEL_142:
                      uint64_t v37 = 0;
                      unsigned int v16 = v129;
                      uint64_t v36 = v54;
                      goto LABEL_150;
                    }
LABEL_58:
                    int v71 = 0;
                    int v72 = v67;
                  }
                  else
                  {
                    while (1)
                    {
                      int v69 = (char *)sub_1000C328C(28 * v67);
                      if (v69) {
                        break;
                      }
                      unsigned int v70 = v68 >> 1;
                      int v67 = (v68 >> 1) + v156;
                      BOOL v28 = v68 > 1;
                      v68 >>= 1;
                      if (!v28)
                      {
                        if (!v70) {
                          goto LABEL_142;
                        }
                        goto LABEL_58;
                      }
                    }
                    int v71 = v69;
                    int v72 = v67;
                  }
                  j__memmove(v71, v54, 28 * v156);
                  sub_1000C321C((uint64_t)v54);
                  uint64_t v37 = (uint64_t)&v71[28 * v156];
                  uint64_t v149 = &v71[28 * v72];
                  int v156 = v67;
                  int v54 = v71;
                  uint64_t v62 = &v71[28 * v61 + 28 * v138];
                }
                *(_WORD *)uint64_t v37 = v150;
                int v73 = *((__int16 *)v62 + 8);
                BOOL v74 = v73 == a2;
                int v75 = v73 - v74;
                *(_WORD *)(v37 + 16) = v73 - v74 + 1;
                j__memmove((void *)(v37 + 18), &v62[2 * (v73 == a2) + 18], 2 * (v73 - v74));
                *(_WORD *)(v37 + 18 + 2 * v75) = v154;
                *(_WORD *)(v37 + 2) = *v148;
                uint64_t v64 = v146;
                *(_WORD *)(v37 + 4) = *v145;
                *(_DWORD *)(v37 + 8) = *((_DWORD *)v62 + 2);
                *(_DWORD *)(v37 + 12) = v66;
                if (v151 > v66)
                {
                  LODWORD(v76) = qword_100101CC0;
                  if (qword_100101CC0) {
                    uint64_t v76 = *(void *)(qword_100101CC0 + 5568);
                  }
                  int v157 = v66 + v76;
                  int v151 = v66;
                }
                v37 += 28;
                ++v153;
              }
            }
            ++v61;
            v62 += 28;
          }
          while (v61 != v58);
        }
        int v39 = v153;
        if (v153 <= v140) {
          goto LABEL_106;
        }
        goto LABEL_75;
      }
    }
    int v39 = 0;
    int v7 = 0;
    uint64_t v36 = (_DWORD *)v37;
    goto LABEL_149;
  }
LABEL_150:
  sub_1000C321C((uint64_t)v36);
  sub_1000CD534(v16);
  return v37;
}

uint64_t sub_1000D7AA4(uint64_t a1)
{
  uint64_t v2 = sub_1000C33A0(48);
  uint64_t v3 = v2;
  if (!v2) {
    return v3;
  }
  if (!*(_DWORD *)(a1 + 136))
  {
LABEL_7:
    *(void *)uint64_t v3 = a1;
    return v3;
  }
  LODWORD(v4) = qword_100101CC0;
  if (qword_100101CC0)
  {
    uint64_t v4 = *(void *)(qword_100101CC0 + 4096);
    if ((v4 & 0x80000000) != 0) {
      return 0;
    }
  }
  *(_DWORD *)(v2 + 16) = v4;
  uint64_t v5 = sub_1000C33A0(16 * (int)v4);
  *(void *)(v3 + 24) = v5;
  if (v5)
  {
    uint64_t v6 = sub_1000C33A0(2 * *(int *)(v3 + 16));
    *(void *)(v3 + 40) = v6;
    if (v6) {
      goto LABEL_7;
    }
    sub_1000C321C(*(void *)(v3 + 24));
  }
  sub_1000C321C(v3);
  return 0;
}

uint64_t sub_1000D7B5C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_1000C321C(*(void *)(result + 24));
    sub_1000C321C(*(void *)(v1 + 40));
    return sub_1000C321C(v1);
  }
  return result;
}

uint64_t sub_1000D7BA8(uint64_t *a1, int a2, int a3)
{
  uint64_t v3 = *a1;
  if (*(_DWORD *)(*a1 + 136))
  {
    __int16 v4 = a2;
    a1[1] = 0;
    *((_WORD *)a1 + 19) = 0;
    if (*((int *)a1 + 4) < 2)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      do
      {
        *(_WORD *)(a1[3] + v6) = ++v7;
        v6 += 16;
      }
      while (v7 < *((int *)a1 + 4) - 1);
    }
    *(_WORD *)(a1[3] + 16 * v7) = -1;
    int v8 = *(__int16 *)(v3 + 60);
    if (v8 >= a3) {
      int v8 = a3;
    }
    uint64_t v9 = (int *)(*(void *)(v3 + 48) + 16 * v8);
    BOOL v10 = v8 > a2;
    if (!v9[1] && a2 < (__int16)v8)
    {
      do
      {
        int v8 = (__int16)(v8 - 1);
        int v11 = *(v9 - 3);
        v9 -= 4;
        BOOL v10 = v8 > a2;
        if (v11) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = v8 <= a2;
        }
      }
      while (!v12);
    }
    if (!v10) {
      return 0;
    }
    *((_DWORD *)a1 + 8) = 0x40000000;
    int v13 = v9[1];
    if (v13 >= 1)
    {
      int v14 = *v9;
      int v15 = v13 + *v9;
      do
      {
        uint64_t v16 = *(void *)(*(void *)v3 + 8 * (v14 >> 8)) + 8 * v14;
        int v17 = v9[3] + *(__int16 *)(v16 + 4);
        if (v17 < *((_DWORD *)a1 + 8)) {
          *((_DWORD *)a1 + 8) = v17;
        }
        sub_1000D7D18((int *)a1, v16, v17);
        ++v14;
      }
      while (v14 < v15);
    }
    *((_WORD *)a1 + 18) = v4;
  }
  return 1;
}

int *sub_1000D7D18(int *result, uint64_t a2, int a3)
{
  uint64_t v5 = result;
  uint64_t v6 = qword_100101CC0;
  if (qword_100101CC0) {
    uint64_t v6 = *(void *)(qword_100101CC0 + 1216);
  }
  if (v6 >= a3 - (uint64_t)result[8])
  {
    int v7 = result[3];
    int v8 = result[4];
    if (v7 != v8
      || *(_DWORD *)(*((void *)result + 3) + 16 * *(unsigned __int16 *)(*((void *)result + 5) + 2 * (v7 - 1)) + 8) >= a3)
    {
      int v9 = result[2];
      int v10 = v9 + v7;
      if (v7 <= 0)
      {
        BOOL v12 = (char *)*((void *)result + 5);
        signed int v13 = v5[2];
        int v15 = &v12[2 * v9];
        if (v7 == v8)
        {
LABEL_13:
          uint64_t v16 = *(unsigned __int16 *)&v12[2 * v7 - 2];
          uint64_t v17 = *((void *)v5 + 3) + 16 * v16;
          uint64_t result = (int *)j__memmove(v15 + 2, v15, 2 * (v7 + ~v13));
          *(_WORD *)int v15 = v16;
LABEL_19:
          *(_DWORD *)(v17 + 8) = a3;
          *(void *)uint64_t v17 = a2;
          return result;
        }
      }
      else
      {
        signed int v11 = v10 - 1;
        BOOL v12 = (char *)*((void *)result + 5);
        signed int v13 = v5[2];
        do
        {
          unsigned int v14 = (v13 + v11) >> 1;
          if (*(_DWORD *)(*((void *)v5 + 3) + 16 * *(unsigned __int16 *)&v12[2 * v14] + 8) < a3) {
            signed int v13 = v14 + 1;
          }
          else {
            signed int v11 = v14 - 1;
          }
        }
        while (v13 <= v11);
        int v15 = &v12[2 * v13];
        if (v7 == v8) {
          goto LABEL_13;
        }
      }
      uint64_t v18 = *((unsigned __int16 *)v5 + 19);
      uint64_t v17 = *((void *)v5 + 3) + 16 * v18;
      *((_WORD *)v5 + 19) = *(_WORD *)v17;
      if (v10 >= v8)
      {
        uint64_t v19 = &v12[2 * v9];
        int v20 = v13 - v9;
        j__memmove(v12, v19, 2 * (v13 - v9));
        uint64_t v21 = 2 * v20;
        int v15 = (char *)(*((void *)v5 + 5) + v21);
        uint64_t result = (int *)j__memmove(v15 + 2, &v19[v21], 2 * (v5[3] - v20));
        v5[2] = 0;
      }
      else
      {
        uint64_t result = (int *)j__memmove(v15 + 2, v15, 2 * (v10 - v13));
      }
      *(_WORD *)int v15 = v18;
      ++v5[3];
      goto LABEL_19;
    }
  }
  return result;
}

uint64_t sub_1000D7EE8(uint64_t *a1, _WORD *a2)
{
  uint64_t v2 = (uint64_t *)*a1;
  if (*(_DWORD *)(*a1 + 136))
  {
    if (*((_DWORD *)a1 + 3))
    {
      while (1)
      {
        uint64_t v4 = *((int *)a1 + 2);
        uint64_t v5 = *(unsigned __int16 *)(a1[5] + 2 * v4);
        *((_DWORD *)a1 + 2) = v4 + 1;
        uint64_t v6 = a1[3] + 16 * v5;
        int v7 = *(unsigned __int16 **)v6;
        int v8 = *(_DWORD *)(v6 + 8);
        *(_WORD *)uint64_t v6 = *((_WORD *)a1 + 19);
        *((_WORD *)a1 + 19) = v5;
        int v9 = *((_DWORD *)a1 + 3) - 1;
        *((_DWORD *)a1 + 3) = v9;
        if (v7[1]) {
          BOOL v10 = v7[1] < *((_WORD *)a1 + 18);
        }
        else {
          BOOL v10 = 1;
        }
        if (v10) {
          goto LABEL_4;
        }
        unsigned int v68 = v7;
        uint64_t v11 = v2[6];
        uint64_t v12 = (__int16)v7[1] - 1;
        signed int v13 = (unsigned int *)(v11 + 16 * v12);
        if (!v13[2]) {
          break;
        }
LABEL_10:
        int v14 = *v68;
        if (v14 != 65534)
        {
          *a2 = v14;
          a2[1] = v68[1];
          return 1;
        }
        int v9 = *((_DWORD *)a1 + 3);
LABEL_4:
        if (!v9) {
          return 0;
        }
      }
      v13[2] = 1;
      int v15 = (__int16)v7[1];
      if (v15 < 1
        || (uint64_t v16 = v2[6],
            uint64_t v17 = (unsigned __int16)v15 - 1,
            uint64_t v18 = (unsigned int *)(v16 + 16 * v17),
            int v19 = v18[1],
            v19 < 1))
      {
        int v26 = 0x40000000;
      }
      else
      {
        unsigned int v20 = *v18;
        int v21 = v19 + *v18;
        uint64_t v22 = *v2;
        int v23 = *(_DWORD *)(v16 + 16 * v17 + 12);
        if (v21 <= (int)(v20 + 1)) {
          int v24 = v20 + 1;
        }
        else {
          int v24 = v21;
        }
        unsigned int v25 = v24 - v20;
        if (v24 - v20 >= 2)
        {
          unsigned int v27 = v20 + (v25 & 0xFFFFFFFE);
          int v26 = 0x40000000;
          unsigned int v28 = v25 & 0xFFFFFFFE;
          int v29 = 0x40000000;
          do
          {
            if (v23 + *(__int16 *)(*(void *)(v22 + 8 * (v20 >> 8)) + 8 * v20 + 4) < v26) {
              int v26 = v23 + *(__int16 *)(*(void *)(v22 + 8 * (v20 >> 8)) + 8 * v20 + 4);
            }
            if (v23 + *(__int16 *)(*(void *)(v22 + 8 * ((v20 + 1) >> 8)) + 8 * (v20 + 1) + 4) < v29) {
              int v29 = v23 + *(__int16 *)(*(void *)(v22 + 8 * ((v20 + 1) >> 8)) + 8 * (v20 + 1) + 4);
            }
            v20 += 2;
            v28 -= 2;
          }
          while (v28);
          if (v26 >= v29) {
            int v26 = v29;
          }
          if (v25 == (v25 & 0xFFFFFFFE)) {
            goto LABEL_32;
          }
        }
        else
        {
          int v26 = 0x40000000;
          unsigned int v27 = v20;
        }
        do
        {
          if (v23 + *(__int16 *)(*(void *)(v22 + 8 * (v27 >> 8)) + 8 * v27 + 4) < v26) {
            int v26 = v23 + *(__int16 *)(*(void *)(v22 + 8 * (v27 >> 8)) + 8 * v27 + 4);
          }
          ++v27;
        }
        while ((int)v27 < v21);
      }
LABEL_32:
      uint64_t v30 = v11 + 16 * v12;
      int v31 = *(_DWORD *)(v30 + 4);
      if (v31 < 1) {
        goto LABEL_10;
      }
      unsigned int v32 = *v13;
      int v33 = v31 + *v13;
      uint64_t v34 = (_DWORD *)(v30 + 12);
      int v35 = v8 - v26;
      uint64_t v36 = qword_100101CC0;
      int v67 = v34;
      int v69 = v8 - v26;
      int v66 = v33;
      while (1)
      {
        if (v36) {
          uint64_t v39 = *(void *)(v36 + 1216);
        }
        else {
          uint64_t v39 = 0;
        }
        uint64_t v40 = *(void *)(*v2 + 8 * (v32 >> 8)) + 8 * v32;
        int v41 = v35 + *v34 + *(__int16 *)(v40 + 4);
        if (v39 < v41 - (uint64_t)*((int *)a1 + 8)) {
          goto LABEL_36;
        }
        int v42 = *((_DWORD *)a1 + 3);
        int v43 = *((_DWORD *)a1 + 4);
        if (v42 == v43 && *(_DWORD *)(a1[3] + 16 * *(unsigned __int16 *)(a1[5] + 2 * (v42 - 1)) + 8) < v41) {
          goto LABEL_36;
        }
        int v44 = *((_DWORD *)a1 + 2);
        int v45 = v44 + v42;
        if (v42 <= 0)
        {
          int v47 = (char *)a1[5];
          signed int v48 = *((_DWORD *)a1 + 2);
          unsigned int v50 = &v47[2 * v44];
          if (v42 != v43) {
            goto LABEL_52;
          }
        }
        else
        {
          signed int v46 = v45 - 1;
          int v47 = (char *)a1[5];
          signed int v48 = *((_DWORD *)a1 + 2);
          do
          {
            unsigned int v49 = (v46 + v48) >> 1;
            if (*(_DWORD *)(a1[3] + 16 * *(unsigned __int16 *)&v47[2 * v49] + 8) < v41) {
              signed int v48 = v49 + 1;
            }
            else {
              signed int v46 = v49 - 1;
            }
          }
          while (v48 <= v46);
          unsigned int v50 = &v47[2 * v48];
          if (v42 != v43)
          {
LABEL_52:
            uint64_t v51 = *((unsigned __int16 *)a1 + 19);
            uint64_t v38 = a1[3] + 16 * v51;
            *((_WORD *)a1 + 19) = *(_WORD *)v38;
            if (v45 >= v43)
            {
              unsigned int v52 = &v47[2 * v44];
              int v53 = v2;
              int v54 = v48 - v44;
              j__memmove(v47, v52, 2 * (v48 - v44));
              uint64_t v55 = 2 * v54;
              unsigned int v50 = (char *)(a1[5] + v55);
              uint64_t v56 = &v52[v55];
              uint64_t v34 = v67;
              int v57 = *((_DWORD *)a1 + 3) - v54;
              uint64_t v2 = v53;
              j__memmove(v50 + 2, v56, 2 * v57);
              int v35 = v69;
              *((_DWORD *)a1 + 2) = 0;
            }
            else
            {
              j__memmove(v50 + 2, v50, 2 * (v45 - v48));
              int v35 = v69;
            }
            *(_WORD *)unsigned int v50 = v51;
            ++*((_DWORD *)a1 + 3);
            int v33 = v66;
            goto LABEL_35;
          }
        }
        uint64_t v37 = *(unsigned __int16 *)&v47[2 * v42 - 2];
        uint64_t v38 = a1[3] + 16 * v37;
        j__memmove(v50 + 2, v50, 2 * (v42 + ~v48));
        int v35 = v69;
        *(_WORD *)unsigned int v50 = v37;
        uint64_t v34 = v67;
LABEL_35:
        *(_DWORD *)(v38 + 8) = v41;
        *(void *)uint64_t v38 = v40;
        uint64_t v36 = qword_100101CC0;
LABEL_36:
        if ((int)++v32 >= v33) {
          goto LABEL_10;
        }
      }
    }
    return 0;
  }
  unsigned int v58 = *((_DWORD *)v2 + 35);
  int v59 = *((_DWORD *)v2 + 14);
  if ((int)v58 >= v59)
  {
    uint64_t v63 = 0;
    if (v58 == v59) {
      return 0;
    }
  }
  else
  {
    uint64_t v60 = *v2;
    do
    {
      uint64_t v61 = *(void *)(v60 + 8 * (v58 >> 8));
      uint64_t v62 = v58;
      if (*(__int16 *)(v61 + 8 * v62) != -2) {
        break;
      }
      *((_DWORD *)v2 + 35) = ++v58;
    }
    while ((int)v58 < v59);
    uint64_t v63 = (_WORD *)(v61 + 8 * v62);
    if (v58 == v59) {
      return 0;
    }
  }
  *a2 = *v63;
  a2[1] = v63[1];
  ++*((_DWORD *)v2 + 35);
  return 1;
}

uint64_t sub_1000D83AC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  while (!*((_DWORD *)a1 + 31))
  {
    uint64_t v5 = *a1;
    uint64_t v6 = *(void *)(*(void *)(*a1 + 8 * ((a2 + a3) >> 9))
                   + 8 * ((a2 + a3) >> 1));
    int v7 = (int)v6 >> 16;
    uint64_t v8 = v6 << 16 >> 48;
    uint64_t v9 = a2;
    uint64_t v10 = a3;
LABEL_5:
    uint64_t v11 = v9;
    while (1)
    {
      uint64_t v9 = v11;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 8));
      uint64_t v14 = v11;
      int v12 = *(unsigned __int16 *)(v13 + 8 * v14) - (unsigned __int16)v6;
      if (v12) {
        goto LABEL_7;
      }
      uint64_t v15 = v13 + 8 * v14;
      int v16 = *(unsigned __int16 *)(v15 + 2);
      if (v16 == WORD1(v6)) {
        break;
      }
      int v12 = (__int16)v16 - v7;
LABEL_7:
      uint64_t v11 = (v9 + 1);
      if ((v12 & 0x80000000) == 0) {
        goto LABEL_12;
      }
    }
    int v17 = *(unsigned __int16 *)(v15 + 4);
    if (v17 != WORD2(v6))
    {
      int v12 = (__int16)v17 - v8;
      goto LABEL_7;
    }
LABEL_12:
    uint64_t v18 = (unsigned __int16 *)(v13 + 8 * v14);
    while (2)
    {
      uint64_t v20 = v10;
      uint64_t v21 = *(void *)(v5 + 8 * (v10 >> 8));
      uint64_t v22 = v10;
      int v23 = *(unsigned __int16 *)(v21 + 8 * v22);
      uint64_t result = v23 - (unsigned __int16)v6;
      if (v23 != (unsigned __int16)v6)
      {
LABEL_14:
        uint64_t v10 = (v20 - 1);
        if ((int)result <= 0) {
          goto LABEL_20;
        }
        continue;
      }
      break;
    }
    uint64_t v24 = v21 + 8 * v22;
    int v25 = *(unsigned __int16 *)(v24 + 2);
    if (v25 != WORD1(v6))
    {
      uint64_t result = ((__int16)v25 - v7);
      goto LABEL_14;
    }
    uint64_t result = *(unsigned __int16 *)(v24 + 4);
    if (result != WORD2(v6))
    {
      uint64_t result = ((__int16)result - v8);
      goto LABEL_14;
    }
    LODWORD(v10) = v20 - 1;
LABEL_20:
    if (v9 == v20)
    {
      if ((int)v9 - 1 > (int)a2) {
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v26 = v21 + 8 * v22;
      uint64_t result = v26 + 2;
      unsigned int v27 = (unsigned __int16 *)(v26 + 4);
      do
      {
        int v28 = *v18;
        if (v28 == v23)
        {
          int v29 = v18[1];
          int v30 = *(unsigned __int16 *)result;
          if (v29 != v30 || (int v29 = v18[2], v30 = *v27, v29 != v30))
          {
            if ((__int16)v29 != (__int16)v30)
            {
LABEL_30:
              uint64_t v31 = *(void *)v18;
              *(void *)uint64_t v18 = *(void *)(v21 + 8 * v22);
              *(void *)(v21 + 8 * v22) = v31;
              uint64_t v5 = *a1;
              uint64_t v10 = v20;
              goto LABEL_5;
            }
          }
        }
        else if (v28 != v23)
        {
          goto LABEL_30;
        }
        uint64_t v9 = (v9 + 1);
        uint64_t v18 = (unsigned __int16 *)(*(void *)(v5 + 8 * (v9 >> 8)) + 8 * v9);
      }
      while (v20 != v9);
      LODWORD(v9) = v20;
      if ((int)v10 > (int)a2) {
LABEL_32:
      }
        uint64_t result = sub_1000D83AC(a1);
    }
    a2 = (v9 + 1);
    if ((int)a2 >= (int)a3) {
      return result;
    }
  }
  return sub_1000D85DC(a1, a2, a3);
}

uint64_t sub_1000D85DC(void *a1, uint64_t a2, uint64_t a3)
{
  while (2)
  {
    uint64_t v3 = a3;
    uint64_t v4 = a1;
    uint64_t v5 = *a1;
    uint64_t v6 = 8 * ((a3 + a2) >> 9);
    uint64_t v7 = *(void *)(*(void *)(*a1 + v6) + 8 * ((a3 + a2) >> 1));
    uint64_t v8 = a1[2];
    uint64_t v9 = *(void *)(v8 + v6) + 12 * ((a3 + a2) >> 1);
    int v10 = *(_DWORD *)v9;
    int v11 = *(unsigned __int16 *)(v9 + 4);
    int v12 = *(unsigned __int16 *)(v9 + 6);
    int v13 = (int)v7 >> 16;
    uint64_t v14 = v7 << 16 >> 48;
    uint64_t v15 = a2;
    while (2)
    {
      uint64_t v20 = v15;
      while (1)
      {
        uint64_t v15 = v20;
        uint64_t v22 = 8 * (v20 >> 8);
        uint64_t v23 = *(void *)(v5 + v22);
        uint64_t v24 = v20;
        uint64_t v25 = *(void *)(v8 + v22);
        uint64_t result = v25 + 12 * v24;
        int v21 = *(unsigned __int16 *)(v23 + 8 * v24) - (unsigned __int16)v7;
        if (v21) {
          goto LABEL_5;
        }
        int v21 = *(_DWORD *)result - v10;
        if (*(_DWORD *)result != v10) {
          goto LABEL_5;
        }
        int v21 = *(unsigned __int16 *)(v25 + 12 * v24 + 4) - v11;
        if (v21) {
          goto LABEL_5;
        }
        int v21 = *(unsigned __int16 *)(v25 + 12 * v24 + 6) - v12;
        if (v21) {
          goto LABEL_5;
        }
        uint64_t v27 = v23 + 8 * v24;
        int v28 = *(unsigned __int16 *)(v27 + 2);
        if (v28 == WORD1(v7)) {
          break;
        }
        int v21 = (__int16)v28 - v13;
LABEL_5:
        uint64_t v20 = (v15 + 1);
        if ((v21 & 0x80000000) == 0) {
          goto LABEL_13;
        }
      }
      int v29 = *(unsigned __int16 *)(v27 + 4);
      if (v29 != WORD2(v7))
      {
        int v21 = (__int16)v29 - v14;
        goto LABEL_5;
      }
LABEL_13:
      int v30 = (unsigned __int16 *)(v23 + 8 * v24);
      while (1)
      {
        uint64_t v32 = a3;
        uint64_t v33 = 8 * (a3 >> 8);
        uint64_t v34 = *(void *)(v5 + v33);
        uint64_t v35 = v32;
        uint64_t v36 = *(void *)(v8 + v33);
        uint64_t v37 = (_DWORD *)(v36 + 12 * v35);
        int v38 = *(unsigned __int16 *)(v34 + 8 * v35);
        int v31 = v38 - (unsigned __int16)v7;
        if (v38 != (unsigned __int16)v7) {
          goto LABEL_15;
        }
        int v31 = *v37 - v10;
        if (*v37 != v10) {
          goto LABEL_15;
        }
        int v39 = *(unsigned __int16 *)(v36 + 12 * v35 + 4);
        int v31 = v39 - v11;
        if (v39 != v11) {
          goto LABEL_15;
        }
        int v40 = *(unsigned __int16 *)(v36 + 12 * v35 + 6);
        int v31 = v40 - v12;
        if (v40 != v12) {
          goto LABEL_15;
        }
        uint64_t v41 = v34 + 8 * v35;
        int v42 = *(unsigned __int16 *)(v41 + 2);
        if (v42 == WORD1(v7)) {
          break;
        }
        int v31 = (__int16)v42 - v13;
LABEL_15:
        a3 = (v32 - 1);
        if (v31 <= 0) {
          goto LABEL_24;
        }
      }
      int v43 = *(unsigned __int16 *)(v41 + 4);
      if (v43 != WORD2(v7))
      {
        int v31 = (__int16)v43 - v14;
        goto LABEL_15;
      }
      LODWORD(a3) = v32 - 1;
LABEL_24:
      if (v15 != v32)
      {
        uint64_t v44 = v36 + 12 * v35;
        int v45 = (unsigned __int16 *)(v44 + 4);
        signed int v46 = (unsigned __int16 *)(v44 + 6);
        uint64_t v47 = v34 + 8 * v35;
        signed int v48 = (unsigned __int16 *)(v47 + 2);
        unsigned int v49 = (unsigned __int16 *)(v47 + 4);
        while (1)
        {
          int v50 = *v30;
          if (v50 != v38) {
            break;
          }
          if (*(_DWORD *)result != *v37) {
            goto LABEL_2;
          }
          int v51 = *(unsigned __int16 *)(result + 4) - *v45;
          if (v51) {
            goto LABEL_34;
          }
          int v51 = *(unsigned __int16 *)(result + 6) - *v46;
          if (v51) {
            goto LABEL_34;
          }
          int v52 = v30[1];
          int v53 = *v48;
          if (v52 != v53 || (v52 = v30[2], int v53 = *v49, v52 != v53))
          {
            int v51 = (__int16)v52 - (__int16)v53;
            goto LABEL_34;
          }
LABEL_35:
          uint64_t v15 = (v15 + 1);
          uint64_t v54 = 8 * (v15 >> 8);
          int v30 = (unsigned __int16 *)(*(void *)(v5 + v54) + 8 * v15);
          uint64_t result = *(void *)(v8 + v54) + 12 * v15;
          if (v32 == v15)
          {
            LODWORD(v15) = v32;
            if ((int)a3 > (int)a2) {
              goto LABEL_37;
            }
            goto LABEL_38;
          }
        }
        int v51 = v50 - v38;
LABEL_34:
        if (v51)
        {
LABEL_2:
          uint64_t v16 = *(void *)v30;
          *(void *)int v30 = *(void *)(v34 + 8 * v35);
          *(void *)(v34 + 8 * v35) = v16;
          uint64_t v17 = *(void *)result;
          int v18 = *(_DWORD *)(result + 8);
          int v19 = v37[2];
          *(void *)uint64_t result = *(void *)v37;
          *(_DWORD *)(result + 8) = v19;
          *(void *)uint64_t v37 = v17;
          v37[2] = v18;
          uint64_t v5 = *v4;
          uint64_t v8 = v4[2];
          a3 = v32;
          continue;
        }
        goto LABEL_35;
      }
      break;
    }
    if ((int)v15 - 1 > (int)a2) {
LABEL_37:
    }
      uint64_t result = sub_1000D85DC(v4);
LABEL_38:
    a2 = (v15 + 1);
    if ((int)a2 < (int)v3)
    {
      a1 = v4;
      a3 = v3;
      continue;
    }
    return result;
  }
}

uint64_t sub_1000D8920(uint64_t a1, int a2, int a3)
{
  do
  {
    uint64_t v5 = *(void *)(a1 + 32);
    unsigned int v6 = *(unsigned __int16 *)(*(void *)(v5 + 8 * ((a2 + a3) >> 9))
                             + 2 * ((a2 + a3) >> 1));
    unsigned int v7 = a3;
    unsigned int v8 = a2;
LABEL_4:
    unsigned int v9 = v8 + 1;
    unsigned int v10 = v7 - v8;
    do
    {
      unsigned int v11 = v8;
      unsigned int v12 = v9;
      LODWORD(result) = v10;
      uint64_t v14 = *(void *)(v5 + 8 * (v8 >> 8));
      uint64_t v15 = v8++;
      ++v9;
      --v10;
    }
    while (*(unsigned __int16 *)(v14 + 2 * v15) < v6);
    uint64_t v16 = (_WORD *)(v14 + 2 * v15);
    ++v7;
    do
    {
      uint64_t v17 = *(void *)(v5 + 8 * (--v7 >> 8));
      int v18 = result;
      unsigned int v19 = *(unsigned __int16 *)(v17 + 2 * v7);
      uint64_t result = (result - 1);
    }
    while (v19 > v6);
    if (v11 == v7)
    {
      unsigned int v7 = v8 - 1;
      if ((int)(v8 - 2) > a2) {
        goto LABEL_14;
      }
    }
    else
    {
      do
      {
        int v20 = (unsigned __int16)*v16;
        if (v20 != v19)
        {
          *uint64_t v16 = v19;
          *(_WORD *)(v17 + 2 * v7) = v20;
          uint64_t v5 = *(void *)(a1 + 32);
          unsigned int v8 = v12 - 1;
          goto LABEL_4;
        }
        uint64_t v16 = (_WORD *)(*(void *)(v5 + 8 * (v12 >> 8)) + 2 * v12);
        ++v12;
        --v18;
      }
      while (v18);
      if ((int)(v7 - 1) > a2) {
LABEL_14:
      }
        uint64_t result = sub_1000D8920(a1);
    }
    a2 = v7 + 1;
  }
  while ((int)(v7 + 1) < a3);
  return result;
}

void *sub_1000D8A54(void *result, uint64_t a2, long long *a3, _DWORD *a4, int a5, int a6, unsigned int a7, uint64_t a8, __int16 a9, int a10)
{
  int v11 = a6;
  uint64_t v13 = a2;
  uint64_t v14 = *a4;
  if (v14 != a5
    || *(_DWORD *)(a2 + ((unint64_t)*(unsigned __int16 *)(a8 + 2 * (a5 - 1)) << 7) + 12) > a6)
  {
    uint64_t v15 = result;
    if ((int)v14 < 1)
    {
      int v84 = a6;
      uint64_t v86 = a2;
      unsigned int v22 = 0x7FFFFFFF;
LABEL_14:
      uint64_t v13 = v86;
      int v11 = v84;
      if (v22 == 0x7FFFFFFF)
      {
LABEL_15:
        uint64_t v27 = *(unsigned __int16 *)(a8 + 2 * (int)v14);
        uint64_t v28 = v13 + (v27 << 7);
        uint64_t v29 = a7 >> 8;
        uint64_t v30 = *(void *)(*result + 8 * v29);
        uint64_t v31 = a7;
        long long v32 = *a3;
        long long v33 = a3[1];
        long long v34 = a3[3];
        *(_OWORD *)(v28 + 32) = a3[2];
        *(_OWORD *)(v28 + 48) = v34;
        *(_OWORD *)uint64_t v28 = v32;
        *(_OWORD *)(v28 + 16) = v33;
        long long v35 = a3[4];
        long long v36 = a3[5];
        long long v37 = a3[7];
        *(_OWORD *)(v28 + 96) = a3[6];
        *(_OWORD *)(v28 + 112) = v37;
        *(_OWORD *)(v28 + 64) = v35;
        *(_OWORD *)(v28 + 80) = v36;
        int v38 = *(unsigned __int16 *)(v30 + 8 * v31);
        if (v38 == 65534)
        {
          __int16 v39 = a9;
          int v40 = a4;
          if (*(_WORD *)(v30 + 8 * v31 + 2))
          {
            uint64_t v41 = v13 + (v27 << 7);
            uint64_t v42 = *(int *)(v41 + 4);
            if (v42) {
              *(unsigned char *)(v42 + v41 + 87) = 1;
            }
          }
        }
        else
        {
          uint64_t v47 = (int *)(v28 + 4);
          *(_WORD *)(v28 + 2 * *(int *)(v28 + 4) + 16) = v38;
          if (*((_DWORD *)result + 31))
          {
            int v48 = *(unsigned __int16 *)(*(void *)(result[2] + 8 * v29) + 12 * v31 + 6);
            int v49 = *v47;
            __int16 v39 = a9;
            int v40 = a4;
            if (!v48)
            {
              *(unsigned char *)(v49 + v13 + (v27 << 7) + 87) = 1;
              int v49 = *v47;
            }
          }
          else
          {
            int v49 = *v47;
            if (*v47 >= 1) {
              *(unsigned char *)(v13 + (v27 << 7) + (v49 - 1) + 88) = *(unsigned char *)(v30 + 8 * v31 + 6);
            }
            __int16 v39 = a9;
            int v40 = a4;
          }
          *(unsigned char *)(v13 + (v27 << 7) + v49 + 88) = 0;
          ++*v47;
        }
        uint64_t v81 = v13 + (v27 << 7);
        *(_WORD *)(v81 + 124) = v39;
        *(_DWORD *)uint64_t v28 = a7;
        *(_DWORD *)(v81 + 12) = v11;
        ++*v40;
      }
      else
      {
        int v43 = a5;
        if (v14 != a5)
        {
          int v43 = v14 + 1;
          *a4 = v14 + 1;
        }
        signed int v44 = v43 - 1;
        if (v44 <= (int)v22)
        {
          unsigned int v45 = *(unsigned __int16 *)(a8 + 2 * v22);
        }
        else
        {
          unsigned int v45 = *(unsigned __int16 *)(a8 + 2 * v44);
          signed int v46 = (_WORD *)(a8 + 2 * v22);
          j__memmove(v46 + 1, v46, (int)(2 * (v44 - v22)));
          uint64_t v13 = v86;
          uint64_t result = v15;
          *signed int v46 = v45;
        }
        uint64_t v64 = v13 + ((unint64_t)v45 << 7);
        uint64_t v65 = a7 >> 8;
        uint64_t v66 = *(void *)(*result + 8 * v65);
        uint64_t v67 = a7;
        long long v68 = *a3;
        long long v69 = a3[1];
        long long v70 = a3[3];
        *(_OWORD *)(v64 + 32) = a3[2];
        *(_OWORD *)(v64 + 48) = v70;
        *(_OWORD *)uint64_t v64 = v68;
        *(_OWORD *)(v64 + 16) = v69;
        long long v71 = a3[4];
        long long v72 = a3[5];
        long long v73 = a3[7];
        *(_OWORD *)(v64 + 96) = a3[6];
        *(_OWORD *)(v64 + 112) = v73;
        *(_OWORD *)(v64 + 64) = v71;
        *(_OWORD *)(v64 + 80) = v72;
        int v74 = *(unsigned __int16 *)(v66 + 8 * v67);
        if (v74 == 65534)
        {
          __int16 v75 = a9;
          if (*(_WORD *)(v66 + 8 * v67 + 2))
          {
            uint64_t v76 = v13 + ((unint64_t)v45 << 7);
            uint64_t v77 = *(int *)(v76 + 4);
            if (v77) {
              *(unsigned char *)(v77 + v76 + 87) = 1;
            }
          }
        }
        else
        {
          int v78 = (int *)(v64 + 4);
          *(_WORD *)(v64 + 2 * *(int *)(v64 + 4) + 16) = v74;
          if (*((_DWORD *)result + 31))
          {
            int v79 = *(unsigned __int16 *)(*(void *)(result[2] + 8 * v65) + 12 * v67 + 6);
            int v80 = *v78;
            __int16 v75 = a9;
            if (!v79)
            {
              *(unsigned char *)(v80 + v13 + ((unint64_t)v45 << 7) + 87) = 1;
              int v80 = *v78;
            }
          }
          else
          {
            int v80 = *v78;
            if (*v78 >= 1) {
              *(unsigned char *)(v13 + ((unint64_t)v45 << 7) + (v80 - 1) + 88) = *(unsigned char *)(v66 + 8 * v67 + 6);
            }
            __int16 v75 = a9;
          }
          *(unsigned char *)(v13 + ((unint64_t)v45 << 7) + v80 + 88) = 0;
          ++*v78;
        }
        uint64_t v82 = v13 + ((unint64_t)v45 << 7);
        *(_WORD *)(v82 + 124) = v75;
        *(_DWORD *)uint64_t v64 = a7;
        *(_DWORD *)(v82 + 12) = v84;
      }
    }
    else
    {
      uint64_t v16 = 0;
      while (1)
      {
        uint64_t v17 = *(unsigned __int16 *)(a8 + 2 * v16);
        uint64_t v18 = v13 + (v17 << 7);
        int v20 = *(_DWORD *)(v18 + 12);
        unsigned int v19 = (_DWORD *)(v18 + 12);
        if (v20 > v11) {
          break;
        }
        uint64_t v21 = v13;
        uint64_t result = (void *)sub_1000D9358(result, (_DWORD *)(v13 + (v17 << 7)), (uint64_t)a3, a7, a10);
        if (result)
        {
          uint64_t v50 = v21 + (v17 << 7);
          int v52 = *(__int16 *)(v50 + 124);
          int v51 = (_WORD *)(v50 + 124);
          int v53 = *v19 - v11 + a9;
          if (v53 - v52 >= 1)
          {
            _WORD *v51 = v53;
            if (a10)
            {
              uint64_t v54 = v21 + (v17 << 7);
              int v55 = *(_DWORD *)(v54 + 4);
              if (v55 < 36) {
                int v56 = v55 + 1;
              }
              else {
                int v56 = 36;
              }
              return j__memmove((void *)(v54 + 88), (char *)a3 + 88, v56);
            }
          }
          return result;
        }
        ++v16;
        uint64_t result = v15;
        uint64_t v13 = v21;
        if (v14 == v16) {
          goto LABEL_15;
        }
      }
      int v84 = v11;
      uint64_t v86 = v13;
      unsigned int v22 = v16;
      if ((int)v16 >= (int)v14) {
        goto LABEL_14;
      }
      uint64_t v23 = v16;
      size_t v24 = 0;
      while (1)
      {
        uint64_t v25 = *(unsigned __int16 *)(a8 + 2 * v23);
        uint64_t v26 = (_DWORD *)(v86 + (v25 << 7));
        uint64_t result = (void *)sub_1000D9358(result, v26, (uint64_t)a3, a7, a10);
        if (result) {
          break;
        }
        ++v23;
        v24 += 2;
        uint64_t result = v15;
        if ((int)v14 <= (int)v23) {
          goto LABEL_14;
        }
      }
      int v58 = v26[3];
      int v57 = v26 + 3;
      int v59 = v58 - v84 + a9;
      if (v59 - *((__int16 *)v57 + 56) >= 1) {
        *((_WORD *)v57 + 56) = v59;
      }
      *int v57 = v84;
      if (a10)
      {
        uint64_t v60 = v86 + (v25 << 7);
        int v61 = *(_DWORD *)(v60 + 4);
        if (v61 < 36) {
          int v62 = v61 + 1;
        }
        else {
          int v62 = 36;
        }
        uint64_t result = j__memmove((void *)(v60 + 88), (char *)a3 + 88, v62);
      }
      if (v22 != v23)
      {
        __int16 v63 = *(_WORD *)(a8 + 2 * v23);
        uint64_t result = j__memmove((void *)(a8 + 2 * (v22 + 1)), (const void *)(a8 + 2 * v22), v24);
        *(_WORD *)(a8 + 2 * v22) = v63;
      }
    }
  }
  return result;
}

uint64_t sub_1000D8F9C(void *a1, unsigned __int16 *a2, int *a3, __int16 *a4)
{
  int v4 = a2[1];
  if (a2[1])
  {
    int v20 = a3;
    uint64_t v21 = a4;
    uint64_t v7 = a1[12];
    __int16 v24 = sub_1000BD964(v7, *a2, 0);
    unsigned int v8 = (unsigned int *)(a1[6] + 16 * ((__int16)a2[1] - 1));
    int v9 = v8[1];
    if (v9 < 1)
    {
      int v12 = 0x40000000;
      __int16 v11 = 0x4000;
      uint64_t v13 = 0x7FFFFFFFLL;
    }
    else
    {
      unsigned int v10 = *v8;
      int v23 = v9 + *v8;
      unsigned int v22 = v8 + 3;
      __int16 v11 = 0x4000;
      int v12 = 0x40000000;
      LODWORD(v13) = 0x7FFFFFFF;
      do
      {
        uint64_t v16 = *(void *)(*a1 + 8 * (v10 >> 8));
        unsigned int v17 = *(unsigned __int16 *)(v16 + 8 * v10);
        if (v17 == 65534)
        {
          while (1)
          {
            unsigned int v18 = sub_1000D8F9C(a1);
            if (v18 == 0x7FFFFFFF) {
              break;
            }
            unsigned int v17 = *(unsigned __int16 *)(*(void *)(*a1 + 8 * (v18 >> 8)) + 8 * v18);
            if (v17 != 65534) {
              goto LABEL_4;
            }
          }
          int v15 = 0;
        }
        else
        {
LABEL_4:
          unsigned int v14 = sub_1000BD964(v7, v17, 0);
          int v15 = sub_1000BDCD4(v7, (uint64_t)&v24, 1u, v14);
        }
        if (*v22 + v15 + *(__int16 *)(v16 + 8 * v10 + 4) >= v12)
        {
          uint64_t v13 = v13;
        }
        else
        {
          __int16 v11 = v15;
          int v12 = *v22 + v15 + *(__int16 *)(v16 + 8 * v10 + 4);
          uint64_t v13 = v10;
        }
        ++v10;
      }
      while ((int)v10 < v23);
    }
    int v4 = v12 - v11;
    a3 = v20;
    a4 = v21;
  }
  else
  {
    __int16 v11 = 0;
    uint64_t v13 = 0x7FFFFFFFLL;
  }
  *a3 = v4;
  *a4 = v11;
  return v13;
}

uint64_t sub_1000D913C(void *a1, unsigned int a2, int *a3, __int16 *a4, unsigned __int16 a5)
{
  unsigned __int16 v31 = a5;
  if (*(_WORD *)(*(void *)(*a1 + 8 * (a2 >> 8)) + 8 * a2 + 2))
  {
    unsigned int v22 = a3;
    int v23 = a4;
    unsigned int v6 = (unsigned int *)(a1[6]
                        + 16 * (*(__int16 *)(*(void *)(*a1 + 8 * (a2 >> 8)) + 8 * a2 + 2) - 1));
    int v7 = v6[1];
    if (v7 < 1)
    {
      int v10 = 0x40000000;
      __int16 v9 = 0x4000;
      uint64_t v11 = 0x7FFFFFFFLL;
    }
    else
    {
      uint64_t v8 = *v6;
      int v28 = v7 + v8;
      uint64_t v25 = v6 + 3;
      uint64_t v24 = a1[12];
      uint64_t v26 = a1[11];
      uint64_t v27 = (unsigned __int16 *)(*(void *)(a1[2] + 8 * (a2 >> 8)) + 12 * a2 + 4);
      __int16 v9 = 0x4000;
      int v10 = 0x40000000;
      uint64_t v11 = 0x7FFFFFFFLL;
      do
      {
        uint64_t v14 = 8 * (v8 >> 8);
        uint64_t v15 = *(void *)(*a1 + v14);
        uint64_t v16 = v8;
        unsigned int v17 = *(unsigned __int16 *)(v15 + 8 * v16);
        if (sub_100005928(v26, *v27, *(unsigned __int16 *)(*(void *)(a1[2] + v14) + 12 * v16 + 6)))
        {
          if (v17 == 65534)
          {
            uint64_t v18 = v8;
            while (1)
            {
              uint64_t v19 = sub_1000D913C(a1, v18, v29, v30, v31);
              if (v19 == 0x7FFFFFFF) {
                break;
              }
              uint64_t v18 = v19;
              unsigned int v17 = *(unsigned __int16 *)(*(void *)(*a1 + 8 * (v19 >> 8)) + 8 * v19);
              if (v17 != 65534) {
                goto LABEL_4;
              }
            }
            int v13 = 0;
          }
          else
          {
LABEL_4:
            unsigned int v12 = sub_1000BD964(v24, v17, 0);
            int v13 = sub_1000BDCD4(v24, (uint64_t)&v31, 1u, v12);
          }
          if (*v25 + v13 + *(__int16 *)(v15 + 8 * v16 + 4) >= v10)
          {
            uint64_t v11 = v11;
          }
          else
          {
            __int16 v9 = v13;
            int v10 = *v25 + v13 + *(__int16 *)(v15 + 8 * v16 + 4);
            uint64_t v11 = v8;
          }
        }
        uint64_t v8 = (v8 + 1);
      }
      while ((int)v8 < v28);
    }
    int v20 = v10 - v9;
    a3 = v22;
    a4 = v23;
  }
  else
  {
    int v20 = 0;
    __int16 v9 = 0;
    uint64_t v11 = 0x7FFFFFFFLL;
  }
  *a3 = v20;
  *a4 = v9;
  return v11;
}

uint64_t sub_1000D9358(void *a1, _DWORD *a2, uint64_t a3, unsigned int a4, int a5)
{
  if (*a2 != a4) {
    return 0;
  }
  unsigned int v7 = *(unsigned __int16 *)(*(void *)(*a1 + 8 * (a4 >> 8)) + 8 * a4);
  int v8 = *(_DWORD *)(a3 + 4);
  if (v7 == 65534)
  {
    unsigned int v7 = *(unsigned __int16 *)(a3 + 2 * (v8 - 1) + 16);
    if (a2[1] != v8) {
      return 0;
    }
  }
  else if (a2[1] != ++v8)
  {
    return 0;
  }
  if (v8)
  {
    uint64_t v9 = a1[12];
    if (qword_100101CC0 && *(_DWORD *)(qword_100101CC0 + 1760))
    {
      if (*((unsigned __int16 *)a2 + v8 + 7) == v7)
      {
        if (v8 >= 2)
        {
          LODWORD(v10) = v8 - 1;
          uint64_t result = 1;
          if (a5)
          {
            while (1)
            {
              uint64_t v10 = (v10 - 1);
              if (*((unsigned __int16 *)a2 + v10 + 8) != *(unsigned __int16 *)(a3
                                                                                            + 2 * v10
                                                                                            + 16)
                || *((unsigned __int8 *)a2 + v10 + 88) != *(unsigned __int8 *)(a3 + v10 + 88))
              {
                break;
              }
              if ((int)v10 <= 0) {
                return result;
              }
            }
          }
          else
          {
            while (1)
            {
              LODWORD(v10) = v10 - 1;
              if (*((unsigned __int16 *)a2 + v10 + 8) != *(unsigned __int16 *)(a3
                                                                                            + 2 * v10
                                                                                            + 16))
                break;
              if ((int)v10 <= 0) {
                return result;
              }
            }
          }
          return 0;
        }
        return 1;
      }
    }
    else
    {
      int v12 = sub_1000BD964(a1[12], *((unsigned __int16 *)a2 + v8 + 7), 0);
      if (v12 == sub_1000BD964(v9, v7, 0))
      {
        if (v8 >= 2)
        {
          for (uint64_t i = (v8 - 2) + 8; ; --i)
          {
            int v14 = sub_1000BD964(v9, *((unsigned __int16 *)a2 + i), 0);
            if (v14 != sub_1000BD964(v9, *(unsigned __int16 *)(a3 + 2 * i), 0)) {
              break;
            }
            uint64_t v15 = i - 8;
            uint64_t result = 1;
            if (v15 < 1) {
              return result;
            }
          }
          return 0;
        }
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t sub_1000D9558(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int16 *)(a1 + 2) - *(unsigned __int16 *)(a2 + 2);
  if (v2) {
    return v2;
  }
  uint64_t v2 = *(unsigned __int16 *)(a1 + 4) - *(unsigned __int16 *)(a2 + 4);
  if (v2) {
    return v2;
  }
  int v4 = *(__int16 *)(a1 + 16);
  uint64_t v2 = (v4 - *(__int16 *)(a2 + 16));
  if (v2) {
    return v2;
  }
  if (v4 >= 2)
  {
    int v5 = v4 - 1;
    while (1)
    {
      --v5;
      uint64_t v2 = *(unsigned __int16 *)(a1 + 2 * v5 + 18)
         - *(unsigned __int16 *)(a2 + 2 * v5 + 18);
      if (v2) {
        break;
      }
      if (v5 < 1) {
        return (*(_DWORD *)(a1 + 12) - *(_DWORD *)(a2 + 12));
      }
    }
    return v2;
  }
  return (*(_DWORD *)(a1 + 12) - *(_DWORD *)(a2 + 12));
}

unint64_t sub_1000D95D8(unint64_t result, unsigned char *a2, unsigned __int8 *a3, int a4)
{
  if (result)
  {
    unsigned int v7 = (unsigned __int8 *)result;
    if ((int)sub_1000CAD00(result) < 1) {
      return 0;
    }
    int v8 = sub_1000CAD00((unint64_t)v7);
    int v9 = 0;
    do
    {
      if (v9 > v8) {
        goto LABEL_12;
      }
      unsigned int v10 = v7[v9];
      if (v10 > 0x1F) {
        ++v9;
      }
      if (v10) {
        int v11 = v10 < 0x20;
      }
      else {
        int v11 = 3;
      }
    }
    while (!v11);
    if (v11 != 3) {
      return 0;
    }
LABEL_12:
    int v12 = sub_1000CAD00((unint64_t)v7);
    if (v12 < 0)
    {
      int v17 = 0;
LABEL_26:
      a3[v17] = 0;
      if (!a2) {
        return 1;
      }
      goto LABEL_27;
    }
    int v13 = 0;
    uint64_t v14 = (v12 + 1);
    while (1)
    {
      int v16 = *v7++;
      int v15 = v16;
      if (!v16)
      {
        a3[v13] = 0;
        if (!a2) {
          return 1;
        }
LABEL_27:
        if (!*a2) {
          return 1;
        }
        int v20 = sub_1000CAD00((unint64_t)a2);
        int v21 = 0;
        do
        {
          if (v21 > v20) {
            goto LABEL_37;
          }
          unsigned int v22 = a2[v21];
          if (v22 > 0x1F) {
            ++v21;
          }
          if (v22) {
            int v23 = v22 < 0x20;
          }
          else {
            int v23 = 3;
          }
        }
        while (!v23);
        if (v23 == 3)
        {
LABEL_37:
          if (*a2)
          {
            sub_1000CAE14(a3, "\\"", a4);
            int v24 = sub_1000CAD00((unint64_t)a3);
            a3 += v24;
            int v25 = sub_1000CAD00((unint64_t)a2);
            int v13 = 0;
            if (v25 < 0)
            {
LABEL_54:
              uint64_t result = 1;
              a3[v13] = 0;
              return result;
            }
            int v26 = a4 - v24;
            uint64_t v27 = (v25 + 1);
            while (1)
            {
              int v30 = *a2++;
              int v29 = v30;
              if (!v30) {
                goto LABEL_54;
              }
              int v31 = v13 + 1;
              if (v13 + 1 >= v26) {
                goto LABEL_55;
              }
              if ((v29 - 94) < 2) {
                goto LABEL_50;
              }
              if (v29 == 32)
              {
                int v28 = v13++;
                a3[v28] = 95;
                if (!--v27) {
                  goto LABEL_54;
                }
                continue;
              }
              if (v29 == 92)
              {
LABEL_50:
                a3[v13] = 94;
                int v32 = v13 + 2;
                if (v13 + 2 >= v26) {
                  goto LABEL_57;
                }
              }
              else
              {
                int v32 = v13 + 1;
                int v31 = v13;
                if (v13 + 1 >= v26)
                {
LABEL_57:
                  uint64_t result = 0;
                  a3[v31] = 0;
                  return result;
                }
              }
              int v13 = v32;
              a3[v31] = v29;
              if (!--v27) {
                goto LABEL_54;
              }
            }
          }
          return 1;
        }
        return 0;
      }
      int v17 = v13 + 1;
      if (v13 + 1 >= a4)
      {
LABEL_55:
        uint64_t result = 0;
        a3[v13] = 0;
        return result;
      }
      if ((v15 - 94) < 2) {
        break;
      }
      if (v15 == 32)
      {
        a3[v13++] = 95;
        if (!--v14) {
          goto LABEL_26;
        }
      }
      else
      {
        if (v15 == 92) {
          break;
        }
        int v18 = v13 + 1;
        int v17 = v13;
        if (v13 + 1 >= a4)
        {
LABEL_43:
          uint64_t result = 0;
          a3[v17] = 0;
          return result;
        }
LABEL_23:
        int v19 = v17;
        int v17 = v18;
        a3[v19] = v15;
        int v13 = v18;
        if (!--v14) {
          goto LABEL_26;
        }
      }
    }
    a3[v13] = 94;
    int v18 = v13 + 2;
    if (v13 + 2 >= a4) {
      goto LABEL_43;
    }
    goto LABEL_23;
  }
  return result;
}

BOOL sub_1000D9870(uint64_t a1, unint64_t a2, int a3, _WORD *a4, int a5)
{
  int v6 = 0;
  int v7 = 0;
  int v8 = (_WORD *)(a1 + 2);
  int v9 = (_WORD *)a2;
  while (1)
  {
    int v10 = (unsigned __int16)*(v8 - 1);
    switch(v10)
    {
      case '_':
        int v11 = v7 == 1 ? 95 : 32;
        break;
      case '^':
        if (!v7)
        {
          int v7 = 1;
          goto LABEL_3;
        }
        int v11 = 94;
        break;
      case '\\':
        if (v7 != 1)
        {
          BOOL result = 0;
          if (!*v8) {
            return result;
          }
          if (v6 >= a3) {
            return result;
          }
          int v7 = 0;
          BOOL result = 0;
          v9[v6] = 0;
          a3 = a5;
          int v6 = 0;
          BOOL v13 = v9 == (_WORD *)a2;
          int v9 = a4;
          if (!v13) {
            return result;
          }
          goto LABEL_3;
        }
        int v11 = 92;
        break;
      default:
        BOOL result = 0;
        if (v7 == 1) {
          return result;
        }
        int v11 = (unsigned __int16)*(v8 - 1);
        if ((unsigned __int16)(v10 - 1) < 0x20u) {
          return result;
        }
        break;
    }
    if (v6 >= a3) {
      return 0;
    }
    v9[v6] = v11;
    if (!v11) {
      break;
    }
    int v7 = 0;
    ++v6;
LABEL_3:
    ++v8;
    if (!v10) {
      goto LABEL_26;
    }
  }
  if (v9 == (_WORD *)a2)
  {
    int v7 = 0;
    int v6 = 0;
    int v9 = a4;
    a3 = a5;
    goto LABEL_3;
  }
  ++v6;
  if (v10) {
    return 0;
  }
LABEL_26:
  if (!v6)
  {
    *a4 = 0;
    if (a2) {
      goto LABEL_30;
    }
    return 0;
  }
  if (!a2) {
    return 0;
  }
LABEL_30:
  if ((int)sub_1000CED6C(a2) < 1) {
    return 0;
  }
  int v14 = sub_1000CED6C(a2);
  unsigned int v15 = 0;
  while ((int)v15 <= v14)
  {
    unsigned int v16 = *(unsigned __int16 *)(a2 + 2 * v15);
    if (v16 > 0x1F) {
      ++v15;
    }
    if (v16) {
      int v17 = v16 < 0x20;
    }
    else {
      int v17 = 3;
    }
    if (v17) {
      return v17 == 3;
    }
  }
  return 1;
}

unint64_t sub_1000D9A10(unint64_t result, _WORD *a2, unsigned __int16 *a3, int a4)
{
  if (!result) {
    return result;
  }
  int v7 = (unsigned __int16 *)result;
  if ((int)sub_1000CED6C(result) < 1) {
    return 0;
  }
  int v8 = sub_1000CED6C((unint64_t)v7);
  int v9 = 0;
  do
  {
    if (v9 > v8) {
      goto LABEL_12;
    }
    unsigned int v10 = v7[v9];
    if (v10 > 0x1F) {
      ++v9;
    }
    if (v10) {
      int v11 = v10 < 0x20;
    }
    else {
      int v11 = 3;
    }
  }
  while (!v11);
  if (v11 != 3) {
    return 0;
  }
LABEL_12:
  int v12 = sub_1000CED6C((unint64_t)v7);
  if (v12 < 0)
  {
    int v16 = 0;
LABEL_26:
    a3[v16] = 0;
    if (!a2) {
      return 1;
    }
LABEL_27:
    if (!*a2) {
      return 1;
    }
    int v19 = sub_1000CED6C((unint64_t)a2);
    int v20 = 0;
    do
    {
      if (v20 > v19) {
        goto LABEL_37;
      }
      unsigned int v21 = (unsigned __int16)a2[v20];
      if (v21 > 0x1F) {
        ++v20;
      }
      if (v21) {
        int v22 = v21 < 0x20;
      }
      else {
        int v22 = 3;
      }
    }
    while (!v22);
    if (v22 == 3)
    {
LABEL_37:
      if (*a2)
      {
        int v32 = 92;
        BOOL result = sub_1000CEEBC(a3, (unsigned __int16 *)&v32, a4);
        if (!result) {
          return result;
        }
        int v23 = sub_1000CED6C((unint64_t)a3);
        a3 += v23;
        int v24 = sub_1000CED6C((unint64_t)a2);
        int v13 = 0;
        if (v24 < 0)
        {
LABEL_54:
          BOOL result = 1;
          goto LABEL_56;
        }
        int v25 = a4 - v23;
        uint64_t v26 = (v24 + 1);
        while (1)
        {
          int v29 = (unsigned __int16)*a2++;
          int v28 = v29;
          if (!v29) {
            goto LABEL_54;
          }
          int v30 = v13 + 1;
          if (v13 + 1 >= v25) {
            goto LABEL_55;
          }
          if ((v28 - 94) < 2) {
            break;
          }
          if (v28 == 32)
          {
            int v27 = v13++;
            a3[v27] = 95;
            if (!--v26) {
              goto LABEL_54;
            }
          }
          else
          {
            if (v28 == 92) {
              break;
            }
            int v31 = v13 + 1;
            int v30 = v13;
            if (v13 + 1 >= v25)
            {
LABEL_58:
              BOOL result = 0;
              int v13 = v30;
              goto LABEL_56;
            }
LABEL_53:
            int v13 = v31;
            a3[v30] = v28;
            if (!--v26) {
              goto LABEL_54;
            }
          }
        }
        a3[v13] = 94;
        int v31 = v13 + 2;
        if (v13 + 2 >= v25) {
          goto LABEL_58;
        }
        goto LABEL_53;
      }
      return 1;
    }
    return 0;
  }
  int v13 = 0;
  uint64_t v14 = (v12 + 1);
  while (1)
  {
    while (1)
    {
      int v18 = *v7++;
      int v17 = v18;
      if (!v18)
      {
        a3[v13] = 0;
        if (!a2) {
          return 1;
        }
        goto LABEL_27;
      }
      int v16 = v13 + 1;
      if (v13 + 1 >= a4) {
        goto LABEL_55;
      }
      if ((v17 - 94) < 2)
      {
LABEL_14:
        a3[v13] = 94;
        int v15 = v13 + 2;
        ++v13;
        int v16 = v15;
        if (v15 >= a4) {
          goto LABEL_55;
        }
        goto LABEL_15;
      }
      if (v17 != 32) {
        break;
      }
      a3[v13++] = 95;
      if (!--v14) {
        goto LABEL_26;
      }
    }
    if (v17 == 92) {
      goto LABEL_14;
    }
    if (v16 >= a4) {
      break;
    }
LABEL_15:
    a3[v13] = v17;
    int v13 = v16;
    if (!--v14) {
      goto LABEL_26;
    }
  }
LABEL_55:
  BOOL result = 0;
LABEL_56:
  a3[v13] = 0;
  return result;
}

uint64_t sub_1000D9C9C(uint64_t a1, int a2)
{
  unsigned int v14 = 0;
  uint64_t v13 = 0;
  uint64_t v12 = 0;
  uint64_t v11 = 0;
  if (a1)
  {
    uint64_t v13 = sub_1000C2EA8(*(void *)(a1 + 6480));
    uint64_t v12 = sub_1000CD350(*(void *)(a1 + 6488));
    int v9 = sub_1000C0D40();
    sub_1000040F8(*(void *)(a1 + 6496), *(void *)(a1 + 6504));
    unsigned int v10 = sub_1000D2948(*(void **)(a1 + 6520), *(void *)(a1 + 6528), &v11);
    nullsub_1(v10);
    if (*(_DWORD *)(a1 + 8160)) {
      return 1;
    }
    sub_1000C0D2C((void *)(a1 + 6648));
    int v5 = (int *)sub_1000C0C70();
    if (!setjmp(v5))
    {
      if (sub_1000CAED0(*(unsigned char **)(a1 + 8168), "Elvis Magic"))
      {
        int v6 = 4;
      }
      else if (!*(_DWORD *)(a1 + 8160) {
             && ((int v7 = a2) != 0 || qword_100101CC0 && (int v7 = *(_DWORD *)(qword_100101CC0 + 2152)) != 0))
      }
      {
        if (sub_1000D9EC0(a1, v7)
          && (*(_DWORD *)(a1 + 372) = 0,
              *(_DWORD *)(a1 + 364) = 1,
              *(_DWORD *)(a1 + 792) = 0,
              uint64_t v8 = sub_1000C33A0(28),
              (*(void *)(a1 + 784) = v8) != 0))
        {
          *(_DWORD *)(a1 + 6472) = 1;
          int v6 = v14;
        }
        else
        {
          int v6 = 2;
        }
      }
      else
      {
        int v6 = 1;
      }
      unsigned int v14 = v6;
      sub_1000C0CD8();
      goto LABEL_9;
    }
    *(_DWORD *)(a1 + 8160) = 1;
  }
  else
  {
    uint64_t v13 = sub_1000C2EA8(0);
    uint64_t v12 = sub_1000CD350(0);
    int v9 = sub_1000C0D40();
    sub_1000040F8(0, 0);
    unsigned int v10 = sub_1000D2948(0, 0, &v11);
    nullsub_1(v10);
  }
  unsigned int v14 = 1;
LABEL_9:
  sub_100051144(v14);
  sub_1000D2948(v10, v11, 0);
  sub_1000C0D2C(v9);
  sub_1000CD350(v12);
  sub_1000C2EA8(v13);
  return v14;
}

uint64_t sub_1000D9EC0(uint64_t a1, int a2)
{
  int v3 = (int)sub_10005A738(*(void *)a1) / 1000 * a2;
  int v4 = v3 / *(_DWORD *)(a1 + 304);
  sub_10004084C(a1);
  *(_DWORD *)(a1 + 368) = v4;
  *(_DWORD *)(a1 + 372) = 0;
  if (!v3 || (uint64_t result = sub_1000C33A0(2 * v3), (*(void *)(a1 + 376) = result) != 0))
  {
    if (!*(void *)(a1 + 424) && (!qword_100101CC0 || !*(_DWORD *)(qword_100101CC0 + 2848)))
    {
      int v8 = sub_10005A798(*(void *)a1);
      uint64_t v9 = sub_1000C33A0(v8);
      *(void *)(a1 + 424) = v9;
      if (!v9) {
        goto LABEL_12;
      }
    }
    if (v4)
    {
      int v6 = 50 * v4 + 4;
      *(_DWORD *)(a1 + 400) = 0;
      uint64_t v7 = sub_1000C33A0(v6);
      *(void *)(a1 + 392) = v7;
      if (!v7)
      {
LABEL_12:
        sub_10004084C(a1);
        return 0;
      }
      *(_DWORD *)(a1 + 384) = v6;
    }
    return 1;
  }
  return result;
}

uint64_t sub_1000D9FBC(uint64_t a1, char *a2, int a3)
{
  unsigned int v75 = 0;
  int v74 = 0;
  uint64_t v73 = 0;
  uint64_t v72 = 0;
  long long v70 = 0;
  uint64_t v71 = 0;
  long long v69 = 0;
  if (a1)
  {
    uint64_t v73 = sub_1000C2EA8(*(void *)(a1 + 6480));
    uint64_t v72 = sub_1000CD350(*(void *)(a1 + 6488));
    long long v69 = sub_1000C0D40();
    sub_1000040F8(*(void *)(a1 + 6496), *(void *)(a1 + 6504));
    long long v70 = sub_1000D2948(*(void **)(a1 + 6520), *(void *)(a1 + 6528), &v71);
    nullsub_1(v70);
    if (*(_DWORD *)(a1 + 8160)) {
      return 1;
    }
    sub_1000C0D2C((void *)(a1 + 6648));
    uint64_t v7 = (int *)sub_1000C0C70();
    if (!setjmp(v7))
    {
      if (sub_1000CAED0(*(unsigned char **)(a1 + 8168), "Elvis Magic"))
      {
        int v8 = 4;
      }
      else if (*(_DWORD *)(a1 + 8160) || !*(void *)(a1 + 5512))
      {
        int v8 = 1;
      }
      else
      {
        unsigned int v75 = sub_100051D88(a1);
        uint64_t v68 = 0;
        int v67 = 0;
        if (*(_DWORD *)(a1 + 6472))
        {
          if (*(_DWORD *)(a1 + 752) == 7) {
            int v74 = 1;
          }
          if (!a3
            || (sub_1000CAD88(v76, a2, 256),
                sub_1000CAE14(v76, "elvisdump.psa", 256),
                (unsigned int v75 = sub_100049D38(a1, (const char *)v76)) == 0))
          {
            sub_1000CAD88(v76, a2, 256);
            sub_1000CAE14(v76, "elvisdump.rpr", 256);
            uint64_t v9 = j__fopen((const char *)v76, "wb");
            if (v9)
            {
              int v17 = v9;
              sub_1000C2F04(0x400uLL, v10, v11, v12, v13, v14, v15, v16);
              int v19 = (char *)v18;
              sub_1000DC124(v18, v20, v21, v22, v23, v24, v25, v26);
              int v28 = v27;
              int v29 = v27;
              sub_1000DC1C4(v27, "FileType", "ElvisDump");
              sub_1000DC308(v28, "FileVersion", 3);
              int v30 = (char *)sub_10009CAE0();
              sub_1000DC1C4(v28, "ElvisVersion", v30);
              int v31 = sub_10009CAD0();
              sub_1000DC308(v28, "ElvisMajorVersion", v31);
              int v32 = sub_10009CAD8();
              sub_1000DC308(v28, "ElvisMinorVersion", v32);
              long long v33 = (char *)sub_1000B5110(*(uint64_t **)(a1 + 8));
              sub_1000DC1C4(v28, "ElvisLanguage", v33);
              long long v34 = (char *)sub_1000DA890(*(_DWORD *)(a1 + 752));
              sub_1000DC1C4(v28, "RecogType", v34);
              unsigned int v75 = sub_100046B24(a1, (_DWORD *)&v68 + 1);
              unsigned int v75 = sub_100040C34(a1, &v68, &v67);
              sub_1000DC308(v28, "SampleRate", SHIDWORD(v68));
              sub_1000DC308(v28, "RecogModelProperties", v68);
              sub_1000DC308(v28, "TTSModelProperties", v67);
              uint64_t v35 = *(void *)(a1 + 48);
              if (v35)
              {
                unsigned int v36 = sub_1000B4400(v35);
                if (v36 > 4) {
                  long long v37 = "Unknown";
                }
                else {
                  long long v37 = off_1000FE428[v36];
                }
                sub_1000DC1C4(v29, "TTSEncoding", v37);
              }
              if (qword_100101CC0) {
                uint64_t v39 = *(void *)(qword_100101CC0 + 5464);
              }
              else {
                LODWORD(v39) = 0;
              }
              sub_1000DC308(v29, "VocMaxNumAddedWords", v39);
              sub_1000DA8B4(a1, v29);
              if (v74) {
                sub_1000DAB3C(a1, v29);
              }
              sub_1000DADC4((void *)a1, v29);
              if (v74) {
                sub_1000DB794(a1, v29);
              }
              if (qword_100101CC0 && *(_DWORD *)(qword_100101CC0 + 2848)) {
                int v40 = 0;
              }
              else {
                int v40 = sub_10005A798(*(void *)a1);
              }
              sub_1000DC308(v29, "FESnapshotSize", v40);
              if (sub_100011B24(*(void *)(a1 + 16)))
              {
                int v41 = sub_100011B24(*(void *)(a1 + 16));
                sub_1000DC308(v29, "DynSilSnapshotSize", v41);
              }
              int v42 = sub_1000BDE18(*(uint64_t **)(a1 + 8));
              sub_1000DC308(v29, "VocCRC", v42);
              sub_100005A6C(*(void *)(a1 + 16), v43, v44, v45, v46, v47, v48);
              int v49 = *(_DWORD *)(a1 + 5504);
              if (v49 == -1) {
                int v49 = sub_100006DB4(*(void *)(a1 + 16), 0);
              }
              sub_1000DC308(v29, "AMCRC", v49);
              sub_1000DC308(v29, "FeCRC", *(_DWORD *)(a1 + 416));
              if (v74) {
                sub_1000DC308(v29, "FeTalkAheadCRC", *(_DWORD *)(a1 + 432));
              }
              sub_1000DC308(v29, "NumConstraints", *(_DWORD *)(a1 + 1320));
              if (*(int *)(a1 + 1320) >= 1)
              {
                uint64_t v50 = 0;
                do
                {
                  unsigned int v51 = *(_DWORD *)(a1 + 1324 + 4 * v50);
                  sprintf(v19, "Constraint[%d]", v50);
                  sub_1000DC308(v29, (unsigned __int8 *)v19, v51);
                  uint64_t v52 = sub_10002FA40(*(void *)(a1 + 72), v51);
                  int v53 = (char *)sub_100025D58(v52);
                  sprintf(v19, "ConstraintName[%d]", v50);
                  sub_1000DC1C4(v29, (unsigned __int8 *)v19, v53);
                  ++v50;
                }
                while (v50 < *(int *)(a1 + 1320));
              }
              if (*(_DWORD *)(a1 + 752) == 8) {
                sub_1000DBA50(a1, v29);
              }
              uint64_t v54 = (char *)sub_1000C33A0(*(int *)(a1 + 400) + 1);
              if (v54)
              {
                uint64_t v55 = (uint64_t)v54;
                if (*(int *)(a1 + 400) >= 1)
                {
                  uint64_t v56 = 0;
                  do
                  {
                    v54[v56] = *(unsigned char *)(*(void *)(a1 + 392) + v56);
                    ++v56;
                  }
                  while (v56 < *(int *)(a1 + 400));
                }
                sub_1000DC1C4(v29, "OperationRecordArray", v54);
                sub_1000C321C(v55);
              }
              int v66 = 0;
              uint64_t v65 = 0;
              sub_1000497FC(a1, &v66, (_DWORD *)&v65 + 1, &v65);
              sub_1000DC308(v29, "FEFeatureQueueLength", v66);
              sub_1000DC308(v29, "FEFeatureQueueCurrent", SHIDWORD(v65));
              sub_1000DC308(v29, "FEFeatureQueueHigh", v65);
              uint64_t v57 = *(void *)(a1 + 440);
              if (v57)
              {
                uint64_t v58 = *(void *)(a1 + 440);
                int v66 = 0;
                sub_1000DC308(v29, "UttDetSpeechStartFrame", *(_DWORD *)(v57 + 28));
                sub_1000DC308(v29, "UttDetFinalSilenceStartFrame", *(_DWORD *)(v58 + 32));
                unsigned int v75 = sub_100048F1C(a1, -2, &v66);
                if (!v75) {
                  sub_1000DC308(v29, "UttNumFrames", v66);
                }
                unsigned int v75 = sub_100048FA4(a1, 0xFFFFFFFE, &v66);
                if (!v75) {
                  sub_1000DC308(v29, "UttNumFramesRecognized", v66);
                }
              }
              sub_1000DC38C(v29, v17);
              sub_1000DC14C((void **)v29);
              if (!qword_100101CC0 || !*(_DWORD *)(qword_100101CC0 + 2848))
              {
                int v59 = *(const void **)(a1 + 408);
                int v60 = sub_10005A798(*(void *)a1);
                j__fwrite(v59, v60, 1uLL, v17);
                if (v74)
                {
                  int v61 = *(const void **)(a1 + 424);
                  int v62 = sub_10005A798(*(void *)a1);
                  j__fwrite(v61, v62, 1uLL, v17);
                }
              }
              __int16 v63 = *(const void **)(a1 + 5480);
              if (v63)
              {
                int v64 = sub_100011B24(*(void *)(a1 + 16));
                j__fwrite(v63, v64, 1uLL, v17);
              }
              j__fclose(v17);
              uint64_t v38 = (uint64_t)v19;
            }
            else
            {
              uint64_t v38 = 0;
              unsigned int v75 = 9;
            }
            sub_1000CAD88(v76, a2, 256);
            sub_1000CAE14(v76, "elvisdump.utt", 256);
            unsigned int v75 = sub_1000DBCEC(a1);
            sub_1000CAD88(v76, a2, 256);
            sub_1000CAE14(v76, "elvisdump.wav", 256);
            unsigned int v75 = sub_1000DBE70(a1, (const char *)v76);
            sub_1000C321C(v38);
          }
        }
        else
        {
          unsigned int v75 = 7;
        }
        int v8 = v75;
      }
      unsigned int v75 = v8;
      sub_1000C0CD8();
      goto LABEL_9;
    }
    *(_DWORD *)(a1 + 8160) = 1;
  }
  else
  {
    uint64_t v73 = sub_1000C2EA8(0);
    uint64_t v72 = sub_1000CD350(0);
    long long v69 = sub_1000C0D40();
    sub_1000040F8(0, 0);
    long long v70 = sub_1000D2948(0, 0, &v71);
    nullsub_1(v70);
  }
  unsigned int v75 = 1;
LABEL_9:
  sub_100051144(v75);
  sub_1000D2948(v70, v71, 0);
  sub_1000C0D2C(v69);
  sub_1000CD350(v72);
  sub_1000C2EA8(v73);
  return v75;
}

const char *sub_1000DA890(unsigned int a1)
{
  if (a1 > 0xA) {
    return "UNKNOWN_RECOG_TYPE";
  }
  else {
    return off_1000FE450[a1];
  }
}

uint64_t sub_1000DA8B4(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t result = sub_1000DC308(a2, "LengthLMContext", *(_DWORD *)(a1 + 776));
  if (*(int *)(v3 + 776) >= 1)
  {
    long long v34 = a2;
    sub_1000C2F04(0x400uLL, v5, v6, v7, v8, v9, v10, v11);
    uint64_t v13 = v12;
    long long v33 = sub_1000CAF9C("LMContext[1000]");
    if (*(int *)(v3 + 776) >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        int v15 = *(_DWORD *)(*(void *)(v3 + 768) + 4 * v14);
        sprintf(v33, "LMContext[%d]", v14);
        sub_1000DC308(v34, (unsigned __int8 *)v33, v15);
        ++v14;
        uint64_t v16 = *(int *)(v3 + 776);
      }
      while (v14 < v16);
      if ((int)v16 >= 1)
      {
        uint64_t v17 = 0;
        uint64_t v35 = v13;
        uint64_t v36 = v3;
        do
        {
          unsigned int v18 = *(_DWORD *)(*(void *)(v3 + 768) + 4 * v17);
          int v19 = sub_1000CAD00((unint64_t)v13);
          uint64_t v20 = 1024 - v19;
          unint64_t v21 = (unint64_t)&v13[v19];
          if (v18 == -1)
          {
            sub_1000CAD88(&v13[v19], "UNKNOWN", v20);
            unint64_t v22 = sub_1000CAD00(v21);
            if ((int)v22 >= 1)
            {
LABEL_14:
              uint64_t v23 = v22;
              int v24 = 1;
              int v25 = 1 - v22;
              do
              {
                uint64_t v27 = v23 - 1;
                int v28 = (unsigned __int8 *)(v21 + (v23 - 1));
                int v29 = *v28;
                if (v29 == 13 || v29 == 10)
                {
                  unint64_t v26 = (v22 + 1);
                  if ((int)v26 >= (int)v20) {
                    int v24 = 0;
                  }
                  if ((int)v22 < (int)v20) {
                    int v31 = v22 + 1;
                  }
                  else {
                    int v31 = v20;
                  }
                  j__memmove(v28 + 2, v28 + 1, v31 + v25);
                  *int v28 = 92;
                  if (v23 <= v20)
                  {
                    if (v29 == 13) {
                      char v32 = 114;
                    }
                    else {
                      char v32 = 110;
                    }
                    *(unsigned char *)(v21 + v23) = v32;
                  }
                }
                else
                {
                  unint64_t v26 = v22;
                }
                ++v25;
                --v23;
                unint64_t v22 = v26;
              }
              while ((unint64_t)(v27 + 1) > 1);
              uint64_t v13 = v35;
              uint64_t v3 = v36;
              if (!v24) {
                *(unsigned char *)(v21 + v20) = 0;
              }
            }
          }
          else
          {
            sub_1000BE1E4(*(uint64_t **)(v3 + 8), v18, v20, v21, 0);
            unint64_t v22 = sub_1000CAD00(v21);
            if ((int)v22 >= 1) {
              goto LABEL_14;
            }
          }
          sub_1000CAE14(v13, " ", 1024);
          ++v17;
        }
        while (v17 < *(int *)(v3 + 776));
      }
    }
    sub_1000DC1C4(v34, "LMContext", (char *)v13);
    sub_1000C321C((uint64_t)v33);
    return sub_1000C321C((uint64_t)v13);
  }
  return result;
}

uint64_t sub_1000DAB3C(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t result = sub_1000DC308(a2, "LengthTalkAheadLMContext", *(_DWORD *)(a1 + 792));
  if (*(int *)(v3 + 792) >= 1)
  {
    long long v34 = a2;
    sub_1000C2F04(0x400uLL, v5, v6, v7, v8, v9, v10, v11);
    uint64_t v13 = v12;
    long long v33 = sub_1000CAF9C("TalkAheadLMContext[1000]");
    if (*(int *)(v3 + 792) >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        int v15 = *(_DWORD *)(*(void *)(v3 + 784) + 4 * v14);
        sprintf(v33, "TalkAheadLMContext[%d]", v14);
        sub_1000DC308(v34, (unsigned __int8 *)v33, v15);
        ++v14;
        uint64_t v16 = *(int *)(v3 + 792);
      }
      while (v14 < v16);
      if ((int)v16 >= 1)
      {
        uint64_t v17 = 0;
        uint64_t v35 = v13;
        uint64_t v36 = v3;
        do
        {
          unsigned int v18 = *(_DWORD *)(*(void *)(v3 + 784) + 4 * v17);
          int v19 = sub_1000CAD00((unint64_t)v13);
          uint64_t v20 = 1024 - v19;
          unint64_t v21 = (unint64_t)&v13[v19];
          if (v18 == -1)
          {
            sub_1000CAD88(&v13[v19], "UNKNOWN", v20);
            unint64_t v22 = sub_1000CAD00(v21);
            if ((int)v22 >= 1)
            {
LABEL_14:
              uint64_t v23 = v22;
              int v24 = 1;
              int v25 = 1 - v22;
              do
              {
                uint64_t v27 = v23 - 1;
                int v28 = (unsigned __int8 *)(v21 + (v23 - 1));
                int v29 = *v28;
                if (v29 == 13 || v29 == 10)
                {
                  unint64_t v26 = (v22 + 1);
                  if ((int)v26 >= (int)v20) {
                    int v24 = 0;
                  }
                  if ((int)v22 < (int)v20) {
                    int v31 = v22 + 1;
                  }
                  else {
                    int v31 = v20;
                  }
                  j__memmove(v28 + 2, v28 + 1, v31 + v25);
                  *int v28 = 92;
                  if (v23 <= v20)
                  {
                    if (v29 == 13) {
                      char v32 = 114;
                    }
                    else {
                      char v32 = 110;
                    }
                    *(unsigned char *)(v21 + v23) = v32;
                  }
                }
                else
                {
                  unint64_t v26 = v22;
                }
                ++v25;
                --v23;
                unint64_t v22 = v26;
              }
              while ((unint64_t)(v27 + 1) > 1);
              uint64_t v13 = v35;
              uint64_t v3 = v36;
              if (!v24) {
                *(unsigned char *)(v21 + v20) = 0;
              }
            }
          }
          else
          {
            sub_1000BE1E4(*(uint64_t **)(v3 + 8), v18, v20, v21, 0);
            unint64_t v22 = sub_1000CAD00(v21);
            if ((int)v22 >= 1) {
              goto LABEL_14;
            }
          }
          sub_1000CAE14(v13, " ", 1024);
          ++v17;
        }
        while (v17 < *(int *)(v3 + 792));
      }
    }
    sub_1000DC1C4(v34, "TalkAheadLMContext", (char *)v13);
    sub_1000C321C((uint64_t)v33);
    return sub_1000C321C((uint64_t)v13);
  }
  return result;
}

uint64_t sub_1000DADC4(void *a1, void *a2)
{
  uint64_t v2 = (uint64_t)a1;
  int v167 = 0;
  if (!a1[13] || a1[689] == a1[14]) {
    uint64_t v3 = (int **)(a1 + 101);
  }
  else {
    uint64_t v3 = (int **)(a1 + 100);
  }
  int v4 = *v3;
  uint64_t v5 = sub_1000CAF9C("ChoiceConstraintScore[1000]");
  uint64_t v6 = v5;
  if (v4[1] >= 1)
  {
    uint64_t v7 = 0;
    v155 = (unsigned int *)(v2 + 1324);
    int v156 = v4;
    int v157 = v5;
    uint64_t v162 = v2;
    do
    {
      int v166 = 0;
      uint64_t v8 = sub_100042440((void *)v2, v7, &v166, 0);
      if (!v8 || v166 < 1) {
        goto LABEL_7;
      }
      uint64_t v16 = v8;
      sub_1000C2F04(20 * v166, v9, v10, v11, v12, v13, v14, v15);
      unsigned int v18 = v17;
      if (v166 >= 1)
      {
        uint64_t v19 = 0;
        uint64_t v20 = v17;
        do
        {
          sprintf(v20, "0x%08x ", v16[v19]);
          v20 += (int)sub_1000CAD00((unint64_t)v20);
          ++v19;
        }
        while (v19 < v166);
      }
      sprintf(v6, "Choice[%d]", v7);
      sub_1000DC1C4(a2, (unsigned __int8 *)v6, v18);
      sub_1000C321C((uint64_t)v18);
      sub_1000C2F04(0x200uLL, v21, v22, v23, v24, v25, v26, v27);
      int v29 = v28;
      if (sub_10004DE64(v2, v7, 128, v28, &v167))
      {
        if (v7 < *v4) {
          goto LABEL_101;
        }
        goto LABEL_7;
      }
      uint64_t v163 = (uint64_t)v29;
      uint64_t v159 = v7;
      int v30 = sub_1000B51A0(*(uint64_t **)(v2 + 8));
      int v31 = sub_1000B51E0(*(uint64_t **)(v2 + 8));
      uint64_t v32 = v167 * (uint64_t)(2 * (v31 + v30) + 7);
      uint64_t v33 = v32 + 1;
      sub_1000C2F04(v32 + 1, v34, v35, v36, v37, v38, v39, v40);
      int v42 = v41;
      *int v41 = 34;
      if (v167 >= 1)
      {
        int v43 = 0;
        do
        {
          int v44 = sub_1000CAD00((unint64_t)v42);
          int v45 = sub_1000BD9AC(*(void *)(v2 + 8), *(_DWORD *)(v163 + 4 * v43));
          sub_1000BE0F8(*(uint64_t **)(v2 + 8), v45, v33 - v44, (uint64_t)&v42[v44], 1);
          uint64_t v46 = v43 + 1;
          int v47 = v167;
          if (v43 + 1 >= v167) {
            goto LABEL_18;
          }
          if (*(_DWORD *)(v163 + 4 * v46) == -2)
          {
            sub_1000CAE14(v42, "(S)", v32 + 1);
            int v47 = v167;
            LODWORD(v46) = v43 + 2;
            if (v43 + 2 < v167)
            {
LABEL_25:
              sub_1000CAE14(v42, " ", v32 + 1);
              int v47 = v167;
            }
          }
          else if ((int)v46 < v167)
          {
            goto LABEL_25;
          }
LABEL_18:
          int v43 = v46;
        }
        while ((int)v46 < v47);
      }
      sub_1000CAE14(v42, "\"", v32 + 1);
      unint64_t v48 = sub_1000CAD00((unint64_t)v42);
      if ((int)v48 >= 1)
      {
        uint64_t v49 = v48;
        int v50 = 2 - v48;
        int v51 = 1;
        do
        {
          uint64_t v53 = v49 - 1;
          uint64_t v54 = &v42[(v49 - 1)];
          int v55 = *v54;
          if (v55 == 13 || v55 == 10)
          {
            unint64_t v52 = (v48 + 1);
            if ((int)v48 < (int)v32)
            {
              int v57 = v48;
            }
            else
            {
              int v51 = 0;
              int v57 = v32;
            }
            j__memmove(v54 + 2, v54 + 1, v57 + v50);
            *uint64_t v54 = 92;
            if (v49 <= v33)
            {
              if (v55 == 13) {
                char v58 = 114;
              }
              else {
                char v58 = 110;
              }
              v42[v49] = v58;
            }
          }
          else
          {
            unint64_t v52 = v48;
          }
          uint64_t v2 = v162;
          ++v50;
          --v49;
          unint64_t v48 = v52;
        }
        while ((unint64_t)(v53 + 1) > 1);
        uint64_t v6 = v157;
        if (!v51) {
          v42[v33] = 0;
        }
      }
      sprintf(v6, "ChoiceText[%d]", v159);
      sub_1000DC1C4(a2, (unsigned __int8 *)v6, (char *)v42);
      uint64_t v59 = *(void *)(v2 + 5512);
      sub_1000C2F04(4 * v167, v60, v61, v62, v63, v64, v65, v66);
      uint64_t v68 = v67;
      sub_1000C2F04(v167, v69, v70, v71, v72, v73, v74, v75);
      uint64_t v77 = v76;
      if (v167 < 1)
      {
        uint64_t v80 = v163;
      }
      else
      {
        uint64_t v78 = 0;
        int v79 = 0;
        uint64_t v80 = v163;
        do
        {
          while (1)
          {
            int v81 = *(_DWORD *)(v163 + 4 * v78);
            if (v81 == -2) {
              break;
            }
            *(_DWORD *)(v68 + 4 * v79++) = v81;
            if (++v78 >= v167) {
              goto LABEL_51;
            }
          }
          *(unsigned char *)(v76 + v79) = 1;
          ++v78;
        }
        while (v78 < v167);
      }
LABEL_51:
      int v82 = sub_100039EA0(v59);
      sub_1000C321C(v77);
      sub_1000C321C(v68);
      uint64_t v7 = v159;
      sprintf(v6, "ChoiceNAScore[%d]", v159);
      sprintf((char *)v42, "%d", v82);
      sub_1000DC1C4(a2, (unsigned __int8 *)v6, (char *)v42);
      if (*(_DWORD *)(v2 + 1320))
      {
        uint64_t v165 = 0;
        int v164 = 0;
        int v90 = (void *)sub_1000CD3E8(4 * v167 + 4, v83, v84, v85, v86, v87, v88, v89);
        uint64_t v161 = (void *)sub_1000CD3E8(8 * v167, v91, v92, v93, v94, v95, v96, v97);
        uint64_t v158 = (void *)sub_1000CD3E8(4 * v167, v98, v99, v100, v101, v102, v103, v104);
        int v119 = (void *)sub_1000CD3E8(4 * v167, v105, v106, v107, v108, v109, v110, v111);
        int v120 = v167;
        if (v167 < 1)
        {
          int v122 = 0;
        }
        else
        {
          uint64_t v121 = 0;
          int v122 = 0;
          do
          {
            while (1)
            {
              int v123 = *(_DWORD *)(v80 + 4 * v121);
              if (v123 == -2) {
                break;
              }
              *((_DWORD *)v90 + v121 - v122) = v123;
              int v120 = v167;
              if (++v121 >= v167) {
                goto LABEL_59;
              }
            }
            ++v122;
            ++v121;
          }
          while (v121 < v120);
        }
LABEL_59:
        uint64_t v124 = (v120 - v122);
        *((_DWORD *)v90 + (int)v124) = -1;
        int v125 = (char *)sub_1000CD3E8(20, v112, v113, v114, v115, v116, v117, v118);
        if (sub_100046618(v2, *(unsigned int *)(v2 + 1320), v155, v124, (uint64_t)v90, (int *)&v165 + 1, v161, (uint64_t)v158, (uint64_t)v119, &v164, &v165))
        {
          sub_1000CD4D0(v125, 20);
          sub_1000CD4D0(v119, 4 * v167);
          sub_1000CD4D0(v158, 4 * v167);
          sub_1000CD4D0(v161, 8 * v167);
          sub_1000CD4D0(v90, 4 * v167 + 4);
          sub_1000C321C(v80);
          int v4 = v156;
          break;
        }
        sprintf(v6, "ChoiceConstraint[%d]", v159);
        sprintf(v125, "%ld", HIDWORD(v165));
        sub_1000DC1C4(a2, (unsigned __int8 *)v6, v125);
        sprintf(v6, "ChoiceConstraintScore[%d]", v159);
        sprintf(v125, "%d", v165);
        sub_1000DC1C4(a2, (unsigned __int8 *)v6, v125);
        sub_1000CD4D0(v125, 20);
        if (v164 < 1)
        {
          int v134 = 0;
        }
        else
        {
          uint64_t v133 = 0;
          int v134 = 0;
          do
          {
            if (v161[v133]) {
              __int16 v135 = (const char *)v161[v133];
            }
            else {
              __int16 v135 = "[NULL]";
            }
            v134 += 2 * sub_1000CAD00((unint64_t)v135) * *((_DWORD *)v119 + v133++) + 1;
          }
          while (v133 < v164);
        }
        uint64_t v136 = v134 + 3;
        int v137 = (unsigned __int8 *)sub_1000CD3E8(v136, v126, v127, v128, v129, v130, v131, v132);
        sub_1000CAD88(v137, "\"", v136);
        if (v164 >= 1)
        {
          for (uint64_t i = 0; i < v164; ++i)
          {
            uint64_t v139 = (char *)v161[i];
            if (v139)
            {
              sub_1000D95D8(v161[i], 0, v168, 256);
              if (*((int *)v119 + i) >= 1) {
                goto LABEL_75;
              }
            }
            else
            {
              uint64_t v139 = "[NULL]";
              if (*((int *)v119 + i) >= 1)
              {
LABEL_75:
                int v140 = 0;
                do
                {
                  if (v140 | i) {
                    sub_1000CAE14(v137, " ", v136);
                  }
                  sub_1000CAE14(v137, v139, v136);
                  ++v140;
                }
                while (v140 < *((_DWORD *)v119 + i));
              }
            }
          }
        }
        sub_1000CAE14(v137, "\"", v136);
        unint64_t v141 = sub_1000CAD00((unint64_t)v137);
        if ((int)v141 >= 1)
        {
          int v153 = v90;
          unsigned int v154 = v42;
          uint64_t v142 = v141;
          int v143 = 1;
          int v144 = 1 - v141;
          do
          {
            uint64_t v146 = v142 - 1;
            unsigned int v147 = &v137[(v142 - 1)];
            int v148 = *v147;
            if (v148 == 13 || v148 == 10)
            {
              unint64_t v145 = (v141 + 1);
              if ((int)v145 >= (int)v136) {
                int v143 = 0;
              }
              if ((int)v141 < (int)v136) {
                int v150 = v141 + 1;
              }
              else {
                int v150 = v136;
              }
              j__memmove(v147 + 2, v147 + 1, v150 + v144);
              *unsigned int v147 = 92;
              if (v142 <= v136)
              {
                if (v148 == 13) {
                  char v151 = 114;
                }
                else {
                  char v151 = 110;
                }
                v137[v142] = v151;
              }
            }
            else
            {
              unint64_t v145 = v141;
            }
            ++v144;
            --v142;
            unint64_t v141 = v145;
          }
          while ((unint64_t)(v146 + 1) > 1);
          uint64_t v6 = v157;
          uint64_t v2 = v162;
          int v90 = v153;
          int v42 = v154;
          if (!v143) {
            v137[v136] = 0;
          }
        }
        uint64_t v7 = v159;
        sprintf(v6, "ChoiceConstraintParse[%d]", v159);
        sub_1000DC1C4(a2, (unsigned __int8 *)v6, (char *)v137);
        sub_1000CD4D0(v137, v136);
        sub_1000CD4D0(v119, 4 * v167);
        sub_1000CD4D0(v158, 4 * v167);
        sub_1000CD4D0(v161, 8 * v167);
        sub_1000CD4D0(v90, 4 * v167 + 4);
        uint64_t v80 = v163;
      }
      sub_1000C321C((uint64_t)v42);
      sub_1000C321C(v80);
      int v4 = v156;
      if (v7 < *v156)
      {
LABEL_101:
        sprintf(v6, "Score[%d]", v7);
        sub_1000DC308(a2, (unsigned __int8 *)v6, *(_DWORD *)(*((void *)v4 + 1) + 4 * v7));
      }
LABEL_7:
      ++v7;
    }
    while (v7 < v4[1]);
  }
  sub_100006A98((uint64_t)v6);
  sub_1000DC308(a2, "RejectionScore", v4[34]);
  return sub_1000DC308(a2, "Confidence", v4[35]);
}

uint64_t sub_1000DB794(uint64_t result, void *a2)
{
  if (*(int *)(result + 1296) >= 1)
  {
    uint64_t v3 = result;
    int v4 = sub_1000CAF9C("IsoChoiceFullScores[1000]");
    int v5 = *(_DWORD *)(v3 + 436);
    sub_1000DC308(a2, "TalkAheadFirstUtteranceId", v5);
    int v6 = 0;
    int v28 = a2;
    uint64_t v25 = v3;
    int v24 = v5;
    do
    {
      int v29 = 0;
      int v7 = v6 + v5;
      if ((v6 + v5) > *(_DWORD *)(v3 + 1300)) {
        break;
      }
      if (sub_1000500E0(v3, v6 + v5, &v29))
      {
        uint64_t v26 = v29;
        uint64_t v27 = *(void *)(v3 + 1312);
        uint64_t v15 = (int *)(v27 + ((uint64_t)v29 << 7));
        sub_1000C2F04(20 * *v15 + 20, v8, v9, v10, v11, v12, v13, v14);
        uint64_t v17 = v16;
        sprintf(v4, "IsoChoiceContext[%u]", v6 + v5);
        sprintf(v17, "0x%08x ", v15[1]);
        sub_1000DC1C4(a2, (unsigned __int8 *)v4, v17);
        if (*v15 >= 1)
        {
          uint64_t v18 = 0;
          uint64_t v19 = v17;
          do
          {
            sprintf(v19, "0x%08x ", v15[v18 + 22]);
            v19 += (int)sub_1000CAD00((unint64_t)v19);
            ++v18;
          }
          while (v18 < *v15);
          sprintf(v4, "IsoChoice[%u]", v7);
          sub_1000DC1C4(v28, (unsigned __int8 *)v4, v17);
          if (*v15 >= 1)
          {
            uint64_t v20 = 0;
            uint64_t v21 = v17;
            do
            {
              sprintf(v21, "%ld ", *(int *)(v27 + (v26 << 7) + 8 + 4 * v20));
              v21 += (int)sub_1000CAD00((unint64_t)v21);
              ++v20;
            }
            while (v20 < *v15);
          }
          sprintf(v4, "IsoChoiceFullScores[%u]", v7);
          sub_1000DC1C4(v28, (unsigned __int8 *)v4, v17);
          if (*v15 >= 1)
          {
            uint64_t v22 = 0;
            uint64_t v23 = v17;
            do
            {
              sprintf(v23, "%ld ", *(int *)(v27 + (v26 << 7) + 48 + 4 * v22));
              v23 += (int)sub_1000CAD00((unint64_t)v23);
              ++v22;
            }
            while (v22 < *v15);
          }
          sprintf(v4, "IsoChoiceScores[%u]", v7);
          a2 = v28;
          sub_1000DC1C4(v28, (unsigned __int8 *)v4, v17);
          uint64_t v3 = v25;
          int v5 = v24;
        }
        sub_1000C321C((uint64_t)v17);
      }
      ++v6;
    }
    while (v6 != 0x7FFFFFFF);
    return sub_1000C321C((uint64_t)v4);
  }
  return result;
}

uint64_t sub_1000DBA50(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  unint64_t v4 = *(unsigned int *)(a1 + 6232);
  uint64_t result = sub_1000DC308(a2, "EnrollmentLength", v4);
  if (*(int *)(a1 + 6232) >= 1)
  {
    int v6 = (int *)(a1 + 5720);
    int v7 = sub_1000B51A0(*(uint64_t **)(a1 + 8));
    int v15 = 2 * (sub_1000B51E0(*(uint64_t **)(a1 + 8)) + v7) + 7;
    if (v15 <= 11) {
      int v15 = 11;
    }
    int v35 = v15 * v4;
    int v16 = v15 * v4 + 1;
    sub_1000C2F04(v15 * (int)v4 + 1, v8, v9, v10, v11, v12, v13, v14);
    uint64_t v18 = v17;
    *uint64_t v17 = 34;
    if ((int)v4 >= 1)
    {
      unint64_t v19 = 0;
      do
      {
        int v20 = sub_1000CAD00((unint64_t)v18);
        sub_1000BE1E4(*(uint64_t **)(a1 + 8), v6[v19++], v16 - v20, (uint64_t)&v18[v20], 0);
        if (v19 < v4) {
          sub_1000CAE14(v18, " ", v16);
        }
      }
      while (v4 != v19);
    }
    unint64_t v21 = sub_1000CAD00((unint64_t)v18);
    if ((int)v21 >= 1)
    {
      uint64_t v36 = v35 + 1;
      uint64_t v34 = v2;
      uint64_t v22 = v21;
      int v23 = 2 - v21;
      int v24 = 1;
      do
      {
        uint64_t v26 = v22 - 1;
        uint64_t v27 = &v18[(v22 - 1)];
        int v28 = *v27;
        if (v28 == 13 || v28 == 10)
        {
          unint64_t v25 = (v21 + 1);
          if ((int)v21 < v35)
          {
            int v30 = v21;
          }
          else
          {
            int v24 = 0;
            int v30 = v35;
          }
          j__memmove(v27 + 2, v27 + 1, v30 + v23);
          *uint64_t v27 = 92;
          if (v22 <= v36)
          {
            if (v28 == 13) {
              char v31 = 114;
            }
            else {
              char v31 = 110;
            }
            v18[v22] = v31;
          }
        }
        else
        {
          unint64_t v25 = v21;
        }
        ++v23;
        --v22;
        unint64_t v21 = v25;
      }
      while ((unint64_t)(v26 + 1) > 1);
      uint64_t v2 = v34;
      int v16 = v35 + 1;
      if (!v24) {
        v18[v36] = 0;
      }
    }
    sub_1000CAE14(v18, "\"", v16);
    sub_1000DC1C4(v2, "EnrollmentText", (char *)v18);
    *uint64_t v18 = 0;
    if ((int)v4 >= 1)
    {
      do
      {
        int v32 = sub_1000CAD00((unint64_t)v18);
        int v33 = *v6++;
        sprintf((char *)&v18[v32], "0x%08x ", v33);
        --v4;
      }
      while (v4);
    }
    sub_1000DC1C4(v2, "EnrollmentIds", (char *)v18);
    return sub_1000C321C((uint64_t)v18);
  }
  return result;
}

uint64_t sub_1000DBCEC(uint64_t a1)
{
  unsigned int v9 = 0;
  uint64_t v8 = 0;
  uint64_t v7 = 0;
  uint64_t v6 = 0;
  if (a1)
  {
    uint64_t v8 = sub_1000C2EA8(*(void *)(a1 + 6480));
    uint64_t v7 = sub_1000CD350(*(void *)(a1 + 6488));
    unint64_t v4 = sub_1000C0D40();
    sub_1000040F8(*(void *)(a1 + 6496), *(void *)(a1 + 6504));
    int v5 = sub_1000D2948(*(void **)(a1 + 6520), *(void *)(a1 + 6528), &v6);
    nullsub_1(v5);
    if (*(_DWORD *)(a1 + 8160)) {
      return 1;
    }
    sub_1000C0D2C((void *)(a1 + 6648));
    uint64_t v3 = (int *)sub_1000C0C70();
    if (!setjmp(v3))
    {
      sub_1000C0CD8();
      goto LABEL_9;
    }
    *(_DWORD *)(a1 + 8160) = 1;
  }
  else
  {
    uint64_t v8 = sub_1000C2EA8(0);
    uint64_t v7 = sub_1000CD350(0);
    unint64_t v4 = sub_1000C0D40();
    sub_1000040F8(0, 0);
    int v5 = sub_1000D2948(0, 0, &v6);
    nullsub_1(v5);
  }
  unsigned int v9 = 1;
LABEL_9:
  sub_100051144(v9);
  sub_1000D2948(v5, v6, 0);
  sub_1000C0D2C(v4);
  sub_1000CD350(v7);
  sub_1000C2EA8(v8);
  return v9;
}

uint64_t sub_1000DBE70(uint64_t a1, const char *a2)
{
  unsigned int v17 = 0;
  uint64_t v16 = 0;
  uint64_t v15 = 0;
  uint64_t v14 = 0;
  if (a1)
  {
    uint64_t v16 = sub_1000C2EA8(*(void *)(a1 + 6480));
    uint64_t v15 = sub_1000CD350(*(void *)(a1 + 6488));
    uint64_t v12 = sub_1000C0D40();
    sub_1000040F8(*(void *)(a1 + 6496), *(void *)(a1 + 6504));
    uint64_t v13 = sub_1000D2948(*(void **)(a1 + 6520), *(void *)(a1 + 6528), &v14);
    nullsub_1(v13);
    if (*(_DWORD *)(a1 + 8160)) {
      return 1;
    }
    sub_1000C0D2C((void *)(a1 + 6648));
    int v5 = (int *)sub_1000C0C70();
    if (!setjmp(v5))
    {
      if (*(void *)(a1 + 376))
      {
        int v6 = sub_10005A738(*(void *)a1);
        size_t v7 = (*(_DWORD *)(a1 + 304) * *(_DWORD *)(a1 + 372));
        __sprintf_chk(__ptr, 0, 0x400uLL, "NIST_1A\n   1024\nsample_count -i %d\nsample_rate -i %d\nsample_n_bytes -i %d\nsample_byte_format -s2 %s\nchannel_count -i %d\nsample_coding -s3 %s\nend_head\n", *(_DWORD *)(a1 + 304) * *(_DWORD *)(a1 + 372), v6, 2, "01", 1, "pcm");
        int v8 = sub_1000CAD00((unint64_t)__ptr);
        if (v8 <= 1023) {
          memset(&__ptr[v8], 32, (1023 - v8) + 1);
        }
        unsigned int v9 = j__fopen(a2, "wb");
        if (v9)
        {
          uint64_t v10 = v9;
          j__fwrite(__ptr, 1uLL, 0x400uLL, v9);
          if ((int)v7 >= 1)
          {
            uint64_t v11 = *(const void **)(a1 + 376);
            if (v11) {
              j__fwrite(v11, 2uLL, v7, v10);
            }
          }
          j__fclose(v10);
        }
        else
        {
          unsigned int v17 = 9;
        }
      }
      sub_1000C0CD8();
      goto LABEL_9;
    }
    *(_DWORD *)(a1 + 8160) = 1;
  }
  else
  {
    uint64_t v16 = sub_1000C2EA8(0);
    uint64_t v15 = sub_1000CD350(0);
    uint64_t v12 = sub_1000C0D40();
    sub_1000040F8(0, 0);
    uint64_t v13 = sub_1000D2948(0, 0, &v14);
    nullsub_1(v13);
  }
  unsigned int v17 = 1;
LABEL_9:
  sub_100051144(v17);
  sub_1000D2948(v13, v14, 0);
  sub_1000C0D2C(v12);
  sub_1000CD350(v15);
  sub_1000C2EA8(v16);
  return v17;
}

void sub_1000DC124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000C2F04(0x20uLL, a2, a3, a4, a5, a6, a7, a8);
  *(void *)(v8 + 24) = "VstTextFile";
}

void **sub_1000DC14C(void **result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *result;
    if (*result)
    {
      do
      {
        uint64_t v3 = (void *)*v2;
        sub_1000C321C(v2[2]);
        sub_1000C321C(v2[3]);
        sub_1000C321C((uint64_t)v2);
        *uint64_t v1 = v3;
        uint64_t v2 = v3;
      }
      while (v3);
    }
    v1[3] = 0;
    return (void **)sub_1000C321C((uint64_t)v1);
  }
  return result;
}

uint64_t sub_1000DC1C4(void *a1, unsigned __int8 *a2, char *a3)
{
  if (!a2) {
    return 0;
  }
  int v4 = *a2;
  if (*a2)
  {
    uint64_t v7 = 1;
    int v8 = *a2;
    while ((v8 & 0x80) == 0 && (byte_1000F6054[v8] & 0x20) != 0)
    {
      int v8 = a2[v7++];
      if (!v8)
      {
        uint64_t v9 = 1;
        while ((v4 & 0x80) != 0 || (byte_1000F6054[v4] & 0x10) == 0)
        {
          int v4 = a2[v9++];
          if (!v4)
          {
            uint64_t v11 = a1;
            while (1)
            {
              uint64_t v11 = (void *)*v11;
              if (!v11) {
                break;
              }
              if (!sub_1000CAED0((unsigned char *)v11[2], a2))
              {
                sub_100006A98(v11[3]);
                v11[3] = sub_1000CAF9C(a3);
                return 1;
              }
            }
            uint64_t v12 = sub_1000CAF9C((char *)a2);
            uint64_t v13 = sub_1000CAF9C(a3);
            sub_1000C2F04(0x20uLL, v14, v15, v16, v17, v18, v19, v20);
            v21[2] = v12;
            v21[3] = v13;
            uint64_t v22 = (void *)a1[1];
            int v23 = a1;
            if (v22)
            {
              *unint64_t v21 = *v22;
              v21[1] = v22;
              if (*v22) {
                *(void *)(*v22 + 8) = v21;
              }
              int v23 = v22;
            }
            void *v23 = v21;
            a1[1] = v21;
            return 1;
          }
        }
        return 0;
      }
    }
  }
  return 0;
}

uint64_t sub_1000DC308(void *a1, unsigned __int8 *a2, int a3)
{
  __sprintf_chk(v6, 0, 0x14uLL, "%d", a3);
  return sub_1000DC1C4(a1, a2, v6);
}

uint64_t sub_1000DC38C(void *a1, FILE *a2)
{
  uint64_t v3 = (void *)*a1;
  j__fseek(a2, 0, 0);
  int v4 = sub_1000CAD00((unint64_t)"VstTextFile");
  j__fwrite("VstTextFile", v4, 1uLL, a2);
  int v5 = sub_1000CAD00((unint64_t)" ");
  j__fwrite(" ", v5, 1uLL, a2);
  int v6 = sub_1000CAD00((unint64_t)"1");
  j__fwrite("1", v6, 1uLL, a2);
  int v7 = sub_1000CAD00((unint64_t)"\n");
  j__fwrite("\n", v7, 1uLL, a2);
  for (; v3; uint64_t v3 = (void *)*v3)
  {
    int v8 = (const void *)v3[2];
    int v9 = sub_1000CAD00((unint64_t)v8);
    j__fwrite(v8, v9, 1uLL, a2);
    int v10 = sub_1000CAD00((unint64_t)" ");
    j__fwrite(" ", v10, 1uLL, a2);
    uint64_t v11 = (const void *)v3[3];
    int v12 = sub_1000CAD00((unint64_t)v11);
    j__fwrite(v11, v12, 1uLL, a2);
    int v13 = sub_1000CAD00((unint64_t)"\n");
    j__fwrite("\n", v13, 1uLL, a2);
  }
  int v14 = sub_1000CAD00((unint64_t)"VstEndHeader");
  j__fwrite("VstEndHeader", v14, 1uLL, a2);
  int v15 = sub_1000CAD00((unint64_t)"\n");
  j__fwrite("\n", v15, 1uLL, a2);
  return j__fflush(a2);
}

void sub_1000DC550(const char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_1000DC568(const char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5)
{
  printf("Warning in %s on line %d: ", a1, a2);
  printf(a3, a4, a5);
  return putchar(10);
}

uint64_t sub_1000DC5EC(uint64_t a1)
{
  qword_100106A18 = mach_absolute_time();
  *(void *)a1 = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(a1 + 8) = _Q0;
  *(void *)(a1 + 24) = @"Express";
  *(void *)(a1 + 40) = 31;
  *(void *)(a1 + 48) = sub_1000E2470;
  *(void *)(a1 + 56) = sub_1000E2410;
  *(void *)(a1 + 64) = sub_1000E0670;
  *(void *)(a1 + 72) = sub_1000E05DC;
  *(void *)(a1 + 80) = sub_1000E0344;
  *(void *)(a1 + 88) = sub_1000DF8E0;
  *(void *)(a1 + 96) = sub_1000DF718;
  *(void *)(a1 + 104) = sub_1000DF560;
  *(void *)(a1 + 112) = sub_1000DF500;
  *(void *)(a1 + 120) = sub_1000DEEB0;
  *(void *)(a1 + 128) = sub_1000DEBDC;
  *(void *)(a1 + 136) = sub_1000DE84C;
  *(void *)(a1 + 144) = sub_1000DE69C;
  *(void *)(a1 + 152) = sub_1000DC75C;
  *(void *)(a1 + 160) = sub_1000DC728;
  return 0;
}

void sub_1000DC728(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v2 = *(const void **)(v1 + 96);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(v1 + 96) = 0;
    }
  }
}

__CFArray *sub_1000DC75C(unint64_t **a1, const __CFSet *a2)
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  CFTypeRef cf = 0;
  int v12 = 0;
  sub_1000DC95C(a1, a2, v23, &v12, &v14, (CFMutableDictionaryRef *)&cf);
  NSPushAutoreleasePool();
  uint64_t v3 = sub_1000DCB94();
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v13 < 1;
  }
  if (!v4)
  {
    int v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "beginning re-recognition\n", buf, 2u);
    }
    if (*a1) {
      unint64_t v6 = **a1;
    }
    else {
      unint64_t v6 = 0;
    }
    int v7 = sub_10004E598(v6, v13);
    if (v7)
    {
      int v8 = v7;
      int v9 = VSGetLogDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        int v16 = v8;
        __int16 v17 = 2080;
        uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
        __int16 v19 = 1024;
        int v20 = 2528;
        __int16 v21 = 2080;
        uint64_t v22 = "re-recognizing";
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", buf, 0x22u);
      }
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = sub_1000DCB94();
    }
  }
  NSPopAutoreleasePool();
  if (v12 && v12 != v23) {
    free(v12);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v3;
}

uint64_t sub_1000DC95C(void **a1, CFSetRef theSet, void *a3, void *a4, void *a5, CFMutableDictionaryRef *a6)
{
  CFIndex Count = CFSetGetCount(theSet);
  CFIndex v13 = Count;
  uint64_t v14 = a3;
  if (Count >= 17) {
    uint64_t v14 = malloc_type_malloc(4 * Count, 0x100004052888210uLL);
  }
  if (a6) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
  }
  else {
    CFMutableDictionaryRef Mutable = 0;
  }
  v21[0] = 0;
  v21[1] = v14;
  int v16 = *a1;
  if (*a1) {
    int v16 = (void *)*v16;
  }
  v21[2] = Mutable;
  v21[3] = v16;
  CFSetApplyFunction(theSet, (CFSetApplierFunction)sub_1000DE534, v21);
  uint64_t v17 = v21[0];
  if (v21[0] == v13) {
    goto LABEL_11;
  }
  uint64_t v18 = VSGetLogDefault();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
  if (v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 136315394;
      int v23 = "_VSElvisGetConstraintsFromModels";
      __int16 v24 = 2048;
      CFIndex v25 = v13 - v21[0];
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: couldn't convert %ld models to constraints\n", buf, 0x16u);
      if (a4) {
        goto LABEL_12;
      }
      goto LABEL_23;
    }
LABEL_11:
    if (a4)
    {
LABEL_12:
      *a4 = v14;
LABEL_25:
      if (a5) {
        *a5 = v21[0];
      }
      uint64_t result = 0;
      if (a6) {
        *a6 = Mutable;
      }
      return result;
    }
LABEL_23:
    if (v14 != a3) {
      free(v14);
    }
    goto LABEL_25;
  }
  if (v19)
  {
    *(_DWORD *)buf = 136315138;
    int v23 = "_VSElvisGetConstraintsFromModels";
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: couldn't convert any models to constraints\n", buf, 0xCu);
  }
  if (v14 != a3) {
    free(v14);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (a5) {
    *a5 = 0;
  }
  return 4294963295;
}

__CFArray *sub_1000DCB94()
{
  int v0 = (uint64_t **)__chkstk_darwin();
  CFDictionaryRef theDict = v2;
  char v151 = v1;
  uint64_t v152 = v3;
  int v5 = v4;
  int v7 = v6;
  CFStringRef v9 = v8;
  int v145 = v10;
  uint64_t v11 = v0;
  CFTypeRef v169 = 0;
  int v168 = 0;
  *(void *)&key[1] = 0;
  key[0] = -1;
  CFTypeRef cf1 = 0;
  CFTypeRef v165 = 0;
  uint64_t v162 = 0;
  CFTypeRef cf = 0;
  memset(v172, 0, 512);
  int v12 = *v0;
  if (*v0)
  {
    CFStringRef v13 = (const __CFString *)v12[12];
    uint64_t v14 = *v12;
  }
  else
  {
    CFStringRef v13 = 0;
    uint64_t v14 = 0;
  }
  int v167 = 0;
  int v161 = 0;
  int v15 = sub_10004DC34(v14, &v168, &v167);
  if (!v15)
  {
    if (v5)
    {
      *int v5 = v168;
      BOOL v17 = 1;
      if (v13) {
        goto LABEL_8;
      }
    }
    else
    {
      BOOL v17 = 0;
      if (v13) {
        goto LABEL_8;
      }
    }
LABEL_20:
    CFStringRef v20 = 0;
    int v144 = 0;
    goto LABEL_33;
  }
  int v16 = VSGetLogDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v174 = 67109890;
    int v175 = v15;
    __int16 v176 = 2080;
    uint64_t v177 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
    __int16 v178 = 1024;
    int v179 = 2211;
    __int16 v180 = 2080;
    uint64_t v181 = "couldn't get choices";
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", (uint8_t *)&v174, 0x22u);
  }
  BOOL v17 = v5 != 0;
  if (!v13) {
    goto LABEL_20;
  }
LABEL_8:
  if (v9 && (MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v13)) != 0)
  {
    BOOL v19 = MutableCopy;
    CFStringAppend(MutableCopy, v9);
    CFStringRef v20 = v19;
  }
  else
  {
    BOOL v19 = 0;
    CFStringRef v20 = v13;
  }
  int v144 = v19;
  if (v7)
  {
    __int16 v21 = VSGetLogDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v174) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "dumping debug information...", (uint8_t *)&v174, 2u);
    }
    if (CFStringGetFileSystemRepresentation(v20, v182, 1024))
    {
      if (*v11) {
        uint64_t v22 = **v11;
      }
      else {
        uint64_t v22 = 0;
      }
      int v25 = sub_1000D9FBC(v22, v182, 1);
      int v23 = VSGetLogDefault();
      BOOL v26 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
      if (v25)
      {
        if (!v26) {
          goto LABEL_33;
        }
        int v174 = 67109120;
        int v175 = v25;
        __int16 v24 = "couldn't dump recognition (error %d)\n";
        uint64_t v27 = v23;
        uint32_t v28 = 8;
        goto LABEL_32;
      }
      if (!v26) {
        goto LABEL_33;
      }
      LOWORD(v174) = 0;
      __int16 v24 = "dump complete\n";
    }
    else
    {
      int v23 = VSGetLogDefault();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_33;
      }
      LOWORD(v174) = 0;
      __int16 v24 = "couldn't convert dump path\n";
    }
    uint64_t v27 = v23;
    uint32_t v28 = 2;
LABEL_32:
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, v24, (uint8_t *)&v174, v28);
  }
LABEL_33:
  int v29 = VSGetLogDefault();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    int v174 = 67109376;
    int v175 = v168;
    __int16 v176 = 1024;
    LODWORD(v177) = v167;
    _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%d choices, first choice confidence %d\n", (uint8_t *)&v174, 0xEu);
  }
  int v30 = v168;
  BOOL v143 = v17;
  if (v145 != 1 || v168 < 2) {
    goto LABEL_51;
  }
  if (*v11) {
    unint64_t v31 = **v11;
  }
  else {
    unint64_t v31 = 0;
  }
  int v32 = sub_10004E598(v31, v168);
  if (v32)
  {
    int v33 = v32;
    uint64_t v34 = VSGetLogDefault();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      int v174 = 67109890;
      int v175 = v33;
      __int16 v176 = 2080;
      uint64_t v177 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
      __int16 v178 = 1024;
      int v179 = 2259;
      __int16 v180 = 2080;
      uint64_t v181 = "couldn't rerecognize choice list";
      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", (uint8_t *)&v174, 0x22u);
    }
    int v15 = 1;
LABEL_243:
    int v122 = 0;
    CFStringRef theString2 = 0;
    theArray = 0;
    BOOL v121 = v15 != 0;
    if (!v20) {
      goto LABEL_241;
    }
    goto LABEL_244;
  }
  if (*v11) {
    uint64_t v35 = **v11;
  }
  else {
    uint64_t v35 = 0;
  }
  int v15 = sub_10004DC34(v35, &v168, &v167);
  if (v15)
  {
    uint64_t v36 = VSGetLogDefault();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      int v174 = 67109890;
      int v175 = v15;
      __int16 v176 = 2080;
      uint64_t v177 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
      __int16 v178 = 1024;
      int v179 = 2263;
      __int16 v180 = 2080;
      uint64_t v181 = "couldn't get choices";
      _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", (uint8_t *)&v174, 0x22u);
    }
  }
  uint64_t v37 = VSGetLogDefault();
  BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG);
  int v30 = v168;
  if (v38)
  {
    int v174 = 67109376;
    int v175 = v168;
    __int16 v176 = 1024;
    LODWORD(v177) = v167;
    _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%d rerec choices, first choice confidence %d\n", (uint8_t *)&v174, 0xEu);
    int v30 = v168;
    if (v15) {
      goto LABEL_243;
    }
  }
  else
  {
LABEL_51:
    if (v15) {
      goto LABEL_243;
    }
  }
  if (v30 < 1) {
    goto LABEL_243;
  }
  int v140 = 0;
  CFTypeRef cf2 = 0;
  CFStringRef theString2 = 0;
  int v39 = 0;
  signed int v40 = 0;
  theArray = 0;
  unsigned int v147 = v5;
  do
  {
    if (theArray)
    {
      BOOL v41 = key[2] <= v39 ? v39 - key[2] < 3 : key[2] - v39 < 3;
      if (!v41 && v20 == 0)
      {
        BOOL v121 = 0;
        int v122 = cf2;
        goto LABEL_241;
      }
    }
    if (*v11) {
      uint64_t v43 = **v11;
    }
    else {
      uint64_t v43 = 0;
    }
    int v44 = sub_10004D1A4(v43, v40, 1024, v173, (int *)&v162, &key[2], &key[1], (uint64_t)v172, key);
    if (v44)
    {
      int v45 = VSGetLogDefault();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v191 = 67109890;
        *(_DWORD *)&v191[4] = v44;
        *(_WORD *)&v191[8] = 2080;
        *(void *)&v191[10] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
        __int16 v192 = 1024;
        int v193 = 2272;
        __int16 v194 = 2080;
        int v195 = "couldn't get choice phrase";
        _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", v191, 0x22u);
      }
    }
    int v161 = 0;
    if (!theArray) {
      goto LABEL_74;
    }
    if (key[2] <= v39)
    {
      if (v39 - key[2] >= 3)
      {
LABEL_73:
        if (!v20) {
          goto LABEL_202;
        }
      }
    }
    else if (key[2] - v39 >= 3)
    {
      goto LABEL_73;
    }
LABEL_74:
    int v46 = v162;
    if ((int)v162 >= 1025)
    {
      int v46 = 1024;
      LODWORD(v162) = 1024;
    }
    if (v44 || v46 < 1) {
      goto LABEL_202;
    }
    if (key[0] == -1 || (Value = CFDictionaryGetValue(theDict, (const void *)key[0])) == 0)
    {
      int v44 = 0;
      goto LABEL_202;
    }
    int v156 = Value;
    CFStringRef v48 = (const __CFString *)*((void *)Value + 2);
    CFStringRef v149 = v48;
    if (v48)
    {
      CFRetain(v48);
      int64_t v154 = CFStringGetLength(v48) + 1;
    }
    else
    {
      int64_t v154 = 0;
    }
    CFTypeRef cf1 = 0;
    CFTypeRef v165 = 0;
    if ((int)v162 < 1)
    {
      int v44 = 0;
      goto LABEL_196;
    }
    unsigned int v153 = v40;
    uint64_t v49 = 0;
    int v50 = 0;
    int v155 = v39;
    while (1)
    {
      uint64_t v51 = v173[v49];
      if (v51 == -1) {
        goto LABEL_92;
      }
      if (*v11) {
        uint64_t v52 = **v11;
      }
      else {
        uint64_t v52 = 0;
      }
      uint64_t v53 = (unsigned __int8 *)v172[v49];
      int v54 = sub_100045C44(v52, v53, v51, 1024, v191);
      if (v54)
      {
        int v55 = v54;
        uint64_t v56 = VSGetLogDefault();
        if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          goto LABEL_92;
        }
        int v183 = 67109890;
        int v184 = v55;
        __int16 v185 = 2080;
        v186 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
        __int16 v187 = 1024;
        int v188 = 1985;
        __int16 v189 = 2080;
        v190 = "converting phrase id to text\n";
        int v90 = v56;
        uint64_t v91 = "Error %d at %s:%d (%s)\n";
        uint32_t v92 = 34;
LABEL_140:
        _os_log_error_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, v91, (uint8_t *)&v183, v92);
        goto LABEL_92;
      }
      if (!*(_WORD *)v191)
      {
        uint64_t v89 = VSGetLogDefault();
        if (!os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
          goto LABEL_92;
        }
        LOWORD(v183) = 0;
        int v90 = v89;
        uint64_t v91 = "word has zero length!\n";
        uint32_t v92 = 2;
        goto LABEL_140;
      }
      uint64_t v59 = 1;
      do
        CFIndex v60 = v59;
      while (*(unsigned __int16 *)&v191[2 * v59++]);
      CFStringRef v62 = CFStringCreateWithCharacters(kCFAllocatorDefault, (const UniChar *)v191, v60);
      if (v62)
      {
        CFMutableStringRef Mutable = (CFMutableStringRef)v62;
        sub_1000DE198((uint64_t)v156, (char *)v53, v154, (CFMutableArrayRef *)&v165, (CFMutableArrayRef *)&cf1, v62);
        uint64_t v64 = v49 + 1;
LABEL_133:
        CFRelease(Mutable);
        goto LABEL_135;
      }
LABEL_92:
      int v57 = *v11;
      if (v50) {
        goto LABEL_111;
      }
      if (v57) {
        uint64_t v58 = *v57;
      }
      else {
        uint64_t v58 = 0;
      }
      signed int v40 = v153;
      int v65 = sub_10004CD74(v58, v153, 1024, 0, &v174, (_DWORD *)&v162 + 1, &key[2], &key[1]);
      if (v65)
      {
        int v66 = v65;
        uint64_t v67 = VSGetLogDefault();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v191 = 67109890;
          *(_DWORD *)&v191[4] = v66;
          *(_WORD *)&v191[8] = 2080;
          *(void *)&v191[10] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
          __int16 v192 = 1024;
          int v193 = 2316;
          __int16 v194 = 2080;
          int v195 = "couldn't get choice";
          _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", v191, 0x22u);
        }
      }
      uint64_t v68 = HIDWORD(v162);
      if (SHIDWORD(v162) >= 1025)
      {
        uint64_t v68 = 1024;
        HIDWORD(v162) = 1024;
      }
      uint64_t v69 = *v11 ? **v11 : 0;
      int v70 = sub_100046618(v69, v152, v151, v68, (uint64_t)&v174, key, v172, (uint64_t)v171, (uint64_t)v170, &v161, 0);
      if (v70) {
        break;
      }
      int v57 = *v11;
LABEL_111:
      uint64_t v64 = v49 + 1;
      uint64_t v71 = (int *)&v162 + 1;
      if (v49 < v161 - 1) {
        uint64_t v71 = &v171[v49 + 1];
      }
      if (v57) {
        uint64_t v72 = *v57;
      }
      else {
        uint64_t v72 = 0;
      }
      uint64_t v73 = (int)v171[v49];
      uint64_t v74 = *v71 - v73;
      if (v74 >= 1)
      {
        CFStringRef v75 = v20;
        uint64_t v76 = v11;
        uint64_t v77 = 0;
        CFMutableStringRef Mutable = 0;
        int v157 = (char *)v172[v49];
        uint64_t v78 = &v174 + v73;
        while (1)
        {
          int v79 = sub_100051F44(v72, v78[v77], 1024, v191);
          if (v79)
          {
            int v83 = v79;
            uint64_t v84 = VSGetLogDefault();
            if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
              goto LABEL_131;
            }
            int v183 = 67109890;
            int v184 = v83;
            __int16 v185 = 2080;
            v186 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
            __int16 v187 = 1024;
            int v188 = 2005;
            __int16 v189 = 2080;
            v190 = "word surface form\n";
            uint64_t v85 = v84;
            uint64_t v86 = "Error %d at %s:%d (%s)\n";
            uint32_t v87 = 34;
            goto LABEL_142;
          }
          if (!*(_WORD *)v191) {
            break;
          }
          uint64_t v80 = 1;
          do
            CFIndex v81 = v80;
          while (*(unsigned __int16 *)&v191[2 * v80++]);
          if (Mutable) {
            CFStringAppend(Mutable, @" ");
          }
          else {
            CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
          }
          CFStringAppendCharacters(Mutable, (const UniChar *)v191, v81);
          if (++v77 == v74) {
            goto LABEL_131;
          }
        }
        uint64_t v88 = VSGetLogDefault();
        if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
          goto LABEL_131;
        }
        LOWORD(v183) = 0;
        uint64_t v85 = v88;
        uint64_t v86 = "word has zero length!\n";
        uint32_t v87 = 2;
LABEL_142:
        _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, v86, (uint8_t *)&v183, v87);
LABEL_131:
        CFStringRef v20 = v75;
        if (!Mutable)
        {
          int v50 = 1;
          uint64_t v11 = v76;
          int v39 = v155;
          goto LABEL_135;
        }
        sub_1000DE198((uint64_t)v156, v157, v154, (CFMutableArrayRef *)&v165, (CFMutableArrayRef *)&cf1, Mutable);
        int v50 = 1;
        uint64_t v11 = v76;
        int v39 = v155;
        goto LABEL_133;
      }
      int v50 = 1;
LABEL_135:
      uint64_t v49 = v64;
      if (v64 >= (int)v162)
      {
        int v44 = 0;
        int v5 = v147;
        signed int v40 = v153;
        goto LABEL_147;
      }
    }
    int v44 = v70;
    uint64_t v93 = VSGetLogDefault();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v191 = 67109890;
      *(_DWORD *)&v191[4] = v44;
      *(_WORD *)&v191[8] = 2080;
      *(void *)&v191[10] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
      __int16 v192 = 1024;
      int v193 = 2323;
      __int16 v194 = 2080;
      int v195 = "finding matched classes";
      _os_log_error_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", v191, 0x22u);
    }
    int v5 = v147;
LABEL_147:
    if (!v165) {
      goto LABEL_196;
    }
    if (!cf1) {
      goto LABEL_196;
    }
    uint64_t v94 = (const void *)VSRecognitionResultCreate();
    CFTypeRef cf = v94;
    if (!v94) {
      goto LABEL_196;
    }
    CFTypeRef v95 = CFRetain(v94);
    CFArrayRef v96 = (const __CFArray *)v156[71];
    if (v96)
    {
      CFIndex Count = CFArrayGetCount(v96);
      uint64_t v98 = v156;
      if (cf)
      {
        CFIndex v99 = Count;
        if (Count >= 1)
        {
          uint64_t v158 = (uint64_t)v95;
          CFIndex v100 = 0;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v98[71], v100);
            uint64_t v102 = (uint64_t)ValueAtIndex;
            CFTypeRef v103 = cf;
            *(void *)int v191 = 0;
            if (cf)
            {
              PhraseCFIndex Count = VSRecognitionResultGetPhraseCount();
              int v105 = sub_1000EF5D8(v102, (uint64_t)v103, v191, PhraseCount);
            }
            else
            {
              int v105 = sub_1000EF5D8((uint64_t)ValueAtIndex, 0, v191, 0);
              PhraseCFIndex Count = 0;
            }
            CFIndex v106 = v100 + 1;
            if (v105) {
              BOOL v107 = *(void *)v191 < PhraseCount;
            }
            else {
              BOOL v107 = 1;
            }
            int v108 = v107;
            ++v100;
            BOOL v109 = v108 == 1 && v106 < v99;
            uint64_t v98 = v156;
          }
          while (v109);
          int v5 = v147;
          int v39 = v155;
          signed int v40 = v153;
          CFTypeRef v95 = (CFTypeRef)v158;
          if (!v108)
          {
            uint64_t v116 = (uint64_t (*)(void *, CFTypeRef *, void, void))v156[75];
            if (v116) {
              BOOL v117 = v116(v156, &cf, 0, v156[82]) != 0;
            }
            else {
              BOOL v117 = 1;
            }
            if (!v117 || !cf) {
              goto LABEL_170;
            }
            if (!theArray)
            {
              if (v145 && v153 | v140)
              {
                theArray = 0;
              }
              else
              {
                theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
                CFArrayAppendValue(theArray, cf);
                if (!v153) {
                  int v39 = key[2];
                }
                if (v149) {
                  CFRetain(v149);
                }
                if (cf1)
                {
                  CFTypeRef cf2 = cf1;
                  CFRetain(cf1);
                }
                else
                {
                  CFTypeRef cf2 = 0;
                }
                CFStringRef theString2 = v149;
              }
              goto LABEL_233;
            }
            if (key[2] <= v155)
            {
              if (v155 - key[2] > 2) {
                goto LABEL_233;
              }
            }
            else if (key[2] - v155 >= 3)
            {
LABEL_233:
              if (v20) {
                sub_1000DE3CC((uint64_t)cf, v158, key[2], 1, (__CFArray **)&v169);
              }
              goto LABEL_193;
            }
            if (theString2
              && v149
              && cf2
              && cf1
              && CFEqual(v149, theString2)
              && CFEqual(cf1, cf2))
            {
              CFArrayAppendValue(theArray, cf);
            }
            goto LABEL_233;
          }
        }
      }
    }
    uint64_t v110 = VSGetLogDefault();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v191 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEBUG, "result did not parse through sequences - rejecting\n", v191, 2u);
    }
LABEL_170:
    if (*v11) {
      unint64_t v111 = **v11;
    }
    else {
      unint64_t v111 = 0;
    }
    int v112 = sub_10004D690(v111, v40);
    if (v112)
    {
      int v44 = v112;
      uint64_t v113 = VSGetLogDefault();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v191 = 67109890;
        *(_DWORD *)&v191[4] = v44;
        *(_WORD *)&v191[8] = 2080;
        *(void *)&v191[10] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
        __int16 v192 = 1024;
        int v193 = 2380;
        __int16 v194 = 2080;
        int v195 = "discarding choice";
        uint64_t v114 = v113;
        goto LABEL_184;
      }
    }
    else
    {
      if (*v11) {
        uint64_t v115 = **v11;
      }
      else {
        uint64_t v115 = 0;
      }
      int v44 = sub_10004DC34(v115, &v168, &v167);
      if (v44)
      {
        uint64_t v118 = VSGetLogDefault();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v191 = 67109890;
          *(_DWORD *)&v191[4] = v44;
          *(_WORD *)&v191[8] = 2080;
          *(void *)&v191[10] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
          __int16 v192 = 1024;
          int v193 = 2384;
          __int16 v194 = 2080;
          int v195 = "getting new choice count";
          uint64_t v114 = v118;
LABEL_184:
          _os_log_error_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", v191, 0x22u);
        }
      }
      else
      {
        --v40;
      }
    }
    int v119 = VSGetLogDefault();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v191 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEBUG, "discarding invalid result:\n ", v191, 2u);
    }
    if (cf && (int v120 = VSGetLogDefault(), os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG)))
    {
      *(_DWORD *)int v191 = 138412290;
      *(void *)&v191[4] = cf;
      _os_log_debug_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEBUG, "%@", v191, 0xCu);
      if (v20) {
LABEL_191:
      }
        sub_1000DE3CC((uint64_t)cf, (uint64_t)v95, key[2], 0, (__CFArray **)&v169);
    }
    else if (v20)
    {
      goto LABEL_191;
    }
    int v140 = 1;
LABEL_193:
    if (cf) {
      CFRelease(cf);
    }
    CFRelease(v95);
LABEL_196:
    if (v165) {
      CFRelease(v165);
    }
    if (cf1) {
      CFRelease(cf1);
    }
    if (v149) {
      CFRelease(v149);
    }
LABEL_202:
    if (v44) {
      break;
    }
    ++v40;
  }
  while (v40 < v168);
  BOOL v121 = v44 != 0;
  if (theArray && v44)
  {
    CFRelease(theArray);
    theArray = 0;
    BOOL v121 = 1;
  }
  int v122 = cf2;
  if (!v20)
  {
LABEL_241:
    CFStringRef v123 = theString2;
    goto LABEL_262;
  }
LABEL_244:
  BOOL alloc = v121;
  CFTypeRef cf2a = v122;
  int v148 = v5;
  CFStringRef v124 = v20;
  CFTypeRef v125 = v169;
  uint64_t v126 = v11[2];
  int v183 = v167;
  *(void *)int v191 = v126;
  uint64_t v127 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFNumberRef v128 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v183);
  CFNumberRef v129 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloat64Type, v191);
  CFStringRef v130 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@results.%@", v124, kVSLogBundlePlistExtension);
  uint64_t v131 = +[AVAudioSession sharedInstance];
  uint64_t v132 = [v131 currentRoute];

  uint64_t v133 = [v132 inputs];
  if ([v133 count])
  {
    int v134 = [v133 objectAtIndex:0];
  }
  else
  {
    int v134 = 0;
  }
  __int16 v135 = [v134 portType];

  pthread_once(&stru_100101A90, sub_1000EF570);
  if (qword_100106B58)
  {
    CFRetain((CFTypeRef)qword_100106B58);
    uint64_t v136 = (const void *)qword_100106B58;
  }
  else
  {
    uint64_t v136 = 0;
  }
  int v5 = v148;
  CFURLRef v137 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v130, kCFURLPOSIXPathStyle, 0);
  uint64_t v138 = CFWriteStreamCreateWithFile(kCFAllocatorDefault, v137);
  if (v125) {
    CFDictionarySetValue(v127, @"results", v125);
  }
  CFDictionarySetValue(v127, @"top-confidence", v128);
  CFDictionarySetValue(v127, @"sample-rate", v129);
  CFRelease(v128);
  CFRelease(v129);
  if (v135)
  {
    CFDictionarySetValue(v127, @"route", v135);
    CFRelease(v135);
  }
  BOOL v17 = v143;
  CFStringRef v123 = theString2;
  if (v136)
  {
    CFDictionarySetValue(v127, @"version", v136);
    CFRelease(v136);
  }
  if (v138)
  {
    BOOL v121 = alloc;
    if (CFWriteStreamOpen(v138))
    {
      CFPropertyListWrite(v127, v138, kCFPropertyListXMLFormat_v1_0, 0, 0);
      CFWriteStreamClose(v138);
    }
    CFRelease(v130);
    CFRelease(v137);
    CFRelease(v127);
    CFRelease(v138);
  }
  else
  {
    CFRelease(v130);
    CFRelease(v137);
    CFRelease(v127);
    BOOL v121 = alloc;
  }
  int v122 = cf2a;
LABEL_262:
  if (v169) {
    CFRelease(v169);
  }
  if (v144) {
    CFRelease(v144);
  }
  if (v123) {
    CFRelease(v123);
  }
  if (v122) {
    CFRelease(v122);
  }
  if (v17 && v121) {
    *int v5 = 0;
  }
  return theArray;
}

void sub_1000DE198(uint64_t a1, char *__s, int64_t a3, CFMutableArrayRef *a4, CFMutableArrayRef *a5, const void *ValueAtIndex)
{
  int64_t v12 = strlen(__s);
  if (v12 > a3)
  {
    int64_t v13 = v12 - 1;
    while (__s[v12 - 1] != 35)
    {
      if (--v12 <= a3) {
        goto LABEL_7;
      }
    }
    int64_t v13 = v12 - 2;
LABEL_7:
    CFStringRef v14 = CFStringCreateWithBytes(kCFAllocatorDefault, (const UInt8 *)&__s[a3], v13 - a3 + 1, 0x8000100u, 0);
    if (v14)
    {
      CFStringRef v15 = v14;
      int v16 = sub_1000EBDAC(*(const __CFDictionary **)(a1 + 560), v14);
      if (!v16)
      {
        uint64_t v22 = VSGetLogDefault();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int v23 = 136315394;
          __int16 v24 = "_AddPhraseStringToResults";
          __int16 v25 = 2080;
          BOOL v26 = __s;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: couldn't find class with identifier '%s'\n", (uint8_t *)&v23, 0x16u);
        }
        goto LABEL_26;
      }
      BOOL v17 = v16;
      uint64_t v18 = *(uint64_t (**)(uint64_t, const void *, const void *, void))(a1 + 616);
      if (v18)
      {
        CFArrayRef v19 = (const __CFArray *)v18(a1, v16, ValueAtIndex, *(void *)(a1 + 656));
        CFArrayRef v20 = v19;
        if (v19)
        {
          if (CFArrayGetCount(v19) >= 1) {
            ValueAtIndex = CFArrayGetValueAtIndex(v20, 0);
          }
          char v21 = 0;
          if (!a4) {
            goto LABEL_21;
          }
          goto LABEL_19;
        }
      }
      else
      {
        CFArrayRef v20 = 0;
      }
      char v21 = 1;
      if (!a4)
      {
LABEL_21:
        if (a5 && !*a5) {
          *a5 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
        }
        CFArrayAppendValue(*a4, ValueAtIndex);
        CFArrayAppendValue(*a5, v15);
        CFRelease(v17);
        if ((v21 & 1) == 0) {
          CFRelease(v20);
        }
LABEL_26:
        CFRelease(v15);
        return;
      }
LABEL_19:
      if (!*a4) {
        *a4 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      }
      goto LABEL_21;
    }
  }
}

void sub_1000DE3CC(uint64_t a1, uint64_t a2, int a3, int a4, __CFArray **a5)
{
  int valuePtr = a3;
  DictionaryRepresentation = (void *)VSRecognitionResultCreateDictionaryRepresentation();
  if (a2 == a1) {
    int v10 = 0;
  }
  else {
    int v10 = (void *)VSRecognitionResultCreateDictionaryRepresentation();
  }
  CFNumberRef v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFNumberRef v12 = v11;
  *(_OWORD *)keys = *(_OWORD *)&off_1000FE4A8;
  long long v20 = *(_OWORD *)&off_1000FE4B8;
  int64_t v13 = &kCFBooleanTrue;
  if (!a4) {
    int64_t v13 = &kCFBooleanFalse;
  }
  values[0] = *(void **)v13;
  values[1] = DictionaryRepresentation;
  values[2] = v11;
  values[3] = v10;
  if (v10) {
    CFIndex v14 = 4;
  }
  else {
    CFIndex v14 = 3;
  }
  CFDictionaryRef v15 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, v14, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableStringRef Mutable = *a5;
  if (!*a5)
  {
    CFMutableStringRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    *a5 = Mutable;
  }
  CFArrayAppendValue(Mutable, v15);
  CFRelease(v15);
  CFRelease(DictionaryRepresentation);
  CFRelease(v12);
  if (v10) {
    CFRelease(v10);
  }
}

void sub_1000DE534(unsigned __int8 **a1, uint64_t *a2)
{
  if (a2)
  {
    unsigned int v4 = sub_1000DE5B0(a2[3], a1[67]);
    if (v4 != -1)
    {
      uint64_t v6 = *a2;
      uint64_t v5 = a2[1];
      ++*a2;
      *(_DWORD *)(v5 + 4 * v6) = v4;
      if (a2[2])
      {
        unint64_t v7 = v4;
        CFStringRef v8 = (__CFDictionary *)a2[2];
        CFDictionarySetValue(v8, (const void *)v7, a1);
      }
    }
  }
}

uint64_t sub_1000DE5B0(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v6 = -1;
  int v2 = sub_100043DB8(a1, a2, (int *)&v6);
  if (v2)
  {
    int v3 = v2;
    unsigned int v4 = VSGetLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      int v8 = v3;
      __int16 v9 = 2080;
      int v10 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
      __int16 v11 = 1024;
      int v12 = 534;
      __int16 v13 = 2080;
      CFIndex v14 = "couldn't find constraint";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", buf, 0x22u);
    }
  }
  return v6;
}

uint64_t sub_1000DE69C(uint64_t **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (!v2) {
    return 0;
  }
  unsigned int v3 = sub_1000475F4(v2);
  if (v3)
  {
    unsigned int v4 = v3;
    uint64_t v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109634;
      unsigned int v12 = v4;
      __int16 v13 = 2080;
      CFIndex v14 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
      __int16 v15 = 1024;
      int v16 = 1951;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error %d at %s:%d\n", (uint8_t *)&v11, 0x18u);
    }
    if (v4 > 0xB) {
      uint64_t v6 = 4294963295;
    }
    else {
      uint64_t v6 = dword_1000F6908[v4];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  unsigned int v7 = sub_10004CA40(*v1, 0);
  if (v7)
  {
    unsigned int v8 = v7;
    __int16 v9 = VSGetLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109634;
      unsigned int v12 = v8;
      __int16 v13 = 2080;
      CFIndex v14 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
      __int16 v15 = 1024;
      int v16 = 1954;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error %d at %s:%d\n", (uint8_t *)&v11, 0x18u);
    }
    if (v8 > 0xB) {
      return 4294963295;
    }
    else {
      return dword_1000F6908[v8];
    }
  }
  return v6;
}

uint64_t sub_1000DE84C(uint64_t **a1, char *a2, int a3, uint64_t a4, unsigned char *a5)
{
  if ((byte_100106A20 & 1) == 0)
  {
    __int16 v9 = VSGetLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      mach_absolute_time();
      VSAbsoluteTimeToSecond();
      *(_DWORD *)buf = 134217984;
      *(void *)int v23 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "time to first Elvis packet: %g", buf, 0xCu);
    }
    byte_100106A20 = 1;
  }
  int v20 = 2;
  int v21 = 0;
  if (a5) {
    *a5 = 0;
  }
  int v10 = *a1;
  if (!*a1 || !*v10)
  {
    uint64_t result = 4294963293;
    if (!a5) {
      return result;
    }
    goto LABEL_15;
  }
  unsigned int v11 = sub_100048414(*v10, a2, a3, &v21);
  unsigned int v12 = VSGetLogDefault();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (!v11) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  *(_DWORD *)buf = 67109888;
  *(_DWORD *)int v23 = v11;
  *(_WORD *)&v23[4] = 2048;
  *(void *)&v23[6] = a2;
  __int16 v24 = 1024;
  int v25 = a3;
  __int16 v26 = 1024;
  LODWORD(v27) = v21;
  _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "#Audio PutWaveSamples (uint64_t result = %d): audioData = %p, sampleCount = %d, feStatus = %d\n", buf, 0x1Eu);
  if (v11)
  {
LABEL_11:
    __int16 v13 = VSGetLogDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)int v23 = v11;
      *(_WORD *)&v23[4] = 2080;
      *(void *)&v23[6] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
      __int16 v24 = 1024;
      int v25 = 1911;
      __int16 v26 = 2080;
      uint64_t v27 = "error enqueing samples";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", buf, 0x22u);
    }
    int v14 = 2;
    goto LABEL_28;
  }
LABEL_17:
  while (1)
  {
    uint64_t v17 = *a1 ? **a1 : 0;
    unsigned int v11 = sub_10004BF78(v17, &v20);
    uint64_t v18 = VSGetLogDefault();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      break;
    }
    if (v11) {
      goto LABEL_25;
    }
LABEL_22:
    int v14 = v20;
    if (v20 != 2)
    {
      unsigned int v11 = 0;
      goto LABEL_31;
    }
  }
  *(_DWORD *)buf = 67109376;
  *(_DWORD *)int v23 = v11;
  *(_WORD *)&v23[4] = 1024;
  *(_DWORD *)&v23[6] = v20;
  _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "#Audio ProcessSpeech (uint64_t result = %d): reStatus = %d\n", buf, 0xEu);
  if (!v11) {
    goto LABEL_22;
  }
LABEL_25:
  CFArrayRef v19 = VSGetLogDefault();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)int v23 = v11;
    *(_WORD *)&v23[4] = 2080;
    *(void *)&v23[6] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
    __int16 v24 = 1024;
    int v25 = 1917;
    __int16 v26 = 2080;
    uint64_t v27 = "couldn't process samples";
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", buf, 0x22u);
  }
  int v14 = v20;
LABEL_28:
  if (v11 <= 0xB)
  {
LABEL_31:
    uint64_t result = dword_1000F6908[v11];
    if (!a5) {
      return result;
    }
LABEL_32:
    if (!result && v21 != 2 && v14) {
      return 0;
    }
LABEL_15:
    *a5 = 1;
    return result;
  }
  uint64_t result = 4294963295;
  if (a5) {
    goto LABEL_32;
  }
  return result;
}

uint64_t sub_1000DEBDC(uint64_t **a1, const __CFSet *a2, uint64_t a3, int a4)
{
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  unsigned int v4 = *a1;
  if (!*a1) {
    return 4294963293;
  }
  uint64_t v6 = *v4;
  if (!*v4) {
    return 4294963293;
  }
  unsigned int v20 = 0;
  if (a4)
  {
    int v9 = sub_100046D0C(v6);
    int v10 = VSGetLogDefault();
    unsigned int v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Couldn't reset front end\n", buf, 2u);
        if (!a3) {
          goto LABEL_19;
        }
LABEL_11:
        if (*((unsigned char *)v4 + 104) || (!*a1 ? (uint64_t v13 = 0) : (uint64_t v13 = **a1), !sub_1000D9C9C(v13, 40000)))
        {
          (*a1)[12] = VSLogBundleCopyPathForFile();
          *((unsigned char *)v4 + 104) = 1;
        }
        else
        {
          int v14 = VSGetLogDefault();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "error allocating debug dump resources\n", buf, 2u);
          }
        }
        goto LABEL_19;
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Reset engine\n", buf, 2u);
      if (!a3) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
  }
  if (a3) {
    goto LABEL_11;
  }
LABEL_19:
  if (sub_1000DC95C(a1, a2, buf, &v22, &v21, 0))
  {
    unsigned int v15 = 1;
  }
  else
  {
    if (*a1) {
      uint64_t v16 = **a1;
    }
    else {
      uint64_t v16 = 0;
    }
    unsigned int v17 = sub_100047414(v16, &v20);
    if (v17)
    {
      unsigned int v15 = v17;
      uint64_t v18 = VSGetLogDefault();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v23 = 67109634;
        unsigned int v24 = v15;
        __int16 v25 = 2080;
        __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
        __int16 v27 = 1024;
        int v28 = 1871;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error %d at %s:%d\n", v23, 0x18u);
      }
    }
    else
    {
      if (*a1) {
        uint64_t v19 = **a1;
      }
      else {
        uint64_t v19 = 0;
      }
      unsigned int v15 = sub_10004B07C(v19, v20, 3, 0, 0, v21, (uint64_t)v22);
    }
  }
  if (v22 && v22 != buf) {
    free(v22);
  }
  if (v15 > 0xB) {
    return 4294963295;
  }
  else {
    return dword_1000F6908[v15];
  }
}

uint64_t sub_1000DEEB0(uint64_t a1, BOOL *a2, double a3)
{
  double v5 = *(double *)(a1 + 16);
  uint64_t result = sub_1000DEF00((uint64_t **)a1, *(const __CFURL **)(*(void *)a1 + 112), a3);
  if (a2) {
    *a2 = v5 != *(double *)(a1 + 16);
  }
  return result;
}

uint64_t sub_1000DEF00(uint64_t **a1, const __CFURL *a2, double a3)
{
  if (*((double *)a1 + 2) != a3 && *((double *)a1 + 1) != a3)
  {
    a1[2] = (uint64_t *)0xBFF0000000000000;
    sub_1000DF378((uint64_t *)a1);
  }
  memset(&v27, 0, sizeof(v27));
  if (*a1 && **a1) {
    return 0;
  }
  CFStringRef v7 = (const __CFString *)a1[4];
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(kVSFrameworkBundleIdentifier);
  if (!BundleWithIdentifier || (CFURLRef v9 = CFBundleCopyBundleURL(BundleWithIdentifier)) == 0)
  {
    a1[2] = (uint64_t *)0xBFF0000000000000;
    goto LABEL_19;
  }
  CFURLRef v10 = v9;
  CFURLRef v11 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v9, @"RecognitionResources/Express", 1u);
  CFRelease(v10);
  a1[2] = (uint64_t *)0xBFF0000000000000;
  if (v11)
  {
    if (sub_1000DF3CC(v7, v11, @".v", v38))
    {
      CFStringRef v12 = 0;
    }
    else
    {
      CFURLRef v18 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v11, @"language_fallbacks.plist", 0);
      if (!v18)
      {
        int v17 = 0;
        goto LABEL_35;
      }
      CFURLRef v19 = v18;
      CFStringRef v20 = (const __CFString *)_VSCopyFallbackLanguageIdentifierForLanguageIdentifier();
      CFStringRef v12 = v20;
      if (!v20 || !sub_1000DF3CC(v20, v11, @".v", v38))
      {
        CFRelease(v19);
        goto LABEL_31;
      }
      CFRelease(v19);
      CFStringRef v7 = v12;
    }
    if (a3 == 8000.0) {
      double v13 = a3;
    }
    else {
      double v13 = 16000.0;
    }
    if (v13 == 16000.0 && sub_1000DF3CC(v7, v11, @".16", v39))
    {
      uint64_t v14 = 0x40CF400000000000;
LABEL_25:
      a1[2] = (uint64_t *)v14;
      int v17 = 1;
      goto LABEL_32;
    }
    if (sub_1000DF3CC(v7, v11, @".8", v39))
    {
      uint64_t v14 = 0x40BF400000000000;
      goto LABEL_25;
    }
LABEL_31:
    int v17 = 0;
LABEL_32:
    CFRelease(v11);
    CFURLRef v11 = (const __CFURL *)v12;
    if (!v12)
    {
LABEL_36:
      if (v17)
      {
        uint64_t v21 = (uint64_t)*a1;
        *(_OWORD *)(v21 + 64) = 0u;
        *(_OWORD *)(v21 + 80) = 0u;
        *(_OWORD *)(v21 + 32) = 0u;
        *(_OWORD *)(v21 + 48) = 0u;
        *(void *)(v21 + 8) = sub_1000DF4F0;
        *(void *)(v21 + 16) = sub_1000DF4E8;
        *(void *)(v21 + 24) = sub_1000DF4D4;
        uint64_t v6 = sub_10004337C(v39, v38, (uint64_t)(*a1 + 1), *a1);
        if (v6)
        {
          uint64_t v22 = VSGetLogDefault();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109634;
            int v33 = v6;
            __int16 v34 = 2080;
            uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
            __int16 v36 = 1024;
            int v37 = 406;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error %d at %s:%d\n", buf, 0x18u);
          }
          if (v6 > 0xB) {
            uint64_t v6 = 4294963295;
          }
          else {
            uint64_t v6 = dword_1000F6908[v6];
          }
        }
        if (a2)
        {
          CFURLRef v23 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, a2, @"express.psa", 0);
          if (v23)
          {
            CFURLRef v24 = v23;
            if (CFURLGetFileSystemRepresentation(v23, 1u, buf, 1024) && !stat((const char *)buf, &v27))
            {
              if (*a1) {
                uint64_t v25 = **a1;
              }
              else {
                uint64_t v25 = 0;
              }
              if (!sub_10004A238(v25, 0, (const char *)buf))
              {
                __int16 v26 = VSGetLogDefault();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)int v28 = 136315394;
                  int v29 = "_VSElvisCreateElvisIfNecessary";
                  __int16 v30 = 2080;
                  unint64_t v31 = buf;
                  _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s: Configured from PSA file at %s.\n", v28, 0x16u);
                }
              }
            }
            CFRelease(v24);
          }
        }
        *((double *)a1 + 1) = a3;
        return v6;
      }
      goto LABEL_19;
    }
LABEL_35:
    CFRelease(v11);
    goto LABEL_36;
  }
LABEL_19:
  unsigned int v15 = VSGetLogDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "No bin file found\n", buf, 2u);
  }
  return 4294963290;
}

uint64_t *sub_1000DF378(uint64_t *result)
{
  uint64_t v1 = (uint64_t **)*result;
  if (*result)
  {
    uint64_t v2 = result;
    uint64_t result = *v1;
    if (*v1)
    {
      unsigned int v4 = v1 + 1;
      uint64_t result = (uint64_t *)sub_10004088C((uint64_t)result, (uint64_t *)&v4);
      uint64_t v3 = *v2;
      *(void *)uint64_t v3 = 0;
      *(unsigned char *)(v3 + 104) = 0;
    }
  }
  return result;
}

BOOL sub_1000DF3CC(CFStringRef theString, const __CFURL *a2, const __CFString *a3, char *a4)
{
  if (!theString) {
    return 0;
  }
  MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, theString);
  unsigned int v8 = MutableCopy;
  if (a3) {
    CFStringAppend(MutableCopy, a3);
  }
  CFStringAppend(v8, @".bin");
  CFURLRef v9 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, a2, v8, 0);
  CFRelease(v8);
  if (!v9) {
    return 0;
  }
  memset(&v12, 0, sizeof(v12));
  if (CFURLGetFileSystemRepresentation(v9, 1u, (UInt8 *)a4, 1024)) {
    BOOL v10 = stat(a4, &v12) == 0;
  }
  else {
    BOOL v10 = 0;
  }
  CFRelease(v9);
  return v10;
}

size_t sub_1000DF4D4(int a1, void *ptr)
{
  if (ptr) {
    return malloc_size(ptr);
  }
  else {
    return 0;
  }
}

void sub_1000DF4E8(int a1, void *a2)
{
}

void *sub_1000DF4F0(int a1, size_t size)
{
  return malloc_type_malloc(size, 0x9DB2702CuLL);
}

void sub_1000DF500(uint64_t *a1, CFTypeRef cf)
{
  uint64_t v4 = *a1;
  double v5 = *(const void **)(*a1 + 112);
  if (v5)
  {
    CFRelease(v5);
    uint64_t v4 = *a1;
  }
  *(void *)(v4 + 112) = cf;
  if (cf)
  {
    CFRetain(cf);
  }
}

uint64_t sub_1000DF560(uint64_t **a1, const __CFURL *a2)
{
  int v10 = 0;
  CFURLRef v3 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, a2, @"express.psa", 0);
  if (v3)
  {
    CFURLRef v4 = v3;
    if (CFURLGetFileSystemRepresentation(v3, 1u, buffer, 1024))
    {
      if (*a1) {
        uint64_t v5 = **a1;
      }
      else {
        uint64_t v5 = 0;
      }
      if (!sub_100044614(v5, &v10) && v10 >= 1)
      {
        uint64_t v6 = VSGetLogDefault();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          stat v12 = "_VSElvisWriteToCache";
          __int16 v13 = 1024;
          LODWORD(v14) = v10;
          _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s: pruned %d classes\n", buf, 0x12u);
        }
      }
      if (*a1) {
        uint64_t v7 = **a1;
      }
      else {
        uint64_t v7 = 0;
      }
      sub_10004A458(v7, 0, (const char *)buffer);
      unsigned int v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        stat v12 = "_VSElvisWriteToCache";
        __int16 v13 = 2080;
        uint64_t v14 = buffer;
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s: PSA file written to %s.\n", buf, 0x16u);
      }
    }
    CFRelease(v4);
  }
  return 0;
}

CFStringRef sub_1000DF718(uint64_t a1, CFStringRef theString)
{
  CFStringRef v2 = theString;
  v11.location = 0;
  v11.length = 0;
  if (!a1 || !theString) {
    goto LABEL_24;
  }
  if (!*(unsigned char *)(*(void *)a1 + 105))
  {
LABEL_25:
    CFRetain(v2);
    return v2;
  }
  uint64_t Length = CFStringGetLength(theString);
  v12.location = 0;
  v12.length = Length;
  CFStringRef v4 = CFStringTokenizerCopyBestStringLanguage(v2, v12);
  CFStringRef v5 = v4;
  if (v4 && !sub_1000DF888(v4))
  {
    MutableCopy = 0;
    goto LABEL_23;
  }
  v11.location = 0;
  v11.length = Length;
  if (Length >= 1)
  {
    v6.location = 0;
    MutableCopy = 0;
    uint64_t v8 = Length;
    while (1)
    {
      v6.length = Length;
      if (!CFStringFindWithOptions(v2, @" ", v6, 0, &v11)) {
        break;
      }
      if (!MutableCopy)
      {
        MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v2);
        CFStringRef v2 = MutableCopy;
      }
      CFStringReplace(MutableCopy, v11, &stru_1000FEEA0);
      v6.location = v11.location;
      v8 -= v11.length;
      uint64_t Length = v8 - v11.location;
      v11.length = v8 - v11.location;
      if (v11.location == -1 || v8 <= v11.location) {
        goto LABEL_18;
      }
    }
    v11.location = -1;
    if (v5) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  MutableCopy = 0;
LABEL_18:
  if (!v5)
  {
LABEL_19:
    if (MutableCopy) {
      return MutableCopy;
    }
LABEL_24:
    if (!v2) {
      return 0;
    }
    goto LABEL_25;
  }
LABEL_23:
  CFRelease(v5);
  if (!MutableCopy) {
    goto LABEL_24;
  }
  return MutableCopy;
}

CFStringRef sub_1000DF888(const __CFString *result)
{
  if (result)
  {
    CFStringRef v1 = result;
    if (CFStringHasPrefix(result, @"zh")) {
      return (const __CFString *)1;
    }
    else {
      return (const __CFString *)(CFStringHasPrefix(v1, @"ja") != 0);
    }
  }
  return result;
}

uint64_t sub_1000DF8E0(uint64_t **a1, uint64_t a2, void *a3)
{
  CFTypeRef v28 = 0;
  values = a3;
  int v27 = 0;
  if (!*a1 || !**a1) {
    return 4294963293;
  }
  CFStringRef v5 = sub_1000DFBE8(*(CFTypeRef *)(a2 + 16), (uint64_t)a3);
  if (!v5)
  {
    unsigned int v12 = 1;
    return dword_1000F6908[v12];
  }
  CFStringRef v6 = v5;
  CFIndex Length = CFStringGetLength(v5);
  uint64_t MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex v9 = MaximumSizeForEncoding;
  CFIndex usedBufLen = MaximumSizeForEncoding;
  if (MaximumSizeForEncoding < 1024) {
    int v10 = v30;
  }
  else {
    int v10 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0xEF493AAAuLL);
  }
  v31.location = 0;
  v31.length = Length;
  CFStringGetBytes(v6, v31, 0x8000100u, 0, 0, v10, v9, &usedBufLen);
  v10[usedBufLen] = 0;
  if (*a1) {
    uint64_t v13 = **a1;
  }
  else {
    uint64_t v13 = 0;
  }
  unsigned int v12 = 4;
  if (sub_100044434(v13, v10, &v27)) {
    goto LABEL_35;
  }
  if (!v27) {
    goto LABEL_35;
  }
  unsigned int v12 = 1;
  CFArrayRef v14 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  if (!v14) {
    goto LABEL_35;
  }
  CFArrayRef v15 = v14;
  CFArrayRef v16 = sub_1000EC768(a2, v14);
  if (!v16)
  {
    unsigned int v12 = 0;
    goto LABEL_34;
  }
  CFArrayRef v17 = v16;
  if (CFArrayGetCount(v16) < 1)
  {
    unsigned int v12 = 0;
    goto LABEL_33;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(v17, 0);
  CFURLRef v19 = (uint64_t (*)(void *, uint64_t, void *, void))ValueAtIndex[3];
  if (!v19 || (uint64_t v20 = (uint64_t)ValueAtIndex, v21 = v19(ValueAtIndex, a2, values, ValueAtIndex[2]), v21 < 1))
  {
    unsigned int v12 = 1;
    goto LABEL_33;
  }
  uint64_t v22 = v21;
  CFArrayRef v25 = v15;
  uint64_t v23 = 0;
  uint64_t v24 = 1;
  do
  {
    if (v23)
    {
      unsigned int v12 = sub_1000DFCA0((uint64_t)a1, a2, (uint64_t)values, v20, v24 - 1, (uint64_t)v10, 0, (__CFStringTokenizer **)&v28);
    }
    else
    {
      uint64_t v23 = NSPushAutoreleasePool();
      unsigned int v12 = sub_1000DFCA0((uint64_t)a1, a2, (uint64_t)values, v20, v24 - 1, (uint64_t)v10, 0, (__CFStringTokenizer **)&v28);
      if (!v23) {
        goto LABEL_25;
      }
    }
    if ((~((_BYTE)v24 - 1) & 0x5F) == 0)
    {
      NSPopAutoreleasePool();
      uint64_t v23 = 0;
    }
LABEL_25:
    if (v24 >= v22) {
      break;
    }
    ++v24;
  }
  while (!v12);
  CFArrayRef v15 = v25;
  if (v23) {
    NSPopAutoreleasePool();
  }
LABEL_33:
  CFRelease(v17);
LABEL_34:
  CFRelease(v15);
LABEL_35:
  if (v10 && v10 != v30) {
    free(v10);
  }
  CFRelease(v6);
  if (v28) {
    CFRelease(v28);
  }
  if (v12 > 0xB) {
    return 4294963295;
  }
  else {
    return dword_1000F6908[v12];
  }
}

CFStringRef sub_1000DFBE8(CFTypeRef cf, uint64_t a2)
{
  if (!cf)
  {
    CFTypeRef v4 = *(CFTypeRef *)(a2 + 16);
    if (!v4) {
      return 0;
    }
    goto LABEL_5;
  }
  CFRetain(cf);
  CFTypeRef v4 = *(CFTypeRef *)(a2 + 16);
  if (v4)
  {
LABEL_5:
    CFRetain(v4);
    if (cf)
    {
      CFStringRef v5 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@.%@", cf, v4);
      CFRelease(cf);
    }
    else
    {
      CFStringRef v5 = 0;
    }
    goto LABEL_8;
  }
  CFStringRef v5 = 0;
  CFTypeRef v4 = cf;
LABEL_8:
  CFRelease(v4);
  return v5;
}

uint64_t sub_1000DFCA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, __CFStringTokenizer **a8)
{
  CFTypeRef cf = 0;
  CFStringRef theString = 0;
  int v12 = *(unsigned __int8 *)(*(void *)a1 + 106);
  if (*(unsigned char *)(*(void *)a1 + 106)) {
    p_CFTypeRef cf = &cf;
  }
  else {
    p_CFTypeRef cf = 0;
  }
  unint64_t v33 = 0;
  if (v12) {
    *p_CFTypeRef cf = 0;
  }
  CFArrayRef v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, unint64_t *, CFStringRef *, CFTypeRef *))(a4 + 32);
  if (v14 && (v14(a4, a2, a3, a5, *(void *)(a4 + 16), &v33, &theString, p_cf), v33 >= 0xFFFFFFFFFFFFFF01)) {
    unsigned int v15 = llroundf((float)((float)(1.0 - (float)((float)(uint64_t)(v33 + 255) / 255.0)) * 255.0) + 0.0);
  }
  else {
    unsigned int v15 = 0;
  }
  if (!theString) {
    return 0;
  }
  CFArrayRef v16 = VSGetLogDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v35 = theString;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "#DataProvider %@", buf, 0xCu);
  }
  uint64_t v17 = sub_1000E0038();
  if ((v17 - 15) > 1) {
    goto LABEL_37;
  }
  if (!a8) {
    goto LABEL_41;
  }
  __int16 v30 = a7;
  CFURLRef v18 = *a8;
  if (*a8)
  {
    CFStringRef v19 = theString;
    v36.length = CFStringGetLength(theString);
    v36.location = 0;
    CFStringTokenizerSetString(v18, v19, v36);
  }
  else
  {
    CFLocaleRef v20 = CFLocaleCopyCurrent();
    CFStringRef v21 = theString;
    v37.length = CFStringGetLength(theString);
    v37.location = 0;
    CFStringTokenizerRef v22 = CFStringTokenizerCreate(kCFAllocatorDefault, v21, v37, 0x10000uLL, v20);
    *a8 = v22;
    if (!v20)
    {
      uint64_t v23 = v22;
      if (v22) {
        goto LABEL_21;
      }
      goto LABEL_41;
    }
    CFRelease(v20);
  }
  uint64_t v23 = *a8;
  if (*a8)
  {
LABEL_21:
    CFMutableStringRef Mutable = 0;
    while (CFStringTokenizerAdvanceToNextToken(v23))
    {
      CFStringRef v25 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v23, 0x10000uLL);
      if (v25)
      {
        CFStringRef v26 = v25;
        if (CFStringGetLength(v25))
        {
          if (Mutable) {
            CFStringAppend(Mutable, @" ");
          }
          else {
            CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
          }
          CFStringAppend(Mutable, v26);
        }
        CFRelease(v26);
      }
    }
    a7 = v30;
    if (Mutable)
    {
      CFStringTransform(Mutable, 0, @"NFC; [^\\u0000-\\u00FF] NFD; [:Mn:] Remove; NFC; ", 0);
      int v27 = VSGetLogDefault();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v35 = Mutable;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#DataProvider   -ttt-> %@", buf, 0xCu);
      }
      uint64_t v17 = sub_1000E0038();
      if (!v17)
      {
        CFTypeRef v28 = *(void (**)(uint64_t, uint64_t, CFStringRef, CFMutableStringRef, void))(a2 + 608);
        if (v28) {
          v28(a2, a3, theString, Mutable, *(void *)(a2 + 656));
        }
      }
      CFRelease(theString);
      CFStringRef theString = Mutable;
    }
LABEL_37:
    if (!v17 && a7 && v15)
    {
      uint64_t v17 = 0;
      *a7 = 1;
    }
  }
LABEL_41:
  CFRelease(theString);
  if (cf) {
    CFRelease(cf);
  }
  return v17;
}

uint64_t sub_1000E0038()
{
  uint64_t v0 = __chkstk_darwin();
  CFStringRef v2 = v1;
  CFStringRef v4 = v3;
  CFStringRef v6 = v5;
  int v8 = v7;
  CFIndex v9 = (unint64_t **)v0;
  int v27 = 0;
  CFIndex Length = CFStringGetLength(v5);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x100u);
  CFIndex v12 = MaximumSizeForEncoding;
  usedBufLen[0] = MaximumSizeForEncoding;
  if (MaximumSizeForEncoding < 1024) {
    uint64_t v13 = v30;
  }
  else {
    uint64_t v13 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x56C9762AuLL);
  }
  v31.location = 0;
  v31.length = Length;
  CFStringGetBytes(v6, v31, 0x100u, 0, 0, v13, v12, usedBufLen);
  *(_WORD *)&v13[usedBufLen[0] & 0xFFFFFFFFFFFFFFFELL] = 0;
  if (v4 && CFStringGetLength(v4))
  {
    CFIndex v14 = CFStringGetLength(v4);
    CFIndex v15 = CFStringGetMaximumSizeForEncoding(v14, 0x100u);
    CFIndex v16 = v15;
    *(void *)CFTypeRef v28 = v15;
    if (v15 < 1024) {
      uint64_t v17 = (UInt8 *)usedBufLen;
    }
    else {
      uint64_t v17 = (UInt8 *)malloc_type_malloc(v15 + 1, 0x2D13EDB2uLL);
    }
    v32.location = 0;
    v32.length = v14;
    CFStringGetBytes(v4, v32, 0x100u, 0, 0, v17, v16, (CFIndex *)v28);
    *(_WORD *)&v17[*(void *)v28 & 0xFFFFFFFFFFFFFFFELL] = 0;
    if (*v9) {
      unint64_t v18 = **v9;
    }
    else {
      unint64_t v18 = 0;
    }
    int v19 = sub_10004551C(v18, v2, (char *)v13, (__int16 *)v17, -1, v8, 0, 0, &v27);
    int v20 = v27;
    CFStringRef v21 = VSGetLogDefault();
    CFStringTokenizerRef v22 = v21;
    if (!v20 || v19)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)CFTypeRef v28 = 67109120;
        *(_DWORD *)&uint8_t v28[4] = v19;
        _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "error %d activating spoken phrase; falling back to regular\n",
          v28,
          8u);
      }
      int v27 = 0;
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CFTypeRef v28 = 138412290;
      *(void *)&uint8_t v28[4] = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#DataProvider -ppp-> %@", v28, 0xCu);
    }
    if (v17 != (UInt8 *)usedBufLen) {
      free(v17);
    }
  }
  if (v27)
  {
    uint64_t v23 = 0;
  }
  else
  {
    if (*v9) {
      unint64_t v24 = **v9;
    }
    else {
      unint64_t v24 = 0;
    }
    unsigned int v25 = sub_100045270(v24, v2, (__int16 *)v13, -1, v8, 0, 0, &v27);
    if (v27 | v25) {
      uint64_t v23 = v25;
    }
    else {
      uint64_t v23 = 1;
    }
  }
  if (v13 != v30) {
    free(v13);
  }
  return v23;
}

uint64_t sub_1000E0344(uint64_t **a1, uint64_t a2, uint64_t a3)
{
  int v23 = 0;
  if (!*a1 || !**a1)
  {
LABEL_32:
    unsigned int v10 = 0;
    return dword_1000F6908[v10];
  }
  CFStringRef v4 = sub_1000DFBE8(*(CFTypeRef *)(a2 + 16), a3);
  if (!v4)
  {
    unsigned int v10 = 1;
    return dword_1000F6908[v10];
  }
  CFStringRef v5 = v4;
  CFIndex Length = CFStringGetLength(v4);
  uint64_t MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex v8 = MaximumSizeForEncoding;
  CFIndex usedBufLen = MaximumSizeForEncoding;
  if (MaximumSizeForEncoding < 1024) {
    CFIndex v9 = v24;
  }
  else {
    CFIndex v9 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x498D3EECuLL);
  }
  v25.location = 0;
  v25.length = Length;
  CFStringGetBytes(v5, v25, 0x8000100u, 0, 0, v9, v8, &usedBufLen);
  v9[usedBufLen] = 0;
  if (*a1) {
    uint64_t v11 = **a1;
  }
  else {
    uint64_t v11 = 0;
  }
  unsigned int v12 = sub_100045A28(v11, v9, &v23);
  if (v9 != v24) {
    free(v9);
  }
  if (v12 | v23) {
    unsigned int v10 = v12;
  }
  else {
    unsigned int v10 = 1;
  }
  if (!v10)
  {
    if (v23)
    {
      uint64_t v14 = 0;
      do
      {
        CFStringRef v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@#%d", v5, v14);
        CFIndex v16 = CFStringGetLength(v15);
        CFIndex usedBufLen = 0;
        uint64_t v17 = CFStringGetMaximumSizeForEncoding(v16, 0x8000100u);
        CFIndex v18 = v17;
        CFIndex usedBufLen = v17;
        if (v17 < 1024)
        {
          int v19 = v24;
        }
        else
        {
          int v19 = (UInt8 *)malloc_type_malloc(v17 + 1, 0xF3AB9F1DuLL);
          CFIndex v18 = usedBufLen;
        }
        v26.location = 0;
        v26.length = v16;
        CFStringGetBytes(v15, v26, 0x8000100u, 0, 0, v19, v18, &usedBufLen);
        v19[usedBufLen] = 0;
        if (*a1) {
          uint64_t v20 = **a1;
        }
        else {
          uint64_t v20 = 0;
        }
        int v21 = sub_100045A28(v20, v19, &v23);
        if (v19 != v24) {
          free(v19);
        }
        CFRelease(v15);
        if (v21) {
          break;
        }
        uint64_t v14 = (v14 + 1);
      }
      while (v23);
    }
    CFRelease(v5);
    goto LABEL_32;
  }
  CFRelease(v5);
  if (v10 > 0xB) {
    return 4294963295;
  }
  return dword_1000F6908[v10];
}

uint64_t sub_1000E05DC(uint64_t **a1, uint64_t a2, int a3)
{
  CFStringRef v3 = *a1;
  if (!*a1) {
    return 0;
  }
  uint64_t result = *v3;
  if (!*v3) {
    return result;
  }
  if (!a3 && !*(unsigned char *)(a2 + 648)) {
    return 0;
  }
  unsigned int v6 = sub_1000DE5B0(result, *(unsigned __int8 **)(a2 + 536));
  if (v6 == -1)
  {
    unsigned int v9 = 0;
    return dword_1000F6908[v9];
  }
  unsigned int v7 = v6;
  if (*a1) {
    uint64_t v8 = **a1;
  }
  else {
    uint64_t v8 = 0;
  }
  unsigned int v9 = sub_1000436C0(v8, v7);
  if (v9 <= 0xB) {
    return dword_1000F6908[v9];
  }
  return 4294963295;
}

uint64_t sub_1000E0670(uint64_t **a1, uint64_t a2)
{
  CFStringRef v2 = *a1;
  if (!*a1 || !*v2) {
    return 4294963293;
  }
  CFStringRef v4 = a1;
  CFStringRef v5 = *(const __CFString **)(a2 + 16);
  if (!v5)
  {
    unsigned int v6 = *(unsigned __int8 **)(a2 + 536);
    goto LABEL_8;
  }
  CFRetain(*(CFTypeRef *)(a2 + 16));
  CFStringRef v2 = *v4;
  unsigned int v6 = *(unsigned __int8 **)(a2 + 536);
  if (*v4)
  {
LABEL_8:
    uint64_t v7 = *v2;
    goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_9:
  if (sub_1000DE5B0(v7, v6) != -1)
  {
    int v9 = 0;
    goto LABEL_136;
  }
  CFArrayRef v10 = sub_1000EBD38((CFDictionaryRef *)a2);
  int v92 = 0;
  uint64_t v91 = 0;
  unsigned __int8 v90 = 0;
  if (!v10)
  {
    int v9 = 4;
    goto LABEL_136;
  }
  CFArrayRef v11 = v10;
  CFIndex Count = CFArrayGetCount(v10);
  CFArrayRef v13 = sub_1000EC768(a2, v11);
  if (!v13)
  {
    int v9 = 0;
    goto LABEL_135;
  }
  CFArrayRef v14 = v13;
  if (CFArrayGetCount(v13) != Count)
  {
    int v9 = 0;
    goto LABEL_133;
  }
  uint64_t v74 = v6;
  uint64_t v88 = a2;
  CFArrayRef v75 = v14;
  CFArrayRef theArray = v11;
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v5);
  CFStringAppend(MutableCopy, @".");
  CFIndex Length = CFStringGetLength(MutableCopy);
  uint64_t v17 = (const char **)malloc_type_malloc(8 * Count, 0x10040436913F5uLL);
  uint64_t v18 = NSPushAutoreleasePool();
  int64_t v89 = Count;
  BOOL v19 = Count < 1;
  uint64_t v84 = v17;
  if (Count < 1)
  {
    uint64_t v80 = 0;
    CFDictionaryRef theDict = 0;
    CFIndex v21 = 0;
    int v9 = 0;
LABEL_88:
    CFRelease(MutableCopy);
    CFRange v31 = 0;
    CFDictionaryRef v86 = 0;
    uint64_t v79 = v21;
    goto LABEL_89;
  }
  uint64_t v80 = 0;
  CFIndex v81 = v4;
  CFStringRef v73 = v5;
  CFMutableStringRef Mutable = 0;
  CFIndex v21 = 0;
  do
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(theArray, v21);
    CFStringRef v23 = (const __CFString *)*((void *)ValueAtIndex + 2);
    CFDictionaryRef theDict = Mutable;
    if (!v23)
    {
      int v9 = 4;
LABEL_87:
      CFStringRef v5 = v73;
      CFStringRef v4 = v81;
      goto LABEL_88;
    }
    unint64_t v24 = (uint64_t *)ValueAtIndex;
    CFRetain(v23);
    CFStringAppend(MutableCopy, v23);
    CFIndex v25 = CFStringGetLength(MutableCopy);
    *(void *)CFIndex usedBufLen = 0;
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v25, 0x8000100u);
    *(void *)CFIndex usedBufLen = MaximumSizeForEncoding;
    if (MaximumSizeForEncoding < 0) {
      int v27 = 0;
    }
    else {
      int v27 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x60379656uLL);
    }
    uint64_t v79 = v21 + 1;
    v17[v21] = (const char *)v27;
    v96.location = 0;
    v96.length = v25;
    CFStringGetBytes(MutableCopy, v96, 0x8000100u, 0, 0, v27, *(CFIndex *)usedBufLen, (CFIndex *)usedBufLen);
    v17[v21][*(void *)usedBufLen] = 0;
    v97.length = CFStringGetLength(MutableCopy) - Length;
    v97.location = Length;
    CFStringReplace(MutableCopy, v97, &stru_1000FEEA0);
    int v9 = sub_1000E1160(v81, (unsigned __int8 *)v17[v21], v24[3]);
    if (v9)
    {
      CFRelease(v23);
      BOOL v19 = 0;
      ++v21;
      goto LABEL_87;
    }
    if (!Mutable) {
      CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    }
    CFDictionarySetValue(Mutable, v24, v17[v21]);
    unint64_t v28 = v24[4];
    if (v28 >= 0xFFFFFFFFFFFFFF01)
    {
      signed int v29 = llroundf((float)((float)(1.0 - (float)((float)(uint64_t)(v28 + 255) / 255.0)) * 255.0) + 0.0);
      if (v29)
      {
        __int16 v30 = v80;
        if (!v80) {
          __int16 v30 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
        }
        uint64_t v80 = v30;
        CFDictionarySetValue(v30, v17[v21], (const void *)v29);
      }
    }
    CFRelease(v23);
    ++v21;
  }
  while (v79 < v89);
  CFDictionaryRef theDict = Mutable;
  CFRelease(MutableCopy);
  CFDictionaryRef v86 = 0;
  CFRange v31 = 0;
  CFIndex idx = 0;
  int64_t v32 = v89;
  uint64_t v33 = 127 * v89;
  int v85 = v89;
  CFStringRef v4 = v81;
  while (1)
  {
    __int16 v34 = (uint64_t *)CFArrayGetValueAtIndex(theArray, idx);
    CFStringRef v35 = CFArrayGetValueAtIndex(v75, idx);
    uint64_t v36 = (uint64_t)v35;
    CFRange v37 = (uint64_t (*)(void *, uint64_t, uint64_t *, void))v35[3];
    if (v37) {
      uint64_t v87 = v37(v35, v88, v34, v35[2]);
    }
    else {
      uint64_t v87 = 0;
    }
    BOOL v38 = (UInt8 *)v17[idx];
    int v39 = VSGetLogDefault();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)CFIndex usedBufLen = 136315138;
      *(void *)&usedBufLen[4] = v38;
      _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "#DataProvider, --- %s: \n", usedBufLen, 0xCu);
    }
    uint64_t v76 = v33;
    if (v87 >= 1)
    {
      char v40 = v33;
      uint64_t v41 = 1;
      uint64_t v83 = v36;
      while (1)
      {
        if (!v18) {
          uint64_t v18 = NSPushAutoreleasePool();
        }
        int v42 = sub_1000DFCA0((uint64_t)v4, v88, (uint64_t)v34, v36, v41 - 1, (uint64_t)v38, &v90, &v91);
        if (v42 == 1) {
          break;
        }
        int v9 = v42;
        if ((v42 - 15) > 1)
        {
          if (v42)
          {
            uint64_t v49 = VSGetLogDefault();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)CFIndex usedBufLen = 136315394;
              *(void *)&usedBufLen[4] = "_VSElvisConfigureForModel";
              __int16 v94 = 1024;
              int v95 = v9;
              _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "#Pronunciation %s: error adding last entry (%d) - continuing...\n", usedBufLen, 0x12u);
            }
            int v9 = 0;
          }
          int64_t v32 = v89;
          if (!v18) {
            goto LABEL_74;
          }
        }
        else
        {
          CFStringRef v48 = VSGetLogDefault();
          int64_t v32 = v89;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CFIndex usedBufLen = 136315138;
            *(void *)&usedBufLen[4] = "_VSElvisConfigureForModel";
            _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "#Pronunciation %s: no pronunciation for last entry - continuing...\n", usedBufLen, 0xCu);
          }
          int v9 = 0;
          if (!v18) {
            goto LABEL_74;
          }
        }
LABEL_72:
        if ((~v40 & 0x5F) == 0)
        {
          NSPopAutoreleasePool();
          uint64_t v18 = 0;
        }
LABEL_74:
        if (v41 < v87)
        {
          ++v41;
          v40 += v32;
          if (!v9) {
            continue;
          }
        }
        goto LABEL_78;
      }
      if (!v31) {
        CFRange v31 = malloc_type_calloc(v89, 8uLL, 0x100004000313F17uLL);
      }
      ++v31[idx];
      CFMutableStringRef v43 = CFStringCreateMutable(kCFAllocatorDefault, 0);
      CFStringAppendCString(v43, v84[idx], 0x8000100u);
      CFStringAppendFormat(v43, 0, @"#%ld", v31[idx]);
      CFIndex v44 = CFStringGetLength(v43);
      *(void *)CFIndex usedBufLen = 0;
      CFIndex v45 = CFStringGetMaximumSizeForEncoding(v44, 0x8000100u);
      CFIndex v46 = v45;
      *(void *)CFIndex usedBufLen = v45;
      uint64_t v47 = v18;
      if (v45 < 0)
      {
        BOOL v38 = 0;
      }
      else
      {
        BOOL v38 = (UInt8 *)malloc_type_malloc(v45 + 1, 0xF075C54CuLL);
        CFIndex v46 = *(void *)usedBufLen;
      }
      int v50 = v31;
      v98.location = 0;
      v98.length = v44;
      CFStringGetBytes(v43, v98, 0x8000100u, 0, 0, v38, v46, (CFIndex *)usedBufLen);
      v38[*(void *)usedBufLen] = 0;
      uint64_t v51 = v86;
      if (v86)
      {
        Value = (__CFArray *)CFDictionaryGetValue(v86, v34);
        if (Value)
        {
LABEL_61:
          CFDictionaryRef v86 = v51;
          CFArrayAppendValue(Value, v38);
          if (v80)
          {
            unint64_t v53 = v34[4];
            if (v53 >= 0xFFFFFFFFFFFFFF01)
            {
              signed int v54 = llroundf((float)((float)(1.0 - (float)((float)(uint64_t)(v53 + 255) / 255.0)) * 255.0) + 0.0);
              if (v54) {
                CFDictionarySetValue(v80, v38, (const void *)v54);
              }
            }
          }
          ++v85;
          CFRelease(v43);
          CFStringRef v4 = v81;
          int v55 = sub_1000E1160(v81, v38, v34[3]);
          CFRange v31 = v50;
          if (v55)
          {
            int v9 = v55;
            int64_t v32 = v89;
            uint64_t v18 = v47;
          }
          else
          {
            int v56 = sub_1000DFCA0((uint64_t)v81, v88, (uint64_t)v34, v83, v41 - 1, (uint64_t)v38, &v90, &v91);
            uint64_t v18 = v47;
            if (v56)
            {
              int v57 = v56;
              uint64_t v58 = VSGetLogDefault();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)CFIndex usedBufLen = 136315394;
                *(void *)&usedBufLen[4] = "_VSElvisConfigureForModel";
                __int16 v94 = 1024;
                int v95 = v57;
                _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "#Pronunciation %s: error adding last entry (%d) - continuing...\n", usedBufLen, 0x12u);
              }
            }
            int v9 = 0;
            int64_t v32 = v89;
          }
          uint64_t v36 = v83;
          if (!v18) {
            goto LABEL_74;
          }
          goto LABEL_72;
        }
      }
      else
      {
        uint64_t v51 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      Value = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
      CFDictionarySetValue(v51, v34, Value);
      CFRelease(Value);
      goto LABEL_61;
    }
    int v9 = 0;
LABEL_78:
    BOOL v19 = v9 == 0;
    if (++idx >= v32) {
      break;
    }
    uint64_t v33 = v76 + 1;
    uint64_t v17 = v84;
    if (v9)
    {
      LODWORD(v89) = v85;
      CFStringRef v5 = v73;
      goto LABEL_89;
    }
  }
  LODWORD(v89) = v85;
  CFStringRef v5 = v73;
  uint64_t v17 = v84;
LABEL_89:
  if (v18) {
    NSPopAutoreleasePool();
  }
  if (v19)
  {
    uint64_t v59 = *(const void **)(v88 + 568);
    CFArrayRef v60 = v59 ? (const __CFArray *)CFRetain(v59) : 0;
    uint64_t v61 = *v4 ? **v4 : 0;
    int v9 = sub_1000E13AC(v61, v74, *(void *)(v88 + 544), v60, v89, v80, v90, theDict, v86) == -1;
    if (v60) {
      CFRelease(v60);
    }
  }
  CFArrayRef v11 = theArray;
  if (v79 >= 1)
  {
    for (CFIndex i = 0; i != v79; ++i)
    {
      if (v9)
      {
        if (*v4) {
          uint64_t v63 = **v4;
        }
        else {
          uint64_t v63 = 0;
        }
        sub_100045A28(v63, (unsigned __int8 *)v17[i], &v92);
      }
      uint64_t v64 = (char *)v17[i];
      if (v64) {
        free(v64);
      }
      if (v31)
      {
        if ((uint64_t)v31[i] >= 1)
        {
          int v65 = CFArrayGetValueAtIndex(theArray, i);
          CFArrayRef v66 = (const __CFArray *)CFDictionaryGetValue(v86, v65);
          if (v66)
          {
            CFArrayRef v67 = v66;
            CFIndex v68 = CFArrayGetCount(v66);
            if (v68 >= 1)
            {
              CFIndex v69 = v68;
              for (CFIndex j = 0; j != v69; ++j)
              {
                uint64_t v71 = (unsigned __int8 *)CFArrayGetValueAtIndex(v67, j);
                if (v9)
                {
                  if (*v4) {
                    uint64_t v72 = **v4;
                  }
                  else {
                    uint64_t v72 = 0;
                  }
                  sub_100045A28(v72, v71, &v92);
                }
                if (v71) {
                  free(v71);
                }
              }
            }
          }
        }
      }
      uint64_t v17 = v84;
    }
  }
  if (v17) {
    free(v17);
  }
  CFArrayRef v14 = v75;
  if (v31) {
    free(v31);
  }
  if (v86) {
    CFRelease(v86);
  }
  if (theDict) {
    CFRelease(theDict);
  }
  if (v80) {
    CFRelease(v80);
  }
LABEL_133:
  CFRelease(v14);
  if (v91) {
    CFRelease(v91);
  }
LABEL_135:
  CFRelease(v11);
LABEL_136:
  if (v5) {
    CFRelease(v5);
  }
  return dword_1000F6908[v9];
}

uint64_t sub_1000E1160(uint64_t **a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v16 = 0;
  if (*a1) {
    uint64_t v6 = **a1;
  }
  else {
    uint64_t v6 = 0;
  }
  if (sub_100044434(v6, a2, (int *)&v16 + 1))
  {
    uint64_t v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "_VSElvisCreateClass";
      __int16 v19 = 2080;
      uint64_t v20 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Class %s already exists?\n", buf, 0x16u);
    }
    return 4;
  }
  else
  {
    if (HIDWORD(v16))
    {
      int v9 = VSGetLogDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v18 = "_VSElvisCreateClass";
        __int16 v19 = 2080;
        uint64_t v20 = a2;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s: Class %s already exists, emptying it\n", buf, 0x16u);
      }
      if (*a1) {
        uint64_t v10 = **a1;
      }
      else {
        uint64_t v10 = 0;
      }
      int v12 = sub_100045A28(v10, a2, &v16);
    }
    else
    {
      if (*a1) {
        uint64_t v11 = **a1;
      }
      else {
        uint64_t v11 = 0;
      }
      if ((unint64_t)(a3 - 4) >= 3) {
        int v13 = 2;
      }
      else {
        int v13 = 4;
      }
      int v12 = sub_100044110(v11, a2, 0, 0, v13, 0, 0, &v16);
    }
    int v14 = v12;
    if (v12 || !v16)
    {
      CFStringRef v15 = VSGetLogDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v18 = "_VSElvisCreateClass";
        __int16 v19 = 2080;
        uint64_t v20 = a2;
        __int16 v21 = 1024;
        int v22 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Could not create the empty class %s (%d)\n", buf, 0x1Cu);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
}

uint64_t sub_1000E13AC(uint64_t a1, unsigned __int8 *a2, unint64_t a3, CFArrayRef theArray, int a5, const __CFDictionary *a6, int a7, const __CFDictionary *a8, const __CFDictionary *a9)
{
  uint64_t v10 = 0xFFFFFFFFLL;
  int v169 = 1;
  unsigned int v170 = -1;
  if (!theArray) {
    return v10;
  }
  if (CFArrayGetCount(theArray) < 1) {
    return 0xFFFFFFFFLL;
  }
  int v138 = a7;
  uint64_t v139 = a2;
  int v140 = a5;
  unint64_t v141 = a3;
  CFDictionaryRef v15 = a9;
  CFAllocatorRef v16 = kCFAllocatorDefault;
  CFArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  CFArrayRef theArraya = theArray;
  CFIndex Count = CFArrayGetCount(theArray);
  int v171 = 0;
  CFArrayRef v19 = 0;
  if (Count < 1)
  {
    int v55 = 0;
    if (Mutable)
    {
LABEL_70:
      CFArrayRef v149 = v19;
      int v145 = v55;
      CFIndex v162 = CFArrayGetCount(Mutable);
      CFIndex v56 = CFArrayGetCount(Mutable);
      if (v56 < 1)
      {
        uint64_t v58 = 0;
      }
      else
      {
        CFIndex v57 = v56;
        uint64_t v58 = 0;
        for (CFIndex i = 0; i != v57; ++i)
        {
          CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(Mutable, i);
          v58 += CFArrayGetCount(ValueAtIndex);
        }
      }
      CFArrayRef v19 = v149;
      if (v149)
      {
        CFIndex v158 = CFArrayGetCount(v149);
        if (v158 < 1)
        {
          int v79 = 0;
        }
        else
        {
          for (CFIndex j = 0; j != v158; ++j)
          {
            uint64_t v63 = CFArrayGetValueAtIndex(v19, j);
            if (*((unsigned char *)v63 + 41))
            {
              if (v15 && (CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v15, v63)) != 0)
              {
                CFArrayRef v65 = Value;
                CFIndex v66 = CFArrayGetCount(Value) + 1;
                CFIndex v67 = v66 + v66 * CFArrayGetCount(v65);
                CFArrayRef v19 = v149;
                v58 += v67;
              }
              else
              {
                ++v58;
              }
            }
            else
            {
              CFIndex v68 = (const void *)*((void *)v63 + 6);
              CFRetain(v68);
              if (v68)
              {
                CFIndex v69 = CFArrayGetCount((CFArrayRef)v68);
                if (v69 >= 1)
                {
                  CFIndex v70 = v69;
                  for (CFIndex k = 0; k != v70; ++k)
                  {
                    uint64_t v72 = (CFArrayRef *)CFArrayGetValueAtIndex((CFArrayRef)v68, k);
                    CFIndex v73 = CFArrayGetCount(v72[2]);
                    uint64_t v74 = CFArrayGetValueAtIndex(v72[2], v73);
                    if (v15)
                    {
                      CFArrayRef v75 = (const __CFArray *)CFDictionaryGetValue(v15, v74);
                      if (v75) {
                        CFArrayRef v75 = (const __CFArray *)CFArrayGetCount(v75);
                      }
                      uint64_t v76 = (uint64_t)v75 + 1;
                      uint64_t v77 = CFArrayGetValueAtIndex(v72[2], 0);
                      CFIndex v78 = (CFIndex)CFDictionaryGetValue(v15, v77);
                      if (v78) {
                        CFIndex v78 = CFArrayGetCount((CFArrayRef)v78);
                      }
                    }
                    else
                    {
                      CFArrayGetValueAtIndex(v72[2], 0);
                      CFIndex v78 = 0;
                      uint64_t v76 = 1;
                    }
                    v58 += v76 + v76 * v78;
                  }
                }
                CFRelease(v68);
              }
              CFArrayRef v19 = v149;
            }
          }
          int v79 = 1;
          CFAllocatorRef v16 = kCFAllocatorDefault;
        }
      }
      else
      {
        int v79 = 0;
        CFIndex v158 = 0;
      }
      if (v141 >= 0xFFFFFFFFFFFFFF01) {
        signed int v166 = llroundf((float)((float)(1.0 - (float)((float)(uint64_t)(v141 + 255) / 255.0)) * 255.0) + 0.0);
      }
      else {
        signed int v166 = 0;
      }
      BOOL v80 = 1;
      if (!v138 && v166 <= 0)
      {
        if (a6) {
          BOOL v80 = CFDictionaryGetCount(a6) > 0;
        }
        else {
          BOOL v80 = 0;
        }
      }
      int v61 = sub_100045E74(a1, v139, v140, v58, v80, &v170);
      if (v61)
      {
        CFIndex v81 = VSGetLogDefault();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)newValues = 67109890;
          *(_DWORD *)&newValues[4] = v61;
          *(_WORD *)&newValues[8] = 2080;
          *(void *)&newValues[10] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
          *(_WORD *)&newValues[18] = 1024;
          *(_DWORD *)&newValues[20] = 840;
          LOWORD(v173[0]) = 2080;
          *(void *)((char *)v173 + 2) = "couldn't create constraint";
          _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", newValues, 0x22u);
        }
      }
      if (v170 == -1)
      {
        int v61 = 1;
        goto LABEL_213;
      }
      int v153 = v79;
      int v82 = VSGetLogDefault();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)newValues = 134218240;
        *(void *)&newValues[4] = v141;
        *(_WORD *)&newValues[12] = 1024;
        *(_DWORD *)&newValues[14] = v166;
        _os_log_debug_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "Configuring sequences with weight %ld (%d):\n", newValues, 0x12u);
      }
      if (v162 >= 1 && !v61)
      {
        CFIndex v83 = 0;
        while (1)
        {
          CFIndex v84 = v83;
          CFArrayRef v85 = (const __CFArray *)CFArrayGetValueAtIndex(Mutable, v83);
          CFIndex v86 = CFArrayGetCount(v85);
          if (v86 < 1 || v169 == 0)
          {
            uint64_t v88 = 0;
            int v61 = 0;
            BOOL v89 = 1;
          }
          else
          {
            CFIndex v90 = v86;
            CFIndex v91 = 0;
            int v92 = 0;
            while (1)
            {
              uint64_t v88 = (void *)CFArrayGetValueAtIndex(v85, v91);
              if (v91)
              {
                uint64_t v93 = VSGetLogDefault();
                if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)newValues = 0;
                  _os_log_debug_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, " -> ", newValues, 2u);
                }
              }
              else
              {
                int v92 = "_CONSTRAINT_CLASS_START";
              }
              if (!v88) {
                break;
              }
              if (v91) {
                unsigned int v94 = 0;
              }
              else {
                unsigned int v94 = v166;
              }
              if (a6) {
                v94 += CFDictionaryGetValue(a6, v88);
              }
              int v95 = VSGetLogDefault();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)newValues = 136315394;
                *(void *)&newValues[4] = v88;
                *(_WORD *)&newValues[12] = 1024;
                *(_DWORD *)&newValues[14] = v94;
                _os_log_debug_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEBUG, "%s (%d)", newValues, 0x12u);
              }
              int v96 = sub_100046128(a1, v170, v92, (char *)v88, v94, &v169);
              BOOL v89 = v96 == 0;
              if (!(v169 | v96)) {
                break;
              }
              int v61 = v96;
              if (++v91 < v90 && !v96)
              {
                int v92 = (char *)v88;
                if (v169) {
                  continue;
                }
              }
              goto LABEL_143;
            }
            BOOL v89 = 0;
            int v61 = 1;
          }
LABEL_143:
          CFRange v97 = VSGetLogDefault();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)newValues = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEBUG, "\n", newValues, 2u);
          }
          BOOL v98 = v88 && v89;
          CFArrayRef v19 = v149;
          CFAllocatorRef v16 = kCFAllocatorDefault;
          if (v98)
          {
            int v99 = sub_100046128(a1, v170, (char *)v88, "_CONSTRAINT_CLASS_END", v166, &v169);
            int v61 = v169 | v99 ? v99 : 1;
            if (v61) {
              break;
            }
          }
          CFIndex v83 = v84 + 1;
          if (v84 + 1 >= v162 || v61) {
            goto LABEL_155;
          }
        }
        uint64_t v133 = VSGetLogDefault();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)newValues = 67109890;
          *(_DWORD *)&newValues[4] = v61;
          *(_WORD *)&newValues[8] = 2080;
          *(void *)&newValues[10] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
          *(_WORD *)&newValues[18] = 1024;
          *(_DWORD *)&newValues[20] = 882;
          LOWORD(v173[0]) = 2080;
          *(void *)((char *)v173 + 2) = "couldn't add sequences to constraint";
          _os_log_error_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", newValues, 0x22u);
        }
LABEL_213:
        CFRelease(Mutable);
        int v55 = v145;
        if (!v19) {
          goto LABEL_215;
        }
        goto LABEL_214;
      }
LABEL_155:
      int v100 = v153;
      if (!v169) {
        int v100 = 0;
      }
      if (v100 != 1 || v61) {
        goto LABEL_213;
      }
      CFIndex v101 = 0;
      while (1)
      {
        uint64_t v102 = CFArrayGetValueAtIndex(v19, v101);
        CFArrayRef v154 = (CFArrayRef)v101;
        if (*((unsigned char *)v102 + 41))
        {
          if (a9 && (CFArrayRef v103 = (const __CFArray *)CFDictionaryGetValue(a9, v102)) != 0) {
            CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(v16, 0, v103);
          }
          else {
            CFMutableArrayRef MutableCopy = CFArrayCreateMutable(v16, 0, 0);
          }
          int v105 = MutableCopy;
          CFIndex v106 = CFDictionaryGetValue(a8, v102);
          CFArrayAppendValue(v105, v106);
          BOOL v107 = v105;
        }
        else
        {
          int v105 = CFArrayCreateMutable(v16, 0, 0);
          BOOL v107 = CFArrayCreateMutable(v16, 0, 0);
          if (!*((unsigned char *)v102 + 41))
          {
            int v108 = (const void *)*((void *)v102 + 6);
            CFRetain(v108);
            if (v108)
            {
              CFIndex v109 = CFArrayGetCount((CFArrayRef)v108);
              if (v109 >= 1)
              {
                CFIndex v110 = v109;
                for (CFIndex m = 0; m != v110; ++m)
                {
                  int v112 = (CFArrayRef *)CFArrayGetValueAtIndex((CFArrayRef)v108, m);
                  CFIndex v113 = CFArrayGetCount(v112[2]);
                  if (v113 >= 1)
                  {
                    uint64_t v114 = CFArrayGetValueAtIndex(v112[2], v113 - 1);
                    uint64_t v115 = CFDictionaryGetValue(a8, v114);
                    if (v115) {
                      CFArrayAppendValue(v105, v115);
                    }
                    if (a9)
                    {
                      CFArrayRef v116 = (const __CFArray *)CFDictionaryGetValue(a9, v114);
                      if (v116)
                      {
                        CFArrayRef v117 = v116;
                        v175.length = CFArrayGetCount(v116);
                        v175.locatioCFIndex n = 0;
                        CFArrayAppendArray(v105, v117, v175);
                      }
                    }
                    uint64_t v118 = CFArrayGetValueAtIndex(v112[2], 0);
                    int v119 = CFDictionaryGetValue(a8, v118);
                    if (v119) {
                      CFArrayAppendValue(v107, v119);
                    }
                    if (a9)
                    {
                      CFArrayRef v120 = (const __CFArray *)CFDictionaryGetValue(a9, v118);
                      if (v120)
                      {
                        CFArrayRef v121 = v120;
                        v176.length = CFArrayGetCount(v120);
                        v176.locatioCFIndex n = 0;
                        CFArrayAppendArray(v107, v121, v176);
                      }
                    }
                  }
                }
              }
              CFRelease(v108);
            }
          }
        }
        CFIndex v122 = CFArrayGetCount(v105);
        CFIndex v123 = CFArrayGetCount(v107);
        CFIndex v163 = v122;
        if (v122 < 1)
        {
          int v61 = 0;
          if (!v105) {
            goto LABEL_202;
          }
        }
        else
        {
          uint64_t v124 = v123;
          int v61 = 0;
          CFIndex v125 = 0;
          do
          {
            if (v124 >= 1)
            {
              for (CFIndex n = 0; n != v124; ++n)
              {
                uint64_t v127 = (char *)CFArrayGetValueAtIndex(v105, v125);
                CFNumberRef v128 = (void *)CFArrayGetValueAtIndex(v107, n);
                if (a6) {
                  unsigned int v129 = CFDictionaryGetValue(a6, v128);
                }
                else {
                  unsigned int v129 = 0;
                }
                CFStringRef v130 = VSGetLogDefault();
                if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)newValues = 136315650;
                  *(void *)&newValues[4] = v127;
                  *(_WORD *)&newValues[12] = 2080;
                  *(void *)&newValues[14] = v128;
                  *(_WORD *)&newValues[22] = 1024;
                  v173[0] = v129;
                  _os_log_debug_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEBUG, "%s -> %s (%d)\n", newValues, 0x1Cu);
                }
                int v131 = sub_100046128(a1, v170, v127, (char *)v128, v129, &v169);
                if (v169 | v131) {
                  int v61 = v131;
                }
                else {
                  int v61 = 1;
                }
                if (v61)
                {
                  uint64_t v132 = VSGetLogDefault();
                  if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)newValues = 67109890;
                    *(_DWORD *)&newValues[4] = v61;
                    *(_WORD *)&newValues[8] = 2080;
                    *(void *)&newValues[10] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
                    *(_WORD *)&newValues[18] = 1024;
                    *(_DWORD *)&newValues[20] = 956;
                    LOWORD(v173[0]) = 2080;
                    *(void *)((char *)v173 + 2) = "couldn't add modified class transition to constraint";
                    _os_log_error_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", newValues, 0x22u);
                  }
                }
              }
            }
            ++v125;
          }
          while (v125 != v163);
          if (!v105) {
            goto LABEL_202;
          }
        }
        CFRelease(v105);
LABEL_202:
        CFArrayRef v19 = v149;
        CFAllocatorRef v16 = kCFAllocatorDefault;
        if (v105 != v107) {
          CFRelease(v107);
        }
        CFIndex v101 = (CFIndex)v154 + 1;
        if ((uint64_t)v154 + 1 >= v158 || !v169 || v61) {
          goto LABEL_213;
        }
      }
    }
  }
  else
  {
    int v144 = 0;
    CFSetRef v146 = 0;
    uint64_t v20 = 0;
    theSet = 0;
    uint64_t v142 = 0;
    CFIndex v21 = 0;
    *(void *)newValues = 0;
    CFIndex v136 = Count;
    while (2)
    {
      CFIndex v161 = CFArrayGetCount(Mutable);
      CFIndex v137 = v21;
      int v22 = (CFArrayRef *)CFArrayGetValueAtIndex(theArraya, v21);
      CFIndex v23 = CFArrayGetCount(v22[2]);
      if (v20) {
        CFArrayRemoveAllValues(v20);
      }
      CFRetain(v22);
      while (1)
      {
        unsigned int v147 = CFArrayCreateMutable(v16, 0, 0);
        if (v23 >= 1)
        {
          CFIndex v24 = 0;
          while (1)
          {
            CFIndex v25 = sub_1000ED1F0((uint64_t)v22, v24, &v171);
            if (v171)
            {
              CFSetRef v26 = theSet;
              if (!v19)
              {
                CFArrayRef v19 = CFArrayCreateMutable(v16, 0, &kCFTypeArrayCallBacks);
                CFSetRef v26 = CFSetCreateMutable(v16, 0, &kCFTypeSetCallBacks);
              }
              theSet = v26;
              if (!CFSetContainsValue(v26, v25))
              {
                CFArrayAppendValue(v19, v25);
                CFSetAddValue(theSet, v25);
              }
              if (v171 == 2)
              {
                CFIndex v27 = v24;
                unint64_t v28 = (const void *)sub_1000ED058(v16, (uint64_t)v22, v24, 0);
                if (!v20) {
                  uint64_t v20 = CFArrayCreateMutable(v16, 0, &kCFTypeArrayCallBacks);
                }
                CFArrayAppendValue(v20, v28);
                CFRelease(v28);
                CFIndex v24 = v27;
              }
            }
            if (!*((unsigned char *)v25 + 41))
            {
              CFIndex v164 = v24;
              CFSetRef v29 = v146;
              if (!v146) {
                CFSetRef v29 = CFSetCreateMutable(v16, 0, &kCFTypeSetCallBacks);
              }
              __int16 v30 = v29;
              CFSetRef v146 = v29;
              if (!CFSetContainsValue(v29, v25))
              {
                CFSetAddValue(v30, v25);
                CFRange v31 = v144;
                if (!v144) {
                  CFRange v31 = CFArrayCreateMutable(v16, 0, &kCFTypeArrayCallBacks);
                }
                int v144 = v31;
                CFArrayAppendValue(v31, v25);
              }
              CFIndex v24 = v164;
              if (!*((unsigned char *)v25 + 41))
              {
                int64_t v32 = (const void *)*((void *)v25 + 6);
                CFRetain(v32);
                if (v32)
                {
                  uint64_t v156 = v23;
                  CFTypeRef cf = v22;
                  CFIndex v151 = CFArrayGetCount((CFArrayRef)v32);
                  if (v151 >= 1)
                  {
                    for (iCFIndex i = 0; ii != v151; ++ii)
                    {
                      __int16 v34 = (CFTypeRef *)CFArrayGetValueAtIndex((CFArrayRef)v32, ii);
                      CFRetain(v34[2]);
                      CFArrayRef v35 = (const __CFArray *)v34[2];
                      CFIndex v36 = CFArrayGetCount(v35);
                      if (v36 >= 1)
                      {
                        CFIndex v37 = v36;
                        BOOL v38 = CFArrayGetValueAtIndex((CFArrayRef)v34[2], 0);
                        int v39 = (void *)sub_1000ED058(kCFAllocatorDefault, (uint64_t)cf, v164, v35);
                        if (ii)
                        {
                          if (!v20) {
                            uint64_t v20 = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, theArraya);
                          }
                          CFArrayAppendValue(v20, v39);
                          CFRelease(v39);
                        }
                        else
                        {
                          CFRelease(cf);
                          uint64_t v156 = v156 + v37 - 1;
                          CFTypeRef cf = (CFArrayRef *)v39;
                          CFIndex v25 = v38;
                        }
                      }
                      CFRelease(v35);
                    }
                  }
                  CFRelease(v32);
                  CFAllocatorRef v16 = kCFAllocatorDefault;
                  int v22 = cf;
                  CFIndex v23 = v156;
                  CFIndex v24 = v164;
                }
              }
            }
            char v40 = CFDictionaryGetValue(a8, v25);
            *(void *)newValues = v40;
            if (!v40) {
              break;
            }
            CFArrayAppendValue(v147, v40);
            if (++v24 >= v23) {
              goto LABEL_40;
            }
          }
          CFRelease(v147);
          CFRelease(v22);
          CFRelease(Mutable);
          CFArrayRef Mutable = 0;
          CFDictionaryRef v15 = a9;
          goto LABEL_63;
        }
LABEL_40:
        CFArrayRef v152 = v20;
        CFArrayAppendValue(Mutable, v147);
        CFRelease(v147);
        uint64_t v41 = v142 + 1;
        CFArrayRef v148 = v19;
        if (v23 < 1)
        {
          uint64_t v50 = v142 + 1;
          CFDictionaryRef v15 = a9;
        }
        else
        {
          CFIndex v42 = 0;
          CFDictionaryRef v15 = a9;
          CFIndex v43 = v161;
          cfa = v22;
          CFIndex v157 = v23;
          do
          {
            if (v15
              && (CFIndex v44 = CFArrayGetValueAtIndex(v22[2], v42),
                  (CFArrayRef v45 = (const __CFArray *)CFDictionaryGetValue(v15, v44)) != 0)
              && (CFArrayRef v46 = v45, v47 = CFArrayGetCount(v45), v47 >= 1))
            {
              CFIndex v48 = v47;
              CFIndex v49 = 0;
              CFIndex v165 = v41 - v43;
              uint64_t v50 = v41;
              do
              {
                *(void *)newValues = CFArrayGetValueAtIndex(v46, v49);
                if (v41 > v43)
                {
                  uint64_t v51 = v50;
                  CFIndex v52 = v43;
                  do
                  {
                    CFArrayRef v53 = (const __CFArray *)CFArrayGetValueAtIndex(Mutable, v52);
                    signed int v54 = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, v53);
                    v174.locatioCFIndex n = v42;
                    v174.length = 1;
                    CFArrayReplaceValues(v54, v174, (const void **)newValues, 1);
                    CFArrayAppendValue(Mutable, v54);
                    CFRelease(v54);
                    ++v52;
                  }
                  while (v41 != v52);
                  CFIndex v43 = v161;
                  uint64_t v50 = v165 + v51;
                }
                ++v49;
              }
              while (v49 != v48);
            }
            else
            {
              uint64_t v50 = v41;
            }
            ++v42;
            uint64_t v41 = v50;
            CFDictionaryRef v15 = a9;
            int v22 = cfa;
          }
          while (v42 != v157);
        }
        uint64_t v142 = v50;
        CFRelease(v22);
        uint64_t v20 = v152;
        if (!v152) {
          break;
        }
        CFArrayRef v19 = v148;
        CFAllocatorRef v16 = kCFAllocatorDefault;
        if (CFArrayGetCount(v152) < 1) {
          goto LABEL_60;
        }
        int v22 = (CFArrayRef *)CFArrayGetValueAtIndex(v152, 0);
        CFIndex v23 = CFArrayGetCount(v22[2]);
        CFRetain(v22);
        CFArrayRemoveValueAtIndex(v152, 0);
      }
      CFArrayRef v19 = v148;
      CFAllocatorRef v16 = kCFAllocatorDefault;
LABEL_60:
      CFIndex v21 = v137 + 1;
      if (v137 + 1 != v136) {
        continue;
      }
      break;
    }
LABEL_63:
    if (theSet) {
      CFRelease(theSet);
    }
    if (v146) {
      CFRelease(v146);
    }
    if (v20) {
      CFRelease(v20);
    }
    int v55 = v144;
    if (Mutable) {
      goto LABEL_70;
    }
  }
  int v61 = 0;
  if (v19)
  {
LABEL_214:
    int v134 = v55;
    CFRelease(v19);
    int v55 = v134;
  }
LABEL_215:
  if (v55) {
    CFRelease(v55);
  }
  uint64_t v10 = v170;
  if (v61 && v170 != -1)
  {
    sub_1000436C0(a1, v170);
    return 0xFFFFFFFFLL;
  }
  return v10;
}

uint64_t sub_1000E2410(uint64_t *a1)
{
  sub_1000DF378(a1);
  CFStringRef v2 = (CFTypeRef *)*a1;
  if (*a1)
  {
    if (v2[12])
    {
      CFRelease(v2[12]);
      CFStringRef v2 = (CFTypeRef *)*a1;
    }
    if (v2[14])
    {
      CFRelease(v2[14]);
      CFStringRef v2 = (CFTypeRef *)*a1;
    }
    free(v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t sub_1000E2470(uint64_t a1, const void *a2, double a3)
{
  uint64_t v6 = (char *)malloc_type_malloc(0x78uLL, 0x10E0040AC0D3A05uLL);
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 12) = 0;
  v6[104] = 0;
  v6[105] = sub_1000DF888(*(const __CFString **)(a1 + 32));
  CFStringRef v7 = *(const __CFString **)(a1 + 32);
  if (v7) {
    LOBYTE(v7) = CFStringHasPrefix(v7, @"ja");
  }
  v6[106] = (char)v7;
  if (a2)
  {
    *((void *)v6 + 14) = CFRetain(a2);
    *(_OWORD *)(v6 + 8) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *(_OWORD *)(v6 + 72) = 0u;
    *((void *)v6 + 11) = 0;
    *(void *)a1 = v6;
    uint64_t v8 = (uint64_t **)a1;
    CFURLRef v9 = (const __CFURL *)a2;
  }
  else
  {
    *((void *)v6 + 14) = 0;
    *(_OWORD *)(v6 + 8) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *(_OWORD *)(v6 + 72) = 0u;
    *((void *)v6 + 11) = 0;
    *(void *)a1 = v6;
    uint64_t v8 = (uint64_t **)a1;
    CFURLRef v9 = 0;
  }
  return sub_1000DEF00(v8, v9, a3);
}

void sub_1000E2570(OpaqueAudioQueue *a1, int a2)
{
  int inData = a2;
  OSStatus v2 = AudioQueueSetProperty(a1, 0x61716D65u, &inData, 4u);
  if (v2)
  {
    CFStringRef v3 = sub_1000E5CB4(v2);
    CFStringRef v4 = VSGetLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = "_VSAudioQueueSetLevelMeteringPropertyValue";
      *(_DWORD *)buf = 136315650;
      if (inData) {
        CFStringRef v5 = "enabling";
      }
      else {
        CFStringRef v5 = "disabling";
      }
      __int16 v9 = 2112;
      CFStringRef v10 = v3;
      __int16 v11 = 2080;
      int v12 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s: error %@ %s level metering\n", buf, 0x20u);
    }
    CFRelease(v3);
  }
}

void sub_1000E2674(mach_port_name_t a1, int a2, const char *a3, const char *a4, UInt8 *bytes, CFIndex numBytes, const UInt8 *a7, unsigned int a8, double a9, __int16 a10, unsigned __int8 a11, unsigned char *a12)
{
  CFStringRef v19 = 0;
  uint64_t v40 = 0;
  *(_OWORD *)BOOL v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  *(_OWORD *)CFTypeRef cf = 0u;
  if (bytes
    && numBytes
    && (CFStringRef v19 = CFStringCreateWithBytes(kCFAllocatorDefault, bytes, numBytes, 0x8000100u, 0)) == 0
    || ((CFDictionaryRef v20 = (const __CFDictionary *)sub_1000E80BC()) == 0
     || (CFDictionaryRef v21 = v20, v22 = CFDictionaryContainsKey(v20, v19), CFRelease(v21), !v22))
    && CFStringCompare(v19, @"_default", 0))
  {
    int v23 = 0;
    goto LABEL_14;
  }
  pthread_mutex_lock(&stru_1001017B0);
  if (sub_1000EE0B0() || qword_100106A28 && !*(_DWORD *)qword_100106A28)
  {
    CFIndex v24 = VSGetLogDefault();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      CFIndex v42 = "server_VSRecognitionPrepareOrBegin";
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%s: recognition requested when busy\n", buf, 0xCu);
    }
  }
  else
  {
    LODWORD(v36) = 0;
    if (!a8) {
      goto LABEL_33;
    }
    CFDataRef v25 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, a7, a8, kCFAllocatorNull);
    if (v25)
    {
      CFDataRef v26 = v25;
      CFIndex v27 = (const void *)VSCFPropertyListCreateFromBinaryXMLData();
      if (v27)
      {
        unint64_t v28 = v27;
        CFTypeID v29 = CFGetTypeID(v27);
        if (v29 == CFDictionaryGetTypeID())
        {
          cf[1] = (CFTypeRef)VSRecognitionDisambiguationContextCreateFromDictionaryRepresentation();
          CFRelease(v28);
          CFRelease(v26);
LABEL_33:
          if (*a3)
          {
            CFStringRef v30 = CFStringCreateWithCString(kCFAllocatorDefault, a3, 0x8000100u);
            if (v30)
            {
              CFStringRef v31 = v30;
              v38[0] = (CFTypeRef)VSLogBundleCreateFromPath();
              CFRelease(v31);
            }
          }
          if (*a4)
          {
            CFStringRef v32 = CFStringCreateWithCString(kCFAllocatorDefault, a4, 0x8000100u);
            if (v32)
            {
              CFStringRef v33 = v32;
              v38[1] = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v32, kCFURLPOSIXPathStyle, 0);
              CFRelease(v33);
            }
          }
          __int16 v34 = VSGetLogDefault();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            CFIndex v42 = "server_VSRecognitionPrepareOrBegin";
            _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%s: allowing recognition start\n", buf, 0xCu);
          }
          DWORD2(v36) = a1;
          cf[0] = v19;
          LODWORD(v39) = a2;
          *((double *)&v39 + 1) = a9;
          LOWORD(v40) = a10;
          BYTE2(v40) = a11;
          sub_1000EF44C(a11);
          sub_1000E2A90(&v36);
          int v23 = 1;
          goto LABEL_12;
        }
        CFRelease(v28);
      }
      CFRelease(v26);
    }
    CFArrayRef v35 = VSGetLogDefault();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      CFIndex v42 = "server_VSRecognitionPrepareOrBegin";
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s: error converting disambiguation context\n", buf, 0xCu);
    }
  }
  int v23 = 0;
LABEL_12:
  pthread_mutex_unlock(&stru_1001017B0);
  if (cf[1]) {
    CFRelease(cf[1]);
  }
LABEL_14:
  if (v38[0]) {
    CFRelease(v38[0]);
  }
  if (v38[1]) {
    CFRelease(v38[1]);
  }
  if (a12) {
    *a12 = v23;
  }
  if (v19) {
    CFRelease(v19);
  }
  if (a1 - 1 <= 0xFFFFFFFD && !v23) {
    mach_port_deallocate(mach_task_self_, a1);
  }
}

void sub_1000E2A90(void *value)
{
  memset(&callBacks, 0, 40);
  CFArrayRef Mutable = (const __CFArray *)qword_100106B38;
  if (!qword_100106B38)
  {
    callBacks.info = sub_1000EDFD8;
    memset(&callBacks.retain, 0, 24);
    CFArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&callBacks);
    qword_100106B38 = (uint64_t)Mutable;
  }
  if (*(_DWORD *)value != 1) {
    goto LABEL_16;
  }
  CFIndex Count = CFArrayGetCount(Mutable);
  if (!value[1])
  {
    sub_1000EDE80(1);
    goto LABEL_16;
  }
  CFIndex v4 = Count;
  if (Count < 1)
  {
LABEL_16:
    CFArrayAppendValue((CFMutableArrayRef)qword_100106B38, value);
    if ((byte_100106A48 & 1) == 0)
    {
      CFRunLoopSourceRef v9 = (CFRunLoopSourceRef)qword_100106A30;
      if (!qword_100106A30)
      {
        *(_OWORD *)&callBacks.cancel = unk_1000FE508;
        memset(&callBacks, 0, 64);
        CFRunLoopSourceRef v9 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &callBacks);
        qword_100106A30 = (uint64_t)v9;
      }
      byte_100106A48 = 1;
      pthread_t v10 = 0;
      memset(&callBacks, 0, 64);
      pthread_attr_init((pthread_attr_t *)&callBacks);
      pthread_attr_setdetachstate((pthread_attr_t *)&callBacks, 2);
      pthread_create(&v10, (const pthread_attr_t *)&callBacks, (void *(__cdecl *)(void *))sub_1000E2CBC, v9);
      pthread_attr_destroy((pthread_attr_t *)&callBacks);
    }
    if (qword_100106A30)
    {
      if (qword_100106A38)
      {
        CFRunLoopSourceSignal((CFRunLoopSourceRef)qword_100106A30);
        CFRunLoopWakeUp((CFRunLoopRef)qword_100106A38);
      }
    }
    return;
  }
  CFIndex v5 = 0;
  while (1)
  {
    CFArrayRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100106B38, v5);
    CFStringRef v7 = (const __CFString *)ValueAtIndex[1];
    if (!v7) {
      break;
    }
    CFStringRef v8 = (const __CFString *)value[1];
    if (v8 && CFEqual(v7, v8))
    {
      if (!ValueAtIndex[2]) {
        return;
      }
      if (!value[2])
      {
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100106B38, v5);
        sub_1000EDF1C(kCFAllocatorDefault, ValueAtIndex);
        --v4;
        --v5;
      }
    }
    if (++v5 >= v4) {
      goto LABEL_16;
    }
  }
}

uint64_t sub_1000E2CBC(__CFRunLoopSource *a1)
{
  char v163 = 0;
  memset(&v144, 0, sizeof(v144));
  long long context = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  *(_OWORD *)CFTypeRef cf = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  *(_OWORD *)uint64_t v156 = 0u;
  *(_OWORD *)inAQ = 0u;
  v158[1] = 0;
  *(_OWORD *)CFTypeRef cf1 = 0u;
  *(_OWORD *)inExtAudioFile = 0u;
  *(_OWORD *)inAudioFile = 0u;
  unint64_t v162 = 0xFFFFFFFF00000000;
  LODWORD(inAQ[0]) = -1;
  v158[0] = (CFTypeRef)-1;
  Current = CFRunLoopGetCurrent();
  CFStringRef v3 = sub_1000E5848((void (__cdecl *)(void *))sub_1000E5308, &v163);
  if (v3) {
    CFRunLoopAddSource(Current, v3, kCFRunLoopDefaultMode);
  }
  if (a1) {
    CFRunLoopAddSource(Current, a1, kCFRunLoopDefaultMode);
  }
  if (v163) {
    goto LABEL_6;
  }
  int v142 = 0;
  int v143 = 0;
  CFStringRef theString = (const __CFString *)kVSServerRecognitionPreparedNotification;
  uint64_t v141 = kVSServerRecognitionErrorCodeKey;
  CFStringRef v140 = (const __CFString *)kVSServerRecognitionErrorNotification;
  CFIndex v5 = &unk_100106000;
  uint64_t v138 = kVSServerRecognitionResultsKey;
  CFStringRef v139 = (const __CFString *)kVSServerRecognitionResultsNotification;
  do
  {
    pthread_mutex_lock(&stru_1001017B0);
    if (!qword_100106A38) {
      qword_100106A38 = (uint64_t)Current;
    }
    if (!qword_100106B38 || CFArrayGetCount((CFArrayRef)qword_100106B38) <= 0)
    {
      v5[325] = 0;
      pthread_mutex_unlock(&stru_1001017B0);
LABEL_31:
      CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u);
      continue;
    }
    CFArrayRef ValueAtIndex = (char *)CFArrayGetValueAtIndex((CFArrayRef)qword_100106B38, 0);
    CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100106B38, 0);
    v5[325] = ValueAtIndex;
    pthread_mutex_unlock(&stru_1001017B0);
    if (!ValueAtIndex) {
      goto LABEL_31;
    }
    object = (void *)os_transaction_create();
    sub_1000E5930(v3, 1);
    CFIndex v136 = Current;
    if (*(_DWORD *)ValueAtIndex == 1)
    {
      CFStringRef v7 = v5;
      int v143 = *((_DWORD *)ValueAtIndex + 6);
      int v142 = getiopolicy_np(0, 1);
      setiopolicy_np(0, 1, 3);
      if (!setpriority(3, 0, 4096))
      {
        CFStringRef v8 = VSGetLogDefault();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)outPropertyData = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Running with background thread priority", outPropertyData, 2u);
        }
      }
      CFIndex v5 = v7;
      if (*(_DWORD *)ValueAtIndex)
      {
LABEL_38:
        CFRunLoopSourceRef v9 = 0;
        cf1[1] = 0;
        BYTE5(inAQ[0]) = 1;
        *(void *)((char *)&context + 4) = 0;
        inExtAudioFile[1] = 0;
        inAudioFile[0] = 0;
        CFStringRef theString1 = @"_default";
        inExtAudioFile[0] = 0;
        goto LABEL_44;
      }
    }
    else
    {
      if (*(_DWORD *)ValueAtIndex) {
        goto LABEL_38;
      }
      int v143 = *((_DWORD *)ValueAtIndex + 12);
    }
    unsigned int v10 = *((_DWORD *)ValueAtIndex + 2);
    cf1[1] = *((CFTypeRef *)ValueAtIndex + 4);
    *(_WORD *)((char *)inAQ + 5) = *(_WORD *)(ValueAtIndex + 65);
    BYTE4(inAQ[0]) = ValueAtIndex[64];
    __int16 v11 = (OpaqueExtAudioFile *)*((void *)ValueAtIndex + 5);
    inExtAudioFile[1] = v11;
    inAudioFile[1] = *((AudioFileID *)ValueAtIndex + 7);
    CFRunLoopSourceRef v9 = (const void *)*((void *)ValueAtIndex + 3);
    CFStringRef theString1 = (const __CFString *)*((void *)ValueAtIndex + 2);
    inExtAudioFile[0] = 0;
    inAudioFile[0] = 0;
    *(void *)((char *)&context + 4) = v10;
    if (v11 && AudioFileOpenURL(v11, kAudioFileReadPermission, 0x57415645u, inAudioFile))
    {
      int v12 = v5;
      int v13 = VSGetLogDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)outPropertyData = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "couldn't open audio input file for reading\n", outPropertyData, 2u);
      }
      DWORD2(context) = -4006;
      CFIndex v5 = v12;
    }
LABEL_44:
    int v131 = v9;
    ioDataSize[0] = 40;
    BOOL v15 = LODWORD(inAQ[0]) != -1 && LODWORD(inAQ[0]) == v143;
    if ((void)v146) {
      double v16 = *(double *)&v147;
    }
    else {
      double v16 = -1.0;
    }
    memset(outPropertyData, 0, 40);
    if (inAudioFile[0])
    {
      uint64_t v17 = v5;
      if (AudioFileGetProperty(inAudioFile[0], 0x64666D74u, ioDataSize, outPropertyData)) {
        double v18 = -1.0;
      }
      else {
        double v18 = *(double *)outPropertyData;
      }
    }
    else
    {
      uint64_t v17 = v5;
      if (BYTE6(inAQ[0])) {
        double v18 = 8000.0;
      }
      else {
        double v18 = -1.0;
      }
    }
    char v19 = !v15;
    if (!cf[0]) {
      char v19 = 1;
    }
    if ((v19 & 1) != 0 || (CFStringRef v20 = (const __CFString *)VSPreferencesCopySpokenLanguageIdentifier()) == 0)
    {
      if (v15) {
        goto LABEL_77;
      }
    }
    else
    {
      CFStringRef v21 = v20;
      CFComparisonResult v22 = CFStringCompare(v20, (CFStringRef)cf[0], 0);
      CFRelease(v21);
      if (v22 == kCFCompareEqualTo) {
        goto LABEL_77;
      }
    }
    if ((void)v146)
    {
      if (*((void *)&v149 + 1)) {
        (*((void (**)(long long *))&v149 + 1))(&v146);
      }
      if (cf[0]) {
        CFRelease(cf[0]);
      }
      *(void *)&long long v146 = 0;
    }
    LODWORD(inAQ[0]) = -1;
    if (cf1[0])
    {
      CFRelease(cf1[0]);
      cf1[0] = 0;
    }
    if (v156[1])
    {
      CFRelease(v156[1]);
      v156[1] = 0;
    }
LABEL_77:
    BOOL v23 = (void)v146 != 0;
    if ((void)v146)
    {
      if (!*((void *)&v153 + 1)) {
        goto LABEL_85;
      }
      int v24 = (*((uint64_t (**)(long long *, void, double))&v153 + 1))(&v146, 0, v18);
    }
    else
    {
      int v25 = sub_1000ED2DC(v143, (uint64_t)&v146);
      DWORD2(context) = v25;
      if (v25
        && (syslog(3, "Error %d at %s:%d\n", v25, "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSRecognitionServer.c", 841), DWORD2(context))|| (LODWORD(inAQ[0]) = v143, !(void)v149))
      {
LABEL_85:
        BOOL v23 = 1;
        goto LABEL_86;
      }
      v156[1] = sub_1000E5E2C(*((uint64_t *)&v147 + 1), (const __CFString *)cf[0], (uint64_t)cf[1]);
      int v24 = ((uint64_t (*)(long long *, CFTypeRef, double))v149)(&v146, v156[1], v18);
    }
    DWORD2(context) = v24;
LABEL_86:
    if (v16 != *(double *)&v147)
    {
      CFDataRef v26 = VSGetLogDefault();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "_CreateEngineIfNecessary";
        __int16 v166 = 1024;
        int v167 = (int)*(double *)&v147;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s: sample rate change (now %d Hz); invalidating queue\n",
          buf,
          0x12u);
      }
      sub_1000E4650((uint64_t)&context);
    }
    if (DWORD2(context)) {
      syslog(3, "Error %d at %s:%d\n", DWORD2(context), "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSRecognitionServer.c", 864);
    }
    if (v23)
    {
      if (*(_DWORD *)ValueAtIndex == 1)
      {
        CFStringRef v27 = theString1;
        if (!v156[1]) {
          CFStringRef v27 = 0;
        }
        CFStringRef theString1 = v27;
      }
      CFIndex v5 = v17;
    }
    else
    {
      BYTE5(inAQ[0]) = 0;
      CFIndex v5 = v17;
      if (*(_DWORD *)ValueAtIndex == 1)
      {
        if (DWORD2(context))
        {
LABEL_198:
          if (sub_1000E61F8(*((const __CFString **)ValueAtIndex + 1), *((const __CFString **)ValueAtIndex + 2), &v146, (CFURLRef *)&v156[1]))
          {
            int v61 = 0;
            LODWORD(inAQ[0]) = -1;
          }
          else
          {
            if (cf1[0]) {
              CFRelease(cf1[0]);
            }
            int v61 = 0;
            cf1[0] = sub_1000E9A68();
          }
          goto LABEL_302;
        }
LABEL_150:
        CFSetRef v53 = CFSetCreate(kCFAllocatorDefault, 0, 0, 0);
LABEL_151:
        char v54 = 0;
        if (v53) {
          goto LABEL_154;
        }
        goto LABEL_182;
      }
    }
    if (DWORD2(context)) {
      goto LABEL_186;
    }
    if (!theString1) {
      goto LABEL_150;
    }
    if (CFEqual(theString1, @"_default"))
    {
      char v54 = 1;
      CFSetRef v53 = sub_1000E9A68();
      if (v53) {
        goto LABEL_154;
      }
      goto LABEL_182;
    }
    unint64_t v28 = v131;
    if (!v131)
    {
      CFStringRef v58 = sub_1000E8DAC(theString1);
      if (v58) {
        goto LABEL_178;
      }
LABEL_182:
      uint64_t v59 = VSGetLogDefault();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)outPropertyData = 136315138;
        *(void *)&outPropertyData[4] = "_InitializeEngine";
        _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%s: no valid models could be created\n", outPropertyData, 0xCu);
      }
      int v57 = -4001;
      DWORD2(context) = -4001;
      CFIndex v5 = (void *)&unk_100106000;
LABEL_185:
      syslog(3, "Error %d at %s:%d\n", v57, "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSRecognitionServer.c", 997);
      goto LABEL_186;
    }
    ModelIdentifier = (const void *)VSRecognitionDisambiguationContextGetModelIdentifier();
    CFStringRef v30 = VSGetLogDefault();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)outPropertyData = 138412290;
      *(void *)&outPropertyData[4] = v131;
      _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%@", outPropertyData, 0xCu);
    }
    CFStringRef v31 = (CFDictionaryRef *)sub_1000E8DAC(ModelIdentifier);
    if (!v31) {
      goto LABEL_182;
    }
    uint64_t v124 = v31;
    CFMutableArrayRef v32 = sub_1000EBD38(v31);
    int v169 = 0;
    memset(outPropertyData, 0, sizeof(outPropertyData));
    if (!v32) {
      goto LABEL_181;
    }
    CFMutableArrayRef v117 = v32;
    SequenceTag = (const void *)VSRecognitionDisambiguationContextGetSequenceTag();
    if (!SequenceTag) {
      goto LABEL_180;
    }
    CFArrayRef v34 = (const __CFArray *)sub_1000EBDAC(v124[73], SequenceTag);
    if (!v34) {
      goto LABEL_180;
    }
    CFArrayRef v35 = v34;
    CFIndex Count = CFArrayGetCount(v34);
    if (Count < 1
      || (CFDictionaryRef KnownClassValues = (const __CFDictionary *)VSRecognitionDisambiguationContextGetKnownClassValues()) == 0
      || (CFDictionaryRef theDict = KnownClassValues, CFDictionaryGetCount(KnownClassValues) < 1))
    {
      CFRelease(v35);
LABEL_180:
      CFRelease(v117);
LABEL_181:
      CFRelease(v124);
      goto LABEL_182;
    }
    CFIndex v37 = 0;
    theSet = 0;
    uint64_t v127 = a1;
    uint64_t v115 = 0;
    CFArrayRef v116 = 0;
    CFArrayRef v119 = v35;
    CFArrayRef theArray = 0;
    uint64_t v118 = v3;
    do
    {
      CFIndex v125 = v37;
      CFStringRef theString1a = (CFStringRef)CFArrayGetValueAtIndex(v35, v37);
      CFIndex v38 = CFArrayGetCount((CFArrayRef)theString1a->data);
      if (v38 < 1) {
        goto LABEL_146;
      }
      CFIndex v39 = v38;
      CFTypeRef v121 = (CFTypeRef)(v38 - 1);
      CFIndex v40 = 0;
      uint64_t v41 = -1;
      CFIndex v42 = -1;
      do
      {
        CFIndex v43 = CFArrayGetValueAtIndex((CFArrayRef)theString1a->data, v40);
        CFIndex v44 = (const void *)*((void *)v43 + 2);
        if (v44)
        {
          CFRetain(*((CFTypeRef *)v43 + 2));
          CFArrayRef Value = CFDictionaryGetValue(theDict, v44);
          if (v42 == -1 && Value == 0) {
            CFIndex v42 = v40;
          }
          if (!Value) {
            uint64_t v41 = v40;
          }
          CFRelease(v44);
        }
        ++v40;
      }
      while (v39 != v40);
      if (v42 == -1)
      {
        CFStringRef v3 = v118;
        CFArrayRef v35 = v119;
        a1 = v127;
        unint64_t v28 = v131;
LABEL_146:
        CFIndex v47 = v125;
        goto LABEL_147;
      }
      unint64_t v28 = v131;
      CFArrayRef v35 = v119;
      CFIndex v47 = v125;
      if (v41 == -1 || !v42 && (CFTypeRef)v41 == v121)
      {
        CFStringRef v3 = v118;
        a1 = v127;
        goto LABEL_147;
      }
      CFRetain(theString1a->data);
      CFArrayRef theString1b = (const __CFArray *)theString1a->data;
      if (theString1b)
      {
        unint64_t v28 = v131;
        if (!theArray)
        {
          CFArrayRef theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          theSet = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
        }
        unint64_t v48 = v41 - v42;
        CFArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
        v174.locatioCFIndex n = v42;
        v174.length = v41 - v42 + 1;
        CFArrayAppendArray(Mutable, theString1b, v174);
        a1 = v127;
        if (v48 <= 0x7FFFFFFFFFFFFFFELL)
        {
          uint64_t v49 = v48 + 2;
          do
          {
            uint64_t v50 = CFArrayGetValueAtIndex(theString1b, v42);
            if (!CFSetContainsValue(theSet, v50))
            {
              CFSetAddValue(theSet, v50);
              CFArrayAppendValue(theArray, v50);
            }
            ++v42;
            --v49;
          }
          while (v49 > 1);
        }
        uint64_t v51 = (const void *)sub_1000ECF90(kCFAllocatorDefault, Mutable, 0);
        CFMutableArrayRef v52 = v116;
        CFArrayRef v35 = v119;
        if (!v116)
        {
          CFMutableArrayRef v52 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          CFArrayRef v35 = v119;
          uint64_t v115 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
        }
        CFArrayRef v116 = v52;
        CFStringRef v3 = v118;
        if (!CFSetContainsValue(v115, v51))
        {
          CFArrayAppendValue(v116, v51);
          CFSetAddValue(v115, v51);
        }
        CFRelease(theString1b);
        CFRelease(v51);
        CFRelease(Mutable);
        goto LABEL_146;
      }
      CFStringRef v3 = v118;
      a1 = v127;
      unint64_t v28 = v131;
LABEL_147:
      CFIndex v37 = v47 + 1;
    }
    while (v37 != Count);
    CFRelease(v35);
    if (v116)
    {
      *(void *)outPropertyData = sub_1000EC478;
      *(void *)&outPropertyData[8] = sub_1000EC06C;
      *(void *)&outPropertyData[16] = sub_1000EBF18;
      *(void *)&outPropertyData[24] = sub_1000EBE4C;
      *(_OWORD *)&outPropertyData[32] = 0uLL;
      int v169 = sub_1000EBDEC;
      uint64_t v88 = (const void **)malloc_type_malloc(0x18uLL, 0x20040960023A9uLL);
      void *v88 = v124;
      v88[1] = v28;
      v88[2] = 0;
      CFRetain(v124);
      CFRetain(v28);
      uint64_t v89 = sub_1000EB9D8(kCFAllocatorDefault, 0, 0, 0, theArray, v116, 0, 0, (long long *)outPropertyData, (uint64_t)v88);
      CFStringRef v58 = (const __CFString *)v89;
      if (v89) {
        *(unsigned char *)(v89 + 648) = 1;
      }
      else {
        sub_1000EBDEC(v88);
      }
      CFRelease(v116);
      CFRelease(v115);
    }
    else
    {
      CFStringRef v58 = 0;
    }
    CFRelease(v117);
    if (theArray) {
      CFRelease(theArray);
    }
    if (theSet) {
      CFRelease(theSet);
    }
    CFRelease(v124);
    if (!v58) {
      goto LABEL_182;
    }
    *(void *)buf = 0;
    CFDictionaryRef v90 = (const __CFDictionary *)sub_1000E80BC();
    *(void *)&outPropertyData[8] = 1;
    *(void *)outPropertyData = buf;
    if (!v90) {
      goto LABEL_178;
    }
    CFDictionaryRef v91 = v90;
    CFDictionaryApplyFunction(v90, (CFDictionaryApplierFunction)sub_1000E9ACC, outPropertyData);
    CFRelease(v91);
    int v92 = *(const void **)buf;
    if (!*(void *)buf) {
      goto LABEL_266;
    }
    CFMutableArrayRef MutableCopy = CFSetCreateMutableCopy(kCFAllocatorDefault, 0, *(CFSetRef *)buf);
    if (!MutableCopy)
    {
      CFRelease(v92);
LABEL_266:
      a1 = v127;
LABEL_178:
      *(void *)outPropertyData = v58;
      CFSetRef v53 = CFSetCreate(kCFAllocatorDefault, (const void **)outPropertyData, 1, &kCFTypeSetCallBacks);
      CFRelease(v58);
      goto LABEL_151;
    }
    CFSetRef v53 = MutableCopy;
    CFSetAddValue(MutableCopy, v58);
    CFRelease(v92);
    char v54 = 0;
    a1 = v127;
LABEL_154:
    CFSetRef v55 = (const __CFSet *)cf1[0];
    if (cf1[0])
    {
      if (CFEqual(cf1[0], v53))
      {
        CFRelease(v53);
        CFIndex v5 = (void *)&unk_100106000;
        goto LABEL_175;
      }
      CFSetRef v55 = (const __CFSet *)cf1[0];
    }
    char v56 = v54 ^ 1;
    if (v55) {
      char v56 = 1;
    }
    if (v56)
    {
      CFIndex v5 = (void *)&unk_100106000;
      if (v55 && CFSetGetCount(v55) >= 1)
      {
        if (*((void *)&v150 + 1)) {
          VSCFSetSendDifferences();
        }
        if ((void)v150 && !DWORD2(context)) {
          VSCFSetSendDifferences();
        }
        goto LABEL_172;
      }
LABEL_170:
      if ((void)v150) {
        CFSetApplyFunction(v53, (CFSetApplierFunction)sub_1000E526C, &context);
      }
      goto LABEL_172;
    }
    CFIndex v5 = (void *)&unk_100106000;
    if (v156[1]) {
      goto LABEL_170;
    }
    DWORD2(context) = sub_1000E61F8(0, 0, &v146, (CFURLRef *)&v156[1]);
LABEL_172:
    if (cf1[0]) {
      CFRelease(cf1[0]);
    }
    cf1[0] = v53;
LABEL_175:
    int v57 = DWORD2(context);
    if (DWORD2(context)) {
      goto LABEL_185;
    }
LABEL_186:
    if (*(_DWORD *)ValueAtIndex == 1) {
      goto LABEL_198;
    }
    if (*(_DWORD *)ValueAtIndex)
    {
      int v61 = 0;
      goto LABEL_302;
    }
    CFArrayRef v60 = CFMachPortCreateWithPort(kCFAllocatorDefault, *((_DWORD *)ValueAtIndex + 2), (CFMachPortCallBack)nullsub_16, &v144, 0);
    int v61 = v60;
    if (!v60)
    {
      uint64_t v63 = VSGetLogDefault();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)outPropertyData = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "couldn't create instance for client port - cancelling\n", outPropertyData, 2u);
      }
      goto LABEL_206;
    }
    CFMachPortSetInvalidationCallBack(v60, (CFMachPortInvalidationCallBack)sub_1000E5048);
    if (DWORD2(context)) {
      goto LABEL_207;
    }
    int v62 = ((uint64_t (*)(long long *, CFTypeRef, CFTypeRef, void))v154)(&v146, cf1[0], cf1[1], BYTE5(inAQ[0]));
    DWORD2(context) = v62;
    if (v62)
    {
      syslog(3, "Error %d at %s:%d (%s)\n", v62, "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSRecognitionServer.c", 1011, "couldn't start recognition");
      if (DWORD2(context)) {
        goto LABEL_207;
      }
    }
    if (inExtAudioFile[1]) {
      goto LABEL_246;
    }
    if (inAQ[1])
    {
      if (sub_1000EF3A8() != v158[0]) {
        sub_1000E4650((uint64_t)&context);
      }
      if (inAQ[1])
      {
        sub_1000EF44C(BYTE6(inAQ[0]));
        sub_1000EF3E8(1, 3);
        LOBYTE(v162) = 1;
        goto LABEL_236;
      }
    }
    v158[0] = sub_1000EF3A8();
    uint64_t v64 = v147;
    AudioQueueBufferRef outBuffer = 0;
    *(void *)ioDataSize = 0;
    CFArrayRef v65 = +[VSAudioSession sharedInstance];
    [v65 _safeSetCategoryForActivity:1];

    *(void *)outPropertyData = v64;
    *(_OWORD *)&outPropertyData[8] = xmmword_1000F68A0;
    *(_OWORD *)&outPropertyData[24] = xmmword_1000F68B0;
    CFIndex v66 = CFRunLoopGetCurrent();
    OSStatus v67 = AudioQueueNewInput((const AudioStreamBasicDescription *)outPropertyData, (AudioQueueInputCallback)sub_1000E4F30, &context, v66, kCFRunLoopCommonModes, 0, (AudioQueueRef *)ioDataSize);
    if (!v67)
    {
      int inData = 127;
      OSStatus v68 = AudioQueueSetProperty(*(AudioQueueRef *)ioDataSize, 0x73726371u, &inData, 4u);
      if (v68)
      {
        CFStringRef v69 = sub_1000E5CB4(v68);
        CFIndex v70 = VSGetLogDefault();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v69;
          _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "error setting SRC quality: %@\n", buf, 0xCu);
        }
        CFRelease(v69);
      }
      unint64_t v71 = 0;
      UInt32 v72 = (*(double *)outPropertyData * (float)((float)*(unsigned int *)&outPropertyData[16] * 0.05));
      do
      {
        OSStatus v67 = AudioQueueAllocateBuffer(*(AudioQueueRef *)ioDataSize, v72, &outBuffer);
        if (v67) {
          BOOL v73 = 1;
        }
        else {
          BOOL v73 = outBuffer == 0;
        }
        if (!v73) {
          OSStatus v67 = AudioQueueEnqueueBuffer(*(AudioQueueRef *)ioDataSize, outBuffer, 0, 0);
        }
        if (v71 > 4) {
          break;
        }
        ++v71;
      }
      while (!v67);
    }
    AudioQueueRef v74 = *(AudioQueueRef *)ioDataSize;
    if (*(void *)ioDataSize && v67)
    {
      AudioQueueDispose(*(AudioQueueRef *)ioDataSize, 1u);
      CFArrayRef v75 = 0;
    }
    else
    {
      pthread_mutex_lock(&stru_100101A50);
      uint64_t v76 = (__CFSet *)qword_100106B50;
      if (!qword_100106B50)
      {
        uint64_t v76 = CFSetCreateMutable(kCFAllocatorDefault, 0, 0);
        qword_100106B50 = (uint64_t)v76;
      }
      CFSetAddValue(v76, v74);
      pthread_mutex_unlock(&stru_100101A50);
      CFArrayRef v75 = *(OpaqueAudioQueue **)ioDataSize;
    }
    inAQ[1] = v75;
    OSStatus v77 = AudioQueueAddPropertyListener(v75, 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_1000E4EC8, &context);
    if (v77)
    {
      CFStringRef v78 = sub_1000E5CB4(v77);
      int v79 = VSGetLogDefault();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)outPropertyData = 138412290;
        *(void *)&outPropertyData[4] = v78;
        _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "couldn't add listener for queue running state (%@)\n", outPropertyData, 0xCu);
      }
      CFRelease(v78);
    }
    if (!inAQ[1])
    {
      uint64_t v87 = VSGetLogDefault();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)outPropertyData = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "couldn't create audio queue\n", outPropertyData, 2u);
      }
LABEL_206:
      DWORD2(context) = -4001;
      goto LABEL_207;
    }
    sub_1000EF44C(BYTE6(inAQ[0]));
    sub_1000EF3E8(1, 3);
    LOBYTE(v162) = 1;
    AudioQueueStart(inAQ[1], 0);
    AudioQueuePause(inAQ[1]);
    AudioQueueReset(inAQ[1]);
LABEL_236:
    if (*(double *)&inAudioFile[1] > 0.0) {
      sub_1000E2570(inAQ[1], 1);
    }
    sub_1000E4728(45, (int *)&v162 + 1);
    if (cf1[1])
    {
      memset(outPropertyData, 0, 40);
      uint64_t v80 = VSLogBundleCopyURLForFile();
      if (v80)
      {
        CFURLRef v81 = (const __CFURL *)v80;
        *(_DWORD *)buf = 40;
        AudioQueueGetProperty(inAQ[1], 0x61716674u, outPropertyData, (UInt32 *)buf);
        ExtAudioFileCreateWithURL(v81, 0x57415645u, (const AudioStreamBasicDescription *)outPropertyData, 0, 1u, inExtAudioFile);
        CFRelease(v81);
      }
    }
    if (v158[1])
    {
      CFNumberRef v128 = a1;
      CFIndex v82 = CFArrayGetCount((CFArrayRef)v158[1]);
      if (v82 >= 1)
      {
        CFIndex v83 = v82;
        for (CFIndex i = 0; i != v83; ++i)
        {
          CFArrayRef v85 = inAQ[1];
          CFIndex v86 = (AudioQueueBuffer *)CFArrayGetValueAtIndex((CFArrayRef)v158[1], i);
          AudioQueueEnqueueBuffer(v85, v86, 0, 0);
        }
      }
      CFArrayRemoveAllValues((CFMutableArrayRef)v158[1]);
      a1 = v128;
    }
LABEL_246:
    if (!DWORD2(context))
    {
      sub_1000E5A80(DWORD1(context), theString, 0);
      goto LABEL_209;
    }
LABEL_207:
    if (inAudioFile[0]) {
      AudioFileClose(inAudioFile[0]);
    }
LABEL_209:
    qword_100106A50 = (uint64_t)&context;
    if (BYTE4(inAQ[0])) {
      goto LABEL_268;
    }
LABEL_267:
    sub_1000E4814((uint64_t)&context);
LABEL_268:
    while (!v163 && !DWORD2(context))
    {
      int v94 = BYTE4(inAQ[0]);
      if ((BYTE4(inAQ[0]) != 1 || context != 0) && (BYTE4(inAQ[0]) || context != 1)) {
        break;
      }
      CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u);
      if (v94) {
        BOOL v97 = BYTE4(inAQ[0]) == 0;
      }
      else {
        BOOL v97 = 0;
      }
      if (v97 && context == 0) {
        goto LABEL_267;
      }
    }
    qword_100106A50 = 0;
    if (inAQ[1])
    {
      AudioQueuePause(inAQ[1]);
      AudioQueueFlush(inAQ[1]);
      AudioQueueReset(inAQ[1]);
      pthread_mutex_lock(&stru_1001017B0);
      qword_100106A40 = 0;
      pthread_mutex_unlock(&stru_1001017B0);
      sub_1000E2570(inAQ[1], 0);
      if (HIDWORD(v162) != -1) {
        sub_1000E4728(SHIDWORD(v162), 0);
      }
    }
    if ((_BYTE)v162)
    {
      sub_1000EF3E8(0, 3);
      LOBYTE(v162) = 0;
    }
    if (inAudioFile[0])
    {
      AudioFileClose(inAudioFile[0]);
      inAudioFile[0] = 0;
    }
    if ((void)v155)
    {
      int v99 = ((uint64_t (*)(long long *))v155)(&v146);
      int v100 = v99;
      if (v99) {
        syslog(3, "Error %d at %s:%d\n", v99, "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSRecognitionServer.c", 1299);
      }
      if (!DWORD2(context)) {
        DWORD2(context) = v100;
      }
    }
    if (inExtAudioFile[0])
    {
      ExtAudioFileDispose(inExtAudioFile[0]);
      inExtAudioFile[0] = 0;
    }
    CFIndex v5 = &unk_100106000;
LABEL_302:
    pthread_mutex_lock(&stru_1001017B0);
    v5[325] = 0;
    pthread_mutex_unlock(&stru_1001017B0);
    if (v61)
    {
      CFMachPortSetInvalidationCallBack(v61, 0);
      CFRelease(v61);
    }
    if (*(_DWORD *)ValueAtIndex == 1)
    {
      setiopolicy_np(0, 1, v142);
      setpriority(3, 0, 0);
      Current = v136;
    }
    else
    {
      Current = v136;
      if (!*(_DWORD *)ValueAtIndex)
      {
        unsigned int v101 = *((_DWORD *)ValueAtIndex + 2);
        unsigned int v129 = a1;
        if (!DWORD2(context) && context == 3)
        {
          if (*((void *)&v155 + 1))
          {
            CFArrayRef v102 = (const __CFArray *)(*((uint64_t (**)(long long *, CFTypeRef, CFTypeRef))&v155 + 1))(&v146, cf1[0], cf1[1]);
            CFArrayRef v103 = v102;
            if (v102)
            {
              CFIndex v104 = CFArrayGetCount(v102);
              if (v104 >= 1)
              {
                CFIndex v105 = v104;
                CFIndex v106 = VSGetLogDefault();
                if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
                {
                  BOOL v107 = VSGetLogDefault();
                  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)outPropertyData = 0;
                    _os_log_debug_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEBUG, " \nRecognition results:\n--------------------\n", outPropertyData, 2u);
                  }
                  v172.locatioCFIndex n = 0;
                  v172.length = v105;
                  CFArrayApplyFunction(v103, v172, (CFArrayApplierFunction)sub_1000E4E28, 0);
                }
                CFMutableArrayRef v108 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
                v173.locatioCFIndex n = 0;
                v173.length = v105;
                CFArrayApplyFunction(v103, v173, (CFArrayApplierFunction)sub_1000E4CD4, v108);
                *(void *)outPropertyData = v138;
                *(void *)buf = v108;
                CFDictionaryRef v109 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)outPropertyData, (const void **)buf, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
LABEL_324:
                if (!sub_1000E5A80(v101, v139, v109)
                  && (uint64_t v114 = VSGetLogDefault(), os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)))
                {
                  *(_DWORD *)outPropertyData = 136315138;
                  *(void *)&outPropertyData[4] = "_SendChoices";
                  _os_log_error_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_ERROR, "%s: error posting client completion notification\n", outPropertyData, 0xCu);
                  if (v103) {
LABEL_327:
                  }
                    CFRelease(v103);
                }
                else if (v103)
                {
                  goto LABEL_327;
                }
                if (v109) {
                  CFRelease(v109);
                }
                Current = v136;
                if (v108)
                {
                  CFMutableArrayRef v113 = v108;
LABEL_332:
                  CFRelease(v113);
                }
                goto LABEL_333;
              }
            }
          }
          else
          {
            CFArrayRef v103 = 0;
          }
          CFMutableArrayRef v108 = 0;
          CFDictionaryRef v109 = 0;
          goto LABEL_324;
        }
        *(void *)buf = -4001;
        CFIndex v110 = (AudioQueueBuffer *)CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, buf);
        AudioQueueBufferRef outBuffer = v110;
        *(void *)ioDataSize = v141;
        CFDictionaryRef v111 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)ioDataSize, (const void **)&outBuffer, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFRelease(v110);
        if (!sub_1000E5A80(v101, v140, v111))
        {
          int v112 = VSGetLogDefault();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)outPropertyData = 136315138;
            *(void *)&outPropertyData[4] = "_SendChoices";
            _os_log_error_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "%s: error posting client error notification\n", outPropertyData, 0xCu);
          }
        }
        if (v111)
        {
          CFMutableArrayRef v113 = v111;
          goto LABEL_332;
        }
LABEL_333:
        a1 = v129;
        CFIndex v5 = (void *)&unk_100106000;
        if (v156[0]) {
          ((void (*)(long long *))v156[0])(&v146);
        }
      }
    }
    sub_1000EDF1C(kCFAllocatorDefault, ValueAtIndex);
    sub_1000E5930(v3, 0);
    os_release(object);
    LODWORD(context) = 0;
  }
  while (!v163);
LABEL_6:
  if (a1) {
    CFRunLoopRemoveSource(Current, a1, kCFRunLoopDefaultMode);
  }
  if (*((void *)&v149 + 1)) {
    (*((void (**)(long long *))&v149 + 1))(&v146);
  }
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (cf1[0])
  {
    CFRelease(cf1[0]);
    cf1[0] = 0;
  }
  if (v156[1])
  {
    CFRelease(v156[1]);
    v156[1] = 0;
  }
  sub_1000E4650((uint64_t)&context);
  if (v158[1])
  {
    CFRelease(v158[1]);
    v158[1] = 0;
  }
  if (v3)
  {
    sub_1000E5A00(v3);
    CFRunLoopSourceInvalidate(v3);
    CFRelease(v3);
  }
  return 0;
}

void sub_1000E4650(uint64_t a1)
{
  OSStatus v2 = *(OpaqueAudioQueue **)(a1 + 200);
  if (v2)
  {
    sub_1000E2570(v2, 0);
    CFStringRef v3 = *(const void **)(a1 + 200);
    pthread_mutex_lock(&stru_100101A50);
    if (qword_100106B50) {
      CFSetRemoveValue((CFMutableSetRef)qword_100106B50, v3);
    }
    pthread_mutex_unlock(&stru_100101A50);
    AudioQueueRemovePropertyListener(*(AudioQueueRef *)(a1 + 200), 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_1000E4EC8, (void *)a1);
    AudioQueueStop(*(AudioQueueRef *)(a1 + 200), 1u);
    AudioQueueFlush(*(AudioQueueRef *)(a1 + 200));
    AudioQueueReset(*(AudioQueueRef *)(a1 + 200));
    AudioQueueDispose(*(AudioQueueRef *)(a1 + 200), 0);
    *(void *)(a1 + 200) = 0;
    *(void *)(a1 + 208) = -1;
    CFIndex v4 = *(__CFArray **)(a1 + 216);
    if (v4)
    {
      CFArrayRemoveAllValues(v4);
    }
  }
}

void sub_1000E4728(int a1, int *a2)
{
  CFIndex v4 = pthread_self();
  sched_param v7 = 0;
  int v6 = 0;
  if (!pthread_getschedparam(v4, &v6, &v7))
  {
    if (a2) {
      *a2 = v7.sched_priority;
    }
    v7.sched_priority = a1;
    pthread_setschedparam(v4, v6, &v7);
    CFIndex v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = a1;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "setting recognition thread priority to %d\n", buf, 8u);
    }
  }
}

void sub_1000E4814(uint64_t a1)
{
  if (!a1 || *(_DWORD *)a1 || *(_DWORD *)(a1 + 8)) {
    return;
  }
  if (!*(void *)(a1 + 256))
  {
    if (!*(void *)(a1 + 200)) {
      goto LABEL_24;
    }
    mach_absolute_time();
    CFIndex v4 = VSGetLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(outPropertyData.mSampleTime) = 136315394;
      *(void *)((char *)&outPropertyData.mSampleTime + 4) = "_BeginRecognition";
      WORD2(outPropertyData.mHostTime) = 2048;
      *(double *)((char *)&outPropertyData.mHostTime + 6) = sub_1000EF4A8();
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s: sleeping for %g s\n", (uint8_t *)&outPropertyData, 0x16u);
    }
    float v5 = sub_1000EF4A8();
    usleep((float)(v5 * 1000000.0));
    memset(&outPropertyData, 0, sizeof(outPropertyData));
    outPropertyData.mFlags = 2;
    outPropertyData.mHostTime = mach_absolute_time();
    OSStatus v6 = AudioQueueStart(*(AudioQueueRef *)(a1 + 200), &outPropertyData);
    pthread_mutex_lock(&stru_1001017B0);
    qword_100106A40 = *(void *)(a1 + 200);
    pthread_mutex_unlock(&stru_1001017B0);
    sched_param v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      mach_absolute_time();
      VSAbsoluteTimeToSecond();
      UInt32 ioDataSize = 136315394;
      CFComparisonResult v22 = "_BeginRecognition";
      __int16 v23 = 2048;
      uint64_t v24 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s: finished starting queue in %g s\n", (uint8_t *)&ioDataSize, 0x16u);
      if (v6) {
        goto LABEL_16;
      }
    }
    else if (v6)
    {
LABEL_16:
      *(_DWORD *)(a1 + 8) = -4001;
      CFStringRef v8 = sub_1000E5CB4(v6);
      int v9 = VSGetLogDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        UInt32 ioDataSize = 138412290;
        CFComparisonResult v22 = (const char *)v8;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "couldn't start audio queue for recognition (%@)\n", (uint8_t *)&ioDataSize, 0xCu);
      }
      CFRelease(v8);
      goto LABEL_24;
    }
    uint64_t v17 = VSGetLogDefault();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      UInt32 ioDataSize = 136315138;
      CFComparisonResult v22 = "_BeginRecognition";
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s: starting recognition\n", (uint8_t *)&ioDataSize, 0xCu);
    }
    *(_DWORD *)a1 = 1;
    sub_1000E5A80(*(_DWORD *)(a1 + 4), kVSServerRecognitionStartedNotification, 0);
    goto LABEL_24;
  }
  OSStatus v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(outPropertyData.mSampleTime) = 136315138;
    *(void *)((char *)&outPropertyData.mSampleTime + 4) = "_BeginRecognition";
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s: starting recognition from file\n", (uint8_t *)&outPropertyData, 0xCu);
  }
  *(_DWORD *)a1 = 1;
  sub_1000E5A80(*(_DWORD *)(a1 + 4), kVSServerRecognitionStartedNotification, 0);
  memset(&outPropertyData, 0, 40);
  UInt32 ioDataSize = 40;
  if (AudioFileGetProperty(*(AudioFileID *)(a1 + 256), 0x64666D74u, &ioDataSize, &outPropertyData))
  {
    CFStringRef v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(ioNumBytes[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "couldn't get file format description.\n", (uint8_t *)ioNumBytes, 2u);
    }
    *(_DWORD *)a1 = 3;
    *(_DWORD *)(a1 + 8) = -4001;
    goto LABEL_23;
  }
  UInt32 ioNumPackets = 400;
  ioNumBytes[0] = 400 * LODWORD(outPropertyData.mRateScalar);
  char v18 = 0;
  unsigned int v10 = malloc_type_malloc((400 * LODWORD(outPropertyData.mRateScalar)), 0x161BF4D8uLL);
  if (!v10)
  {
    *(_DWORD *)a1 = 3;
    goto LABEL_23;
  }
  __int16 v11 = v10;
  if (!*(_DWORD *)(a1 + 8))
  {
    SInt64 v13 = 0;
    do
    {
      if (*(_DWORD *)a1 == 3) {
        break;
      }
      if (AudioFileReadPacketData(*(AudioFileID *)(a1 + 256), 0, ioNumBytes, 0, v13, &ioNumPackets, v11))
      {
        *(_DWORD *)(a1 + 8) = -4001;
        break;
      }
      uint64_t v14 = ioNumPackets;
      if (ioNumPackets)
      {
        int v15 = (*(uint64_t (**)(uint64_t, void *, void, void, char *))(a1 + 152))(a1 + 16, v11, ioNumPackets, LODWORD(outPropertyData.mRateScalar), &v18);
        *(_DWORD *)(a1 + 8) = v15;
        if (v18 == 1) {
          *(_DWORD *)a1 = 3;
        }
        if (ioNumPackets > 0x18F) {
          goto LABEL_38;
        }
      }
      else
      {
        int v15 = *(_DWORD *)(a1 + 8);
      }
      *(_DWORD *)a1 = 3;
LABEL_38:
      v13 += v14;
    }
    while (!v15);
  }
  *(_DWORD *)a1 = 3;
  free(v11);
LABEL_23:
  AudioFileClose(*(AudioFileID *)(a1 + 256));
  *(void *)(a1 + 256) = 0;
LABEL_24:
  if (!*(_DWORD *)(a1 + 8))
  {
    int v12 = *(const void **)(a1 + 184);
    if (v12) {
      sub_1000E6138(v12, 1);
    }
  }
}

void sub_1000E4CD4(uint64_t a1, __CFArray *a2)
{
  ModelIdentifier = (const void *)VSRecognitionResultGetModelIdentifier();
  if (!ModelIdentifier || (CFIndex v4 = ModelIdentifier, (v5 = (CFBundleRef *)sub_1000E8C20(ModelIdentifier)) == 0))
  {
LABEL_13:
    DictionaryRepresentatioCFIndex n = (const void *)VSRecognitionResultCreateDictionaryRepresentation();
    if (!DictionaryRepresentation) {
      return;
    }
    goto LABEL_14;
  }
  uint64_t v6 = (uint64_t)v5;
  CFURLRef v7 = CFBundleCopyBundleURL(v5[10]);
  if (!v7)
  {
    CFRelease((CFTypeRef)v6);
    goto LABEL_13;
  }
  CFURLRef v8 = v7;
  pthread_mutex_lock((pthread_mutex_t *)(v6 + 16));
  CFDictionaryRef v9 = (const __CFDictionary *)sub_1000EA0BC(v6);
  pthread_mutex_unlock((pthread_mutex_t *)(v6 + 16));
  if (!v9) {
    goto LABEL_9;
  }
  CFArrayRef Value = CFDictionaryGetValue(v9, v4);
  if (!Value) {
    goto LABEL_10;
  }
  CFStringGetTypeID();
  if (VSCFDictionaryGetValueIfType()) {
    CFArrayRef Value = (const void *)VSRecognitionPluginInfoCreateString();
  }
  else {
LABEL_9:
  }
    CFArrayRef Value = 0;
LABEL_10:
  CFRelease(v8);
  CFRelease((CFTypeRef)v6);
  if (!Value) {
    goto LABEL_13;
  }
  DictionaryRepresentatioCFIndex n = (const void *)VSRecognitionResultCreateDictionaryRepresentationWithResultHandlerInfo();
  CFRelease(Value);
  if (!DictionaryRepresentation) {
    return;
  }
LABEL_14:
  CFArrayAppendValue(a2, DictionaryRepresentation);
  CFRelease(DictionaryRepresentation);
}

void sub_1000E4E28(uint64_t a1)
{
  OSStatus v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138412290;
    uint64_t v4 = a1;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t sub_1000E4EC8(_DWORD *a1, AudioQueueRef inAQ)
{
  UInt32 ioDataSize = 4;
  int outData = 0;
  uint64_t result = AudioQueueGetProperty(inAQ, 0x6171726Eu, &outData, &ioDataSize);
  if (!(result | outData) && *a1 == 1) {
    *a1 = 3;
  }
  return result;
}

void sub_1000E4F30(uint64_t a1, AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, uint64_t a4, UInt32 a5)
{
  char v18 = 0;
  memset(&v17, 0, sizeof(v17));
  if (*(_DWORD *)a1 == 1)
  {
    UInt32 mAudioDataByteSize = inBuffer->mAudioDataByteSize;
    if (!mAudioDataByteSize
      || (int v10 = (*(uint64_t (**)(uint64_t, void *const, void, void, char *))(a1 + 152))(a1 + 16, inBuffer->mAudioData, a5, mAudioDataByteSize / a5, &v18), *(_DWORD *)(a1 + 8) = v10, !inBuffer->mAudioDataByteSize)|| (!v10 ? (v11 = v18 == 0) : (v11 = 0), !v11))
    {
      *(_DWORD *)a1 = 3;
      Current = CFRunLoopGetCurrent();
      CFRunLoopStop(Current);
    }
    if (a5)
    {
      SInt64 v13 = *(OpaqueExtAudioFile **)(a1 + 240);
      if (v13)
      {
        UInt32 v14 = inBuffer->mAudioDataByteSize;
        mAudioData = inBuffer->mAudioData;
        v17.mNumberBuffers = 1;
        v17.mBuffers[0].mNumberChannels = 1;
        v17.mBuffers[0].mDataByteSize = v14;
        v17.mBuffers[0].mData = mAudioData;
        ExtAudioFileWriteAsync(v13, a5, &v17);
      }
    }
  }
  if (AudioQueueEnqueueBuffer(inAQ, inBuffer, 0, 0))
  {
    CFArrayRef Mutable = *(__CFArray **)(a1 + 216);
    if (!Mutable)
    {
      CFArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
      *(void *)(a1 + 216) = Mutable;
    }
    CFArrayAppendValue(Mutable, inBuffer);
  }
}

uint64_t sub_1000E5048(__CFMachPort *a1)
{
  OSStatus v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    uint64_t v6 = "_RecognitionClientInvalidationCallback";
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s: client died - cancelling recognition\n", (uint8_t *)&v5, 0xCu);
  }
  uint64_t Port = CFMachPortGetPort(a1);
  return sub_1000E50FC(Port);
}

uint64_t sub_1000E50FC(uint64_t result)
{
  if ((result - 1) <= 0xFFFFFFFD)
  {
    int v1 = result;
    pthread_mutex_lock(&stru_1001017B0);
    if (qword_100106A28 && !*(_DWORD *)qword_100106A28 && *(_DWORD *)(qword_100106A28 + 8) == v1)
    {
      qword_100106A28 = 0;
      if (qword_100106A30) {
        CFRunLoopSourceSignal((CFRunLoopSourceRef)qword_100106A30);
      }
      if (qword_100106A38) {
        CFRunLoopWakeUp((CFRunLoopRef)qword_100106A38);
      }
      OSStatus v2 = VSGetLogDefault();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
        return pthread_mutex_unlock(&stru_1001017B0);
      }
      int v5 = 136315138;
      uint64_t v6 = "_CancelRecognitionForMachPort";
      int v3 = "%s: client requested cancellation of active recognition\n";
    }
    else
    {
      uint64_t v4 = sub_1000EE0B0();
      if (!v4) {
        return pthread_mutex_unlock(&stru_1001017B0);
      }
      if (v4[2] != v1) {
        return pthread_mutex_unlock(&stru_1001017B0);
      }
      sub_1000EDE80(0);
      OSStatus v2 = VSGetLogDefault();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
        return pthread_mutex_unlock(&stru_1001017B0);
      }
      int v5 = 136315138;
      uint64_t v6 = "_CancelRecognitionForMachPort";
      int v3 = "%s: client requested cancellation of queued recognition\n";
    }
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, v3, (uint8_t *)&v5, 0xCu);
    return pthread_mutex_unlock(&stru_1001017B0);
  }
  return result;
}

uint64_t sub_1000E526C(uint64_t result, uint64_t a2)
{
  if (result && a2 && !*(_DWORD *)(a2 + 8))
  {
    int v3 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 80);
    if (v3)
    {
      uint64_t result = v3(a2 + 16, result);
      *(_DWORD *)(a2 + 8) = result;
    }
  }
  return result;
}

uint64_t sub_1000E52B8(uint64_t result, uint64_t a2)
{
  if (result && a2 && !*(_DWORD *)(a2 + 8))
  {
    int v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(a2 + 88);
    if (v3)
    {
      uint64_t result = v3(a2 + 16, result, 0);
      *(_DWORD *)(a2 + 8) = result;
    }
  }
  return result;
}

unsigned char *sub_1000E5308(unsigned char *result)
{
  if (result)
  {
    int v1 = result;
    pthread_mutex_lock(&stru_1001017B0);
    byte_100106A48 = 0;
    qword_100106A38 = 0;
    uint64_t result = (unsigned char *)pthread_mutex_unlock(&stru_1001017B0);
    *int v1 = 1;
  }
  return result;
}

void sub_1000E5360()
{
  if (qword_100106A50)
  {
    if (*(_DWORD *)qword_100106A50 == 1
      || (!*(_DWORD *)qword_100106A50 ? (BOOL v0 = *(unsigned char *)(qword_100106A50 + 196) == 0) : (BOOL v0 = 1), !v0))
    {
      pthread_mutex_lock(&stru_1001017B0);
      if (qword_100106A28)
      {
        if (*(_DWORD *)qword_100106A28) {
          goto LABEL_14;
        }
        if (*(unsigned char *)(qword_100106A50 + 196) != 1) {
          goto LABEL_14;
        }
        if (*(unsigned char *)(qword_100106A28 + 64)) {
          goto LABEL_14;
        }
        *(unsigned char *)(qword_100106A50 + 196) = 0;
        int v1 = VSGetLogDefault();
        if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_14;
        }
        __int16 v4 = 0;
        OSStatus v2 = "released from holding.. beginning now.\n";
        int v3 = (uint8_t *)&v4;
      }
      else
      {
        *(_DWORD *)qword_100106A50 = 2;
        int v1 = VSGetLogDefault();
        if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
        {
LABEL_14:
          pthread_mutex_unlock(&stru_1001017B0);
          return;
        }
        *(_WORD *)buf = 0;
        OSStatus v2 = "cancelling recognition\n";
        int v3 = buf;
      }
      _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, v2, v3, 2u);
      goto LABEL_14;
    }
  }
}

void sub_1000E5470(unsigned int a1, const UInt8 *a2, CFIndex numBytes, UInt8 *bytes, unsigned int a5)
{
  CFStringRef v8 = 0;
  if (a2 && numBytes) {
    CFStringRef v8 = CFStringCreateWithBytes(kCFAllocatorDefault, a2, numBytes, 0x8000100u, 0);
  }
  CFStringRef v9 = 0;
  if (bytes && a5) {
    CFStringRef v9 = CFStringCreateWithBytes(kCFAllocatorDefault, bytes, a5, 0x8000100u, 0);
  }
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  v10[0] = 1;
  v10[1] = v8;
  v10[2] = v9;
  v10[3] = a1;
  pthread_mutex_lock(&stru_1001017B0);
  sub_1000E2A90(v10);
  pthread_mutex_unlock(&stru_1001017B0);
  if (v9) {
    CFRelease(v9);
  }
  if (v8) {
    CFRelease(v8);
  }
}

uint64_t start()
{
  atomic_fetch_or(&tkqMjk4y, 0xC000u);
  int v1 = VSGetLogDefault();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.version) = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "voiced starting up...", (uint8_t *)&buf, 2u);
  }

  +[VSSiriInstrumentation instrumentVoicedProcessStartedPowerEvent];
  if ((+[VSFeatureFlags useSiriTTSServiceV2] & 1) == 0)
  {
    id v2 = objc_alloc_init((Class)VSPostInstallService);
    [v2 registerPostInstallActivity];
    int v3 = +[VSCacheDeleteService sharedService];
    unsigned __int8 v4 = [v3 registerCacheDelete];

    if ((v4 & 1) == 0)
    {
      int v5 = VSGetLogDefault();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.version) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Cannot register CacheDelete service.", (uint8_t *)&buf, 2u);
      }
    }
    xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, &stru_1000FEA60);
  }
  char v17 = 1;
  buf.versioCFIndex n = 0;
  memset(&buf.retain, 0, 56);
  buf.info = &v17;
  buf.perforCFIndex m = (void (__cdecl *)(void *))sub_1000E5838;
  qword_100106A58 = (uint64_t)CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &buf);
  MaiCFIndex n = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, (CFRunLoopSourceRef)qword_100106A58, kCFRunLoopDefaultMode);
  sub_1000ED250(0);
  sub_1000ED250(1u);
  CFURLRef v7 = +[VSAudioSession sharedInstance];
  [v7 _safeSetupAudioSession];

  CFStringRef v8 = objc_alloc_init(VSKeepAliveServer);
  [(VSKeepAliveServer *)v8 resume];
  CFStringRef v9 = objc_alloc_init(VSSpeechServer);
  [(VSSpeechServer *)v9 resume];
  Current = CFRunLoopGetCurrent();
  mach_port_t sp = 0;
  LODWORD(buf.version) = 0;
  mach_port_t v11 = mach_task_self_;
  task_get_special_port(mach_task_self_, 4, (mach_port_t *)&buf);
  if (bootstrap_check_in(buf.version, "com.apple.voiced", &sp))
  {
    if (sp - 1 <= 0xFFFFFFFD) {
      mach_port_deallocate(v11, sp);
    }
    goto LABEL_14;
  }
  long long v12 = (__CFRunLoopSource *)CPCreateMIGServerSource();
  if (!v12)
  {
LABEL_14:
    uint64_t v15 = 1;
    goto LABEL_15;
  }
  uint64_t v13 = v12;
  CFRunLoopAddSource(Current, v12, kCFRunLoopDefaultMode);
  CFRelease(v13);
  UInt32 v14 = +[NSRunLoop currentRunLoop];
  [v14 run];

  uint64_t v15 = 0;
LABEL_15:

  return v15;
}

unsigned char *sub_1000E5838(unsigned char *result)
{
  if (result) {
    *uint64_t result = 1;
  }
  return result;
}

CFRunLoopSourceRef sub_1000E5848(void (__cdecl *a1)(void *), void *a2)
{
  v7.versioCFIndex n = 0;
  memset(&v7.retain, 0, 56);
  v7.info = a2;
  v7.perforCFIndex m = a1;
  CFRunLoopSourceRef v2 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &v7);
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  pthread_mutex_lock(&stru_1001017F0);
  CFArrayRef Mutable = (__CFSet *)qword_100106A60;
  if (!qword_100106A60)
  {
    CFArrayRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    qword_100106A60 = (uint64_t)Mutable;
  }
  CFSetAddValue(Mutable, v2);
  int v5 = (__CFDictionary *)qword_100106A68;
  if (!qword_100106A68)
  {
    int v5 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    qword_100106A68 = (uint64_t)v5;
  }
  CFDictionarySetValue(v5, v2, Current);
  pthread_mutex_unlock(&stru_1001017F0);
  return v2;
}

uint64_t sub_1000E5930(const void *a1, int a2)
{
  pthread_mutex_lock(&stru_1001017F0);
  CFArrayRef Mutable = (__CFSet *)qword_100106A70;
  if (a2)
  {
    if (!qword_100106A70)
    {
      CFArrayRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
      qword_100106A70 = (uint64_t)Mutable;
    }
    CFSetAddValue(Mutable, a1);
  }
  else if (qword_100106A70)
  {
    CFIndex Count = CFSetGetCount((CFSetRef)qword_100106A70);
    CFSetRemoveValue((CFMutableSetRef)qword_100106A70, a1);
    if (Count >= 1 && !CFSetGetCount((CFSetRef)qword_100106A70) && qword_100106A58)
    {
      CFRunLoopSourceSignal((CFRunLoopSourceRef)qword_100106A58);
      MaiCFIndex n = CFRunLoopGetMain();
      CFRunLoopWakeUp(Main);
    }
  }
  return pthread_mutex_unlock(&stru_1001017F0);
}

uint64_t sub_1000E5A00(const void *a1)
{
  pthread_mutex_lock(&stru_1001017F0);
  if (qword_100106A60) {
    CFSetRemoveValue((CFMutableSetRef)qword_100106A60, a1);
  }
  if (qword_100106A70) {
    CFSetRemoveValue((CFMutableSetRef)qword_100106A70, a1);
  }
  if (qword_100106A68) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100106A68, a1);
  }
  return pthread_mutex_unlock(&stru_1001017F0);
}

BOOL sub_1000E5A80(unsigned int a1, CFStringRef theString, const __CFDictionary *a3)
{
  if (!theString) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(theString);
  CFIndex usedBufLen = Length;
  if (!Length) {
    return 0;
  }
  CFIndex v7 = Length;
  if ((unint64_t)CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) > 0x3FF) {
    return 0;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
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
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v22 = 0u;
  v53.locatioCFIndex n = 0;
  v53.length = v7;
  CFStringGetBytes(theString, v53, 0x8000100u, 0, 0, buffer, 1023, &usedBufLen);
  buffer[usedBufLen] = 0;
  if (a3
    && CFDictionaryGetCount(a3)
    && (CFDataRef BinaryXMLData = (const __CFData *)VSCFPropertyListCreateBinaryXMLData()) != 0)
  {
    CFDataRef v11 = BinaryXMLData;
    BytePtr = CFDataGetBytePtr(BinaryXMLData);
    int v13 = CFDataGetLength(v11);
    int v14 = sub_1000F211C(a1, (const char *)buffer, (uint64_t)BytePtr, v13);
    CFRelease(v11);
  }
  else
  {
    int v14 = sub_1000F211C(a1, (const char *)buffer, 0, 0);
  }
  BOOL v8 = v14 == 0;
  uint64_t v15 = VSGetLogDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)CFRunLoopSourceContext buf = 136315394;
    char v18 = "VSClientPostNotification";
    __int16 v19 = 2080;
    CFStringRef v20 = buffer;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s: posted %s to client\n", buf, 0x16u);
  }
  return v8;
}

CFStringRef sub_1000E5CB4(unsigned int a1)
{
  int v2 = bswap32(a1);
  int v8 = v2;
  if ((v2 & 0x80) != 0)
  {
    if (!__maskrune((char)v2, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((_DefaultRuneLocale.__runetype[(char)v2] & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  __darwin_ct_rune_t v3 = (__int16)v2 >> 8;
  if ((v2 & 0x8000) != 0)
  {
    if (!__maskrune(v3, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((_DefaultRuneLocale.__runetype[v3] & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  __darwin_ct_rune_t v4 = v2 << 8 >> 24;
  if ((v2 & 0x800000) != 0)
  {
    if (!__maskrune(v4, 0x40000uLL)) {
      goto LABEL_17;
    }
LABEL_13:
    __darwin_ct_rune_t v5 = v2 >> 24;
    if (v2 < 0)
    {
      if (!__maskrune(v5, 0x40000uLL)) {
        goto LABEL_17;
      }
    }
    else if ((_DefaultRuneLocale.__runetype[v5] & 0x40000) == 0)
    {
      goto LABEL_17;
    }
    __int16 v9 = 39;
    char __str = 39;
    return CFStringCreateWithCString(0, &__str, 0x600u);
  }
  if ((_DefaultRuneLocale.__runetype[v4] & 0x40000) != 0) {
    goto LABEL_13;
  }
LABEL_17:
  if (a1 + 199999 > 0x61A7E) {
    snprintf(&__str, 0x10uLL, "0x%x");
  }
  else {
    snprintf(&__str, 0x10uLL, "%d");
  }
  return CFStringCreateWithCString(0, &__str, 0x600u);
}

CFURLRef sub_1000E5E2C(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  CFURLRef v5 = sub_1000E6064(a1);
  if (v5)
  {
    uint64_t valuePtr = 0;
    int v6 = VSDirectoryExistsAtURL();
    CFURLRef v7 = 0;
    if (!a2) {
      goto LABEL_20;
    }
    if (!v6) {
      goto LABEL_20;
    }
    CFURLRef v7 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v5, @"Info.plist", 0);
    if (!v7) {
      goto LABEL_20;
    }
    int v8 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v7);
    if (v8)
    {
      __int16 v9 = v8;
      if (CFReadStreamOpen(v8))
      {
        CFURLRef v10 = (const __CFURL *)CFPropertyListCreateWithStream(kCFAllocatorDefault, v9, 0, 0, 0, 0);
        CFURLRef v11 = v10;
        if (v10)
        {
          CFTypeID v12 = CFGetTypeID(v10);
          if (v12 != CFDictionaryGetTypeID())
          {
            CFRelease(v11);
            CFURLRef v11 = 0;
          }
        }
        CFReadStreamClose(v9);
      }
      else
      {
        CFURLRef v11 = 0;
      }
      CFRelease(v9);
      CFRelease(v7);
      if (!v11) {
        goto LABEL_19;
      }
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v11, @"VSLocaleIdentifier");
      if (Value)
      {
        CFStringRef v15 = Value;
        CFTypeID v16 = CFGetTypeID(Value);
        if (v16 == CFStringGetTypeID() && CFEqual(v15, a2))
        {
          CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(v11, @"VSVersion");
          if (v18)
          {
            CFNumberRef v19 = v18;
            CFTypeID v20 = CFGetTypeID(v18);
            if (v20 == CFNumberGetTypeID())
            {
              CFNumberGetValue(v19, kCFNumberCFIndexType, &valuePtr);
              if (valuePtr == a3)
              {
                CFStringRef v21 = CFDictionaryGetValue(v11, @"VSPluginVersions");
                if (v21)
                {
                  long long v22 = v21;
                  CFTypeID v23 = CFGetTypeID(v21);
                  if (v23 == CFDictionaryGetTypeID())
                  {
                    long long v24 = (const void *)sub_1000E9D34();
                    if (!v24)
                    {
                      CFURLRef v7 = v5;
                      goto LABEL_21;
                    }
                    long long v25 = v24;
                    int v26 = CFEqual(v24, v22);
                    CFRelease(v25);
                    CFRelease(v11);
                    if (v26) {
                      return v5;
                    }
                    goto LABEL_19;
                  }
                }
              }
            }
          }
        }
      }
      CFURLRef v13 = v11;
    }
    else
    {
      CFURLRef v13 = v7;
    }
    CFRelease(v13);
LABEL_19:
    CFURLRef v7 = 0;
LABEL_20:
    CFURLRef v11 = v5;
LABEL_21:
    CFRelease(v11);
    return v7;
  }
  return v5;
}

CFURLRef sub_1000E6064(uint64_t a1)
{
  pthread_once(&stru_1001018C0, sub_1000E9D84);
  if (!a1) {
    return 0;
  }
  CFURLRef v2 = (const __CFURL *)qword_100106AA0;
  if (!qword_100106AA0) {
    return 0;
  }
  CFStringRef v3 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@%@", a1, @".vscache");
  CFURLRef v4 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v2, v3, 1u);
  CFRelease(v3);
  return v4;
}

uint64_t sub_1000E611C()
{
  return pthread_key_create((pthread_key_t *)&qword_100106A80, (void (__cdecl *)(void *))&_CFRelease);
}

uint64_t sub_1000E6138(const void *a1, int a2)
{
  pthread_mutex_lock(&stru_100101830);
  if (a2 != 1 || qword_100106A78)
  {
    if (a2 || !qword_100106A78) {
      goto LABEL_11;
    }
    sub_1000ED55C(qword_100106A78);
    CFRelease((CFTypeRef)qword_100106A78);
LABEL_10:
    qword_100106A78 = 0;
    goto LABEL_11;
  }
  if (!a1) {
    goto LABEL_10;
  }
  CFAllocatorRef v4 = CFGetAllocator(a1);
  uint64_t v5 = sub_1000ED3EC(v4, (const __CFURL *)a1);
  qword_100106A78 = v5;
  if (v5)
  {
    int v6 = (const void *)sub_1000EDD34(v5, @"x", @"xx", @"xxx");
    if (v6) {
      CFRelease(v6);
    }
  }
LABEL_11:
  return pthread_mutex_unlock(&stru_100101830);
}

uint64_t sub_1000E61F8(const __CFString *a1, const __CFString *a2, void *a3, CFURLRef *a4)
{
  CFTypeRef cf = 0;
  uint64_t v139 = 0;
  long long v137 = 0u;
  long long v138 = 0u;
  CFURLRef v7 = *a4;
  int v8 = VSGetLogDefault();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v132 = 0;
    CFURLRef v13 = 0;
    goto LABEL_17;
  }
  mach_absolute_time();
  if (a1)
  {
    CFIndex Length = CFStringGetLength(a1);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    CFIndex v11 = MaximumSizeForEncoding;
    *(void *)long long context = MaximumSizeForEncoding;
    if (MaximumSizeForEncoding < 256) {
      CFTypeID v12 = v143;
    }
    else {
      CFTypeID v12 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0xE7343957uLL);
    }
    v151.locatioCFIndex n = 0;
    v151.length = Length;
    CFStringGetBytes(a1, v151, 0x8000100u, 0, 0, v12, v11, (CFIndex *)context);
    v12[*(void *)context] = 0;
    uint64_t v132 = v12;
    if (a2) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v132 = 0;
    CFTypeID v12 = (UInt8 *)"all";
    if (a2)
    {
LABEL_10:
      CFIndex v16 = CFStringGetLength(a2);
      *(void *)long long context = 0;
      CFIndex v17 = CFStringGetMaximumSizeForEncoding(v16, 0x8000100u);
      CFIndex v18 = v17;
      *(void *)long long context = v17;
      if (v17 < 256)
      {
        CFStringRef v15 = v142;
      }
      else
      {
        CFStringRef v15 = (UInt8 *)malloc_type_malloc(v17 + 1, 0x83366F45uLL);
        CFIndex v18 = *(void *)context;
      }
      CFStringRef v14 = a1;
      v152.locatioCFIndex n = 0;
      v152.length = v16;
      CFStringGetBytes(a2, v152, 0x8000100u, 0, 0, v15, v18, (CFIndex *)context);
      v15[*(void *)context] = 0;
      CFURLRef v13 = v15;
      goto LABEL_14;
    }
  }
  CFStringRef v14 = a1;
  CFURLRef v13 = 0;
  CFStringRef v15 = (UInt8 *)"all";
LABEL_14:
  CFNumberRef v19 = VSGetLogDefault();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long context = 136315394;
    *(void *)&context[4] = v12;
    __int16 v147 = 2080;
    *(void *)CFArrayRef v148 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "caching model <%s> class <%s> ...\n", context, 0x16u);
  }
  a1 = v14;
LABEL_17:
  NSPushAutoreleasePool();
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFStringRef v136 = a2;
  if (v7)
  {
    uint64_t v21 = sub_1000ED3EC(kCFAllocatorDefault, v7);
    if (v21)
    {
      long long v22 = (void *)v21;
      *(void *)long long context = 0;
      CFTypeID v23 = (pthread_mutex_t *)(v21 + 16);
      pthread_mutex_lock((pthread_mutex_t *)(v21 + 16));
      if (v22[10] && CPRecordStoreGetDatabase() && CPSqliteDatabaseStatementForReading())
      {
        CPSqliteStatementSendResults();
        CPSqliteStatementReset();
      }
      pthread_mutex_unlock(v23);
      long long v24 = *(const void **)context;
      if (*(void *)context)
      {
        CFDictionaryApplyFunction(*(CFDictionaryRef *)context, (CFDictionaryApplierFunction)sub_1000E8050, Mutable);
        CFRelease(v24);
      }
      CFRelease(v22);
    }
    if (a3) {
      goto LABEL_27;
    }
LABEL_38:
    uint64_t v36 = 0;
    CFDictionaryRef v37 = 0;
    if (!Mutable) {
      goto LABEL_110;
    }
    goto LABEL_109;
  }
  long long v35 = VSGetLogDefault();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long context = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "no valid cache found; recaching everything.\n",
      context,
      2u);
  }
  a1 = 0;
  if (!a3) {
    goto LABEL_38;
  }
LABEL_27:
  CFStringRef theString = a1;
  if (!a1)
  {
    CFDictionaryRef v27 = 0;
    long long v34 = 0;
    int v26 = 0;
    goto LABEL_53;
  }
  long long v25 = (__CFString *)sub_1000E8DAC(a1);
  if (!v25)
  {
    CFDictionaryRef v37 = 0;
    BOOL v40 = 0;
    unsigned int v135 = -4006;
    goto LABEL_77;
  }
  int v26 = v25;
  CFDictionaryRef v27 = sub_1000ECA40(v25);
  if (CFDictionaryContainsKey(Mutable, v26))
  {
    long long v28 = CFDictionaryGetValue(Mutable, v26);
    data = v26[19].data;
    if (data)
    {
      if (((unsigned int (*)(__CFString *, const void *, char *))data)(v26, v28, v26[20].data))
      {
        long long v30 = VSGetLogDefault();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v101 = v26[16].length;
          *(_DWORD *)long long context = 136315138;
          *(void *)&context[4] = v101;
          _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "cache for model <%s> is valid; skipping recache request.\n",
            context,
            0xCu);
        }
        LODWORD(v31) = 0;
        CFMutableDictionaryRef v32 = 0;
        BOOL v33 = 0;
        long long v34 = 0;
        goto LABEL_68;
      }
    }
  }
  if (!a2)
  {
    long long v41 = (void (*)(void *, __CFString *, uint64_t))a3[9];
    if (v41)
    {
      v41(a3, v26, 1);
      CFDictionaryRemoveValue(Mutable, v26);
    }
    long long v34 = 0;
    goto LABEL_52;
  }
  long long v34 = sub_1000EBDAC((const __CFDictionary *)v26[17].data, a2);
  if (!v34)
  {
    CFMutableDictionaryRef v32 = 0;
    BOOL v33 = 1;
    LODWORD(v31) = -4006;
    goto LABEL_68;
  }
  if (!a3[9]) {
    goto LABEL_53;
  }
  if (!CFDictionaryContainsKey(Mutable, v26))
  {
LABEL_52:
    CFStringRef v136 = 0;
    goto LABEL_53;
  }
  long long v38 = (uint64_t (*)(void *, __CFString *))a3[8];
  if (v38)
  {
    int v39 = v38(a3, v26);
    if (v39)
    {
      LODWORD(v31) = v39;
      CFMutableDictionaryRef v32 = 0;
      BOOL v33 = 1;
LABEL_68:
      CFRelease(v26);
      goto LABEL_69;
    }
    CFDictionarySetValue(Mutable, v26, v27);
  }
  int v99 = (void (*)(void *, __CFString *, const void *))a3[10];
  if (v99) {
    v99(a3, v26, v34);
  }
LABEL_53:
  CFMutableDictionaryRef v32 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  sub_1000E74E8(v32);
  if (!a1)
  {
    *(void *)long long context = 0;
    CFDictionaryRef v47 = (const __CFDictionary *)sub_1000E80BC();
    CFDictionaryRef v31 = v47;
    if (v47)
    {
      CFDictionaryApplyFunction(v47, (CFDictionaryApplierFunction)sub_1000E9B9C, context);
      CFRelease(v31);
      CFDictionaryRef v31 = *(const __CFDictionary **)context;
      if (*(void *)context)
      {
        *(void *)&long long v137 = a3;
        *((void *)&v137 + 1) = Mutable;
        *(void *)&long long v138 = 0;
        *((void *)&v138 + 1) = v7;
        LOBYTE(v139) = 0;
        HIDWORD(v139) = 0;
        CFSetApplyFunction(*(CFSetRef *)context, (CFSetApplierFunction)sub_1000E7DE8, &v137);
        BOOL v33 = (_BYTE)v139 != 0;
        CFTypeRef cf = (CFTypeRef)v138;
        CFDictionaryRef v48 = v31;
        LODWORD(v31) = HIDWORD(v139);
        CFRelease(v48);
        goto LABEL_67;
      }
    }
    goto LABEL_66;
  }
  if (v136)
  {
    long long v42 = (uint64_t (*)(void *, __CFString *, const void *))a3[11];
    if (v42)
    {
      LODWORD(v31) = v42(a3, v26, v34);
      if (!v31)
      {
        CFDictionarySetValue(Mutable, v26, v27);
        uint64_t v43 = (uint64_t)a3;
        CFURLRef v44 = v7;
        uint64_t v45 = (uint64_t)v26;
        long long v46 = v34;
LABEL_64:
        sub_1000E757C((uint64_t *)&cf, v43, v44, v45, v46);
        goto LABEL_66;
      }
      goto LABEL_66;
    }
LABEL_65:
    LODWORD(v31) = -4009;
    goto LABEL_66;
  }
  long long v49 = (uint64_t (*)(void *, __CFString *))a3[8];
  if (!v49) {
    goto LABEL_65;
  }
  LODWORD(v31) = v49(a3, v26);
  if (!v31)
  {
    CFDictionarySetValue(Mutable, v26, v27);
    uint64_t v43 = (uint64_t)a3;
    CFURLRef v44 = v7;
    uint64_t v45 = (uint64_t)v26;
    long long v46 = 0;
    goto LABEL_64;
  }
LABEL_66:
  BOOL v33 = 1;
LABEL_67:
  sub_1000E74E8(0);
  if (v26) {
    goto LABEL_68;
  }
LABEL_69:
  if (v34) {
    CFRelease(v34);
  }
  if (v27) {
    CFRelease(v27);
  }
  unsigned int v135 = v31;
  if (v31) {
    BOOL v40 = 0;
  }
  else {
    BOOL v40 = v33;
  }
  CFDictionaryRef v37 = v32;
LABEL_77:
  long long v50 = VSGetLogDefault();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    mach_absolute_time();
    long long v51 = VSGetLogDefault();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      VSAbsoluteTimeToSecond();
      CFStringRef v78 = "all";
      *(_DWORD *)long long context = 134218754;
      *(void *)&context[4] = v79;
      uint64_t v80 = (const char *)v132;
      if (!theString) {
        uint64_t v80 = "all";
      }
      __int16 v147 = 1024;
      if (v136) {
        CFStringRef v78 = (const char *)v13;
      }
      *(_DWORD *)CFArrayRef v148 = v135;
      *(_WORD *)&v148[4] = 2080;
      *(void *)&v148[6] = v80;
      __int16 v149 = 2080;
      long long v150 = v78;
      _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "... finished caching model in %g s with error %d <%s> class <%s>\n", context, 0x26u);
    }
    if (theString && v132 && v132 != v143) {
      free(v132);
    }
    if (v136 && v13 && v13 != v142) {
      free(v13);
    }
  }
  NSPopAutoreleasePool();
  if (!v40)
  {
    uint64_t v36 = v135;
    goto LABEL_108;
  }
  CFTypeRef v52 = cf;
  CFRange v53 = (void *)a3[4];
  pthread_once(&stru_1001018C0, sub_1000E9D84);
  uint64_t v54 = qword_100106AA0;
  CFURLRef url = 0;
  pthread_once(&stru_1001018C0, sub_1000E9D84);
  if (qword_100106AA0)
  {
    CFArrayRef v55 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL();
    if (v55)
    {
      CFArrayRef v56 = v55;
      CFDictionaryRef v124 = v37;
      value = v53;
      uint64_t v133 = Mutable;
      CFIndex Count = CFArrayGetCount(v55);
      if (Count >= 1)
      {
        CFIndex v58 = Count;
        for (CFIndex i = 0; i != v58; ++i)
        {
          CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v56, i);
          CFStringRef PathComponent = CFURLCopyLastPathComponent(ValueAtIndex);
          if (PathComponent)
          {
            CFStringRef v62 = PathComponent;
            CFIndex v63 = CFStringGetLength(PathComponent);
            if (v63 == CFStringGetLength(@"temp.vscache.XXXXX") && CFStringHasPrefix(v62, @"temp.vscache."))
            {
              VSCFURLDeleteDirectoryContents();
              VSDeleteItemAtURL();
            }
            CFRelease(v62);
          }
        }
      }
      CFRelease(v56);
      CFMutableDictionaryRef Mutable = v133;
      CFDictionaryRef v37 = v124;
      CFRange v53 = value;
    }
  }
  if (!v54 || !VSCreateTemporaryDirectory())
  {
    CFIndex v66 = VSGetLogDefault();
    uint64_t v36 = v135;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long context = 136315138;
      *(void *)&context[4] = "_SaveEngineToCache";
      _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%s: couldn't save cache; no base dir exists or couldn't create temp cache\n",
        context,
        0xCu);
      if (!Mutable) {
        goto LABEL_110;
      }
LABEL_109:
      CFRelease(Mutable);
      goto LABEL_110;
    }
LABEL_108:
    if (!Mutable) {
      goto LABEL_110;
    }
    goto LABEL_109;
  }
  uint64_t v64 = (uint64_t (*)(void *, CFURLRef))a3[13];
  uint64_t v36 = v135;
  if (v64)
  {
    int v65 = v64(a3, url);
    if (!v52) {
      goto LABEL_121;
    }
  }
  else
  {
    int v65 = 0;
    if (!v52) {
      goto LABEL_121;
    }
  }
  CFURLRef v68 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, url, @"KeywordIndex.plist", 0);
  if (v68)
  {
    CFURLRef v69 = v68;
    if (VSKeywordIndexSaveToURL())
    {
      LODWORD(v52) = 1;
    }
    else
    {
      CFIndex v70 = VSGetLogDefault();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long context = 136315138;
        *(void *)&context[4] = "_SaveEngineToCache";
        _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%s: couldn't write keyword index for cache\n", context, 0xCu);
      }
      LODWORD(v52) = 0;
    }
    CFRelease(v69);
    if (v65) {
      goto LABEL_153;
    }
    goto LABEL_127;
  }
  LODWORD(v52) = 0;
LABEL_121:
  if (v65) {
    goto LABEL_153;
  }
LABEL_127:
  int v123 = (int)v52;
  CFURLRef v71 = *a4;
  CFURLRef v72 = url;
  if (*a4)
  {
    CFURLRef v73 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, *a4, @"Manifest.sqlitedb", 0);
    CFURLRef v74 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v71, @"Manifest.sqlitedb", 0);
    CFURLRef v75 = v74;
    if (v73 && v74)
    {
      if (CFURLGetFileSystemRepresentation(v73, 1u, context, 1024))
      {
        if (CFURLGetFileSystemRepresentation(v75, 1u, (UInt8 *)buffer, 1024))
        {
          if (copyfile(context, (const char *)buffer, 0, 0))
          {
            uint64_t v76 = VSGetLogDefault();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              int v77 = *__error();
              *(_DWORD *)CFRunLoopSourceContext buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v77;
              _os_log_error_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "err %d copying manifest\n", buf, 8u);
            }
          }
        }
      }
    }
    else if (!v73)
    {
      goto LABEL_142;
    }
    CFRelease(v73);
LABEL_142:
    uint64_t v36 = v135;
    if (v75) {
      CFRelease(v75);
    }
  }
  CFURLRef v81 = (void *)sub_1000ED3EC(kCFAllocatorDefault, v72);
  if (v81)
  {
    uint64_t v82 = (uint64_t)v81;
    if (Mutable) {
      CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)sub_1000E7B08, v81);
    }
    CFStringRef v130 = a3;
    CFAllocatorRef v83 = CFGetAllocator((CFTypeRef)v82);
    CFMutableArrayRef MutableCopy = CFStringCreateMutableCopy(v83, 0, @"DELETE FROM ValueTranslation");
    pthread_mutex_lock((pthread_mutex_t *)(v82 + 16));
    if (theString)
    {
      CFIndex v85 = CFStringGetLength(theString);
      BOOL v86 = v85 != 0;
      if (v85) {
        CFStringRef v87 = @" model_id = ?";
      }
      else {
        CFStringRef v87 = 0;
      }
    }
    else
    {
      BOOL v86 = 0;
      CFStringRef v87 = 0;
    }
    int v134 = Mutable;
    if (v136)
    {
      CFIndex v90 = CFStringGetLength(v136);
      BOOL v91 = v90 != 0;
      if (v90) {
        CFStringRef v92 = @" class_id = ?";
      }
      else {
        CFStringRef v92 = 0;
      }
    }
    else
    {
      BOOL v91 = 0;
      CFStringRef v92 = 0;
    }
    if (v86 || v91) {
      CFStringAppend(MutableCopy, @" WHERE");
    }
    valuea = v53;
    if (v86)
    {
      CFStringAppend(MutableCopy, v87);
      if (v91)
      {
        CFStringAppend(MutableCopy, @" AND");
LABEL_166:
        CFStringAppend(MutableCopy, v92);
      }
    }
    else if (v91)
    {
      goto LABEL_166;
    }
    uint64_t v36 = v135;
    if (*(void *)(v82 + 80))
    {
      if (CPRecordStoreGetDatabase())
      {
        uint64_t v93 = CPSqliteDatabaseStatementForWriting();
        if (v93)
        {
          uint64_t v94 = v93;
          CFDictionaryRef v125 = v37;
          if (v86)
          {
            CFIndex v95 = CFStringGetLength(theString);
            CFIndex v96 = CFStringGetMaximumSizeForEncoding(v95, 0x8000100u);
            CFIndex v97 = v96;
            buffer[0].__pn_.__r_.__value_.__r.__words[0] = v96;
            if (v96 < 256) {
              BOOL v98 = context;
            }
            else {
              BOOL v98 = (UInt8 *)malloc_type_malloc(v96 + 1, 0x22AA2889uLL);
            }
            v153.locatioCFIndex n = 0;
            v153.length = v95;
            CFStringGetBytes(theString, v153, 0x8000100u, 0, 0, v98, v97, (CFIndex *)buffer);
            v98[buffer[0].__pn_.__r_.__value_.__r.__words[0]] = 0;
            sqlite3_bind_text(*(sqlite3_stmt **)(v94 + 8), 1, (const char *)v98, -1, 0);
            int v100 = 2;
            uint64_t v36 = v135;
          }
          else
          {
            BOOL v98 = 0;
            int v100 = 1;
          }
          if (v91)
          {
            int theStringa = v100;
            CFIndex v102 = CFStringGetLength(v136);
            CFIndex v103 = CFStringGetMaximumSizeForEncoding(v102, 0x8000100u);
            CFIndex v104 = v103;
            *(void *)CFRunLoopSourceContext buf = v103;
            if (v103 < 256) {
              CFIndex v105 = buffer;
            }
            else {
              CFIndex v105 = (std::__fs::filesystem::path *)malloc_type_malloc(v103 + 1, 0x1F481FDAuLL);
            }
            v154.locatioCFIndex n = 0;
            v154.length = v102;
            CFStringGetBytes(v136, v154, 0x8000100u, 0, 0, (UInt8 *)v105, v104, (CFIndex *)buf);
            v105->__pn_.__r_.__value_.__s.__data_[*(void *)buf] = 0;
            sqlite3_bind_text(*(sqlite3_stmt **)(v94 + 8), theStringa, (const char *)v105, -1, 0);
            uint64_t v36 = v135;
          }
          else
          {
            CFIndex v105 = 0;
          }
          CPSqliteStatementPerform();
          CPSqliteStatementReset();
          if (v86 && v98 && v98 != context) {
            free(v98);
          }
          CFDictionaryRef v37 = v125;
          if (v91 && v105 && v105 != buffer) {
            free(v105);
          }
        }
      }
    }
    CPRecordStoreInvalidateCachedInstancesOfClass();
    CFRelease(MutableCopy);
    pthread_mutex_unlock((pthread_mutex_t *)(v82 + 16));
    if (v37) {
      CFDictionaryApplyFunction(v37, (CFDictionaryApplierFunction)sub_1000E79C8, (void *)v82);
    }
    sub_1000ED55C(v82);
    CFRelease((CFTypeRef)v82);
    CFIndex v106 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v106, @"VSLocaleIdentifier", valuea);
    CFDictionarySetValue(v106, @"VSEngineIdentifier", (const void *)v130[3]);
    CFNumberRef v107 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, v130 + 5);
    CFDictionarySetValue(v106, @"VSVersion", v107);
    CFRelease(v107);
    CFMutableArrayRef v108 = (const void *)sub_1000E9D34();
    CFMutableDictionaryRef Mutable = v134;
    if (v108)
    {
      CFDictionaryRef v109 = v108;
      CFDictionarySetValue(v106, @"VSPluginVersions", v108);
      CFRelease(v109);
    }
    buffer[0].__pn_.__r_.__value_.__r.__words[0] = 0;
    CFURLRef v110 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, url, @"Info.plist", 0);
    if (!v110) {
      goto LABEL_222;
    }
    CFURLRef v111 = v110;
    int v112 = CFWriteStreamCreateWithFile(kCFAllocatorDefault, v110);
    if (v112)
    {
      CFMutableArrayRef v113 = v112;
      if (CFWriteStreamOpen(v112))
      {
        CFIndex v114 = CFPropertyListWrite(v106, v113, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)buffer);
        if (v114 <= 0)
        {
          uint64_t v115 = VSGetLogDefault();
          if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long context = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_ERROR, "error writing model configuration cache Info.plist:\n", context, 2u);
          }
          if (buffer[0].__pn_.__r_.__value_.__r.__words[0])
          {
            CFArrayRef v116 = VSGetLogDefault();
            if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long context = 138412290;
              *(void *)&context[4] = buffer[0].__pn_.__r_.__value_.__r.__words[0];
              _os_log_error_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, "%@\n", context, 0xCu);
            }
          }
        }
        CFWriteStreamClose(v113);
        if (buffer[0].__pn_.__r_.__value_.__r.__words[0]) {
          CFRelease(buffer[0].__pn_.__r_.__value_.__l.__data_);
        }
        CFRelease(v113);
        CFRelease(v111);
        uint64_t v36 = v135;
        if (v114 >= 1)
        {
          CFURLRef v89 = sub_1000E6064(v130[3]);
          if (!v89
            || !CFURLGetFileSystemRepresentation(url, 1u, (UInt8 *)buffer, 1024)
            || !CFURLGetFileSystemRepresentation(v89, 1u, context, 1024))
          {
LABEL_216:
            CFRelease(v106);
            if (v123)
            {
              DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
              CFNotificationCenterPostNotification(DarwinNotifyCenter, kVSKeywordIndexDidChangeNotification, 0, 0, 1u);
            }
            CFArrayRef v120 = (void (*)(void *, const __CFURL *))v130[14];
            if (v120) {
              v120(v130, v89);
            }
            goto LABEL_229;
          }
          VSCFURLDeleteDirectoryContents();
          rename(buffer, (const std::__fs::filesystem::path *)context, v117);
          if (!v118)
          {
            if (*a4) {
              CFRelease(*a4);
            }
            *a4 = v89;
            CFRetain(v89);
            goto LABEL_216;
          }
          goto LABEL_225;
        }
LABEL_222:
        CFTypeRef v121 = VSGetLogDefault();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long context = 136315138;
          *(void *)&context[4] = "_SaveEngineToCache";
          _os_log_error_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_ERROR, "%s: error setting info dict on temp cache\n", context, 0xCu);
        }
        CFURLRef v89 = 0;
LABEL_225:
        CFRelease(v106);
        goto LABEL_226;
      }
      CFRelease(v113);
    }
    CFRelease(v111);
    goto LABEL_222;
  }
  uint64_t v88 = VSGetLogDefault();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long context = 136315138;
    *(void *)&context[4] = "_SaveEngineToCache";
    _os_log_error_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "%s: couldn't create manifest for cache\n", context, 0xCu);
  }
LABEL_153:
  CFURLRef v89 = 0;
LABEL_226:
  CFIndex v122 = VSGetLogDefault();
  if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)CFRunLoopSourceContext buf = 136315138;
    *(void *)&uint8_t buf[4] = "_SaveEngineToCache";
    _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "%s: couldn't move temp cache into place... deleting\n", buf, 0xCu);
  }
  VSCFURLDeleteDirectoryContents();
  VSDeleteItemAtURL();
LABEL_229:
  CFRelease(url);
  if (v89) {
    CFRelease(v89);
  }
  sub_1000E6138(0, 0);
  if (Mutable) {
    goto LABEL_109;
  }
LABEL_110:
  if (cf) {
    CFRelease(cf);
  }
  if (v37) {
    CFRelease(v37);
  }
  return v36;
}

void sub_1000E74E8(const void *a1)
{
  pthread_once(&stru_100101870, (void (*)(void))sub_1000E611C);
  CFURLRef v2 = pthread_getspecific(qword_100106A80);
  if (a1) {
    CFRetain(a1);
  }
  pthread_setspecific(qword_100106A80, a1);
  if (v2)
  {
    CFRelease(v2);
  }
}

void sub_1000E757C(uint64_t *a1, uint64_t a2, CFURLRef url, uint64_t a4, const void *a5)
{
  if (a1)
  {
    int v8 = a1;
    if (*a1) {
      goto LABEL_3;
    }
    if (!url) {
      goto LABEL_14;
    }
    CFURLRef v12 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, url, @"KeywordIndex.plist", 0);
    CFURLRef v13 = v8;
    if (v12)
    {
      CFURLRef v14 = v12;
      *CFURLRef v13 = VSKeywordIndexCreateWithURL();
      CFRelease(v14);
    }
    int v8 = v13;
    if (*v13)
    {
LABEL_3:
      if (!a5) {
        goto LABEL_15;
      }
    }
    else
    {
LABEL_14:
      *int v8 = VSKeywordIndexCreate();
      if (!a5)
      {
LABEL_15:
        CFArrayRef v15 = sub_1000EBD38((CFDictionaryRef *)a4);
        if (v15)
        {
          CFArrayRef v16 = v15;
          CFArrayRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, v15);
          CFRelease(v16);
          if (MutableCopy)
          {
            CFIndex Count = CFArrayGetCount(MutableCopy);
            if (Count < 1) {
              goto LABEL_21;
            }
            goto LABEL_5;
          }
        }
        else
        {
          CFArrayRef MutableCopy = 0;
        }
        CFIndex Count = 0;
        goto LABEL_21;
      }
    }
    CFArrayRef MutableCopy = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(MutableCopy, a5);
    CFIndex Count = 1;
LABEL_5:
    unint64_t v11 = Count + 1;
    do
    {
      if (!*((unsigned char *)CFArrayGetValueAtIndex(MutableCopy, v11 - 2) + 40))
      {
        CFArrayRemoveValueAtIndex(MutableCopy, v11 - 2);
        --Count;
      }
      --v11;
    }
    while (v11 > 1);
LABEL_21:
    CFIndex v17 = *(const void **)(a4 + 16);
    if (v17) {
      CFRetain(*(CFTypeRef *)(a4 + 16));
    }
    CFDictionaryRef v18 = (const __CFDictionary *)sub_1000E80BC();
    uint64_t v43 = v17;
    if (v18)
    {
      CFDictionaryRef v19 = v18;
      if (CFDictionaryGetValue(v18, v17))
      {
        CFBooleanGetTypeID();
        CFBooleanRef ValueIfType = (const __CFBoolean *)VSCFDictionaryGetValueIfType();
        if (ValueIfType) {
          CFBooleanGetValue(ValueIfType);
        }
      }
      CFRelease(v19);
    }
    if (Count >= 1)
    {
      CFArrayRef theArray = sub_1000EC768(a4, MutableCopy);
      if (theArray)
      {
        CFIndex v21 = 0;
        CFArrayRef v44 = MutableCopy;
        CFIndex v45 = Count;
        while (1)
        {
          CFURLRef ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, v21);
          CFTypeID v23 = CFArrayGetValueAtIndex(theArray, v21);
          long long v24 = (const void *)ValueAtIndex[2];
          if (v24)
          {
            long long v25 = v23;
            CFRetain(v24);
            CFTypeRef cf = 0;
            int v26 = (uint64_t (*)(void *, uint64_t, void *, void))v25[3];
            CFDictionaryRef v47 = v24;
            if (v26)
            {
              uint64_t v27 = v26(v25, a4, ValueAtIndex, v25[2]);
              if (v27 >= 1)
              {
                uint64_t v28 = v27;
                CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
                uint64_t v30 = 0;
                while (2)
                {
                  CFTypeRef cf = 0;
                  CFDictionaryRef v31 = (uint64_t (*)(void *, uint64_t, void *, uint64_t, void, void, CFTypeRef *, void))v25[4];
                  if (!v31) {
                    goto LABEL_49;
                  }
                  int v32 = v31(v25, a4, ValueAtIndex, v30, v25[2], 0, &cf, 0);
                  CFStringRef v33 = (const __CFString *)cf;
                  if (!v32 || cf == 0) {
                    goto LABEL_49;
                  }
                  long long v35 = *(uint64_t (**)(uint64_t, CFTypeRef))(a2 + 96);
                  if (v35)
                  {
                    CFStringRef v33 = (const __CFString *)v35(a2, cf);
                    if (!v33) {
                      goto LABEL_48;
                    }
                  }
                  else
                  {
                    CFRetain(cf);
                  }
                  uint64_t v36 = a4;
                  uint64_t v37 = a2;
                  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v33, @" ");
                  if (ArrayBySeparatingStrings)
                  {
                    CFArrayRef v39 = ArrayBySeparatingStrings;
                    v49.length = CFArrayGetCount(ArrayBySeparatingStrings);
                    v49.locatioCFIndex n = 0;
                    CFArrayAppendArray(Mutable, v39, v49);
                    CFRelease(v39);
                  }
                  CFRelease(v33);
                  a2 = v37;
                  a4 = v36;
LABEL_48:
                  CFRelease(cf);
LABEL_49:
                  if (v28 == ++v30)
                  {
                    CFIndex v17 = v43;
                    goto LABEL_54;
                  }
                  continue;
                }
              }
              CFMutableDictionaryRef Mutable = 0;
LABEL_54:
              CFArrayRef MutableCopy = v44;
            }
            else
            {
              CFMutableDictionaryRef Mutable = 0;
            }
            CFIndex v40 = v45;
            VSKeywordIndexSetKeywordsForClassIdentifier();
            CFRelease(v47);
            if (Mutable) {
              CFRelease(Mutable);
            }
          }
          else
          {
            CFIndex v40 = v45;
          }
          if (++v21 == v40)
          {
            CFRelease(theArray);
            break;
          }
        }
      }
    }
    long long v41 = *(const void **)(a4 + 576);
    if (v41)
    {
      CFTypeRef v42 = CFRetain(v41);
      VSKeywordIndexSetKeywordsForModelIdentifier();
      if (v42) {
        CFRelease(v42);
      }
      if (!v17) {
        goto LABEL_64;
      }
    }
    else
    {
      VSKeywordIndexSetKeywordsForModelIdentifier();
      if (!v17)
      {
LABEL_64:
        if (MutableCopy) {
          CFRelease(MutableCopy);
        }
        return;
      }
    }
    CFRelease(v17);
    goto LABEL_64;
  }
}

void sub_1000E79C8(uint64_t a1, CFDictionaryRef theDict, uint64_t a3)
{
  context[0] = a1;
  context[1] = 0;
  context[2] = a3;
  if (a1 && theDict)
  {
    if (a3) {
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_1000E7A14, context);
    }
  }
}

void sub_1000E7A14(uint64_t a1, CFDictionaryRef theDict, void *a3)
{
  if (theDict && a1)
  {
    if (a3)
    {
      a3[1] = a1;
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_1000E7A40, a3);
    }
  }
}

CFStringRef sub_1000E7A40(const __CFString *result, const __CFString *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = *(void *)(a3 + 16);
    if (v3)
    {
      CFStringRef v4 = *(const __CFString **)(a3 + 8);
      if (v4)
      {
        if (a2)
        {
          CFStringRef v6 = result;
          if (result)
          {
            CFStringRef v7 = *(const __CFString **)a3;
            if (*(void *)a3)
            {
              pthread_mutex_lock((pthread_mutex_t *)(v3 + 16));
              if (*(void *)(v3 + 80))
              {
                if (CPRecordStoreGetDatabase())
                {
                  uint64_t v8 = CPSqliteDatabaseStatementForWriting();
                  if (v8) {
                    sub_1000ED9C4(v8, 0, 0, v7, v4, v6, a2);
                  }
                }
              }
              return (const __CFString *)pthread_mutex_unlock((pthread_mutex_t *)(v3 + 16));
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_1000E7B08(uint64_t a1, const void *BinaryXMLData, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      CFStringRef v4 = *(const __CFString **)(a1 + 16);
      if (v4)
      {
        CFRetain(*(CFTypeRef *)(a1 + 16));
        if (BinaryXMLData) {
          CFDataRef BinaryXMLData = (const void *)VSCFPropertyListCreateBinaryXMLData();
        }
        pthread_mutex_lock((pthread_mutex_t *)(a3 + 16));
        if (*(void *)(a3 + 80))
        {
          SelectPrefixFromRecordDescriptor = (__CFString *)CPRecordStoreCreateSelectPrefixFromRecordDescriptor();
          if (SelectPrefixFromRecordDescriptor)
          {
            CFStringRef v7 = SelectPrefixFromRecordDescriptor;
            CFStringAppend(SelectPrefixFromRecordDescriptor, @" WHERE model_id = ?;");
            if (CPRecordStoreGetDatabase())
            {
              uint64_t v8 = CPSqliteDatabaseStatementForReading();
              if (v8)
              {
                uint64_t v9 = v8;
                CFIndex Length = CFStringGetLength(v4);
                uint64_t MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
                CFIndex v12 = MaximumSizeForEncoding;
                CFIndex usedBufLen = MaximumSizeForEncoding;
                CFURLRef v13 = buffer;
                if (MaximumSizeForEncoding >= 256) {
                  CFURLRef v13 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0xCA266708uLL);
                }
                v20.locatioCFIndex n = 0;
                v20.length = Length;
                CFStringGetBytes(v4, v20, 0x8000100u, 0, 0, v13, v12, &usedBufLen);
                v13[usedBufLen] = 0;
                sqlite3_bind_text(*(sqlite3_stmt **)(v9 + 8), 1, (const char *)v13, -1, 0);
                CFArrayRef v14 = (const __CFArray *)CPRecordStoreProcessStatement();
                if (v13 && v13 != buffer) {
                  free(v13);
                }
                if (v14)
                {
                  if (CFArrayGetCount(v14) < 1 || !CFArrayGetValueAtIndex(v14, 0))
                  {
                    CFArrayRef v15 = (const void *)CPRecordCreate();
                    CPRecordSetProperty();
                    CPRecordStoreAddRecord();
                    CFRelease(v15);
                  }
                  CPRecordSetProperty();
                  CFRelease(v14);
                }
                else
                {
                  CFArrayRef v16 = (const void *)CPRecordCreate();
                  CPRecordSetProperty();
                  CPRecordStoreAddRecord();
                  CFRelease(v16);
                  CPRecordSetProperty();
                }
              }
            }
            CFRelease(v7);
          }
        }
        pthread_mutex_unlock((pthread_mutex_t *)(a3 + 16));
        if (BinaryXMLData) {
          CFRelease(BinaryXMLData);
        }
        CFRelease(v4);
      }
    }
  }
}

void sub_1000E7DE8(void *a1, uint64_t *a2)
{
  mach_absolute_time();
  if (a1 && a2 && *a2 && *(void *)(*a2 + 64) && !*((_DWORD *)a2 + 9))
  {
    CFDictionaryRef v4 = sub_1000ECA40(a1);
    CFDictionaryRef v5 = (const __CFDictionary *)a2[1];
    if (v5
      && CFDictionaryContainsKey(v5, a1)
      && (CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)a2[1], a1),
          (CFStringRef v7 = (unsigned int (*)(void *, const void *, void))a1[78]) != 0)
      && v7(a1, Value, a1[82]))
    {
      uint64_t v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = a1[67];
        int v18 = 136315138;
        uint64_t v19 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "cache for model <%s> is valid; skipping recache.\n",
          (uint8_t *)&v18,
          0xCu);
      }
    }
    else
    {
      uint64_t v10 = *a2;
      unint64_t v11 = *(void (**)(void))(*a2 + 72);
      if (v11)
      {
        v11();
        uint64_t v10 = *a2;
      }
      if ((*(unsigned int (**)(uint64_t, void *))(v10 + 64))(v10, a1))
      {
        CFIndex v12 = VSGetLogDefault();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = a1[67];
          int v18 = 136315138;
          uint64_t v19 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "error caching model <%s>\n", (uint8_t *)&v18, 0xCu);
        }
        *((_DWORD *)a2 + 9) = -4001;
      }
      else
      {
        CFURLRef v13 = (__CFDictionary *)a2[1];
        if (v13) {
          CFDictionarySetValue(v13, a1, v4);
        }
        *((unsigned char *)a2 + 32) = 1;
        mach_absolute_time();
        CFArrayRef v14 = VSGetLogDefault();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = a1[67];
          VSAbsoluteTimeToSecond();
          int v18 = 136315394;
          uint64_t v19 = v16;
          __int16 v20 = 2048;
          uint64_t v21 = v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "recache for model <%s> done in %g s\n", (uint8_t *)&v18, 0x16u);
        }
        if (!*((_DWORD *)a2 + 9)) {
          sub_1000E757C(a2 + 2, *a2, (CFURLRef)a2[3], (uint64_t)a1, 0);
        }
      }
    }
    CFRelease(v4);
  }
}

void sub_1000E8050(const void *a1, const void *a2, __CFDictionary *a3)
{
  CFStringRef v5 = sub_1000E8DAC(a1);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFDictionaryAddValue(a3, v5, a2);
    CFRelease(v6);
  }
}

const void *sub_1000E80BC()
{
  pthread_mutex_lock(&stru_100101880);
  BOOL v0 = (const void *)sub_1000E8108();
  int v1 = v0;
  if (v0) {
    CFRetain(v0);
  }
  pthread_mutex_unlock(&stru_100101880);
  return v1;
}

uint64_t sub_1000E8108()
{
  if (qword_100106A90) {
    return qword_100106A90;
  }
  CFURLRef v1 = sub_1000E83D0();
  if (!v1) {
    return qword_100106A90;
  }
  CFURLRef v2 = v1;
  memset(&v18, 0, sizeof(v18));
  if (!CFURLGetFileSystemRepresentation(v1, 1u, buffer, 1024)
    || stat((const char *)buffer, &v18)
    || (CFURLRef v4 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/System/Library/VoiceServices/PlugIns", kCFURLPOSIXPathStyle, 1u)) == 0)
  {
    uint64_t v3 = sub_1000E8440();
    goto LABEL_7;
  }
  CFURLRef v5 = v4;
  __darwin_time_t tv_sec = v18.st_mtimespec.tv_sec;
  memset(&v19, 0, sizeof(v19));
  BOOL v7 = CFURLGetFileSystemRepresentation(v4, 1u, v21, 1024)
    && !stat((const char *)v21, &v19)
    && v19.st_mtimespec.tv_sec < tv_sec;
  CFRelease(v5);
  uint64_t v3 = sub_1000E8440();
  if (v7)
  {
    uint64_t v8 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v2);
    if (v8)
    {
      uint64_t v9 = v8;
      if (!CFReadStreamOpen(v8)) {
        goto LABEL_38;
      }
      CFDictionaryRef v10 = (const __CFDictionary *)CFPropertyListCreateWithStream(kCFAllocatorDefault, v9, 0, 0, 0, 0);
      if (!v10) {
        goto LABEL_38;
      }
      CFDictionaryRef v11 = v10;
      CFTypeID v12 = CFGetTypeID(v10);
      if (v12 == CFDictionaryGetTypeID())
      {
        CFStringRef Value = CFDictionaryGetValue(v11, @"modelid-desc");
        CFArrayRef v14 = CFDictionaryGetValue(v11, @"pluginid-vers");
        uint64_t v15 = CFDictionaryGetValue(v11, @"pluginpath-moddate");
        if (v15)
        {
          if (v3 && !CFEqual(v3, v15)) {
            CFStringRef Value = 0;
          }
          if (Value) {
            BOOL v16 = v14 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16) {
            uint64_t v17 = 0;
          }
          else {
            uint64_t v17 = (uint64_t)Value;
          }
          qword_100106A90 = v17;
          if (!v16)
          {
            CFRetain(Value);
            qword_100106A98 = (uint64_t)v14;
            CFRetain(v14);
            goto LABEL_37;
          }
        }
        else
        {
          qword_100106A90 = 0;
        }
        qword_100106A98 = 0;
      }
LABEL_37:
      CFRelease(v11);
LABEL_38:
      CFReadStreamClose(v9);
      CFRelease(v9);
    }
  }
LABEL_7:
  if (!qword_100106A90)
  {
    sub_1000E8614(v2, v3);
    if (!qword_100106A90)
    {
      qword_100106A90 = (uint64_t)CFDictionaryCreate(kCFAllocatorDefault, 0, 0, 0, 0, 0);
      qword_100106A98 = (uint64_t)CFRetain((CFTypeRef)qword_100106A90);
    }
  }
  CFRelease(v2);
  if (v3) {
    CFRelease(v3);
  }
  return qword_100106A90;
}

CFURLRef sub_1000E83D0()
{
  pthread_once(&stru_1001018C0, sub_1000E9D84);
  CFURLRef v0 = (const __CFURL *)qword_100106AA0;
  if (!qword_100106AA0) {
    return 0;
  }
  return CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v0, @"PluginRegistry.plist", 0);
}

__CFDictionary *sub_1000E8440()
{
  CFURLRef v0 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/System/Library/VoiceServices/PlugIns", kCFURLPOSIXPathStyle, 1u);
  if (!v0) {
    return 0;
  }
  CFURLRef v1 = v0;
  memset(&v12, 0, sizeof(v12));
  CFArrayRef v2 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL();
  if (v2)
  {
    CFArrayRef v3 = v2;
    CFIndex Count = CFArrayGetCount(v2);
    if (Count < 1)
    {
      CFMutableDictionaryRef Mutable = 0;
    }
    else
    {
      CFIndex v5 = Count;
      CFMutableDictionaryRef Mutable = 0;
      for (CFIndex i = 0; i != v5; ++i)
      {
        CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v3, i);
        if (CFURLGetFileSystemRepresentation(ValueAtIndex, 1u, buffer, 1024) && !stat((const char *)buffer, &v12))
        {
          CFStringRef PathComponent = CFURLCopyLastPathComponent(ValueAtIndex);
          CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongType, &v12.st_mtimespec);
          if (PathComponent)
          {
            if (CFStringGetLength(PathComponent) >= 1 && v10)
            {
              if (!Mutable) {
                CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, v5, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              }
              CFDictionaryAddValue(Mutable, PathComponent, v10);
            }
            CFRelease(PathComponent);
          }
          if (v10) {
            CFRelease(v10);
          }
        }
      }
    }
    CFRelease(v3);
  }
  else
  {
    CFMutableDictionaryRef Mutable = 0;
  }
  CFRelease(v1);
  return Mutable;
}

void sub_1000E8614(const __CFURL *a1, CFMutableDictionaryRef a2)
{
  CFMutableDictionaryRef context = 0;
  CFMutableDictionaryRef v20 = 0;
  CFURLRef v4 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/System/Library/VoiceServices/PlugIns", kCFURLPOSIXPathStyle, 1u);
  CFErrorRef error = 0;
  if (!v4) {
    goto LABEL_15;
  }
  CFURLRef v5 = v4;
  cf[0] = 0;
  CFArrayRef v6 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL();
  if (v6)
  {
    CFArrayRef v7 = v6;
    CFIndex Count = CFArrayGetCount(v6);
    if (Count < 1)
    {
      CFMutableDictionaryRef v11 = 0;
      CFMutableDictionaryRef Mutable = 0;
    }
    else
    {
      CFIndex v9 = Count;
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFMutableDictionaryRef v11 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFMutableDictionaryRef context = Mutable;
      CFMutableDictionaryRef v20 = v11;
      v25.locatioCFIndex n = 0;
      v25.length = v9;
      CFArrayApplyFunction(v7, v25, (CFArrayApplierFunction)sub_1000E89A0, &context);
    }
    CFRelease(v7);
  }
  else
  {
    stat v12 = VSGetLogDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)keys = 136315394;
      *(void *)&keys[4] = "_CreateRegistryAndSaveToCache";
      *(_WORD *)&keys[12] = 2048;
      *(CFTypeRef *)&keys[14] = cf[0];
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: error examining plugins directory (%ld)\n", keys, 0x16u);
    }
    CFMutableDictionaryRef v11 = 0;
    CFMutableDictionaryRef Mutable = 0;
  }
  CFRelease(v5);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (Mutable)
  {
    if (a2)
    {
LABEL_14:
      CFRetain(a2);
      goto LABEL_17;
    }
  }
  else
  {
LABEL_15:
    CFMutableDictionaryRef v11 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    CFRetain(v11);
    CFMutableDictionaryRef Mutable = v11;
    if (a2) {
      goto LABEL_14;
    }
  }
  a2 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
LABEL_17:
  *(_OWORD *)keys = *(_OWORD *)off_1000FE518;
  *(void *)&keys[16] = @"pluginpath-moddate";
  cf[0] = Mutable;
  cf[1] = v11;
  CFTypeRef cf[2] = a2;
  CFDictionaryRef v13 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, cf, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFArrayRef v14 = CFWriteStreamCreateWithFile(kCFAllocatorDefault, a1);
  if (v14)
  {
    uint64_t v15 = v14;
    if (CFWriteStreamOpen(v14) && !CFPropertyListWrite(v13, v15, kCFPropertyListBinaryFormat_v1_0, 0, &error))
    {
      BOOL v16 = VSGetLogDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CFRunLoopSourceContext buf = 136315138;
        CFErrorRef v22 = (CFErrorRef)"_CreateRegistryAndSaveToCache";
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: error writing plugin registry cache:\n", buf, 0xCu);
      }
      if (error)
      {
        uint64_t v17 = VSGetLogDefault();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CFRunLoopSourceContext buf = 138412290;
          CFErrorRef v22 = error;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
        CFRelease(error);
      }
    }
    CFWriteStreamClose(v15);
    CFRelease(v15);
  }
  CFRelease(v13);
  CFRelease(a2);
  qword_100106A90 = (uint64_t)Mutable;
  qword_100106A98 = (uint64_t)v11;
}

void sub_1000E89A0(CFURLRef url, uint64_t a2)
{
  uint64_t v4 = sub_1000E9FC8(kCFAllocatorDefault, url);
  CFURLRef v5 = *(const void **)a2;
  cf[0] = 0;
  cf[1] = v5;
  if (v4)
  {
    CFArrayRef v6 = (CFBundleRef *)v4;
    CFArrayRef v7 = (pthread_mutex_t *)(v4 + 16);
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 16));
    CFDictionaryRef v8 = (const __CFDictionary *)sub_1000EA0BC((uint64_t)v6);
    pthread_mutex_unlock(v7);
    if (v8)
    {
      cf[0] = CFURLCopyLastPathComponent(url);
      if (cf[0])
      {
        CFDictionaryApplyFunction(v8, (CFDictionaryApplierFunction)sub_1000E8AD0, cf);
        CFRelease(cf[0]);
      }
    }
    CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(v6[10]);
    if (InfoDictionary) {
      CFStringRef Value = CFDictionaryGetValue(InfoDictionary, @"VSRecognitionVersion");
    }
    else {
      CFStringRef Value = 0;
    }
    CFStringRef Identifier = CFBundleGetIdentifier(v6[10]);
    CFTypeID TypeID = CFStringGetTypeID();
    if (Value)
    {
      if (Identifier)
      {
        CFTypeID v13 = TypeID;
        if (CFGetTypeID(Value) == TypeID && CFGetTypeID(Identifier) == v13) {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 8), Identifier, Value);
        }
      }
    }
    CFRelease(v6);
  }
}

void sub_1000E8AD0(void *key, const __CFDictionary *a2, uint64_t a3)
{
  if (!CFDictionaryContainsKey(*(CFDictionaryRef *)(a3 + 8), key))
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a2, @"VSRecognitionModelRequiredCapabilities");
    if (Value && (CFArrayRef v7 = Value, Count = CFArrayGetCount(Value), Count >= 1))
    {
      CFIndex v9 = Count;
      CFIndex v10 = 0;
      while (1)
      {
        CFArrayGetValueAtIndex(v7, v10);
        CFBooleanRef v11 = (const __CFBoolean *)MGCopyAnswer();
        if (!v11) {
          break;
        }
        CFBooleanRef v12 = v11;
        CFTypeID v13 = CFGetTypeID(v11);
        if (v13 != CFBooleanGetTypeID())
        {
          CFBooleanRef v16 = v12;
          goto LABEL_11;
        }
        int v14 = CFBooleanGetValue(v12);
        CFRelease(v12);
        if (!v14) {
          return;
        }
        if (v9 == ++v10) {
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      CFArrayRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, a2);
      CFDictionaryRemoveValue(MutableCopy, @"VSRecognitionModelIdentifier");
      CFDictionarySetValue(MutableCopy, @"PluginPath", *(const void **)a3);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a3 + 8), key, MutableCopy);
      CFBooleanRef v16 = MutableCopy;
LABEL_11:
      CFRelease(v16);
    }
  }
}

const void *sub_1000E8C20(const void *a1)
{
  pthread_mutex_lock(&stru_100101880);
  CFDictionaryRef v2 = (const __CFDictionary *)sub_1000E8108();
  if (v2 && CFDictionaryGetValue(v2, a1) && (CFURLRef v3 = sub_1000E8D0C()) != 0)
  {
    CFURLRef v4 = v3;
    if (qword_100106A88 && (CFArrayRef Value = CFDictionaryGetValue((CFDictionaryRef)qword_100106A88, v3)) != 0)
    {
      CFArrayRef v6 = Value;
      CFRetain(Value);
    }
    else
    {
      CFArrayRef v6 = (const void *)sub_1000E9FC8(kCFAllocatorDefault, v4);
      if (v6)
      {
        CFMutableDictionaryRef Mutable = (__CFDictionary *)qword_100106A88;
        if (!qword_100106A88)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          qword_100106A88 = (uint64_t)Mutable;
        }
        CFDictionarySetValue(Mutable, v4, v6);
      }
    }
    CFRelease(v4);
  }
  else
  {
    CFArrayRef v6 = 0;
  }
  pthread_mutex_unlock(&stru_100101880);
  return v6;
}

CFURLRef sub_1000E8D0C()
{
  CFStringGetTypeID();
  uint64_t ValueIfType = VSCFDictionaryGetValueIfType();
  if (!ValueIfType) {
    return 0;
  }
  CFStringRef v1 = (const __CFString *)ValueIfType;
  CFURLRef v2 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/System/Library/VoiceServices/PlugIns", kCFURLPOSIXPathStyle, 1u);
  if (!v2) {
    return 0;
  }
  CFURLRef v3 = v2;
  CFURLRef v4 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v2, v1, 1u);
  CFRelease(v3);
  return v4;
}

CFStringRef sub_1000E8DAC(const void *a1)
{
  CFStringRef v1 = a1;
  CFURLRef v2 = sub_1000E8C20(a1);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (uint64_t)v2;
  CFAllocatorRef allocator = CFGetAllocator(v2);
  CFURLRef v4 = (pthread_mutex_t *)(v3 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(v3 + 16));
  CFStringRef v5 = (const __CFString *)VSPreferencesCopySpokenLanguageIdentifier();
  CFDictionaryRef v6 = (const __CFDictionary *)sub_1000EA0BC(v3);
  if (v6) {
    CFDictionaryRef v7 = (const __CFDictionary *)CFDictionaryGetValue(v6, v1);
  }
  else {
    CFDictionaryRef v7 = 0;
  }
  CFDictionaryRef v9 = *(const __CFDictionary **)(v3 + 112);
  if (v9)
  {
    CFStringRef v10 = (const __CFString *)CFDictionaryGetValue(v9, v1);
    CFStringRef v8 = v10;
    if (v10 && v5 && v7)
    {
      CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(v7, @"lang");
      if (v11 && CFStringCompare(v11, v5, 0))
      {
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v3 + 112), v1);
        CFArrayRef MutableCopy = CFDictionaryCreateMutableCopy(allocator, 0, v7);
        if (MutableCopy)
        {
          CFTypeID v13 = MutableCopy;
          CFDictionaryRemoveValue(MutableCopy, @"lang");
          CFDictionaryRemoveValue(v13, @"VSRecognitionModelDefinition");
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 96), v1, v13);
          CFRelease(v13);
          CFDictionaryRef v7 = v13;
        }
        goto LABEL_17;
      }
LABEL_15:
      CFRetain(v8);
      goto LABEL_164;
    }
    if (v10) {
      goto LABEL_15;
    }
  }
  if (!v7)
  {
    CFStringRef v8 = 0;
    goto LABEL_164;
  }
LABEL_17:
  CFStringRef v14 = (const __CFString *)CFDictionaryGetValue(v7, @"VSRecognitionModelDefinition");
  if (!v14)
  {
    CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(v7, @"VSRecognitionModelFileName");
    CFStringRef v8 = v18;
    if (!v18) {
      goto LABEL_164;
    }
    if (!v5)
    {
      CFStringRef v8 = 0;
      goto LABEL_166;
    }
    locatioCFIndex n = CFStringFind(v18, @".plist", 0xCuLL).location;
    if (location != -1)
    {
      CFIndex v20 = location;
      CFMutableStringRef v21 = CFStringCreateMutableCopy(allocator, 0, v8);
      CFStringInsert(v21, v20, v5);
      CFStringInsert(v21, v20, @"-");
      CFURLRef v22 = CFBundleCopyResourceURL(*(CFBundleRef *)(v3 + 80), v21, 0, 0);
      if (v22)
      {
        CFStringRef v8 = (const __CFString *)v22;
        CFRelease(v21);
      }
      else
      {
        uint64_t v85 = _VSCopyLanguageCodeFromLanguageIdentifier();
        CFStringRef v86 = v5;
        if (!v85)
        {
          CFRelease(v21);
          CFStringRef v8 = 0;
          goto LABEL_165;
        }
        CFStringRef v87 = (const __CFString *)v85;
        v118.length = CFStringGetLength(v86);
        v118.locatioCFIndex n = v20 + 1;
        CFStringReplace(v21, v118, v87);
        CFStringRef v8 = (const __CFString *)CFBundleCopyResourceURL(*(CFBundleRef *)(v3 + 80), v21, 0, 0);
        CFRelease(v87);
        CFRelease(v21);
        CFStringRef v5 = v86;
        if (!v8)
        {
LABEL_165:
          CFRelease(v5);
          goto LABEL_166;
        }
      }
      CFTypeID v23 = CFReadStreamCreateWithFile(allocator, (CFURLRef)v8);
      if (v23)
      {
        long long v24 = v23;
        if (CFReadStreamOpen(v23)
          && (CFStringRef v25 = (const __CFString *)CFPropertyListCreateWithStream(allocator, v24, 0, 0, 0, 0),
              CFReadStreamClose(v24),
              v25))
        {
          int v26 = v1;
          CFStringRef value = v25;
          CFTypeID v27 = CFGetTypeID(v25);
          if (v27 == CFDictionaryGetTypeID())
          {
            uint64_t v28 = CFDictionaryCreateMutableCopy(allocator, 0, v7);
            CFStringRef v1 = v26;
            if (v28)
            {
              long long v29 = v28;
              CFStringRef v30 = value;
              CFDictionarySetValue(v28, @"VSRecognitionModelDefinition", value);
              CFDictionarySetValue(v29, @"lang", v5);
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 96), v1, v29);
              CFRelease(v29);
              goto LABEL_174;
            }
          }
          else
          {
            CFStringRef v1 = v26;
          }
          CFStringRef v30 = v25;
        }
        else
        {
          CFStringRef v30 = 0;
        }
LABEL_174:
        CFRelease(v24);
        CFRelease(v8);
        CFStringRef v8 = v30;
        if (!v30) {
          goto LABEL_165;
        }
        goto LABEL_19;
      }
      CFRelease(v8);
    }
    CFStringRef v8 = 0;
    goto LABEL_165;
  }
  CFStringRef v8 = v14;
  CFRetain(v14);
LABEL_19:
  CFAllocatorRef v109 = CFGetAllocator((CFTypeRef)v3);
  CFArrayGetTypeID();
  CFStringGetTypeID();
  CFDictionaryGetTypeID();
  CFBooleanGetTypeID();
  CFNumberGetTypeID();
  CFArrayRef v116 = 0;
  valuePtr[0] = 0;
  uint64_t v115 = 0;
  CFDictionaryRef v110 = 0;
  CFArrayRef ValueIfType = (const __CFArray *)VSCFDictionaryGetValueIfType();
  CFArrayRef theArray = (const __CFArray *)VSCFDictionaryGetValueIfType();
  uint64_t v16 = VSCFDictionaryGetValueIfType();
  CFNumberRef number = (const __CFNumber *)VSCFDictionaryGetValueIfType();
  uint64_t v17 = VSCFDictionaryGetValueIfType();
  if (ValueIfType) {
    CFIndex Count = CFArrayGetCount(ValueIfType);
  }
  else {
    CFIndex Count = 0;
  }
  CFStringRef v100 = v5;
  CFStringRef valuea = v8;
  uint64_t v114 = 0;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v111 = 0u;
  if (!theArray)
  {
    CFDictionaryRef v32 = 0;
    CFArrayRef v108 = 0;
    CFStringRef v33 = 0;
    CFSetRef v34 = 0;
    CFStringRef v8 = 0;
    goto LABEL_146;
  }
  CFIndex v31 = CFArrayGetCount(theArray);
  CFDictionaryRef v32 = 0;
  if (!ValueIfType || Count < 1)
  {
    CFArrayRef v108 = 0;
    CFStringRef v33 = 0;
    CFSetRef v34 = 0;
    CFStringRef v8 = 0;
    goto LABEL_146;
  }
  BOOLeaCFIndex n = (const __CFBoolean *)v17;
  uint64_t v93 = (const void *)v16;
  CFArrayRef v108 = 0;
  CFStringRef v33 = 0;
  CFSetRef v34 = 0;
  CFStringRef v8 = 0;
  if (v31 < 1) {
    goto LABEL_146;
  }
  CFIndex v97 = v1;
  uint64_t v94 = (pthread_mutex_t *)(v3 + 16);
  uint64_t v95 = v3;
  CFSetRef v104 = 0;
  int v99 = 0;
  CFArrayRef v108 = 0;
  CFIndex v35 = 0;
  BOOL v98 = VSCFDictionaryGetValueIfType() != 0;
  while (1)
  {
    uint64_t ValueAtIndexIfType = VSCFArrayGetValueAtIndexIfType();
    if (!ValueAtIndexIfType) {
      break;
    }
    uint64_t v37 = (const void *)ValueAtIndexIfType;
    CFStringRef v38 = (const __CFString *)VSCFDictionaryGetValueIfType();
    CFStringRef v39 = v38;
    if (!v38) {
      goto LABEL_110;
    }
    CFIndex Length = CFStringGetLength(v38);
    BOOL v41 = Length > 0;
    if (Length < 1) {
      break;
    }
    key = (void *)v39;
    CFArrayRef v42 = (const __CFArray *)VSCFDictionaryGetValueIfType();
    if (v42)
    {
      CFArrayRef v43 = v42;
      CFIndex v44 = CFArrayGetCount(v42);
      if (v44 >= 1)
      {
        CFIndex v45 = v44;
        CFIndex v46 = 0;
        while (1)
        {
          CFArrayGetValueAtIndex(v43, v46);
          CFDictionaryRef v47 = (const void *)MGCopyAnswer();
          if (!v47) {
            break;
          }
          CFDictionaryRef v48 = v47;
          CFTypeID v49 = CFGetTypeID(v47);
          if (v49 != CFBooleanGetTypeID())
          {
            CFRelease(v48);
            break;
          }
          int v50 = CFBooleanGetValue((CFBooleanRef)v48);
          CFRelease(v48);
          if (!v50) {
            break;
          }
          if (v45 == ++v46) {
            goto LABEL_49;
          }
        }
        CFMutableDictionaryRef Mutable = v104;
        if (!v104) {
          CFMutableDictionaryRef Mutable = CFSetCreateMutable(v109, 0, &kCFTypeSetCallBacks);
        }
        CFSetRef v104 = Mutable;
        CFSetAddValue(Mutable, key);
        goto LABEL_105;
      }
    }
LABEL_49:
    CFArrayRef v51 = (const __CFArray *)VSCFDictionaryGetValueIfType();
    if (v51)
    {
      CFArrayRef v52 = (const __CFArray *)VSCFDictionaryGetValueIfType();
      CFIndex v53 = CFArrayGetCount(v51);
      if (v52 && CFArrayGetCount(v52) != v53) {
        BOOL v41 = 0;
      }
      uint64_t v54 = 0;
      if (v53 >= 1 && v41)
      {
        uint64_t v54 = 0;
        uint64_t v55 = 1;
        while (1)
        {
          uint64_t v56 = VSCFArrayGetValueAtIndexIfType();
          BOOL v41 = v56 != 0;
          if (v52)
          {
            int v57 = (const void *)v56;
            if (v56)
            {
              uint64_t v58 = VSCFArrayGetValueAtIndexIfType();
              if (!v58)
              {
                BOOL v41 = 0;
                break;
              }
              uint64_t v59 = (const void *)v58;
              if (!v54) {
                uint64_t v54 = CFDictionaryCreateMutable(v109, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              }
              CFDictionarySetValue(v54, v57, v59);
              BOOL v41 = 1;
            }
          }
          if (v55 < v53)
          {
            ++v55;
            if (v41) {
              continue;
            }
          }
          break;
        }
      }
      if (!v53) {
        BOOL v41 = v98;
      }
      if (!v41) {
        goto LABEL_95;
      }
    }
    else
    {
      CFArrayRef v60 = (const __CFArray *)VSCFDictionaryGetValueIfType();
      if (v60 && CFArrayGetCount(v60) >= 1)
      {
        int v61 = v108;
        if (!v108) {
          int v61 = CFArrayCreateMutable(v109, 0, &kCFTypeArrayCallBacks);
        }
        CFArrayRef v108 = v61;
        CFArrayAppendValue(v61, v37);
        BOOL v41 = 1;
        goto LABEL_105;
      }
      CFIndex v53 = 0;
      uint64_t v54 = 0;
      BOOL v41 = v98;
      if (!v98) {
        goto LABEL_95;
      }
    }
    uint64_t v63 = VSCFDictionaryGetValueIfType();
    if (v63
      && (uint64_t v64 = (const void *)v63, pthread_once(&stru_1001018E0, sub_1000EB758), qword_100106AB0)
      && CFDictionaryContainsKey((CFDictionaryRef)qword_100106AB0, v64))
    {
      uint64_t v65 = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)qword_100106AB0, v64);
    }
    else
    {
      uint64_t v65 = -1;
    }
    CFNumberRef v66 = (const __CFNumber *)VSCFDictionaryGetValueIfType();
    CFBooleanRef v67 = (const __CFBoolean *)VSCFDictionaryGetValueIfType();
    if (v67)
    {
      char v68 = CFBooleanGetValue(v67) != 0;
      if (!v66) {
        goto LABEL_89;
      }
    }
    else
    {
      char v68 = 0;
      if (!v66)
      {
LABEL_89:
        uint64_t v69 = 0;
        valuePtr[0] = 0;
        goto LABEL_90;
      }
    }
    CFNumberGetValue(v66, kCFNumberCFIndexType, valuePtr);
    uint64_t v69 = valuePtr[0];
LABEL_90:
    if (v53 <= 0) {
      CFArrayRef v70 = 0;
    }
    else {
      CFArrayRef v70 = v51;
    }
    CFURLRef v71 = (void *)sub_1000ECB34((uint64_t)v109, key, v65, v68, v69, v70, 1);
    if (!v71)
    {
      if (!v54) {
        break;
      }
      BOOL v41 = 0;
      goto LABEL_104;
    }
    CFURLRef v72 = v71;
    sub_1000EA220(v109, v71, key, &v116, &v115);
    CFRelease(v72);
LABEL_95:
    if (v41 && v54)
    {
      CFURLRef v73 = v99;
      if (!v99) {
        CFURLRef v73 = CFDictionaryCreateMutable(v109, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      int v99 = v73;
      CFDictionarySetValue(v73, key, v54);
      BOOL v41 = 1;
LABEL_104:
      CFRelease(v54);
      goto LABEL_105;
    }
    if (v54) {
      goto LABEL_104;
    }
LABEL_105:
    ++v35;
    LOBYTE(v39) = v41;
    if (v35 >= Count || !v41) {
      goto LABEL_111;
    }
  }
  LOBYTE(v39) = 0;
LABEL_110:
  BOOL v41 = 0;
LABEL_111:
  if (v108)
  {
    CFIndex v74 = CFArrayGetCount(v108);
    char v75 = v39 ^ 1;
    if (v74 < 1) {
      char v75 = 1;
    }
    CFStringRef v1 = v97;
    if ((v75 & 1) == 0)
    {
      CFIndex v76 = v74;
      uint64_t v77 = 1;
      while (1)
      {
        CFArrayGetValueAtIndex(v108, v77 - 1);
        CFArrayRef v78 = (const __CFArray *)VSCFDictionaryGetValueIfType();
        CFDictionaryRef v79 = sub_1000EA2D0(v109, v78, v115, 1, 0, v104);
        CFDictionaryRef v32 = v79;
        if (!v79) {
          break;
        }
        CFIndex v80 = CFArrayGetCount(v79);
        if (v80 < 1)
        {
          BOOL v41 = 0;
        }
        else
        {
          CFURLRef v81 = (const void *)VSCFDictionaryGetValueIfType();
          uint64_t v82 = sub_1000ECB34((uint64_t)v109, v81, -1, 0, 0, v32, 0);
          if (v82)
          {
            CFAllocatorRef v83 = (void *)v82;
            CFIndex v84 = (const void *)VSCFDictionaryGetValueIfType();
            sub_1000EA220(v109, v83, v84, &v116, &v115);
            CFRelease(v83);
          }
          BOOL v41 = 1;
          CFStringRef v1 = v97;
        }
        CFRelease(v32);
        if (v77 < v76)
        {
          ++v77;
          if (v80 > 0) {
            continue;
          }
        }
        goto LABEL_128;
      }
      CFStringRef v8 = 0;
      CFURLRef v4 = v94;
      uint64_t v3 = v95;
LABEL_136:
      CFSetRef v34 = v104;
      CFStringRef v33 = v99;
      goto LABEL_146;
    }
  }
  else
  {
    CFStringRef v1 = v97;
  }
LABEL_128:
  CFURLRef v4 = v94;
  uint64_t v3 = v95;
  if (!v41)
  {
    CFDictionaryRef v32 = 0;
    CFStringRef v8 = 0;
    goto LABEL_136;
  }
  CFSetRef v34 = v104;
  CFDictionaryRef v32 = sub_1000EA2D0(v109, theArray, v115, 0, (const void **)&v110, v104);
  *(void *)&long long v111 = sub_1000EB24C;
  *((void *)&v111 + 1) = sub_1000EAF24;
  *(void *)&long long v112 = sub_1000EAD88;
  *((void *)&v112 + 1) = sub_1000EACD0;
  *(void *)&long long v113 = sub_1000EABA4;
  *((void *)&v113 + 1) = sub_1000EA714;
  uint64_t v114 = 0;
  if (number) {
    CFNumberGetValue(number, kCFNumberCFIndexType, valuePtr);
  }
  else {
    valuePtr[0] = 0;
  }
  CFStringRef v33 = v99;
  if (BOOLean) {
    Boolean v88 = CFBooleanGetValue(BOOLean);
  }
  else {
    Boolean v88 = 0;
  }
  CFStringRef v8 = (const __CFString *)sub_1000EB9D8(v109, v1, valuePtr[0], v88, v116, v32, v110, v93, &v111, v95);
  if (v8 && v99)
  {
    CFURLRef v89 = *(__CFDictionary **)(v95 + 104);
    if (!v89)
    {
      CFURLRef v89 = CFDictionaryCreateMutable(v109, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      *(void *)(v95 + 104) = v89;
    }
    CFDictionarySetValue(v89, v1, v99);
  }
LABEL_146:
  if (v116) {
    CFRelease(v116);
  }
  if (v32) {
    CFRelease(v32);
  }
  if (v115) {
    CFRelease(v115);
  }
  CFStringRef v5 = v100;
  if (v110) {
    CFRelease(v110);
  }
  if (v108) {
    CFRelease(v108);
  }
  if (v33) {
    CFRelease(v33);
  }
  if (v34) {
    CFRelease(v34);
  }
  CFRelease(valuea);
  if (v8)
  {
    CFIndex v90 = *(__CFDictionary **)(v3 + 112);
    if (!v90)
    {
      CFIndex v90 = CFDictionaryCreateMutable(allocator, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      *(void *)(v3 + 112) = v90;
    }
    CFDictionarySetValue(v90, v1, v8);
  }
LABEL_164:
  if (v5) {
    goto LABEL_165;
  }
LABEL_166:
  pthread_mutex_unlock(v4);
  CFRelease((CFTypeRef)v3);
  return v8;
}

CFDictionaryRef sub_1000E9A68()
{
  uint64_t v3 = 0;
  CFDictionaryRef result = (const __CFDictionary *)sub_1000E80BC();
  context[0] = &v3;
  if (result)
  {
    CFDictionaryRef v1 = result;
    context[1] = 0;
    CFDictionaryApplyFunction(result, (CFDictionaryApplierFunction)sub_1000E9ACC, context);
    CFRelease(v1);
    return (const __CFDictionary *)v3;
  }
  return result;
}

void sub_1000E9ACC(const void *a1, uint64_t a2, uint64_t a3)
{
  CFBooleanGetTypeID();
  if (a3)
  {
    if (a1)
    {
      if (a2)
      {
        if (*(void *)a3)
        {
          CFArrayRef ValueIfType = (const void *)VSCFDictionaryGetValueIfType();
          if (ValueIfType)
          {
            if (CFEqual(ValueIfType, kCFBooleanTrue))
            {
              if (!*(unsigned char *)(a3 + 8)
                || (CFBooleanRef v8 = (const __CFBoolean *)VSCFDictionaryGetValueIfType(), !*(unsigned char *)(a3 + 8))
                || v8 && CFBooleanGetValue(v8))
              {
                CFDictionaryRef v9 = *(__CFSet ***)a3;
                sub_1000E9B9C(a1, v7, v9);
              }
            }
          }
        }
      }
    }
  }
}

void sub_1000E9B9C(const void *a1, uint64_t a2, __CFSet **a3)
{
  if (a1)
  {
    if (a3)
    {
      CFStringRef v4 = sub_1000E8DAC(a1);
      if (v4)
      {
        CFStringRef v5 = v4;
        CFMutableDictionaryRef Mutable = *a3;
        if (!*a3)
        {
          CFMutableDictionaryRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
          *a3 = Mutable;
        }
        CFSetAddValue(Mutable, v5);
        CFRelease(v5);
      }
    }
  }
}

void sub_1000E9C20(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        CFBooleanGetTypeID();
        CFArrayRef ValueIfType = (const void *)VSCFDictionaryGetValueIfType();
        if (ValueIfType)
        {
          if (CFEqual(ValueIfType, kCFBooleanTrue))
          {
            CFStringGetTypeID();
            if (VSCFDictionaryGetValueIfType())
            {
              CFURLRef v6 = sub_1000E8D0C();
              if (v6)
              {
                CFURLRef v7 = v6;
                uint64_t String = VSRecognitionPluginInfoCreateString();
                if (String)
                {
                  CFDictionaryRef v9 = (const void *)String;
                  CFMutableDictionaryRef Mutable = *a3;
                  if (!*a3)
                  {
                    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                    *a3 = Mutable;
                  }
                  CFDictionarySetValue(Mutable, a1, v9);
                  CFRelease(v9);
                }
                CFRelease(v7);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1000E9D34()
{
  pthread_mutex_lock(&stru_100101880);
  sub_1000E8108();
  uint64_t v0 = qword_100106A98;
  if (qword_100106A98) {
    CFRetain((CFTypeRef)qword_100106A98);
  }
  pthread_mutex_unlock(&stru_100101880);
  return v0;
}

void sub_1000E9D84()
{
  uint64_t v0 = CFCopyHomeDirectoryURLForUser();
  if (v0)
  {
    CFDictionaryRef v1 = (const void *)v0;
    VSCreateURLAndDirectory();
    CFRelease(v1);
  }
}

uint64_t sub_1000E9E24()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_100106AA8 = result;
  return result;
}

CFStringRef sub_1000E9E4C(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, @"<VSPlugin %p: %@>", a1, a1[10]);
}

uint64_t sub_1000E9E90(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 == a2;
  uint64_t v3 = *(__CFBundle **)(a1 + 80);
  if (v3 && *(void *)(a2 + 80))
  {
    CFURLRef v5 = CFBundleCopyBundleURL(v3);
    CFURLRef v6 = CFBundleCopyBundleURL(*(CFBundleRef *)(a2 + 80));
    CFURLRef v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      if (CFEqual(v5, v6)) {
        uint64_t v2 = 1;
      }
      else {
        uint64_t v2 = v2;
      }
LABEL_15:
      CFRelease(v5);
      if (!v7) {
        return v2;
      }
      goto LABEL_10;
    }
    if (v5) {
      goto LABEL_15;
    }
    if (v6) {
LABEL_10:
    }
      CFRelease(v7);
  }
  return v2;
}

uint64_t sub_1000E9F28(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v3 = *(const void **)(a1 + 80);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 80) = 0;
  }
  CFStringRef v4 = *(const void **)(a1 + 96);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 96) = 0;
  }
  CFURLRef v5 = *(const void **)(a1 + 104);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 104) = 0;
  }
  CFURLRef v6 = *(const void **)(a1 + 112);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 112) = 0;
  }
  CFURLRef v7 = *(const void **)(a1 + 120);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(a1 + 120) = 0;
  }
  BOOL v8 = *(const void **)(a1 + 128);
  if (v8)
  {
    CFRelease(v8);
    *(void *)(a1 + 128) = 0;
  }
  return pthread_mutex_destroy(v2);
}

uint64_t sub_1000E9FC8(const __CFAllocator *a1, CFURLRef url)
{
  if (!url) {
    return 0;
  }
  CFStringRef v4 = CFURLCopyPathExtension(url);
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = v4;
  uint64_t v6 = 0;
  if (CFEqual(v4, @"vsplugin"))
  {
    CFBundleRef v8 = CFBundleCreate(a1, url);
    if (v8)
    {
      CFBundleRef v9 = v8;
      pthread_once(&stru_1001018D0, (void (*)(void))sub_1000E9E24);
      uint64_t Instance = _CFRuntimeCreateInstance();
      uint64_t v6 = Instance;
      if (Instance)
      {
        *(void *)(Instance + 80) = v9;
        *(unsigned char *)(Instance + 88) = 0;
        *(_OWORD *)(Instance + 96) = 0u;
        *(_OWORD *)(Instance + 112) = 0u;
        *(void *)(Instance + 128) = 0;
        pthread_mutex_init((pthread_mutex_t *)(Instance + 16), 0);
      }
      else
      {
        CFRelease(v9);
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  CFRelease(v5);
  return v6;
}

uint64_t sub_1000EA0BC(uint64_t a1)
{
  if (!*(void *)(a1 + 96))
  {
    CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(*(CFBundleRef *)(a1 + 80));
    if (InfoDictionary)
    {
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(InfoDictionary, @"VSRecognitionModels");
      if (Value)
      {
        CFArrayRef v5 = Value;
        CFTypeID v6 = CFGetTypeID(Value);
        if (v6 == CFArrayGetTypeID())
        {
          CFAllocatorRef v7 = CFGetAllocator((CFTypeRef)a1);
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v7, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (Mutable)
          {
            CFMutableDictionaryRef v9 = Mutable;
            v10.length = CFArrayGetCount(v5);
            v10.locatioCFIndex n = 0;
            CFArrayApplyFunction(v5, v10, (CFArrayApplierFunction)sub_1000EA180, v9);
            *(void *)(a1 + 96) = v9;
          }
        }
      }
    }
  }
  return *(void *)(a1 + 96);
}

void sub_1000EA180(const void *a1, __CFDictionary *a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFDictionaryGetTypeID())
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"VSRecognitionModelIdentifier");
    if (Value)
    {
      CFStringRef v6 = Value;
      if (CFStringGetLength(Value) >= 1 && !CFDictionaryContainsKey(a2, v6))
      {
        CFDictionarySetValue(a2, v6, a1);
      }
    }
  }
}

void sub_1000EA220(CFAllocatorRef allocator, void *value, const void *a3, __CFArray **a4, __CFDictionary **a5)
{
  CFMutableDictionaryRef Mutable = *a4;
  if (!*a4)
  {
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(allocator, 0, &kCFTypeArrayCallBacks);
    *a4 = Mutable;
  }
  if (!*a5)
  {
    *a5 = CFDictionaryCreateMutable(allocator, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableDictionaryRef Mutable = *a4;
  }
  CFArrayAppendValue(Mutable, value);
  CFStringRef v11 = *a5;
  CFDictionarySetValue(v11, a3, value);
}

CFDictionaryRef sub_1000EA2D0(const __CFAllocator *a1, CFArrayRef theArray, const __CFDictionary *a3, int a4, const void **a5, const __CFSet *a6)
{
  if (theArray) {
    CFIndex Count = CFArrayGetCount(theArray);
  }
  else {
    CFIndex Count = 0;
  }
  CFArrayGetTypeID();
  CFStringGetTypeID();
  CFDictionaryGetTypeID();
  if (a5) {
    CFDictionaryRef v8 = (const __CFDictionary *)*a5;
  }
  else {
    CFDictionaryRef v8 = 0;
  }
  CFStringRef v33 = a5;
  if (Count < 1)
  {
    CFTypeRef cf = 0;
    goto LABEL_74;
  }
  CFDictionaryRef theDict = v8;
  CFTypeRef cf = 0;
  uint64_t v9 = 0;
  do
  {
    if (!VSCFArrayGetValueAtIndexIfType() || (CFArrayRef ValueIfType = (const __CFArray *)VSCFDictionaryGetValueIfType()) == 0)
    {
      CFDictionaryRef v8 = theDict;
      goto LABEL_69;
    }
    uint64_t v37 = v9;
    CFIndex v11 = CFArrayGetCount(ValueIfType);
    if (v11 >= 1)
    {
      CFBooleanRef v12 = 0;
      CFMutableDictionaryRef Mutable = 0;
      CFIndex v14 = 0;
      while (1)
      {
        CFStringRef ValueAtIndexIfType = (const __CFString *)VSCFArrayGetValueAtIndexIfType();
        if (!ValueAtIndexIfType)
        {
          int v24 = 0;
          goto LABEL_43;
        }
        CFStringRef v16 = ValueAtIndexIfType;
        CFRange result = (CFRange)xmmword_1000F68C0;
        CFIndex Length = CFStringGetLength(ValueAtIndexIfType);
        v42.locatioCFIndex n = 0;
        v42.length = Length;
        if (CFStringFindWithOptions(v16, @"+", v42, 0xCuLL, &result)) {
          break;
        }
        v43.locatioCFIndex n = 0;
        v43.length = Length;
        if (CFStringFindWithOptions(v16, @"*", v43, 0xCuLL, &result))
        {
          uint64_t v18 = 2;
          goto LABEL_18;
        }
        CFRetain(v16);
        uint64_t v18 = 0;
LABEL_19:
        CFStringRef Value = CFDictionaryGetValue(a3, v16);
        if (Value)
        {
          CFMutableStringRef v21 = Value;
          if (!a4 || *((unsigned char *)Value + 41))
          {
            if (!Mutable) {
              CFMutableDictionaryRef Mutable = CFArrayCreateMutable(a1, 0, &kCFTypeArrayCallBacks);
            }
            CFArrayAppendValue(Mutable, v21);
            if (!v12)
            {
              if (v18)
              {
                CFBooleanRef v12 = CFArrayCreateMutable(a1, 0, 0);
                if (v14)
                {
                  CFIndex v22 = v14;
                  do
                  {
                    CFArrayAppendValue(v12, 0);
                    --v22;
                  }
                  while (v22);
                }
              }
            }
            if (v12) {
              CFArrayAppendValue(v12, (const void *)v18);
            }
            int v23 = 0;
            goto LABEL_34;
          }
        }
        else if (a6)
        {
          int v23 = CFSetContainsValue(a6, v16);
LABEL_34:
          int v24 = 1;
          goto LABEL_36;
        }
        int v24 = 0;
        int v23 = 0;
LABEL_36:
        CFRelease(v16);
        ++v14;
        BOOL v25 = v23 == 0;
        if (v14 >= v11 || !v24 || v23) {
          goto LABEL_44;
        }
      }
      uint64_t v18 = 1;
LABEL_18:
      CFAllocatorRef v19 = CFGetAllocator(v16);
      v44.length = result.location;
      v44.locatioCFIndex n = 0;
      CFStringRef v16 = CFStringCreateWithSubstring(v19, v16, v44);
      goto LABEL_19;
    }
    CFMutableDictionaryRef Mutable = 0;
    CFBooleanRef v12 = 0;
    int v24 = 1;
LABEL_43:
    BOOL v25 = 1;
LABEL_44:
    if (v11 == 0 && v25) {
      LODWORD(v26) = 0;
    }
    else {
      LODWORD(v26) = v24;
    }
    if (v25)
    {
      if (v26)
      {
        int v26 = (const void *)sub_1000ECF90(a1, Mutable, v12);
        if (v26)
        {
          CFTypeID v27 = cf;
          if (!cf) {
            CFTypeID v27 = CFArrayCreateMutable(a1, 0, &kCFTypeArrayCallBacks);
          }
          CFTypeRef cf = v27;
          CFArrayAppendValue(v27, v26);
          uint64_t v28 = (const void *)VSCFDictionaryGetValueIfType();
          if (!v28) {
            goto LABEL_59;
          }
          long long v29 = v28;
          CFStringRef v30 = theDict;
          if (theDict)
          {
            CFIndex v31 = (__CFArray *)CFDictionaryGetValue(theDict, v28);
            if (v31)
            {
LABEL_58:
              CFDictionaryRef theDict = v30;
              CFArrayAppendValue(v31, v26);
LABEL_59:
              CFRelease(v26);
              LODWORD(v26) = 1;
              goto LABEL_60;
            }
          }
          else
          {
            CFStringRef v30 = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          }
          CFIndex v31 = CFArrayCreateMutable(a1, 0, &kCFTypeArrayCallBacks);
          CFDictionarySetValue(v30, v29, v31);
          CFRelease(v31);
          goto LABEL_58;
        }
      }
    }
LABEL_60:
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v12) {
      CFRelease(v12);
    }
    uint64_t v9 = v37 + 1;
  }
  while (v37 + 1 < Count && v26);
  CFDictionaryRef v8 = theDict;
  if (!v26)
  {
LABEL_69:
    if (cf)
    {
      CFDictionaryRef v32 = v8;
      CFRelease(cf);
      CFDictionaryRef v8 = v32;
    }
    if (v8)
    {
      CFRelease(v8);
      return 0;
    }
    return v8;
  }
LABEL_74:
  if (v33)
  {
    *CFStringRef v33 = v8;
  }
  else if (v8)
  {
    CFRelease(v8);
  }
  return cf;
}

CFDictionaryRef sub_1000EA714(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
  CFRetain(*(CFTypeRef *)(a1 + 16));
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 16));
  CFTypeID v4 = sub_1000EA850(a2, v2);
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 16));
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      CFDictionaryRef v5 = (const __CFDictionary *)[(NSString *)v4 cacheValidityIdentifier];
      CFDictionaryRef v6 = v5;
      if (v5) {
        CFRetain(v5);
      }
    }
    else
    {
      CFDictionaryRef v6 = 0;
    }
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 16));
    CFMutableDictionaryRef Mutable = *(__CFDictionary **)(a2 + 128);
    if (!Mutable)
    {
      CFAllocatorRef v8 = CFGetAllocator((CFTypeRef)a2);
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v8, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      *(void *)(a2 + 128) = Mutable;
    }
    CFDictionarySetValue(Mutable, v2, v4);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 16));
    CFRelease(v4);
  }
  else
  {
    CFDictionaryRef v6 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&off_1000FE5C8, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  CFRelease(v2);
  return v6;
}

NSString *sub_1000EA850(uint64_t a1, void *key)
{
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 128);
  if (v4 && (CFStringRef Value = (NSString *)CFDictionaryGetValue(v4, key)) != 0)
  {
    CFDictionaryRef v6 = Value;
    CFRetain(Value);
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 128), key);
  }
  else
  {
    CFDictionaryRef v6 = sub_1000EA948(a1, (uint64_t)key, @"VSRecognitionModelDataProvider", (uint64_t)&OBJC_PROTOCOL___VSRecognitionModelDataProvider);
    if (v6 && (objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      CFAllocatorRef v7 = VSGetLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "data provider does not implement value method\n", v9, 2u);
      }

      return 0;
    }
  }
  return v6;
}

NSString *sub_1000EA948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFRange result = (NSString *)sub_1000EA0BC(a1);
  if (result)
  {
    CFDictionaryGetTypeID();
    CFRange result = (NSString *)VSCFDictionaryGetValueIfType();
    if (result)
    {
      CFStringGetTypeID();
      CFRange result = (NSString *)VSCFDictionaryGetValueIfType();
      if (result)
      {
        CFAllocatorRef v7 = result;
        CFErrorRef error = 0;
        if (!*(unsigned char *)(a1 + 88))
        {
          int v8 = CFBundleLoadExecutableAndReturnError(*(CFBundleRef *)(a1 + 80), &error);
          CFErrorRef v9 = error;
          if (!v8 && error)
          {
            CFRange v10 = VSGetLogDefault();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)CFRunLoopSourceContext buf = 136315138;
              uint64_t v18 = "_LoadPluginIfNecessary";
              _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: error loading plugin:\n", buf, 0xCu);
            }
            CFIndex v11 = VSGetLogDefault();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)CFRunLoopSourceContext buf = 138412290;
              uint64_t v18 = (const char *)error;
              _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
            CFErrorRef v9 = error;
          }
          if (v9) {
            CFRelease(v9);
          }
          *(unsigned char *)(a1 + 88) = 1;
        }
        Class v12 = NSClassFromString(v7);
        if (v12)
        {
          CFTypeID v13 = v12;
          if (!a4 || [(objc_class *)v12 conformsToProtocol:a4]) {
            return (NSString *)objc_alloc_init(v13);
          }
          CFIndex v14 = VSGetLogDefault();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            return 0;
          }
          *(_DWORD *)CFRunLoopSourceContext buf = 136315138;
          uint64_t v18 = "_InstantiatePluginClassWithRecognitionModelKeyedName";
          uint64_t v15 = "%s: plugin class does not conform to appropriate protocol\n";
        }
        else
        {
          CFIndex v14 = VSGetLogDefault();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            return 0;
          }
          *(_DWORD *)CFRunLoopSourceContext buf = 136315138;
          uint64_t v18 = "_InstantiatePluginClassWithRecognitionModelKeyedName";
          uint64_t v15 = "%s: plugin class not found\n";
        }
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_1000EABA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 16);
  if (!v3) {
    return 0;
  }
  CFRetain(*(CFTypeRef *)(a1 + 16));
  pthread_mutex_lock((pthread_mutex_t *)(a3 + 16));
  CFDictionaryRef v6 = sub_1000EA850(a3, v3);
  pthread_mutex_unlock((pthread_mutex_t *)(a3 + 16));
  if (v6)
  {
    if (objc_opt_respondsToSelector()) {
      a2 = (uint64_t)[(NSString *)v6 isCacheValidityIdentifierValid:a2];
    }
    else {
      a2 = 0;
    }
    pthread_mutex_lock((pthread_mutex_t *)(a3 + 16));
    CFMutableDictionaryRef Mutable = *(__CFDictionary **)(a3 + 128);
    if (!Mutable)
    {
      CFAllocatorRef v10 = CFGetAllocator((CFTypeRef)a3);
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v10, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      *(void *)(a3 + 128) = Mutable;
    }
    CFDictionarySetValue(Mutable, v3, v6);
    pthread_mutex_unlock((pthread_mutex_t *)(a3 + 16));
    CFRelease(v6);
  }
  else if (a2)
  {
    CFBooleanRef Value = (CFBooleanRef)CFDictionaryGetValue((CFDictionaryRef)a2, @"isvalid");
    if (Value) {
      BOOL v8 = Value == kCFBooleanTrue;
    }
    else {
      BOOL v8 = 0;
    }
    a2 = v8;
  }
  CFRelease(v3);
  return a2;
}

uint64_t sub_1000EACD0(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  if (*(void *)(a2 + 48)) {
    return 0;
  }
  CFStringRef v6 = *(const __CFString **)(a1 + 16);
  if (v6) {
    CFRetain(*(CFTypeRef *)(a1 + 16));
  }
  CFStringRef v7 = *(const __CFString **)(a2 + 16);
  if (v7) {
    CFRetain(v7);
  }
  pthread_mutex_lock(&stru_100101830);
  if (qword_100106A78) {
    uint64_t v3 = sub_1000EDD34(qword_100106A78, v6, v7, a3);
  }
  else {
    uint64_t v3 = 0;
  }
  pthread_mutex_unlock(&stru_100101830);
  if (v6) {
    CFRelease(v6);
  }
  if (v7) {
    CFRelease(v7);
  }
  return v3;
}

void sub_1000EAD88(uint64_t a1, void *a2, const void *a3, const void *a4)
{
  CFStringRef v6 = a2;
  if (!a1)
  {
    CFStringRef v7 = 0;
    if (!a2) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  CFStringRef v7 = *(const void **)(a1 + 16);
  if (v7) {
    CFRetain(*(CFTypeRef *)(a1 + 16));
  }
  if (v6)
  {
LABEL_7:
    CFStringRef v6 = (void *)v6[2];
    if (v6) {
      CFRetain(v6);
    }
  }
LABEL_9:
  pthread_once(&stru_100101870, (void (*)(void))sub_1000E611C);
  CFDictionaryRef v8 = (const __CFDictionary *)pthread_getspecific(qword_100106A80);
  if (!v8) {
    goto LABEL_16;
  }
  CFErrorRef v9 = v8;
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v8, v7);
  if (!Value)
  {
    CFAllocatorRef v13 = kCFAllocatorDefault;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v9, v7, Mutable);
    CFRelease(Mutable);
    goto LABEL_14;
  }
  CFMutableDictionaryRef Mutable = Value;
  Class v12 = (void *)CFDictionaryGetValue(Value, v6);
  if (!v12)
  {
    CFAllocatorRef v13 = kCFAllocatorDefault;
LABEL_14:
    Class v12 = CFDictionaryCreateMutable(v13, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, v6, v12);
    CFRelease(v12);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)v12, a3, a4);
LABEL_16:
  if (v7) {
    CFRelease(v7);
  }
  if (v6)
  {
    CFRelease(v6);
  }
}

uint64_t sub_1000EAF24(void *a1, const void **a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    CFDictionaryRef v8 = *a2;
    if (a4) {
      goto LABEL_3;
    }
    return 1;
  }
  CFDictionaryRef v8 = 0;
  if (!a4) {
    return 1;
  }
LABEL_3:
  pthread_mutex_lock((pthread_mutex_t *)(a4 + 16));
  CFErrorRef v9 = (const void *)a1[2];
  if (v9)
  {
    CFRetain(v9);
    if (v8)
    {
      newValues = 0;
      CFDictionaryRef v10 = *(const __CFDictionary **)(a4 + 104);
      if (v10)
      {
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v10, v9);
        if (Value)
        {
          CFDictionaryRef v12 = Value;
          PhraseCFIndex Count = VSRecognitionResultGetPhraseCount();
          VSRecognitionResultCopyClassIDsAndPhrases();
          if (PhraseCount >= 1)
          {
            uint64_t v32 = a3;
            CFArrayRef MutableCopy = 0;
            for (CFIndex i = 0; i != PhraseCount; ++i)
            {
              CFURLRef ValueAtIndex = CFArrayGetValueAtIndex(0, i);
              if (ValueAtIndex)
              {
                CFDictionaryRef v17 = (const __CFDictionary *)CFDictionaryGetValue(v12, ValueAtIndex);
                if (v17)
                {
                  CFDictionaryRef v18 = v17;
                  CFAllocatorRef v19 = CFArrayGetValueAtIndex(0, i);
                  newValues = (void *)CFDictionaryGetValue(v18, v19);
                  if (newValues)
                  {
                    if (!MutableCopy)
                    {
                      CFAllocatorRef v20 = CFGetAllocator(v8);
                      CFArrayRef MutableCopy = CFArrayCreateMutableCopy(v20, 0, 0);
                    }
                    v34.locatioCFIndex n = i;
                    v34.length = 1;
                    CFArrayReplaceValues(MutableCopy, v34, (const void **)&newValues, 1);
                  }
                }
              }
            }
            a3 = v32;
            if (MutableCopy)
            {
              CFGetAllocator(v8);
              VSRecognitionResultGetModelIdentifier();
              a3 = v32;
              CFMutableStringRef v21 = (const void *)VSRecognitionResultCreate();
              CFRelease(MutableCopy);
              if (v21) {
                goto LABEL_24;
              }
            }
          }
        }
      }
      goto LABEL_23;
    }
  }
  else if (v8)
  {
    newValues = 0;
LABEL_23:
    CFRetain(v8);
    CFMutableStringRef v21 = v8;
LABEL_24:
    char v23 = 0;
    goto LABEL_26;
  }
  CFMutableStringRef v21 = 0;
  char v23 = 1;
LABEL_26:
  if (v21) {
    int v24 = v21;
  }
  else {
    int v24 = v8;
  }
  CFDictionaryRef v25 = *(const __CFDictionary **)(a4 + 120);
  if (v25 && (int v26 = (NSString *)CFDictionaryGetValue(v25, a1)) != 0)
  {
    CFTypeID v27 = v26;
    CFRetain(v26);
  }
  else
  {
    CFTypeID v27 = sub_1000EA948(a4, (uint64_t)v9, @"VSRecognitionResultValidator", (uint64_t)&OBJC_PROTOCOL___VSRecognitionResultValidator);
    if (v27)
    {
      CFMutableDictionaryRef Mutable = *(__CFDictionary **)(a4 + 120);
      if (!Mutable)
      {
        CFAllocatorRef v29 = CFGetAllocator((CFTypeRef)a4);
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v29, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        *(void *)(a4 + 120) = Mutable;
      }
      CFDictionarySetValue(Mutable, a1, v27);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a4 + 16));
  if (v9) {
    CFRelease(v9);
  }
  if (!v27)
  {
    BOOL v22 = 1;
    goto LABEL_46;
  }
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0) {
    id v30 = [(NSString *)v27 validRecognitionResultFromRecognitionResult:v24 knownDisambiguationValues:VSRecognitionDisambiguationContextGetKnownClassValues()];
  }
  else {
    id v30 = [(NSString *)v27 validRecognitionResultFromRecognitionResult:v24];
  }
  int v24 = v30;
  BOOL v22 = v30 != 0;
  CFRelease(v27);
  if (v22)
  {
LABEL_46:
    if (v24 && v24 != v8)
    {
      if ((v23 & 1) == 0) {
        CFRelease(v8);
      }
      CFRetain(v24);
      if (a2) {
        *a2 = v24;
      }
    }
  }
  if (v21) {
    CFRelease(v21);
  }
  return v22;
}

__CFArray *sub_1000EB24C(uint64_t a1, CFArrayRef theArray, char *a3)
{
  if (!theArray) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  CFRange result = 0;
  if (a3 && Count >= 1)
  {
    CFIndex v8 = 0;
    CFErrorRef v9 = 0;
    CFMutableDictionaryRef Mutable = 0;
    int v24 = (pthread_mutex_t *)(a3 + 16);
    CFIndex v11 = &kCFTypeArrayCallBacks;
    while (1)
    {
      CFURLRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v8);
      uint64_t v13 = sub_1000ECBF8((uint64_t)ValueAtIndex);
      if (v13)
      {
        CFIndex v14 = (const void *)v13;
        if (!Mutable) {
          goto LABEL_7;
        }
      }
      else
      {
        if (!v9)
        {
          CFStringRef v16 = *(void **)(a1 + 16);
          if (!v16) {
            goto LABEL_23;
          }
          CFRetain(*(CFTypeRef *)(a1 + 16));
          long long v25 = 0u;
          long long v26 = 0u;
          pthread_mutex_lock(v24);
          CFDictionaryRef v17 = sub_1000EA850((uint64_t)a3, v16);
          pthread_mutex_unlock(v24);
          if (!v17) {
            goto LABEL_22;
          }
          uint64_t v18 = a1;
          CFAllocatorRef v19 = v11;
          CFAllocatorRef v20 = (const void **)malloc_type_malloc(0x10uLL, 0x108004022EE8E53uLL);
          *CFAllocatorRef v20 = v17;
          *((unsigned char *)v20 + 8) = objc_opt_respondsToSelector() & 1;
          *((unsigned char *)v20 + 9) = objc_opt_respondsToSelector() & 1;
          *(void *)&long long v25 = v20;
          *((void *)&v25 + 1) = sub_1000EB6B4;
          *(void *)&long long v26 = sub_1000EB4D4;
          *((void *)&v26 + 1) = sub_1000EB48C;
          CFAllocatorRef v21 = CFGetAllocator(a3);
          uint64_t v22 = sub_1000EB878((uint64_t)v21, &v25);
          if (!v22)
          {
            sub_1000EB48C(v20);
LABEL_22:
            CFRelease(v16);
LABEL_23:
            char v23 = 0;
            CFRange result = 0;
            CFErrorRef v9 = Mutable;
            if (!Mutable) {
              return result;
            }
LABEL_19:
            CFRelease(v9);
            return v23;
          }
          CFErrorRef v9 = (const void *)v22;
          CFRelease(v16);
          CFIndex v11 = v19;
          a1 = v18;
        }
        CFRetain(v9);
        CFIndex v14 = v9;
        if (!Mutable)
        {
LABEL_7:
          CFAllocatorRef v15 = CFGetAllocator(a3);
          CFMutableDictionaryRef Mutable = CFArrayCreateMutable(v15, 0, v11);
        }
      }
      CFArrayAppendValue(Mutable, v14);
      CFRelease(v14);
      if (Count == ++v8)
      {
        char v23 = Mutable;
        CFRange result = Mutable;
        if (!v9) {
          return result;
        }
        goto LABEL_19;
      }
    }
  }
  return result;
}

void sub_1000EB48C(const void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      CFRelease(v2);
    }
    free(a1);
  }
}

BOOL sub_1000EB4D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, CFTypeRef *a7, void *a8)
{
  CFTypeRef cf = 0;
  CFIndex v14 = *(const void **)(a3 + 16);
  if (v14) {
    CFRetain(*(CFTypeRef *)(a3 + 16));
  }
  CFAllocatorRef v15 = *(const void **)(a2 + 16);
  if (v15) {
    CFRetain(v15);
  }
  if (a5)
  {
    CFStringRef v16 = *(void **)a5;
    uint64_t v22 = 0;
    BOOL v17 = v14 != 0;
    BOOL v18 = v15 != 0;
    if (v14 && v15)
    {
      if (*(unsigned char *)(a5 + 8)) {
        [v16 getValue:&cf weight:&v22 atIndex:a4 forClassWithIdentifier:v14 inModelWithIdentifier:v15];
      }
      else {
        CFTypeRef cf = [v16 valueAtIndex:a4 forClassWithIdentifier:v14 inModelWithIdentifier:v15];
      }
      id v20 = 0;
      if (a8 && *(unsigned char *)(a5 + 9)) {
        id v20 = [v16 phoneticValueAtIndex:a4 forClassWithIdentifier:v14 inModelWithIdentifier:v15];
      }
      CFTypeRef v19 = cf;
      if (!cf) {
        goto LABEL_25;
      }
LABEL_24:
      CFRetain(v19);
LABEL_25:
      if (v20) {
        CFRetain(v20);
      }
      CFRelease(v14);
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v22 = 0;
    BOOL v17 = v14 != 0;
    BOOL v18 = v15 != 0;
    if (v14 && v15)
    {
      CFTypeRef v19 = [0 valueAtIndex:a4 forClassWithIdentifier:v14 inModelWithIdentifier:v15];
      id v20 = 0;
      CFTypeRef cf = v19;
      if (!v19) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  if (v17)
  {
    CFRelease(v14);
    id v20 = 0;
    if (!v18) {
      goto LABEL_29;
    }
LABEL_28:
    CFRelease(v15);
    goto LABEL_29;
  }
  id v20 = 0;
  if (v18) {
    goto LABEL_28;
  }
LABEL_29:
  if (a6) {
    *a6 = v22;
  }
  if (a7)
  {
    *a7 = cf;
  }
  else if (cf)
  {
    CFRelease(cf);
  }
  if (a8)
  {
    *a8 = v20;
  }
  else if (v20)
  {
    CFRelease(v20);
  }
  return cf != 0;
}

id sub_1000EB6B4(uint64_t a1, uint64_t a2, uint64_t a3, void **a4)
{
  CFStringRef v6 = *(const void **)(a3 + 16);
  if (v6) {
    CFRetain(*(CFTypeRef *)(a3 + 16));
  }
  CFStringRef v7 = *(const void **)(a2 + 16);
  if (v7) {
    CFRetain(v7);
  }
  if (a4)
  {
    CFIndex v8 = *a4;
    if (!v6)
    {
LABEL_11:
      id v9 = 0;
      id v10 = 0;
      if (!v6) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else
  {
    CFIndex v8 = 0;
    if (!v6) {
      goto LABEL_11;
    }
  }
  if (!v7) {
    goto LABEL_11;
  }
  id v9 = [v8 valueCountForClassWithIdentifier:v6 inModelWithIdentifier:v7];
LABEL_12:
  CFRelease(v6);
  id v10 = v9;
LABEL_13:
  if (v7) {
    CFRelease(v7);
  }
  return v10;
}

void sub_1000EB758()
{
  if (!qword_100106AB0)
  {
    *(_OWORD *)keys = *(_OWORD *)off_1000FE590;
    long long v3 = *(_OWORD *)off_1000FE5A0;
    long long v4 = *(_OWORD *)off_1000FE5B0;
    CFStringRef v5 = @"VSRecognitionClassTypeAlbumName";
    v0[0] = xmmword_1000F68D0;
    v0[1] = xmmword_1000F68E0;
    v0[2] = xmmword_1000F68F0;
    uint64_t v1 = 6;
    qword_100106AB0 = (uint64_t)CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)v0, 7, &kCFTypeDictionaryKeyCallBacks, 0);
  }
}

uint64_t sub_1000EB828()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_100106AB8 = result;
  return result;
}

BOOL sub_1000EB850(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1000EB85C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 16);
  if (result)
  {
    long long v3 = *(uint64_t (**)(void))(a1 + 40);
    if (v3) {
      return v3();
    }
  }
  return result;
}

uint64_t sub_1000EB878(uint64_t a1, _OWORD *a2)
{
  if (!a2) {
    return 0;
  }
  pthread_once(&stru_1001019B0, (void (*)(void))sub_1000EB828);
  uint64_t result = _CFRuntimeCreateInstance();
  if (result)
  {
    long long v4 = a2[1];
    *(_OWORD *)(result + 16) = *a2;
    *(_OWORD *)(result + 32) = v4;
  }
  return result;
}

uint64_t sub_1000EB8EC()
{
  qword_100106AC0 = _CFRuntimeRegisterClass();
  return pthread_mutex_init(&stru_100106AC8, 0);
}

BOOL sub_1000EB930(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_1000EB93C(void *a1)
{
  uint64_t v2 = (const void *)a1[70];
  if (v2) {
    CFRelease(v2);
  }
  long long v3 = (const void *)a1[71];
  if (v3) {
    CFRelease(v3);
  }
  long long v4 = (const void *)a1[2];
  if (v4) {
    CFRelease(v4);
  }
  CFStringRef v5 = (void *)a1[67];
  if (v5 && a1 + 3 != v5) {
    free(v5);
  }
  CFStringRef v6 = (const void *)a1[73];
  if (v6) {
    CFRelease(v6);
  }
  CFStringRef v7 = (const void *)a1[72];
  if (v7) {
    CFRelease(v7);
  }
  CFIndex v8 = (void (*)(uint64_t))a1[80];
  if (v8)
  {
    uint64_t v9 = a1[82];
    v8(v9);
  }
}

uint64_t sub_1000EB9D8(const __CFAllocator *a1, const void *a2, uint64_t a3, char a4, CFArrayRef theArray, const __CFArray *a6, const __CFDictionary *a7, const void *a8, long long *a9, uint64_t a10)
{
  uint64_t v10 = 0;
  if (theArray && a6)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1
      && (CFIndex v20 = Count,
          CFTypeRef cf = a8,
          (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)) != 0))
    {
      CFDictionaryRef v22 = Mutable;
      v40.locatioCFIndex n = 0;
      v40.length = v20;
      CFArrayApplyFunction(theArray, v40, (CFArrayApplierFunction)sub_1000EBCC8, Mutable);
      uint64_t v10 = 0;
      if (CFDictionaryGetCount(v22) == v20)
      {
        CFArrayRef Copy = CFArrayCreateCopy(a1, a6);
        if (Copy)
        {
          CFArrayRef v24 = Copy;
          if (a7) {
            a7 = CFDictionaryCreateCopy(a1, a7);
          }
          CFIndex v25 = CFDictionaryGetCount(v22);
          CFIndex v26 = CFArrayGetCount(v24);
          uint64_t v10 = 0;
          if (v25 >= 1 && v26 >= 1)
          {
            pthread_once(&stru_1001019C0, (void (*)(void))sub_1000EB8EC);
            uint64_t Instance = _CFRuntimeCreateInstance();
            uint64_t v10 = Instance;
            if (Instance)
            {
              if (a2)
              {
                *(void *)(Instance + 16) = a2;
                CFRetain(a2);
                CFStringRef v28 = *(const __CFString **)(v10 + 16);
              }
              else
              {
                pthread_mutex_lock(&stru_100106AC8);
                uint64_t v29 = qword_100106B08++;
                pthread_mutex_unlock(&stru_100106AC8);
                CFStringRef v28 = CFStringCreateWithFormat(a1, 0, @"dflt%ld", v29);
                *(void *)(v10 + 16) = v28;
              }
              *(void *)(v10 + 536) = 0;
              if (v28)
              {
                CFIndex Length = CFStringGetLength(v28);
                if (Length >= 1)
                {
                  if ((unint64_t)Length > 0x1FE)
                  {
                    CFIndex v32 = Length + 1;
                    CFIndex v31 = (char *)malloc_type_malloc(Length + 1, 0xACF3549BuLL);
                  }
                  else
                  {
                    CFIndex v31 = (char *)(v10 + 24);
                    CFIndex v32 = Length + 1;
                  }
                  *(void *)(v10 + 536) = v31;
                  if (!CFStringGetCString(*(CFStringRef *)(v10 + 16), v31, v32, 0x8000100u))
                  {
                    if (*(void *)(v10 + 536) != v10 + 24) {
                      free((void *)(v10 + 24));
                    }
                    *(void *)(v10 + 536) = 0;
                  }
                }
              }
              *(void *)(v10 + 544) = a3;
              *(unsigned char *)(v10 + 552) = a4;
              *(void *)(v10 + 560) = v22;
              *(void *)(v10 + 568) = v24;
              *(void *)(v10 + 584) = a7;
              CFTypeRef v33 = cf;
              if (cf) {
                CFTypeRef v33 = CFRetain(cf);
              }
              *(void *)(v10 + 576) = v33;
              *(unsigned char *)(v10 + 648) = 0;
              *(void *)(v10 + 656) = a10;
              if (a9)
              {
                long long v34 = *a9;
                long long v35 = a9[1];
                long long v36 = a9[2];
                *(void *)(v10 + 640) = *((void *)a9 + 6);
                *(_OWORD *)(v10 + 608) = v35;
                *(_OWORD *)(v10 + 624) = v36;
              }
              else
              {
                *(void *)(v10 + 640) = 0;
                long long v34 = 0uLL;
                *(_OWORD *)(v10 + 608) = 0u;
                *(_OWORD *)(v10 + 624) = 0u;
              }
              *(_OWORD *)(v10 + 592) = v34;
              CFRetain(*(CFTypeRef *)(v10 + 560));
              CFRetain(*(CFTypeRef *)(v10 + 568));
              uint64_t v37 = *(const void **)(v10 + 584);
              if (v37) {
                CFRetain(v37);
              }
            }
          }
          CFRelease(v24);
          if (a7) {
            CFRelease(a7);
          }
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
      CFRelease(v22);
    }
    else
    {
      return 0;
    }
  }
  return v10;
}

void sub_1000EBCC8(CFTypeRef *a1, __CFDictionary *a2)
{
  CFTypeRef v2 = a1[2];
  if (v2)
  {
    CFRetain(a1[2]);
    CFDictionarySetValue(a2, v2, a1);
    CFRelease(v2);
  }
}

CFMutableArrayRef sub_1000EBD38(CFDictionaryRef *a1)
{
  CFDictionaryRef v2 = a1[70];
  if (!v2 || !CFDictionaryGetCount(v2)) {
    return 0;
  }
  CFAllocatorRef v3 = CFGetAllocator(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(v3, 0, &kCFTypeArrayCallBacks);
  CFDictionaryApplyFunction(a1[70], (CFDictionaryApplierFunction)sub_1000ECA28, Mutable);
  return Mutable;
}

const void *sub_1000EBDAC(const __CFDictionary *a1, const void *a2)
{
  if (!a1) {
    return 0;
  }
  CFDictionaryRef Value = CFDictionaryGetValue(a1, a2);
  CFAllocatorRef v3 = Value;
  if (Value) {
    CFRetain(Value);
  }
  return v3;
}

void sub_1000EBDEC(const void **a1)
{
  if (a1)
  {
    CFDictionaryRef v2 = *a1;
    if (v2) {
      CFRelease(v2);
    }
    CFAllocatorRef v3 = a1[1];
    if (v3) {
      CFRelease(v3);
    }
    long long v4 = a1[2];
    if (v4) {
      CFRelease(v4);
    }
    free(a1);
  }
}

uint64_t sub_1000EBE4C(const void *a1, uint64_t a2, const void *a3, uint64_t a4)
{
  if (!a4) {
    return 0;
  }
  uint64_t MutableArray = 0;
  if (a3 && a2 && *(void *)(a4 + 16))
  {
    CFStringRef v7 = *(const void **)(a2 + 16);
    if (v7)
    {
      CFRetain(*(CFTypeRef *)(a2 + 16));
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a4 + 16), v7);
      if (Value)
      {
        CFSetRef v10 = (const __CFSet *)CFDictionaryGetValue(Value, a3);
        uint64_t MutableArray = (uint64_t)v10;
        if (!v10)
        {
LABEL_12:
          CFRelease(v7);
          return MutableArray;
        }
        if (CFSetGetCount(v10) >= 1)
        {
          CFGetAllocator(a1);
          uint64_t MutableArray = VSCFSetCreateMutableArray();
          goto LABEL_12;
        }
      }
      uint64_t MutableArray = 0;
      goto LABEL_12;
    }
    return 0;
  }
  return MutableArray;
}

void sub_1000EBF18(const void *a1, uint64_t a2, const void *a3, const void *a4, uint64_t a5)
{
  if (!a4) {
    return;
  }
  if (!a3) {
    return;
  }
  if (!a2) {
    return;
  }
  if (!a5) {
    return;
  }
  CFStringRef v7 = *(const void **)(a2 + 16);
  if (!v7) {
    return;
  }
  CFRetain(*(CFTypeRef *)(a2 + 16));
  CFDictionaryRef v10 = *(const __CFDictionary **)(a5 + 16);
  if (!v10 || (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v10, v7)) == 0)
  {
    CFAllocatorRef v14 = CFGetAllocator(a1);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v14, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFAllocatorRef v15 = *(__CFDictionary **)(a5 + 16);
    if (!v15)
    {
      CFAllocatorRef v16 = CFGetAllocator(a1);
      CFAllocatorRef v15 = CFDictionaryCreateMutable(v16, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      *(void *)(a5 + 16) = v15;
    }
    CFDictionarySetValue(v15, v7, Mutable);
    CFRelease(Mutable);
    goto LABEL_14;
  }
  CFMutableDictionaryRef Mutable = Value;
  uint64_t v13 = (void *)CFDictionaryGetValue(Value, a4);
  if (!v13)
  {
LABEL_14:
    CFAllocatorRef v17 = CFGetAllocator(a1);
    uint64_t v13 = CFSetCreateMutable(v17, 0, &kCFTypeSetCallBacks);
    CFDictionarySetValue(Mutable, a4, v13);
    CFRelease(v13);
  }
  CFSetAddValue((CFMutableSetRef)v13, a3);
  CFRelease(v7);
}

uint64_t sub_1000EC06C(uint64_t a1, CFTypeRef *a2, uint64_t a3, void *a4)
{
  CFTypeRef v50 = 0;
  if (!a2) {
    return 1;
  }
  uint64_t v5 = 0;
  if (!a4) {
    return v5;
  }
  CFTypeRef v7 = *a2;
  if (!*a2) {
    return v5;
  }
  if (!a4[1] || !*a4) {
    return 0;
  }
  CFAllocatorRef allocator = CFGetAllocator(*a2);
  CFDictionaryRef KnownClassValues = (const __CFDictionary *)VSRecognitionDisambiguationContextGetKnownClassValues();
  SequenceTag = (const void *)VSRecognitionDisambiguationContextGetSequenceTag();
  if (!SequenceTag) {
    return 1;
  }
  CFArrayRef v10 = (const __CFArray *)sub_1000EBDAC(*(const __CFDictionary **)(*a4 + 584), SequenceTag);
  CFArrayRef v11 = v10;
  if (!v10 || (Count = CFArrayGetCount(v10), Count < 1) || (CFIndex v13 = Count, VSRecognitionResultGetPhraseCount() < 1))
  {
    long long v36 = 0;
    uint64_t v5 = 1;
    goto LABEL_53;
  }
  CFStringRef v38 = a2;
  CFStringRef v39 = a4;
  VSRecognitionResultCopyClassIDsAndPhrases();
  CFAllocatorRef v14 = 0;
  CFRange v40 = 0;
  CFArrayRef v41 = v11;
  CFIndex v15 = 0;
  CFIndex v16 = 0;
  CFIndex v42 = v13;
  CFTypeRef v43 = v7;
  CFDictionaryRef v47 = KnownClassValues;
  do
  {
    CFURLRef ValueAtIndex = (CFArrayRef *)CFArrayGetValueAtIndex(v11, v15);
    CFIndex v18 = CFArrayGetCount(ValueAtIndex[2]);
    if (v18 >= v16)
    {
      uint64_t v19 = v18;
      CFIndex v45 = v16;
      CFTypeRef cf = v14;
      CFArrayRef theArray = CFArrayCreateMutable(allocator, 0, &kCFTypeArrayCallBacks);
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(allocator, 0, &kCFTypeArrayCallBacks);
      if (v19 >= 1)
      {
        int v20 = 0;
        for (CFIndex i = 0; i < v19; ++i)
        {
          CFDictionaryRef v22 = CFArrayGetValueAtIndex(ValueAtIndex[2], i);
          char v23 = (const void *)*((void *)v22 + 2);
          if (!v23) {
            break;
          }
          CFRetain(*((CFTypeRef *)v22 + 2));
          CFDictionaryRef Value = CFDictionaryGetValue(KnownClassValues, v23);
          if (Value) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v20 == 0;
          }
          if (v25)
          {
            PhraseCFIndex Count = VSRecognitionResultGetPhraseCount();
            if (v19 - i >= PhraseCount)
            {
              CFIndex v28 = PhraseCount;
              if (PhraseCount >= 1)
              {
                CFIndex v29 = 0;
                while (1)
                {
                  id v30 = CFArrayGetValueAtIndex(ValueAtIndex[2], i + v29);
                  CFStringRef v31 = (const __CFString *)*((void *)v30 + 2);
                  if (!v31) {
                    break;
                  }
                  CFRetain(*((CFTypeRef *)v30 + 2));
                  CFStringRef v32 = (const __CFString *)CFArrayGetValueAtIndex(0, v29);
                  CFComparisonResult v33 = CFStringCompare(v31, v32, 0);
                  CFRelease(v31);
                  if (++v29 >= v28 || v33)
                  {
                    if (v33 == kCFCompareEqualTo)
                    {
                      CFArrayRef v11 = v41;
                      goto LABEL_30;
                    }
                    break;
                  }
                }
                CFRelease(v23);
                CFArrayRef v11 = v41;
                CFTypeRef v7 = v43;
                CFDictionaryRef KnownClassValues = v47;
                break;
              }
LABEL_30:
              v51.locatioCFIndex n = 0;
              v51.length = v28;
              CFArrayAppendArray(theArray, 0, v51);
              v52.locatioCFIndex n = 0;
              v52.length = v28;
              CFArrayAppendArray(Mutable, 0, v52);
              CFIndex i = i + v28 - 1;
              int v20 = 1;
              CFTypeRef v7 = v43;
            }
            else
            {
              int v20 = 1;
            }
            CFDictionaryRef KnownClassValues = v47;
          }
          else
          {
            CFIndex v26 = Value;
            if (Value)
            {
              CFArrayAppendValue(theArray, v23);
              CFArrayAppendValue(Mutable, v26);
            }
          }
          CFRelease(v23);
        }
      }
      if (CFArrayGetCount(theArray) == v19 && CFArrayGetCount(Mutable) == v19)
      {
        CFIndex v13 = v42;
        if (cf) {
          CFRelease(cf);
        }
        long long v34 = v40;
        if (!v40)
        {
          long long v34 = *(const void **)(*v39 + 16);
          if (v34) {
            CFRetain(*(CFTypeRef *)(*v39 + 16));
          }
        }
        CFRange v40 = v34;
        CFAllocatorRef v14 = (const void *)VSRecognitionResultCreate();
        CFTypeRef v50 = v14;
        CFIndex v16 = v19;
      }
      else
      {
        CFIndex v13 = v42;
        CFIndex v16 = v45;
        CFAllocatorRef v14 = cf;
      }
      CFRelease(theArray);
      CFRelease(Mutable);
    }
    ++v15;
  }
  while (v15 != v13);
  if (!v14)
  {
    uint64_t v5 = 1;
    long long v36 = v40;
    goto LABEL_53;
  }
  long long v35 = *(uint64_t (**)(void, CFTypeRef *, void, void))(*v39 + 600);
  if (!v35)
  {
    uint64_t v5 = 1;
    long long v36 = v40;
    goto LABEL_60;
  }
  uint64_t v5 = v35(*v39, &v50, v39[1], *(void *)(*v39 + 656));
  long long v36 = v40;
  if (v5)
  {
LABEL_60:
    CFRelease(v7);
    *CFStringRef v38 = v50;
    goto LABEL_53;
  }
  CFRelease(v50);
LABEL_53:
  if (v11) {
    CFRelease(v11);
  }
  if (v36) {
    CFRelease(v36);
  }
  return v5;
}

__CFArray *sub_1000EC478(const void *a1, CFArrayRef theArray, uint64_t *a3)
{
  if (theArray) {
    CFIndex Count = CFArrayGetCount(theArray);
  }
  else {
    CFIndex Count = 0;
  }
  CFAllocatorRef allocator = CFGetAllocator(a1);
  if (a3 && a3[1])
  {
    CFDictionaryRef KnownClassValues = (const __CFDictionary *)VSRecognitionDisambiguationContextGetKnownClassValues();
    CFDictionaryRef AmbiguousClassValues = (const __CFDictionary *)VSRecognitionDisambiguationContextGetAmbiguousClassValues();
  }
  else
  {
    CFDictionaryRef KnownClassValues = 0;
    CFDictionaryRef AmbiguousClassValues = 0;
  }
  if (Count < 1) {
    return 0;
  }
  CFIndex v8 = 0;
  uint64_t v9 = 0;
  CFIndex v10 = 0;
  CFMutableDictionaryRef Mutable = 0;
  do
  {
    CFURLRef ValueAtIndex = (CFTypeRef *)CFArrayGetValueAtIndex(theArray, v10);
    CFIndex v13 = ValueAtIndex;
    CFTypeRef v14 = ValueAtIndex[2];
    if (!v14)
    {
      newValues = 0;
      goto LABEL_25;
    }
    CFRetain(ValueAtIndex[2]);
    newValues = 0;
    if (!KnownClassValues)
    {
      if (!AmbiguousClassValues) {
        goto LABEL_24;
      }
LABEL_21:
      if (CFDictionaryGetValue(AmbiguousClassValues, v14)) {
        goto LABEL_22;
      }
LABEL_24:
      CFRelease(v14);
LABEL_25:
      if (!Mutable) {
        CFMutableDictionaryRef Mutable = CFArrayCreateMutable(allocator, 0, &kCFTypeArrayCallBacks);
      }
      CFArrayAppendValue(Mutable, v13);
      goto LABEL_28;
    }
    CFDictionaryRef Value = CFDictionaryGetValue(KnownClassValues, v14);
    if (Value) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = AmbiguousClassValues == 0;
    }
    if (!v16) {
      goto LABEL_21;
    }
    if (!Value) {
      goto LABEL_24;
    }
LABEL_22:
    if (v9)
    {
      newValues = v9;
      CFRelease(v14);
      goto LABEL_28;
    }
    *(void *)&long long v29 = a3[1];
    *((void *)&v29 + 1) = sub_1000EC998;
    id v30 = sub_1000EC8AC;
    CFStringRef v31 = &_CFRelease;
    uint64_t v9 = (void *)sub_1000EB878((uint64_t)allocator, &v29);
    newValues = v9;
    CFRelease(v14);
    if (!v9) {
      goto LABEL_25;
    }
LABEL_28:
    if (!v8) {
      CFIndex v8 = CFArrayCreateMutable(allocator, 0, &kCFTypeArrayCallBacks);
    }
    if (newValues) {
      CFAllocatorRef v17 = newValues;
    }
    else {
      CFAllocatorRef v17 = kCFNull;
    }
    CFArrayAppendValue(v8, v17);
    ++v10;
  }
  while (Count != v10);
  if (v9) {
    CFRelease(v9);
  }
  if (Mutable)
  {
    if (a3) {
      uint64_t v18 = *a3;
    }
    else {
      uint64_t v18 = 0;
    }
    CFArrayRef v19 = sub_1000EC768(v18, Mutable);
    if (v19)
    {
      CFArrayRef v20 = v19;
      CFIndex v21 = CFArrayGetCount(v19);
      if (v21 >= 1)
      {
        CFIndex v22 = v21;
        CFIndex v23 = 0;
        uint64_t v24 = 1;
        do
        {
          if (CFArrayGetValueAtIndex(v8, v24 - 1) == kCFNull)
          {
            newValues = (void *)CFArrayGetValueAtIndex(v20, v23);
            v33.locatioCFIndex n = v24 - 1;
            v33.length = 1;
            CFArrayReplaceValues(v8, v33, (const void **)&newValues, 1);
            ++v23;
          }
          if (v24 >= Count) {
            break;
          }
          ++v24;
        }
        while (v23 < v22);
      }
      BOOL v25 = v8;
LABEL_53:
      CFRelease(v20);
    }
    else
    {
      BOOL v25 = 0;
      CFArrayRef v20 = v8;
      if (v8) {
        goto LABEL_53;
      }
    }
    CFRelease(Mutable);
    return v25;
  }
  return v8;
}

CFArrayRef sub_1000EC768(uint64_t a1, CFArrayRef theArray)
{
  CFArrayRef v2 = theArray;
  CFArrayRef context = 0;
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (a1 && (uint64_t v5 = *(uint64_t (**)(uint64_t, const __CFArray *, void))(a1 + 592)) != 0)
    {
      CFArrayRef v2 = (const __CFArray *)v5(a1, v2, *(void *)(a1 + 656));
      if (!v2) {
        return v2;
      }
    }
    else
    {
      v8.locatioCFIndex n = 0;
      v8.length = Count;
      CFArrayApplyFunction(v2, v8, (CFArrayApplierFunction)sub_1000EC824, &context);
      CFArrayRef v2 = context;
      if (!context) {
        return v2;
      }
    }
    if (CFArrayGetCount(v2) != Count)
    {
      CFRelease(v2);
      return 0;
    }
  }
  return v2;
}

void sub_1000EC824(uint64_t a1, __CFArray **a2)
{
  uint64_t v3 = sub_1000ECBF8(a1);
  long long v4 = (const void *)v3;
  if (a2 && v3)
  {
    CFMutableDictionaryRef Mutable = *a2;
    if (*a2
      || (CFAllocatorRef v6 = CFGetAllocator(v4),
          CFMutableDictionaryRef Mutable = CFArrayCreateMutable(v6, 0, &kCFTypeArrayCallBacks),
          (*a2 = Mutable) != 0))
    {
      CFArrayAppendValue(Mutable, v4);
    }
  }
  else if (!v3)
  {
    return;
  }
  CFRelease(v4);
}

uint64_t sub_1000EC8AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, CFTypeRef *a7, CFTypeRef *a8)
{
  CFIndex v13 = *(const void **)(a3 + 16);
  if (v13) {
    CFRetain(*(CFTypeRef *)(a3 + 16));
  }
  if (a7) {
    *a7 = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a5 && v13)
  {
    if (!a4 && (KnownClassCFDictionaryRef Value = VSRecognitionDisambiguationContextGetKnownClassValue(), KnownClassValue)
      || (KnownClassCFDictionaryRef Value = VSRecognitionDisambiguationContextGetAmbiguousClassValueAtIndex(), KnownClassValue))
    {
      if (a7 && *a7) {
        CFRetain(*a7);
      }
      if (a8 && *a8) {
        CFRetain(*a8);
      }
    }
  }
  else
  {
    KnownClassCFDictionaryRef Value = 0;
    if (!v13) {
      return KnownClassValue;
    }
  }
  CFRelease(v13);
  return KnownClassValue;
}

CFIndex sub_1000EC998(uint64_t a1, uint64_t a2, uint64_t a3, CFIndex Count)
{
  long long v4 = *(const void **)(a3 + 16);
  if (!v4) {
    return 0;
  }
  CFRetain(*(CFTypeRef *)(a3 + 16));
  if (Count)
  {
    CFDictionaryRef KnownClassValues = (const __CFDictionary *)VSRecognitionDisambiguationContextGetKnownClassValues();
    if (KnownClassValues && CFDictionaryGetValue(KnownClassValues, v4))
    {
      CFIndex Count = 1;
    }
    else
    {
      CFDictionaryRef AmbiguousClassValues = (const __CFDictionary *)VSRecognitionDisambiguationContextGetAmbiguousClassValues();
      if (AmbiguousClassValues && (CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(AmbiguousClassValues, v4)) != 0) {
        CFIndex Count = CFArrayGetCount(Value);
      }
      else {
        CFIndex Count = 0;
      }
    }
  }
  CFRelease(v4);
  return Count;
}

void sub_1000ECA28(int a1, unsigned char *a2, CFMutableArrayRef theArray)
{
  if (a2)
  {
    if (a2[41]) {
      CFArrayAppendValue(theArray, a2);
    }
  }
}

CFDictionaryRef sub_1000ECA40(void *cf)
{
  CFArrayRef v2 = (uint64_t (*)(void *, void))cf[79];
  if (!v2 || (CFDictionaryRef result = (CFDictionaryRef)v2(cf, cf[82])) == 0)
  {
    CFAllocatorRef v4 = CFGetAllocator(cf);
    return CFDictionaryCreate(v4, 0, 0, 0, 0, 0);
  }
  return result;
}

uint64_t sub_1000ECAB0()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_100106B10 = result;
  return result;
}

BOOL sub_1000ECAD8(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_1000ECAE4(uint64_t a1)
{
  CFArrayRef v2 = *(const void **)(a1 + 16);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t sub_1000ECB34(uint64_t a1, const void *a2, uint64_t a3, char a4, uint64_t a5, const void *a6, char a7)
{
  if (!a2) {
    return 0;
  }
  pthread_once(&stru_1001019D0, (void (*)(void))sub_1000ECAB0);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v14 = Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = a2;
    CFRetain(a2);
    *(unsigned char *)(v14 + 40) = a4;
    *(void *)(v14 + 24) = a3;
    *(void *)(v14 + 32) = a5;
    *(unsigned char *)(v14 + 41) = a7;
    *(void *)(v14 + 48) = a6;
    if (a6) {
      CFRetain(a6);
    }
  }
  return v14;
}

uint64_t sub_1000ECBF8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 41) || !*(void *)(a1 + 48)) {
    return 0;
  }
  pthread_once(&stru_1001019E0, sub_1000ECC5C);
  uint64_t result = qword_100106B18;
  if (qword_100106B18)
  {
    CFRetain((CFTypeRef)qword_100106B18);
    return qword_100106B18;
  }
  return result;
}

void sub_1000ECC5C()
{
  if (!qword_100106B18)
  {
    v0[0] = unk_1000FE6F0;
    v0[1] = *(_OWORD *)&off_1000FE700;
    qword_100106B18 = sub_1000EB878((uint64_t)kCFAllocatorDefault, v0);
  }
}

BOOL sub_1000ECCB4(uint64_t a1, uint64_t a2, uint64_t a3, CFIndex a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  if (*(unsigned char *)(a3 + 41) && (CFArrayRef v12 = *(const __CFArray **)(a3 + 48)) != 0 && CFArrayGetCount(v12) > a4)
  {
    CFURLRef ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a3 + 48), a4);
    CFIndex v15 = ValueAtIndex;
    if (ValueAtIndex) {
      CFRetain(ValueAtIndex);
    }
  }
  else
  {
    CFIndex v15 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  if (a7)
  {
    *a7 = v15;
  }
  else if (v15)
  {
    CFRelease(v15);
  }
  return v15 != 0;
}

CFIndex sub_1000ECD64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a3 + 41) && (CFArrayRef v3 = *(const __CFArray **)(a3 + 48)) != 0) {
    return CFArrayGetCount(v3);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000ECD80()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_100106B20 = result;
  return result;
}

__CFString *sub_1000ECDA8(CFArrayRef *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(v2, 0);
  CFIndex Count = CFArrayGetCount(a1[2]);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    for (CFIndex i = 0; v5 != i; ++i)
    {
      CFURLRef ValueAtIndex = CFArrayGetValueAtIndex(a1[2], i);
      CFRange v8 = (const void *)*((void *)ValueAtIndex + 2);
      if (v8) {
        CFRetain(*((CFTypeRef *)ValueAtIndex + 2));
      }
      if (i) {
        CFStringAppend(Mutable, @" ");
      }
      if (!v8) {
        continue;
      }
      CFStringAppendFormat(Mutable, 0, @"<%@>", v8);
      CFArrayRef v9 = a1[3];
      if (v9)
      {
        unsigned int v10 = CFArrayGetValueAtIndex(v9, i);
        if (v10 == 1)
        {
          CFStringRef v11 = @"+";
          goto LABEL_13;
        }
        if (v10 == 2)
        {
          CFStringRef v11 = @"*";
LABEL_13:
          CFStringAppend(Mutable, v11);
        }
      }
      CFRelease(v8);
    }
  }
  return Mutable;
}

uint64_t sub_1000ECEC8(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    CFIndex v5 = *(const void **)(a1 + 16);
    CFAllocatorRef v6 = *(const void **)(a2 + 16);
    if (!v5 || !v6) {
      return v5 == v6;
    }
    uint64_t result = CFEqual(v5, v6);
    if (!result) {
      return result;
    }
    CFIndex v5 = *(const void **)(a1 + 24);
    CFAllocatorRef v6 = *(const void **)(a2 + 24);
    if (v5 && v6)
    {
      return CFEqual(v5, v6);
    }
    else
    {
      return v5 == v6;
    }
  }
  return result;
}

void sub_1000ECF44(uint64_t a1)
{
  if (a1)
  {
    CFAllocatorRef v2 = *(const void **)(a1 + 16);
    if (v2) {
      CFRelease(v2);
    }
    CFArrayRef v3 = *(const void **)(a1 + 24);
    if (v3)
    {
      CFRelease(v3);
    }
  }
}

uint64_t sub_1000ECF90(const __CFAllocator *a1, const __CFArray *a2, CFArrayRef theArray)
{
  if (!a2) {
    return 0;
  }
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count != CFArrayGetCount(a2)) {
      return 0;
    }
  }
  pthread_once(&stru_1001019F0, (void (*)(void))sub_1000ECD80);
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    *(void *)(Instance + 16) = CFArrayCreateCopy(a1, a2);
    if (theArray) {
      CFArrayRef Copy = CFArrayCreateCopy(a1, theArray);
    }
    else {
      CFArrayRef Copy = 0;
    }
    *(void *)(Instance + 24) = Copy;
  }
  return Instance;
}

uint64_t sub_1000ED058(const __CFAllocator *a1, uint64_t a2, CFIndex a3, const __CFArray *a4)
{
  if (a3 == -1 || CFArrayGetCount(*(CFArrayRef *)(a2 + 16)) > a3)
  {
    pthread_once(&stru_1001019F0, (void (*)(void))sub_1000ECD80);
    uint64_t Instance = _CFRuntimeCreateInstance();
    if (a3 == -1)
    {
      *(void *)(Instance + 16) = CFArrayCreateCopy(a1, *(CFArrayRef *)(a2 + 16));
      CFArrayRef v14 = *(const __CFArray **)(a2 + 24);
      if (v14) {
        CFArrayRef Copy = CFArrayCreateCopy(a1, v14);
      }
      else {
        CFArrayRef Copy = 0;
      }
      goto LABEL_19;
    }
    CFArrayRef MutableCopy = CFArrayCreateMutableCopy(a1, 0, *(CFArrayRef *)(a2 + 16));
    unsigned int v10 = MutableCopy;
    CFArrayRef v11 = *(const __CFArray **)(a2 + 24);
    if (v11)
    {
      CFArrayRef Copy = CFArrayCreateMutableCopy(a1, 0, v11);
      CFArrayRemoveValueAtIndex(v10, a3);
      if (Copy)
      {
        CFArrayRemoveValueAtIndex(Copy, a3);
        char v13 = 0;
        if (!a4) {
          goto LABEL_18;
        }
        goto LABEL_13;
      }
    }
    else
    {
      CFArrayRemoveValueAtIndex(MutableCopy, a3);
      CFArrayRef Copy = 0;
    }
    char v13 = 1;
    if (!a4)
    {
LABEL_18:
      *(void *)(Instance + 16) = v10;
LABEL_19:
      *(void *)(Instance + 24) = Copy;
      return Instance;
    }
LABEL_13:
    CFIndex Count = CFArrayGetCount(a4);
    if (Count >= 1)
    {
      unint64_t v16 = Count + 1;
      do
      {
        CFURLRef ValueAtIndex = CFArrayGetValueAtIndex(a4, v16 - 2);
        CFArrayInsertValueAtIndex(v10, a3, ValueAtIndex);
        if ((v13 & 1) == 0) {
          CFArrayInsertValueAtIndex(Copy, a3, 0);
        }
        --v16;
      }
      while (v16 > 1);
    }
    goto LABEL_18;
  }
  return 0;
}

const void *sub_1000ED1F0(uint64_t a1, CFIndex idx, _DWORD *a3)
{
  if (a3)
  {
    CFArrayRef v6 = *(const __CFArray **)(a1 + 24);
    if (v6) {
      LODWORD(v6) = CFArrayGetValueAtIndex(v6, idx);
    }
    *a3 = v6;
  }
  CFArrayRef v7 = *(const __CFArray **)(a1 + 16);
  return CFArrayGetValueAtIndex(v7, idx);
}

uint64_t sub_1000ED250(unsigned int a1)
{
  pthread_mutex_lock(&stru_100101A00);
  CFMutableDictionaryRef Mutable = (__CFDictionary *)qword_100106B28;
  if (qword_100106B28
    || (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0),
        (qword_100106B28 = (uint64_t)Mutable) != 0))
  {
    CFDictionarySetValue(Mutable, (const void *)a1, sub_1000DC5EC);
  }
  return pthread_mutex_unlock(&stru_100101A00);
}

uint64_t sub_1000ED2DC(int a1, uint64_t a2)
{
  pthread_mutex_lock(&stru_100101A00);
  if (!qword_100106B28)
  {
    pthread_mutex_unlock(&stru_100101A00);
    return 4294963295;
  }
  CFArrayRef Value = (uint64_t (*)(uint64_t))CFDictionaryGetValue((CFDictionaryRef)qword_100106B28, (const void *)a1);
  pthread_mutex_unlock(&stru_100101A00);
  if (!Value) {
    return 4294963295;
  }
  uint64_t result = Value(a2);
  if (!result)
  {
    uint64_t v6 = VSPreferencesCopySpokenLanguageIdentifier();
    uint64_t result = 0;
    *(void *)(a2 + 32) = v6;
  }
  return result;
}

uint64_t sub_1000ED364()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_100106B30 = result;
  return result;
}

uint64_t sub_1000ED38C()
{
  return 0;
}

BOOL sub_1000ED394(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1000ED3A0(uint64_t a1)
{
  CFAllocatorRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(void *)(a1 + 80)) {
    CPRecordStoreDestroy();
  }
  return pthread_mutex_destroy(v2);
}

uint64_t sub_1000ED3EC(const __CFAllocator *a1, const __CFURL *a2)
{
  CFURLRef v2 = CFURLCreateCopyAppendingPathComponent(a1, a2, @"Manifest.sqlitedb", 0);
  if (v2)
  {
    CFURLRef v3 = v2;
    CFStringRef v4 = CFURLCopyFileSystemPath(v2, kCFURLPOSIXPathStyle);
    if (!v4)
    {
      uint64_t v9 = 0;
LABEL_12:
      CFRelease(v3);
      return v9;
    }
    CFStringRef v5 = v4;
    uint64_t v6 = CPRecordStoreCreateWithPath();
    if (v6)
    {
      uint64_t v7 = v6;
      CPRecordStoreSetSetupHandler();
      if (CPRecordStoreGetDatabase())
      {
        CPSqliteDatabaseSetVersion();
        pthread_once(&stru_100101A40, (void (*)(void))sub_1000ED364);
        uint64_t Instance = _CFRuntimeCreateInstance();
        if (Instance)
        {
          uint64_t v9 = Instance;
          pthread_mutex_init((pthread_mutex_t *)(Instance + 16), 0);
          *(void *)(v9 + 80) = v7;
LABEL_11:
          CFRelease(v5);
          goto LABEL_12;
        }
      }
      CPRecordStoreDestroy();
    }
    uint64_t v9 = 0;
    goto LABEL_11;
  }
  return 0;
}

uint64_t sub_1000ED4F0()
{
  CPSqliteConnectionPerformSQL();
  CPSqliteConnectionPerformSQL();
  CPSqliteConnectionPerformSQL();
  return CPSqliteConnectionPerformSQL();
}

uint64_t sub_1000ED55C(uint64_t a1)
{
  CFURLRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(void *)(a1 + 80))
  {
    CPRecordStoreSave();
    CPRecordStoreInvalidateCaches();
  }
  return pthread_mutex_unlock(v2);
}

uint64_t sub_1000ED5B4(uint64_t a1, __CFDictionary **a2)
{
  CFStringRef v4 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 8), 0);
  if (!a2) {
    return 0;
  }
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v4, 0x8000100u);
  if (!v5) {
    return 0;
  }
  CFStringRef v6 = v5;
  unsigned int v7 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 8), 1);
  CFRange v8 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 8), 1);
  if (!v7) {
    goto LABEL_12;
  }
  if (!v8) {
    goto LABEL_12;
  }
  CFDataRef v9 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v8, v7, kCFAllocatorNull);
  if (!v9) {
    goto LABEL_12;
  }
  CFDataRef v10 = v9;
  uint64_t v11 = VSCFPropertyListCreateFromBinaryXMLData();
  if (!v11)
  {
LABEL_11:
    CFRelease(v10);
LABEL_12:
    CFDictionaryRef v12 = CFDictionaryCreate(kCFAllocatorDefault, 0, 0, 0, 0, 0);
    goto LABEL_13;
  }
  CFDictionaryRef v12 = (CFDictionaryRef)v11;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v12))
  {
    CFRelease(v12);
    goto LABEL_11;
  }
  CFRelease(v10);
LABEL_13:
  CFMutableDictionaryRef Mutable = *a2;
  if (!*a2)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *a2 = Mutable;
  }
  CFDictionarySetValue(Mutable, v6, v12);
  CFRelease(v12);
  CFRelease(v6);
  return 0;
}

void sub_1000ED71C()
{
  uint64_t v0 = *(void *)CPRecordGetClass();
  PropertyDescriptor = (void *)CPRecordGetPropertyDescriptor();
  CFStringRef v2 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"UPDATE %s SET %s = ? WHERE ROWID = ?", v0, *PropertyDescriptor);
  uint64_t v3 = CPSqliteConnectionStatementForSQL();
  if (v3)
  {
    uint64_t v4 = v3;
    CFDataRef Property = (const __CFData *)CPRecordGetProperty();
    if (Property && (CFDataRef v6 = Property, Length = CFDataGetLength(Property), Length >= 1))
    {
      int v8 = Length;
      BytePtr = CFDataGetBytePtr(v6);
      sqlite3_bind_blob(*(sqlite3_stmt **)(v4 + 8), 1, BytePtr, v8, 0);
    }
    else
    {
      sqlite3_bind_null(*(sqlite3_stmt **)(v4 + 8), 1);
    }
    CFDataRef v10 = *(sqlite3_stmt **)(v4 + 8);
    int ID = CPRecordGetID();
    sqlite3_bind_int(v10, 2, ID);
    CPSqliteStatementPerform();
    CPSqliteStatementReset();
  }
  if (v2)
  {
    CFRelease(v2);
  }
}

void sub_1000ED860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = *(void *)CPRecordGetPropertyDescriptor();
    Class = (void *)CPRecordGetClass();
    CFStringRef v5 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"SELECT %s FROM %s WHERE ROWID = ?", v3, *Class);
    uint64_t v6 = CPSqliteConnectionStatementForSQL();
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = *(sqlite3_stmt **)(v6 + 8);
      int ID = CPRecordGetID();
      sqlite3_bind_int(v8, 1, ID);
      if (sqlite3_step(*(sqlite3_stmt **)(v7 + 8)) == 100)
      {
        unsigned int v10 = sqlite3_column_bytes(*(sqlite3_stmt **)(v7 + 8), 0);
        uint64_t v11 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(v7 + 8), 0);
        if (v10) {
          BOOL v12 = v11 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {
          CPRecordInitializeProperty();
        }
        else
        {
          CFDataRef v13 = CFDataCreate(kCFAllocatorDefault, v11, v10);
          CPRecordInitializeProperty();
          if (v13) {
            CFRelease(v13);
          }
        }
      }
      CPSqliteStatementReset();
    }
    if (v5)
    {
      CFRelease(v5);
    }
  }
}

void sub_1000ED9C4(uint64_t a1, uint64_t a2, int a3, CFStringRef theString, const __CFString *a5, const __CFString *a6, const __CFString *a7)
{
  CFIndex Length = CFStringGetLength(theString);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex v14 = MaximumSizeForEncoding;
  usedBufLen[0] = MaximumSizeForEncoding;
  if (MaximumSizeForEncoding < 256) {
    CFIndex v15 = v34;
  }
  else {
    CFIndex v15 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x598D4927uLL);
  }
  v35.locatioCFIndex n = 0;
  v35.length = Length;
  CFStringGetBytes(theString, v35, 0x8000100u, 0, 0, v15, v14, usedBufLen);
  v15[usedBufLen[0]] = 0;
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), 1, (const char *)v15, -1, 0);
  CFIndex v16 = CFStringGetLength(a5);
  CFIndex v17 = CFStringGetMaximumSizeForEncoding(v16, 0x8000100u);
  CFIndex v18 = v17;
  v32[0] = v17;
  if (v17 < 256) {
    CFArrayRef v19 = (UInt8 *)usedBufLen;
  }
  else {
    CFArrayRef v19 = (UInt8 *)malloc_type_malloc(v17 + 1, 0x8DDA7ABBuLL);
  }
  v36.locatioCFIndex n = 0;
  v36.length = v16;
  CFStringGetBytes(a5, v36, 0x8000100u, 0, 0, v19, v18, v32);
  v19[v32[0]] = 0;
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), 2, (const char *)v19, -1, 0);
  if (a6)
  {
    CFIndex v20 = CFStringGetLength(a6);
    CFIndex v21 = CFStringGetMaximumSizeForEncoding(v20, 0x8000100u);
    CFIndex v22 = v21;
    v31[0] = v21;
    if (v21 < 256) {
      CFIndex v23 = (UInt8 *)v32;
    }
    else {
      CFIndex v23 = (UInt8 *)malloc_type_malloc(v21 + 1, 0x1A578380uLL);
    }
    v37.locatioCFIndex n = 0;
    v37.length = v20;
    CFStringGetBytes(a6, v37, 0x8000100u, 0, 0, v23, v22, v31);
    v23[v31[0]] = 0;
    sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), 3, (const char *)v23, -1, 0);
    int v24 = 4;
  }
  else
  {
    CFIndex v23 = 0;
    int v24 = 3;
  }
  CFIndex v25 = CFStringGetLength(a7);
  uint64_t v26 = CFStringGetMaximumSizeForEncoding(v25, 0x8000100u);
  CFIndex v27 = v26;
  CFIndex v30 = v26;
  if (v26 < 256) {
    CFIndex v28 = (UInt8 *)v31;
  }
  else {
    CFIndex v28 = (UInt8 *)malloc_type_malloc(v26 + 1, 0x5E370122uLL);
  }
  v38.locatioCFIndex n = 0;
  v38.length = v25;
  CFStringGetBytes(a7, v38, 0x8000100u, 0, 0, v28, v27, &v30);
  v28[v30] = 0;
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), v24, (const char *)v28, -1, 0);
  if (a2) {
    CPSqliteStatementSendResults();
  }
  else {
    CPSqliteStatementPerform();
  }
  CPSqliteStatementReset();
  if (v15 != v34) {
    free(v15);
  }
  if (v19 != (UInt8 *)usedBufLen) {
    free(v19);
  }
  if (a6 && v23 && v23 != (UInt8 *)v32) {
    free(v23);
  }
  if (v28 != (UInt8 *)v31) {
    free(v28);
  }
}

uint64_t sub_1000EDD34(uint64_t a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  uint64_t result = 0;
  uint64_t v10 = 0;
  if (a2 && a3 && a4)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
    if (CPRecordStoreGetDatabase())
    {
      uint64_t v9 = CPSqliteDatabaseStatementForWriting();
      if (v9) {
        sub_1000ED9C4(v9, (uint64_t)sub_1000EDDE8, (int)&v10, a2, a3, 0, a4);
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
    return v10;
  }
  return result;
}

uint64_t sub_1000EDDE8(uint64_t a1, __CFArray **a2)
{
  uint64_t v3 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 8), 0);
  if (v3)
  {
    CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v3, 0x8000100u);
    if (v4)
    {
      CFStringRef v5 = v4;
      if (a2)
      {
        CFMutableDictionaryRef Mutable = *a2;
        if (!*a2)
        {
          CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          *a2 = Mutable;
        }
        CFArrayAppendValue(Mutable, v5);
      }
      CFRelease(v5);
    }
  }
  return 0;
}

void sub_1000EDE80(int a1)
{
  if (qword_100106B38)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100106B38);
    if (Count >= 1)
    {
      unint64_t v3 = Count + 1;
      do
      {
        CFURLRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100106B38, v3 - 2);
        if (*ValueAtIndex == a1)
        {
          CFStringRef v5 = ValueAtIndex;
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100106B38, v3 - 2);
          sub_1000EDF1C(kCFAllocatorDefault, v5);
        }
        --v3;
      }
      while (v3 > 1);
    }
  }
}

void sub_1000EDF1C(CFAllocatorRef allocator, void *ptr)
{
  if (!ptr) {
    return;
  }
  if (*(_DWORD *)ptr == 1)
  {
    uint64_t v9 = (const void *)ptr[1];
    if (v9) {
      CFRelease(v9);
    }
    int v8 = (const void *)ptr[2];
    if (!v8) {
      goto LABEL_19;
    }
  }
  else
  {
    if (*(_DWORD *)ptr) {
      goto LABEL_19;
    }
    mach_port_name_t v4 = *((_DWORD *)ptr + 2);
    if (v4 + 1 >= 2) {
      mach_port_deallocate(mach_task_self_, v4);
    }
    CFStringRef v5 = (const void *)ptr[2];
    if (v5) {
      CFRelease(v5);
    }
    uint64_t v6 = (const void *)ptr[3];
    if (v6) {
      CFRelease(v6);
    }
    uint64_t v7 = (const void *)ptr[4];
    if (v7) {
      CFRelease(v7);
    }
    int v8 = (const void *)ptr[5];
    if (!v8) {
      goto LABEL_19;
    }
  }
  CFRelease(v8);
LABEL_19:
  CFAllocatorDeallocate(allocator, ptr);
}

CFTypeRef *sub_1000EDFD8(const __CFAllocator *a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t v3 = (CFTypeRef *)CFAllocatorAllocate(a1, 72, 0);
  mach_port_name_t v4 = v3;
  if (v3)
  {
    *(_OWORD *)unint64_t v3 = *(_OWORD *)a2;
    long long v5 = *(_OWORD *)(a2 + 16);
    long long v6 = *(_OWORD *)(a2 + 32);
    long long v7 = *(_OWORD *)(a2 + 48);
    v3[8] = *(CFTypeRef *)(a2 + 64);
    *((_OWORD *)v3 + 2) = v6;
    *((_OWORD *)v3 + 3) = v7;
    *((_OWORD *)v3 + 1) = v5;
    if (*(_DWORD *)a2 == 1)
    {
      if (*(void *)(a2 + 8)) {
        CFRetain(v3[1]);
      }
      if (*(void *)(a2 + 16))
      {
        int v8 = v4 + 2;
        goto LABEL_18;
      }
    }
    else if (!*(_DWORD *)a2)
    {
      if (*(void *)(a2 + 16)) {
        CFRetain(v3[2]);
      }
      if (*(void *)(a2 + 24)) {
        CFRetain(v4[3]);
      }
      if (*(void *)(a2 + 32)) {
        CFRetain(v4[4]);
      }
      if (*(void *)(a2 + 40))
      {
        int v8 = v4 + 5;
LABEL_18:
        CFRetain(*v8);
      }
    }
  }
  return v4;
}

_DWORD *sub_1000EE0B0()
{
  uint64_t result = (_DWORD *)qword_100106B38;
  if (qword_100106B38)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100106B38);
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      CFIndex v2 = Count;
      uint64_t v3 = 1;
      do
      {
        uint64_t result = CFArrayGetValueAtIndex((CFArrayRef)qword_100106B38, v3 - 1);
        if (*result) {
          uint64_t result = 0;
        }
        if (result) {
          BOOL v4 = 0;
        }
        else {
          BOOL v4 = v3 < v2;
        }
        ++v3;
      }
      while (v4);
    }
  }
  return result;
}

void sub_1000EE1A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 56) != v2)
  {
    *(unsigned char *)(v1 + 56) = v2;
    if (*(void *)(*(void *)(a1 + 32) + 40) == 2)
    {
      BOOL v4 = +[AVAudioSession sharedInstance];
      unint64_t v5 = (unint64_t)[v4 categoryOptions];
      if (((v5 & 4) == 0) == (*(unsigned char *)(*(void *)(a1 + 32) + 56) != 0))
      {
        uint64_t v6 = v5 ^ 4;
        long long v7 = [v4 category];
        id v13 = 0;
        [v4 setCategory:v7 withOptions:v6 error:&v13];
        id v8 = v13;

        uint64_t v9 = VSGetLogDefault();
        uint64_t v10 = v9;
        if (v8)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v11 = (const char *)[v8 code];
            *(_DWORD *)CFRunLoopSourceContext buf = 134217984;
            CFIndex v15 = v11;
            _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#AudioSession error %ld setting bluetooth allowability\n", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          if (*(unsigned char *)(*(void *)(a1 + 32) + 56)) {
            BOOL v12 = "en";
          }
          else {
            BOOL v12 = "dis";
          }
          *(_DWORD *)CFRunLoopSourceContext buf = 136315138;
          CFIndex v15 = v12;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "#AudioSession : Bluetooth %sabled\n", buf, 0xCu);
        }
      }
    }
  }
}

void *sub_1000EE4A4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _nextActivityForActive:*(unsigned __int8 *)(a1 + 48) activity:*(void *)(a1 + 40) serverActivity:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t result = *(void **)(a1 + 32);
  if (v2 != (id)result[6])
  {
    if (v2)
    {
      [result _setCategoryForActivity:v2];
      BOOL v4 = *(void **)(a1 + 32);
      if (v4[6]) {
        goto LABEL_12;
      }
      [v4 _setupAudioSession];
      unint64_t v5 = +[AVAudioSession sharedInstance];
      id v12 = 0;
      [v5 setActive:1 error:&v12];
      id v6 = v12;

      long long v7 = VSGetLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)CFRunLoopSourceContext buf = 0;
        id v8 = "#AudioSession : Active --> TRUE\n";
LABEL_16:
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v8, buf, 2u);
      }
    }
    else
    {
      sub_1000EE6AC();
      uint64_t v9 = +[AVAudioSession sharedInstance];
      id v13 = 0;
      [v9 setActive:0 error:&v13];
      id v6 = v13;

      long long v7 = VSGetLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)CFRunLoopSourceContext buf = 0;
        id v8 = "#AudioSession : Active --> FALSE\n";
        goto LABEL_16;
      }
    }

    if (v6)
    {
      uint64_t v10 = VSGetLogDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v6 code];
        *(_DWORD *)CFRunLoopSourceContext buf = 134218240;
        id v15 = v11;
        __int16 v16 = 2048;
        id v17 = v2;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#AudioSession error %ld activating or deactivating session for activity %ld\n", buf, 0x16u);
      }

      goto LABEL_13;
    }
    BOOL v4 = *(void **)(a1 + 32);
LABEL_12:
    v4[6] = v2;
LABEL_13:
    uint64_t result = *(void **)(a1 + 32);
  }
  result[4] = v2;
  return result;
}

uint64_t sub_1000EE6AC()
{
  pthread_mutex_lock(&stru_100101A50);
  if (qword_100106B50) {
    CFSetApplyFunction((CFSetRef)qword_100106B50, (CFSetApplierFunction)sub_1000EE708, 0);
  }
  return pthread_mutex_unlock(&stru_100101A50);
}

void sub_1000EE708(OpaqueAudioQueue *a1)
{
  uint64_t v1 = AudioQueueStop(a1, 1u);
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = +[NSString vs_stringFrom4CC:v2];
      int v5 = 138412290;
      id v6 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#AudioSession could not stop queue (%@)\n", (uint8_t *)&v5, 0xCu);
    }
  }
}

id sub_1000EE84C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCategoryForActivity:*(void *)(a1 + 40)];
}

uint64_t sub_1000EE904(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 72);
  return result;
}

id sub_1000EE98C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupAudioSession];
}

id sub_1000EEFF0(uint64_t a1)
{
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v5 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "#AudioSession mediaserverd died\n", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  *(void *)(v3 + 40) = 0;
  *(void *)(v3 + 48) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  id result = [*(id *)(a1 + 32) _setupAudioSession];
  ++*(void *)(*(void *)(a1 + 32) + 72);
  return result;
}

uint64_t sub_1000EF14C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  *(void *)(v1 + 40) = 0;
  *(void *)(v1 + 48) = 0;
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "#AudioSession session interrupted\n", v4, 2u);
  }

  return sub_1000EE6AC();
}

void sub_1000EF36C(id a1)
{
  qword_100106B40 = objc_alloc_init(VSAudioSession);
  _objc_release_x1();
}

id sub_1000EF3A8()
{
  uint64_t v0 = +[VSAudioSession sharedInstance];
  id v1 = [v0 _safeServerGeneration];

  return v1;
}

void sub_1000EF3E8(int a1, uint64_t a2)
{
  id v4 = +[VSAudioSession sharedInstance];
  [v4 _safeSetActive:a1 != 0 withActivity:a2];
}

void sub_1000EF44C(int a1)
{
  id v2 = +[VSAudioSession sharedInstance];
  [v2 _safeSetBluetoothInputAllowed:a1 != 0];
}

float sub_1000EF4A8()
{
  uint64_t v0 = +[AVAudioSession sharedInstance];
  [v0 outputLatency];
  double v2 = v1;
  [v0 inputLatency];
  double v4 = v3;
  [v0 IOBufferDuration];
  double v6 = v5;
  long long v7 = (void *)VSPreferencesCopyValueForKey();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 doubleValue];
  }
  else {
    double v8 = 0.05;
  }
  float v9 = v2 + 0.0 + v4 + v6 * 2.0 + v8;

  return v9;
}

void sub_1000EF570()
{
  CFDictionaryRef v0 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    CFArrayRef Value = CFDictionaryGetValue(v0, _kCFSystemVersionBuildVersionKey);
    qword_100106B58 = (uint64_t)Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v1);
  }
}

uint64_t sub_1000EF5D8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7 = *a3;
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 16));
  int v36 = 0;
  CFStringRef theString1 = 0;
  CFIndex v30 = a3;
  CFIndex v31 = Count;
  if (Count < 1)
  {
    uint64_t v10 = 1;
    goto LABEL_51;
  }
  CFIndex v9 = 0;
  LOBYTE(v10) = 1;
  while (v7 < a4 && (_BYTE)v10)
  {
    id v11 = (unsigned __int8 *)sub_1000ED1F0(a1, v9, &v36);
    int v12 = v11[41];
    CFIndex v33 = v9;
    if (v11[41])
    {
      CFStringRef v13 = (const __CFString *)*((void *)v11 + 2);
      if (v13) {
        CFRetain(*((CFTypeRef *)v11 + 2));
      }
      CFIndex v14 = 0;
    }
    else
    {
      CFIndex v14 = (const void *)*((void *)v11 + 6);
      CFRetain(v14);
      if (v14)
      {
        CFIndex v15 = CFArrayGetCount((CFArrayRef)v14);
        CFStringRef v13 = 0;
        goto LABEL_12;
      }
      CFStringRef v13 = 0;
    }
    CFIndex v15 = 0;
LABEL_12:
    int v16 = 0;
    while (v12)
    {
      VSRecognitionResultGetPhraseAtIndex();
      CFComparisonResult v17 = CFStringCompare(theString1, v13, 0);
      BOOL v18 = v17 == kCFCompareEqualTo;
      if (v17) {
        goto LABEL_34;
      }
      ++v7;
LABEL_25:
      int v24 = v36;
      int v16 = 1;
      BOOL v26 = !v18 || v7 >= a4 || v36 == 0;
      if (v26)
      {
        CFIndex v27 = v33;
        goto LABEL_35;
      }
    }
    if (v15 >= 1)
    {
      uint64_t v19 = 0;
      for (CFIndex i = 0; i != v15; ++i)
      {
        uint64_t v34 = v7;
        CFURLRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v14, i);
        int v22 = sub_1000EF5D8(ValueAtIndex, a2, &v34, a4);
        uint64_t v23 = v34 - v7;
        if (v34 - v7 <= v19) {
          uint64_t v23 = v19;
        }
        if (v22) {
          uint64_t v19 = v23;
        }
      }
      if (v19)
      {
        v7 += v19;
        BOOL v18 = 1;
        goto LABEL_25;
      }
    }
LABEL_34:
    CFIndex v27 = v33;
    int v24 = v36;
LABEL_35:
    if (v16) {
      BOOL v28 = 1;
    }
    else {
      BOOL v28 = v24 == 2;
    }
    uint64_t v10 = v28;
    if (v13) {
      CFRelease(v13);
    }
    if (v14) {
      CFRelease(v14);
    }
    CFIndex v9 = v27 + 1;
    if (v9 == v31)
    {
LABEL_51:
      *CFIndex v30 = v7;
      return v10;
    }
  }
  uint64_t result = 0;
  BOOL v26 = v10 == 0;
  uint64_t v10 = 0;
  if (v26) {
    goto LABEL_51;
  }
  return result;
}

void sub_1000EF7E8(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    double v3 = string;
    double v4 = VSGetLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      int v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Receive notification %s", (uint8_t *)&v21, 0xCu);
    }

    id v5 = [objc_alloc((Class)VSDownloadService) initWithType:2];
    if (qword_100106B60)
    {
      [(id)qword_100106B60 timeIntervalSinceNow];
      BOOL v7 = v6 >= -300.0;
    }
    else
    {
      BOOL v7 = 0;
    }
    if (!strcmp("com.apple.MobileAsset.VoiceServicesVocalizerVoice.ma.cached-metadata-updated", v3) && !v7)
    {
      [v5 updateVoicesAndVoiceResources];
      uint64_t v8 = +[NSDate date];
      CFIndex v9 = (void *)qword_100106B60;
      qword_100106B60 = v8;
    }
    if (!strcmp("com.apple.MobileAsset.VoiceServices.GryphonVoice.ma.new-asset-installed", v3)
      || !strcmp("com.apple.MobileAsset.VoiceServicesVocalizerVoice.ma.new-asset-installed", v3))
    {
      uint64_t v10 = +[VSMobileAssetsManager sharedManager];
      [v10 resetCache];

      notify_post((const char *)[@"com.apple.voiceservices.notification.voice-update" UTF8String]);
    }
    if (!strcmp("com.apple.MobileAsset.VoiceServices.VoiceResources.ma.new-asset-installed", v3))
    {
      int v12 = +[VSMobileAssetsManager sharedManager];
      [v12 resetResourcesCache];

      CFStringRef v13 = +[VSMobileAssetsManager sharedManager];
      [v13 resetCache];

      double Current = CFAbsoluteTimeGetCurrent();
      CFIndex v15 = (void *)VSPreferencesCopyValueForKey();
      [v15 doubleValue];
      double v17 = v16;

      double v11 = Current - v17;
      if (Current - v17 > 43200.0)
      {
        +[NSNumber numberWithDouble:Current];
        VSPreferencesSetValueForKey();
        BOOL v18 = VSGetLogDefault();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v21) = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "com.apple.MobileAsset.VoiceServices.VoiceResources.ma.new-asset-installed: checking for a voice update", (uint8_t *)&v21, 2u);
        }

        [v5 updateVoicesAndVoiceResources];
      }
    }
    if (!strcmp((const char *)objc_msgSend(@"com.apple.voiceservices.trigger.asset-force-update", "UTF8String", v11), v3))
    {
      uint64_t v19 = VSGetLogDefault();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v21) = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Perform force asset update", (uint8_t *)&v21, 2u);
      }

      id v20 = [objc_alloc((Class)VSDownloadService) initWithType:3];
      [v20 updateVoicesAndVoiceResources];
      id v5 = v20;
    }
  }
}

id sub_1000EFC40(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void sub_1000EFE1C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    double v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;
  }
}

id sub_1000EFF18(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableSet);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

id sub_1000F0028(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

id sub_1000F05D8(uint64_t a1)
{
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) connectionIdentifier];
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated, identifier: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  if ([*(id *)(a1 + 32) isSpeaking]) {
    [*(id *)(a1 + 32) invalidate];
  }
  return objc_msgSend(*(id *)(a1 + 40), "setConnectionCount:", (char *)objc_msgSend(*(id *)(a1 + 40), "connectionCount") - 1);
}

void sub_1000F082C(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    uint64_t v6 = VSGetLogEvent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFRunLoopSourceContext buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "running com.apple.voiced.neural-compiling", buf, 2u);
    }

    BOOL v7 = +[VSMobileAssetsManager sharedManager];
    uint64_t v8 = [v7 installedAssetsForType:4 voicename:0 language:0 gender:0 footprint:0];

    CFIndex v9 = +[VSSpeechInternalSettings standardInstance];
    unsigned int v10 = [v9 enableLocalVoices];

    if (v10)
    {
      double v11 = +[VSMobileAssetsManager sharedManager];
      int v12 = [v11 installedLocalVoices];
      uint64_t v13 = [v8 arrayByAddingObjectsFromArray:v12];

      uint64_t v8 = (void *)v13;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    CFIndex v14 = v8;
    id v15 = [v14 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v15)
    {
      id v17 = v15;
      uint64_t v18 = *(void *)v30;
      *(void *)&long long v16 = 138412290;
      long long v28 = v16;
      while (2)
      {
        for (CFIndex i = 0; i != v17; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v14);
          }
          id v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          int v21 = objc_msgSend(v20, "voicePath", v28, (void)v29);
          if (+[VSNeuralTTSUtils isANEModelCompiled:v21])
          {
            int v22 = VSGetLogEvent();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CFRunLoopSourceContext buf = v28;
              xpc_activity_state_t v34 = (xpc_activity_state_t)v21;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Neural voice is already compiled: '%@'", buf, 0xCu);
            }
          }
          else
          {
            if (xpc_activity_should_defer(v2))
            {
              BOOL v26 = VSGetLogDefault();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)CFRunLoopSourceContext buf = 0;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "com.apple.voiced.neural-compiling is requested to be deferred.", buf, 2u);
              }

              if (xpc_activity_set_state(v2, 3))
              {
                CFIndex v27 = VSGetLogDefault();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)CFRunLoopSourceContext buf = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Unable to set defer state for com.apple.voiced.neural-compiling", buf, 2u);
                }
              }
              goto LABEL_41;
            }
            uint64_t v23 = VSGetLogEvent();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CFRunLoopSourceContext buf = v28;
              xpc_activity_state_t v34 = (xpc_activity_state_t)v21;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Triggered compiling neural voice '%@'", buf, 0xCu);
            }

            +[VSNeuralTTSUtils compileANEModel:v21];
            int v24 = VSGetLogEvent();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CFRunLoopSourceContext buf = v28;
              xpc_activity_state_t v34 = (xpc_activity_state_t)v21;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Neural voice finished compiling '%@'", buf, 0xCu);
            }

            int v22 = +[VSPrewarmService sharedService];
            [v22 unloadCachedEngineWithVoice:v20];
          }
        }
        id v17 = [v14 countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    if (!xpc_activity_set_state(v2, 5))
    {
      CFIndex v25 = VSGetLogDefault();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CFRunLoopSourceContext buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "xpc activity com.apple.voiced.neuralCompiling, failed to set state to done.", buf, 2u);
      }
    }
    goto LABEL_41;
  }
  xpc_activity_state_t v4 = state;
  if (state)
  {
    CFIndex v14 = VSGetLogDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CFRunLoopSourceContext buf = 134217984;
      xpc_activity_state_t v34 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unexpected xpc_activity state, got: %ld", buf, 0xCu);
    }
    goto LABEL_41;
  }
  xpc_object_t v5 = xpc_activity_copy_criteria(v2);
  if (!v5)
  {
    CFIndex v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v14, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_4_HOURS);
    xpc_dictionary_set_string(v14, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    xpc_dictionary_set_BOOL(v14, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, 1);
    if (+[VSUtilities isWatch]) {
      xpc_dictionary_set_BOOL(v14, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    }
    xpc_activity_set_criteria(v2, v14);
LABEL_41:

    goto LABEL_42;
  }

LABEL_42:
}

void sub_1000F0D74(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  xpc_activity_state_t v4 = state;
  if (state == 2)
  {
    uint64_t v6 = VSGetLogEvent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "running com.apple.voiced.weekly", (uint8_t *)&v11, 2u);
    }

    id v7 = [objc_alloc((Class)VSDownloadService) initWithType:1];
    [v7 updateVoicesAndVoiceResources];

    if (!xpc_activity_set_state(v2, 5))
    {
      uint64_t v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "xpc activity com.apple.voiced.weekly, failed to set state to done.", (uint8_t *)&v11, 2u);
      }
    }
  }
  else if (!state)
  {
    xpc_object_t v5 = xpc_activity_copy_criteria(v2);
    if (v5)
    {
    }
    else
    {
      xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v10, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_7_DAYS);
      xpc_dictionary_set_string(v10, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      xpc_activity_set_criteria(v2, v10);
    }
    goto LABEL_14;
  }
  CFIndex v9 = VSGetLogDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 134217984;
    xpc_activity_state_t v12 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected xpc_activity state, got: %ld", (uint8_t *)&v11, 0xCu);
  }

LABEL_14:
}

void sub_1000F0F70(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  xpc_activity_state_t v4 = state;
  if (state == 2)
  {
    uint64_t v6 = VSGetLogEvent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "running com.apple.voiced", (uint8_t *)&v15, 2u);
    }

    id v7 = objc_alloc_init((Class)VSSpeechXPCHandler);
    [v7 cleanUnusedAssets:&stru_1000FEB30];
    uint64_t v8 = +[VSSpeechCache defaultCacheStore];
    [v8 cleanCache];

    CFIndex v9 = +[VSDiagnosticService defaultService];
    [v9 removeOldFiles];

    id v10 = [objc_alloc((Class)VSDownloadService) initWithType:0];
    [v10 updateVoicesAndVoiceResources];

    if (!xpc_activity_set_state(v2, 5))
    {
      int v11 = VSGetLogDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "xpc activity com.apple.voiced, failed to set state to done.", (uint8_t *)&v15, 2u);
      }
    }
  }
  else if (!state)
  {
    xpc_object_t v5 = xpc_activity_copy_criteria(v2);
    if (v5)
    {
    }
    else
    {
      xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v13, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_DAY);
      xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_REPEATING, 1);
      if (XPC_ACTIVITY_INTERVAL_1_DAY >= 0) {
        int64_t v14 = XPC_ACTIVITY_INTERVAL_1_DAY;
      }
      else {
        int64_t v14 = XPC_ACTIVITY_INTERVAL_1_DAY + 1;
      }
      xpc_dictionary_set_uint64(v13, XPC_ACTIVITY_GRACE_PERIOD, v14 >> 1);
      xpc_dictionary_set_string(v13, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      xpc_dictionary_set_uint64(v13, XPC_ACTIVITY_RANDOM_INITIAL_DELAY, XPC_ACTIVITY_INTERVAL_4_HOURS);
      xpc_activity_set_criteria(v2, v13);
    }
    goto LABEL_15;
  }
  xpc_activity_state_t v12 = VSGetLogDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v15 = 134217984;
    xpc_activity_state_t v16 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unexpected xpc_activity state, got: %ld", (uint8_t *)&v15, 0xCu);
  }

LABEL_15:
}

void sub_1000F1220(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      xpc_activity_state_t v4 = [(NSError *)v2 localizedDescription];
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error cleanUnusedAssets in scheduled background task: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_1000F13D8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    if (*(unsigned char *)(a1 + 32))
    {
      id v3 = VSGetLogDefault();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)CFRunLoopSourceContext buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "beginning plugin registry rebuild...", buf, 2u);
      }
      CFURLRef v4 = sub_1000E83D0();
      int v5 = sub_1000E8440();
      pthread_mutex_lock(&stru_100101880);
      if (qword_100106A90)
      {
        CFRelease((CFTypeRef)qword_100106A90);
        qword_100106A90 = 0;
      }
      if (qword_100106A98)
      {
        CFRelease((CFTypeRef)qword_100106A98);
        qword_100106A98 = 0;
      }
      sub_1000E8614(v4, v5);
      CFRelease(v4);
      if (v5) {
        CFRelease(v5);
      }
      pthread_mutex_unlock(&stru_100101880);
      uint64_t v6 = VSGetLogDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "finished.\n", v8, 2u);
      }
    }
    else
    {
      id v7 = sub_1000E80BC();
      if (v7) {
        CFRelease(v7);
      }
    }
    *(_DWORD *)(a2 + 32) = 0;
  }
}

void sub_1000F1540(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }
  *(unsigned char *)(a2 + 44) = 0;
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)CFTypeRef cf = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  if (sub_1000ED2DC(0, (uint64_t)&v9))
  {
    *(_DWORD *)(a2 + 32) = 5;
    NDR_record_t v3 = NDR_record;
  }
  else
  {
    CFURLRef v4 = sub_1000E5E2C(*((uint64_t *)&v10 + 1), (const __CFString *)cf[0], (uint64_t)cf[1]);
    if (v4)
    {
      CFURLRef v5 = v4;
      CFURLRef v6 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v4, @"KeywordIndex.plist", 0);
      CFRelease(v5);
      int v7 = 5;
      if (v6)
      {
        if (CFURLGetFileSystemRepresentation(v6, 1u, (UInt8 *)(a2 + 44), 1024)) {
          int v7 = 0;
        }
        else {
          int v7 = 5;
        }
        CFRelease(v6);
      }
    }
    else
    {
      int v7 = 5;
    }
    if (*((void *)&v12 + 1)) {
      (*((void (**)(long long *))&v12 + 1))(&v9);
    }
    if (cf[0]) {
      CFRelease(cf[0]);
    }
    *(_DWORD *)(a2 + 32) = v7;
    NDR_record_t v3 = NDR_record;
    if (!v7)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      size_t v8 = strlen((const char *)(a2 + 44));
      if (!((v8 + 1) >> 32))
      {
        *(_DWORD *)(a2 + 36) = 0;
        *(_DWORD *)(a2 + 40) = v8 + 1;
        *(_DWORD *)(a2 + 4) = ((v8 + 4) & 0xFFFFFFFC) + 44;
        return;
      }
      *(_DWORD *)(a2 + 32) = -304;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
}

void sub_1000F16CC(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    CFArrayRef context = 0;
    CFDictionaryRef v3 = (const __CFDictionary *)sub_1000E80BC();
    if (v3)
    {
      CFDictionaryRef v4 = v3;
      CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_1000E9C20, &context);
      CFRelease(v4);
      CFURLRef v5 = context;
      if (context)
      {
        CFDataRef BinaryXMLData = (const __CFData *)VSCFPropertyListCreateBinaryXMLData();
        if (BinaryXMLData)
        {
          CFDataRef v7 = BinaryXMLData;
          unsigned int Length = CFDataGetLength(BinaryXMLData);
          *(_DWORD *)(a2 + 52) = Length;
          if (vm_allocate(mach_task_self_, (vm_address_t *)(a2 + 28), Length, 1))
          {
            *(_DWORD *)(a2 + 52) = 0;
          }
          else
          {
            long long v9 = *(void **)(a2 + 28);
            BytePtr = CFDataGetBytePtr(v7);
            memcpy(v9, BytePtr, *(unsigned int *)(a2 + 52));
          }
          CFRelease(v7);
        }
        else
        {
          *(_DWORD *)(a2 + 52) = 0;
        }
        CFRelease(v5);
      }
    }
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
  }
}

void sub_1000F1828(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 2 && *(_DWORD *)(a1 + 4) == 80)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && *(unsigned char *)(a1 + 55) == 1)
    {
      CFIndex v4 = *(unsigned int *)(a1 + 40);
      if (v4 == *(_DWORD *)(a1 + 72))
      {
        unsigned int v5 = *(_DWORD *)(a1 + 56);
        if (v5 == *(_DWORD *)(a1 + 76))
        {
          sub_1000E5470(*(_DWORD *)(a1 + 68), *(const UInt8 **)(a1 + 28), v4, *(UInt8 **)(a1 + 44), v5);
          *(_DWORD *)(a2 + 32) = 0;
          mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
          *(void *)(a1 + 44) = 0;
          *(_DWORD *)(a1 + 56) = 0;
          mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
          *(void *)(a1 + 28) = 0;
          *(_DWORD *)(a1 + 40) = 0;
          return;
        }
      }
    }
    int v6 = -300;
  }
  else
  {
    int v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

uint64_t sub_1000F1904(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    int v4 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v4;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v4 = -300;
    goto LABEL_9;
  }
  mach_port_name_t v3 = *(_DWORD *)(result + 28);
  id result = sub_1000E50FC(v3);
  if (v3 - 1 <= 0xFFFFFFFD) {
    id result = mach_port_deallocate(mach_task_self_, v3);
  }
  *(_DWORD *)(a2 + 32) = 0;
  return result;
}

uint64_t sub_1000F19A8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    int v11 = -304;
LABEL_24:
    *(_DWORD *)(a2 + 32) = v11;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v11 = -300;
    goto LABEL_24;
  }
  mach_port_name_t v3 = *(_DWORD *)(result + 28);
  *(_DWORD *)(a2 + 36) = 0;
  pthread_mutex_lock(&stru_1001017B0);
  if (qword_100106A28 && !*(_DWORD *)qword_100106A28 && *(_DWORD *)(qword_100106A28 + 8) == v3 && qword_100106A40 != 0)
  {
    UInt32 ioDataSize = 16;
    OSStatus Property = AudioQueueGetProperty((AudioQueueRef)qword_100106A40, 0x61716D64u, outData, &ioDataSize);
    float v6 = 0.0;
    if (!Property)
    {
      LODWORD(v7) = ioDataSize >> 3;
      uint64_t v7 = ioDataSize >> 3 >= 2 ? 2 : v7;
      if (v7)
      {
        size_t v8 = (float *)outData;
        uint64_t v9 = v7;
        do
        {
          float v10 = *v8;
          v8 += 2;
          float v6 = v6 + v10;
          --v9;
        }
        while (v9);
        float v6 = v6 / (float)v7;
      }
    }
    *(float *)(a2 + 36) = v6;
  }
  id result = pthread_mutex_unlock(&stru_1001017B0);
  if (v3 - 1 <= 0xFFFFFFFD) {
    id result = mach_port_deallocate(mach_task_self_, v3);
  }
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

uint64_t sub_1000F1B38(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    int v11 = -304;
LABEL_24:
    *(_DWORD *)(a2 + 32) = v11;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v11 = -300;
    goto LABEL_24;
  }
  mach_port_name_t v3 = *(_DWORD *)(result + 28);
  *(_DWORD *)(a2 + 36) = 0;
  pthread_mutex_lock(&stru_1001017B0);
  if (qword_100106A28 && !*(_DWORD *)qword_100106A28 && *(_DWORD *)(qword_100106A28 + 8) == v3 && qword_100106A40 != 0)
  {
    UInt32 ioDataSize = 16;
    OSStatus Property = AudioQueueGetProperty((AudioQueueRef)qword_100106A40, 0x61716D76u, outData, &ioDataSize);
    float v6 = 0.0;
    if (!Property)
    {
      LODWORD(v7) = ioDataSize >> 3;
      uint64_t v7 = ioDataSize >> 3 >= 2 ? 2 : v7;
      if (v7)
      {
        size_t v8 = (float *)outData;
        uint64_t v9 = v7;
        do
        {
          float v10 = *v8;
          v8 += 2;
          float v6 = v6 + v10;
          --v9;
        }
        while (v9);
        float v6 = v6 / (float)v7;
      }
    }
    *(float *)(a2 + 36) = v6;
  }
  id result = pthread_mutex_unlock(&stru_1001017B0);
  if (v3 - 1 <= 0xFFFFFFFD) {
    id result = mach_port_deallocate(mach_task_self_, v3);
  }
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

uint64_t sub_1000F1CC8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    int v5 = -304;
LABEL_16:
    *(_DWORD *)(a2 + 32) = v5;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v5 = -300;
    goto LABEL_16;
  }
  mach_port_name_t v3 = *(_DWORD *)(result + 28);
  pthread_mutex_lock(&stru_1001017B0);
  if (qword_100106A28
    && !*(_DWORD *)qword_100106A28
    && *(unsigned char *)(qword_100106A28 + 64) == 1
    && *(_DWORD *)(qword_100106A28 + 8) == v3)
  {
    *(unsigned char *)(qword_100106A28 + 64) = 0;
    int v4 = VSGetLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      uint64_t v9 = "server_VSRecognitionBegin";
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s: releasing active client to begin\n", (uint8_t *)&v8, 0xCu);
    }
    if (qword_100106A30) {
      CFRunLoopSourceSignal((CFRunLoopSourceRef)qword_100106A30);
    }
    if (qword_100106A38) {
      CFRunLoopWakeUp((CFRunLoopRef)qword_100106A38);
    }
  }
  else
  {
    float v6 = sub_1000EE0B0();
    if (!v6 || v6[2] != v3 || *((unsigned char *)v6 + 64) != 1)
    {
      char v7 = 0;
      goto LABEL_24;
    }
    *((unsigned char *)v6 + 64) = 0;
  }
  char v7 = 1;
LABEL_24:
  id result = pthread_mutex_unlock(&stru_1001017B0);
  *(unsigned char *)(a2 + 36) = v7;
  if (v3 - 1 <= 0xFFFFFFFD) {
    id result = mach_port_deallocate(mach_task_self_, v3);
  }
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

void sub_1000F1EAC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 3) {
    goto LABEL_27;
  }
  uint64_t v5 = *(unsigned int *)(a1 + 4);
  if (v5 < 0x80 || v5 > 0x880) {
    goto LABEL_27;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112 || *(unsigned char *)(a1 + 51) != 1 || *(unsigned char *)(a1 + 67) != 1) {
    goto LABEL_26;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 88);
  if (v6 > 0x400)
  {
LABEL_2:
    int v3 = -304;
LABEL_27:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v19 = NDR_record;
    goto LABEL_28;
  }
  int v3 = -304;
  if ((int)v5 - 128 < v6) {
    goto LABEL_27;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 < v7 + 128) {
    goto LABEL_27;
  }
  uint64_t v8 = a1 + v7;
  unsigned int v9 = *(_DWORD *)(v8 + 96);
  if (v9 > 0x400) {
    goto LABEL_27;
  }
  int v10 = v5 - v7;
  if (v10 - 128 < v9) {
    goto LABEL_27;
  }
  unsigned int v11 = (v9 + 3) & 0xFFFFFFFC;
  if (v10 != v11 + 128) {
    goto LABEL_27;
  }
  uint64_t v12 = v8 - 1024;
  uint64_t v13 = v8 - 1024 + v11;
  CFIndex v14 = *(unsigned int *)(a1 + 52);
  if (v14 != *(_DWORD *)(v13 + 1132)
    || (uint64_t v15 = v13 - 1024, v16 = *(_DWORD *)(a1 + 68), v16 != *(_DWORD *)(v13 + 1136)))
  {
LABEL_26:
    int v3 = -300;
    goto LABEL_27;
  }
  uint64_t v17 = 1116;
  if (*(unsigned int *)(a1 + 4) < 0x45CuLL) {
    uint64_t v17 = *(unsigned int *)(a1 + 4);
  }
  if (!memchr((void *)(a1 + 92), 0, v17 - 92)) {
    goto LABEL_2;
  }
  size_t v18 = a1 + v5 - (v12 + 1124) >= 1024 ? 1024 : a1 + v5 - (v12 + 1124);
  if (!memchr((void *)(v12 + 1124), 0, v18)) {
    goto LABEL_2;
  }
  HIBYTE(v20) = *(unsigned char *)(v15 + 2168);
  LOBYTE(v20) = *(unsigned char *)(v15 + 2164);
  sub_1000E2674(*(_DWORD *)(a1 + 28), *(_DWORD *)(a1 + 80), (const char *)(a1 + 92), (const char *)(v12 + 1124), *(UInt8 **)(a1 + 40), v14, *(const UInt8 **)(a1 + 56), v16, *(double *)(v15 + 2148), v20, *(unsigned char *)(v15 + 2172), (unsigned char *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = 0;
  mig_deallocate(*(void *)(a1 + 56), *(unsigned int *)(a1 + 68));
  *(void *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 68) = 0;
  mig_deallocate(*(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
  *(void *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 52) = 0;
  NDR_record_t v19 = NDR_record;
  if (!*(_DWORD *)(a2 + 32))
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }
LABEL_28:
  *(NDR_record_t *)(a2 + 24) = v19;
}

uint64_t sub_1000F20DC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 1004743) >= 0xFFFFFFF7) {
    return (uint64_t)*(&off_1000FEBB8 + 5 * (v1 - 1004734) + 5);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000F211C(unsigned int a1, const char *a2, uint64_t a3, int a4)
{
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
  long long v15 = 0u;
  long long v16 = 0u;
  *(_OWORD *)&v14[4] = 0u;
  memset(&v9, 0, sizeof(v9));
  int v10 = 1;
  uint64_t v11 = a3;
  int v12 = 16777472;
  int v13 = a4;
  *(NDR_record_t *)CFIndex v14 = NDR_record;
  if (&_mig_strncpy_zerofill) {
    int v6 = mig_strncpy_zerofill(&v14[16], a2, 1024);
  }
  else {
    int v6 = mig_strncpy(&v14[16], a2, 1024);
  }
  *(_DWORD *)&v14[8] = 0;
  *(_DWORD *)&v14[12] = v6;
  uint64_t v7 = (v6 + 3) & 0xFFFFFFFC;
  *(_DWORD *)&v14[v7 + 16] = a4;
  v9.msgh_bits = -2147483629;
  *(void *)&v9.msgh_remote_port = a1;
  *(void *)&v9.msgh_voucher_port = 0xF54BE00000000;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set(&v9);
  }
  return mach_msg(&v9, 1, v7 + 64, 0, 0, 0, 0);
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return _AudioFileClose(inAudioFile);
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return _AudioFileGetProperty(inAudioFile, inPropertyID, ioDataSize, outPropertyData);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return _AudioFileOpenURL(inFileRef, inPermissions, inFileTypeHint, outAudioFile);
}

OSStatus AudioFileReadPacketData(AudioFileID inAudioFile, Boolean inUseCache, UInt32 *ioNumBytes, AudioStreamPacketDescription *outPacketDescriptions, SInt64 inStartingPacket, UInt32 *ioNumPackets, void *outBuffer)
{
  return _AudioFileReadPacketData(inAudioFile, inUseCache, ioNumBytes, outPacketDescriptions, inStartingPacket, ioNumPackets, outBuffer);
}

OSStatus AudioQueueAddPropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return _AudioQueueAddPropertyListener(inAQ, inID, inProc, inUserData);
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return _AudioQueueAllocateBuffer(inAQ, inBufferByteSize, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return _AudioQueueDispose(inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return _AudioQueueEnqueueBuffer(inAQ, inBuffer, inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueFlush(AudioQueueRef inAQ)
{
  return _AudioQueueFlush(inAQ);
}

OSStatus AudioQueueGetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, void *outData, UInt32 *ioDataSize)
{
  return _AudioQueueGetProperty(inAQ, inID, outData, ioDataSize);
}

OSStatus AudioQueueNewInput(const AudioStreamBasicDescription *inFormat, AudioQueueInputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return _AudioQueueNewInput(inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, inFlags, outAQ);
}

OSStatus AudioQueuePause(AudioQueueRef inAQ)
{
  return _AudioQueuePause(inAQ);
}

OSStatus AudioQueueRemovePropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return _AudioQueueRemovePropertyListener(inAQ, inID, inProc, inUserData);
}

OSStatus AudioQueueReset(AudioQueueRef inAQ)
{
  return _AudioQueueReset(inAQ);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return _AudioQueueSetProperty(inAQ, inID, inData, inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return _AudioQueueStart(inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return _AudioQueueStop(inAQ, inImmediate);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return _CFArrayCreateCopy(allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

void CFBagAddValue(CFMutableBagRef theBag, const void *value)
{
}

CFMutableBagRef CFBagCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFBagCallBacks *callBacks)
{
  return _CFBagCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFBagGetCountOfValue(CFBagRef theBag, const void *value)
{
  return _CFBagGetCountOfValue(theBag, value);
}

void CFBagRemoveValue(CFMutableBagRef theBag, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return _CFBundleCopyBundleURL(bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return _CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return _CFBundleGetBundleWithIdentifier(bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return _CFBundleGetIdentifier(bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return _CFBundleGetInfoDictionary(bundle);
}

Boolean CFBundleLoadExecutableAndReturnError(CFBundleRef bundle, CFErrorRef *error)
{
  return _CFBundleLoadExecutableAndReturnError(bundle, error);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return _CFCopyHomeDirectoryURLForUser();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return _CFGetAllocator(cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return _CFLocaleCopyCurrent();
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return _CFMachPortCreateWithPort(allocator, portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return _CFMachPortGetPort(port);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListWrite(propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
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

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
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

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return _CFSetContainsValue(theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return _CFSetCreate(allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return _CFSetCreateMutableCopy(allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return _CFSetGetCount(theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return _CFStringCreateWithCharacters(alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFRange v5 = _CFStringFind(theString, stringToFind, compareOptions);
  CFIndex length = v5.length;
  locatioCFIndex n = v5.location;
  result.CFIndex length = length;
  result.locatioCFIndex n = location;
  return result;
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return _CFStringFindWithOptions(theString, stringToFind, rangeToSearch, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return _CFStringTokenizerAdvanceToNextToken(tokenizer);
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return _CFStringTokenizerCopyBestStringLanguage(string, range);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return _CFStringTokenizerCopyCurrentTokenAttribute(tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return _CFStringTokenizerCreate(alloc, string, range, options, locale);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return _CFStringTransform(string, range, transform, reverse);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return _CFURLCopyFileSystemPath(anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return _CFURLCopyLastPathComponent(url);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return _CFURLCopyPathExtension(url);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return _CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFWriteStreamCreateWithFile(alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return _CFWriteStreamOpen(stream);
}

uint64_t CPCreateMIGServerSource()
{
  return _CPCreateMIGServerSource();
}

uint64_t CPRecordCreate()
{
  return _CPRecordCreate();
}

uint64_t CPRecordGetClass()
{
  return _CPRecordGetClass();
}

uint64_t CPRecordGetID()
{
  return _CPRecordGetID();
}

uint64_t CPRecordGetProperty()
{
  return _CPRecordGetProperty();
}

uint64_t CPRecordGetPropertyDescriptor()
{
  return _CPRecordGetPropertyDescriptor();
}

uint64_t CPRecordInitializeProperty()
{
  return _CPRecordInitializeProperty();
}

uint64_t CPRecordSetProperty()
{
  return _CPRecordSetProperty();
}

uint64_t CPRecordStoreAddRecord()
{
  return _CPRecordStoreAddRecord();
}

uint64_t CPRecordStoreCreateSelectPrefixFromRecordDescriptor()
{
  return _CPRecordStoreCreateSelectPrefixFromRecordDescriptor();
}

uint64_t CPRecordStoreCreateWithPath()
{
  return _CPRecordStoreCreateWithPath();
}

uint64_t CPRecordStoreDestroy()
{
  return _CPRecordStoreDestroy();
}

uint64_t CPRecordStoreGetDatabase()
{
  return _CPRecordStoreGetDatabase();
}

uint64_t CPRecordStoreInvalidateCachedInstancesOfClass()
{
  return _CPRecordStoreInvalidateCachedInstancesOfClass();
}

uint64_t CPRecordStoreInvalidateCaches()
{
  return _CPRecordStoreInvalidateCaches();
}

uint64_t CPRecordStoreProcessStatement()
{
  return _CPRecordStoreProcessStatement();
}

uint64_t CPRecordStoreSave()
{
  return _CPRecordStoreSave();
}

uint64_t CPRecordStoreSetSetupHandler()
{
  return _CPRecordStoreSetSetupHandler();
}

uint64_t CPSqliteConnectionPerformSQL()
{
  return _CPSqliteConnectionPerformSQL();
}

uint64_t CPSqliteConnectionStatementForSQL()
{
  return _CPSqliteConnectionStatementForSQL();
}

uint64_t CPSqliteDatabaseSetVersion()
{
  return _CPSqliteDatabaseSetVersion();
}

uint64_t CPSqliteDatabaseStatementForReading()
{
  return _CPSqliteDatabaseStatementForReading();
}

uint64_t CPSqliteDatabaseStatementForWriting()
{
  return _CPSqliteDatabaseStatementForWriting();
}

uint64_t CPSqliteStatementPerform()
{
  return _CPSqliteStatementPerform();
}

uint64_t CPSqliteStatementReset()
{
  return _CPSqliteStatementReset();
}

uint64_t CPSqliteStatementSendResults()
{
  return _CPSqliteStatementSendResults();
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return _ExtAudioFileCreateWithURL(inURL, inFileType, inStreamDesc, inChannelLayout, inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return _ExtAudioFileDispose(inExtAudioFile);
}

OSStatus ExtAudioFileWriteAsync(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return _ExtAudioFileWriteAsync(inExtAudioFile, inNumberFrames, ioData);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSPopAutoreleasePool()
{
  return _NSPopAutoreleasePool();
}

uint64_t NSPushAutoreleasePool()
{
  return _NSPushAutoreleasePool();
}

uint64_t VSAbsoluteTimeToSecond()
{
  return _VSAbsoluteTimeToSecond();
}

uint64_t VSCFArrayGetValueAtIndexIfType()
{
  return _VSCFArrayGetValueAtIndexIfType();
}

uint64_t VSCFDictionaryGetValueIfType()
{
  return _VSCFDictionaryGetValueIfType();
}

uint64_t VSCFPropertyListCreateBinaryXMLData()
{
  return _VSCFPropertyListCreateBinaryXMLData();
}

uint64_t VSCFPropertyListCreateFromBinaryXMLData()
{
  return _VSCFPropertyListCreateFromBinaryXMLData();
}

uint64_t VSCFSetCreateMutableArray()
{
  return _VSCFSetCreateMutableArray();
}

uint64_t VSCFSetSendDifferences()
{
  return _VSCFSetSendDifferences();
}

uint64_t VSCFURLDeleteDirectoryContents()
{
  return _VSCFURLDeleteDirectoryContents();
}

uint64_t VSCopyContentsOfDirectoryAtURL()
{
  return _VSCopyContentsOfDirectoryAtURL();
}

uint64_t VSCreateTemporaryDirectory()
{
  return _VSCreateTemporaryDirectory();
}

uint64_t VSCreateURLAndDirectory()
{
  return _VSCreateURLAndDirectory();
}

uint64_t VSDeleteItemAtURL()
{
  return _VSDeleteItemAtURL();
}

uint64_t VSDirectoryExistsAtURL()
{
  return _VSDirectoryExistsAtURL();
}

uint64_t VSGetLogDefault()
{
  return _VSGetLogDefault();
}

uint64_t VSGetLogEvent()
{
  return _VSGetLogEvent();
}

uint64_t VSKeywordIndexCreate()
{
  return _VSKeywordIndexCreate();
}

uint64_t VSKeywordIndexCreateWithURL()
{
  return _VSKeywordIndexCreateWithURL();
}

uint64_t VSKeywordIndexSaveToURL()
{
  return _VSKeywordIndexSaveToURL();
}

uint64_t VSKeywordIndexSetKeywordsForClassIdentifier()
{
  return _VSKeywordIndexSetKeywordsForClassIdentifier();
}

uint64_t VSKeywordIndexSetKeywordsForModelIdentifier()
{
  return _VSKeywordIndexSetKeywordsForModelIdentifier();
}

uint64_t VSLogBundleCopyPathForFile()
{
  return _VSLogBundleCopyPathForFile();
}

uint64_t VSLogBundleCopyURLForFile()
{
  return _VSLogBundleCopyURLForFile();
}

uint64_t VSLogBundleCreateFromPath()
{
  return _VSLogBundleCreateFromPath();
}

uint64_t VSPreferencesCopySpokenLanguageIdentifier()
{
  return _VSPreferencesCopySpokenLanguageIdentifier();
}

uint64_t VSPreferencesCopyValueForKey()
{
  return _VSPreferencesCopyValueForKey();
}

uint64_t VSPreferencesSetValueForKey()
{
  return _VSPreferencesSetValueForKey();
}

uint64_t VSRecognitionDisambiguationContextCreateFromDictionaryRepresentation()
{
  return _VSRecognitionDisambiguationContextCreateFromDictionaryRepresentation();
}

uint64_t VSRecognitionDisambiguationContextGetAmbiguousClassValueAtIndex()
{
  return _VSRecognitionDisambiguationContextGetAmbiguousClassValueAtIndex();
}

uint64_t VSRecognitionDisambiguationContextGetAmbiguousClassValues()
{
  return _VSRecognitionDisambiguationContextGetAmbiguousClassValues();
}

uint64_t VSRecognitionDisambiguationContextGetKnownClassValue()
{
  return _VSRecognitionDisambiguationContextGetKnownClassValue();
}

uint64_t VSRecognitionDisambiguationContextGetKnownClassValues()
{
  return _VSRecognitionDisambiguationContextGetKnownClassValues();
}

uint64_t VSRecognitionDisambiguationContextGetModelIdentifier()
{
  return _VSRecognitionDisambiguationContextGetModelIdentifier();
}

uint64_t VSRecognitionDisambiguationContextGetSequenceTag()
{
  return _VSRecognitionDisambiguationContextGetSequenceTag();
}

uint64_t VSRecognitionPluginInfoCreateString()
{
  return _VSRecognitionPluginInfoCreateString();
}

uint64_t VSRecognitionResultCopyClassIDsAndPhrases()
{
  return _VSRecognitionResultCopyClassIDsAndPhrases();
}

uint64_t VSRecognitionResultCreate()
{
  return _VSRecognitionResultCreate();
}

uint64_t VSRecognitionResultCreateDictionaryRepresentation()
{
  return _VSRecognitionResultCreateDictionaryRepresentation();
}

uint64_t VSRecognitionResultCreateDictionaryRepresentationWithResultHandlerInfo()
{
  return _VSRecognitionResultCreateDictionaryRepresentationWithResultHandlerInfo();
}

uint64_t VSRecognitionResultGetModelIdentifier()
{
  return _VSRecognitionResultGetModelIdentifier();
}

uint64_t VSRecognitionResultGetPhraseAtIndex()
{
  return _VSRecognitionResultGetPhraseAtIndex();
}

uint64_t VSRecognitionResultGetPhraseCount()
{
  return _VSRecognitionResultGetPhraseCount();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _CFRuntimeCreateInstance()
{
  return __CFRuntimeCreateInstance();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
}

uint64_t _VSCopyFallbackLanguageIdentifierForLanguageIdentifier()
{
  return __VSCopyFallbackLanguageIdentifierForLanguageIdentifier();
}

uint64_t _VSCopyLanguageCodeFromLanguageIdentifier()
{
  return __VSCopyLanguageCodeFromLanguageIdentifier();
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __memset_chk()
{
  return ___memset_chk();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return ___sprintf_chk(a1, a2, a3, a4);
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

void abort(void)
{
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getiopolicy_np(int a1, int a2)
{
  return _getiopolicy_np(a1, a2);
}

void longjmp(jmp_buf a1, int a2)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return _mig_strncpy(dest, src, len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return _mig_strncpy_zerofill(dest, src, len);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return _pthread_getschedparam(a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return _pthread_getspecific(a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return _pthread_key_create(a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return _pthread_setschedparam(a1, a2, a3);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

int putchar(int a1)
{
  return _putchar(a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

int setjmp(jmp_buf a1)
{
  return _setjmp(a1);
}

int setpriority(int a1, id_t a2, int a3)
{
  return _setpriority(a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return _task_get_special_port(task, which_port, special_port);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
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

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_IOBufferDuration(void *a1, const char *a2, ...)
{
  return [a1 IOBufferDuration];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__safeServerGeneration(void *a1, const char *a2, ...)
{
  return [a1 _safeServerGeneration];
}

id objc_msgSend__safeSetupAudioSession(void *a1, const char *a2, ...)
{
  return [a1 _safeSetupAudioSession];
}

id objc_msgSend__setupAudioSession(void *a1, const char *a2, ...)
{
  return [a1 _setupAudioSession];
}

id objc_msgSend__shouldChangeAudioSession(void *a1, const char *a2, ...)
{
  return [a1 _shouldChangeAudioSession];
}

id objc_msgSend_cacheValidityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 cacheValidityIdentifier];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_categoryOptions(void *a1, const char *a2, ...)
{
  return [a1 categoryOptions];
}

id objc_msgSend_cleanCache(void *a1, const char *a2, ...)
{
  return [a1 cleanCache];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectionCount(void *a1, const char *a2, ...)
{
  return [a1 connectionCount];
}

id objc_msgSend_connectionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 connectionIdentifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return [a1 currentRoute];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCacheStore(void *a1, const char *a2, ...)
{
  return [a1 defaultCacheStore];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultService(void *a1, const char *a2, ...)
{
  return [a1 defaultService];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_enableLocalVoices(void *a1, const char *a2, ...)
{
  return [a1 enableLocalVoices];
}

id objc_msgSend_inputLatency(void *a1, const char *a2, ...)
{
  return [a1 inputLatency];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_installedLocalVoices(void *a1, const char *a2, ...)
{
  return [a1 installedLocalVoices];
}

id objc_msgSend_instrumentVoicedProcessStartedPowerEvent(void *a1, const char *a2, ...)
{
  return [a1 instrumentVoicedProcessStartedPowerEvent];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isANECompilationPlatform(void *a1, const char *a2, ...)
{
  return [a1 isANECompilationPlatform];
}

id objc_msgSend_isSpeaking(void *a1, const char *a2, ...)
{
  return [a1 isSpeaking];
}

id objc_msgSend_isWatch(void *a1, const char *a2, ...)
{
  return [a1 isWatch];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_outputLatency(void *a1, const char *a2, ...)
{
  return [a1 outputLatency];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return [a1 portType];
}

id objc_msgSend_registerCacheDelete(void *a1, const char *a2, ...)
{
  return [a1 registerCacheDelete];
}

id objc_msgSend_registerPostInstallActivity(void *a1, const char *a2, ...)
{
  return [a1 registerPostInstallActivity];
}

id objc_msgSend_removeOldFiles(void *a1, const char *a2, ...)
{
  return [a1 removeOldFiles];
}

id objc_msgSend_resetCache(void *a1, const char *a2, ...)
{
  return [a1 resetCache];
}

id objc_msgSend_resetResourcesCache(void *a1, const char *a2, ...)
{
  return [a1 resetResourcesCache];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scheduleBackgroundTasks(void *a1, const char *a2, ...)
{
  return [a1 scheduleBackgroundTasks];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_standardInstance(void *a1, const char *a2, ...)
{
  return [a1 standardInstance];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_updateVoicesAndVoiceResources(void *a1, const char *a2, ...)
{
  return [a1 updateVoicesAndVoiceResources];
}

id objc_msgSend_useSiriTTSService(void *a1, const char *a2, ...)
{
  return [a1 useSiriTTSService];
}

id objc_msgSend_useSiriTTSServiceV2(void *a1, const char *a2, ...)
{
  return [a1 useSiriTTSServiceV2];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_voicePath(void *a1, const char *a2, ...)
{
  return [a1 voicePath];
}

id objc_msgSend_vs_stringFrom4CC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vs_stringFrom4CC:");
}