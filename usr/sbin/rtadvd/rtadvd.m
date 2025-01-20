uint64_t rtadvdLog()
{
  uint64_t result;
  uint64_t v1;

  if (rtadvdLogger) {
    return os_log_with_args();
  }
  rtadvdLogger = (uint64_t)os_log_create("com.apple.rtadvd", "daemon");
  if (rtadvdLogger) {
    return os_log_with_args();
  }
  result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (result)
  {
    result = rtadvdLog_cold_1(&v1);
    if ((result & 1) == 0) {
      return os_log_with_args();
    }
  }
  return result;
}

uint64_t agetent(uint64_t a1, unsigned __int8 *a2)
{
  if (conffile) {
    v2 = (char *)conffile;
  }
  else {
    v2 = "/etc/rtadvd.conf";
  }
  remotefile = (uint64_t)v2;
  return getent(a1, a2, v2);
}

uint64_t getent(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  tbuf = a1;
  if (a3 && *a3)
  {
    RM = (uint64_t)a3;
    int v5 = open(a3, 0);
    if (v5 < 0)
    {
      v6 = __error();
      strerror(*v6);
      rtadvdLog();
      return 4294967294;
    }
  }
  else
  {
    int v5 = 0;
  }
  uint64_t v8 = 0;
  int v9 = 0;
  int v10 = 0;
  while (v9 != v10)
  {
LABEL_10:
    v11 = (unsigned char *)(a1 + v8);
    int v12 = v14[v9++];
    if (v12 == 10)
    {
      BOOL v13 = v8-- < 1;
      if (v13 || *(v11 - 1) != 92) {
        goto LABEL_17;
      }
    }
    else if (v8 >= 1023)
    {
      write(2, "Remcap entry too long\n", 0x16uLL);
LABEL_17:
      unsigned char *v11 = 0;
      uint64_t v8 = 0;
      if (anamatch(a2))
      {
        close(v5);
        return anchktc();
      }
    }
    else
    {
      ++v8;
      unsigned char *v11 = v12;
    }
  }
  int v10 = read(v5, v14, 0x400uLL);
  if (v10 > 0)
  {
    int v9 = 0;
    goto LABEL_10;
  }
  close(v5);
  return 0;
}

uint64_t anamatch(unsigned __int8 *a1)
{
  v1 = (unsigned char *)tbuf;
  if (*(unsigned char *)tbuf == 35) {
    return 0;
  }
  int v4 = *a1;
  v2 = a1 + 1;
  int v3 = v4;
LABEL_3:
  if (v3)
  {
    int v5 = v2;
    int v6 = v3;
    do
    {
      int v7 = *v1;
      if (v7 != v6) {
        goto LABEL_10;
      }
      ++v1;
      int v8 = *v5++;
      int v6 = v8;
    }
    while (v8);
  }
  int v7 = *v1;
  if (*v1 && v7 != 58 && v7 != 124)
  {
LABEL_10:
    ++v1;
    if (v7)
    {
      do
      {
        if (v7 == 58) {
          break;
        }
        if (v7 == 124) {
          goto LABEL_3;
        }
        int v9 = *v1++;
        int v7 = v9;
      }
      while (v9);
    }
    return 0;
  }
  return 1;
}

uint64_t anchktc()
{
  uint64_t v0 = tbuf;
  size_t v1 = strlen((const char *)tbuf);
  uint64_t v2 = 0;
  size_t v3 = tbuf + v1;
  while (1)
  {
    size_t v4 = v3 + v2;
    if (*(unsigned char *)(v3 + v2 - 3) == 58) {
      break;
    }
    --v2;
    if (v3 + v2 - 2 < tbuf)
    {
      int v5 = "Bad remcap entry\n";
      goto LABEL_5;
    }
  }
  int v8 = *(unsigned __int8 *)(v4 - 2);
  int v7 = (char *)(v4 - 2);
  if (v8 == 116 && *(unsigned char *)(v3 + v2 - 1) == 99)
  {
    int v9 = &__s[-v1 + 1026 - v2];
    int v10 = v15;
    __strlcpy_chk();
    while (*v10 && *v10 != 58)
      ++v10;
    *int v10 = 0;
    int v11 = hopcount++;
    if (v11 >= 32)
    {
      int v5 = "Infinite tc= loop\n";
LABEL_5:
      write(2, v5, 0x12uLL);
      return 0;
    }
    if (getent((int)__s, (int)v15, (char *)remotefile) != 1) {
      return 0;
    }
    int v12 = __s;
    do
    {
      int v13 = *v12++;
      ++v9;
    }
    while (v13 != 58);
    if ((int)(v1 + v2 + strlen(v12) - 2) >= 1025)
    {
      write(2, "Remcap entry too long\n", 0x17uLL);
      *int v9 = 0;
    }
    strlcpy(v7, v12, v1 + v0 - tbuf + v2 - 2);
    tbuf = v0;
  }
  return 1;
}

uint64_t agetnum(const char *a1)
{
  uint64_t v2 = tskip((char *)tbuf);
  if (!*v2) {
    return -1;
  }
  size_t v3 = v2;
  size_t v4 = strlen(a1);
  while (strncmp(v3, a1, v4))
  {
LABEL_7:
    size_t v3 = tskip(v3);
    if (!*v3) {
      return -1;
    }
  }
  int v5 = v3[v4];
  if (v5 == 64) {
    return -1;
  }
  if (v5 != 35)
  {
    v3 += v4;
    goto LABEL_7;
  }
  unsigned int v7 = v3[v4 + 1] - 48;
  if (v7 > 9) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v8 = 10;
  if (v3[v4 + 1] == 48) {
    uint64_t v8 = 8;
  }
  int v9 = &v3[v4 + 2];
  do
  {
    uint64_t result = result * v8 + v7;
    int v10 = *v9++;
    unsigned int v7 = v10 - 48;
  }
  while ((v10 - 48) < 0xA);
  return result;
}

char *tskip(char *result)
{
  char v1 = *result;
  if (*result)
  {
    do
    {
      if (v1 == 92)
      {
        if ((result[1] - 48) > 9)
        {
          result += 2;
        }
        else
        {
          ++result;
          do
            int v2 = *result++;
          while ((v2 - 48) < 0xA);
        }
      }
      else if (v1 == 58)
      {
        break;
      }
      int v3 = *++result;
      char v1 = v3;
    }
    while (v3);
  }
  if (v1 == 58) {
    ++result;
  }
  return result;
}

uint64_t agetflag(const char *a1)
{
  int v2 = tskip((char *)tbuf);
  if (*v2)
  {
    int v3 = v2;
    size_t v4 = strlen(a1);
    do
    {
      if (!strncmp(v3, a1, v4))
      {
        v3 += v4;
        int v5 = *v3;
        uint64_t result = 1;
        if (!*v3 || v5 == 58) {
          return result;
        }
        if (v5 == 64) {
          return 0;
        }
      }
      int v3 = tskip(v3);
    }
    while (*v3);
  }
  return 0;
}

unsigned char *agetstr(const char *a1, unsigned char **a2)
{
  size_t v4 = tskip((char *)tbuf);
  if (!*v4) {
    return 0;
  }
  int v5 = v4;
  size_t v6 = strlen(a1);
  while (1)
  {
    if (!strncmp(v5, a1, v6))
    {
      v5 += v6;
      int v7 = *v5;
      if (v7 == 64) {
        return 0;
      }
      if (v7 == 61) {
        break;
      }
    }
    int v5 = tskip(v5);
    if (!*v5) {
      return 0;
    }
  }
  int v9 = v5 + 1;
  int v10 = *a2;
  do
  {
    int v11 = *v9;
    if (v11 == 34) {
      int v12 = v9 + 1;
    }
    else {
      int v12 = v9;
    }
    if (v11 == 34) {
      int v13 = 34;
    }
    else {
      int v13 = 58;
    }
    int v9 = v12 + 1;
    int v14 = *v12;
    if (*v12) {
      BOOL v15 = v13 == v14;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      while (v14 != 92)
      {
        if (v14 != 94) {
          goto LABEL_30;
        }
        v16 = v12 + 2;
        LOBYTE(v14) = *v9 & 0x1F;
LABEL_32:
        *v10++ = v14;
        int v9 = v16 + 1;
        int v14 = *v16;
        if (*v16) {
          BOOL v23 = v13 == v14;
        }
        else {
          BOOL v23 = 1;
        }
        int v12 = v16;
        if (v23) {
          goto LABEL_37;
        }
      }
      v16 = v12 + 2;
      int v14 = *v9;
      unsigned __int8 v17 = 69;
      v18 = "^^\\\\::n\nr\rt\tb\bf\f\"\"";
      do
      {
        if (v17 == v14)
        {
          LOBYTE(v14) = *(v18 - 1);
          goto LABEL_32;
        }
        int v19 = *v18;
        v18 += 2;
        unsigned __int8 v17 = v19;
      }
      while (v19);
      if ((v14 - 48) > 9) {
        goto LABEL_32;
      }
      char v20 = 0;
      int v9 = v12 + 4;
      char v21 = v12[2];
      LOBYTE(v14) = v14 - 48;
      while (1)
      {
        LOBYTE(v14) = (v21 - 48) | (8 * v14);
        if (v20) {
          break;
        }
        int v22 = *++v16;
        char v21 = v22;
        char v20 = 1;
        if ((v22 - 48) >= 0xA) {
          goto LABEL_32;
        }
      }
LABEL_30:
      v16 = v9;
      goto LABEL_32;
    }
LABEL_37:
    ;
  }
  while (v11 == 34 && v13 == v14);
  *int v10 = 0;
  uint64_t result = *a2;
  *a2 = v10 + 1;
  return result;
}

void getconfig(unsigned __int8 *a1)
{
  v124 = &v129;
  if ((int)agetent((uint64_t)v130, a1) <= 0)
  {
    bzero(v130, 0x400uLL);
    rtadvdLog();
  }
  int v2 = malloc_type_malloc(0x1E8uLL, 0x1030040631F589DuLL);
  if (!v2)
  {
    v118 = __error();
    strerror(*v118);
    goto LABEL_202;
  }
  uint64_t v3 = (uint64_t)v2;
  v2[60] = 0;
  *((_OWORD *)v2 + 28) = 0u;
  *((_OWORD *)v2 + 29) = 0u;
  *((_OWORD *)v2 + 26) = 0u;
  *((_OWORD *)v2 + 27) = 0u;
  *((_OWORD *)v2 + 24) = 0u;
  *((_OWORD *)v2 + 25) = 0u;
  *((_OWORD *)v2 + 22) = 0u;
  *((_OWORD *)v2 + 23) = 0u;
  *((_OWORD *)v2 + 20) = 0u;
  *((_OWORD *)v2 + 21) = 0u;
  *((_OWORD *)v2 + 18) = 0u;
  *((_OWORD *)v2 + 19) = 0u;
  *((_OWORD *)v2 + 16) = 0u;
  *((_OWORD *)v2 + 17) = 0u;
  *((_OWORD *)v2 + 13) = 0u;
  *((_OWORD *)v2 + 14) = 0u;
  *((_OWORD *)v2 + 11) = 0u;
  *((_OWORD *)v2 + 12) = 0u;
  *((_OWORD *)v2 + 9) = 0u;
  *((_OWORD *)v2 + 10) = 0u;
  *((_OWORD *)v2 + 6) = 0u;
  *((_OWORD *)v2 + 7) = 0u;
  *((_OWORD *)v2 + 4) = 0u;
  *((_OWORD *)v2 + 5) = 0u;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *(_OWORD *)int v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_OWORD *)v2 + 15) = 0u;
  *((_OWORD *)v2 + 8) = 0u;
  size_t v4 = v2 + 16;
  v2[17] = v2 + 16;
  v2[16] = v2 + 16;
  v2[30] = v2 + 30;
  v123 = v2 + 30;
  v2[31] = v2 + 30;
  int v5 = (char *)(v2 + 37);
  v2[37] = v2 + 37;
  v2[38] = v2 + 37;
  v2[42] = v2 + 42;
  v2[43] = v2 + 42;
  v121 = v2 + 42;
  if (getconfig_forwarding < 0)
  {
    *(void *)v127 = 0x1E00000004;
    uint64_t v128 = 0x100000029;
    int v125 = 0;
    v126[0].tv_sec = 4;
    if (sysctl(v127, 4u, &v125, (size_t *)v126, 0, 0) < 0)
    {
      v119 = __error();
      strerror(*v119);
      rtadvdLog();
      getconfig_forwarding = -1;
LABEL_203:
      exit(1);
    }
    getconfig_forwarding = v125;
    if (v125 < 0) {
      goto LABEL_203;
    }
  }
  if (agetflag("nolladdr"))
  {
    *(_DWORD *)(v3 + 48) = 0;
    unsigned int v6 = if_nametoindex((const char *)a1);
  }
  else
  {
    *(_DWORD *)(v3 + 48) = 1;
    int v7 = (unsigned __int16 *)if_nametosdl((const char *)a1);
    *(void *)(v3 + 56) = v7;
    if (!v7) {
      goto LABEL_202;
    }
    unsigned int v6 = v7[1];
  }
  *(_DWORD *)(v3 + 44) = v6;
  __strlcpy_chk();
  int v8 = if_getmtu((const char *)a1);
  *(_DWORD *)(v3 + 80) = v8;
  if (!v8)
  {
    *(_DWORD *)(v3 + 80) = 1280;
    rtadvdLog();
  }
  uint64_t v9 = agetnum("maxinterval");
  uint64_t v10 = 600;
  if (v9 >= 0) {
    uint64_t v10 = v9;
  }
  if ((unint64_t)(v10 - 1801) <= 0xFFFFFFFFFFFFF8FALL) {
    goto LABEL_202;
  }
  v122 = (const char *)a1;
  *(_DWORD *)(v3 + 88) = v10;
  uint64_t v11 = agetnum("mininterval");
  unsigned int v12 = *(_DWORD *)(v3 + 88);
  unint64_t v13 = v12 / 3uLL;
  if (v11 >= 0) {
    unint64_t v13 = v11;
  }
  unint64_t v14 = (3 * v12) >> 2;
  if (v13 < 3 || v13 > v14)
  {
LABEL_202:
    rtadvdLog();
    goto LABEL_203;
  }
  *(_DWORD *)(v3 + 92) = v13;
  uint64_t v15 = agetnum("chlim");
  int v16 = v15;
  if (v15 < 0) {
    int v16 = 64;
  }
  *(_DWORD *)(v3 + 120) = v16;
  unsigned __int8 v17 = agetstr("raflags", &v124);
  if (v17)
  {
    v18 = v17;
    int v19 = strchr(v17, 109) != 0;
    if (strchr(v18, 111)) {
      LODWORD(v20) = ((v19 & 1) << 7) | 0x40;
    }
    else {
      LODWORD(v20) = v19 << 7;
    }
    if (strchr(v18, 104)) {
      LODWORD(v20) = v20 | 8;
    }
    if (strchr(v18, 108))
    {
      if ((v20 & 8) != 0) {
        goto LABEL_202;
      }
      LODWORD(v20) = v20 | 0x18;
    }
  }
  else
  {
    uint64_t v21 = agetnum("raflags");
    uint64_t v20 = v21 & ~(v21 >> 63);
  }
  *(int8x8_t *)(v3 + 96) = vand_s8((int8x8_t)vdup_n_s32(v20), (int8x8_t)0x4000000080);
  *(_DWORD *)(v3 + 104) = v20 & 0x18;
  if ((v20 & 0x18) == 0x10) {
    goto LABEL_202;
  }
  unint64_t v22 = agetnum("rltime");
  if ((v22 & 0x8000000000000000) != 0)
  {
    int v23 = *(_DWORD *)(v3 + 88);
    unint64_t v22 = (3 * v23);
    if (!(3 * v23)) {
      goto LABEL_40;
    }
  }
  else if (!v22)
  {
    goto LABEL_40;
  }
  if (v22 > 0x2328 || v22 < *(unsigned int *)(v3 + 88) || !getconfig_forwarding) {
    goto LABEL_202;
  }
LABEL_40:
  *(_WORD *)(v3 + 84) = v22;
  uint64_t v24 = agetnum("rtime");
  unint64_t v25 = v24 & ~(v24 >> 63);
  if (v25 >= 0x36EE81) {
    goto LABEL_202;
  }
  *(_DWORD *)(v3 + 112) = v25;
  uint64_t v26 = agetnum("retrans");
  unint64_t v27 = v26 & ~(v26 >> 63);
  if (HIDWORD(v27)) {
    goto LABEL_202;
  }
  v120 = v5;
  *(_DWORD *)(v3 + 116) = v27;
  if (agetnum("hapref") != -1 || agetnum("hatime") != -1) {
    goto LABEL_202;
  }
  uint64_t v28 = agetnum("clockskew");
  *(void *)(v3 + 232) = v28 & ~(v28 >> 63);
  *(_DWORD *)(v3 + 224) = 0;
  for (int i = -1; i != 100; ++i)
  {
    makeentry((char *)v127, 0x100uLL, i, "addr");
    v30 = agetstr((const char *)v127, &v124);
    if (v30)
    {
      v31 = v30;
      v32 = (int8x8_t *)malloc_type_malloc(0x60uLL, 0x1020040CF300BDFuLL);
      if (!v32) {
        goto LABEL_201;
      }
      v33 = v32;
      *(_OWORD *)v32[6].i8 = 0u;
      *(_OWORD *)v32[8].i8 = 0u;
      *(_OWORD *)v32[2].i8 = 0u;
      *(_OWORD *)v32[4].i8 = 0u;
      *(_OWORD *)v32->i8 = 0u;
      *(_OWORD *)v32[10].i8 = 0u;
      v34 = v32 + 10;
      v32[2] = (int8x8_t)v3;
      v32[9].i32[1] = 2;
      if (inet_pton(30, v31, &v32[10]) != 1) {
        goto LABEL_202;
      }
      int v35 = v34->u8[0];
      if (v35 == 254)
      {
        if ((v33[10].i8[1] & 0xC0) == 0x80) {
          rtadvdLog();
        }
      }
      else if (v35 == 255)
      {
        goto LABEL_202;
      }
      makeentry((char *)v127, 0x100uLL, i, "prefixlen");
      uint64_t v36 = agetnum((const char *)v127);
      uint64_t v37 = 64;
      if (v36 >= 0) {
        uint64_t v37 = v36;
      }
      if (v37 >= 129) {
        goto LABEL_202;
      }
      v33[9].i32[0] = v37;
      makeentry((char *)v127, 0x100uLL, i, "pinfoflags");
      v38 = agetstr((const char *)v127, &v124);
      if (v38)
      {
        v39 = v38;
        int v40 = strchr(v38, 108) != 0;
        v41 = strchr(v39, 97);
        unsigned int v42 = ((v40 & 1) << 7) | 0x40;
        if (!v41) {
          unsigned int v42 = v40 << 7;
        }
      }
      else
      {
        uint64_t v43 = agetnum((const char *)v127);
        unsigned int v42 = 192;
        if (v43 >= 0) {
          unsigned int v42 = v43;
        }
      }
      v33[8] = vand_s8((int8x8_t)vdup_n_s32(v42), (int8x8_t)0x4000000080);
      makeentry((char *)v127, 0x100uLL, i, "vltime");
      uint64_t v44 = agetnum((const char *)v127);
      uint64_t v45 = 2592000;
      if (v44 >= 0) {
        uint64_t v45 = v44;
      }
      if (v45 >= (uint64_t)&_mh_execute_header) {
        goto LABEL_202;
      }
      v33[4].i32[0] = v45;
      makeentry((char *)v127, 0x100uLL, i, "vltimedecr");
      if (agetflag((const char *)v127))
      {
        v126[0].tv_sec = 0;
        *(void *)&v126[0].tv_usec = 0;
        gettimeofday(v126, 0);
        v33[5] = (int8x8_t)(v126[0].tv_sec + v33[4].u32[0]);
      }
      makeentry((char *)v127, 0x100uLL, i, "pltime");
      uint64_t v46 = agetnum((const char *)v127);
      uint64_t v47 = 604800;
      if (v46 >= 0) {
        uint64_t v47 = v46;
      }
      if (v47 >= (uint64_t)&_mh_execute_header) {
        goto LABEL_202;
      }
      v33[6].i32[0] = v47;
      makeentry((char *)v127, 0x100uLL, i, "pltimedecr");
      if (agetflag((const char *)v127))
      {
        v126[0].tv_sec = 0;
        *(void *)&v126[0].tv_usec = 0;
        gettimeofday(v126, 0);
        v33[7] = (int8x8_t)(v126[0].tv_sec + v33[6].u32[0]);
      }
      insque(v33, v4);
      ++*(_DWORD *)(v3 + 224);
    }
  }
  if (!*(_DWORD *)(v3 + 224)) {
    get_prefix(v3);
  }
  uint64_t v48 = agetnum("mtu");
  unint64_t v49 = v48 & ~(v48 >> 63);
  if (HIDWORD(v49)) {
    goto LABEL_202;
  }
  *(_DWORD *)(v3 + 108) = v49;
  if (v49)
  {
    if (v49 < 0x500 || *(_DWORD *)(v3 + 80) < v49) {
      goto LABEL_202;
    }
  }
  else
  {
    v78 = agetstr("mtu", &v124);
    if (v78 && !strcmp(v78, "auto")) {
      *(_DWORD *)(v3 + 108) = *(_DWORD *)(v3 + 80);
    }
  }
  int v50 = -1;
  *(_DWORD *)(v3 + 288) = 0;
  do
  {
    makeentry((char *)v127, 0x100uLL, v50, "rtprefix");
    v51 = agetstr((const char *)v127, &v124);
    if (!v51)
    {
      makeentry((char *)v126, 0x100uLL, v50, "rtrprefix");
      v52 = agetstr((const char *)v126, &v124);
      if (!v52) {
        goto LABEL_113;
      }
      v51 = v52;
      fprintf(__stderrp, "%s was obsoleted.  Use %s.\n", (const char *)v126, (const char *)v127);
    }
    v53 = malloc_type_malloc(0x30uLL, 0x1020040586F8431uLL);
    if (!v53) {
      goto LABEL_201;
    }
    v54 = v53;
    v53[1] = 0u;
    v53[2] = 0u;
    _OWORD *v53 = 0u;
    insque(v53, v123);
    ++*(_DWORD *)(v3 + 288);
    if (inet_pton(30, v51, v54 + 7) != 1) {
      goto LABEL_202;
    }
    makeentry((char *)v127, 0x100uLL, v50, "rtplen");
    unint64_t v55 = agetnum((const char *)v127);
    if ((v55 & 0x8000000000000000) != 0 || v55 == 256)
    {
      makeentry((char *)v126, 0x100uLL, v50, "rtrplen");
      unint64_t v55 = agetnum((const char *)v126);
      if ((v55 & 0x8000000000000000) != 0)
      {
        LODWORD(v55) = 64;
        goto LABEL_92;
      }
      unint64_t v56 = v55;
      LODWORD(v55) = 64;
      if (v56 == 256) {
        goto LABEL_92;
      }
      fprintf(__stderrp, "%s was obsoleted.  Use %s.\n", (const char *)v126, (const char *)v127);
      unint64_t v55 = v56;
    }
    if (v55 >= 0x81) {
      goto LABEL_202;
    }
LABEL_92:
    v54[6] = v55;
    makeentry((char *)v127, 0x100uLL, v50, "rtflags");
    v57 = agetstr((const char *)v127, &v124);
    if (v57)
    {
      v58 = v57;
      v59 = strchr(v57, 104);
      v60 = strchr(v58, 108);
      if (v60) {
        char v61 = 24;
      }
      else {
        char v61 = 8 * (v59 != 0);
      }
      if (v60 && v59) {
        goto LABEL_202;
      }
    }
    else
    {
      uint64_t v62 = agetnum((const char *)v127);
      if (v62 < 0 || (char v61 = v62, v62 == 256))
      {
        makeentry((char *)v126, 0x100uLL, v50, "rtrflags");
        uint64_t v63 = agetnum((const char *)v126);
        if (v63 < 0 || (char v61 = v63, v63 == 256))
        {
          v54[5] = 0;
          goto LABEL_105;
        }
        fprintf(__stderrp, "%s was obsoleted.  Use %s.\n", (const char *)v126, (const char *)v127);
      }
    }
    v54[5] = v61 & 0x18;
    if ((v61 & 0x18) == 0x10) {
      goto LABEL_202;
    }
LABEL_105:
    makeentry((char *)v127, 0x100uLL, v50, "rtltime");
    uint64_t v64 = agetnum((const char *)v127);
    if (v64 < 0) {
      unint64_t v65 = -1;
    }
    else {
      unint64_t v65 = v64;
    }
    if ((v64 & 0x8000000000000000) == 0) {
      goto LABEL_111;
    }
    makeentry((char *)v126, 0x100uLL, v50, "rtrltime");
    unint64_t v65 = agetnum((const char *)v126);
    if ((v65 & 0x8000000000000000) == 0)
    {
      fprintf(__stderrp, "%s was obsoleted.  Use %s.\n", (const char *)v126, (const char *)v127);
LABEL_111:
      if (HIDWORD(v65)) {
        goto LABEL_202;
      }
      goto LABEL_112;
    }
    fprintf(__stderrp, "%s should be specified for interface %s.\n", (const char *)v127, v122);
    LODWORD(v65) = *(unsigned __int16 *)(v3 + 84);
LABEL_112:
    v54[4] = v65;
LABEL_113:
    ++v50;
  }
  while (v50 != 100);
  uint64_t v66 = agetnum("rdnsslifetime");
  unint64_t v67 = *(unsigned int *)(v3 + 88);
  if (v66 >= 0) {
    unint64_t v68 = v66;
  }
  else {
    unint64_t v68 = (2 * v67);
  }
  BOOL v69 = v68 < v67 || v68 > (2 * v67);
  if (v69) {
    rtadvdLog();
  }
  *(_DWORD *)(v3 + 332) = v68;
  int v70 = agetnum("rdnssaddrs");
  int v71 = v70;
  if (v70 < 0)
  {
    *(_DWORD *)(v3 + 328) = 0;
  }
  else
  {
    *(_DWORD *)(v3 + 328) = v70;
    if (v70)
    {
      int v72 = v70 + 1;
      while (1)
      {
        v73 = malloc_type_malloc(0x20uLL, 0x10200406C4767B9uLL);
        if (!v73) {
          break;
        }
        v74 = v73;
        _OWORD *v73 = 0u;
        v73[1] = 0u;
        insque(v73, v120);
        makeentry((char *)v127, 0x100uLL, v72 - 2, "rdnssaddr");
        v75 = agetstr((const char *)v127, &v124);
        v76 = v75;
        if (v71 == 1 && !v75)
        {
          __strlcpy_chk();
          v76 = agetstr((const char *)v127, &v124);
        }
        if (!v76) {
          goto LABEL_202;
        }
        v77 = (unsigned __int8 *)(v74 + 1);
        if (inet_pton(30, v76, v77) != 1 || *v77 == 255) {
          goto LABEL_202;
        }
        if (--v72 <= 1) {
          goto LABEL_143;
        }
      }
LABEL_201:
      v117 = __error();
      strerror(*v117);
      goto LABEL_202;
    }
  }
LABEL_143:
  uint64_t v79 = agetnum("dnssllifetime");
  unint64_t v80 = *(unsigned int *)(v3 + 88);
  if (v79 >= 0) {
    unint64_t v81 = v79;
  }
  else {
    unint64_t v81 = (2 * v80);
  }
  if (v81 < v80 || v81 > (2 * v80)) {
    rtadvdLog();
  }
  *(_DWORD *)(v3 + 364) = v81;
  *(_DWORD *)(v3 + 368) = 8;
  int v82 = agetnum("dnssldomains");
  int v83 = v82;
  if (v82 < 0)
  {
    *(_DWORD *)(v3 + 360) = 0;
  }
  else
  {
    *(_DWORD *)(v3 + 360) = v82;
    if (v82)
    {
      do
      {
        makeentry((char *)v127, 0x20uLL, v83 - 1, "dnssldomain");
        v84 = agetstr((const char *)v127, &v124);
        if (!v84)
        {
          if (*(_DWORD *)(v3 + 360) != 1) {
            goto LABEL_202;
          }
          __strlcpy_chk();
          v84 = agetstr((const char *)v127, &v124);
          if (!v84) {
            goto LABEL_202;
          }
        }
        int v85 = strlen(v84);
        if (v85 >= 1)
        {
          v86 = &v84[v85 - 1 + 1];
          while (*v84 == 46)
          {
            ++v84;
            BOOL v87 = __OFSUB__(v85--, 1);
            if ((v85 < 0) ^ v87 | (v85 == 0))
            {
              int v85 = 0;
              goto LABEL_161;
            }
          }
        }
        v86 = v84;
LABEL_161:
        uint64_t v88 = v85;
        int64_t v89 = ((unint64_t)v85 << 32) + 0x1A00000000;
        int v90 = v85 + 3;
        while ((int)v88 >= 1)
        {
          uint64_t v91 = v88 - 1;
          int v92 = v86[v88 - 1];
          v89 -= 0x100000000;
          --v90;
          --v88;
          if (v92 != 46)
          {
            size_t v93 = v91 + 1;
            size_t v94 = v89 >> 32;
            v95 = (char *)malloc_type_malloc(v89 >> 32, 0x922267D2uLL);
            bzero(v95, v94);
            insque(v95, v121);
            memcpy(v95 + 16, v86, v93);
            *(_DWORD *)(v3 + 368) += v90;
            break;
          }
        }
        BOOL v69 = v83-- <= 1;
      }
      while (!v69);
    }
    *(_DWORD *)(v3 + 368) = (*(_DWORD *)(v3 + 368) & 0xFFFFFFF8) + 8;
  }
  v96 = agetstr("capport", &v124);
  if (v96)
  {
    v97 = v96;
    *(void *)(v3 + 376) = strdup(v96);
    int v98 = strlen(v97);
    *(_DWORD *)(v3 + 384) = v98;
    *(_DWORD *)(v3 + 388) = v98 - (((_BYTE)v98 + 2) & 7) + 10;
  }
  v99 = agetstr("pref64addr", &v124);
  if (v99)
  {
    if (inet_pton(30, v99, (void *)(v3 + 396)) != 1) {
      goto LABEL_202;
    }
    *(unsigned char *)(v3 + 392) = 1;
    uint64_t v100 = agetnum("pref64len");
    int v101 = v100 >= 0 ? v100 : 64;
    HIDWORD(v103) = v101;
    LODWORD(v103) = v101 - 32;
    unsigned int v102 = v103 >> 3;
    if (v102 >= 9 || ((0x11Fu >> v102) & 1) == 0) {
      goto LABEL_202;
    }
    uint64_t v104 = qword_10000BE30[v102];
    *(unsigned char *)(v3 + 393) = v101;
    unint64_t v105 = agetnum("pref64lifetime");
    if ((v105 & 0x8000000000000000) != 0)
    {
      if ((3 * *(_DWORD *)(v3 + 88)) >= 0xFFF8) {
        LOWORD(v105) = -8;
      }
      else {
        LOWORD(v105) = 3 * *(_WORD *)(v3 + 88);
      }
    }
    else if (v105 >= 0xFFF9)
    {
      goto LABEL_202;
    }
    __int16 v106 = (v105 & 0xFFF8) + 8;
    if ((v105 & 7) == 0) {
      __int16 v106 = v105;
    }
    *(_WORD *)(v3 + 394) = v106 | v104;
  }
  if (agetflag("pvd"))
  {
    if (agetflag("http")) {
      *(unsigned char *)(v3 + 413) |= 0x80u;
    }
    if (agetflag("legacy")) {
      *(unsigned char *)(v3 + 413) |= 0x40u;
    }
    int v107 = agetflag("ra");
    char v108 = *(unsigned char *)(v3 + 413);
    if (v107)
    {
      v108 |= 0x20u;
      *(unsigned char *)(v3 + 413) = v108;
    }
    if (v108 < 0)
    {
      uint64_t v109 = agetnum("delay");
      unint64_t v110 = v109 & ~(v109 >> 63);
      if (v110 >= 0x100) {
        goto LABEL_202;
      }
      *(unsigned char *)(v3 + 412) = v110 & 0xF;
      uint64_t v111 = agetnum("seqnr");
      unint64_t v112 = v111 & ~(v111 >> 63);
      if (v112 >= 0x10000) {
        goto LABEL_202;
      }
      *(_WORD *)(v3 + 414) = v112;
    }
    v113 = agetstr("pvdid", &v124);
    if (!v113) {
      goto LABEL_202;
    }
    v114 = v113;
    *(void *)(v3 + 416) = strdup(v113);
    int v115 = strlen(v114);
    *(_DWORD *)(v3 + 424) = v115;
    *(_DWORD *)(v3 + 428) = v115 - (((_BYTE)v115 + 6) & 7) + 14;
  }
  *(void *)uint64_t v3 = ralist;
  ralist = v3;
  make_packet(v3);
  v116 = rtadvd_add_timer((uint64_t)ra_timeout, (uint64_t)ra_timer_update, v3, v3);
  *(void *)(v3 + 8) = v116;
  ra_timer_update((_DWORD *)v3, (uint64_t)(v116 + 24));
  rtadvd_set_timer(*(void *)(v3 + 8) + 24, *(void *)(v3 + 8));
}

size_t makeentry(char *a1, size_t __size, int a3, char *__source)
{
  if ((a3 & 0x80000000) == 0) {
    return snprintf(a1, __size, "%s%d", __source, a3);
  }
  return strlcpy(a1, __source, __size);
}

void get_prefix(uint64_t a1)
{
  uint64_t v20 = 0;
  if (getifaddrs(&v20) < 0)
  {
LABEL_27:
    rtadvdLog();
    exit(1);
  }
  int v2 = v20;
  if (!v20)
  {
    unsigned __int8 v17 = 0;
    goto LABEL_23;
  }
  uint64_t v3 = (void *)(a1 + 128);
  do
  {
    if (strcmp(v2->ifa_name, (const char *)(a1 + 64))) {
      goto LABEL_20;
    }
    ifa_addr = v2->ifa_addr;
    if (ifa_addr->sa_family != 30) {
      goto LABEL_20;
    }
    int v5 = (unsigned __int8 *)&ifa_addr->sa_data[6];
    if (ifa_addr->sa_data[6] == 254 && (ifa_addr->sa_data[7] & 0xC0) == 0x80) {
      goto LABEL_20;
    }
    ifa_netmask = v2->ifa_netmask;
    unint64_t v7 = (unint64_t)ifa_netmask + ifa_netmask->sa_len;
    int v8 = prefixlen(&ifa_netmask->sa_data[6], v7);
    if ((v8 - 129) <= 0xFFFFFF7F) {
      goto LABEL_27;
    }
    int v9 = v8;
    if (v8 == 128 || find_prefix(a1, v5, v8)) {
      goto LABEL_20;
    }
    int v19 = v3;
    uint64_t v10 = malloc_type_malloc(0x60uLL, 0x1020040CF300BDFuLL);
    if (!v10)
    {
      v18 = __error();
      strerror(*v18);
      goto LABEL_27;
    }
    uint64_t v11 = v10;
    v10[3] = 0u;
    v10[4] = 0u;
    v10[1] = 0u;
    v10[2] = 0u;
    v10[5] = 0u;
    unsigned int v12 = v10 + 5;
    *uint64_t v10 = 0u;
    *((_DWORD *)v10 + 18) = v9;
    v10[5] = *(_OWORD *)v5;
    unint64_t v13 = v10 + 5;
    if ((unint64_t)&ifa_netmask->sa_data[6] >= v7) {
      goto LABEL_17;
    }
    unint64_t v14 = (unint64_t)(v11 + 96);
    uint64_t v15 = (unsigned __int8 *)&ifa_netmask->sa_data[7];
    unint64_t v13 = v12;
    do
    {
      *v13++ &= *(v15 - 1);
      if ((unint64_t)v15 >= v7) {
        break;
      }
      ++v15;
    }
    while ((unint64_t)v13 < v14);
    if ((unint64_t)v13 < v14) {
LABEL_17:
    }
      bzero(v13, v11 - v13 + 96);
    if (!inet_ntop(30, v12, v21, 0x2Eu)) {
      goto LABEL_27;
    }
    rtadvdLog();
    *((_DWORD *)v11 + 8) = 2592000;
    *((_DWORD *)v11 + 12) = 604800;
    *((void *)v11 + 8) = 0x100000001;
    *((_DWORD *)v11 + 19) = 1;
    *((void *)v11 + 2) = a1;
    int v16 = v11;
    uint64_t v3 = v19;
    insque(v16, v19);
    ++*(_DWORD *)(a1 + 224);
LABEL_20:
    int v2 = v2->ifa_next;
  }
  while (v2);
  unsigned __int8 v17 = v20;
LABEL_23:
  freeifaddrs(v17);
}

void make_packet(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48))
  {
    int v2 = lladdropt_length(*(void *)(a1 + 56));
    uint64_t v3 = v2;
    if (!v2)
    {
      rtadvdLog();
      *(_DWORD *)(a1 + 48) = 0;
    }
    uint64_t v4 = v3 + 16;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 16;
  }
  uint64_t v5 = v4 + 32 * *(int *)(a1 + 224);
  if (*(_DWORD *)(a1 + 108)) {
    v5 += 8;
  }
  uint64_t v6 = a1 + 240;
  for (uint64_t i = *(void *)(a1 + 248); i != v6; uint64_t i = *(void *)(i + 8))
    v5 += (int)((((*(_DWORD *)(i + 24) + 63) >> 3) & 0xFFFFFFF8) + 8);
  uint64_t v8 = *(unsigned int *)(a1 + 328);
  if ((int)v8 <= 0) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = (16 * v8) | 8;
  }
  uint64_t v10 = v9 + v5;
  if (*(int *)(a1 + 360) >= 1) {
    v10 += *(unsigned int *)(a1 + 368);
  }
  uint64_t v11 = v10 + *(unsigned int *)(a1 + 388);
  if (*(unsigned char *)(a1 + 392)) {
    v11 += 16;
  }
  size_t v12 = v11 + *(unsigned int *)(a1 + 428);
  unint64_t v13 = (int8x8_t *)malloc_type_malloc(v12, 0x103316A2uLL);
  if (!v13) {
    goto LABEL_73;
  }
  unint64_t v14 = v13;
  uint64_t v15 = *(void **)(a1 + 440);
  if (v15) {
    free(v15);
  }
  *(void *)(a1 + 432) = v12;
  *(void *)(a1 + 440) = v14;
  v14->i32[0] = 134;
  v14->i8[4] = *(_DWORD *)(a1 + 120);
  v14->i8[5] = 0;
  int v16 = *(_DWORD *)(a1 + 104);
  v14->i8[5] = v16;
  LOBYTE(v16) = v16 | ((*(_DWORD *)(a1 + 96) != 0) << 7);
  v14->i8[5] = v16;
  v14->i8[5] = v16 | ((*(_DWORD *)(a1 + 100) != 0) << 6);
  v14->i16[3] = bswap32(*(unsigned __int16 *)(a1 + 84)) >> 16;
  v14[1] = vrev32_s8(*(int8x8_t *)(a1 + 112));
  uint64_t v17 = (uint64_t)&v14[2];
  if (*(_DWORD *)(a1 + 48))
  {
    lladdropt_fill(*(void *)(a1 + 56), v17);
    v17 += v3;
  }
  unsigned int v18 = *(_DWORD *)(a1 + 108);
  if (v18)
  {
    *(_DWORD *)uint64_t v17 = 261;
    *(_DWORD *)(v17 + 4) = bswap32(v18);
    v17 += 8;
  }
  for (j = *(uint64_t **)(a1 + 128); j != (uint64_t *)(a1 + 128); j = (uint64_t *)*j)
  {
    v46.tv_sec = 0;
    *(void *)&v46.tv_usec = 0;
    *(_WORD *)uint64_t v17 = 1027;
    *(unsigned char *)(v17 + 2) = *((_DWORD *)j + 18);
    int v20 = *((_DWORD *)j + 16);
    char v21 = v20 != 0;
    if (v20) {
      char v22 = 0x80;
    }
    else {
      char v22 = 0;
    }
    *(unsigned char *)(v17 + 3) = v21 << 7;
    if (*((_DWORD *)j + 17)) {
      *(unsigned char *)(v17 + 3) = v22 | 0x40;
    }
    if (j[3])
    {
      unsigned int v23 = 0;
    }
    else
    {
      if ((j[5] || j[7]) && (gettimeofday(&v46, 0), (__darwin_time_t v24 = j[5]) != 0))
      {
        if (v24 <= v46.tv_sec) {
          unsigned int v23 = 0;
        }
        else {
          unsigned int v23 = v24 - LODWORD(v46.tv_sec);
        }
      }
      else
      {
        unsigned int v23 = *((_DWORD *)j + 8);
      }
      if (!j[3])
      {
        __darwin_time_t v26 = j[7];
        if (v26)
        {
          if (v26 <= v46.tv_sec) {
            unsigned int v25 = 0;
          }
          else {
            unsigned int v25 = v26 - LODWORD(v46.tv_sec);
          }
        }
        else
        {
          unsigned int v25 = *((_DWORD *)j + 12);
        }
        goto LABEL_42;
      }
    }
    unsigned int v25 = 0;
LABEL_42:
    if (v23 < v25) {
      unsigned int v25 = v23;
    }
    *(_DWORD *)(v17 + 4) = bswap32(v23);
    *(void *)(v17 + 8) = bswap32(v25);
    *(_OWORD *)(v17 + 16) = *((_OWORD *)j + 5);
    v17 += 32;
  }
  for (uint64_t k = *(void *)(a1 + 248); k != v6; uint64_t k = *(void *)(k + 8))
  {
    int v28 = *(_DWORD *)(k + 24);
    *(unsigned char *)uint64_t v17 = 24;
    *(unsigned char *)(v17 + 1) = ((v28 + 63) >> 6) + 1;
    *(unsigned char *)(v17 + 2) = v28;
    *(unsigned char *)(v17 + 3) = *(_DWORD *)(k + 20);
    *(_DWORD *)(v17 + 4) = bswap32(*(_DWORD *)(k + 16));
    v29 = (void *)(v17 + 8);
    size_t v30 = ((v28 + 63) >> 3) & 0x7F8;
    memcpy(v29, (const void *)(k + 28), v30);
    uint64_t v17 = (uint64_t)v29 + v30;
  }
  int v31 = *(_DWORD *)(a1 + 328);
  if (v31 >= 1)
  {
    *(unsigned char *)uint64_t v17 = 25;
    *(unsigned char *)(v17 + 1) = (2 * v31) | 1;
    *(_WORD *)(v17 + 2) = 0;
    *(_DWORD *)(v17 + 4) = bswap32(*(_DWORD *)(a1 + 332));
    v17 += 8;
    for (m = *(uint64_t **)(a1 + 296); m != (uint64_t *)(a1 + 296); m = (uint64_t *)*m)
    {
      *(_OWORD *)uint64_t v17 = *((_OWORD *)m + 1);
      v17 += 16;
    }
  }
  if (*(int *)(a1 + 360) >= 1)
  {
    bzero((void *)v17, *(unsigned int *)(a1 + 368));
    *(unsigned char *)uint64_t v17 = 31;
    unsigned int v33 = *(_DWORD *)(a1 + 368);
    *(unsigned char *)(v17 + 1) = v33 >> 3;
    *(_WORD *)(v17 + 2) = 0;
    *(_DWORD *)(v17 + 4) = bswap32(*(_DWORD *)(a1 + 364));
    v34 = *(const char **)(a1 + 336);
    if (v34 != (const char *)(a1 + 336))
    {
      int v35 = (char *)(v17 + 8);
      do
      {
        v35 += (int)encode_domain(v34 + 16, v35);
        v34 = *(const char **)v34;
      }
      while (v34 != (const char *)(a1 + 336));
      unsigned int v33 = *(_DWORD *)(a1 + 368);
    }
    v17 += v33;
  }
  uint64_t v36 = *(const void **)(a1 + 376);
  if (v36)
  {
    *(unsigned char *)uint64_t v17 = 37;
    *(unsigned char *)(v17 + 1) = *(_DWORD *)(a1 + 388) >> 3;
    uint64_t v37 = (void *)(v17 + 2);
    memmove(v37, v36, *(unsigned int *)(a1 + 384));
    uint64_t v38 = *(unsigned int *)(a1 + 384);
    uint64_t v17 = (uint64_t)v37 + v38;
    int v39 = *(_DWORD *)(a1 + 388) - 2;
    uint64_t v40 = (v39 - v38);
    if (v39 != v38)
    {
      bzero((void *)v17, (v39 - v38));
      v17 += v40;
    }
  }
  if (*(unsigned char *)(a1 + 392))
  {
    uint64_t v41 = v17 + 16;
    *(_WORD *)uint64_t v17 = 550;
    *(_WORD *)(v17 + 2) = bswap32(*(unsigned __int16 *)(a1 + 394)) >> 16;
    unint64_t v42 = *(unsigned __int8 *)(a1 + 393);
    uint64_t v43 = (char *)(v17 + 4);
    memmove(v43, (const void *)(a1 + 396), v42 >> 3);
    if ((v42 >> 3) != 12) {
      bzero(&v43[v42 >> 3], (12 - (v42 >> 3)));
    }
  }
  else
  {
    uint64_t v41 = v17;
  }
  unsigned int v44 = *(_DWORD *)(a1 + 428);
  if (v44)
  {
    *(unsigned char *)uint64_t v41 = 21;
    *(unsigned char *)(v41 + 1) = v44 >> 3;
    *(unsigned char *)(v41 + 2) = *(unsigned char *)(a1 + 413);
    *(unsigned char *)(v41 + 3) = *(unsigned char *)(a1 + 412);
    *(_WORD *)(v41 + 4) = bswap32(*(unsigned __int16 *)(a1 + 414)) >> 16;
    int v45 = encode_domain(*(const char **)(a1 + 416), (char *)(v41 + 6));
    bzero((void *)(v41 + 6 + v45), (*(unsigned char *)(a1 + 428) - v45 - 6));
    v41 += *(unsigned int *)(a1 + 428);
  }
  if (*(void *)(a1 + 432) != v41 - *(void *)(a1 + 440))
  {
LABEL_73:
    rtadvdLog();
    exit(1);
  }
}

void delete_prefix(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  remque((void *)a1);
  inet_ntop(30, (const void *)(a1 + 80), v3, 0x2Eu);
  rtadvdLog();
  if (*(void *)(a1 + 24)) {
    rtadvd_remove_timer((void **)(a1 + 24));
  }
  free((void *)a1);
  --*(_DWORD *)(v2 + 224);
}

void invalidate_prefix(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    rtadvdLog();
    exit(1);
  }
  uint64_t v4 = 0;
  inet_ntop(30, (const void *)(a1 + 80), v5, 0x2Eu);
  rtadvdLog();
  uint64_t v2 = rtadvd_add_timer((uint64_t)prefix_timeout, 0, a1, 0);
  *(void *)(a1 + 24) = v2;
  if (v2)
  {
    uint64_t v3 = 7200;
    LODWORD(v4) = 0;
    rtadvd_set_timer((uint64_t)&v3, (uint64_t)v2);
  }
  else
  {
    rtadvdLog();
    delete_prefix(a1);
  }
}

uint64_t prefix_timeout(uint64_t a1)
{
  return 0;
}

void update_prefix(uint64_t a1)
{
  char v1 = (void **)(a1 + 24);
  if (!*(void *)(a1 + 24))
  {
    rtadvdLog();
    exit(1);
  }
  inet_ntop(30, (const void *)(a1 + 80), v2, 0x2Eu);
  rtadvdLog();
  rtadvd_remove_timer(v1);
}

void make_prefix(uint64_t a1, unsigned int a2, _OWORD *a3, char a4)
{
  memset(v14, 0, sizeof(v14));
  *(_OWORD *)size_t v12 = 0u;
  long long v13 = 0u;
  if (!if_indextoname(a2, v12)
    || (WORD2(v14[0]) = 7708,
        *(_OWORD *)((char *)v14 + 12) = *a3,
        BYTE1(v13) = a4,
        *(void *)((char *)&v13 + 4) = 0x93A8000278D00,
        BYTE12(v13) |= 3u,
        (unint64_t v7 = malloc_type_malloc(0x60uLL, 0x1020040CF300BDFuLL)) == 0))
  {
    uint64_t v11 = __error();
    strerror(*v11);
    rtadvdLog();
    exit(1);
  }
  v7[2] = 0u;
  v7[3] = 0u;
  *unint64_t v7 = 0u;
  v7[1] = 0u;
  v7[5] = *(_OWORD *)((char *)v14 + 12);
  int v8 = BYTE1(v13);
  int v9 = DWORD2(v13);
  *((_DWORD *)v7 + 8) = DWORD1(v13);
  *((_DWORD *)v7 + 12) = v9;
  int v10 = (BYTE12(v13) >> 1) & 1;
  *((_DWORD *)v7 + 16) = BYTE12(v13) & 1;
  *((_DWORD *)v7 + 17) = v10;
  *((_DWORD *)v7 + 18) = v8;
  *((_DWORD *)v7 + 19) = 3;
  *((void *)v7 + 2) = a1;
  insque(v7, (void *)(a1 + 128));
  inet_ntop(30, (char *)v14 + 12, v15, 0x2Eu);
  rtadvdLog();
  free(*(void **)(a1 + 440));
  *(void *)(a1 + 440) = 0;
  ++*(_DWORD *)(a1 + 224);
  make_packet(a1);
}

uint64_t encode_domain(const char *a1, char *a2)
{
  uint64_t v3 = strdup(a1);
  __stringp = v3;
  uint64_t v4 = strsep(&__stringp, ".");
  uint64_t v5 = a2;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v5 = a2;
    do
    {
      char v7 = strlen(v6);
      if ((v7 & 0x3F) != 0)
      {
        *uint64_t v5 = v7 & 0x3F;
        int v8 = v5 + 1;
        size_t v9 = v7 & 0x3F;
        memcpy(v8, v6, v9);
        uint64_t v5 = &v8[v9];
      }
      uint64_t v6 = strsep(&__stringp, ".");
    }
    while (v6);
  }
  *uint64_t v5 = 0;
  free(v3);
  return (v5 - a2 + 1);
}

uint64_t rtadvd_dump_file(const char *a1)
{
  rtadvdLog();
  fp = (uint64_t)fopen(a1, "w");
  if (!fp) {
    return rtadvdLog();
  }
  v38.__darwin_time_t tv_sec = 0;
  *(void *)&v38.tv_usec = 0;
  gettimeofday(&v38, 0);
  for (uint64_t i = ralist; i; uint64_t i = *(void *)i)
  {
    fprintf((FILE *)fp, "%s:\n", (const char *)(i + 64));
    interface_entry = get_interface_entry(*(_DWORD *)(i + 44));
    if (interface_entry)
    {
      uint64_t v4 = "UP";
      if ((*((_DWORD *)interface_entry + 2) & 1) == 0) {
        uint64_t v4 = "DOWN";
      }
      fprintf((FILE *)fp, "  Status: %s\n", v4);
      if (*(void *)(i + 24))
      {
        uint64_t v5 = (FILE *)fp;
        uint64_t v6 = ctime((const time_t *)(i + 24));
        fprintf(v5, "  Last RA sent: %s", v6);
      }
      uint64_t v7 = *(void *)(i + 8);
      int v8 = (FILE *)fp;
      if (v7)
      {
        size_t v9 = ctime((const time_t *)(v7 + 24));
        fprintf(v8, "  Next RA will be sent: %s", v9);
      }
      else
      {
        fwrite("  RA timer is stopped", 0x15uLL, 1uLL, (FILE *)fp);
      }
      fprintf((FILE *)fp, "  waits: %d, initcount: %d\n", *(_DWORD *)(i + 40), *(_DWORD *)(i + 16));
      fprintf((FILE *)fp, "  statistics: RA(out/in/inconsistent): %llu/%llu/%llu, ", *(void *)(i + 448), *(void *)(i + 456), *(void *)(i + 464));
      fprintf((FILE *)fp, "RS(input): %llu\n", *(void *)(i + 472));
      if (*(_DWORD *)(i + 48))
      {
        int v10 = (FILE *)fp;
        uint64_t v11 = *(void *)(i + 56);
        if (*(unsigned __int8 *)(v11 + 6) >= 6u)
        {
          size_t v12 = (unsigned __int8 *)(v11 + *(unsigned __int8 *)(v11 + 5));
          snprintf((char *)&ether_str_hbuf, 0x20uLL, "%x:%x:%x:%x:%x:%x", v12[8], v12[9], v12[10], v12[11], v12[12], v12[13]);
        }
        else
        {
          strcpy((char *)&ether_str_hbuf, "NONE");
        }
        fprintf(v10, "  Link-layer address: %s\n", (const char *)&ether_str_hbuf);
      }
      fprintf((FILE *)fp, "  MTU: %d\n", *(_DWORD *)(i + 80));
      fprintf((FILE *)fp, "  DefaultLifetime: %d, MaxAdvInterval: %d, MinAdvInterval: %d\n", *(unsigned __int16 *)(i + 84), *(_DWORD *)(i + 88), *(_DWORD *)(i + 92));
      long long v13 = "M";
      if (!*(_DWORD *)(i + 96)) {
        long long v13 = (const char *)&unk_10000A8BE;
      }
      unint64_t v14 = "O";
      if (!*(_DWORD *)(i + 100)) {
        unint64_t v14 = (const char *)&unk_10000A8BE;
      }
      fprintf((FILE *)fp, "  Flags: %s%s%s, ", v13, v14, (const char *)&unk_10000A8BE);
      fprintf((FILE *)fp, "Preference: %s, ", *(char **)((char *)rtpref_str + (*(_DWORD *)(i + 104) & 0x7F8)));
      fprintf((FILE *)fp, "MTU: %d\n", *(_DWORD *)(i + 108));
      fprintf((FILE *)fp, "  ReachableTime: %d, RetransTimer: %d, CurHopLimit: %d\n", *(_DWORD *)(i + 112), *(_DWORD *)(i + 116), *(_DWORD *)(i + 120));
      if (*(void *)(i + 232)) {
        fprintf((FILE *)fp, "  Clock skew: %ldsec\n", *(void *)(i + 232));
      }
      uint64_t v15 = *(uint64_t **)(i + 128);
      if (v15 != (uint64_t *)(i + 128))
      {
        char v16 = 0;
        __darwin_time_t tv_sec = v38.tv_sec;
        while (1)
        {
          if ((v16 & 1) == 0) {
            fwrite("  Prefixes:\n", 0xCuLL, 1uLL, (FILE *)fp);
          }
          unsigned int v18 = (FILE *)fp;
          int v19 = inet_ntop(30, v15 + 10, v39, 0x2Eu);
          fprintf(v18, "    %s/%d(", v19, *((_DWORD *)v15 + 18));
          int v20 = *((_DWORD *)v15 + 19);
          if (v20 == 3) {
            break;
          }
          if (v20 == 2)
          {
            char v21 = (FILE *)fp;
            char v22 = "CONFIG, ";
LABEL_33:
            size_t v23 = 8;
LABEL_34:
            fwrite(v22, v23, 1uLL, v21);
            goto LABEL_35;
          }
          if (v20 == 1)
          {
            char v21 = (FILE *)fp;
            char v22 = "KERNEL, ";
            goto LABEL_33;
          }
LABEL_35:
          if (*((_DWORD *)v15 + 8) == -1) {
            fwrite("vltime: infinity", 0x10uLL, 1uLL, (FILE *)fp);
          }
          else {
            fprintf((FILE *)fp, "vltime: %ld", *((unsigned int *)v15 + 8));
          }
          __darwin_time_t v24 = v15[5];
          if (v24)
          {
            BOOL v25 = v24 <= tv_sec;
            __darwin_time_t v26 = v24 - tv_sec;
            if (v25) {
              __darwin_time_t v26 = 0;
            }
            fprintf((FILE *)fp, "(decr,expire %ld), ", v26);
          }
          else
          {
            fwrite(", ", 2uLL, 1uLL, (FILE *)fp);
          }
          if (*((_DWORD *)v15 + 12) == -1) {
            fwrite("pltime: infinity", 0x10uLL, 1uLL, (FILE *)fp);
          }
          else {
            fprintf((FILE *)fp, "pltime: %ld", *((unsigned int *)v15 + 12));
          }
          __darwin_time_t v27 = v15[7];
          if (v27)
          {
            BOOL v25 = v27 <= tv_sec;
            __darwin_time_t v28 = v27 - tv_sec;
            if (v25) {
              __darwin_time_t v28 = 0;
            }
            fprintf((FILE *)fp, "(decr,expire %ld), ", v28);
          }
          else
          {
            fwrite(", ", 2uLL, 1uLL, (FILE *)fp);
          }
          v29 = "L";
          if (!*((_DWORD *)v15 + 16)) {
            v29 = (const char *)&unk_10000A8BE;
          }
          size_t v30 = "A";
          if (!*((_DWORD *)v15 + 17)) {
            size_t v30 = (const char *)&unk_10000A8BE;
          }
          fprintf((FILE *)fp, "flags: %s%s%s", v29, v30, (const char *)&unk_10000A8BE);
          uint64_t v31 = v15[3];
          if (v31)
          {
            v32 = rtadvd_timer_rest(v31);
            if (v32) {
              fprintf((FILE *)fp, ", expire in: %ld", *v32);
            }
          }
          char v16 = 1;
          fwrite(")\n", 2uLL, 1uLL, (FILE *)fp);
          uint64_t v15 = (uint64_t *)*v15;
          if (v15 == (uint64_t *)(i + 128)) {
            goto LABEL_61;
          }
        }
        char v21 = (FILE *)fp;
        char v22 = "DYNAMIC, ";
        size_t v23 = 9;
        goto LABEL_34;
      }
LABEL_61:
      uint64_t v33 = *(void *)(i + 248);
      if (v33 != i + 240)
      {
        char v34 = 0;
        do
        {
          if ((v34 & 1) == 0) {
            fwrite("  Route Information:\n", 0x15uLL, 1uLL, (FILE *)fp);
          }
          int v35 = (FILE *)fp;
          uint64_t v36 = inet_ntop(30, (const void *)(v33 + 28), v39, 0x2Eu);
          fprintf(v35, "    %s/%d (", v36, *(_DWORD *)(v33 + 24));
          fprintf((FILE *)fp, "preference: %s, ", *(char **)((char *)rtpref_str + (*(_DWORD *)(v33 + 20) & 0x7F8)));
          if (*(_DWORD *)(v33 + 16) == -1) {
            fwrite("lifetime: infinity", 0x12uLL, 1uLL, (FILE *)fp);
          }
          else {
            fprintf((FILE *)fp, "lifetime: %ld", *(unsigned int *)(v33 + 16));
          }
          char v34 = 1;
          fwrite(")\n", 2uLL, 1uLL, (FILE *)fp);
          uint64_t v33 = *(void *)(v33 + 8);
        }
        while (v33 != i + 240);
      }
    }
    else
    {
      rtadvdLog();
    }
  }
  return fclose((FILE *)fp);
}

void *if_nametosdl(const char *a1)
{
  *(_OWORD *)char v22 = xmmword_10000BE98;
  uint64_t v23 = 3;
  size_t size = 0;
  if (sysctl(v22, 6u, 0, &size, 0, 0) < 0) {
    return 0;
  }
  uint64_t v2 = (unsigned __int16 *)malloc_type_malloc(size, 0x43F054D0uLL);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  if (sysctl(v22, 6u, v2, &size, 0, 0) < 0)
  {
LABEL_32:
    free(v3);
    return 0;
  }
  if ((uint64_t)size < 1)
  {
    if (size) {
      goto LABEL_30;
    }
    goto LABEL_32;
  }
  uint64_t v4 = 0;
  uint64_t v5 = (unsigned __int16 *)((char *)v3 + size);
  long long v20 = 0u;
  long long v21 = 0u;
  memset(v19, 0, sizeof(v19));
  uint64_t v6 = v3;
  while (1)
  {
    if (*((unsigned char *)v6 + 3) != 14) {
      goto LABEL_24;
    }
    uint64_t v7 = 0;
    int v8 = v6 + 56;
    unsigned int v9 = *((_DWORD *)v6 + 1);
    do
    {
      if ((v9 >> v7))
      {
        *((void *)v19 + v7) = v8;
        uint64_t v10 = *v8;
        if ((v10 & 3) != 0) {
          uint64_t v11 = (v10 | 3) + 1;
        }
        else {
          uint64_t v11 = *v8;
        }
        if (*v8) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 4;
        }
        v8 += v12;
      }
      else
      {
        *((void *)v19 + v7) = 0;
      }
      ++v7;
    }
    while (v7 != 8);
    long long v13 = (unsigned __int8 *)v20;
    if (!(void)v20 || *(unsigned char *)(v20 + 1) != 18) {
      goto LABEL_24;
    }
    size_t v14 = strlen(a1);
    if (v14 != *(unsigned __int8 *)(v20 + 5))
    {
      uint64_t v4 = (unsigned __int8 *)v20;
      goto LABEL_24;
    }
    uint64_t v4 = (unsigned __int8 *)v20;
    if (!strncmp((const char *)(v20 + 8), a1, v14)) {
      break;
    }
LABEL_24:
    uint64_t v6 = (unsigned __int16 *)((char *)v6 + *v6);
    if (v6 >= v5) {
      goto LABEL_25;
    }
  }
  uint64_t v4 = v13;
LABEL_25:
  if (v6 == v5) {
    goto LABEL_32;
  }
  if (!v4)
  {
LABEL_30:
    char v16 = 0;
    goto LABEL_31;
  }
  uint64_t v15 = malloc_type_malloc(*v4, 0x4D435540uLL);
  char v16 = v15;
  if (v15) {
    memcpy(v15, v4, *v4);
  }
LABEL_31:
  free(v3);
  return v16;
}

uint64_t if_getmtu(const char *a1)
{
  int v8 = 0;
  if (getifaddrs(&v8) < 0) {
    return 0;
  }
  uint64_t v2 = &v8;
  do
  {
    uint64_t v2 = (ifaddrs **)*v2;
    if (!v2) {
      goto LABEL_8;
    }
  }
  while (strcmp((const char *)v2[1], a1));
  uint64_t v3 = v2[6];
  if (!v3)
  {
LABEL_8:
    freeifaddrs(v8);
    goto LABEL_9;
  }
  uint64_t ifa_name_low = LODWORD(v3->ifa_name);
  freeifaddrs(v8);
  if (ifa_name_low) {
    return ifa_name_low;
  }
LABEL_9:
  long long v9 = 0u;
  long long v10 = 0u;
  int v5 = socket(30, 2, 0);
  if (v5 < 0) {
    return 0;
  }
  int v6 = v5;
  BYTE1(v10) = 30;
  __strlcpy_chk();
  if (ioctl(v6, 0xC0206933uLL, &v9) < 0)
  {
    close(v6);
    return 0;
  }
  close(v6);
  return v10;
}

uint64_t if_getflags(unsigned int a1, int a2)
{
  *(_OWORD *)int v8 = 0u;
  long long v9 = 0u;
  int v4 = socket(30, 2, 0);
  if (v4 < 0)
  {
    uint64_t v7 = __error();
    strerror(*v7);
    rtadvdLog();
  }
  else
  {
    int v5 = v4;
    if_indextoname(a1, v8);
    if ((ioctl(v5, 0xC0206911uLL, v8) & 0x80000000) == 0)
    {
      close(v5);
      return (__int16)v9;
    }
    rtadvdLog();
    close(v5);
  }
  return a2 & 0xFFFFFFFE;
}

uint64_t lladdropt_length(uint64_t a1)
{
  return 8 * (*(unsigned char *)(a1 + 4) == 6);
}

uint64_t lladdropt_fill(uint64_t result, uint64_t a2)
{
  *(unsigned char *)a2 = 1;
  if (*(unsigned char *)(result + 4) != 6)
  {
    rtadvdLog();
    exit(1);
  }
  *(unsigned char *)(a2 + 1) = 1;
  uint64_t v2 = result + *(unsigned __int8 *)(result + 5);
  int v3 = *(_DWORD *)(v2 + 8);
  *(_WORD *)(a2 + 6) = *(_WORD *)(v2 + 12);
  *(_DWORD *)(a2 + 2) = v3;
  return result;
}

unsigned __int16 *get_next_msg(unsigned __int16 *a1, unint64_t a2, int a3, void *a4, unsigned int a5)
{
  *a4 = 0;
  if ((unint64_t)a1 < a2)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int v5 = a1;
    while (1)
    {
      uint64_t v6 = *v5;
      if (!*v5)
      {
        rtadvdLog();
        return v5;
      }
      unsigned int v7 = *((unsigned __int8 *)v5 + 3);
      if (((a5 >> v7) & 1) != 0 && v7 <= 0xE)
      {
        if (((1 << v7) & 0x16) != 0)
        {
          uint64_t v8 = 0;
          long long v9 = v5 + 46;
          unsigned int v10 = *((_DWORD *)v5 + 3);
          do
          {
            if ((v10 >> v8))
            {
              *((void *)&v24 + v8) = v9;
              uint64_t v11 = *v9;
              if ((v11 & 3) != 0) {
                uint64_t v12 = (v11 | 3) + 1;
              }
              else {
                uint64_t v12 = *v9;
              }
              if (*v9) {
                uint64_t v13 = v12;
              }
              else {
                uint64_t v13 = 4;
              }
              v9 += v13;
            }
            else
            {
              *((void *)&v24 + v8) = 0;
            }
            ++v8;
          }
          while (v8 != 8);
          if ((void)v24)
          {
            if (*(unsigned char *)(v24 + 1) == 30)
            {
              int v14 = *(unsigned __int8 *)(v24 + 8);
              if (v14 != 255
                && (v14 != 254 || (*(unsigned char *)(v24 + 9) & 0xC0) != 0x80)
                && *((void *)&v24 + 1)
                && *(unsigned char *)(*((void *)&v24 + 1) + 1) == 18
                && (!a3 || *(unsigned __int16 *)(*((void *)&v24 + 1) + 2) == a3)
                && (void)v25)
              {
                goto LABEL_56;
              }
            }
          }
        }
        else if (((1 << v7) & 0x3000) != 0)
        {
          uint64_t v15 = 0;
          char v16 = v5 + 10;
          unsigned int v17 = *((_DWORD *)v5 + 1);
          do
          {
            if ((v17 >> v15))
            {
              *((void *)&v24 + v15) = v16;
              uint64_t v18 = *v16;
              if ((v18 & 3) != 0) {
                uint64_t v19 = (v18 | 3) + 1;
              }
              else {
                uint64_t v19 = *v16;
              }
              if (*v16) {
                uint64_t v20 = v19;
              }
              else {
                uint64_t v20 = 4;
              }
              v16 += v20;
            }
            else
            {
              *((void *)&v24 + v15) = 0;
            }
            ++v15;
          }
          while (v15 != 8);
          if (*((void *)&v26 + 1))
          {
            int v21 = *(unsigned __int8 *)(*((void *)&v26 + 1) + 1);
            if (v21 == 2
              || v21 == 30
              && (int v22 = *(unsigned __int8 *)(*((void *)&v26 + 1) + 8), v22 != 255)
              && (v22 != 254 || (*(unsigned char *)(*((void *)&v26 + 1) + 9) & 0xC0) != 0x80))
            {
              if (!a3 || v5[6] == a3)
              {
LABEL_56:
                *a4 = v6;
                return v5;
              }
            }
          }
        }
        else if (v7 == 14)
        {
          goto LABEL_56;
        }
      }
      int v5 = (unsigned __int16 *)((char *)v5 + v6);
      if ((unint64_t)v5 >= a2) {
        return v5;
      }
    }
  }
  return a1;
}

uint64_t get_addr(uint64_t a1)
{
  uint64_t v1 = 0;
  memset(v8, 0, sizeof(v8));
  uint64_t v2 = (unsigned char *)(a1 + 92);
  unsigned int v3 = *(_DWORD *)(a1 + 12);
  do
  {
    if ((v3 >> v1))
    {
      *((void *)v8 + v1) = v2;
      uint64_t v4 = *v2;
      if ((v4 & 3) != 0) {
        uint64_t v5 = (v4 | 3) + 1;
      }
      else {
        uint64_t v5 = *v2;
      }
      if (*v2) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 4;
      }
      v2 += v6;
    }
    else
    {
      *((void *)v8 + v1) = 0;
    }
    ++v1;
  }
  while (v1 != 8);
  return *(void *)&v8[0] + 8;
}

uint64_t get_rtm_ifindex(uint64_t a1)
{
  uint64_t v1 = 0;
  memset(v8, 0, sizeof(v8));
  uint64_t v2 = (unsigned char *)(a1 + 92);
  unsigned int v3 = *(_DWORD *)(a1 + 12);
  do
  {
    if ((v3 >> v1))
    {
      *((void *)v8 + v1) = v2;
      uint64_t v4 = *v2;
      if ((v4 & 3) != 0) {
        uint64_t v5 = (v4 | 3) + 1;
      }
      else {
        uint64_t v5 = *v2;
      }
      if (*v2) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 4;
      }
      v2 += v6;
    }
    else
    {
      *((void *)v8 + v1) = 0;
    }
    ++v1;
  }
  while (v1 != 8);
  return *(unsigned __int16 *)(*((void *)&v8[0] + 1) + 2);
}

uint64_t get_ifm_ifindex(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 12);
}

uint64_t get_ifm_flags(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t get_prefixlen(uint64_t a1)
{
  uint64_t v1 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = (unsigned char *)(a1 + 92);
  unsigned int v3 = *(_DWORD *)(a1 + 12);
  do
  {
    if ((v3 >> v1))
    {
      *((void *)&v10 + v1) = v2;
      uint64_t v4 = *v2;
      if ((v4 & 3) != 0) {
        uint64_t v5 = (v4 | 3) + 1;
      }
      else {
        uint64_t v5 = *v2;
      }
      if (*v2) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 4;
      }
      v2 += v6;
    }
    else
    {
      *((void *)&v10 + v1) = 0;
    }
    ++v1;
  }
  while (v1 != 8);
  unsigned int v7 = (unsigned char *)(v11 + 8);
  unint64_t v8 = v11 + *(unsigned __int8 *)v11;

  return prefixlen(v7, v8);
}

uint64_t prefixlen(unsigned char *a1, unint64_t a2)
{
  if ((unint64_t)a1 >= a2) {
    return 0;
  }
  uint64_t v2 = 0;
  unint64_t v3 = a2 - (void)a1;
  do
  {
    unsigned int v4 = *a1;
    uint64_t v5 = 0xFFFFFFFFLL;
    if (v4 > 0xDF)
    {
      switch(*a1)
      {
        case 0xF8:
          uint64_t v2 = (v2 + 5);
          break;
        case 0xF9:
        case 0xFA:
        case 0xFB:
        case 0xFD:
          return v5;
        case 0xFC:
          uint64_t v2 = (v2 + 6);
          break;
        case 0xFE:
          uint64_t v2 = (v2 + 7);
          break;
        case 0xFF:
          uint64_t v2 = (v2 + 8);
          break;
        default:
          if (v4 == 224)
          {
            uint64_t v2 = (v2 + 3);
          }
          else
          {
            if (v4 != 240) {
              return v5;
            }
            uint64_t v2 = (v2 + 4);
          }
          break;
      }
    }
    else if (*a1)
    {
      if (v4 == 128)
      {
        uint64_t v2 = (v2 + 1);
      }
      else
      {
        if (v4 != 192) {
          return v5;
        }
        uint64_t v2 = (v2 + 2);
      }
    }
    ++a1;
    uint64_t v5 = v2;
    --v3;
  }
  while (v3);
  return v5;
}

uint64_t rtmsg_type(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 3);
}

uint64_t rtmsg_len(unsigned __int16 *a1)
{
  return *a1;
}

unsigned __int16 *get_interface_entry(int a1)
{
  uint64_t v1 = &ifilist;
  while (1)
  {
    uint64_t v1 = (_UNKNOWN **)*v1;
    if (!v1) {
      break;
    }
    uint64_t v2 = (unsigned __int16 *)v1[2];
    if (v2[6] == a1) {
      return v2;
    }
  }
  return 0;
}

uint64_t init_iflist()
{
  for (uint64_t i = (uint64_t *)ifilist; ifilist; uint64_t i = (uint64_t *)ifilist)
  {
    uint64_t v1 = *i;
    uint64_t v2 = (void *)i[1];
    if (*i)
    {
      *(void *)(v1 + 8) = v2;
      uint64_t v2 = (void *)i[1];
    }
    else
    {
      off_100010010 = (_UNKNOWN **)i[1];
    }
    void *v2 = v1;
    free(i);
  }
  if (ifblock)
  {
    free((void *)ifblock);
    ifblock_size_t size = 0;
  }
  *(_OWORD *)long long v11 = xmmword_10000BE80;
  uint64_t v12 = 3;
  if (sysctl(v11, 6u, 0, (size_t *)&ifblock_size, 0, 0) < 0
    || (unint64_t v3 = malloc_type_malloc(ifblock_size, 0x4FE208D4uLL), (ifblock = (uint64_t)v3) == 0)
    || (uint64_t result = sysctl(v11, 6u, v3, (size_t *)&ifblock_size, 0, 0), (result & 0x80000000) != 0))
  {
LABEL_30:
    rtadvdLog();
    exit(1);
  }
  if (ifblock_size >= 1)
  {
    unint64_t v5 = ifblock + ifblock_size;
    uint64_t v6 = (unsigned __int16 *)ifblock;
LABEL_13:
    while (*v6)
    {
      if (*((unsigned char *)v6 + 3) != 14) {
        goto LABEL_30;
      }
      unsigned int v7 = &ifilist;
      while (1)
      {
        unsigned int v7 = (_UNKNOWN **)*v7;
        if (!v7) {
          break;
        }
        if (*((unsigned __int16 *)v7[2] + 6) == v6[6])
        {
          rtadvdLog();
          goto LABEL_13;
        }
      }
      uint64_t result = (uint64_t)malloc_type_malloc(0x18uLL, 0xA0040A8488062uLL);
      if (!result)
      {
        long long v10 = __error();
        strerror(*v10);
        goto LABEL_30;
      }
      unint64_t v8 = (uint64_t *)off_100010010;
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = v8;
      *(void *)(result + 16) = v6;
      *unint64_t v8 = result;
      off_100010010 = (_UNKNOWN **)result;
      uint64_t v9 = *v6;
      do
      {
        uint64_t v6 = (unsigned __int16 *)((char *)v6 + v9);
        if ((unint64_t)v6 >= v5) {
          break;
        }
        uint64_t v9 = *v6;
        if (!*v6) {
          return rtadvdLog();
        }
      }
      while (*((unsigned char *)v6 + 3) == 12);
      if ((unint64_t)v6 >= v5) {
        return result;
      }
    }
    return rtadvdLog();
  }
  return result;
}

_DWORD *rr_input(unsigned int a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, void *a5)
{
  v54 = a5;
  unint64_t v8 = (const void *)(a4 + 8);
  uint64_t v9 = inet_ntop(30, (const void *)(a4 + 8), v57, 0x2Eu);
  unint64_t v49 = inet_ntop(30, &v54, v58, 0x2Eu);
  int v50 = if_indextoname(*((_DWORD *)a3 + 4), v56);
  uint64_t v48 = (char *)v9;
  uint64_t result = (_DWORD *)rtadvdLog();
  if (a1 <= 0xF)
  {
    inet_ntop(30, v8, v57, 0x2Eu);
    inet_ntop(30, &v54, v58, 0x2Eu);
    if_indextoname(*((_DWORD *)a3 + 4), v56);
    return (_DWORD *)rtadvdLog();
  }
  if (*a3 == 255
    && ((void)in6a_site_allrouters != *(void *)a3 || *((void *)&in6a_site_allrouters + 1) != *((void *)a3 + 1)))
  {
    inet_ntop(30, &v54, v57, 0x2Eu);
    inet_ntop(30, v8, v58, 0x2Eu);
    if_indextoname(*((_DWORD *)a3 + 4), v56);
    return (_DWORD *)rtadvdLog();
  }
  int v11 = *(unsigned __int8 *)(a2 + 1);
  if (v11 == 255 || v11 == 1) {
    return result;
  }
  if (*(unsigned char *)(a2 + 1)) {
    return (_DWORD *)rtadvdLog();
  }
  if (a1 <= 0x27) {
    goto LABEL_105;
  }
  if (*(unsigned __int8 *)v54 == 255)
  {
    char v15 = *((unsigned char *)v54 + 1);
    int v16 = v15 & 0xF;
    BOOL v17 = (v15 & 0xF0) != 0x30 && v16 == 2;
    BOOL v18 = v17;
    if (v16 != 5 && !v18)
    {
      inet_ntop(30, v54, (char *)&v59, 0x2Eu);
      goto LABEL_105;
    }
  }
  unint64_t v13 = *(unsigned int *)(a2 + 4);
  if (rro > v13)
  {
    inet_ntop(30, v8, (char *)&v59, 0x2Eu);
LABEL_105:
    rtadvdLog();
    return (_DWORD *)rtadvdLog();
  }
  if (rro != v13)
  {
    xmmword_1000100E0 = 0u;
    unk_1000100F0 = 0u;
    xmmword_1000100C0 = 0u;
    *(_OWORD *)algn_1000100D0 = 0u;
LABEL_35:
    rro = v13;
    goto LABEL_36;
  }
  int v14 = *(char *)(a2 + 9);
  if (v14 < 0
    || (*(uint64_t *)((char *)&rro + (((unint64_t)*(unsigned __int8 *)(a2 + 8) >> 2) & 0x38) + 8) & (1 << *(unsigned char *)(a2 + 8))) == 0)
  {
    goto LABEL_35;
  }
  if ((v14 & 0x40) != 0)
  {
    uint64_t v48 = (char *)*(unsigned __int8 *)(a2 + 8);
    unint64_t v49 = inet_ntop(30, v8, (char *)&v59, 0x2Eu);
    uint64_t result = (_DWORD *)rtadvdLog();
  }
LABEL_36:
  if ((*(unsigned char *)(a2 + 9) & 0xC0) != 0x80)
  {
    unint64_t v19 = a2 + (int)a1;
    uint64_t v20 = (unsigned __int8 *)(a2 + 16);
    uint64_t result = (_DWORD *)init_iflist();
    if (a2 + 16 >= v19)
    {
LABEL_104:
      *(uint64_t *)((char *)&rro + (((unint64_t)*(unsigned __int8 *)(a2 + 8) >> 2) & 0x38) + 8) |= 1 << *(unsigned char *)(a2 + 8);
      return result;
    }
    unsigned int v21 = a1 - 16;
    int v22 = v62;
    while (1)
    {
      if (v21 < 0x18) {
        goto LABEL_105;
      }
      unsigned int v23 = v20[1];
      uint64_t v24 = 8 * v20[1];
      unsigned int v25 = v21 - 8 * v23;
      if ((int)v21 < (int)(8 * v23)) {
        goto LABEL_105;
      }
      if (v23 < 3 || (((_BYTE)v23 + 1) & 3) != 0)
      {
        uint64_t v48 = (char *)v20[1];
LABEL_46:
        rtadvdLog();
        goto LABEL_47;
      }
      if (*v20 - 1 >= 3)
      {
        uint64_t v48 = (char *)*v20;
        goto LABEL_46;
      }
      unsigned int v27 = v20[3];
      if (v27 >= 0x81)
      {
        uint64_t v48 = (char *)v20[3];
        goto LABEL_46;
      }
      __darwin_time_t v28 = &v20[v24];
      v29 = v20 + 24;
      if (v20 + 24 < &v20[v24])
      {
        while (1)
        {
          int v30 = *v29;
          int v31 = v29[1];
          if ((v31 + v30) >= 0x81) {
            break;
          }
          v29 += 32;
          if (v29 >= v28) {
            goto LABEL_57;
          }
        }
        unint64_t v49 = (const char *)v29[1];
        int v50 = (char *)(v31 + v30);
        uint64_t v48 = (char *)*v29;
        rtadvdLog();
        goto LABEL_47;
      }
LABEL_57:
      v53 = v20 + 24;
      if (s == -1)
      {
        s = socket(30, 2, 0);
        if (s < 0)
        {
          uint64_t v47 = __error();
          strerror(*v47);
          rtadvdLog();
          exit(1);
        }
        LOBYTE(v27) = v20[3];
      }
      v51 = v22;
      unint64_t v52 = v19;
      long long v61 = 0u;
      memset(v62, 0, sizeof(v62));
      long long v59 = 0u;
      long long v60 = 0u;
      LOBYTE(v60) = 1;
      BYTE1(v60) = v27;
      WORD1(v60) = *((_WORD *)v20 + 2);
      WORD4(v61) = 7708;
      *int v22 = *(_OWORD *)(v20 + 8);
      if (if_indextoname(1u, (char *)&v59)) {
        break;
      }
LABEL_99:
      uint64_t result = __error();
      if (*result == 6 || (uint64_t result = __error(), !*result))
      {
        int v22 = v51;
        unint64_t v19 = v52;
        goto LABEL_48;
      }
      timeval v46 = __error();
      uint64_t v48 = strerror(*v46);
      rtadvdLog();
      int v22 = v51;
      unint64_t v19 = v52;
LABEL_47:
      uint64_t result = (_DWORD *)rtadvdLog();
      uint64_t v24 = v24;
LABEL_48:
      v20 += v24;
      unsigned int v21 = v25;
      if ((unint64_t)v20 >= v19) {
        goto LABEL_104;
      }
    }
    int v32 = 1;
    while (1)
    {
      interface_entry = get_interface_entry(v32);
      if (!interface_entry) {
        goto LABEL_92;
      }
      if (*(unsigned char *)(a2 + 9) & 0x20) != 0 || (interface_entry[4])
      {
        char v34 = v20 + 24;
        if (v53 != v28)
        {
          if (v53 < v28)
          {
            do
            {
              WORD2(v60) = *(_WORD *)v34;
              BYTE6(v60) = BYTE6(v60) & 0xFC | (v34[2] >> 7) | (v34[2] >> 5) & 2;
              *((int8x8_t *)&v60 + 1) = vrev32_s8(*(int8x8_t *)(v34 + 4));
              LOBYTE(v61) = v61 & 0xFC | (v34[3] >> 7) | (v34[3] >> 5) & 2;
              BYTE4(v61) = BYTE4(v61) & 0xFC | ((*((_DWORD *)v34 + 3) & 0x80) != 0) | (*((_DWORD *)v34 + 3) >> 5) & 2;
              WORD2(v62[1]) = 7708;
              *(_OWORD *)((char *)&v62[1] + 12) = *((_OWORD *)v34 + 1);
              if (ioctl(s, rrcmd2pco[*v20], &v59) < 0 && *__error() != 49)
              {
                int v35 = __error();
                uint64_t v48 = strerror(*v35);
                rtadvdLog();
              }
              if (*v20 == 2
                && *((void *)v20 + 1) == *((void *)v34 + 2)
                && *((void *)v20 + 2) == *((void *)v34 + 3))
              {
                int v37 = v20[3];
                if (v37 == *v34 && v37 == v34[1])
                {
                  timeval v38 = if_indextorainfo(v32);
                  if (v38)
                  {
                    uint64_t v40 = v38 + 16;
                    for (uint64_t i = v38[16]; (uint64_t *)i != v40; uint64_t i = *(void *)i)
                    {
                      v55.__darwin_time_t tv_sec = 0;
                      *(void *)&v55.tv_usec = 0;
                      if (prefix_match((unsigned __int8 *)(i + 80), *(_DWORD *)(i + 72), v20 + 8, v20[3]))
                      {
                        *(_DWORD *)(i + 32) = bswap32(*((_DWORD *)v34 + 1));
                        *(_DWORD *)(i + 48) = bswap32(*((_DWORD *)v34 + 2));
                        char v41 = BYTE4(v61);
                        if (BYTE4(v61))
                        {
                          gettimeofday(&v55, 0);
                          __darwin_time_t v42 = v55.tv_sec + *(unsigned int *)(i + 32);
                          char v41 = BYTE4(v61);
                        }
                        else
                        {
                          __darwin_time_t v42 = 0;
                        }
                        *(void *)(i + 40) = v42;
                        if ((v41 & 2) != 0)
                        {
                          gettimeofday(&v55, 0);
                          __darwin_time_t v43 = v55.tv_sec + *(unsigned int *)(i + 48);
                        }
                        else
                        {
                          __darwin_time_t v43 = 0;
                        }
                        *(void *)(i + 56) = v43;
                      }
                    }
                  }
                }
              }
              v34 += 32;
            }
            while (v34 < v28);
          }
          goto LABEL_93;
        }
        uint64_t v44 = *v20;
        if (v44 != 1)
        {
          WORD2(v60) = 0;
          BYTE6(v60) &= 0xFCu;
          WORD2(v62[1]) = 0;
          *((void *)&v60 + 1) = 0;
          *(void *)&long long v61 = 0;
          *(in6_addr *)((char *)&v62[1] + 12) = in6addr_any;
          if (ioctl(s, rrcmd2pco[v44], &v59, v48, v49, v50) < 0 && *__error() != 49) {
            break;
          }
        }
      }
LABEL_93:
      if (!if_indextoname(++v32, (char *)&v59)) {
        goto LABEL_99;
      }
    }
    int v45 = __error();
    uint64_t v48 = strerror(*v45);
LABEL_92:
    rtadvdLog();
    goto LABEL_93;
  }
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  int v5 = 0;
  do
  {
    while (1)
    {
      while (1)
      {
        while (1)
        {
          while (1)
          {
            int v6 = getopt(argc, (char *const *)argv, "c:dDF:fMp:Rs");
            if (v6 <= 98) {
              break;
            }
            if (v6 <= 101)
            {
              if (v6 == 99)
              {
                conffile = (uint64_t)optarg;
              }
              else if (v6 == 100)
              {
                dflag = 1;
              }
            }
            else
            {
              switch(v6)
              {
                case 'f':
                  int v5 = 1;
                  break;
                case 'p':
                  pidfilename = optarg;
                  break;
                case 's':
                  sflag = 1;
                  break;
              }
            }
          }
          if (v6 <= 76) {
            break;
          }
          if (v6 == 77)
          {
            mcastif = (uint64_t)optarg;
          }
          else if (v6 == 82)
          {
            fwrite("rtadvd: the -R option is currently ignored.\n", 0x2CuLL, 1uLL, __stderrp);
          }
        }
        if (v6 != 68) {
          break;
        }
        dflag = 2;
      }
      if (v6 != 70) {
        break;
      }
      dumpfilename = optarg;
    }
  }
  while (v6 != -1);
  int v7 = optind;
  if (argc == optind)
  {
    unint64_t v8 = __stderrp;
    uint64_t v9 = "usage: rtadvd [-dDfMRs] [-c conffile] [-F dumpfile] [-p pidfile] interfaces...\n";
    size_t v10 = 79;
LABEL_34:
    fwrite(v9, v10, 1uLL, v8);
    goto LABEL_35;
  }
  int v11 = (unsigned __int8 **)&argv[optind];
  rtadvd_timer_init();
  unsigned int v12 = time(0);
  srandom(v12);
  init_iflist();
  int v13 = v7 - argc;
  do
  {
    int v14 = *v11++;
    getconfig(v14);
  }
  while (!__CFADD__(v13++, 1));
  if (inet_pton(30, "ff02::1", &unk_100010028) != 1)
  {
    unint64_t v8 = __stderrp;
    uint64_t v9 = "fatal: inet_pton failed\n";
    size_t v10 = 24;
    goto LABEL_34;
  }
  pfh = pidfile_open();
  if (!pfh)
  {
    if (*__error() == 17)
    {
      int v16 = getprogname();
      errx(1, "%s already running, pid: %d", v16, 0);
    }
    v99 = "main";
    rtadvdLog();
  }
  if (!v5) {
    daemon(1, 0);
  }
  uint64_t v17 = ralist;
  rcvcmsgbuf = (uint64_t)malloc_type_malloc(0x30uLL, 0xA4631015uLL);
  if (!rcvcmsgbuf || (sndcmsgbuf = (uint64_t)malloc_type_malloc(0x30uLL, 0xC3901A40uLL)) == 0)
  {
LABEL_64:
    rtadvdLog();
LABEL_35:
    exit(1);
  }
  *(_OWORD *)unint64_t v105 = 0u;
  *(_OWORD *)__s1 = 0u;
  long long v112 = 0uLL;
  unsigned int v113 = 0;
  int v18 = socket(30, 3, 58);
  socuint64_t k = v18;
  if (v18 < 0)
  {
    unint64_t v19 = __error();
    strerror(*v19);
    goto LABEL_64;
  }
  setsockopt(v18, 0xFFFF, 4230, &so_traffic_class, 4u);
  *(_DWORD *)uint64_t v111 = 1;
  if (setsockopt(sock, 41, 61, v111, 4u) < 0
    || (*(_DWORD *)uint64_t v111 = 1, setsockopt(sock, 41, 37, v111, 4u) < 0)
    || (*(_DWORD *)uint64_t v111 = 1, setsockopt(sock, 41, 62, v111, 4u) < 0))
  {
    uint64_t v20 = __error();
    strerror(*v20);
    goto LABEL_64;
  }
  *(_OWORD *)unint64_t v105 = 0u;
  *(_OWORD *)__s1 = 0u;
  if (accept_rr) {
    int v21 = 1120;
  }
  else {
    int v21 = 96;
  }
  LODWORD(__s1[0]) = v21;
  if (setsockopt(sock, 58, 18, v105, 0x20u) < 0)
  {
LABEL_60:
    uint64_t v24 = __error();
    strerror(*v24);
    goto LABEL_64;
  }
  if (inet_pton(30, "ff02::2", &v112) != 1) {
    goto LABEL_64;
  }
  for (; v17; uint64_t v17 = *(void *)v17)
  {
    unsigned int v113 = *(_DWORD *)(v17 + 44);
    if (setsockopt(sock, 41, 12, &v112, 0x14u) < 0) {
      goto LABEL_60;
    }
  }
  if (accept_rr)
  {
    if (inet_pton(30, "ff05::2", &in6a_site_allrouters) != 1) {
      goto LABEL_64;
    }
    long long v112 = in6a_site_allrouters;
    if (mcastif)
    {
      unsigned int v113 = if_nametoindex((const char *)mcastif);
      if (!v113) {
        goto LABEL_64;
      }
    }
    else
    {
      unsigned int v113 = *(_DWORD *)(ralist + 44);
    }
    if (setsockopt(sock, 41, 12, &v112, 0x14u) < 0) {
      goto LABEL_60;
    }
  }
  rcviov = (uint64_t)&sock_open_answer;
  unk_1000107F0 = 1500;
  rcvmhdr = (uint64_t)&rcvfrom;
  dword_100010810 = 28;
  qword_100010818 = (uint64_t)&rcviov;
  dword_100010820 = 1;
  qword_100010828 = rcvcmsgbuf;
  dword_100010860 = 28;
  dword_100010830 = 48;
  qword_100010868 = (uint64_t)&sndiov;
  dword_100010870 = 1;
  qword_100010878 = sndcmsgbuf;
  dword_100010880 = 48;
  getpid();
  pidfile_write();
  int v22 = sock;
  if (sflag)
  {
    rtsocuint64_t k = -1;
  }
  else
  {
    int v23 = socket(17, 3, 0);
    rtsocuint64_t k = v23;
    if (v23 < 0) {
      goto LABEL_60;
    }
    if (v23 > sock) {
      int v22 = v23;
    }
  }
  int v25 = v22 + 1;
  unint64_t v26 = (unint64_t)(v22 + 1) >> 5;
  if (((v22 + 1) & 0x1FLL) != 0) {
    LODWORD(v26) = v26 + 1;
  }
  size_t v27 = 4 * (int)v26;
  __darwin_time_t v28 = (char *)malloc_type_malloc(v27, 0x971F7184uLL);
  if (!v28 || (v29 = v28, int v101 = v25, (__dst = (fd_set *)malloc_type_malloc(v27, 0x529A6B8DuLL)) == 0)) {
    err(1, "malloc", v99);
  }
  size_t v102 = v27;
  bzero(v29, v27);
  int v30 = sock;
  if (__darwin_check_fd_set_overflow(sock, v29, 0)) {
    *(_DWORD *)&v29[((unint64_t)v30 >> 3) & 0x1FFFFFFFFFFFFFFCLL] |= 1 << v30;
  }
  unint64_t v31 = rtsock;
  if ((rtsock & 0x80000000) == 0 && __darwin_check_fd_set_overflow(rtsock, v29, 0)) {
    *(_DWORD *)&v29[(v31 >> 3) & 0x1FFFFFFC] |= 1 << v31;
  }
  signal(15, (void (__cdecl *)(int))set_die);
  signal(30, (void (__cdecl *)(int))rtadvd_set_dump_file);
  int v32 = &getconfig_forwarding;
  uint64_t v33 = &getconfig_forwarding;
  int v34 = v25;
  size_t v35 = v102;
  unint64_t v103 = v29;
LABEL_83:
  while (2)
  {
    uint64_t v36 = __dst;
    do
    {
      do
      {
        while (1)
        {
          memcpy(v36, v29, v35);
          if (do_dump)
          {
            do_dump = 0;
            rtadvd_dump_file(dumpfilename);
          }
          if (do_die)
          {
            if (dflag >= 2) {
              rtadvdLog();
            }
            uint64_t v96 = ralist;
            if (ralist)
            {
              do
              {
                *(_WORD *)(v96 + 84) = 0;
                make_packet(v96);
                uint64_t v96 = *(void *)v96;
              }
              while (v96);
              v97 = (void *)ralist;
              if (ralist)
              {
                do
                {
                  ra_output((uint64_t)v97);
                  v97 = (void *)*v97;
                }
                while (v97);
              }
            }
            pidfile_remove();
            exit(0);
          }
          int v37 = (timeval *)rtadvd_check_timer();
          rtadvdLog();
          int v38 = select(v34, v36, 0, 0, v37);
          if ((v38 & 0x80000000) == 0) {
            break;
          }
          if (*__error() != 4)
          {
            uint64_t v62 = __error();
            strerror(*v62);
            rtadvdLog();
          }
        }
      }
      while (!v38);
      unint64_t v39 = v33[15];
      if (v39 != -1
        && __darwin_check_fd_set_overflow(v33[15], v36, 0)
        && ((*(unsigned int *)((char *)v36->fds_bits + ((v39 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v39) & 1) != 0)
      {
        *(void *)v110.__u6_addr8 = 0;
        ssize_t v40 = read(v33[15], v105, 0x800uLL);
        if (dflag >= 2)
        {
          rtmsg_type((uint64_t)v105);
          rtadvdLog();
        }
        if ((int)rtmsg_len((unsigned __int16 *)v105) < (int)v40 && dflag >= 2)
        {
          rtmsg_len((unsigned __int16 *)v105);
          rtadvdLog();
        }
        if (v40 << 32 < 1) {
          goto LABEL_155;
        }
        int v100 = 0;
        unsigned int v41 = 0;
        __darwin_time_t v42 = (unsigned __int16 *)v105;
        __darwin_time_t v43 = &v105[(int)v40];
        while (1)
        {
          next_msg = get_next_msg(v42, (unint64_t)v43, 0, &v110, 0x7006u);
          if (!*(void *)v110.__u6_addr8) {
            goto LABEL_155;
          }
          uint64_t v45 = (uint64_t)next_msg;
          int v46 = rtmsg_type((uint64_t)next_msg);
          int v47 = v46;
          if ((v46 - 1) < 2)
          {
            unsigned int rtm_ifindex = get_rtm_ifindex(v45);
          }
          else
          {
            if ((v46 - 12) >= 2 && v46 != 14)
            {
              if (dflag < 2) {
                goto LABEL_132;
              }
              if_indextoname(v41, v111);
              goto LABEL_117;
            }
            unsigned int rtm_ifindex = get_ifm_ifindex(v45);
          }
          unsigned int v41 = rtm_ifindex;
          unint64_t v49 = &ralist;
          do
          {
            unint64_t v49 = (uint64_t *)*v49;
            if (!v49)
            {
              if (dflag < 2) {
                goto LABEL_132;
              }
              if_indextoname(rtm_ifindex, v111);
LABEL_117:
              rtadvdLog();
              goto LABEL_132;
            }
          }
          while (*((_DWORD *)v49 + 11) != rtm_ifindex);
          interface_entry = get_interface_entry(rtm_ifindex);
          if (!interface_entry) {
            goto LABEL_117;
          }
          v51 = interface_entry;
          int v52 = *((_DWORD *)interface_entry + 2);
          if (v47 <= 11)
          {
            if (v47 == 1)
            {
              *((_DWORD *)interface_entry + 2) = if_getflags(v41, v52);
              if (sflag) {
                goto LABEL_126;
              }
              addr = (unsigned __int8 *)get_addr((uint64_t)v105);
              int prefixlen = get_prefixlen((uint64_t)v105);
              char v59 = prefixlen;
              if ((prefixlen - 128) <= 0xFFFFFF83) {
                goto LABEL_138;
              }
              prefix = find_prefix((uint64_t)v49, addr, prefixlen);
              if (!prefix)
              {
                make_prefix((uint64_t)v49, v41, addr, v59);
                goto LABEL_148;
              }
              if (prefix[3])
              {
                update_prefix((uint64_t)prefix);
                goto LABEL_148;
              }
              if (dflag < 2) {
                goto LABEL_126;
              }
            }
            else
            {
              if (v47 != 2)
              {
LABEL_153:
                v29 = v103;
                if (dflag >= 2)
                {
                  if_indextoname(v41, v111);
                  rtadvdLog();
                }
                goto LABEL_155;
              }
              *((_DWORD *)interface_entry + 2) = if_getflags(v41, v52);
              if (sflag) {
                goto LABEL_126;
              }
              addr = (unsigned __int8 *)get_addr((uint64_t)v105);
              int v55 = get_prefixlen((uint64_t)v105);
              if ((v55 - 128) <= 0xFFFFFF83)
              {
LABEL_138:
                rtadvdLog();
                goto LABEL_126;
              }
              long long v60 = find_prefix((uint64_t)v49, addr, v55);
              if (v60)
              {
                invalidate_prefix((uint64_t)v60);
LABEL_148:
                int v100 = 1;
                goto LABEL_126;
              }
              if (dflag < 2) {
                goto LABEL_126;
              }
            }
            inet_ntop(30, addr, (char *)&v112, 0x2Eu);
            goto LABEL_138;
          }
          if ((v47 - 12) < 2)
          {
            int ifm_flags = if_getflags(v41, v52);
            goto LABEL_125;
          }
          if (v47 != 14) {
            goto LABEL_153;
          }
          int ifm_flags = get_ifm_flags(v45);
LABEL_125:
          *((_DWORD *)v51 + 2) = ifm_flags;
LABEL_126:
          int v56 = *((_DWORD *)v51 + 2);
          if (v52)
          {
            if ((v56 & 1) == 0)
            {
              rtadvdLog();
              rtadvd_remove_timer((void **)v49 + 1);
              goto LABEL_131;
            }
            v29 = v103;
            if (v100)
            {
              *((_DWORD *)v49 + 4) = 0;
              set_short_delay((uint64_t)v49);
            }
            else
            {
              int v100 = 0;
            }
          }
          else
          {
            if (v56)
            {
              rtadvdLog();
              *((_DWORD *)v49 + 4) = 0;
              *((_DWORD *)v49 + 10) = 0;
              v57 = rtadvd_add_timer((uint64_t)ra_timeout, (uint64_t)ra_timer_update, (uint64_t)v49, (uint64_t)v49);
              v49[1] = (uint64_t)v57;
              ra_timer_update(v49, (uint64_t)(v57 + 24));
              rtadvd_set_timer(v49[1] + 24, v49[1]);
            }
LABEL_131:
            v29 = v103;
          }
LABEL_132:
          __darwin_time_t v42 = (unsigned __int16 *)(v45 + *(void *)v110.__u6_addr8);
          if (v45 + *(void *)v110.__u6_addr8 >= (unint64_t)v43)
          {
LABEL_155:
            int v32 = &getconfig_forwarding;
            uint64_t v33 = &getconfig_forwarding;
            int v34 = v101;
            size_t v35 = v102;
            uint64_t v36 = __dst;
            break;
          }
        }
      }
      int v63 = v32[546];
    }
    while (!__darwin_check_fd_set_overflow(v63, v36, 0)
         || ((*(unsigned int *)((char *)v36->fds_bits + (((unint64_t)v63 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v63) & 1) == 0);
    in6_addr v110 = in6addr_any;
    dword_100010830 = 48;
    unsigned int v64 = recvmsg(v32[546], (msghdr *)&rcvmhdr, 0);
    if ((v64 & 0x80000000) != 0) {
      continue;
    }
    break;
  }
  if (dword_100010830 < 0xC) {
    goto LABEL_176;
  }
  unint64_t v65 = (unsigned int *)qword_100010828;
  if (!qword_100010828) {
    goto LABEL_176;
  }
  uint64_t v66 = 0;
  unsigned int v67 = 0;
  unint64_t v68 = 0;
  while (1)
  {
    if (v65[1] == 41)
    {
      unsigned int v69 = v65[2];
      if (v69 != 46) {
        goto LABEL_167;
      }
      if (*v65 == 32)
      {
        uint64_t v66 = v65 + 3;
        unsigned int v67 = v65[7];
        in6_addr v110 = *(in6_addr *)(v65 + 3);
        if (v65[1] == 41) {
          break;
        }
      }
    }
LABEL_170:
    unint64_t v65 = (unsigned int *)((char *)v65 + ((*v65 + 3) & 0x1FFFFFFFCLL));
    if ((unint64_t)(v65 + 3) > qword_100010828 + (unint64_t)dword_100010830)
    {
      if (!v67 || !v68) {
        goto LABEL_176;
      }
      int v70 = get_interface_entry(v66[4]);
      if (!v70) {
        goto LABEL_178;
      }
      if ((v70[4] & 1) == 0)
      {
        if_indextoname(v66[4], (char *)&v112);
LABEL_178:
        size_t v35 = v102;
LABEL_179:
        rtadvdLog();
        goto LABEL_180;
      }
      if (v64 <= 7uLL) {
        goto LABEL_176;
      }
      uint64_t v71 = *(void *)qword_100010818;
      int v72 = **(unsigned __int8 **)qword_100010818;
      if (v72 != 138)
      {
        if (v72 == 134)
        {
          if (*v68 == 255 && !*(unsigned char *)(v71 + 1) && v64 > 0xFuLL)
          {
            inet_ntop(30, &dword_1000107D0, (char *)&v112, 0x2Eu);
            if_indextoname(v66[4], v111);
            rtadvdLog();
            uint64_t v109 = 0;
            long long v107 = 0u;
            *(_OWORD *)char v108 = 0u;
            *(_OWORD *)unint64_t v105 = 0u;
            *(_OWORD *)__s1 = 0u;
            if (nd6_options((unsigned __int8 *)(v71 + 16), v64 - 16, (uint64_t)v105, 21))
            {
              inet_ntop(30, &dword_1000107D0, (char *)&v112, 0x2Eu);
              if_indextoname(v66[4], v111);
              rtadvdLog();
              size_t v35 = v102;
            }
            else
            {
              v78 = &ralist;
              size_t v35 = v102;
              do
              {
                v78 = (uint64_t *)*v78;
                if (!v78)
                {
                  inet_ntop(30, &dword_1000107D0, (char *)&v112, 0x2Eu);
                  if_indextoname(v66[4], v111);
                  rtadvdLog();
                  v84 = v108[0];
                  goto LABEL_261;
                }
              }
              while (*((_DWORD *)v78 + 11) != v66[4]);
              ++v78[57];
              int v79 = *(unsigned __int8 *)(v71 + 4);
              if (*(unsigned char *)(v71 + 4))
              {
                int v80 = *((_DWORD *)v78 + 30);
                if (v80) {
                  BOOL v81 = v80 == v79;
                }
                else {
                  BOOL v81 = 1;
                }
                if (v81)
                {
                  int v79 = 0;
                }
                else
                {
                  inet_ntop(30, &dword_1000107D0, (char *)&v112, 0x2Eu);
                  int v79 = 1;
                  rtadvdLog();
                }
              }
              char v85 = *(unsigned char *)(v71 + 5);
              if (*((_DWORD *)v78 + 24) != (v85 & 0x80))
              {
                inet_ntop(30, &dword_1000107D0, (char *)&v112, 0x2Eu);
                rtadvdLog();
                ++v79;
                char v85 = *(unsigned char *)(v71 + 5);
              }
              if (*((_DWORD *)v78 + 25) != (v85 & 0x40))
              {
                inet_ntop(30, &dword_1000107D0, (char *)&v112, 0x2Eu);
                rtadvdLog();
                ++v79;
              }
              v29 = v103;
              unsigned int v86 = *(_DWORD *)(v71 + 8);
              if (v86)
              {
                unsigned int v87 = bswap32(v86);
                int v88 = *((_DWORD *)v78 + 28);
                if (v88 && v87 != v88)
                {
                  inet_ntop(30, &dword_1000107D0, (char *)&v112, 0x2Eu);
                  v29 = v103;
                  rtadvdLog();
                  ++v79;
                }
              }
              unsigned int v90 = *(_DWORD *)(v71 + 12);
              if (v90)
              {
                int v91 = *((_DWORD *)v78 + 29);
                if (v91)
                {
                  if (bswap32(v90) != v91)
                  {
                    inet_ntop(30, &dword_1000107D0, (char *)&v112, 0x2Eu);
                    rtadvdLog();
                    ++v79;
                  }
                }
              }
              if (*((void *)&v107 + 1))
              {
                unsigned int v92 = *(_DWORD *)(*((void *)&v107 + 1) + 4);
                if (v92)
                {
                  int v93 = *((_DWORD *)v78 + 27);
                  if (v93)
                  {
                    if (bswap32(v92) != v93)
                    {
                      inet_ntop(30, &dword_1000107D0, (char *)&v112, 0x2Eu);
                      rtadvdLog();
                      ++v79;
                    }
                  }
                }
              }
              v84 = v108[0];
              if (__s1[1] && prefix_check((char *)__s1[1], (uint64_t)v78)) {
                ++v79;
              }
              if (v84)
              {
                size_t v94 = v84;
                do
                {
                  if (prefix_check((char *)v94[1], (uint64_t)v78)) {
                    ++v79;
                  }
                  size_t v94 = (void *)*v94;
                }
                while (v94);
              }
              if (v79) {
                ++v78[58];
              }
              size_t v35 = v102;
LABEL_261:
              if (v84)
              {
                do
                {
                  v95 = (void *)*v84;
                  free(v84);
                  v84 = v95;
                }
                while (v95);
              }
            }
            goto LABEL_180;
          }
LABEL_200:
          inet_ntop(30, &dword_1000107D0, v105, 0x2Eu);
          if_indextoname(v66[4], (char *)&v112);
        }
        else if (v72 == 133)
        {
          if (*v68 != 255 || *(unsigned char *)(v71 + 1)) {
            goto LABEL_200;
          }
          inet_ntop(30, &dword_1000107D0, (char *)&v112, 0x2Eu);
          if_indextoname(v66[4], v111);
          rtadvdLog();
          uint64_t v109 = 0;
          long long v107 = 0u;
          *(_OWORD *)char v108 = 0u;
          *(_OWORD *)unint64_t v105 = 0u;
          *(_OWORD *)__s1 = 0u;
          if (nd6_options((unsigned __int8 *)(v71 + 8), v64 - 8, (uint64_t)v105, 1))
          {
            inet_ntop(30, &dword_1000107D0, (char *)&v112, 0x2Eu);
            if_indextoname(v66[4], v111);
            goto LABEL_176;
          }
          if (dword_1000107D0 || dword_1000107D4 || dword_1000107D8 || dword_1000107DC || !*(void *)&v105[8])
          {
            unsigned int v73 = v66[4];
            v74 = &ralist;
            int v34 = v101;
            size_t v35 = v102;
            do
            {
              v74 = (uint64_t *)*v74;
              if (!v74)
              {
                if_indextoname(v73, v111);
                rtadvdLog();
                goto LABEL_227;
              }
            }
            while (v73 != *((_DWORD *)v74 + 11));
            ++v74[59];
            v75 = (char *)malloc_type_malloc(0x28uLL, 0x10200406E8F4065uLL);
            if (v75)
            {
              long long v76 = *(_OWORD *)&dword_1000107D4;
              *(_OWORD *)(v75 + 8) = rcvfrom;
              *(_OWORD *)(v75 + 20) = v76;
              *((_DWORD *)v75 + 3) = 0;
              *(void *)v75 = v74[60];
              v74[60] = (uint64_t)v75;
            }
            int v77 = *((_DWORD *)v74 + 10);
            *((_DWORD *)v74 + 10) = v77 + 1;
            if (!v77) {
              set_short_delay((uint64_t)v74);
            }
          }
          else
          {
            if_indextoname(v66[4], v111);
            rtadvdLog();
            int v34 = v101;
            size_t v35 = v102;
          }
LABEL_227:
          int v82 = v108[0];
          if (v108[0])
          {
            do
            {
              int v83 = (void *)*v82;
              free(v82);
              int v82 = v83;
            }
            while (v83);
          }
          goto LABEL_83;
        }
LABEL_176:
        rtadvdLog();
        int v34 = v101;
        size_t v35 = v102;
        goto LABEL_83;
      }
      size_t v35 = v102;
      if (!accept_rr) {
        goto LABEL_179;
      }
      rr_input(v64, *(void *)qword_100010818, (unsigned __int8 *)v66, (uint64_t)&rcvfrom, &v110);
LABEL_180:
      int v34 = v101;
      goto LABEL_83;
    }
  }
  unsigned int v69 = v65[2];
LABEL_167:
  if (v69 == 47 && *v65 == 16) {
    unint64_t v68 = v65 + 3;
  }
  goto LABEL_170;
}

void set_die()
{
  do_die = 1;
}

void rtadvd_set_dump_file()
{
  do_dump = 1;
}

uint64_t *find_prefix(uint64_t a1, unsigned __int8 *__s1, int a3)
{
  unsigned int v4 = (uint64_t *)(a1 + 128);
  unint64_t v3 = *(uint64_t **)(a1 + 128);
  int v5 = a3 + 7;
  if (a3 >= 0) {
    int v5 = a3;
  }
  if (v3 == v4) {
    return 0;
  }
  size_t v8 = (uint64_t)v5 >> 3;
  int v9 = a3 - 8 * v8;
  int v10 = 255 << (8 - (a3 - 8 * v8));
  while (*((_DWORD *)v3 + 18) != a3
       || memcmp(__s1, v3 + 10, v8)
       || v9 && (v10 & (*((unsigned __int8 *)v3 + v8 + 80) ^ __s1[v8])) != 0)
  {
    unint64_t v3 = (uint64_t *)*v3;
    if (v3 == v4) {
      return 0;
    }
  }
  return v3;
}

BOOL prefix_match(unsigned __int8 *a1, int a2, unsigned __int8 *__s2, int a4)
{
  if (a2 < a4) {
    return 0;
  }
  if (a4 >= 0) {
    int v8 = a4;
  }
  else {
    int v8 = a4 + 7;
  }
  if (memcmp(a1, __s2, (uint64_t)v8 >> 3)) {
    return 0;
  }
  unsigned int v9 = a4 - (v8 & 0xFFFFFFF8);
  return !v9 || ((255 << (8 - v9)) & (__s2[(uint64_t)v8 >> 3] ^ a1[(uint64_t)v8 >> 3])) == 0;
}

uint64_t *if_indextorainfo(int a1)
{
  uint64_t result = &ralist;
  do
    uint64_t result = (uint64_t *)*result;
  while (result && *((_DWORD *)result + 11) != a1);
  return result;
}

uint64_t ra_timeout(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t ra_output(uint64_t a1)
{
  interface_entry = get_interface_entry(*(_DWORD *)(a1 + 44));
  if (!interface_entry || (interface_entry[4] & 1) == 0) {
    return rtadvdLog();
  }
  make_packet(a1);
  sndmhdr = (uint64_t)&sin6_allnodes;
  uint64_t v4 = qword_100010868;
  uint64_t v5 = *(void *)(a1 + 432);
  *(void *)qword_100010868 = *(void *)(a1 + 440);
  *(void *)(v4 + 8) = v5;
  if (dword_100010880 <= 0xB) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_100010878;
  }
  *(_DWORD *)(v6 + 8) = 46;
  *(void *)uint64_t v6 = 0x2900000020;
  *(void *)(v6 + 12) = 0;
  *(void *)(v6 + 20) = 0;
  *(_DWORD *)(v6 + 28) = *(_DWORD *)(a1 + 44);
  *(void *)(v6 + 32) = 0x2900000010;
  *(_DWORD *)(v6 + 40) = 47;
  *(_DWORD *)(v6 + 44) = 255;
  rtadvdLog();
  if ((sendmsg(sock, (const msghdr *)&sndmhdr, 0) & 0x80000000) != 0)
  {
    int v7 = __error();
    strerror(*v7);
    rtadvdLog();
  }
  int v8 = *(_DWORD *)(a1 + 16);
  if (v8 <= 2) {
    *(_DWORD *)(a1 + 16) = v8 + 1;
  }
  ++*(void *)(a1 + 448);
  unsigned int v9 = *(void **)(a1 + 480);
  if (v9)
  {
    do
    {
      int v10 = (void *)*v9;
      free(v9);
      unsigned int v9 = v10;
    }
    while (v10);
  }
  *(void *)(a1 + 480) = 0;
  uint64_t result = gettimeofday((timeval *)(a1 + 24), 0);
  *(_DWORD *)(a1 + 40) = 0;
  return result;
}

uint64_t ra_timer_update(_DWORD *a1, uint64_t a2)
{
  uint64_t v4 = a1[23];
  uint64_t v5 = random() % (a1[22] - a1[23]) + v4;
  int v6 = a1[4];
  if (v5 > 16 && v6 < 3) {
    uint64_t v5 = 16;
  }
  if (!v6) {
    uint64_t v5 = 0;
  }
  *(void *)a2 = v5;
  *(_DWORD *)(a2 + 8) = 0;
  return rtadvdLog();
}

double set_short_delay(uint64_t a1)
{
  if (*(void *)(a1 + 8))
  {
    v10.__darwin_time_t tv_sec = 0;
    *(void *)&v10.tv_usec = 0;
    uint64_t v9 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    int v2 = (int)random() % 500000;
    *(void *)&long long v11 = 0;
    *((void *)&v11 + 1) = v2;
    unint64_t v3 = rtadvd_timer_rest(*(void *)(a1 + 8));
    uint64_t v4 = v3;
    if (*v3 < 0 || !*v3 && *((_DWORD *)v3 + 2) < v2)
    {
      rtadvdLog();
      long long v11 = *(_OWORD *)v4;
    }
    gettimeofday(&v10, 0);
    TIMEVAL_SUB((uint64_t)&v10, a1 + 24, (uint64_t)&v6);
    uint64_t v8 = 3;
    LODWORD(v9) = 0;
    if (v6 < 3 || v6 == 3 && (v7 & 0x80000000) != 0)
    {
      TIMEVAL_SUB((uint64_t)&v8, (uint64_t)&v6, (uint64_t)&v8);
      TIMEVAL_ADD((uint64_t)&v8, (uint64_t)&v11, (uint64_t)&v11);
    }
    *(void *)&double result = rtadvd_set_timer((uint64_t)&v11, *(void *)(a1 + 8)).n128_u64[0];
  }
  return result;
}

uint64_t nd6_options(unsigned __int8 *a1, int a2, uint64_t a3, int a4)
{
  if (a2 < 1) {
    return 0;
  }
  int v6 = a2;
  unsigned int v8 = 0;
  while (v6 != 1)
  {
    a1 += v8;
    int v9 = a1[1];
    if (!a1[1] || v6 < (8 * v9)) {
      break;
    }
    uint64_t v10 = *a1;
    if (v10 < 6
      && (ndopt_flags[v10] & a4) != 0
      && (v9 == 1 || v10 != 5)
      && (v9 == 4 || v10 != 3))
    {
      switch(v10)
      {
        case 5:
          goto LABEL_19;
        case 3:
          if (*(void *)(a3 + 24))
          {
            unsigned int v12 = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
            if (!v12) {
              goto LABEL_27;
            }
            *unsigned int v12 = *(void *)(a3 + 48);
            v12[1] = a1;
            *(void *)(a3 + 48) = v12;
          }
          else
          {
            *(void *)(a3 + 24) = a1;
          }
          break;
        case 1:
LABEL_19:
          if (*(void *)(a3 + 8 * v10))
          {
            rtadvdLog();
            uint64_t v10 = *a1;
          }
          *(void *)(a3 + 8 * v10) = a1;
          break;
      }
    }
    else
    {
      rtadvdLog();
    }
    unsigned int v8 = 8 * v9;
    BOOL v11 = __OFSUB__(v6, 8 * v9);
    v6 -= 8 * v9;
    if ((v6 < 0) ^ v11 | (v6 == 0)) {
      return 0;
    }
  }
LABEL_27:
  rtadvdLog();
  int v13 = *(void **)(a3 + 48);
  if (v13)
  {
    do
    {
      int v14 = (void *)*v13;
      free(v13);
      int v13 = v14;
    }
    while (v14);
  }
  return 0xFFFFFFFFLL;
}

uint64_t prefix_check(char *__s1, uint64_t a2)
{
  uint64_t v4 = __s1 + 16;
  if (__s1[16] == 254 && (__s1[17] & 0xC0) == 0x80)
  {
    inet_ntop(30, v4, v15, 0x2Eu);
    inet_ntop(30, &dword_1000107D0, v16, 0x2Eu);
    rtadvdLog();
  }
  prefix = find_prefix(a2, (unsigned __int8 *)v4, __s1[2]);
  if (!prefix)
  {
    inet_ntop(30, v4, v15, 0x2Eu);
    inet_ntop(30, &dword_1000107D0, v16, 0x2Eu);
    rtadvdLog();
    return 0;
  }
  int v6 = prefix;
  v14.__darwin_time_t tv_sec = 0;
  *(void *)&v14.tv_usec = 0;
  unsigned int v7 = bswap32(*((_DWORD *)__s1 + 2));
  if (prefix[7])
  {
    gettimeofday(&v14, 0);
    uint64_t v8 = v7 + LODWORD(v14.tv_sec);
    if (!v6[3])
    {
      uint64_t v9 = *(void *)(a2 + 232);
      if (v9)
      {
        if (v8 - v6[7] > v9)
        {
          inet_ntop(30, v4, v15, 0x2Eu);
          inet_ntop(30, &dword_1000107D0, v16, 0x2Eu);
          uint64_t v10 = 1;
          rtadvdLog();
          goto LABEL_15;
        }
      }
    }
  }
  else if (!prefix[3] && v7 != *((_DWORD *)prefix + 12))
  {
    inet_ntop(30, v4, v15, 0x2Eu);
    inet_ntop(30, &dword_1000107D0, v16, 0x2Eu);
    rtadvdLog();
  }
  uint64_t v10 = 0;
LABEL_15:
  unsigned int v11 = bswap32(*((_DWORD *)__s1 + 1));
  if (v6[5])
  {
    gettimeofday(&v14, 0);
    if (!v6[3])
    {
      int64_t v12 = *(void *)(a2 + 232);
      if (v12)
      {
        if (v11 + LODWORD(v14.tv_sec) - v6[5] > v12)
        {
LABEL_22:
          inet_ntop(30, v4, v15, 0x2Eu);
          inet_ntop(30, &dword_1000107D0, v16, 0x2Eu);
          rtadvdLog();
          return (v10 + 1);
        }
      }
    }
  }
  else if (!v6[3] && v11 != *((_DWORD *)v6 + 8))
  {
    goto LABEL_22;
  }
  return v10;
}

double rtadvd_timer_init()
{
  xmmword_100010710 = 0u;
  *(_OWORD *)&dword_100010720 = 0u;
  qword_100010740 = 0;
  xmmword_100010730 = 0u;
  timer_head = (uint64_t)&timer_head;
  *(void *)algn_100010708 = &timer_head;
  double result = *(double *)&tm_max;
  *(long long *)((char *)&xmmword_100010710 + 8) = tm_max;
  return result;
}

char *rtadvd_add_timer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (char *)malloc_type_malloc(0x48uLL, 0x10A00406FDF35A8uLL);
  if (!v8
    || (uint64_t v9 = v8,
        *((void *)v8 + 8) = 0,
        *((_OWORD *)v8 + 2) = 0u,
        *((_OWORD *)v8 + 3) = 0u,
        *(_OWORD *)uint64_t v8 = 0u,
        *((_OWORD *)v8 + 1) = 0u,
        !a1))
  {
    rtadvdLog();
    exit(1);
  }
  *((void *)v8 + 5) = a1;
  *((void *)v8 + 6) = a3;
  *((void *)v8 + 7) = a2;
  *((void *)v8 + 8) = a4;
  *(_OWORD *)(v8 + 24) = tm_max;
  insque(v8, &timer_head);
  return v9;
}

void rtadvd_remove_timer(void **a1)
{
  *a1 = 0;
}

__n128 rtadvd_set_timer(uint64_t a1, uint64_t a2)
{
  v8.__darwin_time_t tv_sec = 0;
  *(void *)&v8.tv_usec = 0;
  gettimeofday(&v8, 0);
  int v5 = *(_DWORD *)(a1 + 8) + v8.tv_usec;
  if (v5 > 999999)
  {
    v5 -= 1000000;
    __darwin_time_t v6 = v8.tv_sec + *(void *)a1 + 1;
  }
  else
  {
    __darwin_time_t v6 = *(void *)a1 + v8.tv_sec;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = v6;
  if (v6 < *((uint64_t *)&xmmword_100010710 + 1)
    || (v6 == *((void *)&xmmword_100010710 + 1) ? (BOOL v7 = v5 < dword_100010720) : (BOOL v7 = 0), v7))
  {
    __n128 result = *(__n128 *)(a2 + 24);
    *(long long *)((char *)&xmmword_100010710 + 8) = (__int128)result;
  }
  return result;
}

uint64_t TIMEVAL_ADD(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a2 + 8) + *(_DWORD *)(result + 8);
  if (v3 > 999999)
  {
    v3 -= 1000000;
    uint64_t v4 = *(void *)result + *(void *)a2 + 1;
  }
  else
  {
    uint64_t v4 = *(void *)a2 + *(void *)result;
  }
  *(_DWORD *)(a3 + 8) = v3;
  *(void *)a3 = v4;
  return result;
}

uint64_t *rtadvd_check_timer()
{
  v16.__darwin_time_t tv_sec = 0;
  *(void *)&v16.__darwin_suseconds_t tv_usec = 0;
  gettimeofday(&v16, 0);
  *(long long *)((char *)&xmmword_100010710 + 8) = tm_max;
  uint64_t v0 = timer_head;
  if ((uint64_t *)timer_head == &timer_head)
  {
    int v9 = 0x7FFFFFFF;
    __darwin_time_t v8 = 0x7FFFFFFFLL;
    goto LABEL_20;
  }
  __darwin_time_t tv_sec = v16.tv_sec;
  __darwin_suseconds_t tv_usec = v16.tv_usec;
  do
  {
    int v3 = *(uint64_t **)v0;
    int v5 = (void *)(v0 + 24);
    uint64_t v4 = *(void *)(v0 + 24);
    if (v4 < tv_sec || v4 == tv_sec && (uint64_t v4 = tv_sec, *(_DWORD *)(v0 + 32) <= tv_usec))
    {
      if (!(*(uint64_t (**)(void))(v0 + 40))(*(void *)(v0 + 48))) {
        goto LABEL_17;
      }
      __darwin_time_t v6 = *(void (**)(void, uint64_t))(v0 + 56);
      if (v6) {
        v6(*(void *)(v0 + 64), v0 + 24);
      }
      int v7 = tv_usec + *(_DWORD *)(v0 + 32);
      if (v7 >= 1000000)
      {
        v7 -= 1000000;
        uint64_t v4 = *v5 + tv_sec + 1;
      }
      else
      {
        uint64_t v4 = tv_sec + *v5;
      }
      *(_DWORD *)(v0 + 32) = v7;
      *(void *)(v0 + 24) = v4;
    }
    if (v4 < *((uint64_t *)&xmmword_100010710 + 1)
      || v4 == *((void *)&xmmword_100010710 + 1) && *(_DWORD *)(v0 + 32) < dword_100010720)
    {
      *(long long *)((char *)&xmmword_100010710 + 8) = *(_OWORD *)v5;
    }
LABEL_17:
    uint64_t v0 = (uint64_t)v3;
  }
  while (v3 != &timer_head);
  __darwin_time_t v8 = *((void *)&xmmword_100010710 + 1);
  int v9 = dword_100010720;
LABEL_20:
  if (v8 == 0x7FFFFFFF && v9 == 0x7FFFFFFF) {
    return 0;
  }
  if (v8 < v16.tv_sec || v8 == v16.tv_sec && v9 < v16.tv_usec)
  {
    int v11 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    BOOL v13 = __OFSUB__(v9, v16.tv_usec);
    int v11 = v9 - v16.tv_usec;
    char v14 = (v11 < 0) ^ v13;
    if (v14) {
      v11 += 1000000;
    }
    if (v14) {
      __darwin_time_t v15 = ~v16.tv_sec;
    }
    else {
      __darwin_time_t v15 = -v16.tv_sec;
    }
    uint64_t v12 = v15 + v8;
  }
  __n128 result = &rtadvd_check_timer_returnval;
  dword_100010750 = v11;
  rtadvd_check_timer_returnval = v12;
  return result;
}

uint64_t TIMEVAL_SUB(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(result + 8) - *(_DWORD *)(a2 + 8);
  if (v3 < 0)
  {
    v3 += 1000000;
    uint64_t v4 = *(void *)result + ~*(void *)a2;
  }
  else
  {
    uint64_t v4 = *(void *)result - *(void *)a2;
  }
  *(_DWORD *)(a3 + 8) = v3;
  *(void *)a3 = v4;
  return result;
}

uint64_t *rtadvd_timer_rest(uint64_t a1)
{
  gettimeofday((timeval *)&rtadvd_timer_rest_now, 0);
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2 < rtadvd_timer_rest_now
    || ((int v3 = *(_DWORD *)(a1 + 32), v2 == rtadvd_timer_rest_now) ? (v4 = v3 <= dword_100010770) : (v4 = 0), v4))
  {
    rtadvdLog();
    int v7 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    BOOL v5 = __OFSUB__(v3, dword_100010770);
    int v7 = v3 - dword_100010770;
    char v6 = (v7 < 0) ^ v5;
    if (v6) {
      v7 += 1000000;
    }
    if (v6) {
      uint64_t v8 = ~rtadvd_timer_rest_now;
    }
    else {
      uint64_t v8 = -rtadvd_timer_rest_now;
    }
    uint64_t v9 = v8 + v2;
  }
  __n128 result = &rtadvd_timer_rest_returnval;
  dword_100010760 = v7;
  rtadvd_timer_rest_returnval = v9;
  return result;
}

BOOL rtadvdLog_cold_1(void *a1)
{
  *(_WORD *)BOOL v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create os log object", v4, 2u);
  uint64_t v2 = rtadvdLogger;
  *a1 = rtadvdLogger;
  return v2 == 0;
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return ___darwin_check_fd_set_overflow(a1, a2, a3);
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

char *__cdecl ctime(const time_t *a1)
{
  return _ctime(a1);
}

int daemon(int a1, int a2)
{
  return _daemon(a1, a2);
}

void err(int a1, const char *a2, ...)
{
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return _if_nametoindex(a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

void insque(void *a1, void *a2)
{
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

uint64_t os_log_with_args()
{
  return _os_log_with_args();
}

uint64_t pidfile_open()
{
  return _pidfile_open();
}

uint64_t pidfile_remove()
{
  return _pidfile_remove();
}

uint64_t pidfile_write()
{
  return _pidfile_write();
}

uint64_t random(void)
{
  return _random();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return _recvmsg(a1, a2, a3);
}

void remque(void *a1)
{
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return _sendmsg(a1, a2, a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

void srandom(unsigned int a1)
{
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return _strsep(__stringp, __delim);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}