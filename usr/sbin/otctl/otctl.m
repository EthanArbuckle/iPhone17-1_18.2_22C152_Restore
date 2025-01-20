double sub_100003494(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  long long *v10;
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  long long v15;
  uint64_t v16;
  double result;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = sub_1000035C0(a2);
  v5 = malloc_type_malloc(104 * v4 + 208, 0x109004046C4FC64uLL);
  *(void *)(a1 + 16) = v5;
  *v5 = unk_100020450;
  v5[1] = unk_100020460;
  *((void *)v5 + 12) = 0;
  v5[4] = unk_100020490;
  v5[5] = unk_1000204A0;
  v5[2] = xmmword_100020470;
  v5[3] = unk_100020480;
  if (v4)
  {
    v6 = 0;
    v7 = 1;
    while (1)
    {
      v8 = *(void *)(a2 + 16);
      if (!*(unsigned char *)(v8 + v6 + 80)) {
        goto LABEL_6;
      }
      if (SecIsInternalRelease()) {
        break;
      }
LABEL_7:
      v6 += 104;
      if (!--v4) {
        goto LABEL_10;
      }
    }
    v8 = *(void *)(a2 + 16);
LABEL_6:
    v9 = *(void *)(a1 + 16) + 104 * v7++;
    v10 = (long long *)(v8 + v6);
    v11 = *v10;
    v12 = v10[2];
    *(_OWORD *)(v9 + 16) = v10[1];
    *(_OWORD *)(v9 + 32) = v12;
    *(_OWORD *)v9 = v11;
    v13 = v10[3];
    v14 = v10[4];
    v15 = v10[5];
    *(void *)(v9 + 96) = *((void *)v10 + 12);
    *(_OWORD *)(v9 + 64) = v14;
    *(_OWORD *)(v9 + 80) = v15;
    *(_OWORD *)(v9 + 48) = v13;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_10:
  v16 = *(void *)(a1 + 16) + 104 * v7;
  *(void *)(v16 + 96) = 0;
  result = 0.0;
  *(_OWORD *)(v16 + 64) = 0u;
  *(_OWORD *)(v16 + 80) = 0u;
  *(_OWORD *)(v16 + 32) = 0u;
  *(_OWORD *)(v16 + 48) = 0u;
  *(_OWORD *)v16 = 0u;
  *(_OWORD *)(v16 + 16) = 0u;
  return result;
}

uint64_t sub_1000035C0(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  v1 = *(char **)(a1 + 16);
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  uint64_t v2 = 0;
  if (v1)
  {
    do
    {
      if (!memcmp(v1, v4, 0x68uLL)) {
        break;
      }
      ++v2;
      v1 += 104;
    }
    while (v2 != 1024);
  }
  return v2;
}

uint64_t sub_100003638(uint64_t result)
{
  if (!result) {
    return result;
  }
  memset(v36, 170, sizeof(v36));
  sub_100003494((uint64_t)v36, result);
  uint64_t v1 = sub_1000035C0((uint64_t)v36);
  uint64_t v2 = (const char *)v36[0];
  if (!v36[0]) {
    uint64_t v2 = "command";
  }
  printf("usage: %s", v2);
  if (v1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = v1;
    while (!*(unsigned char *)(v36[2] + v3))
    {
LABEL_17:
      v3 += 104;
      if (!--v4)
      {
        uint64_t v7 = 0;
        uint64_t v8 = v1;
        while (2)
        {
          if (!*(void *)(v36[2] + v7 + 8) || *(unsigned char *)(v36[2] + v7)) {
            goto LABEL_31;
          }
          printf(" [--%s", *(const char **)(v36[2] + v7 + 8));
          if (v36[2])
          {
            uint64_t v9 = *(void *)(v36[2] + v7 + 48);
            if (*(void *)(v36[2] + v7 + 56))
            {
              if (!v9) {
                goto LABEL_30;
              }
LABEL_27:
              v10 = *(const char **)(v36[2] + v7 + 40);
              if (!v10) {
                v10 = "arg";
              }
              printf(" %s", v10);
            }
            else if (v9 || *(void *)(v36[2] + v7 + 88))
            {
              goto LABEL_27;
            }
          }
LABEL_30:
          putchar(93);
LABEL_31:
          v7 += 104;
          if (!--v8)
          {
            uint64_t v11 = 16;
            uint64_t v12 = v1;
            do
            {
              if (*(void *)(v36[2] + v11)) {
                printf(" [%s]", *(const char **)(v36[2] + v11));
              }
              v11 += 104;
              --v12;
            }
            while (v12);
            uint64_t v13 = 0;
            uint64_t v14 = v1;
            do
            {
              if (*(void *)(v36[2] + v13 + 24))
              {
                if (*(unsigned char *)(v36[2] + v13 + 32)) {
                  printf(" [<%s>]");
                }
                else {
                  printf(" <%s>");
                }
              }
              v13 += 104;
              --v14;
            }
            while (v14);
            goto LABEL_42;
          }
          continue;
        }
      }
    }
    printf(" [-%c", *(char *)(v36[2] + v3));
    if (v36[2])
    {
      uint64_t v5 = *(void *)(v36[2] + v3 + 48);
      if (*(void *)(v36[2] + v3 + 56))
      {
        if (!v5) {
          goto LABEL_16;
        }
      }
      else if (!v5 && !*(void *)(v36[2] + v3 + 88))
      {
        goto LABEL_16;
      }
      v6 = *(const char **)(v36[2] + v3 + 40);
      if (!v6) {
        v6 = "arg";
      }
      printf(" %s", v6);
    }
LABEL_16:
    putchar(93);
    goto LABEL_17;
  }
LABEL_42:
  putchar(10);
  if (v36[1]) {
    printf("\n%s\n", (const char *)v36[1]);
  }
  puts("\npositional arguments:");
  if (!v1)
  {
    puts("\noptional arguments:");
    puts("\noptional commands:");
    return putchar(10);
  }
  uint64_t v15 = 0;
  uint64_t v16 = v1;
  do
  {
    if (*(void *)(v36[2] + v15 + 24)) {
      printf("  %-31s %s\n", *(const char **)(v36[2] + v15 + 24), *(const char **)(v36[2] + v15 + 72));
    }
    v15 += 104;
    --v16;
  }
  while (v16);
  puts("\noptional arguments:");
  uint64_t v17 = 88;
  uint64_t v18 = v1;
  do
  {
    if (!*(unsigned char *)(v36[2] + v17 - 88)) {
      goto LABEL_80;
    }
    if (*(void *)(v36[2] + v17 - 80))
    {
      printf("  -%c", *(char *)(v36[2] + v17 - 88));
      uint64_t v19 = v36[2];
      uint64_t v20 = *(void *)(v36[2] + v17 - 40);
      if (*(void *)(v36[2] + v17 - 32))
      {
        if (!v20) {
          goto LABEL_63;
        }
      }
      else if (!v20 && !*(void *)(v36[2] + v17))
      {
        goto LABEL_63;
      }
      v22 = *(const char **)(v36[2] + v17 - 48);
      if (!v22) {
        v22 = "arg";
      }
      printf(" %s", v22);
      uint64_t v19 = v36[2];
LABEL_63:
      uint64_t v23 = v19 + v17;
      if (*(void *)(v19 + v17 - 80))
      {
        uint64_t v25 = v23 - 40;
        uint64_t v24 = *(void *)(v23 - 40);
        if (*(void *)(v25 + 8))
        {
          if (v24) {
            goto LABEL_72;
          }
        }
        else if (v24 || *(void *)(v19 + v17))
        {
LABEL_72:
          strlen(*(const char **)(v19 + v17 - 80));
          if (*(void *)(v19 + v17 - 48)) {
            v27 = *(const char **)(v19 + v17 - 48);
          }
          else {
            v27 = "arg";
          }
          strlen(v27);
          printf(", --%s %-*s");
          goto LABEL_79;
        }
        if (*(void *)(v19 + v17 - 48)) {
          v26 = *(const char **)(v19 + v17 - 48);
        }
        else {
          v26 = "arg";
        }
        strlen(v26);
        printf(", --%-*s");
      }
      goto LABEL_79;
    }
    uint64_t v21 = *(void *)(v36[2] + v17 - 40);
    if (*(void *)(v36[2] + v17 - 32))
    {
      if (v21) {
        goto LABEL_78;
      }
    }
    else if (v21 || *(void *)(v36[2] + v17))
    {
LABEL_78:
      printf("  -%c %-*s");
      goto LABEL_79;
    }
    printf("  -%-30c");
LABEL_79:
    puts(*(const char **)(v36[2] + v17 - 16));
LABEL_80:
    v17 += 104;
    --v18;
  }
  while (v18);
  uint64_t v28 = v1;
  while (2)
  {
    if (*(void *)(v36[2] + v18 + 8) && !*(unsigned char *)(v36[2] + v18))
    {
      uint64_t v29 = *(void *)(v36[2] + v18 + 48);
      if (*(void *)(v36[2] + v18 + 56))
      {
        if (!v29) {
          goto LABEL_86;
        }
LABEL_89:
        memset(v46, 170, 22);
        *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v44 = v30;
        long long v42 = v30;
        long long v43 = v30;
        long long v40 = v30;
        long long v41 = v30;
        long long v38 = v30;
        long long v39 = v30;
        *(_OWORD *)v37 = v30;
        uint64_t v31 = *(void *)(v36[2] + v18 + 88);
        v32 = *(const char **)(v36[2] + v18 + 40);
        if (!v32) {
          v32 = "arg";
        }
        if (v31) {
          v33 = "%s %s...";
        }
        else {
          v33 = "%s %s";
        }
        if (v31) {
          v34 = "%s [repeatable]";
        }
        else {
          v34 = "%s";
        }
        snprintf(__str, 0x1EuLL, v33, *(void *)(v36[2] + v18 + 8), v32);
        snprintf(v37, 0x80uLL, v34, *(void *)(v36[2] + v18 + 72));
        printf("  --%-28s %s\n", __str, v37);
      }
      else
      {
        if (v29 || *(void *)(v36[2] + v18 + 88)) {
          goto LABEL_89;
        }
LABEL_86:
        printf("  --%-28s %s\n", *(const char **)(v36[2] + v18 + 8), *(const char **)(v36[2] + v18 + 72));
      }
    }
    v18 += 104;
    if (--v28) {
      continue;
    }
    break;
  }
  puts("\noptional commands:");
  uint64_t v35 = 0;
  do
  {
    if (*(void *)(v36[2] + v35 + 16)) {
      printf("  %-30s %s\n", *(const char **)(v36[2] + v35 + 16), *(const char **)(v36[2] + v35 + 72));
    }
    v35 += 104;
    --v1;
  }
  while (v1);
  return putchar(10);
}

char **sub_100003C04(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(_DWORD **)(a1 + 56);
  if (v4) {
    *uint64_t v4 = *(_DWORD *)(a1 + 64);
  }
  result = *(char ***)(a1 + 48);
  if (result) {
    result = (char **)asprintf(result, "%.1048576s", a2);
  }
  v6 = *(void ***)(a1 + 88);
  if (v6)
  {
    uint64_t v7 = **(void **)(a1 + 96);
    **(void **)(a1 + 88) = malloc_type_realloc(*v6, 8 * (v7 + 1), 0x10040436913F5uLL);
    result = (char **)asprintf((char **)(**(void **)(a1 + 88) + 8 * v7), "%.1048576s", a2);
    **(void **)(a1 + 96) = v7 + 1;
  }
  return result;
}

uint64_t start()
{
  int v0 = __chkstk_darwin();
  v128 = v1;
  int v126 = v0;
  uint64_t v186 = 0;
  uint64_t v185 = 0;
  uint64_t v184 = 0;
  uint64_t v183 = 0;
  uint64_t v182 = 0;
  uint64_t v181 = 0;
  uint64_t v180 = 0;
  uint64_t v179 = 0;
  uint64_t v178 = 0;
  uint64_t v177 = 0;
  uint64_t v176 = 0;
  uint64_t v175 = 0;
  uint64_t v174 = 0;
  uint64_t v173 = 0;
  uint64_t v172 = 0;
  uint64_t v170 = 0;
  uint64_t v171 = 0;
  uint64_t v168 = 0;
  uint64_t v169 = 0;
  uint64_t v166 = 0;
  uint64_t v167 = 0;
  uint64_t v164 = 0;
  uint64_t v165 = 0;
  uint64_t v162 = 0;
  uint64_t v163 = 0;
  uint64_t v161 = 0;
  int v160 = 0;
  uint64_t v158 = 0;
  uint64_t v159 = 0;
  uint64_t v156 = 0;
  uint64_t v157 = 0;
  uint64_t v154 = 0;
  uint64_t v155 = 0;
  uint64_t v152 = 0;
  uint64_t v153 = 0;
  uint64_t v150 = 0;
  uint64_t v151 = 0;
  uint64_t v149 = 0;
  int v148 = 0;
  uint64_t v146 = 0;
  uint64_t v147 = 0;
  uint64_t v144 = 0;
  v145 = 0;
  uint64_t v142 = 0;
  uint64_t v143 = 0;
  uint64_t v140 = 0;
  uint64_t v141 = 0;
  uint64_t v138 = 0;
  uint64_t v139 = 0;
  uint64_t v136 = 0;
  uint64_t v137 = 0;
  uint64_t v134 = 0;
  uint64_t v135 = 0;
  int v133 = 0;
  memset(v222, 170, sizeof(v222));
  v196[0] = 115;
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  uint64_t v200 = 0;
  long long v202 = 0u;
  v196[1] = "secret";
  *(void *)&long long v199 = &v157;
  v201 = "escrow secret";
  uint64_t v204 = 101;
  long long v208 = 0u;
  uint64_t v209 = 0;
  long long v206 = 0u;
  long long v207 = 0u;
  long long v211 = 0u;
  uint64_t v203 = 0;
  uint64_t v212 = 0;
  v205 = "bottleID";
  *(void *)&long long v208 = &v159;
  v210 = "bottle record id";
  uint64_t v221 = 0;
  uint64_t v218 = 0;
  long long v220 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  uint64_t v213 = 114;
  long long v215 = 0u;
  v214 = "skipRateLimiting";
  *(void *)&long long v217 = &v156;
  v219 = " enter values YES or NO, option defaults to NO, This gives you the opportunity to skip the rate limiting check "
         "when performing the cuttlefish health check";
  LOBYTE(v222[0]) = 106;
  *((void *)&v222[0] + 1) = "json";
  memset(&v222[1], 0, 17);
  *(_OWORD *)((char *)&v222[2] + 8) = 0u;
  *((void *)&v222[3] + 1) = (char *)&v150 + 4;
  LODWORD(v222[4]) = 1;
  *((void *)&v222[4] + 1) = "Output in JSON";
  LOBYTE(v222[5]) = 0;
  *(_OWORD *)((char *)&v222[5] + 8) = 0u;
  BYTE8(v222[6]) = 105;
  *(void *)&v222[7] = "recordID";
  BYTE8(v222[8]) = 0;
  *(_OWORD *)((char *)&v222[7] + 8) = 0u;
  *(void *)&v222[9] = 0;
  *((void *)&v222[9] + 1) = &v155;
  *(void *)&v222[10] = 0;
  DWORD2(v222[10]) = 1;
  *(void *)&v222[11] = "recordID";
  BYTE8(v222[11]) = 0;
  memset(&v222[18], 0, 24);
  memset(&v222[16], 0, 24);
  memset(&v222[14], 0, 32);
  *(void *)&v222[13] = 111;
  v222[12] = 0u;
  *((void *)&v222[13] + 1) = "overrideForAccountScript";
  *(void *)&v222[16] = &v154;
  *((void *)&v222[17] + 1) = " enter values YES or NO, option defaults to NO, This flag is only meant for the setup acc"
                               "ount for icloud cdp signin script";
  *((void *)&v222[25] + 1) = 0;
  *((void *)&v222[23] + 1) = 0;
  *(_OWORD *)((char *)&v222[24] + 8) = 0u;
  *(_OWORD *)((char *)&v222[21] + 8) = 0u;
  *(_OWORD *)((char *)&v222[22] + 8) = 0u;
  *((void *)&v222[19] + 1) = 99;
  *(_OWORD *)((char *)&v222[20] + 8) = 0u;
  *(void *)&v222[20] = "overrideEscrowCache";
  *((void *)&v222[22] + 1) = &v153;
  *(void *)&v222[24] = " enter values YES or NO, option defaults to NO, include this if you want to force an escrow rec"
                         "ord fetch from cuttlefish for the freshest of escrow records";
  LOBYTE(v222[26]) = 69;
  *((void *)&v222[26] + 1) = "enable";
  memset(&v222[27], 0, 17);
  *(_OWORD *)((char *)&v222[28] + 8) = 0u;
  *((void *)&v222[29] + 1) = (char *)&v151 + 4;
  LODWORD(v222[30]) = 1;
  *((void *)&v222[30] + 1) = "Enable something (pair with a modification command)";
  LOBYTE(v222[31]) = 0;
  *(_OWORD *)((char *)&v222[31] + 8) = 0u;
  BYTE8(v222[32]) = 80;
  *(void *)&v222[33] = "pause";
  BYTE8(v222[34]) = 0;
  *(_OWORD *)((char *)&v222[33] + 8) = 0u;
  v222[35] = 0u;
  *(void *)&v222[36] = &v151;
  DWORD2(v222[36]) = 1;
  *(void *)&v222[37] = "Pause something (pair with a modification command)";
  BYTE8(v222[37]) = 0;
  memset(&v222[38], 0, 17);
  *((void *)&v222[39] + 1) = "notifyIdMS";
  memset(&v222[40], 0, 17);
  *(_OWORD *)((char *)&v222[41] + 8) = 0u;
  *((void *)&v222[42] + 1) = &v150;
  LODWORD(v222[43]) = 1;
  *((void *)&v222[43] + 1) = "Notify IdMS on reset";
  LOBYTE(v222[44]) = 1;
  BYTE8(v222[45]) = 0;
  *(_OWORD *)((char *)&v222[44] + 8) = 0u;
  *(void *)&v222[46] = "forceFetch";
  BYTE8(v222[47]) = 0;
  *(_OWORD *)((char *)&v222[46] + 8) = 0u;
  v222[48] = 0u;
  *(void *)&v222[49] = &v149;
  DWORD2(v222[49]) = 1;
  *(void *)&v222[50] = "Force fetch from cuttlefish";
  BYTE8(v222[50]) = 0;
  memset(&v222[51], 0, 17);
  *((void *)&v222[52] + 1) = "repair";
  memset(&v222[53], 0, 17);
  *(_OWORD *)((char *)&v222[54] + 8) = 0u;
  *((void *)&v222[55] + 1) = &v148;
  LODWORD(v222[56]) = 1;
  *((void *)&v222[56] + 1) = "Perform repair as part of health check";
  LOBYTE(v222[57]) = 0;
  *((void *)&v222[64] + 1) = 0;
  *(_OWORD *)((char *)&v222[63] + 8) = 0u;
  *((void *)&v222[62] + 1) = 0;
  *(_OWORD *)((char *)&v222[61] + 8) = 0u;
  *(_OWORD *)((char *)&v222[60] + 8) = 0u;
  *(_OWORD *)((char *)&v222[59] + 8) = 0u;
  *((void *)&v222[58] + 1) = 97;
  *(_OWORD *)((char *)&v222[57] + 8) = 0u;
  *(void *)&v222[59] = "machineID";
  *((void *)&v222[61] + 1) = &v152;
  *(void *)&v222[63] = "machineID override";
  LOBYTE(v222[65]) = 103;
  *((void *)&v222[65] + 1) = "guitarfish";
  memset(&v222[66], 0, 17);
  *(_OWORD *)((char *)&v222[67] + 8) = 0u;
  *((void *)&v222[68] + 1) = &v133;
  LODWORD(v222[69]) = 1;
  *((void *)&v222[69] + 1) = "Flag to indicate the account is Guitarfish";
  LOBYTE(v222[70]) = 0;
  *((void *)&v222[77] + 1) = 0;
  *(_OWORD *)((char *)&v222[76] + 8) = 0u;
  *((void *)&v222[75] + 1) = 0;
  *(_OWORD *)((char *)&v222[74] + 8) = 0u;
  *(_OWORD *)((char *)&v222[73] + 8) = 0u;
  *(_OWORD *)((char *)&v222[72] + 8) = 0u;
  *((void *)&v222[71] + 1) = 0;
  *(_OWORD *)((char *)&v222[70] + 8) = 0u;
  *(void *)&v222[72] = "altDSID";
  *((void *)&v222[74] + 1) = &v147;
  *(void *)&v222[76] = "altDSID (for sign-in/out)";
  memset(&v222[83], 0, 32);
  *(void *)&v222[78] = 0;
  memset(&v222[79], 0, 56);
  *((void *)&v222[78] + 1) = "entropy";
  *(void *)&v222[81] = &v157;
  *((void *)&v222[82] + 1) = "escrowed entropy in JSON";
  *((void *)&v222[90] + 1) = 0;
  *(_OWORD *)((char *)&v222[89] + 8) = 0u;
  *((void *)&v222[88] + 1) = 0;
  *(_OWORD *)((char *)&v222[87] + 8) = 0u;
  *(_OWORD *)((char *)&v222[86] + 8) = 0u;
  *(_OWORD *)((char *)&v222[85] + 8) = 0u;
  *(void *)&v222[85] = "appleID";
  *((void *)&v222[87] + 1) = &v144;
  *(void *)&v222[89] = "AppleID";
  memset(&v222[96], 0, 32);
  *(void *)&v222[91] = 0;
  memset(&v222[92], 0, 56);
  *((void *)&v222[91] + 1) = "dsid";
  *(void *)&v222[94] = &v143;
  *((void *)&v222[95] + 1) = "DSID";
  LOBYTE(v222[96]) = 1;
  *((void *)&v222[103] + 1) = 0;
  *(_OWORD *)((char *)&v222[102] + 8) = 0u;
  *((void *)&v222[101] + 1) = 0;
  *(_OWORD *)((char *)&v222[100] + 8) = 0u;
  *(_OWORD *)((char *)&v222[99] + 8) = 0u;
  *(_OWORD *)((char *)&v222[98] + 8) = 0u;
  *(void *)&v222[98] = "container";
  *((void *)&v222[100] + 1) = &v146;
  *(void *)&v222[102] = "CloudKit container name";
  memset(&v222[109], 0, 32);
  *(void *)&v222[104] = 0;
  memset(&v222[105], 0, 56);
  *((void *)&v222[104] + 1) = "context";
  *(void *)&v222[107] = &v158;
  *((void *)&v222[108] + 1) = "Context name";
  *((void *)&v222[116] + 1) = 0;
  *(_OWORD *)((char *)&v222[115] + 8) = 0u;
  *((void *)&v222[114] + 1) = 0;
  *(_OWORD *)((char *)&v222[113] + 8) = 0u;
  *(_OWORD *)((char *)&v222[112] + 8) = 0u;
  *(_OWORD *)((char *)&v222[111] + 8) = 0u;
  *(void *)&v222[111] = "radar";
  *((void *)&v222[113] + 1) = &v145;
  *(void *)&v222[115] = "Radar number";
  memset(&v222[122], 0, 32);
  *(void *)&v222[117] = 0;
  memset(&v222[118], 0, 56);
  *((void *)&v222[117] + 1) = "wrapping-key";
  *(void *)&v222[120] = &v142;
  *((void *)&v222[121] + 1) = "Wrapping key (for joinWithCustodianRecoveryKey)";
  LOBYTE(v222[122]) = 1;
  *((void *)&v222[129] + 1) = 0;
  *(_OWORD *)((char *)&v222[128] + 8) = 0u;
  *((void *)&v222[127] + 1) = 0;
  *(_OWORD *)((char *)&v222[126] + 8) = 0u;
  *(_OWORD *)((char *)&v222[125] + 8) = 0u;
  *(_OWORD *)((char *)&v222[124] + 8) = 0u;
  *(void *)&v222[124] = "wrapped-key";
  *((void *)&v222[126] + 1) = &v141;
  *(void *)&v222[128] = "Wrapped key (for joinWithCustodianRecoveryKey)";
  BYTE8(v222[128]) = 1;
  memset(&v222[135], 0, 32);
  *(void *)&v222[130] = 0;
  memset(&v222[131], 0, 56);
  *((void *)&v222[130] + 1) = "claim-token";
  *(void *)&v222[133] = &v140;
  *((void *)&v222[134] + 1) = "Claim token for inheritance";
  LOBYTE(v222[135]) = 1;
  *((void *)&v222[142] + 1) = 0;
  *(_OWORD *)((char *)&v222[141] + 8) = 0u;
  *((void *)&v222[140] + 1) = 0;
  *(_OWORD *)((char *)&v222[139] + 8) = 0u;
  *(_OWORD *)((char *)&v222[138] + 8) = 0u;
  *(_OWORD *)((char *)&v222[137] + 8) = 0u;
  *(void *)&v222[137] = "custodianUUID";
  *((void *)&v222[139] + 1) = &v139;
  *(void *)&v222[141] = "UUID for joinWithCustodianRecoveryKey";
  BYTE8(v222[141]) = 1;
  memset(&v222[148], 0, 32);
  *(void *)&v222[143] = 0;
  memset(&v222[144], 0, 56);
  *((void *)&v222[143] + 1) = "inheritanceUUID";
  *(void *)&v222[146] = &v138;
  *((void *)&v222[147] + 1) = "UUID for joinWithInheritanceKey";
  LOBYTE(v222[148]) = 1;
  *((void *)&v222[155] + 1) = 0;
  *(_OWORD *)((char *)&v222[154] + 8) = 0u;
  *((void *)&v222[153] + 1) = 0;
  *(_OWORD *)((char *)&v222[152] + 8) = 0u;
  *(_OWORD *)((char *)&v222[151] + 8) = 0u;
  *(_OWORD *)((char *)&v222[150] + 8) = 0u;
  *(void *)&v222[150] = "timeout";
  *((void *)&v222[152] + 1) = &v137;
  *(void *)&v222[154] = "timeout for command (in s)";
  memset(&v222[161], 0, 32);
  *(void *)&v222[156] = 0;
  memset(&v222[157], 0, 56);
  *((void *)&v222[156] + 1) = "idms-target-context";
  *(void *)&v222[159] = &v135;
  *((void *)&v222[160] + 1) = "idmsTargetContext";
  LOBYTE(v222[161]) = 1;
  *((void *)&v222[168] + 1) = 0;
  *(_OWORD *)((char *)&v222[167] + 8) = 0u;
  *((void *)&v222[166] + 1) = 0;
  *(_OWORD *)((char *)&v222[165] + 8) = 0u;
  *(_OWORD *)((char *)&v222[164] + 8) = 0u;
  *(_OWORD *)((char *)&v222[163] + 8) = 0u;
  *(void *)&v222[163] = "idms-cuttlefish-password";
  *((void *)&v222[165] + 1) = &v134;
  *(void *)&v222[167] = "idmsCuttlefishPassword";
  BYTE8(v222[167]) = 1;
  LOBYTE(v222[169]) = 0;
  *((void *)&v222[169] + 1) = 0;
  *(void *)&v222[170] = "start";
  *((void *)&v222[170] + 1) = 0;
  LOBYTE(v222[171]) = 0;
  *(_OWORD *)((char *)&v222[171] + 8) = 0u;
  *((void *)&v222[172] + 1) = (char *)&v186 + 4;
  LODWORD(v222[173]) = 1;
  *((void *)&v222[173] + 1) = "Start Octagon state machine";
  LOBYTE(v222[174]) = 1;
  *(void *)&v222[176] = 0;
  BYTE8(v222[175]) = 0;
  *(_OWORD *)((char *)&v222[174] + 8) = 0u;
  *((void *)&v222[176] + 1) = "sign-in";
  *(void *)&v222[177] = 0;
  BYTE8(v222[177]) = 0;
  v222[178] = 0u;
  *(void *)&v222[179] = &v186;
  DWORD2(v222[179]) = 1;
  *(void *)&v222[180] = "Inform Cuttlefish container of sign in";
  BYTE8(v222[180]) = 1;
  *((void *)&v222[182] + 1) = 0;
  memset(&v222[181], 0, 17);
  *(void *)&v222[183] = "sign-out";
  *((void *)&v222[183] + 1) = 0;
  LOBYTE(v222[184]) = 0;
  *(_OWORD *)((char *)&v222[184] + 8) = 0u;
  *((void *)&v222[185] + 1) = (char *)&v185 + 4;
  LODWORD(v222[186]) = 1;
  *((void *)&v222[186] + 1) = "Inform Cuttlefish container of sign out";
  LOBYTE(v222[187]) = 1;
  *(void *)&v222[189] = 0;
  BYTE8(v222[188]) = 0;
  *(_OWORD *)((char *)&v222[187] + 8) = 0u;
  *((void *)&v222[189] + 1) = "status";
  *(void *)&v222[190] = 0;
  BYTE8(v222[190]) = 0;
  v222[191] = 0u;
  *(void *)&v222[192] = (char *)&v181 + 4;
  DWORD2(v222[192]) = 1;
  *(void *)&v222[193] = "Report Octagon status";
  BYTE8(v222[193]) = 0;
  *((void *)&v222[195] + 1) = 0;
  memset(&v222[194], 0, 17);
  *(void *)&v222[196] = "resetoctagon";
  *((void *)&v222[196] + 1) = 0;
  LOBYTE(v222[197]) = 0;
  *(_OWORD *)((char *)&v222[197] + 8) = 0u;
  *((void *)&v222[198] + 1) = &v185;
  LODWORD(v222[199]) = 1;
  *((void *)&v222[199] + 1) = "Reset and establish new Octagon trust";
  LOBYTE(v222[200]) = 1;
  *(void *)&v222[202] = 0;
  BYTE8(v222[201]) = 0;
  *(_OWORD *)((char *)&v222[200] + 8) = 0u;
  *((void *)&v222[202] + 1) = "resetProtectedData";
  *(void *)&v222[203] = 0;
  BYTE8(v222[203]) = 0;
  v222[204] = 0u;
  *(void *)&v222[205] = (char *)&v184 + 4;
  DWORD2(v222[205]) = 1;
  *(void *)&v222[206] = "Reset ProtectedData";
  BYTE8(v222[206]) = 1;
  *((void *)&v222[208] + 1) = 0;
  memset(&v222[207], 0, 17);
  *(void *)&v222[209] = "reset";
  *((void *)&v222[209] + 1) = 0;
  LOBYTE(v222[210]) = 0;
  *(_OWORD *)((char *)&v222[210] + 8) = 0u;
  *((void *)&v222[211] + 1) = &v184;
  LODWORD(v222[212]) = 1;
  *((void *)&v222[212] + 1) = "Reset Octagon trust";
  LOBYTE(v222[213]) = 1;
  *(void *)&v222[215] = 0;
  *((void *)&v222[250] + 1) = (char *)&v180 + 4;
  memset(&v222[376], 0, 17);
  BYTE8(v222[372]) = 0;
  *(void *)&v222[375] = "Store an inheritance key";
  BYTE8(v222[375]) = 1;
  *((void *)&v222[377] + 1) = 0;
  v222[373] = 0u;
  *(void *)&v222[374] = (char *)&v169 + 4;
  DWORD2(v222[374]) = 1;
  BYTE8(v222[370]) = 0;
  *(_OWORD *)((char *)&v222[369] + 8) = 0u;
  *((void *)&v222[371] + 1) = "store-inheritance-key";
  *(void *)&v222[372] = 0;
  LODWORD(v222[368]) = 1;
  *((void *)&v222[368] + 1) = "Generate an inheritance key";
  LOBYTE(v222[369]) = 1;
  *(void *)&v222[371] = 0;
  LOBYTE(v222[366]) = 0;
  *(_OWORD *)((char *)&v222[366] + 8) = 0u;
  *((void *)&v222[367] + 1) = &v170;
  memset(&v222[363], 0, 17);
  *(void *)&v222[365] = "generate-inheritance-key";
  *((void *)&v222[365] + 1) = 0;
  BYTE8(v222[359]) = 0;
  *(void *)&v222[362] = "Create an inheritance key";
  BYTE8(v222[362]) = 1;
  *((void *)&v222[364] + 1) = 0;
  v222[360] = 0u;
  *(void *)&v222[361] = (char *)&v170 + 4;
  DWORD2(v222[361]) = 1;
  BYTE8(v222[357]) = 0;
  *(_OWORD *)((char *)&v222[356] + 8) = 0u;
  *((void *)&v222[358] + 1) = "create-inheritance-key";
  *(void *)&v222[359] = 0;
  LODWORD(v222[355]) = 1;
  *((void *)&v222[355] + 1) = "Check a custodian recovery key for existence";
  LOBYTE(v222[356]) = 1;
  *(void *)&v222[358] = 0;
  LOBYTE(v222[353]) = 0;
  *(_OWORD *)((char *)&v222[353] + 8) = 0u;
  *((void *)&v222[354] + 1) = (char *)&v173 + 4;
  memset(&v222[350], 0, 17);
  *(void *)&v222[352] = "check-custodian-recovery-key";
  *((void *)&v222[352] + 1) = 0;
  BYTE8(v222[346]) = 0;
  *(void *)&v222[349] = "Remove a custodian recovery key";
  BYTE8(v222[349]) = 1;
  *((void *)&v222[351] + 1) = 0;
  v222[347] = 0u;
  *(void *)&v222[348] = &v174;
  DWORD2(v222[348]) = 1;
  BYTE8(v222[344]) = 0;
  *(_OWORD *)((char *)&v222[343] + 8) = 0u;
  *((void *)&v222[345] + 1) = "remove-custodian-recovery-key";
  *(void *)&v222[346] = 0;
  LODWORD(v222[342]) = 1;
  *((void *)&v222[342] + 1) = "Preflight join with a custodian recovery key";
  LOBYTE(v222[343]) = 1;
  *(void *)&v222[345] = 0;
  LOBYTE(v222[340]) = 0;
  *(_OWORD *)((char *)&v222[340] + 8) = 0u;
  *((void *)&v222[341] + 1) = (char *)&v174 + 4;
  memset(&v222[337], 0, 17);
  *(void *)&v222[339] = "preflight-join-with-custodian-recovery-key";
  *((void *)&v222[339] + 1) = 0;
  BYTE8(v222[333]) = 0;
  *(void *)&v222[336] = "Join with a custodian recovery key";
  BYTE8(v222[336]) = 1;
  *((void *)&v222[338] + 1) = 0;
  v222[334] = 0u;
  *(void *)&v222[335] = &v175;
  DWORD2(v222[335]) = 1;
  BYTE8(v222[331]) = 0;
  *(_OWORD *)((char *)&v222[330] + 8) = 0u;
  *((void *)&v222[332] + 1) = "join-with-custodian-recovery-key";
  *(void *)&v222[333] = 0;
  LODWORD(v222[329]) = 1;
  *((void *)&v222[329] + 1) = "Create a custodian recovery key";
  LOBYTE(v222[330]) = 1;
  *(void *)&v222[332] = 0;
  LOBYTE(v222[327]) = 0;
  *(_OWORD *)((char *)&v222[327] + 8) = 0u;
  *((void *)&v222[328] + 1) = (char *)&v175 + 4;
  memset(&v222[324], 0, 17);
  *(void *)&v222[326] = "create-custodian-recovery-key";
  *((void *)&v222[326] + 1) = 0;
  BYTE8(v222[320]) = 0;
  *(void *)&v222[323] = "Reset an account's CDP contents (escrow records, kvs data, cuttlefish)";
  BYTE8(v222[323]) = 1;
  *((void *)&v222[325] + 1) = 0;
  v222[321] = 0u;
  *(void *)&v222[322] = &v176;
  DWORD2(v222[322]) = 1;
  BYTE8(v222[318]) = 0;
  *(_OWORD *)((char *)&v222[317] + 8) = 0u;
  *((void *)&v222[319] + 1) = "reset-account-cdp-contents";
  *(void *)&v222[320] = 0;
  LODWORD(v222[316]) = 1;
  *((void *)&v222[316] + 1) = "Silent record recovery";
  LOBYTE(v222[317]) = 0;
  *(void *)&v222[319] = 0;
  LOBYTE(v222[314]) = 0;
  *(_OWORD *)((char *)&v222[314] + 8) = 0u;
  *((void *)&v222[315] + 1) = (char *)&v176 + 4;
  memset(&v222[311], 0, 17);
  *(void *)&v222[313] = "recover-record-silent";
  *((void *)&v222[313] + 1) = 0;
  BYTE8(v222[307]) = 0;
  *(void *)&v222[310] = "Recover record";
  BYTE8(v222[310]) = 0;
  *((void *)&v222[312] + 1) = 0;
  v222[308] = 0u;
  *(void *)&v222[309] = &v177;
  DWORD2(v222[309]) = 1;
  BYTE8(v222[305]) = 0;
  *(_OWORD *)((char *)&v222[304] + 8) = 0u;
  *((void *)&v222[306] + 1) = "recover-record";
  *(void *)&v222[307] = 0;
  LODWORD(v222[303]) = 1;
  *((void *)&v222[303] + 1) = "Fetch All Escrow Records";
  LOBYTE(v222[304]) = 0;
  *(void *)&v222[306] = 0;
  LOBYTE(v222[301]) = 0;
  *(_OWORD *)((char *)&v222[301] + 8) = 0u;
  *((void *)&v222[302] + 1) = (char *)&v177 + 4;
  memset(&v222[298], 0, 17);
  *(void *)&v222[300] = "fetchAllEscrowRecords";
  *((void *)&v222[300] + 1) = 0;
  BYTE8(v222[294]) = 0;
  *(void *)&v222[297] = "Fetch Escrow Records";
  BYTE8(v222[297]) = 0;
  *((void *)&v222[299] + 1) = 0;
  v222[295] = 0u;
  *(void *)&v222[296] = &v178;
  DWORD2(v222[296]) = 1;
  BYTE8(v222[292]) = 0;
  *(_OWORD *)((char *)&v222[291] + 8) = 0u;
  *((void *)&v222[293] + 1) = "fetchEscrowRecords";
  *(void *)&v222[294] = 0;
  LODWORD(v222[290]) = 1;
  *((void *)&v222[290] + 1) = "Trigger a TapToRadar";
  LOBYTE(v222[291]) = 1;
  *(void *)&v222[293] = 0;
  LOBYTE(v222[288]) = 0;
  *(_OWORD *)((char *)&v222[288] + 8) = 0u;
  *((void *)&v222[289] + 1) = (char *)&v178 + 4;
  memset(&v222[285], 0, 17);
  *(void *)&v222[287] = "taptoradar";
  *((void *)&v222[287] + 1) = 0;
  BYTE8(v222[281]) = 0;
  *(void *)&v222[284] = "Trigger a refetch of the CKKS policy";
  BYTE8(v222[284]) = 0;
  *((void *)&v222[286] + 1) = 0;
  v222[282] = 0u;
  *(void *)&v222[283] = &v179;
  DWORD2(v222[283]) = 1;
  BYTE8(v222[279]) = 0;
  *(_OWORD *)((char *)&v222[278] + 8) = 0u;
  *((void *)&v222[280] + 1) = "ckks-policy";
  *(void *)&v222[281] = 0;
  LODWORD(v222[277]) = 1;
  *((void *)&v222[277] + 1) = "Simulate receiving a Octagon push notification";
  LOBYTE(v222[278]) = 1;
  *(void *)&v222[280] = 0;
  LOBYTE(v222[275]) = 0;
  *(_OWORD *)((char *)&v222[275] + 8) = 0u;
  *((void *)&v222[276] + 1) = &v162;
  memset(&v222[272], 0, 17);
  *(void *)&v222[274] = "simulate-receive-push";
  *((void *)&v222[274] + 1) = 0;
  BYTE8(v222[268]) = 0;
  *(void *)&v222[271] = "Check Octagon Health status";
  BYTE8(v222[271]) = 0;
  *((void *)&v222[273] + 1) = 0;
  v222[269] = 0u;
  *(void *)&v222[270] = (char *)&v162 + 4;
  DWORD2(v222[270]) = 1;
  BYTE8(v222[266]) = 0;
  *(_OWORD *)((char *)&v222[265] + 8) = 0u;
  *((void *)&v222[267] + 1) = "health";
  *(void *)&v222[268] = 0;
  LODWORD(v222[264]) = 1;
  *((void *)&v222[264] + 1) = "Store any pending Escrow Request prerecords";
  LOBYTE(v222[265]) = 0;
  *(void *)&v222[267] = 0;
  LOBYTE(v222[262]) = 0;
  *(_OWORD *)((char *)&v222[262] + 8) = 0u;
  *((void *)&v222[263] + 1) = (char *)&v179 + 4;
  memset(&v222[259], 0, 17);
  *(void *)&v222[261] = "er-store";
  *((void *)&v222[261] + 1) = 0;
  BYTE8(v222[255]) = 0;
  *(void *)&v222[258] = "Delete all Escrow Request requests";
  BYTE8(v222[258]) = 0;
  *((void *)&v222[260] + 1) = 0;
  v222[256] = 0u;
  *(void *)&v222[257] = &v180;
  DWORD2(v222[257]) = 1;
  BYTE8(v222[253]) = 0;
  *(_OWORD *)((char *)&v222[252] + 8) = 0u;
  *((void *)&v222[254] + 1) = "er-reset";
  *(void *)&v222[255] = 0;
  LODWORD(v222[251]) = 1;
  *((void *)&v222[251] + 1) = "Report status on any pending Escrow Request requests";
  LOBYTE(v222[252]) = 0;
  *(void *)&v222[254] = 0;
  BYTE8(v222[214]) = 0;
  *((void *)&v222[248] + 1) = 0;
  LOBYTE(v222[249]) = 0;
  *(_OWORD *)((char *)&v222[249] + 8) = 0u;
  *((void *)&v222[247] + 1) = 0;
  memset(&v222[246], 0, 17);
  *(void *)&v222[248] = "er-status";
  DWORD2(v222[244]) = 1;
  *(void *)&v222[245] = "Trigger an Escrow Request request";
  BYTE8(v222[245]) = 1;
  BYTE8(v222[242]) = 0;
  v222[243] = 0u;
  *(void *)&v222[244] = &v181;
  BYTE8(v222[240]) = 0;
  *(_OWORD *)((char *)&v222[239] + 8) = 0u;
  *((void *)&v222[241] + 1) = "er-trigger";
  *(void *)&v222[242] = 0;
  LODWORD(v222[238]) = 1;
  *((void *)&v222[238] + 1) = "Depart from Octagon Trust";
  LOBYTE(v222[239]) = 1;
  *(void *)&v222[241] = 0;
  *((void *)&v222[228] + 1) = "recover";
  LOBYTE(v222[236]) = 0;
  *(_OWORD *)((char *)&v222[236] + 8) = 0u;
  *((void *)&v222[237] + 1) = &v182;
  memset(&v222[233], 0, 17);
  *(void *)&v222[235] = "depart";
  *((void *)&v222[235] + 1) = 0;
  DWORD2(v222[231]) = 1;
  *(void *)&v222[232] = "Recover using this bottle";
  BYTE8(v222[232]) = 0;
  *((void *)&v222[234] + 1) = 0;
  *(void *)&v222[229] = 0;
  BYTE8(v222[229]) = 0;
  v222[230] = 0u;
  *(void *)&v222[231] = (char *)&v182 + 4;
  *(void *)&v222[228] = 0;
  BYTE8(v222[227]) = 0;
  *(_OWORD *)((char *)&v222[226] + 8) = 0u;
  *((void *)&v222[224] + 1) = &v183;
  LODWORD(v222[225]) = 1;
  *((void *)&v222[225] + 1) = "Fetch all viable bottles";
  LOBYTE(v222[226]) = 0;
  *(void *)&v222[222] = "allBottles";
  *((void *)&v222[222] + 1) = 0;
  LOBYTE(v222[223]) = 0;
  *(_OWORD *)((char *)&v222[223] + 8) = 0u;
  *(_OWORD *)((char *)&v222[213] + 8) = 0u;
  *((void *)&v222[215] + 1) = "user-controllable-views";
  *((void *)&v222[221] + 1) = 0;
  memset(&v222[220], 0, 17);
  *(void *)&v222[218] = (char *)&v183 + 4;
  DWORD2(v222[218]) = 1;
  *(void *)&v222[219] = "Modify or view user-controllable views status (If one of --enable or --pause is passed, will modify status)";
  BYTE8(v222[219]) = 1;
  *(void *)&v222[216] = 0;
  BYTE8(v222[216]) = 0;
  v222[217] = 0u;
  *(void *)&v222[378] = "join-with-inheritance-key";
  *((void *)&v222[378] + 1) = 0;
  LOBYTE(v222[379]) = 0;
  *(_OWORD *)((char *)&v222[379] + 8) = 0u;
  *((void *)&v222[380] + 1) = &v169;
  LODWORD(v222[381]) = 1;
  *((void *)&v222[381] + 1) = "Join with an inheritance key";
  LOBYTE(v222[382]) = 1;
  *(void *)&v222[384] = 0;
  BYTE8(v222[383]) = 0;
  *(_OWORD *)((char *)&v222[382] + 8) = 0u;
  *((void *)&v222[384] + 1) = "preflight-join-with-inheritance-key";
  *(void *)&v222[385] = 0;
  BYTE8(v222[385]) = 0;
  v222[386] = 0u;
  *(void *)&v222[387] = (char *)&v168 + 4;
  DWORD2(v222[387]) = 1;
  *(void *)&v222[388] = "Preflight join with an inheritance key";
  BYTE8(v222[388]) = 1;
  *((void *)&v222[390] + 1) = 0;
  memset(&v222[389], 0, 17);
  *(void *)&v222[391] = "remove-inheritance-key";
  *((void *)&v222[391] + 1) = 0;
  LOBYTE(v222[392]) = 0;
  *(_OWORD *)((char *)&v222[392] + 8) = 0u;
  *((void *)&v222[393] + 1) = &v168;
  LODWORD(v222[394]) = 1;
  *((void *)&v222[394] + 1) = "Remove an inheritance key";
  LOBYTE(v222[395]) = 1;
  *(void *)&v222[397] = 0;
  BYTE8(v222[396]) = 0;
  *(_OWORD *)((char *)&v222[395] + 8) = 0u;
  *((void *)&v222[397] + 1) = "check-inheritance-key";
  *(void *)&v222[398] = 0;
  BYTE8(v222[398]) = 0;
  v222[399] = 0u;
  *(void *)&v222[400] = (char *)&v167 + 4;
  DWORD2(v222[400]) = 1;
  *(void *)&v222[401] = "Check an inheritance key for existence";
  BYTE8(v222[401]) = 1;
  *((void *)&v222[403] + 1) = 0;
  memset(&v222[402], 0, 17);
  *(void *)&v222[404] = "recreate-inheritance-key";
  *((void *)&v222[404] + 1) = 0;
  LOBYTE(v222[405]) = 0;
  *(_OWORD *)((char *)&v222[405] + 8) = 0u;
  *((void *)&v222[406] + 1) = &v167;
  LODWORD(v222[407]) = 1;
  *((void *)&v222[407] + 1) = "Recreate an inheritance key";
  LOBYTE(v222[408]) = 1;
  *(void *)&v222[410] = 0;
  BYTE8(v222[409]) = 0;
  *(_OWORD *)((char *)&v222[408] + 8) = 0u;
  *((void *)&v222[410] + 1) = "create-inheritance-key-with-claim-wrapping";
  *(void *)&v222[411] = 0;
  BYTE8(v222[411]) = 0;
  v222[412] = 0u;
  *(void *)&v222[413] = (char *)&v166 + 4;
  DWORD2(v222[413]) = 1;
  *(void *)&v222[414] = "Create an inheritance key given claim+wrapping key";
  BYTE8(v222[414]) = 1;
  *((void *)&v222[416] + 1) = 0;
  memset(&v222[415], 0, 17);
  *(void *)&v222[417] = "tlk-recoverability";
  *((void *)&v222[417] + 1) = 0;
  LOBYTE(v222[418]) = 0;
  *(_OWORD *)((char *)&v222[418] + 8) = 0u;
  *((void *)&v222[419] + 1) = (char *)&v161 + 4;
  LODWORD(v222[420]) = 1;
  *((void *)&v222[420] + 1) = "Evaluate tlk recoverability for an account";
  LOBYTE(v222[421]) = 1;
  *(void *)&v222[423] = 0;
  BYTE8(v222[422]) = 0;
  *(_OWORD *)((char *)&v222[421] + 8) = 0u;
  *((void *)&v222[423] + 1) = "set-machine-id-override";
  *(void *)&v222[424] = 0;
  BYTE8(v222[424]) = 0;
  v222[425] = 0u;
  *(void *)&v222[426] = &v161;
  DWORD2(v222[426]) = 1;
  *(void *)&v222[427] = "Set machineID override";
  BYTE8(v222[427]) = 0;
  *((void *)&v222[429] + 1) = 0;
  memset(&v222[428], 0, 17);
  *(void *)&v222[430] = "remove-recovery-key";
  *((void *)&v222[430] + 1) = 0;
  LOBYTE(v222[431]) = 0;
  *(_OWORD *)((char *)&v222[431] + 8) = 0u;
  *((void *)&v222[432] + 1) = (char *)&v172 + 4;
  LODWORD(v222[433]) = 1;
  *((void *)&v222[433] + 1) = "Remove a recovery key";
  LOBYTE(v222[434]) = 1;
  *(void *)&v222[436] = 0;
  BYTE8(v222[435]) = 0;
  *(_OWORD *)((char *)&v222[434] + 8) = 0u;
  *((void *)&v222[436] + 1) = "set-recovery-key";
  *(void *)&v222[437] = 0;
  BYTE8(v222[437]) = 0;
  v222[438] = 0u;
  *(void *)&v222[439] = &v173;
  DWORD2(v222[439]) = 1;
  *(void *)&v222[440] = "Set a recovery key";
  BYTE8(v222[440]) = 1;
  *((void *)&v222[442] + 1) = 0;
  memset(&v222[441], 0, 17);
  *(void *)&v222[443] = "join-with-recovery-key";
  *((void *)&v222[443] + 1) = 0;
  LOBYTE(v222[444]) = 0;
  *(_OWORD *)((char *)&v222[444] + 8) = 0u;
  *((void *)&v222[445] + 1) = &v172;
  LODWORD(v222[446]) = 1;
  *((void *)&v222[446] + 1) = "Join with a recovery key";
  LOBYTE(v222[447]) = 1;
  *(void *)&v222[449] = 0;
  BYTE8(v222[448]) = 0;
  *(_OWORD *)((char *)&v222[447] + 8) = 0u;
  *((void *)&v222[449] + 1) = "check-recovery-key";
  *(void *)&v222[450] = 0;
  BYTE8(v222[450]) = 0;
  v222[451] = 0u;
  *(void *)&v222[452] = (char *)&v171 + 4;
  DWORD2(v222[452]) = 1;
  *(void *)&v222[453] = "Check a recovery key";
  BYTE8(v222[453]) = 1;
  *((void *)&v222[455] + 1) = 0;
  memset(&v222[454], 0, 17);
  *(void *)&v222[456] = "preflight-join-with-recovery-key";
  *((void *)&v222[456] + 1) = 0;
  LOBYTE(v222[457]) = 0;
  *(_OWORD *)((char *)&v222[457] + 8) = 0u;
  *((void *)&v222[458] + 1) = &v171;
  *((void *)&v222[465] + 1) = 0;
  *(_OWORD *)((char *)&v222[464] + 8) = 0u;
  *(_OWORD *)((char *)&v222[463] + 8) = 0u;
  *(_OWORD *)((char *)&v222[462] + 8) = 0u;
  LODWORD(v222[459]) = 1;
  *((void *)&v222[459] + 1) = "Preflight join with a recovery key";
  LOBYTE(v222[460]) = 1;
  *((void *)&v222[467] + 1) = 0;
  *(_OWORD *)((char *)&v222[466] + 8) = 0u;
  *((void *)&v222[461] + 1) = 0;
  *(_OWORD *)((char *)&v222[460] + 8) = 0u;
  *(void *)&v222[462] = "recoveryKey";
  *((void *)&v222[464] + 1) = &v136;
  *(void *)&v222[466] = "recovery key";
  LOBYTE(v222[468]) = 0;
  *((void *)&v222[468] + 1) = 0;
  *(void *)&v222[469] = "enable-walrus";
  *((void *)&v222[469] + 1) = 0;
  LOBYTE(v222[470]) = 0;
  *(_OWORD *)((char *)&v222[470] + 8) = 0u;
  *((void *)&v222[471] + 1) = (char *)&v164 + 4;
  LODWORD(v222[472]) = 1;
  *((void *)&v222[472] + 1) = "Enable Walrus Setting";
  LOBYTE(v222[473]) = 1;
  *(void *)&v222[475] = 0;
  BYTE8(v222[474]) = 0;
  *(_OWORD *)((char *)&v222[473] + 8) = 0u;
  *((void *)&v222[475] + 1) = "disable-walrus";
  *(void *)&v222[476] = 0;
  v222[477] = 0u;
  BYTE8(v222[476]) = 0;
  *(void *)&v222[478] = &v164;
  DWORD2(v222[478]) = 1;
  *(void *)&v222[479] = "Disable Walrus Setting";
  BYTE8(v222[479]) = 1;
  *((void *)&v222[481] + 1) = 0;
  memset(&v222[480], 0, 17);
  *(void *)&v222[482] = "enable-webaccess";
  *((void *)&v222[482] + 1) = 0;
  LOBYTE(v222[483]) = 0;
  *(_OWORD *)((char *)&v222[483] + 8) = 0u;
  *((void *)&v222[484] + 1) = (char *)&v163 + 4;
  LODWORD(v222[485]) = 1;
  *((void *)&v222[485] + 1) = "Enable Web Access Setting";
  LOBYTE(v222[486]) = 1;
  *(void *)&v222[488] = 0;
  BYTE8(v222[487]) = 0;
  *(_OWORD *)((char *)&v222[486] + 8) = 0u;
  *((void *)&v222[488] + 1) = "disable-webaccess";
  *(void *)&v222[489] = 0;
  v222[490] = 0u;
  BYTE8(v222[489]) = 0;
  *(void *)&v222[491] = &v163;
  DWORD2(v222[491]) = 1;
  *(void *)&v222[492] = "Disable Web Access Setting";
  BYTE8(v222[492]) = 1;
  *((void *)&v222[494] + 1) = 0;
  memset(&v222[493], 0, 17);
  *(void *)&v222[495] = "fetch-account-state";
  *((void *)&v222[495] + 1) = 0;
  LOBYTE(v222[496]) = 0;
  *(_OWORD *)((char *)&v222[496] + 8) = 0u;
  *((void *)&v222[497] + 1) = &v166;
  LODWORD(v222[498]) = 1;
  *((void *)&v222[498] + 1) = "Fetch Account Settings";
  LOBYTE(v222[499]) = 1;
  *(void *)&v222[501] = 0;
  BYTE8(v222[500]) = 0;
  *(_OWORD *)((char *)&v222[499] + 8) = 0u;
  *((void *)&v222[501] + 1) = "fetch-account-wide-state";
  *(void *)&v222[502] = 0;
  v222[503] = 0u;
  BYTE8(v222[502]) = 0;
  *(void *)&v222[504] = (char *)&v165 + 4;
  DWORD2(v222[504]) = 1;
  *(void *)&v222[505] = "Fetch Account Wide Settings";
  BYTE8(v222[505]) = 1;
  *((void *)&v222[507] + 1) = 0;
  memset(&v222[506], 0, 17);
  *(void *)&v222[508] = "fetch-account-wide-state-default";
  *((void *)&v222[508] + 1) = 0;
  LOBYTE(v222[509]) = 0;
  *(_OWORD *)((char *)&v222[509] + 8) = 0u;
  *((void *)&v222[510] + 1) = &v165;
  LODWORD(v222[511]) = 1;
  *((void *)&v222[511] + 1) = "Fetch Account Wide Settings with Default";
  LOBYTE(v222[512]) = 1;
  *(void *)&v222[514] = 0;
  BYTE8(v222[513]) = 0;
  *(_OWORD *)((char *)&v222[512] + 8) = 0u;
  *((void *)&v222[514] + 1) = "print-account-metadata";
  *(void *)&v222[515] = 0;
  BYTE8(v222[515]) = 0;
  v222[516] = 0u;
  *(void *)&v222[517] = (char *)&v149 + 4;
  DWORD2(v222[517]) = 1;
  *(void *)&v222[518] = "Print Account Metadata";
  BYTE8(v222[518]) = 1;
  *((void *)&v222[520] + 1) = 0;
  memset(&v222[519], 0, 17);
  *(void *)&v222[521] = "reroll";
  *((void *)&v222[521] + 1) = 0;
  LOBYTE(v222[522]) = 0;
  *(_OWORD *)((char *)&v222[522] + 8) = 0u;
  *((void *)&v222[523] + 1) = &v160;
  LODWORD(v222[524]) = 1;
  *((void *)&v222[524] + 1) = "Reroll PeerID";
  LOBYTE(v222[525]) = 1;
  *((void *)&v222[532] + 1) = 0;
  *(_OWORD *)((char *)&v222[531] + 8) = 0u;
  *(_OWORD *)((char *)&v222[530] + 8) = 0u;
  *(_OWORD *)((char *)&v222[529] + 8) = 0u;
  *(_OWORD *)((char *)&v222[528] + 8) = 0u;
  *(_OWORD *)((char *)&v222[527] + 8) = 0u;
  *(_OWORD *)((char *)&v222[526] + 8) = 0u;
  *(_OWORD *)((char *)&v222[525] + 8) = 0u;
  v132[0] = "otctl";
  v132[1] = "Control and report on Octagon Trust";
  v132[2] = v196;
  memset(v195, 170, sizeof(v195));
  sub_100003494((uint64_t)v195, (uint64_t)v132);
  unint64_t v2 = sub_1000035C0((uint64_t)v195);
  uint64_t v3 = (option *)malloc_type_calloc(v2 + 1, 0x20uLL, 0x10500402E37B38AuLL);
  size_t v4 = 2 * v2 + 2;
  uint64_t v5 = (char *)malloc_type_malloc(v4, 0x83F72549uLL);
  v6 = v5;
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  uint64_t v9 = (char *)v195[2];
  v10 = (char *)v195[2] + 48;
  do
  {
    if (v7 >= v2) {
      goto LABEL_13;
    }
    uint64_t v11 = (const char *)*((void *)v10 - 5);
    if (v11)
    {
      v3[v7].name = v11;
      uint64_t v13 = *(void *)v10;
      uint64_t v12 = (int *)*((void *)v10 + 1);
      if (v12)
      {
        int v14 = 2 * (v13 != 0);
      }
      else if (v13)
      {
        int v14 = 1;
      }
      else
      {
        int v14 = *((void *)v10 + 5) != 0;
      }
      uint64_t v15 = &v3[v7];
      v15->has_arg = v14;
      v15->flag = v12;
      v15->val = *((_DWORD *)v10 + 4);
      ++v7;
    }
    ++v8;
    v10 += 104;
  }
  while (v8 <= v2);
  if (v7 < v2)
  {
    uint64_t v16 = &v3[v7];
    v16->name = 0;
    v16->has_arg = 0;
    v16->flag = 0;
    v16->val = 0;
LABEL_14:
    size_t v17 = 0;
    uint64_t v18 = v9 + 48;
    unint64_t v19 = v2;
    while (1)
    {
      if (*((unsigned char *)v18 - 48))
      {
        if (v17 >= v4) {
          goto LABEL_25;
        }
        v5[v17] = *((unsigned char *)v18 - 48);
        size_t v20 = v17 + 1;
        if (!v18[1] && (*v18 || v18[5]))
        {
          if (v20 >= v4)
          {
LABEL_25:
            char v124 = 0;
            goto LABEL_28;
          }
          v5[v20] = 58;
          v17 += 2;
        }
        else
        {
          ++v17;
        }
      }
      v18 += 13;
      if (!--v19)
      {
        char v124 = 0;
        goto LABEL_27;
      }
    }
  }
LABEL_13:
  if (v2) {
    goto LABEL_14;
  }
  size_t v17 = 0;
  char v124 = 1;
LABEL_27:
  v5[v17] = 0;
LABEL_28:
  int v194 = 0;
  do
  {
    while (1)
    {
      int v21 = getopt_long(v126, v128, v6, v3, &v194);
      if (v21) {
        break;
      }
      if (!v194)
      {
LABEL_167:
        sub_100003638((uint64_t)v195);
        exit(1);
      }
      if ((v124 & 1) == 0)
      {
        uint64_t v23 = 0;
        p_name = &v3[v194].name;
        unint64_t v25 = v2;
        do
        {
          v26 = (char *)v195[2] + v23;
          v27 = *(const char **)((char *)v195[2] + v23 + 8);
          if (v27)
          {
            if (*p_name)
            {
              size_t v28 = strlen(*(const char **)((char *)v195[2] + v23 + 8));
              if (!strncmp(*p_name, v27, v28))
              {
                long long v29 = *((_OWORD *)v26 + 5);
                long long v191 = *((_OWORD *)v26 + 4);
                long long v192 = v29;
                uint64_t v193 = *((void *)v26 + 12);
                long long v30 = *((_OWORD *)v26 + 1);
                long long v187 = *(_OWORD *)v26;
                long long v188 = v30;
                long long v31 = *((_OWORD *)v26 + 3);
                long long v189 = *((_OWORD *)v26 + 2);
                long long v190 = v31;
                sub_100003C04((uint64_t)&v187, optarg);
              }
            }
          }
          v23 += 104;
          --v25;
        }
        while (v25);
      }
    }
    if (v21 == -1)
    {
      uint64_t v39 = optind;
      if (optind >= v126)
      {
LABEL_71:
        free(v195[2]);
        free(v3);
        free(v6);
      }
      else
      {
        unint64_t v40 = 0;
        do
        {
          unint64_t v41 = v40;
          if ((v124 & 1) == 0)
          {
            uint64_t v42 = 0;
            long long v43 = (char *)v195[2];
            long long v44 = (const char **)((char *)v195[2] + 16);
            while (!*v44 || strcmp(v128[v39], *v44))
            {
              ++v42;
              v44 += 13;
              if (v2 == v42) {
                goto LABEL_60;
              }
            }
            v47 = &v43[104 * v42];
            long long v48 = *((_OWORD *)v47 + 5);
            long long v191 = *((_OWORD *)v47 + 4);
            long long v192 = v48;
            uint64_t v193 = *((void *)v47 + 12);
            long long v49 = *((_OWORD *)v47 + 1);
            long long v187 = *(_OWORD *)v47;
            long long v188 = v49;
            long long v50 = *((_OWORD *)v47 + 3);
            long long v189 = *((_OWORD *)v47 + 2);
            long long v190 = v50;
            sub_100003C04((uint64_t)&v187, 0);
            goto LABEL_71;
          }
LABEL_60:
          v36 = v195[2];
          if (v41 >= v2) {
            goto LABEL_50;
          }
          v45 = (char *)v195[2] + 104 * v41 + 24;
          unint64_t v40 = v41;
          while (!*v45)
          {
            ++v40;
            v45 += 13;
            if (v2 == v40) {
              goto LABEL_49;
            }
          }
          v46 = (void *)*((void *)v195[2] + 13 * v40 + 6);
          if (v46)
          {
            void *v46 = v128[v39];
            ++v40;
          }
          ++v39;
        }
        while (v39 != v126);
        free(v195[2]);
        free(v3);
        free(v6);
        if (v41 >= v2) {
          goto LABEL_51;
        }
      }
      id v131 = 0;
      uint64_t v52 = +[OTControl controlObject:1 error:&v131];
      id v53 = v131;
      if (v53 || !v52)
      {
        [v53 description];
        [ objc_claimAutoreleasedReturnValue() UTF8String];
        errx(1, "no OTControl failed: %s");
      }
      if (v158)
      {
        v54 = +[NSString stringWithCString:v158 encoding:4];
      }
      else
      {
        v54 = (char **)OTDefaultContext;
      }
      v129 = v54;
      if (v146)
      {
        v127 = +[NSString stringWithCString:v146 encoding:4];
      }
      else
      {
        v127 = @"com.apple.security.keychain";
        v55 = @"com.apple.security.keychain";
      }
      if (v147)
      {
        v125 = +[NSString stringWithCString:v147 encoding:4];
      }
      else
      {
        v125 = 0;
      }
      if (v143)
      {
        uint64_t v110 = +[NSString stringWithCString:v143 encoding:4];
      }
      else
      {
        uint64_t v110 = 0;
      }
      if (v144)
      {
        uint64_t v121 = +[NSString stringWithCString:v144 encoding:4];
      }
      else
      {
        uint64_t v121 = 0;
      }
      if (v156)
      {
        v112 = +[NSString stringWithCString:v156 encoding:4];
      }
      else
      {
        v112 = @"NO";
      }
      if (v142)
      {
        v119 = +[NSString stringWithCString:v142 encoding:4];
      }
      else
      {
        v119 = 0;
      }
      if (v141)
      {
        v118 = +[NSString stringWithCString:v141 encoding:4];
      }
      else
      {
        v118 = 0;
      }
      if (v140)
      {
        uint64_t v111 = +[NSString stringWithCString:v140 encoding:4];
      }
      else
      {
        uint64_t v111 = 0;
      }
      if (v139)
      {
        v117 = +[NSString stringWithCString:v139 encoding:4];
      }
      else
      {
        v117 = 0;
      }
      if (v138)
      {
        v116 = +[NSString stringWithCString:v138 encoding:4];
      }
      else
      {
        v116 = 0;
      }
      if (v137)
      {
        v56 = +[NSString stringWithCString:v137 encoding:4];
        double v57 = (double)(uint64_t)[v56 integerValue];
      }
      else
      {
        double v57 = 600.0;
      }
      if (v135)
      {
        uint64_t v58 = +[NSString stringWithCString:v135 encoding:4];
      }
      else
      {
        uint64_t v58 = 0;
      }
      if (v134)
      {
        uint64_t v59 = +[NSString stringWithCString:v134 encoding:4];
      }
      else
      {
        uint64_t v59 = 0;
      }
      if (v154)
      {
        v115 = +[NSString stringWithCString:v154 encoding:4];
      }
      else
      {
        v115 = @"NO";
      }
      context = v51;
      if (v153)
      {
        v60 = +[NSString stringWithCString:v153 encoding:4];
      }
      else
      {
        v60 = @"NO";
      }
      v114 = v60;
      unsigned int v107 = [(__CFString *)v60 isEqualToString:@"YES"];
      v61 = (void *)v58;
      if (v136)
      {
        v113 = +[NSString stringWithCString:v136 encoding:4];
      }
      else
      {
        v113 = 0;
      }
      v122 = (void *)v52;
      v123 = [[OTControlCLI alloc] initWithOTControl:v52];
      id v62 = objc_alloc((Class)OTControlArguments);
      v63 = +[NSUUID UUID];
      v64 = [v63 UUIDString];
      v65 = +[NSString stringWithFormat:@"otctl-flowID-%@", v64];
      v66 = +[NSUUID UUID];
      v67 = [v66 UUIDString];
      v68 = +[NSString stringWithFormat:@"otctl-deviceSessionID-%@", v67];
      id v69 = [v62 initWithContainerName:v127 contextID:v129 altDSID:v125 flowID:v65 deviceSessionID:v68];

      v70 = [EscrowRequestCLI alloc];
      id v130 = 0;
      v71 = +[SecEscrowRequest request:&v130];
      id v72 = v130;
      v73 = [(EscrowRequestCLI *)v70 initWithEscrowRequest:v71];

      if (v72)
      {
        [v72 description];
        [ objc_claimAutoreleasedReturnValue() UTF8String];
        errx(1, "SecEscrowRequest failed: %s");
      }
      v74 = v61;
      v75 = v122;
      v76 = (void *)v59;
      v109 = v73;
      if (v185)
      {
        v77 = v123;
        uint64_t v78 = [(OTControlCLI *)v123 resetOctagon:v69 idmsTargetContext:v74 idmsCuttlefishPassword:v59 notifyIdMS:v150 != 0 isGuitarfish:v133 != 0 timeout:v57];
LABEL_128:
        uint64_t v37 = v78;
        v79 = (void *)v110;
        v80 = (void *)v121;
LABEL_134:
        v83 = (void *)v111;
        v82 = v112;
LABEL_135:

        return v37;
      }
      v77 = v123;
      if (HIDWORD(v184))
      {
        LOBYTE(v106) = v150 != 0;
        v80 = (void *)v121;
        v79 = (void *)v110;
        uint64_t v81 = [(OTControlCLI *)v123 resetProtectedData:v69 appleID:v121 dsid:v110 idmsTargetContext:v74 idmsCuttlefishPassword:v59 isGuitarfish:v133 != 0 notifyIdMS:v106];
LABEL_133:
        uint64_t v37 = v81;
        goto LABEL_134;
      }
      if (v184)
      {
        v80 = (void *)v121;
        v79 = (void *)v110;
        uint64_t v81 = [(OTControlCLI *)v123 reset:v69 appleID:v121 isGuitarfish:v133 != 0 dsid:v110];
        goto LABEL_133;
      }
      if (HIDWORD(v183))
      {
        v83 = (void *)v111;
        v82 = v112;
        if (HIDWORD(v151) && v151)
        {
          sub_100003638((uint64_t)v132);
          uint64_t v37 = 1;
          v79 = (void *)v110;
          v80 = (void *)v121;
        }
        else
        {
          v79 = (void *)v110;
          v80 = (void *)v121;
          if (v151) {
            uint64_t v84 = [(OTControlCLI *)v123 setUserControllableViewsSyncStatus:v69 enabled:HIDWORD(v151) != 0];
          }
          else {
            uint64_t v84 = [(OTControlCLI *)v123 fetchUserControllableViewsSyncStatus:v69];
          }
          uint64_t v37 = v84;
        }
        goto LABEL_135;
      }
      if (v183)
      {
        uint64_t v78 = [(OTControlCLI *)v123 fetchAllBottles:v69 control:v122 overrideEscrowCache:v107];
        goto LABEL_128;
      }
      if (HIDWORD(v182))
      {
        if (v157)
        {
          uint64_t v85 = +[NSString stringWithCString:v157 encoding:4];
        }
        else
        {
          uint64_t v85 = 0;
        }
        v108 = (void *)v85;
        if (v159)
        {
          uint64_t v86 = +[NSString stringWithCString:v159 encoding:4];
          v87 = (void *)v86;
          if (v85 && v86)
          {
            id v88 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v85 options:0];
            if (!v88) {
              errx(1, "bad base64 string passed to --entropy");
            }
            v89 = v88;
            uint64_t v37 = [(OTControlCLI *)v123 recoverUsingBottleID:v87 entropy:v88 arguments:v69 control:v122];

            goto LABEL_159;
          }
        }
        else
        {
          v87 = 0;
        }
        sub_100003638((uint64_t)v132);
        uint64_t v37 = 1;
LABEL_159:
        v79 = (void *)v110;
        v83 = (void *)v111;
        v80 = (void *)v121;
        v82 = v112;

LABEL_160:
        v77 = v123;
        goto LABEL_135;
      }
      if (v182)
      {
        uint64_t v78 = [(OTControlCLI *)v123 depart:v69];
        goto LABEL_128;
      }
      if (HIDWORD(v186))
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 startOctagonStateMachine:v69];
LABEL_174:
        uint64_t v37 = v90;
LABEL_175:
        v79 = (void *)v110;
        v80 = (void *)v121;
        v82 = v112;
LABEL_176:
        v83 = (void *)v111;
        v75 = v122;
        goto LABEL_135;
      }
      if (v186)
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 signIn:v69];
        goto LABEL_174;
      }
      if (HIDWORD(v185))
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 signOut:v69];
        goto LABEL_174;
      }
      if (HIDWORD(v181))
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 status:v69 json:HIDWORD(v150) != 0];
        goto LABEL_174;
      }
      if (v178)
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 fetchEscrowRecords:v69 json:HIDWORD(v150) != 0 overrideEscrowCache:v107];
        goto LABEL_174;
      }
      if (HIDWORD(v177))
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 fetchAllEscrowRecords:v69 json:HIDWORD(v150) != 0 overrideEscrowCache:v107];
        goto LABEL_174;
      }
      if (v161)
      {
        if (v152)
        {
          v91 = +[NSString stringWithCString:v152 encoding:4];
          id v92 = [v91 description];
          printf("machineID: %s\n", (const char *)[v92 UTF8String]);
        }
        else
        {
          puts("unsetting machineID");
          v91 = 0;
        }
        uint64_t v37 = [(OTControlCLI *)v123 setMachineIDOverride:v69 machineID:v91 json:HIDWORD(v150) != 0];

        v77 = v123;
        goto LABEL_175;
      }
      if (v177)
      {
        if (v155)
        {
          v93 = +[NSString stringWithCString:v155 encoding:4];
        }
        else
        {
          v93 = 0;
        }
        if (v157)
        {
          uint64_t v95 = +[NSString stringWithCString:v157 encoding:4];
          v96 = (void *)v95;
          if (v93 && v95 && v121)
          {
            uint64_t v37 = [(OTControlCLI *)v123 performEscrowRecovery:v69 recordID:v93 appleID:v121 secret:v95 overrideForAccountScript:[(__CFString *)v115 isEqualToString:@"YES"] overrideEscrowCache:v107];
LABEL_200:

LABEL_206:
            v79 = (void *)v110;
            v83 = (void *)v111;
            v80 = (void *)v121;
            v75 = v122;
            v82 = v112;
            goto LABEL_160;
          }
        }
        else
        {
          v96 = 0;
        }
        sub_100003638((uint64_t)v132);
        uint64_t v37 = 1;
        goto LABEL_200;
      }
      if (HIDWORD(v176))
      {
        if (v157)
        {
          v94 = +[NSString stringWithCString:v157 encoding:4];
          if (v94 && v121)
          {
            uint64_t v37 = [(OTControlCLI *)v123 performSilentEscrowRecovery:v69 appleID:v121 secret:v94];
LABEL_205:

            goto LABEL_206;
          }
        }
        else
        {
          v94 = 0;
        }
        sub_100003638((uint64_t)v132);
        uint64_t v37 = 1;
        goto LABEL_205;
      }
      if (HIDWORD(v162))
      {
        v82 = v112;
        id v97 = [(__CFString *)v112 isEqualToString:@"YES"];
        v77 = v123;
        uint64_t v37 = [(OTControlCLI *)v123 healthCheck:v69 skipRateLimitingCheck:v97 repair:v148 != 0 json:HIDWORD(v150) != 0];
        v79 = (void *)v110;
        v80 = (void *)v121;
        goto LABEL_176;
      }
      if (v162)
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 simulateReceivePush:v69 json:HIDWORD(v150) != 0];
        goto LABEL_174;
      }
      if (HIDWORD(v161))
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 tlkRecoverability:v69];
        goto LABEL_174;
      }
      if (v179)
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 refetchCKKSPolicy:v69];
        goto LABEL_174;
      }
      if (HIDWORD(v178))
      {
        if (!v145) {
          v145 = "1";
        }
        v98 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
        v77 = v123;
        uint64_t v37 = [(OTControlCLI *)v123 tapToRadar:@"action" description:@"description" radar:v98];

        goto LABEL_175;
      }
      if (v176)
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 resetAccountCDPContentsWithArguments:v69 idmsTargetContext:v74 idmsCuttlefishPassword:v59 notifyIdMS:v150 != 0];
        goto LABEL_174;
      }
      if (HIDWORD(v175))
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 createCustodianRecoveryKeyWithArguments:v69 uuidString:v117 json:HIDWORD(v150) != 0 timeout:v57];
        goto LABEL_174;
      }
      if (v175)
      {
        if (v119 && v118 && v117)
        {
          v77 = v123;
          uint64_t v90 = [(OTControlCLI *)v123 joinWithCustodianRecoveryKeyWithArguments:v69 wrappingKey:v119 wrappedKey:v118 uuidString:v117 timeout:v57];
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v174))
      {
        if (v119 && v118 && v117)
        {
          v77 = v123;
          uint64_t v90 = [(OTControlCLI *)v123 preflightJoinWithCustodianRecoveryKeyWithArguments:v69 wrappingKey:v119 wrappedKey:v118 uuidString:v117 timeout:v57];
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (v174)
      {
        if (v117)
        {
          v77 = v123;
          uint64_t v90 = [(OTControlCLI *)v123 removeCustodianRecoveryKeyWithArguments:v69 uuidString:v117 timeout:v57];
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v173))
      {
        if (v117)
        {
          v77 = v123;
          uint64_t v90 = [(OTControlCLI *)v123 checkCustodianRecoveryKeyWithArguments:v69 uuidString:v117 timeout:v57];
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v172))
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 removeRecoveryKeyWithArguments:v69];
        goto LABEL_174;
      }
      if (v173)
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 setRecoveryKeyWithArguments:v69];
        goto LABEL_174;
      }
      if (v172)
      {
        if (v113)
        {
          v77 = v123;
          uint64_t v90 = [(OTControlCLI *)v123 joinWithRecoveryKeyWithArguments:v69 recoveryKey:v113];
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v171))
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 checkRecoveryKeyWithArguments:v69];
        goto LABEL_174;
      }
      if (v171)
      {
        if (v113)
        {
          v77 = v123;
          uint64_t v90 = [(OTControlCLI *)v123 preflightJoinWithRecoveryKeyWithArguments:v69 recoveryKey:v113];
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v170))
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 createInheritanceKeyWithArguments:v69 uuidString:v116 json:HIDWORD(v150) != 0 timeout:v57];
        goto LABEL_174;
      }
      if (v170)
      {
        v77 = v123;
        uint64_t v90 = [(OTControlCLI *)v123 generateInheritanceKeyWithArguments:v69 json:HIDWORD(v150) != 0 timeout:v57];
        goto LABEL_174;
      }
      if (HIDWORD(v169))
      {
        if (v119 && v118 && v116)
        {
          v77 = v123;
          uint64_t v90 = [(OTControlCLI *)v123 storeInheritanceKeyWithArguments:v69 wrappingKey:v119 wrappedKey:v118 uuidString:v116 timeout:v57];
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (v169)
      {
        if (v119 && v118 && v116)
        {
          v77 = v123;
          uint64_t v90 = [(OTControlCLI *)v123 joinWithInheritanceKeyWithArguments:v69 wrappingKey:v119 wrappedKey:v118 uuidString:v116 timeout:v57];
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v168))
      {
        if (v119 && v118 && v116)
        {
          v77 = v123;
          uint64_t v90 = [(OTControlCLI *)v123 preflightJoinWithInheritanceKeyWithArguments:v69 wrappingKey:v119 wrappedKey:v118 uuidString:v116 timeout:v57];
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (v168)
      {
        if (v116)
        {
          v77 = v123;
          uint64_t v90 = [(OTControlCLI *)v123 removeInheritanceKeyWithArguments:v69 uuidString:v116 timeout:v57];
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (HIDWORD(v167))
      {
        if (v116)
        {
          v77 = v123;
          uint64_t v90 = [(OTControlCLI *)v123 checkInheritanceKeyWithArguments:v69 uuidString:v116 timeout:v57];
          goto LABEL_174;
        }
        goto LABEL_313;
      }
      if (v167)
      {
        if (v119 && v118 && v111)
        {
          v77 = v123;
          v83 = (void *)v111;
          uint64_t v99 = [(OTControlCLI *)v123 recreateInheritanceKeyWithArguments:v69 uuidString:v116 wrappingKey:v119 wrappedKey:v118 claimToken:v111 json:HIDWORD(v150) != 0 timeout:v57];
LABEL_284:
          uint64_t v37 = v99;
          v79 = (void *)v110;
          v80 = (void *)v121;
          v75 = v122;
          v82 = v112;
          goto LABEL_135;
        }
      }
      else
      {
        if (!HIDWORD(v166))
        {
          if (HIDWORD(v164))
          {
            v77 = v123;
            uint64_t v90 = [(OTControlCLI *)v123 enableWalrusWithArguments:v69 timeout:v57];
            goto LABEL_174;
          }
          if (v164)
          {
            v77 = v123;
            uint64_t v90 = [(OTControlCLI *)v123 disableWalrusWithArguments:v69 timeout:v57];
            goto LABEL_174;
          }
          if (HIDWORD(v163))
          {
            v77 = v123;
            uint64_t v90 = [(OTControlCLI *)v123 enableWebAccessWithArguments:v69 timeout:v57];
            goto LABEL_174;
          }
          if (v163)
          {
            v77 = v123;
            uint64_t v90 = [(OTControlCLI *)v123 disableWebAccessWithArguments:v69 timeout:v57];
            goto LABEL_174;
          }
          if (v166)
          {
            v77 = v123;
            uint64_t v90 = [(OTControlCLI *)v123 fetchAccountSettingsWithArguments:v69 json:HIDWORD(v150) != 0];
            goto LABEL_174;
          }
          if (HIDWORD(v165))
          {
            BOOL v100 = v149 != 0;
            BOOL v101 = HIDWORD(v150) != 0;
            v77 = v123;
            v102 = v123;
            id v103 = v69;
            uint64_t v104 = 0;
          }
          else
          {
            if (!v165)
            {
              if (v181)
              {
                uint64_t v105 = [(EscrowRequestCLI *)v73 trigger];
              }
              else if (HIDWORD(v180))
              {
                uint64_t v105 = [(EscrowRequestCLI *)v73 status];
              }
              else if (v180)
              {
                uint64_t v105 = [(EscrowRequestCLI *)v73 reset];
              }
              else
              {
                if (!HIDWORD(v179))
                {
                  if (HIDWORD(v149))
                  {
                    v77 = v123;
                    uint64_t v90 = [(OTControlCLI *)v123 printAccountMetadataWithArguments:v69 json:HIDWORD(v150) != 0];
                    goto LABEL_174;
                  }
                  if (v160)
                  {
                    v77 = v123;
                    uint64_t v90 = [(OTControlCLI *)v123 rerollWithArguments:v69 json:HIDWORD(v150) != 0];
                    goto LABEL_174;
                  }
                  goto LABEL_313;
                }
                uint64_t v105 = [(EscrowRequestCLI *)v73 storePrerecordsInEscrow];
              }
              uint64_t v37 = v105;
              goto LABEL_206;
            }
            BOOL v100 = v149 != 0;
            BOOL v101 = HIDWORD(v150) != 0;
            v77 = v123;
            v102 = v123;
            id v103 = v69;
            uint64_t v104 = 1;
          }
          uint64_t v90 = [(OTControlCLI *)v102 fetchAccountWideSettingsWithArguments:v103 useDefault:v104 forceFetch:v100 json:v101];
          goto LABEL_174;
        }
        if (v119 && v111)
        {
          v77 = v123;
          v83 = (void *)v111;
          uint64_t v99 = [(OTControlCLI *)v123 createInheritanceKeyWithClaimTokenAndWrappingKey:v69 uuidString:v116 claimToken:v111 wrappingKey:v119 json:HIDWORD(v150) != 0 timeout:v57];
          goto LABEL_284;
        }
      }
LABEL_313:
      sub_100003638((uint64_t)v132);
      uint64_t v37 = 1;
      goto LABEL_206;
    }
    if (v21 == 104) {
      goto LABEL_167;
    }
    if (v124)
    {
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = 0;
      v32 = (char *)v195[2];
      while (v21 != *v32)
      {
        ++v22;
        v32 += 104;
        if (v2 == v22) {
          goto LABEL_49;
        }
      }
      long long v33 = *((_OWORD *)v32 + 5);
      long long v191 = *((_OWORD *)v32 + 4);
      long long v192 = v33;
      uint64_t v193 = *((void *)v32 + 12);
      long long v34 = *((_OWORD *)v32 + 1);
      long long v187 = *(_OWORD *)v32;
      long long v188 = v34;
      long long v35 = *((_OWORD *)v32 + 3);
      long long v189 = *((_OWORD *)v32 + 2);
      long long v190 = v35;
      sub_100003C04((uint64_t)&v187, optarg);
    }
  }
  while (v22 != v2);
LABEL_49:
  v36 = v195[2];
LABEL_50:
  free(v36);
  free(v3);
  free(v6);
LABEL_51:
  putchar(10);
  sub_100003638((uint64_t)v132);
  return 1;
}

id sub_100006AE8(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (!(v3 | v4))
  {
    NSLog(@"Must provide either an AppleID or a DSID to fetch a PET");
    exit(1);
  }
  uint64_t v5 = (void *)v4;
  id v6 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  [v6 setUsername:v3];
  [v6 setAuthenticationType:1];
  [v6 setIsUsernameEditable:0];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100006CB0;
  unint64_t v19 = sub_100006CC0;
  id v20 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006CC8;
  v12[3] = &unk_100020770;
  int v14 = &v15;
  uint64_t v9 = v7;
  uint64_t v13 = v9;
  [v8 authenticateWithContext:v6 completion:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

void sub_100006C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006CB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006CC0(uint64_t a1)
{
}

void sub_100006CC8(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {
    NSLog(@"error fetching PET: %@", v5);
    exit(1);
  }
  uint64_t v6 = [v9 objectForKeyedSubscript:AKAuthenticationPasswordKey];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006E5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      CFStringRef v9 = @"error";
      id v5 = [v3 description];
      id v10 = v5;
      uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      sub_100006F78(v6);
    }
    else
    {
      uint64_t v7 = __stderrp;
      id v8 = [v3 description];
      fprintf(v7, "Error rerolling: %s\n", (const char *)[v8 UTF8String]);
    }
  }
  else
  {
    puts("Reroll successful.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_100006F78(void *a1)
{
  uint64_t v1 = sub_100007044(a1);
  id v5 = 0;
  unint64_t v2 = +[NSJSONSerialization dataWithJSONObject:v1 options:3 error:&v5];
  id v3 = v5;

  if (v2)
  {
    id v4 = [objc_alloc((Class)NSString) initWithData:v2 encoding:4];
    puts((const char *)[v4 UTF8String]);
  }
  else
  {
    id v4 = [v3 localizedDescription];
    NSLog(@"error during JSONification: %@", v4);
  }
}

id sub_100007044(void *a1)
{
  if (a1)
  {
    id v1 = [a1 mutableCopy];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unint64_t v2 = [v1 allKeys];
    id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          id v8 = [v1 objectForKeyedSubscript:v7];
          CFStringRef v9 = sub_10000719C(v8);
          [v1 setObject:v9 forKeyedSubscript:v7];
        }
        id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

id sub_10000719C(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v6 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23[0] = @"code";
    id v2 = v1;
    id v3 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 code]);
    v23[1] = @"domain";
    v24[0] = v3;
    id v4 = [v2 domain];
    v24[1] = v4;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    id v6 = [v5 mutableCopy];

    id v7 = [v2 userInfo];

    sub_100007044(v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v8 forKeyedSubscript:@"userInfo"];
LABEL_4:

    goto LABEL_10;
  }
  if (+[NSJSONSerialization isValidJSONObject:v1]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = v1;
LABEL_9:
    id v6 = v9;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v1 base64EncodedStringWithOptions:0];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sub_100007044(v1);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v1;
      id v7 = objc_alloc_init((Class)NSISO8601DateFormatter);
      id v6 = [v7 stringFromDate:v8];
      goto LABEL_4;
    }
    id v9 = [v1 description];
    goto LABEL_9;
  }
  id v11 = v1;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 count]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = sub_10000719C(*(void *)(*((void *)&v18 + 1) + 8 * i));
        [v6 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

LABEL_10:

  return v6;
}

void sub_1000075A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    id v10 = [v5 dictionaryRepresentation];
    id v8 = v10;
    if (*(unsigned char *)(a1 + 32))
    {
      sub_100006F78(v10);
LABEL_9:

      goto LABEL_10;
    }
    id v9 = [v10 description];
    puts((const char *)[v9 UTF8String]);
LABEL_8:

    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 32))
  {
    CFStringRef v13 = @"error";
    id v8 = [v6 description];
    id v14 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    sub_100006F78(v9);
    goto LABEL_8;
  }
  id v11 = __stderrp;
  id v12 = [v6 description];
  fprintf(v11, "Failed to fetch account metadata: %s\n", (const char *)[v12 UTF8String]);

LABEL_10:
}

void sub_1000077F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007808(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      CFStringRef v9 = @"error";
      id v5 = [v3 description];
      id v10 = v5;
      id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      sub_100006F78(v6);
    }
    else
    {
      id v7 = __stderrp;
      id v8 = [v3 description];
      fprintf(v7, "Failed to set machineID override: %s\n", (const char *)[v8 UTF8String]);
    }
  }
  else
  {
    puts("successfully set machineID override!");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_100007CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007CF0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      CFStringRef v23 = @"error";
      id v8 = [v6 description];
      uint64_t v24 = v8;
      CFStringRef v9 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      sub_100006F78(v9);
    }
    else
    {
      uint64_t v15 = __stderrp;
      id v16 = [v6 description];
      fprintf(v15, "Failed to fetch account settings: %s\n", (const char *)[v16 UTF8String]);
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 40))
    {
      v21[0] = @"walrus";
      id v10 = [v5 walrus];
      id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 enabled]);
      v21[1] = @"webAccess";
      v22[0] = v11;
      id v12 = [v5 webAccess];
      CFStringRef v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 enabled]);
      v22[1] = v13;
      id v14 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

      sub_100006F78(v14);
    }
    else
    {
      puts("successfully fetched account settings!");
      uint64_t v17 = [v5 walrus];
      if ([v17 enabled]) {
        long long v18 = @"YES";
      }
      else {
        long long v18 = @"NO";
      }
      printf("walrus enabled? %s\n", (const char *)[(__CFString *)v18 UTF8String]);

      long long v19 = [v5 webAccess];
      if ([v19 enabled]) {
        long long v20 = @"YES";
      }
      else {
        long long v20 = @"NO";
      }
      printf("web access enabled? %s\n", (const char *)[(__CFString *)v20 UTF8String]);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_100008118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100008144(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = [v3 description];
    fprintf(v4, "disabling walrus failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }
  else
  {
    puts("successfully disabled walrus");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_1000083DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100008408(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = [v3 description];
    fprintf(v4, "enabling walrus failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }
  else
  {
    puts("successfully enabled walrus");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_1000086A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000086CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = [v3 description];
    fprintf(v4, "enabling web access failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }
  else
  {
    puts("successfully enabled web access");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_100008964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100008990(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = [v3 description];
    fprintf(v4, "disabling webAccess failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }
  else
  {
    puts("successfully disabled webAccess");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_100008D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_100008D44(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    double v7 = __stderrp;
    id v8 = [v5 description];
    fprintf(v7, "createInheritanceKeyWithClaimTokenAndWrappingKey failed: %s\n", (const char *)[v8 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v9 > 0.0 && [v6 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v6 retryInterval];
      sleep(v10);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v11 = [v13 dictionary];
    id v12 = v11;
    if (*(unsigned char *)(a1 + 56)) {
      sub_100006F78(v11);
    }
    else {
      sub_100008E64("Created inheritance key with claim+wrappingkey", v11);
    }
  }
}

void sub_100008E64(const char *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"uuid"];
  printf("%s %s\n", a1, (const char *)[v4 UTF8String]);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v10 isEqualToString:@"uuid"] & 1) == 0)
        {
          id v11 = v10;
          id v12 = (const char *)[v11 UTF8String];
          id v13 = [v5 objectForKeyedSubscript:v11];
          printf("\t%s: %s\n", v12, (const char *)[v13 UTF8String]);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

void sub_1000093A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1000093DC(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = __stderrp;
    id v8 = [v5 description];
    fprintf(v7, "recreateInheritanceKey failed: %s\n", (const char *)[v8 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v9 > 0.0 && [v6 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v6 retryInterval];
      sleep(v10);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    id v11 = [v13 dictionary];
    id v12 = v11;
    if (*(unsigned char *)(a1 + 56)) {
      sub_100006F78(v11);
    }
    else {
      sub_100008E64("Recreated inheritance key", v11);
    }
  }
}

void sub_1000096C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000096F0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v13 = v5;
  if (v5)
  {
    id v6 = __stderrp;
    id v7 = [v5 description];
    fprintf(v6, "checking inheritance key failed: %s\n", (const char *)[v7 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v8 > 0.0 && [v13 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v13 retryInterval];
      sleep(v9);
    }
  }
  else
  {
    uint64_t v10 = "does not exist";
    if (a2) {
      uint64_t v10 = "exists";
    }
    printf("successful check of inheritance key: %s\n", v10);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    if (a2) {
      *(_DWORD *)(v11 + 24) = 0;
    }
    else {
      *(_DWORD *)(v11 + 24) = 1;
    }
  }

  return _objc_release_x1();
}

void sub_1000099D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000099FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = [v3 description];
    fprintf(v4, "remove inheritance key failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }
  else
  {
    puts("successful removal of inheritance key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_100009DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_100009E2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = [v3 description];
    fprintf(v4, "preflight joinWithInheritanceKey failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }
  else
  {
    puts("successful preflight join from inheritance key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_10000A228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000A25C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = [v3 description];
    fprintf(v4, "joinWithInheritanceKey failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }
  else
  {
    puts("successful join from inheritance key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_10000A60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000A640(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    id v4 = [v3 description];
    printf("storeInheritanceKey failed: %s\n", (const char *)[v4 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v5 > 0.0 && [v7 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v7 retryInterval];
      sleep(v6);
    }
  }
  else
  {
    puts("successful store of inheritance key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_10000A880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000A8A4(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    id v7 = [v5 description];
    printf("generateInheritanceKey failed: %s\n", (const char *)[v7 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v8 > 0.0 && [v6 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v6 retryInterval];
      sleep(v9);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v10 = [v12 dictionary];
    uint64_t v11 = v10;
    if (*(unsigned char *)(a1 + 56)) {
      sub_100006F78(v10);
    }
    else {
      sub_100008E64("Generated inheritance key", v10);
    }
  }
}

void sub_10000AB98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000ABBC(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    id v7 = __stderrp;
    id v8 = [v5 description];
    fprintf(v7, "createInheritanceKey failed: %s\n", (const char *)[v8 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v9 > 0.0 && [v6 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v6 retryInterval];
      sleep(v10);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v11 = [v13 dictionary];
    id v12 = v11;
    if (*(unsigned char *)(a1 + 56)) {
      sub_100006F78(v11);
    }
    else {
      sub_100008E64("Created inheritance key", v11);
    }
  }
}

void sub_10000ADE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000ADFC(uint64_t a1, int a2, void *a3)
{
  if (a3)
  {
    id v3 = __stderrp;
    id v8 = [a3 description];
    fprintf(v3, "preflight join with recovery key failed: %s\n", (const char *)[v8 UTF8String]);
  }
  else
  {
    double v6 = (const char *)[*(id *)(a1 + 32) UTF8String];
    id v7 = "failure";
    if (a2) {
      id v7 = "success";
    }
    printf("preflight joined using recovery key %s, in octagon: %s\n", v6, v7);
    if (a2) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

void sub_10000B0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B0D0(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = [a2 description];
    fprintf(v2, "joining with recovery key failed: %s\n", (const char *)[v4 UTF8String]);
  }
  else
  {
    printf("successfully joined using recovery key %s, in octagon\n", (const char *)[*(id *)(a1 + 32) UTF8String]);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void sub_10000B2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B308(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = [a2 description];
    fprintf(v2, "set recovery key failed: %s\n", (const char *)[v4 UTF8String]);
  }
  else
  {
    printf("successfully registered recovery key %s, in octagon\n", (const char *)[*(id *)(a1 + 32) UTF8String]);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void sub_10000B490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B4A8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = [a2 description];
    fprintf(v2, "remove recovery key failed: %s\n", (const char *)[v4 UTF8String]);
  }
  else
  {
    puts("successful removal of recovery key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10000B714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B73C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v13 = v5;
  if (v5)
  {
    double v6 = __stderrp;
    id v7 = [v5 description];
    fprintf(v6, "checking custodian recovery key failed: %s\n", (const char *)[v7 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v8 > 0.0 && [v13 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v13 retryInterval];
      sleep(v9);
    }
  }
  else
  {
    uint64_t v10 = "does not exist";
    if (a2) {
      uint64_t v10 = "exists";
    }
    printf("successful check of custodian recovery key: %s\n", v10);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    if (a2) {
      *(_DWORD *)(v11 + 24) = 0;
    }
    else {
      *(_DWORD *)(v11 + 24) = 1;
    }
  }

  return _objc_release_x1();
}

void sub_10000BA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000BA48(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = [v3 description];
    fprintf(v4, "remove custodian recovery key failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }
  else
  {
    puts("successful removal of custodian recovery key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_10000BE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000BE78(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = [v3 description];
    fprintf(v4, "preflightJoinWithCustodianRecoveryKey failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }
  else
  {
    puts("successful preflight join from custodian recovery key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_10000C274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000C2A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = [v3 description];
    fprintf(v4, "joinWithCustodianRecoveryKey failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }
  else
  {
    puts("successful join from custodian recovery key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_10000C56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000C590(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    double v7 = __stderrp;
    id v8 = [v5 description];
    fprintf(v7, "createCustodianRecoveryKey failed: %s\n", (const char *)[v8 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v9 > 0.0 && [v6 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v6 retryInterval];
      sleep(v10);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v11 = [v13 dictionary];
    uint64_t v12 = v11;
    if (*(unsigned char *)(a1 + 56)) {
      sub_100006F78(v11);
    }
    else {
      sub_100008E64("Created custodian key", v11);
    }
  }
}

void sub_10000C844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10000C85C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = __stderrp;
    id v4 = [a2 description];
    fprintf(v3, "Error resetting account cdp content: %s\n", (const char *)[v4 UTF8String]);
  }
  else
  {
    puts("Succeeded resetting account cdp content");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  id v5 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v5);
}

void sub_10000C9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C9EC(uint64_t a1, int a2, void *a3)
{
  if (a3)
  {
    id v3 = __stderrp;
    id v6 = [a3 description];
    fprintf(v3, "Error setting user controllable views: %s\n", (const char *)[v6 UTF8String]);
  }
  else
  {
    if (a2) {
      id v5 = @"enabled";
    }
    else {
      id v5 = @"paused";
    }
    printf("User controllable views are currently %s.\n", (const char *)[(__CFString *)v5 UTF8String]);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10000CB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CBA8(uint64_t a1, int a2, void *a3)
{
  if (a3)
  {
    id v3 = __stderrp;
    id v6 = [a3 description];
    fprintf(v3, "Error setting user controllable views: %s\n", (const char *)[v6 UTF8String]);
  }
  else
  {
    if (a2) {
      id v5 = @"enabled";
    }
    else {
      id v5 = @"paused";
    }
    printf("User controllable views are now %s.\n", (const char *)[(__CFString *)v5 UTF8String]);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10000CD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CD8C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = [a2 description];
    fprintf(v2, "Error trigger TTR: %s\n", (const char *)[v4 UTF8String]);
  }
  else
  {
    puts("Trigger TTR completed.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10000CF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CF1C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = [a2 description];
    fprintf(v2, "Error refetching CKKS policy: %s\n", (const char *)[v4 UTF8String]);
  }
  else
  {
    puts("CKKS refetch completed.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10000D09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D0B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      CFStringRef v9 = @"error";
      id v5 = [v3 description];
      double v10 = v5;
      id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      sub_100006F78(v6);
    }
    else
    {
      double v7 = __stderrp;
      id v8 = [v3 description];
      fprintf(v7, "Error simulating push: %s\n", (const char *)[v8 UTF8String]);
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 40)) {
      sub_100006F78(&__NSDictionary0__struct);
    }
    else {
      puts("Simulated push sent.");
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10000D2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D2F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (v6)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      CFStringRef v15 = @"error";
      id v8 = [v6 description];
      uint64_t v16 = v8;
      CFStringRef v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      sub_100006F78(v9);
    }
    else
    {
      uint64_t v12 = __stderrp;
      id v13 = [v6 description];
      fprintf(v12, "Error checking health: %s\n", (const char *)[v13 UTF8String]);
    }
  }
  else
  {
    if (v5)
    {
      double v10 = [v5 dictionaryRepresentation];
      uint64_t v11 = v10;
      if (*(unsigned char *)(a1 + 40))
      {
        sub_100006F78(v10);
      }
      else
      {
        puts("Checking Octagon Health completed.");
        id v14 = [v11 description];
        puts((const char *)[v14 UTF8String]);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10000D718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10000D758(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  double v10 = secLogObjForScope();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v21 = 138412290;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "findOptimalBottleIDsWithContextData errored: %@\n", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      int v21 = 138412546;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "findOptimalBottleIDsWithContextData succeeded: %@, %@\n", (uint8_t *)&v21, 0x16u);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v9;
  id v14 = v9;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v7;
  id v17 = v7;

  uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v8;
  id v20 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000D8F8(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
}

void sub_10000D930(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
}

void sub_10000DAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10000DB00(uint64_t a1, void *a2)
{
  if (a2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v3 = __stderrp;
    id v4 = [a2 description];
    fprintf(v3, "Error recovering: %s\n", (const char *)[v4 UTF8String]);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) description];
    printf("Succeeded recovering bottled peer %s\n", (const char *)[v5 UTF8String]);

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  id v6 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v6);
}

void sub_10000DCB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DCD0(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    if (!*(unsigned char *)(a1 + 48))
    {
      uint64_t v12 = __stderrp;
      id v13 = [v8 description];
      fprintf(v12, "Error fetching status: %s\n", (const char *)[v13 UTF8String]);

      goto LABEL_59;
    }
    CFStringRef v84 = @"error";
    double v10 = [v8 description];
    uint64_t v85 = v10;
    BOOL v11 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
    sub_100006F78(v11);

    goto LABEL_7;
  }
  if (v7)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    if (*(unsigned char *)(a1 + 48))
    {
      double v10 = +[OTControlCLI annotateStatus:v7];
      sub_100006F78(v10);
LABEL_7:

      goto LABEL_59;
    }
    id v14 = [v7 objectForKeyedSubscript:@"containerName"];
    uint64_t v15 = (const char *)[v14 UTF8String];
    id v16 = [v7 objectForKeyedSubscript:@"contextID"];
    printf("Status for %s,%s:\n", v15, (const char *)[v16 UTF8String]);

    id v17 = [v7 objectForKeyedSubscript:@"activeAccount"];
    printf("Active account: %s\n", (const char *)[v17 UTF8String]);

    putchar(10);
    uint64_t v18 = [v7 objectForKeyedSubscript:@"state"];
    id v19 = [v18 description];
    printf("State: %s\n", (const char *)[v19 UTF8String]);

    id v20 = [v7 objectForKeyedSubscript:@"stateFlags"];
    id v21 = [v20 count];
    if (v21)
    {
      id v3 = [v7 objectForKeyedSubscript:@"stateFlags"];
      id v4 = [v3 description];
      id v22 = (const char *)[v4 UTF8String];
    }
    else
    {
      id v22 = "none";
    }
    __int16 v23 = [v7 objectForKeyedSubscript:@"statePendingFlags"];
    if ([v23 count])
    {
      id v24 = [v7 objectForKeyedSubscript:@"statePendingFlags"];
      id v25 = [v24 description];
      printf("Flags: %s; Flags Pending: %s\n\n", v22, (const char *)[v25 UTF8String]);
    }
    else
    {
      printf("Flags: %s; Flags Pending: %s\n\n", v22, "none");
    }
    uint64_t v70 = a1;

    if (v21)
    {
    }
    uint64_t v26 = [v7 objectForKeyedSubscript:@"contextDump"];
    v27 = +[NSMutableDictionary dictionary];
    size_t v28 = +[NSMutableArray array];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v73 = v26;
    long long v29 = [v26 objectForKeyedSubscript:@"peers"];
    id v30 = [v29 countByEnumeratingWithState:&v78 objects:v83 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v79;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v79 != v32) {
            objc_enumerationMutation(v29);
          }
          long long v34 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          long long v35 = [v34 objectForKeyedSubscript:@"peerID"];
          if (v35)
          {
            [v27 setObject:v34 forKeyedSubscript:v35];
            [v28 addObject:v35];
          }
        }
        id v31 = [v29 countByEnumeratingWithState:&v78 objects:v83 count:16];
      }
      while (v31);
    }
    id v72 = v7;

    v36 = +[NSMutableDictionary dictionary];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v37 = [v73 objectForKeyedSubscript:@"custodian_recovery_keys"];
    id v38 = [v37 countByEnumeratingWithState:&v74 objects:v82 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v75;
      do
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v75 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
          long long v43 = [v42 objectForKeyedSubscript:@"peerID"];
          if (v43) {
            [v36 setObject:v42 forKeyedSubscript:v43];
          }
        }
        id v39 = [v37 countByEnumeratingWithState:&v74 objects:v82 count:16];
      }
      while (v39);
    }

    long long v44 = [v73 objectForKeyedSubscript:@"self"];
    v45 = [v44 objectForKeyedSubscript:@"peerID"];
    v46 = [v44 objectForKeyedSubscript:@"stableInfo"];
    v47 = [v44 objectForKeyedSubscript:@"dynamicInfo"];
    if (v45)
    {
      id v48 = [v28 mutableCopy];
      [*(id *)(v70 + 32) printPeer:v44 prefix:@"    Self: "];
      putchar(10);
      [v27 setObject:v44 forKeyedSubscript:v45];
      long long v49 = [v47 objectForKeyedSubscript:@"included"];
      puts("Trusted peers (by me):");
      id v69 = v48;
      if (v49 && [v49 count])
      {
        [*(id *)(v70 + 32) printPeers:v49 egoPeerID:v45 informationOnPeers:v27 informationOnCRKs:v36];
        [v48 removeObjectsInArray:v49];
      }
      else
      {
        puts("    No trusted peers.");
      }
      v68 = v49;
      putchar(10);
      v66 = v47;
      long long v50 = [v47 objectForKeyedSubscript:@"excluded"];
      puts("Excluded peers (by me):");
      id v7 = v72;
      if (v50 && [v50 count])
      {
        [*(id *)(v70 + 32) printPeers:v50 egoPeerID:v45 informationOnPeers:v27 informationOnCRKs:v36];
        v51 = v69;
        [v69 removeObjectsInArray:v50];
      }
      else
      {
        puts("    No excluded peers.");
        v51 = v69;
      }
      putchar(10);
      puts("Other peers (included/excluded by others):");
      v67 = v45;
      if ([v51 count]) {
        [*(id *)(v70 + 32) printPeers:v51 egoPeerID:v45 informationOnPeers:v27 informationOnCRKs:v36];
      }
      else {
        puts("    No other peers.");
      }
      uint64_t v52 = v68;
      putchar(10);
      uint64_t v53 = [v46 objectForKeyedSubscript:@"recovery_encryption_public_key"];
      v54 = v46;
      if (v53)
      {
        v55 = (void *)v53;
        v56 = [v54 objectForKeyedSubscript:@"recovery_signing_public_key"];

        if (v56)
        {
          puts("Recovery Key:");
          id v57 = objc_alloc((Class)NSData);
          uint64_t v58 = [v54 objectForKeyedSubscript:@"recovery_signing_public_key"];
          id v71 = [v57 initWithData:v58];

          id v7 = v72;
          id v59 = objc_alloc((Class)NSData);
          v60 = [v54 objectForKeyedSubscript:@"recovery_encryption_public_key"];
          id v61 = [v59 initWithData:v60];

          id v62 = [v71 base64EncodedStringWithOptions:0];
          v63 = v61;
          id v64 = [v61 base64EncodedStringWithOptions:0];
          printf("    Encryption public key: %s\n", (const char *)[v64 UTF8String]);
          id v65 = v62;
          printf("    Signing public key: %s\n", (const char *)[v65 UTF8String]);
          putchar(10);

          uint64_t v52 = v68;
        }
      }

      id v9 = 0;
      v46 = v54;
      v47 = v66;
      v45 = v67;
    }
    else
    {
      puts("No current identity for this device.\n");
      if ([v28 count])
      {
        puts("All peers currently in this account:");
        [*(id *)(v70 + 32) printPeers:v28 egoPeerID:0 informationOnPeers:v27 informationOnCRKs:v36];
      }
      else
      {
        puts("No peers currently exist for this account.");
      }
      id v9 = 0;
      id v7 = v72;
    }
    putchar(10);
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    sub_100006F78(&off_100021660);
  }
  else
  {
    fwrite("Fetching status had no error and gave no result!\n", 0x31uLL, 1uLL, __stderrp);
  }
LABEL_59:
}

void sub_10000FFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000FFE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = [v3 description];
    fprintf(v4, "Error resetting: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }
  else
  {
    puts("reset and establish:");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_10001019C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000101B4(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = [a2 description];
    fprintf(v2, "Error departing clique: %s\n", (const char *)[v4 UTF8String]);
  }
  else
  {
    puts("Departing clique completed.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10001032C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010344(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = [a2 description];
    fprintf(v2, "Error signing out: %s\n", (const char *)[v4 UTF8String]);
  }
  else
  {
    puts("Sign out complete.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_1000104BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000104D4(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = [a2 description];
    fprintf(v2, "Error signing in: %s\n", (const char *)[v4 UTF8String]);
  }
  else
  {
    puts("Sign in complete.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_10001064C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010664(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = [a2 description];
    fprintf(v2, "Error starting state machine: %s\n", (const char *)[v4 UTF8String]);
  }
  else
  {
    puts("state machine started.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void sub_100010D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010D6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100010D7C(uint64_t a1)
{
}

void sub_100010D84(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 userInfo];
  id obj = [v4 objectForKeyedSubscript:@"CKRetryAfter"];

  id v5 = obj;
  if (obj)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v6 + 40))
    {
      [obj doubleValue];
      double v8 = v7;
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) doubleValue];
      id v5 = obj;
      if (v8 >= v9) {
        goto LABEL_6;
      }
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    objc_storeStrong((id *)(v6 + 40), obj);
    id v5 = obj;
  }
LABEL_6:
}

void NSLog(NSString *format, ...)
{
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return _PBDataWriterWriteInt64Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return _PBDataWriterWriteUint64Field();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t SOSPeerInfoCreateFromData()
{
  return _SOSPeerInfoCreateFromData();
}

uint64_t SOSPeerInfoGetPeerID()
{
  return _SOSPeerInfoGetPeerID();
}

uint64_t SecIsInternalRelease()
{
  return _SecIsInternalRelease();
}

uint64_t SecRKCreateRecoveryKeyString()
{
  return _SecRKCreateRecoveryKeyString();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void errx(int a1, const char *a2, ...)
{
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

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t secLogObjForScope()
{
  return _secLogObjForScope();
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__isCKServerInternalError(void *a1, const char *a2, ...)
{
  return [a1 _isCKServerInternalError];
}

id objc_msgSend__isRetryableNSURLError(void *a1, const char *a2, ...)
{
  return [a1 _isRetryableNSURLError];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return [a1 altDSID];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authInfo(void *a1, const char *a2, ...)
{
  return [a1 authInfo];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cdpInfo(void *a1, const char *a2, ...)
{
  return [a1 cdpInfo];
}

id objc_msgSend_clearTlkSharesForVouchedIdentitys(void *a1, const char *a2, ...)
{
  return [a1 clearTlkSharesForVouchedIdentitys];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectableEscrowRecords(void *a1, const char *a2, ...)
{
  return [a1 collectableEscrowRecords];
}

id objc_msgSend_collectableTlkShares(void *a1, const char *a2, ...)
{
  return [a1 collectableTlkShares];
}

id objc_msgSend_collectedEscrowRecords(void *a1, const char *a2, ...)
{
  return [a1 collectedEscrowRecords];
}

id objc_msgSend_collectedTlkShares(void *a1, const char *a2, ...)
{
  return [a1 collectedTlkShares];
}

id objc_msgSend_containerName(void *a1, const char *a2, ...)
{
  return [a1 containerName];
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return [a1 contextID];
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return [a1 control];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cuttlefishRetryAfter(void *a1, const char *a2, ...)
{
  return [a1 cuttlefishRetryAfter];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_escrowInformationMetadata(void *a1, const char *a2, ...)
{
  return [a1 escrowInformationMetadata];
}

id objc_msgSend_escrowRecordGarbageCollectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 escrowRecordGarbageCollectionEnabled];
}

id objc_msgSend_escrowRequest(void *a1, const char *a2, ...)
{
  return [a1 escrowRequest];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isRetryable(void *a1, const char *a2, ...)
{
  return [a1 isRetryable];
}

id objc_msgSend_leaveTrust(void *a1, const char *a2, ...)
{
  return [a1 leaveTrust];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_makeConfigurationContext(void *a1, const char *a2, ...)
{
  return [a1 makeConfigurationContext];
}

id objc_msgSend_moveRequest(void *a1, const char *a2, ...)
{
  return [a1 moveRequest];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_peerInfo(void *a1, const char *a2, ...)
{
  return [a1 peerInfo];
}

id objc_msgSend_peersCleanedup(void *a1, const char *a2, ...)
{
  return [a1 peersCleanedup];
}

id objc_msgSend_postEscrowCFU(void *a1, const char *a2, ...)
{
  return [a1 postEscrowCFU];
}

id objc_msgSend_postRepairCFU(void *a1, const char *a2, ...)
{
  return [a1 postRepairCFU];
}

id objc_msgSend_recordId(void *a1, const char *a2, ...)
{
  return [a1 recordId];
}

id objc_msgSend_reroll(void *a1, const char *a2, ...)
{
  return [a1 reroll];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetOctagon(void *a1, const char *a2, ...)
{
  return [a1 resetOctagon];
}

id objc_msgSend_retryInterval(void *a1, const char *a2, ...)
{
  return [a1 retryInterval];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_storePrerecordsInEscrow(void *a1, const char *a2, ...)
{
  return [a1 storePrerecordsInEscrow];
}

id objc_msgSend_superfluousPeers(void *a1, const char *a2, ...)
{
  return [a1 superfluousPeers];
}

id objc_msgSend_superfluousPeersCleanupEnabled(void *a1, const char *a2, ...)
{
  return [a1 superfluousPeersCleanupEnabled];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_tlkShareGarbageCollectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 tlkShareGarbageCollectionEnabled];
}

id objc_msgSend_tlkSharesForVouchedIdentitysCount(void *a1, const char *a2, ...)
{
  return [a1 tlkSharesForVouchedIdentitysCount];
}

id objc_msgSend_totalEscrowRecords(void *a1, const char *a2, ...)
{
  return [a1 totalEscrowRecords];
}

id objc_msgSend_totalPeers(void *a1, const char *a2, ...)
{
  return [a1 totalPeers];
}

id objc_msgSend_totalTlkShares(void *a1, const char *a2, ...)
{
  return [a1 totalTlkShares];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return [a1 trigger];
}

id objc_msgSend_trustedPeers(void *a1, const char *a2, ...)
{
  return [a1 trustedPeers];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_walrus(void *a1, const char *a2, ...)
{
  return [a1 walrus];
}

id objc_msgSend_webAccess(void *a1, const char *a2, ...)
{
  return [a1 webAccess];
}