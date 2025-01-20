void start(int a1, char **a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char **v9;
  const char *v10;
  int v11;
  size_t v12;
  unsigned char *v13;
  int i;
  mach_port_t v15;
  mach_error_t v16;
  mach_msg_type_number_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  mach_zone_name_array_t v21;
  mach_zone_info_array_t v22;
  const char *v23;
  size_t v24;
  void *v25;
  mach_zone_name_t *v26;
  size_t v27;
  int v28;
  size_t v29;
  const char *v30;
  uint64_t mzi_cur_size;
  unsigned int v32;
  uint64_t v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  size_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  mach_zone_name_t *v54;
  mach_zone_info_t *v55;
  BOOL v56;
  mach_zone_info_array_t v57;
  uint64_t v58;
  unsigned char *v59;
  mach_zone_name_t *v60;
  mach_zone_info_array_t v61;
  int v62;
  uint64_t v63;
  mach_zone_info_t *v64;
  mach_zone_name_t *v65;
  mach_zone_info_array_t v66;
  int v67;
  mach_zone_name_t *v68;
  unsigned char *v69;
  long long v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  long long v77;
  long long v78;
  long long v79;
  long long v80;
  long long v81;
  long long v82;
  long long v83;
  long long v84;
  char v85;
  uint64_t j;
  uint64_t v87;
  int v88;
  char *v89;
  mach_zone_name_array_t v90;
  mach_zone_info_array_t v91;
  int (__cdecl *v92)(void *, const void *, const void *);
  uint64_t v93;
  mach_error_t v94;
  FILE **v95;
  FILE *v96;
  FILE *v97;
  FILE *v98;
  BOOL v99;
  void *v100;
  int v101;
  char v102;
  int v103;
  int v104;
  uint64_t mzi_exhaustible;
  int64x2_t v106;
  uint64_t mzi_collectable;
  uint64_t mzi_sum_size;
  uint64_t mzi_max_size;
  long long v110;
  char **v111;
  uint64_t v112;
  mach_zone_name_array_t v113;
  int v114;
  unsigned char *v115;
  uint64_t v116;
  mach_msg_type_number_t memory_infoCnt;
  mach_memory_info_array_t memory_info;
  mach_msg_type_number_t infoCnt;
  mach_zone_info_array_t info;
  mach_msg_type_number_t namesCnt;
  mach_zone_name_array_t names;
  char __s[16];
  long long v124;
  long long v125;
  long long v126;
  long long v127;
  long long __s1;
  long long v129;
  long long v130;
  long long v131;
  long long v132;

  names = 0;
  namesCnt = 0;
  info = 0;
  infoCnt = 0;
  memory_info = 0;
  memory_infoCnt = 0;
  v116 = 0;
  signal(2, (void (__cdecl *)(int))sub_100005344);
  v4 = *a2;
  v5 = strrchr(*a2, 47);
  if (v5) {
    v6 = (uint64_t)(v5 + 1);
  }
  else {
    v6 = (uint64_t)v4;
  }
  qword_10000C1F8 = v6;
  v7 = 1;
  if (a1 < 2) {
    goto LABEL_41;
  }
  v8 = 0;
  v114 = dword_10000C030;
  v111 = a2;
  v9 = a2 + 1;
  while (1)
  {
    v10 = v9[v8];
    if (!strcmp(v10, "-d"))
    {
      byte_10000C200 = 1;
    }
    else if (!strcmp(v10, "-t"))
    {
      byte_10000C204 = 1;
    }
    else if (!strcmp(v10, "-T"))
    {
      byte_10000C204 = 0;
    }
    else if (!strcmp(v10, "-w"))
    {
      byte_10000C208 = 1;
    }
    else if (!strcmp(v10, "-W"))
    {
      byte_10000C208 = 0;
    }
    else if (!strcmp(v10, "-l"))
    {
      byte_10000C20C = 0;
    }
    else if (!strcmp(v10, "-L"))
    {
      byte_10000C20C = 1;
    }
    else if (!strcmp(v10, "-s"))
    {
      byte_10000C210 = 1;
    }
    else if (!strcmp(v10, "-S"))
    {
      byte_10000C210 = 0;
    }
    else if (!strcmp(v10, "-c"))
    {
      byte_10000C214 = 0;
    }
    else if (!strcmp(v10, "-C"))
    {
      byte_10000C214 = 1;
    }
    else
    {
      if (!strcmp(v10, "-h"))
      {
        v95 = &__stdoutp;
        goto LABEL_177;
      }
      if (!strcmp(v10, "-H"))
      {
        byte_10000C218 = 1;
      }
      else
      {
        if (!strcmp(v10, "-k"))
        {
          v11 = v114 | 0x1E;
        }
        else if (!strcmp(v10, "-kt"))
        {
          v11 = v114 | 0x1C;
        }
        else
        {
          if (strcmp(v10, "-kd"))
          {
            if (!strcmp(v10, "--"))
            {
              v7 = v8 + 2;
LABEL_40:
              a2 = v111;
LABEL_41:
              if (a1 - v7 == 1)
              {
                qword_10000C220 = (uint64_t)a2[v7];
                v12 = strlen((const char *)qword_10000C220);
                goto LABEL_45;
              }
              if (a1 == v7)
              {
                v12 = 0;
                qword_10000C220 = (uint64_t)"";
LABEL_45:
                qword_10000C228 = v12;
                if (byte_10000C200 == 1)
                {
                  byte_10000C210 = 0;
                  byte_10000C214 = 0;
                  byte_10000C218 = 0;
                }
                if (byte_10000C208 == 1)
                {
                  byte_10000C190 = 1;
                  byte_10000C1B0 = 1;
                }
                if (byte_10000C204 == 1) {
                  byte_10000C1D0 = 1;
                }
                v13 = 0;
                v100 = 0;
                v99 = 0;
                v102 = 0;
                for (i = 1; ; i = 0)
                {
                  v15 = mach_host_self();
                  v16 = mach_memory_info(v15, &names, &namesCnt, &info, &infoCnt, &memory_info, &memory_infoCnt);
                  if (v16) {
                    break;
                  }
                  v17 = namesCnt;
                  if (namesCnt != infoCnt)
                  {
                    fprintf(__stderrp, "%s: mach_zone_name/ mach_zone_info: counts not equal?\n");
                    goto LABEL_180;
                  }
                  if (dword_10000C030 != 1)
                  {
                    qword_10000C1D8 = (uint64_t)malloc_type_calloc(0x24uLL, 0x50uLL, 0x10000404247E4FDuLL);
                    v18 = malloc_type_calloc(0x24uLL, 0x40uLL, 0x1000040FA0F61DDuLL);
                    qword_10000C1E0 = (uint64_t)v18;
                    if (!qword_10000C1D8 || !v18)
                    {
                      fprintf(__stderrp, "%s: calloc failed to allocate memory\n");
                      goto LABEL_180;
                    }
                    v17 += 36;
                  }
                  if (i)
                  {
                    v13 = malloc_type_malloc(v17, 0xB79C1441uLL);
                    v100 = malloc_type_malloc((unint64_t)infoCnt << 6, 0x1000040FA0F61DDuLL);
                    v19 = infoCnt;
                    qword_10000C1E8 = (uint64_t)&v13[infoCnt];
                    if (!v13 || !v100) {
                      goto LABEL_174;
                    }
                  }
                  else
                  {
                    v19 = infoCnt;
                  }
                  v101 = i;
                  if ((int)v19 < 1)
                  {
                    v103 = 0;
                  }
                  else
                  {
                    v20 = 0;
                    v103 = 0;
                    v21 = names;
                    v22 = info;
                    v23 = (const char *)qword_10000C220;
                    v24 = qword_10000C228;
                    v113 = names;
                    v115 = v13;
                    v25 = v100;
                    v112 = v19;
                    do
                    {
                      v13[v20] = 0;
                      v26 = &v113[v20];
                      v27 = strnlen(v26->mzn_name, 0x50uLL);
                      if (v24 > v27) {
                        goto LABEL_66;
                      }
                      v29 = v27 + 1;
                      v30 = (const char *)v21;
                      while (strncmp(v23, v30, v24))
                      {
                        --v29;
                        ++v30;
                        if (v24 == v29)
                        {
                          v28 = 0;
                          v13 = v115;
                          goto LABEL_76;
                        }
                      }
                      mzi_cur_size = v22->mzi_cur_size;
                      v13 = v115;
                      if ((v102 & 1) != 0
                        && mzi_cur_size <= v25[1]
                        && (byte_10000C204 != 1 || v25[5] >= v22->mzi_sum_size >> 1))
                      {
LABEL_66:
                        v28 = 0;
                        goto LABEL_76;
                      }
                      v25[1] = mzi_cur_size;
                      v25[5] = v22->mzi_sum_size;
                      v28 = 1;
                      v115[v20] = 1;
                      v103 = 1;
LABEL_76:
                      v32 = dword_10000C030;
                      if (dword_10000C030 != 1)
                      {
                        v104 = v28;
                        v33 = 0;
                        *(_OWORD *)__s = *(_OWORD *)v26->mzn_name;
                        v34 = *(_OWORD *)&v26->mzn_name[16];
                        v35 = *(_OWORD *)&v26->mzn_name[32];
                        v36 = *(_OWORD *)&v26->mzn_name[64];
                        v126 = *(_OWORD *)&v26->mzn_name[48];
                        v127 = v36;
                        v124 = v34;
                        v125 = v35;
                        v106 = *(int64x2_t *)&v22->mzi_count;
                        v110 = *(_OWORD *)&v22->mzi_elem_size;
                        mzi_sum_size = v22->mzi_sum_size;
                        mzi_max_size = v22->mzi_max_size;
                        mzi_exhaustible = v22->mzi_exhaustible;
                        v37 = *(_OWORD *)&v26->mzn_name[48];
                        v130 = *(_OWORD *)&v26->mzn_name[32];
                        v131 = v37;
                        v132 = *(_OWORD *)&v26->mzn_name[64];
                        v38 = *(_OWORD *)&v26->mzn_name[16];
                        mzi_collectable = v22->mzi_collectable;
                        __s1 = *(_OWORD *)v26->mzn_name;
                        v129 = v38;
                        while (1)
                        {
                          v39 = strlen(*((const char **)&off_10000C000 + v33 + 1));
                          if (!strncmp((const char *)&__s1, *((const char **)&off_10000C000 + v33 + 1), v39)) {
                            break;
                          }
                          if (++v33 == 5) {
                            goto LABEL_88;
                          }
                        }
                        if ((v32 >> v33))
                        {
                          v40 = qword_10000C1F0;
                          v41 = qword_10000C1E0;
                          v13 = v115;
                          if (!qword_10000C1F0) {
                            goto LABEL_87;
                          }
                          v42 = 0;
                          v43 = (uint64_t *)(qword_10000C1E0 + 24);
                          do
                          {
                            v44 = *v43;
                            v43 += 8;
                            if (v44 == (void)v110)
                            {
                              v45 = v104;
                              goto LABEL_90;
                            }
                            ++v42;
                          }
                          while (qword_10000C1F0 != v42);
                          if ((unint64_t)qword_10000C1F0 >= 0x23) {
                            __assert_rtn("get_kalloc_info_idx", "zprint.c", 809, "kalloc_info_idx < KALLOC_SIZECLASSES - 1");
                          }
LABEL_87:
                          ++qword_10000C1F0;
                          v45 = v115[v20];
                          v42 = v40;
LABEL_90:
                          v46 = qword_10000C1D8;
                          if (v45)
                          {
                            *(unsigned char *)(qword_10000C1E8 + v42) = 1;
                            v115[v20] = 0;
                          }
                          *(int64x2_t *)(v41 + (v42 << 6)) = vaddq_s64(*(int64x2_t *)(v41 + (v42 << 6)), v106);
                          if (v42 == qword_10000C1F0 - 1)
                          {
                            v47 = v41;
                            v48 = strlen(__s);
                            if (v48)
                            {
                              v49 = mzi_exhaustible;
                              while (__s[v48] != 46)
                              {
                                if (!--v48)
                                {
                                  v50 = 0;
                                  goto LABEL_100;
                                }
                              }
                              v50 = &__s[v48 + 1];
                            }
                            else
                            {
                              v50 = 0;
                              v49 = mzi_exhaustible;
                            }
LABEL_100:
                            snprintf((char *)(v46 + 80 * v42), 0x50uLL, "kalloc.%s", v50);
                            v41 = v47;
                            v51 = v47 + (v42 << 6);
                            *(_OWORD *)(v51 + 24) = v110;
                            *(void *)(v51 + 48) = v49;
                            v23 = (const char *)qword_10000C220;
                            v24 = qword_10000C228;
                          }
                          if (mzi_collectable) {
                            *(void *)(v41 + (v42 << 6) + 56) = ((*(void *)(v41 + (v42 << 6) + 56) & 0xFFFFFFFFFFFFFFFELL)
                          }
                                                                + mzi_collectable) & 0xFFFFFFFFFFFFFFFELL | *(void *)(v41 + (v42 << 6) + 56) & 1;
                          v52 = v41 + (v42 << 6);
                          *(void *)(v52 + 40) += mzi_sum_size;
                          *(void *)(v52 + 16) += mzi_max_size;
                        }
                        else
                        {
LABEL_88:
                          v13 = v115;
                        }
                      }
                      ++v22;
                      v25 += 8;
                      ++v20;
                      ++v21;
                    }
                    while (v20 != v112);
                  }
                  if (byte_10000C210 == 1)
                  {
                    v53 = infoCnt;
                    v99 = dword_10000C030 != 1;
                    if (dword_10000C030 == 1)
                    {
                      v54 = names;
                      v57 = info;
                    }
                    else
                    {
                      v54 = (mach_zone_name_t *)malloc_type_malloc(80 * (infoCnt + 36), 0x10000404247E4FDuLL);
                      v55 = (mach_zone_info_t *)malloc_type_malloc((unint64_t)(v53 + 36) << 6, 0x1000040FA0F61DDuLL);
                      if (v54) {
                        v56 = v55 == 0;
                      }
                      else {
                        v56 = 1;
                      }
                      if (v56)
                      {
LABEL_174:
                        fprintf(__stderrp, "%s: malloc failed to allocate memory\n");
                        goto LABEL_180;
                      }
                      v57 = v55;
                      memcpy(v54, names, 80 * v53);
                      memcpy(&v54[v53], (const void *)qword_10000C1D8, 0xB40uLL);
                      memcpy(v57, info, v53 << 6);
                      memcpy(&v57[v53], (const void *)qword_10000C1E0, 0x900uLL);
                      sub_1000065D8((vm_address_t)names, info, v53, 1);
                      LODWORD(v53) = v53 + 36;
                    }
                    if (v53 != 1)
                    {
                      v58 = 0;
                      v59 = v13 + 1;
                      v60 = v54 + 1;
                      v61 = v57 + 1;
                      v62 = v53 - 1;
                      do
                      {
                        v63 = v58 + 1;
                        if (v58 + 1 < (unint64_t)v53)
                        {
                          v64 = &v57[v58];
                          v65 = &v54[v58];
                          v66 = v61;
                          v67 = v62;
                          v68 = v60;
                          v69 = v59;
                          do
                          {
                            if (v66->mzi_cur_size - v66->mzi_count * v66->mzi_elem_size > v64->mzi_cur_size
                                                                                         - v64->mzi_count
                                                                                         * v64->mzi_elem_size)
                            {
                              *(_OWORD *)__s = *(_OWORD *)&v64->mzi_count;
                              v124 = *(_OWORD *)&v64->mzi_max_size;
                              v125 = *(_OWORD *)&v64->mzi_alloc_size;
                              v126 = *(_OWORD *)&v64->mzi_exhaustible;
                              v71 = *(_OWORD *)&v66->mzi_alloc_size;
                              v70 = *(_OWORD *)&v66->mzi_exhaustible;
                              v72 = *(_OWORD *)&v66->mzi_max_size;
                              *(_OWORD *)&v64->mzi_count = *(_OWORD *)&v66->mzi_count;
                              *(_OWORD *)&v64->mzi_max_size = v72;
                              *(_OWORD *)&v64->mzi_alloc_size = v71;
                              *(_OWORD *)&v64->mzi_exhaustible = v70;
                              v73 = *(_OWORD *)__s;
                              v74 = v124;
                              v75 = v126;
                              *(_OWORD *)&v66->mzi_alloc_size = v125;
                              *(_OWORD *)&v66->mzi_exhaustible = v75;
                              *(_OWORD *)&v66->mzi_count = v73;
                              *(_OWORD *)&v66->mzi_max_size = v74;
                              v76 = *(_OWORD *)&v65->mzn_name[64];
                              v77 = *(_OWORD *)&v65->mzn_name[32];
                              v131 = *(_OWORD *)&v65->mzn_name[48];
                              v132 = v76;
                              v78 = *(_OWORD *)&v65->mzn_name[16];
                              __s1 = *(_OWORD *)v65->mzn_name;
                              v129 = v78;
                              v130 = v77;
                              v79 = *(_OWORD *)&v68->mzn_name[16];
                              v80 = *(_OWORD *)&v68->mzn_name[32];
                              v81 = *(_OWORD *)&v68->mzn_name[64];
                              *(_OWORD *)&v65->mzn_name[48] = *(_OWORD *)&v68->mzn_name[48];
                              *(_OWORD *)&v65->mzn_name[64] = v81;
                              *(_OWORD *)&v65->mzn_name[16] = v79;
                              *(_OWORD *)&v65->mzn_name[32] = v80;
                              *(_OWORD *)v65->mzn_name = *(_OWORD *)v68->mzn_name;
                              *(_OWORD *)v68->mzn_name = __s1;
                              v82 = v129;
                              v83 = v130;
                              v84 = v132;
                              *(_OWORD *)&v68->mzn_name[48] = v131;
                              *(_OWORD *)&v68->mzn_name[64] = v84;
                              *(_OWORD *)&v68->mzn_name[16] = v82;
                              *(_OWORD *)&v68->mzn_name[32] = v83;
                              v85 = v13[v58];
                              v13[v58] = *v69;
                              *v69 = v85;
                            }
                            ++v66;
                            ++v69;
                            ++v68;
                            --v67;
                          }
                          while (v67);
                        }
                        ++v59;
                        ++v60;
                        --v62;
                        ++v61;
                        ++v58;
                      }
                      while (v63 != v53 - 1);
                    }
                    names = v54;
                    info = v57;
                    infoCnt = v53;
                  }
                  v116 = 0;
                  if (v103)
                  {
                    if ((byte_10000C214 & 1) == 0)
                    {
                      if ((v101 & 1) == 0) {
                        putchar(10);
                      }
                      if ((byte_10000C218 & 1) == 0)
                      {
                        for (j = 0; j != 416; j += 32)
                        {
                          if (*((unsigned char *)&off_10000C038 + j + 24)) {
                            printf("%*s ", *(_DWORD *)((char *)&off_10000C038 + j + 20)* *(_DWORD *)((char *)&off_10000C038 + j + 16), *(const char **)((char *)&off_10000C038 + j));
                          }
                        }
                        putchar(10);
                        v87 = 0;
                        v88 = 0;
                        do
                        {
                          v89 = (char *)&off_10000C038 + v87;
                          if (*((unsigned char *)&off_10000C038 + v87 + 24))
                          {
                            printf("%*s ", *((_DWORD *)v89 + 5) * *((_DWORD *)v89 + 4), *((const char **)v89 + 1));
                            v88 += *((_DWORD *)v89 + 4) + 1;
                          }
                          v87 += 32;
                        }
                        while (v87 != 416);
                        putchar(10);
                        if (v88 >= 1)
                        {
                          do
                          {
                            putchar(45);
                            --v88;
                          }
                          while (v88);
                        }
                        putchar(10);
                      }
                    }
                    sub_1000054D4((uint64_t)names, (uint64_t)info, infoCnt, (uint64_t)v13, &v116);
                    if ((byte_10000C210 & 1) == 0 && dword_10000C030 != 1) {
                      sub_1000054D4(qword_10000C1D8, qword_10000C1E0, 0x24u, qword_10000C1E8, &v116);
                    }
                  }
                  v90 = names;
                  v91 = info;
                  if (v101 & ~byte_10000C20C)
                  {
                    if (byte_10000C210) {
                      v92 = (int (__cdecl *)(void *, const void *, const void *))sub_1000064C0;
                    }
                    else {
                      v92 = (int (__cdecl *)(void *, const void *, const void *))sub_1000064F4;
                    }
                    sub_100005BB4((uint64_t)memory_info, memory_infoCnt, (uint64_t)info, (uint64_t)names, namesCnt, v116, v92);
                    v90 = names;
                    v91 = info;
                  }
                  sub_1000065D8((vm_address_t)v90, v91, infoCnt, !v99);
                  if (dword_10000C030 != 1)
                  {
                    v93 = qword_10000C1E8;
                    *(_OWORD *)qword_10000C1E8 = 0u;
                    *(_OWORD *)(v93 + 16) = 0u;
                    *(_DWORD *)(v93 + 32) = 0;
                    qword_10000C1F0 = 0;
                  }
                  if (memory_info)
                  {
                    if (memory_infoCnt)
                    {
                      v94 = vm_deallocate(mach_task_self_, (vm_address_t)memory_info, 176 * memory_infoCnt);
                      if (v94)
                      {
                        v98 = __stderrp;
                        mach_error_string(v94);
                        fprintf(v98, "%s: vm_deallocate: %s\n");
                        goto LABEL_180;
                      }
                    }
                  }
                  if (((byte_10000C208 | byte_10000C204) & 1) != 0
                    && (byte_10000C218 & 1) == 0
                    && (byte_10000C200 & 1) == 0)
                  {
                    puts("\nZONE TOTALS");
                    puts("---------------------------------------------");
                    printf("TOTAL SIZE        = %llu\n", qword_10000C230);
                    printf("TOTAL USED        = %llu\n", qword_10000C238);
                    if (byte_10000C208 == 1)
                    {
                      printf("TOTAL WASTED      = %llu\n", qword_10000C230 - qword_10000C238);
                      printf("TOTAL FRAGMENTED  = %llu\n", qword_10000C240);
                      printf("TOTAL COLLECTABLE = %llu\n", qword_10000C248);
                    }
                    if (byte_10000C204 == 1) {
                      printf("TOTAL ALLOCS      = %llu\n", qword_10000C250);
                    }
                  }
                  if (byte_10000C200 != 1 || (byte_10000C258 & 1) != 0) {
                    exit(0);
                  }
                  v102 = 1;
                  sleep(1u);
                }
                if (v16 == 53)
                {
                  v97 = __stderrp;
                  mach_error_string(53);
                  fprintf(v97, "%s: mach_memory_info: %s (entitlement required or rate-limit exceeded)\n");
                }
                else
                {
                  v96 = __stderrp;
                  if (v16 == 8)
                  {
                    mach_error_string(8);
                    fprintf(v96, "%s: mach_memory_info: %s (try running as root)\n");
                  }
                  else
                  {
                    mach_error_string(v16);
                    fprintf(v96, "%s: mach_memory_info: %s\n");
                  }
                }
LABEL_180:
                exit(1);
              }
            }
            else if (*v10 != 45)
            {
              v7 = v8 + 1;
              a2 = v111;
              goto LABEL_41;
            }
            v95 = &__stderrp;
LABEL_177:
            sub_100005354(*v95);
          }
          v11 = v114 | 2;
        }
        v114 = v11;
        dword_10000C030 = v11;
      }
    }
    if (a1 - 1 == ++v8)
    {
      v7 = a1;
      goto LABEL_40;
    }
  }
}

void sub_100005344()
{
  byte_10000C258 = 1;
}

void sub_100005354(FILE *a1)
{
  exit(__stdoutp != a1);
}

uint64_t sub_1000054D4(uint64_t result, uint64_t a2, unsigned int a3, uint64_t a4, void *a5)
{
  if (a3)
  {
    uint64_t v8 = result;
    uint64_t v9 = 0;
    uint64_t v49 = result;
    uint64_t v50 = a3;
    uint64_t v10 = result;
    while (!*(unsigned char *)(a4 + v9))
    {
LABEL_73:
      ++v9;
      v10 += 80;
      if (v9 == v50) {
        return result;
      }
    }
    uint64_t v11 = v8 + 80 * v9;
    v12 = (void *)(a2 + (v9 << 6));
    if (byte_10000C214)
    {
      printf("%.*s zone:\n", 80, (const char *)(v8 + 80 * v9));
      v13 = v12 + 3;
      v14 = v12 + 1;
      printf("\tcur_size:    %lluK bytes (%llu elements)\n", v12[1] >> 10, v12[1] / v12[3]);
      unint64_t v15 = v12[2];
      unint64_t v16 = v12[3];
      if (v16) {
        unint64_t v16 = v15 / v16;
      }
      printf("\tmax_size:    %lluK bytes (%llu elements)\n", v15 >> 10, v16);
      printf("\telem_size:   %llu bytes\n", *v13);
      printf("\t# of elems:  %llu\n", *v12);
      uint64_t v17 = a2 + (v9 << 6);
      unint64_t v18 = *(void *)(v17 + 32);
      unint64_t v19 = *v13;
      if (*v13) {
        unint64_t v19 = v18 / v19;
      }
      result = printf("\talloc_size:  %lluK bytes (%llu elements)\n", v18 >> 10, v19);
      if (*(void *)(v17 + 48)) {
        result = puts("\tEXHAUSTIBLE");
      }
      uint64_t v20 = a2 + (v9 << 6);
      char v22 = *(unsigned char *)(v20 + 56);
      v21 = (unint64_t *)(v20 + 56);
      if (v22) {
        result = puts("\tCOLLECTABLE");
      }
      if (byte_10000C208 == 1)
      {
        unint64_t v23 = *v12 * *v13;
        qword_10000C238 += v23;
        uint64_t v24 = *v14;
        qword_10000C230 += *v14;
        unint64_t v25 = *v21;
        uint64_t v26 = *v21 >> 1;
        qword_10000C248 += v26;
        uint64_t v27 = v24 - v23;
        uint64_t v28 = v27 - (v25 >> 1);
        qword_10000C240 += v28;
        printf("\t\t\t\t\tWASTED: %llu\n", v27);
        printf("\t\t\t\t\tFRAGMENTED: %llu\n", v28);
        result = printf("\t\t\t\t\tCOLLECTABLE: %llu\n", v26);
      }
      if (byte_10000C204 == 1)
      {
        qword_10000C250 += *(void *)(a2 + (v9 << 6) + 40);
        result = printf("\t\t\t\t\tTOTAL: %llu\n", qword_10000C250);
      }
LABEL_72:
      *a5 += *v12;
      goto LABEL_73;
    }
    int v29 = dword_10000C048;
    uint64_t v30 = (dword_10000C048 - 1);
    if (dword_10000C048 < 2)
    {
      LODWORD(v31) = 0;
LABEL_26:
      if (v31 != v30)
      {
        int v36 = v29 - v31;
        BOOL v35 = v29 <= (int)v31;
        uint64_t v8 = v49;
        if (!v35)
        {
          do
          {
            putchar(32);
            --v36;
          }
          while (v36);
        }
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v31 = 0;
      do
      {
        int v32 = *(unsigned __int8 *)(v10 + v31);
        if (v32 == 32)
        {
          int v33 = 46;
        }
        else
        {
          if (!*(unsigned char *)(v10 + v31)) {
            goto LABEL_26;
          }
          int v33 = (char)v32;
        }
        putchar(v33);
        ++v31;
      }
      while (v30 != v31);
    }
    uint64_t v8 = v49;
    if (*(unsigned char *)(v11 + v30)) {
      int v34 = 36;
    }
    else {
      int v34 = 32;
    }
    putchar(v34);
LABEL_33:
    if (byte_10000C070) {
      printf(" %*llu", unk_10000C06C * dword_10000C068, *(void *)(a2 + (v9 << 6) + 24));
    }
    if (byte_10000C090) {
      printf(" %*lluK", (dword_10000C088 - 1) * unk_10000C08C, *(void *)(a2 + (v9 << 6) + 8) >> 10);
    }
    uint64_t v37 = a2 + (v9 << 6);
    unint64_t v39 = *(void *)(v37 + 16);
    v38 = (void *)(v37 + 16);
    if (v39 <= 0x26259FFFFLL)
    {
      if (byte_10000C0B0) {
        printf(" %*lluK");
      }
    }
    else if (byte_10000C0B0)
    {
      printf(" %*s");
    }
    if (byte_10000C0D0) {
      printf(" %*llu", unk_10000C0CC * dword_10000C0C8, *(void *)(a2 + (v9 << 6) + 8) / *(void *)(a2 + (v9 << 6) + 24));
    }
    if (*v38 <= 0x26259FFFFuLL)
    {
      if (byte_10000C0F0) {
        printf(" %*llu");
      }
    }
    else if (byte_10000C0F0)
    {
      printf(" %*s");
    }
    if (byte_10000C110) {
      printf(" %*llu", unk_10000C10C * dword_10000C108, *v12);
    }
    if (byte_10000C130) {
      printf(" %*lluK", (dword_10000C128 - 1) * unk_10000C12C, *(void *)(a2 + (v9 << 6) + 32) >> 10);
    }
    if (byte_10000C150) {
      printf(" %*llu", unk_10000C14C * dword_10000C148, *(void *)(a2 + (v9 << 6) + 32) / *(void *)(a2 + (v9 << 6) + 24));
    }
    v40 = (void *)(a2 + (v9 << 6));
    uint64_t v41 = *v12 * v40[3];
    qword_10000C238 += v41;
    uint64_t v42 = v40[1];
    qword_10000C230 += v42;
    uint64_t v44 = v40[5];
    v43 = v40 + 5;
    qword_10000C250 += v44;
    unint64_t v45 = v43[2];
    qword_10000C248 += v45 >> 1;
    unint64_t v46 = v42 - (v41 + (v45 >> 1));
    qword_10000C240 += v46;
    uint64_t v47 = 67;
    if ((v45 & 1) == 0) {
      uint64_t v47 = 32;
    }
    uint64_t v48 = 88;
    if (!v43[1]) {
      uint64_t v48 = 32;
    }
    printf(" %c%c", v48, v47);
    if (byte_10000C190)
    {
      if (v46 > 0x3FF) {
        printf(" %*lluK");
      }
      else {
        printf(" %*lluB");
      }
    }
    if (byte_10000C1B0)
    {
      if (v45 > 0x7FF) {
        printf(" %*lluK");
      }
      else {
        printf(" %*lluB");
      }
    }
    if (byte_10000C1D0)
    {
      if (*v43 > 0x3FFuLL) {
        printf(" %*lluK");
      }
      else {
        printf(" %*lluB");
      }
    }
    result = putchar(10);
    goto LABEL_72;
  }
  return result;
}

void sub_100005BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, int (__cdecl *a7)(void *, const void *, const void *))
{
  uint64_t v59 = a6;
  uint64_t v60 = a3;
  size_t v11 = a2;
  uint64_t v12 = __chkstk_darwin();
  v14 = (char *)&v59 - v13;
  unint64_t v61 = qword_10000C230;
  unint64_t v15 = &off_10000C000;
  qword_10000C260 = v12;
  qword_10000C270 = CSSymbolicatorCreateWithMachKernel();
  qword_10000C278 = v16;
  CFDictionaryRef v17 = (const __CFDictionary *)OSKextCopyLoadedKextInfo();
  qword_10000C268 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryApplyFunction(v17, (CFDictionaryApplierFunction)sub_100006C44, (void *)qword_10000C268);
  CFRelease(v17);
  uint64_t v62 = a2;
  if (a2)
  {
    LODWORD(v64) = a5;
    uint64_t v18 = 0;
    do
    {
      *(_DWORD *)&v14[4 * v18] = v18;
      ++v18;
    }
    while (v11 != v18);
    uint64_t v67 = a4;
    unsigned int v19 = v64;
    uint64_t v68 = v64;
    qsort_r(v14, v11, 4uLL, &v67, a7);
    if (v62)
    {
      uint64_t v20 = 0;
      unint64_t v65 = 0;
      uint64_t v66 = 0;
      int v63 = 0;
      while (1)
      {
        unsigned int v21 = *(_DWORD *)&v14[4 * v20];
        uint64_t v22 = v15[76];
        uint64_t v23 = *(void *)(v22 + 176 * v21);
        if ((v23 & 3) != 0 && *(void *)(v22 + 176 * v21 + 8) == 2) {
          unint64_t v65 = *(void *)(v22 + 176 * v21 + 16);
        }
        if ((v23 & 0x200) == 0 && (v23 & 0x900) != 0) {
          break;
        }
LABEL_36:
        if (++v20 == v11) {
          goto LABEL_40;
        }
      }
      if ((v23 & 0x800) != 0)
      {
        if ((v23 & 0x2000) != 0)
        {
          uint64_t v27 = v22 + 176 * v21;
          unint64_t v25 = *(void *)(v27 + 16);
          unint64_t v26 = *(unsigned __int16 *)(v27 + 66);
          goto LABEL_16;
        }
        uint64_t v24 = *(unsigned __int16 *)(v22 + 176 * v21 + 66);
        if (v24 < v19)
        {
          unint64_t v25 = *(void *)(v22 + 176 * v21 + 16);
          unint64_t v26 = *(void *)(v60 + (v24 << 6) + 24);
LABEL_16:
          v66 += v25 / v26;
        }
      }
      if (*(void *)(v22 + 176 * v21 + 16) > 0x3FFuLL || *(void *)(v22 + 176 * v21 + 56) >= 0x400uLL)
      {
        uint64_t v28 = a4;
        int v29 = sub_1000066DC(v21, a4);
        uint64_t v30 = (const char *)qword_10000C220;
        size_t v31 = qword_10000C228;
        size_t v32 = strlen(v29);
        if (qword_10000C228 > v32)
        {
LABEL_24:
          a4 = v28;
        }
        else
        {
          uint64_t v33 = 0;
          uint64_t v34 = v32 - qword_10000C228 + 1;
          while (strncmp(v30, &v29[v33], v31))
          {
            if (v34 == ++v33)
            {
              unint64_t v15 = (void *)&off_10000C000;
              unsigned int v19 = v64;
              goto LABEL_24;
            }
          }
          if ((v63 & 1) == 0)
          {
            puts("-------------------------------------------------------------------------------------------------------------");
            puts("                                                               kmod          vm        peak               cur");
            puts("wired memory                                                     id         tag        size  waste       size");
            puts("-------------------------------------------------------------------------------------------------------------");
          }
          printf("%-67s", v29);
          free(v29);
          unint64_t v15 = &off_10000C000;
          printf("%12d", *(unsigned __int16 *)(qword_10000C260 + 176 * v21 + 64));
          unsigned int v19 = v64;
          if (*(void *)(qword_10000C260 + 176 * v21 + 56)) {
            printf(" %10lluK");
          }
          else {
            printf(" %11s");
          }
          a4 = v28;
          if (*(void *)(qword_10000C260 + 176 * v21 + 40)) {
            printf(" %5lluK");
          }
          else {
            printf(" %6s");
          }
          printf(" %9lluK", *(void *)(qword_10000C260 + 176 * v21 + 16) >> 10);
          if ((*(unsigned char *)(qword_10000C260 + 176 * v21 + 1) & 8) == 0) {
            qword_10000C230 += *(void *)(qword_10000C260 + 176 * v21 + 16);
          }
          putchar(10);
          int v63 = 1;
        }
      }
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v67 = a4;
    uint64_t v68 = a5;
    qsort_r(v14, v11, 4uLL, &v67, a7);
  }
  unint64_t v65 = 0;
  uint64_t v66 = 0;
  int v63 = 0;
LABEL_40:
  if (!qword_10000C228)
  {
    printf("%-67s", "zones");
    printf("%12s", "");
    printf(" %11s", "");
    printf(" %6s", "");
    printf(" %9lluK", v61 >> 10);
    putchar(10);
  }
  size_t v64 = v11;
  if (v63)
  {
    if (v66)
    {
      snprintf(__str, 0x28uLL, "%lld of %lld", v66, v59);
      printf("zone tags%100s\n", __str);
    }
    snprintf(__str, 0x28uLL, "%6.2fM of %6.2fM", (double)(unint64_t)qword_10000C230 * 0.0009765625 * 0.0009765625, (double)v65 * 0.0009765625 * 0.0009765625);
    printf("total%104s\n", __str);
    size_t v11 = v64;
  }
  if (v62)
  {
    uint64_t v35 = 0;
    LODWORD(v66) = 0;
    do
    {
      unsigned int v36 = *(_DWORD *)&v14[4 * v35];
      uint64_t v37 = v15[76];
      unint64_t v38 = *(void *)(v37 + 176 * v36 + 48);
      if (v38)
      {
        uint64_t v39 = *(void *)(v37 + 176 * v36);
        if ((v39 & 0x200) == 0)
        {
          uint64_t v40 = *(void *)(v37 + 176 * v36 + 16);
          if ((v39 & 0x900) == 0 || v38 != v40)
          {
            uint64_t v42 = sub_1000066DC(*(_DWORD *)&v14[4 * v35], 0);
            v43 = (const char *)qword_10000C220;
            size_t v44 = qword_10000C228;
            size_t v45 = strlen(v42);
            if (qword_10000C228 <= v45)
            {
              uint64_t v46 = 0;
              uint64_t v47 = v45 - qword_10000C228 + 1;
              while (strncmp(v43, &v42[v46], v44))
              {
                if (v47 == ++v46)
                {
                  size_t v11 = v64;
                  unint64_t v15 = (void *)&off_10000C000;
                  goto LABEL_72;
                }
              }
              if ((v66 & 1) == 0)
              {
                puts("-------------------------------------------------------------------------------------------------------------");
                puts("                                                                        largest        peak               cur");
                puts("maps                                                           free        free        size              size");
                puts("-------------------------------------------------------------------------------------------------------------");
              }
              printf("%-55s", v42);
              free(v42);
              unint64_t v15 = &off_10000C000;
              size_t v11 = v64;
              if (*(void *)(qword_10000C260 + 176 * v36 + 24)) {
                printf(" %10lluK");
              }
              else {
                printf(" %11s");
              }
              if (*(void *)(qword_10000C260 + 176 * v36 + 32)) {
                printf(" %10lluK");
              }
              else {
                printf(" %11s");
              }
              if (*(void *)(qword_10000C260 + 176 * v36 + 56)) {
                printf(" %10lluK");
              }
              else {
                printf(" %11s");
              }
              printf(" %16lluK", v38 >> 10);
              putchar(10);
              LODWORD(v66) = 1;
            }
          }
        }
      }
LABEL_72:
      ++v35;
    }
    while (v35 != v11);
    if (v62)
    {
      uint64_t v48 = 0;
      char v49 = 0;
      do
      {
        unsigned int v50 = *(_DWORD *)&v14[4 * v48];
        uint64_t v51 = v15[76];
        unint64_t v52 = *(void *)(v51 + 176 * v50 + 16);
        if (v52)
        {
          if ((*(unsigned char *)(v51 + 176 * v50 + 1) & 0x10) != 0)
          {
            v53 = sub_1000066DC(v50, 0);
            v54 = (const char *)qword_10000C220;
            size_t v55 = qword_10000C228;
            size_t v56 = strlen(v53);
            if (qword_10000C228 <= v56)
            {
              uint64_t v57 = 0;
              uint64_t v58 = v56 - qword_10000C228 + 1;
              while (strncmp(v54, &v53[v57], v55))
              {
                if (v58 == ++v57)
                {
                  size_t v11 = v64;
                  unint64_t v15 = (void *)&off_10000C000;
                  goto LABEL_85;
                }
              }
              size_t v11 = v64;
              unint64_t v15 = (void *)&off_10000C000;
              if ((v49 & 1) == 0)
              {
                puts("-------------------------------------------------------------------------------------------------------------");
                puts("                                                                                                          cur");
                puts("zone views                                                                                              inuse");
                puts("-------------------------------------------------------------------------------------------------------------");
              }
              printf("%-55s", v53);
              free(v53);
              printf(" %11s", "");
              printf(" %11s", "");
              printf(" %11s", "");
              printf(" %16lluK", v52 >> 10);
              putchar(10);
              char v49 = 1;
            }
          }
        }
LABEL_85:
        ++v48;
      }
      while (v48 != v11);
    }
  }
  qword_10000C230 = v61;
}

uint64_t sub_1000064C0(uint64_t a1, int *a2, int *a3)
{
  unint64_t v3 = *(void *)(qword_10000C260 + 176 * *a2 + 16);
  unint64_t v4 = *(void *)(qword_10000C260 + 176 * *a3 + 16);
  BOOL v5 = v3 > v4;
  BOOL v6 = v3 < v4;
  if (v5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v6;
  }
}

CFComparisonResult sub_1000064F4(uint64_t *a1, int *a2, int *a3)
{
  BOOL v5 = sub_1000066DC(*a2, *a1);
  BOOL v6 = sub_1000066DC(*a3, *a1);
  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, v5, 0x8000100u);
  CFStringRef v8 = CFStringCreateWithCString(kCFAllocatorDefault, v6, 0x8000100u);
  v11.length = CFStringGetLength(v7);
  v11.location = 0;
  CFComparisonResult v9 = CFStringCompareWithOptionsAndLocale(v7, v8, v11, 0x40uLL, 0);
  CFRelease(v7);
  CFRelease(v8);
  free(v5);
  free(v6);
  return v9;
}

void sub_1000065D8(vm_address_t address, void *a2, unsigned int a3, char a4)
{
  if ((a4 & 1) == 0)
  {
    free((void *)address);
LABEL_12:
    free(a2);
    return;
  }
  if (address && a3 && (mach_error_t v6 = vm_deallocate(mach_task_self_, address, 80 * a3)) != 0
    || a2 && a3 && (mach_error_t v6 = vm_deallocate(mach_task_self_, (vm_address_t)a2, (unint64_t)a3 << 6)) != 0)
  {
    CFStringRef v7 = __stderrp;
    CFStringRef v8 = (const char *)qword_10000C1F8;
    CFComparisonResult v9 = mach_error_string(v6);
    fprintf(v7, "%s: vm_deallocate: %s\n", v8, v9);
    exit(1);
  }
  if (dword_10000C030 != 1)
  {
    free((void *)qword_10000C1D8);
    a2 = (void *)qword_10000C1E0;
    goto LABEL_12;
  }
}

char *sub_1000066DC(int a1, uint64_t a2)
{
  uint64_t v20 = 0;
  __s = 0;
  uint64_t v3 = qword_10000C260;
  uint64_t v5 = qword_10000C260 + 176 * a1;
  if ((*(void *)v5 & 0x400) != 0)
  {
    asprintf(&__s, "%s");
  }
  else
  {
    Path = *(const char **)(v5 + 8);
    switch(*(void *)v5)
    {
      case 0u:
        uint64_t v22 = 0;
        switch((unint64_t)Path)
        {
          case 0uLL:
          case 1uLL:
          case 2uLL:
          case 3uLL:
          case 4uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
          case 8uLL:
          case 9uLL:
          case 0xAuLL:
          case 0xBuLL:
          case 0xCuLL:
          case 0xDuLL:
          case 0xEuLL:
          case 0xFuLL:
          case 0x10uLL:
          case 0x11uLL:
          case 0x12uLL:
          case 0x13uLL:
          case 0x14uLL:
          case 0x15uLL:
          case 0x16uLL:
          case 0x17uLL:
          case 0x18uLL:
          case 0x19uLL:
          case 0x1AuLL:
          case 0x1BuLL:
          case 0x1CuLL:
          case 0x1DuLL:
          case 0x1EuLL:
          case 0x1FuLL:
          case 0x20uLL:
          case 0x21uLL:
          case 0x23uLL:
            goto LABEL_17;
          case 0x22uLL:
            break;
          default:
            if (Path == (const char *)255) {
              goto LABEL_17;
            }
            break;
        }
        asprintf(&v22, "VM_KERN_MEMORY_%lld");
        goto LABEL_21;
      case 1u:
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)qword_10000C268, *(const void **)(v5 + 8));
        if (Value
          && (CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(Value, kCFBundleIdentifierKey),
              CFStringGetCStringPtr(v9, 0x8000100u)))
        {
          asprintf(&__s, "%s");
        }
        else
        {
          asprintf(&__s, "(unloaded kmod)");
        }
        goto LABEL_6;
      case 2u:
        if (Path && (CSSymbolicatorGetSymbolWithAddressAtTime(), (Name = (const char *)CSSymbolGetName()) != 0))
        {
          asprintf(&__s, "%s", Name);
          CSSymbolicatorGetSourceInfoWithAddressAtTime();
          Path = (const char *)CSSourceInfoGetPath();
          if (!Path) {
            goto LABEL_6;
          }
          int LineNumber = CSSourceInfoGetLineNumber();
          printf(" (%s:%d)", Path, LineNumber);
        }
        else
        {
          asprintf(&__s, "site 0x%qx");
        }
        break;
      case 3u:
        uint64_t v22 = 0;
        if ((unint64_t)Path > 0xE) {
          asprintf(&v22, "VM_KERN_COUNT_%lld");
        }
        else {
LABEL_17:
        }
          asprintf(&v22, "%s");
LABEL_21:
        Path = 0;
        CFStringRef v7 = v22;
        __s = v22;
        if (v22) {
          goto LABEL_22;
        }
        return v7;
      default:
        asprintf(&__s, "");
        break;
    }
  }
  Path = 0;
LABEL_6:
  CFStringRef v7 = __s;
  if (__s)
  {
LABEL_22:
    uint64_t v12 = *(void *)v5;
    if ((v12 & 0x800) != 0)
    {
      size_t v13 = strlen(v7);
      uint64_t v22 = 0;
      uint64_t v14 = v3 + 176 * a1;
      if ((v12 & 0x2000) != 0)
      {
        asprintf(&v22, "size.%d", *(unsigned __int16 *)(v14 + 66));
        CFStringRef v7 = __s;
        unint64_t v15 = v22;
      }
      else
      {
        unint64_t v15 = (char *)(a2 + 80 * *(unsigned __int16 *)(v14 + 66));
        uint64_t v22 = v15;
      }
      size_t v16 = strnlen(v15, 0x50uLL);
      if (v16 + v13 <= 0x3D || v16 >= 0x3D) {
        int v18 = v13;
      }
      else {
        int v18 = 61 - v16;
      }
      asprintf(&v20, "%.*s[%.*s]", v18, v7, v16, v15);
      free(__s);
      CFStringRef v7 = v20;
      __s = v20;
    }
    if (v7 && Path)
    {
      asprintf(&v20, "%-64s%3ld", v7, Path);
      free(__s);
      return v20;
    }
  }
  return v7;
}

void sub_100006C44(int a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  unsigned int valuePtr = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"OSBundleLoadTag");
  CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(a3, (const void *)valuePtr, theDict);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompareWithOptionsAndLocale(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions, CFLocaleRef locale)
{
  return _CFStringCompareWithOptionsAndLocale(theString1, theString2, rangeToCompare, compareOptions, locale);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

uint64_t CSSourceInfoGetLineNumber()
{
  return _CSSourceInfoGetLineNumber();
}

uint64_t CSSourceInfoGetPath()
{
  return _CSSourceInfoGetPath();
}

uint64_t CSSymbolGetName()
{
  return _CSSymbolGetName();
}

uint64_t CSSymbolicatorCreateWithMachKernel()
{
  return _CSSymbolicatorCreateWithMachKernel();
}

uint64_t CSSymbolicatorGetSourceInfoWithAddressAtTime()
{
  return _CSSymbolicatorGetSourceInfoWithAddressAtTime();
}

uint64_t CSSymbolicatorGetSymbolWithAddressAtTime()
{
  return _CSSymbolicatorGetSymbolWithAddressAtTime();
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return _OSKextCopyLoadedKextInfo();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_memory_info(mach_port_t host, mach_zone_name_array_t *names, mach_msg_type_number_t *namesCnt, mach_zone_info_array_t *info, mach_msg_type_number_t *infoCnt, mach_memory_info_array_t *memory_info, mach_msg_type_number_t *memory_infoCnt)
{
  return _mach_memory_info(host, names, namesCnt, info, infoCnt, memory_info, memory_infoCnt);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
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

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}