void *save_encoding_state(void *result)
{
  const void *v1;

  v1 = (const void *)*((void *)result + 1);
  if (v1) {
    return memcpy(*((void **)result + 2), v1, **(void **)(*(void *)result + 24));
  }
  return result;
}

uint64_t _citrus_iconv_std_iconv_init_context(void *a1)
{
  v2 = *(size_t ****)(*a1 + 8);
  uint64_t v3 = *v2[1][3];
  uint64_t v4 = *(*v2)[3];
  v5 = (char *)malloc_type_malloc(2 * (v4 + v3) + 248, 0x8AEC8F98uLL);
  if (!v5) {
    return *__error();
  }
  v6 = v5;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_OWORD *)(v5 + 168) = 0u;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 120) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *(_OWORD *)(v5 + 88) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  unint64_t v7 = (unint64_t)(v5 + 248);
  v8 = v2[1];
  if (!v3)
  {
    *((void *)v5 + 29) = 0;
    *((void *)v5 + 30) = 0;
    *((void *)v5 + 28) = v8;
    if (v4) {
      goto LABEL_4;
    }
LABEL_7:
    v10 = *v2;
    *((void *)v6 + 26) = 0;
    *((void *)v6 + 27) = 0;
    *((void *)v6 + 25) = v10;
    goto LABEL_8;
  }
  init_encoding((size_t ***)v5 + 28, v8, v7, (size_t **)(v7 + v3));
  if (!v4) {
    goto LABEL_7;
  }
LABEL_4:
  init_encoding((size_t ***)v6 + 25, *v2, v7 + 2 * v3, (size_t **)(v7 + 2 * v3 + v4));
LABEL_8:
  uint64_t result = 0;
  a1[1] = v6;
  return result;
}

size_t ***init_encoding(size_t ***result, size_t **a2, unint64_t a3, size_t **a4)
{
  *uint64_t result = a2;
  result[1] = (size_t **)a3;
  result[2] = a4;
  if (a3 | (unint64_t)a4)
  {
    if (!a3 || !a4) {
      init_encoding_cold_1();
    }
    v6 = result;
    bzero((void *)a3, *a2[3]);
    unint64_t v7 = (uint64_t (*)(size_t **, unint64_t))(*a2)[2];
    if (!v7 || (uint64_t result = (size_t ***)v7(a2, a3), !result))
    {
      uint64_t result = (size_t ***)v6[2];
      if (result)
      {
        v8 = v6[1];
        if (v8)
        {
          size_t v9 = *(*v6)[3];
          return (size_t ***)memcpy(result, v8, v9);
        }
      }
    }
  }
  return result;
}

void _citrus_iconv_std_iconv_uninit_context(uint64_t a1)
{
}

uint64_t _citrus_iconv_std_iconv_convert(void *a1, unint64_t *a2, unint64_t *a3, uint64_t *a4, unint64_t *a5, char a6, void (**a7)(size_t **, uint64_t))
{
  unint64_t v7 = a7;
  v8 = a5;
  size_t v9 = a4;
  uint64_t v210 = *MEMORY[0x263EF8340];
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(*a1 + 8);
  v198 = 0;
  unint64_t v199 = 0;
  unint64_t v196 = 0;
  uint64_t v197 = 0;
  uint64_t v195 = 0;
  if (!a2 || (v12 = a2, (unint64_t v13 = *a2) == 0))
  {
    if (a4 && *a4)
    {
      v145 = *(const void **)(v10 + 232);
      if (v145) {
        memcpy(*(void **)(v10 + 240), v145, **(void **)(*(void *)(v10 + 224) + 24));
      }
      v146 = *(const void **)(v10 + 208);
      v170 = v7;
      if (v146)
      {
        memcpy(*(void **)(v10 + 216), v146, **(void **)(*(void *)(v10 + 200) + 24));
        uint64_t v147 = *(void *)(v10 + 208);
      }
      else
      {
        uint64_t v147 = 0;
      }
      unint64_t v196 = 0;
      unint64_t v154 = *v8;
      uint64_t v43 = (*(uint64_t (**)(void, void, unint64_t, uint64_t, unint64_t *))(**(void **)(v10 + 200) + 56))(*(void *)(v10 + 200), *v9, *v8, v147, &v196);
      if (v43) {
        goto LABEL_283;
      }
      unint64_t v155 = v196;
      if (v196 == -2) {
        goto LABEL_280;
      }
      *v9 += v196;
      unint64_t *v8 = v154 - v155;
    }
    else
    {
      uint64_t v148 = *(void *)(v10 + 208);
      if (v148)
      {
        v149 = *(size_t ***)(v10 + 200);
        bzero(*(void **)(v10 + 208), *v149[3]);
        v150 = (void (*)(size_t **, uint64_t))(*v149)[2];
        if (v150) {
          v150(v149, v148);
        }
      }
      uint64_t v151 = *(void *)(v10 + 216);
      if (v151)
      {
        v152 = *(size_t ***)(v10 + 200);
        bzero(*(void **)(v10 + 216), *v152[3]);
        v153 = (void (*)(size_t **, uint64_t))(*v152)[2];
        if (v153) {
          v153(v152, v151);
        }
      }
    }
    uint64_t v159 = *(void *)(v10 + 232);
    if (v159)
    {
      v160 = *(size_t ***)(v10 + 224);
      bzero(*(void **)(v10 + 232), *v160[3]);
      v161 = (void (*)(size_t **, uint64_t))(*v160)[2];
      if (v161) {
        v161(v160, v159);
      }
    }
    uint64_t v162 = *(void *)(v10 + 240);
    if (v162)
    {
      v163 = *(size_t ***)(v10 + 224);
      bzero(*(void **)(v10 + 240), *v163[3]);
      v158 = (void (*)(size_t **, uint64_t))(*v163)[2];
      if (!v158)
      {
LABEL_297:
        uint64_t v43 = 0;
        goto LABEL_298;
      }
      v158(v163, v162);
    }
    v158 = 0;
    goto LABEL_297;
  }
  int v180 = 0;
  uint64_t v173 = v11;
  unint64_t v14 = *(void *)(*(void *)(*(void *)(v11 + 8) + 24) + 16);
  if (v14 <= 1) {
    unint64_t v14 = 1;
  }
  v170 = a7;
  unint64_t v171 = v14;
  v186 = (size_t ***)(v10 + 224);
  unint64_t v172 = v10 + 64;
  v168 = (uint64_t *)(v10 + 200);
  unint64_t v15 = *a3;
  uint64_t v16 = v10 + 2;
  int v166 = a6 & 1;
  uint64_t v194 = v10;
  do
  {
LABEL_6:
    if (v15)
    {
      uint64_t v17 = (uint64_t)a1;
    }
    else
    {
      *(_DWORD *)v209.__mbstate8 = 0;
      int v18 = (*(uint64_t (**)(void, void, void, mbstate_t *))(**(void **)(v10 + 224) + 64))(*(void *)(v10 + 224), *(void *)(v10 + 232), 0, &v209);
      int v19 = v180;
      if (!v18) {
        int v19 = *(_DWORD *)v209.__mbstate8;
      }
      uint64_t v17 = (uint64_t)a1;
      if ((v19 - 1) < 2)
      {
        uint64_t v43 = 0;
        v158 = v198;
        unint64_t v7 = v170;
        goto LABEL_298;
      }
      int v180 = v19;
      unint64_t v13 = *v12;
    }
    unint64_t v199 = v13;
    unint64_t v196 = 0;
    uint64_t v197 = 0;
    LODWORD(v195) = 32;
    if ((*(unsigned char *)(v17 + 24) & 1) == 0)
    {
      uint64_t v20 = mbtocsx((uint64_t)v186, (uint64_t)v208, (uint64_t)v207, (uint64_t)v206, (int *)&v195, &v199, v15, &v197, *(void *)(*(void *)v17 + 80));
      int v181 = 0;
      LODWORD(v21) = v195;
      goto LABEL_51;
    }
    unint64_t v205 = 0;
    unint64_t v22 = v15;
    v23 = v8;
    unint64_t v24 = *v8;
    unint64_t v196 = *v8;
    uint64_t v25 = *v9;
    *(_OWORD *)uint64_t v10 = 0u;
    *(_OWORD *)(v10 + 16) = 0u;
    *(_OWORD *)(v10 + 32) = 0u;
    *(_OWORD *)(v10 + 48) = 0u;
    uint64_t v27 = *(void *)(v17 + 8);
    uint64_t v26 = *(void *)(v17 + 16);
    long long v28 = *(_OWORD *)(v27 + 152);
    *((_OWORD *)&v209._mbstateL + 4) = *(_OWORD *)(v27 + 136);
    *((_OWORD *)&v209._mbstateL + 5) = v28;
    long long v29 = *(_OWORD *)(v27 + 184);
    *((_OWORD *)&v209._mbstateL + 6) = *(_OWORD *)(v27 + 168);
    *((_OWORD *)&v209._mbstateL + 7) = v29;
    long long v30 = *(_OWORD *)(v27 + 88);
    *(_OWORD *)v209.__mbstate8 = *(_OWORD *)(v27 + 72);
    *((_OWORD *)&v209._mbstateL + 1) = v30;
    long long v31 = *(_OWORD *)(v27 + 120);
    *((_OWORD *)&v209._mbstateL + 2) = *(_OWORD *)(v27 + 104);
    *((_OWORD *)&v209._mbstateL + 3) = v31;
    unint64_t v182 = v22;
    BOOL v32 = v22 >= 4;
    unint64_t v33 = v22 - 4;
    if (!v32)
    {
      int v181 = 0;
      unint64_t v42 = 0;
      uint64_t v43 = 0;
      char v44 = 1;
      uint64_t v45 = v25;
      size_t v9 = a4;
      v12 = a2;
      unint64_t v15 = v182;
      v8 = v23;
      goto LABEL_28;
    }
    unint64_t v34 = 0;
    unint64_t v42 = 0;
    uint64_t v35 = (v33 >> 2) + 1;
    while (1)
    {
      int v36 = ___mb_cur_max();
      char v44 = 1;
      if (v34 > 0x1F || v42 > 6 - v36)
      {
        int v181 = 0;
        uint64_t v43 = 0;
        goto LABEL_26;
      }
      size_t v37 = wcrtomb((char *)(v27 + v42 + 64), *(_DWORD *)(v13 + 4 * v34), &v209);
      if (v37 == -1) {
        break;
      }
LABEL_22:
      v42 += v37;
      long long v38 = *((_OWORD *)&v209._mbstateL + 5);
      *(_OWORD *)(v27 + 136) = *((_OWORD *)&v209._mbstateL + 4);
      *(_OWORD *)(v27 + 152) = v38;
      long long v39 = *((_OWORD *)&v209._mbstateL + 7);
      *(_OWORD *)(v27 + 168) = *((_OWORD *)&v209._mbstateL + 6);
      *(_OWORD *)(v27 + 184) = v39;
      long long v40 = *((_OWORD *)&v209._mbstateL + 1);
      *(_OWORD *)(v27 + 72) = *(_OWORD *)v209.__mbstate8;
      *(_OWORD *)(v27 + 88) = v40;
      long long v41 = *((_OWORD *)&v209._mbstateL + 3);
      *(_OWORD *)(v27 + 104) = *((_OWORD *)&v209._mbstateL + 2);
      *(_OWORD *)(v27 + 120) = v41;
      *(_WORD *)(v194 + 2 * v34) = v42;
      v199 += 4;
      if (v35 == ++v34)
      {
        int v181 = 0;
        uint64_t v43 = 0;
        goto LABEL_24;
      }
    }
    if (*(unsigned char *)(*a1 + 72))
    {
      size_t v37 = 4;
      memset(&v209, 0, sizeof(v209));
      goto LABEL_22;
    }
    if (v42)
    {
      int v181 = 0;
      uint64_t v43 = 92;
LABEL_24:
      char v44 = 1;
LABEL_26:
      uint64_t v45 = v25;
      uint64_t v10 = v194;
      v8 = a5;
      size_t v9 = a4;
      goto LABEL_27;
    }
    v8 = a5;
    size_t v9 = a4;
    if (v26
      && (v123 = *(void (**)(void, void *(*)(void *, size_t, uint64_t), long long *, void))(v26 + 24)) != 0)
    {
      long long v204 = 0uLL;
      *(void *)&long long v203 = v25;
      *((void *)&v203 + 1) = v24;
      v123(*(unsigned int *)(v13 + 4 * v34), _citrus_iconv_std_write_mb, &v203, *(void *)(v26 + 32));
      uint64_t v43 = DWORD2(v204);
      if (DWORD2(v204))
      {
        char v44 = 0;
        unint64_t v42 = 0;
        int v181 = 1;
        goto LABEL_203;
      }
      char v44 = 0;
      v199 += 4;
      int v181 = 1;
      uint64_t v45 = v203;
      unint64_t v42 = 4;
    }
    else
    {
      int v181 = 0;
      unint64_t v42 = 0;
      uint64_t v43 = 92;
      char v44 = 1;
LABEL_203:
      uint64_t v45 = v25;
    }
    uint64_t v10 = v194;
LABEL_27:
    v12 = a2;
    unint64_t v15 = v182;
LABEL_28:
    if (v42) {
      BOOL v46 = v43 == 0;
    }
    else {
      BOOL v46 = 1;
    }
    if (v46 && v43) {
      break;
    }
    if ((v44 & 1) == 0)
    {
      uint64_t v43 = 0;
      v198 = (void (*)(size_t **, uint64_t))((char *)v198 + 1);
      unint64_t v196 = v45 - v25;
      goto LABEL_255;
    }
    unint64_t v205 = v172;
    uint64_t v17 = (uint64_t)a1;
    uint64_t v20 = mbtocsx((uint64_t)v186, (uint64_t)v208, (uint64_t)v207, (uint64_t)v206, (int *)&v195, &v205, v42, &v197, *(void *)(*a1 + 80));
    uint64_t v21 = v195;
    if ((int)v195 >= 1)
    {
      uint64_t v47 = 0;
      do
      {
        if ((v47 & 0xFFFFFFE0) != 0) {
          uint64_t v48 = v47;
        }
        else {
          uint64_t v48 = 31;
        }
        if (v47 <= 0x1F) {
          uint64_t v49 = 31;
        }
        else {
          uint64_t v49 = v47;
        }
        unsigned int v50 = (unsigned __int16)v206[v47];
        if (*(unsigned __int16 *)(v10 + 2 * v47) > v50) {
          _citrus_iconv_std_iconv_convert_cold_12();
        }
        uint64_t v51 = v47;
        while (v48 != v51)
        {
          int v52 = v51 + 1;
          BOOL v54 = v50 > (unsigned __int16)(*(_WORD *)(v16 + 2 * v51++) - 1);
          if (!v54)
          {
            __int16 v53 = v52 - 1;
            uint64_t v49 = (v52 - 1);
            goto LABEL_49;
          }
        }
        __int16 v53 = v49;
LABEL_49:
        if (*(unsigned __int16 *)(v10 + 2 * v49) > v50) {
          _citrus_iconv_std_iconv_convert_cold_13();
        }
        v206[v47++] = 4 * v53 + 4;
      }
      while (v47 != v21);
    }
LABEL_51:
    int v187 = v21;
    BOOL v54 = v197 != -2 || (int)v21 < 1;
    int v55 = v21;
    if (!v54)
    {
      uint64_t v56 = *(void *)(v10 + 232);
      if (v56)
      {
        v57 = *v186;
        bzero(*(void **)(v10 + 232), *(*v186)[3]);
        v58 = (void (*)(size_t **, uint64_t))(*v57)[2];
        if (v58) {
          v58(v57, v56);
        }
      }
      uint64_t v59 = *(void *)(v10 + 240);
      if (v59)
      {
        v60 = *v186;
        bzero(*(void **)(v10 + 240), *(*v186)[3]);
        v61 = (void (*)(size_t **, uint64_t))(*v60)[2];
        if (v61) {
          v61(v60, v59);
        }
      }
      int v55 = v195;
      uint64_t v197 = (unsigned __int16)v206[(int)v195 - 1];
      unint64_t v199 = *v12 + v197;
    }
    if (v20 != 92 || !*(unsigned char *)(*(void *)v17 + 72))
    {
      if (!v20 || v55)
      {
        if (v20) {
          goto LABEL_78;
        }
        goto LABEL_80;
      }
      unint64_t v196 = *v8;
      uint64_t v68 = iconv_std_early_fallback(v17, &v199, *v9, (uint64_t *)&v196);
      if (v68)
      {
        uint64_t v43 = v68;
        if (v68 == 2) {
          uint64_t v43 = v20;
        }
        break;
      }
      v198 = (void (*)(size_t **, uint64_t))((char *)v198 + 1);
      v69 = *(void **)(v10 + 232);
      if (v69) {
        memcpy(v69, *(const void **)(v10 + 240), **(void **)(*(void *)(v10 + 224) + 24));
      }
LABEL_84:
      uint64_t v43 = 0;
      goto LABEL_255;
    }
    v199 += v171;
    uint64_t v62 = *(void *)(v10 + 232);
    if (v62)
    {
      v63 = *v186;
      bzero(*(void **)(v10 + 232), *(*v186)[3]);
      v64 = (void (*)(size_t **, uint64_t))(*v63)[2];
      if (v64) {
        v64(v63, v62);
      }
    }
    uint64_t v65 = *(void *)(v10 + 240);
    if (v65)
    {
      v66 = *v186;
      bzero(*(void **)(v10 + 240), *(*v186)[3]);
      v67 = (void (*)(size_t **, uint64_t))(*v66)[2];
      if (v67) {
        v67(v66, v65);
      }
    }
    if (!v195)
    {
      unint64_t v13 = v199;
      v15 += *v12 - v199;
      *a3 = v15;
      unint64_t *v12 = v13;
      goto LABEL_6;
    }
LABEL_78:
    v70 = *(void **)(v10 + 232);
    if (v70) {
      memcpy(v70, *(const void **)(v10 + 240), **(void **)(*(void *)(v10 + 224) + 24));
    }
LABEL_80:
    if (v197 == -2)
    {
      *(_DWORD *)v209.__mbstate8 = 0;
      if (!(*(unsigned int (**)(void, void, void, mbstate_t *))(**(void **)(v10 + 224) + 64))(*(void *)(v10 + 224), *(void *)(v10 + 232), 0, &v209)&& (*(_DWORD *)v209.__mbstate8 - 1) < 2)
      {
        int v180 = *(_DWORD *)v209.__mbstate8;
        goto LABEL_84;
      }
LABEL_280:
      uint64_t v43 = 22;
      break;
    }
    HIDWORD(v195) = 0;
    uint64_t v71 = v207[0];
    unsigned int v72 = do_conv(v17, v173, (uint64_t)v208, (uint64_t)v207, (int *)&v195, &v198, 0, (int *)&v195 + 1);
    unsigned int v73 = v72;
    if (!v72 || !v195)
    {
      if (!v72) {
        goto LABEL_104;
      }
      if (HIDWORD(v195) == 1) {
        v198 = (void (*)(size_t **, uint64_t))((char *)v198 + 1);
      }
      if (*(unsigned char *)(*(void *)v17 + 72))
      {
        v80 = *(void **)(v10 + 208);
        if (v80) {
          memcpy(v80, *(const void **)(v10 + 216), **(void **)(*(void *)(v10 + 200) + 24));
        }
        uint64_t v43 = 0;
        unint64_t v196 = 0;
        goto LABEL_103;
      }
      unint64_t v122 = *v8;
      unint64_t v196 = *v8;
      if (HIDWORD(v195) == 1)
      {
        if (v195) {
          _citrus_iconv_std_iconv_convert_cold_11();
        }
        unsigned int v72 = iconv_std_late_fallback(v17, v71, *v9, (uint64_t *)&v196);
        if (!v72)
        {
          uint64_t v43 = 0;
LABEL_103:
          unint64_t v199 = *v12 + v206[0];
          goto LABEL_255;
        }
      }
      else if (HIDWORD(v195) == 2)
      {
        if (v199 == *v12) {
          _citrus_iconv_std_iconv_convert_cold_10();
        }
        unint64_t v199 = *v12;
        unsigned int v72 = iconv_std_early_fallback(v17, &v199, *v9, (uint64_t *)&v196);
        if (!v72)
        {
          v198 = (void (*)(size_t **, uint64_t))((char *)v198 + 1);
          restore_encoding_state((uint64_t)v186);
          goto LABEL_84;
        }
      }
      uint64_t v124 = *(void *)v17;
      if (*(unsigned char *)(*(void *)v17 + 88))
      {
        init_encoding_state(v186);
        uint64_t v43 = 92;
      }
      else
      {
        if (v72 == 2) {
          uint64_t v43 = v73;
        }
        else {
          uint64_t v43 = v72;
        }
        if (v43 == 2 && !v166)
        {
          if (*(unsigned char *)(v124 + 72) || !*(_DWORD *)(v173 + 52))
          {
            uint64_t v43 = 2;
          }
          else
          {
            uint64_t v43 = (*(uint64_t (**)(void, void, unint64_t, void, void, unint64_t *, void))(**(void **)(v10 + 200) + 48))(*(void *)(v10 + 200), *v9, v122, *(unsigned int *)(v173 + 48), *(void *)(v10 + 208), &v196, *(void *)(v124 + 80));
            if (!v43) {
              goto LABEL_255;
            }
            if (v195)
            {
              if ((__int16)v206[(int)v195 - 1] <= 0) {
                _citrus_iconv_std_iconv_convert_cold_9();
              }
              uint64_t v165 = (unsigned __int16)v206[(int)v195 - 1];
              *a3 = v15 - v165;
              *v12 += v165;
            }
          }
        }
      }
      break;
    }
    unint64_t v199 = *v12 + (unsigned __int16)v206[(int)v195 - 1];
    uint64_t v74 = *(void *)(v10 + 232);
    if (v74)
    {
      v75 = *v186;
      bzero(*(void **)(v10 + 232), *(*v186)[3]);
      v76 = (void (*)(size_t **, uint64_t))(*v75)[2];
      if (v76) {
        v76(v75, v74);
      }
    }
    uint64_t v77 = *(void *)(v10 + 240);
    if (v77)
    {
      v78 = *v186;
      bzero(*(void **)(v10 + 240), *(*v186)[3]);
      v79 = (void (*)(size_t **, uint64_t))(*v78)[2];
      if (v79) {
        v79(v78, v77);
      }
    }
    if (v199 <= *v12) {
      _citrus_iconv_std_iconv_convert_cold_8();
    }
LABEL_104:
    uint64_t v81 = *v9;
    unint64_t v169 = *v8;
    if ((*(unsigned char *)(v17 + 24) & 2) == 0)
    {
      uint64_t v82 = *(void *)(*(void *)v17 + 80);
      uint64_t v83 = *(void *)(v10 + 200);
      v84 = *(uint64_t (**)(uint64_t, uint64_t, unint64_t))(*(void *)v83 + 80);
      if (!v84 || (uint64_t v43 = v84(v83, v81, v169), v43 == 102))
      {
        v209._mbstateL = 0;
        if ((int)v195 < 1)
        {
          uint64_t v43 = 102;
        }
        else
        {
          uint64_t v85 = 0;
          unint64_t v86 = 0;
          uint64_t v188 = v81;
          unint64_t v87 = v169;
          while (1)
          {
            v88 = *(size_t ***)(v10 + 200);
            v89 = *(const void **)(v10 + 208);
            if (v89)
            {
              memcpy(*(void **)(v10 + 216), v89, *v88[3]);
              v88 = *(size_t ***)(v10 + 200);
              uint64_t v90 = *(void *)(v10 + 208);
            }
            else
            {
              uint64_t v90 = 0;
            }
            uint64_t v91 = ((uint64_t (*)(size_t **, uint64_t, unint64_t, void, void, uint64_t, mbstate_t *, uint64_t))(*v88)[4])(v88, v81, v87, v208[v85], v207[v85], v90, &v209, v82);
            if (v91)
            {
              uint64_t v43 = v91;
              LODWORD(v195) = v85;
              goto LABEL_219;
            }
            v86 += v209._mbstateL;
            v87 -= v209._mbstateL;
            if (!v87 && v85 < (int)v195 - 1) {
              break;
            }
            v81 += v209._mbstateL;
            if (++v85 >= (int)v195) {
              goto LABEL_218;
            }
          }
          LODWORD(v195) = v85 + 1;
LABEL_218:
          uint64_t v43 = 0;
          unint64_t v196 = v86;
LABEL_219:
          v12 = a2;
          uint64_t v81 = v188;
        }
      }
      int v111 = v187;
      if (v43 != 92) {
        goto LABEL_244;
      }
      if (*(unsigned char *)(*a1 + 72)) {
        BOOL v125 = 0;
      }
      else {
        BOOL v125 = v195 == 0;
      }
      if (!v125) {
        goto LABEL_230;
      }
      v198 = (void (*)(size_t **, uint64_t))((char *)v198 + 1);
      uint64_t v126 = iconv_std_late_fallback((uint64_t)a1, v207[0], v81, (uint64_t *)&v196);
      int v111 = v187;
      if (v126 == 2) {
        goto LABEL_230;
      }
      uint64_t v43 = v126;
      if (v126) {
        goto LABEL_229;
      }
      unint64_t v199 = *v12 + v206[0];
      int v127 = v195;
      goto LABEL_246;
    }
    long long v203 = 0u;
    long long v204 = 0u;
    uint64_t v92 = *(void *)(v17 + 8);
    uint64_t v167 = *(void *)(v17 + 16);
    uint64_t v189 = v81;
    uint64_t v190 = *(void *)v17;
    uint64_t v93 = *(void *)(*(void *)v17 + 8);
    memset(&v209, 0, sizeof(v209));
    unint64_t v94 = *(void *)(*(void *)(*(void *)v93 + 24) + 16);
    if (v94 <= 1) {
      unint64_t v94 = 1;
    }
    if (v94 >= 6) {
      _citrus_iconv_std_iconv_convert_cold_5();
    }
    size_t v201 = 0;
    int v175 = v195;
    if ((int)v195 <= 0)
    {
      uint64_t v43 = 0;
      LODWORD(v195) = 0;
      int v111 = v187;
      goto LABEL_200;
    }
    size_t v192 = v94;
    int v193 = 0;
    int v95 = 0;
    __int32 v202 = 0;
    uint64_t v176 = v92 + 64;
    unint64_t v96 = v169;
    unint64_t v183 = v15;
LABEL_122:
    int v200 = 1;
    v97 = &v208[v95];
    int v179 = v95;
    v98 = &v207[v95];
    uint64_t v99 = *(void *)(v190 + 80);
    uint64_t v100 = *(void *)(v92 + 200);
    v101 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v100 + 80);
    unint64_t v177 = v96;
    if (!v101)
    {
      unint64_t v205 = 0;
      goto LABEL_127;
    }
    v102 = v9;
    uint64_t v103 = v101(v100, v176, 6);
    LODWORD(v9) = v200;
    if (v103 == 102)
    {
      unint64_t v205 = 0;
      if (v200 < 1)
      {
        uint64_t v43 = 102;
        goto LABEL_137;
      }
LABEL_127:
      size_t v9 = 0;
      size_t v104 = 0;
      uint64_t v105 = v92 + 64;
      uint64_t v106 = 6;
      while (1)
      {
        v107 = *(size_t ***)(v92 + 200);
        v108 = *(const void **)(v92 + 208);
        if (v108)
        {
          memcpy(*(void **)(v92 + 216), v108, *v107[3]);
          v107 = *(size_t ***)(v92 + 200);
          uint64_t v109 = *(void *)(v92 + 208);
        }
        else
        {
          uint64_t v109 = 0;
        }
        uint64_t v110 = ((uint64_t (*)(size_t **, uint64_t, uint64_t, void, void, uint64_t, unint64_t *, uint64_t))(*v107)[4])(v107, v105, v106, v97[(void)v9], v98[(void)v9], v109, &v205, v99);
        if (v110)
        {
          uint64_t v43 = v110;
          int v200 = (int)v9;
          uint64_t v10 = v194;
          unint64_t v96 = v177;
          v102 = a4;
          goto LABEL_141;
        }
        v104 += v205;
        v106 -= v205;
        if (!v106 && (uint64_t)v9 < v200 - 1) {
          break;
        }
        v105 += v205;
        size_t v9 = (uint64_t *)((char *)v9 + 1);
        if ((uint64_t)v9 >= v200)
        {
          LODWORD(v9) = v200;
          goto LABEL_140;
        }
      }
      LODWORD(v9) = v9 + 1;
      int v200 = (int)v9;
LABEL_140:
      unint64_t v96 = v177;
      v102 = a4;
      uint64_t v43 = 0;
      size_t v201 = v104;
      uint64_t v10 = v194;
LABEL_141:
      v12 = a2;
      unint64_t v15 = v183;
    }
    else
    {
      uint64_t v43 = v103;
LABEL_137:
      uint64_t v10 = v194;
      v12 = a2;
    }
    int v111 = v187;
    if (v43) {
      BOOL v112 = v9 == 0;
    }
    else {
      BOOL v112 = 0;
    }
    if (v112)
    {
      size_t v9 = v102;
      goto LABEL_196;
    }
    size_t v113 = v201;
    if (!v201)
    {
      unint64_t v114 = v15;
LABEL_169:
      size_t v116 = v201;
LABEL_170:
      v12 = a2;
      unint64_t v15 = v114;
      int v111 = v187;
      if (v116)
      {
        size_t v9 = v102;
        if (!v96)
        {
          uint64_t v43 = 7;
LABEL_196:
          int v95 = v179;
LABEL_197:
          LODWORD(v195) = v95;
          uint64_t v81 = v189;
          if (v95 >= 1) {
            unint64_t v196 = 4 * v193;
          }
          v8 = a5;
LABEL_200:
          if (v181) {
            goto LABEL_201;
          }
LABEL_229:
          if (v43 == 92)
          {
LABEL_230:
            if (*(_DWORD *)(v173 + 52))
            {
              uint64_t v128 = v81;
              v209._mbstateL = 0;
              uint64_t v129 = *(void *)(v10 + 208);
              if (v129)
              {
                uint64_t v130 = *v168;
                bzero(*(void **)(v10 + 208), **(void **)(*v168 + 24));
                v131 = *(void (**)(uint64_t, uint64_t))(*(void *)v130 + 16);
                if (v131) {
                  v131(v130, v129);
                }
              }
              uint64_t v132 = *(void *)(v10 + 216);
              if (v132)
              {
                uint64_t v133 = *v168;
                bzero(*(void **)(v10 + 216), **(void **)(*v168 + 24));
                v134 = *(void (**)(uint64_t, uint64_t))(*(void *)v133 + 16);
                if (v134) {
                  v134(v133, v132);
                }
              }
              v209._mbstateL = 0;
              int v135 = (*(uint64_t (**)(void, unint64_t, unint64_t, void, void, mbstate_t *, void))(**(void **)(v10 + 200) + 48))(*(void *)(v10 + 200), v128 + v196, v169 - v196, *(unsigned int *)(v173 + 48), *(void *)(v10 + 208), &v209, *(void *)(*a1 + 80));
              if (v135)
              {
                uint64_t v43 = 92;
                if (v135 != 7 && v135 != 92) {
                  _citrus_iconv_std_iconv_convert_cold_4();
                }
              }
              else
              {
                uint64_t v43 = 0;
                LODWORD(v195) = v195 + 1;
                v196 += v209._mbstateL;
              }
              int v111 = v187;
            }
            else
            {
              uint64_t v43 = 92;
            }
          }
LABEL_244:
          int v127 = v195;
          if (v43 && !v195) {
            break;
          }
LABEL_246:
          if (v127 < v111)
          {
            unint64_t v199 = *v12 + (unsigned __int16)v206[v127 - 1];
            uint64_t v136 = *(void *)(v10 + 232);
            if (v136)
            {
              v137 = *v186;
              bzero(*(void **)(v10 + 232), *(*v186)[3]);
              v138 = (void (*)(size_t **, uint64_t))(*v137)[2];
              if (v138) {
                v138(v137, v136);
              }
            }
            uint64_t v139 = *(void *)(v10 + 240);
            if (v139)
            {
              v140 = *v186;
              bzero(*(void **)(v10 + 240), *(*v186)[3]);
              v141 = (void (*)(size_t **, uint64_t))(*v140)[2];
              if (v141) {
                v141(v140, v139);
              }
            }
          }
          if (v199 <= *v12) {
            _citrus_iconv_std_iconv_convert_cold_3();
          }
          unint64_t v15 = *a3;
          goto LABEL_255;
        }
      }
      else
      {
LABEL_176:
        size_t v9 = v102;
      }
LABEL_179:
      int v95 = v200 + v179;
      if (v200 + v179 >= v175) {
        goto LABEL_197;
      }
      goto LABEL_122;
    }
    unint64_t v114 = v15;
    if (!v96) {
      goto LABEL_169;
    }
    uint64_t v115 = 0;
    size_t v116 = v201;
    while (2)
    {
      if (v96 < 4) {
        goto LABEL_178;
      }
      size_t v117 = mbrtowc(&v202, (const char *)(v92 + v115 + 64), v116, &v209);
      if (v117 != -1)
      {
        size_t v118 = v192;
        if (v117 == -2) {
          _citrus_iconv_std_iconv_convert_cold_7();
        }
        size_t v119 = v201;
        if (v117 > v201) {
          _citrus_iconv_std_iconv_convert_cold_6();
        }
LABEL_156:
        if (v117 > v118) {
          size_t v118 = v117;
        }
        if (v118 >= v119) {
          size_t v118 = v119;
        }
        size_t v116 = v119 - v118;
        size_t v201 = v119 - v118;
        if (v117)
        {
          *(_DWORD *)(v189 + 4 * v193) = v202;
          v96 -= 4;
          ++v193;
        }
        v115 += v118;
        if (v116) {
          BOOL v120 = v96 == 0;
        }
        else {
          BOOL v120 = 1;
        }
        if (v120) {
          goto LABEL_170;
        }
        continue;
      }
      break;
    }
    size_t v118 = v192;
    if (*(unsigned char *)(v190 + 72))
    {
      size_t v119 = v201;
      size_t v117 = v192;
      goto LABEL_156;
    }
    if (!v167)
    {
      uint64_t v43 = 92;
LABEL_178:
      v12 = a2;
      unint64_t v15 = v114;
      size_t v9 = v102;
      int v111 = v187;
      goto LABEL_179;
    }
    v121 = *(void (**)(uint64_t, size_t, int *(*)(int *, uint64_t, uint64_t), long long *, void))(v167 + 16);
    v12 = a2;
    unint64_t v15 = v114;
    int v111 = v187;
    if (!v121)
    {
      uint64_t v43 = 92;
      goto LABEL_176;
    }
    long long v204 = 0uLL;
    *(void *)&long long v203 = v189;
    *((void *)&v203 + 1) = v177;
    v121(v176, v113, _citrus_iconv_std_write_wc, &v203, *(void *)(v167 + 32));
    uint64_t v43 = DWORD2(v204);
    if (!DWORD2(v204)) {
      unint64_t v196 = v203 - v189;
    }
    size_t v9 = v102;
    v8 = a5;
LABEL_201:
    v198 = (void (*)(size_t **, uint64_t))((char *)v198 + 1);
LABEL_255:
    unint64_t v13 = v199;
    unint64_t v142 = v199 - *v12;
    BOOL v32 = v15 >= v142;
    v15 -= v142;
    if (!v32) {
      _citrus_iconv_std_iconv_convert_cold_1();
    }
    unint64_t v143 = v196;
    unint64_t v144 = *v8 - v196;
    if (*v8 < v196) {
      _citrus_iconv_std_iconv_convert_cold_2();
    }
    *a3 = v15;
    unint64_t *v12 = v13;
    unint64_t *v8 = v144;
    *v9 += v143;
  }
  while (!v43);
LABEL_283:
  v156 = *(void **)(v10 + 232);
  if (v156) {
    memcpy(v156, *(const void **)(v10 + 240), **(void **)(*(void *)(v10 + 224) + 24));
  }
  v157 = *(void **)(v10 + 208);
  unint64_t v7 = v170;
  if (v157) {
    memcpy(v157, *(const void **)(v10 + 216), **(void **)(*(void *)(v10 + 200) + 24));
  }
  v158 = v198;
LABEL_298:
  *unint64_t v7 = v158;
  return v43;
}

uint64_t mbtocsx(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, unint64_t *a6, unint64_t a7, void *a8, uint64_t a9)
{
  uint64_t v14 = a3;
  uint64_t v15 = a2;
  uint64_t v17 = *(size_t ***)a1;
  int v18 = (uint64_t (*)(size_t **, uint64_t, uint64_t, uint64_t))(*v17)[9];
  if (!v18 || (uint64_t result = v18(v17, a2, a3, a4), result == 102))
  {
    *a8 = 0;
    uint64_t v29 = 0;
    if (*a5 < 1 || a7 == 0)
    {
      LODWORD(v21) = 0;
      uint64_t result = 102;
    }
    else
    {
      uint64_t v28 = a4;
      uint64_t v21 = 0;
      unint64_t v22 = *a6;
      unint64_t v23 = *a6;
      while (1)
      {
        unint64_t v24 = *(size_t ***)a1;
        uint64_t v25 = *(const void **)(a1 + 8);
        if (v25)
        {
          memcpy(*(void **)(a1 + 16), v25, *v24[3]);
          unint64_t v26 = *a6;
          unint64_t v24 = *(size_t ***)a1;
          uint64_t v27 = *(void *)(a1 + 8);
        }
        else
        {
          uint64_t v27 = 0;
          unint64_t v26 = v23;
        }
        uint64_t result = ((uint64_t (*)(size_t **, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, uint64_t *, uint64_t))(*v24)[3])(v24, v15, v14, a6, a7, v27, &v29, a9);
        if (result) {
          break;
        }
        if (v29 == -2)
        {
          uint64_t result = 0;
          *a8 = -2;
          break;
        }
        *a8 += v29;
        unint64_t v23 = *a6;
        if (*a6 < v26) {
          mbtocsx_cold_1();
        }
        uint64_t result = 0;
        *(_WORD *)(v28 + 2 * v21++) = v23 - v22;
        if (v21 < *a5)
        {
          v14 += 4;
          v15 += 4;
          a7 = a7 + v26 - v23;
          if (a7) {
            continue;
          }
        }
        break;
      }
    }
    if ((int)v21 < *a5) {
      *a5 = v21;
    }
  }
  return result;
}

uint64_t open_srcs(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v10 = malloc_type_malloc(0x28uLL, 0x10A0040954427F6uLL);
  if (!v10) {
    return *__error();
  }
  uint64_t v11 = v10;
  unint64_t v26 = a4;
  v10[2] = 0;
  v10[3] = v10 + 2;
  if (*(int *)(a2 + 24) < 1)
  {
    int v13 = 0;
LABEL_31:
    free(v11);
    if (v26 && v13) {
      *unint64_t v26 = v13;
    }
    return 2 * (v13 == 0);
  }
  uint64_t v12 = 0;
  int v13 = 0;
  uint64_t v28 = a1;
  while (1)
  {
    uint64_t v14 = malloc_type_malloc(0x30uLL, 0x10A00404BBE17DFuLL);
    if (!v14)
    {
      uint64_t v18 = *__error();
      if (v18) {
        goto LABEL_37;
      }
      goto LABEL_22;
    }
    uint64_t v15 = v14;
    if (*(int *)(a3 + 24) >= 1) {
      break;
    }
LABEL_20:
    free(v15);
    a1 = v28;
LABEL_22:
    if (v11[2])
    {
      *((_DWORD *)v11 + 8) = *(_DWORD *)(*(void *)(a2 + 32) + 16 * v12);
      *uint64_t v11 = 0;
      unint64_t v23 = *(void **)(a1 + 8);
      v11[1] = v23;
      void *v23 = v11;
      *(void *)(a1 + 8) = v11;
      unint64_t v24 = malloc_type_malloc(0x28uLL, 0x10A0040954427F6uLL);
      uint64_t v11 = v24;
      if (!v24)
      {
        uint64_t v18 = *__error();
        goto LABEL_37;
      }
      ++v13;
      v24[2] = 0;
      v24[3] = v24 + 2;
    }
    if (++v12 >= *(int *)(a2 + 24)) {
      goto LABEL_31;
    }
  }
  uint64_t v16 = 0;
  uint64_t v27 = (void **)(v11 + 3);
  while (1)
  {
    uint64_t v17 = _citrus_csmapper_open();
    if (v17)
    {
      uint64_t v18 = v17;
      if (v17 != 2) {
        goto LABEL_36;
      }
      goto LABEL_19;
    }
    if (*(void *)(MEMORY[0x18] + 8) != 1 || *(void *)(MEMORY[0x18] + 16) != 1 || *MEMORY[0x18])
    {
      _citrus_mapper_close();
      uint64_t v18 = 22;
LABEL_36:
      a1 = v28;
      close_dsts((uint64_t)(v11 + 2));
      free(v15);
      goto LABEL_37;
    }
    v15[2] = 0;
    *((_DWORD *)v15 + 6) = *(_DWORD *)(*(void *)(a3 + 32) + 16 * v16);
    v15[4] = 0;
    *((unsigned char *)v15 + 40) = 0;
    *a5 |= MEMORY[0x40];
    int v19 = v11 + 2;
    while (1)
    {
      int v19 = (void *)*v19;
      if (!v19) {
        break;
      }
      if (v19[4])
      {
        uint64_t v20 = v19 + 1;
        uint64_t v21 = v19[1];
        *uint64_t v15 = v19;
        v15[1] = v21;
        unint64_t v22 = (void *)v19[1];
        goto LABEL_18;
      }
    }
    *uint64_t v15 = 0;
    uint64_t v20 = v11 + 3;
    unint64_t v22 = *v27;
    v15[1] = *v27;
LABEL_18:
    *unint64_t v22 = v15;
    *uint64_t v20 = v15;
    uint64_t v15 = malloc_type_malloc(0x30uLL, 0x10A00404BBE17DFuLL);
    if (!v15) {
      break;
    }
LABEL_19:
    if (++v16 >= *(int *)(a3 + 24)) {
      goto LABEL_20;
    }
  }
  uint64_t v18 = *__error();
  close_dsts((uint64_t)(v11 + 2));
  a1 = v28;
  if (!v18) {
    goto LABEL_22;
  }
LABEL_37:
  free(v11);
  close_srcs(a1);
  return v18;
}

uint64_t _citrus_iconv_std_iconv_init_shared(uint64_t a1)
{
  long long v16 = 0u;
  memset(v15, 0, sizeof(v15));
  memset(v14, 0, sizeof(v14));
  int v13 = 0;
  v2 = (int32x2_t *)malloc_type_malloc(0x38uLL, 0x10A00402C342355uLL);
  if (!v2) {
    return *__error();
  }
  uint64_t v3 = v2;
  uint64_t v4 = _citrus_esdb_open();
  if (v4) {
    goto LABEL_11;
  }
  uint64_t v4 = _citrus_esdb_open();
  if (v4)
  {
LABEL_10:
    _citrus_esdb_close();
LABEL_11:
    free(v3);
    return v4;
  }
  uint64_t v4 = _citrus_stdenc_open();
  if (v4)
  {
LABEL_9:
    _citrus_esdb_close();
    goto LABEL_10;
  }
  uint64_t v4 = _citrus_stdenc_open();
  if (v4)
  {
LABEL_8:
    _citrus_stdenc_close();
    goto LABEL_9;
  }
  int32x2_t v5 = vrev64_s32(*(int32x2_t *)((char *)&v16 + 8));
  v3[4] = 0;
  v6 = v3 + 4;
  v3[6] = v5;
  v3[2] = 0;
  v3[3] = (int32x2_t)0xFFFFFFFFLL;
  v3[5] = (int32x2_t)&v3[4];
  uint64_t v7 = open_srcs((uint64_t)&v3[4], (uint64_t)v14, (uint64_t)v15, &v13, (_DWORD *)&v3[3] + 1);
  if (v7)
  {
    uint64_t v4 = v7;
    _citrus_stdenc_close();
    goto LABEL_8;
  }
  if (v13 == 1)
  {
    int v13 = 0;
    int32x2_t v9 = *v6;
    int32x2_t v10 = *(int32x2_t *)(*(void *)v6 + 16);
    if (v10)
    {
      int v11 = 0;
      uint64_t v12 = *(void **)(*(void *)v6 + 16);
      do
      {
        ++v11;
        uint64_t v12 = (void *)*v12;
      }
      while (v12);
      int v13 = v11;
      if (v11 == 1)
      {
        v3[2] = v10;
        v3[3].i32[0] = *(_DWORD *)(*(void *)&v9 + 32);
      }
    }
  }
  _citrus_esdb_close();
  _citrus_esdb_close();
  uint64_t v4 = 0;
  *(void *)(a1 + 8) = v3;
  return v4;
}

uint64_t _citrus_iconv_std_iconv_getops(uint64_t a1)
{
  long long v1 = _citrus_iconv_std_iconv_ops;
  long long v2 = *(_OWORD *)&off_26BD2F200;
  *(void *)(a1 + 32) = off_26BD2F210;
  *(_OWORD *)a1 = v1;
  *(_OWORD *)(a1 + 16) = v2;
  return 0;
}

void _citrus_iconv_std_iconv_uninit_shared(uint64_t a1)
{
  long long v1 = *(void **)(a1 + 8);
  if (v1)
  {
    _citrus_stdenc_close();
    _citrus_stdenc_close();
    close_srcs((uint64_t)v1 + 32);
    free(v1);
  }
}

void close_srcs(uint64_t a1)
{
  for (i = *(uint64_t **)a1; *(void *)a1; i = *(uint64_t **)a1)
  {
    uint64_t v3 = *i;
    uint64_t v4 = (void *)i[1];
    if (*i)
    {
      *(void *)(v3 + 8) = v4;
      uint64_t v4 = (void *)i[1];
    }
    else
    {
      *(void *)(a1 + 8) = v4;
    }
    *uint64_t v4 = v3;
    close_dsts((uint64_t)(i + 2));
    free(i);
  }
}

void close_dsts(uint64_t a1)
{
  for (i = *(uint64_t **)a1; *(void *)a1; i = *(uint64_t **)a1)
  {
    uint64_t v3 = *i;
    uint64_t v4 = (void *)i[1];
    if (*i)
    {
      *(void *)(v3 + 8) = v4;
      uint64_t v4 = (void *)i[1];
    }
    else
    {
      *(void *)(a1 + 8) = v4;
    }
    *uint64_t v4 = v3;
    _citrus_mapper_close();
    free(i);
  }
}

void init_encoding_state(size_t ***a1)
{
  long long v2 = a1[1];
  if (v2)
  {
    uint64_t v3 = *a1;
    bzero(a1[1], *(*a1)[3]);
    uint64_t v4 = (void (*)(size_t **, size_t **))(*v3)[2];
    if (v4) {
      v4(v3, v2);
    }
  }
  int32x2_t v5 = a1[2];
  if (v5)
  {
    v6 = *a1;
    bzero(v5, *v6[3]);
    uint64_t v7 = (void (*)(size_t **, size_t **))(*v6)[2];
    if (v7)
    {
      v7(v6, v5);
    }
  }
}

uint64_t iconv_std_early_fallback(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return 2;
  }
  int32x2_t v5 = *(void (**)(void, uint64_t, uint64_t (*)(uint64_t, unint64_t, void *), void *, void))v4;
  if (!*(void *)v4) {
    return 2;
  }
  uint64_t v9 = *a4;
  v11[0] = a3;
  v11[1] = v9;
  v11[2] = a1;
  uint64_t v12 = 0;
  v5(*a2, 1, _citrus_iconv_std_write_uc, v11, *(void *)(v4 + 32));
  uint64_t result = v12;
  if (!v12)
  {
    ++*a2;
    *a4 = v11[0] - a3;
  }
  return result;
}

void *restore_encoding_state(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 8);
  if (result) {
    return memcpy(result, *(const void **)(a1 + 16), **(void **)(*(void *)a1 + 24));
  }
  return result;
}

uint64_t do_conv(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, void *a6, int a7, int *a8)
{
  uint64_t v12 = a3;
  uint64_t v13 = a2;
  uint64_t v15 = *a5;
  int v43 = *a5;
  int v44 = 0;
  if (*(void *)(a2 + 16) && (a7 & 1) == 0)
  {
    if ((int)v15 >= 1)
    {
      uint64_t v16 = 0;
      while (*(_DWORD *)(a3 + 4 * v16) == *(_DWORD *)(a2 + 24))
      {
        if (v15 == ++v16) {
          goto LABEL_55;
        }
      }
      *a5 = v16;
      int v43 = v16;
      if (!v16) {
        return 2;
      }
      LODWORD(v15) = v16;
LABEL_55:
      if ((int)v15 >= 1)
      {
        int v29 = 0;
        int v30 = 0;
        while (1)
        {
          uint64_t result = do_conv_map_one(*(void *)(v13 + 16), (_DWORD *)(v12 + 4 * v30), (_DWORD *)(a4 + 4 * v30), &v43, &v44, a8);
          if (result != 35) {
            break;
          }
          if (v43 <= 0) {
            do_conv_cold_6();
          }
          if (!*(unsigned char *)(*(void *)a1 + 73))
          {
            *a5 = v43 + v29 - 1;
            return 2;
          }
          v29 += v43;
          *(_DWORD *)(a4 + 4 * (v29 - 1)) = v44;
          int v31 = *a5;
          int v43 = *a5 - v29;
          if (a6) {
            ++*a6;
          }
          v30 += v29;
          if (v31 <= v29) {
            return 2;
          }
        }
        if (!result)
        {
          if (v43 + v29 != *a5) {
            do_conv_cold_5();
          }
          return 0;
        }
        if (v43 + v29 >= *a5) {
          do_conv_cold_4();
        }
        *a5 = v43 + v29;
        if (result != 2) {
          return result;
        }
      }
    }
    return 2;
  }
  if (!v15) {
    return 0;
  }
  int v17 = 0;
  int v18 = 0;
  int v19 = 0;
LABEL_10:
  while (2)
  {
    uint64_t v20 = (int *)(v12 + 4 * v19);
    int v38 = v18;
    int v39 = v19;
    if (a7)
    {
      int v40 = 0;
      LODWORD(v21) = v15;
    }
    else
    {
      int v40 = *v20;
      if ((int)v15 < 1)
      {
        LODWORD(v21) = 0;
      }
      else
      {
        uint64_t v21 = 0;
        do
        {
          if (v20[v21] != *v20) {
            break;
          }
          ++v21;
        }
        while (v19 + v21 < v19 + (int)v15);
      }
    }
    unint64_t v22 = *(uint64_t **)(v13 + 32);
    if (!v22)
    {
LABEL_70:
      *a5 = v38;
      return 2;
    }
    char v23 = 0;
    unint64_t v24 = (_DWORD *)(a4 + 4 * v19);
    int v25 = v40;
    while ((a7 & 1) == 0 && *((_DWORD *)v22 + 8) != *v20)
    {
LABEL_43:
      unint64_t v22 = (uint64_t *)*v22;
      if (!v22)
      {
        if ((v23 & 1) != 0 && *(unsigned char *)(*(void *)a1 + 73))
        {
          *unint64_t v24 = v44;
          *uint64_t v20 = v40;
          if (a6) {
            ++*a6;
          }
          int v18 = v38 + 1;
          int v19 = v39 + 1;
          LODWORD(v15) = v15 - 1;
          uint64_t v13 = a2;
          uint64_t v12 = a3;
          if (!v15) {
            return 0;
          }
          goto LABEL_10;
        }
        goto LABEL_70;
      }
    }
    unint64_t v26 = (void *)v22[2];
    if (!v26)
    {
LABEL_38:
      if (v23)
      {
        char v23 = 1;
      }
      else
      {
        if (!a7 || v17) {
          goto LABEL_70;
        }
        char v23 = 0;
      }
      goto LABEL_43;
    }
    while (1)
    {
      if (a7)
      {
        if ((*(unsigned char *)(v26[2] + 64) & 1) == 0) {
          goto LABEL_37;
        }
        int v25 = *((_DWORD *)v22 + 8);
      }
      int v42 = v21;
      uint64_t result = do_conv_map_one((uint64_t)v26, v20, v24, &v42, &v44, a8);
      if (result != 35 && (result & 0x7D) != 0)
      {
        *a5 = v42 + v38;
        return result;
      }
      int v28 = v42;
      if (result)
      {
        if (result == 35)
        {
          if (v42 <= 0) {
            do_conv_cold_3();
          }
          int v28 = --v42;
          char v23 = 1;
          int v40 = v25;
        }
        else if (v42 >= (int)v21)
        {
          do_conv_cold_2();
        }
      }
      else
      {
        if (v42 != v21) {
          do_conv_cold_1();
        }
        char v23 = 0;
        int v28 = v21;
      }
      ++v17;
      if (v28 >= 1) {
        break;
      }
LABEL_37:
      unint64_t v26 = (void *)*v26;
      if (!v26) {
        goto LABEL_38;
      }
    }
    int v18 = v28 + v38;
    int v19 = v28 + v39;
    LODWORD(v15) = v15 - v28;
    uint64_t v13 = a2;
    uint64_t v12 = a3;
    if (v15) {
      continue;
    }
    return 0;
  }
}

uint64_t iconv_std_late_fallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return 2;
  }
  int32x2_t v5 = *(void (**)(uint64_t, void *(*)(void *, size_t, uint64_t), void *, void))(v4 + 8);
  if (!v5) {
    return 2;
  }
  uint64_t v8 = *a4;
  v10[0] = a3;
  v10[1] = v8;
  v10[2] = a1;
  uint64_t v11 = 0;
  v5(a2, _citrus_iconv_std_write_mb, v10, *(void *)(v4 + 32));
  uint64_t result = v11;
  if (!v11) {
    *a4 = v10[0] - a3;
  }
  return result;
}

void *_citrus_iconv_std_write_mb(void *__src, size_t __n, uint64_t a3)
{
  if (!*(_DWORD *)(a3 + 24))
  {
    if (*(void *)(a3 + 8) >= __n)
    {
      __src = memcpy(*(void **)a3, __src, __n);
      size_t v5 = *(void *)(a3 + 8) - __n;
      *(void *)a3 += __n;
      *(void *)(a3 + 8) = v5;
    }
    else
    {
      *(_DWORD *)(a3 + 24) = 7;
    }
  }
  return __src;
}

uint64_t _citrus_iconv_std_write_uc(uint64_t result, unint64_t a2, void *a3)
{
  if (!*((_DWORD *)a3 + 6))
  {
    unint64_t v4 = a2;
    if (a2 >> 31)
    {
      *((_DWORD *)a3 + 6) = 7;
      return result;
    }
    size_t v5 = (unsigned int *)result;
    v6 = (void *)a3[2];
    uint64_t v7 = v6[1];
    uint64_t v8 = *(_DWORD **)(*v6 + 8);
    if (v8[7] != 2)
    {
      int v11 = a2;
      uint64_t result = do_conv((uint64_t)v6, (uint64_t)v8, 0, result, &v11, 0, 1, 0);
      if (result) {
        goto LABEL_6;
      }
      unint64_t v4 = v11;
    }
    if (v4)
    {
      while (1)
      {
        uint64_t v12 = 0;
        uint64_t result = (*(uint64_t (**)(void, void, void, void, void, uint64_t *, void))(**(void **)(v7 + 200) + 48))(*(void *)(v7 + 200), *a3, a3[1], *v5, *(void *)(v7 + 208), &v12, *(void *)(*v6 + 80));
        if (result != 92) {
          goto LABEL_14;
        }
        if (!*(unsigned char *)(*v6 + 72)) {
          break;
        }
LABEL_16:
        ++v5;
        if (!--v4) {
          return result;
        }
      }
      uint64_t v9 = *a3;
      uint64_t v12 = a3[1];
      uint64_t result = iconv_std_late_fallback((uint64_t)v6, *v5, v9, &v12);
      if (result == 2)
      {
        if (!v8[13])
        {
          uint64_t result = 2;
LABEL_6:
          *((_DWORD *)a3 + 6) = result;
          return result;
        }
        uint64_t result = (*(uint64_t (**)(void, void, void, void, void, uint64_t *, void))(**(void **)(v7 + 200) + 48))(*(void *)(v7 + 200), *a3, a3[1], v8[12], *(void *)(v7 + 208), &v12, *(void *)(*v6 + 80));
      }
LABEL_14:
      if (result) {
        goto LABEL_6;
      }
      uint64_t v10 = a3[1] - v12;
      *a3 += v12;
      a3[1] = v10;
      goto LABEL_16;
    }
  }
  return result;
}

uint64_t do_conv_map_one(uint64_t a1, _DWORD *a2, _DWORD *a3, int *a4, _DWORD *a5, int *a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 40))
  {
    if (*a4 >= 1)
    {
      uint64_t v9 = 0;
      do
        a2[v9++] = *(_DWORD *)(a1 + 24);
      while (v9 < *a4);
    }
    return 0;
  }
  else
  {
    uint64_t v13 = a3;
    v21[0] = v22;
    v21[1] = a3;
    v21[2] = a4;
    v21[3] = 0;
    unsigned int v14 = (*(uint64_t (**)(void, void *))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), v21);
    unint64_t v15 = (int)v14 & 0xFFFFFFFF9FFFFFFFLL;
    LODWORD(v16) = *a4;
    if (v15 == 6)
    {
      LODWORD(v16) = v16 - 1;
      *a5 = v22[(int)v16];
      v22[(int)v16] = v13[(int)v16];
    }
    if ((int)v16 >= 1)
    {
      uint64_t v16 = v16;
      int v17 = v22;
      int v18 = a2;
      do
      {
        if (a2) {
          *int v18 = *(_DWORD *)(a1 + 24);
        }
        int v19 = *v17++;
        *v13++ = v19;
        ++v18;
        --v16;
      }
      while (v16);
    }
    if ((v14 & 0x9FFFFFFD) != 0 && v15 != 3)
    {
      int v20 = (v14 >> 29) & 3;
      if (!v20) {
        do_conv_map_one_cold_1();
      }
      if ((((v14 >> 29) - 1) & v20) != 0) {
        do_conv_map_one_cold_2();
      }
      if (a6) {
        *a6 = v20;
      }
    }
    if (v15 > 6) {
      return 2;
    }
    else {
      return dword_26364EF3C[v15];
    }
  }
}

int *_citrus_iconv_std_write_wc(int *result, uint64_t a2, uint64_t a3)
{
  if (!*(_DWORD *)(a3 + 24))
  {
    unint64_t v3 = *(void *)(a3 + 8);
    if (v3 >= 4 * a2)
    {
      if (a2)
      {
        uint64_t v4 = 4 * a2;
        size_t v5 = *(_DWORD **)a3;
        do
        {
          int v6 = *result++;
          *v5++ = v6;
          --a2;
        }
        while (a2);
        *(void *)a3 = v5;
        *(void *)(a3 + 8) = v3 - v4;
      }
    }
    else
    {
      *(_DWORD *)(a3 + 24) = 7;
    }
  }
  return result;
}

void _citrus_iconv_std_iconv_convert_cold_1()
{
  __assert_rtn("_citrus_iconv_std_iconv_convert", "citrus_iconv_std.c", 1916, "tmpin - *in <= *inbytes");
}

void _citrus_iconv_std_iconv_convert_cold_2()
{
  __assert_rtn("_citrus_iconv_std_iconv_convert", "citrus_iconv_std.c", 1917, "szrout <= *outbytes");
}

void _citrus_iconv_std_iconv_convert_cold_3()
{
}

void _citrus_iconv_std_iconv_convert_cold_4()
{
  __assert_rtn("_citrus_iconv_std_iconv_convert", "citrus_iconv_std.c", 1884, "nret == EILSEQ");
}

void _citrus_iconv_std_iconv_convert_cold_5()
{
}

void _citrus_iconv_std_iconv_convert_cold_6()
{
  __assert_rtn("iconv_std_mbtowc", "citrus_iconv_std.c", 484, "wcsz <= tmpsz");
}

void _citrus_iconv_std_iconv_convert_cold_7()
{
  __assert_rtn("iconv_std_mbtowc", "citrus_iconv_std.c", 446, "wcsz != (size_t)-2");
}

void _citrus_iconv_std_iconv_convert_cold_8()
{
}

void _citrus_iconv_std_iconv_convert_cold_9()
{
}

void _citrus_iconv_std_iconv_convert_cold_10()
{
  __assert_rtn("_citrus_iconv_std_iconv_convert", "citrus_iconv_std.c", 1715, "tmpin != *in");
}

void _citrus_iconv_std_iconv_convert_cold_11()
{
  __assert_rtn("_citrus_iconv_std_iconv_convert", "citrus_iconv_std.c", 1725, "tmpcnt == 0");
}

void _citrus_iconv_std_iconv_convert_cold_12()
{
  __assert_rtn("iconv_std_delta_remap", "citrus_iconv_std.c", 258, "wcdelta[i] <= curmb");
}

void _citrus_iconv_std_iconv_convert_cold_13()
{
  __assert_rtn("iconv_std_delta_remap", "citrus_iconv_std.c", 264, "wcdelta[j] <= curmb");
}

void init_encoding_cold_1()
{
  __assert_rtn("init_encoding", "citrus_iconv_std.c", 578, "(se->se_ps == NULL && se->se_pssaved == NULL) || (se->se_ps != NULL && se->se_pssaved != NULL)");
}

void mbtocsx_cold_1()
{
  __assert_rtn("mbtocsx", "citrus_iconv_std.c", 310, "*s >= last");
}

void do_conv_cold_1()
{
  __assert_rtn("do_conv", "citrus_iconv_std.c", 977, "elen == len");
}

void do_conv_cold_2()
{
}

void do_conv_cold_3()
{
}

void do_conv_cold_4()
{
}

void do_conv_cold_5()
{
  __assert_rtn("do_conv", "citrus_iconv_std.c", 884, "tmpcnt + total == *cnt");
}

void do_conv_cold_6()
{
}

void do_conv_map_one_cold_1()
{
  __assert_rtn("do_conv_map_one", "citrus_iconv_std.c", 816, "dir != 0");
}

void do_conv_map_one_cold_2()
{
}

int ___mb_cur_max(void)
{
  return MEMORY[0x270ED7D70]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _citrus_csmapper_open()
{
  return MEMORY[0x270F99420]();
}

uint64_t _citrus_esdb_close()
{
  return MEMORY[0x270F99448]();
}

uint64_t _citrus_esdb_open()
{
  return MEMORY[0x270F99450]();
}

uint64_t _citrus_mapper_close()
{
  return MEMORY[0x270F99460]();
}

uint64_t _citrus_stdenc_close()
{
  return MEMORY[0x270F99498]();
}

uint64_t _citrus_stdenc_open()
{
  return MEMORY[0x270F994A0]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

size_t mbrtowc(__int32 *a1, const char *a2, size_t a3, mbstate_t *a4)
{
  return MEMORY[0x270EDA438](a1, a2, a3, a4);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}