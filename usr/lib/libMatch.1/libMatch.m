uint64_t matchExec(uint64_t a1, void *a2, _DWORD *a3, unsigned int *a4)
{
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  unsigned char *v14;
  void *v15;
  unsigned int v16;
  unsigned char *v17;
  size_t v18;
  uint64_t v19;
  unsigned char *v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  unsigned char *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unsigned char *v28;
  unsigned __int8 *v29;
  unint64_t v30;
  unsigned int v31;
  uint64_t v32;
  int v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unsigned char *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned char *v42;
  uint64_t v43;
  unsigned int v44;
  unint64_t v45;
  char *v46;
  char v47;
  char v48;
  unsigned int v49;
  unint64_t v50;
  unsigned __int8 *v51;
  unsigned char *v52;
  int v53;
  int v54;
  int v55;
  unint64_t v56;
  unsigned __int8 *v57;
  unint64_t v58;
  char *v59;
  char v60;
  char v61;
  unsigned int v62;
  BOOL v63;
  unsigned int v64;
  unsigned __int8 *v65;
  unint64_t v66;
  unint64_t v67;
  unsigned __int8 *v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unsigned __int8 *v75;
  unsigned int v76;
  unsigned __int8 *v77;
  uint64_t v78;
  unsigned __int8 *v79;
  unsigned __int8 v80;
  int v81;
  unsigned char *v82;
  unsigned int v83;
  unint64_t v84;
  char *v85;
  char v86;
  char v87;
  uint64_t *v88;
  uint64_t v89;
  int v90;
  unsigned __int16 *v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  unsigned char *v95;
  unsigned char *v96;
  uint64_t v97;
  unsigned __int8 *v98;
  unint64_t v99;
  unsigned int v100;
  uint64_t v101;
  int v102;
  int v103;
  unsigned int v104;
  uint64_t v105;
  uint64_t v106;
  unsigned __int16 *v107;
  unsigned __int16 *v108;
  uint64_t v109;
  uint64_t v110;
  unsigned int v111;
  unint64_t v112;
  char *v113;
  char v114;
  char v115;
  unsigned int v116;
  unint64_t v117;
  char *v118;
  char v119;
  char v120;
  unint64_t v121;
  unsigned __int8 *v122;
  unsigned int v123;
  unsigned int v124;
  uint64_t v125;
  int v126;
  uint64_t *v127;
  uint64_t v128;
  unsigned int v129;
  unint64_t v130;
  unint64_t *v131;
  uint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  BOOL v137;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  size_t v142;
  unsigned int v143;
  uint64_t *v144;
  _DWORD *v145;
  uint64_t v146;
  unsigned int *v147;
  uint64_t v148;
  size_t v149;
  uint64_t v150;
  uint64_t v151;
  unsigned char *v152;
  unsigned char *v153;
  uint64_t *v154;
  unsigned char *v155;
  int v156;
  int v157;
  long long v158;
  void *__dst[2];
  size_t __n[2];
  long long v161;
  long long v162;
  long long v163;
  long long v164;
  unsigned char v165[256];
  void v166[66];

  v166[64] = *MEMORY[0x263EF8340];
  if (a3 && (*a3 - 256) < 0xFFFFFF01) {
    return 4294967293;
  }
  v9 = *(void *)(a1 + 56);
  if (!v9)
  {
    result = matchPack(a1, 0, 0);
    if (result) {
      return result;
    }
    v9 = *(void *)(a1 + 56);
  }
  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  __dst[1] = 0;
  *(_OWORD *)__n = 0u;
  v158 = 0u;
  __dst[0] = a2;
  if (a3)
  {
    LODWORD(__dst[1]) = *a3;
    __n[0] = 16 * LODWORD(__dst[1]);
    LOWORD(v164) = *(_WORD *)(v9 + 16);
    if (LODWORD(__dst[1]))
    {
      v10 = 0x100 / ((16 * LODWORD(__dst[1])) | 0xAuLL);
      goto LABEL_12;
    }
  }
  else
  {
    LODWORD(__dst[1]) = 0;
    __n[0] = 0;
    LOWORD(v164) = *(_WORD *)(v9 + 16);
  }
  LODWORD(v10) = 25;
LABEL_12:
  LOWORD(__n[1]) = v10;
  *(void *)&v163 = a1;
  *((void *)&v163 + 1) = *(void *)v9;
  *((void *)&v164 + 1) = *(void *)(v9 + 8);
  *(void *)&v161 = v165;
  DWORD2(v161) = 0;
  *(void *)&v162 = v166;
  DWORD2(v162) = 0;
  v11 = a2;
  if (!v10)
  {
    if (!expandBuffers((uint64_t)&v158)) {
      return 4294967292;
    }
    v11 = __dst[0];
  }
  v12 = (uint64_t *)&v161;
  v13 = a2[1];
  *(void *)&v158 = *a2;
  v14 = (unsigned char *)v158;
  *((void *)&v158 + 1) = v13;
  *v11 = 0;
  v15 = __dst[0];
  *((void *)__dst[0] + 1) = v13 - (void)v14;
  v16 = __dst[1];
  if (LODWORD(__dst[1]) >= 2) {
    memset((char *)__dst[0] + 16, 255, 16 * (LODWORD(__dst[1]) - 1));
  }
  v146 = a1;
  v147 = a4;
  v145 = a3;
  DWORD2(v161) = 0;
  v17 = (unsigned char *)*((void *)&v158 + 1);
  v18 = __n[0];
  v19 = v161;
  *(_DWORD *)(v161 + 6) = 0;
  v155 = v17;
  if (v14 <= v17)
  {
    v141 = v15;
    v142 = v18;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = *((void *)&v163 + 1);
    v148 = v19;
    v150 = *((void *)&v164 + 1);
    v27 = *((void *)&v163 + 1) + 4;
    v140 = *((void *)&v163 + 1) + 3;
    v20 = v14;
    v143 = v16;
LABEL_22:
    while (2)
    {
      v28 = (unsigned char *)(v20 - v14);
      while (2)
      {
        v29 = (unsigned __int8 *)(v26 + (unsigned __int16)v25);
        v30 = *v29;
        switch(v30 & 0xF)
        {
          case 1uLL:
          case 0xEuLL:
LABEL_264:
            __break(1u);
            JUMPOUT(0x237602E20);
          case 2uLL:
            if (v20 == v17 || v29[1] != *v20) {
              goto LABEL_90;
            }
            v25 += 2;
            goto LABEL_143;
          case 3uLL:
            if (v20 == v17 || v30 < 0x10) {
              goto LABEL_90;
            }
            v56 = v30 >> 4;
            v57 = (unsigned __int8 *)(v140 + (unsigned __int16)v25);
            while (*v57 != *v20)
            {
              v57 += 3;
              if (!--v56) {
                goto LABEL_90;
              }
            }
            v25 = *((unsigned __int16 *)v57 - 1);
            goto LABEL_143;
          case 5uLL:
            memcpy(v141, (const void *)(v19 + 10), v142);
            LODWORD(__dst[1]) = *(_DWORD *)(v19 + 6);
            v129 = *(unsigned __int16 *)v29;
LABEL_239:
            v21 = v129 >> 4;
            goto LABEL_240;
          case 6uLL:
            v31 = *(unsigned __int16 *)v29;
            v32 = (unsigned __int16)v31 >> 4;
            if (v16 > v32)
            {
              *(void *)(v19 + 16 * v32 + 18) = v28;
              v31 = *v29;
            }
            v33 = 2;
            switch(v31 & 0xF)
            {
              case 0u:
              case 4u:
              case 8u:
              case 0xAu:
              case 0xCu:
                goto LABEL_36;
              case 2u:
              case 5u:
              case 6u:
              case 7u:
                goto LABEL_57;
              case 3u:
                v34 = 3 * (v31 >> 4);
                goto LABEL_56;
              case 9u:
                goto LABEL_52;
              case 0xBu:
              case 0xDu:
                goto LABEL_51;
              case 0xFu:
                goto LABEL_53;
              default:
                goto LABEL_54;
            }
            goto LABEL_57;
          case 7uLL:
            v35 = *(unsigned __int16 *)v29;
            v36 = (unsigned __int16)v35 >> 4;
            v31 = v35;
            if (v16 <= v36) {
              goto LABEL_35;
            }
            *(void *)(v19 + 16 * v36 + 10) = v28;
            v37 = *(unsigned int *)(v19 + 6);
            if (v36 > v37)
            {
              v156 = v23;
              v38 = (void *)(v19 + 16 * v37 + 10);
              v152 = v28;
              v39 = v14;
              v40 = v22;
              v41 = v27;
              v42 = v24;
              v43 = v26;
              memset(v38, 255, 16 * (v36 - v37));
              v28 = v152;
              v23 = v156;
              v26 = v43;
              v24 = v42;
              v27 = v41;
              v22 = v40;
              v14 = v39;
              v16 = v143;
              v19 = v148;
              v17 = v155;
            }
            if (v35 > 0xFEF) {
              goto LABEL_90;
            }
            v44 = *(_DWORD *)(v19 + 6);
            if (v44 <= (int)v36 + 1) {
              v44 = v36 + 1;
            }
            *(_DWORD *)(v19 + 6) = v44;
            v31 = *v29;
LABEL_35:
            v33 = 2;
            switch(v31 & 0xF)
            {
              case 0u:
              case 4u:
              case 8u:
              case 0xAu:
              case 0xCu:
LABEL_36:
                v33 = 3;
                break;
              case 2u:
              case 5u:
              case 6u:
              case 7u:
                break;
              case 3u:
                v34 = 2 * (v31 >> 4) + ((v31 & 0xF0) >> 4);
LABEL_56:
                v33 = v34 + 1;
                break;
              case 9u:
LABEL_52:
                v33 = 1;
                break;
              case 0xBu:
              case 0xDu:
LABEL_51:
                v33 = ((v31 & 0xF0) >> 3) | 1;
                break;
              case 0xFu:
LABEL_53:
                v33 = ((v31 >> 3) & 0x1E) - 1;
                break;
              default:
LABEL_54:
                v33 = 0;
                break;
            }
LABEL_57:
            v25 += v33;
            continue;
          case 9uLL:
            switch((v30 >> 4) & 7)
            {
              case 1u:
                if (v14 != v20) {
                  goto LABEL_90;
                }
                goto LABEL_50;
              case 2u:
                if (v20 != v17) {
                  goto LABEL_90;
                }
LABEL_50:
                ++v25;
                continue;
              case 3u:
                if ((((unsigned __int16)v25 + 1) & 0x10000) != 0) {
                  goto LABEL_90;
                }
                v24 = v20;
                v22 = (unsigned __int16)v25 + 1;
                goto LABEL_92;
              case 4u:
                goto LABEL_90;
              default:
                if (v20 == v17) {
                  goto LABEL_90;
                }
                ++v25;
                goto LABEL_143;
            }
          case 0xAuLL:
            v25 = *(unsigned __int16 *)(v29 + 1);
            continue;
          case 0xBuLL:
            if (v20 == v17 || v30 < 0x10) {
              goto LABEL_90;
            }
            if ((*v20 - v29[1]) <= (v29[2] - v29[1])) {
              goto LABEL_83;
            }
            v58 = 0;
            v59 = (char *)(v27 + (unsigned __int16)v25);
            do
            {
              if ((v30 >> 4) - 1 == v58) {
                goto LABEL_90;
              }
              v60 = *(v59 - 1);
              v61 = *v59;
              v59 += 2;
              ++v58;
            }
            while ((*v20 - v60) > (v61 - v60));
            if (v58 >= v30 >> 4) {
              goto LABEL_90;
            }
LABEL_83:
            v25 += (v30 >> 3) | 1;
            goto LABEL_143;
          case 0xDuLL:
            if (v20 == v17 || v30 < 0x10) {
              goto LABEL_48;
            }
            if ((*v20 - v29[1]) <= (v29[2] - v29[1])) {
              goto LABEL_143;
            }
            v45 = 0;
            v46 = (char *)(v27 + (unsigned __int16)v25);
            do
            {
              if ((v30 >> 4) - 1 == v45) {
                goto LABEL_48;
              }
              v47 = *(v46 - 1);
              v48 = *v46;
              v46 += 2;
              ++v45;
            }
            while ((*v20 - v47) > (v48 - v47));
            if (v45 < v30 >> 4) {
              goto LABEL_143;
            }
LABEL_48:
            v25 += (v30 >> 3) | 1;
            continue;
          case 0xFuLL:
            v62 = ((v30 >> 3) & 0x1E) - 1;
            v63 = __CFADD__(v62, (unsigned __int16)v25);
            v64 = v62 + (unsigned __int16)v25;
            if (v63 || HIWORD(v64)) {
              goto LABEL_90;
            }
            v12 = (uint64_t *)&v161;
            if (!addNodeToList((uint64_t)&v158, (uint64_t *)&v161, v19, (unsigned __int16)v64, 0)) {
              return 4294967292;
            }
            if (*v29 < 0x20u) {
              goto LABEL_263;
            }
            v139 = 0;
            do
            {
              if ((addNodeToList((uint64_t)&v158, (uint64_t *)&v161, v19, *(unsigned __int16 *)&v29[2 * v139 + 1], 0) & 1) == 0) {
                return 4294967292;
              }
              ++v139;
            }
            while (v139 + 1 < (unint64_t)*v29 >> 4);
LABEL_263:
            v17 = v155;
            v18 = v142;
            goto LABEL_19;
          default:
            v49 = 2;
            switch(v30 & 0xF)
            {
              case 0uLL:
              case 4uLL:
              case 8uLL:
              case 0xAuLL:
              case 0xCuLL:
                v49 = 3;
                break;
              case 2uLL:
              case 5uLL:
              case 6uLL:
              case 7uLL:
                break;
              case 3uLL:
                v49 = 3 * (v30 >> 4) + 1;
                break;
              case 9uLL:
                v49 = 1;
                break;
              case 0xBuLL:
                v49 = (v30 >> 3) | 1;
                break;
              default:
                v49 = 0;
                break;
            }
            v25 = v49 + (unsigned __int16)v25;
            if (HIWORD(v25)) {
              goto LABEL_90;
            }
            v50 = v30 >> 2;
            if (v17 - v20 < (uint64_t)(v30 >> 2)) {
              goto LABEL_90;
            }
            v51 = (unsigned __int8 *)(v150 + *(unsigned __int16 *)(v29 + 1));
            v52 = &v20[v50];
            break;
        }
        break;
      }
      do
      {
        if (!v50)
        {
          v20 = v52;
          goto LABEL_22;
        }
        LODWORD(v50) = v50 - 1;
        v54 = *v51++;
        v53 = v54;
        v55 = *v20++;
      }
      while (v53 == v55);
LABEL_90:
      if (v23)
      {
        v20 = ++v24;
LABEL_92:
        v65 = (unsigned __int8 *)(v26 + (unsigned __int16)v22);
        v66 = *v65;
        switch(v66 & 0xF)
        {
          case 0uLL:
          case 4uLL:
          case 8uLL:
          case 0xCuLL:
            v67 = (unint64_t)&v17[-(v66 >> 2)];
            if (v67 < (unint64_t)v24) {
              break;
            }
            v68 = (unsigned __int8 *)(v150 + *(unsigned __int16 *)(v65 + 1));
            if ((v66 >> 2) <= 2) {
              v69 = 2;
            }
            else {
              v69 = (v66 >> 2);
            }
            v20 = v24;
LABEL_98:
            if (*v20 != *v68) {
              goto LABEL_112;
            }
            if (v66 >= 8)
            {
              v70 = 1;
              while (v68[v70] == v20[v70])
              {
                if (v69 == ++v70) {
                  goto LABEL_103;
                }
              }
LABEL_112:
              if ((unint64_t)++v20 > v67) {
                break;
              }
              goto LABEL_98;
            }
LABEL_103:
            v71 = 2;
            switch(v66 & 0xF)
            {
              case 0uLL:
              case 4uLL:
              case 8uLL:
              case 0xAuLL:
              case 0xCuLL:
                v71 = 3;
                break;
              case 2uLL:
              case 5uLL:
              case 6uLL:
              case 7uLL:
                break;
              case 3uLL:
                v71 = 3 * (v66 >> 4) + 1;
                break;
              case 9uLL:
                v71 = 1;
                break;
              case 0xBuLL:
              case 0xDuLL:
                v71 = (v66 >> 3) | 1;
                break;
              case 0xFuLL:
                v71 = ((v66 >> 3) & 0x1E) - 1;
                break;
              default:
                v71 = 0;
                break;
            }
            v25 = (unsigned __int16)v22 + v71;
            if (__CFADD__((unsigned __int16)v22, v71) || v25 >= 0x10000) {
              goto LABEL_112;
            }
LABEL_142:
            v23 = 1;
LABEL_143:
            ++v20;
            v12 = (uint64_t *)&v161;
            v18 = v142;
            if (v20 > v17) {
              goto LABEL_19;
            }
            continue;
          case 2uLL:
            if (v24 >= v17) {
              goto LABEL_20;
            }
            v72 = v17 - v20;
            v20 = v24;
            while (*v20 != v65[1])
            {
              ++v20;
              if (!--v72) {
                goto LABEL_20;
              }
            }
            if ((unsigned __int16)v22 > 0xFFFDu) {
              goto LABEL_20;
            }
            v25 = v22 + 2;
            goto LABEL_142;
          case 3uLL:
            if (v66 >= 0x10)
            {
              v73 = 0;
              v74 = v66 >> 4;
              v75 = v65 + 3;
              do
              {
                v76 = *v75;
                v75 += 3;
                *((unsigned char *)&v166[32] + v76) = v73++;
              }
              while (v74 != v73);
            }
            if (v24 >= v17) {
              goto LABEL_20;
            }
            v77 = v65 + 1;
            v78 = v17 - v20;
            v20 = v24;
            while (1)
            {
              v79 = &v77[3 * *((unsigned __int8 *)&v166[32] + *v20)];
              if (v79[2] == *v20) {
                break;
              }
              ++v20;
              if (!--v78) {
                goto LABEL_20;
              }
            }
            v25 = *(unsigned __int16 *)v79;
            goto LABEL_142;
          case 0xBuLL:
            if (v24 >= v17) {
              goto LABEL_20;
            }
            v80 = v65[1];
            v81 = 2 * (v66 >> 4);
            v82 = &v24[v17 - v20];
            v20 = v24;
            while (1)
            {
              if (v66 >= 0x10)
              {
                v83 = (*v20 - v80);
                if (v83 <= (v65[v81 - 2 + 2] - v80))
                {
                  if (v83 <= (v65[2] - v80)) {
                    break;
                  }
                  v84 = 0;
                  v85 = (char *)(v27 + (unsigned __int16)v22);
                  do
                  {
                    if ((v66 >> 4) - 1 == v84) {
                      goto LABEL_136;
                    }
                    v86 = *(v85 - 1);
                    v87 = *v85;
                    v85 += 2;
                    ++v84;
                  }
                  while ((*v20 - v86) > (v87 - v86));
                  if (v84 < v66 >> 4) {
                    break;
                  }
                }
              }
LABEL_136:
              if (++v20 == v82) {
                goto LABEL_20;
              }
            }
            v25 = (v81 | 1) + (unsigned __int16)v22;
            if (!HIWORD(v25)) {
              goto LABEL_142;
            }
            goto LABEL_20;
          default:
            goto LABEL_20;
        }
      }
      break;
    }
LABEL_20:
    v21 = 0;
    goto LABEL_240;
  }
  v20 = v14;
LABEL_19:
  if (v20 > v17) {
    goto LABEL_20;
  }
  v88 = (uint64_t *)&v162;
  v149 = v18 + 10;
LABEL_152:
  v144 = v88;
  *((_DWORD *)v88 + 2) = 0;
  v21 = *((_DWORD *)v12 + 2);
  if (!v21) {
    goto LABEL_240;
  }
  v89 = 0;
  v90 = 0;
  v154 = v12;
LABEL_154:
  v157 = v90;
  v91 = (unsigned __int16 *)(*v12 + v89);
  v92 = *v91;
  v93 = *(unsigned int *)(v91 + 1);
  v94 = *((void *)&v163 + 1);
  v95 = (unsigned char *)v158;
  v96 = &v20[-v158];
  v97 = *((void *)&v163 + 1) + 4;
  while (2)
  {
    v98 = (unsigned __int8 *)(v94 + (unsigned __int16)v92);
    v99 = *v98;
    switch(v99 & 0xF)
    {
      case 1uLL:
      case 0xEuLL:
        goto LABEL_264;
      case 2uLL:
        if (v20 == v17 || v98[1] != *v20) {
          goto LABEL_234;
        }
        LOWORD(v92) = v92 + 2;
        goto LABEL_231;
      case 3uLL:
        if (v20 == v17 || v99 < 0x10) {
          goto LABEL_234;
        }
        v121 = v99 >> 4;
        v122 = (unsigned __int8 *)(v94 + (unsigned __int16)v92 + 3);
        while (*v122 != *v20)
        {
          v122 += 3;
          if (!--v121) {
            goto LABEL_234;
          }
        }
        LOWORD(v92) = *((_WORD *)v122 - 1);
        goto LABEL_231;
      case 5uLL:
        memcpy(__dst[0], v91 + 5, __n[0]);
        LODWORD(__dst[1]) = *(_DWORD *)(v91 + 3);
        v129 = *(unsigned __int16 *)v98;
        goto LABEL_239;
      case 6uLL:
        v100 = *(unsigned __int16 *)v98;
        v101 = (unsigned __int16)v100 >> 4;
        if (LODWORD(__dst[1]) > v101)
        {
          *(void *)&v91[8 * v101 + 9] = v96;
          v100 = *v98;
        }
        v102 = 2;
        switch(v100 & 0xF)
        {
          case 0u:
          case 4u:
          case 8u:
          case 0xAu:
          case 0xCu:
            goto LABEL_168;
          case 2u:
          case 5u:
          case 6u:
          case 7u:
            goto LABEL_189;
          case 3u:
            v103 = 3 * (v100 >> 4);
            goto LABEL_188;
          case 9u:
            goto LABEL_184;
          case 0xBu:
          case 0xDu:
            goto LABEL_183;
          case 0xFu:
            goto LABEL_185;
          default:
            goto LABEL_186;
        }
        goto LABEL_189;
      case 7uLL:
        v104 = *(unsigned __int16 *)v98;
        v105 = (unsigned __int16)v104 >> 4;
        v100 = v104;
        if (LODWORD(__dst[1]) <= v105) {
          goto LABEL_167;
        }
        *(void *)&v91[8 * v105 + 5] = v96;
        v106 = *(unsigned int *)(v91 + 3);
        if (v105 > v106)
        {
          v151 = v97;
          v153 = v95;
          v107 = &v91[8 * v106 + 5];
          v108 = v91;
          v109 = v89;
          v110 = v93;
          memset(v107, 255, 16 * (v105 - v106));
          v97 = v151;
          v95 = v153;
          v93 = v110;
          v89 = v109;
          v91 = v108;
          v17 = v155;
        }
        if (v104 > 0xFEF) {
          goto LABEL_234;
        }
        v111 = *(_DWORD *)(v91 + 3);
        if (v111 <= (int)v105 + 1) {
          v111 = v105 + 1;
        }
        *(_DWORD *)(v91 + 3) = v111;
        v100 = *v98;
LABEL_167:
        v102 = 2;
        switch(v100 & 0xF)
        {
          case 0u:
          case 4u:
          case 8u:
          case 0xAu:
          case 0xCu:
LABEL_168:
            v102 = 3;
            break;
          case 2u:
          case 5u:
          case 6u:
          case 7u:
            break;
          case 3u:
            v103 = 2 * (v100 >> 4) + ((v100 & 0xF0) >> 4);
LABEL_188:
            v102 = v103 + 1;
            break;
          case 9u:
LABEL_184:
            v102 = 1;
            break;
          case 0xBu:
          case 0xDu:
LABEL_183:
            v102 = ((v100 & 0xF0) >> 3) | 1;
            break;
          case 0xFu:
LABEL_185:
            v102 = ((v100 >> 3) & 0x1E) - 1;
            break;
          default:
LABEL_186:
            v102 = 0;
            break;
        }
LABEL_189:
        v92 += v102;
        continue;
      case 9uLL:
        switch((v99 >> 4) & 7)
        {
          case 1u:
            if (v95 != v20) {
              goto LABEL_234;
            }
            goto LABEL_182;
          case 2u:
            if (v20 != v17) {
              goto LABEL_234;
            }
LABEL_182:
            ++v92;
            continue;
          case 3u:
            if ((_WORD)v92 == 0xFFFF) {
              goto LABEL_234;
            }
            addNodeToList((uint64_t)&v158, v144, (uint64_t)v91, (unsigned __int16)v92, 0);
            v126 = (unsigned __int16)(v92 + 1);
            v127 = v154;
            v128 = (uint64_t)v91;
            LODWORD(v93) = 0;
            goto LABEL_233;
          case 4u:
            goto LABEL_234;
          default:
            if (v20 == v17) {
              goto LABEL_234;
            }
            LOWORD(v92) = v92 + 1;
            goto LABEL_231;
        }
      case 0xAuLL:
        v92 = *(unsigned __int16 *)(v98 + 1);
        continue;
      case 0xBuLL:
        if (v20 == v17 || v99 < 0x10) {
          goto LABEL_234;
        }
        if ((*v20 - v98[1]) <= (v98[2] - v98[1])) {
          goto LABEL_204;
        }
        v117 = 0;
        v118 = (char *)(v94 + (unsigned __int16)v92 + 4);
        while ((v99 >> 4) - 1 != v117)
        {
          v119 = *(v118 - 1);
          v120 = *v118;
          v118 += 2;
          ++v117;
          if ((*v20 - v119) <= (v120 - v119))
          {
            if (v117 >= v99 >> 4) {
              goto LABEL_234;
            }
LABEL_204:
            v92 += (v99 >> 3) | 1;
LABEL_231:
            LODWORD(v93) = 0;
            goto LABEL_232;
          }
        }
        goto LABEL_234;
      case 0xDuLL:
        if (v20 == v17 || v99 < 0x10) {
          goto LABEL_180;
        }
        if ((*v20 - v98[1]) <= (v98[2] - v98[1])) {
          goto LABEL_232;
        }
        v112 = 0;
        v113 = (char *)(v97 + (unsigned __int16)v92);
        do
        {
          if ((v99 >> 4) - 1 == v112) {
            goto LABEL_180;
          }
          v114 = *(v113 - 1);
          v115 = *v113;
          v113 += 2;
          ++v112;
        }
        while ((*v20 - v114) > (v115 - v114));
        if (v112 >= v99 >> 4)
        {
LABEL_180:
          v92 += (v99 >> 3) | 1;
          continue;
        }
LABEL_232:
        v126 = (unsigned __int16)v92;
        v127 = v144;
        v128 = (uint64_t)v91;
LABEL_233:
        addNodeToList((uint64_t)&v158, v127, v128, v126, v93);
        v17 = v155;
LABEL_234:
        v89 += v149;
        v90 = v157 + 1;
        v12 = v154;
        if ((v157 + 1) < *((_DWORD *)v154 + 2)) {
          goto LABEL_154;
        }
        v21 = 0;
        ++v20;
        v88 = v154;
        v12 = v144;
        if (v20 <= v17) {
          goto LABEL_152;
        }
LABEL_240:
        *v147 = v21;
        if (v145) {
          *v145 = __dst[1];
        }
        if (LODWORD(__dst[1]))
        {
          v130 = 0;
          v131 = (unint64_t *)__dst[0];
          v132 = v158;
          v133 = *((void *)&v158 + 1) - v158;
          v134 = LODWORD(__dst[1]);
          do
          {
            v135 = *v131;
            if (*v131 > v133 || ((v136 = v131[1], v136 <= v133) ? (v137 = v135 > v136) : (v137 = 1), v137))
            {
              *v131 = 0;
              v131[1] = 0;
            }
            else
            {
              *v131 = v132 + v135;
              v131[1] = v132 + v136;
            }
            ++v130;
            v131 += 2;
          }
          while (v130 < v134);
        }
        if ((unsigned char *)v161 != v165) {
          (*(void (**)(void, void))(v146 + 16))(v161, *(void *)(v146 + 24));
        }
        return 0;
      case 0xFuLL:
        v123 = ((v99 >> 3) & 0x1E) - 1;
        v63 = __CFADD__(v123, (unsigned __int16)v92);
        v124 = v123 + (unsigned __int16)v92;
        if (v63 || HIWORD(v124)) {
          goto LABEL_234;
        }
        if (!addNodeToList((uint64_t)&v158, v154, (uint64_t)v91, (unsigned __int16)v124, 0)) {
          goto LABEL_255;
        }
        v17 = v155;
        if (*v98 < 0x20u) {
          goto LABEL_234;
        }
        v125 = 0;
        while ((addNodeToList((uint64_t)&v158, v154, (uint64_t)v91, *(unsigned __int16 *)&v98[2 * v125 + 1], 0) & 1) != 0)
        {
          ++v125;
          v17 = v155;
          if (v125 + 1 >= (unint64_t)*v98 >> 4) {
            goto LABEL_234;
          }
        }
LABEL_255:
        *v147 = 0;
        return 4294967292;
      default:
        v116 = 2;
        switch(v99 & 0xF)
        {
          case 0uLL:
          case 4uLL:
          case 8uLL:
          case 0xAuLL:
          case 0xCuLL:
            v116 = 3;
            break;
          case 2uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
            break;
          case 3uLL:
            v116 = 3 * (v99 >> 4) + 1;
            break;
          case 9uLL:
            v116 = 1;
            break;
          case 0xBuLL:
            v116 = (v99 >> 3) | 1;
            break;
          default:
            v116 = 0;
            break;
        }
        if (v20 == v17
          || (v116 + (unsigned __int16)v92) >> 16
          || *(unsigned __int8 *)(*((void *)&v164 + 1) + *(unsigned __int16 *)(v98 + 1) + v93) != *v20)
        {
          goto LABEL_234;
        }
        LODWORD(v93) = v93 + 1;
        if (v93 != v99 >> 2) {
          goto LABEL_232;
        }
        LOWORD(v92) = v116 + v92;
        goto LABEL_231;
    }
  }
}

uint64_t expandBuffers(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32) + 10;
  uint64_t v2 = *(unsigned __int16 *)(a1 + 96);
  if (v1 > 0x3FFFFFFF / v2) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(unint64_t, void))(*(void *)(a1 + 80) + 8))(2 * v1 * v2, *(void *)(*(void *)(a1 + 80) + 24));
  if (result)
  {
    uint64_t v5 = result;
    memcpy((void *)result, *(const void **)(a1 + 48), v1 * *(unsigned int *)(a1 + 56));
    *(void *)(a1 + 48) = v5;
    v6 = (void *)(v5 + v1 * v2);
    memcpy(v6, *(const void **)(a1 + 64), v1 * *(unsigned int *)(a1 + 72));
    *(void *)(a1 + 64) = v6;
    *(_WORD *)(a1 + 40) = v2;
    return 1;
  }
  return result;
}

uint64_t addNodeToList(uint64_t a1, uint64_t *a2, uint64_t a3, int a4, int a5)
{
  __int16 v6 = a4;
  size_t v10 = *(void *)(a1 + 32);
  size_t v11 = v10 + 10;
  uint64_t v12 = *a2;
  uint64_t v13 = *((unsigned int *)a2 + 2);
  if (v13)
  {
    v14 = (_DWORD *)(v12 + 2);
    uint64_t v15 = *((unsigned int *)a2 + 2);
    while (*((unsigned __int16 *)v14 - 1) != a4 || *v14 != a5)
    {
      v14 = (_DWORD *)((char *)v14 + v11);
      if (!--v15) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    if (v13 >= *(unsigned __int16 *)(a1 + 40))
    {
      uint64_t result = expandBuffers(a1);
      if (!result) {
        return result;
      }
      uint64_t v12 = *a2;
      int v16 = *((_DWORD *)a2 + 2);
      size_t v10 = *(void *)(a1 + 32);
    }
    else
    {
      int v16 = *((_DWORD *)a2 + 2);
    }
    size_t v18 = v12 + v11 * v13;
    *((_DWORD *)a2 + 2) = v16 + 1;
    *(_WORD *)size_t v18 = v6;
    *(_DWORD *)(v18 + 2) = a5;
    *(_DWORD *)(v18 + 6) = *(_DWORD *)(a3 + 6);
    if (v10) {
      memcpy((void *)(v18 + 10), (const void *)(a3 + 10), v10);
    }
  }
  return 1;
}

uint64_t matchOptimize(uint64_t a1, int a2)
{
  uint64_t v199 = *MEMORY[0x263EF8340];
  if (!a2) {
    return 0;
  }
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(unsigned int *)(v3 + 36);
  uint64_t v5 = (int *)(*(uint64_t (**)(uint64_t, void))(a1 + 8))(16 * v4, *(void *)(a1 + 24));
  if (!v5) {
    return 4294967292;
  }
  __int16 v6 = v5;
  bzero(v5, 16 * v4);
  __src = v6;
  v7 = &v6[2 * v4];
  *(void *)(v3 + 16) = v7;
  uint64_t v8 = v3 + 16;
  *(void *)(v8 + 8) = &v7[v4];
  uint64_t v173 = v8;
  *(_DWORD *)(v8 + 16) = 0;
  uint64_t v9 = *(void *)(v2 + 64);
  *(_DWORD *)(*(void *)(v9 + 16) + 4 * *(unsigned int *)(v9 + 8)) = 1;
  if (*(_DWORD *)(v9 + 12))
  {
    unsigned int v10 = 0;
    do
      nodeModRefs(v2, v10++, 1);
    while (v10 < *(_DWORD *)(v9 + 12));
  }
  simplifyBranches(v2, v6);
  uint64_t v11 = *(void *)(v2 + 64);
  v174 = &v6[*(unsigned int *)(v11 + 36)];
  uint64_t v196 = *(void *)(v11 + 16);
  uint64_t v12 = v6;
  uint64_t v179 = v2;
  do
  {
    uint64_t v180 = *(unsigned int *)(v11 + 12);
    if (!v180) {
      break;
    }
    uint64_t v13 = 0;
    char v175 = 0;
    do
    {
      uint64_t v14 = v11 + 16 * v13;
      v182 = (unsigned char *)(v14 + 40);
      if (*(unsigned char *)(v14 + 40) == 39)
      {
        uint64_t v181 = v13;
        v17 = *(_DWORD **)(v14 + 48);
        int v16 = (void *)(v14 + 48);
        uint64_t v15 = v17;
        unint64_t v18 = v17[1];
        if (!v18) {
          goto LABEL_37;
        }
        unint64_t v19 = 0;
        v177 = (unsigned char *)(v11 + 16 * v181 + 41);
        v178 = v16;
        v185 = v12;
        while (2)
        {
          uint64_t v20 = v15[v19 + 2];
          if (*(_DWORD *)(v196 + 4 * v20) != 1) {
            goto LABEL_35;
          }
          uint64_t v21 = v11 + 16 * v20;
          unsigned int v23 = *(unsigned __int8 *)(v21 + 40);
          v22 = (unsigned __int8 *)(v21 + 40);
          uint64_t v24 = (1 << v23) & 0x1D000000010000;
          BOOL v25 = v23 > 0x34 || v24 == 0;
          unint64_t v26 = v19 + 1;
          if (v25 || v26 >= v18) {
            goto LABEL_35;
          }
          int v183 = v15[v19 + 2];
          unsigned int v193 = 1;
LABEL_21:
          uint64_t v28 = 0;
          int v187 = v26;
          v190 = v15;
          uint64_t v29 = v26;
          uint64_t v30 = 4 * v26 + 8;
          v31 = (char *)v15 + v30;
          while (1)
          {
            uint64_t v32 = *(unsigned int *)&v31[4 * v28];
            uint64_t v33 = v11;
            v34 = (unsigned __int8 *)(v11 + 16 * v32 + 40);
            if (*(_DWORD *)(v196 + 4 * v32) == 1
              && !nodeCmp(v22, (unsigned __int8 *)(v11 + 16 * v32 + 40)))
            {
              unsigned int v35 = v193;
              v185[v193] = v32;
              uint64_t v12 = v185;
              v36 = v190;
              if (*v190 >= 2u)
              {
                size_t v37 = 4 * (v190[1] - 1) + 8;
                v38 = (_DWORD *)(*(uint64_t (**)(size_t, void))(v179 + 8))(v37, *(void *)(v179 + 24));
                if (!v38) {
                  goto LABEL_191;
                }
                v39 = v38;
                memcpy(v38, v190, v37);
                _DWORD *v39 = 1;
                unsigned char *v182 = 39;
                unsigned char *v177 = 126;
                v36 = v39;
                void *v178 = v39;
                unsigned int v35 = v193;
              }
              unsigned int v193 = v35 + 1;
              LODWORD(v26) = v29 + v28;
              int v40 = v36[1];
              v36[1] = v40 - 1;
              v41 = v36;
              memmove((char *)v36 + v30, &v36[(v29 + v28 + 1) + 2], 4 * (~v187 + v40 - v28));
              uint64_t v15 = v41;
              unint64_t v18 = v41[1];
              uint64_t v11 = v33;
              if (v18 <= (v187 + v28)) {
                goto LABEL_34;
              }
              goto LABEL_21;
            }
            if (nodesMightOverlap(v22, v34)) {
              break;
            }
            ++v28;
            v30 += 4;
            uint64_t v11 = v33;
            if (v28 + v29 >= v18) {
              goto LABEL_33;
            }
          }
          uint64_t v11 = v33;
LABEL_33:
          uint64_t v12 = v185;
          uint64_t v15 = v190;
LABEL_34:
          if (v193 < 2)
          {
LABEL_35:
            ++v19;
            unint64_t v18 = v15[1];
            if (v19 >= v18)
            {
              uint64_t v2 = v179;
              goto LABEL_37;
            }
            continue;
          }
          break;
        }
        *uint64_t v12 = v183;
        uint64_t v2 = v179;
        uint64_t v13 = v181;
        if (v15[1] == 1)
        {
          unsigned char *v182 = 49;
          *(_DWORD *)(v11 + 16 * v181 + 44) = v15[2];
          (*(void (**)(void))(v179 + 16))();
          uint64_t v11 = v33;
        }
        int v42 = *v22;
        v43 = v12;
LABEL_43:
        if (v42 == 34)
        {
          for (uint64_t i = 1; i != v193; nodeModRefCount(v179, v43[i++], -1))
            ;
          char v175 = 1;
          uint64_t v12 = v43;
          uint64_t v11 = v33;
        }
        else
        {
          uint64_t v44 = 0;
          uint64_t v12 = v43;
          v43 = v174;
          do
          {
            v174[v44] = *(_DWORD *)(v11 + 16 * v12[v44] + 44);
            if (v44)
            {
              *(_DWORD *)(v196 + 4 * v12[v44]) = 0;
              uint64_t v45 = v12[v44];
              uint64_t v46 = *(void *)(v179 + 64);
              uint64_t v47 = v46 + 16 * v45;
              *(unsigned char *)(v47 + 40) = -1;
              *(_DWORD *)(v47 + 44) = -1;
              uint64_t v48 = *(void *)(v46 + 24);
              uint64_t v49 = *(unsigned int *)(v46 + 32);
              *(_DWORD *)(v46 + 32) = v49 + 1;
              *(_DWORD *)(v48 + 4 * v49) = v45;
            }
            ++v44;
          }
          while (v193 != v44);
          uint64_t v50 = 0;
          v51 = (unsigned __int8 *)(v11 + 16 * *v174 + 40);
          while (1)
          {
            uint64_t v52 = v174[v50];
            if (*(_DWORD *)(v196 + 4 * v52) > 1u) {
              break;
            }
            int v53 = nodeCmp(v51, (unsigned __int8 *)(v11 + 16 * v52 + 40));
            uint64_t v11 = v33;
            if (v53) {
              break;
            }
            if (v193 == ++v50)
            {
              int v42 = *v51;
              v174 = v12;
              goto LABEL_43;
            }
          }
          uint64_t v55 = *(void *)(v179 + 64);
          uint64_t v56 = *(unsigned int *)(v55 + 12);
          if (v56 >= *(_DWORD *)(v55 + 36))
          {
            uint64_t v97 = 0xFFFFFFFFLL;
            goto LABEL_198;
          }
          *(_DWORD *)(v55 + 12) = v56 + 1;
          *(_DWORD *)(*(void *)(v55 + 16) + 4 * v56) = 1;
          uint64_t v57 = v11 + 16 * v56;
          v58 = (unsigned char *)(v57 + 40);
          uint64_t v59 = v11;
          v60 = (_DWORD *)(*(uint64_t (**)(uint64_t, void))(v179 + 8))(4 * v193 + 8, *(void *)(v179 + 24));
          if (!v60)
          {
            unsigned char *v58 = 34;
            *(_DWORD *)(v57 + 44) = -1;
            goto LABEL_191;
          }
          unsigned char *v58 = 39;
          uint64_t v61 = v59 + 40 + 16 * v56;
          *(unsigned char *)(v61 + 1) = 33;
          *(_DWORD *)(v61 + 4) = -1;
          *(void *)(v61 + 8) = v60;
          char v175 = 1;
          _DWORD *v60 = 1;
          v60[1] = v193;
          memcpy(v60 + 2, v174, 4 * v193);
          *(_DWORD *)(v59 + 40 + 16 * *v12 + 4) = v56;
          uint64_t v2 = v179;
          uint64_t v11 = v59;
LABEL_37:
          uint64_t v13 = v181;
        }
      }
      ++v13;
    }
    while (v13 != v180);
  }
  while ((v175 & 1) != 0);
  simplifyBranches(v2, __src);
  uint64_t v62 = *(void *)(v2 + 64);
  uint64_t v63 = *(unsigned int *)(v62 + 12);
  memset(__src, 255, 4 * v63);
  if (v63)
  {
    uint64_t v64 = 0;
    uint64_t v65 = v62 + 40;
    do
    {
      if (*(unsigned char *)(v65 + 16 * v64) == 39)
      {
        uint64_t v66 = v65 + 16 * v64;
        *(_DWORD *)(v66 + 4) = -1;
        uint64_t v67 = v66 + 4;
        uint64_t v68 = *(void *)(v67 + 4);
        uint64_t v69 = *(unsigned int *)(v68 + 4);
        if (v69)
        {
          v70 = (unsigned int *)(v68 + 8);
          int v71 = -1;
          do
          {
            unsigned int v73 = *v70++;
            uint64_t v72 = v73;
            if ((*(unsigned __int8 *)(v65 + 16 * v73) | 4) == 0x34 && v64 == *(_DWORD *)(v65 + 16 * v72 + 4))
            {
              if (v71 != -1)
              {
                *(_DWORD *)uint64_t v67 = -1;
                break;
              }
              *(_DWORD *)uint64_t v67 = v72;
              int v71 = v72;
            }
            --v69;
          }
          while (v69);
        }
      }
      ++v64;
    }
    while (v64 != v63);
  }
  uint64_t v74 = *(void *)(v2 + 64);
  uint64_t v75 = *(unsigned int *)(v74 + 12);
  if (!v75) {
    goto LABEL_188;
  }
  uint64_t v76 = 0;
  unsigned int v77 = 0;
  uint64_t v78 = *(void *)(v74 + 16);
  uint64_t v188 = *(unsigned int *)(v74 + 12);
  do
  {
    uint64_t v79 = v74 + 16 * v76;
    int v81 = *(unsigned __int8 *)(v79 + 40);
    v80 = (unsigned __int8 *)(v79 + 40);
    if (v81 == 39)
    {
      uint64_t v82 = *(void *)(v74 + 16 * v76 + 48);
      memset(v198, 0, sizeof(v198));
      uint64_t v83 = *(unsigned int *)(v82 + 4);
      if (v83)
      {
        uint64_t v84 = 0;
        char v85 = 0;
        uint64_t v86 = v82 + 8;
        while (1)
        {
          uint64_t v87 = *(unsigned int *)(v86 + 4 * v84);
          int v88 = *(unsigned __int8 *)(v74 + 16 * v87 + 40);
          if (v88 == 16)
          {
            unint64_t v89 = *(unsigned __int8 *)(v74 + 16 * v87 + 48);
            unint64_t v90 = v89 >> 3;
            int v91 = *((unsigned __int8 *)v198 + (v89 >> 3));
            int v92 = 1 << (v89 & 7);
            if ((v92 & v91) != 0) {
              goto LABEL_92;
            }
            *((unsigned char *)v198 + v90) = v91 | v92;
          }
          else
          {
            if (v85)
            {
              char v85 = 1;
              goto LABEL_92;
            }
            BOOL v93 = v88 != 48 || *(_DWORD *)(v74 + 16 * v76 + 44) == -1;
            if (v93 || v76 != *(_DWORD *)(v74 + 16 * v87 + 44)) {
              goto LABEL_91;
            }
            char v85 = 1;
            unsigned int v77 = *(_DWORD *)(v86 + 4 * v84);
          }
          if (v83 == ++v84) {
            goto LABEL_93;
          }
        }
      }
      LODWORD(v84) = 0;
LABEL_91:
      char v85 = 0;
LABEL_92:
      if (v84 == v83)
      {
LABEL_93:
        unsigned int v94 = v83 - (v85 & 1);
        if (v94 - 16 < 0xFFFFFFF2) {
          goto LABEL_123;
        }
        unsigned int v194 = v77;
        if (v85)
        {
          if (v83)
          {
            uint64_t v95 = 0;
            while (1)
            {
              uint64_t v96 = *(unsigned int *)(v82 + 8 + 4 * v95);
              if (*(unsigned char *)(v74 + 16 * v96 + 40) == 16
                && !isStraightLineUntilDotStar(v74 + 40, v96, (uint64_t)__src))
              {
                break;
              }
              if (v83 == ++v95) {
                goto LABEL_105;
              }
            }
          }
          else
          {
            LODWORD(v95) = 0;
          }
          if (v95 != v83)
          {
            uint64_t v2 = v179;
            uint64_t v75 = v188;
            unsigned int v77 = v194;
            goto LABEL_123;
          }
LABEL_105:
          uint64_t v97 = 0xFFFFFFFFLL;
          uint64_t v2 = v179;
          unsigned int v77 = v194;
          nodeModRefCount(v179, v194, -1);
          uint64_t v98 = *(unsigned int *)(v74 + 12);
          if (v98 >= *(_DWORD *)(v74 + 36)) {
            goto LABEL_198;
          }
          *(_DWORD *)(v74 + 12) = v98 + 1;
          *(_DWORD *)(*(void *)(v74 + 16) + 4 * v98) = 1;
          unsigned __int8 *v80 = 56;
          *(_DWORD *)(v74 + 40 + 16 * v76 + 4) = v98;
          uint64_t v191 = v74 + 40 + 16 * v98;
          LODWORD(v83) = *(_DWORD *)(v82 + 4);
        }
        else
        {
          uint64_t v191 = (uint64_t)v80;
        }
        uint64_t v99 = 8 * v83 + 8;
        uint64_t v100 = *(void *)(v2 + 24);
        uint64_t v101 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v99, v100);
        if (!v101)
        {
          uint64_t v97 = 4294967292;
LABEL_197:
          uint64_t v2 = v179;
          goto LABEL_198;
        }
        v102 = (unsigned char *)v101;
        *(_DWORD *)uint64_t v101 = 1;
        *(_WORD *)(v101 + 4) = 255;
        *(unsigned char *)(v101 + 6) = v94;
        if (v94 > 0xFF)
        {
          uint64_t v97 = 0xFFFFFFFFLL;
          goto LABEL_197;
        }
        if (*(_DWORD *)(v82 + 4))
        {
          unint64_t v103 = 0;
          int v104 = 0;
          do
          {
            uint64_t v105 = *(unsigned int *)(v82 + 8 + 4 * v103);
            uint64_t v106 = v74 + 16 * v105;
            int v108 = *(unsigned __int8 *)(v106 + 40);
            v107 = (unsigned char *)(v106 + 40);
            if (v108 == 16)
            {
              unsigned int v109 = *(unsigned __int8 *)(v74 + 16 * v105 + 48);
              if (v109 < v102[4]) {
                v102[4] = v109;
              }
              if (v109 > v102[5]) {
                v102[5] = v109;
              }
              v110 = &v102[8 * v104];
              v110[8] = v109;
              uint64_t v111 = v74 + 16 * v105;
              int v113 = *(_DWORD *)(v111 + 44);
              v112 = (unsigned int *)(v111 + 44);
              *((_DWORD *)v110 + 3) = v113;
              ++v104;
              LODWORD(v110) = *(_DWORD *)(v78 + 4 * v105) - 1;
              *(_DWORD *)(v78 + 4 * v105) = v110;
              if (v110)
              {
                nodeModRefCount(v179, *v112, 1);
              }
              else
              {
                unsigned char *v107 = -1;
                unsigned int *v112 = -1;
                uint64_t v114 = *(void *)(v74 + 24);
                uint64_t v115 = *(unsigned int *)(v74 + 32);
                *(_DWORD *)(v74 + 32) = v115 + 1;
                *(_DWORD *)(v114 + 4 * v115) = v105;
              }
            }
            ++v103;
          }
          while (v103 < *(unsigned int *)(v82 + 4));
          size_t v116 = v102[6];
          unsigned int v77 = v194;
        }
        else
        {
          size_t v116 = v94;
        }
        qsort(v102 + 8, v116, 8uLL, (int (__cdecl *)(const void *, const void *))charAltEntryCmp);
        nodeModPtrRefs(v80, -1, *(uint64_t (**)(void, uint64_t))(v179 + 16), v100);
        uint64_t v75 = v188;
        *(unsigned char *)uint64_t v191 = 18;
        *(_DWORD *)(v191 + 4) = -1;
        *(void *)(v191 + 8) = v102;
        uint64_t v2 = v179;
      }
    }
LABEL_123:
    ++v76;
  }
  while (v76 != v75);
  uint64_t v117 = *(void *)(v2 + 64);
  uint64_t v197 = *(unsigned int *)(v117 + 12);
  if (!v197) {
    goto LABEL_188;
  }
  uint64_t v118 = 0;
  unsigned int v195 = 0;
  uint64_t v184 = *(void *)(v117 + 16);
  uint64_t v186 = *(void *)(v2 + 64);
  uint64_t v119 = v117 + 40;
  while (1)
  {
    uint64_t v120 = v119 + 16 * v118;
    if (*(unsigned char *)v120 != 39) {
      goto LABEL_165;
    }
    v122 = (unsigned int *)(v120 + 4);
    uint64_t v121 = *(unsigned int *)(v120 + 4);
    if (v121 == -1) {
      goto LABEL_165;
    }
    uint64_t v123 = v119 + 16 * v118;
    v126 = *(_DWORD **)(v123 + 8);
    v124 = (void *)(v123 + 8);
    v125 = v126;
    int v127 = *(unsigned __int8 *)(v119 + 16 * v121);
    if (v127 != 48) {
      break;
    }
    if (v125[1] == 2)
    {
      unsigned int v132 = v125[2];
      if (v132 == v121) {
        unsigned int v132 = v125[3];
      }
      int v133 = *(unsigned __int8 *)(v119 + 16 * v132);
      unsigned int v195 = v132;
      if ((v133 - 16) < 3 || v133 == 52)
      {
        if (isStraightLineUntilDotStar(v119, v132, (uint64_t)__src))
        {
          *(unsigned char *)uint64_t v120 = 56;
          unsigned int *v122 = v132;
          uint64_t v134 = v179;
          goto LABEL_164;
        }
      }
      else if (v133 == 34)
      {
        nodeModPtrRefs((unsigned __int8 *)(v119 + 16 * v118), -1, *(uint64_t (**)(void, uint64_t))(v179 + 16), *(void *)(v179 + 24));
        nodeModRefCount(v179, v121, -1);
        *(unsigned char *)uint64_t v120 = 49;
        unsigned int *v122 = v132;
      }
    }
LABEL_165:
    if (++v118 == v197)
    {
      uint64_t v147 = *(void *)(v179 + 64);
      uint64_t v148 = *(unsigned int *)(v147 + 12);
      if (v148)
      {
        uint64_t v149 = 0;
        uint64_t v150 = *(void *)(v147 + 16);
        do
        {
          uint64_t v151 = v147 + 16 * v149;
          int v153 = *(unsigned __int8 *)(v151 + 40);
          v152 = (unsigned char *)(v151 + 40);
          if (v153 == 16)
          {
            uint64_t v154 = v147 + 40 + 16 * v149;
            unsigned int v156 = *(_DWORD *)(v154 + 4);
            v155 = (_DWORD *)(v154 + 4);
            int v157 = *(unsigned char *)(v147 + 40 + 16 * v156) & 0xFE;
            if (v157 == 16)
            {
              unsigned int v158 = 0;
              int v159 = 0;
              v160 = v152;
              while (1)
              {
                if (v157 == 16 && v158 <= 0x3E)
                {
                  *((unsigned char *)__src + v158++) = v160[8];
                }
                else
                {
                  if (v157 != 17) {
                    goto LABEL_179;
                  }
                  memcpy((char *)__src + v158, (const void *)(*((void *)v160 + 1) + 8), *(unsigned int *)(*((void *)v160 + 1) + 4));
                  v158 += *(_DWORD *)(*((void *)v160 + 1) + 4);
                }
                uint64_t v161 = *((unsigned int *)v160 + 1);
                if (*(_DWORD *)(v150 + 4 * v161) > 1u) {
                  break;
                }
                uint64_t v162 = v147 + 16 * v161;
                int v163 = *(unsigned __int8 *)(v162 + 40);
                v160 = (unsigned char *)(v162 + 40);
                int v157 = v163;
                ++v159;
              }
              ++v159;
LABEL_179:
              if (v158 >= 4)
              {
                v164 = (_DWORD *)(*(uint64_t (**)(uint64_t, void))(v179 + 8))(v158 + 8, *(void *)(v179 + 24));
                if (!v164) {
                  goto LABEL_191;
                }
                v165 = v164;
                _DWORD *v164 = 1;
                v164[1] = v158;
                memcpy(v164 + 2, __src, v158);
                uint64_t v166 = *v155;
                int v167 = v159 - 1;
                if (v159 == 1)
                {
                  LODWORD(v170) = *v155;
                }
                else
                {
                  uint64_t v168 = *(void *)(v147 + 24);
                  do
                  {
                    *(_DWORD *)(v150 + 4 * v166) = 0;
                    uint64_t v169 = v147 + 16 * v166;
                    uint64_t v170 = *(unsigned int *)(v169 + 44);
                    *(unsigned char *)(v169 + 40) = -1;
                    *(_DWORD *)(v169 + 44) = -1;
                    uint64_t v171 = *(unsigned int *)(v147 + 32);
                    *(_DWORD *)(v147 + 32) = v171 + 1;
                    *(_DWORD *)(v168 + 4 * v171) = v166;
                    uint64_t v166 = v170;
                    --v167;
                  }
                  while (v167);
                }
                unsigned char *v152 = 17;
                *(void *)(v147 + 16 * v149 + 48) = v165;
                _DWORD *v155 = v170;
              }
            }
          }
          ++v149;
        }
        while (v149 != v148);
      }
LABEL_188:
      uint64_t v2 = v179;
      uint64_t v97 = splitAltNodes(v179);
LABEL_198:
      uint64_t v140 = v173;
      goto LABEL_193;
    }
  }
  if (v127 != 52) {
    goto LABEL_165;
  }
  v189 = v125;
  v192 = v124;
  uint64_t v128 = v125[1];
  if (!v128)
  {
    LODWORD(v129) = 0;
    goto LABEL_152;
  }
  uint64_t v129 = 0;
  v130 = v125 + 2;
  while (2)
  {
    uint64_t v131 = v130[v129];
    if (v131 == v121)
    {
LABEL_139:
      if (v128 == ++v129) {
        goto LABEL_153;
      }
      continue;
    }
    break;
  }
  if (!nodesMightOverlap((unsigned __int8 *)(v119 + 16 * v121), (unsigned __int8 *)(v119 + 16 * v131)))
  {
    unsigned int v195 = v131;
    goto LABEL_139;
  }
  unsigned int v195 = v131;
LABEL_152:
  if (v129 != v128) {
    goto LABEL_165;
  }
LABEL_153:
  if (v128 == 2)
  {
    v135 = v192;
    unsigned int *v122 = v195;
    uint64_t v136 = v179;
    uint64_t v137 = *(void *)(v179 + 24);
    goto LABEL_163;
  }
  uint64_t v137 = *(void *)(v179 + 24);
  uint64_t v138 = (*(uint64_t (**)(uint64_t, uint64_t))(v179 + 8))(4 * (v128 - 1) + 8, v137);
  if (!v138)
  {
LABEL_191:
    uint64_t v97 = 4294967292;
    uint64_t v140 = v173;
    goto LABEL_192;
  }
  uint64_t v139 = *(unsigned int *)(v186 + 12);
  uint64_t v140 = v173;
  if (v139 < *(_DWORD *)(v186 + 36))
  {
    *(_DWORD *)(v186 + 12) = v139 + 1;
    *(_DWORD *)(*(void *)(v186 + 16) + 4 * v139) = 1;
    uint64_t v141 = v119 + 16 * v139;
    *(unsigned char *)uint64_t v141 = 39;
    *(_DWORD *)(v141 + 4) = -1;
    *(void *)(v141 + 8) = v138;
    *(void *)uint64_t v138 = 1;
    v135 = v192;
    unint64_t v142 = v189[1];
    if (v142)
    {
      unsigned int v143 = 0;
      for (unint64_t j = 0; j < v142; ++j)
      {
        int v145 = v189[j + 2];
        if (v145 != v121)
        {
          uint64_t v146 = v138 + 4 * v143++;
          *(_DWORD *)(v138 + 4) = v143;
          *(_DWORD *)(v146 + 8) = v145;
          unint64_t v142 = v189[1];
        }
      }
    }
    unsigned int *v122 = v139;
    *(_DWORD *)(v184 + 4 * v139) = 1;
    uint64_t v136 = v179;
LABEL_163:
    nodeModPtrRefs((unsigned __int8 *)(v119 + 16 * v118), -1, *(uint64_t (**)(void, uint64_t))(v136 + 16), v137);
    *(unsigned char *)uint64_t v120 = 54;
    void *v135 = *(void *)(v119 + 16 * v121 + 8);
    nodeModPtrRefs((unsigned __int8 *)(v119 + 16 * v118), 1, 0, 0);
    uint64_t v134 = v136;
LABEL_164:
    nodeModRefCount(v134, v121, -1);
    goto LABEL_165;
  }
  uint64_t v97 = 0xFFFFFFFFLL;
LABEL_192:
  uint64_t v2 = v179;
LABEL_193:
  (*(void (**)(int *, void))(v2 + 16))(__src, *(void *)(v2 + 24));
  *(void *)uint64_t v140 = 0;
  *(void *)(v140 + 8) = 0;
  *(_DWORD *)(v140 + 16) = 0;
  return v97;
}

uint64_t simplifyBranches(uint64_t result, int *a2)
{
  uint64_t v2 = *(void *)(result + 64);
  int v3 = *(_DWORD *)(v2 + 12);
  if (v3)
  {
    uint64_t v5 = result;
    unsigned int v6 = v3 - 1;
    uint64_t v7 = 16 * (v3 - 1);
    uint64_t v8 = 40;
    do
    {
      uint64_t v9 = v2 + v7;
      int v10 = *(unsigned __int8 *)(v2 + v7 + 40);
      if ((v10 - 38) >= 2)
      {
        if (v10 == 49)
        {
LABEL_7:
          unsigned int v18 = 0;
          recurseThroughBranches(v5, a2, &v18, v6, 1);
          uint64_t v11 = v18;
          if (v18 == 1)
          {
            uint64_t v12 = *a2;
            uint64_t v13 = *(void *)(v5 + 64);
            uint64_t v14 = (unsigned __int8 *)(v13 + v7 + v8);
            *(_OWORD *)uint64_t v14 = *(_OWORD *)(v13 + 16 * v12 + 40);
            nodeModPtrRefs(v14, 1, 0, 0);
            nodeModRefs(v5, v6, 1);
            uint64_t result = nodeModRefCount(v5, v12, -1);
          }
          else
          {
            *(unsigned char *)(v9 + 40) = 39;
            uint64_t v15 = v2 + v7;
            *(unsigned char *)(v15 + 41) = 126;
            *(_DWORD *)(v15 + 44) = -1;
            int v16 = (_DWORD *)(*(uint64_t (**)(uint64_t, void))(v5 + 8))(4 * v11 + 8, *(void *)(v5 + 24));
            *int v16 = 1;
            uint64_t v17 = v18;
            v16[1] = v18;
            uint64_t result = (uint64_t)memcpy(v16 + 2, a2, 4 * v17);
            *(void *)(v15 + 48) = v16;
          }
        }
      }
      else if (*(unsigned char *)(v9 + 41) != 126)
      {
        goto LABEL_7;
      }
      v2 -= 16;
      --v6;
      v8 -= 16;
    }
    while (v6 != -1);
  }
  return result;
}

uint64_t splitAltNodes(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  unint64_t v2 = *(unsigned int *)(v1 + 12);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = v1 + 16 * v4;
    unsigned int v23 = (unsigned __int8 *)(v5 + 40);
    if (*(unsigned char *)(v5 + 40) == 39)
    {
      uint64_t v8 = *(void *)(v5 + 48);
      unsigned int v6 = (uint64_t *)(v5 + 48);
      uint64_t v7 = v8;
      uint64_t v9 = (_DWORD *)(v8 + 4);
      if (*(_DWORD *)(v8 + 4) >= 0x10u) {
        break;
      }
    }
LABEL_11:
    if (++v4 >= v2) {
      return 0;
    }
  }
  uint64_t v22 = v4;
  while (1)
  {
    uint64_t v10 = *(unsigned int *)(v1 + 12);
    if (v10 >= *(_DWORD *)(v1 + 36)) {
      return 0xFFFFFFFFLL;
    }
    *(_DWORD *)(v1 + 12) = v10 + 1;
    *(_DWORD *)(*(void *)(v1 + 16) + 4 * v10) = 1;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8);
    uint64_t v12 = *(void *)(a1 + 24);
    uint64_t v13 = v11(68, v12);
    if (!v13) {
      return 4294967292;
    }
    uint64_t v14 = v13;
    uint64_t v15 = (_DWORD *)v11(4 * (*v9 - 14) + 8, v12);
    if (!v15)
    {
      (*(void (**)(uint64_t, uint64_t))(a1 + 16))(v14, v12);
      return 4294967292;
    }
    int v16 = v15;
    *(void *)uint64_t v14 = 0xF00000001;
    long long v17 = *(_OWORD *)(v7 + 8);
    long long v18 = *(_OWORD *)(v7 + 24);
    long long v19 = *(_OWORD *)(v7 + 40);
    *(void *)(v14 + 56) = *(void *)(v7 + 56);
    *(_OWORD *)(v14 + 40) = v19;
    *(_OWORD *)(v14 + 24) = v18;
    *(_OWORD *)(v14 + 8) = v17;
    *(_DWORD *)(v14 + 64) = v10;
    int v20 = *v9 - 14;
    *uint64_t v15 = 1;
    v15[1] = v20;
    memcpy(v15 + 2, (const void *)(v7 + 64), 4 * (*v9 - 14));
    *(unsigned char *)(v1 + 16 * v10 + 40) = 39;
    *(void *)(v1 + 16 * v10 + 48) = v16;
    nodeModPtrRefs(v23, -1, *(uint64_t (**)(void, uint64_t))(a1 + 16), v12);
    uint64_t *v6 = v14;
    uint64_t v9 = (_DWORD *)(v14 + 4);
    uint64_t v7 = v14;
    if (*(_DWORD *)(v14 + 4) <= 0xFu)
    {
      unint64_t v2 = *(unsigned int *)(v1 + 12);
      uint64_t v4 = v22;
      goto LABEL_11;
    }
  }
}

uint64_t nodeModRefs(uint64_t result, unsigned int a2, int a3)
{
  uint64_t v4 = result;
  uint64_t v5 = *(void *)(result + 64);
  uint64_t v6 = a2;
  uint64_t v7 = v5 + 16 * a2;
  unsigned int v10 = *(unsigned __int8 *)(v7 + 40);
  uint64_t v9 = (unsigned __int8 *)(v7 + 40);
  unsigned int v8 = v10;
  uint64_t v11 = (1 << v10) & 0x8400040000;
  BOOL v12 = v10 > 0x27 || v11 == 0;
  if (v12 && v8 != 255)
  {
    uint64_t result = nodeModRefCount(result, *(_DWORD *)(v5 + 16 * a2 + 44), a3);
    unsigned int v8 = *v9;
  }
  switch(v8)
  {
    case 0x12u:
      uint64_t v14 = *(void *)(v5 + 16 * v6 + 48);
      if (*(unsigned char *)(v14 + 6))
      {
        unint64_t v15 = 0;
        int v16 = (unsigned int *)(v14 + 12);
        do
        {
          unsigned int v17 = *v16;
          v16 += 2;
          uint64_t result = nodeModRefCount(v4, v17, a3);
          ++v15;
        }
        while (v15 < *(unsigned __int8 *)(v14 + 6));
      }
      break;
    case 0x27u:
      uint64_t v18 = *(void *)(v5 + 16 * v6 + 48);
      if (*(_DWORD *)(v18 + 4))
      {
        unint64_t v19 = 0;
        do
          uint64_t result = nodeModRefCount(v4, *(_DWORD *)(v18 + 8 + 4 * v19++), a3);
        while (v19 < *(unsigned int *)(v18 + 4));
      }
      break;
    case 0x26u:
      unsigned int v13 = *(_DWORD *)(v5 + 16 * v6 + 48);
      return nodeModRefCount(v4, v13, a3);
  }
  return result;
}

uint64_t nodeModRefCount(uint64_t result, unsigned int a2, int a3)
{
  uint64_t v3 = *(void *)(result + 64);
  uint64_t v4 = *(void *)(v3 + 16);
  int v5 = *(_DWORD *)(v4 + 4 * a2) + a3;
  *(_DWORD *)(v4 + 4 * a2) = v5;
  if (!v5)
  {
    uint64_t v7 = a2;
    uint64_t result = nodeModRefs();
    uint64_t v8 = v3 + 16 * v7;
    *(unsigned char *)(v8 + 40) = -1;
    *(_DWORD *)(v8 + 44) = -1;
    uint64_t v9 = *(void *)(v3 + 24);
    uint64_t v10 = *(unsigned int *)(v3 + 32);
    *(_DWORD *)(v3 + 32) = v10 + 1;
    *(_DWORD *)(v9 + 4 * v10) = a2;
  }
  return result;
}

uint64_t recurseThroughBranches(uint64_t result, int *a2, _DWORD *a3, unsigned int a4, int a5)
{
  uint64_t v8 = *(void *)(result + 64);
  if (*(_DWORD *)(*(void *)(v8 + 16) + 4 * a4) >= 2u && a5 == 0) {
    goto LABEL_12;
  }
  char v10 = a5;
  uint64_t v11 = result;
  uint64_t v12 = v8 + 16 * a4;
  int v13 = *(unsigned __int8 *)(v12 + 40);
  switch(v13)
  {
    case '&':
      recurseThroughBranches(result, a2, a3, *(unsigned int *)(v12 + 44), 0);
      uint64_t v24 = (unsigned int *)(v12 + 48);
LABEL_21:
      uint64_t result = recurseThroughBranches(v11, a2, a3, *v24, 0);
LABEL_22:
      if (v10) {
        return result;
      }
      --*(_DWORD *)(*(void *)(v8 + 16) + 4 * a4);
      uint64_t v25 = *(void *)(v11 + 64);
      uint64_t v26 = v25 + 16 * a4;
      *(unsigned char *)(v26 + 40) = -1;
      *(_DWORD *)(v26 + 44) = -1;
      uint64_t v27 = *(void *)(v25 + 24);
      uint64_t v28 = *(unsigned int *)(v25 + 32);
      *(_DWORD *)(v25 + 32) = v28 + 1;
      unsigned int v23 = (unsigned int *)(v27 + 4 * v28);
      goto LABEL_24;
    case '1':
      uint64_t v24 = (unsigned int *)(v8 + 16 * a4 + 44);
      goto LABEL_21;
    case '\'':
      uint64_t v14 = v8 + 16 * a4;
      uint64_t v17 = *(void *)(v14 + 48);
      int v16 = (uint64_t *)(v14 + 48);
      uint64_t v15 = v17;
      if (*(_DWORD *)(v17 + 4))
      {
        unint64_t v18 = 0;
        do
        {
          uint64_t result = recurseThroughBranches(v11, a2, a3, *(unsigned int *)(v15 + 4 * v18++ + 8), 0);
          uint64_t v15 = *v16;
        }
        while (v18 < *(unsigned int *)(*v16 + 4));
      }
      goto LABEL_22;
  }
LABEL_12:
  if (!*a3)
  {
    uint64_t v22 = 0;
LABEL_18:
    ++*a3;
    unsigned int v23 = (unsigned int *)&a2[v22];
LABEL_24:
    *unsigned int v23 = a4;
    return result;
  }
  uint64_t v19 = *a3;
  int v20 = a2;
  while (1)
  {
    int v21 = *v20++;
    if (v21 == a4) {
      return result;
    }
    if (!--v19)
    {
      uint64_t v22 = *a3;
      goto LABEL_18;
    }
  }
}

uint64_t nodeCmp(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 == a2) {
    return 0;
  }
  int v3 = *a1;
  int v4 = *a2;
  uint64_t result = (v3 - v4);
  if (v3 == v4)
  {
    int v6 = a1[1];
    int v7 = a2[1];
    uint64_t result = (v6 - v7);
    if (v6 == v7)
    {
      uint64_t result = 0;
      switch(v3)
      {
        case ' ':
        case '!':
        case '0':
        case '1':
        case '2':
        case '3':
          return result;
        case '""':
        case '#':
        case '$':
          int v8 = *((_DWORD *)a1 + 2);
          int v9 = *((_DWORD *)a2 + 2);
          goto LABEL_8;
        case '%':
        case '&':
        case '\'':
        case '(':
        case ')':
        case '*':
        case '+':
        case ',':
        case '-':
        case '.':
        case '/':
          goto LABEL_11;
        case '4':
          uint64_t v10 = *((void *)a1 + 1);
          uint64_t v11 = *((void *)a2 + 1);
          size_t v12 = *(unsigned int *)(v10 + 4);
          int v13 = *(_DWORD *)(v11 + 4);
          uint64_t result = (v12 - v13);
          if (v12 == v13) {
            return memcmp((const void *)(v10 + 8), (const void *)(v11 + 8), v12);
          }
          return result;
        default:
          if (v3 == 16)
          {
            int v8 = a1[8];
            int v9 = a2[8];
LABEL_8:
            uint64_t result = (v8 - v9);
          }
          else
          {
LABEL_11:
            uint64_t result = 1;
          }
          break;
      }
    }
  }
  return result;
}

BOOL nodesMightOverlap(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  if (v2 != 52)
  {
    if (v2 == 16)
    {
      int v3 = *a2;
      if (v3 != 52)
      {
        if (v3 == 16) {
          return a1[8] == a2[8];
        }
        return 1;
      }
      uint64_t v13 = *((void *)a2 + 1);
      unsigned int v14 = *(_DWORD *)(v13 + 4);
      if (v14)
      {
        int v15 = a1[8];
        unsigned int v16 = 2;
        uint64_t v17 = v13 + 8;
        do
        {
          int v18 = *(unsigned __int8 *)(v17 + v16 - 2);
          unsigned __int8 v19 = *(unsigned char *)(v17 + v16 - 1) - v18;
          int v20 = v15 - v18;
          BOOL result = v20 <= v19;
          if (v16 >= v14) {
            break;
          }
          v16 += 2;
        }
        while (v20 > v19);
        return result;
      }
      return 0;
    }
    return 1;
  }
  int v5 = *a2;
  if (v5 == 52)
  {
    uint64_t v21 = *((void *)a1 + 1);
    unsigned int v22 = *(_DWORD *)(v21 + 4);
    if (!v22) {
      return 0;
    }
    unsigned int v23 = 0;
    uint64_t v24 = *((void *)a2 + 1);
    uint64_t v25 = v21 + 8;
    while (1)
    {
      char v26 = *(unsigned char *)(v25 + v23);
      uint64_t v27 = v23 | 1;
      char v28 = *(unsigned char *)(v24 + v23 + 8);
      if ((v28 - v26) <= (*(unsigned char *)(v25 + v27) - v26)
        || (v26 - v28) <= (*(unsigned char *)(v24 + v27 + 8) - v28))
      {
        break;
      }
      for (unsigned int i = 0; i < v22; i += 2)
        ;
      BOOL result = 0;
      v23 += 2;
      if (v23 >= v22) {
        return result;
      }
    }
    return 1;
  }
  if (v5 != 16) {
    return 1;
  }
  uint64_t v6 = *((void *)a1 + 1);
  unsigned int v7 = *(_DWORD *)(v6 + 4);
  if (!v7) {
    return 0;
  }
  unsigned int v8 = 2;
  uint64_t v9 = v6 + 8;
  do
  {
    int v10 = *(unsigned __int8 *)(v9 + v8 - 2);
    unsigned __int8 v11 = *(unsigned char *)(v9 + v8 - 1) - v10;
    int v12 = a2[8] - v10;
    BOOL result = v12 <= v11;
    if (v8 >= v7) {
      break;
    }
    v8 += 2;
  }
  while (v12 > v11);
  return result;
}

uint64_t isStraightLineUntilDotStar(uint64_t a1, unsigned int a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a3 + 4 * a2);
  if (v3 == -2) {
    return 1;
  }
  if (v3 != -1) {
    return 0;
  }
  uint64_t v6 = a2;
  *(_DWORD *)(a3 + 4 * a2) = a2;
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a1 + 16 * v6);
    if (v7 == 18) {
      break;
    }
    if (v7 == 34) {
      goto LABEL_18;
    }
    if (v7 == 39)
    {
      uint64_t v14 = *(unsigned int *)(a1 + 16 * v6 + 4);
      if (v14 != -1 && *(unsigned char *)(a1 + 16 * v14) == 48 && *(_DWORD *)(*(void *)(a1 + 16 * v6 + 8) + 4) == 2) {
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    uint64_t v8 = *(unsigned int *)(a1 + 16 * v6 + 4);
    *(_DWORD *)(a3 + 4 * v8) = v6;
    uint64_t v6 = v8;
  }
  uint64_t v10 = *(void *)(a1 + 16 * v6 + 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 6);
  if (!*(unsigned char *)(v10 + 6))
  {
LABEL_18:
    int v15 = -2;
    uint64_t result = 1;
    goto LABEL_20;
  }
  int v12 = (unsigned int *)(v10 + 12);
  while (1)
  {
    unsigned int v13 = *v12;
    v12 += 2;
    if ((isStraightLineUntilDotStar(a1, v13, a3) & 1) == 0) {
      break;
    }
    if (!--v11) {
      goto LABEL_18;
    }
  }
LABEL_19:
  uint64_t result = 0;
  int v15 = -3;
  do
  {
LABEL_20:
    uint64_t v16 = *(unsigned int *)(a3 + 4 * v6);
    *(_DWORD *)(a3 + 4 * v6) = v15;
    BOOL v17 = v16 == v6;
    uint64_t v6 = v16;
  }
  while (!v17);
  return result;
}

uint64_t charAltEntryCmp(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 - *a2;
}

uint64_t matchValidate()
{
  return 0xFFFFFFFFLL;
}

uint64_t matchUnpack(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a3 + 32))
  {
    uint64_t v8 = *(void *)(a3 + 56);
    if (v8)
    {
      (*(void (**)(uint64_t, void))(a3 + 16))(v8, *(void *)(a3 + 24));
      *(void *)(a3 + 56) = 0;
    }
    uint64_t v9 = *(void (**)(void, void))(a3 + 48);
    if (v9) {
      v9(*(void *)(a3 + 32), *(void *)(a3 + 24));
    }
    *(void *)(a3 + 32) = 0;
    *(void *)(a3 + 48) = 0;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 >= 6 && *(_DWORD *)a1 == 50331648)
  {
    size_t v11 = *(unsigned __int16 *)(a1 + 4);
    unint64_t v12 = a2 - (v11 + 6);
    if (a2 >= v11 + 6 && !HIDWORD(v12) && *(_WORD *)(a1 + 4))
    {
      uint64_t v14 = *(void (**)(unsigned char *, uint64_t))(a3 + 16);
      uint64_t v13 = *(void *)(a3 + 24);
      int v15 = (unsigned char *)(*(uint64_t (**)(void, uint64_t))(a3 + 8))(*(unsigned __int16 *)(a1 + 4), v13);
      if (v15)
      {
        uint64_t v16 = v15;
        v38 = v14;
        uint64_t v17 = a1 + 6;
        bzero(v15, v11);
        unsigned __int16 v18 = 0;
        while (2)
        {
          v16[v18] = 1;
          unsigned int v19 = *(unsigned __int8 *)(v17 + v18);
          LOWORD(v20) = 2;
          switch(v19 & 0xF)
          {
            case 0u:
            case 4u:
            case 8u:
            case 0xAu:
            case 0xCu:
              LOWORD(v20) = 3;
              goto LABEL_20;
            case 2u:
            case 5u:
            case 6u:
            case 7u:
              goto LABEL_20;
            case 3u:
              int v20 = 3 * (v19 >> 4) + 1;
              goto LABEL_20;
            case 9u:
              LOWORD(v20) = 1;
              goto LABEL_20;
            case 0xBu:
            case 0xDu:
              int v20 = (v19 >> 3) | 1;
              goto LABEL_20;
            case 0xFu:
              int v20 = ((v19 >> 3) & 0x1E) - 1;
LABEL_20:
              v18 += v20;
              if (v11 > v18) {
                continue;
              }
              if (v11 != v18) {
                goto LABEL_56;
              }
              int v21 = 0;
              unsigned __int16 v22 = 0;
              break;
            default:
              goto LABEL_56;
          }
          break;
        }
        while (2)
        {
          unsigned int v23 = (unsigned __int8 *)(v17 + v22);
          unint64_t v24 = *v23;
          unsigned int v25 = 2;
          switch(v24 & 0xF)
          {
            case 0uLL:
            case 4uLL:
            case 8uLL:
            case 0xAuLL:
            case 0xCuLL:
              unsigned int v25 = 3;
              goto LABEL_29;
            case 2uLL:
            case 5uLL:
            case 6uLL:
            case 7uLL:
              goto LABEL_29;
            case 3uLL:
              unsigned int v25 = 3 * (v24 >> 4) + 1;
              goto LABEL_29;
            case 9uLL:
              unsigned int v25 = 1;
              goto LABEL_29;
            case 0xBuLL:
            case 0xDuLL:
              unsigned int v25 = (v24 >> 3) | 1;
              goto LABEL_29;
            case 0xFuLL:
              unsigned int v25 = ((v24 >> 3) & 0x1E) - 1;
LABEL_29:
              if (v25 > (int)v11 - v21) {
                goto LABEL_56;
              }
              break;
            default:
              goto LABEL_56;
          }
          switch(v24 & 0xF)
          {
            case 0uLL:
            case 4uLL:
            case 8uLL:
            case 0xCuLL:
              if (*(unsigned __int16 *)(v23 + 1) + (v24 >> 2) > v12) {
                goto LABEL_56;
              }
              goto LABEL_52;
            case 2uLL:
            case 6uLL:
            case 7uLL:
              goto LABEL_52;
            case 3uLL:
              if (v24 < 0x20) {
                goto LABEL_56;
              }
              unint64_t v27 = v24 >> 4;
              char v28 = (unsigned __int16 *)(v23 + 1);
              while (1)
              {
                unsigned int v30 = *v28;
                char v28 = (unsigned __int16 *)((char *)v28 + 3);
                uint64_t v29 = v30;
                if (v30 >= v11 || !v16[v29]) {
                  goto LABEL_56;
                }
                if (!--v27) {
                  goto LABEL_53;
                }
              }
            case 5uLL:
              goto LABEL_53;
            case 9uLL:
              unsigned int v31 = (v24 >> 4) & 7;
              if (v31 < 4) {
                goto LABEL_52;
              }
              if (v31 != 4) {
                goto LABEL_56;
              }
              goto LABEL_53;
            case 0xAuLL:
              uint64_t v26 = *(unsigned __int16 *)(v23 + 1);
              if (v26 >= v11 || !v16[v26]) {
                goto LABEL_56;
              }
              goto LABEL_53;
            case 0xBuLL:
            case 0xDuLL:
              if (v24 < 0x10) {
                goto LABEL_56;
              }
              goto LABEL_52;
            case 0xFuLL:
              if (v24 < 0x20) {
                goto LABEL_52;
              }
              uint64_t v32 = (unsigned __int16 *)(v23 + 1);
              uint64_t v33 = (v24 >> 4) - 1;
              break;
            default:
              goto LABEL_56;
          }
          do
          {
            unsigned int v35 = *v32++;
            uint64_t v34 = v35;
            if (v35 >= v11 || !v16[v34]) {
              goto LABEL_56;
            }
            --v33;
          }
          while (v33);
LABEL_52:
          if (v25 + v21 == v11)
          {
LABEL_56:
            v38(v16, v13);
            return 0xFFFFFFFFLL;
          }
LABEL_53:
          v22 += v25;
          int v21 = v22;
          if (v22 < v11) {
            continue;
          }
          break;
        }
        v38(v16, v13);
        uint64_t v36 = (*(uint64_t (**)(uint64_t, void))(a3 + 8))(24, *(void *)(a3 + 24));
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t result = 0;
          *(_WORD *)(v37 + 16) = v11;
          *(void *)uint64_t v37 = v17;
          *(void *)(v37 + 8) = a1 + v11 + 6;
          *(void *)(a3 + 32) = a1;
          *(void *)(a3 + 40) = a2;
          *(void *)(a3 + 48) = a4;
          *(void *)(a3 + 56) = v37;
          return result;
        }
      }
      return 4294967292;
    }
  }
  return result;
}

uint64_t matchPack(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(a1 + 56))
  {
LABEL_2:
    if (a2) {
      *a2 = *(void *)(a1 + 32);
    }
    uint64_t v6 = 0;
    if (a3) {
      *a3 = *(void *)(a1 + 40);
    }
    return v6;
  }
  uint64_t v7 = *(void *)(a1 + 64);
  if (!v7) {
    return 4294967293;
  }
  uint64_t v8 = (unsigned __int16)*(_DWORD *)(v7 + 12);
  if (HIWORD(*(_DWORD *)(v7 + 12))) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (v9) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = (_WORD *)(*(uint64_t (**)(uint64_t, void))(a1 + 8))(8 * v8, *(void *)(a1 + 24));
  if (!v10) {
    return 4294967292;
  }
  unint64_t v90 = v10;
  memset(v10, 255, 4 * v8);
  uint64_t v11 = 0;
  int v12 = 0;
  uint64_t v13 = (char *)&v90[v8];
  uint64_t v14 = &v13[2 * v8];
  *(_DWORD *)uint64_t v14 = *(_DWORD *)(v7 + 8);
  uint64_t v15 = (uint64_t)&v90[2 * v8 - 2];
  unsigned int v16 = 1;
LABEL_16:
  uint64_t v17 = 4 * v16;
  while (v17)
  {
    unint64_t v18 = *(unsigned int *)(v15 + v17);
    if (WORD1(v18)) {
      return 0xFFFFFFFFLL;
    }
    --v16;
    v17 -= 4;
    if (*(__int16 *)&v13[2 * v18] == -1)
    {
      uint64_t v19 = v8;
      while (1)
      {
        unint64_t v20 = 0;
        int v21 = *(unsigned __int8 *)(v7 + 16 * v18 + 40);
        uint64_t v6 = 0xFFFFFFFFLL;
        if (v21 <= 0x21)
        {
          if (v21 == 16)
          {
            int v25 = 2;
          }
          else
          {
            if (v21 != 17)
            {
              uint64_t v23 = 0;
              unint64_t v24 = 0;
              if (v21 != 18) {
                goto LABEL_68;
              }
              int v35 = 3 * *(unsigned __int8 *)(*(void *)(v7 + 16 * v18 + 48) + 6);
              *(_WORD *)&v13[2 * v18] = v12;
              v12 += v35 + 1;
              uint64_t v8 = v19;
              uint64_t v36 = *(void *)(v7 + 16 * v18 + 48);
              uint64_t v37 = *(unsigned __int8 *)(v36 + 6);
              if (*(unsigned char *)(v36 + 6))
              {
                v38 = (int *)(v36 + 12);
                do
                {
                  int v40 = *v38;
                  v38 += 2;
                  int v39 = v40;
                  if (*(__int16 *)&v13[2 * v40] == -1) {
                    *(_DWORD *)&v14[4 * v16++] = v39;
                  }
                  --v37;
                }
                while (v37);
              }
              goto LABEL_16;
            }
            v11 += *(unsigned int *)(*(void *)(v7 + 16 * v18 + 48) + 4);
            int v25 = 3;
          }
          *(_WORD *)&v13[2 * v18] = v12;
          v12 += v25;
LABEL_50:
          unint64_t v27 = *(unsigned int *)(v7 + 16 * v18 + 44);
        }
        else
        {
          int v22 = 0;
          uint64_t v23 = 0;
          unint64_t v24 = 0;
          switch(*(unsigned char *)(v7 + 16 * v18 + 40))
          {
            case '""':
            case '#':
            case '$':
              int v22 = 2;
              goto LABEL_30;
            case '%':
            case '(':
            case ')':
            case '*':
            case '+':
            case ',':
            case '-':
            case '.':
            case '/':
            case '5':
            case '7':
              goto LABEL_68;
            case '&':
              *(_WORD *)&v13[2 * v18] = v12;
              v12 += 3;
              goto LABEL_38;
            case '\'':
              int v29 = *(_DWORD *)(*(void *)(v7 + 16 * v18 + 48) + 4);
              if (!v29)
              {
                unint64_t v20 = 0;
                uint64_t v23 = 0;
                unint64_t v24 = 0;
LABEL_142:
                uint64_t v6 = 0xFFFFFFFFLL;
                goto LABEL_68;
              }
              *(_WORD *)&v13[2 * v18] = v12;
              int v12 = v12 + 2 * v29 - 1;
LABEL_42:
              uint64_t v30 = *(void *)(v7 + 16 * v18 + 48);
              unsigned int v31 = *(_DWORD *)(v30 + 4);
              unint64_t v27 = *(unsigned int *)(v30 + 8);
              if (v31 >= 2)
              {
                for (unsigned __int16 i = 1; i < v31; ++i)
                {
                  uint64_t v33 = *(unsigned int *)(v30 + 4 * i + 8);
                  if (*(__int16 *)&v13[2 * v33] == -1)
                  {
                    *(_DWORD *)&v14[4 * v16++] = v33;
                    unsigned int v31 = *(_DWORD *)(v30 + 4);
                  }
                }
              }
              break;
            case '0':
            case '2':
            case '3':
            case '8':
              int v22 = 1;
              goto LABEL_30;
            case '1':
              goto LABEL_30;
            case '4':
            case '6':
              int v22 = *(_DWORD *)(*(void *)(v7 + 16 * v18 + 48) + 4) + 1;
              goto LABEL_30;
            default:
              if (v21 != 255) {
                goto LABEL_68;
              }
LABEL_30:
              *(_WORD *)&v13[2 * v18] = v12;
              v12 += v22;
              if (v21 > 38)
              {
                if (v21 == 39) {
                  goto LABEL_42;
                }
                if (v21 == 255) {
                  goto LABEL_55;
                }
              }
              else
              {
                if (v21 == 38)
                {
LABEL_38:
                  uint64_t v26 = v7 + 16 * v18;
                  unint64_t v27 = *(unsigned int *)(v26 + 44);
                  uint64_t v28 = *(unsigned int *)(v26 + 48);
                  if (*(__int16 *)&v13[2 * v28] == -1) {
                    *(_DWORD *)&v14[4 * v16++] = v28;
                  }
                  break;
                }
                if (v21 == 34) {
                  goto LABEL_55;
                }
              }
              goto LABEL_50;
          }
        }
        int v34 = *(unsigned __int16 *)&v13[2 * v27];
        if (v34 != 0xFFFF)
        {
          v90[v18] = v34;
          v12 += 3;
LABEL_55:
          uint64_t v8 = v19;
          goto LABEL_16;
        }
        uint64_t v6 = 0xFFFFFFFFLL;
        unint64_t v18 = v27;
        if (v27 >> 16) {
          return v6;
        }
      }
    }
  }
  uint64_t v41 = v11 + (unsigned __int16)v12 + 6;
  unint64_t v42 = v11;
  uint64_t v23 = (*(uint64_t (**)(uint64_t, void))(a1 + 8))(v41, *(void *)(a1 + 24));
  if (!v23 || v42 > 0x10000)
  {
    unint64_t v20 = 0;
    unint64_t v24 = 0;
    goto LABEL_67;
  }
  uint64_t v84 = v41;
  uint64_t v85 = (unsigned __int16)v12;
  unint64_t v24 = (char *)(*(uint64_t (**)(unint64_t, void))(a1 + 8))(v42, *(void *)(a1 + 24));
  uint64_t v45 = 0;
  size_t v46 = 0;
  *(_DWORD *)uint64_t v23 = 50331648;
  *(_WORD *)(v23 + 4) = v12;
  uint64_t v47 = v23 + 6;
  uint64_t v48 = (unsigned __int8 *)(v7 + 40);
  uint64_t v49 = (char *)(v23 + 65541);
  __int16 v86 = v12;
  uint64_t v87 = v8;
  uint64_t v19 = 0xFFFFLL;
  uint64_t v11 = 10;
  uint64_t v50 = v90;
  uint64_t v89 = v23 + 6;
  while (1)
  {
    uint64_t v51 = *(unsigned __int16 *)&v13[2 * v45];
    int v52 = *v48;
    if (v51 != 0xFFFF) {
      break;
    }
    int v53 = v49;
    if (v52 == 255) {
      goto LABEL_133;
    }
LABEL_135:
    ++v45;
    v48 += 16;
    if (v45 == v8)
    {
      size_t v80 = v46;
      uint64_t v81 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(a1 + 8))(24, *(void *)(a1 + 24), 0xFFFFLL, 10);
      unint64_t v20 = v81;
      if (v81)
      {
        *(_WORD *)(v81 + 16) = v86;
        *(void *)uint64_t v81 = v89;
        *(void *)(v81 + 8) = v89 + v85;
        memcpy((void *)(v89 + v85), v24, v80);
        uint64_t v82 = 0;
        atomic_compare_exchange_strong((atomic_ullong *volatile)(a1 + 56), (unint64_t *)&v82, v20);
        if (v82)
        {
          uint64_t v6 = 0;
          goto LABEL_68;
        }
        int v43 = 0;
        uint64_t v6 = 0;
        *(void *)(a1 + 32) = v23;
        *(void *)(a1 + 40) = v84;
        uint64_t v83 = *(void (**)(_WORD *, void))(a1 + 16);
        *(void *)(a1 + 48) = v83;
        v83(v90, *(void *)(a1 + 24));
        goto LABEL_69;
      }
LABEL_67:
      uint64_t v6 = 4294967292;
      goto LABEL_68;
    }
  }
  int v53 = (char *)(v47 + v51);
  if (*v48 > 0x21u)
  {
    int v54 = v52 - 34;
    char v55 = 6;
    switch(v54)
    {
      case 0:
        char v55 = 5;
        goto LABEL_91;
      case 1:
        goto LABEL_91;
      case 2:
        char v55 = 7;
        goto LABEL_91;
      case 14:
      case 16:
      case 17:
      case 22:
        char v55 = 9;
        goto LABEL_91;
      case 15:
        goto LABEL_133;
      case 18:
        char v55 = 11;
        goto LABEL_91;
      case 20:
        char v55 = 13;
        goto LABEL_91;
      default:
        goto LABEL_84;
    }
  }
  switch(v52)
  {
    case 16:
      char v55 = 2;
      break;
    case 17:
      char v55 = 0;
      break;
    case 18:
      char v55 = 3;
      break;
    default:
LABEL_84:
      char v55 = 15;
      break;
  }
LABEL_91:
  *int v53 = v55;
  unsigned int v56 = *v48;
  if (v56 > 0x21)
  {
    switch(*v48)
    {
      case '""':
      case '#':
      case '$':
        *(_WORD *)int v53 = *(_WORD *)v53 & 0xF | (16 * *((_WORD *)v48 + 4));
        goto LABEL_125;
      case '&':
        *int v53 = v55 | 0x20;
        *(_WORD *)(v53 + 1) = *(_WORD *)&v13[2 * *((unsigned int *)v48 + 2)];
        goto LABEL_125;
      case '\'':
        uint64_t v69 = *((void *)v48 + 1);
        *int v53 = v55 | (16 * *(unsigned char *)(v69 + 4));
        unsigned int v70 = *(_DWORD *)(v69 + 4);
        if (v70 >= 2)
        {
          int v71 = 1;
          int v72 = 1;
          do
          {
            *(_WORD *)&v53[2 * v71 - 2 + 1] = *(_WORD *)&v13[2
                                                           * *(unsigned int *)(v69 + 4 * (unsigned __int16)v72++ + 8)];
            int v71 = (unsigned __int16)v72;
          }
          while (v70 > (unsigned __int16)v72);
        }
        goto LABEL_125;
      case '0':
        *int v53 = v55;
        goto LABEL_125;
      case '2':
        char v73 = v55 | 0x10;
        goto LABEL_118;
      case '3':
        char v73 = v55 | 0x20;
        goto LABEL_118;
      case '4':
      case '6':
        uint64_t v62 = *((void *)v48 + 1);
        unsigned int v63 = *(_DWORD *)(v62 + 4);
        if (v63 > 0x1FF)
        {
          unint64_t v20 = 0;
          goto LABEL_142;
        }
        unsigned int v64 = v63 >> 1;
        *int v53 = v55 & 0xF | (16 * ((v63 >> 1) & 0xF));
        if (v63 >= 2)
        {
          if (v64 <= 1) {
            uint64_t v65 = 1;
          }
          else {
            uint64_t v65 = v64;
          }
          uint64_t v66 = (char *)(v62 + 9);
          uint64_t v67 = (unsigned char *)(v23 + 8 + v51);
          do
          {
            *(v67 - 1) = *(v66 - 1);
            char v68 = *v66;
            v66 += 2;
            *uint64_t v67 = v68;
            v67 += 2;
            --v65;
          }
          while (v65);
        }
        break;
      case '8':
        char v73 = v55 | 0x30;
LABEL_118:
        *int v53 = v73;
        goto LABEL_125;
      default:
        goto LABEL_125;
    }
    goto LABEL_125;
  }
  if (v56 == 16)
  {
    v53[1] = v48[8];
LABEL_125:
    unint64_t v78 = *v53;
    LODWORD(v79) = 2;
    switch(v78 & 0xF)
    {
      case 0uLL:
      case 4uLL:
      case 8uLL:
      case 0xAuLL:
      case 0xCuLL:
        LODWORD(v79) = 3;
        break;
      case 2uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 3uLL:
        uint64_t v79 = 3 * (v78 >> 4) + 1;
        break;
      case 9uLL:
        LODWORD(v79) = 1;
        break;
      case 0xBuLL:
      case 0xDuLL:
        LODWORD(v79) = (v78 >> 3) | 1;
        break;
      case 0xFuLL:
        LODWORD(v79) = ((v78 >> 3) & 0x1E) - 1;
        break;
      default:
        LODWORD(v79) = 0;
        break;
    }
    v53 += v79;
LABEL_133:
    if ((__int16)v50[v45] != -1)
    {
      *int v53 = 10;
      *(_WORD *)(v53 + 1) = v50[v45];
    }
    goto LABEL_135;
  }
  if (v56 != 17)
  {
    if (v56 == 18)
    {
      uint64_t v57 = *((void *)v48 + 1);
      *int v53 = v55 | (16 * *(unsigned char *)(v57 + 6));
      if (*(unsigned char *)(v57 + 6))
      {
        unint64_t v58 = 0;
        uint64_t v59 = (_DWORD *)(v57 + 12);
        v60 = (unsigned char *)(v23 + 9 + v51);
        do
        {
          unsigned char *v60 = *((unsigned char *)v59 - 4);
          int v61 = *v59;
          v59 += 2;
          *((_WORD *)v60 - 1) = *(_WORD *)&v13[2 * v61];
          ++v58;
          v60 += 3;
        }
        while (v58 < *(unsigned __int8 *)(v57 + 6));
      }
    }
    goto LABEL_125;
  }
  uint64_t v74 = *((void *)v48 + 1);
  size_t v88 = v46;
  uint64_t v75 = memmem(v24, v46, (const void *)(v74 + 8), *(unsigned int *)(v74 + 4));
  if (v75)
  {
    size_t v76 = v88;
    uint64_t v77 = v75 - v24;
  }
  else
  {
    memcpy(&v24[v88], (const void *)(v74 + 8), *(unsigned int *)(v74 + 4));
    uint64_t v77 = v88;
    size_t v76 = v88 + *(unsigned int *)(v74 + 4);
  }
  uint64_t v6 = 0xFFFFFFFFLL;
  uint64_t v47 = v23 + 6;
  uint64_t v50 = v90;
  uint64_t v49 = (char *)(v23 + 65541);
  uint64_t v19 = 0xFFFFLL;
  uint64_t v11 = 10;
  if (v77 <= 0xFFFFFFFFLL)
  {
    *(_WORD *)(v53 + 1) = v77;
    *int v53 = *v53 & 3 | (4 * *(unsigned char *)(*((void *)v48 + 1) + 4));
    size_t v46 = v76;
    uint64_t v8 = v87;
    goto LABEL_125;
  }
  unint64_t v20 = 0;
LABEL_68:
  (*(void (**)(unint64_t, void, uint64_t, uint64_t))(a1 + 16))(v20, *(void *)(a1 + 24), v19, v11);
  int v43 = 1;
  (*(void (**)(_WORD *, void))(a1 + 16))(v90, *(void *)(a1 + 24));
LABEL_69:
  (*(void (**)(char *, void))(a1 + 16))(v24, *(void *)(a1 + 24));
  if (v43) {
    (*(void (**)(uint64_t, void))(a1 + 16))(v23, *(void *)(a1 + 24));
  }
  if (!v6) {
    goto LABEL_2;
  }
  return v6;
}

uint64_t matchDiagram(int a1, void *a2, const char *a3)
{
  uint64_t v6 = fdopen(a1, "w");
  int v7 = dup(a1);
  if (a2[8] || a2[4])
  {
    int v55 = v7;
    fwrite("digraph nfa {\n\t/*nodesep=.15;*/\n\trankdir=LR;\n", 0x2DuLL, 1uLL, v6);
    fprintf(v6, "\tlabel = \"%s\";\n", a3);
    int v56 = a1;
    if (a2[4])
    {
      fwrite("\tnstart [shape=Msquare, label=\"S\"];\n", 0x24uLL, 1uLL, v6);
      uint64_t v8 = a2[7];
      if (*(_WORD *)(v8 + 16))
      {
        BOOL v9 = *(unsigned char **)v8;
        unint64_t v10 = *(void *)v8 + *(unsigned __int16 *)(v8 + 16);
        uint64_t v11 = *(unsigned char **)v8;
        while (2)
        {
          if ((*v11 & 0x7F) != 0x49)
          {
            fprintf(v6, "\tn%d [shape=", v11 - v9);
            unsigned int v12 = *v11;
            switch(v12 & 0xF)
            {
              case 0u:
              case 4u:
              case 8u:
              case 0xCu:
                fprintf(v6, "circle, label=\"%.*s");
                break;
              case 2u:
                fprintf(v6, "circle, label=\"%c");
                break;
              case 5u:
                fprintf(v6, "Msquare, label=\"E%d");
                break;
              case 6u:
                fprintf(v6, "Mcircle, label=\"%d)");
                break;
              case 7u:
                fprintf(v6, "Mcircle, label=\"(%d");
                break;
              case 9u:
                switch((v12 >> 4) & 7)
                {
                  case 0u:
                    uint64_t v13 = "Mcircle, label=\".";
                    goto LABEL_24;
                  case 1u:
                    uint64_t v13 = "Mcircle, label=\"^";
                    goto LABEL_24;
                  case 2u:
                    uint64_t v13 = "Mcircle, label=\"$";
LABEL_24:
                    size_t v14 = 17;
                    goto LABEL_25;
                  case 3u:
                    uint64_t v13 = "Mcircle, label=\".*";
                    goto LABEL_18;
                  default:
                    goto LABEL_26;
                }
              case 0xAu:
                fprintf(v6, "Mcircle, label=\"%c");
                break;
              case 0xBu:
                uint64_t v13 = "Mcircle, label=\"[]";
LABEL_18:
                size_t v14 = 18;
                goto LABEL_25;
              case 0xDu:
                uint64_t v13 = "Mcircle, label=\"[]*";
                size_t v14 = 19;
LABEL_25:
                fwrite(v13, v14, 1uLL, v6);
                break;
              case 0xFu:
                fprintf(v6, "Mcircle, headport=n, label=\"%c");
                break;
              default:
                fprintf(v6, "hexagon, label=\"%d");
                break;
            }
LABEL_26:
            if ((*v11 & 0xF) == 5) {
              fprintf(v6, "\"]; /* n=%p, type=%d, end */\n");
            }
            else {
              fprintf(v6, "\"]; /* n=%p, type=%d */\n");
            }
          }
          unint64_t v15 = *v11;
          LODWORD(v16) = 2;
          switch(v15 & 0xF)
          {
            case 0uLL:
            case 4uLL:
            case 8uLL:
            case 0xAuLL:
            case 0xCuLL:
              LODWORD(v16) = 3;
              goto LABEL_35;
            case 2uLL:
            case 5uLL:
            case 6uLL:
            case 7uLL:
              goto LABEL_35;
            case 3uLL:
              uint64_t v16 = 3 * (v15 >> 4) + 1;
              goto LABEL_35;
            case 9uLL:
              LODWORD(v16) = 1;
              goto LABEL_35;
            case 0xBuLL:
            case 0xDuLL:
              LODWORD(v16) = (v15 >> 3) | 1;
              goto LABEL_35;
            case 0xFuLL:
              LODWORD(v16) = ((v15 >> 3) & 0x1E) - 1;
LABEL_35:
              v11 += v16;
              if ((unint64_t)v11 >= v10) {
                goto LABEL_72;
              }
              continue;
            default:
              goto LABEL_72;
          }
        }
      }
      goto LABEL_72;
    }
    uint64_t v17 = a2[8];
    fwrite("\tnstart [shape=Msquare, label=\"S\"];\n", 0x24uLL, 1uLL, v6);
    uint64_t v18 = *(unsigned int *)(v17 + 12);
    if (v17 + 40 + 16 * v18 - 16 < (unint64_t)(v17 + 40))
    {
LABEL_72:
      fputc(10, v6);
      if (a2[4])
      {
        fprintf(v6, "\tnstart -> n%d:w;\n", 0);
        uint64_t v26 = (unsigned __int8 **)a2[7];
        if (*((_WORD *)v26 + 8))
        {
          unint64_t v27 = *v26;
          unint64_t v28 = (unint64_t)&(*v26)[*((unsigned __int16 *)v26 + 8)];
          int v29 = *v26;
          while (2)
          {
            unsigned int v30 = *v29;
            switch(v30 & 0xF)
            {
              case 3u:
                if (v30 >= 0x10)
                {
                  unint64_t v31 = 0;
                  uint64_t v32 = (char *)(v29 + 3);
                  do
                  {
                    fprintf(v6, "\tn%d -> n%d [label=\"%c\"];\n",
                      (unsigned __int16)((_WORD)v29 - (_WORD)v27),
                      *((unsigned __int16 *)v32 - 1),
                      *v32);
                    ++v31;
                    v32 += 3;
                  }
                  while (v31 < (unint64_t)*v29 >> 4);
                }
                goto LABEL_89;
              case 5u:
                goto LABEL_89;
              case 9u:
                if ((v30 & 0x70) == 0x30) {
                  fprintf(v6, "\tn%d:e -> n%d:w;\n",
                }
                    (unsigned __int16)((_WORD)v29 - (_WORD)v27),
                    (unsigned __int16)((_WORD)v29 - (_WORD)v27));
                goto LABEL_88;
              case 0xDu:
                fprintf(v6, "\tn%d:e -> n%d:w;\n");
                goto LABEL_89;
              case 0xFu:
                fprintf(v6, "\tn%d -> n%d:w;\n",
                  (unsigned __int16)((_WORD)v29 - (_WORD)v27),
                  (unsigned __int16)((_WORD)v29 - (_WORD)v27 + ((v30 >> 3) & 0x1E) - 1));
                if (*v29 >= 0x20u)
                {
                  uint64_t v33 = 0;
                  do
                  {
                    fprintf(v6, "\tn%d -> n%d:w [arrowhead=odot];\n",
                      (unsigned __int16)((_WORD)v29 - (_WORD)v27),
                      *(unsigned __int16 *)&v29[2 * v33 + 1]);
                    unint64_t v34 = v33 + 2;
                    ++v33;
                  }
                  while (v34 < (unint64_t)*v29 >> 4);
                }
                goto LABEL_89;
              default:
LABEL_88:
                fprintf(v6, "\tn%d -> n%d:w;\n");
LABEL_89:
                unint64_t v35 = *v29;
                LODWORD(v36) = 2;
                switch(v35 & 0xF)
                {
                  case 0uLL:
                  case 4uLL:
                  case 8uLL:
                  case 0xAuLL:
                  case 0xCuLL:
                    LODWORD(v36) = 3;
                    goto LABEL_95;
                  case 2uLL:
                  case 5uLL:
                  case 6uLL:
                  case 7uLL:
                    goto LABEL_95;
                  case 3uLL:
                    uint64_t v36 = 3 * (v35 >> 4) + 1;
                    goto LABEL_95;
                  case 9uLL:
                    LODWORD(v36) = 1;
                    goto LABEL_95;
                  case 0xBuLL:
                  case 0xDuLL:
                    LODWORD(v36) = (v35 >> 3) | 1;
                    goto LABEL_95;
                  case 0xFuLL:
                    LODWORD(v36) = ((v35 >> 3) & 0x1E) - 1;
LABEL_95:
                    v29 += v36;
                    if ((unint64_t)v29 >= v28) {
                      goto LABEL_135;
                    }
                    continue;
                  default:
                    goto LABEL_135;
                }
            }
          }
        }
        goto LABEL_135;
      }
      uint64_t v37 = a2[8];
      fprintf(v6, "\tnstart -> n%d:w\n", *(_DWORD *)(v37 + 8));
      uint64_t v38 = *(unsigned int *)(v37 + 12);
      if (!v38)
      {
LABEL_135:
        fwrite("\n}\n", 3uLL, 1uLL, v6);
        fflush(v6);
        fclose(v6);
        dup2(v55, v56);
        return 0;
      }
      uint64_t v39 = v37 + 40;
      unint64_t v40 = v37 + 40 + 16 * v38;
      uint64_t v41 = (unsigned __int8 *)(v37 + 40);
      while (1)
      {
        if (*(_DWORD *)(v37 + 12) <= ((unint64_t)&v41[-v39] >> 4)) {
          goto LABEL_128;
        }
        int v42 = *v41;
        if (v42 == 255) {
          goto LABEL_128;
        }
        int v43 = *((_DWORD *)v41 + 1);
        if (*v41 > 0x26u)
        {
          if (v42 == 39)
          {
            uint64_t v52 = *((void *)v41 + 1);
            if (*(_DWORD *)(v52 + 4))
            {
              unint64_t v53 = 0;
              do
              {
                if (*(unsigned char *)(v39 + 16 * *(unsigned int *)(v52 + 8 + 4 * v53)) == 49) {
                  fprintf(v6, "\tn%d -> n%d [arrowhead=odot];\n");
                }
                else {
                  fprintf(v6, "\tn%d -> n%d:s [arrowhead=odot];\n");
                }
                ++v53;
              }
              while (v53 < *(unsigned int *)(v52 + 4));
            }
            goto LABEL_128;
          }
          if (v42 == 54 || (unsigned int v44 = *((_DWORD *)v41 + 1), v42 == 56))
          {
            fprintf(v6, "\tn%d:e -> n%d:w;\n", (unint64_t)&v41[-v39] >> 4, (unint64_t)&v41[-v39] >> 4);
            unsigned int v44 = *((_DWORD *)v41 + 1);
          }
        }
        else
        {
          if (v42 == 18)
          {
            uint64_t v47 = *((void *)v41 + 1);
            if (*(unsigned char *)(v47 + 6))
            {
              unint64_t v48 = 0;
              uint64_t v49 = (int *)(v47 + 12);
              do
              {
                uint64_t v50 = *((unsigned __int8 *)v49 - 4);
                int v51 = *v49;
                v49 += 2;
                fprintf(v6, "\tn%d -> n%d [label=\"%c\"];\n", (unint64_t)&v41[-v39] >> 4, v51, v50);
                ++v48;
              }
              while (v48 < *(unsigned __int8 *)(v47 + 6));
            }
            goto LABEL_128;
          }
          if (v42 == 34) {
            goto LABEL_128;
          }
          unsigned int v44 = *((_DWORD *)v41 + 1);
          if (v42 == 38)
          {
            int v45 = v41[1];
            if (v45 == 42)
            {
              fprintf(v6, "\tn%d:n -> n%d:w [arrowhead=dot];\n", (unint64_t)&v41[-v39] >> 4, v43);
              if (*(unsigned char *)(v39 + 16 * *((unsigned int *)v41 + 2)) == 49) {
                goto LABEL_133;
              }
              fprintf(v6, "\tn%d:s -> n%d:s [arrowhead=odot];\n");
            }
            else
            {
              if (v45 != 43)
              {
                fprintf(v6, "\tn%d:n -> n%d:w [arrowhead=dot];\n", (unint64_t)&v41[-v39] >> 4, v43);
                if (*(unsigned char *)(v39 + 16 * *((unsigned int *)v41 + 2)) != 49)
                {
                  fprintf(v6, "\tn%d:s -> n%d:w [arrowhead=odot];\n");
                  goto LABEL_128;
                }
LABEL_133:
                fprintf(v6, "\tn%d:s -> n%d [arrowhead=odot];\n");
                goto LABEL_128;
              }
              fprintf(v6, "\tn%d:e -> n%d:w [arrowhead=dot];\n", (unint64_t)&v41[-v39] >> 4, v43);
              fprintf(v6, "\tn%d:n -> n%d:n [arrowhead=odot];\n");
            }
            goto LABEL_128;
          }
        }
        int v46 = *(unsigned __int8 *)(v39 + 16 * v44);
        if (v46 == 38)
        {
          if (*(unsigned char *)(v39 + 16 * v44 + 1) != 42)
          {
LABEL_127:
            fprintf(v6, "\tn%d -> n%d:w;\n");
            goto LABEL_128;
          }
        }
        else if (v46 != 49)
        {
          goto LABEL_127;
        }
        fprintf(v6, "\tn%d -> n%d;\n");
LABEL_128:
        v41 += 16;
        if ((unint64_t)v41 >= v40) {
          goto LABEL_135;
        }
      }
    }
    unint64_t v19 = 16 * v18 - 16;
    while (1)
    {
      unint64_t v20 = (unsigned char *)(v17 + v19 + 40);
      if (*v20 != 255) {
        break;
      }
LABEL_71:
      v19 -= 16;
      if (v17 + v19 + 40 < v17 + 40) {
        goto LABEL_72;
      }
    }
    unint64_t v21 = v19 >> 4;
    if (*(_DWORD *)(v17 + 12) < (v19 >> 4)) {
      LODWORD(v21) = *(_DWORD *)(v17 + 12);
    }
    fprintf(v6, "\tn%d [shape=", v21);
    unsigned int v22 = *v20;
    if (v22 > 0x21)
    {
      switch(*v20)
      {
        case '""':
          fprintf(v6, "Msquare, label=\"E%d");
          goto LABEL_66;
        case '#':
          fprintf(v6, "Mcircle, label=\"%d)");
          goto LABEL_66;
        case '$':
          fprintf(v6, "Mcircle, label=\"(%d");
          goto LABEL_66;
        case '&':
        case '\'':
          fprintf(v6, "Mcircle, headport=n, label=\"%c");
          goto LABEL_66;
        case '0':
          uint64_t v23 = "Mcircle, label=\".";
          goto LABEL_57;
        case '1':
          fprintf(v6, "Mcircle, label=\"%c");
          goto LABEL_66;
        case '2':
          uint64_t v23 = "Mcircle, label=\"^";
          goto LABEL_57;
        case '3':
          uint64_t v23 = "Mcircle, label=\"$";
LABEL_57:
          size_t v24 = 17;
          break;
        case '4':
          uint64_t v23 = "Mcircle, label=\"[]";
          goto LABEL_61;
        case '6':
          uint64_t v23 = "Mcircle, label=\"[]*";
          size_t v24 = 19;
          goto LABEL_62;
        case '8':
          uint64_t v23 = "Mcircle, label=\".*";
          goto LABEL_61;
        default:
          goto LABEL_65;
      }
      goto LABEL_62;
    }
    switch(v22)
    {
      case 0x10u:
        fprintf(v6, "circle, label=\"%c");
        break;
      case 0x11u:
        fprintf(v6, "circle, label=\"%.*s");
        break;
      case 0x12u:
        uint64_t v23 = "diamond, label=\"{}";
LABEL_61:
        size_t v24 = 18;
LABEL_62:
        fwrite(v23, v24, 1uLL, v6);
        break;
      default:
LABEL_65:
        fprintf(v6, "hexagon, label=\"%d");
        break;
    }
LABEL_66:
    int v25 = *v20;
    if (v25 == 34)
    {
      fprintf(v6, "\"]; /* n=%p, type=%d, end */\n");
    }
    else if (v25 == 38)
    {
      fprintf(v6, "\"]; /* n=%p, type=%d, left=n%u, right=n%u */\n");
    }
    else
    {
      fprintf(v6, "\"]; /* n=%p, type=%d, next=n%u, data=%u */\n");
    }
    goto LABEL_71;
  }
  return 0xFFFFFFFFLL;
}

size_t printGraphNode(FILE *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = a2 + 16 * a3;
  fprintf(a1, "[#%x->%x ", a3, *(_DWORD *)(v6 + 44));
  switch(*(unsigned char *)(v6 + 40))
  {
    case 0x10:
      fprintf(a1, "'%c'");
      goto LABEL_45;
    case 0x11:
      fprintf(a1, "\"%.*s\"");
      goto LABEL_45;
    case 0x12:
      uint64_t v8 = *(void *)(a2 + 16 * a3 + 48);
      fputc(123, a1);
      if (*(unsigned char *)(v8 + 6))
      {
        unint64_t v9 = 0;
        unint64_t v10 = (int *)(v8 + 12);
        do
        {
          if (v9) {
            fputc(32, a1);
          }
          uint64_t v11 = *((char *)v10 - 4);
          int v12 = *v10;
          v10 += 2;
          fprintf(a1, "'%c'->%x", v11, v12);
          ++v9;
        }
        while (v9 < *(unsigned __int8 *)(v8 + 6));
      }
      putchar(125);
      goto LABEL_13;
    case 0x13:
    case 0x14:
    case 0x15:
    case 0x16:
    case 0x17:
    case 0x18:
    case 0x19:
    case 0x1A:
    case 0x1B:
    case 0x1C:
    case 0x1D:
    case 0x1E:
    case 0x1F:
    case 0x20:
    case 0x21:
    case 0x2F:
    case 0x35:
    case 0x37:
      goto LABEL_5;
    case 0x22:
      fprintf(a1, "E r=%d");
      goto LABEL_45;
    case 0x23:
LABEL_13:
      int v13 = 41;
      goto LABEL_41;
    case 0x24:
      int v13 = 40;
      goto LABEL_41;
    case 0x25:
      int v7 = "(?";
      goto LABEL_43;
    case 0x26:
      fprintf(a1, "->%x alt:%c");
      goto LABEL_45;
    case 0x27:
      fwrite("alts", 4uLL, 1uLL, a1);
      uint64_t v14 = a2 + 16 * a3;
      uint64_t v17 = *(void *)(v14 + 48);
      uint64_t v16 = (uint64_t *)(v14 + 48);
      uint64_t v15 = v17;
      if (*(_DWORD *)(v17 + 4))
      {
        unint64_t v18 = 0;
        do
        {
          fprintf(a1, " ->%x", *(_DWORD *)(v15 + 4 * v18++ + 8));
          uint64_t v15 = *v16;
        }
        while (v18 < *(unsigned int *)(*v16 + 4));
      }
      goto LABEL_45;
    case 0x28:
      int v7 = "cons";
      goto LABEL_24;
    case 0x29:
      int v13 = 42;
      goto LABEL_41;
    case 0x2A:
      int v7 = "*?";
      goto LABEL_43;
    case 0x2B:
      int v13 = 43;
      goto LABEL_41;
    case 0x2C:
      int v7 = "+?";
      goto LABEL_43;
    case 0x2D:
      int v13 = 63;
      goto LABEL_41;
    case 0x2E:
      int v7 = "??";
      goto LABEL_43;
    case 0x30:
      int v13 = 46;
      goto LABEL_41;
    case 0x31:
      int v7 = "[S]";
      size_t v19 = 3;
      goto LABEL_44;
    case 0x32:
      int v13 = 94;
      goto LABEL_41;
    case 0x33:
      int v13 = 36;
      goto LABEL_41;
    case 0x34:
      fputc(91, a1);
      goto LABEL_37;
    case 0x36:
      fwrite("*[", 2uLL, 1uLL, a1);
LABEL_37:
      uint64_t v20 = a2 + 16 * a3;
      uint64_t v23 = *(void *)(v20 + 48);
      unsigned int v22 = (uint64_t *)(v20 + 48);
      uint64_t v21 = v23;
      if (*(_DWORD *)(v23 + 4))
      {
        unsigned int v24 = 0;
        do
        {
          fprintf(a1, "%c-%c", *(char *)(v21 + 8 + v24), *(char *)(v21 + 8 + v24 + 1));
          v24 += 2;
          uint64_t v21 = *v22;
        }
        while (v24 < *(_DWORD *)(*v22 + 4));
      }
      int v13 = 93;
LABEL_41:
      fputc(v13, a1);
      goto LABEL_45;
    case 0x38:
      int v7 = ".*";
LABEL_43:
      size_t v19 = 2;
      goto LABEL_44;
    default:
      if (*(unsigned __int8 *)(v6 + 40) == 255)
      {
        int v7 = "DEAD";
LABEL_24:
        size_t v19 = 4;
LABEL_44:
        fwrite(v7, v19, 1uLL, a1);
      }
      else
      {
LABEL_5:
        fprintf(a1, "(unknown type %x)");
      }
LABEL_45:
      return fwrite("]\n", 2uLL, 1uLL, a1);
  }
}

size_t printRunNode(FILE *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = **(void **)(a2 + 56);
  int v7 = (unsigned __int8 *)(v6 + a3);
  fprintf(a1, "[#%x ", a3);
  unsigned int v8 = *v7;
  switch(v8 & 0xF)
  {
    case 0u:
    case 4u:
    case 8u:
    case 0xCu:
      fprintf(a1, "\"%.*s\"");
      break;
    case 2u:
      fprintf(a1, "'%c'");
      break;
    case 3u:
      fputc(123, a1);
      if (*v7 >= 0x10u)
      {
        unint64_t v9 = 0;
        unint64_t v10 = (char *)(v5 + v6 + 3);
        do
        {
          if (v9) {
            fputc(32, a1);
          }
          fprintf(a1, "'%c'->%x", *v10, *((unsigned __int16 *)v10 - 1));
          ++v9;
          v10 += 3;
        }
        while (v9 < (unint64_t)*v7 >> 4);
      }
      int v11 = 125;
      goto LABEL_14;
    case 5u:
      fprintf(a1, "E r=%d");
      break;
    case 6u:
      int v11 = 41;
      goto LABEL_14;
    case 7u:
      int v11 = 40;
LABEL_14:
      fputc(v11, a1);
      break;
    case 9u:
      switch((v8 >> 4) & 7)
      {
        case 0u:
          int v11 = 46;
          goto LABEL_14;
        case 1u:
          int v11 = 94;
          goto LABEL_14;
        case 2u:
          int v11 = 36;
          goto LABEL_14;
        case 3u:
          int v12 = ".*";
          size_t v13 = 2;
          goto LABEL_21;
        default:
          goto LABEL_22;
      }
      break;
    case 0xAu:
      fprintf(a1, "->%x [S]");
      break;
    case 0xBu:
      int v12 = "[...]";
      size_t v13 = 5;
      goto LABEL_21;
    case 0xDu:
      int v12 = "[...]*";
      size_t v13 = 6;
LABEL_21:
      fwrite(v12, v13, 1uLL, a1);
      break;
    case 0xFu:
      fprintf(a1, "alts ->%x", a3 + ((v8 >> 3) & 0x1E) - 1);
      if (*v7 >= 0x20u)
      {
        unsigned int v15 = 1;
        do
          fprintf(a1, " ->%x", *(unsigned __int16 *)&v7[2 * v15++ - 1]);
        while (v15 < *v7 >> 4);
      }
      break;
    default:
      fprintf(a1, "(unknown type %x)");
      break;
  }
LABEL_22:

  return fwrite("]\n", 2uLL, 1uLL, a1);
}

uint64_t matchPrintNodes(int a1, uint64_t a2)
{
  int v4 = fdopen(a1, "w");
  int v5 = dup(a1);
  uint64_t v6 = *(uint64_t **)(a2 + 56);
  uint64_t v7 = *(void *)(a2 + 64);
  uint64_t v8 = *v6;
  if (*v6)
  {
    uint64_t v9 = *((unsigned __int16 *)v6 + 8);
    fprintf(v4, "== matchPrintNodes: run nodes (start=0, count=%x) ==\n", *((unsigned __int16 *)v6 + 8));
    if (v9)
    {
      unsigned __int16 v10 = 0;
      while (2)
      {
        printRunNode(v4, a2, v10);
        unsigned int v11 = *(unsigned __int8 *)(v8 + v10);
        LOWORD(v12) = 2;
        switch(v11 & 0xF)
        {
          case 0u:
          case 4u:
          case 8u:
          case 0xAu:
          case 0xCu:
            LOWORD(v12) = 3;
            goto LABEL_10;
          case 2u:
          case 5u:
          case 6u:
          case 7u:
            goto LABEL_10;
          case 3u:
            int v12 = 3 * (v11 >> 4) + 1;
            goto LABEL_10;
          case 9u:
            LOWORD(v12) = 1;
            goto LABEL_10;
          case 0xBu:
          case 0xDu:
            int v12 = (v11 >> 3) | 1;
            goto LABEL_10;
          case 0xFu:
            int v12 = ((v11 >> 3) & 0x1E) - 1;
LABEL_10:
            v10 += v12;
            if (v9 <= v10) {
              break;
            }
            continue;
          default:
            return 0xFFFFFFFFLL;
        }
        break;
      }
    }
    fwrite("== end nodes==\n", 0xFuLL, 1uLL, v4);
  }
  if (v7)
  {
    fprintf(v4, "== matchPrintNodes: graph nodes (start=%x, count=%x) ==\n", *(_DWORD *)(v7 + 8), *(_DWORD *)(v7 + 12));
    if (*(_DWORD *)(v7 + 12))
    {
      unsigned int v13 = 0;
      unsigned __int16 v14 = 0;
      do
      {
        uint64_t v15 = *(void *)(v7 + 16);
        if (v15) {
          fprintf(v4, "rc=%u ", *(_DWORD *)(v15 + 4 * v14));
        }
        printGraphNode(v4, v7, v13);
        unsigned int v13 = ++v14;
      }
      while (*(_DWORD *)(v7 + 12) > v14);
    }
    fwrite("== end nodes==\n", 0xFuLL, 1uLL, v4);
  }
  fflush(v4);
  fclose(v4);
  dup2(v5, a1);
  return 0;
}

uint64_t matchInit(uint64_t *a1, void *(*a2)(size_t a1), void (__cdecl *a3)(void *), uint64_t a4)
{
  if (a2) {
    BOOL v7 = a3 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = v7;
  if (v7)
  {
    uint64_t v9 = malloc_wrapper;
    uint64_t v10 = ((uint64_t (*)(uint64_t, uint64_t))malloc_wrapper)(72, a4);
  }
  else
  {
    uint64_t v9 = a2;
    uint64_t v10 = ((uint64_t (*)(uint64_t, uint64_t))a2)(72, a4);
  }
  if (!v10) {
    return 4294967292;
  }
  uint64_t v11 = v10;
  uint64_t result = 0;
  *(_OWORD *)uint64_t v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  if (v8) {
    unsigned int v13 = free_wrapper;
  }
  else {
    unsigned int v13 = a3;
  }
  *(_OWORD *)(v11 + 32) = 0uLL;
  *(_OWORD *)(v11 + 48) = 0uLL;
  *(_DWORD *)uint64_t v11 = 1;
  *(void *)(v11 + 8) = v9;
  *(void *)(v11 + 16) = v13;
  *(void *)(v11 + 24) = a4;
  *(void *)(v11 + 56) = 0;
  *(void *)(v11 + 64) = 0;
  *a1 = v11;
  return result;
}

uint64_t matchSetOption(unsigned int *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (!a1) {
    return 4294967294;
  }
  if (a2 != 1) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a1 = *a1 & 0xFFFFFFFE | (a9 != 0);
  return result;
}

unsigned __int8 *nodeModPtrRefs(unsigned __int8 *result, int a2, uint64_t (*a3)(void, uint64_t), uint64_t a4)
{
  unsigned int v4 = *result;
  BOOL v5 = v4 > 0x36;
  uint64_t v6 = (1 << v4) & 0x50008000060000;
  BOOL v7 = v5 || v6 == 0;
  if (!v7)
  {
    int v8 = (_DWORD *)*((void *)result + 1);
    BOOL v7 = *v8 + a2 == 0;
    *v8 += a2;
    if (v7) {
      return (unsigned __int8 *)a3(*((void *)result + 1), a4);
    }
  }
  return result;
}

uint64_t nfaFree(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  if (*(_DWORD *)(a1 + 36) && *(_DWORD *)(a1 + 12))
  {
    unint64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(a1 + 48);
    do
    {
      unsigned int v7 = *((unsigned __int8 *)v6 - 8);
      BOOL v8 = v7 > 0x36;
      uint64_t v9 = (1 << v7) & 0x50008000060000;
      if (!v8 && v9 != 0)
      {
        int v11 = *(_DWORD *)*v6 - 1;
        *(_DWORD *)uint64_t *v6 = v11;
        if (!v11) {
          a2(*v6, a3);
        }
      }
      v6 += 2;
      ++v5;
    }
    while (v5 < *(unsigned int *)(a1 + 12));
  }

  return a2(a1, a3);
}

uint64_t matchFree(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 64);
    if (v2) {
      nfaFree(v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24));
    }
    uint64_t v3 = *(void *)(v1 + 56);
    if (v3) {
      (*(void (**)(uint64_t, void))(v1 + 16))(v3, *(void *)(v1 + 24));
    }
    if (*(void *)(v1 + 32))
    {
      unsigned int v4 = *(void (**)(void))(v1 + 48);
      if (v4) {
        v4();
      }
    }
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
    uint64_t v5 = *(void *)(v1 + 24);
    return v6(v1, v5);
  }
  return result;
}

void *malloc_wrapper(size_t a1)
{
  return malloc_type_malloc(a1, 0xA073BEEDuLL);
}

uint64_t matchCompile(uint64_t a1, unsigned __int8 *a2, unint64_t a3, int a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v33 = 0u;
  long long v29 = 0u;
  uint64_t v30 = 0;
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
  memset(v16, 0, sizeof(v16));
  unint64_t v31 = a2;
  long long v32 = (unint64_t)&a2[a3];
  BYTE9(v32) = *(unsigned char *)a1 & 1;
  *((void *)&v28 + 1) = a1;
  if (a3 > 0x1553555) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v7 = 6 * a3 + 6;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void))(a1 + 8))(16 * v7 + 56, *(void *)(a1 + 24));
  if (!v8) {
    return 4294967292;
  }
  uint64_t v9 = v8;
  *(_DWORD *)(v8 + 12) = 0;
  *(void *)uint64_t v8 = a1;
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(_DWORD *)(v8 + 32) = 0;
  *(_DWORD *)(v8 + 36) = v7;
  LODWORD(v17) = 0;
  *(void *)&long long v29 = v8;
  *((void *)&v29 + 1) = v8 + 40;
  LODWORD(v30) = 0;
  BYTE4(v28) = 1;
  *((void *)&v27 + 1) = 0;
  LODWORD(v28) = 0;
  BYTE4(v17) = 33;
  *(void *)((char *)&v19 + 4) = 1;
  int v10 = tokenize(&v31);
  unsigned __int8 v11 = v10;
  if (v10 == 50)
  {
    BYTE5(v28) = 1;
  }
  else
  {
    BYTE5(v28) = 0;
    handleToken((uint64_t)v16, 0x30u);
    handleOperator((uint64_t)v16, 0x2Au);
  }
  if (BYTE9(v32)) {
    unsigned int v12 = 37;
  }
  else {
    unsigned int v12 = 36;
  }
  handleOperator((uint64_t)v16, v12);
  do
  {
    uint64_t v13 = handleToken((uint64_t)v16, v11);
    if (v13)
    {
      uint64_t v4 = v13;
      long long v29 = 0uLL;
      (*(void (**)(uint64_t, void))(a1 + 16))(v9, *(void *)(a1 + 24));
      return v4;
    }
    int v14 = tokenize(&v31);
    unsigned __int8 v11 = v14;
  }
  while (v14 != 34);
  if (DWORD2(v27) && (evaluateOperator((uint64_t)v16, 0x23u), BYTE4(v28) = 0, DWORD2(v27)))
  {
    (*(void (**)(uint64_t, void))(a1 + 16))(v9, *(void *)(a1 + 24));
    return 4294967291;
  }
  else
  {
    handleOperator((uint64_t)v16, 0x22u);
    evaluateOperator((uint64_t)v16, 0x21u);
    uint64_t v4 = 0;
    *(_DWORD *)(*((void *)&v29 + 1) + 16 * v30 + 8) = a4;
    *(void *)(a1 + 64) = v9;
  }
  return v4;
}

uint64_t tokenize(unsigned __int8 **a1)
{
  char v1 = 0;
  uint64_t v3 = *a1;
  unint64_t v2 = (unint64_t)a1[1];
  do
  {
    if ((unint64_t)v3 >= v2) {
      return 34;
    }
    uint64_t v4 = v3 + 1;
    *a1 = v3 + 1;
    int v5 = *v3;
    if ((v1 & 1) != 0 || *((unsigned char *)a1 + 16)) {
      goto LABEL_66;
    }
    char v1 = 1;
    ++v3;
  }
  while (v5 == 92);
  int v6 = (unint64_t)v4 < v2 && *v4 == 63;
  if (v5 > 62)
  {
    if (v5 > 93)
    {
      if (v5 == 94) {
        return 50;
      }
      if (v5 == 124) {
        return 38;
      }
    }
    else
    {
      if (v5 == 63)
      {
        if (v6)
        {
          *a1 = v4 + 1;
          return 46;
        }
        else
        {
          return 45;
        }
      }
      if (v5 == 91)
      {
        char v8 = 0;
        char v9 = 0;
        char v10 = 0;
        unsigned int v11 = 0;
        unsigned int v12 = (char *)a1 + 28;
        char v13 = 1;
        while (2)
        {
          char v14 = 0;
          v12[v11] = 0;
          do
          {
            if ((unint64_t)v4 >= v2) {
              return 34;
            }
            uint64_t v15 = v4++;
            *a1 = v4;
            unsigned int v16 = *v15;
            if (v14) {
              goto LABEL_32;
            }
            char v14 = 1;
          }
          while (v16 == 92);
          switch(v16)
          {
            case '-':
              if (v9)
              {
                char v13 = 0;
                char v8 = 1;
                goto LABEL_36;
              }
              unsigned int v16 = 45;
              break;
            case '^':
              if (v13)
              {
                char v13 = 1;
                char v10 = 1;
                goto LABEL_37;
              }
              unsigned int v16 = 94;
              break;
            case ']':
              if ((v13 & 1) == 0)
              {
                if (v8) {
                  v12[v11 - 1] = 45;
                }
                if (!v11) {
                  goto LABEL_56;
                }
                if (v11 <= 2)
                {
                  unsigned int v11 = 0;
                  if ((v10 & 1) == 0) {
                    goto LABEL_61;
                  }
                  char v38 = *v12;
                  goto LABEL_60;
                }
LABEL_38:
                uint64_t v20 = 0;
                long long v21 = (char *)a1 + 30;
                unint64_t v22 = 2;
                unint64_t v23 = v11;
                do
                {
                  uint64_t v24 = 0;
                  uint64_t v25 = v20;
                  v20 += 2;
                  LODWORD(v26) = v25;
                  do
                  {
                    if (v21[v24] >= v12[v26]) {
                      uint64_t v26 = v26;
                    }
                    else {
                      uint64_t v26 = (v22 + v24);
                    }
                    v24 += 2;
                  }
                  while (v22 + v24 < v23);
                  if (v25 != v26)
                  {
                    char v27 = v12[v26];
                    v12[v26] = v12[v25];
                    v12[v25] = v27;
                    int v28 = v26 + 1;
                    char v29 = v12[v28];
                    uint64_t v30 = v25 | 1;
                    v12[v28] = v12[v30];
                    v12[v30] = v29;
                  }
                  v22 += 2;
                  v21 += 2;
                }
                while (v22 < v23);
                uint64_t v31 = 0;
                unsigned int v11 = 0;
                do
                {
                  unsigned int v32 = *((unsigned __int8 *)a1 + v31 + 30);
                  uint64_t v33 = v11 + 1;
                  unsigned int v34 = v12[v33];
                  if (v32 <= v34)
                  {
                    unsigned int v36 = *((unsigned __int8 *)a1 + v31 + 31);
                    if (v34 > v36) {
                      LOBYTE(v36) = v12[v33];
                    }
                    v12[v33] = v36;
                  }
                  else
                  {
                    uint64_t v35 = v11 + 2;
                    if (v31 + 2 == v35)
                    {
                      unsigned int v11 = v31 + 2;
                    }
                    else
                    {
                      v12[v35] = v32;
                      v12[v11 + 3] = *((unsigned char *)a1 + v31 + 31);
                      v11 += 2;
                    }
                  }
                  unint64_t v37 = v31 + 4;
                  v31 += 2;
                }
                while (v37 < v23);
LABEL_56:
                if ((v10 & 1) == 0)
                {
LABEL_61:
                  *((_DWORD *)a1 + 6) = v11 + 2;
                  return 52;
                }
                char v38 = *v12;
                if (v11)
                {
                  for (unsigned int i = 0; i < v11; v12[v40] = v12[i] - 1)
                  {
                    unsigned int v40 = i + 1;
                    v12[i] = v12[i + 1] + 1;
                    i += 2;
                  }
                }
LABEL_60:
                v12[v11] = v12[v11 + 1] + 1;
                v12[v11 + 1] = v38 - 1;
                goto LABEL_61;
              }
              unsigned int v16 = 93;
              break;
          }
LABEL_32:
          *((unsigned char *)a1 + 18) = v16;
          if (v8)
          {
            uint64_t v17 = v11 - 1;
            v12[v17] = v16;
            uint64_t v18 = v11 - 2;
            unsigned int v19 = v12[v18];
            char v13 = 0;
            char v8 = 0;
            char v9 = 0;
            if (v16 < v19)
            {
              v12[v17] = v19;
              v12[v18] = v16;
            }
LABEL_37:
            uint64_t v4 = v15 + 1;
            if (v11 < 0x20) {
              continue;
            }
            goto LABEL_38;
          }
          break;
        }
        char v13 = 0;
        char v8 = 0;
        v12[v11] = v16;
        v12[v11 + 1] = v16;
        v11 += 2;
LABEL_36:
        char v9 = 1;
        goto LABEL_37;
      }
    }
LABEL_66:
    *((unsigned char *)a1 + 18) = v5;
    return 16;
  }
  switch(v5)
  {
    case '$':
      unsigned __int8 v7 = 51;
      break;
    case '(':
      if (v6) {
        *a1 = v4 + 1;
      }
      if (*((unsigned __int8 *)a1 + 17) == v6) {
        unsigned __int8 v7 = 36;
      }
      else {
        unsigned __int8 v7 = 37;
      }
      break;
    case ')':
      unsigned __int8 v7 = 35;
      break;
    case '*':
      if (v6)
      {
        *a1 = v4 + 1;
        unsigned __int8 v7 = 42;
      }
      else
      {
        unsigned __int8 v7 = 41;
      }
      break;
    case '+':
      if (v6)
      {
        *a1 = v4 + 1;
        unsigned __int8 v7 = 44;
      }
      else
      {
        unsigned __int8 v7 = 43;
      }
      break;
    case '.':
      unsigned __int8 v7 = 48;
      break;
    default:
      goto LABEL_66;
  }
  return v7;
}

uint64_t handleToken(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x30) == 0x20)
  {
    handleOperator(a1, a2);
    return 0;
  }
  if (!*(unsigned char *)(a1 + 436)) {
    handleOperator(a1, 0x28u);
  }
  uint64_t v5 = *(void *)(a1 + 448);
  uint64_t v6 = *(void *)(a1 + 456);
  uint64_t v7 = *(unsigned int *)(v5 + 12);
  *(_DWORD *)(v5 + 12) = v7 + 1;
  uint64_t v8 = v6 + 16 * v7;
  *(unsigned char *)uint64_t v8 = a2;
  *(unsigned char *)(v8 + 1) = 95;
  *(void *)(v8 + 4) = -1;
  if (a2 == 16)
  {
    *(unsigned char *)(*(void *)(a1 + 456) + 16 * v7 + 8) = *(unsigned char *)(a1 + 490);
  }
  else if (a2 == 52)
  {
    size_t v9 = *(unsigned int *)(a1 + 496) + 8;
    char v10 = (_DWORD *)(*(uint64_t (**)(size_t, void))(**(void **)(a1 + 448) + 8))(v9, *(void *)(**(void **)(a1 + 448) + 24));
    if (!v10) {
      return 4294967292;
    }
    unsigned int v11 = v10;
    memcpy(v10, (const void *)(a1 + 492), v9);
    *unsigned int v11 = 1;
    *(void *)(*(void *)(a1 + 456) + 16 * v7 + 8) = v11;
  }
  uint64_t v12 = *(unsigned int *)(a1 + 256);
  if (v12 <= 0x1F)
  {
    *(_WORD *)(a1 + 8 * v12) = v7;
    if (!WORD1(v7))
    {
      *(_WORD *)(a1 + 8 * *(unsigned int *)(a1 + 256) + 2) = v7;
      uint64_t v13 = *(unsigned int *)(a1 + 256);
      *(_DWORD *)(a1 + 8 * v13 + 4) = *(_DWORD *)(a1 + 424);
      *(_DWORD *)(a1 + 256) = v13 + 1;
    }
  }
  uint64_t result = 0;
  *(unsigned char *)(a1 + 436) = 0;
  return result;
}

uint64_t handleOperator(uint64_t result, unsigned int a2)
{
  uint64_t v2 = result;
  if (a2 == 35)
  {
    if (!*(_DWORD *)(result + 424)) {
      return result;
    }
    uint64_t result = evaluateOperator(result, 0x23u);
    goto LABEL_12;
  }
  if ((a2 & 0xFE) != 0x24)
  {
    uint64_t result = evaluateOperator(result, a2);
    uint64_t v5 = *(unsigned int *)(v2 + 292);
    if (v5 <= 0x1F)
    {
      *(unsigned char *)(v2 + v5 + 260) = a2;
      uint64_t v6 = *(unsigned int *)(v2 + 292);
      *(_DWORD *)(v2 + 4 * v6 + 296) = *(_DWORD *)(v2 + 432);
      *(_DWORD *)(v2 + 292) = v6 + 1;
    }
    if (a2 - 41 < 6)
    {
LABEL_12:
      char v7 = 0;
LABEL_22:
      *(unsigned char *)(v2 + 436) = v7;
      return result;
    }
LABEL_21:
    char v7 = 1;
    goto LABEL_22;
  }
  if (a2 != 36 || *(int *)(result + 432) <= 16)
  {
    if (*(unsigned char *)(result + 436))
    {
      LODWORD(v4) = *(_DWORD *)(result + 292);
    }
    else
    {
      uint64_t result = evaluateOperator(result, 0x28u);
      uint64_t v4 = *(unsigned int *)(v2 + 292);
      if (v4 <= 0x1F)
      {
        *(unsigned char *)(v2 + v4 + 260) = 40;
        uint64_t v8 = *(unsigned int *)(v2 + 292);
        *(_DWORD *)(v2 + 4 * v8 + 296) = *(_DWORD *)(v2 + 432);
        LODWORD(v4) = v8 + 1;
        *(_DWORD *)(v2 + 292) = v8 + 1;
      }
      *(unsigned char *)(v2 + 436) = 1;
    }
    if (v4 <= 0x1F)
    {
      *(unsigned char *)(v2 + v4 + 260) = a2;
      uint64_t v9 = *(unsigned int *)(v2 + 292);
      *(_DWORD *)(v2 + 4 * v9 + 296) = *(_DWORD *)(v2 + 432);
      *(_DWORD *)(v2 + 292) = v9 + 1;
    }
    if (a2 == 36) {
      *(int32x2_t *)(v2 + 428) = vadd_s32(*(int32x2_t *)(v2 + 428), (int32x2_t)0x100000001);
    }
    ++*(_DWORD *)(v2 + 424);
    goto LABEL_21;
  }
  return result;
}

uint64_t evaluateOperator(uint64_t result, unsigned int a2)
{
  uint64_t v3 = (int32x2_t *)result;
  while (2)
  {
    while (1)
    {
      __int32 v4 = v3[36].i32[1];
      if (a2 != 35) {
        break;
      }
      if (v4) {
        goto LABEL_7;
      }
LABEL_9:
      uint64_t result = verifyOperandCount((uint64_t)v3, 1);
      int32x2_t v7 = v3[56];
      int32x2_t v8 = v3[57];
      uint64_t v9 = *(unsigned int *)(*(void *)&v7 + 12);
      *(_DWORD *)(*(void *)&v7 + 12) = v9 + 1;
      uint64_t v10 = (v3[32].i32[0] - 1);
      v3[32].i32[0] = v10;
      uint64_t v11 = *(void *)&v8 + 16 * v9;
      *(_WORD *)uint64_t v11 = 17698;
      *(void *)(v11 + 4) = -1;
      v3[58].i32[0] = v9;
      *(_DWORD *)(*(void *)&v3[57] + 16 * v3[v10].u16[1] + 4) = v9;
      uint64_t v12 = v3[32].u32[0];
      if (v12 <= 0x1F)
      {
        v3[v12].i16[0] = v3[v10].i16[0];
LABEL_30:
        v3[v3[32].u32[0]].i16[1] = v9;
        if (!WORD1(v9))
        {
LABEL_31:
          uint64_t v66 = v3[32].u32[0];
          v3[v66].i32[1] = v3[53].i32[0];
          v3[32].i32[0] = v66 + 1;
        }
      }
    }
    if (v4 && v3[32].u8[v4 - 1 + 4] >= a2)
    {
LABEL_7:
      uint64_t v5 = (v4 - 1);
      v3[36].i32[1] = v5;
      switch(v3[32].i8[v5 + 4])
      {
        case '!':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v6 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v6;
          *(_DWORD *)(*(void *)&v3[56] + 8) = v3[v6].u16[0];
          continue;
        case '""':
          goto LABEL_9;
        case '$':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v85 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v85;
          __int16 v86 = &v3[v85];
          int32x2_t v87 = v3[56];
          int32x2_t v88 = v3[57];
          uint64_t v89 = *(unsigned int *)(*(void *)&v87 + 12);
          *(_DWORD *)(*(void *)&v87 + 12) = v89 + 1;
          uint64_t v90 = *(void *)&v88 + 16 * v89;
          *(_WORD *)uint64_t v90 = 10531;
          *(void *)(v90 + 4) = -1;
          int32x2_t v91 = v3[56];
          int32x2_t v92 = v3[57];
          uint64_t v93 = *(unsigned int *)(*(void *)&v91 + 12);
          *(_DWORD *)(*(void *)&v91 + 12) = v93 + 1;
          v91.i32[0] = v86->u16[0];
          uint64_t v94 = *(void *)&v92 + 16 * v93;
          *(_WORD *)uint64_t v94 = 10276;
          *(_DWORD *)(v94 + 4) = v91.i32[0];
          *(_DWORD *)(v94 + 8) = -1;
          int32x2_t v95 = v3[57];
          *(_DWORD *)(*(void *)&v95 + 16 * v86->u16[1] + 4) = v89;
          *(_DWORD *)(*(void *)&v95 + 16 * v93 + 8) = v3[37].i32[v3[36].u32[1]];
          *(_DWORD *)(*(void *)&v3[57] + 16 * v89 + 8) = v3[37].i32[v3[36].u32[1]];
          v3[53] = vadd_s32(v3[53], (int32x2_t)-1);
          uint64_t v96 = v3[32].u32[0];
          if (v96 <= 0x1F)
          {
            v3[v96].i16[0] = v93;
            if (!WORD1(v93))
            {
              v3[v3[32].u32[0]].i16[1] = v89;
              if (!WORD1(v89))
              {
                uint64_t v97 = v3[32].u32[0];
                v3[v97].i32[1] = v3[53].i32[0];
                v3[32].i32[0] = v97 + 1;
              }
            }
          }
          return result;
        case '%':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          --v3[53].i32[0];
          return result;
        case '&':
          uint64_t result = verifyOperandCount((uint64_t)v3, 2);
          __int32 v13 = v3[32].i32[0];
          if (v13)
          {
            v3[32].i32[0] = v13 - 1;
            char v14 = &v3[v13 - 1];
            if (v13 != 1)
            {
              __int32 v15 = v13 - 2;
              v3[32].i32[0] = v15;
              unsigned int v16 = &v3[v15];
              goto LABEL_34;
            }
          }
          else
          {
            char v14 = 0;
          }
          unsigned int v16 = 0;
LABEL_34:
          if (v3[53].i32[0] == 1)
          {
            if (v3[54].i8[5])
            {
              int32x2_t v67 = v3[57];
              if (*(unsigned char *)(*(void *)&v67 + 16 * v14->u16[0]) != 50)
              {
                int32x2_t v68 = v3[56];
                uint64_t v69 = *(unsigned int *)(*(void *)&v68 + 12);
                *(_DWORD *)(*(void *)&v68 + 12) = v69 + 1;
                uint64_t v70 = *(void *)&v67 + 16 * v69;
                *(_WORD *)uint64_t v70 = 11824;
                *(void *)(v70 + 4) = -1;
                int32x2_t v71 = v3[56];
                int32x2_t v72 = v3[57];
                uint64_t v73 = *(unsigned int *)(*(void *)&v71 + 12);
                *(_DWORD *)(*(void *)&v71 + 12) = v73 + 1;
                v71.i32[0] = v14->u16[0];
                uint64_t v74 = *(void *)&v72 + 16 * v73;
                *(_WORD *)uint64_t v74 = 10790;
                *(_DWORD *)(v74 + 4) = v71.i32[0];
                *(_DWORD *)(v74 + 8) = v69;
                *(_DWORD *)(*(void *)&v3[57] + 16 * v69 + 4) = v73;
                v14->i16[0] = v73;
                if (WORD1(v73)) {
                  return result;
                }
              }
            }
          }
          int32x2_t v75 = v3[56];
          int32x2_t v76 = v3[57];
          uint64_t v77 = *(unsigned int *)(*(void *)&v75 + 12);
          *(_DWORD *)(*(void *)&v75 + 12) = v77 + 1;
          uint64_t v78 = *(void *)&v76 + 16 * v77;
          *(_WORD *)uint64_t v78 = 29489;
          *(void *)(v78 + 4) = -1;
          v76.i32[0] = v16->u16[0];
          int32x2_t v79 = v3[56];
          int32x2_t v80 = v3[57];
          uint64_t v81 = *(unsigned int *)(*(void *)&v79 + 12);
          *(_DWORD *)(*(void *)&v79 + 12) = v81 + 1;
          v79.i32[0] = v14->u16[0];
          uint64_t v82 = *(void *)&v80 + 16 * v81;
          *(_WORD *)uint64_t v82 = 31782;
          *(_DWORD *)(v82 + 4) = v76.i32[0];
          *(_DWORD *)(v82 + 8) = v79.i32[0];
          int32x2_t v83 = v3[57];
          *(_DWORD *)(*(void *)&v83 + 16 * v16->u16[1] + 4) = v77;
          *(_DWORD *)(*(void *)&v83 + 16 * v14->u16[1] + 4) = v77;
          uint64_t v84 = v3[32].u32[0];
          if (v84 <= 0x1F)
          {
            v3[v84].i16[0] = v81;
            if (!WORD1(v81))
            {
              v3[v3[32].u32[0]].i16[1] = v77;
              if (!WORD1(v77)) {
                goto LABEL_31;
              }
            }
          }
          continue;
        case '(':
          uint64_t result = verifyOperandCount((uint64_t)v3, 2);
          unsigned int v44 = v3[32].u32[0];
          uint64_t v45 = v44 - 1;
          v44 -= 2;
          v3[32].i32[0] = v44;
          *(_DWORD *)(*(void *)&v3[57] + 16 * v3[v44].u16[1] + 4) = v3[v45].u16[0];
          if (v44 > 0x1F) {
            continue;
          }
          v3[v3[32].u32[0]].i16[1] = v3[v45].i16[1];
          goto LABEL_31;
        case ')':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v17 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v17;
          uint64_t v18 = &v3[v17];
          int32x2_t v19 = v3[56];
          int32x2_t v20 = v3[57];
          uint64_t v9 = *(unsigned int *)(*(void *)&v19 + 12);
          *(_DWORD *)(*(void *)&v19 + 12) = v9 + 1;
          uint64_t v21 = *(void *)&v20 + 16 * v9;
          *(_WORD *)uint64_t v21 = 29489;
          *(void *)(v21 + 4) = -1;
          int32x2_t v22 = v3[56];
          int32x2_t v23 = v3[57];
          uint64_t v24 = *(unsigned int *)(*(void *)&v22 + 12);
          *(_DWORD *)(*(void *)&v22 + 12) = v24 + 1;
          v22.i32[0] = v18->u16[0];
          uint64_t v25 = *(void *)&v23 + 16 * v24;
          *(_WORD *)uint64_t v25 = 10790;
          *(_DWORD *)(v25 + 4) = v22.i32[0];
          *(_DWORD *)(v25 + 8) = v9;
          *(_DWORD *)(*(void *)&v3[57] + 16 * v18->u16[1] + 4) = v24;
          goto LABEL_28;
        case '*':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v46 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v46;
          uint64_t v47 = &v3[v46];
          int32x2_t v48 = v3[56];
          int32x2_t v49 = v3[57];
          uint64_t v50 = *(unsigned int *)(*(void *)&v48 + 12);
          *(_DWORD *)(*(void *)&v48 + 12) = v50 + 1;
          v48.i32[0] = v47->u16[0];
          uint64_t v51 = *(void *)&v49 + 16 * v50;
          *(_WORD *)uint64_t v51 = 10790;
          *(_DWORD *)(v51 + 4) = -1;
          *(_DWORD *)(v51 + 8) = v48.i32[0];
          *(_DWORD *)(*(void *)&v3[57] + 16 * v47->u16[1] + 4) = v50;
          uint64_t v52 = v3[32].u32[0];
          if (v52 > 0x1F) {
            continue;
          }
          v3[v52].i16[0] = v50;
          if (WORD1(v50)) {
            continue;
          }
          v3[v3[32].u32[0]].i16[1] = v50;
          goto LABEL_31;
        case '+':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v26 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v26;
          char v27 = &v3[v26];
          int32x2_t v28 = v3[56];
          int32x2_t v29 = v3[57];
          uint64_t v30 = *(unsigned int *)(*(void *)&v28 + 12);
          *(_DWORD *)(*(void *)&v28 + 12) = v30 + 1;
          uint64_t v31 = *(void *)&v29 + 16 * v30;
          *(_WORD *)uint64_t v31 = 29489;
          *(void *)(v31 + 4) = -1;
          int32x2_t v32 = v3[56];
          int32x2_t v33 = v3[57];
          uint64_t v34 = *(unsigned int *)(*(void *)&v32 + 12);
          *(_DWORD *)(*(void *)&v32 + 12) = v34 + 1;
          v32.i32[0] = v27->u16[0];
          uint64_t v35 = *(void *)&v33 + 16 * v34;
          *(_WORD *)uint64_t v35 = 11046;
          *(_DWORD *)(v35 + 4) = v32.i32[0];
          *(_DWORD *)(v35 + 8) = v30;
          *(_DWORD *)(*(void *)&v3[57] + 16 * v27->u16[1] + 4) = v34;
          goto LABEL_23;
        case ',':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v53 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v53;
          char v27 = &v3[v53];
          int32x2_t v54 = v3[56];
          int32x2_t v55 = v3[57];
          uint64_t v30 = *(unsigned int *)(*(void *)&v54 + 12);
          *(_DWORD *)(*(void *)&v54 + 12) = v30 + 1;
          v54.i32[0] = v27->u16[0];
          uint64_t v56 = *(void *)&v55 + 16 * v30;
          *(_WORD *)uint64_t v56 = 11046;
          *(_DWORD *)(v56 + 4) = -1;
          *(_DWORD *)(v56 + 8) = v54.i32[0];
          *(_DWORD *)(*(void *)&v3[57] + 16 * v27->u16[1] + 4) = v30;
LABEL_23:
          uint64_t v57 = v3[32].u32[0];
          if (v57 <= 0x1F)
          {
            v3[v57].i16[0] = v27->i16[0];
            v3[v3[32].u32[0]].i16[1] = v30;
            if (!WORD1(v30)) {
              goto LABEL_31;
            }
          }
          continue;
        case '-':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v58 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v58;
          unint64_t v37 = &v3[v58];
          int32x2_t v59 = v3[56];
          int32x2_t v60 = v3[57];
          uint64_t v9 = *(unsigned int *)(*(void *)&v59 + 12);
          *(_DWORD *)(*(void *)&v59 + 12) = v9 + 1;
          uint64_t v61 = *(void *)&v60 + 16 * v9;
          *(_WORD *)uint64_t v61 = 29489;
          *(void *)(v61 + 4) = -1;
          int32x2_t v62 = v3[56];
          int32x2_t v63 = v3[57];
          uint64_t v24 = *(unsigned int *)(*(void *)&v62 + 12);
          *(_DWORD *)(*(void *)&v62 + 12) = v24 + 1;
          v62.i32[0] = v37->u16[0];
          uint64_t v64 = *(void *)&v63 + 16 * v24;
          *(_WORD *)uint64_t v64 = 16166;
          *(_DWORD *)(v64 + 4) = v62.i32[0];
          *(_DWORD *)(v64 + 8) = v9;
          goto LABEL_27;
        case '.':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v36 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v36;
          unint64_t v37 = &v3[v36];
          int32x2_t v38 = v3[56];
          int32x2_t v39 = v3[57];
          uint64_t v9 = *(unsigned int *)(*(void *)&v38 + 12);
          *(_DWORD *)(*(void *)&v38 + 12) = v9 + 1;
          uint64_t v40 = *(void *)&v39 + 16 * v9;
          *(_WORD *)uint64_t v40 = 29489;
          *(void *)(v40 + 4) = -1;
          int32x2_t v41 = v3[56];
          int32x2_t v42 = v3[57];
          uint64_t v24 = *(unsigned int *)(*(void *)&v41 + 12);
          *(_DWORD *)(*(void *)&v41 + 12) = v24 + 1;
          v41.i32[0] = v37->u16[0];
          uint64_t v43 = *(void *)&v42 + 16 * v24;
          *(_WORD *)uint64_t v43 = 16166;
          *(_DWORD *)(v43 + 4) = v9;
          *(_DWORD *)(v43 + 8) = v41.i32[0];
LABEL_27:
          *(_DWORD *)(*(void *)&v3[57] + 16 * v37->u16[1] + 4) = v9;
LABEL_28:
          uint64_t v65 = v3[32].u32[0];
          if (v65 <= 0x1F)
          {
            v3[v65].i16[0] = v24;
            if (!WORD1(v24)) {
              goto LABEL_30;
            }
          }
          continue;
        default:
          continue;
      }
    }
    return result;
  }
}

uint64_t matchDup(uint64_t *a1, void *a2)
{
  uint64_t matched = 4294967293;
  if (a1)
  {
    if (a2)
    {
      __int32 v4 = (void *(*)(size_t))a2[1];
      if (v4)
      {
        uint64_t v5 = (void (__cdecl *)(void *))a2[2];
        if (v5)
        {
          uint64_t matched = matchInit(a1, v4, v5, a2[3]);
          if (!matched)
          {
            uint64_t matched = matchCopy(*a1, (uint64_t)a2);
            if (matched) {
              matchFree(*a1);
            }
          }
        }
      }
    }
  }
  return matched;
}

uint64_t matchCopy(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  long long v3 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 8) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  if (*(void *)(a1 + 32)) {
    return 4294967293;
  }
  uint64_t v5 = (uint64_t *)(a1 + 64);
  if (*(void *)(a1 + 64) || *(void *)(a1 + 56)) {
    return 4294967293;
  }
  if (*(void *)(a2 + 32))
  {
    int32x2_t v7 = (void *)((uint64_t (*)(void))v3)(*(void *)(a2 + 40));
    *(void *)(a1 + 32) = v7;
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 16);
      uint64_t v9 = *(const void **)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v8;
      memcpy(v7, v9, *(void *)(a2 + 40));
      if (!*(void *)(a2 + 56)) {
        goto LABEL_11;
      }
      uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t, void))(a1 + 8))(24, *(void *)(a1 + 24));
      *(void *)(a1 + 56) = v10;
      if (v10)
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a2 + 32);
        *uint64_t v10 = v11 + **(void **)(a2 + 56) - v12;
        *(_WORD *)(*(void *)(a1 + 56) + 16) = *(_WORD *)(*(void *)(a2 + 56) + 16);
        *(void *)(*(void *)(a1 + 56) + 8) = v11 + *(void *)(*(void *)(a2 + 56) + 8) - v12;
        *(_WORD *)(*(void *)(a1 + 56) + 18) = *(_WORD *)(*(void *)(a2 + 56) + 18);
LABEL_11:
        __int32 v13 = *(_DWORD **)(a2 + 64);
        if (!v13) {
          return 0;
        }
        goto LABEL_14;
      }
      (*(void (**)(void, void))(a1 + 16))(*(void *)(a1 + 32), *(void *)(a1 + 24));
    }
    return 4294967292;
  }
  __int32 v13 = *(_DWORD **)(a2 + 64);
  if (!v13) {
    return 4294967293;
  }
LABEL_14:
  uint64_t result = nfaCopy(v5, v13, *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8), *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16), *(void *)(a1 + 24), 0);
  if (!result) {
    **(void **)(a1 + 64) = a1;
  }
  return result;
}

uint64_t matchCombine(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (a2)
  {
    uint64_t result = matchCombine2(a1, a2);
    if (!a3 || result) {
      return result;
    }
  }
  else if (!a3)
  {
    return 0;
  }

  return matchCombine2(a1, a3);
}

uint64_t matchCombine2(uint64_t a1, uint64_t a2)
{
  char v14 = 0;
  __int32 v4 = *(_DWORD **)(a1 + 64);
  if (v4)
  {
    uint64_t v5 = *(_DWORD **)(a2 + 64);
    if (!v5) {
      return 4294967293;
    }
    uint64_t v6 = v5[3] + 1;
    uint64_t v7 = v6 << 31 >> 31;
    uint64_t v8 = 4294967293;
    if (v7 == v6 && (v7 & 0x8000000000000000) == 0)
    {
      uint64_t v8 = nfaCopy((uint64_t *)&v14, v4, *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8), *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16), *(void *)(a1 + 24), v7);
      if (!v8)
      {
        uint64_t v9 = (uint64_t)v14;
        uint64_t *v14 = a1;
        int v10 = *(_DWORD *)(v9 + 8);
        uint64_t v11 = *(unsigned int *)(v9 + 12);
        *(_DWORD *)(v9 + 12) = v11 + 1;
        uint64_t v12 = v9 + 16 * v11;
        *(_WORD *)(v12 + 40) = 31782;
        *(_DWORD *)(v12 + 44) = v10;
        uint64_t v8 = nfaCopyNodes(v9, (_DWORD *)(v12 + 48), v5, *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8), *(uint64_t (**)(void, uint64_t))(a1 + 16), *(void *)(a1 + 24));
        if (v8)
        {
          nfaFree(v9, *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16), *(void *)(a1 + 24));
        }
        else
        {
          *(_DWORD *)(v9 + 8) = v11;
          nfaFree(*(void *)(a1 + 64), *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16), *(void *)(a1 + 24));
          *(void *)(a1 + 64) = v9;
        }
      }
    }
    return v8;
  }
  else
  {
    return matchCopy(a1, a2);
  }
}

uint64_t verifyOperandCount(uint64_t result, int a2)
{
  if (a2)
  {
    int v2 = 0;
    unint64_t v3 = *(unsigned int *)(result + 256);
    unsigned int v4 = v3 - 1;
    unint64_t v5 = 1;
    do
    {
      if (v5 > v3 || *(_DWORD *)(result + 8 * v4 + 4) < *(_DWORD *)(result + 424)) {
        ++v2;
      }
      ++v5;
      --v4;
    }
    while (a2 + 1 != v5);
    for (; v2; --v2)
    {
      uint64_t v6 = *(void *)(result + 448);
      uint64_t v7 = *(void *)(result + 456);
      uint64_t v8 = *(unsigned int *)(v6 + 12);
      *(_DWORD *)(v6 + 12) = v8 + 1;
      uint64_t v9 = v7 + 16 * v8;
      *(_WORD *)uint64_t v9 = 25905;
      *(void *)(v9 + 4) = -1;
      uint64_t v10 = *(unsigned int *)(result + 256);
      if (v10 <= 0x1F)
      {
        *(_WORD *)(result + 8 * v10) = v8;
        if (!WORD1(v8))
        {
          *(_WORD *)(result + 8 * *(unsigned int *)(result + 256) + 2) = v8;
          uint64_t v11 = *(unsigned int *)(result + 256);
          *(_DWORD *)(result + 8 * v11 + 4) = *(_DWORD *)(result + 424);
          *(_DWORD *)(result + 256) = v11 + 1;
        }
      }
    }
  }
  return result;
}

uint64_t nfaCopy(uint64_t *a1, _DWORD *a2, uint64_t (*a3)(uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t), uint64_t a5, int a6)
{
  unsigned int v11 = a2[9] + a6;
  uint64_t v12 = a3(16 * v11 + 56, a5);
  if (!v12) {
    return 4294967292;
  }
  uint64_t v13 = v12;
  int v16 = 0;
  *(_DWORD *)(v12 + 12) = 0;
  *(void *)uint64_t v12 = *(void *)a2;
  *(_DWORD *)(v12 + 32) = 0;
  *(_DWORD *)(v12 + 36) = v11;
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  uint64_t v14 = nfaCopyNodes(v12, &v16, a2, a3, a4, a5);
  if (v14)
  {
    a4(v13, a5);
  }
  else
  {
    *(_DWORD *)(v13 + 8) = v16;
    *(void *)uint64_t v13 = 0;
    *a1 = v13;
  }
  return v14;
}

uint64_t nfaCopyNodes(uint64_t a1, _DWORD *a2, _DWORD *a3, uint64_t (*a4)(uint64_t, uint64_t), uint64_t (*a5)(void, uint64_t), uint64_t a6)
{
  if (!a3[9]) {
    return 4294967292;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 12);
  uint64_t v7 = a3[3];
  if (!v7)
  {
    *(_DWORD *)(a1 + 12) = v6;
LABEL_25:
    uint64_t result = 0;
    *a2 = a3[2] + v6;
    return result;
  }
  int32x2_t v28 = a3;
  int32x2_t v29 = a2;
  uint64_t v10 = 0;
  int v27 = *(_DWORD *)(a1 + 12);
  unint64_t v11 = a1 + 16 * v6 + 40;
  uint64_t v12 = (const void **)(a3 + 12);
  uint64_t v13 = (unsigned __int8 *)v11;
  uint64_t v14 = (unsigned __int8 *)v11;
  while (1)
  {
    *(_OWORD *)uint64_t v13 = *(_OWORD *)(v12 - 1);
    int v16 = *v14;
    v14 += 16;
    int v15 = v16;
    if (v16 <= 38)
    {
      if (v15 == 17) {
        goto LABEL_10;
      }
      if (v15 == 18)
      {
        uint64_t v17 = 8 * *((unsigned __int8 *)*v12 + 6);
        goto LABEL_12;
      }
      goto LABEL_14;
    }
    if (v15 == 39) {
      break;
    }
    if (v15 == 52)
    {
LABEL_10:
      uint64_t v17 = *((unsigned int *)*v12 + 1);
      goto LABEL_12;
    }
LABEL_14:
    ++v10;
    v12 += 2;
    uint64_t v13 = v14;
    if (v7 == v10)
    {
      LODWORD(v6) = v27;
      *(_DWORD *)(a1 + 12) += v7;
      a3 = v28;
      a2 = v29;
      if (v27)
      {
        unint64_t v21 = v11 + 16 * v7;
        do
        {
          int v22 = *(_DWORD *)(v11 + 4);
          if (v22 != -1) {
            *(_DWORD *)(v11 + 4) = v22 + v27;
          }
          if (*(unsigned char *)v11 == 38)
          {
            int v23 = *(_DWORD *)(v11 + 8);
            if (v23 != -1) {
              *(_DWORD *)(v11 + 8) = v23 + v27;
            }
          }
          v11 += 16;
        }
        while (v11 < v21);
      }
      goto LABEL_25;
    }
  }
  uint64_t v17 = 4 * *((unsigned int *)*v12 + 1);
LABEL_12:
  size_t v18 = v17 + 8;
  int32x2_t v19 = (_DWORD *)a4(v17 + 8, a6);
  if (v19)
  {
    int32x2_t v20 = v19;
    *((void *)v13 + 1) = v19;
    memcpy(v19, *v12, v18);
    *int32x2_t v20 = 1;
    goto LABEL_14;
  }
  for (; v10; --v10)
  {
    nodeModPtrRefs((unsigned __int8 *)v11, -1, a5, a6);
    v11 += 16;
  }
  return 4294967292;
}

void bzero(void *a1, size_t a2)
{
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x270ED9680](*(void *)&a1, *(void *)&a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x270ED98E8](*(void *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmem(const void *__big, size_t __big_len, const void *__little, size_t __little_len)
{
  return (void *)MEMORY[0x270EDA480](__big, __big_len, __little, __little_len);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}