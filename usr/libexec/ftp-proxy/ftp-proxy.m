uint64_t sub_100002E70(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;
  size_t count;
  size_t v12;
  size_t v13;
  xpc_object_t value;
  uint64_t uint64;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  sub_100006228(2, "%s:-->", a3, a4, a5, a6, a7, a8, (char)"get_nat_packets");
  if (a2)
  {
    *a2 = 0;
    v9 = (void *)PFUserCopyRules_S();
    if (v9)
    {
      v10 = v9;
      count = xpc_array_get_count(v9);
      if (!count)
      {
LABEL_9:
        xpc_release(v10);
        return 0;
      }
      v12 = count;
      v13 = 0;
      while (1)
      {
        value = xpc_array_get_value(v10, v13);
        if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary) {
          break;
        }
        uint64 = xpc_dictionary_get_uint64(value, kPFRuleID);
        if (sub_100004A18(uint64))
        {
          *a2 = xpc_dictionary_get_uint64(value, kPFPacketsIn);
          *a2 += xpc_dictionary_get_uint64(value, kPFPacketsOut);
          xpc_dictionary_get_uint64(value, kPFPacketsIn);
          xpc_dictionary_get_uint64(value, kPFPacketsOut);
          sub_100006228(2, "%s:packets in %llu packets out %llu", v16, v17, v18, v19, v20, v21, (char)"get_nat_packets");
        }
        if (v12 == ++v13) {
          goto LABEL_9;
        }
      }
      warn("xpc rule is not of type dictionary");
      xpc_release(v10);
    }
    else
    {
      warn("unable to get rules from anchor");
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100002FF8(uint64_t a1, unsigned int a2, unsigned __int8 *a3, unsigned __int8 *a4, unsigned int a5, uint64_t *a6)
{
  if (!a3 || !a4 || !a5)
  {
    v22 = __error();
    int v23 = 22;
LABEL_17:
    int *v22 = v23;
    return 0xFFFFFFFFLL;
  }
  int v9 = a3[1];
  BOOL v10 = v9 == 30 || v9 == 2;
  if (!v10 || v9 != a4[1])
  {
    v22 = __error();
    int v23 = 43;
    goto LABEL_17;
  }
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  if (!v13)
  {
    v22 = __error();
    int v23 = 12;
    goto LABEL_17;
  }
  v14 = v13;
  xpc_dictionary_set_uint64(v13, kPFAction, 0);
  xpc_dictionary_set_uint64(v14, kPFFamily, a3[1]);
  xpc_dictionary_set_uint64(v14, kPFProtocol, 6uLL);
  xpc_dictionary_set_uint64(v14, kPFExtFilter, 1uLL);
  xpc_dictionary_set_BOOL(v14, kPFQuick, 1);
  xpc_dictionary_set_uint64(v14, kPFKeepState, 1uLL);
  xpc_dictionary_set_string(v14, kPFFlags, "S/SA");
  xpc_dictionary_set_uint64(v14, kPFRTableID, 0);
  xpc_dictionary_set_uint64(v14, kPFMaxStates, 1uLL);
  xpc_dictionary_set_uint64(v14, kPFDirection, a2);
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  if (v15)
  {
    v16 = v15;
    xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
    if (v17)
    {
      v18 = v17;
      if (a3[1] == 2)
      {
        inet_ntop(2, a3 + 4, string, 0x10u);
        xpc_dictionary_set_string(v16, kPFSubAddress, string);
        v19 = a4 + 4;
        int v20 = 2;
        socklen_t v21 = 16;
      }
      else
      {
        inet_ntop(30, a3 + 8, string, 0x2Eu);
        xpc_dictionary_set_string(v16, kPFSubAddress, string);
        v19 = a4 + 8;
        int v20 = 30;
        socklen_t v21 = 46;
      }
      inet_ntop(v20, v19, string, v21);
      xpc_dictionary_set_string(v18, kPFSubAddress, string);
      xpc_dictionary_set_uint64(v18, kPFSubLowPort, a5);
      xpc_dictionary_set_uint64(v18, kPFSubPortOperator, 2uLL);
      uint64_t inserted = PFUserInsertRule_S();
      *a6 = inserted;
      if (inserted) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = 0xFFFFFFFFLL;
      }
      xpc_release(v18);
    }
    else
    {
      *__error() = 12;
      uint64_t v24 = 0xFFFFFFFFLL;
    }
    xpc_release(v16);
  }
  else
  {
    *__error() = 12;
    uint64_t v24 = 0xFFFFFFFFLL;
  }
  xpc_release(v14);
  return v24;
}

uint64_t sub_100003334(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned int a4, unsigned __int8 *a5, unsigned int a6, uint64_t *a7)
{
  if (!a2 || !a3 || !a4 || !a5 || !a6 || (int v12 = a2[1], v12 != a5[1]))
  {
    int v23 = __error();
    int v24 = 22;
LABEL_16:
    *int v23 = v24;
    return 0xFFFFFFFFLL;
  }
  if (v12 != 30 && v12 != 2 || v12 != a3[1])
  {
    int v23 = __error();
    int v24 = 43;
    goto LABEL_16;
  }
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  if (!v14)
  {
    int v23 = __error();
    int v24 = 12;
    goto LABEL_16;
  }
  xpc_object_t v15 = v14;
  xpc_dictionary_set_uint64(v14, kPFAction, 8uLL);
  xpc_dictionary_set_uint64(v15, kPFFamily, a2[1]);
  xpc_dictionary_set_uint64(v15, kPFProtocol, 6uLL);
  xpc_dictionary_set_uint64(v15, kPFExtFilter, 1uLL);
  xpc_dictionary_set_uint64(v15, kPFRTableID, 0);
  xpc_dictionary_set_BOOL(v15, kPFNATPass, 1);
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  if (v16)
  {
    xpc_object_t v17 = v16;
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    if (v18)
    {
      v19 = v18;
      if (a2[1] == 2)
      {
        inet_ntop(2, a2 + 4, string, 0x10u);
        xpc_dictionary_set_string(v17, kPFSubAddress, string);
        int v20 = a3 + 4;
        int v21 = 2;
        socklen_t v22 = 16;
      }
      else
      {
        inet_ntop(30, a2 + 8, string, 0x2Eu);
        xpc_dictionary_set_string(v17, kPFSubAddress, string);
        int v20 = a3 + 8;
        int v21 = 30;
        socklen_t v22 = 46;
      }
      inet_ntop(v21, v20, string, v22);
      xpc_dictionary_set_string(v19, kPFSubAddress, string);
      xpc_dictionary_set_uint64(v19, kPFSubLowPort, a4);
      xpc_dictionary_set_uint64(v19, kPFSubPortOperator, 2uLL);
      xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
      if (v27)
      {
        v28 = v27;
        if (a5[1] == 2)
        {
          v29 = a5 + 4;
          int v30 = 2;
          socklen_t v31 = 16;
        }
        else
        {
          v29 = a5 + 8;
          int v30 = 30;
          socklen_t v31 = 46;
        }
        inet_ntop(v30, v29, string, v31);
        xpc_dictionary_set_string(v28, kPFSubAddress, string);
        xpc_dictionary_set_uint64(v28, kPFSubLowPort, a6);
        xpc_dictionary_set_uint64(v28, kPFSubPortOperator, 0);
        xpc_dictionary_set_value(v15, kPFFrom, v17);
        xpc_dictionary_set_value(v15, kPFTo, v19);
        xpc_dictionary_set_value(v15, kPFNATRDRAddress, v28);
        uint64_t inserted = PFUserInsertRule_S();
        *a7 = inserted;
        if (inserted) {
          uint64_t v25 = 0;
        }
        else {
          uint64_t v25 = 0xFFFFFFFFLL;
        }
        xpc_release(v28);
      }
      else
      {
        *__error() = 12;
        uint64_t v25 = 0xFFFFFFFFLL;
      }
      xpc_release(v19);
    }
    else
    {
      *__error() = 12;
      uint64_t v25 = 0xFFFFFFFFLL;
    }
    xpc_release(v17);
  }
  else
  {
    *__error() = 12;
    uint64_t v25 = 0xFFFFFFFFLL;
  }
  xpc_release(v15);
  return v25;
}

void sub_10000371C()
{
  if (dword_10000C028)
  {
    v7.tv_sec = 0;
    *(void *)&v7.tv_usec = 0;
    gettimeofday(&v7, 0);
    if ((double)v7.tv_usec / 1000000.0 + (double)v7.tv_sec - *(double *)&qword_10000C030 >= 0.001) {
      double v0 = (double)v7.tv_usec / 1000000.0 + (double)v7.tv_sec - *(double *)&qword_10000C030;
    }
    else {
      double v0 = 0.001;
    }
    if (!qword_10000C038)
    {
      syslog(6, "data transfer complete (no bytes transferred)");
      return;
    }
    if (v0 < 60.0)
    {
      unsigned int v1 = snprintf((char *)&v7, 0x3E8uLL, "data transfer complete (%.1fs", v0);
      if (v1 == -1) {
        return;
      }
      if (v1 > 0x3E7) {
        goto LABEL_25;
      }
LABEL_17:
      size_t v2 = 1000 - v1;
      if ((int)qword_10000C038 >= 1)
      {
        size_t v3 = strlen((const char *)&v7);
        int v4 = snprintf((char *)&v7 + v3, v2, ", %d bytes to server) (%.1fKB/s", qword_10000C038, (double)(int)qword_10000C038 / v0 * 0.0009765625);
        if (v4 == -1) {
          return;
        }
        if (v2 <= v4) {
          goto LABEL_25;
        }
        v2 -= v4;
      }
      if (SHIDWORD(qword_10000C038) < 1) {
        goto LABEL_24;
      }
      size_t v5 = strlen((const char *)&v7);
      int v6 = snprintf((char *)&v7 + v5, v2, ", %d bytes to client) (%.1fKB/s", HIDWORD(qword_10000C038), (double)SHIDWORD(qword_10000C038) / v0 * 0.0009765625);
      if (v6 == -1) {
        return;
      }
      if (v2 > v6) {
LABEL_24:
      }
        __strlcat_chk();
      goto LABEL_25;
    }
    if ((int)(v0 + 0.5) < 3600) {
      unsigned int v1 = snprintf((char *)&v7, 0x3E8uLL, "data transfer complete (%dm %ds");
    }
    else {
      unsigned int v1 = snprintf((char *)&v7, 0x3E8uLL, "data transfer complete (%dh %dm %ds");
    }
    if (v1 <= 0x3E7) {
      goto LABEL_17;
    }
    if (v1 != -1) {
LABEL_25:
    }
      syslog(6, "%s");
  }
}

void sub_1000039E4(const char *a1, int a2)
{
  if (dword_10000C028)
  {
    if (!strncasecmp(a1, "pass ", 5uLL)) {
      int v4 = "PASS XXXX";
    }
    else {
      int v4 = a1;
    }
    if (a2)
    {
      if (!strncasecmp(a1, "user ", 5uLL)
        || !strncasecmp(a1, "retr ", 5uLL)
        || !strncasecmp(a1, "cwd ", 4uLL)
        || !strncasecmp(a1, "stor ", 5uLL))
      {
        int v5 = 6;
      }
      else
      {
        int v5 = 7;
      }
      int v6 = "client:";
    }
    else
    {
      int v5 = 7;
      int v6 = " server:";
    }
    syslog(v5, "%s %s", v6, v4);
  }
}

uint64_t sub_100003ADC(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = 0;
  if (dword_10000C008 != -1)
  {
    close(dword_10000C008);
    dword_10000C008 = -1;
  }
  sub_100003DC4();
  if (dword_10000C010 != -1)
  {
    close(dword_10000C010);
    dword_10000C010 = -1;
  }
  sub_100003E04();
  if (!a1)
  {
    sub_100006228(1, "new_dataconn(client)", v6, v7, v8, v9, v10, v11, v30);
    unk_10000C050 = 0;
    *(void *)algn_10000C058 = 0;
    int v16 = sub_100006860(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&unk_10000C050);
    dword_10000C008 = v16;
    if (v16 == -1)
    {
      int v21 = "cannot get client listen socket (%m)";
      goto LABEL_29;
    }
    if (listen(v16, 5))
    {
      int v21 = "cannot listen on client socket (%m)";
      goto LABEL_29;
    }
    if (!dword_10000C060) {
      return 0;
    }
    uint64_t v17 = PFUserCreate();
    if (v17)
    {
      if (sub_100002FF8(v17, 1u, (unsigned __int8 *)(a2 + 40), (unsigned __int8 *)(a3 + 40), (unsigned __int16)word_10000C052, &v31) != -1)
      {
        xpc_object_t v18 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
        uint64_t v19 = v31;
        if (v18)
        {
          void *v18 = qword_10000C078;
          v18[1] = v19;
          qword_10000C078 = (uint64_t)v18;
          PFUserRelease();
          return 0;
        }
LABEL_24:
        PFUserDeleteRule();
      }
LABEL_25:
      PFUserRelease();
    }
LABEL_26:
    int v21 = "pf operation failed (%m)";
LABEL_29:
    int v22 = 5;
LABEL_30:
    syslog(v22, v21);
    sub_100003E44(71, v23, v24, v25, v26, v27, v28, v29);
  }
  qword_10000C040 = 0;
  *(void *)algn_10000C048 = 0;
  int v12 = sub_100006860(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&qword_10000C040);
  dword_10000C010 = v12;
  if (v12 == -1)
  {
    int v21 = "server socket bind() failed (%m)";
LABEL_23:
    int v22 = 6;
    goto LABEL_30;
  }
  if (listen(v12, 5))
  {
    int v21 = "server socket listen() failed (%m)";
    goto LABEL_23;
  }
  if (!dword_10000C060)
  {
    uint64_t v13 = PFUserCreate();
    if (v13)
    {
      if (sub_100003334(v13, (unsigned __int8 *)&xmmword_10000C064, (unsigned __int8 *)(a3 + 40), bswap32(WORD1(qword_10000C040)) >> 16, (unsigned __int8 *)(a2 + 40), bswap32((unsigned __int16)word_10000C052) >> 16, &v31) != -1)
      {
        xpc_object_t v14 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
        uint64_t v15 = v31;
        if (v14)
        {
          void *v14 = qword_10000C078;
          v14[1] = v15;
          qword_10000C078 = (uint64_t)v14;
          PFUserRelease();
          qword_10000CCB8 = 0;
          return 0;
        }
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  return 0;
}

uint64_t sub_100003DC4()
{
  uint64_t result = dword_10000C00C;
  if ((dword_10000C00C & 0x80000000) == 0)
  {
    shutdown(dword_10000C00C, 2);
    uint64_t result = close(dword_10000C00C);
    dword_10000C00C = -1;
  }
  return result;
}

uint64_t sub_100003E04()
{
  uint64_t result = dword_10000C014;
  if ((dword_10000C014 & 0x80000000) == 0)
  {
    shutdown(dword_10000C014, 2);
    uint64_t result = close(dword_10000C014);
    dword_10000C014 = -1;
  }
  return result;
}

void sub_100003E44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a1;
  sub_100005D5C(a1, a2, a3, a4, a5, a6, a7, a8);
  sub_100006228(1, "exit: %d", v9, v10, v11, v12, v13, v14, v8);
  exit(v8);
}

void sub_100003E7C(uint64_t a1, uint64_t a2)
{
  sub_1000039E4(*(const char **)(a1 + 32), 1);
  int v4 = *(char **)(a1 + 32);
  if (strlen(v4) >= 0x201)
  {
    syslog(5, "excessively long control command");
    goto LABEL_69;
  }
  if (dword_10000C080 && !strncasecmp(v4, "user ", 5uLL))
  {
    if (!strcasecmp(v4 + 5, "ftp\r\n") || !strcasecmp(v4 + 5, "anonymous\r\n")) {
      goto LABEL_44;
    }
    strcpy(__str, "500 Only anonymous FTP is allowed\r\n");
    size_t v48 = strlen(__str);
    unsigned int v49 = 0;
    while (1)
    {
      ssize_t v50 = send(*(_DWORD *)a1, &__str[v49], v48 - v49, 0);
      if (v50 == -1)
      {
        if (*__error() != 35 && *__error() != 4) {
          return;
        }
      }
      else
      {
        v49 += v50;
      }
      if ((v49 & 0x80000000) != 0 || v48 <= (int)v49) {
        return;
      }
    }
  }
  if (strncasecmp(v4, "eprt ", 5uLL))
  {
    if (!dword_10000C088 && !strncasecmp(v4, "epsv", 4uLL))
    {
      strcpy(__str, "500 EPSV command not understood\r\n");
      sub_100006228(1, "to client (modified): %s", v5, v6, v7, v8, v9, v10, (char)__str);
      size_t v63 = strlen(__str);
      unsigned int v64 = 0;
      while (1)
      {
        ssize_t v65 = send(*(_DWORD *)a1, &__str[v64], v63 - v64, 0);
        if (v65 == -1)
        {
          if (*__error() != 35 && *__error() != 4) {
            return;
          }
        }
        else
        {
          v64 += v65;
        }
        if ((v64 & 0x80000000) != 0 || v63 <= (int)v64) {
          return;
        }
      }
    }
    if (strncasecmp(v4, "port ", 5uLL)) {
      goto LABEL_44;
    }
    sub_100006228(1, "Got a PORT command", v11, v12, v13, v14, v15, v16, v104);
    uint64_t v17 = (const char *)(*(void *)(a1 + 32) + 5);
    v107.ai_flags = 0;
    if (sscanf(v17, "%u,%u,%u,%u,%u,%u", &v107, &v107.ai_family, &v107.ai_socktype, &v107.ai_protocol, &v107.ai_addrlen, &v107.ai_addrlen + 1) == 6)
    {
      for (uint64_t i = 0; i != 24; i += 4)
      {
        if (*(int *)((char *)&v107.ai_flags + i) >= 0x100u) {
          goto LABEL_68;
        }
      }
      byte_10000C051 = 2;
      dword_10000C054 = bswap32((v107.ai_family << 16) | (v107.ai_flags << 24) | (v107.ai_socktype << 8) | v107.ai_protocol);
      word_10000C052 = bswap32(*(&v107.ai_addrlen + 1) | (v107.ai_addrlen << 8)) >> 16;
      sub_100006228(1, "client wants us to use %u.%u.%u.%u:%u", v18, v19, v20, v21, v22, v23, v107.ai_flags);
      sub_100003ADC(1, a1, a2);
      dword_10000C084 = 1;
      v25.s_addr = *(_DWORD *)(a2 + 44);
      char v26 = inet_ntoa(v25);
      sub_100006228(1, "we want server to use %s:%u", v27, v28, v29, v30, v31, v32, v26);
      int v4 = __str;
      snprintf(__str, 0x64uLL, "PORT %u,%u,%u,%u,%u,%u\r\n", *(unsigned __int8 *)(a2 + 44), *(unsigned __int8 *)(a2 + 45), *(unsigned __int8 *)(a2 + 46), *(unsigned __int8 *)(a2 + 47), BYTE2(qword_10000C040), BYTE3(qword_10000C040));
      sub_100006228(1, "to server (modified): %s", v33, v34, v35, v36, v37, v38, (char)__str);
      goto LABEL_45;
    }
LABEL_68:
    syslog(6, "malformed PORT command (%s)");
LABEL_69:
    sub_100003E44(65, v90, v91, v92, v93, v94, v95, v96);
  }
  memset(&v107, 0, sizeof(v107));
  v105 = 0;
  v39 = strdup(v4 + 5);
  if (!v39)
  {
    syslog(3, "insufficient memory");
    sub_100003E44(69, v97, v98, v99, v100, v101, v102, v103);
  }
  v40 = v39;
  uint64_t v41 = 0;
  v43 = v39 + 1;
  int v42 = *v39;
  v109 = 0;
  v110 = 0;
  v108 = 0;
  do
  {
    v44 = strchr(v43, v42);
    if (!v44 || *v44 != v42)
    {
      __endptr = v43;
      goto LABEL_33;
    }
    char *v44 = 0;
    v45 = v44 + 1;
    (&v108)[v41++] = v43;
    v43 = v45;
  }
  while (v41 != 3);
  __endptr = v45;
  v46 = v108;
  unint64_t v47 = strtoul(v108, &__endptr, 10);
  if (!*v46 || *__endptr)
  {
    if (v47 == 2)
    {
LABEL_21:
      int v4 = 0;
      strcpy(__str, "522 Protocol not supported, use (1)\r\n");
      goto LABEL_34;
    }
    goto LABEL_67;
  }
  memset(&v107, 0, sizeof(v107));
  if (v47 == 2) {
    goto LABEL_21;
  }
  if (v47 != 1)
  {
LABEL_67:
    int v4 = 0;
    strcpy(__str, "501 Protocol not supported\r\n");
    goto LABEL_34;
  }
  v107.ai_socktype = 1;
  *(void *)&v107.ai_flags = 0x200000004;
  if (getaddrinfo(v109, v110, &v107, &v105) || v105->ai_next || v105->ai_addrlen > 0x10)
  {
LABEL_33:
    int v4 = 0;
    strcpy(__str, "500 Invalid argument; rejected\r\n");
    goto LABEL_34;
  }
  __memcpy_chk();
  v66.s_addr = dword_10000C054;
  char v67 = inet_ntoa(v66);
  sub_100006228(1, "client wants us to use %s:%u", v68, v69, v70, v71, v72, v73, v67);
  sub_100003ADC(1, a1, a2);
  dword_10000C084 = 3;
  v74.s_addr = *(_DWORD *)(a2 + 44);
  char v75 = inet_ntoa(v74);
  sub_100006228(1, "we want server to use %s:%u", v76, v77, v78, v79, v80, v81, v75);
  v82.s_addr = *(_DWORD *)(a2 + 44);
  v83 = inet_ntoa(v82);
  int v4 = __str;
  snprintf(__str, 0x64uLL, "EPRT |%d|%s|%u|\r\n", 1, v83, bswap32(WORD1(qword_10000C040)) >> 16);
  sub_100006228(1, "to server (modified): %s", v84, v85, v86, v87, v88, v89, (char)__str);
LABEL_34:
  free(v40);
  if (v105) {
    freeaddrinfo(v105);
  }
  if (!v4)
  {
    sub_100006228(1, "to client (modified): %s", v51, v52, v53, v54, v55, v56, (char)__str);
    size_t v57 = strlen(__str);
    unsigned int v58 = 0;
    do
    {
      ssize_t v59 = send(*(_DWORD *)a1, &__str[v58], v57 - v58, 0);
      if (v59 == -1)
      {
        if (*__error() != 35 && *__error() != 4) {
          break;
        }
      }
      else
      {
        v58 += v59;
      }
    }
    while ((v58 & 0x80000000) == 0 && v57 > (int)v58);
  }
LABEL_44:
  if (v4)
  {
LABEL_45:
    size_t v60 = strlen(v4);
    unsigned int v61 = 0;
    do
    {
      ssize_t v62 = send(*(_DWORD *)a2, &v4[v61], v60 - v61, 0);
      if (v62 == -1)
      {
        if (*__error() != 35 && *__error() != 4) {
          return;
        }
      }
      else
      {
        v61 += v62;
      }
    }
    while ((v61 & 0x80000000) == 0 && v60 > (int)v61);
  }
}

ssize_t sub_1000045B4(uint64_t a1, uint64_t a2)
{
  sub_1000039E4(*(const char **)(a1 + 32), 0);
  int v4 = *(const char **)(a1 + 32);
  if (strlen(v4) >= 0x401)
  {
    uint64_t v17 = "long FTP control reply";
LABEL_46:
    int v67 = 5;
LABEL_44:
    syslog(v67, v17, v75);
    sub_100003E44(65, v68, v69, v70, v71, v72, v73, v74);
  }
  __endptr = 0;
  uint64_t v11 = strtol(v4, &__endptr, 10);
  uint64_t v12 = *(char **)(a1 + 32);
  uint64_t v13 = *v12;
  if ((v13 & 0x80) != 0)
  {
    __uint32_t v14 = __maskrune(v13, 0x4000uLL);
    uint64_t v12 = *(char **)(a1 + 32);
    LODWORD(v13) = *v12;
  }
  else
  {
    __uint32_t v14 = _DefaultRuneLocale.__runetype[v13] & 0x4000;
  }
  if (v14) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v11;
  }
  if (!v13 || (int v16 = *__endptr, v16 != 32) && v16 != 45)
  {
    if (byte_10000CCC0) {
      goto LABEL_15;
    }
    uint64_t v17 = "malformed control reply";
    goto LABEL_43;
  }
  if ((unint64_t)(v15 - 1000) <= 0xFFFFFFFFFFFFFC18)
  {
    if (byte_10000CCC0) {
      goto LABEL_15;
    }
    uint64_t v75 = v15;
    uint64_t v17 = "invalid server reply code %ld";
    goto LABEL_43;
  }
  byte_10000CCC0 = v16 == 45;
  if (v15 != 227 || dword_10000C088 != 0)
  {
    if (dword_10000C088)
    {
      if (v15 == 234)
      {
        sub_100006228(1, "Got 'authentication exchange complete' reply", v5, v6, v7, v8, v9, v10, v75);
        sub_100006228(1, "{%s}", v22, v23, v24, v25, v26, v27, *(void *)(a1 + 32));
        dword_10000C084 = 5;
        uint64_t v12 = *(char **)(a1 + 32);
        if (fcntl(*(_DWORD *)a2, 4, 4) == -1 || fcntl(*(_DWORD *)a1, 4, 4) == -1)
        {
          syslog(3, "fcntl F_SETFL O_NONBLOCK error");
          sub_100003E44(71, v28, v29, v30, v31, v32, v33, v34);
        }
      }
    }
    goto LABEL_15;
  }
  sub_100006228(1, "Got a PASV reply", v5, v6, v7, v8, v9, v10, v75);
  sub_100006228(1, "{%s}", v35, v36, v37, v38, v39, v40, *(void *)(a1 + 32));
  uint64_t v41 = *(char **)(a1 + 32);
  int v42 = strchr(v41, 40);
  if (!v42)
  {
    int v42 = strrchr(v41, 32);
    if (!v42)
    {
      uint64_t v17 = "malformed 227 reply";
      goto LABEL_46;
    }
  }
  int v77 = 0;
  if (sscanf(v42 + 1, "%u,%u,%u,%u,%u,%u", &v77, &v78, &v79, &v80, &v81, &v82) != 6)
  {
    uint64_t v75 = *(void *)(a2 + 32);
    uint64_t v17 = "malformed PASV reply (%s)";
    goto LABEL_43;
  }
  for (uint64_t i = 0; i != 24; i += 4)
  {
    if (*(unsigned int *)((char *)&v77 + i) >= 0x100)
    {
      uint64_t v75 = *(void *)(a2 + 32);
      uint64_t v17 = "malformed PASV reply(%s)";
LABEL_43:
      int v67 = 6;
      goto LABEL_44;
    }
  }
  BYTE1(qword_10000C040) = 2;
  v44.s_addr = bswap32((v78 << 16) | (v77 << 24) | (v79 << 8) | v80);
  HIDWORD(qword_10000C040) = v44;
  WORD1(qword_10000C040) = bswap32(v82 | (v81 << 8)) >> 16;
  char v45 = inet_ntoa(v44);
  sub_100006228(1, "server wants us to use %s:%u", v46, v47, v48, v49, v50, v51, v45);
  sub_100003ADC(0, a2, a1);
  dword_10000C084 = 2;
  if (dword_10000C060) {
    uint64_t v52 = (unsigned __int8 *)&unk_10000C090;
  }
  else {
    uint64_t v52 = (unsigned __int8 *)(a1 + 44);
  }
  v53.s_addr = *(_DWORD *)v52;
  char v54 = inet_ntoa(v53);
  sub_100006228(1, "we want client to use %s:%u", v55, v56, v57, v58, v59, v60, v54);
  uint64_t v12 = __str;
  snprintf(__str, 0x64uLL, "227 Entering Passive Mode (%u,%u,%u,%u,%u,%u)\r\n", *v52, v52[1], v52[2], v52[3], word_10000C052, HIBYTE(word_10000C052));
  sub_100006228(1, "to client (modified): %s", v61, v62, v63, v64, v65, v66, (char)__str);
LABEL_15:
  size_t v18 = strlen(v12);
  unsigned int v19 = 0;
  while (2)
  {
    ssize_t result = send(*(_DWORD *)a2, &v12[v19], v18 - v19, 0);
    if (result != -1)
    {
      v19 += result;
      goto LABEL_20;
    }
    ssize_t result = (ssize_t)__error();
    if (*(_DWORD *)result == 35 || (ssize_t result = (ssize_t)__error(), *(_DWORD *)result == 4))
    {
LABEL_20:
      if ((v19 & 0x80000000) != 0 || v18 <= (int)v19) {
        return result;
      }
      continue;
    }
    return result;
  }
}

uint64_t sub_100004A18(uint64_t a1)
{
  unsigned int v1 = (void *)qword_10000C078;
  if (!qword_10000C078) {
    return 0;
  }
  while (v1[1] != a1)
  {
    unsigned int v1 = (void *)*v1;
    if (!v1) {
      return 0;
    }
  }
  return 1;
}

void start(int a1, char *const *a2)
{
  uint64_t v178 = 0;
  memset(v177, 0, sizeof(v177));
  memset(v176, 0, sizeof(v176));
  uint64_t v175 = 0;
  memset(v174, 0, sizeof(v174));
  long long v173 = 0u;
  memset(v172, 0, sizeof(v172));
  v171.__sigaction_u.__sa_handler = 0;
  *(void *)&v171.sa_mask = 0;
  v170.__sigaction_u.__sa_handler = 0;
  *(void *)&v170.sa_mask = 0;
  int v168 = 1;
  socklen_t v169 = 0;
  uint64_t v166 = 0;
  uint64_t v167 = 0;
  errorbuf = 0;
  if (sandbox_init("ftp-proxy-embedded", 1uLL, &errorbuf) == -1)
  {
    fprintf(__stderrp, "sandbox_init: %s\n", errorbuf);
    sandbox_free_error(errorbuf);
    exit(-1);
  }
  int v4 = getopt(a1, a2, "a:D:g:m:M:R:S:t:u:AnpVwr");
  if (v4 == -1) {
LABEL_4:
  }
    sub_100005CD8();
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  while (2)
  {
    uint64_t v7 = v6;
    __endptr[0].tv_sec = 0;
    if (v4 > 96)
    {
      uint64_t v6 = 1;
      switch(v4)
      {
        case 'g':
          qword_10000C0A0 = (uint64_t)optarg;
          goto LABEL_45;
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'o':
        case 'q':
        case 's':
          goto LABEL_4;
        case 'm':
          unsigned int v8 = strtol(optarg, (char **)__endptr, 10);
          dword_10000C000 = v8;
LABEL_32:
          if (!*optarg) {
            goto LABEL_4;
          }
          if (*(unsigned char *)__endptr[0].tv_sec) {
            goto LABEL_4;
          }
          uint64_t v6 = v7;
          if (v8 >= 0x10000) {
            goto LABEL_4;
          }
          goto LABEL_46;
        case 'n':
          dword_10000C088 = 1;
          goto LABEL_45;
        case 'p':
          goto LABEL_46;
        case 'r':
          dword_10000CCB4 = 1;
          goto LABEL_45;
        case 't':
          uint64_t v14 = strtol(optarg, (char **)__endptr, 10);
          if (!*optarg) {
            goto LABEL_4;
          }
          uint64_t v5 = v14;
          goto LABEL_40;
        case 'u':
          off_10000C018 = optarg;
          goto LABEL_45;
        default:
          if (v4 != 97 || !*optarg) {
            goto LABEL_4;
          }
          dword_10000C020 = inet_addr(optarg);
          uint64_t v6 = v7;
          if (dword_10000C020 == -1)
          {
            syslog(5, "%s: invalid address", optarg);
            sub_100005CD8();
          }
          goto LABEL_46;
      }
    }
    switch(v4)
    {
      case 'M':
        unsigned int v8 = strtol(optarg, (char **)__endptr, 10);
        dword_10000C004 = v8;
        goto LABEL_32;
      case 'N':
      case 'O':
      case 'P':
      case 'Q':
      case 'T':
      case 'U':
        goto LABEL_4;
      case 'R':
        if (!*optarg) {
          goto LABEL_4;
        }
        uint64_t v9 = strdup(optarg);
        if (!v9)
        {
          syslog(5, "Insufficient memory (malloc failed)");
          goto LABEL_67;
        }
        uint64_t v10 = v9;
        xmmword_10000C064 = 0x210uLL;
        uint64_t v11 = strchr(v9, 58);
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = strtol(v11 + 1, (char **)__endptr, 10);
          if (*(unsigned char *)__endptr[0].tv_sec || v13 < 1 || v13 >= 0x10000) {
            goto LABEL_4;
          }
          WORD1(xmmword_10000C064) = bswap32(v13) >> 16;
          *uint64_t v12 = 0;
        }
        else
        {
          WORD1(xmmword_10000C064) = 5376;
        }
        DWORD1(xmmword_10000C064) = inet_addr(v10);
        if (DWORD1(xmmword_10000C064) == -1) {
          goto LABEL_4;
        }
        free(v10);
        dword_10000C060 = 1;
        goto LABEL_45;
      case 'S':
        if (!inet_aton(optarg, (in_addr *)&dword_10000C0A8)) {
          goto LABEL_4;
        }
        goto LABEL_46;
      case 'V':
        dword_10000C028 = 1;
        goto LABEL_45;
      default:
        if (v4 == 65)
        {
          dword_10000C080 = 1;
LABEL_45:
          uint64_t v6 = v7;
        }
        else
        {
          if (v4 != 68) {
            goto LABEL_4;
          }
          dword_10000CCB0 = strtol(optarg, (char **)__endptr, 10);
          if (!*optarg) {
            goto LABEL_4;
          }
LABEL_40:
          uint64_t v6 = v7;
          if (*(unsigned char *)__endptr[0].tv_sec) {
            goto LABEL_4;
          }
        }
LABEL_46:
        int v4 = getopt(a1, a2, "a:D:g:m:M:R:S:t:u:AnpVwr");
        if (v4 != -1) {
          continue;
        }
        if (dword_10000C004 < dword_10000C000 || v6 == 0) {
          goto LABEL_4;
        }
        openlog(__progname, 9, 24);
        setlinebuf(__stdoutp);
        setlinebuf(__stderrp);
        memset(v176, 0, sizeof(v176));
        memset(v177, 0, sizeof(v177));
        uint64_t v178 = 0;
        memset(v172, 0, sizeof(v172));
        long long v173 = 0u;
        memset(v174, 0, sizeof(v174));
        uint64_t v175 = 0;
        if (sub_100006268(0, (uint64_t)&xmmword_10000C064, (uint64_t)&v177[0].sa_data[6], (sockaddr *)&unk_10000C08C) == -1)sub_100003E44(76, v16, v17, v18, v19, v20, v21, v22); {
        if (dword_10000CCB4)
        }
          int v23 = 0;
        else {
          int v23 = 10;
        }
        unsigned int v24 = getnameinfo((const sockaddr *)&v177[0].sa_data[6], 0x10u, byte_10000C0AC, 0x401u, 0, 0, v23);
        if (v24 <= 8 && ((1 << v24) & 0x105) != 0)
        {
          unsigned int v31 = getnameinfo((const sockaddr *)&xmmword_10000C064, 0x10u, byte_10000C4AD, 0x401u, 0, 0, v23);
          if (v31 <= 8 && ((1 << v31) & 0x105) != 0)
          {
            v176[0] = 0;
            syslog(6, "accepted connection from %s:%u to %s:%u", byte_10000C0AC, bswap32(*(unsigned __int16 *)&v177[0].sa_data[8]) >> 16, byte_10000C4AD, bswap32(WORD1(xmmword_10000C064)) >> 16);
            v172[0] = sub_100006860(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&v173 + 8);
            if (connect(v172[0], (const sockaddr *)&xmmword_10000C064, 0x10u))
            {
              syslog(6, "cannot connect to %s:%u (%m)");
              goto LABEL_69;
            }
            socklen_t v169 = 16;
            getsockname(v172[0], (sockaddr *)((char *)&v173 + 8), &v169);
            unsigned int v32 = getnameinfo((const sockaddr *)((char *)&v173 + 8), 0x10u, byte_10000C8AE, 0x401u, 0, 0, v23);
            if (v32 <= 8 && ((1 << v32) & 0x105) != 0)
            {
              sub_100006228(1, "local socket is %s:%u", v25, v26, v27, v28, v29, v30, (char)byte_10000C8AE);
              v171.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
              *(void *)&v171.sa_mask = 0x200000000;
              if (sigaction(13, &v171, &v170))
              {
                syslog(3, "sigaction() failed (%m)");
                goto LABEL_207;
              }
              v171.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100005D2C;
              *(void *)&v171.sa_mask = 0;
              sigaction(2, &v171, 0);
              sigaction(15, &v171, 0);
              if (setsockopt(v176[0], 0xFFFF, 256, &v168, 4u) == -1)
              {
                syslog(5, "cannot set SO_OOBINLINE (%m)");
                goto LABEL_207;
              }
              v176[1] = 1024;
              *(void *)&v177[0].sa_len = malloc_type_malloc(0x400uLL, 0xB51820DEuLL);
              v176[2] = 1024;
              uint64_t v55 = malloc_type_malloc(0x400uLL, 0xC49F5072uLL);
              *(void *)&v176[3] = 0;
              LOBYTE(v178) = 1;
              *(void *)&v176[6] = v55;
              *(void *)&v177[2].sa_data[6] = "client";
              HIDWORD(v178) = 0;
              *(_OWORD *)&v177[1].sa_data[6] = *(_OWORD *)&v177[0].sa_data[6];
              v172[1] = 1024;
              *(void *)&long long v173 = malloc_type_malloc(0x400uLL, 0xBD9FB44uLL);
              v172[2] = 1024;
              uint64_t v56 = malloc_type_malloc(0x400uLL, 0x6AB13121uLL);
              *(void *)&v172[6] = v56;
              *(void *)&v172[3] = 0;
              LOBYTE(v175) = 1;
              *((void *)&v174[1] + 1) = "server";
              HIDWORD(v175) = 1;
              *(_OWORD *)((char *)v174 + 8) = xmmword_10000C064;
              if (!*(void *)&v177[0].sa_len || !*(void *)&v176[6] || !(void)v173 || !v56)
              {
LABEL_205:
                syslog(5, "insufficient memory");
LABEL_67:
                sub_100003E44(69, v40, v41, v42, v43, v44, v45, v46);
              }
              int v63 = v178;
              int v64 = 1;
              uint64_t v65 = v5;
              while (1)
              {
                int v66 = v176[0];
                if (v176[0] <= dword_10000C008) {
                  int v66 = dword_10000C008;
                }
                if (v66 <= dword_10000C00C) {
                  int v66 = dword_10000C00C;
                }
                if (v66 <= v172[0]) {
                  int v66 = v172[0];
                }
                if (v66 <= dword_10000C010) {
                  int v66 = dword_10000C010;
                }
                if (v66 <= dword_10000C014) {
                  int v66 = dword_10000C014;
                }
                int v67 = v66 & ~(v66 >> 31);
                if (v63) {
                  uint64_t v68 = "alive";
                }
                else {
                  uint64_t v68 = "dead";
                }
                if (v64) {
                  uint64_t v69 = "alive";
                }
                else {
                  uint64_t v69 = "dead";
                }
                v164 = v69;
                sub_100006228(3, "client is %s; server is %s", v57, v58, v59, v60, v61, v62, (char)v68);
                unint64_t v70 = (v67 + 1);
                if ((((_BYTE)v67 + 1) & 0x1F) != 0) {
                  size_t v71 = (v70 >> 5) + 1;
                }
                else {
                  size_t v71 = v70 >> 5;
                }
                uint64_t v72 = (fd_set *)malloc_type_calloc(v71, 4uLL, 0x100004052888210uLL);
                if (!v72) {
                  goto LABEL_205;
                }
                uint64_t v73 = v72;
                if (dword_10000C084 == 5)
                {
                  if (!(_BYTE)v178) {
                    goto LABEL_113;
                  }
                  int v74 = v176[0];
                  if (__darwin_check_fd_set_overflow(v176[0], v72, 0)) {
                    *(__int32_t *)((char *)v73->fds_bits + (((unint64_t)v74 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v74;
                  }
                  int v81 = "ready";
                  if (!BYTE2(v178)) {
                    int v81 = "waiting";
                  }
                  sub_100006228(3, "client is %s", v75, v76, v77, v78, v79, v80, (char)v81);
                  if (BYTE2(v178))
                  {
                    if ((int)sub_1000065E0() < 1)
                    {
                      int v82 = 1;
                    }
                    else
                    {
                      int v82 = 0;
                      BYTE2(v178) = 0;
                    }
                  }
                  else
                  {
LABEL_113:
                    int v82 = 0;
                  }
                  if ((_BYTE)v175)
                  {
                    int v89 = v172[0];
                    if (__darwin_check_fd_set_overflow(v172[0], v73, 0)) {
                      *(__int32_t *)((char *)v73->fds_bits + (((unint64_t)v89 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v89;
                    }
                    uint64_t v96 = "ready";
                    if (!BYTE2(v175)) {
                      uint64_t v96 = "waiting";
                    }
                    sub_100006228(3, "server is %s", v90, v91, v92, v93, v94, v95, (char)v96);
                    if (BYTE2(v175))
                    {
                      if ((int)sub_1000065E0() < 1) {
                        goto LABEL_209;
                      }
                      BYTE2(v175) = 0;
                    }
                  }
                  if (v82)
                  {
LABEL_209:
                    close(v176[0]);
                    close(v172[0]);
                    free(v73);
LABEL_210:
                    if (dword_10000C028) {
                      syslog(6, "session ended");
                    }
LABEL_212:
                    sub_100003E44(0, v160, v57, v58, v59, v60, v61, v62);
                  }
                }
                else
                {
                  if ((_BYTE)v178 && sub_100005FE4((uint64_t)v176, v172))
                  {
                    sub_100006228(3, "client line buffer is \"%s\"", v83, v84, v85, v86, v87, v88, v177[0].sa_len);
                    if (**(unsigned char **)&v177[0].sa_len) {
                      sub_100003E7C((uint64_t)v176, (uint64_t)v172);
                    }
                    goto LABEL_198;
                  }
                  if ((_BYTE)v175 && sub_100005FE4((uint64_t)v172, v176))
                  {
                    sub_100006228(3, "server line buffer is \"%s\"", v122, v123, v124, v125, v126, v127, v173);
                    if (*(unsigned char *)v173) {
                      sub_1000045B4((uint64_t)v172, (uint64_t)v176);
                    }
                    goto LABEL_198;
                  }
                  if ((_BYTE)v178)
                  {
                    int v128 = v176[0];
                    if (__darwin_check_fd_set_overflow(v176[0], v73, 0)) {
                      *(__int32_t *)((char *)v73->fds_bits + (((unint64_t)v128 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v128;
                    }
                    unint64_t v129 = dword_10000C008;
                    if ((dword_10000C008 & 0x80000000) == 0 && __darwin_check_fd_set_overflow(dword_10000C008, v73, 0)) {
                      *(__int32_t *)((char *)v73->fds_bits + ((v129 >> 3) & 0x1FFFFFFC)) |= 1 << v129;
                    }
                    unint64_t v130 = dword_10000C00C;
                    if ((dword_10000C00C & 0x80000000) == 0 && __darwin_check_fd_set_overflow(dword_10000C00C, v73, 0)) {
                      *(__int32_t *)((char *)v73->fds_bits + ((v130 >> 3) & 0x1FFFFFFC)) |= 1 << v130;
                    }
                  }
                  if ((_BYTE)v175)
                  {
                    int v131 = v172[0];
                    if (__darwin_check_fd_set_overflow(v172[0], v73, 0)) {
                      *(__int32_t *)((char *)v73->fds_bits + (((unint64_t)v131 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v131;
                    }
                    unint64_t v132 = dword_10000C010;
                    if ((dword_10000C010 & 0x80000000) == 0 && __darwin_check_fd_set_overflow(dword_10000C010, v73, 0)) {
                      *(__int32_t *)((char *)v73->fds_bits + ((v132 >> 3) & 0x1FFFFFFC)) |= 1 << v132;
                    }
                    unint64_t v133 = dword_10000C014;
                    if ((dword_10000C014 & 0x80000000) == 0 && __darwin_check_fd_set_overflow(dword_10000C014, v73, 0)) {
                      *(__int32_t *)((char *)v73->fds_bits + ((v133 >> 3) & 0x1FFFFFFC)) |= 1 << v133;
                    }
                  }
                }
                uint64_t v166 = v65;
                LODWORD(v167) = 0;
                for (uint64_t i = v65; ; uint64_t i = v166)
                {
                  uint64_t v98 = i ? (timeval *)&v166 : 0;
                  int v99 = select(v70, v73, 0, 0, v98);
                  if (v99 != -1) {
                    break;
                  }
                  if (*__error() != 4 && *__error() != 35)
                  {
                    syslog(5, "select() failed (%m)");
                    goto LABEL_207;
                  }
                }
                if (!v99)
                {
                  __endptr[0].tv_sec = 0;
                  uint64_t v100 = PFUserCreate();
                  if (!v100
                    || (int v107 = sub_100002E70(v100, (uint64_t *)__endptr, v101, v102, v103, v104, v105, v106),
                        PFUserRelease(),
                        v107 < 0)
                    || __endptr[0].tv_sec == qword_10000CCB8)
                  {
                    syslog(6, "timeout: no data for %ld seconds");
                    goto LABEL_212;
                  }
                  sub_100006228(3, "transfer: server to client %llu packets", v108, v109, v110, v111, v112, v113, __endptr[0].tv_sec);
                  qword_10000CCB8 = __endptr[0].tv_sec;
                }
                unint64_t v114 = dword_10000C00C;
                if ((dword_10000C00C & 0x80000000) == 0
                  && __darwin_check_fd_set_overflow(dword_10000C00C, v73, 0)
                  && ((*(unsigned int *)((char *)v73->fds_bits + ((v114 >> 3) & 0x1FFFFFFC)) >> v114) & 1) != 0)
                {
                  sub_100006228(3, "transfer: client to server", v115, v116, v117, v118, v119, v120, v162);
                  int v121 = sub_1000065E0();
                  if (v121 <= 0)
                  {
                    sub_100003DC4();
                    sub_100003E04();
                    sub_10000371C();
                  }
                  else
                  {
                    LODWORD(qword_10000C038) = qword_10000C038 + v121;
                  }
                }
                unint64_t v134 = dword_10000C014;
                if ((dword_10000C014 & 0x80000000) == 0
                  && __darwin_check_fd_set_overflow(dword_10000C014, v73, 0)
                  && ((*(unsigned int *)((char *)v73->fds_bits + ((v134 >> 3) & 0x1FFFFFFC)) >> v134) & 1) != 0)
                {
                  sub_100006228(3, "transfer: server to client", v135, v136, v137, v138, v139, v140, v162);
                  int v141 = sub_1000065E0();
                  if (v141 <= 0)
                  {
                    sub_100003DC4();
                    sub_100003E04();
                    sub_10000371C();
                  }
                  else
                  {
                    HIDWORD(qword_10000C038) += v141;
                  }
                }
                unint64_t v142 = dword_10000C010;
                if ((dword_10000C010 & 0x80000000) == 0
                  && __darwin_check_fd_set_overflow(dword_10000C010, v73, 0)
                  && ((*(unsigned int *)((char *)v73->fds_bits + ((v142 >> 3) & 0x1FFFFFFC)) >> v142) & 1) != 0)
                {
                  *(void *)&v180.sa_len = 0;
                  *(void *)&v180.sa_data[6] = 0;
                  sub_100006228(2, "server listen socket ready", v143, v144, v145, v146, v147, v148, v162);
                  sub_100003E04();
                  sub_100003DC4();
                  socklen_t v179 = 16;
                  dword_10000C014 = accept(dword_10000C010, &v180, &v179);
                  if (dword_10000C014 < 0) {
                    goto LABEL_213;
                  }
                  close(dword_10000C010);
                  dword_10000C010 = -1;
                  if (getuid())
                  {
                    *(_DWORD *)&v180.sa_data[2] = dword_10000C0A8;
                    int v149 = sub_100006860(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&v180);
                    dword_10000C00C = v149;
                    if (v149 < 0) {
                      goto LABEL_214;
                    }
                  }
                  else
                  {
                    dword_10000C00C = socket(2, 1, 0);
                    socklen_t v179 = 1;
                    v180.sa_family = 2;
                    *(_DWORD *)&v180.sa_data[2] = dword_10000C0A8;
                    *(_WORD *)v180.sa_data = 5120;
                    if (setsockopt(dword_10000C00C, 0xFFFF, 4, &v179, 4u) == -1)
                    {
                      syslog(5, "setsockopt() failed (%m)");
                      goto LABEL_207;
                    }
                    if (bind(dword_10000C00C, &v180, 0x10u) == -1)
                    {
                      syslog(5, "data channel bind() failed (%m)");
LABEL_207:
                      sub_100003E44(71, v33, v34, v35, v36, v37, v38, v39);
                    }
                    int v149 = dword_10000C00C;
                  }
                  if (connect(v149, (const sockaddr *)&unk_10000C050, 0x10u))
                  {
                    syslog(6, "cannot connect data channel (%m)");
                    goto LABEL_69;
                  }
                  qword_10000C038 = 0;
                  __endptr[0].tv_sec = 0;
                  *(void *)&__endptr[0].tv_usec = 0;
                  gettimeofday(__endptr, 0);
                  *(double *)&qword_10000C030 = (double)__endptr[0].tv_usec / 1000000.0 + (double)__endptr[0].tv_sec;
                }
                unint64_t v150 = dword_10000C008;
                if ((dword_10000C008 & 0x80000000) == 0
                  && __darwin_check_fd_set_overflow(dword_10000C008, v73, 0)
                  && ((*(unsigned int *)((char *)v73->fds_bits + ((v150 >> 3) & 0x1FFFFFFC)) >> v150) & 1) != 0)
                {
                  *(void *)&v180.sa_len = 0;
                  *(void *)&v180.sa_data[6] = 0;
                  sub_100006228(2, "client listen socket ready", v151, v152, v153, v154, v155, v156, v162);
                  sub_100003E04();
                  sub_100003DC4();
                  socklen_t v179 = 16;
                  dword_10000C00C = accept(dword_10000C008, &v180, &v179);
                  if (dword_10000C00C < 0)
                  {
LABEL_213:
                    syslog(5, "accept() failed (%m)");
                    goto LABEL_207;
                  }
                  close(dword_10000C008);
                  dword_10000C008 = -1;
                  *(void *)&v180.sa_len = 0;
                  *(void *)&v180.sa_data[6] = 0;
                  int v157 = sub_100006860(1, dword_10000C000, dword_10000C004, -1, 1, (uint64_t)&v180);
                  dword_10000C014 = v157;
                  if (v157 < 0)
                  {
LABEL_214:
                    syslog(5, "get_backchannel_socket() failed (%m)");
                    goto LABEL_207;
                  }
                  if (connect(v157, (const sockaddr *)&qword_10000C040, 0x10u))
                  {
                    syslog(5, "connect() failed (%m)", v163, v164);
LABEL_69:
                    sub_100003E44(68, v47, v48, v49, v50, v51, v52, v53);
                  }
                  qword_10000C038 = 0;
                  __endptr[0].tv_sec = 0;
                  *(void *)&__endptr[0].tv_usec = 0;
                  gettimeofday(__endptr, 0);
                  *(double *)&qword_10000C030 = (double)__endptr[0].tv_usec / 1000000.0 + (double)__endptr[0].tv_sec;
                }
                if ((_BYTE)v178)
                {
                  int v158 = v176[0];
                  if (__darwin_check_fd_set_overflow(v176[0], v73, 0))
                  {
                    if (((*(unsigned int *)((char *)v73->fds_bits
                                           + (((unint64_t)v158 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v158) & 1) != 0)
                      BYTE2(v178) = 1;
                  }
                }
                if ((_BYTE)v175)
                {
                  int v159 = v172[0];
                  if (__darwin_check_fd_set_overflow(v172[0], v73, 0))
                  {
                    if (((*(unsigned int *)((char *)v73->fds_bits
                                           + (((unint64_t)v159 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v159) & 1) != 0)
                      BYTE2(v175) = 1;
                  }
                }
LABEL_198:
                free(v73);
                if (BYTE1(v178))
                {
                  shutdown(v172[0], 1);
                  shutdown(v176[0], 0);
                  LOWORD(v178) = 0;
                }
                if (BYTE1(v175))
                {
                  shutdown(v176[0], 1);
                  shutdown(v172[0], 0);
                  int v64 = 0;
                  LOWORD(v175) = 0;
                }
                else
                {
                  int v64 = v175;
                }
                int v63 = v178;
                if (!(v178 | v64)) {
                  goto LABEL_210;
                }
              }
            }
            char v54 = "name resolution failure (local)";
          }
          else
          {
            char v54 = "name resolution failure (server)";
          }
        }
        else
        {
          char v54 = "name resolution failure (client)";
        }
        sub_100006228(2, v54, v25, v26, v27, v28, v29, v30, v161);
        goto LABEL_207;
    }
  }
}

void sub_100005CD8()
{
  syslog(5, "usage: %s -i [-AnrVw] [-a address] [-D debuglevel] [-g group] [-M maxport] [-m minport] [-R address[:port]] [-S address] [-t timeout] [-u user]", __progname);
  syslog(5, "usage: %s -p [-AnrVw] [-a address] [-D debuglevel] [-g group] [-M maxport] [-m minport] [-R address[:port]] [-S address] [-t timeout] [-u user]", __progname);
  sub_100003E44(64, v0, v1, v2, v3, v4, v5, v6);
}

void sub_100005D2C(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006228(1, "exiting on signal %d\n", a3, a4, a5, a6, a7, a8, a1);
  sub_100005D5C(v8, v9, v10, v11, v12, v13, v14, v15);
  sub_100003E44(0, v16, v17, v18, v19, v20, v21, v22);
}

void sub_100005D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006228(1, "pf: remove rulesets", a3, a4, a5, a6, a7, a8, v12);
  if (qword_10000C078 && PFUserCreate())
  {
    uint64_t v8 = (uint64_t *)qword_10000C078;
    if (qword_10000C078)
    {
      do
      {
        uint64_t v9 = (uint64_t *)*v8;
        if (v8[1]) {
          PFUserDeleteRule();
        }
        uint64_t v10 = (uint64_t *)qword_10000C078;
        if ((uint64_t *)qword_10000C078 == v8)
        {
          uint64_t v11 = &qword_10000C078;
        }
        else
        {
          do
          {
            uint64_t v11 = v10;
            uint64_t v10 = (uint64_t *)*v10;
          }
          while (v10 != v8);
        }
        *uint64_t v11 = *v8;
        free(v8);
        uint64_t v8 = v9;
      }
      while (v9);
    }
    PFUserRelease();
  }
}

uint64_t sub_100005E54(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 82) || *(unsigned char *)(a1 + 81)) {
    return 0;
  }
  int v3 = *(_DWORD *)(a1 + 12);
  uint64_t v4 = *(int *)(a1 + 16);
  if (v3 <= (int)v4)
  {
    if (v3 != v4)
    {
      syslog(3, "next_byte(%d) > io_buffer_len(%d)", *(_DWORD *)(a1 + 16), v3);
      exit(71);
    }
    int v5 = 0;
  }
  else
  {
    int v5 = v3 - v4;
    memmove(*(void **)(a1 + 24), (const void *)(*(void *)(a1 + 24) + v4), v3 - (int)v4);
  }
  *(_DWORD *)(a1 + 12) = v5;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v6 = *(int *)(a1 + 8);
  int v7 = v6 - v5;
  if ((int)v6 - v5 <= 128)
  {
    *(_DWORD *)(a1 + 8) = v6 + 128;
    uint64_t v8 = malloc_type_realloc(*(void **)(a1 + 24), v6 + 128, 0x7618E8B3uLL);
    if (!v8)
    {
      syslog(6, "Insufficient memory");
      exit(69);
    }
    *(void *)(a1 + 24) = v8;
    int v5 = *(_DWORD *)(a1 + 12);
    int v7 = *(_DWORD *)(a1 + 8) - v5;
  }
  size_t v9 = v7 - 1;
  while (1)
  {
    ssize_t v10 = read(*(_DWORD *)a1, (void *)(*(void *)(a1 + 24) + v5), v9);
    *(unsigned char *)(a1 + 82) = 0;
    if (v10 != -1) {
      break;
    }
    if (*__error() != 35 && *__error() != 4)
    {
      if (*__error() != 54)
      {
        syslog(6, "read() failed on socket from %s (%m)", *(const char **)(a1 + 72));
        exit(65);
      }
      goto LABEL_19;
    }
    int v5 = *(_DWORD *)(a1 + 12);
  }
  if (v10)
  {
    *(_DWORD *)(a1 + 12) += v10;
    return 1;
  }
LABEL_19:
  uint64_t result = 0;
  *(unsigned char *)(a1 + 81) = 1;
  return result;
}

uint64_t sub_100005FE4(uint64_t a1, int *a2)
{
  **(unsigned char **)(a1 + 32) = 0;
  int v4 = *(_DWORD *)(a1 + 16);
  if (v4 == *(_DWORD *)(a1 + 12))
  {
    uint64_t result = sub_100005E54(a1);
    if (!result) {
      return result;
    }
    int v4 = *(_DWORD *)(a1 + 16);
  }
  uint64_t v6 = *(void *)(a1 + 24);
  int v7 = *(_DWORD *)(a1 + 12);
  if (*(unsigned __int8 *)(v6 + v4) == 255)
  {
    if (v7 - v4 <= 2)
    {
      uint64_t result = sub_100005E54(a1);
      if (!result) {
        return result;
      }
      int v4 = *(_DWORD *)(a1 + 16);
      if (*(_DWORD *)(a1 + 12) - v4 < 3) {
        return 0;
      }
      uint64_t v6 = *(void *)(a1 + 24);
    }
    uint64_t v16 = v4 + 2;
    *(_DWORD *)(a1 + 16) = v16;
    char v17 = *(unsigned char *)(v6 + v4 + 1);
    if ((v17 + 5) <= 3u)
    {
      v18[0] = -1;
      v18[1] = v17;
      *(_DWORD *)(a1 + 16) = v4 + 3;
      v18[2] = *(unsigned char *)(v6 + v16);
      send(*a2, v18, 3uLL, a2[21]);
    }
    return 1;
  }
  uint64_t v8 = v4;
  int v9 = v4;
  if (v7 > v4)
  {
    ssize_t v10 = (unsigned __int8 *)(v6 + v4);
    int v9 = v4;
    while (1)
    {
      int v12 = *v10++;
      int v11 = v12;
      if (v12 == 10) {
        break;
      }
      if (!v11)
      {
        syslog(6, "got NUL byte from %s - bye!", *(const char **)(a1 + 72));
        exit(65);
      }
      if (v7 == ++v9) {
        goto LABEL_12;
      }
    }
  }
  if (v9 != v7)
  {
    int v13 = v9 - v4;
    uint64_t v14 = *(void **)(a1 + 32);
    if (v9 - v4 > *(_DWORD *)(a1 + 4) - 5)
    {
      *(_DWORD *)(a1 + 4) = v13 + 256;
      uint64_t v14 = malloc_type_realloc(v14, v13 + 256, 0x8009A96uLL);
      if (!v14)
      {
        syslog(6, "Insufficient memory");
        exit(69);
      }
      *(void *)(a1 + 32) = v14;
      int v4 = *(_DWORD *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      uint64_t v8 = v4;
    }
    int v15 = v9 - v4 + 1;
    memcpy(v14, (const void *)(v6 + v8), v15);
    *(_DWORD *)(a1 + 16) += v15;
    *(unsigned char *)(*(void *)(a1 + 32) + v15) = 0;
    return 1;
  }
LABEL_12:

  return sub_100005E54(a1);
}

void sub_100006228(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (dword_10000CCB0 >= a1) {
    vsyslog(7, a2, &a9);
  }
}

uint64_t sub_100006268(int a1, uint64_t a2, uint64_t a3, sockaddr *a4)
{
  socklen_t v18 = 16;
  if (getsockname(a1, a4, &v18))
  {
    uint64_t v8 = "getsockname() failed (%m)";
LABEL_5:
    int v9 = 3;
    goto LABEL_6;
  }
  socklen_t v18 = 16;
  if (getpeername(a1, (sockaddr *)a3, &v18))
  {
    uint64_t v8 = "getpeername() failed (%m)";
    goto LABEL_5;
  }
  if (dword_10000C060) {
    return 0;
  }
  if (PFUserCreate())
  {
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    if (!v11 || !v12 || (uint64_t v14 = v13) == 0)
    {
      syslog(6, "xpc_dictionary_create failed");
      PFUserRelease();
      return 0xFFFFFFFFLL;
    }
    xpc_dictionary_set_uint64(v11, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v11, kPFProtocol, 6uLL);
    xpc_dictionary_set_uint64(v11, kPFDirection, 2uLL);
    *(_OWORD *)string = 0u;
    memset(v20, 0, sizeof(v20));
    inet_ntop(2, (const void *)(a3 + 4), string, 0x2Eu);
    xpc_dictionary_set_string(v12, kPFSubAddress, string);
    xpc_dictionary_set_uint64(v12, kPFSubLowPort, bswap32(*(unsigned __int16 *)(a3 + 2)) >> 16);
    xpc_dictionary_set_uint64(v12, kPFSubPortOperator, 0);
    *(_OWORD *)string = 0u;
    memset(v20, 0, sizeof(v20));
    inet_ntop(2, &a4->sa_data[2], string, 0x2Eu);
    xpc_dictionary_set_string(v14, kPFSubAddress, string);
    xpc_dictionary_set_uint64(v14, kPFSubLowPort, bswap32(*(unsigned __int16 *)a4->sa_data) >> 16);
    xpc_dictionary_set_uint64(v14, kPFSubPortOperator, 0);
    xpc_dictionary_set_value(v11, kPFFrom, v12);
    xpc_dictionary_set_value(v11, kPFTo, v14);
    int v15 = (void *)PFUserNATLook_S();
    xpc_release(v14);
    xpc_release(v12);
    xpc_release(v11);
    PFUserRelease();
    if (v15)
    {
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      xpc_object_t value = xpc_dictionary_get_value(v15, kPFNATDest);
      *(_WORD *)(a2 + 2) = bswap32(xpc_dictionary_get_uint64(value, kPFSubLowPort)) >> 16;
      char v17 = xpc_dictionary_get_string(value, kPFSubAddress);
      inet_pton(2, v17, (void *)(a2 + 4));
      xpc_release(v15);
      uint64_t result = 0;
      *(_WORD *)a2 = 528;
      return result;
    }
    uint64_t v8 = "PFUserNATLook failed";
  }
  else
  {
    uint64_t v8 = "pf user create failed";
  }
  int v9 = 6;
LABEL_6:
  syslog(v9, v8);
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000065E0()
{
  uint64_t v0 = __chkstk_darwin();
  int v2 = v1;
  int v4 = v3;
  uint64_t v5 = v0;
  int v33 = 0;
  if (ioctl(v3, 0x40047307uLL) < 0)
  {
    int v15 = *__error();
    uint64_t v31 = v5;
    uint64_t v16 = "cannot ioctl(SIOCATMARK) socket from %s (%m)";
LABEL_16:
    int v17 = 3;
LABEL_29:
    syslog(v17, v16, v31, v32);
    *__error() = v15;
    return 0xFFFFFFFFLL;
  }
  BOOL v6 = v33 != 0;
  while (1)
  {
    ssize_t v7 = recv(v4, v34, 0x1000uLL, v6);
    ssize_t v14 = v7;
    if (!v6 || v7 != -1) {
      break;
    }
    if (*__error() == 22)
    {
      ssize_t v14 = recv(v4, v34, 0x1000uLL, 0);
      BOOL v6 = 0;
      break;
    }
    BOOL v6 = 1;
LABEL_10:
    if (*__error() != 35 && *__error() != 4)
    {
      int v15 = *__error();
      uint64_t v31 = v5;
      BOOL v32 = v6;
      uint64_t v16 = "xfer_data (%s): failed (%m) with flags 0%o";
      goto LABEL_16;
    }
  }
  if (v14 == -1) {
    goto LABEL_10;
  }
  if (!v14)
  {
    sub_100006228(3, "EOF on read socket", v8, v9, v10, v11, v12, v13, (char)&v33);
    return 0;
  }
  sub_100006228(3, "got %d bytes from socket", v8, v9, v10, v11, v12, v13, v14);
  if (v14 < 1) {
    return 0;
  }
  uint64_t v18 = 0;
  LODWORD(v19) = 0;
  do
  {
    uint64_t v20 = &v34[v18];
    size_t v21 = v14 - v18;
    while (1)
    {
      while (1)
      {
        ssize_t v22 = send(v2, v20, v21, v6);
        if (v22 != -1) {
          break;
        }
        if (*__error() != 35 && *__error() != 4)
        {
          int v15 = *__error();
          uint64_t v16 = "write failed (%m)";
          int v17 = 6;
          goto LABEL_29;
        }
      }
      int v29 = v22;
      if (v22) {
        break;
      }
      sub_100006228(3, "zero-length write", v23, v24, v25, v26, v27, v28, v31);
    }
    sub_100006228(3, "wrote %d bytes to socket", v23, v24, v25, v26, v27, v28, v22);
    uint64_t v19 = (v19 + v29);
    uint64_t v18 = (int)v19;
  }
  while (v14 > (int)v19);
  return v19;
}

uint64_t sub_100006860(int a1, signed int a2, signed int a3, signed int a4, int a5, uint64_t a6)
{
  if (a5 == -1) {
    int v6 = -1;
  }
  else {
    int v6 = 1;
  }
  unsigned int v7 = a3 - a2;
  if (a3 < a2) {
    goto LABEL_11;
  }
  signed int v9 = a4;
  if (a4 == -1) {
    signed int v9 = arc4random() % (v7 + 1) + a2;
  }
  if (v9 < a2 || v9 > a3)
  {
LABEL_11:
    uint64_t v19 = __error();
    int v20 = 22;
LABEL_12:
    int *v19 = v20;
    return 0xFFFFFFFFLL;
  }
  *(void *)__s1 = 0;
  uint64_t v58 = 0;
  uint64_t v55 = 0;
  if (!_NETRBClientCreate())
  {
    char v23 = strerror(12);
    sub_100006228(1, "_NETRBClientCreate: %s\n", v24, v25, v26, v27, v28, v29, v23);
    *__error() = 22;
    char v52 = strerror(12);
    sub_100006228(1, "unable to attach to server: %s\n", v30, v31, v32, v33, v34, v35, v52);
    return 0xFFFFFFFFLL;
  }
  sub_100006228(1, "_NETRBClientCreate: %s\n", v13, v14, v15, v16, v17, v18, (char)"OK");
  _NETRBClientGetExtName();
  sub_100006228(1, "unable to get external interface used by MIS", v36, v37, v38, v39, v40, v41, v53);
  _NETRBClientDestroy();
  if (v7 > 0x7FFFFFFE)
  {
LABEL_32:
    uint64_t v19 = __error();
    int v20 = 35;
    goto LABEL_12;
  }
  unsigned int v42 = v7 + 1;
  while (1)
  {
    *(void *)&v56.sa_len = 0;
    *(void *)&v56.sa_data[6] = 0;
    int v54 = 0;
    uint64_t v43 = socket(2, a1, 0);
    uint64_t v21 = v43;
    *(void *)&v56.sa_len = 512;
    *(void *)&v56.sa_data[6] = 0;
    int v44 = dword_10000C020;
    if (dword_10000C020 == -1)
    {
      if (!a6) {
        goto LABEL_22;
      }
      int v44 = *(_DWORD *)(a6 + 4);
    }
    *(_DWORD *)&v56.sa_data[2] = v44;
LABEL_22:
    int v54 = 1;
    if (setsockopt(v43, 0xFFFF, 4, &v54, 4u) == -1)
    {
      sub_100006228(1, "failed to set SO_REUSEADDR %s(%d)", v45, v46, v47, v48, v49, v50, (char)__s1);
      return 0xFFFFFFFFLL;
    }
    *(_WORD *)v56.sa_data = bswap32(v9) >> 16;
    if (!bind(v21, &v56, 0x10u)) {
      break;
    }
    if (*__error() != 48) {
      return 0xFFFFFFFFLL;
    }
    close(v21);
    if (v9 + v6 <= a3) {
      signed int v51 = v9 + v6;
    }
    else {
      signed int v51 = a2;
    }
    if (v9 + v6 >= a2) {
      signed int v9 = v51;
    }
    else {
      signed int v9 = a3;
    }
    if ((int)--v42 <= 0) {
      goto LABEL_32;
    }
  }
  if (a6) {
    *(sockaddr *)a6 = v56;
  }
  return v21;
}

uint64_t PFUserCopyRules_S()
{
  return _PFUserCopyRules_S();
}

uint64_t PFUserCreate()
{
  return _PFUserCreate();
}

uint64_t PFUserDeleteRule()
{
  return _PFUserDeleteRule();
}

uint64_t PFUserInsertRule_S()
{
  return _PFUserInsertRule_S();
}

uint64_t PFUserNATLook_S()
{
  return _PFUserNATLook_S();
}

uint64_t PFUserRelease()
{
  return _PFUserRelease();
}

uint64_t _NETRBClientCreate()
{
  return __NETRBClientCreate();
}

uint64_t _NETRBClientDestroy()
{
  return __NETRBClientDestroy();
}

uint64_t _NETRBClientGetExtName()
{
  return __NETRBClientGetExtName();
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return ___darwin_check_fd_set_overflow(a1, a2, a3);
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

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

uint32_t arc4random(void)
{
  return _arc4random();
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return _getnameinfo(a1, a2, a3, a4, a5, a6, a7);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getpeername(a1, a2, a3);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getsockname(a1, a2, a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

uid_t getuid(void)
{
  return _getuid();
}

unsigned int if_nametoindex(const char *a1)
{
  return _if_nametoindex(a1);
}

in_addr_t inet_addr(const char *a1)
{
  return _inet_addr(a1);
}

int inet_aton(const char *a1, in_addr *a2)
{
  return _inet_aton(a1, a2);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return _inet_ntoa(a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void openlog(const char *a1, int a2, int a3)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

void sandbox_free_error(char *errorbuf)
{
}

int sandbox_init(const char *profile, uint64_t flags, char **errorbuf)
{
  return _sandbox_init(profile, flags, errorbuf);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

int setlinebuf(FILE *a1)
{
  return _setlinebuf(a1);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int shutdown(int a1, int a2)
{
  return _shutdown(a1, a2);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

void syslog(int a1, const char *a2, ...)
{
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

void warn(const char *a1, ...)
{
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
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

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
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

void xpc_release(xpc_object_t object)
{
}