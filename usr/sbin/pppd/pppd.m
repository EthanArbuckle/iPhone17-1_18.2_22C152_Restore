uint64_t sub_1000027E0(const char **a1)
{
  char *v1;
  const char *v2;
  uid_t v3;
  FILE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  size_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22[256];
  char __s[256];

  byte_10004799D = 1;
  v1 = strdup(*a1);
  if (!v1) {
    novm();
  }
  v2 = v1;
  v3 = getuid();
  seteuid(v3);
  v4 = fopen(v2, "r");
  seteuid(0);
  if (!v4)
  {
    option_error("unable to open user login data file %s", v5, v6, v7, v8, v9, v10, v11, (int)v2);
    return 0;
  }
  sub_1000050AC(v4, (int)v2);
  qword_10004A200 = (uint64_t)v2;
  if (!fgets(__s, 255, v4) || !fgets(v22, 255, v4))
  {
    fclose(v4);
    option_error("unable to read user login data file %s", v15, v16, v17, v18, v19, v20, v21, (int)v2);
    return 0;
  }
  fclose(v4);
  v12 = strlen(__s);
  if (v12 && __s[v12 - 1] == 10) {
    __s[v12 - 1] = 0;
  }
  v13 = strlen(v22);
  if (v13 && v22[v13 - 1] == 10) {
    v22[v13 - 1] = 0;
  }
  if (override_value("user", option_priority, (uint64_t)v2)) {
    __strlcpy_chk();
  }
  if (override_value("passwd", option_priority, (uint64_t)v2)) {
    __strlcpy_chk();
  }
  return 1;
}

uint64_t sub_1000029BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  option_error("no keychain support", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 1;
}

uint64_t sub_1000029E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  option_error("no keychain support", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 1;
}

uint64_t sub_100002A04(const char **a1)
{
  v2 = getgrnam(*a1);
  if (v2)
  {
    uint64_t v10 = ngroups;
    if (ngroups < 1)
    {
      return 1;
    }
    else
    {
      v11 = &groups;
      while (1)
      {
        int v12 = *v11++;
        if (v12 == v2->gr_gid) {
          break;
        }
        if (!--v10) {
          return 1;
        }
      }
      uint64_t result = 1;
      privileged = 1;
    }
  }
  else
  {
    option_error("group %s is unknown", v3, v4, v5, v6, v7, v8, v9, (int)*a1);
    return 0;
  }
  return result;
}

uint64_t sub_100002AA0(const char **a1)
{
  v1 = *a1;
  size_t v2 = strlen(*a1);
  uint64_t v3 = malloc_type_malloc(v2 + 17, 0x30F39F66uLL);
  if (!v3) {
    novm();
  }
  uint64_t v4 = v3;
  uint64_t v5 = v3 + 2;
  *uint64_t v4 = qword_10004A220;
  v4[1] = v5;
  memcpy(v5, v1, v2 + 1);
  qword_10004A220 = (uint64_t)v4;
  return 1;
}

uint64_t sub_100002B1C(const char **a1)
{
  v1 = *a1;
  size_t v2 = strlen(*a1);
  uint64_t v3 = malloc_type_malloc(v2 + 17, 0x98B3DBFEuLL);
  if (!v3) {
    novm();
  }
  uint64_t v4 = v3;
  uint64_t v5 = v3 + 2;
  *uint64_t v4 = qword_10004A240;
  v4[1] = v5;
  memcpy(v5, v1, v2 + 1);
  qword_10004A240 = (uint64_t)v4;
  return 1;
}

void link_terminated()
{
  if (phase)
  {
    if (pap_logout_hook)
    {
      pap_logout_hook();
    }
    else if (byte_10004A208 == 1)
    {
      if (devnam ^ 0x7665642F | byte_100048CEC ^ 0x2F) {
        v0 = (const char *)&devnam;
      }
      else {
        v0 = (const char *)&unk_100048CED;
      }
      bzero(&v9, 0x280uLL);
      v9.ut_type = -16376;
      strncpy(v9.ut_line, v0, 0x20uLL);
      pututxline(&v9);
      byte_10004A208 = 0;
    }
    new_phase(0);
    notice((uint64_t)"Connection terminated.", v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

uint64_t link_down(uint64_t a1)
{
  uint64_t result = (uint64_t)notify((uint64_t **)link_down_notifier, 0);
  byte_10004A20C = 0;
  if (byte_10004A210 == 1 && dword_10004A214 == 0)
  {
    update_link_stats(a1);
    byte_10004A210 = 0;
    uint64_t result = sub_100002DD8("/etc/ppp/auth-down");
  }
  uint64_t v4 = protocols;
  if (protocols)
  {
    uint64_t v5 = (__int16 **)&off_100043898;
    do
    {
      if (*((unsigned char *)v4 + 80))
      {
        unsigned int v6 = (unsigned __int16)*v4;
        if (v6 != 49185)
        {
          uint64_t v7 = (uint64_t (*)(uint64_t))*((void *)v4 + 5);
          if (v7)
          {
            uint64_t result = v7(a1);
            unsigned int v6 = (unsigned __int16)*v4;
          }
          if (v6 >> 14 <= 2)
          {
            int v8 = (uint64_t (*)(uint64_t, const char *))*((void *)v4 + 7);
            if (v8) {
              uint64_t result = v8(a1, "LCP down");
            }
          }
        }
      }
      utmpx v9 = *v5++;
      uint64_t v4 = v9;
    }
    while (v9);
  }
  dword_10004A218 = 0;
  dword_10004A21C = 0;
  if (phase)
  {
    return new_phase(9);
  }
  return result;
}

uint64_t sub_100002DD8(char *a1)
{
  v6[7] = 0;
  uid_t v2 = getuid();
  uint64_t v3 = getpwuid(v2);
  if (!v3 || (pw_name = v3->pw_name) == 0)
  {
    getuid();
    pw_name = v7;
    slprintf((int)v7, 32, "%d");
  }
  slprintf((int)v8, 32, "%d");
  v6[0] = a1;
  v6[1] = &ifname;
  v6[2] = (char *)&peer_authname;
  v6[3] = pw_name;
  v6[4] = (char *)&devnam;
  v6[5] = v8;
  v6[6] = 0;
  uint64_t result = run_program(a1, v6, 0, (uint64_t)sub_100005A00, 0);
  dword_10004A214 = result;
  return result;
}

void link_established(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  utmpx v9 = protocols;
  if (protocols)
  {
    uint64_t v10 = (__int16 **)&off_100043898;
    do
    {
      if ((unsigned __int16)*v9 != 49185)
      {
        if (*((unsigned char *)v9 + 80))
        {
          v11 = (void (*)(uint64_t))*((void *)v9 + 4);
          if (v11) {
            v11(a1);
          }
        }
      }
      int v12 = *v10++;
      utmpx v9 = v12;
    }
    while (v12);
  }
  int v13 = auth_required;
  if (auth_required) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = qword_10004A220 == 0;
  }
  if (!v14)
  {
    sub_10000326C((void *)a1, 0, 0);
    int v13 = auth_required;
  }
  if (v13
    && !lcp_gotoptions[68 * (int)a1 + 5]
    && !lcp_gotoptions[68 * (int)a1 + 6]
    && !lcp_gotoptions[68 * (int)a1 + 7])
  {
    if (qword_10004A220)
    {
      sub_10000326C((void *)a1, 0, 0);
    }
    else
    {
      if (*((unsigned char *)&lcp_wantoptions + 68 * (int)a1 + 5)) {
        BOOL v37 = uselogin == 0;
      }
      else {
        BOOL v37 = 0;
      }
      if (!v37 || !sub_100003668((void *)a1))
      {
        warning((uint64_t)"peer refused to authenticate: terminating link", a2, a3, a4, a5, a6, a7, a8, v44);
        lcp_close(a1, "peer refused to authenticate", v38, v39, v40, v41, v42, v43);
        *(_DWORD *)status = 11;
        return;
      }
    }
  }
  new_phase(5);
  if (lcp_gotoptions[68 * (int)a1 + 7])
  {
    EapAuthPeer(a1, (uint64_t)&our_name, v16, v17, v18, v19, v20, v21);
    char v22 = 0;
    int v23 = 32;
  }
  else if (lcp_gotoptions[68 * (int)a1 + 6])
  {
    int v24 = lcp_gotoptions[68 * (int)a1 + 24];
    if (v24)
    {
      uint64_t v25 = 129;
    }
    else if ((v24 & 2) != 0)
    {
      uint64_t v25 = 128;
    }
    else
    {
      uint64_t v25 = (v24 << 29 >> 31) & 5;
    }
    chap_auth_peer(a1, (uint64_t)&our_name, v25, v17, v18, v19, v20, v21, v44);
    char v22 = 0;
    int v23 = 8;
  }
  else if (lcp_gotoptions[68 * (int)a1 + 5])
  {
    upap_authpeer(a1);
    char v22 = 0;
    int v23 = 2;
  }
  else
  {
    int v23 = 0;
    char v22 = 1;
  }
  if (lcp_hisoptions[68 * (int)a1 + 7])
  {
    EapAuthWithPeer(a1);
    int v26 = 16;
LABEL_44:
    v23 |= v26;
    dword_10004A22C[(int)a1] = v23;
    auth_done[(int)a1] = 0;
LABEL_45:
    v36 = (uint64_t **)auth_start_notify;
    notify(v36, v23);
    return;
  }
  if (lcp_hisoptions[68 * (int)a1 + 6])
  {
    int v27 = lcp_hisoptions[68 * (int)a1 + 24];
    if (v27)
    {
      uint64_t v28 = 129;
    }
    else if ((v27 & 2) != 0)
    {
      uint64_t v28 = 128;
    }
    else
    {
      uint64_t v28 = (v27 << 29 >> 31) & 5;
    }
    chap_auth_with_peer(a1, (uint64_t)&user, v28, v17, v18, v19, v20, v21, v44);
    int v26 = 4;
    goto LABEL_44;
  }
  if (lcp_hisoptions[68 * (int)a1 + 5])
  {
    if (!(_BYTE)passwd)
    {
      byte_10004A228 = 1;
      if (!sub_1000037C8((char *)&passwd)) {
        error((uint64_t)"No secret found for PAP login", v29, v30, v31, v32, v33, v34, v35, v44);
      }
    }
    upap_authwithpeer(a1, &user, (const char *)&passwd);
    int v26 = 1;
    goto LABEL_44;
  }
  dword_10004A22C[(int)a1] = v23;
  auth_done[(int)a1] = 0;
  if ((v22 & 1) == 0) {
    goto LABEL_45;
  }

  sub_1000038D8(a1, v15, v16, v17, v18, v19, v20, v21);
}

void *sub_10000326C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  v62 = a2;
  uint64_t v6 = (int)a1;
  uint64_t v7 = (void *)qword_10004A238[(int)a1];
  if (v7) {
    free(v7);
  }
  qword_10004A238[v6] = 0;
  uint64_t result = (void *)qword_10004A248;
  if (qword_10004A248)
  {
    do
    {
      utmpx v9 = (void *)*result;
      free(result);
      uint64_t result = v9;
    }
    while (v9);
  }
  qword_10004A248 = a3;
  for (i = 0; v4; uint64_t v4 = (void *)*v4)
    ++i;
  v11 = (void *)qword_10004A220;
  if (qword_10004A220)
  {
    int v12 = 0;
    do
    {
      ++v12;
      v11 = (void *)*v11;
    }
    while (v11);
  }
  else
  {
    int v12 = 0;
  }
  int v13 = v12 + i;
  if (v13)
  {
    uint64_t result = malloc_type_malloc(12 * (v13 + 1), 0x10000403E1C8BA9uLL);
    if (result)
    {
      BOOL v14 = result;
      v58 = a1;
      uint64_t v59 = v6;
      uint64_t v15 = &v62;
      do
      {
        uint64_t v16 = v15;
        uint64_t v15 = (void *)*v15;
      }
      while (v15);
      *uint64_t v16 = qword_10004A220;
      uint64_t v17 = v62;
      if (v62)
      {
        int v60 = 0;
        int v18 = 0;
        while (1)
        {
          uint64_t v19 = (char *)v17[1];
          if (!strcmp(v19, "-")) {
            goto LABEL_65;
          }
          int v20 = strcmp(v19, "*");
          uint64_t v21 = (_DWORD *)v14 + 3 * v18;
          *uint64_t v21 = 1;
          if (!v20)
          {
            v52 = (char *)v14 + 12 * v18;
            *((_DWORD *)v52 + 1) = 0;
            *((_DWORD *)v52 + 2) = 0;
            ++v18;
            goto LABEL_65;
          }
          if (*v19 == 33)
          {
            *uint64_t v21 = 0;
            ++v19;
          }
          char v22 = strchr(v19, 47);
          int v23 = v22;
          if (v22)
          {
            __endptr = 0;
            int v24 = strtol(v22 + 1, &__endptr, 10);
            uint64_t v31 = "invalid address length %v in auth. address list";
            if ((v24 - 33) < 0xFFFFFFE0
              || ((int v32 = *__endptr, v32 != 43)
                ? (unsigned int v33 = 0)
                : (v33 = ifunit + 1, int v32 = __endptr[1]),
                  uint64_t v31 = "invalid address length syntax: %v",
                  v32))
            {
              warning((uint64_t)v31, (uint64_t)v31, v25, v26, v27, v28, v29, v30, v23 + 1);
              goto LABEL_61;
            }
            *int v23 = 0;
            int v34 = -1 << (32 - v24);
          }
          else
          {
            unsigned int v33 = 0;
            int v34 = -1;
          }
          uint64_t v35 = gethostbyname(v19);
          if (v35 && v35->h_addrtype == 2)
          {
            int v43 = **(_DWORD **)v35->h_addr_list;
            if (v23) {
              goto LABEL_48;
            }
          }
          else
          {
            int v44 = getnetbyname(v19);
            if (!v44 || v44->n_addrtype != 2)
            {
              int v43 = inet_addr(v19);
              if (!v23) {
                goto LABEL_49;
              }
LABEL_48:
              *int v23 = 47;
              goto LABEL_49;
            }
            int v43 = htonl();
            if (v23) {
              goto LABEL_48;
            }
            int v45 = ntohl();
            if (v45 >> 29 == 6) {
              int v46 = -256;
            }
            else {
              int v46 = v34;
            }
            if (v45 >> 30 == 2) {
              int v47 = -65536;
            }
            else {
              int v47 = v46;
            }
            if (v45 < 0) {
              int v34 = v47;
            }
            else {
              int v34 = -16777216;
            }
          }
LABEL_49:
          if (v43 == -1)
          {
            warning((uint64_t)"unknown host %s in auth. address list", v36, v37, v38, v39, v40, v41, v42, v17[1]);
          }
          else
          {
            if (!v33) {
              goto LABEL_53;
            }
            if (v33 < ~v34)
            {
              ntohl();
              int v43 = htonl();
              int v34 = -1;
LABEL_53:
              int v48 = htonl();
              v49 = (char *)v14 + 12 * v18;
              *((_DWORD *)v49 + 1) = v48 & v43;
              *((_DWORD *)v49 + 2) = v48;
              ++v18;
              int v50 = v60;
              if (v60) {
                BOOL v51 = 0;
              }
              else {
                BOOL v51 = v34 == -1;
              }
              if (v51) {
                int v50 = v43;
              }
              int v60 = v50;
              goto LABEL_61;
            }
            warning((uint64_t)"interface unit %d too large for subnet %v", v36, v37, v38, v39, v40, v41, v42, ifunit);
          }
LABEL_61:
          uint64_t v17 = (void *)*v17;
          if (!v17) {
            goto LABEL_65;
          }
        }
      }
      int v60 = 0;
      int v18 = 0;
LABEL_65:
      *uint64_t v16 = 0;
      v53 = (char *)v14 + 12 * v18;
      *(void *)v53 = 0;
      *((_DWORD *)v53 + 2) = 0;
      uint64_t result = v58;
      qword_10004A238[v59] = v14;
      if (v60)
      {
        v54 = (char *)&ipcp_wantoptions + 52 * (int)v59;
        unsigned int v57 = *((_DWORD *)v54 + 8);
        v56 = v54 + 32;
        uint64_t v55 = v57;
        if (!v57 || (uint64_t result = (void *)auth_ip_addr((int)v58, v55), !result))
        {
          _DWORD *v56 = v60;
          if (v18 >= 2) {
            *((unsigned char *)&ipcp_wantoptions + 52 * (int)v59 + 8) = 1;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_100003668(void *a1)
{
  v11 = 0;
  int v12 = 0;
  if (null_auth_hook)
  {
    uint64_t v2 = null_auth_hook(&v12, &v11);
    if ((int)v2 > 0) {
      goto LABEL_11;
    }
  }
  int v12 = 0;
  uint64_t v3 = fopen("/etc/ppp/pap-secrets", "r");
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  sub_1000050AC(v3, (int)"/etc/ppp/pap-secrets");
  BOOL v5 = (int)sub_100005124(v4, (const char *)&unk_100032B9A, &our_name, v13, &v12, &v11, (int)"/etc/ppp/pap-secrets", 0) >= 0
    && v13[0] == 0;
  uint64_t v2 = v5;
  bzero(v13, 0x400uLL);
  fclose(v4);
  if (v2 == 1)
  {
LABEL_11:
    sub_10000326C(a1, v12, (uint64_t)v11);
  }
  else
  {
    utmpx v9 = v11;
    if (v11)
    {
      do
      {
        uint64_t v10 = (void *)*v9;
        free(v9);
        utmpx v9 = v10;
      }
      while (v10);
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  uint64_t v6 = v12;
  if (v12)
  {
    do
    {
      uint64_t v7 = (void *)*v6;
      free(v6);
      uint64_t v6 = v7;
    }
    while (v7);
  }
  return v2;
}

uint64_t sub_1000037C8(char *a1)
{
  if (!pap_passwd_hook || (uint64_t result = pap_passwd_hook(&user, a1), (result & 0x80000000) != 0))
  {
    uint64_t result = (uint64_t)fopen("/etc/ppp/pap-secrets", "r");
    if (result)
    {
      uint64_t v3 = (FILE *)result;
      sub_1000050AC((FILE *)result, (int)"/etc/ppp/pap-secrets");
      if (remote_name) {
        uint64_t v4 = &remote_name;
      }
      else {
        uint64_t v4 = 0;
      }
      int v5 = sub_100005124(v3, &user, v4, __source, 0, 0, (int)"/etc/ppp/pap-secrets", 0);
      fclose(v3);
      if (v5 < 0)
      {
        return 0;
      }
      else
      {
        if (a1) {
          strlcpy(a1, __source, 0x100uLL);
        }
        return 1;
      }
    }
  }
  return result;
}

void sub_1000038D8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((phase - 7) >= 2)
  {
    if (remote_number) {
      notice((uint64_t)"peer from calling number %q authorized", a2, a3, a4, a5, a6, a7, a8, (int)&remote_number);
    }
    if (lcp_gotoptions[68 * a1 + 6] || lcp_gotoptions[68 * a1 + 5] || lcp_gotoptions[68 * a1 + 7])
    {
      notify((uint64_t **)auth_up_notifier, 0);
      byte_10004A20C = 1;
      if ((byte_10004A210 & 1) == 0 && !dword_10004A214)
      {
        byte_10004A210 = 1;
        sub_100002DD8("/etc/ppp/auth-up");
      }
    }
    if (qword_10004A248)
    {
      options_from_list(qword_10004A248, 1);
      uint64_t v10 = (void *)qword_10004A248;
      if (qword_10004A248)
      {
        do
        {
          v11 = (void *)*v10;
          free(v10);
          uint64_t v10 = v11;
        }
        while (v11);
      }
      qword_10004A248 = 0;
    }
    start_networks(a1);
  }
}

BOOL unexpected_network_packet(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = phase;
  if (phase == 5 && (a2 & 0x8000) != 0 && lcp_hisoptions[68 * a1 + 7])
  {
    EapLostSuccess(a1, a2, a3, a4, a5, a6, a7, a8);
    int v8 = phase;
  }
  return v8 < 6;
}

void start_networks(int a1)
{
  uint64_t v2 = new_phase(7);
  uint64_t v10 = protocols;
  if (protocols)
  {
    v11 = (__int16 **)&off_100043898;
    do
    {
      int v12 = (unsigned __int16)*v10;
      if (v12 == 33021 || v12 == 32851)
      {
        if (*((unsigned char *)v10 + 80))
        {
          BOOL v14 = (uint64_t (*)(void))*((void *)v10 + 6);
          if (v14) {
            uint64_t v2 = v14(0);
          }
        }
      }
      uint64_t v15 = *v11++;
      uint64_t v10 = v15;
    }
    while (v15);
  }
  if (!(ecp_gotoptions[8 * a1] | ccp_gotoptions[14 * a1 + 6]))
  {
    continue_networks(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void continue_networks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = protocols;
  if (protocols)
  {
    uint64_t v9 = (__int16 **)&off_100043898;
    do
    {
      int v10 = (unsigned __int16)*v8;
      if ((unsigned __int16)((unsigned __int16)*v8 >> 14) <= 2u && v10 != 32851 && v10 != 33021)
      {
        if (*((unsigned char *)v8 + 80))
        {
          BOOL v14 = (void (*)(void))*((void *)v8 + 6);
          if (v14)
          {
            v14(0);
            ++dword_10004A218;
          }
        }
      }
      int v13 = *v9++;
      uint64_t v8 = v13;
    }
    while (v13);
  }
  if (!dword_10004A218)
  {
    lcp_close(0, "No network protocols running", a3, a4, a5, a6, a7, a8);
  }
}

void check_protocols_ready()
{
  if (dword_10004A218)
  {
    v0 = protocols;
    if (protocols)
    {
      uint64_t v1 = (__int16 **)&off_100043898;
      while (1)
      {
        int v2 = (unsigned __int16)*v0;
        BOOL v3 = (unsigned __int16)((unsigned __int16)*v0 >> 14) > 2u || v2 == 32851;
        BOOL v4 = v3 || v2 == 33021;
        if (!v4 && *((unsigned char *)v0 + 80) && *((void *)v0 + 6))
        {
          int v6 = (*((uint64_t (**)(void))v0 + 19))(0);
          if (v6 != 9 && v6 != 3) {
            break;
          }
        }
        uint64_t v5 = *v1++;
        v0 = v5;
        if (!v5) {
          goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:
      uint64_t v8 = (uint64_t **)protocolsready_notifier;
      notify(v8, 0);
    }
  }
}

void auth_peer_fail(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_DWORD *)status = 11;
}

void auth_peer_success(int a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5 = a5;
  if (acl_hook && !acl_hook(a4, a5))
  {
    lcp_close(a1, "Authorization failed", v10, v11, v12, v13, v14, v15);
    *(_DWORD *)status = 23;
    return;
  }
  v32[0] = a2;
  v32[1] = a3;
  uint64_t v33 = a4;
  uint64_t v34 = v5;
  notify_with_ptr((uint64_t **)auth_peer_success_notify, (uint64_t)v32);
  switch(a2)
  {
    case 49187:
      int v23 = 2;
      break;
    case 49703:
      int v23 = 32;
      break;
    case 49699:
      switch(a3)
      {
        case 129:
          int v23 = 2056;
          break;
        case 128:
          int v23 = 520;
          break;
        case 5:
          int v23 = 136;
          break;
        default:
          int v23 = 8;
          break;
      }
      break;
    default:
      warning((uint64_t)"auth_peer_success: unknown protocol %x", v16, v17, v18, v19, v20, v21, v22, a2);
      return;
  }
  if (v5 >= 0xFF) {
    unsigned int v5 = 255;
  }
  __memcpy_chk();
  peer_authname[v5] = 0;
  script_setenv("PEERNAME", peer_authname);
  auth_done[a1] |= v23;
  BOOL v31 = (dword_10004A22C[a1] & ~v23) == 0;
  dword_10004A22C[a1] &= ~v23;
  if (v31) {
    sub_1000038D8(a1, v24, v25, v26, v27, v28, v29, v30);
  }
}

void auth_withpeer_fail(int a1, int a2)
{
  notify((uint64_t **)auth_withpeer_fail_notify, a2);
  if (byte_10004A228 == 1)
  {
    xmmword_1000495E4 = 0u;
    unk_1000495F4 = 0u;
    xmmword_1000495C4 = 0u;
    unk_1000495D4 = 0u;
    xmmword_1000495A4 = 0u;
    unk_1000495B4 = 0u;
    xmmword_100049584 = 0u;
    unk_100049594 = 0u;
    xmmword_100049564 = 0u;
    unk_100049574 = 0u;
    xmmword_100049544 = 0u;
    unk_100049554 = 0u;
    xmmword_100049524 = 0u;
    unk_100049534 = 0u;
    passwd = 0u;
    unk_100049514 = 0u;
  }
  lcp_close(a1, "Failed to authenticate ourselves to peer", v3, v4, v5, v6, v7, v8);
  *(_DWORD *)status = 19;
}

void auth_withpeer_cancelled(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_10004A228 == 1)
  {
    xmmword_1000495E4 = 0u;
    unk_1000495F4 = 0u;
    xmmword_1000495C4 = 0u;
    unk_1000495D4 = 0u;
    xmmword_1000495A4 = 0u;
    unk_1000495B4 = 0u;
    xmmword_100049584 = 0u;
    unk_100049594 = 0u;
    xmmword_100049564 = 0u;
    unk_100049574 = 0u;
    xmmword_100049544 = 0u;
    unk_100049554 = 0u;
    xmmword_100049524 = 0u;
    unk_100049534 = 0u;
    passwd = 0u;
    unk_100049514 = 0u;
  }
  lcp_close(a1, "User cancelled authentication", a3, a4, a5, a6, a7, a8);
  *(_DWORD *)status = 5;
}

void auth_withpeer_success(int a1, int a2, int a3)
{
  notify((uint64_t **)auth_withpeer_success_notify, a2);
  switch(a2)
  {
    case 49187:
      if (byte_10004A228 == 1)
      {
        xmmword_1000495E4 = 0u;
        unk_1000495F4 = 0u;
        xmmword_1000495C4 = 0u;
        unk_1000495D4 = 0u;
        xmmword_1000495A4 = 0u;
        unk_1000495B4 = 0u;
        xmmword_100049584 = 0u;
        unk_100049594 = 0u;
        xmmword_100049564 = 0u;
        unk_100049574 = 0u;
        xmmword_100049544 = 0u;
        unk_100049554 = 0u;
        xmmword_100049524 = 0u;
        unk_100049534 = 0u;
        passwd = 0u;
        unk_100049514 = 0u;
      }
      int v13 = 1;
      break;
    case 49703:
      int v13 = 16;
      break;
    case 49699:
      switch(a3)
      {
        case 129:
          int v13 = 1028;
          break;
        case 128:
          int v13 = 260;
          break;
        case 5:
          int v13 = 68;
          break;
        default:
          int v13 = 4;
          break;
      }
      break;
    default:
      warning((uint64_t)"auth_withpeer_success: unknown protocol %x", v6, v7, v8, v9, v10, v11, v12, a2);
      int v13 = 0;
      break;
  }
  auth_done[a1] |= v13;
  int v14 = dword_10004A22C[a1] & ~v13;
  dword_10004A22C[a1] = v14;
  if (!v14)
  {
    sub_1000038D8(a1, v6, v7, v8, v9, v10, v11, v12);
  }
}

void option_change_idle()
{
  untimeout((uint64_t)check_idle, 0);
  if (phase == 8)
  {
    int v0 = idle_time_hook ? idle_time_hook(0) : idle_time_limit;
    if (v0 >= 1)
    {
      timeout((int)check_idle);
    }
  }
}

void check_idle()
{
  uint64_t v15 = 0;
  if (get_idle_time(0, (uint64_t)&v15))
  {
    if (idle_time_hook)
    {
      uint64_t v6 = idle_time_hook(&v15);
    }
    else
    {
      if (noidlerecv)
      {
        int v7 = v15;
      }
      else if (noidlesend)
      {
        int v7 = HIDWORD(v15);
      }
      else
      {
        int v7 = v15;
        if (v15 >= HIDWORD(v15)) {
          int v7 = HIDWORD(v15);
        }
      }
      uint64_t v6 = (idle_time_limit - v7);
    }
    if ((int)v6 <= 0)
    {
      notice((uint64_t)"Terminating connection due to lack of activity.", v0, v6, v1, v2, v3, v4, v5, v14);
      lcp_close(0, "Link inactive", v8, v9, v10, v11, v12, v13);
      need_holdoff = 0;
      *(_DWORD *)status = 12;
    }
    else
    {
      timeout((int)check_idle);
    }
  }
}

void np_up()
{
  if (!dword_10004A21C)
  {
    *(_DWORD *)status = 0;
    unsuccess = 0;
    new_phase(8);
    if (idle_time_hook) {
      int v0 = idle_time_hook(0);
    }
    else {
      int v0 = idle_time_limit;
    }
    if (v0 >= 1) {
      timeout((int)check_idle);
    }
    if (maxconnect >= 1) {
      timeout((int)sub_100004380);
    }
    if (updetach) {
      BOOL v1 = nodetach == 0;
    }
    else {
      BOOL v1 = 0;
    }
    if (v1) {
      detach();
    }
  }
  ++dword_10004A21C;

  check_protocols_ready();
}

void sub_100004380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  info((uint64_t)"Connect time expired", a2, a3, a4, a5, a6, a7, a8, v14);
  lcp_close(0, "Connect time expired", v8, v9, v10, v11, v12, v13);
  *(_DWORD *)status = 13;
}

void np_down()
{
  if (!--dword_10004A21C)
  {
    untimeout((uint64_t)check_idle, 0);
    untimeout((uint64_t)sub_100004380, 0);
    if (phase != 9)
    {
      new_phase(7);
    }
  }
}

void np_finished(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_10004A218-- <= 1) {
    lcp_close(0, "No network protocols running", a3, a4, a5, a6, a7, a8);
  }

  check_protocols_ready();
}

void auth_hold()
{
  untimeout((uint64_t)check_idle, 0);

  untimeout((uint64_t)sub_100004380, 0);
}

void auth_cont()
{
  if (idle_time_hook) {
    int v0 = idle_time_hook(0);
  }
  else {
    int v0 = idle_time_limit;
  }
  if (v0 >= 1) {
    timeout((int)check_idle);
  }
  if (maxconnect >= 1)
  {
    timeout((int)sub_100004380);
  }
}

uint64_t auth_check_options(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (our_name) {
    BOOL v8 = usehostname == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    __strlcpy_chk();
  }
  if (!user) {
    __strlcpy_chk();
  }
  if (!(auth_required | allow_any_ip) && have_route_to() && !privileged)
  {
    auth_required = 1;
    byte_10004A230 = 1;
  }
  if (byte_100047928) {
    byte_100047916 = 1;
  }
  if (!auth_required)
  {
    byte_100047928 = 0;
    *(_WORD *)&byte_100047915 = 0;
    byte_100047917 = 0;
    goto LABEL_19;
  }
  allow_any_ip = 0;
  if (!byte_100047916)
  {
    if (byte_100047915)
    {
LABEL_28:
      int v36 = 0;
      goto LABEL_29;
    }
    if (!byte_100047917)
    {
      byte_100047928 = 7;
      *(_WORD *)&byte_100047915 = 257;
      byte_100047917 = 1;
      goto LABEL_28;
    }
LABEL_19:
    int v36 = 0;
    goto LABEL_20;
  }
  int v36 = 0;
  if (!byte_100047915) {
    goto LABEL_21;
  }
LABEL_29:
  if (uselogin || sub_10000481C(&v36)) {
    goto LABEL_34;
  }
  if (byte_100047916)
  {
LABEL_21:
    if (explicit_remote) {
      uint64_t v9 = &remote_name;
    }
    else {
      uint64_t v9 = 0;
    }
    if (sub_100004928(v9, &our_name, 1, &v36) || byte_100047917) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
LABEL_20:
  if (byte_100047917) {
    goto LABEL_21;
  }
LABEL_32:
  if (auth_required && !qword_10004A220)
  {
    if (byte_10004A230 == 1)
    {
      option_error("By default the remote system is required to authenticate itself", a2, a3, a4, a5, a6, a7, a8, (int)v33);
      uint64_t v18 = "(because this system has a default route to the internet)";
    }
    else if (explicit_remote)
    {
      uint64_t v33 = &remote_name;
      uint64_t v18 = "The remote system (%s) is required to authenticate itself";
    }
    else
    {
      uint64_t v18 = "The remote system is required to authenticate itself";
    }
    option_error(v18, a2, a3, a4, a5, a6, a7, a8, (int)v33);
    option_error("but I couldn't find any suitable secret (password) for it to use to do so.", v19, v20, v21, v22, v23, v24, v25, v34);
    if (v36) {
      option_error("(None of the available passwords would let it use an IP address.)", v26, v27, v28, v29, v30, v31, v32, v35);
    }
    exit(1);
  }
LABEL_34:
  uint64_t result = auth_number();
  if (!result)
  {
    warning((uint64_t)"calling number %q is not authorized", v11, v12, v13, v14, v15, v16, v17, (int)&remote_number);
    exit(24);
  }
  return result;
}

FILE *sub_10000481C(_DWORD *a1)
{
  if (pap_check_hook)
  {
    uint64_t result = (FILE *)pap_check_hook();
    if ((result & 0x80000000) == 0) {
      return result;
    }
  }
  uint64_t result = fopen("/etc/ppp/pap-secrets", "r");
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v10 = 0;
  if (explicit_remote) {
    uint64_t v4 = &remote_name;
  }
  else {
    uint64_t v4 = 0;
  }
  int v5 = sub_100005124(result, v4, &our_name, 0, &v10, 0, (int)"/etc/ppp/pap-secrets", 0);
  fclose(v3);
  uint64_t v6 = v10;
  if ((v5 & 0x80000000) == 0)
  {
    if (v10)
    {
      int v7 = (void **)v10;
      while (1)
      {
        int v8 = *(unsigned __int8 *)v7[1];
        if (v8 != 33) {
          break;
        }
        int v7 = (void **)*v7;
        if (!v7) {
          goto LABEL_14;
        }
      }
      if (v8 != 45) {
        goto LABEL_17;
      }
    }
LABEL_14:
    if (a1) {
      *a1 = 1;
    }
  }
  int v5 = -1;
LABEL_17:
  if (v6)
  {
    do
    {
      uint64_t v9 = (void *)*v6;
      free(v6);
      uint64_t v6 = v9;
    }
    while (v9);
  }
  return (FILE *)(v5 >= 0);
}

FILE *sub_100004928(const char *a1, const char *a2, int a3, _DWORD *a4)
{
  if (!chap_check_hook || (uint64_t result = (FILE *)chap_check_hook(), (result & 0x80000000) != 0))
  {
    uint64_t result = fopen("/etc/ppp/chap-secrets", "r");
    if (result)
    {
      uint64_t v9 = result;
      if (a1 && !*a1)
      {
        a1 = 0;
      }
      else if (a2 && !*a2)
      {
        a2 = 0;
      }
      uint64_t v15 = 0;
      int v10 = sub_100005124(result, a1, a2, 0, &v15, 0, (int)"/etc/ppp/chap-secrets", 0);
      fclose(v9);
      uint64_t v11 = v15;
      if (a3 && (v10 & 0x80000000) == 0)
      {
        if (!v15) {
          goto LABEL_19;
        }
        uint64_t v12 = (void **)v15;
        while (1)
        {
          int v13 = *(unsigned __int8 *)v12[1];
          if (v13 != 33) {
            break;
          }
          uint64_t v12 = (void **)*v12;
          if (!v12) {
            goto LABEL_19;
          }
        }
        if (v13 == 45)
        {
LABEL_19:
          if (a4) {
            *a4 = 1;
          }
          int v10 = -1;
        }
      }
      if (v11)
      {
        do
        {
          uint64_t v14 = (void *)*v11;
          free(v11);
          uint64_t v11 = v14;
        }
        while (v14);
      }
      return (FILE *)(v10 >= 0);
    }
  }
  return result;
}

uint64_t auth_number()
{
  uint64_t v0 = qword_10004A240;
  if (qword_10004A240)
  {
    while (1)
    {
      int v1 = strlen(*(const char **)(v0 + 8));
      if (!strncasecmp(*(const char **)(v0 + 8), &remote_number, v1 - (*(unsigned char *)(*(void *)(v0 + 8) + v1 - 1) == 42))) {
        break;
      }
      uint64_t v0 = *(void *)v0;
      if (!v0) {
        return 0;
      }
    }
  }
  return 1;
}

uint64_t auth_reset(uint64_t result)
{
  uint64_t v1 = (int)result;
  if (refuse_pap)
  {
    BOOL v2 = 0;
  }
  else if ((_BYTE)passwd)
  {
    BOOL v2 = 1;
  }
  else
  {
    uint64_t result = sub_1000037C8(0);
    BOOL v2 = result != 0;
  }
  *((unsigned char *)&lcp_allowoptions + 68 * (int)v1 + 5) = v2;
  if (refuse_chap) {
    BOOL v3 = refuse_mschap == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || refuse_mschap_v2 == 0)
  {
    if ((_BYTE)passwd)
    {
      BOOL v5 = 1;
    }
    else
    {
      if (explicit_remote) {
        uint64_t v6 = &remote_name;
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t result = (uint64_t)sub_100004928(&user, v6, 0, 0);
      BOOL v5 = result != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  int v7 = (char *)&lcp_allowoptions + 68 * v1;
  v7[6] = v5;
  v7[7] = refuse_eap == 0;
  int v8 = (char *)&lcp_gotoptions + 68 * v1;
  int v10 = v8[5];
  uint64_t v9 = v8 + 5;
  if (v10) {
    BOOL v11 = uselogin == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    uint64_t result = (uint64_t)sub_10000481C(0);
    if (!result) {
      *uint64_t v9 = 0;
    }
  }
  uint64_t v12 = (char *)&lcp_gotoptions + 68 * (int)v1;
  int v14 = v12[6];
  int v13 = v12 + 6;
  if (v14)
  {
    if (explicit_remote) {
      uint64_t v15 = &remote_name;
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t result = (uint64_t)sub_100004928(v15, &our_name, 1, 0);
    if (!result) {
      *int v13 = 0;
    }
  }
  return result;
}

uint64_t check_passwd(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v66 = 0;
  v67 = 0;
  slprintf((int)__s1, 256, "%.*v");
  slprintf((int)v69, 256, "%.*v");
  *a6 = &unk_100032B9A;
  if (pap_auth_hook)
  {
    int v8 = pap_auth_hook(v69, __s1, a6, &v67, &v66);
    if ((v8 & 0x80000000) == 0)
    {
      int v9 = v8;
      if (v8) {
        sub_10000326C(a1, v67, (uint64_t)v66);
      }
      long long v85 = 0u;
      long long v84 = 0u;
      long long v83 = 0u;
      long long v82 = 0u;
      long long v81 = 0u;
      long long v80 = 0u;
      long long v79 = 0u;
      long long v78 = 0u;
      long long v77 = 0u;
      long long v76 = 0u;
      long long v75 = 0u;
      long long v74 = 0u;
      long long v73 = 0u;
      long long v72 = 0u;
      long long v71 = 0u;
      *(_OWORD *)__s1 = 0u;
      int v10 = v67;
      if (v67)
      {
        do
        {
          BOOL v11 = (void *)*v10;
          free(v10);
          int v10 = v11;
        }
        while (v11);
      }
      uint64_t v12 = v66;
      if (v66)
      {
        do
        {
          int v13 = (void *)*v12;
          free(v12);
          uint64_t v12 = v13;
        }
        while (v13);
      }
      if (v9) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
  v66 = 0;
  v67 = 0;
  uint64_t v15 = fopen("/etc/ppp/pap-secrets", "r");
  if (!v15)
  {
    error((uint64_t)"Can't open PAP password file %s: %m", v16, v17, v18, v19, v20, v21, v22, (int)"/etc/ppp/pap-secrets");
    goto LABEL_36;
  }
  uint64_t v23 = v15;
  sub_1000050AC(v15, (int)"/etc/ppp/pap-secrets");
  if ((sub_100005124(v23, v69, &our_name, __s2, &v67, &v66, (int)"/etc/ppp/pap-secrets", 0) & 0x80000000) != 0)
  {
    warning((uint64_t)"no PAP secret found for %s", v24, v25, v26, v27, v28, v29, v30, (int)v69);
LABEL_34:
    fclose(v23);
    goto LABEL_36;
  }
  BOOL v32 = *(_DWORD *)__s2 != 1735355456 || *(_DWORD *)&__s2[3] != 7235943;
  if (uselogin || !v32)
  {
    uint64_t v41 = getpwnam(v69);
    endpwent();
    if (!v41 || (pw_passwd = v41->pw_passwd) == 0 || strlen(v41->pw_passwd) < 2)
    {
      int v33 = 1;
      goto LABEL_29;
    }
    unsigned int v57 = crypt(__s1, pw_passwd);
    int v33 = 1;
    if (strcmp(v57, v41->pw_passwd)) {
      goto LABEL_29;
    }
    if (devnam ^ 0x7665642F | byte_100048CEC ^ 0x2F) {
      v58 = (const char *)&devnam;
    }
    else {
      v58 = (const char *)&unk_100048CED;
    }
    bzero(&v86, 0x280uLL);
    v86.ut_type = -32762;
    strncpy(v86.ut_line, v58, 0x20uLL);
    pututxline(&v86);
    info((uint64_t)"user %s logged in", v59, v60, v61, v62, v63, v64, v65, (int)v69);
    byte_10004A208 = 1;
  }
  int v33 = 0;
LABEL_29:
  if (__s2[0] && v32 && (cryptpap || strcmp(__s1, __s2)))
  {
    int v43 = crypt(__s1, __s2);
    if (strcmp(v43, __s2)) {
      goto LABEL_34;
    }
  }
  fclose(v23);
  if (!v33)
  {
    dword_10004A234 = 0;
    if (!*(unsigned char *)*a6) {
      *a6 = "Login ok";
    }
    sub_10000326C(a1, v67, (uint64_t)v66);
    uint64_t v14 = 2;
    goto LABEL_45;
  }
LABEL_36:
  if (!*(unsigned char *)*a6) {
    *a6 = "Login incorrect";
  }
  int v44 = dword_10004A234;
  int v45 = ++dword_10004A234;
  if (v44 >= 10)
  {
    warning((uint64_t)"%d LOGIN FAILURES ON %s, %s", v34, v35, v36, v37, v38, v39, v40, v45);
    lcp_close((int)a1, "login failed", v46, v47, v48, v49, v50, v51);
    int v45 = dword_10004A234;
  }
  if (v45 >= 4) {
    sleep(5 * v45 - 15);
  }
  v52 = v66;
  if (v66)
  {
    do
    {
      v53 = (void *)*v52;
      free(v52);
      v52 = v53;
    }
    while (v53);
  }
  uint64_t v14 = 3;
LABEL_45:
  v54 = v67;
  if (v67)
  {
    do
    {
      uint64_t v55 = (void *)*v54;
      free(v54);
      v54 = v55;
    }
    while (v55);
  }
  return v14;
}

void sub_1000050AC(FILE *a1, int a2)
{
  memset(&v12, 0, sizeof(v12));
  int v3 = fileno(a1);
  if (fstat(v3, &v12) < 0)
  {
    BOOL v11 = "cannot stat secret file %s: %m";
  }
  else
  {
    if ((v12.st_mode & 0x3F) == 0) {
      return;
    }
    BOOL v11 = "Warning - secret file %s has world and/or group access";
  }
  warning((uint64_t)v11, v4, v5, v6, v7, v8, v9, v10, a2);
}

uint64_t sub_100005124(FILE *a1, const char *a2, const char *a3, char *a4, void **a5, void *a6, int a7, int a8)
{
  uint64_t v10 = a6;
  uint64_t v59 = 0;
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  if (!getword(a1, (uint64_t)&__s1, (_DWORD *)&v61 + 1, a7)) {
    return 0xFFFFFFFFLL;
  }
  __dst = a4;
  v56 = 0;
  int v16 = 1;
  HIDWORD(v61) = 1;
  uint64_t v17 = 0xFFFFFFFFLL;
  do
  {
    uint64_t v18 = v17;
    do
    {
      while (1)
      {
        do
        {
          while (1)
          {
            if (!v16)
            {
              while (getword(a1, (uint64_t)&__s1, (_DWORD *)&v61 + 1, a7) && !HIDWORD(v61))
                ;
              if (!HIDWORD(v61))
              {
LABEL_61:
                uint64_t v17 = v18;
                goto LABEL_62;
              }
            }
            if (!a2) {
              break;
            }
            int v19 = strcmp(&__s1, a2);
            int v20 = __s1;
            int v21 = v65;
            if (!v19) {
              goto LABEL_18;
            }
            if (__s1 == 42 && !v65)
            {
              int v20 = 42;
              goto LABEL_18;
            }
            int v16 = 0;
            HIDWORD(v61) = 0;
          }
          int v20 = __s1;
          int v21 = v65;
LABEL_18:
          if (v21) {
            BOOL v22 = 0;
          }
          else {
            BOOL v22 = v20 == 42;
          }
          if (v22) {
            uint64_t v17 = 0;
          }
          else {
            uint64_t v17 = 2;
          }
          if (!getword(a1, (uint64_t)&__s1, (_DWORD *)&v61 + 1, a7)) {
            goto LABEL_61;
          }
          int v16 = HIDWORD(v61);
        }
        while (HIDWORD(v61));
        if (__s1 == 42 && !v65) {
          break;
        }
        if (!a3 || !strcmp(&__s1, a3))
        {
          uint64_t v17 = v17 | 1;
          break;
        }
LABEL_46:
        int v16 = HIDWORD(v61);
      }
      if ((int)v17 <= (int)v18) {
        goto LABEL_46;
      }
      if (!getword(a1, (uint64_t)&__s1, (_DWORD *)&v61 + 1, a7)) {
        goto LABEL_61;
      }
      int v16 = HIDWORD(v61);
    }
    while (HIDWORD(v61));
    if (a8)
    {
      uint64_t v23 = strchr(&__s1, 58);
      if (!v23 || !strchr(v23 + 1, 58)) {
        goto LABEL_46;
      }
    }
    int v57 = a8;
    if (!__dst) {
      goto LABEL_49;
    }
    if (__s1 != 64 || v65 != 47) {
      goto LABEL_48;
    }
    uint64_t v24 = v10;
    __strlcpy_chk();
    uint64_t v25 = fopen(__filename, "r");
    if (!v25)
    {
      warning((uint64_t)"can't open indirect secret file %s", v26, v27, v28, v29, v30, v31, v32, (int)__filename);
      goto LABEL_45;
    }
    int v33 = v25;
    sub_1000050AC(v25, (int)__filename);
    if (!getword(v33, (uint64_t)&__s1, &v61, (int)__filename))
    {
      warning((uint64_t)"no secret in indirect secret file %s", v34, v35, v36, v37, v38, v39, v40, (int)__filename);
      fclose(v33);
LABEL_45:
      uint64_t v10 = v24;
      a8 = v57;
      goto LABEL_46;
    }
    fclose(v33);
    uint64_t v10 = v24;
LABEL_48:
    __strlcpy_chk();
LABEL_49:
    uint64_t v55 = v10;
    uint64_t v41 = (void **)&v59;
    if (getword(a1, (uint64_t)&__s1, (_DWORD *)&v61 + 1, a7) && !HIDWORD(v61))
    {
      uint64_t v42 = (void **)&v59;
      do
      {
        size_t v43 = (int)(strlen(&__s1) + 1);
        int v44 = (char *)malloc_type_malloc(v43 + 16, 0x4F3995F4uLL);
        if (!v44) {
          novm();
        }
        uint64_t v41 = (void **)v44;
        int v45 = v44 + 16;
        v41[1] = v45;
        strlcpy(v45, &__s1, v43);
        *uint64_t v42 = v41;
        if (!getword(a1, (uint64_t)&__s1, (_DWORD *)&v61 + 1, a7)) {
          break;
        }
        uint64_t v42 = v41;
      }
      while (!HIDWORD(v61));
    }
    *uint64_t v41 = 0;
    uint64_t v46 = v56;
    if (v56)
    {
      do
      {
        uint64_t v47 = (void *)*v46;
        free(v46);
        uint64_t v46 = v47;
      }
      while (v47);
    }
    v56 = v59;
    uint64_t v60 = v59;
    uint64_t v10 = v55;
    a8 = v57;
    if (__dst) {
      strlcpy(__dst, __source, 0x400uLL);
    }
    int v16 = HIDWORD(v61);
  }
  while (HIDWORD(v61));
LABEL_62:
  uint64_t v48 = &v60;
  do
  {
    uint64_t v49 = v48;
    uint64_t v48 = (void **)*v48;
    if (!v48)
    {
      if (!v10) {
        goto LABEL_73;
      }
      uint64_t v50 = 0;
      goto LABEL_72;
    }
  }
  while (strcmp((const char *)v48[1], "--"));
  uint64_t v50 = *v48;
  free(v48);
  char *v49 = 0;
  if (v10)
  {
LABEL_72:
    *uint64_t v10 = v50;
    goto LABEL_73;
  }
  if (v50)
  {
    do
    {
      uint64_t v51 = (void *)*v50;
      free(v50);
      uint64_t v50 = v51;
    }
    while (v51);
  }
LABEL_73:
  v52 = v60;
  if (a5)
  {
    *a5 = v60;
  }
  else if (v60)
  {
    do
    {
      v53 = (void *)*v52;
      free(v52);
      v52 = v53;
    }
    while (v53);
  }
  return v17;
}

uint64_t get_secret(void *a1, const char *a2, const char *a3, void *a4, int *a5, int a6)
{
  uint64_t v42 = 0;
  size_t v43 = 0;
  if (a6 || !(_BYTE)passwd)
  {
    if (a6 || !chap_passwd_hook)
    {
      size_t v43 = 0;
      __s[0] = 0;
      int v19 = fopen("/etc/ppp/chap-secrets", "r");
      if (v19)
      {
        uint64_t v27 = v19;
        sub_1000050AC(v19, (int)"/etc/ppp/chap-secrets");
        int v28 = sub_100005124(v27, a2, a3, __s, &v43, &v42, (int)"/etc/ppp/chap-secrets", 0);
        fclose(v27);
        if ((v28 & 0x80000000) == 0)
        {
          if (a6)
          {
            sub_10000326C(a1, v43, (uint64_t)v42);
          }
          else
          {
            uint64_t v30 = v42;
            if (v42)
            {
              do
              {
                uint64_t v31 = (void *)*v30;
                free(v30);
                uint64_t v30 = v31;
              }
              while (v31);
            }
          }
          uint64_t v32 = v43;
          if (v43)
          {
            do
            {
              int v33 = (void *)*v32;
              free(v32);
              uint64_t v32 = v33;
            }
            while (v33);
          }
          goto LABEL_18;
        }
      }
      else
      {
        error((uint64_t)"Can't open chap secret file %s: %m", v20, v21, v22, v23, v24, v25, v26, (int)"/etc/ppp/chap-secrets");
      }
    }
    else
    {
      if ((chap_passwd_hook(a2, __s) & 0x80000000) == 0) {
        goto LABEL_18;
      }
      error((uint64_t)"Unable to obtain CHAP password for %s on %s from plugin", v12, v13, v14, v15, v16, v17, v18, (int)a2);
    }
    return 0;
  }
  __strlcpy_chk();
LABEL_18:
  int v41 = strlen(__s);
  if (v41 >= 257)
  {
    error((uint64_t)"Secret for %s on %s is too long", v34, v35, v36, v37, v38, v39, v40, (int)a2);
    int v41 = 256;
  }
  memcpy(a4, __s, v41);
  *a5 = v41;
  return 1;
}

uint64_t get_srp_secret(void *a1, const char *a2, const char *a3, char *__dst, int a5)
{
  if (a5 || !(_BYTE)passwd)
  {
    uint64_t v26 = 0;
    uint64_t v10 = fopen("/etc/ppp/srp-secrets", "r");
    if (v10)
    {
      uint64_t v18 = v10;
      uint64_t v25 = 0;
      sub_1000050AC(v10, (int)"/etc/ppp/srp-secrets");
      char *__dst = 0;
      int v19 = sub_100005124(v18, a2, a3, __dst, &v26, &v25, (int)"/etc/ppp/srp-secrets", a5);
      fclose(v18);
      if ((v19 & 0x80000000) == 0)
      {
        if (a5)
        {
          sub_10000326C(a1, v26, (uint64_t)v25);
        }
        else
        {
          uint64_t v21 = v25;
          if (v25)
          {
            do
            {
              uint64_t v22 = (void *)*v21;
              free(v21);
              uint64_t v21 = v22;
            }
            while (v22);
          }
        }
        uint64_t v23 = v26;
        if (v26)
        {
          do
          {
            uint64_t v24 = (void *)*v23;
            free(v23);
            uint64_t v23 = v24;
          }
          while (v24);
        }
        return 1;
      }
    }
    else
    {
      error((uint64_t)"Can't open srp secret file %s: %m", v11, v12, v13, v14, v15, v16, v17, (int)"/etc/ppp/srp-secrets");
    }
    return 0;
  }
  strlcpy(__dst, (const char *)&passwd, 0x400uLL);
  return 1;
}

uint64_t auth_ip_addr(int a1, uint64_t a2)
{
  unsigned int v4 = ntohl();
  if (v4 >> 28 == 15 || v4 == 2130706433 || (v4 & 0xF0000000) == -536870912) {
    return 0;
  }
  if (!allowed_address_hook || (uint64_t result = allowed_address_hook(a2), (result & 0x80000000) != 0))
  {
    if ((auth_done[a1] & 0x20) == 0 || (uint64_t result = EAPAllowedAddr(), (result & 0x80000000) != 0))
    {
      uint64_t v8 = qword_10004A238[a1];
      if (!v8) {
        goto LABEL_18;
      }
      uint64_t v9 = (_DWORD *)(v8 + 8);
      do
      {
        int v10 = *(v9 - 1);
        int v11 = *v9 & a2;
        v9 += 3;
      }
      while (v11 != v10);
      uint64_t result = *(v9 - 5);
      if ((result & 0x80000000) != 0)
      {
LABEL_18:
        if (!auth_required)
        {
          if (allow_any_ip) {
            BOOL v12 = 0;
          }
          else {
            BOOL v12 = privileged == 0;
          }
          return !v12 || have_route_to() == 0;
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t bad_ip_adrs()
{
  unsigned int v0 = ntohl();
  BOOL v1 = v0 == 2130706433;
  if (v0 >> 28 == 14) {
    BOOL v1 = 1;
  }
  return v0 >> 28 == 15 || v1;
}

uint64_t save_new_password()
{
  return 0;
}

void sub_100005A00()
{
  dword_10004A214 = 0;
  if (byte_10004A210 == 1)
  {
    if (byte_10004A20C) {
      return;
    }
    unsigned int v0 = "/etc/ppp/auth-down";
  }
  else
  {
    if (!byte_10004A20C) {
      return;
    }
    unsigned int v0 = "/etc/ppp/auth-up";
  }
  byte_10004A210 ^= 1u;
  sub_100002DD8(v0);
}

void sub_100005A4C(int a1)
{
  BOOL v2 = (char *)&ccp_fsm + 80 * a1;
  *(_DWORD *)BOOL v2 = a1;
  *((_DWORD *)v2 + 1) = 33021;
  *((void *)v2 + 7) = off_100041E50;
  fsm_init((uint64_t)v2);
  uint64_t v3 = 7 * a1;
  unsigned int v4 = &ccp_wantoptions[v3];
  *(void *)(v4 + 3) = 0;
  *(void *)unsigned int v4 = 0;
  uint64_t v5 = (void *)((char *)&ccp_gotoptions + v3 * 2);
  *uint64_t v5 = 0;
  *(void *)((char *)v5 + 6) = 0;
  uint64_t v6 = &ccp_allowoptions[v3];
  *(void *)(v6 + 3) = 0;
  *(void *)uint64_t v6 = 0;
  uint64_t v7 = (void *)((char *)&ccp_hisoptions + v3 * 2);
  *uint64_t v7 = 0;
  *(void *)((char *)v7 + 6) = 0;
  word_10004764C = 257;
  word_100047668 = 257;
  ccp_wantoptions[0] = 257;
  dword_100047650 = 983055;
  ccp_allowoptions[0] = 257;
  dword_10004766C = 983055;
  byte_100047666 = 1;
}

void sub_100005B14(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = a1;
  int v11 = (char *)&ccp_fsm + 80 * (int)a1;
  BOOL v12 = v11 + 8;
  int v13 = *((_DWORD *)v11 + 2);
  fsm_input((uint64_t)v11, a2, a3, a4, a5, a6, a7, a8, v34);
  if (v13 == 6)
  {
    if (*a2 == 6
      && !ccp_gotoptions[14 * v10 + 1]
      && !ccp_gotoptions[14 * v10]
      && !ccp_gotoptions[14 * v10 + 2]
      && !ccp_gotoptions[14 * v10 + 3]
      && !ccp_gotoptions[14 * v10 + 6])
    {
      sub_100005E10(a1, "No compression negotiated");
    }
  }
  else if (v13 == 9 && *a2 == 5 && *v12 != 9)
  {
    notice((uint64_t)"Compression disabled by peer.", v14, v15, v16, v17, v18, v19, v20, v35);
    if (ccp_gotoptions[14 * v10 + 6])
    {
      error((uint64_t)"MPPE disabled, closing LCP", v21, v22, v23, v24, v25, v26, v27, v36);
      lcp_close(a1, "MPPE disabled by peer", v28, v29, v30, v31, v32, v33);
    }
  }
}

void sub_100005C84(uint64_t a1)
{
  int v1 = a1;
  ccp_flags_set(a1, 0, 0);
  fsm_protreject((uint64_t)&ccp_fsm + 80 * v1, v2, v3, v4, v5, v6, v7, v8);
  if (ccp_gotoptions[14 * v1 + 6])
  {
    error((uint64_t)"MPPE required but peer negotiation failed", v9, v10, v11, v12, v13, v14, v15, v22);
    lcp_close(v1, "MPPE required but peer negotiation failed", v16, v17, v18, v19, v20, v21);
  }
}

void sub_100005D10(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005D24(int a1)
{
}

void sub_100005D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a1;
  uint64_t v9 = (int *)((char *)&ccp_fsm + 80 * (int)a1);
  if (v9[2] != 9) {
    ccp_flags_set(a1, 1, 0);
  }
  sub_10000673C(v9, a2, a3, a4, a5, a6, a7, a8);
  if (!ccp_gotoptions[14 * v8 + 1]
    && !ccp_gotoptions[14 * v8]
    && !ccp_gotoptions[14 * v8 + 2]
    && !ccp_gotoptions[14 * v8 + 3]
    && !ccp_gotoptions[14 * v8 + 6])
  {
    *((_DWORD *)&ccp_fsm + 20 * v8 + 3) |= 4u;
  }

  fsm_open((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
}

void sub_100005E10(uint64_t a1, char *a2)
{
  int v3 = a1;
  ccp_flags_set(a1, 0, 0);

  fsm_close((uint64_t)&ccp_fsm + 80 * v3, a2, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_100005E64(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0;
  }
  unsigned int v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  int v7 = v6 - 4;
  if (v6 < 4 || v6 > a2) {
    return 0;
  }
  int v11 = *a1;
  int v12 = a1[1];
  uint64_t v13 = (v11 - 1);
  if (v13 <= 0xE && (unint64_t)(v13 - 7) >= 6) {
    uint64_t v14 = " %s";
  }
  else {
    uint64_t v14 = " code=0x%x";
  }
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  uint64_t v15 = a1 + 4;
  if (v13 < 4)
  {
    if (v6 >= 6)
    {
      while (1)
      {
        uint64_t v16 = v15[1];
        if (v16 < 2 || v7 < v16) {
          goto LABEL_74;
        }
        int v18 = *v15;
        a3(a4, " <");
        uint64_t v19 = v15;
        switch(v18)
        {
          case 18:
            uint64_t v19 = v15;
            if (v16 >= 6)
            {
              unsigned int v23 = v15[2];
              int v24 = v23 & 1;
              signed __int8 v25 = v15[5];
              if (v15[3]) {
                goto LABEL_40;
              }
              char v26 = (4 * v24) ^ 4;
              if (v25 < 0) {
                v26 |= 8u;
              }
              char v27 = v23 >= 2 ? 64 : v26;
              if (v15[4]) {
LABEL_40:
              }
                char v27 = 64;
              int v28 = v25 & 0xE | v27 & 0x40;
              BOOL v29 = v24 == 0;
              uint64_t v30 = "+H";
              if (v29) {
                uint64_t v30 = "-H";
              }
              uint64_t v31 = "+M";
              if (v25 >= 0) {
                uint64_t v31 = "-M";
              }
              uint64_t v32 = "+S";
              if ((v15[5] & 0x40) == 0) {
                uint64_t v32 = "-S";
              }
              uint64_t v33 = "+L";
              if ((v15[5] & 0x20) == 0) {
                uint64_t v33 = "-L";
              }
              int v34 = "+D";
              if ((v15[5] & 0x10) == 0) {
                int v34 = "-D";
              }
              BOOL v29 = (v25 & 1) == 0;
              int v35 = "+C";
              if (v29) {
                int v35 = "-C";
              }
              int v36 = " +U";
              if (!v28) {
                int v36 = (const char *)&unk_100032B9A;
              }
              ((void (*)(uint64_t, const char *, ...))a3)(a4, "mppe %s %s %s %s %s %s%s", v30, v31, v32, v33, v34, v35, v36);
              if (v28) {
                ((void (*)(uint64_t, const char *, ...))a3)(a4, " (%.2x %.2x %.2x %.2x)", v15[2], v15[3], v15[4], v15[5]);
              }
              uint64_t v19 = v15 + 6;
            }
            goto LABEL_62;
          case 19:
          case 20:
          case 22:
          case 23:
          case 25:
            goto LABEL_62;
          case 21:
            uint64_t v19 = v15;
            if (v16 >= 3)
            {
              ((void (*)(uint64_t, const char *, ...))a3)(a4, "bsd v%d %d", v15[2] >> 5, v15[2] & 0x1F);
              uint64_t v19 = v15 + 3;
            }
            goto LABEL_62;
          case 24:
          case 26:
            uint64_t v19 = v15;
            if (v16 >= 4)
            {
              uint64_t v20 = (const char *)&unk_100032B9A;
              if (v18 == 24) {
                uint64_t v20 = "(old#)";
              }
              ((void (*)(uint64_t, const char *, ...))a3)(a4, "deflate%s %d", v20, (v15[2] >> 4) + 8);
              if ((v15[2] & 0xF) != 8) {
                ((void (*)(uint64_t, const char *, ...))a3)(a4, " method %d", v15[2] & 0xF);
              }
              if (v15[3]) {
                ((void (*)(uint64_t, const char *, ...))a3)(a4, " check %d", v15[3]);
              }
              uint64_t v19 = v15 + 4;
            }
            goto LABEL_62;
          default:
            if (v18 == 1)
            {
              uint64_t v21 = a4;
              int v22 = "predictor 1";
              goto LABEL_61;
            }
            uint64_t v19 = v15;
            if (v18 == 2)
            {
              uint64_t v21 = a4;
              int v22 = "predictor 2";
LABEL_61:
              a3(v21, v22);
              uint64_t v19 = v15 + 2;
            }
LABEL_62:
            if (v19 < &v15[v16])
            {
              uint64_t v37 = &v15[v16];
              int64_t v38 = &v15[v16] - v19;
              do
              {
                int v39 = *v19++;
                ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v39);
                --v38;
              }
              while (v38);
              uint64_t v19 = v37;
            }
            v7 -= v16;
            a3(a4, ">");
            uint64_t v15 = v19;
            if (v7 <= 1) {
              goto LABEL_73;
            }
            break;
        }
      }
    }
LABEL_72:
    uint64_t v19 = a1 + 4;
LABEL_73:
    uint64_t v15 = v19;
    if (v7 < 1) {
      return (v15 - a1);
    }
    goto LABEL_74;
  }
  if ((v11 - 5) >= 2) {
    goto LABEL_72;
  }
  if (v6 >= 5)
  {
    if (*v15 - 32 > 0x5E)
    {
LABEL_74:
      unsigned int v40 = v7 + 1;
      do
      {
        int v41 = *v15++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v41);
        --v40;
      }
      while (v40 > 1);
      return (v15 - a1);
    }
    print_string((char *)a1 + 4, v6 - 4, a3, a4);
    LODWORD(v15) = v15 + v7;
  }
  return (v15 - a1);
}

void sub_100006308(uint64_t a1)
{
  int v1 = (unsigned int *)((char *)&ccp_fsm + 80 * (int)a1);
  if (v1[2] == 9)
  {
    int v3 = a1;
    if (ccp_fatal_error())
    {
      error((uint64_t)"Lost compression sync: disabling compression", v4, v5, v6, v7, v8, v9, v10, v35);
      ccp_flags_set(a1, 0, 0);
      fsm_close((uint64_t)v1, "Lost compression sync", v11, v12, v13, v14, v15, v16);
      if (ccp_gotoptions[14 * v3 + 6])
      {
        error((uint64_t)"Too many MPPE errors, closing LCP", v17, v18, v19, v20, v21, v22, v23, v36);
        lcp_close(a1, "Too many MPPE errors", v24, v25, v26, v27, v28, v29);
      }
    }
    else
    {
      uint64_t v30 = (int)*v1;
      int v31 = dword_10004A2A4[v30];
      if (v31)
      {
        int v34 = v31 | 2;
      }
      else
      {
        uint64_t v32 = (char *)&ccp_fsm + 80 * v3;
        char v33 = v32[16] + 1;
        v32[16] = v33;
        v32[17] = v33;
        fsm_sdata(v1, 14, v33, 0, 0, v8, v9, v10, v35);
        timeout((int)sub_10000857C);
        uint64_t v30 = (int)*v1;
        int v34 = dword_10004A2A4[v30] | 1;
      }
      dword_10004A2A4[v30] = v34;
    }
  }
}

uint64_t sub_100006450(const char **a1)
{
  __endptr = 0;
  uint64_t v2 = (char *)*a1;
  int v3 = strtol(*a1, &__endptr, 0);
  uint64_t v11 = __endptr;
  if (__endptr == v2) {
    goto LABEL_8;
  }
  int v12 = v3;
  if (*__endptr == 44)
  {
    uint64_t v2 = __endptr + 1;
    int v3 = strtol(__endptr + 1, &__endptr, 0);
    uint64_t v11 = __endptr;
  }
  if (v11 == v2 || *v11 != 0)
  {
LABEL_8:
    option_error("invalid parameter '%s' for bsdcomp option", v4, v5, v6, v7, v8, v9, v10, (int)*a1);
    return 0;
  }
  BOOL v15 = (v12 - 9) < 7 || v12 == 0;
  if (!v15 || ((v3 - 9) >= 7 ? (BOOL v16 = v3 == 0) : (BOOL v16 = 1), !v16))
  {
    option_error("bsdcomp option values must be 0 or %d .. %d", v4, v5, v6, v7, v8, v9, v10, 9);
    return 0;
  }
  if (v12)
  {
    LOWORD(dword_100047650) = v12;
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
  LOBYTE(ccp_wantoptions[0]) = v17;
  if (v3)
  {
    LOWORD(dword_10004766C) = v3;
    char v18 = 1;
  }
  else
  {
    char v18 = 0;
  }
  LOBYTE(ccp_allowoptions[0]) = v18;
  if (v3 == v12) {
    uint64_t v19 = "%d";
  }
  else {
    uint64_t v19 = "%d,%d";
  }
  slprintf((int)&unk_10004A250, 8, v19);
  return 1;
}

uint64_t sub_1000065A0(const char **a1)
{
  __endptr = 0;
  uint64_t v2 = (char *)*a1;
  int v3 = strtol(*a1, &__endptr, 0);
  uint64_t v11 = __endptr;
  if (__endptr == v2) {
    goto LABEL_8;
  }
  int v12 = v3;
  int v13 = v3;
  if (*__endptr == 44)
  {
    uint64_t v2 = __endptr + 1;
    int v14 = strtol(__endptr + 1, &__endptr, 0);
    uint64_t v11 = __endptr;
    int v13 = v14;
  }
  if (v11 == v2 || *v11 != 0)
  {
LABEL_8:
    option_error("invalid parameter '%s' for deflate option", v4, v5, v6, v7, v8, v9, v10, (int)*a1);
    return 0;
  }
  BOOL v17 = (v12 - 8) < 8 || v12 == 0;
  if (!v17 || ((v13 - 8) >= 8 ? (BOOL v18 = v13 == 0) : (BOOL v18 = 1), !v18))
  {
    option_error("deflate option values must be 0 or %d .. %d", v4, v5, v6, v7, v8, v9, v10, 8);
    return 0;
  }
  if (v12 != 8 && v13 != 8) {
    goto LABEL_25;
  }
  int v19 = 9;
  if (v13 == 8) {
    int v13 = 9;
  }
  warning((uint64_t)"deflate option value of %d changed to %d to avoid zlib bug", v4, v5, v6, v7, v8, v9, v10, 8);
  if (v12 != 8)
  {
LABEL_25:
    if (!v12)
    {
      int v19 = 0;
      HIBYTE(ccp_wantoptions[0]) = 0;
      if (v13) {
        goto LABEL_28;
      }
LABEL_30:
      char v20 = 0;
      goto LABEL_31;
    }
    int v19 = v12;
  }
  HIBYTE(ccp_wantoptions[0]) = 1;
  HIWORD(dword_100047650) = v19;
  if (!v13) {
    goto LABEL_30;
  }
LABEL_28:
  HIWORD(dword_10004766C) = v13;
  char v20 = 1;
LABEL_31:
  HIBYTE(ccp_allowoptions[0]) = v20;
  if (v19 == v13) {
    uint64_t v21 = "%d";
  }
  else {
    uint64_t v21 = "%d,%d";
  }
  slprintf((int)&unk_10004A258, 8, v21);
  return 1;
}

void sub_10000673C(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *a1;
  uint64_t v10 = &ccp_gotoptions[14 * v9];
  uint64_t v11 = &ccp_wantoptions[7 * v9];
  *uint64_t v10 = *(void *)v11;
  *(void *)((char *)v10 + 6) = *(void *)(v11 + 3);
  int v12 = (char *)v10 + 6;
  uint64_t v13 = *a1;
  dword_10004A260[(int)v13] = 0;
  unsigned int v14 = *((unsigned __int8 *)v10 + 6);
  if (!*((unsigned char *)v10 + 6))
  {
LABEL_6:
    if (*(unsigned char *)v10)
    {
      *(_WORD *)int v57 = 789;
      v57[2] = 41;
      if ((int)ccp_test(*a1, (uint64_t)v57, 3, 0) <= 0) {
        *(unsigned char *)uint64_t v10 = 0;
      }
    }
    uint64_t v30 = &ccp_gotoptions[14 * (int)v9];
    int v32 = v30[1];
    int v31 = v30 + 1;
    if (v32)
    {
      char v33 = &ccp_gotoptions[14 * (int)v9];
      int v35 = v33[4];
      int v34 = v33 + 4;
      if (v35)
      {
        *(_DWORD *)int v57 = 1573914;
        if ((int)ccp_test(*a1, (uint64_t)v57, 4, 0) <= 0) {
          *int v34 = 0;
        }
      }
      int v36 = &ccp_gotoptions[14 * (int)v9];
      int v38 = v36[5];
      uint64_t v37 = v36 + 5;
      if (v38)
      {
        *(_DWORD *)int v57 = 1573912;
        if ((int)ccp_test(*a1, (uint64_t)v57, 4, 0) <= 0) {
          *uint64_t v37 = 0;
        }
      }
      if (!*v34 && !*v37) {
        *int v31 = 0;
      }
    }
    int v39 = &ccp_gotoptions[14 * (int)v9];
    int v41 = v39[2];
    unsigned int v40 = v39 + 2;
    if (v41)
    {
      *(_WORD *)int v57 = 513;
      if ((int)ccp_test(*a1, (uint64_t)v57, 2, 0) <= 0) {
        *unsigned int v40 = 0;
      }
    }
    uint64_t v42 = &ccp_gotoptions[14 * (int)v9];
    int v44 = v42[3];
    size_t v43 = v42 + 3;
    if (v44)
    {
      *(_WORD *)int v57 = 514;
      if ((int)ccp_test(*a1, (uint64_t)v57, 2, 0) <= 0) {
        *size_t v43 = 0;
      }
    }
    return;
  }
  int v15 = v13;
  unsigned int v16 = auth_done[(int)v13];
  if ((v16 & 0x30) == 0)
  {
    unsigned int v45 = 0;
    unsigned int v46 = (v16 >> 8) & 0xF;
    do
    {
      v45 += v46 & 1;
      BOOL v47 = v46 > 1;
      v46 >>= 1;
    }
    while (v47);
    if (v45 >= 2)
    {
      uint64_t v48 = "MPPE required, but auth done in both directions.";
      goto LABEL_38;
    }
    if (!v45)
    {
      uint64_t v48 = "MPPE required, but MS-CHAP[v2] auth not performed.";
      goto LABEL_38;
    }
    if (!mppe_keys_set)
    {
      uint64_t v48 = "MPPE required, but keys are not available.  Possible plugin problem?";
      goto LABEL_38;
    }
    if ((v14 & 1) != 0 && (v16 & 0x300) != 0)
    {
      notice((uint64_t)"Disabling 40-bit MPPE; MS-CHAP LM not supported", a2, a3, a4, a5, a6, a7, a8, v56);
      unsigned int v14 = *v12 & 0xFE;
      *v12 &= ~1u;
      uint64_t v13 = *a1;
      LOBYTE(ccp_wantoptions[7 * (int)v13 + 3]) &= ~1u;
    }
  }
  if ((v14 & 3) != 0)
  {
    LOBYTE(ccp_allowoptions[7 * v15 + 3]) = v14;
    *(_DWORD *)uint64_t v10 = 0;
    *(_DWORD *)&ccp_allowoptions[7 * v15] = 0;
    *(_WORD *)int v57 = 1554;
    v57[2] = ((v14 >> 2) & 1) == 0;
    *(_WORD *)&v57[3] = 0;
    char v58 = 32 * (v14 & 3);
    if ((int)ccp_test(v13, (uint64_t)v57, 22, 0) <= 0)
    {
      error((uint64_t)"MPPE required, but kernel has no support.", v17, v18, v19, v20, v21, v22, v23, v56);
      lcp_close(*a1, "MPPE required but not available", v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_6;
  }
  uint64_t v48 = "MPPE required, but both 40-bit and 128-bit disabled.";
LABEL_38:
  error((uint64_t)v48, a2, a3, a4, a5, a6, a7, a8, v56);
  int v55 = *a1;

  lcp_close(v55, "MPPE required but not available", v49, v50, v51, v52, v53, v54);
}

uint64_t sub_100006AD0(int *a1)
{
  int v1 = (char *)&ccp_gotoptions + 14 * *a1;
  if (*v1) {
    int v2 = 3;
  }
  else {
    int v2 = 0;
  }
  int v3 = (v2 | (4 * (v1[1] != 0))) + 2 * (v1[2] != 0) + 2 * (v1[3] != 0);
  if (v1[6]) {
    int v4 = 6;
  }
  else {
    int v4 = 0;
  }
  return (v3 + v4);
}

void sub_100006B3C(int *a1, char *a2, _DWORD *a3)
{
  int v6 = *a1;
  uint64_t v7 = &ccp_gotoptions[14 * *a1];
  uint64_t v8 = v7 + 6;
  uint64_t v9 = a2;
  if (v7[6])
  {
    __int16 v41 = 1554;
    *(_WORD *)a2 = 1554;
    a2[2] = (*v8 & 4) == 0;
    *(_WORD *)(a2 + 3) = 0;
    a2[5] = 0;
    unsigned __int8 v10 = (32 * *v8) & 0x40;
    a2[5] = v10;
    char v11 = *v8;
    if (*v8)
    {
      a2[5] = v10 | 0x20;
      char v11 = *v8;
    }
    BOOL v42 = (v11 & 4) == 0;
    __int16 v43 = 0;
    char v44 = 32 * (v11 & 3);
    long long v45 = mppe_recv_key;
    if ((int)ccp_test(*a1, (uint64_t)&v41, 22, 0) < 1)
    {
      lcp_close(*a1, "MPPE required but not available in kernel", v12, v13, v14, v15, v16, v17);
      uint64_t v9 = a2;
    }
    else
    {
      uint64_t v9 = a2 + 6;
    }
  }
  uint64_t v18 = &ccp_gotoptions[14 * v6];
  int v20 = v18[1];
  uint64_t v19 = v18 + 1;
  if (v20)
  {
    uint64_t v21 = &ccp_gotoptions[14 * v6];
    uint64_t v22 = v21 + 4;
    if (v21[4]) {
      char v23 = 26;
    }
    else {
      char v23 = 24;
    }
    *uint64_t v9 = v23;
    v9[1] = 4;
    char v25 = v21[10];
    uint64_t v24 = v21 + 10;
    v9[2] = 16 * v25 - 120;
    v9[3] = 0;
    if (v9 == a2)
    {
      while (1)
      {
        if ((unsigned __int16)*v24 < 9u)
        {
LABEL_20:
          *uint64_t v19 = 0;
          uint64_t v9 = a2;
          goto LABEL_22;
        }
        int v27 = ccp_test(*a1, (uint64_t)a2, 4, 0);
        if (v27 >= 1) {
          break;
        }
        if (v27 < 0) {
          goto LABEL_20;
        }
        __int16 v28 = *v24 - 1;
        *uint64_t v24 = v28;
        v9[2] = 16 * v28 - 120;
      }
      uint64_t v26 = a2 + 4;
    }
    else
    {
      uint64_t v26 = v9 + 4;
      uint64_t v9 = a2;
      if (v26 == a2) {
        goto LABEL_22;
      }
    }
    if (*v22 && ccp_gotoptions[14 * v6 + 5])
    {
      *(_WORD *)uint64_t v26 = 1048;
      *((_WORD *)v26 + 1) = *(v26 - 2);
      uint64_t v9 = v26 + 4;
    }
    else
    {
      uint64_t v9 = v26;
    }
  }
LABEL_22:
  if (*v7)
  {
    *(_WORD *)uint64_t v9 = 789;
    uint64_t v29 = &ccp_gotoptions[14 * v6];
    char v31 = v29[8];
    uint64_t v30 = v29 + 8;
    v9[2] = v31 | 0x20;
    if (v9 == a2)
    {
      while (1)
      {
        if ((unsigned __int16)*v30 < 9u)
        {
LABEL_29:
          *uint64_t v7 = 0;
          uint64_t v9 = a2;
          goto LABEL_30;
        }
        int v32 = ccp_test(*a1, (uint64_t)a2, 3, 0);
        if (v32 >= 1) {
          break;
        }
        if (v32 < 0) {
          goto LABEL_29;
        }
        __int16 v33 = *v30 - 1;
        *uint64_t v30 = v33;
        v9[2] = v33 | 0x20;
      }
      uint64_t v9 = a2 + 3;
    }
    else
    {
      v9 += 3;
    }
  }
LABEL_30:
  int v34 = &ccp_gotoptions[14 * v6];
  int v36 = v34[2];
  int v35 = v34 + 2;
  if (v36)
  {
    *(_WORD *)uint64_t v9 = 513;
    if (v9 == a2 && (int)ccp_test(*a1, (uint64_t)a2, 2, 0) <= 0)
    {
      *int v35 = 0;
      uint64_t v9 = a2;
    }
    else
    {
      v9 += 2;
    }
  }
  uint64_t v37 = &ccp_gotoptions[14 * v6];
  int v39 = v37[3];
  int v38 = v37 + 3;
  if (v39)
  {
    *(_WORD *)uint64_t v9 = 514;
    if (v9 == a2 && (int)ccp_test(*a1, (uint64_t)a2, 2, 0) <= 0)
    {
      *int v38 = 0;
      __int16 v40 = -1;
      LODWORD(v9) = a2;
      goto LABEL_41;
    }
    v9 += 2;
  }
  if (v9 <= a2) {
    __int16 v40 = -1;
  }
  else {
    __int16 v40 = *a2;
  }
LABEL_41:
  *(_WORD *)&ccp_gotoptions[14 * v6 + 12] = v40;
  *a3 = v9 - a2;
}

BOOL sub_100006EC0(int *a1, unsigned __int8 *a2, int a3)
{
  int v3 = *a1;
  int v4 = (char *)&ccp_gotoptions + 14 * *a1;
  unsigned int v5 = v4[6];
  if (v4[6])
  {
    *(_WORD *)uint64_t v13 = 1554;
    v13[2] = ((v5 >> 2) & 1) == 0;
    *(_WORD *)&v13[3] = 0;
    if (a3 < 6) {
      return 0;
    }
    if (*(_DWORD *)v13 == *(_DWORD *)a2)
    {
      v13[5] = 32 * (v5 & 3);
      BOOL v6 = *(unsigned __int16 *)&v13[4] == *((unsigned __int16 *)a2 + 2);
    }
    else
    {
      BOOL v6 = 0;
    }
    if (!v6) {
      return 0;
    }
    a3 -= 6;
    if (!a3) {
      return 1;
    }
    uint64_t v7 = a2 + 6;
  }
  else
  {
    uint64_t v7 = a2;
  }
  if (!*((unsigned char *)&ccp_gotoptions + 14 * v3 + 1)) {
    goto LABEL_31;
  }
  if (a3 < 4) {
    return 0;
  }
  int v8 = *((unsigned char *)&ccp_gotoptions + 14 * v3 + 4) ? 26 : 24;
  if (v8 != *v7) {
    return 0;
  }
  if (v7[1] != 4) {
    return 0;
  }
  int v9 = v7[2];
  if (16 * *((unsigned __int16 *)&ccp_gotoptions + 7 * v3 + 5) - 120 != v9 || v7[3]) {
    return 0;
  }
  if (a3 == 4) {
    return 1;
  }
  if (*((unsigned char *)&ccp_gotoptions + 14 * v3 + 4) && *((unsigned char *)&ccp_gotoptions + 14 * v3 + 5))
  {
    BOOL v10 = a3 >= 8;
    a3 -= 8;
    if (!v10 || v7[4] != 24 || v7[5] != 4 || v9 != v7[6] || v7[7]) {
      return 0;
    }
    v7 += 8;
  }
  else
  {
    v7 += 4;
    a3 -= 4;
  }
LABEL_31:
  if (*v4)
  {
    BOOL v11 = __OFSUB__(a3, 3);
    a3 -= 3;
    if (a3 < 0 != v11
      || *v7 != 21
      || v7[1] != 3
      || (*((unsigned __int16 *)&ccp_gotoptions + 7 * v3 + 4) | 0x20) != v7[2])
    {
      return 0;
    }
    v7 += 3;
    if (v7 == a2 && !a3) {
      return 1;
    }
  }
  if (*((unsigned char *)&ccp_gotoptions + 14 * v3 + 2))
  {
    BOOL v11 = __OFSUB__(a3, 2);
    a3 -= 2;
    if (a3 < 0 != v11 || *v7 != 1 || v7[1] != 2) {
      return 0;
    }
    v7 += 2;
    if (v7 == a2 && !a3) {
      return 1;
    }
  }
  if (!*((unsigned char *)&ccp_gotoptions + 14 * v3 + 3)) {
    return a3 == 0;
  }
  BOOL v11 = __OFSUB__(a3, 2);
  a3 -= 2;
  if (a3 < 0 != v11 || *v7 != 2 || v7[1] != 2) {
    return 0;
  }
  if (v7 + 2 == a2 && !a3) {
    return 1;
  }
  return a3 == 0;
}

uint64_t sub_100007104(int *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  int v9 = a2;
  int v11 = *a1;
  uint64_t v12 = &ccp_gotoptions[14 * *a1];
  char v13 = *v12;
  char v14 = v12[1];
  int v15 = *(_DWORD *)(v12 + 2);
  char v16 = v12[6];
  char v17 = v12[7];
  __int16 v18 = *((_WORD *)v12 + 4);
  __int16 v19 = *((_WORD *)v12 + 5);
  __int16 v20 = *((_WORD *)v12 + 6);
  if ((int)a3 < 6 || !v12[6] || *a2 != 18) {
    goto LABEL_26;
  }
  int v21 = v12[1];
  if (a2[1] != 6) {
    goto LABEL_27;
  }
  unsigned int v22 = a2[2];
  int v23 = (char)a2[5];
  int v24 = ((4 * (v22 & 1)) | (v23 >> 5) & 3) ^ 4;
  if (v23 < 0) {
    v24 |= 8u;
  }
  int v25 = (2 * v23) & 0x20 | (16 * (v23 & 1)) | v24;
  if (a2[3] || (v22 >= 2 ? (int v26 = v25 | 0x40) : (int v26 = (2 * v23) & 0x20 | (16 * (v23 & 1)) | v24), a2[4])) {
    int v26 = v25 | 0x40;
  }
  if ((v23 & 0xE) != 0) {
    unsigned int v27 = v25 | 0x40;
  }
  else {
    unsigned int v27 = v26;
  }
  if (((refuse_mppe_stateful != 0) & (v27 >> 2)) != 0) {
    char v16 = v27 & 0xFB;
  }
  else {
    char v16 = v27;
  }
  if ((v16 & 1) != 0 && (ccp_allowoptions[7 * v11 + 3] & 1) == 0) {
    v16 &= ~1u;
  }
  if ((v16 & 2) != 0 && (ccp_allowoptions[7 * v11 + 3] & 2) == 0) {
    v16 &= ~2u;
  }
  if ((v16 & 3) == 0)
  {
    char v44 = v12[7];
    int v45 = *(_DWORD *)(v12 + 2);
    error((uint64_t)"MPPE required but peer negotiation failed", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v42);
    lcp_close(*a1, "MPPE required but peer negotiation failed", v35, v36, v37, v38, v39, v40);
    __int16 v20 = v43;
    char v17 = v44;
    int v15 = v45;
    int v21 = ccp_gotoptions[14 * v11 + 1];
  }
  else
  {
LABEL_26:
    int v21 = v12[1];
  }
LABEL_27:
  if (v8 >= 4 && v21)
  {
    int v28 = ccp_gotoptions[14 * v11 + 4] ? 26 : 24;
    if (v28 == *v9 && v9[1] == 4)
    {
      unsigned int v29 = v9[2];
      if ((v29 & 0xF) == 8 && v29 >= 0x10 && !v9[3])
      {
        unsigned int v41 = (v29 >> 4) + 8;
        if (v41 < *(unsigned __int16 *)&ccp_gotoptions[14 * v11 + 10]) {
          __int16 v19 = v41;
        }
      }
      else
      {
        char v14 = 0;
      }
      if (ccp_gotoptions[14 * v11 + 4] && v8 >= 8 && ccp_gotoptions[14 * v11 + 5] && v9[4] == 24)
      {
        int v30 = v9[5];
        if (v30 == 4) {
          v9 += 8;
        }
        else {
          v9 += 4;
        }
        if (v30 == 4) {
          v8 -= 8;
        }
        else {
          v8 -= 4;
        }
      }
      else
      {
        v9 += 4;
        v8 -= 4;
      }
    }
  }
  if (*v12) {
    BOOL v31 = v8 < 3;
  }
  else {
    BOOL v31 = 1;
  }
  if (!v31 && *v9 == 21 && v9[1] == 3)
  {
    unsigned __int8 v32 = v9[2];
    if ((v32 & 0xE0) == 0x20)
    {
      unsigned int v33 = v32 & 0x1F;
      if (v33 < *(unsigned __int16 *)&ccp_gotoptions[14 * v11 + 8]) {
        __int16 v18 = v33;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  if (a1[2] != 9)
  {
    *uint64_t v12 = v13;
    v12[1] = v14;
    *(_DWORD *)(v12 + 2) = v15;
    v12[6] = v16;
    v12[7] = v17;
    *((_WORD *)v12 + 4) = v18;
    *((_WORD *)v12 + 5) = v19;
    *((_WORD *)v12 + 6) = v20;
  }
  return 1;
}

uint64_t sub_100007414(int *a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2;
  uint64_t v10 = *a1;
  int v11 = &ccp_gotoptions[14 * (int)v10];
  char v12 = *v11;
  char v13 = v11[1];
  char v14 = v11[2];
  char v15 = v11[3];
  int v16 = v11[4];
  int v17 = v11[5];
  uint64_t v18 = *(void *)(v11 + 6);
  if (a3)
  {
    int v19 = a3 - 6;
    if ((int)a3 >= 6 && *(void *)(v11 + 6) && *a2 == 18 && a2[1] == 6)
    {
      char v37 = v11[2];
      uint64_t v36 = *(void *)(v11 + 6);
      char v35 = v11[3];
      error((uint64_t)"MPPE required but peer refused", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v34);
      lcp_close(*a1, "MPPE required but peer refused", v20, v21, v22, v23, v24, v25);
      char v15 = v35;
      uint64_t v18 = v36;
      char v14 = v37;
      v8 += 6;
      int v26 = ccp_gotoptions[14 * (int)v10 + 4];
      LODWORD(a3) = v19;
    }
    else
    {
      int v26 = v11[4];
    }
    if (v26) {
      BOOL v27 = (int)a3 < 4;
    }
    else {
      BOOL v27 = 1;
    }
    if (!v27 && *v8 == 26 && v8[1] == 4)
    {
      if (16 * *(unsigned __int16 *)&ccp_gotoptions[14 * (int)v10 + 10] - 120 != v8[2] || v8[3]) {
        return 0;
      }
      int v16 = 0;
      v8 += 4;
      LODWORD(a3) = a3 - 4;
    }
    if (ccp_gotoptions[14 * (int)v10 + 5]) {
      BOOL v28 = (int)a3 < 4;
    }
    else {
      BOOL v28 = 1;
    }
    if (!v28 && *v8 == 24 && v8[1] == 4)
    {
      if (16 * *(unsigned __int16 *)&ccp_gotoptions[14 * (int)v10 + 10] - 120 != v8[2] || v8[3]) {
        return 0;
      }
      int v17 = 0;
      v8 += 4;
      LODWORD(a3) = a3 - 4;
    }
  }
  else
  {
    if (dword_10004A260[v10]) {
      return 0xFFFFFFFFLL;
    }
    LODWORD(a3) = 0;
  }
  if (v16 | v17) {
    char v30 = v13;
  }
  else {
    char v30 = 0;
  }
  if (*v11) {
    BOOL v31 = (int)a3 < 3;
  }
  else {
    BOOL v31 = 1;
  }
  if (!v31 && *v8 == 21 && v8[1] == 3)
  {
    if ((*(unsigned __int16 *)&ccp_gotoptions[14 * (int)v10 + 8] | 0x20) != v8[2]) {
      return 0;
    }
    char v12 = 0;
    v8 += 3;
    LODWORD(a3) = a3 - 3;
  }
  if (ccp_gotoptions[14 * (int)v10 + 2]) {
    BOOL v32 = (int)a3 < 2;
  }
  else {
    BOOL v32 = 1;
  }
  if (!v32 && *v8 == 1 && v8[1] == 2)
  {
    char v14 = 0;
    v8 += 2;
    LODWORD(a3) = a3 - 2;
  }
  if (ccp_gotoptions[14 * (int)v10 + 3]) {
    BOOL v33 = (int)a3 < 2;
  }
  else {
    BOOL v33 = 1;
  }
  if (v33)
  {
    if (!a3) {
      goto LABEL_53;
    }
    return 0;
  }
  if (*v8 != 2) {
    return 0;
  }
  uint64_t result = 0;
  if (v8[1] != 2) {
    return result;
  }
  char v15 = 0;
  if (a3 != 2) {
    return 0;
  }
LABEL_53:
  if (a1[2] == 9) {
    return 1;
  }
  unsigned char *v11 = v12;
  v11[1] = v30;
  v11[2] = v14;
  v11[3] = v15;
  v11[4] = v16;
  v11[5] = v17;
  uint64_t result = 1;
  *(void *)(v11 + 6) = v18;
  return result;
}

uint64_t sub_100007700(int *a1, char *__src, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  uint64_t v9 = 7 * v8;
  int v10 = *a3;
  int v11 = (char *)&ccp_hisoptions[7 * v8];
  *(void *)(v11 + 6) = 0;
  *(void *)int v11 = 0;
  if (v10 <= 0)
  {
    ccp_hisoptions[7 * (int)v8 + 6] = -1;
    return 2;
  }
  else
  {
    int v12 = a4;
    char v14 = a1;
    long long v78 = (char *)&ccp_allowoptions[v9 + 1] + 1;
    *((_WORD *)v11 + 6) = *__src;
    long long v77 = &ccp_allowoptions[v9 + 1];
    long long v71 = v11 + 2;
    long long v72 = v11 + 3;
    long long v75 = v11 + 8;
    v68 = &ccp_allowoptions[v9 + 4];
    long long v83 = (char *)&ccp_allowoptions[v9] + 1;
    long long v79 = &ccp_allowoptions[v9 + 2];
    long long v80 = &ccp_allowoptions[v9];
    v70 = (char *)&ccp_allowoptions[v9 + 2] + 1;
    v66 = v11 + 1;
    v67 = v11 + 10;
    long long v81 = &ccp_allowoptions[v9 + 3];
    long long v73 = v11 + 6;
    long long v74 = &ccp_hisoptions[7 * v8];
    unsigned __int8 v65 = &ccp_allowoptions[v9 + 5];
    int v69 = 1;
    char v15 = __src;
    uint64_t v16 = 2;
    int v17 = __src;
    do
    {
      if (v10 == 1)
      {
        unsigned int v18 = 1;
LABEL_5:
        LODWORD(v19) = 4;
      }
      else
      {
        unsigned int v18 = v17[1];
        if (v18 >= 2 && v10 >= v18)
        {
          int v25 = *v17;
          LODWORD(v19) = 4;
          switch(*v17)
          {
            case 18:
              if (v18 != 6) {
                break;
              }
              char v28 = *(unsigned char *)v81;
              if (!*(unsigned char *)v81) {
                break;
              }
              *long long v73 = 0;
              int v29 = ~(4 * v17[2]) & 4;
              *long long v73 = ~(4 * v17[2]) & 4;
              unsigned __int8 v30 = v17[5];
              if ((v30 & 0x40) != 0)
              {
                v29 |= 2u;
                *long long v73 = v29;
                unsigned __int8 v30 = v17[5];
                if ((v30 & 0x20) == 0)
                {
LABEL_52:
                  if ((v30 & 0x80) == 0) {
                    goto LABEL_53;
                  }
                  goto LABEL_94;
                }
              }
              else if ((v17[5] & 0x20) == 0)
              {
                goto LABEL_52;
              }
              v29 |= 1u;
              *long long v73 = v29;
              unsigned __int8 v30 = v17[5];
              if ((v30 & 0x80) == 0)
              {
LABEL_53:
                if ((v30 & 0x10) == 0) {
                  goto LABEL_54;
                }
                goto LABEL_95;
              }
LABEL_94:
              v29 |= 8u;
              *long long v73 = v29;
              unsigned __int8 v30 = v17[5];
              if ((v30 & 0x10) == 0)
              {
LABEL_54:
                if ((v30 & 1) == 0) {
                  goto LABEL_56;
                }
LABEL_55:
                v29 |= 0x10u;
                *long long v73 = v29;
                goto LABEL_56;
              }
LABEL_95:
              v29 |= 0x20u;
              *long long v73 = v29;
              if (v17[5]) {
                goto LABEL_55;
              }
LABEL_56:
              if (v17[2] >= 2u)
              {
                v29 |= 0x40u;
                *long long v73 = v29;
              }
              if (v17[3] || v17[4])
              {
                v29 |= 0x40u;
                *long long v73 = v29;
              }
              int v31 = v29 | 0x40;
              if ((v17[5] & 0xE) == 0) {
                int v31 = v29;
              }
              unsigned int v32 = v31 & (v31 & 0x40 ^ 0xFFFFFFC7);
              if ((v31 & 0x78) != 0) {
                int v33 = 3;
              }
              else {
                int v33 = 2;
              }
              if (v17[5] & 0xE | v31 & 0x38 | v31 & 0x40) {
                *long long v73 = v32;
              }
              if ((v32 & 4) != 0 && refuse_mppe_stateful)
              {
                error((uint64_t)"Refusing MPPE stateful mode offered by peer", (uint64_t)__src, (uint64_t)a3, a4, a5, a6, a7, a8, v64);
LABEL_71:
                unsigned int v18 = 6;
                break;
              }
              if ((~v32 & 3) == 0)
              {
                if ((v28 & 2) != 0)
                {
                  char v37 = 70;
                }
                else
                {
                  if ((v28 & 1) == 0) {
                    goto LABEL_71;
                  }
                  char v37 = 69;
                }
                LOBYTE(v32) = v32 & v37;
LABEL_118:
                *long long v73 = v32;
LABEL_119:
                int v33 = 3;
                goto LABEL_133;
              }
              if ((v32 & 2) != 0)
              {
                if ((v28 & 2) == 0) {
                  goto LABEL_71;
                }
              }
              else
              {
                if ((v32 & 1) == 0)
                {
                  int v38 = v28 & 3;
                  LOBYTE(v32) = v38 | v32;
                  if (v38) {
                    goto LABEL_118;
                  }
                  goto LABEL_119;
                }
                if ((v28 & 1) == 0) {
                  goto LABEL_71;
                }
              }
LABEL_133:
              v17[2] = (v32 & 4) == 0;
              *(_WORD *)(v17 + 3) = 0;
              v17[5] = 0;
              unsigned __int8 v42 = (32 * *v73) & 0x40;
              v17[5] = v42;
              if (*v73) {
                v17[5] = v42 | 0x20;
              }
              if (v33 == 2)
              {
                int v84 = *(_DWORD *)v17;
                __int16 v85 = *((_WORD *)v17 + 2);
                long long v86 = mppe_send_key;
                if ((int)ccp_test(*v14, (uint64_t)&v84, 22, 1) < 1)
                {
                  error((uint64_t)"MPPE required, but kernel has no support.", v43, v44, v45, v46, v47, v48, v49, v64);
                  lcp_close(*v14, "MPPE required but not available", v51, v52, v53, v54, v55, v56);
                }
                else
                {
                  int mtu = netif_get_mtu();
                  if (mtu)
                  {
                    netif_set_mtu(*v14, mtu - 4);
                    LODWORD(v19) = 2;
                  }
                  int v69 = 0;
                }
                goto LABEL_71;
              }
              int v69 = 0;
              unsigned int v18 = 6;
              LODWORD(v19) = 3;
              break;
            case 19:
            case 20:
            case 22:
            case 23:
            case 25:
              break;
            case 21:
              if (v18 != 3 || !*(unsigned char *)v80) {
                break;
              }
              long long v82 = v14;
              *long long v74 = 1;
              unsigned int v34 = v17[2] & 0x1F;
              *long long v75 = v34;
              if ((v17[2] & 0xE0) == 0x20 && v34 >= 9 && (unsigned __int16)*v68 >= v34)
              {
                LODWORD(v19) = 2;
              }
              else
              {
                if (v12)
                {
                  LODWORD(v19) = 3;
LABEL_103:
                  unsigned int v18 = 3;
                  goto LABEL_104;
                }
                v17[2] = *(unsigned char *)v68 | 0x20;
                LODWORD(v19) = 3;
              }
              if (v17 != __src) {
                goto LABEL_103;
              }
              unsigned int v18 = 3;
              int v39 = ccp_test(*v82, (uint64_t)__src, 3, 1);
              if (v39 > 0)
              {
LABEL_104:
                char v14 = v82;
                break;
              }
              unsigned int v40 = v34 - 1;
              char v14 = v82;
              while (!(v39 | v12) && v40 != 8)
              {
                v17[2] = v40 | 0x20;
                LODWORD(v19) = 3;
                int v39 = ccp_test(*v82, (uint64_t)__src, 3, 1);
                --v40;
                if (v39 > 0)
                {
                  unsigned int v18 = 3;
                  goto LABEL_11;
                }
              }
              v17[2] = *(unsigned char *)v75 | 0x20;
              unsigned int v18 = 3;
              goto LABEL_5;
            case 24:
            case 26:
              if (v18 != 4 || !*v83) {
                break;
              }
              if (v25 == 26 && !*(unsigned char *)v79 || v25 == 24 && !*v70)
              {
                unsigned int v18 = 4;
                break;
              }
              long long v82 = v14;
              unsigned char *v66 = 1;
              unsigned int v35 = v17[2];
              unsigned int v36 = (v35 >> 4) + 8;
              _WORD *v67 = (v35 >> 4) + 8;
              if ((v17[2] & 0xF) != 8 || v17[3] || (unsigned __int16)*v65 < v36 || v35 <= 0xF)
              {
                if (v12)
                {
                  unsigned int v18 = 4;
                  LODWORD(v19) = 3;
                  goto LABEL_104;
                }
                v17[2] = 16 * *(unsigned char *)v65 - 120;
                v17[3] = 0;
                LODWORD(v19) = 3;
              }
              else
              {
                LODWORD(v19) = 2;
              }
              if (v17 != __src) {
                goto LABEL_126;
              }
              unsigned int v18 = 4;
              int v41 = ccp_test(*v82, (uint64_t)__src, 4, 1);
              while (2)
              {
                if (v41 <= 0)
                {
                  if (!(v41 | v12) && v36 != 9)
                  {
                    v17[2] = 16 * v36 + 120;
                    unsigned int v18 = 4;
                    int v41 = ccp_test(*v82, (uint64_t)__src, 4, 1);
                    LODWORD(v19) = 3;
                    --v36;
                    continue;
                  }
                  v17[2] = 16 * *(unsigned char *)v67 - 120;
                  LODWORD(v19) = 4;
LABEL_126:
                  unsigned int v18 = 4;
                }
                break;
              }
              goto LABEL_104;
            default:
              if (v25 == 1)
              {
                if (v18 != 2 || !*(unsigned char *)v77) {
                  break;
                }
                BOOL v27 = v71;
              }
              else
              {
                if (v25 != 2 || v18 != 2 || !*v78) {
                  break;
                }
                BOOL v27 = v72;
              }
              *BOOL v27 = 1;
              LODWORD(v19) = 2;
              if (v17 == __src)
              {
                if ((int)ccp_test(*v14, (uint64_t)__src, 2, 1) >= 1) {
                  LODWORD(v19) = 2;
                }
                else {
                  LODWORD(v19) = 4;
                }
              }
              unsigned int v18 = 2;
              break;
          }
        }
        else
        {
          LODWORD(v19) = 4;
          unsigned int v18 = v10;
        }
      }
LABEL_11:
      if (v19 != 3 || v12 == 0) {
        uint64_t v19 = v19;
      }
      else {
        uint64_t v19 = 4;
      }
      if (v19 != 2)
      {
        if (v19 == 3 && v16 == 4)
        {
          uint64_t v16 = 4;
        }
        else
        {
          if (v16 == 3 && v19 == 4) {
            uint64_t v24 = __src;
          }
          else {
            uint64_t v24 = v15;
          }
          if (v17 != v24) {
            memcpy(v24, v17, v18);
          }
          char v15 = &v24[v18];
          uint64_t v16 = v19;
        }
      }
      v17 += v18;
      BOOL v26 = __OFSUB__(v10, v18);
      v10 -= v18;
    }
    while (!((v10 < 0) ^ v26 | (v10 == 0)));
    if (v16 != 2)
    {
      if (v16 == 4)
      {
        if (v15 - __src == *a3) {
          dword_10004A260[*v14] = 1;
        }
        else {
          *a3 = v15 - __src;
        }
        uint64_t v16 = 4;
        if (*(unsigned char *)v81 && v69)
        {
          error((uint64_t)"MPPE required but peer negotiation failed", (uint64_t)__src, (uint64_t)a3, a4, a5, a6, a7, a8, v64);
          lcp_close(*v14, "MPPE required but peer negotiation failed", v57, v58, v59, v60, v61, v62);
        }
      }
      else
      {
        *a3 = v15 - __src;
      }
    }
  }
  return v16;
}

void sub_100007F14(unsigned int *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (int)v2;
  uint64_t v4 = 7 * (int)v2;
  unsigned int v5 = &ccp_gotoptions[v4 * 2];
  BOOL v6 = &ccp_hisoptions[v4];
  ccp_flags_set(v2, 1, 1);
  if (v5[1]
    || *v5
    || ccp_gotoptions[14 * (int)v3 + 2]
    || ccp_gotoptions[14 * (int)v3 + 3]
    || ccp_gotoptions[14 * (int)v3 + 6])
  {
    if (HIBYTE(ccp_hisoptions[7 * (int)v3])
      || *v6
      || LOBYTE(ccp_hisoptions[7 * (int)v3 + 1])
      || HIBYTE(ccp_hisoptions[7 * (int)v3 + 1])
      || LOBYTE(ccp_hisoptions[7 * (int)v3 + 3]))
    {
      if (*(unsigned __int16 *)&ccp_gotoptions[14 * v3 + 12] == (unsigned __int16)ccp_hisoptions[7 * v3 + 6])
      {
        int v42 = sub_1000082F8((uint64_t)v5, (uint64_t)v6);
        notice((uint64_t)"%s compression enabled", v14, v15, v16, v17, v18, v19, v20, v42);
      }
      else
      {
        sub_1000082F8((uint64_t)v5, 0);
        __strlcpy_chk();
        sub_1000082F8((uint64_t)v6, 0);
        notice((uint64_t)"%s / %s compression enabled", v21, v22, v23, v24, v25, v26, v27, (int)&v45);
      }
    }
    else
    {
      int v44 = sub_1000082F8((uint64_t)v5, 0);
      notice((uint64_t)"%s receive compression enabled", v35, v36, v37, v38, v39, v40, v41, v44);
    }
  }
  else if (HIBYTE(ccp_hisoptions[7 * (int)v3]) {
         || *v6
  }
         || LOBYTE(ccp_hisoptions[7 * (int)v3 + 1])
         || HIBYTE(ccp_hisoptions[7 * (int)v3 + 1])
         || LOBYTE(ccp_hisoptions[7 * (int)v3 + 3]))
  {
    int v43 = sub_1000082F8((uint64_t)v6, 0);
    notice((uint64_t)"%s transmit compression enabled", v28, v29, v30, v31, v32, v33, v34, v43);
  }
  if (ccp_gotoptions[14 * (int)v3 + 6])
  {
    mppe_recv_key = 0uLL;
    mppe_send_key = 0uLL;
    continue_networks(*a1, v7, v8, v9, v10, v11, v12, v13);
  }
}

void sub_10000815C(int *a1)
{
  uint64_t v2 = *a1;
  if (dword_10004A2A4[(int)v2])
  {
    untimeout((uint64_t)sub_10000857C, (uint64_t)a1);
    uint64_t v2 = *a1;
  }
  dword_10004A2A4[(int)v2] = 0;
  ccp_flags_set(v2, 1, 0);
  int v10 = *a1;
  uint64_t v11 = &ccp_gotoptions[14 * *a1];
  int v13 = v11[6];
  uint64_t v12 = v11 + 6;
  if (v13)
  {
    *uint64_t v12 = 0;
    if (*((_DWORD *)&lcp_fsm + 20 * v10 + 2) == 9)
    {
      error((uint64_t)"MPPE disabled", v3, v4, v5, v6, v7, v8, v9, v21);
      int v20 = *a1;
      lcp_close(v20, "MPPE disabled", v14, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t sub_100008238(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a3;
  if (a2 == 15)
  {
    uint64_t v13 = (int)*a1;
    int v14 = dword_10004A2A4[v13];
    if ((v14 & 1) != 0 && *((unsigned __int8 *)a1 + 17) == a3)
    {
      dword_10004A2A4[v13] = v14 & 0xFFFFFFFC;
      untimeout((uint64_t)sub_10000857C, (uint64_t)a1);
    }
    notice((uint64_t)"received CCP RESETACK", a2, a3, a4, a5, a6, a7, a8, v16);
    return 1;
  }
  if (a2 == 14)
  {
    if (a1[2] == 9)
    {
      notice((uint64_t)"received CCP RESETREQ", a2, a3, a4, a5, a6, a7, a8, v16);
      fsm_sdata(a1, 15, v8, 0, 0, v10, v11, v12, v17);
    }
    return 1;
  }
  return 0;
}

const char *sub_1000082F8(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 1) && !*(unsigned char *)a1 && !*(unsigned char *)(a1 + 2) && !*(unsigned char *)(a1 + 3) && !*(unsigned char *)(a1 + 6)) {
    return "(none)";
  }
  int v3 = *(__int16 *)(a1 + 12);
  switch(*(_WORD *)(a1 + 12))
  {
    case 0x12:
      slprintf((int)&unk_10004A264, 64, "MPPE ");
      char v6 = *(unsigned char *)(a1 + 6);
      if ((v6 & 2) != 0)
      {
        slprintf((int)&unk_10004A269, 59, "128-bit ");
        char v6 = *(unsigned char *)(a1 + 6);
        uint64_t v7 = &unk_10004A271;
        if ((v6 & 1) == 0) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v7 = &unk_10004A269;
        if ((*(unsigned char *)(a1 + 6) & 1) == 0) {
          goto LABEL_24;
        }
      }
      slprintf((int)v7, &unk_10004A264 - v7 + 64, "40-bit ");
      LODWORD(v7) = v7 + 7;
      char v6 = *(unsigned char *)(a1 + 6);
LABEL_24:
      if ((v6 & 4) != 0) {
        char v8 = "stateful";
      }
      else {
        char v8 = "stateless";
      }
      slprintf((int)v7, &unk_10004A264 - v7 + 64, v8);
      uint64_t v4 = &unk_10004A264;
      break;
    case 0x13:
    case 0x14:
    case 0x16:
    case 0x17:
    case 0x19:
      goto LABEL_13;
    case 0x15:
      if (!a2 || *(unsigned __int16 *)(a2 + 8) == *(unsigned __int16 *)(a1 + 8))
      {
        uint64_t v4 = &unk_10004A264;
        uint64_t v5 = "BSD-Compress (%d)";
      }
      else
      {
        uint64_t v4 = &unk_10004A264;
        uint64_t v5 = "BSD-Compress (%d/%d)";
      }
      goto LABEL_29;
    case 0x18:
    case 0x1A:
      if (!a2 || *(unsigned __int16 *)(a2 + 10) == *(unsigned __int16 *)(a1 + 10))
      {
        uint64_t v4 = &unk_10004A264;
        uint64_t v5 = "Deflate%s (%d)";
      }
      else
      {
        uint64_t v4 = &unk_10004A264;
        uint64_t v5 = "Deflate%s (%d/%d)";
      }
      goto LABEL_29;
    default:
      if (v3 == 1) {
        return "Predictor 1";
      }
      if (v3 == 2) {
        return "Predictor 2";
      }
LABEL_13:
      uint64_t v4 = &unk_10004A264;
      uint64_t v5 = "Method %d";
LABEL_29:
      slprintf((int)&unk_10004A264, 64, v5);
      return (const char *)v4;
  }
  return (const char *)v4;
}

void sub_10000857C(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  if (a1[2] != 9 || (dword_10004A2A4[v8] & 2) == 0)
  {
    unsigned int v11 = dword_10004A2A4[v8] & 0xFFFFFFFE;
  }
  else
  {
    fsm_sdata((unsigned int *)a1, 14, *((unsigned char *)a1 + 17), 0, 0, a6, a7, a8, v12);
    timeout((int)sub_10000857C);
    uint64_t v8 = *a1;
    unsigned int v11 = dword_10004A2A4[v8] & 0xFFFFFFFD;
  }
  dword_10004A2A4[v8] = v11;
}

double mppe_set_keys(const void *a1, const void *a2)
{
  memset(&v5, 0, sizeof(v5));
  CC_SHA1_Init(&v5);
  CC_SHA1_Update(&v5, a2, 0x10u);
  CC_SHA1_Update(&v5, a2, 0x10u);
  CC_SHA1_Update(&v5, a1, 8u);
  CC_SHA1_Final((unsigned __int8 *)md, &v5);
  double result = md[0];
  mppe_send_key = *(_OWORD *)md;
  mppe_recv_key = *(_OWORD *)md;
  return result;
}

void ChapMS(const void *a1, char *a2, int a3, uint64_t a4)
{
  *(unsigned char *)(a4 + 48) = 0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  uint64_t v8 = (unsigned char *)(a4 + 24);
  sub_100008CA8(a2, a3, data);
  CC_MD4(data, 2 * a3, (unsigned __int8 *)&md);
  sub_100008D04((uint64_t)a1, &md, v8, v9, v10);
  *(unsigned char *)(a4 + 48) = 1;
  sub_100008CA8(a2, a3, data);
  CC_MD4(data, 2 * a3, (unsigned __int8 *)&md);
  CC_MD4(&md, 0x10u, v11);
  mppe_set_keys(a1, v11);
  mppe_keys_set = 1;
}

uint64_t ChapMS2(const void *a1, _OWORD *a2, char *__s, char *a4, int a5, unsigned char *a6, char *a7, int a8)
{
  a6[48] = 0;
  *((_OWORD *)a6 + 1) = 0u;
  *((_OWORD *)a6 + 2) = 0u;
  *(_OWORD *)a6 = 0u;
  if (a2)
  {
    *(_OWORD *)a6 = *a2;
  }
  else
  {
    for (uint64_t i = 0; i != 16; ++i)
    {
      double v16 = drand48() * 254.0;
      a6[i] = (int)v16 + 1;
      byte_10004A2A8[i] = (int)v16 + 1;
    }
  }
  int v17 = a6 + 24;
  sub_100008DB4(a6, a1, __s, v28);
  sub_100008CA8(a4, a5, data);
  CC_MD4(data, 2 * a5, (unsigned __int8 *)&md);
  sub_100008D04((uint64_t)v28, (long long *)&md, a6 + 24, v18, v19);
  qmemcpy(v27, "Magic server to client signing constant", 39);
  qmemcpy(v28, "Pad to make it do more than one iteration", 41);
  memset(&md, 0, sizeof(md));
  sub_100008CA8(a4, a5, data);
  CC_MD4(data, 2 * a5, v30);
  CC_MD4(v30, 0x10u, v29);
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v29, 0x10u);
  CC_SHA1_Update(&md, a6 + 24, 0x18u);
  CC_SHA1_Update(&md, v27, 0x27u);
  int v20 = v33;
  CC_SHA1_Final(v33, &md);
  sub_100008DB4(a6, a1, __s, v37);
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v33, 0x14u);
  CC_SHA1_Update(&md, v37, 8u);
  size_t v21 = 41;
  CC_SHA1_Update(&md, v28, 0x29u);
  CC_SHA1_Final(v33, &md);
  do
  {
    int v22 = *v20++;
    snprintf(a7, v21, "%02X", v22);
    v21 -= 2;
    a7 += 2;
  }
  while (v21 != 1);
  memset(&md, 0, sizeof(md));
  uint64_t v35 = 0;
  *(_OWORD *)uint64_t v33 = 0u;
  long long v34 = 0u;
  unint64_t v32 = 0xF2F2F2F2F2F2F2F2;
  *(void *)&long long v23 = 0xF2F2F2F2F2F2F2F2;
  *((void *)&v23 + 1) = 0xF2F2F2F2F2F2F2F2;
  *(_OWORD *)uint64_t v30 = v23;
  long long v31 = v23;
  qmemcpy(v29, "This is the MPPE Master Key", 27);
  qmemcpy(v28, "On the client side, this is the send key; on the server side, it is the receive key.", 84);
  qmemcpy(v27, "On the client side, this is the receive key; on the server side, it is the send key.", 84);
  sub_100008CA8(a4, a5, data);
  CC_MD4(data, 2 * a5, v39);
  CC_MD4(v39, 0x10u, v38);
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v38, 0x10u);
  CC_SHA1_Update(&md, v17, 0x18u);
  CC_SHA1_Update(&md, v29, 0x1Bu);
  CC_SHA1_Final(v37, &md);
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v37, 0x10u);
  CC_SHA1_Update(&md, v33, 0x28u);
  if (a8) {
    uint64_t v24 = v27;
  }
  else {
    uint64_t v24 = v28;
  }
  if (a8) {
    uint64_t v25 = v28;
  }
  else {
    uint64_t v25 = v27;
  }
  CC_SHA1_Update(&md, v24, 0x54u);
  CC_SHA1_Update(&md, v30, 0x28u);
  CC_SHA1_Final(v36, &md);
  mppe_send_key = *(_OWORD *)v36;
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v37, 0x10u);
  CC_SHA1_Update(&md, v33, 0x28u);
  CC_SHA1_Update(&md, v25, 0x54u);
  CC_SHA1_Update(&md, v30, 0x28u);
  uint64_t result = CC_SHA1_Final(v36, &md);
  mppe_recv_key = *(_OWORD *)v36;
  mppe_keys_set = 1;
  return result;
}

void *chapms_init()
{
  chap_register_digest((uint64_t)&unk_100041EC8);
  chap_register_digest((uint64_t)&unk_100041F10);

  return add_options((uint64_t)&unk_10004A2B8);
}

void chapms_reinit()
{
  byte_10004A318 = 0;
  byte_10004A2A8 = 0;
}

void sub_100008CA8(char *a1, int a2, unsigned char *a3)
{
  int v3 = a3;
  bzero(a3, 2 * a2);
  if (a2 >= 1)
  {
    uint64_t v6 = a2;
    do
    {
      char v7 = *a1++;
      *int v3 = v7;
      v3 += 2;
      --v6;
    }
    while (v6);
  }
}

uint64_t sub_100008D04(uint64_t a1, long long *a2, unsigned char *a3, double a4, uint8x8_t a5)
{
  char v14 = 0;
  int v13 = 0;
  long long v12 = *a2;
  DesSetkey((uint64_t)&v12, *(uint8x8_t *)&v12, a5);
  DesEncrypt(a1, a3);
  DesSetkey((uint64_t)&v12 + 7, v7, v8);
  DesEncrypt(a1, a3 + 8);
  DesSetkey((unint64_t)&v12 | 0xE, v9, v10);
  return DesEncrypt(a1, a3 + 16);
}

uint64_t sub_100008DB4(const void *a1, const void *a2, char *__s, void *a4)
{
  CC_SHA1_CTX v5 = __s;
  memset(&v11, 0, sizeof(v11));
  uint8x8_t v8 = strrchr(__s, 92);
  if (v8) {
    CC_SHA1_CTX v5 = v8 + 1;
  }
  CC_SHA1_Init(&v11);
  CC_SHA1_Update(&v11, a1, 0x10u);
  CC_SHA1_Update(&v11, a2, 0x10u);
  CC_LONG v9 = strlen(v5);
  CC_SHA1_Update(&v11, v5, v9);
  uint64_t result = CC_SHA1_Final(md, &v11);
  *a4 = *(void *)md;
  return result;
}

unsigned char *sub_100008E94(unsigned char *a1)
{
  *a1 = 8;
  return random_bytes(a1 + 1, 8);
}

uint64_t sub_100008EA4(int a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a8;
  int v9 = a7;
  char v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  if (*(unsigned char *)a6 == 49)
  {
    if (*(unsigned char *)(a6 + 49))
    {
      ChapMS((const void *)(a5 + 1), a3, a4, (uint64_t)&v15);
      if (*(void *)(a6 + 25) == *((void *)&v16 + 1)
        && *(void *)(a6 + 33) == (void)v17
        && *(void *)(a6 + 41) == *((void *)&v17 + 1))
      {
        slprintf(v9, v8, "Access granted");
        return 1;
      }
    }
    else
    {
      notice((uint64_t)"Peer request for LANMAN auth not supported", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v14);
    }
  }
  slprintf(v9, v8, "E=691 R=1 C=%0.*B V=0");
  return 0;
}

void sub_100008FBC(unsigned char *a1, int a2, int a3, uint64_t a4, char *a5, int a6)
{
  *a1 = 49;
  ChapMS((const void *)(a4 + 1), a5, a6, (uint64_t)(a1 + 1));
}

uint64_t sub_100008FDC(const void *a1, int a2, char *a3, int a4)
{
  int v8 = (char *)malloc_type_malloc(a2 + 1, 0xB0DF468EuLL);
  if (!v8)
  {
    notice((uint64_t)"Out of memory in chapms_handle_failure", v9, v10, v11, v12, v13, v14, v15, v50);
    return 0;
  }
  long long v16 = v8;
  memcpy(v8, a1, a2);
  long long v17 = &v16[a2];
  *long long v17 = 0;
  if (!strncmp(v16, "E=", 2uLL))
  {
    int v27 = strtol(v16 + 2, 0, 10);
    int v28 = v27;
    if (a2)
    {
      uint64_t v29 = strstr(v16, " R=");
      if (v29)
      {
        if (retry_password_hook) {
          BOOL v30 = v29[3] == 49;
        }
        else {
          BOOL v30 = 0;
        }
        if (v30) {
          unsigned int v31 = 2;
        }
        else {
          unsigned int v31 = 0;
        }
      }
      else
      {
        unsigned int v31 = 0;
      }
      if (change_password_hook) {
        BOOL v33 = v28 == 648;
      }
      else {
        BOOL v33 = 0;
      }
      if (v33) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = v31;
      }
      long long v34 = strstr(v16, " M=");
      if (v34)
      {
        LODWORD(v17) = v34 + 3;
        strncpy(a3, v34 + 3, a4 - 1);
        a3[a4] = 0;
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v25 = v27 == 648 && change_password_hook != 0;
    }
    int v35 = v28 - 646;
    long long v17 = "E=646 Restricted logon hours";
    switch(v35)
    {
      case 0:
        goto LABEL_4;
      case 1:
        long long v17 = "E=647 Account disabled";
        goto LABEL_4;
      case 2:
        long long v17 = "E=648 Password expired";
        goto LABEL_4;
      case 3:
        long long v17 = "E=649 No dialin permission";
        goto LABEL_4;
      default:
        if ("E=646 Restricted logon hours" == 691)
        {
          long long v17 = "E=691 Authentication failure";
          goto LABEL_4;
        }
        if ("E=646 Restricted logon hours" == 709)
        {
          long long v17 = "E=709 Error changing password";
          goto LABEL_4;
        }
        free(v16);
        error((uint64_t)"error %d", v36, v37, v38, v39, v40, v41, v42, (int)"E=646 Restricted logon hours");
        error((uint64_t)"Unknown MS-CHAP authentication failure: %.*v", v43, v44, v45, v46, v47, v48, v49, a2);
        break;
    }
    return 0;
  }
  uint64_t v25 = 0;
LABEL_4:
  error((uint64_t)"MS-CHAP authentication failed: %v", v18, v19, v20, v21, v22, v23, v24, (int)v17);
  free(v16);
  return v25;
}

unsigned char *sub_100009224(unsigned char *a1)
{
  *a1 = 16;
  return random_bytes(a1 + 1, 16);
}

uint64_t sub_100009234(int a1, char *__s, char *a3, int a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  char v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  if (*(unsigned char *)a6 == 49
    && ((ChapMS2((const void *)(a5 + 1), (_OWORD *)(a6 + 1), __s, a3, a4, &v16, v15, 1),
         *((void *)&v17 + 1) == *(void *)(a6 + 25))
      ? (BOOL v11 = (void)v18 == *(void *)(a6 + 33))
      : (BOOL v11 = 0),
        v11 ? (BOOL v12 = *((void *)&v18 + 1) == *(void *)(a6 + 41)) : (BOOL v12 = 0),
        v12))
  {
    if (*(unsigned char *)(a6 + 49)) {
      uint64_t v14 = "S=%s";
    }
    else {
      uint64_t v14 = "S=%s M=%s";
    }
    slprintf(a7, a8, v14);
    return 1;
  }
  else
  {
    slprintf(a7, a8, "E=691 R=1 C=%0.*B V=0 M=%s");
    return 0;
  }
}

uint64_t sub_10000937C(unsigned char *a1, int a2, char *a3, uint64_t a4, char *a5, int a6, char *a7)
{
  char v7 = a2;
  *a1 = 49;
  if (byte_10004A2A8[0]) {
    BOOL v8 = byte_10004A318 == a2;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    uint64_t v9 = byte_10004A2A8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t result = ChapMS2((const void *)(a4 + 1), v9, a3, a5, a6, a1 + 1, a7, 0);
  byte_10004A318 = v7;
  return result;
}

uint64_t sub_1000093E4(const char *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2 - 42;
  if ((int)a2 < 42) {
    goto LABEL_3;
  }
  unsigned int v10 = a2;
  if (strncmp(a1, "S=", 2uLL)) {
    goto LABEL_3;
  }
  if (memcmp(a1 + 2, a3, 0x28uLL))
  {
    BOOL v12 = "MS-CHAPv2 mutual authentication failed.";
    goto LABEL_4;
  }
  uint64_t v14 = a1 + 42;
  if (v10 < 0x2D)
  {
    if (v8)
    {
      dbglog((uint64_t)"Rcvd non-conforming MSCHAPv2 Success packet, len=%d", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v8);
      if (v10 < 0x2C) {
        goto LABEL_3;
      }
      goto LABEL_12;
    }
  }
  else if (strncmp(v14, " M=", 3uLL))
  {
    dbglog((uint64_t)"Rcvd non-conforming MSCHAPv2 Success packet, len=%d", v15, v16, v17, v18, v19, v20, v21, v8);
LABEL_12:
    if (!strncmp(v14, "M=", 2uLL)) {
      return 1;
    }
LABEL_3:
    BOOL v12 = "MS-CHAPv2 Success packet is badly formed.";
LABEL_4:
    error((uint64_t)v12, a2, (uint64_t)a3, a4, a5, a6, a7, a8, v22);
    return 0;
  }
  return 1;
}

uint64_t sub_1000094DC(uint64_t a1, char *a2, unsigned char *a3, char *a4, int a5, char *a6, int a7, char *a8)
{
  int v13 = a3[2];
  int v14 = a3[3];
  *(unsigned char *)a1 = 7;
  *(unsigned char *)(a1 + 1) = a3[1] + 1;
  *(_WORD *)(a1 + 2) = 18946;
  sub_100008CA8(a4, a5, data);
  CC_MD4(data, 2 * a5, md);
  sub_100008CA8(a6, a7, __src);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
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
  *(_OWORD *)uint64_t v41 = 0u;
  long long v42 = 0u;
  random_bytes(v39, 516);
  memcpy(&v39[512 - 2 * a7], __src, 2 * a7);
  uint64_t v15 = 0;
  int v40 = 2 * a7;
  int8x16_t v16 = (int8x16_t)xmmword_10003B000;
  v17.i64[0] = 0x1010101010101010;
  v17.i64[1] = 0x1010101010101010;
  do
  {
    *(int8x16_t *)&v41[v15] = v16;
    v15 += 16;
    int8x16_t v16 = vaddq_s8(v16, v17);
  }
  while (v15 != 256);
  uint64_t v18 = 0;
  unsigned __int8 v19 = 0;
  __int16 v57 = 0;
  int v20 = v14 | (v13 << 8);
  do
  {
    unsigned __int8 v21 = v41[v18];
    v19 += v21 + md[v18 & 0xF];
    v41[v18] = v41[v19];
    v41[v19] = v21;
    ++v18;
  }
  while (v18 != 256);
  uint64_t v22 = 0;
  int v23 = v57;
  int v24 = HIBYTE(v57);
  do
  {
    int v25 = v41[++v23];
    v24 += v25;
    v41[v23] = v41[v24];
    v41[v24] = v25;
    *(unsigned char *)(a1 + 4 + v22) = v41[(v41[v23] + v25)] ^ v39[v22];
    ++v22;
  }
  while (v22 != 516);
  sub_100008CA8(a4, a5, v39);
  CC_MD4(v39, 2 * a5, __src);
  sub_100008CA8(a6, a7, data);
  CC_MD4(data, 2 * a7, v41);
  DesSetkey((uint64_t)v41, v26, v27);
  DesEncrypt((uint64_t)__src, (unsigned char *)(a1 + 520));
  DesSetkey((uint64_t)&v41[7], v28, v29);
  DesEncrypt((uint64_t)&v37, (unsigned char *)(a1 + 528));
  int v30 = v20 - 4;
  if (v20 != 4)
  {
    unsigned int v31 = a3 + 7;
    while (strncmp((const char *)v31 - 3, " C=", 3uLL))
    {
      ++v31;
      if (!--v30) {
        goto LABEL_13;
      }
    }
    sub_100009914(v31, (uint64_t)v39);
    ChapMS2(v39, 0, a2, a6, a7, (unsigned char *)(a1 + 536), a8, 0);
  }
LABEL_13:
  *(unsigned char *)(a1 + 585) = 0;
  return 0;
}

uint64_t sub_1000097D0(unsigned char *a1, char *__s, uint64_t a3, char *a4, int a5, char *a6)
{
  int v12 = strlen(__s);
  unsigned int v13 = __rev16(*(unsigned __int16 *)(a3 + 2));
  *a1 = 2;
  a1[1] = *(unsigned char *)(a3 + 1) + 1;
  a1[2] = (unsigned __int16)(v12 + 54) >> 8;
  a1[3] = v12 + 54;
  unsigned int v14 = v13 - 4;
  if (v13 != 4)
  {
    for (uint64_t i = (unsigned __int8 *)(a3 + 7); strncmp((const char *)i - 3, " C=", 3uLL); ++i)
    {
      if (!--v14) {
        return 0;
      }
    }
    sub_100009914(i, (uint64_t)v17);
    a1[4] = 49;
    ChapMS2(v17, 0, __s, a4, a5, a1 + 5, a6, 0);
    memcpy(a1 + 54, __s, v12);
  }
  return 0;
}

unsigned __int8 *sub_100009914(unsigned __int8 *result, uint64_t a2)
{
  for (uint64_t i = 0; i != 64; ++i)
  {
    int v3 = *result;
    char v4 = v3 - 48;
    if ((v3 - 48) >= 0xA)
    {
      if ((v3 - 97) > 5)
      {
        if ((v3 - 65) >= 6) {
          char v4 = *(unsigned char *)(a2 + i);
        }
        else {
          char v4 = v3 - 55;
        }
      }
      else
      {
        char v4 = v3 - 87;
      }
    }
    char v5 = 16 * v4;
    *(unsigned char *)(a2 + i) = 16 * v4;
    int v6 = result[1];
    char v7 = v6 - 48;
    if ((v6 - 48) >= 0xA)
    {
      if ((v6 - 97) > 5)
      {
        if ((v6 - 65) > 5) {
          goto LABEL_14;
        }
        char v7 = v6 - 55;
      }
      else
      {
        char v7 = v6 - 87;
      }
    }
    *(unsigned char *)(a2 + i) = v7 | v5;
LABEL_14:
    result += 2;
  }
  return result;
}

uint64_t demand_conf()
{
  framemax = 1506;
  frame = (uint64_t)malloc_type_malloc(0x5E2uLL, 0xF85FA6C4uLL);
  if (!frame) {
    novm();
  }
  framelen = 0;
  pend_q = 0;
  escape_flag = 0;
  flush_flag = 0;
  fcs = 0xFFFF;
  if (dword_1000479A8 >= 1500) {
    int v0 = 1500;
  }
  else {
    int v0 = dword_1000479A8;
  }
  netif_set_mtu(0, v0);
  if ((ppp_send_config(0, 1500, 0, 0, 0) & 0x80000000) != 0
    || (uint64_t result = ppp_recv_config(0, 1500, 0, 0, 0), (result & 0x80000000) != 0))
  {
    fatal();
  }
  uint64_t v2 = protocols;
  if (protocols)
  {
    int v3 = (__int16 **)&off_100043898;
    do
    {
      if (*((unsigned char *)v2 + 80))
      {
        char v4 = (uint64_t (*)(void))*((void *)v2 + 15);
        if (v4)
        {
          uint64_t result = v4(0);
          if (!result) {
            die(1);
          }
        }
      }
      char v5 = *v3++;
      uint64_t v2 = v5;
    }
    while (v5);
  }
  return result;
}

uint64_t demand_block()
{
  int v0 = protocols;
  if (protocols)
  {
    int v1 = (__int16 **)&off_100043898;
    do
    {
      if (*((unsigned char *)v0 + 80) && *((void *)v0 + 15)) {
        sifnpmode(0, *v0 & 0x7FFF, 3);
      }
      uint64_t v2 = *v1++;
      int v0 = v2;
    }
    while (v2);
  }

  return get_loop_output();
}

void *demand_discard()
{
  int v0 = protocols;
  if (protocols)
  {
    int v1 = (__int16 **)&off_100043898;
    do
    {
      if (*((unsigned char *)v0 + 80) && *((void *)v0 + 15)) {
        sifnpmode(0, *v0 & 0x7FFF, 2);
      }
      uint64_t v2 = *v1++;
      int v0 = v2;
    }
    while (v2);
  }
  get_loop_output();
  uint64_t result = (void *)pend_q;
  if (pend_q)
  {
    do
    {
      char v4 = (void *)result[1];
      free(result);
      uint64_t result = v4;
    }
    while (v4);
  }
  pend_q = 0;
  framelen = 0;
  flush_flag = 0;
  escape_flag = 0;
  fcs = 0xFFFF;
  return result;
}

uint64_t demand_unblock()
{
  int v0 = protocols;
  if (protocols)
  {
    int v1 = (__int16 **)&off_100043898;
    do
    {
      if (*((unsigned char *)v0 + 80))
      {
        if (*((void *)v0 + 15)) {
          uint64_t result = sifnpmode(0, *v0 & 0x7FFF, 0);
        }
      }
      int v3 = *v1++;
      int v0 = v3;
    }
    while (v3);
  }
  return result;
}

uint64_t loop_chars(unsigned __int8 *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 >= 1)
  {
    uint64_t v9 = 0;
    int v10 = a2 + 1;
    while (1)
    {
      int v12 = *a1++;
      int v11 = v12;
      if (v12 == 126)
      {
        int v13 = framelen;
        if (escape_flag) {
          BOOL v14 = 0;
        }
        else {
          BOOL v14 = flush_flag == 0;
        }
        if (v14 && framelen >= 3 && fcs == 61624)
        {
          framelen -= 2;
          if (loop_frame(frame, (v13 - 2), a3, a4, a5, a6, a7, a8)) {
            uint64_t v9 = 1;
          }
          else {
            uint64_t v9 = v9;
          }
        }
        framelen = 0;
        flush_flag = 0;
        escape_flag = 0;
        fcs = 0xFFFF;
        goto LABEL_20;
      }
      if (!flush_flag)
      {
        if (escape_flag)
        {
          LOBYTE(v11) = v11 ^ 0x20;
          escape_flag = 0;
LABEL_26:
          uint64_t v17 = framelen;
          if (framelen >= framemax)
          {
            flush_flag = 1;
          }
          else
          {
            ++framelen;
            *(unsigned char *)(frame + v17) = v11;
            fcs = word_10003B124[(fcs ^ v11)] ^ (fcs >> 8);
          }
          goto LABEL_20;
        }
        if (v11 != 125) {
          goto LABEL_26;
        }
        escape_flag = 1;
      }
LABEL_20:
      if (--v10 <= 1) {
        return v9;
      }
    }
  }
  return 0;
}

uint64_t loop_frame(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dbglog((uint64_t)"Dial on demand: %P", a2, a3, a4, a5, a6, a7, a8, a1);
  if ((int)a2 < 4) {
    return 0;
  }
  if (*(char *)(a1 + 2) < 0) {
    return 0;
  }
  int v10 = protocols;
  if (!protocols) {
    return 0;
  }
  for (uint64_t i = (__int16 **)&off_100043898; ; ++i)
  {
    unsigned int v12 = (unsigned __int16)*v10;
    unsigned int v13 = v12 >> 14;
    int v14 = v12 & 0x7FFF;
    if (v13 <= 2 && (*(unsigned __int8 *)(a1 + 3) | (*(unsigned __int8 *)(a1 + 2) << 8)) == v14) {
      break;
    }
    int8x16_t v16 = *i;
    int v10 = v16;
    if (!v16) {
      return 0;
    }
  }
  if (!*((unsigned char *)v10 + 80)) {
    return 0;
  }
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))*((void *)v10 + 16);
  if (!v18 || (uint64_t result = v18(a1, a2), result))
  {
    unsigned __int8 v19 = malloc_type_malloc(a2 + 24, 0x79C8835EuLL);
    if (v19)
    {
      uint64_t v20 = (uint64_t)v19;
      *(_DWORD *)unsigned __int8 v19 = a2;
      v19[1] = 0;
      memcpy(v19 + 2, (const void *)a1, a2);
      unsigned __int8 v21 = &pend_q;
      if (pend_q) {
        unsigned __int8 v21 = (uint64_t *)(pend_qtail + 8);
      }
      *unsigned __int8 v21 = v20;
      pend_qtail = v20;
    }
    return 1;
  }
  return result;
}

void demand_rexmit(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = pend_q;
  pend_q = 0;
  if (!v8)
  {
    unsigned int v12 = &pend_qtail;
    goto LABEL_13;
  }
  uint64_t v10 = 0;
  do
  {
    while (1)
    {
      int v11 = (unsigned __int16 *)v8;
      uint64_t v8 = *(void *)(v8 + 8);
      if (a1 != bswap32(v11[9]) >> 16) {
        break;
      }
      output(0, (uint64_t)(v11 + 8), *(unsigned int *)v11, a4, a5, a6, a7, a8, v13);
      free(v11);
      if (!v8) {
        goto LABEL_10;
      }
    }
    if (v10) {
      *(void *)(v10 + 8) = v11;
    }
    else {
      pend_q = (uint64_t)v11;
    }
    uint64_t v10 = (uint64_t)v11;
  }
  while (v8);
LABEL_10:
  pend_qtail = v10;
  if (v10)
  {
    unsigned int v12 = (uint64_t *)(v10 + 8);
LABEL_13:
    *unsigned int v12 = 0;
  }
}

double fsm_init(uint64_t a1)
{
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)&double result = 0xA00000003;
  *(void *)(a1 + 20) = 0xA00000003;
  *(_DWORD *)(a1 + 32) = 2;
  *(_DWORD *)(a1 + 40) = 5;
  *(_DWORD *)(a1 + 48) = 255;
  *(_DWORD *)(a1 + 72) = 0;
  return result;
}

void fsm_lowerup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *(_DWORD *)(a1 + 8);
  if (v9)
  {
    if (v9 != 1) {
      return;
    }
    if ((*(unsigned char *)(a1 + 12) & 4) != 0)
    {
      int v10 = 3;
    }
    else
    {
      sub_100009FFC((int *)a1, 0, a3, a4, a5, a6, a7, a8);
      int v10 = 6;
    }
  }
  else
  {
    int v10 = 2;
  }
  *(_DWORD *)(a1 + 8) = v10;
}

void sub_100009FFC(int *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a1[2] - 6) >= 3)
  {
    int v10 = (void (*)(int *))**((void **)a1 + 7);
    if (v10) {
      v10(a1);
    }
    a1[9] = 0;
    a1[11] = 0;
  }
  if (!a2)
  {
    a1[7] = a1[6];
    char v11 = *((unsigned char *)a1 + 16) + 1;
    *((unsigned char *)a1 + 16) = v11;
    *((unsigned char *)a1 + 17) = v11;
    ++a1[11];
  }
  *((unsigned char *)a1 + 18) = 0;
  uint64_t v12 = *((void *)a1 + 7);
  int v13 = *(uint64_t (**)(int *))(v12 + 8);
  if (v13 && *(void *)(v12 + 16))
  {
    int v14 = v13(a1);
    int v15 = peer_mru[*a1] - 4;
    if (v14 >= v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v14;
    }
    unsigned int v19 = v16;
    uint64_t v17 = *(void (**)(int *, char *, unsigned int *))(*((void *)a1 + 7) + 16);
    if (v17)
    {
      v17(a1, &byte_100048124, &v19);
      uint64_t v16 = v19;
    }
  }
  else
  {
    uint64_t v16 = 0;
    unsigned int v19 = 0;
  }
  fsm_sdata((unsigned int *)a1, 1, *((unsigned char *)a1 + 17), &byte_100048124, v16, a6, a7, a8, v18);
  --a1[7];
  timeout((int)sub_10000A238);
}

void fsm_lowerdown(uint64_t a1)
{
  switch(*(_DWORD *)(a1 + 8))
  {
    case 2:
      *(_DWORD *)(a1 + 8) = 0;
      break;
    case 3:
      *(_DWORD *)(a1 + 8) = 1;
      uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 56) + 72);
      if (v2)
      {
        v2();
      }
      break;
    case 4:
      *(_DWORD *)(a1 + 8) = 0;
      goto LABEL_3;
    case 5:
    case 6:
    case 7:
    case 8:
      *(_DWORD *)(a1 + 8) = 1;
LABEL_3:
      untimeout((uint64_t)sub_10000A238, a1);
      break;
    case 9:
      int v3 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64);
      if (v3) {
        v3(a1);
      }
      *(_DWORD *)(a1 + 8) = 1;
      break;
    default:
      return;
  }
}

void sub_10000A238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *(_DWORD *)(a1 + 8);
  if ((v9 - 6) >= 3)
  {
    if ((v9 - 4) > 1) {
      return;
    }
    if (*(int *)(a1 + 28) > 0)
    {
      char v12 = *(unsigned char *)(a1 + 16) + 1;
      *(unsigned char *)(a1 + 16) = v12;
      *(unsigned char *)(a1 + 17) = v12;
      fsm_sdata((unsigned int *)a1, 5, v12, *(char **)(a1 + 64), *(unsigned int *)(a1 + 72), a6, a7, a8, v15);
      timeout((int)sub_10000A238);
      --*(_DWORD *)(a1 + 28);
      return;
    }
    if (v9 == 4) {
      int v13 = 2;
    }
    else {
      int v13 = 3;
    }
    *(_DWORD *)(a1 + 8) = v13;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    if (*(int *)(a1 + 28) > 0)
    {
      char v11 = *(void (**)(uint64_t))(v10 + 96);
      if (v11) {
        v11(a1);
      }
      sub_100009FFC(a1, 1);
      if (*(_DWORD *)(a1 + 8) == 7) {
        *(_DWORD *)(a1 + 8) = 6;
      }
      return;
    }
    warning((uint64_t)"%s: timeout sending Config-Requests\n", a2, a3, a4, a5, a6, a7, a8, *(void *)(v10 + 112));
    *(_DWORD *)(a1 + 8) = 3;
    if (*(unsigned char *)(a1 + 12)) {
      return;
    }
  }
  int v14 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 80);
  if (v14)
  {
    v14(a1);
  }
}

void fsm_open(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(*(_DWORD *)(a1 + 8))
  {
    case 0:
      *(_DWORD *)(a1 + 8) = 1;
      int v9 = *(void (**)(void))(*(void *)(a1 + 56) + 72);
      if (v9)
      {
        v9();
      }
      break;
    case 2:
      if ((*(unsigned char *)(a1 + 12) & 4) != 0)
      {
        int v17 = 3;
      }
      else
      {
        sub_100009FFC((int *)a1, 0, a3, a4, a5, a6, a7, a8);
        int v17 = 6;
      }
      *(_DWORD *)(a1 + 8) = v17;
      break;
    case 3:
    case 9:
      goto LABEL_7;
    case 4:
      *(_DWORD *)(a1 + 8) = 5;
LABEL_7:
      if ((*(unsigned char *)(a1 + 12) & 2) != 0)
      {
        fsm_lowerdown(a1);
        fsm_lowerup(a1, v10, v11, v12, v13, v14, v15, v16);
      }
      break;
    default:
      return;
  }
}

void fsm_close(uint64_t a1, char *__s, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(a1 + 64) = __s;
  if (__s) {
    int v9 = strlen(__s);
  }
  else {
    int v9 = 0;
  }
  *(_DWORD *)(a1 + 72) = v9;
  int v10 = 0;
  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      goto LABEL_8;
    case 3:
      int v10 = 2;
      goto LABEL_8;
    case 5:
      goto LABEL_7;
    case 6:
    case 7:
    case 8:
      untimeout((uint64_t)sub_10000A238, a1);
      goto LABEL_6;
    case 9:
      uint64_t v12 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64);
      if (v12) {
        v12(a1);
      }
LABEL_6:
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(a1 + 32);
      char v11 = *(unsigned char *)(a1 + 16) + 1;
      *(unsigned char *)(a1 + 16) = v11;
      *(unsigned char *)(a1 + 17) = v11;
      fsm_sdata((unsigned int *)a1, 5, v11, *(char **)(a1 + 64), *(unsigned int *)(a1 + 72), a6, a7, a8, v13);
      timeout((int)sub_10000A238);
      --*(_DWORD *)(a1 + 28);
LABEL_7:
      int v10 = 4;
LABEL_8:
      *(_DWORD *)(a1 + 8) = v10;
      break;
    default:
      return;
  }
}

void fsm_sdata(unsigned int *a1, char a2, char a3, char *__src, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (peer_mru[*a1] - 4 >= (int)a5) {
    int v12 = a5;
  }
  else {
    int v12 = peer_mru[*a1] - 4;
  }
  if (v12) {
    BOOL v13 = __src == &byte_100048124;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13) {
    memcpy(&byte_100048124, __src, v12);
  }
  LOWORD(outpacket_buf) = 1023;
  int v14 = a1[1];
  BYTE2(outpacket_buf) = BYTE1(v14);
  HIBYTE(outpacket_buf) = v14;
  LOBYTE(word_100048120) = a2;
  HIBYTE(word_100048120) = a3;
  LOBYTE(word_100048122) = (unsigned __int16)(v12 + 4) >> 8;
  HIBYTE(word_100048122) = v12 + 4;
  uint64_t v15 = *a1;

  output(v15, (uint64_t)&outpacket_buf, (v12 + 8), (uint64_t)__src, a5, a6, a7, a8, a9);
}

void fsm_input(uint64_t a1, char *__src, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if ((int)a3 >= 4)
  {
    uint64_t v10 = __rev16(*((unsigned __int16 *)__src + 1));
    BOOL v11 = v10 < 4 || v10 > a3;
    if (!v11 && *(_DWORD *)(a1 + 8) >= 2u)
    {
      uint64_t v13 = *__src;
      int v14 = __src[1];
      switch((int)v13)
      {
        case 1:
          unsigned __int8 v25 = __src[1];
          sub_10000AA84(a1, v25, (uint64_t)(__src + 4), (v10 - 4), a5, a6, a7, a8, a9);
          break;
        case 2:
          uint64_t v26 = __src[1];
          sub_10000AD34(a1, v26, (uint64_t)(__src + 4), (v10 - 4), a5, a6, a7, a8, a9);
          break;
        case 3:
        case 4:
          if (*(unsigned __int8 *)(a1 + 17) == v14 && !*(unsigned char *)(a1 + 18))
          {
            uint64_t v15 = 40;
            if (v13 == 3) {
              uint64_t v15 = 32;
            }
            uint64_t v16 = *(uint64_t (**)(uint64_t, char *, void))(*(void *)(a1 + 56) + v15);
            if (v16 && (int v17 = v16(a1, __src + 4, (v10 - 4))) != 0)
            {
              *(unsigned char *)(a1 + 18) = 1;
              switch(*(_DWORD *)(a1 + 8))
              {
                case 2:
                case 3:
                  int v18 = (unsigned int *)a1;
                  char v19 = 6;
                  char v20 = v14;
                  unsigned __int8 v21 = 0;
                  uint64_t v22 = 0;
                  goto LABEL_20;
                case 6:
                case 8:
                  int v28 = v17;
                  untimeout((uint64_t)sub_10000A238, a1);
                  if (v28 < 0)
                  {
                    int v37 = 3;
LABEL_49:
                    *(_DWORD *)(a1 + 8) = v37;
                  }
                  else if (*(_DWORD *)(a1 + 44) >= *(_DWORD *)(a1 + 48))
                  {
                    warning((uint64_t)"%s: Maximum Config-Requests exceeded\n", v29, v30, v31, v32, v33, v34, v35, *(void *)(*(void *)(a1 + 56) + 112));
                    *(_DWORD *)(a1 + 8) = 3;
                    if ((*(unsigned char *)(a1 + 12) & 1) == 0)
                    {
                      uint64_t v38 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 80);
                      if (v38)
                      {
                        v38(a1);
                      }
                    }
                  }
                  else
                  {
                    sub_100009FFC((int *)a1, 0, v30, v31, v32, v33, v34, v35);
                  }
                  break;
                case 7:
                  untimeout((uint64_t)sub_10000A238, a1);
                  goto LABEL_47;
                case 9:
                  uint64_t v36 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64);
                  if (v36) {
                    v36(a1);
                  }
LABEL_47:
                  sub_100009FFC((int *)a1, 0, a3, a4, a5, a6, a7, a8);
                  int v37 = 6;
                  goto LABEL_49;
                default:
                  return;
              }
            }
            else
            {
              error((uint64_t)"Received bad configure-nak/rej: %P", v13, a3, a4, a5, a6, a7, a8, __src + 4);
            }
          }
          break;
        case 5:
          uint64_t v27 = __src[1];
          sub_10000AF00(a1, v27, (uint64_t)(__src + 4), (v10 - 4), a5, a6, a7, a8, a9);
          break;
        case 6:
          sub_10000AFE8(a1, v13, a3, a4, a5, a6, a7, a8);
          break;
        case 7:
          sub_10000B0E4(a1, (uint64_t)(__src + 4), (v10 - 4), a4, a5, a6, a7, a8);
          break;
        default:
          int v23 = *(unsigned int (**)(uint64_t))(*(void *)(a1 + 56) + 104);
          if (!v23 || !v23(a1))
          {
            char v24 = *(unsigned char *)(a1 + 16) + 1;
            *(unsigned char *)(a1 + 16) = v24;
            char v20 = v24;
            int v18 = (unsigned int *)a1;
            char v19 = 7;
            unsigned __int8 v21 = __src;
            uint64_t v22 = v10;
LABEL_20:
            fsm_sdata(v18, v19, v20, v21, v22, a6, a7, a8, a9);
          }
          break;
      }
    }
  }
}

void sub_10000AA84(uint64_t a1, unsigned __int8 a2, uint64_t __src, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v10 = (char *)__src;
  int v32 = a4;
  switch(*(_DWORD *)(a1 + 8))
  {
    case 2:
      char v13 = a2;
      char v14 = 6;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      goto LABEL_3;
    case 3:
      goto LABEL_16;
    case 4:
    case 5:
      return;
    case 9:
      if (*(unsigned __int8 *)(a1 + 52) != a2) {
        goto LABEL_14;
      }
      if ((int)a4 < 1)
      {
        unsigned __int16 v17 = 0;
      }
      else
      {
        unsigned __int16 v17 = 0;
        int v18 = a4;
        char v19 = (unsigned __int8 *)__src;
        do
        {
          int v20 = *v19++;
          unsigned __int16 v17 = word_10003B330[v20 ^ ((unsigned __int16)(v17 & 0xFF00) >> 8)] ^ (v17 << 8);
          --v18;
        }
        while (v18);
      }
      if (*(unsigned __int16 *)(a1 + 54) != v17)
      {
LABEL_14:
        unsigned __int8 v21 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64);
        if (v21) {
          v21(a1);
        }
LABEL_16:
        sub_100009FFC((int *)a1, 0, __src, a4, a5, a6, a7, a8);
        *(_DWORD *)(a1 + 8) = 6;
LABEL_17:
        uint64_t v22 = *(uint64_t (**)(uint64_t, char *, int *, BOOL))(*(void *)(a1 + 56) + 48);
        if (v22)
        {
          int v23 = v22(a1, v10, &v32, *(_DWORD *)(a1 + 36) >= *(_DWORD *)(a1 + 40));
          fsm_sdata((unsigned int *)a1, v23, a2, v10, v32, v24, v25, v26, v31);
          if (v23 == 2) {
            goto LABEL_27;
          }
        }
        else
        {
          if (!a4)
          {
            fsm_sdata((unsigned int *)a1, 2, a2, v10, a4, a6, a7, a8, v31);
LABEL_27:
            if (*(_DWORD *)(a1 + 8) == 7)
            {
              untimeout((uint64_t)sub_10000A238, a1);
              *(_DWORD *)(a1 + 8) = 9;
              uint64_t v27 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 56);
              if (v27) {
                v27(a1);
              }
            }
            else
            {
              *(_DWORD *)(a1 + 8) = 8;
            }
            *(_DWORD *)(a1 + 36) = 0;
            *(unsigned char *)(a1 + 52) = a2;
            int v28 = v32;
            if (v32 < 1)
            {
              __int16 v29 = 0;
            }
            else
            {
              __int16 v29 = 0;
              do
              {
                int v30 = *v10++;
                __int16 v29 = word_10003B330[v30 ^ ((unsigned __int16)(v29 & 0xFF00) >> 8)] ^ (v29 << 8);
                --v28;
              }
              while (v28);
            }
            *(_WORD *)(a1 + 54) = v29;
            return;
          }
          int v23 = 4;
          fsm_sdata((unsigned int *)a1, 4, a2, v10, a4, a6, a7, a8, v31);
        }
        if (*(_DWORD *)(a1 + 8) != 7) {
          *(_DWORD *)(a1 + 8) = 6;
        }
        if (v23 == 3) {
          ++*(_DWORD *)(a1 + 36);
        }
        return;
      }
      char v13 = a2;
      char v14 = 2;
      uint64_t v15 = v10;
      uint64_t v16 = a4;
LABEL_3:
      fsm_sdata((unsigned int *)a1, v14, v13, v15, v16, a6, a7, a8, a9);
      return;
    default:
      goto LABEL_17;
  }
}

void sub_10000AD34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (*(unsigned __int8 *)(a1 + 17) != a2 || *(unsigned char *)(a1 + 18)) {
    return;
  }
  int v10 = a3;
  char v11 = a2;
  int v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 24);
  if (v12)
  {
    if (v12(a1, a3, a4)) {
      goto LABEL_5;
    }
LABEL_10:
    error((uint64_t)"Received bad configure-ack: %P", a2, a3, a4, a5, a6, a7, a8, v10);
    return;
  }
  if (a4) {
    goto LABEL_10;
  }
LABEL_5:
  *(unsigned char *)(a1 + 18) = 1;
  switch(*(_DWORD *)(a1 + 8))
  {
    case 2:
    case 3:
      fsm_sdata((unsigned int *)a1, 6, v11, 0, 0, a6, a7, a8, a9);
      break;
    case 6:
      *(_DWORD *)(a1 + 8) = 7;
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(a1 + 24);
      break;
    case 7:
      untimeout((uint64_t)sub_10000A238, a1);
      goto LABEL_19;
    case 8:
      untimeout((uint64_t)sub_10000A238, a1);
      *(_DWORD *)(a1 + 8) = 9;
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(a1 + 24);
      char v13 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 56);
      if (v13)
      {
        v13(a1);
      }
      break;
    case 9:
      char v14 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64);
      if (v14) {
        v14(a1);
      }
LABEL_19:
      sub_100009FFC((int *)a1, 0, a3, a4, a5, a6, a7, a8);
      *(_DWORD *)(a1 + 8) = 6;
      break;
    default:
      return;
  }
}

void sub_10000AF00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9 = a2;
  int v11 = *(_DWORD *)(a1 + 8);
  if ((v11 - 7) >= 2)
  {
    if (v11 == 9)
    {
      if ((int)a4 < 1) {
        info((uint64_t)"%s terminated by peer", a2, a3, a4, a5, a6, a7, a8, *(void *)(*(void *)(a1 + 56) + 112));
      }
      else {
        info((uint64_t)"%s terminated by peer (%0.*v)", a2, a3, a4, a5, a6, a7, a8, *(void *)(*(void *)(a1 + 56) + 112));
      }
      *(_DWORD *)(a1 + 28) = 0;
      *(_DWORD *)(a1 + 8) = 5;
      int v12 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64);
      if (v12) {
        v12(a1);
      }
      timeout((int)sub_10000A238);
    }
  }
  else
  {
    *(_DWORD *)(a1 + 8) = 6;
  }

  fsm_sdata((unsigned int *)a1, 6, v9, 0, 0, a6, a7, a8, a9);
}

void sub_10000AFE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(*(_DWORD *)(a1 + 8))
  {
    case 4:
      untimeout((uint64_t)sub_10000A238, a1);
      int v9 = 2;
      goto LABEL_4;
    case 5:
      untimeout((uint64_t)sub_10000A238, a1);
      int v9 = 3;
LABEL_4:
      *(_DWORD *)(a1 + 8) = v9;
      int v10 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 80);
      if (v10)
      {
        v10(a1);
      }
      return;
    case 7:
      goto LABEL_11;
    case 9:
      int v11 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64);
      if (v11) {
        v11(a1);
      }
      sub_100009FFC((int *)a1, 0, a3, a4, a5, a6, a7, a8);
LABEL_11:
      *(_DWORD *)(a1 + 8) = 6;
      break;
    default:
      return;
  }
}

void sub_10000B0E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((int)a3 >= 4)
  {
    warning((uint64_t)"%s: Rcvd Code-Reject for code %d, id %d", a2, a3, a4, a5, a6, a7, a8, *(void *)(*(void *)(a1 + 56) + 112));
    if (*(_DWORD *)(a1 + 8) == 7) {
      *(_DWORD *)(a1 + 8) = 6;
    }
  }
}

uint64_t crc16(unsigned __int8 *a1, int a2)
{
  if (a2 < 1)
  {
    return 0;
  }
  else
  {
    unsigned __int16 v2 = 0;
    do
    {
      int v3 = *a1++;
      unsigned __int16 v2 = word_10003B330[v3 ^ ((unsigned __int16)(v2 & 0xFF00) >> 8)] ^ (v2 << 8);
      --a2;
    }
    while (a2);
  }
  return v2;
}

void fsm_protreject(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(*(_DWORD *)(a1 + 8))
  {
    case 2:
      goto LABEL_5;
    case 3:
      goto LABEL_3;
    case 4:
      untimeout((uint64_t)sub_10000A238, a1);
LABEL_5:
      int v9 = 2;
      goto LABEL_6;
    case 5:
    case 6:
    case 7:
    case 8:
      untimeout((uint64_t)sub_10000A238, a1);
LABEL_3:
      int v9 = 3;
LABEL_6:
      *(_DWORD *)(a1 + 8) = v9;
      int v10 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 80);
      if (v10)
      {
        v10(a1);
      }
      break;
    case 9:
      int v11 = *(void (**)(uint64_t))(*(void *)(a1 + 56) + 64);
      if (v11) {
        v11(a1);
      }
      *(_DWORD *)(a1 + 28) = *(_DWORD *)(a1 + 32);
      char v12 = *(unsigned char *)(a1 + 16) + 1;
      *(unsigned char *)(a1 + 16) = v12;
      *(unsigned char *)(a1 + 17) = v12;
      fsm_sdata((unsigned int *)a1, 5, v12, *(char **)(a1 + 64), *(unsigned int *)(a1 + 72), a6, a7, a8, v13);
      timeout((int)sub_10000A238);
      --*(_DWORD *)(a1 + 28);
      *(_DWORD *)(a1 + 8) = 5;
      break;
    default:
      return;
  }
}

double sub_10000B2E4(int a1)
{
  int v1 = (char *)&ipcp_fsm + 80 * a1;
  unsigned __int16 v2 = (char *)&ipcp_wantoptions + 52 * a1;
  int v3 = (char *)&ipcp_allowoptions + 52 * a1;
  *(_DWORD *)int v1 = a1;
  *((_DWORD *)v1 + 1) = 32801;
  *((void *)v1 + 7) = off_100042CC0;
  fsm_init((uint64_t)v1);
  *(_OWORD *)unsigned __int16 v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_DWORD *)v2 + 12) = 0;
  *((_OWORD *)v2 + 2) = 0u;
  *(_OWORD *)int v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_DWORD *)v3 + 12) = 0;
  *(_WORD *)unsigned __int16 v2 = 257;
  v2[5] = 1;
  *(void *)&double result = 0xF0000002DLL;
  *((void *)v2 + 2) = 0xF0000002DLL;
  v2[24] = 1;
  *(_WORD *)int v3 = 257;
  *((_DWORD *)v3 + 5) = 15;
  v3[24] = 1;
  *((_WORD *)v3 + 2) = 257;
  v3[3] = 1;
  return result;
}

void sub_10000B39C(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

void sub_10000B3B0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B3C4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B3D8(int a1)
{
}

void sub_10000B3EC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  byte_10004A398 = 1;
}

void sub_10000B420(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_10000B434(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0;
  }
  unsigned int v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  int v7 = v6 - 4;
  if (v6 < 4 || v6 > a2) {
    return 0;
  }
  int v11 = *a1;
  int v12 = a1[1];
  int v13 = a1 + 4;
  if ((v11 - 1) > 6) {
    char v14 = " code=0x%x";
  }
  else {
    char v14 = " %s";
  }
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if ((v11 - 1) < 4)
  {
    if (v6 >= 6)
    {
      while (1)
      {
        uint64_t v15 = v13[1];
        if (v15 < 2 || v7 < v15) {
          goto LABEL_49;
        }
        int v17 = *v13;
        a3(a4, " <");
        if (v17 > 128)
        {
          int v18 = v13;
          switch(v17)
          {
            case 129:
            case 131:
              int v18 = v13 + 6;
              htonl();
              uint64_t v19 = a4;
              int v20 = "ms-dns%d %I";
              goto LABEL_28;
            case 130:
            case 132:
              int v18 = v13 + 6;
              htonl();
              uint64_t v19 = a4;
              int v20 = "ms-wins%d %I";
              goto LABEL_28;
            default:
              goto LABEL_29;
          }
          goto LABEL_29;
        }
        int v18 = v13;
        switch(v17)
        {
          case 1:
            if (v15 != 10) {
              goto LABEL_29;
            }
            uint64_t v24 = htonl();
            ((void (*)(uint64_t, const char *, ...))a3)(a4, "addrs %I", v24);
            int v18 = v13 + 10;
            htonl();
            uint64_t v19 = a4;
            int v20 = " %I";
            break;
          case 2:
            if (v15 < 4) {
              goto LABEL_29;
            }
            int v18 = v13 + 4;
            unsigned int v25 = __rev16(*((unsigned __int16 *)v13 + 1));
            a3(a4, "compress ");
            if (v25 == 55)
            {
              uint64_t v19 = a4;
              int v20 = "old-VJ";
            }
            else
            {
              uint64_t v19 = a4;
              if (v25 == 45) {
                int v20 = "VJ";
              }
              else {
                int v20 = "0x%x";
              }
            }
            break;
          case 3:
            int v18 = v13;
            if (v15 != 6) {
              goto LABEL_29;
            }
            int v18 = v13 + 6;
            htonl();
            uint64_t v19 = a4;
            int v20 = "addr %I";
            break;
          default:
            goto LABEL_29;
        }
LABEL_28:
        a3(v19, v20);
LABEL_29:
        if (v18 < &v13[v15])
        {
          unsigned __int8 v21 = &v13[v15];
          int64_t v22 = v21 - v18;
          do
          {
            int v23 = *v18++;
            ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v23);
            --v22;
          }
          while (v22);
          int v18 = v21;
        }
        v7 -= v15;
        a3(a4, ">");
        int v13 = v18;
        if (v7 <= 1) {
          goto LABEL_48;
        }
      }
    }
LABEL_47:
    int v18 = a1 + 4;
LABEL_48:
    int v13 = v18;
    if (v7 < 1) {
      return (v13 - a1);
    }
    goto LABEL_49;
  }
  if ((v11 - 5) >= 2) {
    goto LABEL_47;
  }
  if (v6 >= 5)
  {
    if (*v13 - 32 > 0x5E)
    {
LABEL_49:
      unsigned int v26 = v7 + 1;
      do
      {
        int v27 = *v13++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v27);
        --v26;
      }
      while (v26 > 1);
      return (v13 - a1);
    }
    a3(a4, " ");
    print_string((char *)a1 + 4, v6 - 4, a3, a4);
    LODWORD(v13) = v13 + v7;
  }
  return (v13 - a1);
}

uint64_t sub_10000B7C8(uint64_t result)
{
  if (*((_DWORD *)&ipcp_fsm + 20 * (int)result + 2) == 9 && ipdata_input_hook != 0) {
    return ipdata_input_hook();
  }
  return result;
}

void sub_10000B810()
{
  if (dword_10004777C) {
    BOOL v0 = 0;
  }
  else {
    BOOL v0 = disable_defaultip == 0;
  }
  if (v0)
  {
    byte_100047767 = 1;
    int v1 = gethostbyname(hostname);
    if (v1)
    {
      int v2 = **(_DWORD **)v1->h_addr_list;
      if (v2)
      {
        if (!bad_ip_adrs()) {
          dword_10004777C = v2;
        }
      }
    }
  }
  if (dword_10004777C) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = disable_defaultip == 0;
  }
  char v4 = v3;
  byte_10004A382 = v4;
}

uint64_t sub_10000B8A8(uint64_t a1)
{
  uint64_t v2 = (int)a1;
  BOOL v3 = (char *)&ipcp_wantoptions + 52 * (int)a1;
  unsigned int v6 = *((_DWORD *)v3 + 8);
  char v5 = (int *)(v3 + 32);
  unsigned int v4 = v6;
  if (!v6)
  {
    unsigned int v4 = htonl();
    *char v5 = v4;
    *((unsigned char *)&ipcp_wantoptions + 52 * (int)v2 + 8) = 1;
  }
  int v7 = (char *)&ipcp_wantoptions + 52 * (int)v2;
  int v10 = *((_DWORD *)v7 + 7);
  int v9 = (int *)(v7 + 28);
  int v8 = v10;
  if (!v10)
  {
    int v8 = htonl();
    *int v9 = v8;
    *((unsigned char *)&ipcp_wantoptions + 52 * (int)v2 + 7) = 1;
    byte_10004A382 = 0;
  }
  int Mask = GetMask();
  uint64_t result = sifaddr(a1, v8, v4, Mask);
  if (result)
  {
    uint64_t result = sifnpafmode(a1, 33, ip_src_address_filter);
    if (result)
    {
      uint64_t result = sifup();
      if (result)
      {
        uint64_t result = sifnpmode(a1, 33, 3);
        if (result)
        {
          if (*((unsigned char *)&ipcp_wantoptions + 52 * (int)v2 + 3) && sifdefaultroute()) {
            dword_10004A384[v2] = 1;
          }
          if (*((unsigned char *)&ipcp_wantoptions + 52 * (int)v2 + 4) && sifproxyarp(a1, *v5)) {
            dword_10004A388[v2] = 1;
          }
          if (byte_10004A36C) {
            sifdns(*v5, *v5);
          }
          if (byte_10004A36D) {
            sifwins();
          }
          notice((uint64_t)"local  IP address %I", v13, v14, v15, v16, v17, v18, v19, *v9);
          notice((uint64_t)"remote IP address %I", v20, v21, v22, v23, v24, v25, v26, *v5);
          return 1;
        }
      }
    }
  }
  return result;
}

BOOL sub_10000BA9C(unsigned char *a1, int a2)
{
  BOOL result = 0;
  if (a2 >= 24 && !(a1[11] | ((a1[10] & 0x1F) << 8)))
  {
    if (a1[13] != 6) {
      return 1;
    }
    uint64_t v3 = 4 * (a1[4] & 0xF);
    if (a2 - 4 >= (v3 + 20))
    {
      unsigned int v4 = &a1[v3 + 4];
      if ((v4[13] & 1) == 0 || a2 - 4 != ((v4[12] >> 2) & 0x3C) + v3) {
        return 1;
      }
    }
  }
  return result;
}

uint64_t sub_10000BB10(int a1)
{
  return *((unsigned int *)&ipcp_fsm + 20 * a1 + 2);
}

uint64_t sub_10000BB28()
{
  if (ipdata_print_hook) {
    return ipdata_print_hook();
  }
  else {
    return 0;
  }
}

void *ip_ntoa()
{
  return &unk_10004A31C;
}

char *setipaddr(char *a1, uint64_t a2, int a3)
{
  BOOL result = strchr(a1, 58);
  if (result)
  {
    if (a3)
    {
      unsigned int v6 = result;
      if (result != a1 && option_priority >= dword_10004A35C)
      {
        *BOOL result = 0;
        in_addr_t v7 = inet_addr(a1);
        if (v7 == -1)
        {
          int v8 = gethostbyname(a1);
          if (!v8)
          {
            option_error("unknown host: %s", v9, v10, v11, v12, v13, v14, v15, (int)a1);
            return 0;
          }
          in_addr_t v7 = **(_DWORD **)v8->h_addr_list;
        }
        if (bad_ip_adrs())
        {
          slprintf((int)&unk_10004A31C, 64, "%I");
          option_error("bad local IP address %s", v16, v17, v18, v19, v20, v21, v22, (int)&unk_10004A31C);
          return 0;
        }
        if (v7) {
          dword_10004777C = v7;
        }
        *unsigned int v6 = 58;
        dword_10004A35C = option_priority;
      }
      int v24 = v6[1];
      uint64_t v23 = v6 + 1;
      if (v24 && option_priority >= dword_10004A360)
      {
        in_addr_t v25 = inet_addr(v23);
        if (v25 == -1)
        {
          uint64_t v33 = gethostbyname(v23);
          if (!v33)
          {
            option_error("unknown host: %s", v34, v35, v36, v37, v38, v39, v40, (int)v23);
            return 0;
          }
          in_addr_t v25 = **(_DWORD **)v33->h_addr_list;
          if (!remote_name) {
            __strlcpy_chk();
          }
        }
        if (bad_ip_adrs())
        {
          slprintf((int)&unk_10004A31C, 64, "%I");
          option_error("bad remote IP address %s", v26, v27, v28, v29, v30, v31, v32, (int)&unk_10004A31C);
          return 0;
        }
        if (v25) {
          dword_100047780 = v25;
        }
        dword_10004A360 = option_priority;
      }
    }
    return (char *)1;
  }
  return result;
}

uint64_t parse_dotted_ip(const char *a1, unsigned int *a2)
{
  __endptr = 0;
  unsigned int v4 = strtoul(a1, &__endptr, 0);
  char v5 = __endptr;
  if (__endptr == a1) {
    return 0;
  }
  unsigned int v6 = 0;
  int v7 = 3;
  char v8 = 24;
  while (v4 < 0x100)
  {
    v6 |= v4 << v8;
    if (!v7)
    {
      unsigned int v4 = v6;
      goto LABEL_11;
    }
    if (*v5 == 46)
    {
      uint64_t v9 = v5 + 1;
      --v7;
      unsigned int v4 = strtoul(v5 + 1, &__endptr, 0);
      char v5 = __endptr;
      v8 -= 8;
      if (__endptr != v9) {
        continue;
      }
    }
    return 0;
  }
  if (v7 < 3) {
    return 0;
  }
LABEL_11:
  *a2 = v4;
  return (v5 - a1);
}

uint64_t sub_10000BE38(const char **a1)
{
  int v10 = 0;
  uint64_t result = int_option(*a1, &v10);
  if (result)
  {
    if ((v10 - 17) > 0xFFFFFFF0)
    {
      dword_1000477DC = v10 - 1;
      dword_100047774 = v10 - 1;
      slprintf((int)&unk_10004A364, 8, "%d");
      return 1;
    }
    else
    {
      option_error("vj-max-slots value must be between 2 and 16", v2, v3, v4, v5, v6, v7, v8, v9);
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000BEC0(const char **a1)
{
  in_addr_t v2 = inet_addr(*a1);
  if (v2 == -1)
  {
    uint64_t v3 = gethostbyname(*a1);
    if (!v3)
    {
      option_error("invalid address parameter '%s' for ms-dns option", v4, v5, v6, v7, v8, v9, v10, (int)*a1);
      return 0;
    }
    in_addr_t v2 = **(_DWORD **)v3->h_addr_list;
  }
  int v11 = dword_1000477F0;
  if (!dword_1000477F0) {
    int v11 = v2;
  }
  dword_1000477EC = v11;
  dword_1000477F0 = v2;
  return 1;
}

uint64_t sub_10000BF48(const char **a1)
{
  in_addr_t v2 = inet_addr(*a1);
  if (v2 == -1)
  {
    uint64_t v3 = gethostbyname(*a1);
    if (!v3)
    {
      option_error("invalid address parameter '%s' for ms-wins option", v4, v5, v6, v7, v8, v9, v10, (int)*a1);
      return 0;
    }
    in_addr_t v2 = **(_DWORD **)v3->h_addr_list;
  }
  int v11 = dword_1000477F8;
  if (!dword_1000477F8) {
    int v11 = v2;
  }
  dword_1000477F4 = v11;
  dword_1000477F8 = v2;
  return 1;
}

uint64_t sub_10000BFD0(const char **a1)
{
  unsigned int v13 = 0;
  in_addr_t v2 = *a1;
  int v3 = parse_dotted_ip(*a1, &v13);
  int v4 = htonl();
  if (!v3 || v2[v3] || (netmask & ~v4) != 0)
  {
    option_error("invalid netmask value '%s'", v5, v6, v7, v8, v9, v10, v11, (int)*a1);
    return 0;
  }
  else
  {
    netmask = v4;
    slprintf((int)&unk_10004A36E, 20, "%I");
    return 1;
  }
}

uint64_t sub_10000C080(uint64_t a1, void (*a2)(uint64_t, const char *, ...), uint64_t a3)
{
  if (dword_10004777C) {
    a2(a3, "%I", dword_10004777C);
  }
  uint64_t result = ((uint64_t (*)(uint64_t, const char *))a2)(a3, ":");
  if (dword_100047780) {
    return ((uint64_t (*)(uint64_t, const char *, ...))a2)(a3, "%I", dword_100047780);
  }
  return result;
}

int *sub_10000C0FC(int *result)
{
  int v1 = *result;
  in_addr_t v2 = (char *)&ipcp_wantoptions + 52 * *result;
  if (*v2 || (char v3 = *((unsigned char *)&ipcp_wantoptions + 52 * v1 + 1)) != 0)
  {
    if (*((unsigned char *)&ipcp_allowoptions + 52 * v1)) {
      char v3 = 1;
    }
    else {
      char v3 = *((unsigned char *)&ipcp_allowoptions + 52 * v1 + 1) != 0;
    }
  }
  int v4 = (char *)&ipcp_gotoptions + 52 * v1;
  uint64_t v5 = (char *)&ipcp_wantoptions + 52 * v1;
  v5[2] = v3;
  if (!*((_DWORD *)v5 + 7)) {
    *((unsigned char *)&ipcp_wantoptions + 52 * v1 + 7) = 1;
  }
  uint64_t v6 = (char *)&ipcp_wantoptions + 52 * v1;
  int v8 = *((_DWORD *)v6 + 8);
  uint64_t v7 = v6 + 32;
  if (!v8) {
    *((unsigned char *)&ipcp_wantoptions + 52 * v1 + 8) = 1;
  }
  char v9 = byte_10004A36C;
  uint64_t v10 = (char *)&ipcp_wantoptions + 52 * v1;
  v10[9] = byte_10004A36C;
  v10[10] = v9;
  char v11 = byte_10004A36D;
  v10[11] = byte_10004A36D;
  v10[12] = v11;
  long long v12 = *((_OWORD *)v2 + 1);
  *(_OWORD *)int v4 = *(_OWORD *)v2;
  *((_OWORD *)v4 + 1) = v12;
  *((_OWORD *)v4 + 2) = *((_OWORD *)v2 + 2);
  *((_DWORD *)v4 + 12) = *((_DWORD *)v2 + 12);
  if (!byte_10004A382) {
    *((_DWORD *)&ipcp_gotoptions + 13 * v1 + 7) = 0;
  }
  if (ip_choose_hook)
  {
    uint64_t result = (int *)ip_choose_hook(v7);
    if (*v7) {
      *((unsigned char *)&ipcp_wantoptions + 52 * v1 + 8) = 0;
    }
  }
  return result;
}

uint64_t sub_10000C24C(int *a1, uint8x8_t a2)
{
  int v2 = *a1;
  char v3 = (char *)&ipcp_gotoptions + 52 * *a1;
  if ((*((unsigned char *)&ipcp_wantoptions + 52 * *a1) || *((unsigned char *)&ipcp_wantoptions + 52 * v2 + 1)) && !*v3)
  {
    int v4 = (char *)&ipcp_gotoptions + 52 * v2;
    int v6 = v4[1];
    uint64_t v5 = v4 + 1;
    if (!v6) {
      *uint64_t v5 = 1;
    }
  }
  if (*((unsigned char *)&ipcp_wantoptions + 52 * v2 + 5))
  {
    uint64_t v7 = (char *)&ipcp_gotoptions + 52 * v2;
    int v9 = v7[5];
    int v8 = v7 + 5;
    if (!v9)
    {
      uint64_t v10 = (char *)&ipcp_gotoptions + 52 * v2;
      int v12 = v10[6];
      char v11 = v10 + 6;
      if (!v12 && *((unsigned char *)&ipcp_hisoptions + 52 * v2 + 5) && *((unsigned char *)&ipcp_hisoptions + 52 * v2 + 6))
      {
        *int v8 = 1;
        unsigned char *v11 = 1;
        *((_DWORD *)&ipcp_gotoptions + 13 * v2 + 4) = *((_DWORD *)&ipcp_hisoptions + 13 * v2 + 4);
      }
    }
  }
  int v13 = *v3;
  if (*v3)
  {
    int v14 = 0;
  }
  else if (*((unsigned char *)&ipcp_gotoptions + 52 * v2 + 1))
  {
    int v14 = 10;
  }
  else
  {
    int v14 = 0;
  }
  int v15 = *((unsigned __int8 *)&ipcp_gotoptions + 52 * v2 + 5);
  if (*((unsigned char *)&ipcp_gotoptions + 52 * v2 + 5))
  {
    if (*((unsigned char *)&ipcp_gotoptions + 52 * v2 + 6)) {
      int v15 = 4;
    }
    else {
      int v15 = 6;
    }
  }
  if (v13) {
    int v16 = 6;
  }
  else {
    int v16 = 0;
  }
  a2.i32[0] = *(_DWORD *)((char *)&ipcp_gotoptions + 52 * v2 + 9);
  v17.i64[0] = 0x600000006;
  v17.i64[1] = 0x600000006;
  return (vaddvq_s32((int32x4_t)vbicq_s8(v17, (int8x16_t)vceqzq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a2)))))+ v16+ v15+ v14);
}

int *sub_10000C3B4(int *result, uint64_t a2, int *a3)
{
  uint64_t v4 = a2;
  int v5 = *result;
  int v6 = (char *)&ipcp_gotoptions + 52 * *result;
  int v7 = *a3;
  if (!*v6)
  {
    int v16 = (char *)&ipcp_gotoptions + 52 * v5;
    int v18 = v16[1];
    int8x16_t v17 = v16 + 1;
    if (v18)
    {
      int v19 = v7 - 10;
      if (v7 < 10)
      {
        *int8x16_t v17 = 0;
      }
      else
      {
        *(_WORD *)a2 = 2561;
        *(_DWORD *)(a2 + 2) = bswap32(ntohl());
        uint64_t result = (int *)ntohl();
        *(_DWORD *)(v4 + 6) = bswap32(result);
        v4 += 10;
        int v7 = v19;
      }
    }
  }
  int v8 = (char *)&ipcp_gotoptions + 52 * v5;
  int v10 = v8[5];
  int v9 = v8 + 5;
  if (v10)
  {
    char v11 = (char *)&ipcp_gotoptions + 52 * v5;
    int v13 = v11[6];
    int v12 = v11 + 6;
    if (v13) {
      int v14 = 4;
    }
    else {
      int v14 = 6;
    }
    int v15 = v7 - v14;
    if (v7 >= v14)
    {
      *(unsigned char *)uint64_t v4 = 2;
      *(unsigned char *)(v4 + 1) = v14;
      uint64_t v20 = (char *)&ipcp_gotoptions + 52 * v5;
      *(unsigned char *)(v4 + 2) = BYTE1(*((_DWORD *)v20 + 4));
      *(unsigned char *)(v4 + 3) = *((_DWORD *)v20 + 4);
      if (*v12)
      {
        v4 += 4;
      }
      else
      {
        uint64_t v21 = (char *)&ipcp_gotoptions + 52 * v5;
        *(unsigned char *)(v4 + 4) = *((_DWORD *)v21 + 5);
        *(unsigned char *)(v4 + 5) = v21[24];
        v4 += 6;
      }
      int v7 = v15;
    }
    else
    {
      *int v9 = 0;
    }
  }
  if (*v6)
  {
    int v22 = v7 - 6;
    if (v7 < 6)
    {
      *int v6 = 0;
    }
    else
    {
      *(_WORD *)uint64_t v4 = 1539;
      uint64_t result = (int *)ntohl();
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v4 += 6;
      int v7 = v22;
    }
  }
  uint64_t v23 = (char *)&ipcp_gotoptions + 52 * v5;
  int v25 = v23[9];
  int v24 = v23 + 9;
  if (v25)
  {
    int v26 = v7 - 6;
    if (v7 < 6)
    {
      *int v24 = 0;
    }
    else
    {
      *(_WORD *)uint64_t v4 = 1665;
      uint64_t result = (int *)ntohl();
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v4 += 6;
      int v7 = v26;
    }
  }
  uint64_t v27 = (char *)&ipcp_gotoptions + 52 * v5;
  int v29 = v27[10];
  uint64_t v28 = v27 + 10;
  if (v29)
  {
    int v30 = v7 - 6;
    if (v7 < 6)
    {
      *uint64_t v28 = 0;
    }
    else
    {
      *(_WORD *)uint64_t v4 = 1667;
      uint64_t result = (int *)ntohl();
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v4 += 6;
      int v7 = v30;
    }
  }
  uint64_t v31 = (char *)&ipcp_gotoptions + 52 * v5;
  int v33 = v31[11];
  uint64_t v32 = v31 + 11;
  if (v33)
  {
    int v34 = v7 - 6;
    if (v7 < 6)
    {
      *uint64_t v32 = 0;
    }
    else
    {
      *(_WORD *)uint64_t v4 = 1666;
      uint64_t result = (int *)ntohl();
      *(_DWORD *)(v4 + 2) = bswap32(result);
      v4 += 6;
      int v7 = v34;
    }
  }
  uint64_t v35 = (char *)&ipcp_gotoptions + 52 * v5;
  int v37 = v35[12];
  uint64_t v36 = v35 + 12;
  if (v37)
  {
    int v38 = v7 - 6;
    if (v7 < 6)
    {
      *uint64_t v36 = 0;
    }
    else
    {
      *(_WORD *)uint64_t v4 = 1668;
      uint64_t result = (int *)ntohl();
      *(_DWORD *)(v4 + 2) = bswap32(result);
      int v7 = v38;
    }
  }
  *a3 -= v7;
  return result;
}

uint64_t sub_10000C668(int *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  int v9 = a2;
  int v10 = *a1;
  uint64_t v11 = 52 * *a1;
  int v12 = *((unsigned __int8 *)&ipcp_gotoptions + v11);
  if (!*((unsigned char *)&ipcp_gotoptions + v11) && *((unsigned char *)&ipcp_gotoptions + 52 * v10 + 1))
  {
    int v8 = a3 - 10;
    if ((int)a3 < 10
      || a2[1] != 10
      || *a2 != 1
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 7) != htonl()
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 8) != htonl())
    {
      goto LABEL_57;
    }
    v9 += 10;
  }
  if (*((unsigned char *)&ipcp_gotoptions + 52 * v10 + 5))
  {
    if (*((unsigned char *)&ipcp_gotoptions + 52 * v10 + 6)) {
      int v13 = 4;
    }
    else {
      int v13 = 6;
    }
    v8 -= v13;
    if (v8 < 0) {
      goto LABEL_57;
    }
    BOOL v14 = v13 == v9[1] && *v9 == 2;
    if (!v14 || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 4) != bswap32(*((unsigned __int16 *)v9 + 1)) >> 16) {
      goto LABEL_57;
    }
    if (!*((unsigned char *)&ipcp_gotoptions + 52 * v10 + 6))
    {
      if (*((_DWORD *)&ipcp_gotoptions + 13 * v10 + 5) != v9[4]
        || v9[5] != *((unsigned __int8 *)&ipcp_gotoptions + 52 * v10 + 24))
      {
        goto LABEL_57;
      }
      v9 += 6;
      if (!v12) {
        goto LABEL_21;
      }
      goto LABEL_16;
    }
    v9 += 4;
  }
  if (v12)
  {
LABEL_16:
    BOOL v15 = __OFSUB__(v8, 6);
    v8 -= 6;
    if (v8 < 0 != v15
      || v9[1] != 6
      || *v9 != 3
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 7) != htonl())
    {
      goto LABEL_57;
    }
    v9 += 6;
  }
LABEL_21:
  if (*((unsigned char *)&ipcp_gotoptions + 52 * v10 + 9))
  {
    BOOL v15 = __OFSUB__(v8, 6);
    v8 -= 6;
    if (v8 < 0 != v15
      || v9[1] != 6
      || *v9 != 129
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 9) != htonl())
    {
      goto LABEL_57;
    }
    v9 += 6;
  }
  if (*((unsigned char *)&ipcp_gotoptions + 52 * v10 + 10))
  {
    BOOL v15 = __OFSUB__(v8, 6);
    v8 -= 6;
    if (v8 < 0 != v15
      || v9[1] != 6
      || *v9 != 131
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 10) != htonl())
    {
      goto LABEL_57;
    }
    v9 += 6;
  }
  if (*((unsigned char *)&ipcp_gotoptions + 52 * v10 + 11))
  {
    BOOL v15 = __OFSUB__(v8, 6);
    v8 -= 6;
    if (v8 < 0 != v15
      || v9[1] != 6
      || *v9 != 130
      || *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 11) != htonl())
    {
      goto LABEL_57;
    }
    v9 += 6;
  }
  if (!*((unsigned char *)&ipcp_gotoptions + 52 * v10 + 12)
    || (BOOL v15 = __OFSUB__(v8, 6), v8 -= 6, v8 < 0 == v15)
    && v9[1] == 6
    && *v9 == 132
    && *((_DWORD *)&ipcp_gotoptions + 13 * v10 + 12) == htonl())
  {
    if (!v8) {
      return 1;
    }
  }
LABEL_57:
  if (debug) {
    dbglog((uint64_t)"ipcp_ackci: received bad Ack!", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v17);
  }
  return 0;
}

uint64_t sub_10000C99C(int *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2;
  int v9 = *a1;
  int v10 = (char *)&ipcp_gotoptions + 52 * *a1;
  int v11 = *v10;
  int v12 = v10[5];
  int v48 = *((_DWORD *)v10 + 5);
  char v49 = v10[6];
  unsigned int v46 = *((_DWORD *)v10 + 4);
  unsigned __int8 v47 = v10[24];
  int v13 = *((_DWORD *)v10 + 7);
  int v56 = v10[1];
  int v57 = *((_DWORD *)v10 + 8);
  int v50 = *((_DWORD *)v10 + 10);
  int v51 = *((_DWORD *)v10 + 9);
  int v52 = *((_DWORD *)v10 + 12);
  int v53 = *((_DWORD *)v10 + 11);
  if (*v10) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v10[1] == 0;
  }
  int v55 = v10[5];
  if (v14) {
    goto LABEL_6;
  }
  int v15 = 0;
  uint64_t v21 = (a3 - 10);
  if ((int)a3 < 10 || a2[1] != 10) {
    goto LABEL_7;
  }
  if (*a2 != 1)
  {
LABEL_6:
    int v15 = 0;
    goto LABEL_7;
  }
  int v22 = htonl();
  int v23 = htonl();
  int v24 = (char *)&ipcp_gotoptions + 52 * v9;
  if (v22) {
    BOOL v25 = v24[7] == 0;
  }
  else {
    BOOL v25 = 1;
  }
  if (!v25) {
    int v13 = v22;
  }
  int v26 = v24[8];
  if (v23) {
    BOOL v27 = v26 == 0;
  }
  else {
    BOOL v27 = 1;
  }
  int v28 = v57;
  if (!v27) {
    int v28 = v23;
  }
  int v57 = v28;
  int v15 = 1;
  v8 += 10;
  int v12 = v55;
  a3 = v21;
LABEL_7:
  int v59 = v15;
  if (v12)
  {
    int v16 = v8[1];
    if ((v16 | 2) == 6 && (int v17 = a3 - v16, (int)a3 >= v16) && *v8 == 2)
    {
      unsigned int v18 = __rev16(*((unsigned __int16 *)v8 + 1));
      if (v16 != 6)
      {
        v8 += 4;
        if (v18 == 55 || v18 == 45)
        {
          int v58 = 1;
          unsigned __int8 v44 = v12;
          char v49 = 1;
          unsigned int v46 = v18;
        }
        else
        {
          unsigned __int8 v44 = 0;
          int v58 = 1;
        }
        goto LABEL_35;
      }
      if (v18 != 45)
      {
        unsigned __int8 v44 = 0;
        int v58 = 1;
        v8 += 6;
        goto LABEL_35;
      }
      int v19 = v48;
      if (v48 >= v8[4]) {
        int v19 = v8[4];
      }
      int v48 = v19;
      char v49 = 0;
      unsigned __int8 v20 = v47;
      if (!v8[5]) {
        unsigned __int8 v20 = 0;
      }
      unsigned __int8 v47 = v20;
      int v58 = 1;
      v8 += 6;
    }
    else
    {
      int v58 = 0;
      int v17 = a3;
    }
    unsigned __int8 v44 = v12;
  }
  else
  {
    int v58 = 0;
    unsigned __int8 v44 = 0;
    int v17 = a3;
  }
LABEL_35:
  if (!v11) {
    goto LABEL_45;
  }
  int v29 = 0;
  if (v8[1] != 6 || v17 < 6) {
    goto LABEL_46;
  }
  if (*v8 != 3)
  {
LABEL_45:
    int v29 = 0;
    goto LABEL_46;
  }
  int v30 = htonl();
  if (v30) {
    BOOL v31 = *((unsigned char *)&ipcp_gotoptions + 52 * v9 + 7) == 0;
  }
  else {
    BOOL v31 = 1;
  }
  if (!v31) {
    int v13 = v30;
  }
  int v29 = 1;
  v8 += 6;
  v17 -= 6;
LABEL_46:
  if (*((unsigned char *)&ipcp_gotoptions + 52 * v9 + 9) && v8[1] == 6 && v17 >= 6 && *v8 == 129)
  {
    int v51 = htonl();
    v8 += 6;
    v17 -= 6;
  }
  if (*((unsigned char *)&ipcp_gotoptions + 52 * v9 + 10) && v8[1] == 6 && v17 >= 6 && *v8 == 131)
  {
    int v50 = htonl();
    v8 += 6;
    v17 -= 6;
  }
  if (*((unsigned char *)&ipcp_gotoptions + 52 * v9 + 11) && v8[1] == 6 && v17 >= 6 && *v8 == 130)
  {
    int v53 = htonl();
    v8 += 6;
    v17 -= 6;
  }
  if (*((unsigned char *)&ipcp_gotoptions + 52 * v9 + 12) && v8[1] == 6 && v17 >= 6)
  {
    if (*v8 != 132) {
      goto LABEL_67;
    }
    int v52 = htonl();
    v8 += 6;
    v17 -= 6;
  }
  if (v17 < 2)
  {
    char v35 = v11;
    unsigned __int8 v34 = v56;
LABEL_107:
    if (a1[2] == 9) {
      return 1;
    }
    *int v10 = v35;
    v10[1] = v34;
    v10[5] = v44;
    v10[6] = v49;
    *((_DWORD *)v10 + 4) = v46;
    *((_DWORD *)v10 + 5) = v48;
    v10[24] = v47;
    *((_DWORD *)v10 + 7) = v13;
    *((_DWORD *)v10 + 8) = v57;
    *((_DWORD *)v10 + 9) = v51;
    *((_DWORD *)v10 + 10) = v50;
    uint64_t result = 1;
    *((_DWORD *)v10 + 11) = v53;
    *((_DWORD *)v10 + 12) = v52;
    return result;
  }
LABEL_67:
  uint64_t v32 = (char *)&ipcp_gotoptions + 52 * v9;
  int v33 = v32 + 7;
  long long v45 = v32 + 8;
  unsigned __int8 v34 = v56;
  char v35 = v11;
  while (1)
  {
    uint64_t v36 = v8[1];
    if (v36 < 2) {
      break;
    }
    v17 -= v36;
    if (v17 < 0) {
      break;
    }
    int v37 = *v8;
    switch(v37)
    {
      case 1:
        if (v11)
        {
          if (v59 || v36 != 10) {
            goto LABEL_103;
          }
        }
        else if (v36 != 10 || v56 || v59)
        {
          goto LABEL_103;
        }
        int v39 = htonl();
        if (v39 && *v33) {
          int v13 = v39;
        }
        int v40 = htonl();
        char v35 = 0;
        if (v40)
        {
          int v41 = v57;
          if (*v45) {
            int v41 = v40;
          }
          int v57 = v41;
        }
        int v59 = 1;
        break;
      case 3:
        if (v11 || v29 || v36 != 6) {
          goto LABEL_103;
        }
        int v38 = htonl();
        if (v38 && *v33) {
          int v13 = v38;
        }
        unsigned __int8 v34 = 0;
        if (v13) {
          char v35 = 1;
        }
        int v29 = 1;
        break;
      case 2:
        if (v55 || v58 || (v36 & 0xFFFFFFFD) != 4) {
          goto LABEL_103;
        }
        int v58 = 1;
        break;
    }
    v8 += v36;
    if (v17 <= 1) {
      goto LABEL_107;
    }
  }
LABEL_103:
  if (debug) {
    dbglog((uint64_t)"ipcp_nakci: received bad Nak!", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v43);
  }
  return 0;
}

uint64_t sub_10000CF44(int *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2;
  int v9 = *a1;
  int v10 = &ipcp_gotoptions;
  int v11 = (char *)&ipcp_gotoptions + 52 * *a1;
  int v12 = *v11;
  char v13 = v11[1];
  int v14 = v11[5];
  int v43 = v11[10];
  int v44 = v11[9];
  int v15 = v11[11];
  int v16 = v11[12];
  if (!*v11)
  {
    if (v11[1])
    {
      uint64_t v28 = (a3 - 10);
      if ((int)a3 >= 10 && a2[1] == 10 && *a2 == 1)
      {
        int v29 = v11[12];
        if (htonl() != *((_DWORD *)&ipcp_gotoptions + 13 * v9 + 7)) {
          goto LABEL_54;
        }
        int v30 = htonl();
        int v10 = &ipcp_gotoptions;
        if (v30 != *((_DWORD *)&ipcp_gotoptions + 13 * v9 + 8)) {
          goto LABEL_54;
        }
        int v16 = v29;
        char v13 = 0;
        v8 += 10;
        a3 = v28;
      }
    }
  }
  if (v14)
  {
    int v17 = v8[1];
    int v18 = *((unsigned char *)&ipcp_gotoptions + 52 * v9 + 6) ? 4 : 6;
    BOOL v19 = v18 != v17 || (int)a3 < v17;
    if (!v19 && *v8 == 2)
    {
      if (*((_DWORD *)&ipcp_gotoptions + 13 * v9 + 4) != bswap32(*((unsigned __int16 *)v8 + 1)) >> 16) {
        goto LABEL_54;
      }
      a3 = (a3 - v17);
      if (!*((unsigned char *)&ipcp_gotoptions + 52 * v9 + 6))
      {
        if (*((_DWORD *)&ipcp_gotoptions + 13 * v9 + 5) != v8[4]
          || v8[5] != *((unsigned __int8 *)&ipcp_gotoptions + 52 * v9 + 24))
        {
          goto LABEL_54;
        }
        LOBYTE(v14) = 0;
        v8 += 6;
        if (!v12) {
          goto LABEL_20;
        }
        goto LABEL_15;
      }
      LOBYTE(v14) = 0;
      v8 += 4;
    }
  }
  if (v12)
  {
LABEL_15:
    if (v8[1] == 6)
    {
      uint64_t v20 = (a3 - 6);
      if ((int)a3 >= 6 && *v8 == 3)
      {
        int v21 = v15;
        int v22 = v9;
        int v23 = v16;
        int v24 = htonl();
        int v10 = &ipcp_gotoptions;
        int v16 = v23;
        int v9 = v22;
        if (v24 != *((_DWORD *)&ipcp_gotoptions + 13 * v22 + 7)) {
          goto LABEL_54;
        }
        int v15 = v21;
        LOBYTE(v12) = 0;
        v8 += 6;
        a3 = v20;
      }
    }
  }
LABEL_20:
  if (v44)
  {
    if (v8[1] == 6)
    {
      uint64_t v25 = (a3 - 6);
      if ((int)a3 >= 6 && *v8 == 129)
      {
        char v26 = v14;
        int v14 = v16;
        int v27 = htonl();
        int v10 = &ipcp_gotoptions;
        if (v27 != *((_DWORD *)&ipcp_gotoptions + 13 * v9 + 9)) {
          goto LABEL_54;
        }
        int v16 = v14;
        LOBYTE(v14) = v26;
        LOBYTE(v44) = 0;
        v8 += 6;
        a3 = v25;
      }
    }
  }
  else
  {
    LOBYTE(v44) = 0;
  }
  if (v43)
  {
    if (v8[1] == 6)
    {
      uint64_t v31 = (a3 - 6);
      if ((int)a3 >= 6 && *v8 == 131)
      {
        int v32 = v16;
        int v33 = htonl();
        int v10 = &ipcp_gotoptions;
        if (v33 != *((_DWORD *)&ipcp_gotoptions + 13 * v9 + 10)) {
          goto LABEL_54;
        }
        int v16 = v32;
        LOBYTE(v43) = 0;
        v8 += 6;
        a3 = v31;
      }
    }
  }
  else
  {
    LOBYTE(v43) = 0;
  }
  if (v15)
  {
    if (v8[1] == 6)
    {
      uint64_t v34 = (a3 - 6);
      if ((int)a3 >= 6 && *v8 == 130)
      {
        int v41 = v9;
        char v35 = v13;
        int v36 = v16;
        int v37 = htonl();
        int v16 = v36;
        char v13 = v35;
        int v9 = v41;
        if (v37 != *((_DWORD *)&ipcp_gotoptions + 13 * v41 + 11)) {
          goto LABEL_54;
        }
        int v10 = &ipcp_gotoptions;
        LOBYTE(v15) = 0;
        v8 += 6;
        a3 = v34;
      }
    }
  }
  if (v16)
  {
    if (v8[1] == 6)
    {
      uint64_t v38 = (a3 - 6);
      if ((int)a3 >= 6)
      {
        if (*v8 != 132 || htonl() != v10[13 * v9 + 12]) {
          goto LABEL_54;
        }
        LOBYTE(v16) = 0;
        a3 = v38;
      }
    }
  }
  if (!a3)
  {
    if (a1[2] == 9) {
      return 1;
    }
    unsigned char *v11 = v12;
    v11[1] = v13;
    v11[5] = v14;
    v11[9] = v44;
    v11[10] = v43;
    v11[11] = v15;
    uint64_t result = 1;
    v11[12] = v16;
    return result;
  }
LABEL_54:
  if (debug) {
    dbglog((uint64_t)"ipcp_rejci: received bad Reject!", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v40);
  }
  return 0;
}

uint64_t sub_10000D3BC(int *a1, uint64_t __src, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  int v9 = *a1;
  int v10 = (char *)&ipcp_hisoptions + 52 * *a1;
  int v11 = (char *)&ipcp_allowoptions + 52 * *a1;
  int v12 = *a3;
  *((_DWORD *)v10 + 12) = 0;
  *(_OWORD *)int v10 = 0u;
  char v13 = (char *)&ipcp_hisoptions + 52 * v9;
  *((_OWORD *)v13 + 1) = 0u;
  int v53 = v13 + 16;
  *((_OWORD *)v13 + 2) = 0u;
  int v59 = v13 + 32;
  long long v54 = v11 + 5;
  int v52 = v10 + 5;
  unsigned __int8 v47 = v10 + 6;
  int v51 = v10 + 20;
  int v50 = (unsigned __int8 *)(v10 + 24);
  int v44 = (int *)(v11 + 20);
  long long v42 = v11 + 24;
  int v14 = (char *)&ipcp_wantoptions + 52 * v9;
  int v41 = (unsigned __int8 *)(v14 + 24);
  uint64_t v61 = v10 + 1;
  uint64_t v60 = v14 + 32;
  unsigned int v46 = v14 + 8;
  int v55 = v11 + 1;
  int v56 = (char *)&ipcp_allowoptions + 52 * v9;
  int v57 = v14 + 28;
  long long v45 = v14 + 7;
  uint64_t v62 = (char *)&ipcp_hisoptions + 52 * v9;
  int v48 = v10 + 28;
  int v40 = v14 + 2;
  int v15 = (char *)__src;
  uint64_t v16 = 2;
  int v17 = (char *)__src;
  int v49 = v9;
  while (v12)
  {
    int v18 = v15;
    if (v12 >= 2
      && ((uint64_t v19 = v15[1], v19 >= 2) ? (v20 = v12 >= v19) : (v20 = 0), v20))
    {
      int v21 = *v15;
      v12 -= v19;
      v15 += v19;
      if (*v18 <= 0x80u)
      {
        if (v21 == 1)
        {
          if (!*v55 || v19 != 10 || *v62)
          {
LABEL_92:
            int v33 = 1;
            goto LABEL_97;
          }
          int v27 = htonl();
          if (v27 == *v60)
          {
            if (!v27)
            {
              *int v40 = 0;
              int v33 = 1;
              LOWORD(v19) = 10;
              goto LABEL_97;
            }
            uint64_t v28 = v17;
            int v25 = 2;
            goto LABEL_77;
          }
          uint64_t v28 = v17;
          if (v27)
          {
            if (*v46) {
              int v25 = 2;
            }
            else {
              int v25 = 3;
            }
            if (*v46 || v8) {
              goto LABEL_77;
            }
LABEL_75:
            *(_DWORD *)(v18 + 2) = bswap32(ntohl());
          }
          else if (!v8)
          {
            goto LABEL_75;
          }
          int v25 = 3;
LABEL_77:
          int v34 = htonl();
          if (v34 != *v57)
          {
            if (v34 && *v45)
            {
              *int v57 = v34;
            }
            else
            {
              if (!v8) {
                *(_DWORD *)(v18 + 6) = bswap32(ntohl());
              }
              int v25 = 3;
            }
          }
          *uint64_t v61 = 1;
          *int v59 = v27;
          *int v48 = v34;
          int v17 = v28;
          int v9 = v49;
          goto LABEL_85;
        }
        if (v21 != 2)
        {
          if (v21 != 3 || !*v56 || v19 != 6 || *v61) {
            goto LABEL_92;
          }
          int v24 = htonl();
          if (v24 == *v60)
          {
            if (!v24)
            {
              *int v40 = 0;
              int v33 = 1;
              LOWORD(v19) = 6;
              goto LABEL_97;
            }
            int v25 = 2;
            goto LABEL_73;
          }
          if (v24)
          {
            if (*v46) {
              int v25 = 2;
            }
            else {
              int v25 = 3;
            }
            if (*v46 || v8) {
              goto LABEL_73;
            }
LABEL_71:
            *(_DWORD *)(v18 + 2) = bswap32(ntohl());
          }
          else if (!v8)
          {
            goto LABEL_71;
          }
          int v25 = 3;
LABEL_73:
          unsigned char *v62 = 1;
          *int v59 = v24;
          goto LABEL_85;
        }
        if ((v19 & 0xFFFFFFFD) != 4 || !*v54) {
          goto LABEL_92;
        }
        unsigned int v29 = __rev16(*((unsigned __int16 *)v18 + 1));
        if (v29 == 45)
        {
          unsigned char *v52 = 1;
          _DWORD *v53 = 45;
          if (v19 == 6)
          {
            int v30 = v18[4];
            int v31 = *v44;
            if (*v44 >= v30) {
              int v25 = 2;
            }
            else {
              int v25 = 3;
            }
            if (v31 < v30 && !v8)
            {
              v18[4] = v31;
              int v25 = 3;
            }
            unsigned __int8 v32 = v18[5];
            if (v32)
            {
              if (!*v42)
              {
                int v25 = 3;
                if (!v8)
                {
                  v18[5] = *v41;
                  int v25 = 3;
                }
              }
            }
            *int v51 = v30;
            *int v50 = v32;
            goto LABEL_85;
          }
        }
        else
        {
          if (v19 != 4 || v29 != 55) {
            goto LABEL_92;
          }
          unsigned char *v52 = 1;
          _DWORD *v53 = 55;
        }
        *unsigned __int8 v47 = 1;
        *int v51 = 15;
        int v25 = 2;
        *int v50 = 1;
      }
      else
      {
        switch(v21)
        {
          case 129:
          case 131:
            BOOL v22 = v21 == 131;
            if (v19 != 6) {
              goto LABEL_92;
            }
            int v23 = *((_DWORD *)&ipcp_allowoptions + 13 * v9 + v22 + 9);
            if (!v23) {
              goto LABEL_92;
            }
            break;
          case 130:
          case 132:
            BOOL v26 = v21 == 132;
            if (v19 != 6) {
              goto LABEL_92;
            }
            int v23 = *((_DWORD *)&ipcp_allowoptions + 13 * v9 + v26 + 11);
            if (!v23) {
              goto LABEL_92;
            }
            break;
          default:
            goto LABEL_92;
        }
        if (htonl() != v23)
        {
          *(_DWORD *)(v18 + 2) = bswap32(ntohl());
          goto LABEL_88;
        }
        int v25 = 2;
      }
LABEL_85:
      if (v25 != 2 || v16 == 2)
      {
        if (v25 != 3)
        {
          int v33 = 0;
          goto LABEL_97;
        }
LABEL_88:
        if (v8) {
          goto LABEL_92;
        }
        if (v16 != 4)
        {
          int v33 = 0;
          if (v16 == 2)
          {
            LODWORD(v16) = 3;
            int v17 = (char *)__src;
          }
          else
          {
            LODWORD(v16) = 3;
          }
          goto LABEL_97;
        }
      }
    }
    else
    {
      if (debug) {
        dbglog((uint64_t)"ipcp_reqci: bad CI length!", __src, (uint64_t)a3, a4, a5, a6, a7, a8, v39);
      }
      int v33 = 1;
      LOWORD(v19) = v12;
      int v12 = 0;
LABEL_97:
      BOOL v35 = v16 != 4;
      if ((v33 & v35) != 0) {
        uint64_t v16 = 4;
      }
      else {
        uint64_t v16 = v16;
      }
      if ((v33 & v35) != 0) {
        int v36 = (char *)__src;
      }
      else {
        int v36 = v17;
      }
      if (v36 != v18) {
        memcpy(v36, v18, (unsigned __int16)v19);
      }
      int v17 = &v36[(unsigned __int16)v19];
    }
  }
  if (v16 != 4 && !*v62 && !*v61 && !v8 && *v40)
  {
    if (v16 == 2)
    {
      *int v40 = 0;
      int v17 = (char *)__src;
    }
    *(_WORD *)int v17 = 1539;
    *(_DWORD *)(v17 + 2) = bswap32(ntohl());
    LODWORD(v17) = v17 + 6;
    uint64_t v16 = 3;
  }
  *a3 = v17 - __src;
  if (debug)
  {
    int v37 = "REJ";
    if (v16 == 3) {
      int v37 = "NAK";
    }
    if (v16 == 2) {
      int v37 = "ACK";
    }
    dbglog((uint64_t)"ipcp: returning Configure-%s", __src, (uint64_t)a3, a4, a5, a6, a7, a8, (int)v37);
  }
  return v16;
}

void sub_10000DA68(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *a1;
  int v10 = (char *)&ipcp_hisoptions + 52 * *a1;
  if (debug) {
    dbglog((uint64_t)"ipcp: up", a2, a3, a4, a5, a6, a7, a8, v99);
  }
  if (!*v10 && !*((unsigned char *)&ipcp_hisoptions + 52 * v9 + 1)) {
    *((_DWORD *)&ipcp_hisoptions + 13 * v9 + 8) = *((_DWORD *)&ipcp_wantoptions + 13 * v9 + 8);
  }
  int v11 = (char *)&ipcp_gotoptions + 52 * v9;
  int v13 = *((_DWORD *)v11 + 7);
  int v12 = (int *)(v11 + 28);
  if (v13)
  {
    int v14 = (char *)&ipcp_hisoptions + 52 * v9;
    int v16 = *((_DWORD *)v14 + 8);
    int v15 = (int *)(v14 + 32);
    if (!v16)
    {
      int v17 = htonl();
      *int v15 = v17;
      warning((uint64_t)"Could not determine remote IP address: defaulting to %I", v18, v19, v20, v21, v22, v23, v24, v17);
    }
    slprintf((int)byte_10004A31C, 64, "%I");
    script_setenv("IPLOCAL", byte_10004A31C);
    int v100 = *v15;
    slprintf((int)byte_10004A31C, 64, "%I");
    script_setenv("IPREMOTE", byte_10004A31C);
    int v25 = (char *)&ipcp_gotoptions + 52 * v9;
    int v28 = *((_DWORD *)v25 + 9);
    int v27 = (unsigned int *)(v25 + 36);
    int v26 = v28;
    if (v28)
    {
      int v100 = v26;
      slprintf((int)byte_10004A31C, 64, "%I");
      script_setenv("DNS1", byte_10004A31C);
    }
    unsigned int v29 = (char *)&ipcp_gotoptions + 52 * v9;
    int v32 = *((_DWORD *)v29 + 10);
    int v31 = (unsigned int *)(v29 + 40);
    int v30 = v32;
    if (v32)
    {
      int v100 = v30;
      slprintf((int)byte_10004A31C, 64, "%I");
      script_setenv("DNS2", byte_10004A31C);
    }
    if (byte_10004A36C && (*v27 || *v31))
    {
      script_setenv("USEPEERDNS", "1");
      sifdns(*v27, *v31);
    }
    if (byte_10004A36D && *(void *)((char *)&ipcp_gotoptions + 52 * v9 + 44)) {
      sifwins();
    }
    if (auth_ip_addr(*a1, *v15))
    {
      sifvjcomp(*a1, *((unsigned __int8 *)&ipcp_hisoptions + 52 * v9 + 5), *((unsigned __int8 *)&ipcp_hisoptions + 52 * v9 + 24), *((_DWORD *)&ipcp_hisoptions + 13 * v9 + 5));
      if (demand)
      {
        long long v45 = (char *)&ipcp_wantoptions + 52 * v9;
        unsigned int v48 = *((_DWORD *)v45 + 7);
        unsigned __int8 v47 = (int *)(v45 + 28);
        uint64_t v46 = v48;
        if (*v12 == v48)
        {
          uint64_t v49 = *((unsigned int *)&ipcp_wantoptions + 13 * v9 + 8);
          if (*v15 == v49)
          {
LABEL_55:
            demand_rexmit(33, v46, v49, v40, v41, v42, v43, v44);
            sifnpmode(*a1, 33, 0);
LABEL_56:
            np_up();
            byte_10004A38C = 1;
            long long v83 = notify((uint64_t **)ip_up_notifier, 0);
            if (ipdata_up_hook) {
              long long v83 = (uint64_t **)ipdata_up_hook(*a1, *v12, *v15);
            }
            if (ip_up_hook) {
              ip_up_hook(v83);
            }
            notify((uint64_t **)ip_up_notify, 0);
            if ((byte_10004A390 & 1) == 0 && !dword_10004A394)
            {
              byte_10004A390 = 1;
              if (ip_up_script) {
                int v84 = (char *)ip_up_script;
              }
              else {
                int v84 = "/etc/ppp/ip-up";
              }
              sub_10000E3FC(v84);
            }
            return;
          }
        }
        else
        {
          LODWORD(v49) = *((_DWORD *)&ipcp_wantoptions + 13 * v9 + 8);
        }
        uint64_t v63 = (int *)((char *)&ipcp_wantoptions + 52 * v9 + 32);
        sub_10000E360(*a1, v46, v49);
        if (*v12 == *v47)
        {
          script_unsetenv("OLDIPLOCAL");
        }
        else
        {
          warning((uint64_t)"Local IP address changed to %I", v64, v65, v66, v67, v68, v69, v70, *v12);
          int v100 = *v47;
          slprintf((int)byte_10004A31C, 64, "%I");
          script_setenv("OLDIPLOCAL", byte_10004A31C);
          *unsigned __int8 v47 = *v12;
        }
        if (*v15 == *v63)
        {
          script_unsetenv("OLDIPREMOTE");
        }
        else
        {
          warning((uint64_t)"Remote IP address changed to %I", v71, v72, v73, v74, v75, v76, v77, *v15);
          int v100 = *v63;
          slprintf((int)byte_10004A31C, 64, "%I");
          script_setenv("OLDIPREMOTE", byte_10004A31C);
          *uint64_t v63 = *v15;
        }
        int Mask = GetMask();
        if (sifaddr(*a1, *v12, *v15, Mask))
        {
          uint64_t v79 = *a1;
          if (*((unsigned char *)&ipcp_wantoptions + 52 * (int)v79 + 3))
          {
            int v80 = sifdefaultroute();
            uint64_t v79 = *a1;
            int v81 = *a1;
            if (v80) {
              dword_10004A384[(int)v79] = 1;
            }
          }
          else
          {
            int v81 = *a1;
          }
          if (*((unsigned char *)&ipcp_wantoptions + 52 * v81 + 4) && sifproxyarp(v79, *v15)) {
            dword_10004A388[*a1] = 1;
          }
          goto LABEL_55;
        }
      }
      else
      {
        int v52 = GetMask();
        if (sifaddr(*a1, *v12, *v15, v52))
        {
          if (!sifnpafmode(*a1, 33, ip_src_address_filter)) {
            return;
          }
          if (sifup())
          {
            sifnpmode(*a1, 33, 0);
            uint64_t v60 = *a1;
            if (*((unsigned char *)&ipcp_wantoptions + 52 * (int)v60 + 3))
            {
              int v61 = sifdefaultroute();
              uint64_t v60 = *a1;
              int v62 = *a1;
              if (v61) {
                dword_10004A384[(int)v60] = 1;
              }
            }
            else
            {
              int v62 = *a1;
            }
            if (*((unsigned char *)&ipcp_wantoptions + 52 * v62 + 4) && sifproxyarp(v60, *v15)) {
              dword_10004A388[*a1] = 1;
            }
            dword_10004777C = *v12;
            notice((uint64_t)"local  IP address %I", v53, v54, v55, v56, v57, v58, v59, dword_10004777C);
            notice((uint64_t)"remote IP address %I", v85, v86, v87, v88, v89, v90, v91, *v15);
            if (*v27) {
              notice((uint64_t)"primary   DNS address %I", v92, v93, v94, v95, v96, v97, v98, *v27);
            }
            if (*v31) {
              notice((uint64_t)"secondary DNS address %I", v92, v93, v94, v95, v96, v97, v98, *v31);
            }
            goto LABEL_56;
          }
          if (!debug) {
            goto LABEL_47;
          }
          long long v82 = "Interface failed to come up";
          goto LABEL_46;
        }
      }
      if (!debug)
      {
LABEL_47:
        int v50 = (char *)&ipcp_fsm + 80 * *a1;
        int v51 = "Interface configuration failed";
        goto LABEL_48;
      }
      long long v82 = "Interface configuration failed";
LABEL_46:
      warning((uint64_t)v82, v46, v49, v40, v41, v42, v43, v44, v100);
      goto LABEL_47;
    }
    error((uint64_t)"Peer is not authorized to use remote address %I", v33, v34, v35, v36, v37, v38, v39, *v15);
    int v50 = (char *)&ipcp_fsm + 80 * *a1;
    int v51 = "Unauthorized remote IP address";
  }
  else
  {
    error((uint64_t)"Could not determine local IP address", a2, a3, a4, a5, a6, a7, a8, v99);
    int v50 = (char *)&ipcp_fsm + 80 * *a1;
    int v51 = "Could not determine local IP address";
  }
LABEL_48:

  fsm_close((uint64_t)v50, v51, v49, v40, v41, v42, v43, v44);
}

uint64_t sub_10000E1A4(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (debug) {
    dbglog((uint64_t)"ipcp: down", a2, a3, a4, a5, a6, a7, a8, v13);
  }
  update_link_stats(*a1);
  int v9 = notify((uint64_t **)ip_down_notifier, 0);
  if (ipdata_down_hook) {
    int v9 = (uint64_t **)ipdata_down_hook(*a1);
  }
  if (ip_down_hook) {
    ip_down_hook(v9);
  }
  if (byte_10004A38C == 1)
  {
    byte_10004A38C = 0;
    np_down();
  }
  sifvjcomp(*a1, 0, 0, 0);
  notify((uint64_t **)ip_down_notify, 0);
  uint64_t v10 = *a1;
  if (demand)
  {
    uint64_t result = sifnpmode(v10, 33, 3);
  }
  else
  {
    sifnpmode(v10, 33, 1);
    sifdown();
    uint64_t result = sub_10000E360(*a1, *((_DWORD *)&ipcp_gotoptions + 13 * *a1 + 7), *((_DWORD *)&ipcp_hisoptions + 13 * *a1 + 8));
  }
  if (byte_10004A390 == 1 && !dword_10004A394)
  {
    byte_10004A390 = 0;
    if (ip_down_script) {
      int v12 = (char *)ip_down_script;
    }
    else {
      int v12 = "/etc/ppp/ip-down";
    }
    return sub_10000E3FC(v12);
  }
  return result;
}

void sub_10000E314(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_10004A398 == 1)
  {
    byte_10004A398 = 0;
    np_finished(*a1, 33, a3, a4, a5, a6, a7, a8);
  }
}

uint64_t **sub_10000E338(uint64_t **result)
{
  if (*((_DWORD *)result + 6) - *((_DWORD *)result + 7) == 2) {
    return notify((uint64_t **)protocolsready_notifier, 0);
  }
  return result;
}

uint64_t sub_10000E360(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = (int)a1;
  if (dword_10004A388[(int)a1])
  {
    cifproxyarp();
    dword_10004A388[v6] = 0;
  }
  if (dword_10004A384[v6])
  {
    cifdefaultroute();
    dword_10004A384[v6] = 0;
  }

  return cifaddr(a1, a2, a3);
}

uint64_t sub_10000E3FC(char *a1)
{
  slprintf((int)v6, 32, "%d");
  slprintf((int)v5, 32, "%I");
  slprintf((int)v4, 32, "%I");
  v3[0] = a1;
  v3[1] = &ifname;
  v3[2] = (char *)&devnam;
  v3[3] = v6;
  v3[4] = v5;
  v3[5] = v4;
  v3[6] = (char *)ipparam;
  v3[7] = 0;
  uint64_t result = run_program(a1, v3, 0, (uint64_t)sub_10000E528, 0);
  dword_10004A394 = result;
  return result;
}

void sub_10000E528()
{
  dword_10004A394 = 0;
  if (byte_10004A390 == 1)
  {
    if (dword_100047838 == 9) {
      return;
    }
    byte_10004A390 = 0;
    uint64_t v0 = ip_down_script;
    int v1 = "/etc/ppp/ip-down";
  }
  else
  {
    if (dword_100047838 != 9) {
      return;
    }
    byte_10004A390 = 1;
    uint64_t v0 = ip_up_script;
    int v1 = "/etc/ppp/ip-up";
  }
  if (v0) {
    sub_10000E3FC(v0);
  }
  else {
    sub_10000E3FC(v1);
  }
}

double sub_10000E598(int a1)
{
  int v1 = (char *)&lcp_fsm + 80 * a1;
  int v2 = (char *)&lcp_wantoptions + 68 * a1;
  char v3 = (char *)&lcp_allowoptions + 68 * a1;
  *(_DWORD *)int v1 = a1;
  *((_DWORD *)v1 + 1) = 49185;
  *((void *)v1 + 7) = off_100043808;
  fsm_init((uint64_t)v1);
  *(_OWORD *)int v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_DWORD *)v2 + 16) = 0;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *(_WORD *)(v2 + 3) = 257;
  *((_DWORD *)v2 + 4) = 1500;
  *((_WORD *)v2 + 4) = 257;
  v2[10] = 1;
  *(_OWORD *)char v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_DWORD *)v3 + 16) = 0;
  *((_DWORD *)v3 + 4) = 0x4000;
  v3[24] = 7;
  double result = 7.74860419e-304;
  *(_DWORD *)(v3 + 3) = 16843009;
  v3[15] = 1;
  *(_DWORD *)(v3 + 7) = 16843009;
  return result;
}

void sub_10000E65C(int a1, char *__src, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v11 = (char *)&lcp_fsm + 80 * a1;
  int v12 = *((_DWORD *)v11 + 3);
  if ((v12 & 0x100) != 0)
  {
    *((_DWORD *)v11 + 3) = v12 & 0xFFFFFEFF;
    fsm_lowerup((uint64_t)&lcp_fsm + 80 * a1, (uint64_t)__src, a3, a4, a5, a6, a7, a8);
  }

  fsm_input((uint64_t)v11, __src, a3, a4, a5, a6, a7, a8, a9);
}

void sub_10000E6D0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  error((uint64_t)"Received Protocol-Reject for LCP!", a2, a3, a4, a5, a6, a7, a8, v16);

  fsm_protreject((uint64_t)&lcp_fsm + 80 * a1, v9, v10, v11, v12, v13, v14, v15);
}

void lcp_lowerup(uint64_t a1)
{
  if ((ppp_send_config(a1, 1500, 0xFFFFFFFFLL, 0, 0) & 0x80000000) == 0)
  {
    uint64_t v2 = (int)a1;
    uint64_t v3 = lax_recv ? 0 : 0xFFFFFFFFLL;
    if ((ppp_recv_config(a1, 1500, v3, *((unsigned __int8 *)&lcp_wantoptions + 68 * (int)a1 + 9), *((unsigned __int8 *)&lcp_wantoptions + 68 * (int)a1 + 10)) & 0x80000000) == 0)
    {
      uint64_t v4 = (char *)&lcp_fsm + 80 * (int)a1;
      peer_mru[v2] = 1500;
      notify((uint64_t **)lcp_lowerup_notify, 0);
      if (listen_time)
      {
        *((_DWORD *)&lcp_fsm + 20 * (int)v2 + 3) |= 0x100u;
        timeout((int)sub_10000F0D8);
      }
      else
      {
        fsm_lowerup((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
}

void lcp_lowerdown(int a1)
{
  notify((uint64_t **)lcp_lowerdown_notify, 0);
  uint64_t v2 = (char *)&lcp_fsm + 80 * a1;
  int v5 = *((_DWORD *)v2 + 3);
  uint64_t v3 = (unsigned int *)(v2 + 12);
  int v4 = v5;
  if ((v5 & 0x100) != 0)
  {
    *uint64_t v3 = v4 & 0xFFFFFEFF;
  }
  else
  {
    fsm_lowerdown((uint64_t)&lcp_fsm + 80 * a1);
  }
}

void lcp_open(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (char *)&lcp_fsm + 80 * a1;
  int v10 = *((_DWORD *)v8 + 3);
  uint64_t v9 = (unsigned int *)(v8 + 12);
  unsigned int v11 = v10 & 0xFFFFFFFA;
  *uint64_t v9 = v10 & 0xFFFFFFFA;
  if (*((unsigned char *)&lcp_wantoptions + 68 * a1))
  {
    v11 |= 1u;
    *uint64_t v9 = v11;
  }
  if (*((unsigned char *)&lcp_wantoptions + 68 * a1 + 1)) {
    *uint64_t v9 = v11 | 4;
  }
  fsm_open((uint64_t)&lcp_fsm + 80 * a1, a2, a3, a4, a5, a6, a7, a8);
}

void lcp_close(int a1, char *__s, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = (char *)&lcp_fsm + 80 * a1;
  unsigned int v11 = v10 + 12;
  if (v10[13])
  {
    untimeout((uint64_t)sub_10000F0D8, (uint64_t)v10);
    if ((*v11 & 0x100) != 0)
    {
      *v11 &= ~0x100u;
      fsm_lowerup((uint64_t)v10, (uint64_t)__s, a3, a4, a5, a6, a7, a8);
    }
  }
  if (phase) {
    new_phase(9);
  }
  uint64_t v12 = (char *)&lcp_fsm + 80 * a1;
  int v14 = *((_DWORD *)v12 + 2);
  uint64_t v13 = v12 + 8;
  if (v14 == 3 && (*(unsigned char *)v11 & 5) != 0)
  {
    notice((uint64_t)"LCP close (%s).", (uint64_t)__s, a3, a4, a5, a6, a7, a8, (int)__s);
    *uint64_t v13 = 2;
  }
  else
  {
    fsm_close((uint64_t)v10, __s, a3, a4, a5, a6, a7, a8);
    if (!*v13) {
      notice((uint64_t)"LCP close (%s).", v15, v16, v17, v18, v19, v20, v21, (int)__s);
    }
  }

  link_terminated();
}

uint64_t sub_10000EA48(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0;
  }
  unsigned int v5 = __rev16(*((unsigned __int16 *)a1 + 1));
  int v6 = v5 - 4;
  if (v5 < 4 || v5 > a2) {
    return 0;
  }
  unsigned int v10 = *a1;
  int v11 = a1[1];
  uint64_t v12 = (char *)(a1 + 4);
  if (v10 - 1 > 0xA) {
    uint64_t v13 = " code=0x%x";
  }
  else {
    uint64_t v13 = " %s";
  }
  a3(a4, v13);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v11);
  if (v10 > 0xB)
  {
LABEL_73:
    if (v6 >= 1) {
      goto LABEL_74;
    }
    return (v12 - a1);
  }
  if (((1 << v10) & 0x1E) != 0)
  {
    if (v5 < 6) {
      goto LABEL_73;
    }
    uint64_t v15 = " <";
    uint64_t v16 = v12;
    while (1)
    {
      uint64_t v17 = v16[1];
      BOOL v18 = v17 >= 2 && v6 >= v17;
      if (!v18)
      {
        uint64_t v12 = v16;
        goto LABEL_74;
      }
      int v19 = *v16;
      a3(a4, v15);
      int v20 = v19 - 1;
      uint64_t v12 = v16;
      switch(v20)
      {
        case 0:
          uint64_t v12 = v16;
          if (v17 == 4)
          {
            uint64_t v12 = v16 + 4;
            uint64_t v21 = a4;
            uint64_t v22 = "mru %d";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 1:
          uint64_t v12 = v16;
          if (v17 == 6)
          {
            uint64_t v12 = v16 + 6;
            uint64_t v21 = a4;
            uint64_t v22 = "asyncmap 0x%x";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 2:
          uint64_t v12 = v16;
          if (v17 < 4) {
            goto LABEL_54;
          }
          a3(a4, "auth ");
          uint64_t v12 = v16 + 4;
          unsigned int v23 = __rev16(*((unsigned __int16 *)v16 + 1));
          if (v23 == 49703)
          {
            uint64_t v21 = a4;
            uint64_t v22 = "eap";
            goto LABEL_53;
          }
          if (v23 != 49699)
          {
            if (v23 != 49187) {
              goto LABEL_52;
            }
            uint64_t v21 = a4;
            uint64_t v22 = "pap";
            goto LABEL_53;
          }
          a3(a4, "chap");
          if (v17 < 5) {
            goto LABEL_54;
          }
          int v28 = *v12;
          switch(v28)
          {
            case 129:
              uint64_t v29 = a4;
              int v30 = " MS-v2";
              goto LABEL_68;
            case 128:
              uint64_t v29 = a4;
              int v30 = " MS";
              goto LABEL_68;
            case 5:
              uint64_t v29 = a4;
              int v30 = " MD5";
LABEL_68:
              a3(v29, v30);
              uint64_t v12 = v16 + 5;
              break;
          }
LABEL_54:
          if (v12 < &v16[v17])
          {
            uint64_t v24 = v15;
            int v25 = &v16[v17];
            int64_t v26 = v25 - v12;
            do
            {
              int v27 = *v12++;
              ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v27);
              --v26;
            }
            while (v26);
            uint64_t v12 = v25;
            uint64_t v15 = v24;
          }
          v6 -= v17;
          a3(a4, ">");
          uint64_t v16 = v12;
          if (v6 <= 1) {
            goto LABEL_73;
          }
          break;
        case 3:
          uint64_t v12 = v16;
          if (v17 >= 4)
          {
            a3(a4, "quality ");
            uint64_t v12 = v16 + 4;
            if (__rev16(*((unsigned __int16 *)v16 + 1)) != 49189) {
              goto LABEL_52;
            }
            uint64_t v21 = a4;
            uint64_t v22 = "lqr";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 4:
          uint64_t v12 = v16;
          if (v17 == 6)
          {
            uint64_t v12 = v16 + 6;
            uint64_t v21 = a4;
            uint64_t v22 = "magic 0x%x";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 6:
          uint64_t v12 = v16;
          if (v17 == 2)
          {
            uint64_t v12 = v16 + 2;
            uint64_t v21 = a4;
            uint64_t v22 = "pcomp";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 7:
          uint64_t v12 = v16;
          if (v17 == 2)
          {
            uint64_t v12 = v16 + 2;
            uint64_t v21 = a4;
            uint64_t v22 = "accomp";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 12:
          uint64_t v12 = v16;
          if (v17 >= 3)
          {
            a3(a4, "callback ");
            uint64_t v12 = v16 + 3;
            if (v16[2] == 6)
            {
              uint64_t v21 = a4;
              uint64_t v22 = "CBCP";
            }
            else
            {
LABEL_52:
              uint64_t v21 = a4;
              uint64_t v22 = "0x%x";
            }
            goto LABEL_53;
          }
          goto LABEL_54;
        case 16:
          uint64_t v12 = v16;
          if (v17 == 4)
          {
            uint64_t v12 = v16 + 4;
            uint64_t v21 = a4;
            uint64_t v22 = "mrru %d";
            goto LABEL_53;
          }
          goto LABEL_54;
        case 17:
          uint64_t v12 = v16;
          if (v17 == 2)
          {
            uint64_t v12 = v16 + 2;
            uint64_t v21 = a4;
            uint64_t v22 = "ssnhf";
LABEL_53:
            a3(v21, v22);
          }
          goto LABEL_54;
        case 18:
          a3(a4, "endpoint");
          uint64_t v12 = v16;
          goto LABEL_54;
        default:
          goto LABEL_54;
      }
    }
  }
  if (((1 << v10) & 0xE00) != 0)
  {
    BOOL v18 = v5 >= 8;
    int v14 = v5 - 8;
    if (v18)
    {
      ((void (*)(uint64_t, const char *, ...))a3)(a4, " magic=0x%x", bswap32(*((_DWORD *)a1 + 1)));
      uint64_t v12 = (char *)(a1 + 12);
      int v6 = v14;
    }
    goto LABEL_73;
  }
  if (((1 << v10) & 0x60) == 0) {
    goto LABEL_73;
  }
  if (v5 >= 5)
  {
    if (*v12 - 32 > 0x5E)
    {
LABEL_74:
      uint64_t v31 = 0;
      unint64_t v32 = (v6 - 1);
      if (v32 >= 0x1F) {
        int v33 = 31;
      }
      else {
        int v33 = v6 - 1;
      }
      int v34 = ~v33;
      if (v32 >= 0x1F) {
        LODWORD(v32) = 31;
      }
      int v35 = v32 + 1;
      do
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v12[v31++]);
      while (v35 != v31);
      if ((int)v31 >= v6)
      {
        LODWORD(v12) = v12 + v31;
      }
      else
      {
        a3(a4, " ...");
        LODWORD(v12) = v12 + v6 + v34 + v31;
      }
      return (v12 - a1);
    }
    a3(a4, " ");
    print_string(v12, v5 - 4, a3, a4);
    LODWORD(v12) = v12 + v6;
  }
  return (v12 - a1);
}

void sub_10000F010(int a1)
{
  if (byte_10004A3A0 == 1)
  {
    untimeout((uint64_t)sub_10000F1B4, (uint64_t)&lcp_fsm + 80 * a1);
    byte_10004A3A0 = 0;
  }
}

void sub_10000F064(int a1)
{
  dword_10004A39C = 0;
  dword_10004A980 = 0;
  byte_10004A3A0 = 0;
  ppp_auxiliary_probe_init();
  if (lcp_echo_interval)
  {
    sub_10000F1D0((int *)&lcp_fsm + 20 * a1);
  }
}

void sub_10000F0D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *(_DWORD *)(a1 + 12);
  if ((v8 & 0x100) != 0)
  {
    *(_DWORD *)(a1 + 12) = v8 & 0xFFFFFEFF;
    fsm_lowerup(a1, a2, a3, a4, a5, a6, a7, a8);
  }
}

void sub_10000F0F0()
{
}

void lcp_sprotrej(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9 = (unsigned int *)((char *)&lcp_fsm + 80 * a1);
  char v10 = *((unsigned char *)v9 + 16) + 1;
  *((unsigned char *)v9 + 16) = v10;
  fsm_sdata(v9, 8, v10, (char *)(a2 + 2), (a3 - 2), a6, a7, a8, a9);
}

void lcp_echo_restart(int a1)
{
  int v1 = (int *)((char *)&lcp_fsm + 80 * a1);
  dword_10004A39C = 0;
  if (byte_10004A3A0 == 1)
  {
    untimeout((uint64_t)sub_10000F1B4, (uint64_t)v1);
    byte_10004A3A0 = 0;
  }
  if (lcp_echo_interval)
  {
    sub_10000F1D0(v1);
  }
}

uint64_t sub_10000F1B4()
{
  if (byte_10004A3A0 == 1)
  {
    byte_10004A3A0 = 0;
    return sub_10000F1D0();
  }
  return result;
}

void sub_10000F1D0(int *a1)
{
  uint64_t v11 = 0;
  if (ppp_variable_echo_is_off() && get_idle_time(0, (uint64_t)&v11) && HIDWORD(v11) < lcp_echo_interval)
  {
    dword_10004A39C = 0;
    ppp_auxiliary_probe_stop();
  }
  else
  {
    if (lcp_echo_fails)
    {
      int v9 = dword_10004A39C;
      if (dword_10004A39C >= lcp_echo_fails)
      {
        sub_100011E48(a1, v2, v3, v4, v5, v6, v7, v8);
        int v9 = 0;
        dword_10004A39C = 0;
      }
      ppp_auxiliary_probe_check(v9, (void (*)(uint64_t))sub_100011E48, (uint64_t)a1, v4, v5, v6, v7, v8);
    }
    if (a1[2] == 9)
    {
      unsigned int __src = bswap32(*(_DWORD *)&lcp_gotoptions[68 * *a1 + 32]);
      char v10 = dword_10004A980++;
      fsm_sdata((unsigned int *)a1, 9, v10, (char *)&__src, 4, v6, v7, v8, v11);
      ++dword_10004A39C;
    }
  }
  if (a1[2] == 9)
  {
    if (byte_10004A3A0 == 1) {
      warning((uint64_t)"assertion lcp_echo_timer_running==0 failed", v2, v3, v4, v5, v6, v7, v8, v11);
    }
    timeout((int)sub_10000F1B4);
    byte_10004A3A0 = 1;
  }
}

uint64_t sub_10000F334()
{
  dword_100047950 = 0;
  xmmword_100047930 = 0u;
  unk_100047940 = 0u;
  lcp_wantoptions = 0u;
  unk_100047920 = 0u;
  lcp_allowoptions = 0u;
  *(_OWORD *)&dword_1000479A8 = 0u;
  xmmword_1000479B8 = 0u;
  unk_1000479C8 = 0u;
  dword_1000479D8 = 0;
  return 1;
}

uint64_t sub_10000F368(unsigned int *a1)
{
  uint64_t v2 = (int)*a1;
  uint64_t v3 = (char *)&lcp_wantoptions + 68 * v2;
  uint64_t v4 = (char *)&lcp_gotoptions + 68 * v2;
  *((_DWORD *)v3 + 8) = magic();
  *((_DWORD *)v3 + 9) = 0;
  *((_DWORD *)v4 + 16) = *((_DWORD *)v3 + 16);
  long long v5 = *((_OWORD *)v3 + 1);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)v3;
  *((_OWORD *)v4 + 1) = v5;
  long long v6 = *((_OWORD *)v3 + 3);
  *((_OWORD *)v4 + 2) = *((_OWORD *)v3 + 2);
  *((_OWORD *)v4 + 3) = v6;
  if (!multilink)
  {
    uint64_t v7 = (char *)&lcp_gotoptions + 68 * (int)v2;
    *(_WORD *)(v7 + 13) = 0;
    v7[15] = 0;
  }
  if (noendpoint) {
    *((unsigned char *)&lcp_allowoptions + 68 * (int)v2 + 15) = 0;
  }
  peer_mru[*a1] = 1500;
  uint64_t v8 = *a1;

  return auth_reset(v8);
}

uint64_t sub_10000F440(int *a1)
{
  int v1 = *a1;
  int v2 = *((unsigned __int8 *)&lcp_gotoptions + 68 * *a1 + 3);
  if (*((unsigned char *)&lcp_gotoptions + 68 * *a1 + 3)) {
    int v2 = 4 * (*((_DWORD *)&lcp_gotoptions + 17 * v1 + 4) != 1500);
  }
  int v3 = *((unsigned __int8 *)&lcp_gotoptions + 68 * v1 + 4);
  if (*((unsigned char *)&lcp_gotoptions + 68 * v1 + 4))
  {
    if (*((_DWORD *)&lcp_gotoptions + 17 * v1 + 7) == -1) {
      int v3 = 0;
    }
    else {
      int v3 = 6;
    }
  }
  int v4 = *((unsigned __int8 *)&lcp_gotoptions + 68 * v1 + 7);
  if (*((unsigned char *)&lcp_gotoptions + 68 * v1 + 7))
  {
    int v5 = 0;
    int v6 = 0;
  }
  else
  {
    int v5 = *((unsigned __int8 *)&lcp_gotoptions + 68 * v1 + 6);
    if (*((unsigned char *)&lcp_gotoptions + 68 * v1 + 6))
    {
      int v6 = 0;
      int v5 = 5;
    }
    else
    {
      int v6 = 4 * (*((unsigned char *)&lcp_gotoptions + 68 * v1 + 5) != 0);
    }
  }
  uint64_t v7 = (char *)&lcp_gotoptions + 68 * v1;
  if (v7[15]) {
    int v8 = *((unsigned __int8 *)&lcp_gotoptions + 68 * v1 + 45) + 3;
  }
  else {
    int v8 = 0;
  }
  int v9 = v3 + v2 + 4 * (v4 != 0) + v5 + v6 + 8 * (v7[11] != 0);
  if (v7[12]) {
    int v10 = 3;
  }
  else {
    int v10 = 0;
  }
  if (v7[8]) {
    int v11 = 6;
  }
  else {
    int v11 = 0;
  }
  return v9
       + v10
       + v11
       + 2 * (v7[9] != 0)
       + 2 * (v7[10] != 0)
       + 4 * (v7[13] != 0)
       + 2 * (v7[14] != 0)
       + v8;
}

void sub_10000F5AC(int *a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9 = *a1;
  uint64_t v10 = a2;
  if (lcp_gotoptions[68 * *a1 + 3])
  {
    int v11 = (char *)&lcp_gotoptions[68 * v9];
    int v13 = *((_DWORD *)v11 + 4);
    uint64_t v12 = v11 + 16;
    uint64_t v10 = a2;
    if (v13 != 1500)
    {
      *(_WORD *)a2 = 1025;
      *(unsigned char *)(a2 + 2) = BYTE1(*v12);
      uint64_t v10 = a2 + 4;
      *(unsigned char *)(a2 + 3) = *v12;
    }
  }
  if (lcp_gotoptions[68 * v9 + 4])
  {
    int v14 = (char *)&lcp_gotoptions[68 * v9];
    int v16 = *((_DWORD *)v14 + 7);
    uint64_t v15 = v14 + 28;
    if (v16 != -1)
    {
      *(_WORD *)uint64_t v10 = 1538;
      *(unsigned char *)(v10 + 2) = v15[3];
      *(unsigned char *)(v10 + 3) = *((_WORD *)v15 + 1);
      *(unsigned char *)(v10 + 4) = BYTE1(*(_DWORD *)v15);
      *(unsigned char *)(v10 + 5) = *(_DWORD *)v15;
      v10 += 6;
    }
  }
  uint64_t v17 = (char *)&lcp_gotoptions[68 * v9];
  int v19 = v17[7];
  BOOL v18 = v17 + 7;
  if (!v19 || (*(_DWORD *)uint64_t v10 = 667026435, v10 += 4, v20 = v10, !*v18))
  {
    uint64_t v21 = (char *)&lcp_gotoptions[68 * v9];
    int v23 = v21[6];
    uint64_t v22 = v21 + 6;
    if (v23)
    {
      *(_DWORD *)uint64_t v10 = 599917827;
      int v24 = lcp_gotoptions[68 * v9 + 24];
      if (v24)
      {
        LOBYTE(v25) = -127;
      }
      else if ((v24 & 2) != 0)
      {
        LOBYTE(v25) = 0x80;
      }
      else
      {
        int v25 = (v24 << 29 >> 31) & 5;
      }
      uint64_t v20 = v10 + 5;
      *(unsigned char *)(v10 + 4) = v25;
      if (*v18 || *v22) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v20 = v10;
    }
    if (lcp_gotoptions[68 * v9 + 5])
    {
      *(_DWORD *)uint64_t v20 = 599786499;
      v20 += 4;
    }
  }
LABEL_20:
  if (lcp_gotoptions[68 * v9 + 11])
  {
    *(_DWORD *)uint64_t v20 = 633341956;
    int64_t v26 = (char *)&lcp_gotoptions[68 * v9];
    *(unsigned char *)(v20 + 4) = v26[43];
    *(unsigned char *)(v20 + 5) = *((_WORD *)v26 + 21);
    *(unsigned char *)(v20 + 6) = BYTE1(*((_DWORD *)v26 + 10));
    *(unsigned char *)(v20 + 7) = *((_DWORD *)v26 + 10);
    v20 += 8;
  }
  if (lcp_gotoptions[68 * v9 + 12])
  {
    *(_WORD *)uint64_t v20 = 781;
    *(unsigned char *)(v20 + 2) = 6;
    v20 += 3;
  }
  if (lcp_gotoptions[68 * v9 + 8])
  {
    *(_WORD *)uint64_t v20 = 1541;
    int v27 = (char *)&lcp_gotoptions[68 * v9];
    *(unsigned char *)(v20 + 2) = v27[35];
    *(unsigned char *)(v20 + 3) = *((_WORD *)v27 + 17);
    *(unsigned char *)(v20 + 4) = BYTE1(*((_DWORD *)v27 + 8));
    *(unsigned char *)(v20 + 5) = *((_DWORD *)v27 + 8);
    v20 += 6;
  }
  if (lcp_gotoptions[68 * v9 + 9])
  {
    *(_WORD *)uint64_t v20 = 519;
    v20 += 2;
  }
  if (lcp_gotoptions[68 * v9 + 10])
  {
    *(_WORD *)uint64_t v20 = 520;
    v20 += 2;
  }
  if (lcp_gotoptions[68 * v9 + 13])
  {
    *(_WORD *)uint64_t v20 = 1041;
    int v28 = (char *)&lcp_gotoptions[68 * v9];
    *(unsigned char *)(v20 + 2) = BYTE1(*((_DWORD *)v28 + 5));
    *(unsigned char *)(v20 + 3) = *((_DWORD *)v28 + 5);
    v20 += 4;
  }
  if (lcp_gotoptions[68 * v9 + 14])
  {
    *(_WORD *)uint64_t v20 = 530;
    v20 += 2;
  }
  if (lcp_gotoptions[68 * v9 + 15])
  {
    *(unsigned char *)uint64_t v20 = 19;
    uint64_t v29 = (char *)&lcp_gotoptions[68 * v9];
    char v31 = v29[45];
    int v30 = v29 + 45;
    *(unsigned char *)(v20 + 1) = v31 + 3;
    uint64_t v32 = v20 + 3;
    *(unsigned char *)(v20 + 2) = *(v30 - 1);
    if (*v30)
    {
      unint64_t v33 = 0;
      int v34 = (char *)&lcp_gotoptions[68 * v9 + 46];
      do
      {
        *(unsigned char *)(v32 + v33) = v34[v33];
        ++v33;
      }
      while (v33 < *v30);
      uint64_t v20 = v32 + v33;
    }
    else
    {
      v20 += 3;
    }
  }
  if (v20 - a2 != *a3) {
    error((uint64_t)"Bug in lcp_addci: wrong length", a2, (uint64_t)a3, a4, a5, a6, a7, a8, a9);
  }
}

uint64_t sub_10000F8D4(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *a1;
  if (lcp_gotoptions[68 * *a1 + 3])
  {
    int v9 = *(_DWORD *)&lcp_gotoptions[68 * v8 + 16];
    if (v9 != 1500)
    {
      BOOL v11 = __OFSUB__(a3, 4);
      a3 = (a3 - 4);
      if ((int)a3 < 0 != v11
        || *(unsigned char *)(a2 + 1) != 4
        || *(unsigned char *)a2 != 1
        || v9 != bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16)
      {
        goto LABEL_89;
      }
      a2 += 4;
    }
  }
  if (lcp_gotoptions[68 * v8 + 4])
  {
    int v10 = *(_DWORD *)&lcp_gotoptions[68 * v8 + 28];
    if (v10 != -1)
    {
      BOOL v11 = __OFSUB__(a3, 6);
      a3 = (a3 - 6);
      if ((int)a3 < 0 != v11 || *(unsigned char *)(a2 + 1) != 6 || *(unsigned char *)a2 != 2 || bswap32(*(_DWORD *)(a2 + 2)) != v10) {
        goto LABEL_89;
      }
      a2 += 6;
    }
  }
  if (lcp_gotoptions[68 * v8 + 7])
  {
    BOOL v11 = __OFSUB__(a3, 4);
    a3 = (a3 - 4);
    if ((int)a3 < 0 != v11 || *(unsigned char *)(a2 + 1) != 4 || *(unsigned char *)a2 != 3) {
      goto LABEL_89;
    }
    unsigned int v12 = bswap32(*(unsigned __int16 *)(a2 + 2));
    int v13 = 49703;
LABEL_15:
    if (v13 != HIWORD(v12)) {
      goto LABEL_89;
    }
    a2 += 4;
    goto LABEL_39;
  }
  if (lcp_gotoptions[68 * v8 + 6])
  {
    BOOL v11 = __OFSUB__(a3, 5);
    a3 = (a3 - 5);
    if ((int)a3 < 0 != v11
      || *(unsigned char *)(a2 + 1) != 5
      || *(unsigned char *)a2 != 3
      || bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16 != 49699)
    {
      goto LABEL_89;
    }
    int v14 = lcp_gotoptions[68 * v8 + 24];
    if (v14) {
      int v15 = 129;
    }
    else {
      int v15 = (v14 & 2) != 0 ? 128 : (v14 << 29 >> 31) & 5;
    }
    if (v15 != *(unsigned __int8 *)(a2 + 4)) {
      goto LABEL_89;
    }
    a2 += 5;
  }
  else if (lcp_gotoptions[68 * v8 + 5])
  {
    BOOL v11 = __OFSUB__(a3, 4);
    a3 = (a3 - 4);
    if ((int)a3 < 0 != v11 || *(unsigned char *)(a2 + 1) != 4 || *(unsigned char *)a2 != 3) {
      goto LABEL_89;
    }
    unsigned int v12 = bswap32(*(unsigned __int16 *)(a2 + 2));
    int v13 = 49187;
    goto LABEL_15;
  }
LABEL_39:
  if (lcp_gotoptions[68 * v8 + 11])
  {
    BOOL v11 = __OFSUB__(a3, 8);
    a3 = (a3 - 8);
    if ((int)a3 < 0 != v11
      || *(unsigned char *)(a2 + 1) != 8
      || *(unsigned char *)a2 != 4
      || bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16 != 49189
      || bswap32(*(_DWORD *)(a2 + 4)) != *(_DWORD *)&lcp_gotoptions[68 * v8 + 40])
    {
      goto LABEL_89;
    }
    a2 += 8;
  }
  if (lcp_gotoptions[68 * v8 + 12])
  {
    BOOL v11 = __OFSUB__(a3, 3);
    a3 = (a3 - 3);
    if ((int)a3 < 0 != v11 || *(unsigned char *)(a2 + 1) != 3 || *(unsigned char *)a2 != 13 || *(unsigned char *)(a2 + 2) != 6) {
      goto LABEL_89;
    }
    a2 += 3;
  }
  if (lcp_gotoptions[68 * v8 + 8])
  {
    BOOL v11 = __OFSUB__(a3, 6);
    a3 = (a3 - 6);
    if ((int)a3 < 0 != v11
      || *(unsigned char *)(a2 + 1) != 6
      || *(unsigned char *)a2 != 5
      || bswap32(*(_DWORD *)(a2 + 2)) != *(_DWORD *)&lcp_gotoptions[68 * v8 + 32])
    {
      goto LABEL_89;
    }
    a2 += 6;
  }
  if (lcp_gotoptions[68 * v8 + 9])
  {
    BOOL v11 = __OFSUB__(a3, 2);
    a3 = (a3 - 2);
    if ((int)a3 < 0 != v11 || *(unsigned char *)(a2 + 1) != 2 || *(unsigned char *)a2 != 7) {
      goto LABEL_89;
    }
    a2 += 2;
  }
  if (lcp_gotoptions[68 * v8 + 10])
  {
    BOOL v11 = __OFSUB__(a3, 2);
    a3 = (a3 - 2);
    if ((int)a3 < 0 != v11 || *(unsigned char *)(a2 + 1) != 2 || *(unsigned char *)a2 != 8) {
      goto LABEL_89;
    }
    a2 += 2;
  }
  if (lcp_gotoptions[68 * v8 + 13])
  {
    BOOL v11 = __OFSUB__(a3, 4);
    a3 = (a3 - 4);
    if ((int)a3 < 0 != v11
      || *(unsigned char *)(a2 + 1) != 4
      || *(unsigned char *)a2 != 17
      || *(_DWORD *)&lcp_gotoptions[68 * v8 + 20] != bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16)
    {
      goto LABEL_89;
    }
    a2 += 4;
  }
  if (lcp_gotoptions[68 * v8 + 14])
  {
    BOOL v11 = __OFSUB__(a3, 2);
    a3 = (a3 - 2);
    if ((int)a3 < 0 != v11 || *(unsigned char *)(a2 + 1) != 2 || *(unsigned char *)a2 != 18) {
      goto LABEL_89;
    }
    a2 += 2;
  }
  if (lcp_gotoptions[68 * v8 + 15])
  {
    int v16 = &lcp_gotoptions[68 * v8];
    uint64_t v17 = v16[45];
    a3 = (a3 - (v17 + 3));
    if ((int)a3 < 0
      || v17 + 3 != *(unsigned __int8 *)(a2 + 1)
      || *(unsigned char *)a2 != 19
      || *(unsigned __int8 *)(a2 + 2) != v16[44])
    {
      goto LABEL_89;
    }
    if (v16[45])
    {
      BOOL v18 = (unsigned __int8 *)(a2 + 3);
      int v19 = &lcp_gotoptions[68 * v8 + 46];
      do
      {
        int v20 = *v19++;
        if (*v18 != v20) {
          goto LABEL_89;
        }
        ++v18;
      }
      while (--v17);
    }
  }
  if (!a3) {
    return 1;
  }
LABEL_89:
  if (debug) {
    dbglog((uint64_t)"lcp_acki: received bad Ack!", a2, a3, a4, a5, a6, a7, a8, vars0);
  }
  return 0;
}

uint64_t sub_10000FD48(int *a1, uint64_t a2, uint64_t a3)
{
  int v4 = *a1;
  int v5 = &lcp_gotoptions[68 * *a1];
  __int16 v155 = *(_WORD *)v5;
  char v6 = v5[3];
  unsigned __int8 v156 = v5[2];
  unsigned __int8 v7 = v5[4];
  LODWORD(v8) = v5[5];
  uint64_t v9 = v5[6];
  int v10 = v5[7];
  unsigned __int8 v130 = v5[8];
  uint64_t v11 = v5[9];
  unsigned __int8 v132 = v5[10];
  unsigned __int8 v152 = v5[11];
  unsigned __int8 v12 = v5[12];
  unsigned __int8 v129 = v5[13];
  uint64_t v13 = v5[14];
  uint64_t v14 = v5[15];
  unsigned int v16 = *((_DWORD *)v5 + 4);
  uint64_t v15 = *((unsigned int *)v5 + 5);
  uint64_t v17 = v5[24];
  unsigned __int8 v154 = v5[27];
  __int16 v153 = *(_WORD *)(v5 + 25);
  uint64_t v18 = *((unsigned int *)v5 + 7);
  uint64_t v19 = *((unsigned int *)v5 + 8);
  int v120 = *((_DWORD *)v5 + 9);
  unsigned int v131 = *((_DWORD *)v5 + 10);
  uint64_t v158 = *(void *)(v5 + 60);
  long long v157 = *(_OWORD *)(v5 + 44);
  if (v6)
  {
    char v143 = 0;
    char v20 = 1;
    if ((int)a3 >= 4 && v16 != 1500)
    {
      if (*(unsigned char *)(a2 + 1) == 4 && *(unsigned char *)a2 == 1)
      {
        char v20 = 0;
        unsigned int v21 = *(unsigned __int16 *)(a2 + 2);
        a2 += 4;
        unsigned int v22 = __rev16(v21);
        if (v22 < 0x5DD || (int)v22 <= *((_DWORD *)&lcp_wantoptions + 17 * v4 + 4)) {
          unsigned int v16 = v22;
        }
        char v143 = 1;
        a3 = (a3 - 4);
        if (!v5[4]) {
          goto LABEL_21;
        }
      }
      else
      {
        char v143 = 0;
        if (!v5[4]) {
          goto LABEL_21;
        }
      }
      goto LABEL_15;
    }
  }
  else
  {
    char v143 = 0;
    char v20 = 1;
  }
  if (!v5[4]) {
    goto LABEL_21;
  }
LABEL_15:
  char v142 = 0;
  char v139 = 1;
  if (v18 != -1 && (int)a3 >= 6)
  {
    if (*(unsigned char *)(a2 + 1) == 6 && *(unsigned char *)a2 == 2)
    {
      char v139 = 0;
      unsigned int v24 = *(_DWORD *)(a2 + 2);
      a2 += 6;
      uint64_t v18 = bswap32(v24) | v18;
      char v142 = 1;
      a3 = (a3 - 6);
      goto LABEL_22;
    }
LABEL_21:
    char v142 = 0;
    char v139 = 1;
  }
LABEL_22:
  v138 = &lcp_gotoptions[68 * v4 + 6];
  char v146 = v20;
  if (!v5[6] && !v5[5])
  {
    int v25 = 0;
    if (!v5[7] || (int)a3 <= 3)
    {
      unsigned __int8 v26 = v5[12];
      int v27 = *a1;
      int v28 = v5[11];
      uint64_t v29 = a2;
      uint64_t v30 = a3;
      int v135 = 0;
      int v133 = 0;
      LOBYTE(v8) = 0;
      uint64_t v9 = 0;
      goto LABEL_65;
    }
LABEL_28:
    unsigned __int8 v26 = v5[12];
    if (*(unsigned char *)a2 != 3)
    {
      int v27 = *a1;
      int v25 = 0;
      int v135 = 0;
      int v133 = 0;
      int v28 = v5[11];
      uint64_t v29 = a2;
      uint64_t v30 = a3;
      goto LABEL_65;
    }
    int v25 = 0;
    unsigned int v31 = *(unsigned __int8 *)(a2 + 1);
    int v27 = *a1;
    if (v31 < 4 || (uint64_t v30 = a3 - v31, a3 < v31))
    {
      int v28 = v5[11];
      uint64_t v29 = a2;
      uint64_t v30 = a3;
      int v135 = 0;
      int v133 = 0;
      goto LABEL_65;
    }
    uint64_t v29 = a2 + 4;
    unsigned int v32 = __rev16(*(unsigned __int16 *)(a2 + 2));
    if (v31 == 4 && v32 == 49187)
    {
      if (v5[7]) {
        goto LABEL_34;
      }
      if (v5[6])
      {
        int v133 = 0;
        LOBYTE(v10) = 0;
        int v135 = 1;
        int v28 = v5[11];
        uint64_t v9 = 0;
LABEL_56:
        int v25 = v5[5];
        goto LABEL_65;
      }
LABEL_199:
      if (debug) {
        dbglog((uint64_t)"lcp_nakci: received bad Nak!", v14, a3, v9, v11, v15, v13, v18, v104);
      }
      return 0;
    }
    if (v31 != 5 || v32 != 49699)
    {
      int v34 = v5[7];
      uint64_t v35 = v31 - 4;
      if (v31 == 4)
      {
        int v34 = v5[7];
        if (v32 == 49703)
        {
          int v34 = v5[7];
          if (v5[7])
          {
            unsigned int v144 = v16;
            unsigned __int8 v108 = v5[4];
            unsigned int v109 = v5[15];
            unsigned int v121 = v5[14];
            unsigned int v125 = v5[24];
            char v105 = v6;
            unsigned int v113 = *((_DWORD *)v5 + 8);
            unsigned __int8 v150 = v5[9];
            int v117 = v5[5];
            int v36 = *((_DWORD *)v5 + 5);
            uint64_t v37 = v18;
            uint64_t v38 = v5[6];
            int v39 = v5[7];
            uint64_t v140 = v31 - 4;
            dbglog((uint64_t)"Unexpected Conf-Nak for EAP", v14, a3, v9, v11, v15, v13, v18, v104);
            uint64_t v35 = v140;
            int v10 = v39;
            uint64_t v9 = v38;
            uint64_t v18 = v37;
            LODWORD(v15) = v36;
            LODWORD(v8) = v117;
            LOBYTE(v11) = v150;
            unsigned __int8 v26 = v12;
            uint64_t v14 = v109;
            uint64_t v19 = v113;
            char v6 = v105;
            unsigned __int8 v7 = v108;
            uint64_t v13 = v121;
            uint64_t v17 = v125;
            int v34 = lcp_gotoptions[68 * v27 + 7];
            unsigned int v16 = v144;
          }
        }
      }
      if (v34)
      {
        char v40 = 0;
        char v41 = v8;
        uint64_t v42 = v9;
      }
      else
      {
        if (*v138) {
          char v41 = v8;
        }
        else {
          char v41 = 0;
        }
        if (*v138) {
          uint64_t v42 = 0;
        }
        else {
          uint64_t v42 = v9;
        }
        char v40 = v10;
      }
      v29 += v35;
      int v25 = v8;
      int v28 = lcp_gotoptions[68 * v27 + 11];
      int v135 = v9;
      int v133 = v10;
      LOBYTE(v8) = v41;
      uint64_t v9 = v42;
      LOBYTE(v10) = v40;
LABEL_65:
      char v149 = 0;
      if (v28)
      {
        a3 = (v30 - 8);
        if ((int)v30 >= 8)
        {
          if (*(unsigned char *)(v29 + 1) == 8 && *(unsigned char *)v29 == 4)
          {
            a2 = v29 + 8;
            if (bswap32(*(unsigned __int16 *)(v29 + 2)) >> 16 == 49189) {
              unsigned int v131 = bswap32(*(_DWORD *)(v29 + 4));
            }
            else {
              unsigned __int8 v152 = 0;
            }
            char v149 = 1;
            goto LABEL_73;
          }
          char v149 = 0;
        }
      }
      a2 = v29;
      a3 = v30;
LABEL_73:
      int v4 = v27;
      unsigned __int8 v12 = v26;
      goto LABEL_74;
    }
    uint64_t v29 = a2 + 5;
    int v33 = *(unsigned __int8 *)(a2 + 4);
    if (v5[7])
    {
      switch(v33)
      {
        case 5:
          LOBYTE(v10) = 0;
          BOOL v102 = (v17 & 4) == 0;
          unsigned int v103 = 4;
          break;
        case 128:
          LOBYTE(v10) = 0;
          BOOL v102 = (v17 & 2) == 0;
          unsigned int v103 = 2;
          break;
        case 129:
          LOBYTE(v10) = 0;
          if (v17) {
            uint64_t v17 = 1;
          }
          else {
            uint64_t v17 = v5[24];
          }
          goto LABEL_35;
        default:
LABEL_34:
          LOBYTE(v10) = 0;
LABEL_35:
          int v133 = 1;
          int v28 = v5[11];
          int v25 = v5[5];
          int v135 = v5[6];
          goto LABEL_65;
      }
      if (v102) {
        uint64_t v17 = v5[24];
      }
      else {
        uint64_t v17 = v103;
      }
      goto LABEL_35;
    }
    if (!v5[6])
    {
      int v135 = 0;
      int v133 = 0;
      LOBYTE(v10) = 0;
      int v28 = v5[11];
      int v25 = v5[5];
      LOBYTE(v8) = 0;
      goto LABEL_65;
    }
    if ((v17 & 1) == v33 && (v17 & 6) == 0) {
      goto LABEL_199;
    }
    if (v33 == 5)
    {
      if ((v17 & 4) != 0)
      {
        int v133 = 0;
        LOBYTE(v10) = 0;
        uint64_t v17 = 4;
        goto LABEL_219;
      }
    }
    else
    {
      if (v33 != 128)
      {
        if (v33 == 129 && (v17 & 1) != 0)
        {
          int v133 = 0;
          LOBYTE(v10) = 0;
          int v135 = 1;
          int v28 = v5[11];
          int v25 = v5[5];
          uint64_t v17 = 1;
          goto LABEL_65;
        }
        goto LABEL_216;
      }
      if ((v17 & 2) != 0)
      {
        int v133 = 0;
        LOBYTE(v10) = 0;
        uint64_t v17 = 2;
LABEL_219:
        int v135 = 1;
        int v28 = v5[11];
        goto LABEL_56;
      }
    }
LABEL_216:
    int v133 = 0;
    LOBYTE(v10) = 0;
    uint64_t v17 = (v17 - 1) & v17;
    if (v17) {
      uint64_t v9 = v5[6];
    }
    else {
      uint64_t v9 = 0;
    }
    goto LABEL_219;
  }
  if ((int)a3 >= 4) {
    goto LABEL_28;
  }
  int v133 = 0;
  int v135 = 0;
  int v25 = 0;
  char v149 = 0;
LABEL_74:
  v145 = &lcp_gotoptions[68 * v4];
  if (v145[12] && (int)a3 >= 3 && *(unsigned char *)(a2 + 1) == 3 && *(unsigned char *)a2 == 13)
  {
    unsigned __int8 v12 = 0;
    a2 += 3;
    a3 = (a3 - 3);
  }
  uint64_t v43 = &lcp_gotoptions[68 * v4];
  int v44 = v43[8];
  v137 = v43 + 8;
  char v45 = 1;
  unsigned __int8 v141 = v10;
  int v134 = v25;
  if (v44 && (uint64_t v46 = (a3 - 6), (int)a3 >= 6))
  {
    if (*(unsigned char *)(a2 + 1) == 6 && *(unsigned char *)a2 == 5)
    {
      a2 += 6;
      char v136 = 1;
      char v106 = v6;
      unsigned int v110 = v14;
      unsigned int v122 = v13;
      unsigned int v126 = v17;
      unsigned __int8 v47 = v7;
      unsigned __int8 v48 = v12;
      char v49 = v11;
      char v118 = v8;
      LODWORD(v8) = v15;
      int v114 = v4;
      uint64_t v50 = v18;
      uint64_t v51 = v9;
      uint64_t v52 = magic();
      uint64_t v9 = v51;
      uint64_t v18 = v50;
      int v4 = v114;
      LODWORD(v15) = v8;
      LOBYTE(v8) = v118;
      LOBYTE(v11) = v49;
      uint64_t v13 = v122;
      uint64_t v17 = v126;
      unsigned __int8 v12 = v48;
      unsigned __int8 v7 = v47;
      uint64_t v14 = v110;
      char v6 = v106;
      uint64_t v19 = v52;
      char v45 = 0;
      a3 = v46;
    }
    else
    {
      char v136 = 0;
      char v45 = 1;
    }
  }
  else
  {
    char v136 = 0;
  }
  char v53 = 0;
  int v54 = lcp_gotoptions[68 * v4 + 9];
  if (lcp_gotoptions[68 * v4 + 9] && (int)a3 >= 2)
  {
    if (*(unsigned char *)(a2 + 1) == 2 && *(unsigned char *)a2 == 7)
    {
      LOBYTE(v11) = 0;
      a2 += 2;
      char v53 = 1;
      a3 = (a3 - 2);
    }
    else
    {
      char v53 = 0;
    }
  }
  char v55 = 0;
  int v56 = lcp_gotoptions[68 * v4 + 10];
  char v123 = v45;
  if (lcp_gotoptions[68 * v4 + 10] && (int)a3 >= 2)
  {
    if (*(unsigned char *)(a2 + 1) == 2 && *(unsigned char *)a2 == 8)
    {
      int v57 = v15;
      unsigned __int8 v58 = v11;
      unsigned __int8 v132 = 0;
      a2 += 2;
      char v55 = 1;
      a3 = (a3 - 2);
    }
    else
    {
      int v57 = v15;
      unsigned __int8 v58 = v11;
      char v55 = 0;
    }
  }
  else
  {
    int v57 = v15;
    unsigned __int8 v58 = v11;
  }
  uint64_t v59 = v19;
  char v60 = 0;
  int v61 = lcp_gotoptions[68 * v4 + 13];
  uint64_t v62 = v17;
  if (lcp_gotoptions[68 * v4 + 13] && (int)a3 >= 4)
  {
    if (*(unsigned char *)(a2 + 1) == 4 && *(unsigned char *)a2 == 17)
    {
      unsigned int v63 = *(unsigned __int16 *)(a2 + 2);
      a2 += 4;
      signed int v64 = __rev16(v63);
      if (v64 <= *((_DWORD *)&lcp_wantoptions + 17 * v4 + 5)) {
        int v57 = v64;
      }
      char v60 = 1;
      a3 = (a3 - 4);
    }
    else
    {
      char v60 = 0;
    }
  }
  char v65 = 0;
  int v66 = lcp_gotoptions[68 * v4 + 14];
  if (lcp_gotoptions[68 * v4 + 14] && (int)a3 >= 2)
  {
    if (*(unsigned char *)(a2 + 1) == 2 && *(unsigned char *)a2 == 18)
    {
      uint64_t v67 = v14;
      uint64_t v13 = 0;
      a2 += 2;
      char v65 = 1;
      a3 = (a3 - 2);
    }
    else
    {
      uint64_t v67 = v14;
      char v65 = 0;
    }
  }
  else
  {
    uint64_t v67 = v14;
  }
  uint64_t v68 = &lcp_gotoptions[68 * v4];
  uint64_t v14 = v68[15];
  if (v68[15] && (int)a3 > 2)
  {
    if (*(unsigned char *)a2 != 19)
    {
LABEL_123:
      unsigned int v107 = v9;
      char v119 = v8;
      unsigned int v127 = v62;
      unsigned int v111 = v18;
      unsigned int v115 = v59;
      uint64_t v8 = v13;
      uint64_t v18 = v67;
      char v73 = v6;
      uint64_t v9 = (uint64_t)&lcp_gotoptions[68 * v4 + 4];
      uint64_t v11 = (uint64_t)(v145 + 11);
      uint64_t v74 = &lcp_gotoptions[68 * v4];
      uint64_t v15 = (uint64_t)(v74 + 5);
      uint64_t v13 = (uint64_t)(v74 + 7);
      uint64_t v75 = v74 + 28;
      uint64_t v76 = v74 + 16;
      while (2)
      {
        uint64_t v77 = *(unsigned __int8 *)(a2 + 1);
        if (v77 < 2) {
          goto LABEL_199;
        }
        a3 = (a3 - v77);
        if ((int)a3 < 0) {
          goto LABEL_199;
        }
        switch(*(unsigned char *)a2)
        {
          case 1:
            if (v5[3])
            {
              char v78 = v143;
              if (*v76 != 1500) {
                char v78 = 1;
              }
              if v77 != 4 || (v78) {
                goto LABEL_199;
              }
            }
            else
            {
              if (v77 == 4) {
                char v82 = v146 ^ 1;
              }
              else {
                char v82 = 1;
              }
              if (v82) {
                goto LABEL_199;
              }
            }
            unsigned int v83 = __rev16(*(unsigned __int16 *)(a2 + 2));
            if (v83 < 0x5DC)
            {
              char v73 = 1;
              unsigned int v16 = v83;
            }
            goto LABEL_165;
          case 2:
            if (*(unsigned char *)v9)
            {
              BOOL v79 = *v75 == -1;
              char v80 = v142;
LABEL_146:
              if (!v79) {
                char v80 = 1;
              }
              if (v77 != 6) {
                goto LABEL_199;
              }
LABEL_164:
              if (v80) {
                goto LABEL_199;
              }
            }
            else
            {
              char v84 = v139;
              if (v77 != 6) {
                char v84 = 0;
              }
              if ((v84 & 1) == 0) {
                goto LABEL_199;
              }
            }
LABEL_165:
            a2 += v77;
            if ((int)a3 > 1) {
              continue;
            }
            char v6 = v73;
            unsigned __int8 v72 = v18;
            uint64_t v18 = v111;
            uint64_t v59 = v115;
            uint64_t v13 = v8;
            uint64_t v71 = a1;
            uint64_t v62 = v127;
            uint64_t v9 = v107;
            LOBYTE(v8) = v119;
            goto LABEL_187;
          case 3:
            if (*v138 | v135 || *(unsigned char *)v15 || v134 || *(unsigned char *)v13 || v133) {
              goto LABEL_199;
            }
            goto LABEL_165;
          case 4:
            char v80 = v149;
            if (*(unsigned char *)v11) {
              char v80 = 1;
            }
            if (v77 != 8) {
              goto LABEL_199;
            }
            goto LABEL_164;
          case 5:
            BOOL v79 = *v137 == 0;
            char v80 = v136;
            goto LABEL_146;
          case 7:
            if (v77 == 2) {
              char v80 = v53;
            }
            else {
              char v80 = 1;
            }
            if (v54) {
              goto LABEL_199;
            }
            goto LABEL_164;
          case 8:
            if (v77 == 2) {
              char v80 = v55;
            }
            else {
              char v80 = 1;
            }
            if (v56) {
              goto LABEL_199;
            }
            goto LABEL_164;
          case 0x11:
            if (v77 == 4) {
              char v80 = v60;
            }
            else {
              char v80 = 1;
            }
            if (v61) {
              goto LABEL_199;
            }
            goto LABEL_164;
          case 0x12:
            if (v77 == 2) {
              char v81 = v65;
            }
            else {
              char v81 = 1;
            }
            if (v66 || (v81 & 1) != 0) {
              goto LABEL_199;
            }
            uint64_t v8 = 1;
            goto LABEL_165;
          case 0x13:
            if (v14 || v77 < 3) {
              goto LABEL_199;
            }
            goto LABEL_165;
          default:
            goto LABEL_165;
        }
      }
    }
    char v69 = v6;
    unsigned int v70 = *(unsigned __int8 *)(a2 + 1);
    if (v70 < 3 || a3 < v70)
    {
      char v6 = v69;
      goto LABEL_123;
    }
    uint64_t v67 = 0;
    a2 += *(unsigned __int8 *)(a2 + 1);
    a3 = a3 - v70;
    char v6 = v69;
  }
  uint64_t v71 = a1;
  if ((int)a3 >= 2) {
    goto LABEL_123;
  }
  unsigned __int8 v72 = v67;
LABEL_187:
  unsigned __int8 v85 = v141;
  if (v71[2] == 9) {
    return 1;
  }
  unsigned __int8 v87 = v8;
  unsigned int v88 = v16;
  unsigned __int8 v89 = v7;
  unsigned int v90 = v88;
  if (v123)
  {
    int v91 = 0;
  }
  else
  {
    int v91 = v120 + 1;
    if (v120 + 1 >= lcp_loopbackfail)
    {
      unsigned __int8 v147 = v12;
      unsigned __int8 v151 = v58;
      int v112 = v18;
      int v116 = v59;
      char v124 = v13;
      char v128 = v62;
      uint64_t v92 = v71;
      char v93 = v9;
      char v94 = v6;
      unsigned __int8 v95 = v72;
      notice((uint64_t)"Serial line is looped back.", v14, a3, v9, v59, v62, v13, v18, v104);
      lcp_close(*v92, "Loopback detected", v96, v97, v98, v99, v100, v101);
      unsigned __int8 v72 = v95;
      char v6 = v94;
      unsigned __int8 v85 = v141;
      LOBYTE(v9) = v93;
      LODWORD(v18) = v112;
      LODWORD(v59) = v116;
      LOBYTE(v13) = v124;
      LOBYTE(v62) = v128;
      unsigned __int8 v58 = v151;
      unsigned __int8 v12 = v147;
      *(_DWORD *)status = 17;
    }
  }
  *(_WORD *)int v5 = v155;
  v5[2] = v156;
  v5[3] = v6;
  v5[4] = v89;
  v5[5] = v87;
  v5[6] = v9;
  v5[7] = v85;
  v5[8] = v130;
  v5[9] = v58;
  v5[10] = v132;
  v5[11] = v152;
  v5[12] = v12;
  v5[13] = v129;
  v5[14] = v13;
  v5[15] = v72;
  *((_DWORD *)v5 + 4) = v90;
  *((_DWORD *)v5 + 5) = v57;
  v5[24] = v62;
  v5[27] = v154;
  *(_WORD *)(v5 + 25) = v153;
  *((_DWORD *)v5 + 7) = v18;
  *((_DWORD *)v5 + 8) = v59;
  *((_DWORD *)v5 + 9) = v91;
  *((_DWORD *)v5 + 10) = v131;
  *(void *)(v5 + 60) = v158;
  uint64_t result = 1;
  *(_OWORD *)(v5 + 44) = v157;
  return result;
}

uint64_t sub_100010A88(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = &lcp_gotoptions[68 * (int)v3];
  unsigned __int8 v5 = v4[3];
  unsigned __int8 v6 = v4[4];
  uint64_t v7 = v4[5];
  uint64_t v8 = v4[6];
  unsigned __int8 v9 = v4[7];
  unsigned __int8 v10 = v4[8];
  unsigned __int8 v11 = v4[9];
  unsigned __int8 v12 = v4[10];
  unsigned __int8 v13 = v4[11];
  unsigned __int8 v14 = v4[12];
  unsigned __int8 v15 = v4[13];
  unsigned __int8 v16 = v4[14];
  uint64_t v17 = v4[15];
  uint64_t v18 = (a3 - 4);
  if ((int)a3 >= 4 && v4[3] && a2[1] == 4 && *a2 == 1)
  {
    a3 = *(unsigned int *)&lcp_gotoptions[68 * (int)v3 + 16];
    if (a3 != bswap32(*((unsigned __int16 *)a2 + 1)) >> 16) {
      goto LABEL_110;
    }
    unsigned __int8 v5 = 0;
    a2 += 4;
    a3 = v18;
  }
  if (v4[4]) {
    BOOL v19 = (int)a3 < 6;
  }
  else {
    BOOL v19 = 1;
  }
  if (!v19 && a2[1] == 6 && *a2 == 2)
  {
    if (bswap32(*(_DWORD *)(a2 + 2)) != *(_DWORD *)&lcp_gotoptions[68 * (int)v3 + 28]) {
      goto LABEL_110;
    }
    unsigned __int8 v6 = 0;
    a2 += 6;
    a3 = (a3 - 6);
  }
  if (v4[7]) {
    BOOL v20 = (int)a3 < 4;
  }
  else {
    BOOL v20 = 1;
  }
  if (!v20)
  {
    if (a2[1] != 4 || *a2 != 3) {
      goto LABEL_47;
    }
    if (bswap32(*((unsigned __int16 *)a2 + 1)) >> 16 != 49703) {
      goto LABEL_110;
    }
    goto LABEL_38;
  }
  if (v4[7]) {
    goto LABEL_47;
  }
  if (v4[6]) {
    BOOL v21 = (int)a3 < 5;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21)
  {
    if (!v4[6])
    {
      if (v4[5]) {
        BOOL v22 = (int)a3 < 4;
      }
      else {
        BOOL v22 = 1;
      }
      if (!v22 && a2[1] == 4 && *a2 == 3)
      {
        uint64_t v7 = bswap32(*((unsigned __int16 *)a2 + 1));
        uint64_t v8 = 49187;
        if (WORD1(v7) != 49187) {
          goto LABEL_110;
        }
        uint64_t v7 = 0;
        uint64_t v8 = 0;
LABEL_38:
        unsigned __int8 v9 = 0;
        a2 += 4;
        a3 = (a3 - 4);
        goto LABEL_47;
      }
      uint64_t v8 = 0;
    }
    goto LABEL_46;
  }
  if (a2[1] != 5 || *a2 != 3)
  {
LABEL_46:
    unsigned __int8 v9 = 0;
    goto LABEL_47;
  }
  uint64_t v7 = bswap32(*((unsigned __int16 *)a2 + 1));
  uint64_t v8 = 49699;
  if (WORD1(v7) != 49699) {
    goto LABEL_110;
  }
  uint64_t v7 = a2[4];
  int v23 = lcp_gotoptions[68 * (int)v3 + 24];
  if (v23) {
    uint64_t v8 = 129;
  }
  else {
    uint64_t v8 = (v23 & 2) != 0 ? 128 : (v23 << 29 >> 31) & 5;
  }
  if (v8 != v7) {
    goto LABEL_110;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  unsigned __int8 v9 = 0;
  a3 = (a3 - 5);
  a2 += 5;
LABEL_47:
  if (v4[11]) {
    BOOL v24 = (int)a3 < 8;
  }
  else {
    BOOL v24 = 1;
  }
  if (!v24 && a2[1] == 8 && *a2 == 4)
  {
    if (bswap32(*((unsigned __int16 *)a2 + 1)) >> 16 != 49189
      || bswap32(*((_DWORD *)a2 + 1)) != *(_DWORD *)&lcp_gotoptions[68 * (int)v3 + 40])
    {
      goto LABEL_110;
    }
    unsigned __int8 v13 = 0;
    a2 += 8;
    a3 = (a3 - 8);
  }
  if (v4[12]) {
    BOOL v25 = (int)a3 < 3;
  }
  else {
    BOOL v25 = 1;
  }
  if (!v25 && a2[1] == 3 && *a2 == 13)
  {
    if (a2[2] != 6) {
      goto LABEL_110;
    }
    unsigned __int8 v14 = 0;
    a2 += 3;
    a3 = (a3 - 3);
  }
  if (v4[8]) {
    BOOL v26 = (int)a3 < 6;
  }
  else {
    BOOL v26 = 1;
  }
  if (!v26 && a2[1] == 6 && *a2 == 5)
  {
    if (bswap32(*(_DWORD *)(a2 + 2)) != *(_DWORD *)&lcp_gotoptions[68 * (int)v3 + 32]) {
      goto LABEL_110;
    }
    unsigned __int8 v10 = 0;
    a2 += 6;
    a3 = (a3 - 6);
  }
  if (v4[9]) {
    BOOL v27 = (int)a3 < 2;
  }
  else {
    BOOL v27 = 1;
  }
  if (!v27 && a2[1] == 2 && *a2 == 7)
  {
    unsigned __int8 v11 = 0;
    a3 = (a3 - 2);
    a2 += 2;
  }
  if (v4[10]) {
    BOOL v28 = (int)a3 < 2;
  }
  else {
    BOOL v28 = 1;
  }
  if (!v28 && a2[1] == 2 && *a2 == 8)
  {
    unsigned __int8 v12 = 0;
    a3 = (a3 - 2);
    a2 += 2;
  }
  if (v4[13]) {
    BOOL v29 = (int)a3 < 4;
  }
  else {
    BOOL v29 = 1;
  }
  if (!v29 && a2[1] == 4 && *a2 == 17)
  {
    if (*(_DWORD *)&lcp_gotoptions[68 * (int)v3 + 20] != bswap32(*((unsigned __int16 *)a2 + 1)) >> 16) {
      goto LABEL_110;
    }
    unsigned __int8 v15 = 0;
    a2 += 4;
    a3 = (a3 - 4);
  }
  if (v4[14] && (int)a3 >= 2 && a2[1] == 2 && *a2 == 18)
  {
    unsigned __int8 v16 = 0;
    a2 += 2;
    a3 = (a3 - 2);
  }
  if (v4[15])
  {
    uint64_t v30 = &lcp_gotoptions[68 * (int)v3];
    uint64_t v31 = v30[45];
    uint64_t v32 = (a3 - (v31 + 3));
    if ((int)a3 >= (int)v31 + 3 && *a2 == 19 && v31 + 3 == a2[1])
    {
      uint64_t v17 = a2[2];
      a3 = v30[44];
      if (v17 != a3) {
        goto LABEL_110;
      }
      if (v30[45])
      {
        a2 += 3;
        a3 = (uint64_t)&lcp_gotoptions[68 * (int)v3 + 46];
        do
        {
          uint64_t v17 = *a2;
          unsigned int v33 = *(unsigned __int8 *)a3++;
          uint64_t v3 = v33;
          if (v17 != v33) {
            goto LABEL_110;
          }
          ++a2;
        }
        while (--v31);
      }
      uint64_t v17 = 0;
      a3 = v32;
    }
  }
  if (!a3)
  {
    if (a1[2] == 9) {
      return 1;
    }
    v4[3] = v5;
    v4[4] = v6;
    v4[5] = v7;
    v4[6] = v8;
    v4[7] = v9;
    v4[8] = v10;
    v4[9] = v11;
    v4[10] = v12;
    v4[11] = v13;
    v4[12] = v14;
    v4[13] = v15;
    v4[14] = v16;
    uint64_t result = 1;
    v4[15] = v17;
    return result;
  }
LABEL_110:
  if (debug) {
    dbglog((uint64_t)"lcp_rejci: received bad Reject!", (uint64_t)a2, a3, v7, v17, v3, (uint64_t)lcp_gotoptions, v8, v35);
  }
  return 0;
}

uint64_t sub_100010F74(int *a1, char *__dst, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v51 = a4;
  uint64_t v8 = __dst;
  uint64_t v9 = 17 * *a1;
  unsigned __int8 v10 = (char *)&lcp_hisoptions + 68 * *a1;
  int v11 = *a3;
  *((_DWORD *)v10 + 16) = 0;
  *((_OWORD *)v10 + 3) = 0u;
  *(_OWORD *)unsigned __int8 v10 = 0u;
  uint64_t v75 = (unsigned __int8 *)(v10 + 44);
  uint64_t v76 = v10 + 15;
  char v73 = v10 + 46;
  uint64_t v74 = v10 + 45;
  uint64_t v71 = v10 + 13;
  unsigned __int8 v72 = v10 + 14;
  char v69 = v10 + 10;
  unsigned int v70 = (unsigned int *)(v10 + 20);
  uint64_t v68 = v10 + 9;
  uint64_t v62 = v10 + 6;
  int v61 = v10 + 5;
  char v60 = v10 + 7;
  int v54 = v10 + 24;
  char v65 = v10 + 4;
  int v66 = v10 + 8;
  *((_OWORD *)v10 + 2) = 0u;
  unsigned __int8 v12 = (unsigned int *)(v10 + 32);
  *((_OWORD *)v10 + 1) = 0u;
  unsigned __int8 v13 = (unsigned int *)(v10 + 16);
  unsigned int v63 = v10 + 3;
  signed int v64 = (int *)(v10 + 28);
  unsigned __int8 v14 = (char *)&lcp_allowoptions + 4 * v9;
  unsigned __int8 v87 = v14 + 15;
  unsigned int v83 = v14 + 13;
  char v84 = v14 + 14;
  char v81 = v14 + 9;
  char v82 = v14 + 10;
  unsigned __int8 v15 = &lcp_gotoptions[4 * v9];
  uint64_t v77 = v15 + 8;
  int v57 = v15 + 32;
  uint64_t v86 = v14 + 8;
  char v80 = v14 + 11;
  uint64_t v67 = v14 + 5;
  unsigned __int8 v58 = v14 + 6;
  char v55 = v14 + 24;
  int v56 = v14 + 7;
  unsigned __int8 v85 = v14 + 28;
  char v78 = v14 + 3;
  BOOL v79 = v14 + 4;
  uint64_t v50 = v14 + 40;
  uint64_t v59 = (char *)&unk_10004A3A1;
  uint64_t v16 = 2;
  uint64_t v17 = __dst;
  while (1)
  {
    int v18 = multilink;
LABEL_3:
    BOOL v19 = v17;
    if (!v11) {
      break;
    }
    if (v11 >= 2
      && ((uint64_t v20 = v17[1], v20 >= 2) ? (v21 = v11 >= v20) : (v21 = 0), v21))
    {
      int v22 = *v17;
      v11 -= v20;
      v17 += v20;
      switch(v22)
      {
        case 1:
          if (v20 != 4 || !*v78) {
            goto LABEL_87;
          }
          unsigned int v23 = __rev16(*((unsigned __int16 *)v19 + 1));
          if (v23 > 0x7F)
          {
            *unsigned int v63 = 1;
            *unsigned __int8 v13 = v23;
            goto LABEL_82;
          }
          *(_DWORD *)uint64_t v59 = -2147482623;
          uint64_t v38 = v59 + 4;
          goto LABEL_123;
        case 2:
          if (v20 != 6 || !*v79) {
            goto LABEL_87;
          }
          int v24 = (v19[2] << 16) | (v19[3] << 8) | v19[4];
          unsigned __int8 v25 = v19[5];
          int v26 = v25 | (v24 << 8);
          if ((*v85 & ~v26) == 0)
          {
            *char v65 = 1;
            *signed int v64 = v26;
            goto LABEL_82;
          }
          int v37 = v24 << 8;
          *(_WORD *)uint64_t v59 = 1538;
          v59[2] = (*v85 | v37) >> 24;
          v59[3] = (*v85 | v37) >> 16;
          v59[4] = (unsigned __int16)(*v85 | v37) >> 8;
          v59[5] = v25 | *v85;
          uint64_t v38 = v59 + 6;
          goto LABEL_123;
        case 3:
          if (v20 < 4 || !*v67 && !*v58 && !*v56)
          {
            int v36 = "No auth is possible";
LABEL_101:
            dbglog((uint64_t)v36, (uint64_t)__dst, (uint64_t)a3, a4, a5, a6, a7, a8, v49);
            goto LABEL_87;
          }
          unsigned int v27 = __rev16(*((unsigned __int16 *)v19 + 1));
          if (v27 == 49703)
          {
            if (*v62 || v20 != 4 || *v61)
            {
              if (!debug) {
                goto LABEL_87;
              }
              int v36 = "lcp_reqci: rcvd AUTHTYPE EAP, rejecting...";
              goto LABEL_101;
            }
            if (*v56)
            {
              BOOL v28 = v60;
              goto LABEL_81;
            }
            char v40 = v59;
            *uint64_t v59 = 3;
            uint64_t v38 = v59 + 4;
            if (!*v58)
            {
              *(_WORD *)(v59 + 1) = -16380;
              char v41 = 35;
              goto LABEL_120;
            }
LABEL_110:
            *(_WORD *)(v40 + 1) = -15867;
            v40[3] = 35;
            goto LABEL_111;
          }
          if (v27 != 49699)
          {
            if (v27 == 49187)
            {
              if (*v62 || v20 != 4 || *v60)
              {
                if (!debug) {
                  goto LABEL_87;
                }
                int v36 = "lcp_reqci: rcvd AUTHTYPE PAP, rejecting...";
                goto LABEL_101;
              }
              if (*v67)
              {
                BOOL v28 = v61;
                goto LABEL_81;
              }
              char v40 = v59;
              *uint64_t v59 = 3;
              uint64_t v38 = v59 + 4;
              if (*v56)
              {
LABEL_108:
                *(_WORD *)(v40 + 1) = -15868;
                char v41 = 39;
LABEL_120:
                v40[3] = v41;
                goto LABEL_123;
              }
              goto LABEL_110;
            }
            char v40 = v59;
            *uint64_t v59 = 3;
            uint64_t v38 = v59 + 4;
            if (*v56) {
              goto LABEL_108;
            }
            if (!*v58)
            {
              *(_WORD *)(v59 + 1) = -16380;
              v59[3] = 35;
              goto LABEL_123;
            }
            *(_WORD *)(v59 + 1) = -15867;
            v59[3] = 35;
LABEL_111:
            int v42 = *v55;
            if (v42)
            {
              LOBYTE(v43) = -127;
            }
            else if ((v42 & 2) != 0)
            {
              LOBYTE(v43) = 0x80;
            }
            else
            {
              int v43 = (v42 << 29 >> 31) & 5;
            }
            v59[4] = v43;
            uint64_t v38 = v59 + 5;
            goto LABEL_123;
          }
          if (*v61 || v20 != 5 || *v60)
          {
            if (!debug) {
              goto LABEL_87;
            }
            int v36 = "lcp_reqci: rcvd AUTHTYPE CHAP, rejecting...";
            goto LABEL_101;
          }
          if (*v58)
          {
            int v34 = v19[4];
            if (v34 == 5)
            {
              if ((*v55 & 4) != 0)
              {
                char v35 = 4;
                goto LABEL_80;
              }
            }
            else if (v34 == 128)
            {
              if ((*v55 & 2) != 0)
              {
                char v35 = 2;
LABEL_80:
                char *v54 = v35;
                BOOL v28 = v62;
LABEL_81:
                *BOOL v28 = 1;
                goto LABEL_82;
              }
            }
            else if (v34 == 129 && (*v55 & 1) != 0)
            {
              char v35 = 1;
              goto LABEL_80;
            }
            *(_DWORD *)uint64_t v59 = 599917827;
            goto LABEL_111;
          }
          *(_WORD *)uint64_t v59 = 1027;
          uint64_t v38 = v59 + 4;
          if (*v56) {
            __int16 v44 = 10178;
          }
          else {
            __int16 v44 = 9152;
          }
          *((_WORD *)v59 + 1) = v44;
LABEL_123:
          uint64_t v59 = v38;
          if (v51) {
            goto LABEL_87;
          }
LABEL_124:
          BOOL v31 = v16 == 4;
          uint64_t v16 = 4;
          if (!v31) {
            uint64_t v16 = 3;
          }
          break;
        case 4:
          if (v20 != 8 || !*v80) {
            goto LABEL_87;
          }
          if (bswap32(*((unsigned __int16 *)v19 + 1)) >> 16 == 49189) {
            goto LABEL_82;
          }
          *(_DWORD *)uint64_t v59 = 633341956;
          v59[4] = v50[3];
          v59[5] = *((_WORD *)v50 + 1);
          v59[6] = BYTE1(*(_DWORD *)v50);
          v59[7] = *(_DWORD *)v50;
          uint64_t v38 = v59 + 8;
          goto LABEL_123;
        case 5:
          if (*v86)
          {
            if (v20 != 6) {
              goto LABEL_87;
            }
            int v29 = *v77;
          }
          else
          {
            if (v20 != 6) {
              goto LABEL_87;
            }
            int v29 = *v77;
            if (!*v77) {
              goto LABEL_87;
            }
          }
          unsigned int v33 = bswap32(*(_DWORD *)(v19 + 2));
          if (v29 && v33 == *v57)
          {
            int v39 = magic();
            *(_WORD *)uint64_t v59 = 1541;
            v59[2] = HIBYTE(v39);
            v59[3] = BYTE2(v39);
            v59[4] = BYTE1(v39);
            v59[5] = v39;
            v59 += 6;
            goto LABEL_124;
          }
          unsigned char *v66 = 1;
          *unsigned __int8 v12 = v33;
LABEL_82:
          if (v16 == 2) {
            continue;
          }
          goto LABEL_3;
        case 7:
          if (v20 != 2 || !*v81) {
            goto LABEL_87;
          }
          BOOL v28 = v68;
          goto LABEL_81;
        case 8:
          if (v20 != 2 || !*v82) {
            goto LABEL_87;
          }
          BOOL v28 = v69;
          goto LABEL_81;
        case 17:
          if (v20 != 4 || !*v83 || !v18) {
            goto LABEL_87;
          }
          unsigned int v30 = __rev16(*((unsigned __int16 *)v19 + 1));
          *uint64_t v71 = 1;
          unsigned int *v70 = v30;
          goto LABEL_82;
        case 18:
          if (v20 != 2 || !*v84 || !v18) {
            goto LABEL_87;
          }
          BOOL v28 = v72;
          goto LABEL_81;
        case 19:
          BOOL v31 = (v20 - 24) < 0xFFFFFFEB || *v87 == 0;
          if (v31) {
            goto LABEL_87;
          }
          unsigned __int8 v32 = v19[2];
          *uint64_t v76 = 1;
          *uint64_t v75 = v32;
          *uint64_t v74 = v20 - 3;
          memcpy(v73, v19 + 3, (v20 - 3));
          goto LABEL_82;
        default:
          if (debug) {
            dbglog((uint64_t)"lcp_reqci: rcvd unknown option %d", (uint64_t)__dst, (uint64_t)a3, a4, a5, a6, a7, a8, *v19);
          }
          goto LABEL_87;
      }
    }
    else
    {
      if (debug) {
        dbglog((uint64_t)"lcp_reqci: bad CI length!", (uint64_t)__dst, (uint64_t)a3, a4, a5, a6, a7, a8, v49);
      }
      LODWORD(v20) = v11;
      int v11 = 0;
LABEL_87:
      if (v19 != v8) {
        memcpy(v8, v19, (int)v20);
      }
      v8 += (int)v20;
      uint64_t v16 = 4;
    }
  }
  if (v16 == 4)
  {
    int v45 = v8 - __dst;
    goto LABEL_131;
  }
  if (v16 != 3)
  {
    int v45 = v17 - __dst;
LABEL_131:
    *a3 = v45;
    goto LABEL_133;
  }
  signed int v46 = v59 - &unk_10004A3A1;
  *a3 = v46;
  memcpy(__dst, &unk_10004A3A1, v46);
LABEL_133:
  if (debug)
  {
    unsigned __int8 v47 = "REJ";
    if (v16 == 3) {
      unsigned __int8 v47 = "NAK";
    }
    if (v16 == 2) {
      unsigned __int8 v47 = "ACK";
    }
    dbglog((uint64_t)"lcp_reqci: returning CONF%s.", (uint64_t)__dst, (uint64_t)a3, a4, a5, a6, a7, a8, (int)v47);
  }
  return v16;
}

void sub_1000118DC(int *a1)
{
  uint64_t v2 = *a1;
  if (!lcp_gotoptions[68 * (int)v2 + 8]) {
    *(_DWORD *)&lcp_gotoptions[68 * (int)v2 + 32] = 0;
  }
  if (!lcp_hisoptions[68 * (int)v2 + 8]) {
    *(_DWORD *)&lcp_hisoptions[68 * (int)v2 + 32] = 0;
  }
  uint64_t v3 = &lcp_hisoptions[68 * (int)v2];
  int v5 = v3[3];
  int v4 = v3 + 3;
  if (v5) {
    uint64_t v6 = *(unsigned int *)&lcp_hisoptions[68 * (int)v2 + 16];
  }
  else {
    uint64_t v6 = 1500;
  }
  if (lcp_gotoptions[68 * (int)v2 + 3])
  {
    unsigned int v7 = *((_DWORD *)&lcp_wantoptions + 17 * v2 + 4);
    unsigned int v8 = *(_DWORD *)&lcp_gotoptions[68 * v2 + 16];
    if ((int)v7 <= (int)v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v7;
    }
  }
  else
  {
    uint64_t v9 = 1500;
  }
  if ((int)v6 >= (int)v9) {
    int v10 = v9;
  }
  else {
    int v10 = v6;
  }
  if (v10 >= *((_DWORD *)&lcp_allowoptions + 17 * v2 + 4)) {
    int v11 = *((_DWORD *)&lcp_allowoptions + 17 * v2 + 4);
  }
  else {
    int v11 = v10;
  }
  netif_set_mtu(v2, v11);
  if (lcp_hisoptions[68 * v2 + 4]) {
    uint64_t v12 = *(unsigned int *)&lcp_hisoptions[68 * (int)v2 + 28];
  }
  else {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  ppp_send_config(*a1, v6, v12, lcp_hisoptions[68 * (int)v2 + 9], lcp_hisoptions[68 * (int)v2 + 10]);
  if (lax_recv)
  {
    uint64_t v13 = 0;
  }
  else if (lcp_gotoptions[68 * (int)v2 + 4])
  {
    uint64_t v13 = *(unsigned int *)&lcp_gotoptions[68 * (int)v2 + 28];
  }
  else
  {
    uint64_t v13 = 0xFFFFFFFFLL;
  }
  ppp_recv_config(*a1, v9, v13, lcp_gotoptions[68 * (int)v2 + 9], lcp_gotoptions[68 * (int)v2 + 10]);
  if (*v4) {
    peer_mru[*a1] = *(_DWORD *)&lcp_hisoptions[68 * (int)v2 + 16];
  }
  notify((uint64_t **)lcp_up_notify, 0);
  sub_10000F064(*a1);
  uint64_t v21 = *a1;

  link_established(v21, v14, v15, v16, v17, v18, v19, v20);
}

uint64_t sub_100011ACC(unsigned int *a1)
{
  uint64_t v2 = *a1;
  int v3 = v2;
  if (byte_10004A3A0 == 1)
  {
    untimeout((uint64_t)sub_10000F1B4, (uint64_t)&lcp_fsm + 80 * (int)v2);
    byte_10004A3A0 = 0;
    uint64_t v2 = *a1;
  }
  link_down(v2);
  notify((uint64_t **)lcp_down_notify, 0);
  uint64_t v4 = 0xFFFFFFFFLL;
  ppp_send_config(*a1, 1500, 0xFFFFFFFFLL, 0, 0);
  if (lcp_gotoptions[68 * v3 + 4]) {
    uint64_t v4 = *(unsigned int *)&lcp_gotoptions[68 * v3 + 28];
  }
  uint64_t result = ppp_recv_config(*a1, 1500, v4, lcp_gotoptions[68 * v3 + 9], lcp_gotoptions[68 * v3 + 10]);
  peer_mru[*a1] = 1500;
  return result;
}

uint64_t sub_100011BC0(unsigned int *a1)
{
  return link_required(*a1);
}

uint64_t sub_100011BC8(unsigned int *a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0;
  switch((int)a2)
  {
    case 8:
      if ((int)a5 <= 1)
      {
        if (!debug) {
          return 1;
        }
        uint64_t v9 = "lcp_rprotrej: Rcvd short Protocol-Reject packet!";
LABEL_24:
        dbglog((uint64_t)v9, a2, a3, (uint64_t)a4, a5, a6, a7, a8, v15);
        return 1;
      }
      if (a1[2] != 9)
      {
        if (!debug) {
          return 1;
        }
        int v15 = a1[2];
        uint64_t v9 = "Protocol-Reject discarded: LCP in state %d";
        goto LABEL_24;
      }
      int v10 = __rev16(*a4);
      int v11 = protocols;
      if (!protocols)
      {
LABEL_18:
        warning((uint64_t)"Protocol-Reject for unsupported protocol 0x%x", a2, a3, (uint64_t)a4, a5, a6, a7, a8, v10);
        return 1;
      }
      uint64_t v12 = (__int16 **)&off_100043898;
      while ((unsigned __int16)*v11 != v10 || !*((unsigned char *)v11 + 80))
      {
        uint64_t v13 = *v12++;
        int v11 = v13;
        if (!v13) {
          goto LABEL_18;
        }
      }
      (*((void (**)(void))v11 + 3))(*a1);
      return 1;
    case 9:
      if (a1[2] == 9)
      {
        *(unsigned char *)a4 = lcp_gotoptions[68 * *a1 + 35];
        *((unsigned char *)a4 + 1) = *(_WORD *)&lcp_gotoptions[68 * *a1 + 34];
        *((unsigned char *)a4 + 2) = BYTE1(*(_DWORD *)&lcp_gotoptions[68 * *a1 + 32]);
        *((unsigned char *)a4 + 3) = *(_DWORD *)&lcp_gotoptions[68 * *a1 + 32];
        fsm_sdata(a1, 10, a3, (char *)a4, a5, a6, a7, a8, v15);
      }
      return 1;
    case 10:
      if ((int)a5 <= 3)
      {
        dbglog((uint64_t)"lcp: received short Echo-Reply, length %d", a2, a3, (uint64_t)a4, a5, a6, a7, a8, a5);
        return 1;
      }
      if (lcp_gotoptions[68 * *a1 + 8] && bswap32(*(_DWORD *)a4) == *(_DWORD *)&lcp_gotoptions[68 * *a1 + 32]) {
        goto LABEL_28;
      }
      dword_10004A39C = 0;
      ppp_variable_echo_stop((uint64_t)a1, a2, a3, (uint64_t)a4, a5, a6, a7, a8);
      ppp_auxiliary_probe_stop();
      return 1;
    case 11:
      return 1;
    case 13:
      if (a1[2] != 9) {
        return 1;
      }
      if ((int)a5 > 7)
      {
        if (lcp_gotoptions[68 * *a1 + 8] && bswap32(*(_DWORD *)a4) == *(_DWORD *)&lcp_gotoptions[68 * *a1 + 32])
        {
LABEL_28:
          warning((uint64_t)"appear to have received our own echo-reply!", a2, a3, (uint64_t)a4, a5, a6, a7, a8, v15);
        }
        else
        {
          v16[0] = bswap32(*((_DWORD *)a4 + 1));
          v16[1] = a4 + 4;
          v16[2] = (a5 - 8);
          notify_with_ptr((uint64_t **)lcp_timeremaining_notify, (uint64_t)v16);
        }
      }
      else
      {
        dbglog((uint64_t)"lcp: received short Time-remaining, length %d", a2, a3, (uint64_t)a4, a5, a6, a7, a8, a5);
      }
      return 1;
    default:
      return v8;
  }
}

void sub_100011E48(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[2] == 9)
  {
    info((uint64_t)"No response to %d echo-requests", a2, a3, a4, a5, a6, a7, a8, dword_10004A39C);
    notice((uint64_t)"Serial link appears to be disconnected.", v9, v10, v11, v12, v13, v14, v15, v22);
    lcp_close(*a1, "Peer not responding", v16, v17, v18, v19, v20, v21);
    *(_DWORD *)status = 15;
  }
}

uint64_t magic_init()
{
  v1.tv_sec = 0;
  *(void *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  get_host_seed();

  return getpid();
}

uint64_t magic()
{
  return arc4random() & 0x7FFFFFFF;
}

uint64_t mrand48(void)
{
  return arc4random() & 0x7FFFFFFF;
}

unsigned char *random_bytes(unsigned char *result, int a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = result;
    uint64_t v3 = a2;
    do
    {
      uint64_t result = (unsigned char *)arc4random();
      unsigned int v4 = (result >> 24) & 0x7F;
      if (!v4) {
        LOBYTE(v4) = 1;
      }
      *v2++ = v4;
      --v3;
    }
    while (v3);
  }
  return result;
}

double drand48(void)
{
  return (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0;
}

int main(int argc, const char **argv, const char **envp)
{
  int v216 = 0;
  openlog("pppd", 9, 120);
  setlogmask(127);
  qword_10004A988 = (uint64_t)pthread_self();
  link_stats_valid = 0;
  new_phase(1);
  script_env = 0;
  if (gethostname(hostname, 0x100uLL) < 0)
  {
    option_error("Couldn't get hostname: %m", v5, v6, v7, v8, v9, v10, v11, v212);
    exit(1);
  }
  byte_100047C07 = 0;
  mode_t v12 = umask(0x1FFu);
  umask(v12 | 0x12);
  uid_t v13 = getuid();
  uint64_t v14 = 0;
  uid = v13;
  privileged = v13 == 0;
  if (v13)
  {
    privileged = sys_check_controller();
    uint64_t v14 = uid;
  }
  uint64_t v213 = v14;
  slprintf((int)v215, 16, "%d");
  script_setenv("ORIG_UID", v215);
  ngroups = getgroups(16, groups);
  magic_init();
  uint64_t v15 = protocols;
  if (protocols)
  {
    uint64_t v16 = (__int16 **)&off_100043898;
    do
    {
      (*((void (**)(void))v15 + 1))(0);
      uint64_t v17 = *v16++;
      uint64_t v15 = v17;
    }
    while (v17);
  }
  tty_init();
  progname = (uint64_t)*argv;
  sys_install_options();
  if (!options_from_file("/etc/ppp/options", privileged == 0, 0, 1)
    || !options_from_user()
    || !parse_args(argc - 1, argv + 1)
    || controlled && !options_from_controller())
  {
    goto LABEL_14;
  }
  uint64_t v18 = options_from_file("/etc/ppp/postoptions", 0, 0, 1);
  if (!v18) {
    goto LABEL_14;
  }
  devnam_fixed = 1;
  uint64_t v19 = *(void (**)(uint64_t))(the_channel + 8);
  if (v19) {
    v19(v18);
  }
  if (debug) {
    setlogmask(255);
  }
  if (geteuid())
  {
    option_error("must be root to run %s, since it is not setuid-root", v20, v21, v22, v23, v24, v25, v26, (int)*argv);
    exit(3);
  }
  if (!ppp_available())
  {
    option_error("%s", v27, v28, v29, v30, v31, v32, v33, (int)no_ppp_msg[0]);
    exit(4);
  }
  uint64_t v34 = check_options();
  uint64_t v42 = sys_check_options(v34, v35, v36, v37, v38, v39, v40, v41);
  if (!v42) {
LABEL_14:
  }
    exit(2);
  uint64_t v50 = auth_check_options(v42, v43, v44, v45, v46, v47, v48, v49);
  int v51 = protocols;
  if (protocols)
  {
    uint64_t v52 = (__int16 **)&off_100043898;
    do
    {
      char v53 = (uint64_t (*)(uint64_t))*((void *)v51 + 14);
      if (v53) {
        uint64_t v50 = v53(v50);
      }
      int v54 = *v52++;
      int v51 = v54;
    }
    while (v54);
  }
  char v55 = *(void (**)(uint64_t))(the_channel + 16);
  if (v55) {
    v55(v50);
  }
  if (dump_options | dryrun)
  {
    init_pr_log(0, 6);
    print_options((void (*)(const char *, const char *, ...))pr_log, 0);
    end_pr_log();
    if (dryrun) {
      die(0);
    }
  }
  v56.n128_f64[0] = sys_init();
  uint64_t v57 = system_inited_notify;
  if (system_inited_notify)
  {
    do
    {
      uint64_t v58 = *(void *)v57;
      (*(void (**)(void, void, __n128))(v57 + 8))(*(void *)(v57 + 16), 0, v56);
      uint64_t v57 = v58;
    }
    while (v58);
  }
  unsigned int v59 = open("/dev/null", 2, v56.n128_f64[0], v213);
  dword_10004A990 = v59;
  if ((v59 & 0x80000000) != 0) {
    fatal();
  }
  if (v59 <= 2)
  {
    do
    {
      unsigned int v59 = dup(v59);
      if ((v59 & 0x80000000) != 0) {
        fatal();
      }
      dword_10004A990 = v59;
    }
    while (v59 < 3);
  }
  if (!(nodetach | updetach)) {
    detach();
  }
  char v60 = getpwuid(uid);
  if (!v60 || (pw_name = v60->pw_name) == 0) {
    pw_name = "(unknown)";
  }
  sys_log(5, "pppd %s (Apple version %s) started by %s, uid %d", "2.4.2", "884", pw_name, uid);
  script_setenv("PPPLOGNAME", pw_name);
  if ((_BYTE)devnam) {
    script_setenv("DEVICE", (const char *)&devnam);
  }
  pid_t v214 = getpid();
  slprintf((int)v215, 16, "%d");
  script_setenv("PPPD_PID", v215);
  if (controlfd != -1) {
    add_fd(controlfd);
  }
  uint64_t v62 = sub_100013570();
  byte_10004A994 = 0;
  if (demand)
  {
    dword_10004A998 = open_ppp_loopback();
    set_ifunit(1, v63, v64, v65, v66, v67, v68, v69);
    demand_conf();
    pid_t v70 = getpid();
    sub_100013A50(v70);
  }
  uint64_t v71 = &unk_100047000;
  if (!holdfirst)
  {
    do_callback = 0;
    goto LABEL_56;
  }
  need_holdoff = 1;
  while (1)
  {
    if (v71[794]) {
      uint64_t v62 = holdoff;
    }
    else {
      uint64_t v62 = 0;
    }
    int v216 = v62;
    if (holdoff_hook)
    {
      uint64_t v62 = holdoff_hook();
      int v216 = v62;
    }
    if ((int)v62 >= 1)
    {
      new_phase(11);
      timeout((int)sub_1000140F0);
      got_sigterm = 0;
      got_sighup = 0;
      do
      {
        sub_100013B58();
        if (kill_link) {
          uint64_t v62 = new_phase(3);
        }
      }
      while (phase == 11);
      if (!persist)
      {
LABEL_284:
        int v202 = dword_10004ADB8;
        if (dword_10004ADB8 >= 1)
        {
          do
          {
            if (debug)
            {
              dbglog((uint64_t)"Waiting for %d child processes...", v75, v76, v77, v78, v79, v80, v81, v202);
              for (uint64_t i = qword_10004ADC0; i; uint64_t i = *(void *)(i + 32))
                dbglog((uint64_t)"  script %s, pid %d", v203, v204, v205, v206, v207, v208, v209, *(void *)(i + 8));
            }
            if ((sub_1000140F8(1) & 0x80000000) != 0) {
              break;
            }
            int v202 = dword_10004ADB8;
          }
          while (dword_10004ADB8 > 0);
        }
        die(*(int *)status);
      }
    }
LABEL_56:
    listen_time = 0;
    v71[794] = 1;
    dword_10004A99C = -1;
    *(_DWORD *)status = 0;
    devstatus = 0;
    ++unsuccess;
    int v72 = do_callback;
    doing_callback = do_callback;
    do_callback = 0;
    if (demand) {
      BOOL v73 = v72 == 0;
    }
    else {
      BOOL v73 = 0;
    }
    if (v73)
    {
      new_phase(3);
      demand_unblock();
      add_fd(dword_10004A998);
      do
      {
        sub_100013B58();
        if (kill_link) {
          BOOL v74 = persist == 0;
        }
        else {
          BOOL v74 = 0;
        }
      }
      while (!v74 && !get_loop_output());
      remove_fd(dword_10004A998);
      if (kill_link) {
        BOOL v82 = persist == 0;
      }
      else {
        BOOL v82 = 0;
      }
      if (v82) {
        goto LABEL_284;
      }
      demand_block();
      info((uint64_t)"Starting link", v83, v84, v85, v86, v87, v88, v89, v214);
    }
    unsigned int v90 = (uint64_t (*)(uint64_t))start_link_hook;
    if (!start_link_hook) {
      break;
    }
    if (*(void *)(the_channel + 96))
    {
      int v91 = retry_pre_start_link_check;
      if (retry_pre_start_link_check < 0)
      {
        int v91 = 0;
        retry_pre_start_link_check = 0;
      }
      int v92 = v91 + 2;
      while (1)
      {
        uint64_t v62 = (*(uint64_t (**)(uint64_t))(the_channel + 96))(v62);
        if (!v62) {
          break;
        }
        if (--v92 < 2)
        {
          int v100 = 25;
          goto LABEL_136;
        }
      }
      unsigned int v90 = (uint64_t (*)(uint64_t))start_link_hook;
    }
    uint64_t v62 = v90(v62);
    int v216 = v62;
    if (v62) {
      break;
    }
    int v100 = 5;
LABEL_136:
    *(_DWORD *)status = v100;
LABEL_259:
    sys_statusnotify(v62, v93, v94, v95, v96, v97, v98, v99, v214);
    if (!demand)
    {
      if (byte_10004A9B8 && unlink(&byte_10004A9B8) < 0 && *__error() != 2) {
        warning((uint64_t)"unable to delete pid file %s: %m", v75, v76, v77, v78, v79, v80, v81, (int)&byte_10004A9B8);
      }
      byte_10004A9B8 = 0;
    }
    if (!persist) {
      goto LABEL_284;
    }
    if (maxfail >= 1 && unsuccess >= maxfail) {
      goto LABEL_284;
    }
    if (demand) {
      demand_discard();
    }
  }
  sys_publish_remoteaddress((const char *)remoteaddress);
  uint64_t v62 = new_phase(2);
  uint64_t v101 = connect_started_notify;
  if (connect_started_notify)
  {
    do
    {
      uint64_t v102 = *(void *)v101;
      uint64_t v62 = (*(uint64_t (**)(void, void))(v101 + 8))(*(void *)(v101 + 16), 0);
      uint64_t v101 = v102;
    }
    while (v102);
  }
  LOBYTE(v103) = 0;
  int v104 = 0;
  link_up_done = 0;
  redialingcount = 0;
  redialingalternate = 0;
  while (1)
  {
    if (v104 || (_BYTE)v103)
    {
      char v105 = *(void (**)(uint64_t))(the_channel + 72);
      if (v105)
      {
        v105(v62);
        LOBYTE(v103) = redialingalternate;
      }
      if (redialalternate)
      {
        BOOL v73 = v103 == 0;
        char v106 = (const char **)&remoteaddress;
        if (!v73) {
          char v106 = (const char **)&altremoteaddress;
        }
        sys_publish_remoteaddress(*v106);
        LOBYTE(v103) = redialingalternate;
      }
    }
    else
    {
      LOBYTE(v103) = 0;
    }
    unsigned int v107 = redialtimer;
    if (redialtimer) {
      BOOL v108 = redialingcount == 0;
    }
    else {
      BOOL v108 = 1;
    }
    if (!v108 && v103 == 0)
    {
      if (hasbusystate)
      {
        new_phase(13);
        unsigned int v107 = redialtimer;
      }
      sleep(v107);
      if (hasbusystate) {
        new_phase(2);
      }
    }
    if (kill_link) {
      break;
    }
    uint64_t v62 = (*(uint64_t (**)(int *))(the_channel + 24))(&v216);
    dword_10004A99C = v62;
    int v103 = redialingalternate;
    if (redialalternate)
    {
      int v103 = redialingalternate == 0;
      redialingalternate = redialingalternate == 0;
    }
    if (!v103) {
      ++redialingcount;
    }
    if (busycode != -1 && v216 == busycode)
    {
      int v104 = redialingcount;
      if (redialingcount <= redialcount && kill_link == 0) {
        continue;
      }
    }
    goto LABEL_122;
  }
  uint64_t v62 = dword_10004A99C;
LABEL_122:
  if ((v62 & 0x80000000) != 0)
  {
    uint64_t v71 = (_DWORD *)&unk_100047000;
    if (v62 != -2)
    {
      uint64_t v123 = connect_fail_notify;
      if (connect_fail_notify)
      {
        uint64_t v124 = v216;
        do
        {
          uint64_t v125 = *(void *)v123;
          uint64_t v62 = (*(uint64_t (**)(void, uint64_t))(v123 + 8))(*(void *)(v123 + 16), v124);
          uint64_t v123 = v125;
        }
        while (v125);
      }
      goto LABEL_255;
    }
    if (dword_10004A9A0) {
      sub_100013ED0(1);
    }
LABEL_249:
    uint64_t v62 = new_phase(10);
    uint64_t v193 = disconnect_started_notify;
    uint64_t v194 = *(int *)status;
    if (disconnect_started_notify)
    {
      do
      {
        uint64_t v195 = *(void *)v193;
        uint64_t v62 = (*(uint64_t (**)(void, uint64_t))(v193 + 8))(*(void *)(v193 + 16), v194);
        uint64_t v193 = v195;
      }
      while (v195);
    }
    v196 = *(uint64_t (**)(uint64_t))(the_channel + 32);
    if (v196) {
      uint64_t v62 = v196(v62);
    }
    uint64_t v197 = disconnect_done_notify;
    uint64_t v198 = *(int *)status;
    if (disconnect_done_notify)
    {
      do
      {
        uint64_t v199 = *(void *)v197;
        uint64_t v62 = (*(uint64_t (**)(void, uint64_t))(v197 + 8))(*(void *)(v197 + 16), v198);
        uint64_t v197 = v199;
      }
      while (v199);
    }
LABEL_255:
    if (phase != 10) {
      uint64_t v62 = new_phase(10);
    }
    v200 = *(uint64_t (**)(uint64_t))(the_channel + 72);
    if (v200) {
      uint64_t v62 = v200(v62);
    }
    goto LABEL_259;
  }
  uint64_t v71 = &unk_100047000;
  if (!link_up_done)
  {
    if (link_up_hook)
    {
      int v216 = link_up_hook();
      if (!v216)
      {
        int v122 = 5;
LABEL_248:
        *(_DWORD *)status = v122;
        goto LABEL_249;
      }
    }
    link_up_done = 1;
  }
  uint64_t v112 = connect_success_notify;
  if (connect_success_notify)
  {
    do
    {
      uint64_t v113 = *(void *)v112;
      (*(void (**)(void, void))(v112 + 8))(*(void *)(v112 + 16), 0);
      uint64_t v112 = v113;
    }
    while (v113);
  }
  sys_publish_remoteaddress((const char *)remoteaddress);
  dword_1000438E0 = (*(uint64_t (**)(void))(the_channel + 40))(dword_10004A99C);
  if ((dword_1000438E0 & 0x80000000) == 0)
  {
    if (demand)
    {
      int v121 = ifunit;
    }
    else
    {
      pid_t v126 = getpid();
      sub_100013A50(v126);
      int v121 = ifunit;
      if (!demand && (ifunit & 0x80000000) == 0)
      {
        set_ifunit(1, v114, v115, v116, v117, v118, v119, v120);
        int v121 = ifunit;
      }
    }
    if (v121 < 0) {
      notice((uint64_t)"Starting negotiation on %s", v114, v115, v116, v117, v118, v119, v120, (int)&ppp_devnam);
    }
    else {
      notice((uint64_t)"Connect: %s <--> %s", v114, v115, v116, v117, v118, v119, v120, (int)&ifname);
    }
    gettimeofday(&stru_10004A9A8, 0);
    script_unsetenv("CONNECT_TIME");
    script_unsetenv("BYTES_SENT");
    script_unsetenv("BYTES_RCVD");
    lcp_lowerup(0);
    add_fd(dword_1000438E0);
    lcp_open(0, v127, v128, v129, v130, v131, v132, v133);
    *(_DWORD *)status = 10;
    new_phase(4);
    while (phase)
    {
      sub_100013B58();
      uint64_t packet = read_packet(&inpacket_buf);
      if ((packet & 0x80000000) != 0) {
        goto LABEL_192;
      }
      uint64_t v149 = packet;
      if (packet)
      {
        if (packet <= 3)
        {
          if (debug < 2) {
            goto LABEL_192;
          }
          pid_t v214 = packet;
          unsigned __int8 v150 = "received short packet:%.*B";
          goto LABEL_154;
        }
        dump_packet((int)"rcvd", (uint64_t)&inpacket_buf, packet, v144, v145, v146, v147, v148);
        if (snoop_recv_hook) {
          snoop_recv_hook(&inpacket_buf, v149);
        }
        uint64_t v151 = __rev16((unsigned __int16)word_1000486FE);
        if (v151 != 49185 && dword_1000478C8 != 9)
        {
          if (debug < 2) {
            goto LABEL_192;
          }
          unsigned __int8 v150 = "Discarded non-LCP packet when LCP not open";
LABEL_154:
          dbglog((uint64_t)v150, v142, v143, v144, v145, v146, v147, v148, v214);
          goto LABEL_192;
        }
        if (v151 == 49703
          || (v151 & 0xFFFFFDFF) == 0xC023
          || (v151 & 0xFFFFFFFB) == 0xC021
          || phase > 5
          || !unexpected_network_packet(0, v151, v143, v144, v145, v146, v147, v148))
        {
          unsigned __int8 v152 = protocols;
          if (protocols)
          {
            __int16 v153 = (__int16 **)&off_100043898;
            do
            {
              int v154 = (unsigned __int16)*v152;
              if (v151 == v154 && *((unsigned char *)v152 + 80))
              {
                (*((void (**)(void, void *, void))v152 + 2))(0, &unk_100048700, (v149 - 4));
                goto LABEL_192;
              }
              if (v151 == (v154 & 0x7FFF) && *((unsigned char *)v152 + 80))
              {
                __int16 v155 = (void (*)(void, void *, void))*((void *)v152 + 9);
                if (v155)
                {
                  v155(0, &unk_100048700, (v149 - 4));
                  goto LABEL_192;
                }
                unsigned __int8 v156 = (unsigned int (*)(void))*((void *)v152 + 19);
                if (v156 && v156(0) == 9) {
                  goto LABEL_192;
                }
              }
              long long v157 = *v153++;
              unsigned __int8 v152 = v157;
            }
            while (v157);
          }
          if (debug)
          {
            int v158 = (unsigned __int16)protocol_list;
            if (!protocol_list) {
              goto LABEL_190;
            }
            v159 = &word_1000438F8;
            while (v151 != v158)
            {
              int v160 = (unsigned __int16)*v159;
              v159 += 8;
              int v158 = v160;
              if (!v160) {
                goto LABEL_190;
              }
            }
            uint64_t v161 = *((void *)v159 - 1);
            if (v161) {
              warning((uint64_t)"Unsupported protocol '%s' (0x%x) received", v142, v143, v144, v145, v146, v147, v148, v161);
            }
            else {
LABEL_190:
            }
              warning((uint64_t)"Unsupported protocol 0x%x received", v142, v143, v144, v145, v146, v147, v148, v151);
          }
          lcp_sprotrej(0, (uint64_t)&inpacket_buf, v149, v144, v145, v146, v147, v148, v214);
        }
        else if (debug >= 2)
        {
          dbglog((uint64_t)"discarding proto 0x%x in phase %d", v142, v143, v144, v145, v146, v147, v148, v151);
        }
      }
      else
      {
        notice((uint64_t)"Modem hangup", v142, v143, v144, v145, v146, v147, v148, v214);
        hungup = 1;
        if (*(_DWORD *)status != 5) {
          *(_DWORD *)status = 16;
        }
        lcp_lowerdown(0);
        link_terminated();
      }
LABEL_192:
      if (stop_link) {
        BOOL v162 = phase == 8;
      }
      else {
        BOOL v162 = 0;
      }
      if (v162)
      {
        new_phase(12);
        ppp_hold();
        auth_hold();
        v163 = protocols;
        if (protocols)
        {
          v164 = (__int16 **)&off_100043898;
          do
          {
            v165 = (void (*)(void))*((void *)v163 + 17);
            if (v165) {
              v165(0);
            }
            v166 = *v164++;
            v163 = v166;
          }
          while (v166);
        }
        uint64_t v167 = stop_notify;
        if (stop_notify)
        {
          do
          {
            uint64_t v168 = *(void *)v167;
            (*(void (**)(void, void))(v167 + 8))(*(void *)(v167 + 16), 0);
            uint64_t v167 = v168;
          }
          while (v168);
        }
      }
      if (cont_link) {
        BOOL v169 = phase == 12;
      }
      else {
        BOOL v169 = 0;
      }
      if (v169)
      {
        new_phase(8);
        ppp_cont();
        auth_cont();
        v170 = protocols;
        if (protocols)
        {
          v171 = (__int16 **)&off_100043898;
          do
          {
            v172 = (void (*)(void))*((void *)v170 + 18);
            if (v172) {
              v172(0);
            }
            v173 = *v171++;
            v170 = v173;
          }
          while (v173);
        }
        uint64_t v174 = cont_notify;
        if (cont_notify)
        {
          do
          {
            uint64_t v175 = *(void *)v174;
            (*(void (**)(void, void))(v174 + 8))(*(void *)(v174 + 16), 0);
            uint64_t v174 = v175;
          }
          while (v175);
        }
      }
      if (kill_link)
      {
        if (do_modem_hungup) {
          BOOL v176 = 0;
        }
        else {
          BOOL v176 = stop_link == 0;
        }
        if (!v176 || phase == 12)
        {
          if (do_modem_hungup)
          {
            notice((uint64_t)"Modem hangup", v142, v143, v144, v145, v146, v147, v148, v214);
            do_modem_hungup = 0;
          }
          hungup = 1;
          lcp_lowerdown(0);
          link_terminated();
        }
        lcp_close(0, "User request", v143, v144, v145, v146, v147, v148);
      }
      if (open_ccp_flag && (phase - 7) <= 1)
      {
        dword_100047604 = 2;
        off_100041DD8(0, v142, v143, v144, v145, v146, v147, v148);
      }
      sys_runloop();
    }
    if (link_stats_valid)
    {
      info((uint64_t)"Connect time %d.%d minutes.", v134, v135, v136, v137, v138, v139, v140, (link_connect_time + 5) / 0x3Cu);
      info((uint64_t)"Sent %u bytes, received %u bytes.", v178, v179, v180, v181, v182, v183, v184, dword_1000480D8);
    }
    uint64_t v71 = (_DWORD *)&unk_100047000;
    v185 = &off_100043000;
    if (!demand)
    {
      if (byte_10004A9B8 && unlink(&byte_10004A9B8) < 0 && *__error() != 2) {
        warning((uint64_t)"unable to delete pid file %s: %m", v186, v187, v188, v189, v190, v191, v192, (int)&byte_10004A9B8);
      }
      byte_10004A9B8 = 0;
      v185 = &off_100043000;
    }
    remove_fd(*((_DWORD *)v185 + 568));
    clean_check();
    (*(void (**)(void))(the_channel + 48))(dword_10004A99C);
    *((_DWORD *)v185 + 568) = -1;
    if (!hungup) {
      lcp_lowerdown(0);
    }
    if (!demand) {
      script_unsetenv("IFNAME");
    }
    goto LABEL_249;
  }
  int v122 = 1;
  goto LABEL_248;
}

uint64_t reopen_log()
{
  openlog("pppd", 9, 120);

  return setlogmask(127);
}

uint64_t new_phase(uint64_t result)
{
  int v1 = result;
  phase = result;
  if (new_phase_hook) {
    uint64_t result = new_phase_hook(result);
  }
  uint64_t v2 = phasechange;
  if (phasechange)
  {
    do
    {
      uint64_t v3 = *(void *)v2;
      uint64_t result = (*(uint64_t (**)(void, void))(v2 + 8))(*(void *)(v2 + 16), v1);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  return result;
}

void script_setenv(const char *a1, const char *a2)
{
  size_t v4 = strlen(a1);
  size_t v5 = strlen(a2);
  int v6 = v5 + v4;
  uint64_t v7 = malloc_type_malloc(v5 + v4 + 3, 0x3CBA5F19uLL);
  if (!v7) {
    return;
  }
  uint64_t v8 = v7;
  slprintf((int)v7, v6 + 2, "%s=%s");
  uint64_t v9 = (void *)script_env;
  if (script_env)
  {
    uint64_t v10 = *(char **)script_env;
    if (*(void *)script_env)
    {
      uint64_t v11 = 0;
      while (strncmp(v10, a1, v4) || v10[v4] != 61)
      {
        int v12 = v11 + 1;
        uint64_t v10 = (char *)v9[++v11];
        if (!v10) {
          goto LABEL_12;
        }
      }
      free(v10);
      *(void *)(script_env + 8 * v11) = v8;
      return;
    }
    int v12 = 0;
  }
  else
  {
    uid_t v13 = malloc_type_malloc(0x80uLL, 0x10040436913F5uLL);
    script_env = (uint64_t)v13;
    if (!v13) {
      return;
    }
    uint64_t v9 = v13;
    int v12 = 0;
    s_env_nalloc = 16;
  }
LABEL_12:
  if (v12 + 1 >= s_env_nalloc)
  {
    uint64_t v14 = malloc_type_realloc(v9, 8 * (v12 + 17), 0x10040436913F5uLL);
    if (!v14) {
      return;
    }
    uint64_t v9 = v14;
    script_env = (uint64_t)v14;
    s_env_nalloc = v12 + 17;
  }
  v9[v12] = v8;
  *(void *)(script_env + 8 * (v12 + 1)) = 0;
}

void die(int a1)
{
}

uint64_t **notify(uint64_t **result, int a2)
{
  if (result)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = *result;
      ((void (*)(uint64_t *, uint64_t))result[1])(result[2], v2);
      uint64_t result = (uint64_t **)v3;
    }
    while (v3);
  }
  return result;
}

void detach()
{
  if (!detached)
  {
    if (pipe(v12) == -1) {
      *(void *)int v12 = -1;
    }
    pid_t v0 = fork();
    if (v0 < 0)
    {
      error((uint64_t)"Couldn't detach (fork failed: %m)", v1, v2, v3, v4, v5, v6, v7, v10);
      die(1);
    }
    if (v0)
    {
      unsigned int v11 = v0;
      uint64_t v8 = pidchange;
      if (pidchange)
      {
        do
        {
          uint64_t v9 = *(void *)v8;
          (*(void (**)(void, void))(v8 + 8))(*(void *)(v8 + 16), v11);
          uint64_t v8 = v9;
        }
        while (v9);
      }
      if (byte_10004A9B8) {
        sub_100014764(v11);
      }
      if (byte_10004ADC8) {
        sub_100013A50(v11);
      }
      exit(0);
    }
    setsid();
    chdir("/");
    dup2(dword_10004A990, 0);
    dup2(dword_10004A990, 1);
    dup2(dword_10004A990, 2);
    detached = 1;
    if (log_default) {
      log_to_fd = -1;
    }
    getpid();
    slprintf((int)v13, 16, "%d");
    script_setenv("PPPD_PID", v13);
    close(v12[1]);
    complete_read(v12[0], v13, 1uLL);
    close(v12[0]);
    sys_reinit();
  }
}

uint64_t sub_100013570()
{
  *(void *)&v1.sa_mask = 1074675715;
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000145D4;
  if (sigaction(1, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_10001469C;
  if (sigaction(2, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_10001469C;
  if (sigaction(15, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015398;
  if (sigaction(20, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015400;
  if (sigaction(18, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000154C4;
  if (sigaction(19, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015554;
  if (sigaction(30, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000155D0;
  if (sigaction(31, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638;
  if (sigaction(6, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638;
  if (sigaction(14, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638;
  if (sigaction(8, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638;
  if (sigaction(4, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638;
  if (sigaction(13, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638;
  if (sigaction(3, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638;
  if (sigaction(11, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638;
  if (sigaction(10, &v1, 0) < 0) {
    goto LABEL_24;
  }
  v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638;
  if (sigaction(7, &v1, 0) < 0
    || (v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638, sigaction(27, &v1, 0) < 0)
    || (v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638, sigaction(12, &v1, 0) < 0)
    || (v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638, sigaction(5, &v1, 0) < 0)
    || (v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638, sigaction(26, &v1, 0) < 0)
    || (v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638, sigaction(24, &v1, 0) < 0)
    || (v1.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100015638,
        uint64_t result = sigaction(25, &v1, 0),
        (result & 0x80000000) != 0))
  {
LABEL_24:
    fatal();
  }
  return result;
}

void set_ifunit(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  info((uint64_t)"Using interface %s%d", a2, a3, a4, a5, a6, a7, a8, (int)"ppp");
  slprintf((int)&ifname, 32, "%s%d");
  script_setenv("IFNAME", &ifname);
  if (a1)
  {
    pid_t v9 = getpid();
    sub_100014764(v9);
    pid_t v10 = getpid();
    sub_100013A50(v10);
  }
}

void sub_100013A50(int a1)
{
  if (linkname)
  {
    script_setenv("LINKNAME", &linkname);
    slprintf((int)&byte_10004ADC8, 1024, "%sppp-%s.pid");
    uint64_t v2 = fopen(&byte_10004ADC8, "w");
    if (v2)
    {
      pid_t v10 = v2;
      fprintf(v2, "%d\n", a1);
      if (ifname) {
        fprintf(v10, "%s\n", &ifname);
      }
      fclose(v10);
    }
    else
    {
      error((uint64_t)"Failed to create pid file %s: %m", v3, v4, v5, v6, v7, v8, v9, (int)&byte_10004ADC8);
      byte_10004ADC8 = 0;
    }
  }
}

void sub_100013B58()
{
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  sigset_t v19 = 0;
  open_ccp_flag = 0;
  kill_link = 0;
  cont_link = 0;
  stop_link = 0;
  if (!sigsetjmp(dword_10004B1E0, 1))
  {
    sigprocmask(1, &v19, 0);
    if (got_sighup || got_sigterm || got_sigusr2 || (byte_10004B2A4 & 1) != 0 || got_sigtstp || got_sigcont)
    {
      sigprocmask(2, &v19, 0);
    }
    else
    {
      byte_10004A994 = 1;
      sigprocmask(2, &v19, 0);
      if (qword_10004B1D8)
      {
        getabsolutetime((uint64_t)&qword_10004B1C8);
        uint64_t v7 = *(void *)qword_10004B1D8 - qword_10004B1C8;
        uint64_t v20 = v7;
        uint64_t v8 = v7;
        int v9 = *(_DWORD *)(qword_10004B1D8 + 8) - dword_10004B1D0;
        LODWORD(v21) = v9;
        if (v9 < 0)
        {
          LODWORD(v21) = v9 + 1000000;
          uint64_t v20 = v7 - 1;
          uint64_t v8 = v7 - 1;
        }
        if (v8 < 0)
        {
          LODWORD(v21) = 0;
          uint64_t v20 = 0;
        }
        pid_t v10 = (timeval *)&v20;
      }
      else
      {
        pid_t v10 = 0;
      }
      v12.n128_f64[0] = wait_input(v10);
      if (wait_input_hook) {
        uint64_t v11 = wait_input_hook(v12.n128_f64[0]);
      }
      uid_t v13 = *(void (**)(uint64_t, __n128))(the_channel + 88);
      if (v13) {
        v13(v11, v12);
      }
    }
  }
  if (controlfd != -1)
  {
    uint64_t ready = is_ready_fd(controlfd);
    if (ready) {
      ppp_control(ready, v0, v1, v2, v3, v4, v5, v6, v18);
    }
  }
  byte_10004A994 = 0;
  for (uint64_t i = (_DWORD *)qword_10004B1D8; qword_10004B1D8; uint64_t i = (_DWORD *)qword_10004B1D8)
  {
    v16.n128_f64[0] = getabsolutetime((uint64_t)&qword_10004B1C8);
    if (v17 < 0) {
      fatal();
    }
    if (*(void *)i >= qword_10004B1C8 && (*(void *)i != qword_10004B1C8 || i[2] > dword_10004B1D0)) {
      break;
    }
    qword_10004B1D8 = *((void *)i + 4);
    (*((void (**)(void, __n128))i + 3))(*((void *)i + 2), v16);
    free(i);
  }
  if (got_sigtstp)
  {
    info((uint64_t)"Stopping on signal %d.", v0, v1, v2, v3, v4, v5, v6, got_sigtstp);
    stop_link = 1;
    got_sigtstp = 0;
  }
  if (got_sigcont)
  {
    info((uint64_t)"Resuming on signal %d.", v0, v1, v2, v3, v4, v5, v6, got_sigcont);
    cont_link = 1;
    got_sigcont = 0;
  }
  if (got_sighup)
  {
    info((uint64_t)"Hangup (SIGHUP)", v0, v1, v2, v3, v4, v5, v6, v18);
    kill_link = 1;
    got_sighup = 0;
    if (*(_DWORD *)status != 16) {
      *(_DWORD *)status = 5;
    }
  }
  if (got_sigterm)
  {
    info((uint64_t)"Terminating on signal %d.", v0, v1, v2, v3, v4, v5, v6, got_sigterm);
    kill_link = 1;
    persist = 0;
    *(_DWORD *)status = 5;
    got_sigterm = 0;
  }
  if (byte_10004B2A4 == 1)
  {
    sub_1000140F8(0);
    byte_10004B2A4 = 0;
  }
  if (got_sigusr2)
  {
    open_ccp_flag = 1;
    got_sigusr2 = 0;
  }
}

uint64_t sub_100013ED0(int a1)
{
  v3.__sigaction_u.__sa_handler = 0;
  *(void *)&v3.sa_mask = 0;
  v4.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(void *)&v4.sa_mask = 0;
  sigaction(a1, &v4, &v3);
  kill(0, a1);
  return sigaction(a1, &v3, 0);
}

void script_unsetenv(const char *a1)
{
  int v2 = strlen(a1);
  if (script_env)
  {
    sigaction v3 = *(char **)script_env;
    if (*(void *)script_env)
    {
      uint64_t v4 = 0;
      size_t v5 = v2;
      uint64_t v6 = script_env + 8;
      while (strncmp(v3, a1, v5) || v3[v5] != 61)
      {
        sigaction v3 = *(char **)(v6 + v4);
        v4 += 8;
        if (!v3) {
          return;
        }
      }
      free(v3);
      do
      {
        uint64_t v7 = *(void *)(script_env + v4 + 8);
        *(void *)(script_env + v4) = v7;
        v4 += 8;
      }
      while (v7);
    }
  }
}

void timeout(int a1)
{
  int v4 = v3;
  int v5 = v2;
  uint64_t v6 = v1;
  uint64_t v7 = *(void *)&a1;
  uint64_t v8 = malloc_type_malloc(0x28uLL, 0x10A004043506912uLL);
  if (!v8) {
    fatal();
  }
  int v9 = v8;
  v8[2] = v6;
  v8[3] = v7;
  getabsolutetime((uint64_t)&qword_10004B1C8);
  uint64_t v10 = qword_10004B1C8 + v5;
  *(void *)int v9 = v10;
  int v11 = dword_10004B1D0 + v4;
  v9[2] = dword_10004B1D0 + v4;
  if (v11 > 999999)
  {
    v10 += v11 / 0xF4240u;
    *(void *)int v9 = v10;
    v11 %= 0xF4240u;
    v9[2] = v11;
  }
  __n128 v12 = &qword_10004B1D8;
  uid_t v13 = (uint64_t *)qword_10004B1D8;
  if (qword_10004B1D8)
  {
    uint64_t v14 = *(void *)qword_10004B1D8;
    if (v10 >= *(void *)qword_10004B1D8)
    {
      uint64_t v15 = qword_10004B1D8;
      while (v10 != v14 || v11 >= *(_DWORD *)(v15 + 8))
      {
        uid_t v13 = *(uint64_t **)(v15 + 32);
        __n128 v12 = (uint64_t *)(v15 + 32);
        if (v13)
        {
          uint64_t v14 = *v13;
          uint64_t v15 = *(void *)(v15 + 32);
          if (v10 >= *v13) {
            continue;
          }
        }
        goto LABEL_13;
      }
      uid_t v13 = (uint64_t *)v15;
    }
  }
LABEL_13:
  *((void *)v9 + 4) = v13;
  *__n128 v12 = (uint64_t)v9;
}

uint64_t sub_1000140F0()
{
  return new_phase(3);
}

uint64_t sub_1000140F8(int a1)
{
  if (!dword_10004ADB8) {
    return 0;
  }
  int v26 = 0;
  BOOL v1 = a1 == 0;
  pid_t v2 = waitpid(-1, &v26, v1);
  if ((v2 - 1) <= 0xFFFFFFFD)
  {
    while (1)
    {
      uint64_t v10 = (void *)qword_10004ADC0;
      if (!qword_10004ADC0) {
        goto LABEL_9;
      }
      int v11 = &qword_10004ADC0;
      if (*(_DWORD *)qword_10004ADC0 != v2) {
        break;
      }
LABEL_8:
      char v13 = 0;
      --dword_10004ADB8;
      uint64_t *v11 = v10[4];
LABEL_10:
      if ((v26 & 0x7F) != 0 && (v26 & 0x7F) != 0x7F)
      {
        uint64_t v15 = "??";
        if ((v13 & 1) == 0) {
          uint64_t v15 = (const char *)v10[1];
        }
        warning((uint64_t)"Child process %s (pid %d) terminated with signal %d", v3, v4, v5, v6, v7, v8, v9, (int)v15);
        if (v13) {
          goto LABEL_24;
        }
      }
      else
      {
        if (debug)
        {
          uint64_t v14 = "??";
          if ((v13 & 1) == 0) {
            uint64_t v14 = (const char *)v10[1];
          }
          dbglog((uint64_t)"Script %s finished (pid %d), status = 0x%x", v3, v4, v5, v6, v7, v8, v9, (int)v14);
        }
        if (v13) {
          goto LABEL_24;
        }
      }
      __n128 v16 = (void (*)(void))v10[2];
      if (v16) {
        v16(v10[3]);
      }
      free(v10);
LABEL_24:
      pid_t v2 = waitpid(-1, &v26, v1);
      if ((v2 - 1) >= 0xFFFFFFFE) {
        goto LABEL_25;
      }
    }
    while (1)
    {
      __n128 v12 = v10;
      uint64_t v10 = (void *)v10[4];
      if (!v10) {
        break;
      }
      if (*(_DWORD *)v10 == v2)
      {
        int v11 = v12 + 4;
        goto LABEL_8;
      }
    }
LABEL_9:
    char v13 = 1;
    goto LABEL_10;
  }
LABEL_25:
  if (v2 != -1) {
    return 0;
  }
  if (*__error() != 10)
  {
    if (*__error() != 4) {
      error((uint64_t)"Error waiting for child process: %m", v18, v19, v20, v21, v22, v23, v24, v25);
    }
    return 0;
  }
  return 0xFFFFFFFFLL;
}

void ppp_control(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9 = fcntl(controlfd, 3);
  if (v9 == -1 || (uint64_t v17 = v9, fcntl(controlfd, 4, v9 | 4) == -1))
  {
    warning((uint64_t)"Couldn't set controlfd to nonblock: %m", v10, v11, v12, v13, v14, v15, v16, a9);
  }
  else
  {
    int v18 = getc((FILE *)controlfile);
    if (v18 == 91) {
      ungetc(91, (FILE *)controlfile);
    }
    fcntl(controlfd, 4, v17);
    if (feof((FILE *)controlfile)) {
      goto LABEL_37;
    }
    clearerr((FILE *)controlfile);
    if (v18 != 91) {
      return;
    }
    int v34 = 0;
    uint64_t v19 = getword((FILE *)controlfile, (uint64_t)v35, &v34, (int)"controller");
    if (!v19) {
LABEL_37:
    }
      die(1);
    while (*(void *)v35 != 0x534E4F4954504F5BLL || *(unsigned __int16 *)&v35[8] != 93)
    {
      if (*(void *)v35 == 0x4E4E4F435349445BLL && *(void *)&v35[5] == 0x5D5443454E4E4FLL)
      {
        error((uint64_t)"[DISCONNECT]", v20, v21, v22, v23, v24, v25, v26, v33);
        sub_1000145D4(1);
      }
      else if (*(void *)v35 == 0x414E494D5245545BLL && *(unsigned int *)&v35[8] == 6112596)
      {
        error((uint64_t)"[TERMINATE]", v20, v21, v22, v23, v24, v25, v26, v33);
        sub_10001469C(15);
      }
      else
      {
        if (*(void *)v35 == 0x4C4C4154534E495BLL && *(unsigned __int16 *)&v35[8] == 93)
        {
          sys_install(v19, v20, v21, v22, v23, v24, v25, v26);
          return;
        }
        if (*(void *)v35 == 0x4154534E494E555BLL && *(unsigned int *)&v35[8] == 6114380)
        {
          sys_uninstall(v19, v20, v21, v22, v23, v24, v25, v26);
          return;
        }
        if (*(_DWORD *)v35 == 1347372379 && *(unsigned __int16 *)&v35[4] == 93) {
          goto LABEL_37;
        }
      }
      uint64_t v19 = getword((FILE *)controlfile, (uint64_t)v35, &v34, (int)"controller");
      if (!v19) {
        goto LABEL_37;
      }
    }
    options_from_controller();
    if (dump_options)
    {
      init_pr_log(0, 6);
      print_options((void (*)(const char *, const char *, ...))pr_log, 0);
      end_pr_log();
    }
  }
}

uint64_t sub_1000145D4(uint64_t result)
{
  int v1 = result;
  pid_t v2 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (uint64_t v3 = pthread_self(), result = pthread_equal(v2, v3), result))
  {
    got_sighup = v1;
    kill_link = 1;
    if (dword_10004A9A0) {
      uint64_t result = sub_100013ED0(v1);
    }
    uint64_t v4 = sigreceived;
    if (sigreceived)
    {
      do
      {
        uint64_t v5 = *(void *)v4;
        uint64_t result = (*(uint64_t (**)(void, void))(v4 + 8))(*(void *)(v4 + 16), v1);
        uint64_t v4 = v5;
      }
      while (v5);
    }
    if (!hungup) {
      *(_DWORD *)status = 5;
    }
    if (byte_10004A994 == 1) {
      siglongjmp(dword_10004B1E0, 1);
    }
  }
  return result;
}

uint64_t sub_10001469C(uint64_t result)
{
  int v1 = result;
  pid_t v2 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (uint64_t v3 = pthread_self(), result = pthread_equal(v2, v3), result))
  {
    got_sigterm = v1;
    kill_link = 1;
    persist = 0;
    *(_DWORD *)status = 5;
    if (dword_10004A9A0) {
      uint64_t result = sub_100013ED0(v1);
    }
    uint64_t v4 = sigreceived;
    if (sigreceived)
    {
      do
      {
        uint64_t v5 = *(void *)v4;
        uint64_t result = (*(uint64_t (**)(void, void))(v4 + 8))(*(void *)(v4 + 16), v1);
        uint64_t v4 = v5;
      }
      while (v5);
    }
    if (byte_10004A994 == 1) {
      siglongjmp(dword_10004B1E0, 1);
    }
  }
  return result;
}

void sub_100014764(int a1)
{
  slprintf((int)&byte_10004A9B8, 1024, "%s%s.pid");
  pid_t v2 = fopen(&byte_10004A9B8, "w");
  if (v2)
  {
    uint64_t v10 = v2;
    fprintf(v2, "%d\n", a1);
    fclose(v10);
  }
  else
  {
    error((uint64_t)"Failed to create pid file %s: %m", v3, v4, v5, v6, v7, v8, v9, (int)&byte_10004A9B8);
    byte_10004A9B8 = 0;
  }
}

uint64_t ppp_send_config(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(the_channel + 56);
  if (!v5) {
    return 0;
  }
  int v6 = error_count;
  v5(a2, a3, a4, a5);
  if (error_count == v6) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ppp_recv_config(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(the_channel + 64);
  if (!v5) {
    return 0;
  }
  int v6 = error_count;
  v5(a2, a3, a4, a5);
  if (error_count == v6) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void sub_1000148E4()
{
  uint64_t v0 = sys_cleanup();
  if ((dword_1000438E0 & 0x80000000) == 0) {
    uint64_t v0 = (*(uint64_t (**)(void))(the_channel + 48))(dword_10004A99C);
  }
  int v1 = *(void (**)(uint64_t))(the_channel + 72);
  if (v1) {
    v1(v0);
  }
  if (byte_10004A9B8 && unlink(&byte_10004A9B8) < 0 && *__error() != 2) {
    warning((uint64_t)"unable to delete pid file %s: %m", v2, v3, v4, v5, v6, v7, v8, (int)&byte_10004A9B8);
  }
  byte_10004A9B8 = 0;
  if (byte_10004ADC8 && unlink(&byte_10004ADC8) < 0 && *__error() != 2) {
    warning((uint64_t)"unable to delete pid file %s: %m", v9, v10, v11, v12, v13, v14, v15, (int)&byte_10004ADC8);
  }
  byte_10004ADC8 = 0;
}

void update_link_stats(uint64_t a1)
{
  if (get_ppp_stats(a1, &link_stats))
  {
    v1.tv_sec = 0;
    *(void *)&v1.tv_usec = 0;
    if ((gettimeofday(&v1, 0) & 0x80000000) == 0)
    {
      link_connect_time = LODWORD(v1.tv_sec) - qword_10004A9A8;
      link_stats_valid = 1;
      slprintf((int)v2, 32, "%u");
      script_setenv("CONNECT_TIME", v2);
      slprintf((int)v2, 32, "%u");
      script_setenv("BYTES_SENT", v2);
      slprintf((int)v2, 32, "%u");
      script_setenv("BYTES_RCVD", v2);
    }
  }
}

void untimeout(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (uint64_t *)qword_10004B1D8;
  if (qword_10004B1D8)
  {
    uint64_t v3 = &qword_10004B1D8;
    while (v2[3] != a1 || v2[2] != a2)
    {
      uint64_t v3 = v2 + 4;
      uint64_t v2 = (uint64_t *)v2[4];
      if (!v2) {
        return;
      }
    }
    *uint64_t v3 = v2[4];
    free(v2);
  }
}

uint64_t safe_fork()
{
  if (pipe(v7) == -1) {
    *(void *)uint64_t v7 = -1;
  }
  uint64_t v0 = fork();
  if ((v0 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = v0;
  if (v0)
  {
    close(v7[1]);
    complete_read(v7[0], &v6, 1uLL);
    int v2 = v7[0];
  }
  else
  {
    sys_close();
    options_close();
    uint64_t v3 = fork_notifier;
    if (fork_notifier)
    {
      do
      {
        uint64_t v4 = *(void *)v3;
        (*(void (**)(void, void))(v3 + 8))(*(void *)(v3 + 16), 0);
        uint64_t v3 = v4;
      }
      while (v4);
    }
    close(v7[0]);
    uint64_t v1 = 0;
    int v2 = v7[1];
  }
  close(v2);
  return v1;
}

uint64_t device_script(uint64_t a1, int a2, int a3, int a4, uid_t a5, const void *a6, int a7)
{
  int v52 = -1;
  *(void *)__fd = -1;
  if (a6 && pipe(__fd) == -1)
  {
    uint64_t v24 = "Failed to setup pipe with device script: %m";
    goto LABEL_16;
  }
  ++dword_10004A9A0;
  int v21 = safe_fork();
  if (v21 < 0)
  {
    --dword_10004A9A0;
    uint64_t v24 = "Failed to create child process: %m";
LABEL_16:
    error((uint64_t)v24, v14, v15, v16, v17, v18, v19, v20, v51);
    return 0xFFFFFFFFLL;
  }
  int v22 = v21;
  if (!v21)
  {
    int v25 = a3;
    do
    {
      unsigned int v26 = dup(a2);
      if ((v26 & 0x80000000) != 0) {
        goto LABEL_23;
      }
    }
    while (v26 < 3);
    close(v26);
LABEL_23:
    int v27 = log_to_fd;
    int v28 = a2;
    int v29 = dup(a2);
    int v30 = dup(v25);
    if (log_to_fd < 0)
    {
      int v51 = 384;
      int v31 = open("/etc/ppp/connect-errors", 521);
    }
    else
    {
      int v31 = dup(log_to_fd);
    }
    int v32 = v31;
    close(v28);
    close(v25);
    close(v27);
    close(0);
    close(1);
    uint64_t v33 = close(2);
    int v34 = *(void (**)(uint64_t))(the_channel + 80);
    if (v34) {
      v34(v33);
    }
    closelog();
    close(dword_10004A990);
    if (__fd[1] != -1)
    {
      close(__fd[1]);
      __fd[1] = -1;
    }
    dup2(v29, 0);
    close(v29);
    dup2(v30, 1);
    close(v30);
    if ((v32 & 0x80000000) == 0)
    {
      dup2(v32, 2);
      close(v32);
    }
    int v35 = 3;
    if (__fd[0] != -1)
    {
      dup2(__fd[0], 3);
      close(__fd[0]);
      __fd[0] = 3;
      int v35 = 4;
    }
    closeallfrom(v35);
    if (a5 == -1) {
      a5 = uid;
    }
    setuid(a5);
    if (getuid() == a5)
    {
      gid_t v43 = getgid();
      setgid(v43);
      execle("/bin/sh", "sh");
      error((uint64_t)"could not exec /bin/sh: %m", v44, v45, v46, v47, v48, v49, v50, (int)"-c");
      exit(99);
    }
    error((uint64_t)"setuid failed", v36, v37, v38, v39, v40, v41, v42, v51);
    exit(1);
  }
  if (__fd[0] != -1)
  {
    close(__fd[0]);
    __fd[0] = -1;
  }
  if (__fd[1] != -1)
  {
    write(__fd[1], a6, a7);
    close(__fd[1]);
    __fd[1] = -1;
  }
  if (a4)
  {
    record_child(v22, a1, 0, 0);
    return 0;
  }
  else
  {
    while (waitpid(v22, &v52, 0) < 0)
    {
      if (*__error() != 4) {
        fatal();
      }
    }
    --dword_10004A9A0;
    return BYTE1(v52);
  }
}

void record_child(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  ++dword_10004ADB8;
  uint64_t v8 = malloc_type_malloc(0x28uLL, 0x10B00401A278E7DuLL);
  if (v8)
  {
    *(_DWORD *)uint64_t v8 = a1;
    v8[1] = a2;
    v8[2] = a3;
    uint64_t v16 = qword_10004ADC0;
    v8[3] = a4;
    v8[4] = v16;
    qword_10004ADC0 = (uint64_t)v8;
  }
  else
  {
    warning((uint64_t)"losing track of %s process", v9, v10, v11, v12, v13, v14, v15, a2);
  }
}

uint64_t run_program(const char *a1, char *const *a2, int a3, uint64_t a4, uint64_t a5)
{
  memset(&v38, 0, sizeof(v38));
  *__error() = 22;
  if (stat(a1, &v38) < 0 || ((v38.st_mode & 0xF000) == 0x8000 ? (BOOL v17 = (v38.st_mode & 0x49) == 0) : (BOOL v17 = 1), v17))
  {
    if (a3 || *__error() != 2) {
      warning((uint64_t)"Can't execute %s: %m", v10, v11, v12, v13, v14, v15, v16, (int)a1);
    }
    return 0;
  }
  else
  {
    uint64_t v20 = safe_fork();
    if (v20 == -1)
    {
      error((uint64_t)"Failed to create child process for %s: %m", v21, v22, v23, v24, v25, v26, v27, (int)a1);
      return 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v18 = v20;
      if (!v20)
      {
        setsid();
        umask(0x3Fu);
        chdir("/");
        setuid(0);
        gid_t v28 = getegid();
        setgid(v28);
        closelog();
        int v29 = *(void (**)(void))(the_channel + 80);
        if (v29) {
          v29();
        }
        dup2(dword_10004A990, 0);
        dup2(dword_10004A990, 1);
        dup2(dword_10004A990, 2);
        close(dword_10004A990);
        closeallfrom(3);
        if (setpriority(0, 0, 0) < 0) {
          warning((uint64_t)"can't reset priority to 0: %m", v30, v31, v32, v33, v34, v35, v36, v37);
        }
        execve(a1, a2, (char *const *)script_env);
        if (a3 || *__error() != 2)
        {
          reopen_log();
          sys_log(3, "Can't execute %s: %m", a1);
          closelog();
        }
        _exit(-1);
      }
      if (debug) {
        dbglog((uint64_t)"Script %s started (pid %d)", v21, v22, v23, v24, v25, v26, v27, (int)a1);
      }
      record_child(v18, (uint64_t)a1, a4, a5);
    }
  }
  return v18;
}

void *add_notifier(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = malloc_type_malloc(0x18uLL, 0xA00402214FCE6uLL);
  if (!result) {
    novm();
  }
  *uint64_t result = *a1;
  result[1] = a2;
  result[2] = a3;
  *a1 = result;
  return result;
}

void novm()
{
}

void *add_notifier_last(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = malloc_type_malloc(0x18uLL, 0xA00402214FCE6uLL);
  if (!result) {
    novm();
  }
  *uint64_t result = 0;
  result[1] = a2;
  result[2] = a3;
  for (uint64_t i = *a1; i; uint64_t i = (void *)*i)
    a1 = (void **)i;
  *a1 = result;
  return result;
}

void remove_notifier(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    while (1)
    {
      uint64_t v4 = v3;
      if (v3[1] == a2 && v3[2] == a3) {
        break;
      }
      uint64_t v3 = (void *)*v3;
      a1 = (void **)v4;
      if (!*v4) {
        return;
      }
    }
    *a1 = (void *)*v3;
    free(v3);
  }
}

uint64_t **notify_with_ptr(uint64_t **result, uint64_t a2)
{
  if (result)
  {
    do
    {
      uint64_t v3 = *result;
      ((void (*)(uint64_t *, uint64_t))result[1])(result[2], a2);
      uint64_t result = (uint64_t **)v3;
    }
    while (v3);
  }
  return result;
}

void sub_100015398()
{
  uint64_t v0 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (uint64_t v1 = pthread_self(), pthread_equal(v0, v1)))
  {
    byte_10004B2A4 = 1;
    if (byte_10004A994 == 1) {
      siglongjmp(dword_10004B1E0, 1);
    }
  }
}

uint64_t sub_100015400(uint64_t result)
{
  int v1 = result;
  int v2 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (uint64_t v3 = pthread_self(), result = pthread_equal(v2, v3), result))
  {
    got_sigtstp = v1;
    if ((phase | 4) != 0xC)
    {
      got_sighup = 1;
      if (dword_10004A9A0) {
        uint64_t result = sub_100013ED0(v1);
      }
    }
    uint64_t v4 = sigreceived;
    if (sigreceived)
    {
      do
      {
        uint64_t v5 = *(void *)v4;
        uint64_t result = (*(uint64_t (**)(void, void))(v4 + 8))(*(void *)(v4 + 16), v1);
        uint64_t v4 = v5;
      }
      while (v5);
    }
    if (byte_10004A994 == 1) {
      siglongjmp(dword_10004B1E0, 1);
    }
  }
  return result;
}

uint64_t sub_1000154C4(uint64_t result)
{
  int v1 = result;
  int v2 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (uint64_t v3 = pthread_self(), result = pthread_equal(v2, v3), result))
  {
    got_sigcont = v1;
    uint64_t v4 = sigreceived;
    if (sigreceived)
    {
      do
      {
        uint64_t v5 = *(void *)v4;
        uint64_t result = (*(uint64_t (**)(void, void))(v4 + 8))(*(void *)(v4 + 16), v1);
        uint64_t v4 = v5;
      }
      while (v5);
    }
    if (byte_10004A994 == 1) {
      siglongjmp(dword_10004B1E0, 1);
    }
  }
  return result;
}

uint64_t sub_100015554()
{
  uint64_t v0 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (v1 = pthread_self(), uint64_t result = pthread_equal(v0, v1), result))
  {
    BOOL v3 = debug == 0;
    debug = debug == 0;
    if (v3) {
      int v4 = 255;
    }
    else {
      int v4 = 31;
    }
    return setlogmask(v4);
  }
  return result;
}

void sub_1000155D0()
{
  uint64_t v0 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (int v1 = pthread_self(), pthread_equal(v0, v1)))
  {
    got_sigusr2 = 1;
    if (byte_10004A994 == 1) {
      siglongjmp(dword_10004B1E0, 1);
    }
  }
}

uint64_t sub_100015638(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (_opaque_pthread_t *)qword_10004A988;
  if (!qword_10004A988 || (uint64_t v10 = pthread_self(), result = pthread_equal(v9, v10), result))
  {
    if (byte_10004B2A8 == 1) {
      _exit(127);
    }
    byte_10004B2A8 = 1;
    error((uint64_t)"Fatal signal %d", a2, a3, a4, a5, a6, a7, a8, a1);
    if (dword_10004A9A0) {
      sub_100013ED0(15);
    }
    notify((uint64_t **)sigreceived, a1);
    die(127);
  }
  return result;
}

uint64_t sub_1000156DC(const char **a1)
{
  gethostname(hostname, 0x100uLL);
  if (**a1)
  {
    if (**a1 != 46)
    {
      size_t v2 = strlen(hostname);
      strncat(hostname, ".", 255 - v2);
    }
    size_t v3 = strlen(hostname);
    domain = (uint64_t)&hostname[v3];
    strncat(hostname, *a1, 255 - v3);
  }
  byte_100047C07 = 0;
  return 1;
}

uint64_t sub_100015784(char **a1)
{
  return options_from_file(*a1, 1, 1, privileged_option);
}

uint64_t sub_10001579C(const char **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *(unsigned __int8 *)*a1;
  if (!**a1 || v8 == 47)
  {
LABEL_3:
    option_error("call option value may not contain .. or start with /", a2, a3, a4, a5, a6, a7, a8, v16);
    return 0;
  }
  uint64_t v10 = *a1;
  while (v8 == 46)
  {
    if (v10[1] == 46 && (!v10[2] || v10[2] == 47)) {
      goto LABEL_3;
    }
    do
    {
LABEL_11:
      if (v8 == 47) {
        break;
      }
      int v11 = *(unsigned __int8 *)++v10;
      int v8 = v11;
    }
    while (v11);
    if (v8 == 47) {
      ++v10;
    }
    int v8 = *(unsigned __int8 *)v10;
  }
  if (v8) {
    goto LABEL_11;
  }
  int v12 = strlen(*a1) + 16;
  uint64_t v13 = (char *)malloc_type_malloc(v12, 0xCDC12224uLL);
  if (!v13) {
    novm();
  }
  uint64_t v14 = v13;
  slprintf((int)v13, v12, "%s%s");
  uint64_t v15 = options_from_file(v14, 0, 1, 1);
  free(v14);
  return v15;
}

uint64_t sub_1000158B4()
{
  if (phase == 1)
  {
    fprintf(__stderrp, "pppd version %s (Apple version %s)\n", "2.4.2", "884");
    exit(0);
  }
  return 0;
}

uint64_t sub_10001591C()
{
  if (phase == 1)
  {
    sub_1000160D4();
    exit(0);
  }
  return 0;
}

uint64_t sub_100015954(const char **a1)
{
  if (!privileged_option)
  {
    uid_t v2 = getuid();
    seteuid(v2);
  }
  int v3 = open(*a1, 2569, 420);
  if (v3 < 0)
  {
    if (*__error() == 17)
    {
      int v4 = open(*a1, 9, v21);
      goto LABEL_22;
    }
    if (privileged_option)
    {
      uint64_t v5 = dirname((char *)*a1);
      sys_log(4, "Warning: Creating directory for log file = %s\n", *a1);
      mode_t v6 = umask(0);
      size_t v7 = (int)(strlen(v5) + 1);
      int v8 = (char *)malloc_type_malloc(v7, 0x77CB451BuLL);
      if (!v8) {
        goto LABEL_21;
      }
      uint64_t v9 = v8;
      memset(&v22, 0, sizeof(v22));
      strlcpy(v8, v5, v7);
      uint64_t v10 = *v9 == 47;
      while (1)
      {
        if (v9[v10])
        {
          if (v9[v10] != 47)
          {
            int v11 = 0;
            goto LABEL_19;
          }
          int v11 = 0;
          v9[v10] = 0;
        }
        else
        {
          int v11 = 1;
        }
        if (mkdir(v9, 0x1EDu) && (*__error() != 17 && *__error() != 21 || stat(v9, &v22) < 0))
        {
LABEL_20:
          free(v9);
          umask(v6);
LABEL_21:
          int v4 = open(*a1, 2569, 420);
LABEL_22:
          int v3 = v4;
          break;
        }
        v9[v10] = 47;
LABEL_19:
        ++v10;
        if (v11) {
          goto LABEL_20;
        }
      }
    }
  }
  int v12 = *__error();
  if (!privileged_option)
  {
    seteuid(0);
    if ((v3 & 0x80000000) == 0) {
      goto LABEL_25;
    }
LABEL_29:
    *__error() = v12;
    option_error("Can't open log file %s: %m", v13, v14, v15, v16, v17, v18, v19, (int)*a1);
    return 1;
  }
  if (v3 < 0) {
    goto LABEL_29;
  }
LABEL_25:
  __strlcpy_chk();
  if ((dword_100044F20 & 0x80000000) == 0) {
    close(dword_100044F20);
  }
  dword_100044F20 = v3;
  log_to_fd = v3;
  log_default = 0;
  return 1;
}

uint64_t sub_100015B90(unsigned char **a1)
{
  uint64_t v1 = (uint64_t)*a1;
  if (sys_loadplugin(*a1)) {
    option_error("Couldn't load plugin %s", v2, v3, v4, v5, v6, v7, v8, v1);
  }
  return 1;
}

uint64_t sub_100015BD8(unsigned char **a1)
{
  uint64_t v1 = (uint64_t)*a1;
  if (!sys_loadplugin(*a1)) {
    return 1;
  }
  option_error("Couldn't load plugin %s", v2, v3, v4, v5, v6, v7, v8, v1);
  return 0;
}

uint64_t sub_100015C28()
{
  if (sys_check_controller())
  {
    int v7 = dup(0);
    controlfd = v7;
    if (v7 == -1)
    {
      uint64_t v9 = "Can't duplicate control file descripor: %m";
    }
    else
    {
      controlfile = (uint64_t)fdopen(v7, "r");
      if (controlfile)
      {
        statusfd = dup(1);
        if (statusfd != -1)
        {
          if (log_default)
          {
            log_to_fd = -1;
            log_default = 0;
          }
          uint64_t result = 1;
          controlled = 1;
          return result;
        }
        uint64_t v9 = "Can't duplicate status file descripor: %m";
      }
      else
      {
        close(controlfd);
        uint64_t v9 = "Can't open control file descripor: %m";
      }
    }
  }
  else
  {
    uint64_t v9 = "Can't verify the controller started the connection";
  }
  option_error(v9, v0, v1, v2, v3, v4, v5, v6, v10);
  if (controlfile)
  {
    fclose((FILE *)controlfile);
    controlfile = 0;
    controlfd = -1;
  }
  if (statusfd == -1) {
    return 0;
  }
  close(statusfd);
  uint64_t result = 0;
  statusfd = -1;
  return result;
}

uint64_t parse_args(int a1, const char **a2)
{
  privileged_option = privileged;
  option_source = (uint64_t)"command line";
  option_priority = 2;
  uint64_t v2 = 1;
  if (a1 >= 1)
  {
    int v4 = a1;
    while (1)
    {
      int v7 = *a2;
      uint64_t v5 = a2 + 1;
      uint64_t v6 = (uint64_t)v7;
      uint64_t v8 = sub_100015E84(v7);
      if (!v8) {
        break;
      }
      unsigned int v16 = (*((_DWORD *)v8 + 2) | 2) != 2 && ((*((_DWORD *)v8 + 8) >> 9) & 1) == 0;
      if (v4 <= v16)
      {
        option_error("too few parameters for option %s", v9, v10, v11, v12, v13, v14, v15, v6);
        return 0;
      }
      if (!sub_100016134((uint64_t)v8, v6, v5, v11, v12, v13, v14, v15)) {
        return 0;
      }
      a2 = &v5[v16];
      BOOL v17 = __OFADD__(v4, ~v16);
      v4 += ~v16;
      if ((v4 < 0) ^ v17 | (v4 == 0)) {
        return 1;
      }
    }
    option_error("unrecognized option '%s'", v9, v10, v11, v12, v13, v14, v15, v6);
    if (phase == 1) {
      fprintf(__stderrp, "pppd version %s\nUsage: %s [ options ], where options are:\n\t<device>\tCommunicate over the named device\n\t<speed>\t\tSet the baud rate to <speed>\n\t<loc>:<rem>\tSet the local and/or remote interface IP\n\t\t\taddresses.  Either one may be omitted.\n\tasyncmap <n>\tSet the desired async map to hex <n>\n\tauth\t\tRequire authentication from peer\n        connect <p>     Invoke shell command <p> to set up the serial line\n\tcrtscts\t\tUse hardware RTS/CTS flow control\n\tdefaultroute\tAdd default route through interface\n\tfile <f>\tTake options from file <f>\n\tmodem\t\tUse modem control lines\n\tmru <n>\t\tSet MRU value to <n> for negotiation\nSee pppd(8) for more options.\n", "2.4.2", (const char *)progname);
    }
    return 0;
  }
  return v2;
}

char **sub_100015E84(const char *a1)
{
  int v2 = 0;
  for (char i = 1; ; char i = 0)
  {
    char v4 = i;
    if (general_options) {
      break;
    }
LABEL_6:
    if (auth_options)
    {
      uint64_t v5 = &auth_options;
      while (!sub_100017928(a1, (uint64_t)v5, v2))
      {
        int v7 = v5[12];
        v5 += 12;
        if (!v7) {
          goto LABEL_10;
        }
      }
      return v5;
    }
LABEL_10:
    uint64_t v8 = qword_10004B6B0;
    if (qword_10004B6B0)
    {
      while (1)
      {
        uint64_t v5 = *(char ***)v8;
        if (**(void **)v8) {
          break;
        }
LABEL_14:
        uint64_t v8 = *(void *)(v8 + 8);
        if (!v8) {
          goto LABEL_15;
        }
      }
      while (!sub_100017928(a1, (uint64_t)v5, v2))
      {
        uint64_t v9 = v5[12];
        v5 += 12;
        if (!v9) {
          goto LABEL_14;
        }
      }
      return v5;
    }
LABEL_15:
    uint64_t v5 = *(char ***)the_channel;
    if (**(void **)the_channel)
    {
      while (!sub_100017928(a1, (uint64_t)v5, v2))
      {
        uint64_t v10 = v5[12];
        v5 += 12;
        if (!v10) {
          goto LABEL_18;
        }
      }
      return v5;
    }
LABEL_18:
    uint64_t v11 = protocols;
    if (protocols)
    {
      uint64_t v12 = 0;
      while (1)
      {
        uint64_t v5 = (char **)*((void *)v11 + 13);
        if (v5)
        {
          if (*v5) {
            break;
          }
        }
LABEL_24:
        uint64_t v11 = (&protocols)[++v12];
        if (!v11) {
          goto LABEL_25;
        }
      }
      while (!sub_100017928(a1, (uint64_t)v5, v2))
      {
        uint64_t v13 = v5[12];
        v5 += 12;
        if (!v13) {
          goto LABEL_24;
        }
      }
      return v5;
    }
LABEL_25:
    int v2 = 1;
    if ((v4 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v5 = &general_options;
  while (!sub_100017928(a1, (uint64_t)v5, v2))
  {
    uint64_t v6 = v5[12];
    v5 += 12;
    if (!v6) {
      goto LABEL_6;
    }
  }
  return v5;
}

void option_error(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  vslprintf(v9, 1024, a1, &a9);
  if (phase == 1) {
    fprintf(__stderrp, "%s: %s\n", (const char *)progname, v9);
  }
  sys_log(3, "%s", v9);
}

uint64_t sub_1000160D4()
{
  if (phase == 1) {
    return fprintf(__stderrp, "pppd version %s\nUsage: %s [ options ], where options are:\n\t<device>\tCommunicate over the named device\n\t<speed>\t\tSet the baud rate to <speed>\n\t<loc>:<rem>\tSet the local and/or remote interface IP\n\t\t\taddresses.  Either one may be omitted.\n\tasyncmap <n>\tSet the desired async map to hex <n>\n\tauth\t\tRequire authentication from peer\n        connect <p>     Invoke shell command <p> to set up the serial line\n\tcrtscts\t\tUse hardware RTS/CTS flow control\n\tdefaultroute\tAdd default route through interface\n\tfile <f>\tTake options from file <f>\n\tmodem\t\tUse modem control lines\n\tmru <n>\t\tSet MRU value to <n> for negotiation\nSee pppd(8) for more options.\n", "2.4.2", (const char *)progname);
  }
  return result;
}

uint64_t sub_100016134(uint64_t a1, uint64_t a2, const char **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = 0;
  signed int v49 = 0;
  current_option = *(void *)a1;
  unsigned int v12 = *(_DWORD *)(a1 + 32);
  do
  {
    int v13 = *(_DWORD *)(a1 + v11 + 32);
    v11 -= 96;
  }
  while ((v13 & 0x100000) != 0);
  if (((privileged_option != 0) & (v12 >> 25)) != 0) {
    int v14 = option_priority + 100;
  }
  else {
    int v14 = option_priority;
  }
  if ((v13 & 0x80000) != 0)
  {
    int v15 = *(__int16 *)(a1 + v11 + 160);
    if (v14 < v15)
    {
      uint64_t result = 1;
      if (v14 == 2 && v15 >= 101)
      {
        option_error("%s%s set in %s cannot be overridden\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
        return 0;
      }
      return result;
    }
    if (v14 >= 101 && v15 == 2)
    {
      warning((uint64_t)"%s%s from %s overrides command line", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
      unsigned int v12 = *(_DWORD *)(a1 + 32);
    }
  }
  if ((v12 & 0x4000000) != 0 && phase != 1)
  {
    option_error("%s%s cannot be changed after initialization", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
    return 0;
  }
  if ((v12 & 0x1000) != 0 && !privileged_option)
  {
    option_error("using the %s%s requires root privilege", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
    return 0;
  }
  if ((v12 & 0x800000) != 0 && !**(unsigned char **)(a1 + 40))
  {
    option_error("%s%s is disabled", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
    return 0;
  }
  if ((v12 & 0x8000000) != 0 && devnam_fixed)
  {
    option_error("the %s%s may not be changed in %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
    return 0;
  }
  switch(*(_DWORD *)(a1 + 8))
  {
    case 0:
    case 1:
    case 7:
      uint64_t result = (*(uint64_t (**)(const char **))(a1 + 16))(a3);
      if (result)
      {
        if (*(unsigned char *)(a1 + 34))
        {
          size_t v17 = strlen(*a3);
          uint64_t v18 = (char *)malloc_type_malloc(v17 + 25, 0x2D404562uLL);
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = v18 + 16;
            size_t v21 = strlen(*a3);
            strlcpy(v20, *a3, v21 + 1);
            uint64_t v22 = option_source;
            *uint64_t v19 = 0;
            v19[1] = v22;
            uint64_t v23 = (void *)(a1 + 40);
            do
            {
              uint64_t v24 = v23;
              uint64_t v23 = (void *)*v23;
            }
            while (v23);
            *uint64_t v24 = v19;
          }
        }
        goto LABEL_86;
      }
      return result;
    case 2:
      **(unsigned char **)(a1 + 16) = v12;
      uint64_t v25 = *(unsigned char **)(a1 + 40);
      if (!v25) {
        goto LABEL_86;
      }
      int v26 = *(_DWORD *)(a1 + 32);
      if ((v26 & 0x400000) == 0)
      {
        if ((v26 & 0x1000000) != 0)
        {
          *uint64_t v25 = 0;
          goto LABEL_86;
        }
        if ((v26 & 0x10000) != 0)
        {
          LOBYTE(v12) = *v25 & ~(_BYTE)v12;
        }
        else
        {
          if ((v26 & 0x800) == 0) {
            goto LABEL_86;
          }
          LOBYTE(v12) = *v25 | v12;
        }
      }
      *uint64_t v25 = v12;
      goto LABEL_86;
    case 3:
      if ((v12 & 0x200) != 0)
      {
        int v28 = 0;
      }
      else
      {
        uint64_t v27 = *a3;
        int v50 = 0;
        uint64_t result = sub_10001763C(v27, &v50, 0);
        if (!result) {
          return result;
        }
        int v28 = v50;
        unsigned int v12 = *(_DWORD *)(a1 + 32);
        if (((v12 & 0x4000) != 0 && v50 < *(_DWORD *)(a1 + 52) || (v12 & 0x8000) != 0 && v50 > *(_DWORD *)(a1 + 48))
          && ((v12 & 0x10000) == 0 || v50))
        {
          int v29 = *(_DWORD *)(a1 + 32) & 0xC000;
          switch(v29)
          {
            case 49152:
              option_error("%s value must be%s between %d and %d", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
              break;
            case 32768:
              option_error("%s value must be%s <= %d", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
              break;
            case 16384:
              option_error("%s value must be%s >= %d", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
              break;
          }
          return 0;
        }
      }
      if ((v12 & 0x80) != 0) {
        int v32 = -256;
      }
      else {
        int v32 = 0;
      }
      signed int v30 = (v32 & 0xFFFFFF00 | v12) + v28;
      if ((v12 & 0x800) != 0) {
        v30 += **(_DWORD **)(a1 + 16);
      }
      uint64_t v33 = *(signed int **)(a1 + 16);
      if ((v12 & 0x20000) != 0 && !privileged_option)
      {
        signed int v34 = *v33;
        if ((v12 & 0x40000) != 0)
        {
          if (!v34) {
            goto LABEL_77;
          }
          if (!v30) {
            goto LABEL_73;
          }
        }
        if (v30 > v34)
        {
LABEL_73:
          option_error("%s value cannot be increased", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a1);
          return 0;
        }
      }
      goto LABEL_77;
    case 4:
      if ((v12 & 0x200) != 0)
      {
        signed int v30 = ((char)v12 >> 7) & 0xFFFFFF00 | v12;
      }
      else
      {
        uint64_t result = sub_10001763C(*a3, &v49, 16);
        if (!result) {
          return result;
        }
        unsigned int v12 = *(_DWORD *)(a1 + 32);
        signed int v30 = v49;
      }
      uint64_t v33 = *(signed int **)(a1 + 16);
      if ((v12 & 0x400) != 0) {
        v30 |= *v33;
      }
LABEL_77:
      *uint64_t v33 = v30;
      uint64_t v35 = *(signed int **)(a1 + 40);
      if (v35 && (*(unsigned char *)(a1 + 34) & 0x40) != 0) {
        *uint64_t v35 = v30;
      }
LABEL_86:
      int v37 = *(BOOL **)(a1 + 40);
      if (v37)
      {
        int v38 = *(_DWORD *)(a1 + 32);
        if ((v38 & 0x30C10800) == 0) {
          *int v37 = (v38 & 0x1000000) == 0;
        }
      }
      uint64_t v39 = a1 + v11;
      if (*(void *)(a1 + v11 + 152))
      {
        uint64_t v40 = *(void **)(v39 + 176);
        if (v40)
        {
          uint64_t v41 = a1 + v11;
          uint64_t v42 = malloc_type_realloc(v40, 8 * *(int *)(a1 + v11 + 184) + 8, 0x10040436913F5uLL);
          if (v42)
          {
            *(void *)(v39 + 176) = v42;
            uint64_t v43 = *(int *)(v41 + 184);
            v42[v43] = option_source;
            *(_DWORD *)(v41 + 184) = v43 + 1;
          }
        }
        else
        {
          uint64_t v44 = malloc_type_malloc(8uLL, 0x10040436913F5uLL);
          *(void *)(v39 + 176) = v44;
          if (!v44) {
            novm();
          }
          *uint64_t v44 = option_source;
          *(_DWORD *)(a1 + v11 + 184) = 1;
        }
      }
      else
      {
        *(void *)(v39 + 152) = option_source;
      }
      uint64_t v45 = a1 + v11;
      *(_WORD *)(v45 + 160) = v14;
      *(_WORD *)(v45 + 162) = -21845 * ((-96 - v11) >> 5);
      if (*(_DWORD *)(a1 + 8) == 5 && (*(unsigned char *)(a1 + 34) & 1) != 0)
      {
        int v46 = strlen(*a3);
        if (v46 >= 1)
        {
          for (uint64_t i = 0; i != v46; (*a3)[i++] = 42)
            ;
        }
      }
      if (phase != 1)
      {
        uint64_t v48 = *(void (**)(void))(a1 + 72);
        if (v48) {
          v48();
        }
      }
      uint64_t result = 1;
      break;
    case 5:
      if ((v12 & 0x2000) != 0)
      {
        strlcpy(*(char **)(a1 + 16), *a3, *(int *)(a1 + 48));
        uint64_t v36 = *(char **)(a1 + 40);
        if (v36 && (*(unsigned char *)(a1 + 34) & 0x40) != 0) {
          strlcpy(v36, *a3, *(int *)(a1 + 48));
        }
      }
      else
      {
        uint64_t v31 = strdup(*a3);
        if (!v31) {
          novm();
        }
        **(void **)(a1 + 16) = v31;
      }
      goto LABEL_86;
    case 6:
      uint64_t result = (*(uint64_t (**)(uint64_t, const char **, uint64_t))(a1 + 16))(a2, a3, 1);
      if (!result) {
        return result;
      }
      goto LABEL_86;
    default:
      goto LABEL_86;
  }
  return result;
}

uint64_t options_from_file(char *__filename, int a2, int a3, int a4)
{
  if (a3)
  {
    uid_t v8 = getuid();
    seteuid(v8);
  }
  uint64_t v39 = 0;
  uint64_t v9 = fopen(__filename, "r");
  int v10 = *__error();
  if (a3) {
    seteuid(0);
  }
  if (v9)
  {
    int v11 = privileged_option;
    privileged_option = a4;
    uint64_t v12 = option_source;
    int v13 = strdup(__filename);
    int v14 = "file";
    if (v13) {
      int v14 = v13;
    }
    option_source = (uint64_t)v14;
    int v15 = "In file %s: unrecognized option '%s'";
    while (1)
    {
      unsigned int v16 = v13;
      if (!getword(v9, (uint64_t)v37, &v36, (int)__filename))
      {
        uint64_t v34 = 1;
        goto LABEL_26;
      }
      size_t v17 = sub_100015E84(v37);
      if (!v17) {
        break;
      }
      uint64_t v25 = (uint64_t)v17;
      if ((*((_DWORD *)v17 + 2) | 2) != 2 && (*((unsigned char *)v17 + 33) & 2) == 0)
      {
        if (!getword(v9, (uint64_t)v38, &v36, (int)__filename))
        {
          int v15 = "In file %s: too few parameters for option '%s'";
          break;
        }
        uint64_t v39 = v38;
      }
      int v26 = sub_100016134(v25, (uint64_t)v37, &v39, v20, v21, v22, v23, v24);
      int v13 = 0;
      if (!v26) {
        goto LABEL_25;
      }
    }
    option_error(v15, v18, v19, v20, v21, v22, v23, v24, (int)__filename);
LABEL_25:
    uint64_t v34 = 0;
LABEL_26:
    fclose(v9);
    privileged_option = v11;
    option_source = v12;
    if (v16) {
      free(v16);
    }
  }
  else
  {
    *__error() = v10;
    if (a2)
    {
      option_error("Can't open options file %s: %m", v27, v28, v29, v30, v31, v32, v33, (int)__filename);
      return 0;
    }
    else
    {
      uint64_t v34 = 1;
      if (v10 != 2 && v10 != 20) {
        warning((uint64_t)"Warning: can't open options file %s: %m", v27, v28, v29, v30, v31, v32, v33, (int)__filename);
      }
    }
  }
  return v34;
}

uint64_t getword(FILE *a1, uint64_t a2, _DWORD *a3, int a4)
{
  LODWORD(v8) = 0;
  uint64_t v9 = 0;
  *a3 = 0;
  char v10 = 1;
  while (1)
  {
LABEL_2:
    int v11 = v8;
    char v12 = v10;
    uint64_t v8 = v9;
    do
    {
      uint64_t v9 = v8;
      unsigned int v13 = getc(a1);
      if (v13 == -1) {
        goto LABEL_19;
      }
      unsigned int v21 = v13;
      if (v13 == 10)
      {
        LODWORD(v8) = 0;
        char v10 = 1;
        if (v12)
        {
          LODWORD(v8) = 0;
          uint64_t v9 = 0;
          *a3 = 1;
        }
        goto LABEL_2;
      }
      uint64_t v8 = 1;
    }
    while (v9);
    if ((v12 & 1) == 0) {
      goto LABEL_26;
    }
    char v10 = 0;
    uint64_t v9 = 0;
    if (v13 != 92)
    {
      if (v13 == 35)
      {
        LODWORD(v8) = 0;
        char v10 = 1;
        uint64_t v9 = 1;
        continue;
      }
      __uint32_t v22 = v13 > 0x7F ? __maskrune(v13, 0x4000uLL) : _DefaultRuneLocale.__runetype[v13] & 0x4000;
      LODWORD(v8) = 0;
      uint64_t v9 = 0;
      char v10 = 1;
      if (!v22) {
        break;
      }
    }
  }
  if (v21 != 39 && v21 != 34)
  {
LABEL_26:
    unsigned int v23 = 0;
    goto LABEL_27;
  }
  unsigned int v23 = v21;
  unsigned int v21 = getc(a1);
  if (v21 != -1)
  {
LABEL_27:
    unint64_t v24 = 0;
    while (1)
    {
      while (!v11)
      {
        if (v23)
        {
          if (v21 == v23) {
            goto LABEL_22;
          }
        }
        else
        {
          if (v21 > 0x7F) {
            __uint32_t v26 = __maskrune(v21, 0x4000uLL);
          }
          else {
            __uint32_t v26 = _DefaultRuneLocale.__runetype[v21] & 0x4000;
          }
          if (v21 == 35 || v26)
          {
            ungetc(v21, a1);
            goto LABEL_22;
          }
        }
        if (v21 == 92)
        {
          int v11 = 1;
          goto LABEL_41;
        }
        if (v24 <= 0x3FE) {
          *(unsigned char *)(a2 + v24) = v21;
        }
LABEL_73:
        unsigned int v21 = getc(a1);
LABEL_74:
        int v11 = 0;
        ++v24;
        if (v21 == -1) {
          goto LABEL_20;
        }
      }
      if (v21 != 10) {
        break;
      }
      int v11 = 0;
LABEL_41:
      unsigned int v21 = getc(a1);
      if (v21 == -1) {
        goto LABEL_20;
      }
    }
    if ((int)v21 > 109)
    {
      switch(v21)
      {
        case 'n':
          int v27 = 1;
          char v28 = 10;
          break;
        case 'r':
          int v27 = 1;
          char v28 = 13;
          break;
        case 's':
          int v27 = 1;
          char v28 = 32;
          break;
        case 't':
          int v27 = 1;
          char v28 = 9;
          break;
        default:
          goto LABEL_57;
      }
LABEL_70:
      if (v24 <= 0x3FE) {
        *(unsigned char *)(a2 + v24) = v28;
      }
      if (!v27) {
        goto LABEL_74;
      }
      goto LABEL_73;
    }
    switch(v21)
    {
      case 'a':
        int v27 = 1;
        char v28 = 7;
        goto LABEL_70;
      case 'b':
        int v27 = 1;
        char v28 = 8;
        goto LABEL_70;
      case 'f':
        int v27 = 1;
        char v28 = 12;
        goto LABEL_70;
    }
LABEL_57:
    if ((v21 & 0xFFFFFFF8) == 0x30)
    {
      unsigned int v29 = 0;
      char v28 = 0;
      do
      {
        char v28 = v21 & 7 | (8 * v28);
        unsigned int v21 = getc(a1);
      }
      while ((v21 & 0xFFFFFFF8) == 0x30 && v29++ < 2);
    }
    else
    {
      if (v21 != 120)
      {
        int v27 = 1;
        char v28 = v21;
        goto LABEL_70;
      }
      unsigned int v21 = getc(a1);
      if (v21 <= 0xFF)
      {
        char v31 = 0;
        char v28 = 0;
        while ((_DefaultRuneLocale.__runetype[v21] & 0x10000) != 0)
        {
          __darwin_ct_rune_t v32 = __toupper(v21);
          if (v32 <= 58) {
            char v33 = -48;
          }
          else {
            char v33 = -55;
          }
          char v28 = v32 + 16 * v28 + v33;
          unsigned int v21 = getc(a1);
          int v27 = 0;
          char v34 = (v21 > 0xFF) | v31;
          char v31 = 1;
          if (v34) {
            goto LABEL_70;
          }
        }
      }
      else
      {
        char v28 = 0;
      }
    }
    int v27 = 0;
    goto LABEL_70;
  }
LABEL_19:
  LODWORD(v24) = 0;
LABEL_20:
  if (ferror(a1))
  {
    if (!*__error()) {
      *__error() = 5;
    }
    option_error("Error reading %s: %m", v35, v36, v37, v38, v39, v40, v41, a4);
    die(1);
  }
  if (!v24) {
    return 0;
  }
LABEL_22:
  if ((int)v24 >= 1024)
  {
    option_error("warning: word in file %s too long (%.20s...)", v14, v15, v16, v17, v18, v19, v20, a4);
    LODWORD(v24) = 1023;
  }
  *(unsigned char *)(a2 + (int)v24) = 0;
  return 1;
}

uint64_t options_from_user()
{
  uid_t v0 = getuid();
  uint64_t v1 = getpwuid(v0);
  if (!v1) {
    return 1;
  }
  pw_dir = v1->pw_dir;
  if (!pw_dir || !*pw_dir) {
    return 1;
  }
  size_t v3 = strlen(v1->pw_dir);
  int v4 = v3 + 8;
  uint64_t v5 = (char *)malloc_type_malloc(v3 + 8, 0x5DE84661uLL);
  if (!v5) {
    novm();
  }
  uint64_t v6 = v5;
  slprintf((int)v5, v4, "%s/%s");
  option_priority = 1;
  uint64_t v7 = options_from_file(v6, 0, 1, privileged);
  free(v6);
  return v7;
}

uint64_t options_for_tty()
{
  uid_t v0 = strstr((char *)&devnam, "/dev/");
  if (v0) {
    uint64_t v1 = v0 + 5;
  }
  else {
    uint64_t v1 = (const char *)&devnam;
  }
  if (*v1 && strcmp(v1, "tty"))
  {
    size_t v2 = strlen(v1);
    int v3 = v2 + 18;
    int v4 = (char *)malloc_type_malloc(v2 + 18, 0x70968256uLL);
    if (!v4) {
      novm();
    }
    uint64_t v5 = v4;
    slprintf((int)v4, v3, "%s%s");
    for (uint64_t i = 17; ; ++i)
    {
      if (v5[i] == 47)
      {
        v5[i] = 46;
      }
      else if (!v5[i])
      {
        option_priority = 1;
        uint64_t v7 = options_from_file(v5, 0, 0, 1);
        free(v5);
        return v7;
      }
    }
  }
  return 1;
}

uint64_t options_from_list(uint64_t a1, int a2)
{
  privileged_option = a2;
  option_source = (uint64_t)"secrets file";
  option_priority = 3;
  if (!a1) {
    return 1;
  }
  uint64_t v2 = a1;
  uint64_t v14 = 0;
  int v3 = "In secrets file: unrecognized option '%s'";
  while (1)
  {
    int v4 = sub_100015E84(*(const char **)(v2 + 8));
    if (!v4) {
      break;
    }
    char v12 = (uint64_t *)v2;
    if ((*((_DWORD *)v4 + 2) | 2) != 2)
    {
      char v12 = (uint64_t *)v2;
      if ((*((unsigned char *)v4 + 33) & 2) == 0)
      {
        char v12 = *(uint64_t **)v2;
        if (!*(void *)v2)
        {
          int v3 = "In secrets file: too few parameters for option '%s'";
          break;
        }
        uint64_t v14 = (const char *)v12[1];
      }
    }
    uint64_t result = sub_100016134((uint64_t)v4, *(void *)(v2 + 8), &v14, v7, v8, v9, v10, v11);
    if (!result) {
      return result;
    }
    uint64_t v2 = *v12;
    if (!*v12) {
      return 1;
    }
  }
  option_error(v3, v5, v6, v7, v8, v9, v10, v11, *(void *)(v2 + 8));
  return 0;
}

char **override_value(const char *a1, int a2, uint64_t a3)
{
  uint64_t result = sub_100015E84(a1);
  if (result)
  {
    uint64_t v6 = (_WORD *)result + 81;
    do
    {
      int v7 = *(_DWORD *)(v6 - 65);
      v6 -= 48;
    }
    while ((v7 & 0x100000) != 0);
    if ((v7 & 0x80000) != 0 && (__int16)*(v6 - 1) > a2)
    {
      return 0;
    }
    else
    {
      *(v6 - 1) = a2;
      *(void *)(v6 - 5) = a3;
      *uint64_t v6 = -1;
      return (char **)1;
    }
  }
  return result;
}

void *add_options(uint64_t a1)
{
  uint64_t result = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
  if (!result) {
    novm();
  }
  uint64_t v3 = qword_10004B6B0;
  *uint64_t result = a1;
  result[1] = v3;
  qword_10004B6B0 = (uint64_t)result;
  return result;
}

uint64_t check_options()
{
  uint64_t result = dword_100044F20;
  if ((dword_100044F20 & 0x80000000) == 0 && dword_100044F20 != log_to_fd) {
    return close(dword_100044F20);
  }
  return result;
}

int *print_options(void (*a1)(const char *, const char *, ...), const char *a2)
{
  a1(a2, "pppd options in effect:\n");
  sub_10001724C((int *)&general_options, a1, a2);
  sub_10001724C((int *)&auth_options, a1, a2);
  for (uint64_t i = qword_10004B6B0; i; uint64_t i = *(void *)(i + 8))
    sub_10001724C(*(int **)i, a1, a2);
  uint64_t result = sub_10001724C(*(int **)the_channel, a1, a2);
  uint64_t v6 = protocols;
  if (protocols)
  {
    int v7 = (__int16 **)&off_100043898;
    do
    {
      uint64_t result = sub_10001724C(*((int **)v6 + 13), a1, a2);
      uint64_t v8 = *v7++;
      uint64_t v6 = v8;
    }
    while (v8);
  }
  return result;
}

int *sub_10001724C(int *result, void (*a2)(const char *, const char *, ...), const char *a3)
{
  if (*(void *)result)
  {
    uint64_t v5 = result;
    do
    {
      if (*((_WORD *)v5 + 32))
      {
        uint64_t v6 = *((__int16 *)v5 + 33);
        if (v6 != -1)
        {
          int v7 = (const char **)&v5[24 * *((__int16 *)v5 + 33)];
          int v8 = *((_DWORD *)v7 + 8);
          if ((v8 & 0x40000000) == 0)
          {
            uint64_t v9 = &v5[24 * *((__int16 *)v5 + 33)];
            unsigned int v12 = v9[2];
            uint64_t v11 = v9 + 2;
            uint64_t v10 = (const char *)v12;
            switch(v12)
            {
              case 0u:
              case 1u:
              case 7u:
                a2(a3, "%s", *v7);
                if ((*v11 | 2) != 2 && (*((unsigned char *)v7 + 33) & 2) == 0)
                {
                  a2(a3, " ");
                  int v8 = *((_DWORD *)v7 + 8);
                  goto LABEL_10;
                }
                goto LABEL_41;
              case 2u:
                if (**(unsigned __int8 **)&v5[24 * *((__int16 *)v5 + 33) + 4] == v8
                  || (v8 & 0x800) != 0
                  && (uint64_t v15 = *(unsigned char **)&v5[24 * *((__int16 *)v5 + 33) + 10]) != 0
                  && (v8 & *v15) != 0)
                {
                  unsigned int v13 = a3;
                  uint64_t v14 = "%s";
                  goto LABEL_40;
                }
                goto LABEL_41;
              case 3u:
                if ((v8 & 0x80) != 0) {
                  int v17 = -256;
                }
                else {
                  int v17 = 0;
                }
                int v18 = **(_DWORD **)&v5[24 * *((__int16 *)v5 + 33) + 4];
                if ((v8 & 0x200) == 0)
                {
                  unsigned int v23 = (const char *)**(unsigned int **)&v5[24 * *((__int16 *)v5 + 33) + 4];
                  unsigned int v13 = a3;
                  uint64_t v14 = "%s %d";
                  goto LABEL_40;
                }
                uint64_t v19 = (const char *)(v17 & 0xFFFFFF00 | *((_DWORD *)v7 + 8));
                a2(a3, "%s", *v7);
                if (v18 != v19)
                {
                  if ((*((unsigned char *)v7 + 33) & 8) == 0)
                  {
                    unsigned int v23 = v19;
                    unsigned int v13 = a3;
                    uint64_t v14 = " # oops: %d not %d\n";
                    goto LABEL_40;
                  }
                  while (v18 > (int)v19)
                  {
                    a2(a3, " %s", *v7);
                    v18 -= (int)v19;
                  }
                }
                goto LABEL_41;
              case 4u:
                a2(a3, "%s", *v7);
                if ((*((unsigned char *)v7 + 33) & 2) == 0)
                {
                  unsigned int v13 = a3;
                  uint64_t v14 = " %x";
                  goto LABEL_40;
                }
                goto LABEL_41;
              case 5u:
                uint64_t v16 = "??????";
                if ((v8 & 0x10000) == 0)
                {
                  uint64_t v16 = *(const char **)&v5[24 * *((__int16 *)v5 + 33) + 4];
                  if ((v8 & 0x2000) == 0) {
                    uint64_t v16 = *(const char **)v16;
                  }
                }
                unsigned int v23 = v16;
                unsigned int v13 = a3;
                uint64_t v14 = "%s %q";
                goto LABEL_40;
              case 6u:
LABEL_10:
                if ((v8 & 0x10000000) != 0)
                {
                  (*(void (**)(int *, void (*)(const char *, const char *, ...), const char *))&v5[24 * (int)v6 + 10])(&v5[24 * (int)v6], a2, a3);
                  goto LABEL_41;
                }
                if ((v8 & 0x20000000) != 0)
                {
                  uint64_t v14 = *(const char **)&v5[24 * (int)v6 + 10];
                  if ((v8 & 0x2000) == 0) {
                    uint64_t v14 = *(const char **)v14;
                  }
                  unsigned int v13 = "%q";
                  goto LABEL_40;
                }
                if ((v8 & 0x10000) == 0)
                {
                  unsigned int v13 = a3;
                  uint64_t v14 = "xxx # [don't know how to print value]";
LABEL_40:
                  a2(v13, v14);
                  goto LABEL_41;
                }
                for (uint64_t i = *(uint64_t ***)&v5[24 * (int)v6 + 10]; ; a2(a3, "\t\t# (from %s)\n%s ", (const char *)i[1], *v7))
                {
                  a2(a3, "%q", i + 2, v23);
                  uint64_t i = (uint64_t **)*i;
                  if (!i) {
                    break;
                  }
                }
LABEL_41:
                a2(a3, "\t\t# (from %s", *((const char **)v5 + 7));
                if (v5[22] >= 1)
                {
                  uint64_t v20 = 0;
                  do
                    a2(a3, ", %s", *(const char **)(*((void *)v5 + 10) + 8 * v20++));
                  while (v20 < v5[22]);
                }
                uint64_t result = (int *)((uint64_t (*)(const char *, const char *))a2)(a3, ")\n");
                break;
              default:
                unsigned int v23 = v10;
                unsigned int v13 = a3;
                uint64_t v14 = "# %s value (type %d??)";
                goto LABEL_40;
            }
          }
        }
      }
      do
      {
        char v21 = *((unsigned char *)v5 + 130);
        v5 += 24;
      }
      while ((v21 & 0x10) != 0);
    }
    while (*(void *)v5);
  }
  return result;
}

uint64_t int_option(const char *a1, _DWORD *a2)
{
  int v4 = 0;
  uint64_t result = sub_10001763C(a1, &v4, 0);
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t sub_10001763C(const char *a1, _DWORD *a2, int a3)
{
  __endptr = 0;
  *a2 = strtoul(a1, &__endptr, a3);
  if (__endptr != a1) {
    return 1;
  }
  option_error("invalid numeric parameter '%s' for %s option", v4, v5, v6, v7, v8, v9, v10, (int)a1);
  return 0;
}

uint64_t options_from_controller()
{
  uid_t v0 = 0;
  int v25 = 0;
  unsigned int v29 = 0;
  uint64_t v30 = 0;
  int v1 = privileged_option;
  privileged_option = controlled;
  option_source = (uint64_t)"controller";
  option_priority = 2;
  while (1)
  {
    do
    {
      if (!getword((FILE *)controlfile, (uint64_t)&size[1], &v25, (int)"controller"))
      {
LABEL_22:
        uint64_t v23 = 1;
        if (!v0) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
    while (*(void *)&size[1] == 0x534E4F4954504F5BLL && v27 == 93);
    if (size[1] == 1347372379 && LOWORD(size[2]) == 93) {
      goto LABEL_22;
    }
    uint64_t v4 = sub_100015E84((const char *)&size[1]);
    if (!v4)
    {
      option_error("In controller file descriptor: unrecognized option '%s'", v5, v6, v7, v8, v9, v10, v11, (int)&size[1]);
      goto LABEL_26;
    }
    uint64_t v12 = (uint64_t)v4;
    unsigned int v29 = 0;
    uint64_t v30 = 0;
    bzero(v28, 0x400uLL);
    int v18 = *(_DWORD *)(v12 + 8);
    if ((v18 | 2) != 2) {
      break;
    }
LABEL_13:
    if (!sub_100016134(v12, (uint64_t)&size[1], &v29, v13, v14, v15, v16, v17)) {
      goto LABEL_26;
    }
  }
  if ((*(unsigned char *)(v12 + 33) & 2) != 0)
  {
    char v21 = 0;
LABEL_19:
    if (v18 == 7)
    {
      size[0] = 0;
      if (!sub_10001763C(v21, size, 0)) {
        goto LABEL_26;
      }
      size_t v22 = size[0];
      uid_t v0 = malloc_type_malloc(size[0], 0xE8E030C8uLL);
      fread(v0, v22, 1uLL, (FILE *)controlfile);
      uint64_t v30 = v0;
    }
    goto LABEL_13;
  }
  if (getword((FILE *)controlfile, (uint64_t)v28, &v25, (int)"controller"))
  {
    char v21 = v28;
    unsigned int v29 = v28;
    int v18 = *(_DWORD *)(v12 + 8);
    goto LABEL_19;
  }
  option_error("In controller file descriptor: too few parameters for option '%s'", v19, v20, v13, v14, v15, v16, v17, (int)&size[1]);
LABEL_26:
  uint64_t v23 = 0;
  if (v0) {
LABEL_23:
  }
    free(v0);
LABEL_24:
  privileged_option = v1;
  return v23;
}

uint64_t options_close()
{
  if (controlfile)
  {
    fclose((FILE *)controlfile);
    controlfile = 0;
    controlfd = -1;
  }
  uint64_t result = statusfd;
  if (statusfd != -1)
  {
    uint64_t result = close(statusfd);
    statusfd = -1;
  }
  controlled = 0;
  return result;
}

uint64_t sub_100017928(const char *a1, uint64_t a2, int a3)
{
  if ((*(_DWORD *)(a2 + 8) == 6) != a3) {
    return 0;
  }
  if (!a3) {
    return strcmp(a1, *(const char **)a2) == 0;
  }
  uint64_t v3 = *(uint64_t (**)(const char *, void, void))(a2 + 16);

  return v3(a1, 0, 0);
}

uint64_t closeall()
{
  int v0 = getdtablesize();
  if (v0 >= 1)
  {
    unsigned int v1 = v0 + 1;
    do
    {
      close(v1 - 2);
      --v1;
    }
    while (v1 > 1);
  }
  open("/dev/null", 2, 0);
  dup(0);

  return dup(0);
}

uint64_t closeallfrom(int a1)
{
  uint64_t v2 = opendir("/dev/fd");
  if (v2)
  {
    uint64_t v3 = v2;
    memset(&v7, 0, 512);
    uint64_t v6 = 0;
    while (!readdir_r(v3, &v7, &v6) && v6)
    {
      int v4 = atoi(v6->d_name);
      if (v4 >= a1 && v4 != v3->__dd_fd) {
        close(v4);
      }
    }
    return closedir(v3);
  }
  else
  {
    for (uint64_t result = getdtablesize(); a1 < (int)result; uint64_t result = getdtablesize())
      close(a1++);
  }
  return result;
}

uint64_t load_kext(uint64_t a1, int a2)
{
  pid_t v4 = fork();
  if (v4 < 0) {
    return 1;
  }
  pid_t v5 = v4;
  if (!v4)
  {
    closeall();
    if (a2) {
      execle("/sbin/kextload", "kextload", "-b", a1, 0, 0);
    }
    else {
      execle("/sbin/kextload", "kextload", a1, 0, 0);
    }
    exit(1);
  }
  uint64_t v6 = 1;
  while (waitpid(v5, 0, 0) < 0)
  {
    if (*__error() != 4) {
      return v6;
    }
  }
  return 0;
}

void sys_install(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10004B978 != -1) {
    dispatch_once(&qword_10004B978, &stru_10003CB58);
  }
  if (byte_10004B975)
  {
    notice((uint64_t)"Committed PPP store on install command\n", a2, a3, a4, a5, a6, a7, a8, vars0);
    uint64_t v8 = (const __SCDynamicStore *)cfgCache;
    CFDictionaryRef v9 = (const __CFDictionary *)publish_dict;
    SCDynamicStoreSetMultiple(v8, v9, 0, 0);
  }
}

void sys_uninstall(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10004B978 != -1) {
    dispatch_once(&qword_10004B978, &stru_10003CB58);
  }
  if (byte_10004B975)
  {
    notice((uint64_t)"Received uninstall command\n", a2, a3, a4, a5, a6, a7, a8, v13);
    if (publish_dict)
    {
      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)publish_dict);
      if (Count >= 1)
      {
        CFIndex v9 = Count;
        uint64_t v10 = (const void **)CFAllocatorAllocate(kCFAllocatorDefault, 8 * Count, 0);
        if (v10)
        {
          uint64_t v11 = v10;
          CFDictionaryGetKeysAndValues((CFDictionaryRef)publish_dict, v10, 0);
          CFArrayRef v12 = CFArrayCreate(kCFAllocatorDefault, v11, v9, &kCFTypeArrayCallBacks);
          SCDynamicStoreSetMultiple((SCDynamicStoreRef)cfgCache, 0, v12, 0);
          if (v12) {
            CFRelease(v12);
          }
          CFAllocatorDeallocate(kCFAllocatorDefault, v11);
        }
      }
    }
  }
}

void *sys_install_options()
{
  return add_options((uint64_t)&sys_options);
}

BOOL sys_check_controller()
{
  kern_return_t v1;
  audit_token_t atoken;
  uid_t euidp;
  audit_token_t v4;
  mach_port_t sp[2];

  if (qword_10004B978 != -1) {
    dispatch_once(&qword_10004B978, &stru_10003CB58);
  }
  if (byte_10004B975)
  {
    sys_log(5, "NetworkExtension is the controller");
    return 1;
  }
  else
  {
    *(void *)sp = 0;
    memset(&v4, 0, sizeof(v4));
    euidp = 0;
    unsigned int v1 = bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp[1]);
    BOOL result = 0;
    if (!v1)
    {
      if (sub_100030EF0(sp[1], sp, &v4))
      {
        return 0;
      }
      else
      {
        atoken = v4;
        audit_token_to_au32(&atoken, 0, &euidp, 0, 0, 0, 0, 0, 0);
        return (sp[0] | euidp) == 0;
      }
    }
  }
  return result;
}

void sys_log(int a1, char *a2, ...)
{
  va_start(va, a2);
  if (qword_10004B978 != -1) {
    dispatch_once(&qword_10004B978, &stru_10003CB58);
  }
  if (byte_10004B975)
  {
    if (a1 == 6) {
      char v4 = 1;
    }
    else {
      char v4 = 2;
    }
    if (a1 < 6) {
      char v4 = 0;
    }
    if (a1 == 3) {
      char v5 = 16;
    }
    else {
      char v5 = v4;
    }
    if (a1 >= 3) {
      os_log_type_t v6 = v5;
    }
    else {
      os_log_type_t v6 = OS_LOG_TYPE_FAULT;
    }
    dirent v7 = ne_log_obj();
    if (os_log_type_enabled(v7, v6))
    {
      CFStringRef v8 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
      if (v8)
      {
        CFStringRef v9 = v8;
        CFStringRef v10 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, v8, va);
        if (v10)
        {
          CFStringRef v11 = v10;
          CFArrayRef v12 = ne_log_obj();
          if (os_log_type_enabled(v12, v6))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, v6, "%@", buf, 0xCu);
          }
          CFRelease(v11);
        }
        CFRelease(v9);
      }
    }
  }
  else
  {
    vsyslog(a1, a2, va);
  }
}

CFDataRef Unserialize(UInt8 *bytes, CFIndex length)
{
  CFDataRef result = CFDataCreate(0, bytes, length);
  if (result)
  {
    CFDataRef v3 = result;
    CFPropertyListRef v4 = CFPropertyListCreateFromXMLData(0, result, 0, 0);
    CFRelease(v3);
    return (const __CFData *)v4;
  }
  return result;
}

void CopyControllerData()
{
  mach_port_t sp = 0;
  uint64_t v16 = 0;
  int v14 = 1001;
  unsigned int v15 = 0;
  memset(&v13, 0, sizeof(v13));
  uid_t euidp = 0;
  if (!bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp))
  {
    int v0 = sub_100030CB8(sp, 0, &v16, &v15, &v14, &v13);
    if (v0 | v14)
    {
      CFStringRef v8 = "cannot get private system options from controller\n";
    }
    else
    {
      audit_token_t atoken = v13;
      audit_token_to_au32(&atoken, 0, &euidp, 0, 0, 0, 0, 0, 0);
      if (euidp)
      {
        CFStringRef v8 = "cannot authenticate private system options from controller\n";
      }
      else
      {
        systemOptions = (uint64_t)Unserialize(v16, v15);
        int v9 = sub_100030CB8(sp, 1, &v16, &v15, &v14, &v13);
        if (v9 | v14)
        {
          CFStringRef v8 = "cannot get private user options from controller\n";
        }
        else
        {
          audit_token_t atoken = v13;
          audit_token_to_au32(&atoken, 0, &euidp, 0, 0, 0, 0, 0, 0);
          if (!euidp)
          {
            userOptions = (uint64_t)Unserialize(v16, v15);
            return;
          }
          CFStringRef v8 = "cannot authenticate private user options from controller\n";
        }
      }
    }
    error((uint64_t)v8, v1, v2, v3, v4, v5, v6, v7, tidp);
  }
}

void CopyServerData()
{
  int v0 = SCPreferencesCreate(0, @"pppd", @"com.apple.RemoteAccessServers.plist");
  if (!v0) {
    fatal();
  }
  uint64_t v1 = v0;
  CFDictionaryRef Value = (const __CFDictionary *)SCPreferencesGetValue(v0, @"Servers");
  if (!Value) {
    fatal();
  }
  uint64_t v3 = CFDictionaryGetValue(Value, (const void *)serveridRef);
  systemOptions = (uint64_t)v3;
  if (!v3 || (CFTypeID v4 = CFGetTypeID(v3), v4 != CFDictionaryGetTypeID())) {
    fatal();
  }
  CFRetain((CFTypeRef)systemOptions);

  CFRelease(v1);
}

BOOL sys_protocolsreadynotify(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  byte_10004B6B8 = 1;
  dbglog((uint64_t)"Received protocol dictionaries\n", a2, a3, a4, a5, a6, a7, a8, vars0);

  return sub_10001830C(v8, v9, v10, v11, v12, v13, v14, v15);
}

BOOL sub_10001830C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (demand) {
    return 0;
  }
  if (phase != 8 || byte_10004B6B8 == 0) {
    return 0;
  }
  if (acsp_use_dhcp | byte_100046F00 && byte_10004B6B9 == 0) {
    return 0;
  }
  if (!publish_dict) {
    return 1;
  }
  if (qword_10004B978 != -1) {
    dispatch_once(&qword_10004B978, &stru_10003CB58);
  }
  if (byte_10004B975)
  {
    if (cfgCache)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        uint64_t v11 = Mutable;
        int v25 = &ifname;
        CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"%s");
        if (v12)
        {
          CFStringRef v13 = v12;
          CFDictionarySetValue(v11, kSCPropInterfaceName, v12);
          CFRelease(v13);
        }
        CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, kSCEntNetIPv4);
        if (NetworkServiceEntity)
        {
          CFStringRef v15 = NetworkServiceEntity;
          if (!SCDynamicStoreSetValue((SCDynamicStoreRef)cfgCache, NetworkServiceEntity, v11))
          {
            int v16 = SCError();
            SCErrorString(v16);
            warning((uint64_t)"SCDynamicStoreSetValue Ifname %s failed: %s\n", v17, v18, v19, v20, v21, v22, v23, (int)&ifname);
          }
          CFRelease(v15);
        }
        CFRelease(v11);
      }
    }
    sys_notify(266, 22, byte_10004B858, a4, a5, a6, a7, a8, (int)v25);
    return 1;
  }
  notice((uint64_t)"Committed PPP store\n", a2, a3, a4, a5, a6, a7, a8, (int)v25);
  return SCDynamicStoreSetMultiple((SCDynamicStoreRef)cfgCache, (CFDictionaryRef)publish_dict, 0, 0) != 0;
}

BOOL sys_acspdhcpreadynotify(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  byte_10004B6B9 = 1;
  dbglog((uint64_t)"Received acsp/dhcp dictionaries\n", a2, a3, a4, a5, a6, a7, a8, vars0);

  return sub_10001830C(v8, v9, v10, v11, v12, v13, v14, v15);
}

double sys_init()
{
  openlog("pppd", 9, 120);
  setlogmask(127);
  if (debug) {
    setlogmask(255);
  }
  setsid();
  int v0 = sub_100018D50();
  ppp_sockfd = v0;
  if (v0 < 0) {
    fatal();
  }
  int v1 = fcntl(v0, 3);
  if (v1 == -1 || (int v31 = v1 | 4, fcntl(ppp_sockfd, 4) == -1)) {
    warning((uint64_t)"Couldn't set PF_PPP to nonblock: %m", v2, v3, v4, v5, v6, v7, v8, v31);
  }
  mach_timebase_info info = 0;
  dword_10004B6BC = socket(2, 2, 0);
  if (dword_10004B6BC < 0)
  {
    __error();
    fatal();
  }
  uint64_t v9 = serviceid;
  if (!serviceid)
  {
    CFUUIDRef v10 = CFUUIDCreate(0);
    CFStringRef v11 = CFUUIDCreateString(0, v10);
    CFStringGetCString(v11, buffer, 100, 0x8000100u);
    serviceid = (uint64_t)strdup(buffer);
    if (!serviceid)
    {
      __error();
      fatal();
    }
    CFRelease(v11);
    CFRelease(v10);
    uint64_t v9 = serviceid;
  }
  serviceidRef = (uint64_t)CFStringCreateWithFormat(0, 0, @"%s", v9);
  if (!serviceidRef)
  {
    __error();
    fatal();
  }
  if (controlled)
  {
    if (qword_10004B978 != -1) {
      dispatch_once(&qword_10004B978, &stru_10003CB58);
    }
    if (byte_10004B975)
    {
      if (qword_10004B988 != -1) {
        dispatch_once(&qword_10004B988, &stru_10003CBC0);
      }
      if (qword_10004B980)
      {
        uint64_t v33 = 0;
        char v34 = &v33;
        uint64_t v35 = 0x2000000000;
        uint64_t v36 = 0;
        uint64_t v12 = dispatch_semaphore_create(0);
        dispatch_get_global_queue(0, 0);
        *(void *)buffer = _NSConcreteStackBlock;
        uint64_t v38 = 0x40000000;
        uint64_t v39 = sub_10001F314;
        uint64_t v40 = &unk_10003CB80;
        uint64_t v41 = &v33;
        uint64_t v42 = v12;
        ne_session_get_info();
        dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v12);
        uint64_t v13 = (void *)v34[3];
        if (v13 && xpc_get_type(v13) == (xpc_type_t)&_xpc_type_dictionary)
        {
          if (xpc_dictionary_get_value((xpc_object_t)v34[3], "SessionLegacyServiceConfiguration")) {
            systemOptions = _CFXPCCreateCFObjectFromXPCObject();
          }
          if (xpc_dictionary_get_value((xpc_object_t)v34[3], "SessionLegacyUserConfiguration")) {
            userOptions = _CFXPCCreateCFObjectFromXPCObject();
          }
        }
        uint64_t v14 = (void *)v34[3];
        if (v14) {
          xpc_release(v14);
        }
        _Block_object_dispose(&v33, 8);
      }
    }
    else
    {
      CopyControllerData();
    }
  }
  cfgCache = (uint64_t)SCDynamicStoreCreate(0, @"pppd", 0, 0);
  if (!cfgCache)
  {
    int v30 = SCError();
    SCErrorString(v30);
    fatal();
  }
  if (nodetach)
  {
    pid_t v15 = getpid();
    publish_dictnumentry(kSCEntNetPPP, @"pid", v15);
  }
  publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPStatus, phase);
  if (serverid)
  {
    serveridRef = (uint64_t)CFStringCreateWithFormat(0, 0, @"%s", serverid);
    if (!serveridRef)
    {
      __error();
      fatal();
    }
    CopyServerData();
    publish_dictstrentry(kSCEntNetInterface, @"ServerID", (const char *)serverid, 0);
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  publish_dict = (uint64_t)Mutable;
  if (!controlled && Mutable)
  {
    rls = (uint64_t)SCDynamicStoreCreateRunLoopSource(kCFAllocatorDefault, (SCDynamicStoreRef)cfgCache, 0);
    if (rls)
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, (CFRunLoopSourceRef)rls, kCFRunLoopDefaultMode);
    }
    else
    {
      int v18 = SCError();
      int v19 = SCErrorString(v18);
      notice((uint64_t)"SCDynamicStoreCreateRunLoopSource FAILED %s", v20, v21, v22, v23, v24, v25, v26, v19);
    }
    SCDynamicStoreSetDisconnectCallBack();
  }
  add_notifier(&phasechange, (uint64_t)sub_100019034, 0);
  add_notifier(&exitnotify, (uint64_t)sub_100019254, 0);
  if (statusfd != -1)
  {
    add_notifier(&ip_up_notify, (uint64_t)sub_1000192EC, 10);
    add_notifier(&ip_down_notify, (uint64_t)sub_1000192EC, 11);
    add_notifier(&lcp_up_notify, (uint64_t)sub_1000192EC, 8);
    add_notifier(&lcp_down_notify, (uint64_t)sub_1000192EC, 9);
    add_notifier(&lcp_lowerup_notify, (uint64_t)sub_1000192EC, 6);
    add_notifier(&lcp_lowerdown_notify, (uint64_t)sub_1000192EC, 7);
    add_notifier(&auth_start_notify, (uint64_t)sub_1000192EC, 12);
    add_notifier(&auth_withpeer_fail_notify, (uint64_t)sub_1000192EC, 13);
    add_notifier(&auth_withpeer_success_notify, (uint64_t)sub_1000192EC, 14);
    add_notifier(&connectscript_started_notify, (uint64_t)sub_1000192EC, 2);
    add_notifier(&connectscript_finished_notify, (uint64_t)sub_1000192EC, 3);
    add_notifier(&terminalscript_started_notify, (uint64_t)sub_1000192EC, 4);
    add_notifier(&terminalscript_finished_notify, (uint64_t)sub_1000192EC, 5);
    add_notifier(&connect_started_notify, (uint64_t)sub_1000192EC, 15);
    add_notifier(&connect_success_notify, (uint64_t)sub_1000192EC, 17);
    add_notifier(&connect_fail_notify, (uint64_t)sub_1000192EC, 16);
    add_notifier(&disconnect_started_notify, (uint64_t)sub_1000192EC, 18);
    add_notifier(&disconnect_done_notify, (uint64_t)sub_1000192EC, 19);
    add_notifier(&stop_notify, (uint64_t)sub_1000192EC, 20);
    add_notifier(&cont_notify, (uint64_t)sub_1000192EC, 21);
  }
  add_notifier(&lcp_timeremaining_notify, (uint64_t)sub_100019308, 0);
  add_notifier(&auth_peer_success_notify, (uint64_t)sub_1000193EC, 0);
  add_notifier(&protocolsready_notifier, (uint64_t)sys_protocolsreadynotify, 0);
  add_notifier(&acspdhcpready_notifier, (uint64_t)sys_acspdhcpreadynotify, 0);
  if (!mach_timebase_info(&info))
  {
    LODWORD(v27) = info.numer;
    LODWORD(v28) = info.denom;
    *(double *)&timeScaleMicroSeconds = (double)v27 / (double)v28 / 1000.0;
    *(double *)&timeScaleSeconds = *(double *)&timeScaleMicroSeconds / 1000000.0;
  }
  double result = 0.0;
  xmmword_10004B720 = 0u;
  unk_10004B730 = 0u;
  xmmword_10004B700 = 0u;
  unk_10004B710 = 0u;
  xmmword_10004B6E0 = 0u;
  unk_10004B6F0 = 0u;
  xmmword_10004B6C0 = 0u;
  *(_OWORD *)algn_10004B6D0 = 0u;
  xmmword_10004B740 = 0u;
  *(_OWORD *)algn_10004B750 = 0u;
  xmmword_10004B760 = 0u;
  unk_10004B770 = 0u;
  xmmword_10004B780 = 0u;
  unk_10004B790 = 0u;
  xmmword_10004B7A0 = 0u;
  unk_10004B7B0 = 0u;
  dword_10004B7C0 = 0;
  return result;
}

uint64_t sub_100018D50()
{
  uint64_t v0 = socket(34, 3, 1);
  if ((v0 & 0x80000000) != 0)
  {
    error((uint64_t)"Couldn't open PF_PPP: %m", v1, v2, v3, v4, v5, v6, v7, v17);
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = v0;
  *(void *)&v18.sa_len = 74248;
  if (connect(v0, &v18, 8u) < 0)
  {
    error((uint64_t)"Couldn't connect to PF_PPP: %m", v9, v10, v11, v12, v13, v14, v15, v17);
    close(v8);
    return 0xFFFFFFFFLL;
  }
  return v8;
}

uint64_t publish_dictnumentry(CFStringRef entity, const void *a2, int a3)
{
  int valuePtr = a3;
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, entity);
  if (!NetworkServiceEntity) {
    return 12;
  }
  CFStringRef v5 = NetworkServiceEntity;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    publish_keyentry(v5, a2, v6);
    CFRelease(v7);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 12;
  }
  CFRelease(v5);
  return v8;
}

uint64_t publish_dictstrentry(CFStringRef entity, const void *a2, const char *a3, CFStringEncoding a4)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, entity);
  if (!NetworkServiceEntity) {
    return 12;
  }
  CFStringRef v8 = NetworkServiceEntity;
  CFStringRef v9 = CFStringCreateWithCString(0, a3, a4);
  if (v9)
  {
    CFStringRef v10 = v9;
    publish_keyentry(v8, a2, v9);
    CFRelease(v10);
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 12;
  }
  CFRelease(v8);
  return v11;
}

void sub_100018F28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dbglog((uint64_t)"DynamicStore Server has reconnected, republish keys", a2, a3, a4, a5, a6, a7, a8, v37);
  if (publish_dict)
  {
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)publish_dict);
    if (Count)
    {
      int v9 = Count;
      CFRelease((CFTypeRef)cfgCache);
      cfgCache = (uint64_t)SCDynamicStoreCreate(0, @"pppd", 0, 0);
      if (!cfgCache)
      {
        int v36 = SCError();
        SCErrorString(v36);
        fatal();
      }
      dbglog((uint64_t)"republish_dict: processing %d keys", v10, v11, v12, v13, v14, v15, v16, v9);
      if (demand)
      {
        CFDictionaryRef v25 = (const __CFDictionary *)publish_dict;
        if (publish_dict)
        {
          uint64_t v26 = (const __SCDynamicStore *)cfgCache;
          SCDynamicStoreSetMultiple(v26, v25, 0, 0);
        }
      }
      else if (!sub_10001830C(v17, v18, v19, v20, v21, v22, v23, v24))
      {
        int v27 = SCError();
        int v28 = SCErrorString(v27);
        warning((uint64_t)"republish_dict SCDynamicStoreSetMultiple failed key: %s\n", v29, v30, v31, v32, v33, v34, v35, v28);
      }
    }
  }
}

void sub_100019034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPStatus, a2);
  switch(a2)
  {
    case 0:
    case 3:
    case 11:
      int v15 = *(_DWORD *)status;
      int v16 = 1;
      goto LABEL_7;
    case 2:
      unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPRetryConnectTime);
      goto LABEL_10;
    case 4:
      dword_10004B990 = (*(double *)&timeScaleSeconds * (double)mach_absolute_time());
      publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPConnectTime, dword_10004B990);
      if (!maxconnect) {
        goto LABEL_10;
      }
      CFStringRef v17 = kSCPropNetPPPDisconnectTime;
      int v18 = dword_10004B990 + maxconnect;
      CFStringRef v19 = kSCEntNetPPP;
LABEL_9:
      publish_dictnumentry(v19, v17, v18);
LABEL_10:
      int v21 = phase;
      if (phase)
      {
        int v22 = ifunit;
        sys_notify(268, v21, v22, v10, v11, v12, v13, v14, a9);
      }
      return;
    case 10:
      unpublish_dictentry(kSCEntNetPPP, @"AuthPeerName");
      unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPCommRemoteAddress);
      unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPConnectTime);
      unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime);
      int v16 = 23;
      int v15 = 0;
LABEL_7:
      sys_notify(266, v16, v15, v10, v11, v12, v13, v14, v23);
      goto LABEL_10;
    case 13:
      double v20 = (double)redialtimer;
      int v18 = (int)(v20 + (double)mach_absolute_time() * *(double *)&timeScaleSeconds);
      CFStringRef v19 = kSCEntNetPPP;
      CFStringRef v17 = kSCPropNetPPPRetryConnectTime;
      goto LABEL_9;
    default:
      goto LABEL_10;
  }
}

void sub_100019254(uint64_t a1, int a2)
{
  unpublish_dict(kSCEntNetPPP);
  unpublish_dict(kSCEntNetDNS);
  unpublish_dict(kSCEntNetProxies);
  unpublish_dict(kSCEntNetInterface);
  sys_notify(266, 1, a2, v3, v4, v5, v6, v7, v8);
  if (cfgCache)
  {
    CFRelease((CFTypeRef)cfgCache);
    cfgCache = 0;
  }
  if (publish_dict)
  {
    CFRelease((CFTypeRef)publish_dict);
    publish_dict = 0;
  }
}

void sub_1000192EC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (a1 == 16) {
    int v9 = 8;
  }
  else {
    int v9 = a2;
  }
  sys_notify(266, a1, v9, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_100019308(uint64_t a1, _DWORD *a2)
{
  uint64_t v3 = mach_absolute_time();
  if (*a2 == -1)
  {
    if (!maxconnect || (unsigned int v4 = dword_10004B990 + maxconnect) == 0)
    {
LABEL_12:
      return unpublish_dictentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime);
    }
  }
  else
  {
    unsigned int v4 = *a2 + (*(double *)&timeScaleSeconds * (double)v3);
    if (maxconnect && v4 >= dword_10004B990 + maxconnect) {
      unsigned int v4 = dword_10004B990 + maxconnect;
    }
    if (!v4) {
      goto LABEL_12;
    }
  }

  return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPDisconnectTime, v4);
}

uint64_t sub_1000193EC(uint64_t a1, uint64_t a2)
{
  return publish_dictstrentry(kSCEntNetPPP, @"AuthPeerName", *(const char **)(a2 + 8), 0x8000100u);
}

uint64_t sys_cleanup()
{
  if (controlled) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = rls == 0;
  }
  if (!v0)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, (CFRunLoopSourceRef)rls, kCFRunLoopDefaultMode);
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)rls);
    CFRelease((CFTypeRef)rls);
    rls = 0;
  }
  long long v3 = 0u;
  long long v4 = 0u;
  uint64_t result = cifroute();
  if (byte_10004B7C4 == 1)
  {
    __strlcpy_chk();
    uint64_t result = ioctl(dword_10004B6BC, 0xC0206911uLL, &v3);
    if (result & 0x80000000) == 0 && (v4)
    {
      LOWORD(v4) = v4 & 0xFFFE;
      uint64_t result = ioctl(dword_10004B6BC, 0x80206910uLL, &v3);
    }
  }
  if (dword_10004B7C8) {
    uint64_t result = cifaddr(result, dword_10004B7C8, dword_10004B7CC);
  }
  if (dword_10004B7D0) {
    return cifproxyarp();
  }
  return result;
}

uint64_t cifroute()
{
  if (addifroute) {
    BOOL v0 = dword_10004B848 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (!v0)
  {
    route_interface(2, dword_10004B840, dword_10004B844, 23, &ifname, 0);
    dword_10004B848 = 0;
  }
  return 1;
}

uint64_t cifaddr(uint64_t a1, int a2, int a3)
{
  long long v13 = 0u;
  cifroute();
  dword_10004B7C8 = 0;
  __strlcpy_chk();
  uint64_t v16 = 0;
  int v14 = 528;
  int v15 = a2;
  uint64_t v19 = 0;
  int v17 = 528;
  int v18 = a3;
  long long v20 = 0uLL;
  if (ioctl(dword_10004B6BC, 0x80206919uLL) < 0)
  {
    if (*__error() != 49) {
      warning((uint64_t)"Couldn't delete interface address: %m", v6, v7, v8, v9, v10, v11, v12, (int)&v13);
    }
    return 0;
  }
  else
  {
    unpublish_dict(kSCEntNetIPv4);
    return 1;
  }
}

uint64_t cifdefaultroute()
{
  byte_10004B858 = 0;
  ppp_create_ipv6_dummy_primary(1);

  return unpublish_dictentry(kSCEntNetIPv4, kSCPropNetOverridePrimary);
}

uint64_t cifproxyarp()
{
  if (byte_10004B960 == 1)
  {
    byte_10004B960 = 0;
    BYTE3(xmmword_10004B85C) = 2;
    dword_10004B870 = ++dword_10004B95C;
    int v0 = socket(17, 3, 17);
    if (v0 < 0)
    {
      error((uint64_t)"Couldn't delete proxy arp entry: socket: %m", v1, v2, v3, v4, v5, v6, v7, v17);
    }
    else
    {
      int v8 = v0;
      if ((write(v0, &xmmword_10004B85C, (unsigned __int16)xmmword_10004B85C) & 0x8000000000000000) == 0)
      {
        close(v8);
        dword_10004B7D0 = 0;
        return 1;
      }
      error((uint64_t)"Couldn't delete proxy arp entry: %m", v9, v10, v11, v12, v13, v14, v15, v17);
      close(v8);
    }
  }
  return 0;
}

void sys_runloop()
{
  if (controlled) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = rls == 0;
  }
  if (!v0)
  {
    if (kill_link)
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopStop(Current);
    }
    else
    {
      CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.0, 1u);
    }
  }
}

void set_network_signature(char *__s, const char *a2, const char *a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (qword_10004B7D8)
  {
    free((void *)qword_10004B7D8);
    qword_10004B7D8 = 0;
  }
  if (__s)
  {
    int v13 = strlen(__s);
    int v14 = strlen(a2) + v13 + 1;
    if (!a3) {
      goto LABEL_9;
    }
  }
  else
  {
    int v14 = 0;
    if (!a3) {
      goto LABEL_9;
    }
  }
  int v15 = strlen(a3);
  int v16 = strlen(a4) + v15;
  if (__s) {
    int v17 = 2;
  }
  else {
    int v17 = 1;
  }
  v14 += v17 + v16;
LABEL_9:
  if (!v14) {
    return;
  }
  size_t v18 = v14 + 1;
  uint64_t v19 = (char *)malloc_type_malloc(v18, 0xFD38B035uLL);
  qword_10004B7D8 = (uint64_t)v19;
  if (v19)
  {
    *uint64_t v19 = 0;
    if (__s)
    {
      strlcat(v19, __s, v18);
      strlcat((char *)qword_10004B7D8, "=", v18);
      strlcat((char *)qword_10004B7D8, a2, v18);
      if (!a3) {
        return;
      }
      strlcat((char *)qword_10004B7D8, ";", v18);
      uint64_t v19 = (char *)qword_10004B7D8;
    }
    else if (!a3)
    {
      return;
    }
    strlcat(v19, a3, v18);
    strlcat((char *)qword_10004B7D8, "=", v18);
    int v27 = (char *)qword_10004B7D8;
    strlcat(v27, a4, v18);
  }
  else
  {
    warning((uint64_t)"no memory to create network signature", v20, v21, v22, v23, v24, v25, v26, a9);
  }
}

CFStringRef set_server_peer(in_addr_t a1)
{
  if (qword_10004B7E0)
  {
    CFRelease((CFTypeRef)qword_10004B7E0);
    qword_10004B7E0 = 0;
  }
  v2.s_addr = a1;
  uint64_t v3 = inet_ntoa(v2);
  CFStringRef result = CFStringCreateWithCString(0, v3, 0x600u);
  qword_10004B7E0 = (uint64_t)result;
  return result;
}

uint64_t sys_close()
{
  if (dword_10004B6BC != -1)
  {
    close(dword_10004B6BC);
    dword_10004B6BC = -1;
  }
  uint64_t result = ppp_sockfd;
  if (ppp_sockfd != -1)
  {
    uint64_t result = close(ppp_sockfd);
    ppp_sockfd = -1;
  }
  return result;
}

void sys_notify(__int16 a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (statusfd != -1)
  {
    size_t v12 = strlen((const char *)serviceid);
    int v13 = v12;
    size_t v14 = (uint64_t)((v12 << 32) + 0x1C00000000) >> 32;
    int v15 = malloc_type_malloc(v14, 0xC2DA915FuLL);
    if (v15)
    {
      uint64_t v23 = v15;
      bzero(v15, v14);
      v23[1] = a1;
      *v23 |= 0x8000u;
      *((_DWORD *)v23 + 3) = v13;
      *((_DWORD *)v23 + 4) = 8;
      memmove(v23 + 10, (const void *)serviceid, v13);
      uint64_t v24 = (_DWORD *)((char *)v23 + v13 + 20);
      *uint64_t v24 = a2;
      v24[1] = a3;
      if (write(statusfd, v23, v14) != v14) {
        warning((uint64_t)"can't talk to PPPController : %m", v25, v26, v27, v28, v29, v30, v31, v32);
      }
      free(v23);
    }
    else
    {
      warning((uint64_t)"no memory to send event to PPPController", v16, v17, v18, v19, v20, v21, v22, a9);
    }
  }
}

void sys_statusnotify(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

uint64_t sys_check_options(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (crtscts != 2) {
    return 1;
  }
  warning((uint64_t)"DTR/CTS flow control is not supported on this system", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t ppp_available()
{
  no_ppp_msg[0] = "Mac OS X lacks kernel support for PPP.  \n"
                  "To include PPP support in the kernel, please follow \n"
                  "the steps detailed in the README.MacOSX file.\n";
  int v0 = socket(34, 3, 1);
  if (v0 < 0)
  {
    if (noload) {
      return 0;
    }
    if (load_kext((uint64_t)"com.apple.nke.ppp", 1)) {
      return 0;
    }
    int v0 = socket(34, 3, 1);
    if (v0 < 0) {
      return 0;
    }
  }
  close(v0);
  return 1;
}

uint64_t tty_establish_ppp(int a1)
{
  ioctl(a1, 0x2000740DuLL, 0);
  if (sync_serial) {
    int v2 = 14;
  }
  else {
    int v2 = 5;
  }
  dword_100045290 = v2;
  if (ioctl(a1, 0x8004741BuLL, &dword_100045290) < 0 && *__error() != 5)
  {
    int v13 = "Couldn't set tty to PPP discipline: %m";
    goto LABEL_12;
  }
  uint64_t v10 = generic_establish_ppp(a1, 0);
  if (v10 == -1)
  {
    int v15 = &unk_10004B7E8;
    if ((ioctl(a1, 0x8004741BuLL) & 0x80000000) == 0 || *__error() == 5) {
      return 0xFFFFFFFFLL;
    }
    int v13 = "ioctl(TIOCSETD, TTYDISC): %m";
LABEL_12:
    error((uint64_t)v13, v3, v4, v5, v6, v7, v8, v9, (int)v15);
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = v10;
  int v12 = sub_10001A064(dword_100045294);
  sub_100019FF8(v11, v12 & 0xF0FFFFFF);
  return v11;
}

uint64_t generic_establish_ppp(int a1, uint64_t a2)
{
  int v42 = 0;
  uint64_t v39 = &v42;
  if (ioctl(a1, 0x40047437uLL) == -1)
  {
    int v37 = "Couldn't get link number: %m";
LABEL_19:
    error((uint64_t)v37, v3, v4, v5, v6, v7, v8, v9, (int)v39);
    return 0xFFFFFFFFLL;
  }
  dbglog((uint64_t)"using link %d", v3, v4, v5, v6, v7, v8, v9, v42);
  int v10 = sub_100018D50();
  if (v10 < 0)
  {
    int v37 = "Couldn't reopen PF_PPP: %m";
    goto LABEL_19;
  }
  int v11 = v10;
  uint64_t v40 = &v42;
  if (ioctl(v10, 0x80047438uLL) < 0)
  {
    error((uint64_t)"Couldn't attach to the ppp link %d: %m", v12, v13, v14, v15, v16, v17, v18, v42);
  }
  else
  {
    int v19 = fcntl(v11, 3);
    if (v19 == -1 || (LODWORD(v40) = v19 | 4, fcntl(v11, 4) == -1)) {
      warning((uint64_t)"Couldn't set ppp socket link to nonblock: %m", v20, v21, v22, v23, v24, v25, v26, (int)v40);
    }
    dword_100045294 = v11;
    if (looped || (ifunit = -1, multilink) || (sub_10001A278() & 0x80000000) == 0)
    {
      if (a2 && (int v41 = a2, ioctl(ppp_sockfd, 0x80107434uLL) < 0))
      {
        uint64_t v38 = "Couldn't set the delegate interface: %m";
      }
      else
      {
        if (looped)
        {
          int v34 = ppp_sockfd;
          int v35 = sub_10001A064(ppp_sockfd);
          sub_100019FF8(v34, v35 & 0xFFFFFDFF);
          looped = 0;
        }
        if (multilink || (add_fd(ppp_sockfd), (ioctl(v11, 0x8004743AuLL, &ifunit) & 0x80000000) == 0))
        {
          sub_10001A418(kdebugflag);
          return dword_100045294;
        }
        int v41 = ifunit;
        uint64_t v38 = "Couldn't attach to PPP unit %d: %m";
      }
      error((uint64_t)v38, v27, v28, v29, v30, v31, v32, v33, v41);
    }
  }
  close(v11);
  return 0xFFFFFFFFLL;
}

int *sub_100019FF8(int a1, int a2)
{
  int v3 = a2;
  uint64_t result = (int *)ioctl(a1, 0x80047459uLL, &v3);
  if ((result & 0x80000000) != 0)
  {
    uint64_t result = __error();
    if (*result != 5)
    {
      __error();
      fatal();
    }
  }
  return result;
}

uint64_t sub_10001A064(int a1)
{
  unsigned int v2 = 0;
  if ((ioctl(a1, 0x4004745AuLL, &v2) & 0x80000000) == 0) {
    return v2;
  }
  if (*__error() != 5) {
    fatal();
  }
  return 0;
}

void tty_disestablish_ppp(int a1)
{
  if (!hungup)
  {
    if (ioctl(a1, 0x8004741BuLL) < 0 && *__error() != 5) {
      error((uint64_t)"ioctl(TIOCSETD, TTYDISC): %m", v2, v3, v4, v5, v6, v7, v8, (int)&unk_10004B7E8);
    }
    if (ioctl(a1, 0x2000740EuLL, 0) < 0 && *__error() != 5)
    {
      uint64_t v9 = __error();
      warning((uint64_t)"ioctl(TIOCNXCL): %m(%d)", v10, v11, v12, v13, v14, v15, v16, *v9);
    }
  }

  generic_disestablish_ppp();
}

void generic_disestablish_ppp()
{
  int v9 = 0;
  close(dword_100045294);
  dword_100045294 = -1;
  if (demand)
  {
    looped = 1;
    int v0 = ppp_sockfd;
    int v1 = sub_10001A064(ppp_sockfd);
    sub_100019FF8(v0, v1 | 0x200);
  }
  else
  {
    unpublish_dictentry(kSCEntNetPPP, kSCPropInterfaceName);
    if ((ifunit & 0x80000000) == 0 && ioctl(ppp_sockfd, 0x8004743CuLL, &v9) < 0) {
      error((uint64_t)"Couldn't release PPP unit ppp_sockfd %d: %m", v2, v3, v4, v5, v6, v7, v8, ppp_sockfd);
    }
  }
  if (!multilink) {
    remove_fd(ppp_sockfd);
  }
}

uint64_t sub_10001A278()
{
  ifunit = req_unit;
  uint64_t v7 = ioctl(ppp_sockfd, 0xC004743EuLL);
  if ((v7 & 0x80000000) != 0 && (req_unit & 0x80000000) == 0)
  {
    if (*__error() != 17)
    {
LABEL_7:
      error((uint64_t)"Couldn't create new ppp unit: %m", v0, v1, v2, v3, v4, v5, v6, (int)&ifunit);
      return v7;
    }
    warning((uint64_t)"Couldn't allocate PPP unit %d as it is already in use", v0, v1, v2, v3, v4, v5, v6, (int)&ifunit);
    ifunit = -1;
    uint64_t v7 = ioctl(ppp_sockfd, 0xC004743EuLL);
  }
  if ((v7 & 0x80000000) != 0) {
    goto LABEL_7;
  }
  slprintf((int)v9, 32, "%s%d");
  publish_dictstrentry(kSCEntNetPPP, kSCPropInterfaceName, v9, 0);
  return v7;
}

uint64_t add_fd(int a1)
{
  uint64_t result = __darwin_check_fd_set_overflow(a1, &xmmword_10004B6C0, 0);
  if (result) {
    *(_DWORD *)((char *)&xmmword_10004B6C0 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  }
  if (dword_10004B7C0 < a1) {
    dword_10004B7C0 = a1;
  }
  return result;
}

void sub_10001A418(int a1)
{
  int v8 = a1;
  if ((ifunit & 0x80000000) == 0 && ioctl(ppp_sockfd, 0x80047440uLL) < 0 && *__error() != 5) {
    error((uint64_t)"ioctl(PPPIOCSDEBUG): %m", v1, v2, v3, v4, v5, v6, v7, (int)&v8);
  }
}

uint64_t unpublish_dictentry(CFStringRef entity, const void *a2)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, entity);
  if (!NetworkServiceEntity) {
    return 12;
  }
  CFStringRef v4 = NetworkServiceEntity;
  unpublish_keyentry(NetworkServiceEntity, a2);
  CFRelease(v4);
  return 0;
}

uint64_t remove_fd(int a1)
{
  uint64_t result = __darwin_check_fd_set_overflow(a1, &xmmword_10004B6C0, 0);
  if (result) {
    *(_DWORD *)((char *)&xmmword_10004B6C0 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) &= ~(1 << a1);
  }
  return result;
}

void clean_check()
{
  if (!hungup && (dword_100045294 & 0x80000000) == 0)
  {
    int v16 = 0;
    if (!ioctl(dword_100045294, 0x4004745AuLL))
    {
      unsigned int v7 = ((~v16 & 0xF000000u) - 0x1000000) >> 24;
      if (v7 <= 7 && ((0x8Bu >> v7) & 1) != 0)
      {
        int v8 = off_10003CBE0[(char)v7];
        warning((uint64_t)"Serial link is not 8-bit clean:", v0, v1, v2, v3, v4, v5, v6, (int)&v16);
        warning((uint64_t)"All received characters had %s", v9, v10, v11, v12, v13, v14, v15, (int)v8);
      }
    }
  }
}

void set_up_tty(int a1, int a2)
{
  int v20 = 0;
  if (ioctl(a1, 0x20007461uLL) == -1) {
    error((uint64_t)"set_up_tty, can't set controlling terminal: %m", v4, v5, v6, v7, v8, v9, v10, 0);
  }
  memset(&v21, 0, sizeof(v21));
  if (tcgetattr(a1, &v21) < 0)
  {
    error((uint64_t)"tcgetattr: %m", v11, v12, v13, v14, v15, v16, v17, v20);
  }
  else
  {
    if ((byte_10004B7EC & 1) == 0)
    {
      *(termios *)byte_10004B7F0 = v21;
      ioctl(a1, 0x40087468uLL, &unk_10004B838);
    }
    tcflag_t v18 = v21.c_cflag & 0xFFFFFFFFFFFF68FFLL;
    if (a2 || crtscts < 1)
    {
      if (crtscts < 0) {
        tcflag_t v18 = v21.c_cflag & 0xFFFFFFFFFFFC68FFLL;
      }
    }
    else if (crtscts != 2)
    {
      tcflag_t v18 = v21.c_cflag & 0xFFFFFFFFFFFC68FFLL | 0x30000;
    }
    v21.c_cflag = v18 | 0x4B00;
    if (a2 || !modem) {
      v21.c_cflag = v18 | 0xCB00;
    }
    *(_OWORD *)&v21.c_iflag = xmmword_10003B5B0;
    v21.c_lflag = 0;
    *(_WORD *)&v21.c_cc[16] = 1;
    if (crtscts == -2)
    {
      v21.c_iflag = 1541;
      *(_WORD *)&v21.c_cc[12] = 4881;
    }
    if (inspeed)
    {
      cfsetospeed(&v21, inspeed);
      cfsetispeed(&v21, inspeed);
      int v19 = inspeed;
    }
    else
    {
      int v19 = cfgetospeed(&v21);
      inspeed = v19;
      if (!v19) {
        fatal();
      }
    }
    baud_rate = v19;
    if (tcsetattr(a1, 2, &v21) < 0) {
      fatal();
    }
    byte_10004B7EC = 1;
  }
}

void set_up_tty_local(int a1, int a2)
{
  memset(&v12, 0, sizeof(v12));
  if (tcgetattr(a1, &v12) < 0)
  {
    error((uint64_t)"tcgetattr: %m", v4, v5, v6, v7, v8, v9, v10, v12.c_iflag);
  }
  else
  {
    *(_WORD *)&v12.c_cc[16] = 1;
    tcflag_t c_cflag = v12.c_cflag;
    v12.c_cflag &= ~0x8000uLL;
    if (a2 || !modem) {
      v12.tcflag_t c_cflag = c_cflag | 0x8000;
    }
    if (tcsetattr(a1, 0, &v12) < 0) {
      fatal();
    }
  }
}

uint64_t restore_tty(uint64_t result)
{
  if (byte_10004B7EC == 1)
  {
    int v1 = result;
    if (!default_device) {
      *(void *)&byte_10004B7F0[24] &= 0xFFFFFFFFFFFFFFE7;
    }
    if (!hungup)
    {
      if (tcsetattr(result, 2, (const termios *)byte_10004B7F0) < 0 && *__error() != 6) {
        warning((uint64_t)"tcsetattr: %m", v2, v3, v4, v5, v6, v7, v8, v9);
      }
      uint64_t result = ioctl(v1, 0x80087467uLL, &unk_10004B838);
    }
    byte_10004B7EC = 0;
  }
  return result;
}

uint64_t setdtr(int a1, int a2)
{
  int v3 = 2;
  if (a2) {
    return ioctl(a1, 0x8004746CuLL, &v3);
  }
  else {
    return ioctl(a1, 0x8004746BuLL, &v3);
  }
}

uint64_t get_pty(int *a1, int *a2, char *a3, uid_t a4)
{
  if (openpty(a1, a2, a3, 0, 0) < 0) {
    return 0;
  }
  memset(&v15, 0, sizeof(v15));
  fchown(*a2, a4, 0xFFFFFFFF);
  fchmod(*a2, 0x180u);
  if (tcgetattr(*a2, &v15))
  {
    uint64_t v13 = "couldn't get attributes on pty: %m";
  }
  else
  {
    *(_OWORD *)&v15.c_iflag = xmmword_10003B5C0;
    v15.tcflag_t c_cflag = v15.c_cflag & 0xFFFFFFFFFFFFE0FFLL | 0xB00;
    v15.c_lflag = 0;
    if ((tcsetattr(*a2, 2, &v15) & 0x80000000) == 0) {
      return 1;
    }
    uint64_t v13 = "couldn't set attributes on pty: %m";
  }
  warning((uint64_t)v13, v6, v7, v8, v9, v10, v11, v12, v15.c_iflag);
  return 1;
}

uint64_t open_ppp_loopback()
{
  looped = 1;
  if ((sub_10001A278() & 0x80000000) != 0) {
    die(1);
  }
  sub_100019FF8(ppp_sockfd, 512);
  sub_10001A418(kdebugflag);
  dword_100045294 = -1;
  return ppp_sockfd;
}

void output(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9 = a3;
  dump_packet((int)"sent", a2, a3, a4, a5, a6, a7, a8);
  unsigned int v12 = *(unsigned __int8 *)(a2 + 2);
  uint64_t v11 = (const void *)(a2 + 2);
  if (v12 <= 0xBF) {
    uint64_t v13 = &ppp_sockfd;
  }
  else {
    uint64_t v13 = &dword_100045294;
  }
  if (write(*v13, v11, v9 - 2) < 0 && *__error() != 5)
  {
    error((uint64_t)"write: %m", v14, v15, v16, v17, v18, v19, v20, a9);
  }
}

double wait_input(timeval *a1)
{
  xmmword_10004B780 = xmmword_10004B700;
  unk_10004B790 = unk_10004B710;
  xmmword_10004B7A0 = xmmword_10004B720;
  unk_10004B7B0 = unk_10004B730;
  xmmword_10004B740 = xmmword_10004B6C0;
  *(_OWORD *)algn_10004B750 = *(_OWORD *)algn_10004B6D0;
  xmmword_10004B760 = xmmword_10004B6E0;
  unk_10004B770 = unk_10004B6F0;
  if (select(dword_10004B7C0 + 1, (fd_set *)&xmmword_10004B740, 0, 0, a1) < 0)
  {
    if (*__error() != 4) {
      fatal();
    }
    double result = 0.0;
    xmmword_10004B7A0 = 0u;
    unk_10004B7B0 = 0u;
    xmmword_10004B780 = 0u;
    unk_10004B790 = 0u;
    xmmword_10004B760 = 0u;
    unk_10004B770 = 0u;
    xmmword_10004B740 = 0u;
    *(_OWORD *)algn_10004B750 = 0u;
  }
  return result;
}

uint64_t wait_input_fd(int a1, int a2)
{
  v6.tv_sec = a2 / 1000;
  *(&v6.tv_usec + 1) = 0;
  v6.tv_usec = a2 % 1000;
  memset(&v8, 0, sizeof(v8));
  if (__darwin_check_fd_set_overflow(a1, &v8, 0)) {
    *(__int32_t *)((char *)v8.fds_bits + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  }
  while (1)
  {
    uint64_t v3 = select(a1 + 1, &v8, 0, &v8, &v6);
    uint64_t v4 = v3;
    unsigned int v7 = v3;
    if ((v3 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4) {
      return v4;
    }
  }
  if (v3)
  {
    if (ioctl(a1, 0x4004667FuLL, &v7, v6.tv_sec, *(void *)&v6.tv_usec) == -1) {
      return 0xFFFFFFFFLL;
    }
    else {
      return v7;
    }
  }
  return v4;
}

uint64_t is_ready_fd(int a1)
{
  uint64_t result = __darwin_check_fd_set_overflow(a1, &xmmword_10004B740, 0);
  if (result) {
    return (*(_DWORD *)((char *)&xmmword_10004B740 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> a1) & 1;
  }
  return result;
}

uint64_t read_packet(_WORD *a1)
{
  *a1 = 1023;
  int v1 = a1 + 1;
  if (dword_100045294 < 0)
  {
    int v2 = -1;
  }
  else
  {
    int v2 = read(dword_100045294, v1, 0x5DEuLL);
    if ((v2 & 0x80000000) == 0) {
      goto LABEL_12;
    }
    if (*__error() != 35 && *__error() != 4) {
      error((uint64_t)"read from socket link: %m", v3, v4, v5, v6, v7, v8, v9, v18);
    }
  }
  if ((ifunit & 0x80000000) == 0)
  {
    int v2 = read(ppp_sockfd, v1, 0x5DEuLL);
    if (v2 < 0 && *__error() != 35 && *__error() != 4) {
      error((uint64_t)"read from socket bundle: %m", v10, v11, v12, v13, v14, v15, v16, v18);
    }
  }
LABEL_12:
  if (v2 >= 1) {
    return (v2 + 2);
  }
  else {
    return v2;
  }
}

uint64_t get_loop_output()
{
  uint64_t packet = read_packet(&inpacket_buf);
  if ((int)packet < 1) {
    return 0;
  }
  uint64_t v7 = packet;
  LODWORD(v8) = 0;
  do
  {
    if (loop_frame((uint64_t)&inpacket_buf, v7, v1, v2, v3, v4, v5, v6)) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v8;
    }
    uint64_t v7 = read_packet(&inpacket_buf);
  }
  while ((int)v7 > 0);
  return v8;
}

void tty_send_config(uint64_t a1, int a2, int a3, int a4)
{
  int v7 = a2;
  if (!hungup && (dword_100045294 & 0x80000000) == 0)
  {
    unsigned int v6 = 0;
    if (ioctl(dword_100045294, 0x80047457uLL, &v7) < 0) {
      fatal();
    }
    if (ioctl(dword_100045294, 0x4004745AuLL, &v6) < 0) {
      fatal();
    }
    unsigned int v6 = (a3 != 0) | (2 * (a4 != 0)) | v6 & 0xFFDFFFFC | ((sync_serial != 0) << 21);
    if (ioctl(dword_100045294, 0x80047459uLL, &v6) < 0) {
      fatal();
    }
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPCompressionPField, a3);
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPCompressionACField, a4);
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPTransmitACCM, v7);
  }
}

void generic_send_config(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (!hungup && (dword_100045294 & 0x80000000) == 0)
  {
    unsigned int v6 = 0;
    if (ioctl(dword_100045294, 0x4004745AuLL, &v6) < 0) {
      fatal();
    }
    unsigned int v6 = (a3 != 0) | (2 * (a4 != 0)) | v6 & 0xFFFFFFFC;
    if (ioctl(dword_100045294, 0x80047459uLL, &v6) < 0) {
      fatal();
    }
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPCompressionPField, a3);
    publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPCompressionACField, a4);
  }
}

uint64_t netif_set_mtu(uint64_t a1, int a2)
{
  long long v11 = 0u;
  long long v12 = 0u;
  __strlcpy_chk();
  LODWORD(v12) = a2;
  if (ioctl(dword_10004B6BC, 0x80206934uLL) < 0) {
    error((uint64_t)"ioctl (SIOCSIFMTU): %m", v3, v4, v5, v6, v7, v8, v9, (int)&v11);
  }
  return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPMTU, a2);
}

uint64_t netif_get_mtu()
{
  long long v8 = 0u;
  long long v9 = 0u;
  __strlcpy_chk();
  if ((ioctl(dword_10004B6BC, 0xC0206933uLL) & 0x80000000) == 0) {
    return v9;
  }
  error((uint64_t)"ioctl (SIOCGIFMTU): %m", v0, v1, v2, v3, v4, v5, v6, (int)&v8);
  return 0;
}

void ppp_hold()
{
  int v8 = 0;
  if (ioctl(dword_100045294, 0x4004745AuLL) < 0)
  {
    uint64_t v7 = "ioctl (PPPIOCGFLAGS): %m";
  }
  else
  {
    v8 |= 0x20u;
    if ((ioctl(dword_100045294, 0x80047459uLL) & 0x80000000) == 0) {
      return;
    }
    uint64_t v7 = "ioctl(PPPIOCSFLAGS): %m";
  }
  warning((uint64_t)v7, v0, v1, v2, v3, v4, v5, v6, (int)&v8);
}

void ppp_cont()
{
  int v8 = 0;
  if (ioctl(dword_100045294, 0x4004745AuLL) < 0)
  {
    uint64_t v7 = "ioctl (PPPIOCGFLAGS): %m";
  }
  else
  {
    v8 &= ~0x20u;
    if ((ioctl(dword_100045294, 0x80047459uLL) & 0x80000000) == 0) {
      return;
    }
    uint64_t v7 = "ioctl(PPPIOCSFLAGS): %m";
  }
  warning((uint64_t)v7, v0, v1, v2, v3, v4, v5, v6, (int)&v8);
}

void tty_set_xaccm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (!hungup
    && (dword_100045294 & 0x80000000) == 0
    && ioctl(dword_100045294, 0x8020744FuLL, a1) < 0
    && *__error() != 25)
  {
    warning((uint64_t)"ioctl(set extended ACCM): %m", v9, v10, v11, v12, v13, v14, v15, a9);
  }
}

uint64_t tty_recv_config(uint64_t result, int a2, uint64_t a3, int a4)
{
  int v6 = a2;
  int v7 = result;
  if (!hungup)
  {
    uint64_t result = dword_100045294;
    if ((dword_100045294 & 0x80000000) == 0)
    {
      unsigned int v5 = 0;
      if (ioctl(dword_100045294, 0x80047452uLL, &v7) < 0) {
        fatal();
      }
      if (ioctl(dword_100045294, 0x80047454uLL, &v6) < 0) {
        fatal();
      }
      if (ioctl(dword_100045294, 0x4004745AuLL, &v5) < 0) {
        fatal();
      }
      unsigned int v5 = v5 & 0xFFFFFFEF | (16 * (a4 == 0));
      if (ioctl(dword_100045294, 0x80047459uLL, &v5) < 0) {
        fatal();
      }
      publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPMRU, v7);
      return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPReceiveACCM, v6);
    }
  }
  return result;
}

uint64_t generic_recv_config(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  int v6 = result;
  if (!hungup)
  {
    uint64_t result = dword_100045294;
    if ((dword_100045294 & 0x80000000) == 0)
    {
      unsigned int v5 = 0;
      if (ioctl(dword_100045294, 0x80047452uLL, &v6) < 0) {
        fatal();
      }
      if (ioctl(dword_100045294, 0x4004745AuLL, &v5) < 0) {
        fatal();
      }
      unsigned int v5 = v5 & 0xFFFFFFEF | (16 * (a4 == 0));
      if (ioctl(dword_100045294, 0x80047459uLL, &v5) < 0) {
        fatal();
      }
      return publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPLCPMRU, v6);
    }
  }
  return result;
}

uint64_t ccp_test(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v5 = a2;
  int v6 = a3;
  int v7 = a4;
  if ((ioctl(ppp_sockfd, 0x8010744DuLL, &v5) & 0x80000000) == 0) {
    return 1;
  }
  if (*__error() == 55) {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

void ccp_flags_set(uint64_t a1, int a2, int a3)
{
  if (!hungup && (dword_100045294 & 0x80000000) == 0)
  {
    unsigned int v13 = 0;
    if (ioctl(ppp_sockfd, 0x4004745AuLL) < 0)
    {
      uint64_t v12 = "ioctl (PPPIOCGFLAGS): %m";
    }
    else
    {
      unsigned int v13 = ((a2 != 0) << 6) | ((a3 != 0) << 7) | v13 & 0xFFFFFF3F;
      if ((ioctl(ppp_sockfd, 0x80047459uLL) & 0x80000000) == 0) {
        return;
      }
      uint64_t v12 = "ioctl(PPPIOCSFLAGS): %m";
    }
    error((uint64_t)v12, v5, v6, v7, v8, v9, v10, v11, (int)&v13);
  }
}

uint64_t ccp_fatal_error()
{
  int v8 = 0;
  if ((ioctl(dword_100045294, 0x4004745AuLL) & 0x80000000) == 0) {
    return v8 & 0x800000;
  }
  error((uint64_t)"ioctl(PPPIOCGFLAGS): %m", v0, v1, v2, v3, v4, v5, v6, (int)&v8);
  return 0;
}

BOOL get_idle_time(uint64_t a1, uint64_t a2)
{
  return ioctl(ppp_sockfd, 0x4008743FuLL, a2) >= 0;
}

uint64_t get_ppp_stats(uint64_t a1, _DWORD *a2)
{
  long long v17 = 0u;
  memset(v18, 0, sizeof(v18));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  __strlcpy_chk();
  if (ioctl(dword_10004B6BC, 0xC05C697BuLL) < 0)
  {
    error((uint64_t)"Couldn't get PPP statistics: %m", v3, v4, v5, v6, v7, v8, v9, (int)&v14);
    return 0;
  }
  else
  {
    int v10 = HIDWORD(v15);
    int v11 = DWORD2(v16);
    int v12 = v17;
    *a2 = DWORD1(v15);
    a2[1] = v11;
    a2[2] = v10;
    a2[3] = v12;
    return 1;
  }
}

uint64_t sifvjcomp(uint64_t a1, int a2, int a3, int a4)
{
  unsigned int v16 = 0;
  int v17 = a4;
  long long v15 = &v16;
  if (ioctl(ppp_sockfd, 0x4004745AuLL) < 0)
  {
    long long v14 = "ioctl (PPPIOCGFLAGS): %m";
  }
  else
  {
    unsigned int v16 = (4 * (a2 != 0)) | (8 * (a3 == 0)) | v16 & 0xFFFFFFF3;
    long long v15 = &v16;
    if (ioctl(ppp_sockfd, 0x80047459uLL) < 0)
    {
      long long v14 = "ioctl(PPPIOCSFLAGS): %m";
    }
    else
    {
      if (!a2 || (long long v15 = (unsigned int *)&v17, (ioctl(ppp_sockfd, 0x80047451uLL) & 0x80000000) == 0))
      {
        publish_dictnumentry(kSCEntNetPPP, kSCPropNetPPPIPCPCompressionVJ, a2);
        return 1;
      }
      long long v14 = "ioctl(PPPIOCSMAXCID): %m";
    }
  }
  error((uint64_t)v14, v6, v7, v8, v9, v10, v11, v12, (int)v15);
  return 0;
}

uint64_t sifup()
{
  long long v9 = 0u;
  long long v10 = 0u;
  __strlcpy_chk();
  if (ioctl(dword_10004B6BC, 0xC0206911uLL) < 0)
  {
    uint64_t v8 = "ioctl (SIOCGIFFLAGS): %m";
  }
  else
  {
    LOWORD(v10) = v10 | 1;
    if ((ioctl(dword_10004B6BC, 0x80206910uLL) & 0x80000000) == 0)
    {
      uint64_t result = 1;
      byte_10004B7C4 = 1;
      return result;
    }
    uint64_t v8 = "ioctl(SIOCSIFFLAGS): %m";
  }
  error((uint64_t)v8, v0, v1, v2, v3, v4, v5, v6, (int)&v9);
  return 0;
}

uint64_t sifnpmode(uint64_t a1, int a2, int a3)
{
  v12[0] = a2;
  v12[1] = a3;
  if ((ioctl(ppp_sockfd, 0x8008744BuLL, v12) & 0x80000000) == 0) {
    return 1;
  }
  error((uint64_t)"ioctl(set NP %d mode to %d): %m", v4, v5, v6, v7, v8, v9, v10, a2);
  return 0;
}

uint64_t sifnpafmode(uint64_t a1, int a2, int a3)
{
  v12[0] = a2;
  v12[1] = a3;
  if ((ioctl(ppp_sockfd, 0x80087435uLL, v12) & 0x80000000) == 0) {
    return 1;
  }
  error((uint64_t)"ioctl(set NPAF %d mode to %d): %m", v4, v5, v6, v7, v8, v9, v10, a2);
  return 0;
}

uint64_t sifdown()
{
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v11 = 33;
  if (ioctl(ppp_sockfd, 0xC008744CuLL, &v11)) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = HIDWORD(v11) == 1;
  }
  if (v0)
  {
    LODWORD(v11) = 87;
    if (ioctl(ppp_sockfd, 0xC008744CuLL, &v11) || HIDWORD(v11) == 1)
    {
      __strlcpy_chk();
      if (ioctl(dword_10004B6BC, 0xC0206911uLL) < 0)
      {
        uint64_t v10 = "ioctl (SIOCGIFFLAGS): %m";
      }
      else
      {
        LOWORD(v13) = v13 & 0xFFFE;
        if ((ioctl(dword_10004B6BC, 0x80206910uLL) & 0x80000000) == 0)
        {
          byte_10004B7C4 = 0;
          return 1;
        }
        uint64_t v10 = "ioctl(SIOCSIFFLAGS): %m";
      }
      error((uint64_t)v10, v2, v3, v4, v5, v6, v7, v8, (int)&v12);
    }
  }
  return 0;
}

uint64_t sifroute(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  if (a4 != -1 && addifroute)
  {
    dword_10004B840 = a4 & a2;
    dword_10004B844 = a4;
    dword_10004B848 = route_interface(1, a4 & a2, a4, 23, &ifname, 0);
  }
  return 1;
}

uint64_t route_interface(int a1, int a2, int a3, char a4, const char *a5, int a6)
{
  int v30 = a3;
  int v31 = a2;
  int v11 = socket(17, 3, 17);
  if (v11 < 0)
  {
    int v17 = addr2ascii(2, &v31, 4, v33);
    addr2ascii(2, &v30, 4, v32);
    error((uint64_t)"route_interface: open routing socket failed, %m. (address %s, mask %s, interface %s, host %d).", v18, v19, v20, v21, v22, v23, v24, v17);
  }
  else
  {
    int v12 = v11;
    long long __buf = 0u;
    long long v35 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    BYTE3(__buf) = a1;
    if (a6) {
      unsigned int v13 = 2053;
    }
    else {
      unsigned int v13 = 2049;
    }
    BYTE2(__buf) = 5;
    DWORD1(v35) = 1;
    *((void *)&__buf + 1) = v13 | 0x300000000;
    WORD6(v39) = 528;
    LODWORD(v40) = a2;
    size_t v14 = strlen(a5);
    WORD6(v40) = 4628;
    if (v14 >= 0xC) {
      char v15 = 12;
    }
    else {
      char v15 = v14;
    }
    LOBYTE(v41) = a4;
    BYTE1(v41) = v15;
    __strncpy_chk();
    if (v30)
    {
      HIDWORD(__buf) |= 4u;
      LOWORD(v42) = 528;
      DWORD1(v42) = v30;
    }
    LOWORD(__buf) = 144;
    if ((write(v12, &__buf, 0x90uLL) & 0x8000000000000000) == 0)
    {
      close(v12);
      return 1;
    }
    if (a1 == 2) {
      int v25 = 7;
    }
    else {
      int v25 = 3;
    }
    uint64_t v26 = __error();
    uint64_t v27 = strerror(*v26);
    uint64_t v28 = addr2ascii(2, &v31, 4, v33);
    uint64_t v29 = addr2ascii(2, &v30, 4, v32);
    sys_log(v25, "route_interface: write routing socket failed, %s. (address %s, mask %s, interface %s, host %d).", v27, v28, v29, a5, a6);
    close(v12);
  }
  return 0;
}

uint64_t sifaddr(uint64_t a1, int a2, unsigned int a3, int a4)
{
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  if ((byte_10004B84C & 1) == 0)
  {
    __strlcpy_chk();
    if (ioctl(dword_10004B6BC, 0xC0206950uLL, &v35) < 0)
    {
      uint64_t v7 = __error();
      error((uint64_t)"Couldn't plumb IP to the interface: %d %m", v8, v9, v10, v11, v12, v13, v14, *v7);
    }
    byte_10004B84C = 1;
  }
  __strlcpy_chk();
  *((void *)&v38 + 1) = 0;
  LODWORD(v38) = 528;
  DWORD1(v38) = a2;
  *((void *)&v39 + 1) = 0;
  LODWORD(v39) = 528;
  DWORD1(v39) = a3;
  long long v40 = 0uLL;
  if (a4)
  {
    LOWORD(v40) = 528;
    DWORD1(v40) = a4;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  __strlcpy_chk();
  if (ioctl(dword_10004B6BC, 0x80206919uLL) < 0 && *__error() != 49) {
    warning((uint64_t)"Couldn't remove interface address: %m", v15, v16, v17, v18, v19, v20, v21, (int)&v35);
  }
  uint64_t v22 = ioctl(dword_10004B6BC, 0x8040691AuLL, &v37);
  if ((v22 & 0x80000000) != 0)
  {
    if (*__error() != 17)
    {
      error((uint64_t)"Couldn't set interface address: %m", v24, v25, v26, v27, v28, v29, v30, v34);
      return 0;
    }
    warning((uint64_t)"Couldn't set interface address: Address %I already exists", v24, v25, v26, v27, v28, v29, v30, a2);
  }
  dword_10004B7C8 = a2;
  dword_10004B7CC = a3;
  if (looplocal)
  {
    int v31 = ppp_sockfd;
    int v32 = sub_10001A064(ppp_sockfd);
    sub_100019FF8(v31, v32 | 0x1000000);
    uint64_t v22 = route_interface(1, a2, 0, 23, &ifname, 1);
  }
  sifroute(v22, a2, v23, a4);
  publish_stateaddr(a2, a3);
  return 1;
}

CFMutableDictionaryRef publish_stateaddr(unsigned int a1, unsigned int a2)
{
  if (!cfgCache) {
    return 0;
  }
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (result)
  {
    uint64_t v5 = result;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      uint64_t v7 = Mutable;
      CFStringRef v8 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a1, BYTE1(a1), BYTE2(a1), HIBYTE(a1));
      if (v8)
      {
        CFStringRef v9 = v8;
        CFArrayAppendValue(v7, v8);
        CFRelease(v9);
        CFDictionarySetValue(v5, kSCPropNetIPv4Addresses, v7);
      }
      CFRelease(v7);
    }
    CFMutableArrayRef v10 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
    if (v10)
    {
      uint64_t v11 = v10;
      CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a2, BYTE1(a2), BYTE2(a2), HIBYTE(a2));
      if (v12)
      {
        CFStringRef v13 = v12;
        CFArrayAppendValue(v11, v12);
        CFRelease(v13);
        CFDictionarySetValue(v5, kSCPropNetIPv4DestAddresses, v11);
      }
      CFRelease(v11);
    }
    CFStringRef v14 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a1, BYTE1(a1), BYTE2(a1), HIBYTE(a1));
    if (v14)
    {
      CFStringRef v15 = v14;
      CFDictionarySetValue(v5, kSCPropNetIPv4Router, v14);
      CFRelease(v15);
    }
    CFStringRef v16 = CFStringCreateWithFormat(0, 0, @"%s", &ifname);
    if (v16)
    {
      CFStringRef v17 = v16;
      CFDictionarySetValue(v5, kSCPropInterfaceName, v16);
      CFRelease(v17);
    }
    if (qword_10004B7D8)
    {
      CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"%s", qword_10004B7D8);
      if (v18)
      {
        CFStringRef v19 = v18;
        CFDictionarySetValue(v5, @"NetworkSignature", v18);
        CFRelease(v19);
      }
    }
    if (qword_10004B7E0) {
      CFDictionarySetValue(v5, @"ServerAddress", (const void *)qword_10004B7E0);
    }
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, kSCEntNetIPv4);
    if (NetworkServiceEntity)
    {
      CFStringRef v21 = NetworkServiceEntity;
      if (!sub_10001D218(NetworkServiceEntity, v5))
      {
        int v22 = SCError();
        SCErrorString(v22);
        warning((uint64_t)"SCDynamicStoreSetValue IP %s failed: %s\n", v23, v24, v25, v26, v27, v28, v29, (int)&ifname);
      }
      CFRelease(v21);
    }
    CFRelease(v5);
    return (CFMutableDictionaryRef)1;
  }
  return result;
}

uint64_t uifaddr(uint64_t a1, unsigned int a2, unsigned int a3, int a4)
{
  cifroute();
  if ((byte_10004B84C & 1) == 0)
  {
    error((uint64_t)"Interface should have been plumbed already", v7, v8, v9, v10, v11, v12, v13, v86);
    return 0xFFFFFFFFLL;
  }
  long long v90 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  __strlcpy_chk();
  *((void *)&v91 + 1) = 0;
  LODWORD(v91) = 528;
  DWORD1(v91) = a2;
  *((void *)&v92 + 1) = 0;
  LODWORD(v92) = 528;
  DWORD1(v92) = a3;
  long long v93 = 0uLL;
  if (a4)
  {
    LOWORD(v93) = 528;
    DWORD1(v93) = a4;
  }
  long long v88 = 0u;
  long long v89 = 0u;
  __strlcpy_chk();
  if (ioctl(dword_10004B6BC, 0x80206919uLL) < 0 && *__error() != 49) {
    warning((uint64_t)"Couldn't remove interface address: %m", v14, v15, v16, v17, v18, v19, v20, (int)&v88);
  }
  uint64_t v21 = ioctl(dword_10004B6BC, 0x8040691AuLL, &v90);
  if ((v21 & 0x80000000) != 0)
  {
    if (*__error() != 17)
    {
      error((uint64_t)"Couldn't set interface address: %m", v23, v24, v25, v26, v27, v28, v29, v87);
      return 0;
    }
    warning((uint64_t)"Couldn't set interface address: Address %I already exists", v23, v24, v25, v26, v27, v28, v29, a2);
  }
  dword_10004B7C8 = a2;
  dword_10004B7CC = a3;
  sifroute(v21, a2, v22, a4);
  if (cfgCache)
  {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, kSCEntNetIPv4);
    if (NetworkServiceEntity)
    {
      CFStringRef v31 = NetworkServiceEntity;
      if (publish_dict)
      {
        CFDictionaryRef Value = (void *)CFDictionaryGetValue((CFDictionaryRef)publish_dict, NetworkServiceEntity);
        uint64_t v33 = Value;
        if (Value)
        {
          CFRetain(Value);
LABEL_18:
          CFTypeID v35 = CFGetTypeID(v33);
          if (v35 == CFDictionaryGetTypeID())
          {
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v33);
            CFRelease(v33);
            if (MutableCopy)
            {
              CFTypeID v37 = CFGetTypeID(MutableCopy);
              if (v37 == CFDictionaryGetTypeID())
              {
                CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
                if (Mutable)
                {
                  long long v39 = Mutable;
                  CFStringRef v40 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a2, BYTE1(a2), BYTE2(a2), HIBYTE(a2), v88, v89, v90, v91, v92, v93);
                  if (v40)
                  {
                    CFStringRef v41 = v40;
                    CFArrayAppendValue(v39, v40);
                    CFRelease(v41);
                    CFDictionarySetValue(MutableCopy, kSCPropNetIPv4Addresses, v39);
                  }
                  CFRelease(v39);
                }
                CFMutableArrayRef v42 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
                if (v42)
                {
                  uint64_t v43 = v42;
                  CFStringRef v44 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a3, BYTE1(a3), BYTE2(a3), HIBYTE(a3));
                  if (v44)
                  {
                    CFStringRef v45 = v44;
                    CFArrayAppendValue(v43, v44);
                    CFRelease(v45);
                    CFDictionarySetValue(MutableCopy, kSCPropNetIPv4DestAddresses, v43);
                  }
                  CFRelease(v43);
                }
                CFStringRef v46 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a2, BYTE1(a2), BYTE2(a2), HIBYTE(a2));
                if (v46)
                {
                  CFStringRef v47 = v46;
                  CFDictionarySetValue(MutableCopy, kSCPropNetIPv4Router, v46);
                  CFRelease(v47);
                }
                CFStringRef v48 = CFStringCreateWithFormat(0, 0, @"%s", &ifname);
                if (v48)
                {
                  CFStringRef v49 = v48;
                  CFDictionarySetValue(MutableCopy, kSCPropInterfaceName, v48);
                  CFRelease(v49);
                }
                if (qword_10004B7D8)
                {
                  CFStringRef v50 = CFStringCreateWithFormat(0, 0, @"%s", qword_10004B7D8);
                  if (v50)
                  {
                    CFStringRef v51 = v50;
                    CFDictionarySetValue(MutableCopy, @"NetworkSignature", v50);
                    CFRelease(v51);
                  }
                }
                if (qword_10004B7E0) {
                  CFDictionarySetValue(MutableCopy, @"ServerAddress", (const void *)qword_10004B7E0);
                }
                if (!sub_10001D218(v31, MutableCopy))
                {
                  int v52 = SCError();
                  SCErrorString(v52);
                  warning((uint64_t)"SCDynamicStoreSetValue IP %s failed: %s\n", v53, v54, v55, v56, v57, v58, v59, (int)&ifname);
                }
              }
              else
              {
                int v78 = SCError();
                SCErrorString(v78);
                warning((uint64_t)"CFDictionaryCreateMutableCopy IP %s failed: %s\n", v79, v80, v81, v82, v83, v84, v85, (int)&ifname);
              }
              CFMutableDictionaryRef v69 = MutableCopy;
              goto LABEL_47;
            }
            int v70 = SCError();
            SCErrorString(v70);
            warning((uint64_t)"CFDictionaryCreateMutableCopy IP %s failed: %s\n", v71, v72, v73, v74, v75, v76, v77, (int)&ifname);
            goto LABEL_48;
          }
          char v60 = 0;
LABEL_42:
          int v61 = SCError();
          SCErrorString(v61);
          warning((uint64_t)"SCDynamicStoreCopyValue IP %s failed: %s\n", v62, v63, v64, v65, v66, v67, v68, (int)&ifname);
          if ((v60 & 1) == 0)
          {
            CFMutableDictionaryRef v69 = (CFMutableDictionaryRef)v33;
LABEL_47:
            CFRelease(v69);
          }
LABEL_48:
          CFRelease(v31);
          return 1;
        }
      }
      else
      {
        uint64_t v33 = (void *)SCDynamicStoreCopyValue((SCDynamicStoreRef)cfgCache, NetworkServiceEntity);
        if (v33) {
          goto LABEL_18;
        }
      }
      char v60 = 1;
      goto LABEL_42;
    }
  }
  return 1;
}

uint64_t unpublish_dict(CFStringRef entity)
{
  if (!cfgCache) {
    return 0;
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, entity);
  if (!NetworkServiceEntity) {
    return 12;
  }
  CFStringRef v2 = NetworkServiceEntity;
  if (publish_dict) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)publish_dict, NetworkServiceEntity);
  }
  BOOL v3 = SCDynamicStoreRemoveValue((SCDynamicStoreRef)cfgCache, v2) == 0;
  CFRelease(v2);
  return v3;
}

uint64_t sif6addr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = socket(30, 2, 0);
  if (v5 < 0)
  {
    error((uint64_t)"Can't create IPv6 socket: %m", v6, v7, v8, v9, v10, v11, v12, v30);
  }
  else
  {
    int v13 = v5;
    if (if_nametoindex(&ifname))
    {
      memset(v41, 0, sizeof(v41));
      __strlcpy_chk();
      CFStringRef v31 = v41;
      if (ioctl(v13, 0xC080696EuLL) < 0)
      {
        uint64_t v29 = "sif6addr: can't attach IPv6 protocol: %m";
      }
      else
      {
        long long v38 = 0u;
        uint64_t v39 = 0;
        *(_OWORD *)&v35[16] = 0u;
        long long v34 = 0u;
        *(_OWORD *)CFTypeID v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        __strlcpy_chk();
        LOWORD(v33) = 7708;
        WORD4(v33) = -32514;
        *(void *)&long long v34 = a2;
        WORD5(v33) = htons();
        WORD6(v34) = 7708;
        *(_DWORD *)&v35[4] = __PAIR32__(WORD5(v33), -32514);
        *(void *)&v35[12] = a3;
        *(_WORD *)&v35[24] = 7708;
        uint64_t v36 = -1;
        uint64_t v37 = -1;
        uint64_t v40 = -1;
        CFStringRef v31 = &v32;
        if ((ioctl(v13, 0xC0806982uLL) & 0x80000000) == 0)
        {
          close(v13);
          return 1;
        }
        uint64_t v29 = "sif6addr: can't set LL address: %m";
      }
      error((uint64_t)v29, v21, v22, v23, v24, v25, v26, v27, (int)v31);
    }
    else
    {
      error((uint64_t)"sifaddr6: no interface %s", v14, v15, v16, v17, v18, v19, v20, (int)&ifname);
    }
    close(v13);
  }
  return 0;
}

uint64_t cif6addr()
{
  int v0 = socket(30, 2, 0);
  if (v0 < 0)
  {
    error((uint64_t)"Can't create IPv6 socket: %m", v1, v2, v3, v4, v5, v6, v7, v24);
  }
  else
  {
    int v8 = v0;
    memset(v26, 0, sizeof(v26));
    memset(v25, 0, sizeof(v25));
    __strlcpy_chk();
    if ((ioctl(v8, 0xC0206951uLL, v26) & 0x80000000) == 0)
    {
      close(v8);
      return 1;
    }
    __strlcpy_chk();
    if (ioctl(v8, 0xC1206983uLL) < 0) {
      warning((uint64_t)"Can't stop LL address: %m", v10, v11, v12, v13, v14, v15, v16, (int)v25);
    }
    __strlcpy_chk();
    if (ioctl(v8, 0xC120696FuLL) < 0) {
      warning((uint64_t)"Can't detach IPv6 protocol: %m", v17, v18, v19, v20, v21, v22, v23, (int)v25);
    }
    close(v8);
  }
  return 0;
}

uint64_t ether_to_eui64(uint64_t a1)
{
  kern_return_t MatchingServices;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  kern_return_t ParentEntry;
  io_object_t v15;
  io_registry_entry_t v16;
  CFDataRef CFProperty;
  CFDataRef v18;
  UInt8 buffer[4];
  __int16 v22;
  io_iterator_t existing[2];
  CFRange v24;

  uint64_t v2 = IOServiceMatching("IOEthernetInterface");
  if (v2)
  {
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      uint64_t v4 = Mutable;
      CFDictionarySetValue(Mutable, @"IOPrimaryInterface", kCFBooleanTrue);
      CFDictionarySetValue(v2, @"IOPropertyMatch", v4);
      CFRelease(v4);
    }
  }
  *(void *)existing = 0;
  MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v2, existing);
  if (MatchingServices)
  {
    ParentEntry = MatchingServices;
LABEL_6:
    warning((uint64_t)"Can't get hardware interface address for en0 (error = %d)\n", v6, v7, v8, v9, v10, v11, v12, ParentEntry);
    return 0;
  }
  uint64_t v22 = 0;
  *(_DWORD *)buffer = 0;
  uint64_t v15 = IOIteratorNext(existing[0]);
  if (v15)
  {
    uint64_t v16 = v15;
    do
    {
      ParentEntry = IORegistryEntryGetParentEntry(v16, "IOService", &existing[1]);
      if (!ParentEntry)
      {
        CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(existing[1], @"IOMACAddress", kCFAllocatorDefault, 0);
        if (CFProperty)
        {
          uint64_t v18 = CFProperty;
          v24.location = 0;
          v24.length = 6;
          CFDataGetBytes(CFProperty, v24, buffer);
          CFRelease(v18);
        }
        IOObjectRelease(existing[1]);
      }
      IOObjectRelease(v16);
      uint64_t v16 = IOIteratorNext(existing[0]);
    }
    while (v16);
    IOObjectRelease(existing[0]);
    if (ParentEntry) {
      goto LABEL_6;
    }
  }
  else
  {
    IOObjectRelease(existing[0]);
  }
  if (*(_DWORD *)buffer == dword_10004B84D && v22 == word_10004B851) {
    return 0;
  }
  if (*(_DWORD *)buffer == dword_100045298 && v22 == word_10004529C) {
    return 0;
  }
  *(unsigned char *)a1 = buffer[0] | 2;
  *(_WORD *)(a1 + 1) = *(_WORD *)&buffer[1];
  *(_WORD *)(a1 + 3) = -257;
  *(unsigned char *)(a1 + 5) = buffer[3];
  *(_WORD *)(a1 + 6) = v22;
  return 1;
}

void ppp_create_ipv6_dummy_primary(int a1)
{
  int valuePtr = 1;
  if (noipv6override) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = cfgCache == 0;
  }
  if (!v1 && serviceidRef != 0)
  {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, kSCEntNetIPv6);
    if (NetworkServiceEntity)
    {
      CFStringRef v5 = NetworkServiceEntity;
      if (a1)
      {
        unpublish_dict(NetworkServiceEntity);
      }
      else
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (Mutable)
        {
          uint64_t v7 = Mutable;
          int v8 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
          if (v8)
          {
            uint64_t v9 = v8;
            CFArrayAppendValue(v8, @"::1");
            CFDictionarySetValue(v7, kSCPropNetIPv6Addresses, v9);
            CFRelease(v9);
          }
          CFDictionarySetValue(v7, kSCPropNetIPv6Router, @"::1");
          CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
          if (v10)
          {
            CFNumberRef v11 = v10;
            CFDictionarySetValue(v7, kSCPropNetOverridePrimary, v10);
            CFRelease(v11);
          }
          CFDictionarySetValue(v7, @"IsNULL", kCFBooleanTrue);
          CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"%s", &ifname);
          if (v12)
          {
            CFStringRef v13 = v12;
            CFDictionarySetValue(v7, kSCPropInterfaceName, v12);
            CFRelease(v13);
          }
          sub_10001D218(v5, v7);
          CFRelease(v7);
        }
      }
      CFRelease(v5);
    }
  }
}

BOOL sub_10001D218(CFStringRef key, CFPropertyListRef value)
{
  if (demand) {
    BOOL v4 = SCDynamicStoreSetValue((SCDynamicStoreRef)cfgCache, key, value) != 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!publish_dict) {
    return 0;
  }
  CFDictionarySetValue((CFMutableDictionaryRef)publish_dict, key, value);
  return v4;
}

uint64_t sifdefaultroute()
{
  byte_10004B858 = 1;
  ppp_create_ipv6_dummy_primary(0);

  return publish_dictnumentry(kSCEntNetIPv4, kSCPropNetOverridePrimary, 1);
}

uint64_t publish_dns_wins_entry(CFStringRef entity, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, const void *a7, const void *a8, void *key, void *value, int a11)
{
  if (publish_dict | cfgCache)
  {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, (CFStringRef)serviceidRef, entity);
    if (NetworkServiceEntity)
    {
      CFStringRef v19 = NetworkServiceEntity;
      if (publish_dict)
      {
        CFDictionaryRef v20 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)publish_dict, NetworkServiceEntity);
        if (v20)
        {
          CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v20);
          goto LABEL_11;
        }
      }
      else
      {
        CFDictionaryRef v20 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)cfgCache, NetworkServiceEntity);
        if (v20)
        {
          CFDictionaryRef v23 = v20;
          CFMutableDictionaryRef v24 = CFDictionaryCreateMutableCopy(0, 0, v20);
          CFRelease(v23);
          if (v24) {
            goto LABEL_12;
          }
          goto LABEL_9;
        }
      }
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(v20, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
LABEL_11:
      CFMutableDictionaryRef v24 = MutableCopy;
      if (MutableCopy)
      {
LABEL_12:
        CFTypeID v25 = CFGetTypeID(v24);
        if (v25 != CFDictionaryGetTypeID()) {
          goto LABEL_46;
        }
        if (a11 || (CFArrayRef v33 = (const __CFArray *)CFDictionaryGetValue(v24, a2)) == 0)
        {
          CFArrayRef cf = 0;
        }
        else
        {
          CFArrayRef v34 = v33;
          CFTypeID v50 = CFGetTypeID(v33);
          CFArrayRef cf = v34;
          if (v50 == CFArrayGetTypeID())
          {
            CFIndex Count = CFArrayGetCount(v34);
            uint64_t v26 = CFArrayCreateMutableCopy(0, Count + 1, v34);
LABEL_16:
            uint64_t v27 = v26;
            if (v26)
            {
              CFArrayAppendValue(v26, a3);
              if (a4) {
                CFArrayAppendValue(v27, a4);
              }
              CFDictionarySetValue(v24, a2, v27);
              CFRelease(v27);
              if (a5)
              {
                CFArrayRef v28 = cf;
                int v29 = a11;
                if (!a11) {
                  CFArrayRef v28 = (const __CFArray *)CFDictionaryGetValue(v24, a5);
                }
                if (v28 && (CFTypeID v30 = CFGetTypeID(v28), v30 == CFArrayGetTypeID()))
                {
                  CFIndex v31 = CFArrayGetCount(v28);
                  CFMutableDictionaryRef Mutable = CFArrayCreateMutableCopy(0, v31 + 1, v28);
                }
                else
                {
                  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
                }
                uint64_t v36 = Mutable;
                if (!Mutable) {
                  goto LABEL_46;
                }
                CFArrayAppendValue(Mutable, a6);
                CFDictionarySetValue(v24, a5, v36);
                CFRelease(v36);
              }
              else
              {
                CFArrayRef v28 = cf;
                int v29 = a11;
              }
              if (a7)
              {
                if (!v29) {
                  CFArrayRef v28 = (const __CFArray *)CFDictionaryGetValue(v24, a7);
                }
                if (v28 && (CFTypeID v37 = CFGetTypeID(v28), v37 == CFArrayGetTypeID()))
                {
                  CFIndex v38 = CFArrayGetCount(v28);
                  uint64_t v39 = CFArrayCreateMutableCopy(0, v38 + 1, v28);
                }
                else
                {
                  uint64_t v39 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
                }
                uint64_t v40 = v39;
                if (!v39) {
                  goto LABEL_46;
                }
                CFArrayAppendValue(v39, a8);
                CFDictionarySetValue(v24, a7, v40);
                CFRelease(v40);
              }
              if (key) {
                CFDictionarySetValue(v24, key, value);
              }
              if (sub_10001D218(v19, v24))
              {
                uint64_t v22 = 1;
LABEL_47:
                CFRelease(v19);
                goto LABEL_48;
              }
              int v41 = SCError();
              SCErrorString(v41);
              warning((uint64_t)"SCDynamicStoreSetValue DNS/WINS %s failed: %s\n", v42, v43, v44, v45, v46, v47, v48, (int)&ifname);
            }
LABEL_46:
            uint64_t v22 = 0;
            goto LABEL_47;
          }
        }
        uint64_t v26 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
        goto LABEL_16;
      }
LABEL_9:
      uint64_t v22 = 0;
      CFMutableDictionaryRef v24 = (CFMutableDictionaryRef)v19;
LABEL_48:
      CFRelease(v24);
      return v22;
    }
  }
  return 0;
}

uint64_t sifdns(unsigned int a1, unsigned int a2)
{
  uint64_t valuePtr = 100000;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  if (v4)
  {
    CFStringRef v5 = (const __CFString *)v4;
    CFStringRef v6 = CFStringCreateWithCString(0, (const char *)&unk_100032B9A, 0x8000100u);
    if (v6)
    {
      CFStringRef v7 = v6;
      notify_post("com.apple.system.dns.delay");
      unsigned int v8 = a1 & 0xFF000000 | (BYTE2(a1) << 16) | (BYTE1(a1) << 8) | a1;
      if (v8
        && (CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a1, BYTE1(a1), BYTE2(a1), HIBYTE(a1))) != 0)
      {
        CFStringRef v10 = v9;
        CFStringRef v11 = 0;
        unsigned int v12 = a2 & 0xFF000000 | (BYTE2(a2) << 16) | (BYTE1(a2) << 8) | a2;
        if (v12 && v12 != v8) {
          CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a2, BYTE1(a2), BYTE2(a2), HIBYTE(a2));
        }
        uint64_t v13 = 1;
        if (publish_dns_wins_entry(kSCEntNetDNS, kSCPropNetDNSServerAddresses, v10, v11, kSCPropNetDNSSupplementalMatchDomains, v7, kSCPropNetDNSSupplementalMatchOrders, v5, kSCPropNetDNSConfirmedServiceID, (void *)serviceidRef, 1))publish_dns_wins_entry(kSCEntNetProxies, kSCPropNetProxiesSupplementalMatchDomains, v7, 0, kSCPropNetProxiesSupplementalMatchOrders, v5, 0, {
            0,
        }
            0,
            0,
            1);
        else {
          uint64_t v13 = 0;
        }
        CFRelease(v5);
        CFRelease(v10);
        if (!v11) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v13 = 0;
        CFStringRef v11 = v5;
      }
      CFRelease(v11);
    }
    else
    {
      uint64_t v13 = 0;
      CFStringRef v7 = v5;
    }
LABEL_16:
    CFRelease(v7);
    return v13;
  }
  return 0;
}

uint64_t sifwins()
{
  return 0;
}

uint64_t sifproxyarp(uint64_t a1, int a2)
{
  xmmword_10004B85C = 0u;
  *(_OWORD *)algn_10004B86C = 0u;
  xmmword_10004B87C = 0u;
  unk_10004B88C = 0u;
  xmmword_10004B89C = 0u;
  unk_10004B8AC = 0u;
  xmmword_10004B8BC = 0u;
  unk_10004B8CC = 0u;
  xmmword_10004B8DC = 0u;
  unk_10004B8EC = 0u;
  xmmword_10004B8FC = 0u;
  unk_10004B90C = 0u;
  xmmword_10004B91C = 0u;
  unk_10004B92C = 0u;
  xmmword_10004B93C = 0u;
  unk_10004B94C = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  int v27 = 1024;
  CFArrayRef v28 = &v29;
  uint64_t v26 = &v27;
  if (ioctl(dword_10004B6BC, 0xC00C6924uLL) < 0)
  {
    error((uint64_t)"ioctl(SIOCGIFCONF): %m", v3, v4, v5, v6, v7, v8, v9, (int)&v27);
  }
  else if (v27 >= 1)
  {
    CFStringRef v10 = v28;
    CFStringRef v11 = &v28[v27];
    while (1)
    {
      if (v10[17] == 2)
      {
        int v12 = *((_DWORD *)v10 + 5);
        __strlcpy_chk();
        uint64_t v26 = (int *)&v30;
        if ((ioctl(dword_10004B6BC, 0xC0206911uLL) & 0x80000000) == 0 && (v31 & 0x9B) == 3)
        {
          uint64_t v26 = (int *)&v30;
          if ((ioctl(dword_10004B6BC, 0xC0206925uLL) & 0x80000000) == 0 && (DWORD1(v31) & (v12 ^ a2)) == 0) {
            break;
          }
        }
      }
      v10 += *((unsigned __int8 *)v10 + 16) + 16;
      if (v10 >= v11) {
        goto LABEL_12;
      }
    }
    info((uint64_t)"found interface %s for proxy arp", v3, v4, v5, v6, v7, v8, v9, (int)v10);
    for (uint64_t i = v28; i < v11; i += *((unsigned __int8 *)i + 16) + 16)
    {
      if (!strcmp(v10, i) && i[17] == 18)
      {
        __memcpy_chk();
        int v17 = socket(17, 3, 17);
        if (v17 < 0)
        {
          uint64_t v13 = "Couldn't add proxy arp entry: socket: %m";
          goto LABEL_13;
        }
        int v18 = v17;
        WORD1(xmmword_10004B85C) = 261;
        dword_10004B870 = ++dword_10004B95C;
        *((void *)&xmmword_10004B85C + 1) = 0x300004804;
        LODWORD(xmmword_10004B87C) = 4;
        word_10004B8B8 = 528;
        LODWORD(xmmword_10004B8BC) = a2;
        uint64_t v14 = 1;
        WORD5(xmmword_10004B8BC) = 1;
        LOWORD(xmmword_10004B85C) = BYTE12(xmmword_10004B8BC) + 108;
        if ((write(v17, &xmmword_10004B85C, BYTE12(xmmword_10004B8BC) + 108) & 0x8000000000000000) == 0)
        {
          close(v18);
          byte_10004B960 = 1;
          dword_10004B7D0 = a2;
          return v14;
        }
        error((uint64_t)"Couldn't add proxy arp entry: %m", v19, v20, v21, v22, v23, v24, v25, (int)v26);
        close(v18);
        return 0;
      }
    }
  }
LABEL_12:
  uint64_t v13 = "Cannot determine ethernet address for proxy ARP";
LABEL_13:
  error((uint64_t)v13, v3, v4, v5, v6, v7, v8, v9, (int)v26);
  return 0;
}

uint64_t GetMask()
{
  long long v18 = 0u;
  long long v19 = 0u;
  int v0 = ntohl();
  int v1 = v0;
  if (v0 >> 30 == 2) {
    int v2 = -65536;
  }
  else {
    int v2 = -256;
  }
  if (v0 < 0) {
    int v3 = v2;
  }
  else {
    int v3 = -16777216;
  }
  int v4 = netmask;
  uint64_t v5 = htonl() | v4;
  int v15 = 1024;
  uint64_t v16 = &v17;
  if (ioctl(dword_10004B6BC, 0xC00C6924uLL) < 0)
  {
    warning((uint64_t)"ioctl(SIOCGIFCONF): %m", v6, v7, v8, v9, v10, v11, v12, (int)&v15);
  }
  else
  {
    unint64_t v13 = (unint64_t)v16;
    do
    {
      if (*(unsigned char *)(v13 + 17) == 2 && ((ntohl() ^ v1) & v3) == 0)
      {
        __strlcpy_chk();
        if ((ioctl(dword_10004B6BC, 0xC0206911uLL, &v18) & 0x80000000) == 0
          && (v19 & 0x19) == 1
          && (ioctl(dword_10004B6BC, 0xC0206925uLL, &v18) & 0x80000000) == 0)
        {
          uint64_t v5 = DWORD1(v19) | v5;
        }
      }
      v13 += 16 + *(unsigned __int8 *)(v13 + 16);
    }
    while (v13 < (unint64_t)&v16[v15]);
  }
  return v5;
}

uint64_t have_route_to()
{
  return 0xFFFFFFFFLL;
}

uint64_t get_host_seed()
{
  return gethostid();
}

uint64_t sys_loadplugin(unsigned char *a1)
{
  if (*a1 == 47)
  {
    __strlcpy_chk();
  }
  else
  {
    __strlcpy_chk();
    __strlcat_chk();
  }
  size_t v1 = strlen(__s);
  CFURLRef v2 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)__s, v1, 1u);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  CFURLRef v3 = v2;
  int v4 = CFBundleCreate(0, v2);
  if (v4)
  {
    uint64_t v5 = v4;
    if (CFBundleLoadExecutable(v4)
      && (FunctionPointerForName = (uint64_t (*)(__CFBundle *))CFBundleGetFunctionPointerForName(v5, @"start")) != 0)
    {
      uint64_t v7 = FunctionPointerForName(v5);
    }
    else
    {
      uint64_t v7 = 0xFFFFFFFFLL;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  CFRelease(v3);
  return v7;
}

uint64_t sys_eaploadplugin(unsigned char *a1, uint64_t a2)
{
  if (*a1 == 47)
  {
    __strlcpy_chk();
  }
  else
  {
    __strlcpy_chk();
    __strlcat_chk();
  }
  size_t v3 = strlen(__s);
  CFURLRef v4 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)__s, v3, 1u);
  if (v4)
  {
    CFURLRef v5 = v4;
    CFDictionaryRef v6 = CFBundleCopyInfoDictionaryForURL(v4);
    if (v6)
    {
      CFDictionaryRef v7 = v6;
      int valuePtr = 0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(void *)(a2 + 96) = 0;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v6, @"EAPType");
      if (Value)
      {
        CFNumberRef v9 = Value;
        CFTypeID v10 = CFGetTypeID(Value);
        if (v10 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
          *(unsigned char *)(a2 + 8) = valuePtr;
        }
      }
      CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(v7, @"EAPName");
      if (v11)
      {
        CFStringRef v12 = v11;
        CFTypeID v13 = CFGetTypeID(v11);
        if (v13 == CFStringGetTypeID())
        {
          CFIndex Length = CFStringGetLength(v12);
          int v15 = (char *)malloc_type_malloc(Length + 1, 0x816B4DEFuLL);
          *(void *)(a2 + 16) = v15;
          if (v15)
          {
            uint64_t v16 = v15;
            CFIndex v17 = CFStringGetLength(v12);
            CFStringGetCString(v12, v16, v17 + 1, 0x8000100u);
          }
        }
      }
      CFRelease(v7);
      long long v18 = CFBundleCreate(0, v5);
      if (v18)
      {
        long long v19 = v18;
        if (CFBundleLoadExecutable(v18))
        {
          *(void *)(a2 + 40) = CFBundleGetFunctionPointerForName(v19, @"Init");
          *(void *)(a2 + 48) = CFBundleGetFunctionPointerForName(v19, @"Dispose");
          *(void *)(a2 + 56) = CFBundleGetFunctionPointerForName(v19, @"Process");
          *(void *)(a2 + 64) = CFBundleGetFunctionPointerForName(v19, @"Free");
          *(void *)(a2 + 72) = CFBundleGetFunctionPointerForName(v19, @"GetAttribute");
          *(void *)(a2 + 80) = CFBundleGetFunctionPointerForName(v19, @"InteractiveUI");
          *(void *)(a2 + 88) = CFBundleGetFunctionPointerForName(v19, @"PrintPacket");
          uint64_t v20 = 0;
          *(void *)(a2 + 96) = CFBundleGetFunctionPointerForName(v19, @"Identity");
          *(void *)(a2 + 32) = v19;
LABEL_19:
          CFRelease(v5);
          return v20;
        }
        CFRelease(v19);
      }
    }
    uint64_t v20 = 0xFFFFFFFFLL;
    goto LABEL_19;
  }
  return 0xFFFFFFFFLL;
}

uint64_t publish_keyentry(const __CFString *key, const void *a2, const void *a3)
{
  if (!cfgCache) {
    return 0;
  }
  if (key
    && publish_dict
    && CFDictionaryContainsKey((CFDictionaryRef)publish_dict, key)
    && (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)publish_dict, key)) != 0)
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, Value);
  }
  else
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  uint64_t v8 = MutableCopy;
  if (!MutableCopy) {
    return 0;
  }
  CFDictionarySetValue(MutableCopy, a2, a3);
  if (!sub_10001D218(key, v8))
  {
    int v9 = SCError();
    int v10 = SCErrorString(v9);
    warning((uint64_t)"publish_entry SCDSet() failed: %s\n", v11, v12, v13, v14, v15, v16, v17, v10);
  }
  CFRelease(v8);
  return 1;
}

uint64_t unpublish_keyentry(const __CFString *key, const void *a2)
{
  if (cfgCache)
  {
    if (key)
    {
      if (publish_dict)
      {
        if (CFDictionaryContainsKey((CFDictionaryRef)publish_dict, key))
        {
          CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)publish_dict, key);
          if (Value)
          {
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, Value);
            if (MutableCopy)
            {
              CFDictionaryRef v6 = MutableCopy;
              CFDictionaryRemoveValue(MutableCopy, a2);
              if (!sub_10001D218(key, v6))
              {
                int v7 = SCError();
                int v8 = SCErrorString(v7);
                warning((uint64_t)"unpublish_keyentry SCDSet() failed: %s\n", v9, v10, v11, v12, v13, v14, v15, v8);
              }
              CFRelease(v6);
            }
          }
        }
      }
    }
  }
  return 0;
}

double getabsolutetime(uint64_t a1)
{
  double result = *(double *)&timeScaleSeconds;
  if (*(double *)&timeScaleSeconds != 0.0)
  {
    uint64_t v3 = mach_absolute_time();
    double v4 = *(double *)&timeScaleSeconds * (double)v3;
    *(void *)a1 = (uint64_t)v4;
    double result = (double)(uint64_t)v4 * -1000000.0 + (double)v3 * *(double *)&timeScaleMicroSeconds;
    *(_DWORD *)(a1 + 8) = (int)result;
  }
  return result;
}

const char *sys_publish_remoteaddress(const char *result)
{
  if (result) {
    return (const char *)publish_dictstrentry(kSCEntNetPPP, kSCPropNetPPPCommRemoteAddress, result, 0x8000100u);
  }
  return result;
}

uint64_t sys_reinit()
{
  cfgCache = (uint64_t)SCDynamicStoreCreate(0, @"pppd", 0, 0);
  if (!cfgCache)
  {
    int v2 = SCError();
    SCErrorString(v2);
    fatal();
  }
  pid_t v0 = getpid();

  return publish_dictnumentry(kSCEntNetPPP, @"pid", v0);
}

uint64_t route_gateway(int a1, int a2, int a3, int a4, int a5)
{
  int v26 = a3;
  int v27 = a2;
  int v25 = a4;
  int v10 = socket(17, 3, 17);
  if (v10 < 0)
  {
    uint64_t v14 = __error();
    uint64_t v15 = strerror(*v14);
    uint64_t v16 = addr2ascii(2, &v27, 4, v42);
    uint64_t v17 = addr2ascii(2, &v26, 4, v41);
    long long v18 = addr2ascii(2, &v25, 4, v40);
    sys_log(6, "host_gateway: open routing socket failed, %s. (address %s, mask %s, gateway %s, use-gateway %d).", v15, v16, v17, v18, a5);
  }
  else
  {
    int v11 = v10;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v39 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    char v30 = a1;
    if (a5) {
      unsigned int v12 = 2051;
    }
    else {
      unsigned int v12 = 2049;
    }
    char v29 = 5;
    LODWORD(v32) = 1;
    *(void *)((char *)&v31 + 4) = v12 | 0x700000000;
    WORD4(v36) = 528;
    HIDWORD(v36) = a2;
    WORD4(v37) = 528;
    HIDWORD(v37) = a4;
    WORD4(v38) = 528;
    HIDWORD(v38) = a3;
    __int16 __buf = 140;
    if ((write(v10, &__buf, 0x8CuLL) & 0x8000000000000000) == 0)
    {
      close(v11);
      return 1;
    }
    if (a1 == 2) {
      int v19 = 7;
    }
    else {
      int v19 = 3;
    }
    uint64_t v20 = __error();
    uint64_t v21 = strerror(*v20);
    uint64_t v22 = addr2ascii(2, &v27, 4, v42);
    uint64_t v23 = addr2ascii(2, &v26, 4, v41);
    uint64_t v24 = addr2ascii(2, &v25, 4, v40);
    sys_log(v19, "host_gateway: write routing socket failed, %s. (address %s, mask %s, gateway %s, use-gateway %d).", v21, v22, v23, v24, a5);
    close(v11);
  }
  return 0;
}

uint64_t ppp_ip_probe_send(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dbglog((uint64_t)"%s: starting", a2, a3, a4, a5, a6, a7, a8, (int)"ppp_ip_probe_send");
  if (!session || !*(_DWORD *)session) {
    return 0xFFFFFFFFLL;
  }
  if_nametoindex(*(const char **)(session + 16));
  uint64_t v15 = session;
  *(_DWORD *)(session + 312) = 0;
  if (*(unsigned char *)(v15 + 253) != 2 || !*(_DWORD *)(v15 + 256))
  {
    info((uint64_t)"%s: no goog-dns address", v8, v9, v10, v11, v12, v13, v14, (int)"ppp_ip_probe_send");
    goto LABEL_8;
  }
  dbglog((uint64_t)"%s: found goog-dns address", v8, v9, v10, v11, v12, v13, v14, (int)"ppp_ip_probe_send");
  int v16 = sub_10001E878();
  *(_DWORD *)(session + 300) = v16;
  if (v16 == -1)
  {
LABEL_8:
    int v31 = 0;
    goto LABEL_9;
  }
  add_fd(v16);
  dbglog((uint64_t)"%s: sent to goog-dns over scope %d", v24, v25, v26, v27, v28, v29, v30, (int)"ppp_ip_probe_send");
  int v31 = 1;
LABEL_9:
  if (*(unsigned char *)(session + 269) != 2 || !*(_DWORD *)(session + 272))
  {
    uint64_t v56 = "%s: no peer address";
LABEL_19:
    dbglog((uint64_t)v56, v17, v18, v19, v20, v21, v22, v23, (int)"ppp_ip_probe_send");
LABEL_20:
    if (v31) {
      goto LABEL_21;
    }
    return 0xFFFFFFFFLL;
  }
  dbglog((uint64_t)"%s: found peer address", v17, v18, v19, v20, v21, v22, v23, (int)"ppp_ip_probe_send");
  int v32 = sub_10001E878();
  uint64_t v33 = session;
  *(_DWORD *)(session + 304) = v32;
  if (v32 != -1)
  {
    add_fd(v32);
    dbglog((uint64_t)"%s: sent to peer over scope %d", v34, v35, v36, v37, v38, v39, v40, (int)"ppp_ip_probe_send");
    ++v31;
    uint64_t v33 = session;
  }
  if (*(unsigned char *)(v33 + 285) != 2 || !*(_DWORD *)(v33 + 288))
  {
    uint64_t v56 = "%s: no alternate peer address";
    goto LABEL_19;
  }
  dbglog((uint64_t)"%s: found alternate peer address", v17, v18, v19, v20, v21, v22, v23, (int)"ppp_ip_probe_send");
  int v41 = sub_10001E878();
  *(_DWORD *)(session + 308) = v41;
  if (v41 == -1) {
    goto LABEL_20;
  }
  add_fd(v41);
  info((uint64_t)"%s: sent to alternate peer over scope %d", v49, v50, v51, v52, v53, v54, v55, (int)"ppp_ip_probe_send");
LABEL_21:
  dbglog((uint64_t)"%s: %d probes sent", v42, v43, v44, v45, v46, v47, v48, (int)"ppp_ip_probe_send");
  uint64_t v57 = session;
  ++*(_DWORD *)(session + 316);
  if (!*(_DWORD *)(v57 + 248))
  {
    *(_DWORD *)(v57 + 248) = 1;
    timeout((int)sub_10001E9E4);
  }
  return 0;
}

uint64_t sub_10001E878()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v3 = v2;
  uint64_t v4 = v0;
  int v9 = 0;
  int v10 = v1;
  if ((v0 & 0x80000000) != 0)
  {
    int v6 = v1;
    uint64_t v7 = socket(2, 2, 1);
    if ((v7 & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v4 = v7;
    if (v6 && setsockopt(v7, 0, 25, &v10, 4u))
    {
LABEL_3:
      close(v4);
      return 0xFFFFFFFFLL;
    }
    int v9 = 65663;
    setsockopt(v4, 0xFFFF, 4098, &v9, 4u);
  }
  v11.i32[0] = 8;
  v11.i16[3] = htons();
  v11.i16[2] = getpid();
  unsigned int v5 = vaddvq_s32((int32x4_t)vmovl_u16(v11));
  v11.i16[1] = ~(HIWORD(v5) + v5 + ((HIWORD(v5) + (unsigned __int16)v5) >> 16));
  if (sendto(v4, &v11, 8uLL, 0, v3, 0x10u) != 8) {
    goto LABEL_3;
  }
  return v4;
}

void sub_10001E9E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (session
    && *(_DWORD *)session
    && (*(int *)(session + 316) > 14 || ppp_ip_probe_send(a1, a2, a3, a4, a5, a6, a7, a8)))
  {
    error((uint64_t)"ppp_auxiliary_probe timed out", a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

uint64_t ppp_ip_probe_stop()
{
  uint64_t v0 = session;
  if (!session || !*(_DWORD *)session) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(session + 248))
  {
    *(_DWORD *)(session + 248) = 0;
    untimeout((uint64_t)sub_10001E9E4, 0);
    dbglog((uint64_t)"ppp_auxiliary_probe stopped", v1, v2, v3, v4, v5, v6, v7, v11);
    uint64_t v0 = session;
  }
  for (uint64_t i = 300; i != 312; i += 4)
  {
    int v9 = *(_DWORD *)(v0 + i);
    if (v9 >= 1)
    {
      remove_fd(v9);
      close(*(_DWORD *)(session + i));
      uint64_t v0 = session;
      *(_DWORD *)(session + i) = -1;
    }
  }
  uint64_t result = 0;
  *(void *)(v0 + 312) = 0;
  return result;
}

double ppp_session_clear(uint64_t a1)
{
  if (a1)
  {
    *(void *)(a1 + 320) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 288) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 256) = 0u;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_OWORD *)(a1 + 192) = 0u;
    *(_OWORD *)(a1 + 208) = 0u;
    *(_OWORD *)(a1 + 160) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_DWORD *)(a1 + 308) = -1;
    *(void *)(a1 + 300) = -1;
  }
  return result;
}

BOOL ppp_variable_echo_is_off()
{
  return !session || !*(_DWORD *)session || wait_underlying_interface_up == 0;
}

void ppp_variable_echo_start(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (session && *(_DWORD *)session && (wait_underlying_interface_up != 0) | byte_10004B964 & 1 && !lcp_echos_hastened)
  {
    dbglog((uint64_t)"ppp_variable_echo_start", a2, a3, a4, a5, a6, a7, a8, v8);
    lcp_echo_interval_slow = lcp_echo_interval;
    lcp_echo_interval = 1;
    lcp_echo_fails_slow = lcp_echo_fails;
    if (lcp_echo_fails >= 11) {
      lcp_echo_fails = 10;
    }
    lcp_echos_hastened = 1;
    lcp_echo_restart(0);
  }
}

void ppp_variable_echo_stop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (session && *(_DWORD *)session)
  {
    if (wait_underlying_interface_up) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = byte_10004B964 == 0;
    }
    if (!v8)
    {
      dbglog((uint64_t)"received echo-reply, ppp_variable_echo_stop!", a2, a3, a4, a5, a6, a7, a8, v9);
      wait_underlying_interface_up = 0;
      byte_10004B964 = 0;
      if (lcp_echos_hastened)
      {
        lcp_echo_interval = lcp_echo_interval_slow;
        lcp_echo_fails = lcp_echo_fails_slow;
        lcp_echos_hastened = 0;
      }
    }
  }
}

void ppp_auxiliary_probe_ip_up()
{
  byte_10004B968 = 1;
}

void ppp_auxiliary_probe_ip_down()
{
  byte_10004B968 = 0;
}

void *ppp_auxiliary_probe_init()
{
  dword_10004B96C = 0;
  dword_10004B970 = 0;
  if ((byte_10004B974 & 1) == 0)
  {
    add_notifier(&ip_up_notify, (uint64_t)ppp_auxiliary_probe_ip_up, 0);
    double result = add_notifier(&ip_down_notify, (uint64_t)ppp_auxiliary_probe_ip_down, 0);
    byte_10004B974 = 1;
  }
  return result;
}

uint64_t ppp_auxiliary_probe_stop()
{
  uint64_t result = ppp_ip_probe_stop();
  dword_10004B96C = 0;
  dword_10004B970 = 0;
  return result;
}

void ppp_auxiliary_probe_check(int a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 2)
  {
    BOOL v8 = byte_10004B968 && wait_underlying_interface_up == 0;
    if (v8 && (byte_10004B964 & 1) == 0)
    {
      int v9 = dword_10004B96C;
      if (dword_10004B96C)
      {
        ++dword_10004B96C;
        if (v9 >= 1 && dword_10004B970 != 0)
        {
          error((uint64_t)"no echo-reply, despite successful ppp_auxiliary_probe!", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v20);
          if (a2)
          {
            a2(a3);
          }
        }
      }
      else
      {
        error((uint64_t)"no echo-reply, start ppp_auxiliary_probe!", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v20);
        ppp_ip_probe_send(v12, v13, v14, v15, v16, v17, v18, v19);
        dword_10004B96C = 1;
        dword_10004B970 = 0;
      }
    }
  }
}

void ppp_process_auxiliary_probe_input()
{
  uint64_t v0 = session;
  if (session)
  {
    int v12 = 0;
    if (*(_DWORD *)session)
    {
      int v1 = 0;
      for (uint64_t i = 75; i != 78; ++i)
      {
        int v3 = *(_DWORD *)(v0 + 4 * i);
        if (v3 >= 1)
        {
          int ready = is_ready_fd(v3);
          uint64_t v0 = session;
          if (ready)
          {
            int v12 = 0;
            read(*(_DWORD *)(session + 4 * i), &v12, 1uLL);
            remove_fd(*(_DWORD *)(session + 4 * i));
            if (v12 >= 1)
            {
              ++*(_DWORD *)(session + 312);
              ++v1;
              dbglog((uint64_t)"ppp_auxiliary_probe[%d] response!", v5, v6, v7, v8, v9, v10, v11, i - 75);
            }
            close(*(_DWORD *)(session + 4 * i));
            uint64_t v0 = session;
            *(_DWORD *)(session + 4 * i) = -1;
          }
        }
      }
      if (v1)
      {
        if (*(_DWORD *)(v0 + 248))
        {
          *(_DWORD *)(v0 + 248) = 0;
          untimeout((uint64_t)sub_10001E9E4, 0);
        }
        if (dword_10004B96C) {
          ++dword_10004B970;
        }
      }
    }
  }
}

void ppp_start_public_nat_port_mapping_timer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (session && *(_DWORD *)session && !*(_DWORD *)(session + 32) && !*(_DWORD *)(session + 36))
  {
    notice((uint64_t)"starting wait-port-mapping timer for %s: %d secs", a2, a3, a4, a5, a6, a7, a8, *(void *)(session + 8));
    timeout((int)sub_10001F050);
    *(_DWORD *)(session + 36) = 1;
  }
}

void sub_10001F050()
{
  if (session)
  {
    if (*(_DWORD *)session)
    {
      if (*(_DWORD *)(session + 36))
      {
        *(_DWORD *)(session + 36) = 0;
        sys_log(3, "NAT's public interface down for more than %d secs... starting faster probe.\n", 20);
        uint64_t v0 = *(void (**)(void))(session + 240);
        if (v0)
        {
          byte_10004B964 = 1;
          v0();
        }
      }
    }
  }
}

void ppp_stop_public_nat_port_mapping_timer()
{
  if (session && *(_DWORD *)session)
  {
    if (*(_DWORD *)(session + 36))
    {
      untimeout((uint64_t)sub_10001F050, 0);
      *(_DWORD *)(session + 36) = 0;
    }
  }
}

void ppp_block_public_nat_port_mapping_timer()
{
  if (session)
  {
    if (*(_DWORD *)session)
    {
      ppp_stop_public_nat_port_mapping_timer();
      *(_DWORD *)(session + 32) = 1;
    }
  }
}

void ppp_unblock_public_nat_port_mapping_timer()
{
  if (session)
  {
    if (*(_DWORD *)session) {
      *(_DWORD *)(session + 32) = 0;
    }
  }
}

uint64_t sys_setup_security_session()
{
  if (qword_10004B978 != -1) {
    dispatch_once(&qword_10004B978, &stru_10003CB58);
  }
  if (byte_10004B975)
  {
    if (qword_10004B988 != -1) {
      dispatch_once(&qword_10004B988, &stru_10003CBC0);
    }
    if (qword_10004B980) {
      ne_session_copy_security_session_info();
    }
    return 1;
  }
  else
  {
    return setup_security_context();
  }
}

void sub_10001F2E4(id a1)
{
  byte_10004B975 = getenv("NetworkExtension") != 0;
}

intptr_t sub_10001F314(uint64_t a1, xpc_object_t object)
{
  if (object) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_retain(object);
  }
  int v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
}

void sub_10001F360(id a1)
{
  int v1 = getenv("NetworkExtension");
  if (v1)
  {
    memset(uu, 0, sizeof(uu));
    if (!uuid_parse(v1, uu)) {
      qword_10004B980 = ne_session_create();
    }
  }
}

const char *tdb_error(uint64_t a1)
{
  if (!a1) {
    return "Invalid tdb context";
  }
  uint64_t v1 = 0;
  int v2 = *(_DWORD *)(a1 + 40);
  uint64_t result = "Invalid error code";
  while (v2 != dword_10003CC20[v1])
  {
    v1 += 4;
    if (v1 == 24) {
      return result;
    }
  }
  return *(const char **)&dword_10003CC20[v1 + 2];
}

uint64_t tdb_update(_DWORD *a1, char *a2, size_t a3, const void *a4, uint64_t a5)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  int v10 = 596579247 * a3;
  if (a3)
  {
    unsigned int v11 = 0;
    uint64_t v12 = 0;
    do
    {
      v10 += a2[v12++] << (v11 % 0x18);
      v11 += 5;
    }
    while (a3 > v12);
  }
  unsigned int v13 = 1103515243 * v10 + 12345;
  sub_10001F59C((uint64_t)a1, v13 % a1[20]);
  unsigned int v14 = sub_10001F62C(a1, a2, a3, v13, (unsigned int *)&v18);
  if (!v14
    || a5 + a3 > v18
    || (unsigned int v15 = v14, sub_10001F72C((uint64_t)a1, v14 + v19 + 24, a4, a5) == -1))
  {
    uint64_t v16 = 0xFFFFFFFFLL;
  }
  else if (a5 == HIDWORD(v19))
  {
    uint64_t v16 = 0;
  }
  else
  {
    HIDWORD(v19) = a5;
    uint64_t v16 = sub_10001F72C((uint64_t)a1, v15, &v18, 0x18u);
  }
  sub_10001F7CC((uint64_t)a1, v13 % a1[20]);
  return v16;
}

uint64_t sub_10001F59C(uint64_t a1, int a2)
{
  if (a2 < -1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 80) > a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = (a2 + 1);
    int v6 = *(_DWORD *)(v4 + 4 * v5);
    if (v6)
    {
LABEL_5:
      uint64_t result = 0;
      *(_DWORD *)(v4 + 4 * v5) = v6 + 1;
      return result;
    }
    if (!sub_100020CA4((_DWORD *)a1, 4 * a2 + 1024, 1, 3, 9))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = *(_DWORD *)(v4 + 4 * v5);
      goto LABEL_5;
    }
  }
  return 0xFFFFFFFFLL;
}

void *sub_10001F62C(_DWORD *a1, const void *a2, size_t a3, unsigned int a4, unsigned int *a5)
{
  unsigned int v15 = 0;
  if (sub_1000207C4((uint64_t)a1, 4 * (a4 % a1[20]) + 44, &v15, 4u) != -1)
  {
    unsigned int v10 = v15;
    if (v15)
    {
      while (sub_10001FC68(a1, v10, a5) != -1)
      {
        if (a5[4] == a4)
        {
          size_t v11 = a5[2];
          if (a3 == v11)
          {
            uint64_t result = sub_10001F98C((uint64_t)a1, v15 + 24, v11);
            if (!result) {
              return result;
            }
            unsigned int v13 = result;
            int v14 = memcmp(a2, result, a3);
            free(v13);
            if (!v14) {
              return (void *)v15;
            }
          }
        }
        unsigned int v10 = a5[1];
        unsigned int v15 = v10;
        if (!v10) {
          return 0;
        }
      }
    }
  }
  return 0;
}

uint64_t sub_10001F72C(uint64_t a1, unsigned int a2, const void *a3, unsigned int a4)
{
  if (sub_100020EE0((_DWORD *)a1, a4 + a2)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    memcpy((void *)(v9 + a2), a3, a4);
  }
  else if (lseek(*(_DWORD *)(a1 + 16), a2, 0) != a2 || write(*(_DWORD *)(a1 + 16), a3, a4) != a4)
  {
    *(_DWORD *)(a1 + 40) = 2;
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t sub_10001F7CC(uint64_t a1, int a2)
{
  if (a2 < -1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 80) <= a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (a2 + 1);
  int v6 = *(_DWORD *)(v4 + 4 * v5);
  if (v6 == 1)
  {
    if (sub_100020CA4((_DWORD *)a1, 4 * a2 + 1024, 0, 3, 9)) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = *(_DWORD *)(v4 + 4 * v5);
  }
  else if (!v6)
  {
    *(_DWORD *)(a1 + 40) = 3;
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *(_DWORD *)(v4 + 4 * v5) = v6 - 1;
  return result;
}

void *tdb_fetch(_DWORD *a1, char *a2, size_t a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  int v6 = 596579247 * a3;
  if (a3)
  {
    unsigned int v7 = 0;
    uint64_t v8 = 0;
    do
    {
      v6 += a2[v8++] << (v7 % 0x18);
      v7 += 5;
    }
    while (a3 > v8);
  }
  unsigned int v9 = 1103515243 * v6 + 12345;
  sub_10001F59C((uint64_t)a1, v9 % a1[20]);
  unsigned int v10 = sub_10001F62C(a1, a2, a3, v9, (unsigned int *)&v13);
  if (v10) {
    size_t v11 = sub_10001F98C((uint64_t)a1, v10 + v14 + 24, HIDWORD(v14));
  }
  else {
    size_t v11 = 0;
  }
  sub_10001F7CC((uint64_t)a1, v9 % a1[20]);
  return v11;
}

void *sub_10001F98C(uint64_t a1, unsigned int a2, size_t size)
{
  unsigned int v3 = size;
  int v6 = malloc_type_malloc(size, 0x229D7296uLL);
  if (v6)
  {
    if (sub_1000207C4(a1, a2, v6, v3) == -1)
    {
      free(v6);
      return 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 40) = 4;
  }
  return v6;
}

_DWORD *tdb_exists(_DWORD *result, char *a2, size_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    memset(v11, 0, sizeof(v11));
    int v6 = 596579247 * a3;
    if (a3)
    {
      unsigned int v7 = 0;
      uint64_t v8 = 0;
      do
      {
        v6 += a2[v8++] << (v7 % 0x18);
        v7 += 5;
      }
      while (a3 > v8);
    }
    unsigned int v9 = 1103515243 * v6 + 12345;
    sub_10001F59C((uint64_t)result, v9 % result[20]);
    unsigned int v10 = sub_10001F62C(v5, a2, a3, v9, (unsigned int *)v11);
    sub_10001F7CC((uint64_t)v5, v9 % v5[20]);
    return (_DWORD *)(v10 != 0);
  }
  return result;
}

uint64_t tdb_traverse(_DWORD *a1, unsigned int (*a2)(_DWORD *, char *, void, char *, void, uint64_t), uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a1[20]) {
    return 0;
  }
  unsigned int v6 = 0;
  uint64_t v7 = 0;
  unsigned int v15 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  while (1)
  {
    sub_10001F59C((uint64_t)a1, v6);
    if (sub_1000207C4((uint64_t)a1, 4 * (v6 % a1[20]) + 44, &v15, 4u) == -1) {
      break;
    }
    unsigned int v8 = v15;
    if (v15)
    {
      while (sub_10001FC68(a1, v8, (unsigned int *)&v12) != -1)
      {
        unsigned int v9 = (char *)sub_10001F98C((uint64_t)a1, v15 + 24, (HIDWORD(v13) + v13));
        if (!v9) {
          break;
        }
        unsigned int v10 = v9;
        uint64_t v7 = (v7 + 1);
        if (a2 && a2(a1, v9, v13, &v9[v13], HIDWORD(v13), a3))
        {
          free(v10);
          goto LABEL_17;
        }
        free(v10);
        unsigned int v8 = HIDWORD(v12);
        unsigned int v15 = HIDWORD(v12);
        if (!HIDWORD(v12)) {
          goto LABEL_11;
        }
      }
      break;
    }
LABEL_11:
    sub_10001F7CC((uint64_t)a1, v6 % a1[20]);
    if (++v6 >= a1[20]) {
      return v7;
    }
  }
  uint64_t v7 = 0xFFFFFFFFLL;
LABEL_17:
  sub_10001F7CC((uint64_t)a1, v6 % a1[20]);
  return v7;
}

uint64_t sub_10001FC68(_DWORD *a1, unsigned int a2, unsigned int *a3)
{
  uint64_t result = sub_1000207C4((uint64_t)a1, a2, a3, 0x18u);
  if (result != -1)
  {
    if (a3[5] == 637606297)
    {
      if (sub_100020EE0(a1, a3[1])) {
        return 0xFFFFFFFFLL;
      }
      else {
        return 0;
      }
    }
    else
    {
      a1[10] = 1;
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

void *tdb_firstkey(_DWORD *a1)
{
  if (a1)
  {
    unsigned int v10 = 0;
    if (a1[20])
    {
      unsigned int v2 = 0;
      uint64_t v7 = 0;
      size_t size = 0;
      unsigned int v3 = 44;
      uint64_t v9 = 0;
      while (1)
      {
        sub_10001F59C((uint64_t)a1, v2);
        if (sub_1000207C4((uint64_t)a1, v3, &v10, 4u) == -1) {
          break;
        }
        unsigned int v4 = v10;
        if (v10) {
          goto LABEL_8;
        }
        sub_10001F7CC((uint64_t)a1, v2 % a1[20]);
        ++v2;
        v3 += 4;
        if (v2 >= a1[20])
        {
          unsigned int v4 = v10;
          if (!v10) {
            return 0;
          }
LABEL_8:
          if (sub_10001FC68(a1, v4, (unsigned int *)&v7) != -1)
          {
            uint64_t v5 = sub_10001F98C((uint64_t)a1, v10 + 24, size);
            sub_10001F7CC((uint64_t)a1, v2 % a1[20]);
            return v5;
          }
          break;
        }
      }
      sub_10001F7CC((uint64_t)a1, v2 % a1[20]);
    }
  }
  return 0;
}

void *tdb_nextkey(_DWORD *a1, char *a2, size_t a3)
{
  if (a1)
  {
    uint64_t v15 = 0;
    size_t size = 0;
    uint64_t v17 = 0;
    int v6 = 596579247 * a3;
    if (a3)
    {
      unsigned int v7 = 0;
      uint64_t v8 = 0;
      do
      {
        v6 += a2[v8++] << (v7 % 0x18);
        v7 += 5;
      }
      while (a3 > v8);
    }
    unsigned int v9 = 1103515243 * v6 + 12345;
    unsigned int v10 = v9 % a1[20];
    sub_10001F59C((uint64_t)a1, v10);
    unsigned int v18 = sub_10001F62C(a1, a2, a3, v9, (unsigned int *)&v15);
    if (v18) {
      unsigned int v18 = HIDWORD(v15);
    }
    while (!v18)
    {
      sub_10001F7CC((uint64_t)a1, v10++);
      unsigned int v11 = a1[20];
      if (v10 >= v11 - 1) {
        return 0;
      }
      unsigned int v12 = 4 * (v10 % v11) + 44;
      sub_10001F59C((uint64_t)a1, v10);
      if (sub_1000207C4((uint64_t)a1, v12, &v18, 4u) == -1) {
        goto LABEL_13;
      }
    }
    if (sub_10001FC68(a1, v18, (unsigned int *)&v15) != -1)
    {
      uint64_t v13 = sub_10001F98C((uint64_t)a1, v18 + 24, size);
      sub_10001F7CC((uint64_t)a1, v10);
      return v13;
    }
LABEL_13:
    sub_10001F7CC((uint64_t)a1, v10);
  }
  return 0;
}

uint64_t tdb_delete(_DWORD *a1, char *a2, size_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v25 = 0;
  size[1] = 0;
  uint64_t v24 = 0;
  size[0] = 0;
  uint64_t v22 = 0;
  int v6 = 596579247 * a3;
  long long v21 = 0uLL;
  if (a3)
  {
    unsigned int v7 = 0;
    uint64_t v8 = 0;
    do
    {
      v6 += a2[v8++] << (v7 % 0x18);
      v7 += 5;
    }
    while (a3 > v8);
  }
  unsigned int v9 = 1103515243 * v6 + 12345;
  sub_10001F59C((uint64_t)a1, v9 % a1[20]);
  if (sub_1000207C4((uint64_t)a1, 4 * (v9 % a1[20]) + 44, &v25, 4u) != -1)
  {
    unsigned int v10 = v25;
    if (v25)
    {
      unsigned int v11 = 0;
      while (sub_10001FC68(a1, v10, (unsigned int *)size) != -1)
      {
        if (v9 == v24 && a3 == LODWORD(size[1]))
        {
          unsigned int v12 = sub_10001F98C((uint64_t)a1, v25 + 24, LODWORD(size[1]));
          if (!v12) {
            break;
          }
          uint64_t v13 = v12;
          if (!memcmp(a2, v12, a3))
          {
            if (v11)
            {
              DWORD1(v21) = HIDWORD(size[0]);
              uint64_t v17 = (char *)&v21;
              uint64_t v18 = (uint64_t)a1;
              unsigned int v19 = v11;
              unsigned int v20 = 24;
            }
            else
            {
              unsigned int v19 = 4 * (v9 % a1[20]) + 44;
              uint64_t v18 = (uint64_t)a1;
              uint64_t v17 = (char *)size + 4;
              unsigned int v20 = 4;
            }
            if (sub_10001F72C(v18, v19, v17, v20) == -1)
            {
              free(v13);
              break;
            }
            sub_10001F7CC((uint64_t)a1, v9 % a1[20]);
            sub_10001F59C((uint64_t)a1, -1);
            if (sub_1000207C4((uint64_t)a1, 0x28u, (char *)size + 4, 4u) != -1)
            {
              HIDWORD(v24) = -637606298;
              if (sub_10001F72C((uint64_t)a1, v25, size, 0x18u) != -1
                && sub_10001F72C((uint64_t)a1, 0x28u, &v25, 4u) != -1)
              {
                free(v13);
                uint64_t v15 = 0;
                int v14 = -1;
                goto LABEL_17;
              }
            }
            free(v13);
            int v14 = -1;
            goto LABEL_16;
          }
          free(v13);
        }
        unsigned int v11 = v25;
        long long v21 = *(_OWORD *)size;
        uint64_t v22 = v24;
        unsigned int v10 = HIDWORD(size[0]);
        unsigned int v25 = HIDWORD(size[0]);
        if (!HIDWORD(size[0])) {
          break;
        }
      }
    }
  }
  int v14 = v9 % a1[20];
LABEL_16:
  uint64_t v15 = 0xFFFFFFFFLL;
LABEL_17:
  sub_10001F7CC((uint64_t)a1, v14);
  return v15;
}

uint64_t tdb_store(uint64_t a1, char *a2, unint64_t a3, const void *a4, size_t a5, int a6)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  long long v42 = 0uLL;
  uint64_t v43 = 0;
  int v12 = 596579247 * a3;
  if (a3)
  {
    unsigned int v13 = 0;
    uint64_t v14 = 0;
    do
    {
      v12 += a2[v14++] << (v13 % 0x18);
      v13 += 5;
    }
    while (a3 > v14);
  }
  if (a6 == 2)
  {
    if (tdb_exists((_DWORD *)a1, a2, a3))
    {
      *(_DWORD *)(a1 + 40) = 5;
      return 0xFFFFFFFFLL;
    }
  }
  else if (!tdb_update((_DWORD *)a1, a2, a3, a4, a5))
  {
    return 0;
  }
  unsigned int v50 = 0;
  long long v48 = 0uLL;
  uint64_t v49 = 0;
  long long v46 = 0uLL;
  uint64_t v47 = 0;
  v44[0] = 0;
  v44[1] = 0;
  uint64_t v45 = 0;
  sub_10001F59C(a1, -1);
  if (sub_1000207C4(a1, 0x28u, &v50, 4u) != -1)
  {
    unsigned int v41 = 1103515243 * v12 + 12345;
    size_t v16 = a5 + a3;
    while (1)
    {
      unsigned int v17 = v50;
      if (v50) {
        break;
      }
LABEL_21:
      v53[0] = 0;
      v53[1] = 0;
      uint64_t v54 = 0;
      int v52 = 0;
      char __buf = 0;
      sub_10001F59C(a1, -1);
      sub_100020EE0((_DWORD *)a1, *(_DWORD *)(a1 + 20) + 1);
      int v20 = *(_DWORD *)(a1 + 16);
      int v21 = *(_DWORD *)(a1 + 20);
      int v22 = 10 * (a5 + a3) + 240 + v21;
      if (v20 != -1)
      {
        lseek(v20, v22 | 0x1FFFu, 0);
        if (write(*(_DWORD *)(a1 + 16), &__buf, 1uLL) != 1) {
          goto LABEL_35;
        }
      }
      int v23 = (v22 & 0xFFFFE000) - v21;
      LODWORD(v53[0]) = v23 + 8168;
      HIDWORD(v54) = -637606298;
      if (sub_1000207C4(a1, 0x28u, (char *)v53 + 4, 4u) == -1) {
        goto LABEL_35;
      }
      int v24 = v23 + 0x2000;
      int v25 = *(_DWORD *)(a1 + 16);
      size_t v26 = (*(_DWORD *)(a1 + 20) + v23 + 0x2000);
      *(_DWORD *)(a1 + 20) = v26;
      if (v25 == -1)
      {
        *(void *)(a1 + 8) = malloc_type_realloc(*(void **)(a1 + 8), v26, 0xF2C7ABuLL);
        LODWORD(v26) = *(_DWORD *)(a1 + 20);
      }
      if (sub_10001F72C(a1, (int)v26 - v24, v53, 0x18u) == -1
        || (int v52 = *(_DWORD *)(a1 + 20) - v24, sub_10001F72C(a1, 0x28u, &v52, 4u) == -1))
      {
LABEL_35:
        sub_10001F7CC(a1, -1);
        goto LABEL_49;
      }
      sub_10001F7CC(a1, -1);
      if (sub_1000207C4(a1, 0x28u, &v50, 4u) == -1) {
        goto LABEL_49;
      }
    }
    unsigned int v18 = 0;
    while (sub_1000207C4(a1, v17, &v48, 0x18u) != -1 && HIDWORD(v49) == -637606298)
    {
      if (v48 >= v16)
      {
        if ((unint64_t)(a5 + a3) + 52 < v48)
        {
          LODWORD(v44[0]) = v48 - (v16 & 0xFFFFFFFC) - 28;
          HIDWORD(v44[0]) = DWORD1(v48);
          HIDWORD(v45) = -637606298;
          LODWORD(v48) = (v16 & 0xFFFFFFFC) + 4;
          DWORD1(v48) = (v16 & 0xFFFFFFFC) + v50 + 28;
          if (sub_10001F72C(a1, DWORD1(v48), v44, 0x18u) == -1
            || sub_10001F72C(a1, v50, &v48, 0x18u) == -1)
          {
            break;
          }
        }
        if (v18)
        {
          DWORD1(v46) = DWORD1(v48);
          uint64_t v27 = (char *)&v46;
          uint64_t v28 = a1;
          unsigned int v29 = v18;
          unsigned int v30 = 24;
        }
        else
        {
          uint64_t v28 = a1;
          unsigned int v29 = 40;
          uint64_t v27 = (char *)&v48 + 4;
          unsigned int v30 = 4;
        }
        if (sub_10001F72C(v28, v29, v27, v30) == -1) {
          break;
        }
        uint64_t v15 = 0xFFFFFFFFLL;
        sub_10001F7CC(a1, -1);
        unsigned int v31 = v50;
        LODWORD(v53[0]) = v50;
        if (!v50) {
          return v15;
        }
        sub_10001F59C(a1, v41 % *(_DWORD *)(a1 + 80));
        if (a6 != 2) {
          tdb_delete((_DWORD *)a1, a2, a3);
        }
        if (sub_1000207C4(a1, v31, &v42, 0x18u) != -1 && HIDWORD(v43) == -637606298)
        {
          unsigned int v32 = 4 * (v41 % *(_DWORD *)(a1 + 80)) + 44;
          if (sub_1000207C4(a1, v32, (char *)&v42 + 4, 4u) != -1)
          {
            *((void *)&v42 + 1) = __PAIR64__(a5, a3);
            LODWORD(v43) = 1103515243 * v12 + 12345;
            HIDWORD(v43) = 637606297;
            unsigned int v33 = v16 + 24;
            uint64_t v34 = (char *)malloc_type_malloc(v16 + 24, 0x69B34AF8uLL);
            if (v34)
            {
              uint64_t v35 = v34;
              long long v36 = v42;
              *((void *)v34 + 2) = v43;
              *(_OWORD *)uint64_t v34 = v36;
              unsigned int v37 = v32;
              uint64_t v38 = v34 + 24;
              memcpy(v34 + 24, a2, a3);
              memcpy(&v38[a3], a4, a5);
              int v39 = sub_10001F72C(a1, v31, v35, v33);
              free(v35);
              if (v39 != -1 && sub_10001F72C(a1, v37, v53, 4u) != -1)
              {
                sub_10001F7CC(a1, v41 % *(_DWORD *)(a1 + 80));
                return 0;
              }
            }
            else
            {
              *(_DWORD *)(a1 + 40) = 4;
            }
          }
        }
        sub_10001F7CC(a1, v41 % *(_DWORD *)(a1 + 80));
        return 0xFFFFFFFFLL;
      }
      long long v46 = v48;
      uint64_t v47 = v49;
      unsigned int v18 = v50;
      unsigned int v17 = DWORD1(v48);
      unsigned int v50 = DWORD1(v48);
      if (!DWORD1(v48)) {
        goto LABEL_21;
      }
    }
  }
LABEL_49:
  uint64_t v15 = 0xFFFFFFFFLL;
  sub_10001F7CC(a1, -1);
  return v15;
}

uint64_t sub_1000207C4(uint64_t a1, unsigned int a2, void *a3, unsigned int a4)
{
  if (sub_100020EE0((_DWORD *)a1, a4 + a2)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    memcpy(a3, (const void *)(v9 + a2), a4);
  }
  else if (lseek(*(_DWORD *)(a1 + 16), a2, 0) != a2 || read(*(_DWORD *)(a1 + 16), a3, a4) != a4)
  {
    *(_DWORD *)(a1 + 40) = 2;
    return 0xFFFFFFFFLL;
  }
  return 0;
}

_OWORD *tdb_open(char *a1, int a2, char a3, __int16 a4, unsigned int a5)
{
  memset(&v22, 0, sizeof(v22));
  long long __fd = 0u;
  memset(v25, 0, sizeof(v25));
  LODWORD(__fd) = -1;
  long long v23 = 0uLL;
  if ((a4 & 3) != 1)
  {
    if (a2) {
      int v8 = a2;
    }
    else {
      int v8 = 128;
    }
    DWORD2(__fd) = (a4 & 3) == 0;
    if (a1)
    {
      int v9 = open(a1, a4, a5);
      LODWORD(__fd) = v9;
      if (v9 == -1) {
        goto LABEL_41;
      }
      fcntl(v9, 2, 1);
    }
    sub_100020CA4(&v23, 0, 1, 3, 9);
    if ((a3 & 1) != 0 && !sub_100020CA4(&v23, 4u, 1, 3, 8))
    {
      ftruncate(__fd, 0);
      sub_100020CA4(&v23, 4u, 0, 3, 8);
    }
    sub_100020CA4(&v23, 4u, 1, 1, 9);
    if (read(__fd, &v25[12], 0x28uLL) == 40
      && !(*(void *)&v25[12] ^ 0x656C696620424454 | *(unsigned __int16 *)&v25[20] ^ 0xALL)
      && *(_DWORD *)&v25[44] == 637606248)
    {
      goto LABEL_14;
    }
    if ((a4 & 0x200) == 0)
    {
LABEL_41:
      if ((void)v23) {
        free((void *)v23);
      }
      goto LABEL_43;
    }
    memset(&__buf[10], 0, 22);
    strcpy(__buf, "TDB file\n");
    LODWORD(v28) = 637606248;
    HIDWORD(v28) = v8;
    lseek(__fd, 0, 0);
    ftruncate(__fd, 0);
    if (__fd == -1 || write(__fd, __buf, 0x28uLL) == 40)
    {
      memset(v26, 0, sizeof(v26));
      if (v8 >= 15)
      {
        int v10 = 0;
        int v11 = 40;
        while (__fd == -1 || write(__fd, v26, 0x40uLL) == 64)
        {
          v11 += 64;
          v10 -= 16;
          if (v8 + 16 + v10 <= 30)
          {
            int v12 = -v10;
            goto LABEL_26;
          }
        }
        goto LABEL_40;
      }
      int v12 = 0;
      int v11 = 40;
LABEL_26:
      if (v12 <= v8)
      {
        int v13 = v8 - v12 + 1;
        while (__fd == -1 || write(__fd, v26, 4uLL) == 4)
        {
          v11 += 4;
          if (!--v13) {
            goto LABEL_31;
          }
        }
        goto LABEL_40;
      }
LABEL_31:
      int v14 = __fd;
      if (__fd != -1) {
        goto LABEL_34;
      }
      *((void *)&v23 + 1) = malloc_type_calloc(v11, 1uLL, 0xF41A3DF4uLL);
      DWORD1(__fd) = v11;
      if (*((void *)&v23 + 1))
      {
        *(_OWORD *)&v25[12] = *(_OWORD *)__buf;
        *(_OWORD *)&v25[28] = *(_OWORD *)&__buf[16];
        *(void *)&v25[44] = v28;
        int v14 = __fd;
LABEL_34:
        lseek(v14, 0, 0);
        if (__fd == -1) {
          goto LABEL_37;
        }
        if (read(__fd, &v25[12], 0x28uLL) == 40)
        {
LABEL_14:
          if (__fd != -1)
          {
            fstat(__fd, &v22);
            *(void *)&long long v23 = strdup(a1);
            DWORD1(__fd) = v22.st_size;
          }
LABEL_37:
          *(void *)int v25 = malloc_type_calloc((*(_DWORD *)&v25[48] + 1), 4uLL, 0x100004052888210uLL);
          if (*(void *)v25)
          {
            uint64_t v15 = malloc_type_malloc(0x58uLL, 0x10900406C209894uLL);
            if (v15)
            {
              size_t v16 = v15;
              long long v17 = __fd;
              *uint64_t v15 = v23;
              v15[1] = v17;
              long long v18 = *(_OWORD *)v25;
              long long v19 = *(_OWORD *)&v25[16];
              long long v20 = *(_OWORD *)&v25[32];
              *((void *)v15 + 10) = *(void *)&v25[48];
              v15[3] = v19;
              v15[4] = v20;
              v15[2] = v18;
              sub_100020CA4(&v23, 0, 0, 3, 9);
              return v16;
            }
          }
          goto LABEL_41;
        }
        goto LABEL_41;
      }
    }
LABEL_40:
    *(_DWORD *)&v25[8] = 2;
    goto LABEL_41;
  }
LABEL_43:
  if (__fd != -1) {
    close(__fd);
  }
  if (*((void *)&v23 + 1)) {
    munmap(*((void **)&v23 + 1), DWORD1(__fd));
  }
  return 0;
}

uint64_t sub_100020CA4(_DWORD *a1, unsigned int a2, int a3, __int16 a4, int a5)
{
  int v6 = a1[4];
  if (v6 == -1) {
    return 0;
  }
  if (a1[6]) {
    return 0xFFFFFFFFLL;
  }
  if (a3 != 1) {
    a4 = 2;
  }
  __int16 v11 = a4;
  __int16 v12 = 0;
  v9[0] = a2;
  v9[1] = 1;
  int v10 = 0;
  uint64_t result = fcntl(v6, a5, v9);
  if (result)
  {
    a1[10] = 3;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t tdb_close(unsigned int *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v2 = *(void **)a1;
  if (v2) {
    free(v2);
  }
  int v3 = a1[4];
  if (v3 != -1) {
    close(v3);
  }
  unsigned int v4 = (void *)*((void *)a1 + 4);
  if (v4) {
    free(v4);
  }
  uint64_t v5 = (void *)*((void *)a1 + 1);
  if (v5)
  {
    if (a1[4] == -1) {
      free(v5);
    }
    else {
      munmap(v5, a1[5]);
    }
  }
  *((void *)a1 + 10) = 0;
  *((_OWORD *)a1 + 3) = 0u;
  *((_OWORD *)a1 + 4) = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  *((_OWORD *)a1 + 2) = 0u;
  *(_OWORD *)a1 = 0u;
  free(a1);
  return 0;
}

uint64_t tdb_writelock(uint64_t a1)
{
  if (a1) {
    return sub_10001F59C(a1, -1);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t tdb_writeunlock(uint64_t a1)
{
  if (a1) {
    return sub_10001F7CC(a1, -1);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t tdb_lockchain(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int v3 = 596579247 * a3;
  if (a3)
  {
    unsigned int v4 = 0;
    uint64_t v5 = 0;
    do
    {
      v3 += *(char *)(a2 + v5++) << (v4 % 0x18);
      v4 += 5;
    }
    while (a3 > v5);
  }
  return sub_10001F59C(a1, (1103515243 * v3 + 12345) % *(_DWORD *)(a1 + 80));
}

uint64_t tdb_unlockchain(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int v3 = 596579247 * a3;
  if (a3)
  {
    unsigned int v4 = 0;
    uint64_t v5 = 0;
    do
    {
      v3 += *(char *)(a2 + v5++) << (v4 % 0x18);
      v4 += 5;
    }
    while (a3 > v5);
  }
  return sub_10001F7CC(a1, (1103515243 * v3 + 12345) % *(_DWORD *)(a1 + 80));
}

uint64_t sub_100020EE0(_DWORD *a1, unsigned int a2)
{
  if (a1[5] >= a2) {
    return 0;
  }
  int v3 = a1[4];
  if (v3 == -1) {
    return 0;
  }
  memset(&v6, 0, sizeof(v6));
  fstat(v3, &v6);
  if (v6.st_size <= a2)
  {
    a1[10] = 2;
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t result = 0;
    a1[5] = v6.st_size;
  }
  return result;
}

BOOL sub_100020F70(char *__s2, uint64_t a2, int a3)
{
  if (!*__s2) {
    return 0;
  }
  unsigned int v4 = __s2;
  memset(&v13, 0, sizeof(v13));
  if (strncmp("/dev/", __s2, 5uLL))
  {
    __strlcpy_chk();
    __strlcat_chk();
    unsigned int v4 = &v14;
  }
  if (stat(v4, &v13) < 0)
  {
    if (!a3) {
      return *__error() != 2;
    }
    option_error("Couldn't stat %s: %m", v5, v6, v7, v8, v9, v10, v11, (int)v4);
    return 0;
  }
  if ((v13.st_mode & 0xF000) != 0x2000)
  {
    if (a3) {
      option_error("%s is not a character device", v5, v6, v7, v8, v9, v10, v11, (int)v4);
    }
    return 0;
  }
  if (a3)
  {
    __strlcpy_chk();
    *(stat *)devstat = v13;
    default_device = 0;
  }
  return 1;
}

uint64_t sub_1000210F8(const char *a1, uint64_t a2, int a3)
{
  __endptr = 0;
  int v5 = strtol(a1, &__endptr, 0);
  if (__endptr == a1) {
    return 0;
  }
  if (*__endptr || v5 == 0) {
    return 0;
  }
  if (a3)
  {
    inspeed = v5;
    slprintf((int)&unk_10004B994, 16, "%d");
  }
  return 1;
}

uint64_t sub_100021188()
{
  connect_script = 0;
  initializer = 0;
  disconnect_script = 0;
  default_device = 1;
  LOBYTE(devnam) = 0;
  inspeed = 0;
  return 1;
}

uint64_t sub_1000211CC()
{
  dword_10004792C |= 0xA0000u;
  byte_100047914 = 1;
  crtscts = -2;
  return 1;
}

uint64_t sub_100021200(const char **a1)
{
  uint64_t i = *a1;
  if (**a1)
  {
    __endptr = 0;
    uint64_t v2 = 1;
    while (1)
    {
      unsigned int v3 = strtol(i, &__endptr, 16);
      uint64_t v11 = __endptr;
      if (i == __endptr) {
        break;
      }
      if (v3 > 0xFF || v3 == 94)
      {
        option_error("can't escape character 0x%x", v4, v5, v6, v7, v8, v9, v10, v3);
        uint64_t v2 = 0;
      }
      else
      {
        xmit_accm[v3 >> 5] |= 1 << v3;
      }
      for (uint64_t i = v11; ; ++i)
      {
        int v12 = *(unsigned __int8 *)i;
        if (v12 != 32 && v12 != 44) {
          break;
        }
      }
      if (!*i) {
        goto LABEL_15;
      }
    }
    option_error("escape parameter contains invalid hex number '%s'", v4, v5, v6, v7, v8, v9, v10, (int)i);
    return 0;
  }
  else
  {
    uint64_t v2 = 1;
LABEL_15:
    dword_1000479B4 = xmit_accm[0];
  }
  return v2;
}

void sub_10002130C(uint64_t a1, void (*a2)(uint64_t, const char *, ...), uint64_t a3)
{
  char v4 = 0;
  int v5 = 0;
  do
  {
    while (1)
    {
      int v6 = v5 == 125 ? 127 : v5;
      if (((xmit_accm[v6 >> 5] >> v6) & 1) == 0) {
        break;
      }
      if (v4) {
        a2(a3, ",");
      }
      a2(a3, "%x", v6);
      int v5 = v6 + 1;
      char v4 = 1;
      if (v6 >= 255) {
        return;
      }
    }
    int v5 = v6 + 1;
  }
  while (v6 < 255);
  if ((v4 & 1) == 0)
  {
    a2(a3, "oops # nothing escaped");
  }
}

void tty_process_extra_options()
{
  if (notty) {
    BOOL v0 = 0;
  }
  else {
    BOOL v0 = ptycommand == 0;
  }
  if (!v0)
  {
    using_pty = 1;
    return;
  }
  using_pty = pty_socket != 0;
  if (!pty_socket)
  {
    if (default_device)
    {
      if (!isatty(0) || !ttyname(0))
      {
        option_error("no device specified and stdin is not a tty", v1, v2, v3, v4, v5, v6, v7, v8);
        goto LABEL_14;
      }
      __strlcpy_chk();
      if (stat((const char *)&devnam, (stat *)devstat) < 0) {
        fatal();
      }
    }
    if (options_for_tty()) {
      return;
    }
LABEL_14:
    exit(2);
  }
}

uint64_t tty_check_options(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (demand) {
    BOOL v8 = connect_script == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 && ptycommand == 0)
  {
    uint64_t v15 = "connect script is required for demand-dialling\n";
    goto LABEL_50;
  }
  if (connect_script) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = holdoff_specified == 0;
  }
  if (v10) {
    holdoff = 0;
  }
  memset(&v18, 0, sizeof(v18));
  if (using_pty)
  {
    if (!default_device)
    {
      if (notty) {
        size_t v16 = "notty";
      }
      else {
        size_t v16 = "pty";
      }
      option_error("%s option precludes specifying device name", a2, a3, a4, a5, a6, a7, a8, (int)v16);
LABEL_51:
      exit(2);
    }
    if (ptycommand && notty)
    {
      uint64_t v15 = "pty option is incompatible with notty option";
    }
    else
    {
      if (ptycommand) {
        BOOL v11 = 0;
      }
      else {
        BOOL v11 = notty == 0;
      }
      int v12 = !v11;
      if (!pty_socket || !v12)
      {
        default_device = notty;
        lockflag = 0;
        modem = 0;
        if (notty && log_to_fd <= 1) {
          log_to_fd = -1;
        }
        goto LABEL_35;
      }
      uint64_t v15 = "socket option is incompatible with pty and notty";
    }
LABEL_50:
    option_error(v15, a2, a3, a4, a5, a6, a7, a8, v17);
    goto LABEL_51;
  }
  if ((fstat(0, &v18) & 0x80000000) == 0 && (v18.st_mode & 0xF000) == 0x2000 && v18.st_rdev == *(_DWORD *)&devstat[24])
  {
    default_device = 1;
    int v13 = fcntl(0, 3);
    if (v13 != -1 && (v13 & 3) == 2) {
      privopen = 1;
    }
  }
LABEL_35:
  if (default_device) {
    nodetach = 1;
  }
  uint64_t result = log_to_fd;
  if ((log_to_fd & 0x80000000) == 0)
  {
    uint64_t result = fstat(log_to_fd, &v18);
    if ((result & 0x80000000) == 0 && (v18.st_mode & 0xF000) == 0x2000 && v18.st_rdev == *(_DWORD *)&devstat[24]) {
      log_to_fd = -1;
    }
  }
  return result;
}

uint64_t connect_tty(_DWORD *a1)
{
  *a1 = -1;
  __strlcpy_chk();
  dword_10004B9A8 = -1;
  uint64_t v2 = &unk_10004B000;
  dword_10004B9AC = -1;
  dword_10004B9A4 = -1;
  if (using_pty) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = record_file == 0;
  }
  if (!v3)
  {
    if (!get_pty(&dword_10004B9A8, &dword_10004B9AC, ppp_devnam, uid))
    {
      error((uint64_t)"Couldn't allocate pseudo-tty", v4, v5, v6, v7, v8, v9, v10, v153);
      int v14 = 1;
      goto LABEL_56;
    }
    clocal = 1;
    set_up_tty(dword_10004B9AC, 1);
  }
  if (lockflag && !privopen)
  {
    if ((lock((char *)&devnam) & 0x80000000) != 0)
    {
      int v14 = 6;
      goto LABEL_56;
    }
    locked = 1;
  }
  hungup = 0;
  do_modem_hungup = 0;
  if (redialingalternate && (uint64_t v11 = altconnect_script) != 0)
  {
    uint64_t v12 = altconnect_data;
    int v13 = altconnect_data_len;
  }
  else if (doing_callback)
  {
    uint64_t v12 = 0;
    int v13 = 0;
    uint64_t v11 = callback_script;
  }
  else
  {
    uint64_t v11 = connect_script;
    uint64_t v12 = connect_data;
    int v13 = connect_data_len;
  }
  memset(&v156, 0, sizeof(v156));
  if (!(_BYTE)devnam)
  {
LABEL_60:
    if (kill_link) {
      return 0xFFFFFFFFLL;
    }
    *(_DWORD *)status = 9;
    if (ptycommand)
    {
      if (record_file)
      {
        if (pipe((int *)&v157) < 0 || pipe((int *)&__endptr) < 0) {
          fatal();
        }
        fcntl(*(int *)&v157.sa_len, 2, 1);
        unsigned int v153 = 1;
        fcntl(SHIDWORD(__endptr), 2);
        uint64_t v47 = &unk_100049000;
        if (device_script(ptycommand, (int)__endptr, *(int *)&v157.sa_data[2], 1, 0xFFFFFFFF, 0, 0))
        {
          close(*(int *)&v157.sa_len);
          close(*(int *)&v157.sa_data[2]);
          close((int)__endptr);
          int v48 = HIDWORD(__endptr);
LABEL_69:
          close(v48);
          return 0xFFFFFFFFLL;
        }
        __int16 v155 = (const void *)v12;
        int v80 = sub_100022730(*(unsigned int *)&v157.sa_len, SHIDWORD(__endptr));
        close(*(int *)&v157.sa_len);
        close(*(int *)&v157.sa_data[2]);
        close((int)__endptr);
        close(SHIDWORD(__endptr));
        if (!v80) {
          return 0xFFFFFFFFLL;
        }
      }
      else
      {
        __int16 v155 = (const void *)v12;
        notify((uint64_t **)connectscript_started_notify, 0);
        uint64_t v45 = 0xFFFFFFFFLL;
        if ((device_script(ptycommand, dword_10004B9A8, dword_10004B9A8, 1, 0xFFFFFFFF, 0, 0) & 0x80000000) != 0) {
          return v45;
        }
        dword_10004B9B0 = v2[619];
        close(dword_10004B9A8);
        dword_10004B9A8 = -1;
        if (pty_delay)
        {
          if ((int)wait_input_fd(dword_10004B9B0, pty_delay) < 1) {
            return v45;
          }
        }
        notify((uint64_t **)connectscript_finished_notify, 0);
        uint64_t v47 = (void *)&unk_100049000;
      }
      goto LABEL_95;
    }
    __int16 v155 = (const void *)v12;
    uint64_t v49 = (const char *)pty_socket;
    if (!pty_socket)
    {
      if (notty)
      {
        uint64_t v47 = (void *)&unk_100049000;
        if (!sub_100022730(0, 1)) {
          return 0xFFFFFFFFLL;
        }
      }
      else
      {
        uint64_t v47 = (void *)&unk_100049000;
        if (record_file && !sub_100022730(dword_10004B9B0, dword_10004B9B0)) {
          return 0xFFFFFFFFLL;
        }
      }
      goto LABEL_95;
    }
    __endptr = 0;
    unsigned int v50 = strchr((char *)pty_socket, 58);
    if (!v50
      || (v58 = v50, uint64_t v59 = v50 + 1, v60 = strtol(v50 + 1, &__endptr, 10), v58 == v49)
      || v60 < 0
      || __endptr == v59)
    {
      uint64_t v79 = "Can't parse host:port for socket destination";
    }
    else
    {
      char *v58 = 0;
      in_addr_t v61 = inet_addr(v49);
      if (v61 == -1)
      {
        uint64_t v62 = gethostbyname(v49);
        if (!v62)
        {
          error((uint64_t)"%s: unknown host in socket option", v63, v64, v65, v66, v67, v68, v69, (int)v49);
          char *v58 = 58;
          return 0xFFFFFFFFLL;
        }
        in_addr_t v61 = **(_DWORD **)v62->h_addr_list;
      }
      char *v58 = 58;
      uint64_t v70 = socket(2, 1, 0);
      if ((v70 & 0x80000000) == 0)
      {
        uint64_t v71 = v70;
        *(void *)&v157.sa_len = 512;
        *(void *)&v157.sa_data[6] = 0;
        *(_WORD *)v157.sa_data = htons();
        *(_DWORD *)&v157.sa_data[2] = v61;
        if (connect(v71, &v157, 0x10u) < 0)
        {
          error((uint64_t)"Can't connect to %s: %m", v72, v73, v74, v75, v76, v77, v78, (int)v49);
          int v48 = v71;
          goto LABEL_69;
        }
        uint64_t v47 = (void *)&unk_100049000;
        if (!sub_100022730(v71, v71)) {
          return 0xFFFFFFFFLL;
        }
LABEL_95:
        if (v11)
        {
          uint64_t v81 = (unsigned char *)initializer;
          if (!*(unsigned char *)v11 && !initializer) {
            goto LABEL_134;
          }
        }
        else
        {
          uint64_t v81 = (unsigned char *)initializer;
          if (!initializer)
          {
            uint64_t v11 = 0;
            goto LABEL_134;
          }
        }
        if (dword_10004B9A4 != -1 && !default_device && modem)
        {
          setdtr(dword_10004B9A4, 0);
          sleep(1u);
          setdtr(dword_10004B9A4, 1);
          uint64_t v81 = (unsigned char *)initializer;
        }
        if (v81 && *v81)
        {
          if (kill_link) {
            return 0xFFFFFFFFLL;
          }
          notify((uint64_t **)initscript_started_notify, 0);
          uint64_t v82 = device_script(initializer, dword_10004B9B0, dword_10004B9B0, 0, 0xFFFFFFFF, 0, 0);
          if (v82)
          {
            error((uint64_t)"Initializer script failed", v83, v84, v85, v86, v87, v88, v89, v153);
            int v90 = 18;
LABEL_123:
            *(_DWORD *)status = v90;
            return 0xFFFFFFFFLL;
          }
          if (kill_link)
          {
            disconnect_tty(v82, v83, v84, v85, v86, v87, v88, v89, v153);
            return 0xFFFFFFFFLL;
          }
          notify((uint64_t **)initscript_finished_notify, 0);
          info((uint64_t)"Serial port initialized.", v91, v92, v93, v94, v95, v96, v97, v153);
        }
        if (v11 && *(unsigned char *)v11)
        {
          if (kill_link) {
            return 0xFFFFFFFFLL;
          }
          notify((uint64_t **)connectscript_started_notify, 0);
          int v98 = device_script(v11, dword_10004B9B0, dword_10004B9B0, 0, connector_uid, v155, v13);
          *a1 = v98;
          if (v98)
          {
            if (cancelcode == -1 || v98 != cancelcode)
            {
              error((uint64_t)"Connect script failed", v99, v100, v101, v102, v103, v104, v105, v153);
              int v90 = 8;
              goto LABEL_123;
            }
            goto LABEL_161;
          }
          if (kill_link) {
            return 4294967294;
          }
          notify((uint64_t **)connectscript_finished_notify, 0);
          info((uint64_t)"Serial connection established.", v106, v107, v108, v109, v110, v111, v112, v153);
          if (link_up_hook && !link_up_hook()) {
            goto LABEL_161;
          }
          link_up_done = 1;
        }
        if (dword_10004B9A4 != -1)
        {
          *(_DWORD *)&v157.sa_len = 0;
          if (ioctl(dword_10004B9A4, 0x4004746AuLL, &v157) != -1 && (v157.sa_len & 0x40) != 0)
          {
            clocal = 0;
            set_up_tty_local(dword_10004B9A4, 0);
          }
        }
        if (doing_callback == 1) {
          uint64_t v11 = 0;
        }
LABEL_134:
        if (!v11 && modem && (_BYTE)devnam)
        {
          ioctl(dword_10004B9B0, 0x2000740EuLL, 0);
          while (1)
          {
            int v113 = open((const char *)&devnam, 2);
            if ((v113 & 0x80000000) == 0) {
              break;
            }
            if (*__error() != 4)
            {
              error((uint64_t)"Failed to reopen %s: %m", v114, v115, v116, v117, v118, v119, v120, (int)&devnam);
              *(_DWORD *)status = 7;
            }
            if (!persist) {
              return 0xFFFFFFFFLL;
            }
            uint64_t v45 = 0xFFFFFFFFLL;
            if (*__error() == 4 && !hungup && kill_link == 0) {
              continue;
            }
            return v45;
          }
          int v122 = v113;
          if (ioctl(v113, 0x2000740DuLL, 0) < 0)
          {
            error((uint64_t)"Failed to reacquire the port %s exclusively: %m", v123, v124, v125, v126, v127, v128, v129, (int)&devnam);
            *(_DWORD *)status = 7;
            int v48 = v122;
            goto LABEL_69;
          }
          close(v122);
          uint64_t v47 = &unk_100049000;
        }
        int v154 = baud_rate;
        slprintf((int)&v157, 16, "%d");
        script_setenv("SPEED", (const char *)&v157);
        if (!terminal_window_hook && (!terminal_script || !*(unsigned char *)terminal_script))
        {
LABEL_164:
          if (welcomer
            && *(unsigned char *)welcomer
            && device_script(welcomer, dword_10004B9B0, dword_10004B9B0, 0, 0xFFFFFFFF, 0, 0))
          {
            warning((uint64_t)"Welcome script failed", v146, v147, v148, v149, v150, v151, v152, v154);
          }
          if (v11 | v47[400]) {
            listen_time = connect_delay;
          }
          return dword_10004B9B0;
        }
        if (!kill_link)
        {
          notify((uint64_t **)terminalscript_started_notify, 0);
          if (terminal_window_hook) {
            int v130 = terminal_window_hook(terminal_script, dword_10004B9B0, dword_10004B9B0);
          }
          else {
            int v130 = device_script(terminal_script, dword_10004B9B0, dword_10004B9B0, 0, 0xFFFFFFFF, (const void *)terminal_data, terminal_data_len);
          }
          *a1 = v130;
          if (v130)
          {
            if (cancelcode == -1 || v130 != cancelcode)
            {
              error((uint64_t)"Terminal script failed", v131, v132, v133, v134, v135, v136, v137, v154);
              int v138 = 20;
              goto LABEL_173;
            }
LABEL_161:
            int v138 = 5;
LABEL_173:
            *(_DWORD *)status = v138;
            return 4294967294;
          }
          if (!kill_link)
          {
            notify((uint64_t **)terminalscript_finished_notify, 0);
            info((uint64_t)"Terminal connection established.", v139, v140, v141, v142, v143, v144, v145, v154);
            goto LABEL_164;
          }
        }
        return 4294967294;
      }
      uint64_t v79 = "Can't create socket: %m";
    }
    error((uint64_t)v79, v51, v52, v53, v54, v55, v56, v57, v153);
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    if (privopen) {
      BOOL v15 = 0;
    }
    else {
      BOOL v15 = word_1000452F0 < 100;
    }
    int v16 = v15;
    if (v16 == 1) {
      seteuid(uid);
    }
    dword_10004B9B0 = open((const char *)&devnam, 6, 0);
    int v17 = *__error();
    if (v16) {
      seteuid(0);
    }
    if ((dword_10004B9B0 & 0x80000000) == 0)
    {
      unsigned int v153 = 0;
      if (ioctl(dword_10004B9B0, 0x2000740DuLL) < 0)
      {
        int v17 = *__error();
        goto LABEL_33;
      }
      dword_10004B9A4 = dword_10004B9B0;
      int v25 = fcntl(dword_10004B9B0, 3);
      if (v25 == -1 || (unsigned int v153 = v25 & 0xFFFFFFFB, fcntl(dword_10004B9B0, 4) < 0)) {
        warning((uint64_t)"Couldn't reset non-blocking mode on device: %m", v26, v27, v28, v29, v30, v31, v32, v153);
      }
      if (fstat(dword_10004B9B0, &v156) < 0 || fchmod(dword_10004B9B0, v156.st_mode & 0xFFED) < 0) {
        warning((uint64_t)"Couldn't restrict write permissions to %s: %m", v33, v34, v35, v36, v37, v38, v39, (int)&devnam);
      }
      else {
        tty_mode = v156.st_mode;
      }
      if (v11)
      {
        uint64_t v40 = initializer;
        if (*(unsigned char *)v11) {
          BOOL v41 = 0;
        }
        else {
          BOOL v41 = initializer == 0;
        }
        int v42 = !v41;
        clocal = v42;
        int v43 = dword_10004B9B0;
        if (*(unsigned char *)v11)
        {
          BOOL v44 = 1;
          uint64_t v2 = (_DWORD *)&unk_10004B000;
LABEL_59:
          set_up_tty(v43, v44);
          goto LABEL_60;
        }
      }
      else
      {
        uint64_t v40 = initializer;
        clocal = initializer != 0;
        int v43 = dword_10004B9B0;
      }
      uint64_t v2 = &unk_10004B000;
      BOOL v44 = v40 != 0;
      goto LABEL_59;
    }
LABEL_33:
    *__error() = v17;
    if (v17 != 4) {
      break;
    }
    if (!persist) {
      return 0xFFFFFFFFLL;
    }
  }
  if (dword_10004B9B0 < 0)
  {
    error((uint64_t)"Failed to open %s: %m", v18, v19, v20, v21, v22, v23, v24, (int)&devnam);
  }
  else
  {
    error((uint64_t)"Failed to acquire %s in exclusive mode : %m", v18, v19, v20, v21, v22, v23, v24, (int)&devnam);
    close(dword_10004B9B0);
    dword_10004B9B0 = -1;
  }
  int v14 = 7;
LABEL_56:
  *(_DWORD *)status = v14;
  return 0xFFFFFFFFLL;
}

void disconnect_tty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (disconnect_script) {
    BOOL v9 = hungup == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    if ((dword_10004B9A4 & 0x80000000) == 0) {
      clocal = 1;
    }
    set_up_tty_local(dword_10004B9A4, 1);
    if (device_script(disconnect_script, dword_10004B9B0, dword_10004B9B0, 0, disconnector_uid, (const void *)disconnect_data, disconnect_data_len))
    {
      warning((uint64_t)"disconnect script failed", v10, v11, v12, v13, v14, v15, v16, a9);
    }
    else
    {
      info((uint64_t)"Serial link disconnected.", v10, v11, v12, v13, v14, v15, v16, a9);
    }
  }
}

void tty_do_send_config(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  int v9 = a3;
  int v10 = a2;
  tty_set_xaccm((uint64_t)xmit_accm, a2, a3, a4, a5, a6, a7, a8, v12);

  tty_send_config(a1, v10, v9, v8);
}

uint64_t cleanup_tty()
{
  uint64_t v0 = dword_10004B9A4;
  if ((dword_10004B9A4 & 0x80000000) == 0)
  {
    if (default_device) {
      BOOL v1 = 1;
    }
    else {
      BOOL v1 = modem == 0;
    }
    if (!v1)
    {
      setdtr(dword_10004B9A4, 0);
      sleep(1u);
      uint64_t v0 = dword_10004B9A4;
    }
    restore_tty(v0);
    if ((unsigned __int16)tty_mode != 0xFFFF && fchmod(dword_10004B9A4, tty_mode)) {
      chmod((const char *)&devnam, tty_mode);
    }
    close(dword_10004B9A4);
    dword_10004B9A4 = -1;
  }
  uint64_t result = tty_close_fds();
  if (locked)
  {
    uint64_t result = unlock();
    locked = 0;
  }
  return result;
}

uint64_t tty_close_fds()
{
  if ((dword_10004B9A8 & 0x80000000) == 0) {
    close(dword_10004B9A8);
  }
  if ((dword_10004B9AC & 0x80000000) == 0) {
    close(dword_10004B9AC);
  }
  uint64_t result = dword_10004B9A4;
  if ((dword_10004B9A4 & 0x80000000) == 0)
  {
    uint64_t result = close(dword_10004B9A4);
    dword_10004B9A4 = -1;
  }
  return result;
}

void *tty_init()
{
  add_notifier(&pidchange, (uint64_t)sub_100022664, 0);
  uint64_t result = add_notifier(&sigreceived, (uint64_t)sub_10002267C, 0);
  dword_10004B9A4 = -1;
  the_channel = (uint64_t)&tty_channel;
  dword_100049CF0 = 1610612736;
  return result;
}

uint64_t sub_100022664()
{
  if (locked) {
    return relock();
  }
  return result;
}

void sub_10002267C(uint64_t a1, uint64_t a2)
{
  int v3 = 0;
  if (a2 == 1 && dword_10004B9A4 != -1 && phase != 12)
  {
    ioctl(dword_10004B9A4, 0x4004746AuLL, &v3);
    if (!clocal && (v3 & 0x40) == 0)
    {
      hungup = 1;
      do_modem_hungup = 1;
      if ((phase - 11) <= 0xFFFFFFFD) {
        *(_DWORD *)status = 16;
      }
    }
  }
}

uint64_t sub_100022730(uint64_t a1, int a2)
{
  int v4 = safe_fork();
  if (v4 == -1)
  {
    error((uint64_t)"Can't fork process for character shunt: %m", v5, v6, v7, v8, v9, v10, v11, v15);
    return 0;
  }
  else
  {
    int v12 = v4;
    if (!v4)
    {
      close(dword_10004B9AC);
      setuid(uid);
      if (getuid() == uid)
      {
        gid_t v14 = getgid();
        setgid(v14);
        sys_close();
        if (!nodetach) {
          log_to_fd = -1;
        }
        sub_100022870(a1, a2, (const char *)record_file);
      }
      fatal();
    }
    charshunt_pid = v4;
    add_notifier(&sigreceived, (uint64_t)sub_1000232EC, 0);
    close(dword_10004B9A8);
    dword_10004B9A8 = -1;
    dword_10004B9B0 = dword_10004B9AC;
    record_child(v12, (uint64_t)"pppd (charshunt)", (uint64_t)sub_100023310, 0);
    return 1;
  }
}

void sub_100022870(uint64_t a1, int a2, const char *a3)
{
  signal(1, (void (__cdecl *)(int))1);
  signal(2, 0);
  signal(15, 0);
  signal(20, 0);
  signal(30, 0);
  signal(31, 0);
  signal(6, 0);
  signal(14, 0);
  signal(8, 0);
  signal(4, 0);
  signal(13, 0);
  signal(3, 0);
  signal(11, 0);
  signal(10, 0);
  signal(7, 0);
  signal(27, 0);
  signal(12, 0);
  signal(5, 0);
  signal(26, 0);
  signal(24, 0);
  signal(25, 0);
  if ((int)a1 > 1023 || a2 > 1023 || dword_10004B9A8 >= 1024) {
    fatal();
  }
  if (a3)
  {
    uint64_t v5 = fopen(a3, "a");
    if (!v5) {
      error((uint64_t)"Couldn't create record file %s: %m", v6, v7, v8, v9, v10, v11, v12, (int)a3);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  int v13 = fcntl(dword_10004B9A8, 3);
  if (v13 == -1 || (int v89 = v13 | 4, fcntl(dword_10004B9A8, 4) == -1)) {
    warning((uint64_t)"couldn't set pty master to nonblock: %m", v14, v15, v16, v17, v18, v19, v20, v89);
  }
  int v21 = fcntl(a1, 3);
  if (v21 == -1 || (int v90 = v21 | 4, fcntl(a1, 4) == -1))
  {
    uint64_t v29 = "tty";
    if (!a1) {
      uint64_t v29 = "stdin";
    }
    warning((uint64_t)"couldn't set %s to nonblock: %m", v22, v23, v24, v25, v26, v27, v28, (int)v29);
  }
  if (a2 != a1)
  {
    int v30 = fcntl(a2, 3);
    if (v30 == -1 || (int v90 = v30 | 4, fcntl(a2, 4) == -1)) {
      warning((uint64_t)"couldn't set stdout to nonblock: %m", v31, v32, v33, v34, v35, v36, v37, v90);
    }
  }
  memset(&v111, 0, sizeof(v111));
  memset(&v110, 0, sizeof(v110));
  v108.unint64_t tv_sec = 0;
  *(void *)&v108.tv_usec = 0;
  uint64_t v106 = 0;
  uint64_t v107 = 0;
  gettimeofday(&v108, 0);
  if (max_data_rate)
  {
    int v38 = max_data_rate / 10;
    if (max_data_rate / 10 <= 100) {
      int v38 = 100;
    }
  }
  else
  {
    int v38 = 1505;
  }
  int v93 = v38;
  v109.unint64_t tv_sec = 0;
  *(void *)&v109.tv_usec = 0;
  int v39 = dword_10004B9A8;
  if (dword_10004B9A8 <= a2) {
    int v39 = a2;
  }
  int v40 = v39 + 1;
  if (v5)
  {
    gettimeofday(&v109, 0);
    putc(7, v5);
    unint64_t tv_sec = v109.tv_sec;
    putc((unint64_t)v109.tv_sec >> 24, v5);
    putc(tv_sec >> 16, v5);
    putc(tv_sec >> 8, v5);
    putc(tv_sec, v5);
    v109.tv_usec = 0;
  }
  int v98 = v5;
  ssize_t v99 = 0;
  BOOL v42 = 0;
  BOOL v43 = 0;
  int v91 = 0;
  int v92 = 0;
  uint64_t v96 = 0;
  ssize_t v97 = 0;
  uint64_t v95 = 0;
  int v101 = 1 << a1;
  uint64_t v100 = &v111.fds_bits[(unint64_t)(int)a1 >> 5];
  int v103 = 1 << a2;
  uint64_t v102 = &v110.fds_bits[(unint64_t)a2 >> 5];
  BOOL v44 = 1;
  BOOL v45 = 1;
  BOOL v46 = 1;
  BOOL v47 = 1;
  uint64_t v94 = 0x100000001;
  while (1)
  {
    uint64_t v106 = 0;
    LODWORD(v107) = 10000;
    memset(&v111, 0, sizeof(v111));
    memset(&v110, 0, sizeof(v110));
    if (!v43) {
      break;
    }
    if (v45)
    {
      int v48 = dword_10004B9A8;
      if (__darwin_check_fd_set_overflow(dword_10004B9A8, &v110, 0))
      {
        int v49 = 1 << v48;
        unsigned int v50 = &v110.fds_bits[(unint64_t)v48 >> 5];
LABEL_36:
        uint64_t v52 = 0;
        *v50 |= v49;
        if (v42) {
          goto LABEL_39;
        }
        goto LABEL_43;
      }
      goto LABEL_38;
    }
    uint64_t v52 = (timeval *)&v106;
    if (v42)
    {
LABEL_39:
      if (!v44)
      {
        uint64_t v52 = (timeval *)&v106;
        goto LABEL_49;
      }
      int v53 = __darwin_check_fd_set_overflow(a2, &v110, 0);
      uint64_t v54 = &v110.fds_bits[(unint64_t)a2 >> 5];
      int v55 = 1 << a2;
      if (!v53) {
        goto LABEL_49;
      }
      goto LABEL_46;
    }
LABEL_43:
    if (v47)
    {
      uint64_t v56 = a1;
      int v57 = dword_10004B9A8;
      if (!__darwin_check_fd_set_overflow(dword_10004B9A8, &v111, 0))
      {
        a1 = v56;
        goto LABEL_49;
      }
      int v55 = 1 << v57;
      uint64_t v54 = &v111.fds_bits[(unint64_t)v57 >> 5];
      a1 = v56;
LABEL_46:
      *v54 |= v55;
    }
LABEL_49:
    if (select(v40, &v111, &v110, 0, v52) < 0)
    {
      if (*__error() != 4) {
        fatal();
      }
    }
    else
    {
      if (max_data_rate)
      {
        v105.unint64_t tv_sec = 0;
        *(void *)&v105.tv_usec = 0;
        gettimeofday(&v105, 0);
        int v58 = (int)(((double)(v105.tv_usec - v108.tv_usec) / 1000000.0 + (double)(v105.tv_sec - v108.tv_sec))
                  * (double)max_data_rate);
        BOOL v59 = v58 < 0;
        if (v91 < v58 || v58 < 0) {
          int v61 = 0;
        }
        else {
          int v61 = v91 - v58;
        }
        BOOL v62 = __OFSUB__(v92, v58);
        int v63 = v92 - v58;
        if (v63 < 0 != v62) {
          BOOL v59 = 1;
        }
        if (v59) {
          int v64 = 0;
        }
        else {
          int v64 = v63;
        }
        timeval v108 = v105;
      }
      else
      {
        int v61 = 0;
        int v64 = 0;
      }
      uint64_t v65 = v98;
      ssize_t v66 = v99;
      ssize_t v67 = v97;
      uint64_t v68 = v95;
      if (__darwin_check_fd_set_overflow(a1, &v111, 0) && (*v100 & v101) != 0)
      {
        ssize_t v69 = read(a1, &inpacket_buf, 0x5E0uLL);
        ssize_t v67 = v69;
        if ((v69 & 0x80000000) != 0)
        {
          if (*__error() != 5)
          {
            if (*__error() != 4 && *__error() != 35)
            {
              uint64_t v88 = "Error reading standard input: %m";
LABEL_136:
              error((uint64_t)v88, v72, v73, v74, v75, v76, v77, v78, v90);
LABEL_131:
              exit(0);
            }
            ssize_t v67 = 0;
            goto LABEL_85;
          }
        }
        else if (v69)
        {
          int v70 = dword_10004B9A8;
          if (__darwin_check_fd_set_overflow(dword_10004B9A8, &v110, 0)) {
            *(__int32_t *)((char *)v110.fds_bits + (((unint64_t)v70 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v70;
          }
          if (v98)
          {
            int v71 = sub_10002331C(v98, 2, &inpacket_buf, v67, &v109);
LABEL_78:
            if (!v71) {
              uint64_t v65 = 0;
            }
          }
          goto LABEL_85;
        }
        write(dword_10004B9A8, &inpacket_buf, 0);
        if (v98)
        {
          int v71 = sub_10002331C(v98, 4, 0, 0, &v109);
          ssize_t v67 = 0;
          LODWORD(v94) = 0;
          goto LABEL_78;
        }
        ssize_t v67 = 0;
        LODWORD(v94) = 0;
LABEL_85:
        uint64_t v68 = &inpacket_buf;
      }
      uint64_t v79 = v96;
      int v80 = dword_10004B9A8;
      if (__darwin_check_fd_set_overflow(dword_10004B9A8, &v111, 0)
        && ((*(unsigned int *)((char *)v111.fds_bits + (((unint64_t)v80 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v80) & 1) != 0)
      {
        ssize_t v81 = read(dword_10004B9A8, &outpacket_buf, 0x5E0uLL);
        ssize_t v66 = v81;
        if ((v81 & 0x80000000) != 0)
        {
          if (*__error() == 5)
          {
LABEL_97:
            close(a2);
            if (v65)
            {
              ssize_t v67 = 0;
              ssize_t v66 = 0;
              uint64_t v94 = 0;
              if (!sub_10002331C(v65, 3, 0, 0, &v109)) {
                uint64_t v65 = 0;
              }
            }
            else
            {
              ssize_t v67 = 0;
              ssize_t v66 = 0;
              uint64_t v94 = 0;
            }
          }
          else
          {
            if (*__error() != 4 && *__error() != 35)
            {
              uint64_t v88 = "Error reading pseudo-tty master: %m";
              goto LABEL_136;
            }
            ssize_t v66 = 0;
          }
LABEL_105:
          uint64_t v79 = &outpacket_buf;
          goto LABEL_106;
        }
        if (!v81) {
          goto LABEL_97;
        }
        if (__darwin_check_fd_set_overflow(a2, &v110, 0)) {
          *v102 |= v103;
        }
        if (!v65) {
          goto LABEL_105;
        }
        uint64_t v79 = &outpacket_buf;
        if (!sub_10002331C(v65, 1, &outpacket_buf, v66, &v109)) {
          uint64_t v65 = 0;
        }
      }
LABEL_106:
      if (__darwin_check_fd_set_overflow(a2, &v110, 0) && (*v102 & v103) != 0)
      {
        if ((int)v66 + v64 <= v93) {
          int v82 = v66;
        }
        else {
          int v82 = v93 - v64;
        }
        unsigned int v83 = write(a2, v79, v82);
        if ((v83 & 0x80000000) != 0)
        {
          if (*__error() == 5)
          {
            ssize_t v66 = 0;
            HIDWORD(v94) = 0;
          }
          else if (*__error() != 35 && *__error() != 4)
          {
            uint64_t v88 = "Error writing standard output: %m";
            goto LABEL_136;
          }
        }
        else
        {
          uint64_t v79 = (int *)((char *)v79 + v83);
          ssize_t v66 = v66 - v83;
          v64 += v83;
        }
      }
      int v84 = dword_10004B9A8;
      uint64_t v96 = v79;
      if (__darwin_check_fd_set_overflow(dword_10004B9A8, &v110, 0)
        && ((*(unsigned int *)((char *)v110.fds_bits + (((unint64_t)v84 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v84) & 1) != 0)
      {
        if ((int)v67 + v61 <= v93) {
          int v85 = v67;
        }
        else {
          int v85 = v93 - v61;
        }
        unsigned int v86 = write(dword_10004B9A8, v68, v85);
        if ((v86 & 0x80000000) != 0)
        {
          if (*__error() == 5)
          {
            ssize_t v67 = 0;
            LODWORD(v94) = 0;
          }
          else if (*__error() != 35 && *__error() != 4)
          {
            uint64_t v88 = "Error writing pseudo-tty master: %m";
            goto LABEL_136;
          }
        }
        else
        {
          uint64_t v68 = (_WORD *)((char *)v68 + v86);
          ssize_t v67 = v67 - v86;
          v61 += v86;
        }
      }
      uint64_t v95 = v68;
      int v98 = v65;
      ssize_t v99 = v66;
      BOOL v43 = v67 != 0;
      BOOL v42 = v66 != 0;
      BOOL v47 = HIDWORD(v94) != 0;
      ssize_t v87 = v67;
      BOOL v46 = v94 != 0;
      int v91 = v61;
      int v92 = v64;
      BOOL v45 = v61 < v93;
      BOOL v44 = v64 < v93;
      ssize_t v97 = v87;
      if (!v87 && !v99 && !v94) {
        goto LABEL_131;
      }
    }
  }
  if (v46)
  {
    int v51 = __darwin_check_fd_set_overflow(a1, &v111, 0);
    unsigned int v50 = v100;
    int v49 = v101;
    if (v51) {
      goto LABEL_36;
    }
  }
LABEL_38:
  uint64_t v52 = 0;
  if (v42) {
    goto LABEL_39;
  }
  goto LABEL_43;
}

uint64_t sub_1000232EC(uint64_t a1, uint64_t a2)
{
  uint64_t result = charshunt_pid;
  if (charshunt_pid)
  {
    if (a2 == 2) {
      int v3 = 2;
    }
    else {
      int v3 = 15;
    }
    return kill(charshunt_pid, v3);
  }
  return result;
}

void sub_100023310()
{
  charshunt_pid = 0;
}

uint64_t sub_10002331C(FILE *a1, int a2, const void *a3, unsigned int a4, _DWORD *a5)
{
  unsigned long long v20 = 0uLL;
  gettimeofday((timeval *)&v20, 0);
  SDWORD2(v20) /= 100000;
  unsigned int v10 = DWORD2(v20) - a5[2] + 10 * (v20 - *a5);
  if ((int)v10 >= 1)
  {
    if (v10 < 0x100)
    {
      int v11 = 6;
    }
    else
    {
      putc(5, a1);
      putc(HIBYTE(v10), a1);
      putc(HIWORD(v10), a1);
      int v11 = v10 >> 8;
    }
    putc(v11, a1);
    putc(v10, a1);
    *(_OWORD *)a5 = v20;
  }
  putc(a2, a1);
  if (a3)
  {
    putc(a4 >> 8, a1);
    putc(a4, a1);
    fwrite(a3, a4, 1uLL, a1);
  }
  fflush(a1);
  if (!ferror(a1)) {
    return 1;
  }
  error((uint64_t)"Error writing record file: %m", v12, v13, v14, v15, v16, v17, v18, v20);
  return 0;
}

double sub_100023474(int a1)
{
  BOOL v1 = (char *)&upap + 64 * (uint64_t)a1;
  *(_DWORD *)BOOL v1 = a1;
  *((void *)v1 + 1) = 0;
  *((_DWORD *)v1 + 4) = 0;
  *((void *)v1 + 3) = 0;
  *((void *)v1 + 4) = 0;
  *(void *)(v1 + 37) = 0;
  *((_DWORD *)v1 + 12) = 3;
  *(void *)&double result = 0x1E0000000ALL;
  *((void *)v1 + 7) = 0x1E0000000ALL;
  return result;
}

void sub_1000234B0(int a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if ((int)a3 <= 3)
  {
    if (!debug) {
      return;
    }
    uint64_t v9 = "pap_input: rcvd short header.";
LABEL_10:
    dbglog((uint64_t)v9, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
    return;
  }
  unsigned int v10 = __rev16(*((unsigned __int16 *)a2 + 1));
  if (v10 <= 3)
  {
    if (!debug) {
      return;
    }
    uint64_t v9 = "pap_input: rcvd illegal length.";
    goto LABEL_10;
  }
  if (v10 > a3)
  {
    if (!debug) {
      return;
    }
    uint64_t v9 = "pap_input: rcvd short packet.";
    goto LABEL_10;
  }
  uint64_t v11 = a1;
  uint64_t v12 = (unsigned int *)((char *)&upap + 64 * (uint64_t)a1);
  int v13 = *a2;
  switch(v13)
  {
    case 3:
      uint64_t v24 = (char *)&upap + 64 * (uint64_t)a1;
      int v26 = *((_DWORD *)v24 + 9);
      uint64_t v25 = v24 + 36;
      if (v26 != 3) {
        return;
      }
      if (v10 == 4)
      {
        if (debug) {
          dbglog((uint64_t)"pap_rauthnak: ignoring missing msg-length.", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v61);
        }
      }
      else if (a2[4])
      {
        if (v10 - 5 < a2[4])
        {
          if (!debug) {
            return;
          }
          uint64_t v9 = "pap_rauthnak: rcvd short packet.";
          goto LABEL_10;
        }
        info((uint64_t)"Remote message: %0.*v", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a2[4]);
      }
      *uint64_t v25 = 5;
      error((uint64_t)"PAP authentication failed", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v61);
      int v33 = *v12;
      auth_withpeer_fail(v33, 49187);
      break;
    case 2:
      int v21 = (char *)&upap + 64 * (uint64_t)a1;
      int v23 = *((_DWORD *)v21 + 9);
      uint64_t v22 = v21 + 36;
      if (v23 != 3) {
        return;
      }
      if (v10 == 4)
      {
        if (debug) {
          dbglog((uint64_t)"pap_rauthack: ignoring missing msg-length.", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v61);
        }
      }
      else if (a2[4])
      {
        if (v10 - 5 < a2[4])
        {
          if (!debug) {
            return;
          }
          uint64_t v9 = "pap_rauthack: rcvd short packet.";
          goto LABEL_10;
        }
        info((uint64_t)"Remote message: %0.*v", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a2[4]);
      }
      *uint64_t v22 = 4;
      notice((uint64_t)"PAP authentication succeeded", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v61);
      int v32 = *v12;
      auth_withpeer_success(v32, 49187, 0);
      break;
    case 1:
      uint64_t v14 = (char *)&upap + 64 * (uint64_t)a1;
      int v17 = *((_DWORD *)v14 + 10);
      uint64_t v16 = v14 + 40;
      int v15 = v17;
      if (v17 < 3) {
        return;
      }
      char v18 = a2[1];
      if (v15 == 5)
      {
        uint64_t v19 = (unsigned int *)((char *)&upap + 64 * (uint64_t)a1);
        char v20 = 3;
        goto LABEL_37;
      }
      if (v15 == 4)
      {
        uint64_t v19 = (unsigned int *)((char *)&upap + 64 * (uint64_t)a1);
        char v20 = 2;
LABEL_37:
        sub_1000240A0(v19, v20, v18, &unk_100032B9A, 0, a6, a7, a8, v61);
        return;
      }
      if (v10 == 4
        || (uint64_t v27 = a2[4], v28 = v10 - v27 - 6, v28 < 0)
        || (uint64_t v29 = (uint64_t)(a2 + 5), v30 = &a2[a2[4] + 5], v31 = *v30, v28 < v31))
      {
        if (debug) {
          dbglog((uint64_t)"pap_rauth: rcvd short packet.", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v61);
        }
      }
      else
      {
        __s = 0;
        uint64_t v34 = v30 + 1;
        int v35 = check_passwd((void *)*v12, (uint64_t)(a2 + 5), v27, (uint64_t)(v30 + 1), v31, &__s);
        bzero(v34, v31);
        if (v35 == 2)
        {
          if (auth_number())
          {
            int v35 = 2;
          }
          else
          {
            warning((uint64_t)"calling number %q is not authorized", v36, v37, v38, v39, v40, v41, v42, (int)&remote_number);
            int v35 = 3;
          }
        }
        int v43 = strlen(__s);
        if (v43 >= 255) {
          int v47 = 255;
        }
        else {
          int v47 = v43;
        }
        sub_1000240A0(v12, v35, v18, __s, v47, v44, v45, v46, v61);
        slprintf((int)v63, 256, "%.*v");
        if (v35 == 2)
        {
          *uint64_t v16 = 4;
          notice((uint64_t)"PAP peer authentication succeeded for %q", v48, v49, v50, v51, v52, v53, v54, (int)v63);
          auth_peer_success(*v12, 49187, 0, v29, v27);
        }
        else
        {
          *uint64_t v16 = 5;
          warning((uint64_t)"PAP peer authentication failed for %q", v48, v49, v50, v51, v52, v53, v54, (int)v63);
          auth_peer_fail(*v12, 49187, v55, v56, v57, v58, v59, v60);
        }
        if (*((int *)&upap + 16 * v11 + 15) >= 1) {
          untimeout((uint64_t)sub_100023FD0, (uint64_t)v12);
        }
      }
      break;
    default:
      return;
  }
}

void sub_1000239FC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (char *)&upap + 64 * (uint64_t)a1;
  if (*((_DWORD *)v9 + 9) == 3)
  {
    error((uint64_t)"PAP authentication failed due to protocol-reject", a2, a3, a4, a5, a6, a7, a8, v16);
    auth_withpeer_fail(a1, 49187);
  }
  if (*((_DWORD *)v9 + 10) == 3)
  {
    error((uint64_t)"PAP authentication of peer failed (protocol-reject)", a2, a3, a4, a5, a6, a7, a8, v16);
    auth_peer_fail(a1, 49187, v10, v11, v12, v13, v14, v15);
  }

  sub_100023B54(a1);
}

void sub_100023A88(int a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = (char *)&upap + 64 * (uint64_t)a1;
  int v5 = *((_DWORD *)v2 + 9);
  int v3 = v2 + 36;
  int v4 = v5;
  if (v5 == 2)
  {
    sub_100023E90((unsigned int *)&upap + 16 * (uint64_t)a1);
  }
  else if (!v4)
  {
    *int v3 = 1;
  }
  uint64_t v6 = (char *)&upap + 64 * v1;
  int v9 = *((_DWORD *)v6 + 10);
  uint64_t v7 = v6 + 40;
  int v8 = v9;
  if (v9 == 2)
  {
    *uint64_t v7 = 3;
    if (*((int *)&upap + 16 * v1 + 15) >= 1)
    {
      timeout((int)sub_100023FD0);
    }
  }
  else if (!v8)
  {
    *uint64_t v7 = 1;
  }
}

void sub_100023B54(int a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = (char *)&upap + 64 * (uint64_t)a1;
  if (*((_DWORD *)v2 + 9) == 3) {
    untimeout((uint64_t)sub_100024010, (uint64_t)v2);
  }
  if (*((_DWORD *)v2 + 10) == 3 && *((int *)&upap + 16 * v1 + 15) >= 1) {
    untimeout((uint64_t)sub_100023FD0, (uint64_t)v2);
  }
  *(void *)(v2 + 36) = 0;
}

uint64_t sub_100023BE8(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0;
  }
  unsigned int v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  unsigned int v7 = v6 - 4;
  if (v6 < 4 || v6 > a2) {
    return 0;
  }
  int v11 = *a1;
  int v12 = a1[1];
  uint64_t v13 = a1 + 4;
  if ((v11 - 1) > 2) {
    uint64_t v14 = " code=0x%x";
  }
  else {
    uint64_t v14 = " %s";
  }
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if ((v11 - 2) < 2)
  {
    if (v6 < 5) {
      return (v13 - a1);
    }
    uint64_t v15 = *v13;
    if (v7 <= v15) {
      goto LABEL_25;
    }
    int v16 = &v13[v15 + 1];
    int v17 = v7 - (v15 + 1);
    a3(a4, " ");
    char v18 = (char *)(a1 + 5);
    int v19 = v15;
    goto LABEL_16;
  }
  if (v11 == 1)
  {
    if (v6 < 5) {
      return (v13 - a1);
    }
    uint64_t v20 = *v13;
    if (v7 < (int)v20 + 2) {
      goto LABEL_25;
    }
    int v21 = v13[v20 + 1];
    unsigned int v22 = v20 + 2 + v21;
    int v17 = v7 - v22;
    if (v7 < v22) {
      goto LABEL_25;
    }
    int v16 = &v13[v22];
    a3(a4, " user=");
    print_string((char *)a1 + 5, v20, a3, a4);
    a3(a4, " password=");
    if (!byte_100046080)
    {
      char v18 = (char *)&v13[v20 + 2];
      int v19 = v21;
LABEL_16:
      print_string(v18, v19, a3, a4);
      goto LABEL_24;
    }
    a3(a4, "<hidden>");
  }
  else
  {
    int v16 = a1 + 4;
    int v17 = v6 - 4;
  }
LABEL_24:
  unsigned int v7 = v17;
  uint64_t v13 = v16;
  if (v17 >= 1)
  {
LABEL_25:
    unsigned int v23 = v7 + 1;
    do
    {
      int v24 = *v13++;
      ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v24);
      --v23;
    }
    while (v23 > 1);
  }
  return (v13 - a1);
}

void upap_authwithpeer(int a1, char *__s, const char *a3)
{
  int v4 = (char *)&upap + 64 * (uint64_t)a1;
  *((void *)v4 + 1) = __s;
  *((_DWORD *)v4 + 4) = strlen(__s);
  *((void *)v4 + 3) = a3;
  int v5 = strlen(a3);
  int v6 = *((_DWORD *)v4 + 9);
  *((_DWORD *)v4 + 8) = v5;
  *((_DWORD *)v4 + 13) = 0;
  if ((v6 | 2) == 2)
  {
    *((_DWORD *)v4 + 9) = 2;
  }
  else
  {
    sub_100023E90((unsigned int *)v4);
  }
}

void sub_100023E90(unsigned int *a1)
{
  size_t v2 = (int)a1[4];
  int v3 = v2 + a1[8];
  outpacket_buf = 599786495;
  LOBYTE(word_100048120) = 1;
  char v4 = *((unsigned char *)a1 + 44) + 1;
  *((unsigned char *)a1 + 44) = v4;
  HIBYTE(word_100048120) = v4;
  LOBYTE(word_100048122) = (unsigned __int16)(v3 + 6) >> 8;
  HIBYTE(word_100048122) = v3 + 6;
  byte_100048124 = v2;
  memcpy(byte_100048125, *((const void **)a1 + 1), v2);
  int v5 = &byte_100048125[a1[4]];
  *int v5 = a1[8];
  memcpy(v5 + 1, *((const void **)a1 + 3), (int)a1[8]);
  output(*a1, (uint64_t)&outpacket_buf, (v3 + 10), v6, v7, v8, v9, v10, v11);
  timeout((int)sub_100024010);
  ++a1[13];
  a1[9] = 3;
}

void upap_authpeer(int a1)
{
  uint64_t v1 = (char *)&upap + 64 * (uint64_t)a1;
  int v3 = *((_DWORD *)v1 + 10);
  size_t v2 = v1 + 40;
  if ((v3 | 2) == 2)
  {
    _DWORD *v2 = 2;
  }
  else
  {
    _DWORD *v2 = 3;
    if (*((int *)&upap + 16 * (uint64_t)a1 + 15) >= 1) {
      timeout((int)sub_100023FD0);
    }
  }
}

void sub_100023FD0(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[10] == 3)
  {
    auth_peer_fail(*a1, 49187, a3, a4, a5, a6, a7, a8);
    a1[10] = 5;
  }
}

void sub_100024010(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[9] == 3)
  {
    if (a1[13] >= a1[14])
    {
      error((uint64_t)"No response to PAP authenticate-requests", a2, a3, a4, a5, a6, a7, a8, v10);
      a1[9] = 5;
      int v9 = *a1;
      auth_withpeer_fail(v9, 49187);
    }
    else
    {
      sub_100023E90();
    }
  }
}

void sub_1000240A0(unsigned int *a1, char a2, char a3, void *__src, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  outpacket_buf = 599786495;
  LOBYTE(word_100048120) = a2;
  HIBYTE(word_100048120) = a3;
  LOBYTE(word_100048122) = (unsigned __int16)(a5 + 5) >> 8;
  HIBYTE(word_100048122) = a5 + 5;
  byte_100048124 = a5;
  memcpy(byte_100048125, __src, a5);
  uint64_t v16 = *a1;

  output(v16, (uint64_t)&outpacket_buf, (a5 + 9), v11, v12, v13, v14, v15, a9);
}

uint64_t slprintf(int a1, int a2, void *a3)
{
  return vslprintf(a1, a2, a3);
}

uint64_t vslprintf(char *a1, int a2, char *__src, int *a4)
{
  char v4 = a1;
  time_t v90 = 0;
  int v91 = a4;
  uint64_t v88 = 0;
  uint64_t v89 = 0;
  int __dst = (int)a1;
  if (a2 < 2) {
    goto LABEL_202;
  }
  int v6 = a2 - 1;
  char v4 = a1;
  while (1)
  {
    for (uint64_t i = 0; __src[i] && __src[i] != 37; ++i)
      ;
    uint64_t v8 = &__src[i];
    if (&__src[i] > __src)
    {
      if (v6 >= (int)i) {
        int v9 = i;
      }
      else {
        int v9 = v6;
      }
      memcpy(v4, __src, v9);
      v4 += v9;
      v6 -= v9;
      unsigned int __src = v8;
    }
    if (!*__src) {
      goto LABEL_202;
    }
    uint64_t v11 = __src + 1;
    int v10 = __src[1];
    if (v10 == 48)
    {
      int v13 = __src[2];
      int v12 = 48;
      uint64_t v11 = __src + 2;
    }
    else
    {
      int v12 = 32;
      int v13 = __src[1];
    }
    if (v13 == 42)
    {
      uint64_t v14 = v91;
      v91 += 2;
      int v15 = *v14;
      int v17 = *++v11;
      int v16 = v17;
    }
    else
    {
      int v16 = (char)v13;
      if (((char)v13 - 48) > 9)
      {
        int v15 = 0;
      }
      else
      {
        int v15 = 0;
        do
        {
          int v15 = v16 + 10 * v15 - 48;
          int v18 = *++v11;
          int v16 = v18;
        }
        while ((v18 - 48) < 0xA);
      }
    }
    if (v16 == 46)
    {
      int v16 = v11[1];
      if (v16 == 42)
      {
        int v19 = v91;
        v91 += 2;
        int v20 = *v19;
        int v21 = v11[2];
        v11 += 2;
        int v16 = v21;
      }
      else if ((v16 - 48) > 9)
      {
        int v20 = 0;
        ++v11;
      }
      else
      {
        int v20 = 0;
        ++v11;
        do
        {
          int v20 = v16 + 10 * v20 - 48;
          int v22 = *++v11;
          int v16 = v22;
        }
        while ((v22 - 48) < 0xA);
      }
    }
    else
    {
      int v20 = -1;
    }
    unsigned int __src = v11 + 1;
    if (v16 > 87) {
      break;
    }
    switch(v16)
    {
      case 'B':
        uint64_t v46 = v91;
        v91 += 2;
        if (v20 >= 1)
        {
          int v47 = *(unsigned __int8 **)v46;
          int v48 = v20 + 1;
          do
          {
            unsigned int v50 = *v47++;
            unint64_t v49 = v50;
            if (v10 != 48 && v6 >= 1)
            {
              *v4++ = 32;
              --v6;
            }
            if (v6 >= 1)
            {
              *char v4 = a0123456789abcd[v49 >> 4];
              if (v6 == 1)
              {
                int v6 = 0;
                ++v4;
              }
              else
              {
                v6 -= 2;
                v4[1] = a0123456789abcd[v49 & 0xF];
                v4 += 2;
              }
            }
            --v48;
          }
          while (v48 > 1);
        }
        goto LABEL_150;
      case 'I':
        v91 += 2;
        ntohl();
        uint64_t v51 = v92;
        slprintf((int)v92, 32, "%d.%d.%d.%d");
LABEL_137:
        int v66 = strlen(v51);
        if (v20 >= v66 || v20 <= -1) {
          int v68 = v66;
        }
        else {
          int v68 = v20;
        }
LABEL_164:
        if (v15 >= 1)
        {
          int v74 = v15 >= v6 ? v6 : v15;
          int v75 = v74 - v68;
          if (v74 - v68 >= 1)
          {
            size_t v76 = (v74 + ~v68) + 1;
            memset(v4, v12, v76);
            v6 -= v75;
            v4 += v76;
          }
        }
        if (v68 >= v6) {
          int v77 = v6;
        }
        else {
          int v77 = v68;
        }
        memcpy(v4, v51, v77);
        v4 += v77;
        BOOL v73 = __OFSUB__(v6, v77);
        v6 -= v77;
        if ((v6 < 0) ^ v73 | (v6 == 0)) {
          goto LABEL_202;
        }
        break;
      case 'P':
        uint64_t v88 = v4;
        LODWORD(v89) = v6 + 1;
        uint64_t v34 = (unsigned __int8 **)v91;
        v91 += 2;
        int v35 = *v34;
        int v91 = (int *)(v34 + 2);
        int v36 = *((_DWORD *)v34 + 2);
        uint64_t v37 = (v36 - 4);
        if (v36 < 4) {
          goto LABEL_148;
        }
        if (*v35 == 255 && v35[1] == 3)
        {
          uint64_t v38 = v35 + 4;
          unsigned int v39 = __rev16(*((unsigned __int16 *)v35 + 1));
          uint64_t v40 = protocols;
          if (protocols)
          {
            uint64_t v41 = (__int16 **)&off_100043898;
            uint64_t v42 = protocols;
            do
            {
              if (v39 == (unsigned __int16)*v42)
              {
                sub_100024C74((uint64_t)&v88, "[%s");
                int v78 = (*((uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t (*)(uint64_t, void *), char **))v42
                       + 8))(v38, v37, sub_100024C74, &v88);
                sub_100024C74((uint64_t)&v88, "]");
                LODWORD(v37) = v37 - v78;
                goto LABEL_146;
              }
              int v43 = *v41++;
              uint64_t v42 = v43;
            }
            while (v43);
            if (protocols)
            {
              uint64_t v44 = (__int16 **)&off_100043898;
              while (v39 != (*v40 & 0x7FFF))
              {
                uint64_t v45 = *v44++;
                uint64_t v40 = v45;
                if (!v45) {
                  goto LABEL_199;
                }
              }
              if (*((void *)v40 + 12))
              {
                sub_100024C74((uint64_t)&v88, "[%s data");
                uint64_t v79 = (uint64_t (*)(unsigned __int8 *, uint64_t, uint64_t (*)(uint64_t, void *), char **))*((void *)v40 + 20);
                if (v79)
                {
                  int v80 = v79(v38, v37, sub_100024C74, &v88);
                  v38 += v80;
                  LODWORD(v37) = v37 - v80;
                }
                sub_100024C74((uint64_t)&v88, "]\n");
                if ((int)v37 >= 1)
                {
                  do
                  {
                    if ((int)v37 >= 16) {
                      unint64_t v81 = 16;
                    }
                    else {
                      unint64_t v81 = v37;
                    }
                    sub_100024C74((uint64_t)&v88, "  ");
                    uint64_t v82 = 0;
                    do
                    {
                      uint64_t v83 = v82;
                      if (v82 == 8) {
                        sub_100024C74((uint64_t)&v88, "  ");
                      }
                      sub_100024C74((uint64_t)&v88, "%.1B");
                      uint64_t v82 = v83 + 1;
                    }
                    while (v83 + 1 < v81);
                    if (v82 <= 0xF)
                    {
                      int v84 = 15 - v83;
                      do
                      {
                        if (v84 == 8) {
                          sub_100024C74((uint64_t)&v88, "  ");
                        }
                        sub_100024C74((uint64_t)&v88, "   ");
                        --v84;
                      }
                      while (v84);
                    }
                    sub_100024C74((uint64_t)&v88, "   '");
                    uint64_t v85 = 0;
                    do
                    {
                      sub_100024C74((uint64_t)&v88, "%c");
                      ++v85;
                    }
                    while (v85 < (int)v81);
                    sub_100024C74((uint64_t)&v88, "'\n");
                    v38 += 16;
                    BOOL v73 = __OFSUB__(v37, 16);
                    LODWORD(v37) = v37 - 16;
                  }
                  while (!(((int)v37 < 0) ^ v73 | (v37 == 0)));
                }
LABEL_148:
                int v70 = "%.*B";
                goto LABEL_149;
              }
            }
          }
LABEL_199:
          sub_100024C74((uint64_t)&v88, "[proto=0x%x]");
        }
        else
        {
          LODWORD(v37) = v36;
        }
LABEL_146:
        if ((int)v37 < 33) {
          goto LABEL_148;
        }
        int v70 = "%.32B ...";
LABEL_149:
        sub_100024C74((uint64_t)&v88, v70);
        char v4 = v88;
        int v6 = v89 - 1;
LABEL_150:
        if (v6 <= 0) {
          goto LABEL_202;
        }
        break;
      default:
LABEL_118:
        *v4++ = 37;
        if (v16 != 37) {
          unsigned int __src = v11;
        }
        --v6;
        goto LABEL_150;
    }
  }
  switch(v16)
  {
    case 'c':
      uint64_t v55 = v91;
      v91 += 2;
      v92[0] = *v55;
      v92[1] = 0;
      uint64_t v51 = v92;
      goto LABEL_137;
    case 'd':
      uint64_t v56 = (unsigned int *)v91;
      v91 += 2;
      unint64_t v57 = *v56;
      unint64_t v54 = -(int)v57;
      if ((v57 & 0x80000000) == 0) {
        unint64_t v54 = v57;
      }
      uint64_t v52 = (v57 >> 31) & 1;
      goto LABEL_153;
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'n':
    case 'r':
    case 'w':
      goto LABEL_118;
    case 'l':
      int v58 = *__src;
      if (v58 == 117)
      {
        LODWORD(v52) = 0;
        unsigned int __src = v11 + 2;
        int v71 = (unint64_t *)v91;
        v91 += 2;
        unint64_t v54 = *v71;
      }
      else
      {
        if (v58 != 100)
        {
          *(_WORD *)char v4 = 27685;
          v4 += 2;
          v6 -= 2;
          goto LABEL_150;
        }
        unsigned int __src = v11 + 2;
        uint64_t v59 = (uint64_t *)v91;
        v91 += 2;
        uint64_t v60 = *v59;
        if (v60 >= 0) {
          unint64_t v54 = v60;
        }
        else {
          unint64_t v54 = -v60;
        }
        uint64_t v52 = (unint64_t)v60 >> 63;
      }
LABEL_153:
      unint64_t v63 = 10;
LABEL_154:
      char v93 = 0;
      uint64_t v51 = &v93;
      while (v51 > &v92[v52])
      {
        unint64_t v72 = v54;
        v54 /= v63;
        *--uint64_t v51 = a0123456789abcd[v72 - v54 * v63];
        BOOL v73 = __OFSUB__(v20--, 1);
        if ((v20 < 0) ^ v73 | (v20 == 0))
        {
          if (v63 > v72) {
            break;
          }
        }
      }
      if (v52 == 2)
      {
        *((_WORD *)v51 - 1) = 30768;
        v51 -= 2;
      }
      else if (v52 == 1)
      {
        *--uint64_t v51 = 45;
      }
      int v68 = &v93 - v51;
      goto LABEL_164;
    case 'm':
      int v61 = __error();
      uint64_t v51 = strerror(*v61);
      goto LABEL_137;
    case 'o':
      LODWORD(v52) = 0;
      BOOL v62 = (unsigned int *)v91;
      v91 += 2;
      unint64_t v54 = *v62;
      unint64_t v63 = 8;
      goto LABEL_154;
    case 'p':
      uint64_t v52 = (uint64_t)v91;
      v91 += 2;
      unint64_t v54 = *(void *)v52;
      LODWORD(v52) = 2;
      goto LABEL_134;
    case 'q':
    case 'v':
      unsigned int v23 = (const char **)v91;
      v91 += 2;
      int v24 = *v23;
      if (v10 != 48 || v20 < 0)
      {
        int v25 = strlen(*v23);
        if (v20 >= v25 || v20 < 0) {
          int v20 = v25;
        }
      }
      if (v20 < 1 || v6 < 1) {
        goto LABEL_150;
      }
LABEL_45:
      int v29 = *v24++;
      int v28 = v29;
      int v30 = v29;
      if (v16 == 113 || (v28 & 0x80000000) == 0)
      {
        if (v16 != 113)
        {
          if (v30 >= 0x20 && (v30 - 127) >= 0x21)
          {
LABEL_61:
            --v6;
            *v4++ = v30;
            goto LABEL_72;
          }
          goto LABEL_63;
        }
        if (v30 == 92 || v30 == 34)
        {
          --v6;
          *v4++ = 92;
        }
      }
      else
      {
        *char v4 = 77;
        BOOL v31 = v6 >= 2;
        v6 -= 2;
        if (v31)
        {
          v4[1] = 45;
          v4 += 2;
        }
        else
        {
          int v6 = 0;
          ++v4;
        }
        v30 -= 128;
      }
      if (v30 >= 32 && (v30 - 127) >= 0x21)
      {
        if (!v6) {
          break;
        }
        goto LABEL_61;
      }
      if (v16 == 113)
      {
        if (v6)
        {
          int v33 = v6 - 1;
          *v4++ = 92;
        }
        else
        {
          int v33 = 0;
        }
        switch(v30)
        {
          case 8:
            if (v33)
            {
              int v6 = v33 - 1;
              char v32 = 98;
              goto LABEL_66;
            }
            break;
          case 9:
            if (v33)
            {
              int v6 = v33 - 1;
              char v32 = 116;
              goto LABEL_66;
            }
            break;
          case 10:
            if (v33)
            {
              int v6 = v33 - 1;
              char v32 = 110;
              goto LABEL_66;
            }
            break;
          case 12:
            if (v33)
            {
              int v6 = v33 - 1;
              char v32 = 102;
              goto LABEL_66;
            }
            break;
          default:
            if (v33)
            {
              *char v4 = 120;
              if (v33 == 1)
              {
                ++v4;
              }
              else
              {
                v4[1] = a0123456789abcd[(unint64_t)v30 >> 4];
                if (v33 != 2)
                {
                  int v6 = v33 - 3;
                  v4[2] = a0123456789abcd[v30 & 0xF];
                  v4 += 3;
                  goto LABEL_72;
                }
                v4 += 2;
              }
            }
            break;
        }
        break;
      }
LABEL_63:
      if (v30 == 9)
      {
        if (!v6) {
          break;
        }
        --v6;
        char v32 = 9;
LABEL_66:
        *v4++ = v32;
LABEL_72:
        if (v20 < 2) {
          goto LABEL_150;
        }
        --v20;
        if (!v6) {
          goto LABEL_150;
        }
        goto LABEL_45;
      }
      if (!v6) {
        break;
      }
      *char v4 = 94;
      if (v6 != 1)
      {
        v6 -= 2;
        v4[1] = v30 ^ 0x40;
        v4 += 2;
        goto LABEL_72;
      }
      ++v4;
      break;
    case 's':
      int v64 = (char **)v91;
      v91 += 2;
      uint64_t v51 = *v64;
      goto LABEL_137;
    case 't':
      time(&v90);
      uint64_t v65 = ctime(&v90);
      uint64_t v51 = v65 + 4;
      v65[19] = 0;
      goto LABEL_137;
    case 'u':
      LODWORD(v52) = 0;
      ssize_t v69 = (unsigned int *)v91;
      v91 += 2;
      unint64_t v54 = *v69;
      goto LABEL_153;
    case 'x':
      goto LABEL_117;
    default:
      if (v16 != 88) {
        goto LABEL_118;
      }
LABEL_117:
      LODWORD(v52) = 0;
      uint64_t v53 = (unsigned int *)v91;
      v91 += 2;
      unint64_t v54 = *v53;
LABEL_134:
      unint64_t v63 = 16;
      goto LABEL_154;
  }
LABEL_202:
  *char v4 = 0;
  return (v4 - __dst);
}

uint64_t sub_100024C74(uint64_t a1, void *__src)
{
  uint64_t result = vslprintf(*(void *)a1, *(_DWORD *)(a1 + 8), __src);
  *(void *)a1 += (int)result;
  *(_DWORD *)(a1 + 8) -= result;
  return result;
}

size_t init_pr_log(size_t result, int a2)
{
  qword_10004BAB8 = (uint64_t)byte_10004B9B8;
  if (result)
  {
    __strlcpy_chk();
    uint64_t result = strlen(byte_10004B9B8);
    qword_10004BAB8 = (uint64_t)&byte_10004B9B8[result];
  }
  dword_10004BAC0 = a2;
  return result;
}

void end_pr_log()
{
  if ((char *)qword_10004BAB8 != byte_10004B9B8)
  {
    *(unsigned char *)qword_10004BAB8 = 0;
    sub_100024D6C(dword_10004BAC0, byte_10004B9B8);
  }
}

void sub_100024D6C(int a1, const char *a2)
{
  sys_log(a1, "%s", a2);
  if ((log_to_fd & 0x80000000) == 0 && (a1 != 7 || debug))
  {
    time_t v7 = 0;
    int v4 = strlen(a2);
    time(&v7);
    int v5 = localtime(&v7);
    int v6 = strftime(__buf, 0x40uLL, "%c : ", v5);
    if (write(log_to_fd, __buf, v6) != v6) {
      log_to_fd = -1;
    }
    if (v4 >= 1) {
      v4 -= a2[v4 - 1] == 10;
    }
    if (write(log_to_fd, a2, v4) != v4 || write(log_to_fd, "\n", 1uLL) != 1) {
      log_to_fd = -1;
    }
  }
}

void pr_log(uint64_t a1, char *__src, ...)
{
  va_start(va, __src);
  size_t v2 = __s;
  int v3 = vslprintf(__s, 256, __src, (int *)va);
  int v4 = strchr(__s, 10);
  int v5 = v4;
  int v6 = (uint64_t *)qword_10004BAB8;
  if ((char *)qword_10004BAB8 == byte_10004B9B8) {
    goto LABEL_10;
  }
  size_t v2 = __s;
  int v7 = v4 - __s;
  if (!v4) {
    int v7 = v3;
  }
  uint64_t v8 = (uint64_t *)(qword_10004BAB8 + v7);
  if (v8 >= &qword_10004BAB8)
  {
LABEL_9:
    *(unsigned char *)int v6 = 0;
    sub_100024D6C(dword_10004BAC0, byte_10004B9B8);
    qword_10004BAB8 = (uint64_t)byte_10004B9B8;
LABEL_10:
    while (v5)
    {
      *int v5 = 0;
      sub_100024D6C(dword_10004BAC0, v2);
      size_t v2 = v5 + 1;
      int v5 = strchr(v5 + 1, 10);
    }
    int v9 = &__s[v3] - v2;
    if (v9 >= 1)
    {
      __memcpy_chk();
      qword_10004BAB8 = (uint64_t)&byte_10004B9B8[v9];
    }
    return;
  }
  if (v7 >= 1)
  {
    memcpy((void *)qword_10004BAB8, __s, v7);
    qword_10004BAB8 = (uint64_t)v8;
    int v6 = v8;
  }
  if (v5)
  {
    size_t v2 = v5 + 1;
    int v5 = strchr(v5 + 1, 10);
    goto LABEL_9;
  }
}

uint64_t print_string(char *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  a3(a4, "\"");
  if (a2 >= 1)
  {
    int v7 = a2 + 1;
    do
    {
      int v9 = *a1++;
      int v8 = v9;
      if ((v9 - 32) > 0x5E)
      {
        if (v8 == 9)
        {
          uint64_t v10 = a4;
          uint64_t v11 = "\\t";
        }
        else if (v8 == 13)
        {
          uint64_t v10 = a4;
          uint64_t v11 = "\\r";
        }
        else
        {
          uint64_t v10 = a4;
          if (v8 == 10) {
            uint64_t v11 = "\\n";
          }
          else {
            uint64_t v11 = "\\%.3o";
          }
        }
      }
      else
      {
        if (v8 == 92 || v8 == 34) {
          a3(a4, "\\"");
        }
        uint64_t v10 = a4;
        uint64_t v11 = "%c";
      }
      a3(v10, v11);
      --v7;
    }
    while (v7 > 1);
  }

  return ((uint64_t (*)(uint64_t, const char *))a3)(a4, "\"");
}

void fatal()
{
}

void sub_1000251D8()
{
  int v0 = __chkstk_darwin();
  vslprintf(v3, 4096, v1, v2);
  sub_100024D6C(v0, v3);
}

void error(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9 = (char *)__chkstk_darwin();
  vslprintf(v10, 4096, v9, &a9);
  sub_100024D6C(3, v10);
  ++error_count;
}

void warning(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9 = (char *)__chkstk_darwin();
  vslprintf(v10, 4096, v9, &a9);
  sub_100024D6C(4, v10);
}

void notice(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9 = (char *)__chkstk_darwin();
  vslprintf(v10, 4096, v9, &a9);
  sub_100024D6C(5, v10);
}

void info(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9 = (char *)__chkstk_darwin();
  vslprintf(v10, 4096, v9, &a9);
  sub_100024D6C(6, v10);
}

void dbglog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9 = (char *)__chkstk_darwin();
  vslprintf(v10, 4096, v9, &a9);
  sub_100024D6C(7, v10);
}

void dump_packet(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (debug)
  {
    if ((int)a3 < 8) {
      goto LABEL_17;
    }
    unsigned int v8 = __rev16(*(unsigned __int16 *)(a2 + 2));
    BOOL v9 = debug <= 1 && unsuccess == 0;
    if (!v9 || v8 != 49185) {
      goto LABEL_17;
    }
    unsigned int v11 = __rev16(*(unsigned __int16 *)(a2 + 6));
    int v12 = *(unsigned __int8 *)(a2 + 4);
    if ((v12 - 9) >= 2)
    {
      if (v12 != 13 || v11 <= 3) {
        goto LABEL_17;
      }
    }
    else if (v11 < 4)
    {
LABEL_17:
      dbglog((uint64_t)"%s %P", a2, a3, a4, a5, a6, a7, a8, a1);
      return;
    }
    if (v11 <= (int)a3 - 4) {
      return;
    }
    goto LABEL_17;
  }
}

uint64_t complete_read(int a1, char *a2, size_t a3)
{
  if (!a3) {
    return 0;
  }
  unint64_t v6 = 0;
  size_t v7 = a3;
  do
  {
    while (1)
    {
      ssize_t v8 = read(a1, a2, v7);
      if (v8 < 0) {
        break;
      }
      if (v8)
      {
        v6 += v8;
        a2 += v8;
        size_t v7 = a3 - v6;
        if (a3 > v6) {
          continue;
        }
      }
      return v6;
    }
  }
  while (*__error() == 4);
  return -1;
}

uint64_t lock(char *a1)
{
  size_t v2 = strstr(a1, "dev/");
  if (v2)
  {
    int v3 = __dst;
    strncpy(__dst, v2 + 4, 0x3FFuLL);
    __dst[1023] = 0;
    for (uint64_t i = strrchr(__dst, 47); i; uint64_t i = strrchr(__dst, 47))
    {
      *uint64_t i = 95;
      int v3 = __dst;
    }
  }
  else
  {
    int v5 = strrchr(a1, 47);
    if (v5) {
      int v3 = v5 + 1;
    }
    else {
      int v3 = a1;
    }
  }
  slprintf((int)&byte_10004BAC4, 1024, "%s/LCK..%s");
  int v6 = open(&byte_10004BAC4, 2562, 420, v3);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_9:
    getpid();
    slprintf((int)__buf, 12, "%10d\n");
    write(v6, __buf, 0xBuLL);
    close(v6);
    return 0;
  }
  while (1)
  {
    if (*__error() != 17)
    {
      error((uint64_t)"Can't create lock file %s: %m", v8, v9, v10, v11, v12, v13, v14, (int)&byte_10004BAC4);
      goto LABEL_28;
    }
    int v15 = open(&byte_10004BAC4, 0, 0);
    if (v15 < 0) {
      break;
    }
    int v16 = v15;
    int v17 = read(v15, __buf, 0xBuLL);
    close(v16);
    if (v17 <= 0)
    {
      error((uint64_t)"Can't read pid from lock file %s", v18, v19, v20, v21, v22, v23, v24, (int)&byte_10004BAC4);
      goto LABEL_28;
    }
    __buf[v17] = 0;
    uint64_t v25 = atoi(__buf);
    if (v25 == getpid()) {
      return 1;
    }
    if (v25 && (kill(v25, 0) != -1 || *__error() != 3))
    {
      notice((uint64_t)"Device %s is locked by pid %d", v26, v27, v28, v29, v30, v31, v32, (int)v3);
      goto LABEL_28;
    }
    if (unlink(&byte_10004BAC4))
    {
      warning((uint64_t)"Couldn't remove stale lock on %s", v33, v34, v35, v36, v37, v38, v39, (int)v3);
      goto LABEL_28;
    }
    uint64_t v48 = v25;
    notice((uint64_t)"Removed stale lock on %s (pid %d)", v33, v34, v35, v36, v37, v38, v39, (int)v3);
LABEL_20:
    int v47 = open(&byte_10004BAC4, 2562, 420, v48);
    if ((v47 & 0x80000000) == 0)
    {
      int v6 = v47;
      goto LABEL_9;
    }
  }
  if (*__error() == 2) {
    goto LABEL_20;
  }
  error((uint64_t)"Can't open existing lock file %s: %m", v40, v41, v42, v43, v44, v45, v46, (int)&byte_10004BAC4);
LABEL_28:
  byte_10004BAC4 = 0;
  return 0xFFFFFFFFLL;
}

uint64_t relock()
{
  if (byte_10004BAC4)
  {
    int v0 = open(&byte_10004BAC4, 1, 0);
    if ((v0 & 0x80000000) == 0)
    {
      int v8 = v0;
      slprintf((int)__buf, 12, "%10d\n");
      write(v8, __buf, 0xBuLL);
      close(v8);
      return 0;
    }
    error((uint64_t)"Couldn't reopen lock file %s: %m", v1, v2, v3, v4, v5, v6, v7, (int)&byte_10004BAC4);
    byte_10004BAC4 = 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t unlock()
{
  if (byte_10004BAC4)
  {
    uint64_t result = unlink(&byte_10004BAC4);
    byte_10004BAC4 = 0;
  }
  return result;
}

void log_vpn_interface_address_event(int a1, _DWORD *a2, int a3, int a4, void *a5)
{
  if (a2)
  {
    int v23 = ntohl();
    switch(a2[5])
    {
      case 1:
        addr2ascii(2, a5, 4, v27);
        sub_100025DF8(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        addr2ascii(2, &v23, 4, v25);
        addr2ascii(2, a2 + 18, 4, v24);
        int v15 = "%s: Address added. previous interface setting (name: %s, address: %s), current interface setting (name: %s"
              "%d, family: %s, address: %s, subnet: %s, destination: %s).";
        break;
      case 2:
        addr2ascii(2, a5, 4, v27);
        sub_100025DF8(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        addr2ascii(2, &v23, 4, v25);
        addr2ascii(2, a2 + 18, 4, v24);
        int v15 = "%s: Address changed. previous interface setting (name: %s, address: %s), current interface setting (name: "
              "%s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        break;
      case 3:
        addr2ascii(2, a5, 4, v27);
        sub_100025DF8(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        addr2ascii(2, &v23, 4, v25);
        addr2ascii(2, a2 + 18, 4, v24);
        int v15 = "%s: Address deleted. previous interface setting (name: %s, address: %s), deleted interface setting (name: "
              "%s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        break;
      case 7:
        addr2ascii(2, a5, 4, v27);
        sub_100025DF8(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        int v15 = "%s: ARP collided. previous interface setting (name: %s, address: %s), conflicting interface setting (name:"
              " %s%d, family: %s, address: %s, mac: %x:%x:%x:%x:%x:%x).";
        break;
      default:
        addr2ascii(2, a5, 4, v27);
        sub_100025DF8(a2[6]);
        addr2ascii(2, a2 + 12, 4, v26);
        addr2ascii(2, &v23, 4, v25);
        addr2ascii(2, a2 + 18, 4, v24);
        int v15 = "%s: Other Address event (%d). previous interface setting (name: %s, address: %s), other interface setting "
              "(name: %s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        break;
    }
    notice((uint64_t)v15, v8, v9, v10, v11, v12, v13, v14, a1);
  }
  else
  {
    addr2ascii(2, a5, 4, v27);
    notice((uint64_t)"%s: %d secs TIMEOUT waiting for interface to be reconfigured. previous setting (name: %s, address: %s).", v16, v17, v18, v19, v20, v21, v22, a1);
  }
}

char *sub_100025DF8(int a1)
{
  if ((a1 - 1) < 0xE) {
    return (&off_10003CCA8)[a1 - 1];
  }
  uint64_t v1 = byte_10004BEC4;
  snprintf(byte_10004BEC4, 0x10uLL, "%d", a1);
  return v1;
}

BOOL check_vpn_interface_or_service_unrecoverable(const __SCDynamicStore *a1, uint64_t a2, uint64_t a3, char *cStr, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2;
  if (!a1)
  {
    dbglog((uint64_t)"%s: invalid SCDynamicStore reference", a2, a3, (uint64_t)cStr, a5, a6, a7, a8, a2);
    return 0;
  }
  if ((*(_DWORD *)(a3 + 20) & 0xFFFFFFFE) != 2) {
    return 0;
  }
  memset(v95, 0, 512);
  memset(v94, 0, 512);
  CFStringRef v10 = CFStringCreateWithCStringNoCopy(0, cStr, 0x600u, kCFAllocatorNull);
  if (v10)
  {
    CFStringRef v18 = v10;
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    uint64_t v20 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainSetup, v18, kSCEntNetAirPort);
    CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
    CFRelease(NetworkInterfaceEntity);
    CFStringRef v22 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, v18, kSCEntNetAirPort);
    CFArrayAppendValue(Mutable, v22);
    CFRelease(v22);
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, kSCEntNetInterface);
    CFArrayAppendValue(v20, NetworkServiceEntity);
    CFRelease(NetworkServiceEntity);
    CFStringRef v24 = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, kSCEntNetIPv4);
    CFArrayAppendValue(v20, v24);
    CFRelease(v24);
    CFDictionaryRef v25 = SCDynamicStoreCopyMultiple(a1, Mutable, v20);
    CFRelease(Mutable);
    CFRelease(v20);
    if (v25)
    {
      CFIndex Count = CFDictionaryGetCount(v25);
      if (Count <= 0)
      {
        notice((uint64_t)"%s: empty SCDynamicStore dictionary", v34, v35, v36, v37, v38, v39, v40, v8);
        CFRelease(v18);
        int v45 = 0;
        int v46 = 0;
      }
      else
      {
        CFIndex v41 = Count;
        if ((unint64_t)Count < 0x81)
        {
          uint64_t v43 = (const void **)v94;
          uint64_t v42 = (const void **)v95;
        }
        else
        {
          uint64_t v42 = (const void **)CFAllocatorAllocate(0, 8 * Count, 0);
          uint64_t v43 = (const void **)CFAllocatorAllocate(0, 8 * v41, 0);
        }
        CFDictionaryRef theDict = v25;
        CFDictionaryGetKeysAndValues(v25, v42, v43);
        int v46 = 0;
        for (uint64_t i = 0; i != v41; ++i)
        {
          CFStringRef v48 = (const __CFString *)v42[i];
          CFDictionaryRef v49 = (const __CFDictionary *)v43[i];
          CFTypeID TypeID = CFStringGetTypeID();
          if (v48)
          {
            if (CFGetTypeID(v48) == TypeID)
            {
              CFTypeID v51 = CFDictionaryGetTypeID();
              if (v49)
              {
                if (CFGetTypeID(v49) == v51)
                {
                  if (CFStringHasSuffix(v48, kSCEntNetInterface))
                  {
                    CFDictionaryRef Value = CFDictionaryGetValue(v49, kSCPropNetInterfaceDeviceName);
                    CFTypeID v53 = CFStringGetTypeID();
                    if (Value && CFGetTypeID(Value) == v53 && CFEqual(v18, Value))
                    {
                      CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v48, @"/");
                      if (CFArrayGetCount(ArrayBySeparatingStrings) < 4)
                      {
                        int v72 = 0;
                      }
                      else
                      {
                        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 3);
                        CFStringRef v56 = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, ValueAtIndex, kSCEntNetIPv4);
                        if (v56)
                        {
                          CFStringRef v64 = v56;
                          if (CFDictionaryGetValue(theDict, v56))
                          {
                            int v72 = 0;
                          }
                          else
                          {
                            notice((uint64_t)"%s: detected disabled IPv4 Config", v65, v66, v67, v68, v69, v70, v71, v8);
                            int v72 = 1;
                          }
                          CFRelease(v64);
                        }
                        else
                        {
                          notice((uint64_t)"%s: detected disabled IPv4 Config", v57, v58, v59, v60, v61, v62, v63, v8);
                          int v72 = 1;
                        }
                      }
                      if (ArrayBySeparatingStrings) {
                        CFRelease(ArrayBySeparatingStrings);
                      }
                      int v46 = 1;
                      int v45 = 1;
                      if (v72) {
                        goto LABEL_49;
                      }
                    }
                  }
                  else if (CFStringHasSuffix(v48, kSCEntNetAirPort))
                  {
                    if (CFStringHasPrefix(v48, kSCDynamicStoreDomainSetup))
                    {
                      BOOL v73 = CFDictionaryGetValue(v49, @"PowerEnabled");
                      CFTypeID v74 = CFBooleanGetTypeID();
                      if (v73 && CFGetTypeID(v73) == v74 && CFEqual(v73, kCFBooleanFalse))
                      {
                        notice((uint64_t)"%s: detected AirPort, PowerEnable == FALSE", v75, v76, v77, v78, v79, v80, v81, v8);
                        int v45 = 1;
                        goto LABEL_49;
                      }
                    }
                    else if (CFStringHasPrefix(v48, kSCDynamicStoreDomainState))
                    {
                      __int16 valuePtr = 0;
                      uint64_t v82 = CFDictionaryGetValue(v49, @"Power Status");
                      CFTypeID v83 = CFNumberGetTypeID();
                      if (v82)
                      {
                        if (CFGetTypeID(v82) == v83
                          && CFNumberGetValue((CFNumberRef)v82, kCFNumberShortType, &valuePtr)
                          && !valuePtr)
                        {
                          notice((uint64_t)"%s: detected AirPort, PowerStatus == 0", v84, v85, v86, v87, v88, v89, v90, v8);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        int v45 = 0;
LABEL_49:
        CFRelease(v18);
        if (v42 != (const void **)v95)
        {
          CFAllocatorDeallocate(0, v42);
          CFAllocatorDeallocate(0, v43);
        }
        CFDictionaryRef v25 = theDict;
      }
      CFRelease(v25);
      return v45 || v46 == 0;
    }
    notice((uint64_t)"%s: failed to initialize SCDynamicStore dictionary", v26, v27, v28, v29, v30, v31, v32, v8);
    CFRelease(v18);
  }
  else
  {
    notice((uint64_t)"%s: failed to initialize interface CFString", v11, v12, v13, v14, v15, v16, v17, v8);
  }
  int v45 = 0;
  int v46 = 0;
  return v45 || v46 == 0;
}

BOOL check_vpn_interface_address_change(int a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  return a1
      && (*(_DWORD *)(a2 + 20) - 1) <= 1
      && *a5 != *(_DWORD *)(a2 + 48)
      && ntohl() >> 16 != 43518;
}

BOOL check_vpn_interface_alternate(int a1, uint64_t a2)
{
  return a1 && (*(_DWORD *)(a2 + 20) - 1) <= 1 && ntohl() >> 16 != 43518;
}

double sub_10002655C(int a1)
{
  uint64_t v1 = (char *)&eap + 416 * a1;
  *((_OWORD *)v1 + 24) = 0u;
  *((_OWORD *)v1 + 25) = 0u;
  *((_OWORD *)v1 + 22) = 0u;
  *((_OWORD *)v1 + 23) = 0u;
  *((_OWORD *)v1 + 20) = 0u;
  *((_OWORD *)v1 + 21) = 0u;
  *((_OWORD *)v1 + 18) = 0u;
  *((_OWORD *)v1 + 19) = 0u;
  *((_OWORD *)v1 + 16) = 0u;
  *((_OWORD *)v1 + 17) = 0u;
  *((_OWORD *)v1 + 14) = 0u;
  *((_OWORD *)v1 + 15) = 0u;
  *((_OWORD *)v1 + 12) = 0u;
  *((_OWORD *)v1 + 13) = 0u;
  *((_OWORD *)v1 + 10) = 0u;
  *((_OWORD *)v1 + 11) = 0u;
  *((_OWORD *)v1 + 8) = 0u;
  *((_OWORD *)v1 + 9) = 0u;
  *((_OWORD *)v1 + 6) = 0u;
  *((_OWORD *)v1 + 7) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  *((_OWORD *)v1 + 5) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_DWORD *)v1 + 1) = 0;
  *((_DWORD *)v1 + 2) = 0;
  *(_DWORD *)uint64_t v1 = a1;
  *((void *)v1 + 38) = 0xA00000003;
  double result = NAN;
  *((void *)v1 + 44) = -1;
  return result;
}

void sub_1000265C4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if ((int)a3 < 4) {
    return;
  }
  __int16 v9 = a3;
  unsigned int v11 = __rev16(*(unsigned __int16 *)(a2 + 2));
  int v12 = v11 - 4;
  if (v11 < 4 || v11 > a3) {
    return;
  }
  uint64_t v15 = (unsigned int *)((char *)&eap + 416 * a1);
  int v16 = *(unsigned __int8 *)(a2 + 1);
  switch(*(unsigned char *)a2)
  {
    case 1:
      if (v11 == 4) {
        return;
      }
      if ((*((_DWORD *)&eap + 104 * a1 + 1) - 1) < 2) {
        return;
      }
      int v17 = *(unsigned __int8 *)(a2 + 4);
      switch(v17)
      {
        case 3:
          return;
        case 2:
          info((uint64_t)"Remote message: %0.*v", a2, a3, a4, a5, a6, a7, a8, v11 - 5);
          outpacket_buf = 667026431;
          LOBYTE(word_100048120) = 2;
          HIBYTE(word_100048120) = v16;
          word_100048122 = 1024;
          uint64_t v25 = *v15;
          uint64_t v26 = 8;
          break;
        case 1:
          CFStringRef v18 = (const char *)*((void *)&eap + 52 * a1 + 2);
          int v19 = strlen(v18);
          outpacket_buf = 667026431;
          LOBYTE(word_100048120) = 2;
          HIBYTE(word_100048120) = v16;
          LOBYTE(word_100048122) = (unsigned __int16)(v19 + 5) >> 8;
          HIBYTE(word_100048122) = v19 + 5;
          byte_100048124 = 1;
          memcpy(byte_100048125, v18, v19 + 1 - 1);
          uint64_t v25 = *v15;
          uint64_t v26 = (v19 + 9);
          break;
        default:
          uint64_t v42 = (char *)&eap + 416 * a1;
          uint64_t v43 = *((void *)v42 + 40);
          if (v43)
          {
            if (*(unsigned __int8 *)(v43 + 8) != v17)
            {
              error((uint64_t)"EAP received an unexpected request for type %d", a2, a3, a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 4));
              return;
            }
            goto LABEL_26;
          }
          uint64_t v55 = v42 + 320;
          CFStringRef v56 = &eap_extensions;
          while (1)
          {
            CFStringRef v56 = (uint64_t *)*v56;
            if (!v56) {
              break;
            }
            if (*((unsigned __int8 *)v56 + 8) == v17)
            {
              *(void *)uint64_t v55 = v56;
              uint64_t v57 = (char *)&eap + 416 * a1;
              *((void *)v57 + 42) = malloc_type_malloc(0x40uLL, 0x1090040C3ADEBCBuLL);
              uint64_t v58 = malloc_type_malloc(0x18uLL, 0x10900405F3747B1uLL);
              *((void *)v57 + 43) = v58;
              uint64_t v59 = (_DWORD *)*((void *)v57 + 42);
              if (v59) {
                BOOL v60 = v58 == 0;
              }
              else {
                BOOL v60 = 1;
              }
              if (!v60)
              {
                *uint64_t v59 = 64;
                _WORD *v58 = 24;
                __int16 mtu = netif_get_mtu();
                uint64_t v62 = *((void *)v57 + 42);
                *(_WORD *)(v62 + 4) = mtu;
                uint64_t v63 = (char *)&eap + 416 * a1;
                *(_OWORD *)(v62 + 24) = *((_OWORD *)v63 + 1);
                *(void *)(v62 + 40) = *((void *)v63 + 4);
                *(void *)(v62 + 48) = dbglog;
                *(void *)(v62 + 56) = error;
                *(_DWORD *)(v62 + 6) = 0;
                CFStringRef v64 = *(unsigned int (**)(uint64_t, char *))(*(void *)v55 + 40);
                *(void *)(v62 + 16) = *(void *)(*(void *)v55 + 32);
                if (v64(v62, v63 + 328))
                {
                  uint64_t v68 = (const char *)v56[2];
                  if (!v68) {
                    uint64_t v68 = "???";
                  }
                  error((uint64_t)"EAP cannot initialize plugin for %s (request type %d)", v65, v66, v67, a5, a6, a7, a8, (int)v68);
                  int v69 = *v15;
                  auth_withpeer_fail(v69, 49703);
                  return;
                }
LABEL_26:
                sub_100027B94(v15, 4, a2, v9, a5, a6, a7, a8, a9);
                return;
              }
LABEL_79:
              novm();
            }
          }
          error((uint64_t)"EAP refuse to authenticate using type %d", a2, a3, a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 4));
          if (!eap_extensions) {
            return;
          }
          error((uint64_t)"EAP send NAK requesting type %d", v87, v88, v89, v90, v91, v92, v93, *(unsigned __int8 *)(eap_extensions + 8));
          outpacket_buf = 667026431;
          LOBYTE(word_100048120) = 2;
          HIBYTE(word_100048120) = v16;
          word_100048122 = 1536;
          byte_100048124 = 3;
          byte_100048125[0] = *(unsigned char *)(eap_extensions + 8);
          uint64_t v25 = *v15;
          uint64_t v26 = 10;
          break;
      }
      output(v25, (uint64_t)&outpacket_buf, v26, v20, v21, v22, v23, v24, a9);
      return;
    case 2:
      uint64_t v27 = (char *)&eap + 416 * a1;
      int v29 = *((_DWORD *)v27 + 2);
      uint64_t v28 = v27 + 8;
      if ((v29 - 1) < 2) {
        return;
      }
      if (v11 == 4) {
        return;
      }
      uint64_t v30 = (char *)&eap + 416 * a1;
      if (v30[296] != v16) {
        return;
      }
      uint64_t v31 = (unsigned __int8 *)(a2 + 5);
      int v32 = *(unsigned __int8 *)(a2 + 4);
      uint64_t v33 = (char *)&eap + 416 * a1;
      if (v32 != 3)
      {
        int v44 = v33[298];
        if (v44 && v32 != v44) {
          return;
        }
        untimeout((uint64_t)sub_100027710, (uint64_t)v15);
        if (v32 == 1)
        {
          if (v12 >= 256) {
            int v45 = 256;
          }
          else {
            int v45 = v12;
          }
          unsigned int v46 = v45 - 1;
          memcpy((char *)&eap + 416 * a1 + 40, v31, (v45 - 1));
          *((unsigned char *)&eap + 416 * a1 + v46 + 40) = 0;
          CFIndex v41 = (uint64_t *)eap_extensions;
          if (eap_extensions) {
            goto LABEL_60;
          }
          unint64_t v54 = "No EAP server protocol available";
          goto LABEL_76;
        }
LABEL_68:
        CFTypeID v83 = v15;
        __int16 v84 = 4;
        uint64_t v85 = a2;
        __int16 v86 = v9;
LABEL_70:
        sub_100027830(v83, v84, v85, v86, v35, v36, v37, v38, a9);
        return;
      }
      if (!*((void *)v33 + 48)) {
        return;
      }
      uint64_t v34 = v33 + 384;
      untimeout((uint64_t)sub_100027710, (uint64_t)v15);
      int v39 = *v31;
      uint64_t v40 = *(void *)v34;
      CFIndex v41 = &eap_extensions;
      while (1)
      {
        CFIndex v41 = (uint64_t *)*v41;
        if (!v41) {
          break;
        }
        if (*((unsigned __int8 *)v41 + 8) == v39) {
          goto LABEL_58;
        }
      }
      if (!*(unsigned char *)(v40 + 8)) {
        goto LABEL_68;
      }
LABEL_58:
      uint64_t v70 = (char *)&eap + 416 * a1;
      (*(void (**)(void))(v40 + 48))(*((void *)v70 + 49));
      free(*((void **)v70 + 50));
      free(*((void **)v70 + 51));
      *(_OWORD *)uint64_t v34 = 0u;
      *((_OWORD *)v34 + 1) = 0u;
      if (v41 || (CFIndex v41 = *(uint64_t **)v40) != 0)
      {
LABEL_60:
        uint64_t v71 = (char *)&eap + 416 * a1;
        *((void *)v71 + 48) = v41;
        v71[298] = *((unsigned char *)v41 + 8);
        *((void *)v71 + 50) = malloc_type_malloc(0x40uLL, 0x1090040C3ADEBCBuLL);
        int v72 = malloc_type_malloc(0x18uLL, 0x10900405F3747B1uLL);
        *((void *)v71 + 51) = v72;
        uint64_t v73 = *((void *)v71 + 50);
        if (v73) {
          BOOL v74 = v72 == 0;
        }
        else {
          BOOL v74 = 1;
        }
        if (v74) {
          goto LABEL_79;
        }
        *(_WORD *)uint64_t v73 = 64;
        *int v72 = 24;
        *(unsigned char *)(v73 + 2) = 1;
        *(unsigned char *)(v73 + 3) = v30[296] + 1;
        __int16 v75 = netif_get_mtu();
        uint64_t v76 = *((void *)v71 + 50);
        *(_WORD *)(v76 + 4) = v75;
        uint64_t v77 = (char *)&eap + 416 * a1;
        *(void *)(v76 + 24) = v77 + 40;
        *(void *)(v76 + 32) = 0;
        *(void *)(v76 + 40) = 0;
        *(void *)(v76 + 48) = dbglog;
        *(void *)(v76 + 56) = error;
        *(_DWORD *)(v76 + 6) = 0;
        uint64_t v78 = *(unsigned int (**)(uint64_t, char *))(*((void *)v71 + 48) + 40);
        *(void *)(v76 + 16) = *(void *)(*((void *)v71 + 48) + 32);
        if (v78(v76, v77 + 392))
        {
          uint64_t v82 = (const char *)v41[2];
          if (!v82) {
            uint64_t v82 = "???";
          }
          error((uint64_t)"EAP cannot initialize plugin for %s (request type %d)", v79, v80, v81, v35, v36, v37, v38, (int)v82);
          return;
        }
        CFTypeID v83 = v15;
        __int16 v84 = 1;
        uint64_t v85 = 0;
        __int16 v86 = 0;
        goto LABEL_70;
      }
      unint64_t v54 = "Server and client disagree on EAP type";
LABEL_76:
      error((uint64_t)v54, v47, v48, v49, v50, v51, v52, v53, v101);
      *uint64_t v28 = 6;
      int v100 = *v15;
      auth_peer_fail(v100, 49703, v94, v95, v96, v97, v98, v99);
      return;
    case 3:
      if (*((_DWORD *)&eap + 104 * a1 + 1) != 4) {
        goto LABEL_26;
      }
      return;
    case 4:
      goto LABEL_26;
    default:
      warning((uint64_t)"Unknown EAP code (%d) received.", a2, a3, a4, a5, a6, a7, a8, 416);
      return;
  }
}

double sub_100026D10(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*((_DWORD *)&eap + 104 * a1 + 2) >= 2u) {
    auth_peer_fail(a1, 49703, a3, a4, a5, a6, a7, a8);
  }
  if (*((_DWORD *)&eap + 104 * a1 + 1) >= 2u) {
    auth_withpeer_fail(a1, 49703);
  }

  return sub_100026E18(a1);
}

void sub_100026D98(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v9 = (unsigned int *)((char *)&eap + 416 * a1);
  unsigned int v10 = v9[1];
  if (v10)
  {
    if (v10 != 2) {
      goto LABEL_6;
    }
    int v11 = 3;
  }
  else
  {
    int v11 = 1;
  }
  v9[1] = v11;
LABEL_6:
  int v12 = (char *)&eap + 416 * a1;
  int v15 = *((_DWORD *)v12 + 2);
  uint64_t v14 = (int *)(v12 + 8);
  int v13 = v15;
  if (v15)
  {
    if (v13 != 2) {
      return;
    }
    sub_100027300(v9, a2, a3, a4, a5, a6, a7, a8);
    int v16 = 3;
  }
  else
  {
    int v16 = 1;
  }
  *uint64_t v14 = v16;
}

double sub_100026E18(int a1)
{
  uint64_t v2 = (char *)&eap + 416 * a1;
  int v3 = *((_DWORD *)v2 + 2);
  uint64_t v4 = sub_100027710;
  BOOL v5 = v3 == 3 || v3 == 5;
  if (v5 || v3 == 4 && (uint64_t v4 = sub_1000277DC, *((_DWORD *)&eap + 104 * a1 + 75))) {
    untimeout((uint64_t)v4, (uint64_t)v2);
  }
  uint64_t v7 = (char *)&eap + 416 * a1;
  *((_DWORD *)v7 + 1) = 0;
  *((_DWORD *)v7 + 2) = 0;
  uint64_t v8 = *((void *)v7 + 40);
  if (v8)
  {
    __int16 v9 = v7 + 320;
    unsigned int v10 = (char *)&eap + 416 * a1;
    (*(void (**)(void))(v8 + 48))(*((void *)v10 + 41));
    free(*((void **)v10 + 42));
    free(*((void **)v10 + 43));
    double result = 0.0;
    *__int16 v9 = 0u;
    v9[1] = 0u;
  }
  int v11 = (char *)&eap + 416 * a1;
  uint64_t v12 = *((void *)v11 + 48);
  if (v12)
  {
    int v13 = v11 + 384;
    uint64_t v14 = (char *)&eap + 416 * a1;
    (*(void (**)(void))(v12 + 48))(*((void *)v14 + 49));
    free(*((void **)v14 + 50));
    free(*((void **)v14 + 51));
    double result = 0.0;
    *int v13 = 0u;
    v13[1] = 0u;
  }
  return result;
}

uint64_t sub_100026F1C(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0;
  }
  int v6 = a1[2];
  int v7 = a1[3];
  unsigned int v8 = v7 | (v6 << 8);
  int v9 = v8 - 4;
  if (v8 < 4 || v8 > a2) {
    return 0;
  }
  uint64_t v13 = *a1;
  int v14 = a1[1];
  if ((v13 - 1) > 3u) {
    int v15 = " code=0x%x";
  }
  else {
    int v15 = " %s";
  }
  a3(a4, v15);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v14);
  if ((v13 - 1) < 2)
  {
    if (v8 >= 5)
    {
      int v18 = a1[4];
      if ((v18 - 1) >= 3)
      {
        uint64_t v21 = &eap_extensions;
        while (1)
        {
          uint64_t v21 = (uint64_t *)*v21;
          if (!v21) {
            break;
          }
          if (*((unsigned __int8 *)v21 + 8) == v18) {
            goto LABEL_27;
          }
        }
        uint64_t v22 = " type=0x%x ";
      }
      else
      {
LABEL_27:
        uint64_t v22 = " %s ";
      }
      a3(a4, v22);
      unsigned int v17 = v8 - 5;
      if (v8 != 5)
      {
        uint64_t v23 = (char *)(a1 + 5);
        if ((v18 - 1) >= 2u)
        {
          uint64_t v24 = &eap_extensions;
          while (1)
          {
            uint64_t v24 = (uint64_t *)*v24;
            if (!v24) {
              break;
            }
            if (*((unsigned __int8 *)v24 + 8) == v18)
            {
              uint64_t v25 = (void (*)(void (*)(uint64_t, const char *), uint64_t, uint64_t, char *, void))v24[11];
              if (v25)
              {
                v25(a3, a4, v13, v23, v8 - 5);
                return v17 + 5;
              }
              break;
            }
          }
          a3(a4, "<");
          do
          {
            int v26 = *v23++;
            ((void (*)(uint64_t, const char *, ...))a3)(a4, "%.2x", v26);
            --v9;
          }
          while (v9 > 1);
        }
        else
        {
          a3(a4, "<");
          print_string(v23, v8 - 5, a3, a4);
        }
        a3(a4, ">");
      }
      return v17 + 5;
    }
    goto LABEL_23;
  }
  int v16 = (char *)(a1 + 4);
  if ((v13 - 3) >= 2)
  {
    if (v8 >= 5)
    {
      unsigned int v19 = (v6 << 8) + v7 - 3;
      do
      {
        int v20 = *v16++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v20);
        --v19;
      }
      while (v19 > 1);
      goto LABEL_15;
    }
LABEL_23:
    unsigned int v17 = 0;
    return v17 + 5;
  }
  a3(a4, " ");
  print_string(v16, v8 - 4, a3, a4);
LABEL_15:
  unsigned int v17 = v8 - 4;
  return v17 + 5;
}

uint64_t EapAuthWithPeer(uint64_t result)
{
  int v1 = result;
  uint64_t v2 = (void *)eap_extensions;
  if (username) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = eap_extensions == 0;
  }
  if (!v3)
  {
    do
    {
      uint64_t v4 = (uint64_t (*)(char *, uint64_t))v2[12];
      if (v4)
      {
        double result = v4(&username, 256);
        if (!result) {
          break;
        }
      }
      uint64_t v2 = (void *)*v2;
    }
    while (v2);
  }
  BOOL v5 = (int64x2_t *)((char *)&eap + 416 * v1);
  v5[1] = vdupq_n_s64((unint64_t)&username);
  v5[2].i64[0] = (uint64_t)&passwd;
  if ((v5->i32[1] & 0xFFFFFFFD) != 0) {
    int v6 = 3;
  }
  else {
    int v6 = 2;
  }
  v5->i32[1] = v6;
  return result;
}

void EapAuthPeer(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = (char *)&eap + 416 * a1;
  int v10 = *((_DWORD *)v8 + 2);
  int v9 = v8 + 8;
  *((void *)v9 + 2) = 0;
  *((void *)v9 + 3) = 0;
  *((void *)v9 + 1) = &user;
  v9[290] = 1;
  *((_DWORD *)v9 + 76) = 0;
  v9[288] = 1;
  if ((v10 | 2) == 2)
  {
    int v11 = 2;
  }
  else
  {
    sub_100027300((unsigned int *)&eap + 104 * a1, a2, a3, a4, a5, a6, a7, a8);
    int v11 = 3;
  }
  *(_DWORD *)int v9 = v11;
}

void sub_100027300(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  outpacket_buf = 667026431;
  LOBYTE(word_100048120) = 1;
  HIBYTE(word_100048120) = *((unsigned char *)a1 + 296);
  word_100048122 = 1280;
  byte_100048124 = *((unsigned char *)a1 + 298);
  output(*a1, (uint64_t)&outpacket_buf, 9, a4, a5, a6, a7, a8, v9);
  timeout((int)sub_100027710);
  ++a1[78];
}

void EapLostSuccess(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v10[0] = 3;
  unsigned int v8 = (char *)&eap + 416 * a1;
  v10[1] = v8[297];
  __int16 v11 = 1024;
  if (*((_DWORD *)v8 + 1) != 4) {
    sub_100027B94((unsigned int *)&eap + 104 * a1, 4, (uint64_t)v10, 4, a5, a6, a7, a8, v9);
  }
}

void EapLostFailure(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = (unsigned int *)((char *)&eap + 416 * a1);
  v10[0] = 4;
  v10[1] = *((unsigned char *)v8 + 297);
  __int16 v11 = 1024;
  sub_100027B94(v8, 4, (uint64_t)v10, 4, a5, a6, a7, a8, v9);
}

uint64_t EAPAllowedAddr()
{
  return 1;
}

uint64_t EapExtAdd(uint64_t a1)
{
  int v1 = &eap_extensions;
  uint64_t v2 = eap_extensions;
  if (eap_extensions)
  {
    while (1)
    {
      int v1 = (uint64_t *)v2;
      if (*(unsigned __int8 *)(v2 + 8) == *(unsigned __int8 *)(a1 + 8)) {
        return 1;
      }
      uint64_t v2 = *(void *)v2;
      if (!*v1) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    uint64_t v3 = 0;
    uint64_t *v1 = a1;
    *(void *)a1 = 0;
  }
  return v3;
}

uint64_t EAPClientUIThread(int a1)
{
  char __buf = -1;
  uint64_t v2 = pthread_self();
  if (!pthread_detach(v2))
  {
    uint64_t v4 = *(unsigned int (**)(void, void, char *, char *))(*((void *)&eap + 52 * a1 + 40) + 80);
    if (v4)
    {
      if (!v4(*((void *)&eap + 52 * a1 + 45), *((unsigned int *)&eap + 104 * a1 + 92), (char *)&eap + 416 * a1 + 360, (char *)&eap + 416 * a1 + 368))char __buf = 0; {
    }
      }
  }
  write(SHIDWORD(qword_100049F58), &__buf, 1uLL);
  return 0;
}

uint64_t EapGetClientSecret(unsigned int *a1, const char *a2, const char *a3, void *a4, int *a5)
{
  int v6 = (int)a3;
  int secret = get_secret((void *)*a1, a2, a3, a4, a5, 0);
  uint64_t result = 0;
  if (!secret)
  {
    *a5 = 0;
    warning((uint64_t)"No EAP secret found for authenticating us to %s", v7, v8, v9, v10, v11, v12, v13, v6);
    return 1;
  }
  return result;
}

uint64_t EapGetServerSecret(unsigned int *a1, const char *a2, const char *a3, void *a4, int *a5)
{
  int v6 = (int)a3;
  if (get_secret((void *)*a1, a2, a3, a4, a5, 1)) {
    return 0;
  }
  *a5 = 0;
  warning((uint64_t)"No EAP secret found for authenticating %s", v7, v8, v9, v10, v11, v12, v13, v6);
  return 1;
}

uint64_t sub_1000275F0(unsigned char **a1)
{
  uint64_t v2 = (uint64_t)*a1;
  uint64_t v3 = malloc_type_malloc(0x68uLL, 0x10B0040F6A58395uLL);
  if (!v3) {
    novm();
  }
  uint64_t v4 = v3;
  v3[12] = 0;
  *((_OWORD *)v3 + 4) = 0u;
  *((_OWORD *)v3 + 5) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  if (sys_eaploadplugin(*a1, (uint64_t)v3))
  {
    option_error("Couldn't load EAP plugin %s", v5, v6, v7, v8, v9, v10, v11, v2);
    return 1;
  }
  if (v4[5] && v4[6] && v4[7])
  {
    int v13 = *((unsigned __int8 *)v4 + 8);
    int v14 = &eap_extensions;
    int v15 = &eap_extensions;
    while (1)
    {
      int v15 = (uint64_t *)*v15;
      if (!v15) {
        break;
      }
      if (*((unsigned __int8 *)v15 + 8) == v13)
      {
        option_error("EAP plugin %s is trying to use an already loaded EAP type %d", v5, v6, v7, v8, v9, v10, v11, v2);
        return 0;
      }
    }
    while (1)
    {
      uint64_t v16 = *v14;
      if (!*v14) {
        break;
      }
      int v14 = (uint64_t *)*v14;
      if (*(unsigned __int8 *)(v16 + 8) == v13) {
        return 1;
      }
    }
    *int v14 = (uint64_t)v4;
    *uint64_t v4 = 0;
    return 1;
  }
  option_error("EAP plugin %s has no Init() Dispose() or Process() function", v5, v6, v7, v8, v9, v10, v11, v2);
  return 0;
}

void sub_100027710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int v9 = *(_DWORD *)(a1 + 8);
  if (v9 == 5 || v9 == 3)
  {
    if (*(_DWORD *)(a1 + 312) >= *(_DWORD *)(a1 + 308))
    {
      error((uint64_t)"Peer failed to respond to EAP challenge", a2, a3, a4, a5, a6, a7, a8, v19);
      *(_DWORD *)(a1 + 8) = 6;
      int v18 = *(_DWORD *)a1;
      auth_peer_fail(v18, 49703, v12, v13, v14, v15, v16, v17);
    }
    else if (*(unsigned char *)(a1 + 298) == 1)
    {
      sub_100027300();
    }
    else
    {
      sub_100027830((unsigned int *)a1, 6, 0, 0, a5, a6, a7, a8, a9);
    }
  }
}

uint64_t sub_1000277DC(uint64_t result)
{
  if (*(_DWORD *)(result + 8) == 4)
  {
    uint64_t v1 = result;
    ++*(unsigned char *)(result + 296);
    *(_DWORD *)(result + 312) = 0;
    uint64_t result = sub_100027830();
    *(_DWORD *)(v1 + 8) = 5;
  }
  return result;
}

void sub_100027830(unsigned int *a1, __int16 a2, uint64_t a3, __int16 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9 = *((void *)a1 + 48);
  if (v9)
  {
    uint64_t v11 = *((void *)a1 + 50);
    *(_WORD *)(v11 + 6) = a2;
    *(void *)(v11 + 16) = a3;
    *(_WORD *)(v11 + 8) = a4;
    uint64_t v12 = *((void *)a1 + 51);
    *(_DWORD *)(v12 + 2) = 0;
    *(void *)(v12 + 8) = 0;
    *(void *)(v12 + 16) = 0;
    if ((*(unsigned int (**)(void, uint64_t))(v9 + 56))(*((void *)a1 + 49), v11))
    {
      int v20 = *(const char **)(*((void *)a1 + 48) + 16);
      if (!v20) {
        int v20 = "???";
      }
      error((uint64_t)"EAP error while processing packet for %s (request type %d, error %d)", v13, v14, v15, v16, v17, v18, v19, (int)v20);
    }
    else
    {
      uint64_t v21 = *((void *)a1 + 51);
      unsigned int v22 = *(unsigned __int16 *)(v21 + 2);
      BOOL v23 = v22 > 6;
      int v24 = (1 << v22) & 0x62;
      if (!v23 && v24 != 0)
      {
        int v26 = *(const void **)(v21 + 8);
        if (v26 && (size_t v14 = *(unsigned __int16 *)(v21 + 4), (v14 - 1501) > 0xFFFFFA26))
        {
          outpacket_buf = 667026431;
          memcpy(&word_100048120, v26, v14);
          int v32 = word_100048120;
          a1[78] = 0;
          *((unsigned char *)a1 + 296) = HIBYTE(word_100048120);
          uint64_t v33 = *(void (**)(void, uint64_t))(*((void *)a1 + 48) + 64);
          if (v33) {
            v33(*((void *)a1 + 49), v21);
          }
          output(*a1, (uint64_t)&outpacket_buf, *(unsigned __int16 *)(v21 + 4) + 4, v27, v28, v29, v30, v31, v62);
          int v34 = *(unsigned __int16 *)(v21 + 2);
          if (v34 == 5)
          {
            timeout((int)sub_100027710);
            int v34 = *(unsigned __int16 *)(v21 + 2);
          }
          ++a1[78];
          if (v34 == 6 && (a1[2] | 2) != 6)
          {
            if (*(void *)(v21 + 16)) {
              uint64_t v35 = *(const char **)(v21 + 16);
            }
            else {
              uint64_t v35 = (const char *)(a1 + 10);
            }
            untimeout((uint64_t)sub_100027710, (uint64_t)a1);
            if (v32 == 3)
            {
              unsigned int v43 = a1[2];
              a1[2] = 4;
              if (v43 == 3)
              {
                int v44 = *(unsigned int (**)(void, void *))(*((void *)a1 + 48) + 72);
                if (v44)
                {
                  v63[1] = 0;
                  v63[0] = 1;
                  if (v44(*((void *)a1 + 49), v63)
                    || (__memmove_chk(),
                        LOWORD(v63[0]) = 2,
                        (*(unsigned int (**)(void, void *))(*((void *)a1 + 48) + 72))(*((void *)a1 + 49), v63)))
                  {
                    uint64_t v59 = *(const char **)(*((void *)a1 + 48) + 16);
                    if (!v59) {
                      uint64_t v59 = "???";
                    }
                    dbglog((uint64_t)"EAP plugin %s (type %d) does not have %s attribute", v45, v46, v47, v48, v49, v50, v51, (int)v59);
                  }
                  else
                  {
                    __memmove_chk();
                  }
                }
                size_t v60 = strlen(v35);
                auth_peer_success(*a1, 49703, 0, (uint64_t)v35, v60);
              }
              uint64_t v61 = a1[75];
              if (v61) {
                timeout((int)sub_1000277DC);
              }
              notice((uint64_t)"EAP peer authentication succeeded for %s", v36, v61, v38, v39, v40, v41, v42, (int)v35);
            }
            else
            {
              error((uint64_t)"EAP peer authentication failed for remote host %s", v36, v37, v38, v39, v40, v41, v42, (int)v35);
              a1[2] = 6;
              int v58 = *a1;
              auth_peer_fail(v58, 49703, v52, v53, v54, v55, v56, v57);
            }
          }
        }
        else
        {
          error((uint64_t)"EAP plugin tries to send a packet with with incorrect data", (uint64_t)v26, v14, v15, v16, v17, v18, v19, a9);
        }
      }
    }
  }
}

void sub_100027B94(unsigned int *a1, __int16 a2, uint64_t a3, __int16 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9 = *((void *)a1 + 40);
  if (v9)
  {
    uint64_t v11 = *((void *)a1 + 42);
    *(_WORD *)(v11 + 6) = a2;
    *(void *)(v11 + 16) = a3;
    *(_WORD *)(v11 + 8) = a4;
    uint64_t v12 = *((void *)a1 + 43);
    *(_DWORD *)(v12 + 2) = 0;
    *(void *)(v12 + 8) = 0;
    *(void *)(v12 + 16) = 0;
    if ((*(unsigned int (**)(void, uint64_t))(v9 + 56))(*((void *)a1 + 41), v11))
    {
      int v20 = *(const char **)(*((void *)a1 + 40) + 16);
      if (!v20) {
        int v20 = "???";
      }
      error((uint64_t)"EAP error while processing packet for %s (request type %d, error %d)", v13, v14, v15, v16, v17, v18, v19, (int)v20);
    }
    else
    {
      uint64_t v21 = *((void *)a1 + 43);
      switch(*(_WORD *)(v21 + 2))
      {
        case 1:
          unsigned int v22 = *(const void **)(v21 + 8);
          if (!v22 || (size_t v14 = *(unsigned __int16 *)(v21 + 4), (v14 - 1501) <= 0xFFFFFA26))
          {
            BOOL v23 = "EAP plugin tries to send a packet with with incorrect data";
            goto LABEL_26;
          }
          outpacket_buf = 667026431;
          memcpy(&word_100048120, v22, v14);
          *((unsigned char *)a1 + 297) = HIBYTE(word_100048120);
          uint64_t v47 = *(void (**)(void, uint64_t))(*((void *)a1 + 40) + 64);
          if (v47) {
            v47(*((void *)a1 + 41), v21);
          }
          uint64_t v48 = *a1;
          uint64_t v49 = *(unsigned __int16 *)(v21 + 4) + 4;
          output(v48, (uint64_t)&outpacket_buf, v49, v42, v43, v44, v45, v46, a9);
          break;
        case 2:
          *((void *)a1 + 45) = *(void *)(v21 + 8);
          a1[92] = *(unsigned __int16 *)(v21 + 4);
          if (pipe((int *)a1 + 88) < 0)
          {
            BOOL v23 = "EAP failed to create pipe for User Interface...\n";
LABEL_26:
            error((uint64_t)v23, (uint64_t)v22, v14, v15, v16, v17, v18, v19, a9);
          }
          else if (pthread_create((pthread_t *)a1 + 47, 0, (void *(__cdecl *)(void *))EAPClientUIThread, (void *)(int)*a1))
          {
            error((uint64_t)"EAP failed to create thread for client User Interface...\n", v24, v25, v26, v27, v28, v29, v30, v52);
            close(a1[88]);
            int v31 = a1[89];
            close(v31);
          }
          else
          {
            wait_input_hook = sub_100027F50;
            int v50 = a1[88];
            add_fd(v50);
          }
          break;
        case 3:
          int v32 = *(unsigned int (**)(void, void *))(*((void *)a1 + 40) + 72);
          if (v32)
          {
            v53[1] = 0;
            v53[0] = 1;
            if (v32(*((void *)a1 + 41), v53)
              || (__memmove_chk(),
                  LOWORD(v53[0]) = 2,
                  (*(unsigned int (**)(void, void *))(*((void *)a1 + 40) + 72))(*((void *)a1 + 41), v53)))
            {
              uint64_t v51 = *(const char **)(*((void *)a1 + 40) + 16);
              if (!v51) {
                uint64_t v51 = "???";
              }
              dbglog((uint64_t)"EAP plugin %s (type %d) does not have %s attribute", v33, v34, v35, v36, v37, v38, v39, (int)v51);
            }
            else
            {
              __memmove_chk();
            }
          }
          a1[1] = 4;
          auth_withpeer_success(*a1, 49703, 0);
          break;
        case 4:
          error((uint64_t)"EAP authentication failed", v13, v14, v15, v16, v17, v18, v19, v52);
          int v40 = *a1;
          auth_withpeer_fail(v40, 49703);
          break;
        case 7:
          int v41 = *a1;
          auth_withpeer_cancelled(v41, 49703, v14, v15, v16, v17, v18, v19);
          break;
        default:
          return;
      }
    }
  }
}

void sub_100027F50()
{
  if (qword_100049F58 != -1 && is_ready_fd(qword_100049F58))
  {
    unsigned __int8 v8 = 0;
    read(qword_100049F58, &v8, 1uLL);
    wait_input_hook = 0;
    remove_fd(qword_100049F58);
    close(qword_100049F58);
    close(SHIDWORD(qword_100049F58));
    qword_100049F58 = -1;
    if (v8 == 255)
    {
      uint64_t v7 = *(const char **)(qword_100049F38 + 16);
      if (!v7) {
        uint64_t v7 = "???";
      }
      error((uint64_t)"EAP error while requesting user input for %s (request type %d)", v0, v1, v2, v3, v4, v5, v6, (int)v7);
    }
    else
    {
      sub_100027B94(&eap, 5, qword_100049F60, dword_100049F68);
    }
  }
}

void sub_10002802C(int a1)
{
  uint64_t v2 = (char *)&ecp_fsm + 80 * a1;
  *(_DWORD *)uint64_t v2 = a1;
  *((_DWORD *)v2 + 1) = 32851;
  *((void *)v2 + 7) = &unk_1000464D8;
  fsm_init((uint64_t)v2);
  ecp_wantoptions[a1] = 0;
  *(void *)&ecp_gotoptions[8 * a1] = 0;
  ecp_allowoptions[a1] = 0;
  ecp_hisoptions[a1] = 0;
}

uint64_t sub_1000280A4()
{
  return 0;
}

double sub_1000280AC(int a1)
{
  uint64_t v1 = (char *)&ipv6cp_fsm + 80 * a1;
  uint64_t v2 = (char *)&ipv6cp_wantoptions + 52 * a1;
  uint64_t v3 = (char *)&ipv6cp_allowoptions + 52 * a1;
  *(_DWORD *)uint64_t v1 = a1;
  *((_DWORD *)v1 + 1) = 32855;
  *((void *)v1 + 7) = off_100046A78;
  fsm_init((uint64_t)v1);
  double result = 0.0;
  *((_DWORD *)v2 + 12) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  *((_OWORD *)v2 + 2) = 0u;
  *(_OWORD *)uint64_t v2 = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_DWORD *)v3 + 12) = 0;
  *((_DWORD *)v2 + 2) = 1;
  *(_DWORD *)uint64_t v2 = 1;
  *(_DWORD *)uint64_t v3 = 1;
  return result;
}

void sub_10002813C(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

void sub_100028150(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028164(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028178(int a1)
{
}

void sub_10002818C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  byte_10004BF28 = 1;
}

void sub_1000281C0(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_1000281D4(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0;
  }
  unsigned int v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  int v7 = v6 - 4;
  if (v6 < 4 || v6 > a2) {
    return 0;
  }
  int v11 = *a1;
  int v12 = a1[1];
  uint64_t v13 = a1 + 4;
  if ((v11 - 1) > 6) {
    size_t v14 = " code=0x%x";
  }
  else {
    size_t v14 = " %s";
  }
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if ((v11 - 1) < 4)
  {
    if (v6 >= 6)
    {
      while (1)
      {
        uint64_t v15 = v13[1];
        if (v15 < 2 || v7 < v15) {
          goto LABEL_41;
        }
        int v17 = *v13;
        a3(a4, " <");
        if (v17 == 1)
        {
          uint64_t v19 = v13;
          if (v15 == 10)
          {
            uint64_t v19 = v13 + 10;
            unsigned int v22 = eui64_ntoa(*(void *)(v13 + 2));
            snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v22);
            uint64_t v20 = a4;
            uint64_t v21 = "addr %s";
            goto LABEL_28;
          }
        }
        else
        {
          BOOL v18 = v17 == 2 && v15 >= 4;
          uint64_t v19 = v13;
          if (v18)
          {
            uint64_t v19 = v13 + 4;
            a3(a4, "compress ");
            uint64_t v20 = a4;
            uint64_t v21 = "0x%x";
LABEL_28:
            a3(v20, v21);
          }
        }
        if (v19 < &v13[v15])
        {
          BOOL v23 = &v13[v15];
          int64_t v24 = v23 - v19;
          do
          {
            int v25 = *v19++;
            ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v25);
            --v24;
          }
          while (v24);
          uint64_t v19 = v23;
        }
        v7 -= v15;
        a3(a4, ">");
        uint64_t v13 = v19;
        if (v7 <= 1) {
          goto LABEL_40;
        }
      }
    }
LABEL_39:
    uint64_t v19 = a1 + 4;
LABEL_40:
    uint64_t v13 = v19;
    if (v7 < 1) {
      return (v13 - a1);
    }
    goto LABEL_41;
  }
  if ((v11 - 5) >= 2) {
    goto LABEL_39;
  }
  if (v6 >= 5)
  {
    if (*v13 - 32 > 0x5E)
    {
LABEL_41:
      unsigned int v26 = v7 + 1;
      do
      {
        int v27 = *v13++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v27);
        --v26;
      }
      while (v26 > 1);
      return (v13 - a1);
    }
    a3(a4, " ");
    print_string((char *)a1 + 4, v6 - 4, a3, a4);
    LODWORD(v13) = v13 + v7;
  }
  return (v13 - a1);
}

void sub_10002846C()
{
  if (!byte_100046A20) {
    return;
  }
  int v0 = dword_10004A018;
  if (dword_10004A024) {
    BOOL v1 = dword_10004A018 == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (!v1 || dword_10004A01C != 0) {
    goto LABEL_13;
  }
  if (!ether_to_eui64((uint64_t)&qword_10004A030))
  {
    int v0 = dword_10004A018;
LABEL_13:
    if (!v0)
    {
      int v4 = qword_10004A030;
      int v3 = HIDWORD(qword_10004A030);
      if (dword_10004A020) {
        BOOL v5 = qword_10004A030 == 0;
      }
      else {
        BOOL v5 = 0;
      }
      if (v5)
      {
        LODWORD(qword_10004A030) = 0;
        ntohl();
        int v3 = htonl();
        HIDWORD(qword_10004A030) = v3;
        int v4 = 0;
        if (v3) {
          dword_10004A018 = 1;
        }
      }
      if (!(v3 | v4))
      {
        do
        {
          LODWORD(qword_10004A030) = magic();
          HIDWORD(qword_10004A030) = magic();
          LOBYTE(qword_10004A030) = qword_10004A030 & 0xFD;
        }
        while (!qword_10004A030);
      }
    }
    goto LABEL_23;
  }
  dword_10004A018 = 1;
LABEL_23:
  if (dword_10004A01C) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = dword_10004A020 == 0;
  }
  if (!v6 && !qword_10004A038)
  {
    LODWORD(qword_10004A038) = 0;
    ntohl();
    HIDWORD(qword_10004A038) = htonl();
    if (HIDWORD(qword_10004A038)) {
      dword_10004A01C = 1;
    }
  }
}

BOOL sub_1000285C4(unsigned __int8 *a1, int a2)
{
  if (a2 < 44) {
    return 0;
  }
  int v3 = a1[10];
  if (v3 != 6) {
    return v3 != 44;
  }
  return a2 >= 0x40 && ((a1[57] & 1) == 0 || a2 - 4 != ((a1[56] >> 2) & 0x3C) + 40);
}

uint64_t sub_100028624(int a1)
{
  return *((unsigned int *)&ipv6cp_fsm + 20 * a1 + 2);
}

char *llv6_ntoa(unint64_t a1)
{
  BOOL v1 = eui64_ntoa(a1);
  snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v1);
  return byte_10004BED4;
}

uint64_t sub_100028688(char **a1)
{
  BOOL v1 = *a1;
  uint64_t v2 = strchr(*a1, 44);
  if (!v2) {
    uint64_t v2 = (char *)&v1[strlen(v1)];
  }
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  if (v2 == v1)
  {
    if (!*v1) {
      goto LABEL_31;
    }
  }
  else
  {
    int v3 = *v2;
    char *v2 = 0;
    if (inet_pton(30, v1, &v26)) {
      BOOL v11 = v26 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    BOOL v12 = v11 && HIDWORD(v26) == 0;
    if (!v12 || !v27)
    {
      option_error("Illegal interface identifier (local): %s", v4, v5, v6, v7, v8, v9, v10, (int)v1);
      return 0;
    }
    if (option_priority >= dword_10004BF14)
    {
      qword_10004A030 = v27;
      dword_10004A018 = 1;
      dword_10004BF14 = option_priority;
    }
    char *v2 = v3;
    if (!v3) {
      goto LABEL_31;
    }
  }
  int v14 = v2[1];
  uint64_t v13 = v2 + 1;
  if (v14)
  {
    if (inet_pton(30, v13, &v26)) {
      BOOL v22 = v26 == 0;
    }
    else {
      BOOL v22 = 0;
    }
    BOOL v23 = v22 && HIDWORD(v26) == 0;
    if (v23 && v27)
    {
      if (option_priority >= dword_10004BF18)
      {
        qword_10004A038 = v27;
        dword_10004A01C = 1;
        dword_10004BF18 = option_priority;
      }
      goto LABEL_31;
    }
    option_error("Illegal interface identifier (remote): %s", v15, v16, v17, v18, v19, v20, v21, (int)v13);
    return 0;
  }
LABEL_31:
  unsigned int v24 = override_value("+ipv6", option_priority, option_source);
  uint64_t result = 1;
  if (v24) {
    byte_100046A20 = 1;
  }
  return result;
}

uint64_t sub_100028838(uint64_t a1, void (*a2)(uint64_t, const char *, ...), uint64_t a3)
{
  if (dword_10004A018)
  {
    uint64_t v5 = eui64_ntoa(qword_10004A030);
    snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v5);
    a2(a3, "%s", byte_10004BED4);
  }
  uint64_t result = ((uint64_t (*)(uint64_t, const char *))a2)(a3, ",");
  if (dword_10004A01C)
  {
    uint64_t v7 = eui64_ntoa(qword_10004A038);
    snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v7);
    return ((uint64_t (*)(uint64_t, const char *, ...))a2)(a3, "%s", byte_10004BED4);
  }
  return result;
}

__n128 sub_100028914(int *a1)
{
  int v1 = *a1;
  uint64_t v2 = (char *)&ipv6cp_wantoptions + 52 * *a1;
  int v3 = *(_DWORD *)v2;
  if (*(_DWORD *)v2) {
    int v3 = *((_DWORD *)&ipv6cp_allowoptions + 13 * v1) != 0;
  }
  uint64_t v4 = (char *)&ipv6cp_wantoptions + 52 * v1;
  *((_DWORD *)v4 + 1) = v3;
  if (!*((_DWORD *)v4 + 3))
  {
    uint64_t v5 = (_DWORD *)((char *)&ipv6cp_wantoptions + 52 * v1 + 36);
    do
    {
      *uint64_t v5 = magic();
      int v6 = magic();
      *((_DWORD *)&ipv6cp_wantoptions + 13 * v1 + 10) = v6;
      *(unsigned char *)v5 &= ~2u;
    }
    while (!(*v5 | v6));
  }
  uint64_t v7 = (char *)&ipv6cp_gotoptions + 52 * v1;
  long long v8 = *((_OWORD *)v2 + 2);
  *((_OWORD *)v7 + 1) = *((_OWORD *)v2 + 1);
  *((_OWORD *)v7 + 2) = v8;
  __n128 result = *(__n128 *)v2;
  *(_OWORD *)uint64_t v7 = *(_OWORD *)v2;
  *((_DWORD *)v7 + 11) = 0;
  *((_DWORD *)v7 + 12) = 0;
  return result;
}

uint64_t sub_1000289DC(int *a1)
{
  int v1 = (_DWORD *)((char *)&ipv6cp_gotoptions + 52 * *a1);
  if (*v1) {
    int v2 = 10;
  }
  else {
    int v2 = 0;
  }
  return v2 | (4 * (v1[7] != 0));
}

int *sub_100028A14(int *result, uint64_t a2, int *a3)
{
  int v3 = *result;
  uint64_t v4 = (_DWORD *)((char *)&ipv6cp_gotoptions + 52 * *result);
  int v5 = *a3;
  if (*v4)
  {
    if (v5 < 10)
    {
      *uint64_t v4 = 0;
    }
    else
    {
      *(_WORD *)a2 = 2561;
      *(void *)(a2 + 2) = *(void *)((char *)&ipv6cp_gotoptions + 52 * v3 + 36);
      a2 += 10;
      v5 -= 10;
    }
  }
  int v6 = (char *)&ipv6cp_gotoptions + 52 * v3;
  int v8 = *((_DWORD *)v6 + 7);
  uint64_t v7 = v6 + 28;
  if (v8)
  {
    if (v5 < 4)
    {
      *uint64_t v7 = 0;
    }
    else
    {
      *(_WORD *)a2 = 1026;
      uint64_t v9 = (char *)&ipv6cp_gotoptions + 52 * v3;
      *(unsigned char *)(a2 + 2) = v9[33];
      *(unsigned char *)(a2 + 3) = v9[32];
      v5 -= 4;
    }
  }
  *a3 -= v5;
  return result;
}

BOOL sub_100028AB8(int *a1, uint64_t a2, int a3)
{
  int v3 = *a1;
  if (*((_DWORD *)&ipv6cp_gotoptions + 13 * *a1))
  {
    BOOL v4 = __OFSUB__(a3, 10);
    a3 -= 10;
    if (a3 < 0 != v4) {
      return 0;
    }
    if (*(unsigned char *)(a2 + 1) != 10 || *(unsigned char *)a2 != 1) {
      return 0;
    }
    int v6 = (char *)&ipv6cp_gotoptions + 52 * v3;
    int v8 = *((_DWORD *)v6 + 9);
    uint64_t v7 = v6 + 36;
    if (v8 != *(_DWORD *)(a2 + 2) || *((_DWORD *)v7 + 1) != *(_DWORD *)(a2 + 6)) {
      return 0;
    }
    a2 += 10;
  }
  if (*((_DWORD *)&ipv6cp_gotoptions + 13 * v3 + 7))
  {
    BOOL v4 = __OFSUB__(a3, 4);
    a3 -= 4;
    if (a3 < 0 != v4
      || *(unsigned char *)(a2 + 1) != 4
      || *(unsigned char *)a2 != 2
      || *((unsigned __int16 *)&ipv6cp_gotoptions + 26 * v3 + 16) != bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16)
    {
      return 0;
    }
  }
  return !a3;
}

uint64_t sub_100028B7C(int *a1, unsigned __int8 *a2, int a3)
{
  int v3 = a1;
  int v4 = 0;
  int v5 = *a1;
  int v6 = (char *)&ipv6cp_gotoptions + 52 * *a1;
  int v7 = *(_DWORD *)v6;
  long long v39 = *(_OWORD *)(v6 + 4);
  uint64_t v40 = *(void *)(v6 + 20);
  int v8 = *((_DWORD *)v6 + 7);
  int v9 = *((_DWORD *)v6 + 8);
  unsigned int v11 = *((_DWORD *)v6 + 9);
  int v10 = *((_DWORD *)v6 + 10);
  uint64_t v12 = *(void *)(v6 + 44);
  int v13 = a3 - 10;
  if (a3 < 10 || !v7) {
    goto LABEL_12;
  }
  if (a2[1] != 10 || *a2 != 1)
  {
    int v4 = 0;
LABEL_12:
    int v18 = *((_DWORD *)v6 + 7);
    int v14 = a2;
    int v13 = a3;
    goto LABEL_13;
  }
  int v14 = a2 + 10;
  if (*((_DWORD *)&ipv6cp_gotoptions + 13 * v5 + 2))
  {
    int v33 = *(_DWORD *)v6;
    uint64_t v35 = *(void *)(v6 + 44);
    int v37 = *((_DWORD *)v6 + 8);
    int v15 = *((_DWORD *)v6 + 7);
    int v10 = *(_DWORD *)(a2 + 6);
    int v16 = *(_DWORD *)(a2 + 2);
    for (int i = v16; ; int i = v16 & 0xFD)
    {
      unsigned int v11 = v16 & 0xFFFFFF00 | i;
      if (v11 | v10)
      {
        if (v11 != *((_DWORD *)&ipv6cp_gotoptions + 13 * v5 + 11)
          || v10 != *((_DWORD *)&ipv6cp_gotoptions + 13 * v5 + 12))
        {
          break;
        }
      }
      int v16 = magic();
      int v10 = magic();
    }
    int v18 = *((_DWORD *)&ipv6cp_gotoptions + 13 * v5 + 7);
    int v4 = 1;
    int v8 = v15;
    int v9 = v37;
    uint64_t v12 = v35;
    int v7 = v33;
  }
  else
  {
    int v4 = 1;
    int v18 = *((_DWORD *)v6 + 7);
  }
LABEL_13:
  int v19 = 0;
  if (v18 && v14[1] == 4 && v13 >= 4)
  {
    if (*v14 != 2)
    {
      int v19 = 0;
LABEL_22:
      uint64_t v34 = v3;
      uint64_t v36 = v12;
      int v38 = v9;
      int v32 = v8;
      uint64_t v21 = (_DWORD *)((char *)&ipv6cp_gotoptions + 52 * v5 + 28);
      BOOL v22 = (char *)&ipv6cp_gotoptions + 52 * v5;
      BOOL v23 = v22 + 8;
      unsigned int v24 = v22 + 44;
      while (1)
      {
        uint64_t v25 = v14[1];
        if (v25 < 2) {
          return 0;
        }
        v13 -= v25;
        if (v13 < 0) {
          return 0;
        }
        int v26 = *v14;
        if (v26 == 1)
        {
          if (v25 != 10 || *(_DWORD *)v6 != 0 || v4 != 0) {
            return 0;
          }
          if (*v23)
          {
            int v10 = *(_DWORD *)(v14 + 6);
            int v29 = *(_DWORD *)(v14 + 2);
            for (int j = v29; ; LOBYTE(v29) = j & 0xFD)
            {
              unsigned int v11 = j & 0xFFFFFF00 | v29;
              if (v11 | v10)
              {
                if (v11 != *v24 || v10 != v24[1]) {
                  break;
                }
              }
              int j = magic();
              int v10 = magic();
            }
          }
          int v4 = 1;
          int v7 = 1;
        }
        else if (v26 == 2)
        {
          uint64_t v20 = 0;
          if (v25 != 4 || *v21 || v19) {
            return v20;
          }
          int v19 = 1;
        }
        v14 += v25;
        if (v13 <= 1)
        {
          int v3 = v34;
          uint64_t v12 = v36;
          int v8 = v32;
          int v9 = v38;
          if (v13) {
            return 0;
          }
          goto LABEL_48;
        }
      }
    }
    int v8 = 0;
    v14 += 4;
    int v19 = 1;
    v13 -= 4;
  }
  if (v13 >= 2) {
    goto LABEL_22;
  }
  if (v13) {
    return 0;
  }
LABEL_48:
  if (v3[2] != 9)
  {
    *(_DWORD *)int v6 = v7;
    *(_OWORD *)(v6 + 4) = v39;
    *(void *)(v6 + 20) = v40;
    *((_DWORD *)v6 + 7) = v8;
    *((_DWORD *)v6 + 8) = v9;
    *((_DWORD *)v6 + 9) = v11;
    *((_DWORD *)v6 + 10) = v10;
    *(void *)(v6 + 44) = v12;
  }
  return 1;
}

uint64_t sub_100028E64(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)result;
  int v5 = (_DWORD *)((char *)&ipv6cp_gotoptions + 52 * *(int *)result);
  LODWORD(result) = *v5;
  int v6 = v5[7];
  if (a3 >= 10 && result && *(unsigned char *)(a2 + 1) == 10 && *(unsigned char *)a2 == 1)
  {
    int v7 = (char *)&ipv6cp_gotoptions + 52 * v4;
    int v9 = *((_DWORD *)v7 + 9);
    int v8 = v7 + 36;
    if (*(_DWORD *)(a2 + 2) != v9) {
      return 0;
    }
    __n128 result = 0;
    if (*(_DWORD *)(a2 + 6) != *((_DWORD *)v8 + 1)) {
      return result;
    }
    a2 += 10;
    a3 -= 10;
  }
  if (v6)
  {
    if (*(unsigned char *)(a2 + 1) == 4 && a3 >= 4)
    {
      if (*(unsigned char *)a2 != 2
        || *((unsigned __int16 *)&ipv6cp_gotoptions + 26 * v4 + 16) != bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16)
      {
        return 0;
      }
      int v6 = 0;
      a3 -= 4;
    }
  }
  if (a3) {
    return 0;
  }
  if (*(_DWORD *)(v3 + 8) != 9)
  {
    *int v5 = result;
    v5[7] = v6;
  }
  return 1;
}

uint64_t sub_100028F48(int *a1, char *__src, int *a3, int a4)
{
  int v4 = *a1;
  int v37 = (char *)&ipv6cp_hisoptions + 52 * *a1;
  int v38 = (_DWORD *)((char *)&ipv6cp_allowoptions + 52 * *a1);
  int v31 = *a1;
  int v5 = *a3;
  *((_DWORD *)v37 + 12) = 0;
  *((_OWORD *)v37 + 1) = 0u;
  *((_OWORD *)v37 + 2) = 0u;
  *(_OWORD *)int v37 = 0u;
  int v6 = (char *)&ipv6cp_gotoptions + 52 * v4;
  int v7 = v6 + 36;
  int v8 = (unint64_t *)((char *)&ipv6cp_wantoptions + 52 * v4 + 44);
  int v9 = (uint64_t *)(v6 + 44);
  uint64_t v36 = v37 + 44;
  BOOL v33 = a4 != 0;
  uint64_t v10 = 2;
  unsigned int v11 = __src;
  uint64_t v12 = __src;
  while (v5)
  {
    int v13 = v11;
    if (v5 < 2
      || ((uint64_t v14 = v11[1], v14 >= 2) ? (v15 = v5 >= v14) : (v15 = 0), !v15))
    {
      LOWORD(v14) = v5;
      int v16 = 1;
      int v5 = 0;
      goto LABEL_43;
    }
    int v16 = *v11;
    v5 -= v14;
    v11 += v14;
    if (v16 != 1)
    {
      int v16 = 1;
      goto LABEL_43;
    }
    if (v14 != 10 || !*v38) {
      goto LABEL_43;
    }
    unint64_t v17 = *(void *)(v13 + 2);
    LODWORD(v18) = v17;
    unint64_t v19 = HIDWORD(v17);
    if (!v17 && !*(void *)v7)
    {
      int v16 = 1;
      goto LABEL_42;
    }
    if (!*v8 || *v8 == v17 || *v9)
    {
      if (!v17 || *(void *)v7 == v17)
      {
        if (!*v9)
        {
          unint64_t v17 = *v8;
          unint64_t v19 = HIDWORD(*v8);
          unint64_t v18 = *v8;
        }
        unsigned int v20 = v17;
        while (!(v19 | v18)
             || v18 == *(_DWORD *)v7 && v19 == *((_DWORD *)v7 + 1))
        {
          LODWORD(v17) = magic();
          unint64_t v19 = magic();
          unsigned int v20 = v17 & 0xFD;
          LODWORD(v18) = v17 & 0xFFFFFFFD;
        }
        uint64_t v21 = v17 & 0xFFFFFF00 | v20 | (v19 << 32);
        goto LABEL_30;
      }
      *(_DWORD *)int v37 = 1;
      *uint64_t v36 = v17;
      if (v10 == 2)
      {
        int v16 = 0;
LABEL_42:
        LOWORD(v14) = 10;
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v21 = *v8;
      unsigned int v20 = *v8;
      unint64_t v19 = HIDWORD(*v8);
      unint64_t v17 = *v8;
LABEL_30:
      *int v9 = v21;
      uint64_t v22 = v17 & 0xFFFFFF00 | v20 | (v19 << 32);
      *(void *)(v13 + 2) = v22;
      *(_DWORD *)int v37 = 1;
      *uint64_t v36 = v22;
      if (a4)
      {
        LOWORD(v14) = 10;
        int v16 = v33;
        goto LABEL_43;
      }
      if (v10 != 4)
      {
        BOOL v23 = v10 == 2;
        LOWORD(v14) = 10;
        LODWORD(v10) = 3;
        int v16 = v33;
        if (v23) {
          int v16 = 0;
        }
        if (v23) {
          uint64_t v12 = __src;
        }
LABEL_43:
        BOOL v24 = v10 != 4;
        if ((v16 & v24) != 0) {
          uint64_t v10 = 4;
        }
        else {
          uint64_t v10 = v10;
        }
        if ((v16 & v24) != 0) {
          uint64_t v25 = __src;
        }
        else {
          uint64_t v25 = v12;
        }
        uint64_t v26 = (unsigned __int16)v14;
        if (v25 != v13) {
          memcpy(v25, v13, (unsigned __int16)v14);
        }
        uint64_t v12 = &v25[v26];
      }
    }
  }
  if (v10 != 4 && !*(_DWORD *)v37 && !a4)
  {
    uint64_t v27 = (char *)&ipv6cp_wantoptions + 52 * v31;
    int v29 = *((_DWORD *)v27 + 1);
    uint64_t v28 = v27 + 4;
    if (v29)
    {
      if (v10 == 2)
      {
        *uint64_t v28 = 0;
        uint64_t v12 = __src;
      }
      *(_WORD *)uint64_t v12 = 2561;
      *(void *)(v12 + 2) = *v8;
      LODWORD(v12) = v12 + 10;
      uint64_t v10 = 3;
    }
  }
  *a3 = v12 - __src;
  return v10;
}

void sub_1000292A4(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9 = *a1;
  if (!*((_DWORD *)&ipv6cp_hisoptions + 13 * (int)*a1)) {
    *(void *)((char *)&ipv6cp_hisoptions + 52 * (int)v9 + 44) = *(void *)((char *)&ipv6cp_wantoptions
  }
                                                                            + 52 * (int)v9
                                                                            + 44);
  if (!no_ifaceid_neg)
  {
    int v41 = (char *)&ipv6cp_hisoptions + 52 * (int)v9;
    int v42 = *((_DWORD *)v41 + 11);
    int v43 = *((_DWORD *)v41 + 12);
    if (v43 | v42)
    {
      uint64_t v44 = (char *)&ipv6cp_gotoptions + 52 * (int)v9;
      int v45 = *((_DWORD *)v44 + 9);
      int v46 = *((_DWORD *)v44 + 10);
      if (v46 | v45)
      {
        if (v45 != v42 || v46 != v43) {
          goto LABEL_4;
        }
        uint64_t v48 = "local and remote LL addresses are equal";
      }
      else
      {
        uint64_t v48 = "Could not determine local LL address";
      }
    }
    else
    {
      uint64_t v48 = "Could not determine remote LL address";
    }
    error((uint64_t)v48, a2, a3, a4, a5, a6, a7, a8, v52);
    int v50 = (char *)&ipv6cp_fsm + 80 * (int)*a1;
    uint64_t v51 = (char *)v48;
    goto LABEL_29;
  }
LABEL_4:
  uint64_t v10 = (char *)&ipv6cp_gotoptions + 52 * (int)v9;
  unint64_t v12 = *(void *)(v10 + 36);
  unsigned int v11 = (unint64_t *)(v10 + 36);
  int v13 = eui64_ntoa(v12);
  snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v13);
  script_setenv("LLLOCAL", byte_10004BED4);
  uint64_t v14 = (char *)&ipv6cp_hisoptions + 52 * (int)v9;
  unint64_t v16 = *(void *)(v14 + 44);
  BOOL v15 = (unint64_t *)(v14 + 44);
  unint64_t v17 = eui64_ntoa(v16);
  snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v17);
  script_setenv("LLREMOTE", byte_10004BED4);
  if (sif6addr(*a1, *v11, *v15))
  {
    if (sifup())
    {
      sifnpmode(*a1, 87, 0);
      uint64_t v25 = eui64_ntoa(*v11);
      snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v25);
      notice((uint64_t)"local  LL address %s", v26, v27, v28, v29, v30, v31, v32, (int)byte_10004BED4);
      BOOL v33 = eui64_ntoa(*v15);
      snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v33);
      notice((uint64_t)"remote LL address %s", v34, v35, v36, v37, v38, v39, v40, (int)byte_10004BED4);
      np_up();
      byte_10004BF1C = 1;
      if ((byte_10004BF20 & 1) == 0 && !dword_10004BF24)
      {
        byte_10004BF20 = 1;
        sub_1000296BC("/etc/ppp/ipv6-up");
      }
      return;
    }
    if (!debug) {
      goto LABEL_24;
    }
    uint64_t v49 = "sifup failed (IPV6)";
    goto LABEL_23;
  }
  if (debug)
  {
    uint64_t v49 = "sif6addr failed";
LABEL_23:
    warning((uint64_t)v49, v18, v19, v20, v21, v22, v23, v24, v53);
  }
LABEL_24:
  int v50 = (char *)&ipv6cp_fsm + 80 * (int)*a1;
  uint64_t v51 = "Interface configuration failed";
LABEL_29:

  fsm_close((uint64_t)v50, v51, v19, v20, v21, v22, v23, v24);
}

uint64_t sub_1000295A0(unsigned int *a1)
{
  update_link_stats(*a1);
  if (byte_10004BF1C == 1)
  {
    byte_10004BF1C = 0;
    np_down();
  }
  sifnpmode(*a1, 87, 1);
  sifdown();
  uint64_t result = cif6addr();
  if (byte_10004BF20 == 1 && dword_10004BF24 == 0)
  {
    byte_10004BF20 = 0;
    return sub_1000296BC("/etc/ppp/ipv6-down");
  }
  return result;
}

void sub_100029670(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_10004BF28 == 1)
  {
    byte_10004BF28 = 0;
    np_finished(*a1, 87, a3, a4, a5, a6, a7, a8);
  }
}

uint64_t **sub_100029694(uint64_t **result)
{
  if (*((_DWORD *)result + 6) - *((_DWORD *)result + 7) == 2) {
    return notify((uint64_t **)protocolsready_notifier, 0);
  }
  return result;
}

uint64_t sub_1000296BC(char *a1)
{
  snprintf(__str, 0x20uLL, "%d", baud_rate);
  int v2 = eui64_ntoa(qword_10004A064);
  snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v2);
  __strlcpy_chk();
  uint64_t v3 = eui64_ntoa(qword_10004A0D4);
  snprintf(byte_10004BED4, 0x40uLL, "fe80::%s", v3);
  __strlcpy_chk();
  v5[0] = a1;
  v5[1] = &ifname;
  v5[2] = (char *)&devnam;
  v5[3] = __str;
  v5[4] = &v7;
  v5[5] = &v6;
  v5[6] = (char *)ipparam;
  v5[7] = 0;
  uint64_t result = run_program(a1, v5, 0, (uint64_t)sub_100029828, 0);
  dword_10004BF24 = result;
  return result;
}

void sub_100029828()
{
  dword_10004BF24 = 0;
  if (byte_10004BF20 == 1)
  {
    if (dword_10004A0E8 == 9) {
      return;
    }
    int v0 = "/etc/ppp/ipv6-down";
  }
  else
  {
    if (dword_10004A0E8 != 9) {
      return;
    }
    int v0 = "/etc/ppp/ipv6-up";
  }
  byte_10004BF20 ^= 1u;
  sub_1000296BC(v0);
}

char *eui64_ntoa(unint64_t a1)
{
  return byte_10004BF29;
}

void sub_1000298F0(int a1)
{
  int v1 = (char *)&acscp_fsm + 80 * a1;
  acsp_no_routes = 0;
  acsp_no_domains = 0;
  *(_DWORD *)int v1 = a1;
  *((_DWORD *)v1 + 1) = 33333;
  *((void *)v1 + 7) = off_100046F58;
  fsm_init((uint64_t)v1);
  *(void *)&acscp_wantoptions = 0x100000000;
  *((void *)&acscp_wantoptions + 1) = &_mh_execute_header;
  acscp_allowoptions = 0x100000000;
  *(void *)&byte_10004A178 = &_mh_execute_header;
}

void sub_100029968(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
}

void sub_10002997C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029990(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000299A4(int a1)
{
}

void sub_1000299B8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  byte_10004BF4C = 1;
}

void sub_1000299EC(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_100029A00(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0;
  }
  unsigned int v6 = __rev16(*((unsigned __int16 *)a1 + 1));
  int v7 = v6 - 4;
  if (v6 < 4 || v6 > a2) {
    return 0;
  }
  int v11 = *a1;
  int v12 = a1[1];
  int v13 = a1 + 4;
  if ((v11 - 1) > 6) {
    uint64_t v14 = " code=0x%x";
  }
  else {
    uint64_t v14 = " %s";
  }
  a3(a4, v14);
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v12);
  if ((v11 - 1) < 4)
  {
    if (v6 >= 6)
    {
      while (1)
      {
        uint64_t v15 = v13[1];
        if (v15 < 2 || v7 < v15) {
          goto LABEL_36;
        }
        int v17 = *v13;
        a3(a4, " <");
        if (v17 == 1) {
          break;
        }
        uint64_t v18 = v13;
        if (v17 == 2)
        {
          uint64_t v19 = "domain vers %d";
LABEL_23:
          uint64_t v18 = v13 + 6;
          htonl();
          a3(a4, v19);
        }
        if (v18 < &v13[v15])
        {
          uint64_t v20 = &v13[v15];
          int64_t v21 = v20 - v18;
          do
          {
            int v22 = *v18++;
            ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v22);
            --v21;
          }
          while (v21);
          uint64_t v18 = v20;
        }
        v7 -= v15;
        a3(a4, ">");
        int v13 = v18;
        if (v7 <= 1) {
          goto LABEL_35;
        }
      }
      uint64_t v19 = "route vers %d";
      goto LABEL_23;
    }
LABEL_34:
    uint64_t v18 = a1 + 4;
LABEL_35:
    int v13 = v18;
    if (v7 < 1) {
      return (v13 - a1);
    }
    goto LABEL_36;
  }
  if ((v11 - 5) >= 2) {
    goto LABEL_34;
  }
  if (v6 >= 5)
  {
    if (*v13 - 32 > 0x5E)
    {
LABEL_36:
      unsigned int v23 = v7 + 1;
      do
      {
        int v24 = *v13++;
        ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v24);
        --v23;
      }
      while (v23 > 1);
      return (v13 - a1);
    }
    a3(a4, " ");
    print_string((char *)a1 + 4, v6 - 4, a3, a4);
    LODWORD(v13) = v13 + v7;
  }
  return (v13 - a1);
}

void *sub_100029C4C()
{
  if (byte_100046F00) {
    BOOL v0 = 0;
  }
  else {
    BOOL v0 = acsp_use_dhcp == 0;
  }
  if (!v0 || acsp_intercept_dhcp != 0)
  {
    uint64_t result = add_notifier(&phasechange, (uint64_t)acsp_init_plugins, 0);
    if (acsp_intercept_dhcp) {
      ip_src_address_filter |= 4u;
    }
  }
  if (acsp_use_dhcp) {
    ip_src_address_filter |= 8u;
  }
  return result;
}

uint64_t sub_100029CE8(int a1)
{
  return *((unsigned int *)&acscp_fsm + 20 * a1 + 2);
}

double sub_100029D00()
{
  double result = *(double *)&acscp_wantoptions;
  acscp_gotoptions = acscp_wantoptions;
  return result;
}

uint64_t sub_100029D1C()
{
  if ((_BYTE)acscp_gotoptions) {
    int v0 = 6;
  }
  else {
    int v0 = 0;
  }
  if (BYTE8(acscp_gotoptions)) {
    int v1 = 6;
  }
  else {
    int v1 = 0;
  }
  return (v1 + v0);
}

void sub_100029D48(uint64_t a1, uint64_t a2, int *a3)
{
  int v3 = *a3;
  if ((_BYTE)acscp_gotoptions)
  {
    if (v3 < 6)
    {
      LOBYTE(acscp_gotoptions) = 0;
    }
    else
    {
      *(_WORD *)a2 = 1537;
      *(unsigned char *)(a2 + 2) = BYTE7(acscp_gotoptions);
      *(unsigned char *)(a2 + 3) = BYTE6(acscp_gotoptions);
      *(unsigned char *)(a2 + 4) = BYTE5(acscp_gotoptions);
      *(unsigned char *)(a2 + 5) = BYTE4(acscp_gotoptions);
      a2 += 6;
      v3 -= 6;
    }
  }
  if (BYTE8(acscp_gotoptions))
  {
    if (v3 < 6)
    {
      BYTE8(acscp_gotoptions) = 0;
    }
    else
    {
      *(_WORD *)a2 = 1538;
      *(unsigned char *)(a2 + 2) = HIBYTE(acscp_gotoptions);
      *(unsigned char *)(a2 + 3) = BYTE14(acscp_gotoptions);
      *(unsigned char *)(a2 + 4) = BYTE13(acscp_gotoptions);
      *(unsigned char *)(a2 + 5) = BYTE12(acscp_gotoptions);
      v3 -= 6;
    }
  }
  *a3 -= v3;
}

uint64_t sub_100029E08(uint64_t a1, uint64_t a2, int a3)
{
  if ((_BYTE)acscp_gotoptions)
  {
    BOOL v3 = __OFSUB__(a3, 6);
    a3 -= 6;
    if (a3 < 0 != v3) {
      return 0;
    }
    BOOL v4 = *(unsigned char *)(a2 + 1) == 6 && *(unsigned char *)a2 == 1;
    if (!v4 || DWORD1(acscp_gotoptions) != bswap32(*(_DWORD *)(a2 + 2))) {
      return 0;
    }
    a2 += 6;
  }
  if (BYTE8(acscp_gotoptions))
  {
    if (a3 >= 6)
    {
      BOOL v5 = *(unsigned char *)(a2 + 1) == 6 && *(unsigned char *)a2 == 2;
      if (v5 && a3 == 6 && HIDWORD(acscp_gotoptions) == bswap32(*(_DWORD *)(a2 + 2))) {
        return 1;
      }
    }
  }
  else if (!a3)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_100029EA8(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3 = DWORD1(acscp_gotoptions);
  unsigned int v4 = HIDWORD(acscp_gotoptions);
  if ((_BYTE)acscp_gotoptions && a3 >= 6 && *(unsigned char *)(a2 + 1) == 6 && *(unsigned char *)a2 == 1)
  {
    unsigned int v5 = *(_DWORD *)(a2 + 2);
    a2 += 6;
    unsigned int v6 = bswap32(v5);
    if (v6 < 2) {
      unsigned int v3 = v6;
    }
    a3 -= 6;
  }
  if (BYTE8(acscp_gotoptions))
  {
    if (*(unsigned char *)(a2 + 1) == 6 && a3 >= 6)
    {
      if (*(unsigned char *)a2 != 2) {
        goto LABEL_17;
      }
      a3 -= 6;
      unsigned int v8 = *(_DWORD *)(a2 + 2);
      a2 += 6;
      unsigned int v9 = bswap32(v8);
      if (v9 < 2) {
        unsigned int v4 = v9;
      }
    }
  }
  if (a3 < 3)
  {
LABEL_19:
    if (*(_DWORD *)(a1 + 8) != 9)
    {
      DWORD1(acscp_gotoptions) = v3;
      HIDWORD(acscp_gotoptions) = v4;
    }
    return 1;
  }
  else
  {
LABEL_17:
    while (1)
    {
      uint64_t v10 = *(unsigned __int8 *)(a2 + 1);
      a3 -= v10;
      if (a3 < 0) {
        return 0;
      }
      a2 += v10;
      if (a3 <= 2) {
        goto LABEL_19;
      }
    }
  }
}

uint64_t sub_100029F80(uint64_t a1, uint64_t a2, int a3)
{
  char v3 = acscp_gotoptions;
  char v4 = BYTE8(acscp_gotoptions);
  if ((_BYTE)acscp_gotoptions && a3 >= 6 && *(unsigned char *)(a2 + 1) == 6 && *(unsigned char *)a2 == 1)
  {
    uint64_t v5 = 0;
    if (bswap32(*(_DWORD *)(a2 + 2)) != DWORD1(acscp_gotoptions)) {
      return v5;
    }
    char v3 = 0;
    a2 += 6;
    a3 -= 6;
  }
  if (!BYTE8(acscp_gotoptions)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)(a2 + 1) != 6 || a3 < 6) {
    goto LABEL_15;
  }
  if (*(unsigned char *)a2 != 2) {
    return 0;
  }
  uint64_t v5 = 0;
  if (bswap32(*(_DWORD *)(a2 + 2)) == HIDWORD(acscp_gotoptions))
  {
    char v4 = 0;
    a3 -= 6;
LABEL_15:
    if (a3) {
      return 0;
    }
    if (*(_DWORD *)(a1 + 8) != 9)
    {
      LOBYTE(acscp_gotoptions) = v3;
      BYTE8(acscp_gotoptions) = v4;
    }
    return 1;
  }
  return v5;
}

uint64_t sub_10002A04C(int a1, unsigned __int8 *__src, int *a3, int a4)
{
  int v5 = *a3;
  acscp_hisoptions = 0;
  *(void *)&byte_10004A188 = 0;
  BOOL v25 = a4 != 0;
  int v6 = acscp_allowoptions;
  uint64_t v7 = 2;
  unsigned int v8 = __src;
  unsigned int v9 = (char *)__src;
LABEL_2:
  uint64_t v10 = v8;
LABEL_3:
  int v11 = byte_10004A178;
  unsigned int v12 = dword_10004A17C;
  int v13 = v10;
  unsigned int v14 = HIDWORD(acscp_allowoptions);
  while (v5)
  {
    if (v5 < 2 || ((uint64_t v15 = v13[1], v15 >= 2) ? (v16 = v5 >= v15) : (v16 = 0), !v16))
    {
      LOWORD(v15) = v5;
      int v17 = 1;
      unsigned int v8 = v13;
      int v5 = 0;
      goto LABEL_33;
    }
    int v17 = *v13;
    v5 -= v15;
    unsigned int v8 = &v13[v15];
    if (v17 == 2)
    {
      int v17 = 1;
      if (v15 != 6 || !v11) {
        goto LABEL_33;
      }
      uint64_t v18 = (uint64_t *)&byte_10004A188;
      if (bswap32(*(_DWORD *)(v13 + 2)) > v12)
      {
        HIBYTE(v14) = HIBYTE(v12);
        uint64_t v19 = &dword_10004A17C;
        goto LABEL_23;
      }
    }
    else
    {
      if (v17 != 1)
      {
        int v17 = 1;
        goto LABEL_33;
      }
      if (v15 != 6 || !v6) {
        goto LABEL_33;
      }
      uint64_t v18 = &acscp_hisoptions;
      if (bswap32(*(_DWORD *)(v13 + 2)) > v14)
      {
        uint64_t v19 = (int *)&acscp_allowoptions + 1;
LABEL_23:
        v13[2] = HIBYTE(v14);
        v13[3] = *((_WORD *)v19 + 1);
        v13[4] = BYTE1(*v19);
        v13[5] = *v19;
        if (a4)
        {
          LOWORD(v15) = 6;
          int v17 = v25;
        }
        else
        {
          uint64_t v10 = v8;
          if (v7 == 4) {
            goto LABEL_3;
          }
          BOOL v20 = v7 == 2;
          LOWORD(v15) = 6;
          LODWORD(v7) = 3;
          int v17 = v25;
          if (v20) {
            int v17 = 0;
          }
          if (v20) {
            unsigned int v9 = (char *)__src;
          }
        }
LABEL_33:
        BOOL v21 = v7 != 4;
        if ((v17 & v21) != 0) {
          uint64_t v7 = 4;
        }
        else {
          uint64_t v7 = v7;
        }
        if ((v17 & v21) != 0) {
          int v22 = (char *)__src;
        }
        else {
          int v22 = v9;
        }
        uint64_t v23 = (unsigned __int16)v15;
        if (v22 != (char *)v13)
        {
          memcpy(v22, v13, (unsigned __int16)v15);
          int v6 = acscp_allowoptions;
        }
        unsigned int v9 = &v22[v23];
        goto LABEL_2;
      }
    }
    *(unsigned char *)uint64_t v18 = 1;
    int v13 = v8;
    if (v7 == 2)
    {
      int v17 = 0;
      int v13 = v10;
      LOWORD(v15) = 6;
      goto LABEL_33;
    }
  }
  *a3 = v9 - __src;
  return v7;
}

void sub_10002A278()
{
  __int16 mtu = netif_get_mtu();
  int v1 = notify((uint64_t **)acsp_up_notifier, 0);
  if (acsp_up_hook) {
    acsp_up_hook(v1);
  }
  check_protocols_ready();

  acsp_start(mtu);
}

uint64_t (*sub_10002A2D8())(void)
{
  notify((uint64_t **)acsp_down_notifier, 0);
  acsp_stop();
  double result = (uint64_t (*)(void))acsp_down_hook;
  if (acsp_down_hook)
  {
    return (uint64_t (*)(void))result();
  }
  return result;
}

void sub_10002A324(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (byte_10004BF4C == 1)
  {
    byte_10004BF4C = 0;
    np_finished(*a1, 565, a3, a4, a5, a6, a7, a8);
  }
}

uint64_t **sub_10002A348(uint64_t **result)
{
  if (*((_DWORD *)result + 6) - *((_DWORD *)result + 7) == 2) {
    return notify((uint64_t **)protocolsready_notifier, 0);
  }
  return result;
}

void acsp_init_plugins()
{
  qword_10004BF50 = 0;
  remove_notifier((void **)&phasechange, (uint64_t)acsp_init_plugins, 0);
  qword_10004BF58 = 0;
  qword_10004BF60 = 0;
  if (!serverid)
  {
    if (!acsp_no_routes) {
      LOBYTE(acscp_wantoptions) = 1;
    }
    if (!acsp_no_domains) {
      BYTE8(acscp_wantoptions) = 1;
    }
    buffer[0] = 0;
    CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv4);
    if (!NetworkGlobalEntity) {
      goto LABEL_22;
    }
    CFStringRef v9 = NetworkGlobalEntity;
    CFDictionaryRef v10 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)cfgCache, NetworkGlobalEntity);
    if (v10)
    {
      CFDictionaryRef v11 = v10;
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v10, kSCPropNetIPv4Router);
      if (Value)
      {
        CFStringRef v13 = Value;
        CFTypeID v14 = CFGetTypeID(Value);
        if (v14 == CFStringGetTypeID()) {
          CFStringGetCString(v13, buffer, 32, 0x8000100u);
        }
      }
      CFRelease(v11);
    }
    CFRelease(v9);
    if (buffer[0]) {
      inet_aton(buffer, (in_addr *)&dword_10004BF68);
    }
    else {
LABEL_22:
    }
      dword_10004BF68 = 0;
    goto LABEL_23;
  }
  int v0 = SCPreferencesCreate(0, @"pppd", @"com.apple.RemoteAccessServers.plist");
  if (v0)
  {
    int v1 = v0;
    CFDictionaryRef v2 = (const __CFDictionary *)SCPreferencesGetValue(v0, @"Servers");
    if (v2)
    {
      CFDictionaryRef v3 = v2;
      CFStringRef v4 = CFStringCreateWithCString(0, (const char *)serverid, 0);
      if (!v4)
      {
LABEL_9:
        CFRelease(v1);
        goto LABEL_23;
      }
      CFStringRef v5 = v4;
      CFDictionaryRef v6 = (const __CFDictionary *)CFDictionaryGetValue(v3, v4);
      if (v6)
      {
        CFDictionaryRef v7 = v6;
        if (!acsp_no_routes)
        {
          CFDictionaryRef v35 = (const __CFDictionary *)CFDictionaryGetValue(v6, kSCEntNetIPv4);
          if (v35)
          {
            CFDictionaryRef v36 = v35;
            CFTypeID v37 = CFGetTypeID(v35);
            if (v37 == CFDictionaryGetTypeID())
            {
              CFArrayRef v38 = (const __CFArray *)CFDictionaryGetValue(v36, @"OfferedRouteAddresses");
              if (v38)
              {
                CFArrayRef v39 = v38;
                CFTypeID v40 = CFGetTypeID(v38);
                if (v40 == CFArrayGetTypeID())
                {
                  CFIndex Count = CFArrayGetCount(v39);
                  CFArrayRef v42 = (const __CFArray *)CFDictionaryGetValue(v36, @"OfferedRouteMasks");
                  if (v42)
                  {
                    CFArrayRef v43 = v42;
                    CFTypeID v44 = CFGetTypeID(v42);
                    if (v44 == CFArrayGetTypeID())
                    {
                      CFIndex v45 = CFArrayGetCount(v39);
                      CFArrayRef v46 = (const __CFArray *)CFDictionaryGetValue(v36, @"OfferedRouteTypes");
                      if (v46)
                      {
                        CFArrayRef theArray = v46;
                        CFTypeID v47 = CFGetTypeID(v46);
                        BOOL v48 = v47 == CFArrayGetTypeID();
                        CFArrayRef v49 = theArray;
                        if (v48)
                        {
                          CFIndex v50 = CFArrayGetCount(theArray);
                          if (Count == v45 && Count == v50)
                          {
                            LOBYTE(acscp_allowoptions) = 1;
                            if (Count >= 1)
                            {
                              CFIndex v58 = 0;
                              *(void *)&v161[0].in_addr_t s_addr = 0;
                              sockaddr v157 = "ACSP plugin: invalid route type specified\n";
                              CFIndex v158 = Count;
                              while (1)
                              {
                                CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v39, v58);
                                buffer[0] = 0;
                                CFStringGetCString(ValueAtIndex, buffer, 1024, 0x8000100u);
                                CFStringRef v60 = (const __CFString *)CFArrayGetValueAtIndex(v43, v58);
                                LOBYTE(v162.s_addr) = 0;
                                CFStringGetCString(v60, (char *)&v162, 1024, 0x8000100u);
                                CFStringRef v61 = (const __CFString *)CFArrayGetValueAtIndex(v49, v58);
                                if (CFStringCompare(v61, @"Private", 0))
                                {
                                  if (CFStringCompare(v61, @"Public", 0)) {
                                    goto LABEL_100;
                                  }
                                  __int16 v69 = 2;
                                }
                                else
                                {
                                  __int16 v69 = 1;
                                }
                                uint64_t v70 = (in_addr *)malloc_type_malloc(0x20uLL, 0x1020040983EA955uLL);
                                if (!v70) {
                                  break;
                                }
                                uint64_t v71 = v70;
                                *(_OWORD *)&v70->in_addr_t s_addr = 0u;
                                *(_OWORD *)&v70[4].in_addr_t s_addr = 0u;
                                if (!inet_aton(buffer, &v161[1]) || !inet_aton((const char *)&v162, v161))
                                {
                                  error((uint64_t)"ACSP plugin: invalid ip address or mask specified\n", v72, v73, v74, v75, v76, v77, v78, (int)"ACSP plugin: invalid route type specified\n");
                                  free(v71);
                                  goto LABEL_102;
                                }
                                in_addr_t s_addr = v161[0].s_addr;
                                v71[2].in_addr_t s_addr = (in_addr_t)v161[1];
                                v71[3].in_addr_t s_addr = s_addr;
                                LOWORD(v71[5].s_addr) = v69;
                                v71[6].in_addr_t s_addr = 0;
                                *(void *)&v71->in_addr_t s_addr = qword_10004BF58;
                                qword_10004BF58 = (uint64_t)v71;
                                ++v58;
                                CFArrayRef v49 = theArray;
                                if (v158 == v58) {
                                  goto LABEL_7;
                                }
                              }
                              sockaddr v157 = "ACSP plugin: no memory\n";
LABEL_100:
                              error((uint64_t)v157, v62, v63, v64, v65, v66, v67, v68, (int)v157);
                              LOBYTE(acscp_allowoptions) = 0;
                            }
                            if (!qword_10004BF58) {
LABEL_102:
                            }
                              LOBYTE(acscp_allowoptions) = 0;
                          }
                          else
                          {
                            error((uint64_t)"ACSP plugin: while reading prefs - route address, mask, and type counts not equal\n", v51, v52, v53, v54, v55, v56, v57, (int)v157);
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
LABEL_7:
        if (!acsp_no_domains)
        {
          CFDictionaryRef v80 = (const __CFDictionary *)CFDictionaryGetValue(v7, kSCEntNetDNS);
          if (v80)
          {
            CFDictionaryRef v81 = v80;
            CFTypeID v82 = CFGetTypeID(v80);
            if (v82 == CFDictionaryGetTypeID())
            {
              CFArrayRef v83 = (const __CFArray *)CFDictionaryGetValue(v81, @"OfferedSearchDomains");
              if (v83)
              {
                CFArrayRef v84 = v83;
                CFTypeID v85 = CFGetTypeID(v83);
                if (v85 == CFArrayGetTypeID())
                {
                  CFIndex v86 = CFArrayGetCount(v84);
                  CFArrayRef v87 = (const __CFArray *)CFDictionaryGetValue(v81, @"OfferedSearchDomainServers");
                  CFArrayRef v88 = v87;
                  if (v87 && (CFTypeID v89 = CFGetTypeID(v87), v89 == CFArrayGetTypeID()))
                  {
                    CFArrayRef theArraya = (CFArrayRef)v86;
                    if (CFArrayGetCount(v88) != v86)
                    {
                      error((uint64_t)"ACSP plugin: search domain count not equal to search domain server count\n", v90, v91, v92, v93, v94, v95, v96, (int)v157);
                      goto LABEL_8;
                    }
                  }
                  else
                  {
                    CFArrayRef theArraya = 0;
                  }
                  v162.in_addr_t s_addr = 0;
                  byte_10004A178 = 1;
                  if (v86)
                  {
                    if (v86 >= 1)
                    {
                      for (CFIndex i = 0; v86 != i; ++i)
                      {
                        CFStringRef v98 = (const __CFString *)CFArrayGetValueAtIndex(v84, i);
                        buffer[0] = 0;
                        CFStringGetCString(v98, buffer, 1024, 0x8000100u);
                        size_t v99 = strlen(buffer);
                        if (v99)
                        {
                          size_t v100 = v99;
                          int v101 = (in_addr *)malloc_type_malloc(0x18uLL, 0x1030040A9CFD972uLL);
                          if (!v101)
                          {
                            error((uint64_t)"ACSP plugin: no memory\n", v102, v103, v104, v105, v106, v107, v108, (int)v157);
                            byte_10004A178 = 0;
                            break;
                          }
                          timeval v109 = v101;
                          size_t v110 = v100 + 1;
                          fd_set v111 = malloc_type_malloc(v110, 0xD9CA7187uLL);
                          *(void *)&v109[4].in_addr_t s_addr = v111;
                          if (!v111)
                          {
                            error((uint64_t)"ACSP plugin: no memory\n", v112, v113, v114, v115, v116, v117, v118, (int)v157);
                            byte_10004A178 = 0;
                            free(v109);
                            break;
                          }
                          memcpy(v111, buffer, v110);
                          if (theArraya)
                          {
                            CFStringRef v119 = (const __CFString *)CFArrayGetValueAtIndex(v88, i);
                            buffer[0] = 0;
                            CFStringGetCString(v119, buffer, 1024, 0x8000100u);
                            if (!inet_aton(buffer, &v162))
                            {
                              error((uint64_t)"ACSP plugin: invalid ip address specified for DNS server\n", v120, v121, v122, v123, v124, v125, v126, (int)v157);
                              free(v109);
                              goto LABEL_109;
                            }
                            v109[2].in_addr_t s_addr = v162.s_addr;
                          }
                          else
                          {
                            v109[2].in_addr_t s_addr = 0;
                          }
                          *(void *)&v109->in_addr_t s_addr = qword_10004BF60;
                          qword_10004BF60 = (uint64_t)v109;
                        }
                      }
                    }
                  }
                  else
                  {
                    SCDynamicStoreRef v127 = SCDynamicStoreCreate(0, @"pppd", 0, 0);
                    if (v127)
                    {
                      uint64_t v128 = v127;
                      CFStringRef v129 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetDNS);
                      if (v129)
                      {
                        CFStringRef v130 = v129;
                        CFDictionaryRef v131 = (const __CFDictionary *)SCDynamicStoreCopyValue(v128, v129);
                        if (v131)
                        {
                          CFDictionaryRef v132 = v131;
                          CFTypeID v133 = CFGetTypeID(v131);
                          if (v133 == CFDictionaryGetTypeID())
                          {
                            CFStringRef v134 = (const __CFString *)CFDictionaryGetValue(v132, kSCPropNetDNSDomainName);
                            if (v134)
                            {
                              CFStringRef v135 = v134;
                              CFTypeID v136 = CFGetTypeID(v134);
                              if (v136 == CFStringGetTypeID())
                              {
                                buffer[0] = 0;
                                CFStringGetCString(v135, buffer, 1024, 0x8000100u);
                                int v137 = strlen(buffer);
                                if (v137)
                                {
                                  int v138 = malloc_type_malloc(0x18uLL, 0x1030040A9CFD972uLL);
                                  if (v138)
                                  {
                                    uint64_t v146 = v138;
                                    int v147 = v137 + 1;
                                    size_t v148 = v137 + 1;
                                    uint64_t v149 = malloc_type_malloc(v147, 0x50471A90uLL);
                                    v146[2] = v149;
                                    if (v149)
                                    {
                                      memcpy(v149, buffer, v148);
                                      *((_DWORD *)v146 + 2) = 0;
                                      *uint64_t v146 = qword_10004BF60;
                                      qword_10004BF60 = (uint64_t)v146;
                                    }
                                    else
                                    {
                                      error((uint64_t)"ACSP plugin: no memory\n", v150, v151, v152, v153, v154, v155, v156, (int)v157);
                                      free(v146);
                                    }
                                  }
                                  else
                                  {
                                    error((uint64_t)"ACSP plugin: no memory\n", v139, v140, v141, v142, v143, v144, v145, (int)v157);
                                  }
                                }
                              }
                            }
                          }
                          CFRelease(v130);
                        }
                        else
                        {
                          CFDictionaryRef v132 = (const __CFDictionary *)v130;
                        }
                        CFRelease(v132);
                      }
                      CFRelease(v128);
                    }
                  }
                  if (!qword_10004BF60) {
LABEL_109:
                  }
                    byte_10004A178 = 0;
                }
              }
            }
          }
        }
      }
LABEL_8:
      CFRelease(v5);
      goto LABEL_9;
    }
  }
LABEL_23:
  for (char j = 1; ; char j = 0)
  {
    char v16 = j;
    int v17 = malloc_type_malloc(0x78uLL, 0x10A0040E44D7C7EuLL);
    if (!v17) {
      break;
    }
    BOOL v25 = v17;
    if (v16)
    {
      *((unsigned char *)v17 + 64) = 1;
      if (!sub_10002C864(v17, 1))
      {
        BOOL v33 = &qword_10004BF58;
LABEL_31:
        uint64_t v34 = v25[9];
        *(void *)(v34 + 48) = *v33;
        if (*((unsigned char *)v25 + 64) == 2) {
          add_notifier_last((void **)&ip_up_notify, (uint64_t)sub_10002C950, v34);
        }
        else {
          add_notifier(&ip_up_notify, (uint64_t)sub_10002C950, v34);
        }
        add_notifier(&ip_down_notify, (uint64_t)sub_10002C990, v25[9]);
        *(void *)((char *)v25 + 12) = 0x2000000000;
        v25[4] = 0;
        v25[5] = 0;
        *((_WORD *)v25 + 24) = 16;
        *BOOL v25 = qword_10004BF50;
        qword_10004BF50 = (uint64_t)v25;
        goto LABEL_35;
      }
    }
    else
    {
      *((unsigned char *)v17 + 64) = 2;
      if (!sub_10002C864(v17, 2))
      {
        BOOL v33 = &qword_10004BF60;
        goto LABEL_31;
      }
    }
    error((uint64_t)"error initializing acsp plugin type\n", v26, v27, v28, v29, v30, v31, v32, (int)v157);
    free(v25);
LABEL_35:
    if ((v16 & 1) == 0)
    {
      ipdata_input_hook = (uint64_t (*)(void))sub_10002AD78;
      ipdata_up_hook = (uint64_t (*)(void, void, void))sub_10002B774;
      ipdata_down_hook = (uint64_t (*)(void))sub_10002B860;
      ipdata_print_hook = (uint64_t (*)(void))sub_10002B8C8;
      return;
    }
  }
  error((uint64_t)"acscp unable allocate plugin structures\n", v18, v19, v20, v21, v22, v23, v24, (int)v157);
  byte_100046F00 = 0;
}

void sub_10002AD78(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  if (!acsp_intercept_dhcp || ntohl() != -1 || ntohs() != 68 || ntohs() != 67)
  {
    if (!acsp_use_dhcp || *(_DWORD *)(a2 + 16) != a4 || ntohs() != 67 || ntohs() != 68) {
      return;
    }
    if (a3 > 0x10E)
    {
      if (!qword_10004BF70) {
        return;
      }
      ntohl();
      if (bswap32(*(_DWORD *)(a2 + 264)) == 1669485411)
      {
        if (*(unsigned char *)(a2 + 268) == 53 && *(unsigned char *)(a2 + 269) == 1 && *(unsigned char *)(a2 + 270) == 5)
        {
          __stringp = 0;
          signed int v32 = a3 - 271;
          if ((int)(a3 - 271) >= 1)
          {
            int v33 = *(unsigned __int8 *)(a2 + 271);
            if (v33 != 255)
            {
              uint64_t v34 = 0;
              CFDictionaryRef v35 = (unsigned __int8 *)(a2 + 271);
              do
              {
                if (v33)
                {
                  uint64_t v36 = v35[1];
                  int v37 = v32 - 2;
                  BOOL v22 = __OFSUB__(v37, v36);
                  int v38 = v37 - v36;
                  if ((v38 < 0) ^ v22 | (v38 == 0))
                  {
LABEL_106:
                    uint64_t v31 = "DHCP packet received with incorrect message option\n";
                    goto LABEL_104;
                  }
                  CFArrayRef v39 = (int *)(v35 + 2);
                  int v119 = v38;
                  switch(v33)
                  {
                    case 1:
                      int v54 = *v39;
                      uint64_t v55 = qword_10004BF70;
                      if (*v39) {
                        BOOL v56 = *(_DWORD *)(qword_10004BF70 + 36) == a4;
                      }
                      else {
                        BOOL v56 = 0;
                      }
                      if (v56 && *(_DWORD *)(qword_10004BF70 + 24) != v54)
                      {
                        *(_DWORD *)(qword_10004BF70 + 24) = v54;
                        if (!uifaddr(a1, a4, *(_DWORD *)(v55 + 40), v54))
                        {
                          int v70 = v35[2];
                          ntohl();
                          ntohl();
                          notice((uint64_t)"failed to configure dhcp option 'subnet mask' = %d.%d.%d.%d, our %x, his %x\n", v71, v72, v73, v74, v75, v76, v77, v70);
                        }
                      }
                      else
                      {
                        int v57 = *v39;
                        ntohl();
                        ntohl();
                        info((uint64_t)"ignoring dhcp option 'subnet mask' = %d.%d.%d.%d, current addr %x, current mask %x\n", v58, v59, v60, v61, v62, v63, v64, v57);
                      }
                      break;
                    case 15:
                      if (v34)
                      {
                        notice((uint64_t)"ignoring dhcp option 'domain name', option already processed.\n", v8, v9, v10, v11, v12, v13, v14, v118);
                        break;
                      }
                      __memcpy_chk();
                      __s[v36] = 0;
                      __stringp = __s;
                      uint64_t v66 = ",";
                      if (!strchr(__s, 44))
                      {
                        uint64_t v66 = ";";
                        if (!strchr(__s, 59))
                        {
                          uint64_t v66 = "\n";
                          if (!strchr(__s, 10))
                          {
                            uint64_t v66 = "\r";
                            if (!strchr(__s, 13))
                            {
                              if (strchr(__s, 32)) {
                                uint64_t v66 = " ";
                              }
                              else {
                                uint64_t v66 = (const char *)&unk_10003B620;
                              }
                            }
                          }
                        }
                      }
                      uint64_t v67 = strsep(&__stringp, v66);
                      uint64_t v68 = 0;
                      while (1)
                      {
                        if (v67 && !*v67)
                        {
                          uint64_t v34 = v68;
                        }
                        else
                        {
                          __int16 v69 = (uint64_t **)malloc_type_malloc(0x18uLL, 0x1030040A9CFD972uLL);
                          if (!v69)
                          {
                            error((uint64_t)"failed to allocate domain from DHCP packet\n", v8, v9, v10, v11, v12, v13, v14, v118);
                            uint64_t v34 = v68;
                            goto LABEL_75;
                          }
                          uint64_t v34 = v69;
                          v69[1] = 0;
                          v69[2] = 0;
                          *__int16 v69 = (uint64_t *)v68;
                          if (!v67)
                          {
                            v69[2] = (uint64_t *)__s;
                            goto LABEL_75;
                          }
                          v69[2] = (uint64_t *)v67;
                          uint64_t v68 = v69;
                        }
                        uint64_t v67 = strsep(&__stringp, v66);
                        if (!v67) {
                          goto LABEL_75;
                        }
                      }
                    case 249:
                      if (v35[1])
                      {
                        unsigned int v40 = 0;
                        do
                        {
                          int v41 = malloc_type_malloc(0x20uLL, 0x1020040983EA955uLL);
                          if (!v41)
                          {
                            error((uint64_t)"DHCP: no memory\n", v42, v43, v44, v45, v46, v47, v48, v118);
                            return;
                          }
                          CFArrayRef v49 = v41;
                          *int v41 = 0u;
                          v41[1] = 0u;
                          unsigned int v50 = *((unsigned __int8 *)v39 + v40);
                          int v51 = htonl();
                          *((_DWORD *)v49 + 3) = v51;
                          LODWORD(v52) = v50 >> 3;
                          if ((v50 & 7) != 0) {
                            uint64_t v52 = (v52 + 1);
                          }
                          else {
                            uint64_t v52 = v52;
                          }
                          *((_DWORD *)v49 + 2) = *(int *)((char *)v39 + v40 + 1) & v51;
                          *((_DWORD *)v49 + 4) = *(int *)((char *)v39 + v52 + v40 + 1);
                          *((_WORD *)v49 + 10) = 1;
                          *((_DWORD *)v49 + 6) = 0;
                          uint64_t v53 = qword_10004BF70;
                          *(void *)CFArrayRef v49 = *(void *)(qword_10004BF70 + 8);
                          *(void *)(v53 + 8) = v49;
                          v40 += v52 + 5;
                        }
                        while (v40 < v36);
                      }
                      else
                      {
                        CFArrayRef v49 = *(_OWORD **)(qword_10004BF70 + 8);
                      }
                      sub_10002D3B0((uint64_t *)v49);
                      break;
                  }
LABEL_75:
                  CFDictionaryRef v35 = (unsigned __int8 *)v39 + v36;
                  signed int v32 = v119;
                }
                else
                {
                  ++v35;
                  --v32;
                }
                int v33 = *v35;
              }
              while (v33 != 255 && v32 > 0);
              if (v34)
              {
                sub_10002D588(v34);
                do
                {
                  timeval v109 = *v34;
                  free(v34);
                  uint64_t v34 = (uint64_t **)v109;
                }
                while (v109);
              }
            }
          }
          untimeout((uint64_t)sub_10002D904, qword_10004BF70);
          *(_DWORD *)qword_10004BF70 = 5;
          notify((uint64_t **)acspdhcpready_notifier, 0);
          return;
        }
LABEL_103:
        uint64_t v31 = "DHCP packet received with incorrect message type\n";
        goto LABEL_104;
      }
LABEL_102:
      uint64_t v31 = "DHCP packet received with incorrect cookie\n";
      goto LABEL_104;
    }
LABEL_41:
    uint64_t v31 = "DHCP packet received with incorrect length\n";
    goto LABEL_104;
  }
  if (a3 <= 0x10E) {
    goto LABEL_41;
  }
  if (bswap32(*(_DWORD *)(a2 + 264)) != 1669485411) {
    goto LABEL_102;
  }
  if (*(unsigned char *)(a2 + 268) != 53 || *(unsigned char *)(a2 + 269) != 1 || *(unsigned char *)(a2 + 270) != 8) {
    goto LABEL_103;
  }
  int v15 = 0;
  WORD2(__stringp) = 0;
  LODWORD(__stringp) = 0;
  *(_OWORD *)__s = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  int v16 = a3 - 271;
  __int16 v135 = 0;
  if ((int)(a3 - 271) < 1)
  {
    int v18 = 0;
  }
  else
  {
    int v17 = *(unsigned __int8 *)(a2 + 271);
    int v18 = 0;
    if (v17 != 255)
    {
      int v18 = 0;
      int v15 = 0;
      uint64_t v19 = (unsigned __int8 *)(a2 + 271);
      do
      {
        if (v17)
        {
          uint64_t v20 = v19[1];
          int v21 = v16 - 2;
          BOOL v22 = __OFSUB__(v21, v20);
          int v16 = v21 - v20;
          if ((v16 < 0) ^ v22 | (v16 == 0)) {
            goto LABEL_106;
          }
          uint64_t v23 = v19 + 2;
          if (v17 == 55 && v20)
          {
            uint64_t v24 = v23;
            uint64_t v25 = v20;
            do
            {
              int v27 = *v24++;
              int v26 = v27;
              BOOL v8 = v27 == 15;
              if (qword_10004BF58) {
                BOOL v28 = v26 == 249;
              }
              else {
                BOOL v28 = 0;
              }
              if (v28) {
                int v29 = 1;
              }
              else {
                int v29 = v18;
              }
              if (v8 && qword_10004BF60 != 0) {
                int v15 = 1;
              }
              else {
                int v18 = v29;
              }
              --v25;
            }
            while (v25);
          }
          uint64_t v19 = &v23[v20];
        }
        else
        {
          ++v19;
          --v16;
        }
        int v17 = *v19;
      }
      while (v17 != 255 && v16 > 0);
    }
  }
  if (!(v15 | v18)) {
    return;
  }
  outpacket_buf = 553649151;
  qword_100048134 = 0;
  int v78 = *(_DWORD *)(a2 + 30);
  __int16 v79 = *(_WORD *)(a2 + 34);
  long long v80 = *(_OWORD *)(a2 + 214);
  long long v81 = *(_OWORD *)(a2 + 246);
  long long v133 = *(_OWORD *)(a2 + 230);
  long long v134 = v81;
  long long v82 = *(_OWORD *)(a2 + 150);
  long long v83 = *(_OWORD *)(a2 + 182);
  long long v129 = *(_OWORD *)(a2 + 166);
  long long v130 = v83;
  long long v131 = *(_OWORD *)(a2 + 198);
  long long v132 = v80;
  long long v84 = *(_OWORD *)(a2 + 86);
  long long v85 = *(_OWORD *)(a2 + 118);
  long long v125 = *(_OWORD *)(a2 + 102);
  long long v126 = v85;
  long long v127 = *(_OWORD *)(a2 + 134);
  long long v128 = v82;
  long long v86 = *(_OWORD *)(a2 + 54);
  long long v87 = *(_OWORD *)(a2 + 70);
  __int16 v88 = *(_WORD *)(a2 + 262);
  *(_OWORD *)__s = *(_OWORD *)(a2 + 38);
  long long v122 = v86;
  long long v123 = v87;
  long long v124 = v84;
  unk_1000481F6 = v132;
  unk_100048206 = v133;
  unk_100048216 = v134;
  unk_1000481B6 = v82;
  unk_1000481C6 = v129;
  unk_1000481D6 = v130;
  unk_1000481E6 = v131;
  unk_100048176 = v84;
  unk_100048186 = v125;
  unk_100048196 = v126;
  unk_1000481A6 = v127;
  *(_OWORD *)((char *)&dword_100048144 + 2) = *(_OWORD *)__s;
  unk_100048156 = v86;
  *(void *)&byte_100048128 = 0;
  *(void *)&word_100048120 = 0;
  dword_100048130 = 0;
  LODWORD(__stringp) = v78;
  WORD2(__stringp) = v79;
  __int16 v135 = v88;
  word_10004813C = 258;
  *(_DWORD *)&byte_10004813E = v78;
  word_100048142 = v79;
  LOWORD(dword_100048144) = 0;
  word_100048226 = v88;
  unk_100048166 = v87;
  qword_100048228 = 0x3605013563538263;
  LOBYTE(word_100048230) = 4;
  unsigned int v89 = ntohl();
  *(_DWORD *)((char *)&word_100048230 + 1) = bswap32(v89);
  if (v15)
  {
    uint64_t v90 = (void *)qword_10004BF60;
    do
    {
      uint64_t v91 = v90;
      uint64_t v90 = (void *)*v90;
    }
    while (v90);
    LOBYTE(word_100048235) = 15;
    size_t v92 = strlen((const char *)v91[2]);
    if ((v92 << 32) + 0x11B00000000 > 0x5DF00000000)
    {
      uint64_t v31 = "Domain name too large for DHCP\n";
      goto LABEL_104;
    }
    int v93 = v92;
    uint64_t v94 = v92 << 32;
    HIBYTE(word_100048235) = v92;
    memcpy(&qword_100048237, (const void *)v91[2], (int)v92);
    uint64_t v95 = (__int16 *)((char *)&qword_100048237 + (v94 >> 32));
    int v96 = v93 + 283;
  }
  else
  {
    uint64_t v95 = &word_100048235;
    int v96 = 281;
  }
  if (!v18 || (uint64_t v97 = qword_10004BF58) == 0)
  {
LABEL_142:
    *(unsigned char *)uint64_t v95 = -1;
    uint64_t v111 = (v96 + 1);
    if ((int)v111 <= 0) {
      int v112 = -(-(int)v111 & 3);
    }
    else {
      int v112 = ((_BYTE)v96 + 1) & 3;
    }
    if (v111 <= 0x5DF)
    {
      BOOL v22 = __OFSUB__(v112, 1);
      int v113 = v112 - 1;
      if (v113 < 0 == v22)
      {
        if (v113 >= (1502 - v96)) {
          uint64_t v114 = (1502 - v96);
        }
        else {
          uint64_t v114 = v113;
        }
        bzero((char *)v95 + 1, v114 + 1);
        uint64_t v111 = (v96 + v114 + 2);
      }
    }
    unsigned int v115 = ntohl();
    sub_10002D714(a1, v111, v89, 0x43u, v115, 68, v116, v117, v118);
    return;
  }
  int v98 = 0;
  char v99 = 1;
  while (1)
  {
    while ((*(_WORD *)(v97 + 20) & 1) == 0)
    {
      uint64_t v97 = *(void *)v97;
      if (!v97)
      {
        if (v99) {
          goto LABEL_142;
        }
LABEL_141:
        size_t v110 = (char *)v95 - (v98 + 1);
        *size_t v110 = v98;
        uint64_t v95 = (__int16 *)&v110[v98 + 1];
        v96 += v98 + 2;
        goto LABEL_142;
      }
    }
    if (v99) {
      break;
    }
LABEL_125:
    unsigned int v100 = ntohl();
    int v101 = ntohl();
    unsigned int v102 = 32;
    if ((v100 & 1) == 0)
    {
      unsigned int v103 = v100;
      do
      {
        if (!--v102) {
          break;
        }
        char v104 = v103;
        v103 >>= 1;
      }
      while ((v104 & 2) == 0);
    }
    if ((v102 & 7) != 0) {
      int v105 = (v102 >> 3) + 1;
    }
    else {
      int v105 = v102 >> 3;
    }
    if ((v96 - 1499 + v105) < 0xFFFFFA20)
    {
      uint64_t v31 = "Static routes list too large DHCP\n";
      goto LABEL_104;
    }
    char v106 = v101 & v100;
    *(unsigned char *)uint64_t v95 = v102;
    *((unsigned char *)v95 + 1) = (v101 & v100) >> 24;
    *((unsigned char *)v95 + 2) = (v101 & v100) >> 16;
    *((unsigned char *)v95 + 3) = (unsigned __int16)(v101 & v100) >> 8;
    uint64_t v107 = (char *)v95 - (4 - v105);
    *((unsigned char *)v95 + 4) = v106;
    unsigned int v108 = ntohl();
    char v99 = 0;
    uint64_t v95 = (__int16 *)(v107 + 9);
    *(_DWORD *)(v107 + 5) = bswap32(v108);
    v98 += v105 + 5;
    uint64_t v97 = *(void *)v97;
    if (!v97) {
      goto LABEL_141;
    }
  }
  if ((v96 - 1502) > 0xFFFFFA1F)
  {
    *v95++ = 249;
    goto LABEL_125;
  }
  uint64_t v31 = "No space for DHCP routes\n";
LABEL_104:
  warning((uint64_t)v31, v8, v9, v10, v11, v12, v13, v14, v118);
}

void sub_10002B774(unsigned int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (acsp_use_dhcp && off_100046F48(a1) != 9)
  {
    uint64_t v12 = malloc_type_malloc(0x30uLL, 0x1090040B760FDDAuLL);
    qword_10004BF70 = (uint64_t)v12;
    if (v12)
    {
      _DWORD v12[2] = 0u;
      *(_OWORD *)((char *)v12 + 20) = 0u;
      *(_OWORD *)((char *)v12 + 4) = 0u;
      *((_DWORD *)v12 + 8) = a1;
      *((_DWORD *)v12 + 9) = a2;
      *((_DWORD *)v12 + 10) = a3;
      *(_DWORD *)uint64_t v12 = 1;
      sub_10002D99C(a1);
    }
    else
    {
      error((uint64_t)"ACSP plugin: no memory to allocate DHCP routes context\n", v13, v14, v15, v16, v17, v18, v19, a9);
    }
  }
}

void sub_10002B860()
{
  if (acsp_use_dhcp) {
    BOOL v0 = qword_10004BF70 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (!v0)
  {
    sub_10002D1FC(*(uint64_t **)(qword_10004BF70 + 8));
    untimeout((uint64_t)sub_10002D904, qword_10004BF70);
    free((void *)qword_10004BF70);
    qword_10004BF70 = 0;
  }
}

uint64_t sub_10002B8C8(uint64_t a1, unsigned int a2, void (*a3)(uint64_t, const char *, ...), uint64_t a4)
{
  if (ntohs() - 67 > 1 || ntohs() - 67 > 1) {
    return 0;
  }
  v8.in_addr_t s_addr = *(_DWORD *)(a1 + 12);
  uint64_t v9 = inet_ntoa(v8);
  a3(a4, " <src addr %s>", v9);
  v10.in_addr_t s_addr = *(_DWORD *)(a1 + 16);
  uint64_t v11 = inet_ntoa(v10);
  a3(a4, " <dst addr %s>", v11);
  int v12 = *(unsigned __int8 *)(a1 + 28);
  if ((v12 - 1) >= 2)
  {
    uint64_t v53 = " <bootp code invalid!>";
    goto LABEL_72;
  }
  if (v12 == 1) {
    uint64_t v13 = "Request";
  }
  else {
    uint64_t v13 = "Reply";
  }
  a3(a4, " <BOOTP %s>", v13);
  if (debug >= 2)
  {
    a3(a4, " <htype %d>", *(unsigned __int8 *)(a1 + 29));
    a3(a4, " <hlen %d>", *(unsigned __int8 *)(a1 + 30));
    a3(a4, " <hops %d>", *(unsigned __int8 *)(a1 + 31));
    a3(a4, " <xid %d>", *(_DWORD *)(a1 + 32));
    a3(a4, " <flags %d>", *(unsigned __int16 *)(a1 + 38));
    v14.in_addr_t s_addr = *(_DWORD *)(a1 + 40);
    uint64_t v15 = inet_ntoa(v14);
    a3(a4, " <client address %s>", v15);
    v16.in_addr_t s_addr = *(_DWORD *)(a1 + 44);
    uint64_t v17 = inet_ntoa(v16);
    a3(a4, " <your address %s>", v17);
    v18.in_addr_t s_addr = *(_DWORD *)(a1 + 48);
    uint64_t v19 = inet_ntoa(v18);
    a3(a4, " <server address %s>", v19);
    v20.in_addr_t s_addr = *(_DWORD *)(a1 + 52);
    int v21 = inet_ntoa(v20);
    a3(a4, " <gateway address %s>", v21);
    snprintf(__str, 0x800uLL, "%02x", *(unsigned __int8 *)(a1 + 56));
    for (uint64_t i = 0; i != 15; ++i)
    {
      snprintf(v55, 0x10uLL, ":%02x", *(unsigned __int8 *)(a1 + 57 + i));
      __strlcat_chk();
    }
    a3(a4, " <hardware address %s>", __str);
    a3(a4, " <server host name \"%s\">", (const char *)(a1 + 72));
    a3(a4, " <boot file name \"%s\">", (const char *)(a1 + 136));
  }
  if (bswap32(*(_DWORD *)(a1 + 264)) != 1669485411)
  {
    uint64_t v53 = " <cookie invalid!>";
    goto LABEL_72;
  }
  if (debug >= 2) {
    a3(a4, " <cookie 0x%x>", 1669485411);
  }
  if (*(unsigned char *)(a1 + 268) != 53
    || *(unsigned char *)(a1 + 269) != 1
    || (int v23 = *(unsigned __int8 *)(a1 + 270), v23 != 5) && v23 != 8)
  {
    uint64_t v53 = " <type invalid!>";
    goto LABEL_72;
  }
  if (v23 == 8) {
    uint64_t v24 = "INFORM";
  }
  else {
    uint64_t v24 = "ACK";
  }
  a3(a4, " <type %s>", v24);
  int v25 = *(unsigned __int8 *)(a1 + 271);
  if (v25 == 255 || (int v26 = a2 - 271, (int)(a2 - 271) < 1))
  {
LABEL_66:
    if (debug <= 1) {
      return a2;
    }
    else {
      return 0;
    }
  }
  int v27 = (unsigned __int8 *)(a1 + 271);
  while (!v25)
  {
    ++v27;
    --v26;
LABEL_61:
    int v25 = *v27;
    if (v25 == 255 || v26 <= 0) {
      goto LABEL_66;
    }
  }
  int v28 = v26 - 2;
  if (v26 != 2)
  {
    int v29 = v27 + 2;
    uint64_t v30 = v27[1];
    __str[0] = 0;
    if (v25 <= 50)
    {
      switch(v25)
      {
        case 1:
          uint64_t v31 = a4;
          signed int v32 = " <subnet mask %d.%d.%d.%d>";
          break;
        case 12:
          __memcpy_chk();
          __str[v30] = 0;
          uint64_t v31 = a4;
          signed int v32 = " <host name \"%s\">";
          break;
        case 15:
          __memcpy_chk();
          __str[v30] = 0;
          uint64_t v31 = a4;
          signed int v32 = " <domain name \"%s\">";
          break;
        default:
LABEL_42:
          uint64_t v31 = a4;
          signed int v32 = " <option %d>";
          break;
      }
LABEL_59:
      a3(v31, v32);
    }
    else
    {
      switch(v25)
      {
        case '3':
          uint64_t v31 = a4;
          signed int v32 = " <lease time %d sec>";
          goto LABEL_59;
        case '4':
        case '5':
        case '8':
        case '9':
        case ':':
        case ';':
          goto LABEL_42;
        case '6':
          int v54 = v26 - 2;
          strcpy(__str, "0x");
          if (v30)
          {
            uint64_t v39 = v30;
            unsigned int v40 = v27 + 2;
            do
            {
              int v41 = *v40++;
              snprintf(v55, 0x10uLL, "%02x", v41);
              __strlcat_chk();
              --v39;
            }
            while (v39);
          }
          uint64_t v42 = a4;
          uint64_t v43 = " <server id %s>";
          goto LABEL_55;
        case '7':
          int v44 = v26 - 2;
          uint64_t v45 = v30;
          uint64_t v46 = v27 + 2;
          if (v30)
          {
            do
            {
              int v47 = *v46++;
              snprintf(v55, 0x10uLL, " 0x%x", v47);
              __strlcat_chk();
              --v45;
            }
            while (v45);
          }
          a3(a4, " <parameters =%s>", __str);
          int v28 = v44;
          goto LABEL_60;
        case '<':
          __memcpy_chk();
          __str[v30] = 0;
          uint64_t v31 = a4;
          signed int v32 = " <vendor class id \"%s\">";
          goto LABEL_59;
        case '=':
          int v54 = v26 - 2;
          strcpy(__str, "0x");
          if (v30)
          {
            uint64_t v48 = v30;
            CFArrayRef v49 = v27 + 2;
            do
            {
              int v50 = *v49++;
              snprintf(v55, 0x10uLL, "%02x", v50);
              __strlcat_chk();
              --v48;
            }
            while (v48);
          }
          uint64_t v42 = a4;
          uint64_t v43 = " <client id %s>";
LABEL_55:
          a3(v42, v43);
          break;
        default:
          if (v25 != 249) {
            goto LABEL_42;
          }
          int v54 = v26 - 2;
          a3(a4, " <static routes");
          if (v30)
          {
            int v33 = 0;
            do
            {
              unsigned int v34 = v29[v33];
              unsigned int v35 = -1 << -(char)v34;
              if ((v34 & 7) != 0) {
                int v36 = (v34 >> 3) + 1;
              }
              else {
                int v36 = v34 >> 3;
              }
              unsigned int v37 = v35 & ntohl();
              unsigned int v38 = ntohl();
              v33 += v36 + 5;
              a3(a4, " %d.%d.%d.%d/%d.%d.%d.%d/%d.%d.%d.%d", HIBYTE(v37), BYTE2(v37), BYTE1(v37), v37, HIBYTE(v35), BYTE2(v35), BYTE1(v35), v35, HIBYTE(v38), BYTE2(v38), BYTE1(v38), v38);
            }
            while (v33 < (int)v30);
          }
          a3(a4, ">");
          break;
      }
      int v28 = v54;
    }
LABEL_60:
    int v27 = &v29[v30];
    int v26 = v28 - v30;
    goto LABEL_61;
  }
  uint64_t v53 = " <option %d zero len!>";
LABEL_72:
  a3(a4, v53);
  return 0;
}

void acsp_start(__int16 a1)
{
  sub_10002B860();
  for (uint64_t i = qword_10004BF50; i; uint64_t i = *(void *)i)
  {
    *(_WORD *)(i + 18) = a1;
    *(_DWORD *)(i + 20) = 1;
    *(void *)(i + 24) = 0;
    *(_DWORD *)(i + 50) = 0;
    *(void *)(i + 56) = 0;
    (*(void (**)(void, uint64_t, uint64_t))(i + 96))(*(void *)(i + 72), i + 16, i + 48);
    sub_10002C2B4(i, v3, v4, v5, v6, v7, v8, v9);
  }
}

uint64_t acsp_stop()
{
  for (uint64_t i = qword_10004BF50; i; uint64_t i = *(void *)i)
  {
    if (*(_DWORD *)(i + 12))
    {
      untimeout((uint64_t)sub_10002C254, i);
      *(_DWORD *)(i + 12) = 0;
    }
    *(_DWORD *)(i + 20) = 2;
    *(void *)(i + 24) = 0;
    *(_DWORD *)(i + 50) = 0;
    *(void *)(i + 56) = 0;
    uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(i + 96))(*(void *)(i + 72), i + 16, i + 48);
  }
  return result;
}

void acsp_data_input(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if ((int)a3 >= 8)
  {
    __int16 v10 = a3;
    int v12 = &qword_10004BF50;
    do
    {
      int v12 = (uint64_t *)*v12;
      if (!v12)
      {
        uint64_t v9 = "ACSP packet received with invalid type\n";
        goto LABEL_14;
      }
    }
    while (*((unsigned __int8 *)v12 + 64) != *a2);
    if ((ntohs() & 4) != 0 && *((_DWORD *)v12 + 3) == 1 && a2[1] == *((unsigned __int8 *)v12 + 8))
    {
      untimeout((uint64_t)sub_10002C254, (uint64_t)v12);
      *((_DWORD *)v12 + 3) = 0;
    }
    *((_WORD *)v12 + 10) = 3;
    v12[3] = (uint64_t)a2;
    *((_WORD *)v12 + 11) = v10;
    v12[7] = 0;
    *(_DWORD *)((char *)v12 + 50) = 0;
    ((void (*)(uint64_t, uint64_t *, uint64_t *))v12[12])(v12[9], v12 + 2, v12 + 6);
    sub_10002C2B4((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
  }
  else
  {
    uint64_t v9 = "ACSP packet received was too short\n";
LABEL_14:
    error((uint64_t)v9, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

uint64_t sub_10002C254(uint64_t a1)
{
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 20) = 4;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 50) = 0;
  *(void *)(a1 + 56) = 0;
  (*(void (**)(void, uint64_t, uint64_t))(a1 + 96))(*(void *)(a1 + 72), a1 + 16, a1 + 48);

  return sub_10002C2B4(a1);
}

void sub_10002C2B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1 + 48;
  uint64_t v10 = a1 + 16;
  while (1)
  {
    uint64_t v11 = "ACSP plugin for option # %d attempted to invoke UI - not supported\n";
    switch(*(_WORD *)(a1 + 50))
    {
      case 0:
        return;
      case 1:
      case 3:
        unsigned int v12 = *(unsigned __int16 *)(a1 + 52);
        BOOL v13 = v12 < 8 || v12 > *(unsigned __int16 *)(a1 + 18);
        uint64_t v11 = "ACSP plugin for option # %d trying to send packet of invalid length\n";
        if (v13) {
          goto LABEL_10;
        }
        uint64_t v14 = *(void *)(a1 + 56);
        *(_WORD *)uint64_t v14 = 1023;
        __int16 v15 = htons();
        *(_WORD *)(v14 + 2) = v15;
        if (*(_WORD *)(a1 + 50) == 3)
        {
          if (*(_DWORD *)(a1 + 12)) {
            untimeout((uint64_t)sub_10002C254, a1);
          }
          *(_DWORD *)(a1 + 12) = 1;
          *(unsigned char *)(a1 + 8) = *(unsigned char *)(v14 + 5);
          timeout((int)sub_10002C254);
        }
        output(0, *(void *)(a1 + 56), *(unsigned __int16 *)(a1 + 52), v16, v17, v18, v19, v20, v23);
        int v21 = *(void (**)(uint64_t, uint64_t))(a1 + 88);
        if (v21)
        {
          uint64_t v22 = *(void *)(a1 + 72);
          v21(v22, v9);
        }
        return;
      case 2:
        goto LABEL_10;
      case 4:
        uint64_t v11 = "ACSP plugin for option # %d attempted timeout action with invalid time value\n";
        if (*(_WORD *)(a1 + 52) != 4) {
          goto LABEL_10;
        }
        *(_DWORD *)(a1 + 12) = 2;
        timeout((int)sub_10002C254);
        return;
      case 5:
        if (*(_DWORD *)(a1 + 12))
        {
          untimeout((uint64_t)sub_10002C254, a1);
          *(_DWORD *)(a1 + 12) = 0;
        }
        return;
      default:
        uint64_t v11 = "ACSP plugin for option # %d trying to perform invalid action\n";
LABEL_10:
        error((uint64_t)v11, a2, a3, a4, a5, a6, a7, a8, *(unsigned __int8 *)(a1 + 64));
        *(_DWORD *)(a1 + 20) = 6;
        *(void *)(a1 + 24) = 0;
        *(void *)(a1 + 56) = 0;
        *(_DWORD *)(a1 + 50) = 0;
        (*(void (**)(void, uint64_t, uint64_t))(a1 + 96))(*(void *)(a1 + 72), v10, v9);
        break;
    }
  }
}

uint64_t acsp_printpkt(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *, ...), uint64_t a4)
{
  uint64_t result = 0;
  if (a1 && a2 >= 8)
  {
    uint64_t v38 = 0;
    unsigned int v8 = ntohs();
    if (v8 >= 8) {
      unsigned int v9 = v8 - 8;
    }
    else {
      unsigned int v9 = 0;
    }
    char v10 = ntohs();
    int v11 = *a1;
    int v37 = (int)a1;
    if (v11 == 2)
    {
      unsigned int v12 = (uint64_t *)(a1 + 8);
      uint64_t v22 = " START";
      int v23 = (const char *)&unk_100032B9A;
      if ((v10 & 2) == 0) {
        uint64_t v22 = (const char *)&unk_100032B9A;
      }
      uint64_t v24 = " END";
      if ((v10 & 1) == 0) {
        uint64_t v24 = (const char *)&unk_100032B9A;
      }
      int v25 = " REQUIRE-ACK";
      if ((v10 & 8) == 0) {
        int v25 = (const char *)&unk_100032B9A;
      }
      if ((v10 & 4) != 0) {
        int v23 = " ACK";
      }
      a3(a4, " <payload len %d, packet seq %d, %s, flags:%s%s%s%s>", v9, a1[1], "CI_DOMAINS", v22, v24, v25, v23);
      if (v9 >= 8)
      {
        do
        {
          uint64_t v26 = *v12;
          uint64_t v38 = *v12;
          unsigned int v27 = ntohs();
          unsigned int v28 = v27;
          if (v27 >= 0x100) {
            uint64_t v29 = 256;
          }
          else {
            uint64_t v29 = v27;
          }
          if (v27) {
            __memcpy_chk();
          }
          v39[v29] = 0;
          if (v26)
          {
            addr2ascii(2, &v38, 4, v40);
            uint64_t v30 = a4;
            uint64_t v31 = "\n    <domain: name %s, server %s>";
          }
          else
          {
            uint64_t v30 = a4;
            uint64_t v31 = "\n    <domain: name %s>";
          }
          a3(v30, v31);
          uint64_t v32 = v28 + 6;
          v9 -= v32;
          unsigned int v12 = (uint64_t *)((char *)v12 + v32);
        }
        while (v9 > 7);
      }
    }
    else if (v11 == 1)
    {
      unsigned int v12 = (uint64_t *)(a1 + 8);
      BOOL v13 = " START";
      if ((v10 & 2) == 0) {
        BOOL v13 = (const char *)&unk_100032B9A;
      }
      uint64_t v14 = " END";
      if ((v10 & 1) == 0) {
        uint64_t v14 = (const char *)&unk_100032B9A;
      }
      __int16 v15 = " REQUIRE-ACK";
      if ((v10 & 8) == 0) {
        __int16 v15 = (const char *)&unk_100032B9A;
      }
      uint64_t v16 = " ACK";
      if ((v10 & 4) == 0) {
        uint64_t v16 = (const char *)&unk_100032B9A;
      }
      a3(a4, " <payload len %d, packet seq %d, %s, flags:%s%s%s%s>", v9, a1[1], "CI_ROUTES", v13, v14, v15, v16);
      if (v9 >= 0xC)
      {
        do
        {
          char v17 = ntohs();
          uint64_t v18 = addr2ascii(2, v12, 4, v40);
          uint64_t v19 = addr2ascii(2, (char *)v12 + 4, 4, v39);
          if (v17) {
            uint64_t v20 = " PRIVATE";
          }
          else {
            uint64_t v20 = (const char *)&unk_100032B9A;
          }
          if ((v17 & 2) != 0) {
            int v21 = " PUBLIC";
          }
          else {
            int v21 = (const char *)&unk_100032B9A;
          }
          a3(a4, "\n    <route: address %s, mask %s, flags:%s%s>", v18, v19, v20, v21);
          v9 -= 12;
          unsigned int v12 = (uint64_t *)((char *)v12 + 12);
        }
        while (v9 > 0xB);
      }
    }
    else
    {
      int v33 = " START";
      unsigned int v34 = (const char *)&unk_100032B9A;
      if ((v10 & 2) == 0) {
        int v33 = (const char *)&unk_100032B9A;
      }
      unsigned int v35 = " END";
      if ((v10 & 1) == 0) {
        unsigned int v35 = (const char *)&unk_100032B9A;
      }
      int v36 = " REQUIRE-ACK";
      if ((v10 & 8) == 0) {
        int v36 = (const char *)&unk_100032B9A;
      }
      if ((v10 & 4) != 0) {
        unsigned int v34 = " ACK";
      }
      a3(a4, " <payload len %d, packet seq %d, CI_TYPE %d, flags:%s%s%s%s>", v9, a1[1], v11, v33, v35, v36, v34);
      LODWORD(v12) = a1 + 8;
    }
    return (v12 - v37);
  }
  return result;
}

uint64_t sub_10002C864(void *a1, char a2)
{
  uint64_t v4 = malloc_type_malloc(0x40uLL, 0x109004061D8AE16uLL);
  if (v4)
  {
    unsigned int v12 = v4;
    BOOL v13 = malloc_type_malloc(0x5DCuLL, 0x4DF37E9BuLL);
    v12[4] = v13;
    if (v13)
    {
      uint64_t result = 0;
      *((_DWORD *)v12 + 10) = 1500;
      *(unsigned char *)unsigned int v12 = a2;
      *(void *)((char *)v12 + 4) = &_mh_execute_header;
      _DWORD v12[2] = 0;
      *((unsigned char *)v12 + 12) = 0;
      v12[6] = 0;
      *((_DWORD *)v12 + 14) = 0;
      a1[9] = v12;
      a1[10] = sub_10002C9E0;
      a1[11] = 0;
      a1[12] = sub_10002C9E4;
      a1[13] = 0;
      a1[14] = nullsub_1;
      return result;
    }
    error((uint64_t)"ACSP plugin: no memory\n", v14, v15, v16, v17, v18, v19, v20, v22);
    free(v12);
  }
  else
  {
    error((uint64_t)"ACSP plugin: no memory\n", v5, v6, v7, v8, v9, v10, v11, v22);
  }
  return 0xFFFFFFFFLL;
}

uint64_t **sub_10002C950(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 1;
  if (*(_DWORD *)(a1 + 4) == 1 && *(_DWORD *)(a1 + 8) == 5 && !*(_DWORD *)(a1 + 56)) {
    return sub_10002D134((unsigned __int8 *)a1);
  }
  else {
    return notify((uint64_t **)acspdhcpready_notifier, 0);
  }
}

void sub_10002C990(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 0;
  if (*(_DWORD *)(a1 + 4) == 1 && *(_DWORD *)(a1 + 56))
  {
    if (*(unsigned char *)a1 == 1) {
      sub_10002D1FC(*(uint64_t **)(a1 + 48));
    }
    *(_DWORD *)(a1 + 56) = 0;
  }
}

void sub_10002C9E4(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  switch(*(_WORD *)(a2 + 4))
  {
    case 1:
      if (*a1 == 1)
      {
        if (!(_BYTE)acscp_gotoptions)
        {
          if ((_BYTE)acscp_hisoptions)
          {
LABEL_5:
            *((_DWORD *)a1 + 1) = 2;
            a1[12] = 0;
            *((_DWORD *)a1 + 5) = 0;
            sub_10002CF4C(a1, a2, a3);
            ++a1[12];
            int v12 = 4;
            goto LABEL_15;
          }
          goto LABEL_42;
        }
      }
      else if (!BYTE8(acscp_gotoptions))
      {
        if (byte_10004A188) {
          goto LABEL_5;
        }
LABEL_42:
        *((_DWORD *)a1 + 1) = 0;
        a1[12] = 0;
        *((_DWORD *)a1 + 5) = 0;
        return;
      }
      a1[12] = 0;
      *((_DWORD *)a1 + 5) = 0;
      *(void *)(a1 + 4) = 0x200000001;
      return;
    case 2:
      int v13 = *((_DWORD *)a1 + 2);
      if (v13 == 5) {
        goto LABEL_9;
      }
      if (v13 == 4)
      {
        *(_WORD *)(a3 + 2) = 5;
LABEL_9:
        if (*((_DWORD *)a1 + 14))
        {
          *((_DWORD *)a1 + 14) = 0;
          if (*a1 == 1)
          {
            sub_10002D1FC(*((uint64_t **)a1 + 6));
            *((_DWORD *)a1 + 14) = 0;
          }
        }
      }
      if (*((_DWORD *)a1 + 1) == 1) {
        sub_10002CEF8((uint64_t)a1);
      }
      int v12 = 1;
LABEL_15:
      *((_DWORD *)a1 + 2) = v12;
      return;
    case 3:
      uint64_t v14 = *(void *)(a2 + 8);
      int v15 = *((_DWORD *)a1 + 2);
      if (v15 == 4)
      {
        if ((ntohs() & 4) == 0) {
          return;
        }
        if (*((void *)a1 + 3))
        {
          sub_10002CF4C(a1, a2, a3);
          ++a1[12];
          return;
        }
LABEL_38:
        *((_DWORD *)a1 + 2) = 5;
        uint64_t v18 = (uint64_t **)acspdhcpready_notifier;
        notify(v18, 0);
      }
      else
      {
        if (v15 != 3)
        {
          if (v15 != 2) {
            return;
          }
          if ((ntohs() & 2) == 0)
          {
            uint64_t v16 = "ACSP plugin: received first packet with no start flag\n";
            goto LABEL_31;
          }
          *((_DWORD *)a1 + 2) = 3;
        }
        if (*(unsigned __int8 *)(v14 + 1) != a1[12]) {
          goto LABEL_67;
        }
        unsigned int v19 = *(unsigned __int16 *)(a2 + 6);
        int v20 = *a1;
        if (v20 != 2)
        {
          if (v20 != 1) {
            return;
          }
          if ((v19 & 3) != 0)
          {
            uint64_t v16 = "ACSP plugin: received packet with invalid len\n";
            goto LABEL_31;
          }
          if (v19 >= 0xD)
          {
            int v36 = (_DWORD *)(v14 + 8);
            int v37 = v19 + 4;
            while (1)
            {
              uint64_t v38 = malloc_type_malloc(0x20uLL, 0x1020040983EA955uLL);
              if (!v38) {
                break;
              }
              uint64_t v39 = v38;
              *(_OWORD *)uint64_t v38 = 0u;
              *((_OWORD *)v38 + 1) = 0u;
              int v40 = v36[1];
              *((_DWORD *)v38 + 2) = v40 & *v36;
              *((_DWORD *)v38 + 3) = v40;
              *((_WORD *)v38 + 10) = ntohs();
              *uint64_t v39 = *((void *)a1 + 6);
              *((void *)a1 + 6) = v39;
              v37 -= 12;
              v36 += 3;
              if (v37 <= 16) {
                goto LABEL_59;
              }
            }
LABEL_62:
            uint64_t v16 = "ACSP plugin: no memory\n";
            goto LABEL_31;
          }
          goto LABEL_59;
        }
        if (v19 < 0xB)
        {
LABEL_59:
          ++a1[12];
          if (ntohs())
          {
            *((_DWORD *)a1 + 2) = 5;
            if (*((_DWORD *)a1 + 4)) {
              sub_10002D134(a1);
            }
            else {
              notify((uint64_t **)acspdhcpready_notifier, 0);
            }
          }
LABEL_67:
          if ((ntohs() & 8) != 0)
          {
            sub_10002D198((uint64_t)a1, a2, a3);
          }
          return;
        }
        int v21 = v19 - 8;
        int v22 = (int *)(v14 + 8);
        while (1)
        {
          int v23 = *v22;
          uint64_t v24 = malloc_type_malloc(0x18uLL, 0x1030040A9CFD972uLL);
          if (!v24) {
            goto LABEL_62;
          }
          int v25 = v24;
          unsigned int v26 = ntohs();
          unsigned int v27 = malloc_type_malloc(v26 + 1, 0x1D618CF4uLL);
          v25[2] = v27;
          if (!v27) {
            break;
          }
          *((_DWORD *)v25 + 2) = v23;
          memcpy(v27, (char *)v22 + 6, v26);
          *(unsigned char *)(v25[2] + v26) = 0;
          *int v25 = *((void *)a1 + 6);
          *((void *)a1 + 6) = v25;
          uint64_t v35 = v26 + 6;
          v21 -= v35;
          int v22 = (int *)((char *)v22 + v35);
          if (v21 <= 2) {
            goto LABEL_59;
          }
        }
        error((uint64_t)"ACSP plugin: no memory\n", v28, v29, v30, v31, v32, v33, v34, v41);
        free(v25);
      }
      return;
    case 4:
      if (*((_DWORD *)a1 + 2) != 4)
      {
        uint64_t v16 = "ACSP plugin: received unexpected timeout\n";
LABEL_31:
        error((uint64_t)v16, a2, a3, a4, a5, a6, a7, a8, a9);
        return;
      }
      int v17 = *((_DWORD *)a1 + 5);
      *((_DWORD *)a1 + 5) = v17 + 1;
      if (v17 <= 9)
      {
        *(void *)(a3 + 8) = *((void *)a1 + 4);
        *(_WORD *)(a3 + 4) = *((_WORD *)a1 + 21) + 4;
        *(_WORD *)(a3 + 2) = 3;
        return;
      }
      error((uint64_t)"ACSP plugin: no acknowlegement from peer\n", a2, a3, a4, a5, a6, a7, a8, v41);
      goto LABEL_38;
    case 5:
      uint64_t v16 = "ACSP plugin: unexpected notification received\n";
      goto LABEL_31;
    case 6:
      error((uint64_t)"ACSP plugin: error notificationr received\n", a2, a3, a4, a5, a6, a7, a8, v41);
      if (*((_DWORD *)a1 + 2) == 4) {
        *(_WORD *)(a3 + 2) = 5;
      }
      goto LABEL_38;
    default:
      return;
  }
}

void sub_10002CEF8(uint64_t a1)
{
  for (uint64_t i = *(void ***)(a1 + 48); i; uint64_t i = *(void ***)(a1 + 48))
  {
    if (*(unsigned char *)a1 != 1) {
      free(i[2]);
    }
    *(void *)(a1 + 48) = *i;
    free(i);
  }
}

uint64_t sub_10002CF4C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *((void *)a1 + 4);
  if (*((unsigned __int16 *)a1 + 20) >= *(unsigned __int16 *)(a2 + 2)) {
    __int16 v6 = *(_WORD *)(a2 + 2);
  }
  else {
    __int16 v6 = *((_WORD *)a1 + 20);
  }
  if (*((_DWORD *)a1 + 2) == 1)
  {
    __int16 v7 = htons();
    *((void *)a1 + 3) = *((void *)a1 + 6);
  }
  else
  {
    __int16 v7 = 0;
  }
  unsigned __int16 v8 = v6 - 4;
  *(_WORD *)(v5 + 8) = v7;
  int v9 = *a1;
  *(unsigned char *)(v5 + 4) = v9;
  *(unsigned char *)(v5 + 5) = a1[12];
  ntohs();
  *(_WORD *)(v5 + 8) = htons();
  *(_WORD *)(v5 + 10) = 0;
  if (v9 == 1)
  {
    uint64_t v18 = (void *)*((void *)a1 + 3);
    unsigned __int16 v12 = 8;
    if (v18 && v8 >= 0x14u)
    {
      uint64_t v19 = v5 + 12;
      LOWORD(v20) = 20;
      do
      {
        unsigned __int16 v12 = v20;
        *(void *)uint64_t v19 = v18[1];
        *(_WORD *)(v19 + 8) = htons();
        *(_WORD *)(v19 + 10) = htons();
        uint64_t v18 = (void *)*v18;
        *((void *)a1 + 3) = v18;
        unint64_t v20 = v12 + 12;
        v19 += 12;
        if (v18) {
          BOOL v21 = v20 > v8;
        }
        else {
          BOOL v21 = 1;
        }
      }
      while (!v21);
    }
LABEL_24:
    if (v18) {
      goto LABEL_28;
    }
LABEL_27:
    ntohs();
    *(_WORD *)(v5 + 8) = htons();
    goto LABEL_28;
  }
  if (v9 != 2)
  {
    uint64_t v18 = (void *)*((void *)a1 + 3);
    unsigned __int16 v12 = 8;
    goto LABEL_24;
  }
  uint64_t v10 = *((void *)a1 + 3);
  if (!v10)
  {
    unsigned __int16 v12 = 8;
    goto LABEL_27;
  }
  uint64_t v11 = v5 + 12;
  unsigned __int16 v12 = 8;
  while (1)
  {
    int v13 = strlen(*(const char **)(v10 + 16));
    int v14 = v13 + 6;
    if (v13 + 6 + v12 > v8) {
      break;
    }
    int v15 = *(_DWORD *)(v10 + 8);
    __int16 v16 = htons();
    *(_DWORD *)uint64_t v11 = v15;
    *(_WORD *)(v11 + 4) = v16;
    memcpy((void *)(v11 + 6), *(const void **)(*((void *)a1 + 3) + 16), v13);
    v12 += v14;
    int v17 = (uint64_t *)*((void *)a1 + 3);
    uint64_t v10 = *v17;
    *((void *)a1 + 3) = *v17;
    v11 += v14;
    if (!v10) {
      goto LABEL_27;
    }
  }
LABEL_28:
  *(_WORD *)(a3 + 2) = 3;
  *((_WORD *)a1 + 21) = v12;
  uint64_t result = htons();
  *(_WORD *)(v5 + 6) = result;
  *(_WORD *)(a3 + 4) = v12 + 4;
  *(void *)(a3 + 8) = *((void *)a1 + 4);
  return result;
}

uint64_t **sub_10002D134(unsigned __int8 *a1)
{
  int v2 = *a1;
  uint64_t v3 = (uint64_t *)*((void *)a1 + 6);
  if (v2 == 1) {
    sub_10002D3B0(v3);
  }
  else {
    sub_10002D588((uint64_t **)v3);
  }
  *((_DWORD *)a1 + 14) = 1;
  uint64_t v4 = (uint64_t **)acspdhcpready_notifier;

  return notify(v4, 0);
}

uint64_t sub_10002D198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 32);
  *(unsigned char *)(v5 + 4) = *(unsigned char *)a1;
  *(unsigned char *)(v5 + 5) = *(unsigned char *)(v4 + 1);
  *(_WORD *)(v5 + 8) = htons();
  uint64_t result = htons();
  *(_WORD *)(v5 + 6) = result;
  *(_WORD *)(v5 + 10) = 0;
  *(_DWORD *)(a3 + 2) = 786433;
  *(void *)(a3 + 8) = v5;
  return result;
}

void sub_10002D1FC(uint64_t *a1)
{
  if (a1)
  {
    int v1 = a1;
    do
    {
      if (*((_DWORD *)v1 + 6))
      {
        *((_DWORD *)v1 + 6) = 0;
        __int16 v2 = *((_WORD *)v1 + 10);
        if ((v2 & 1) == 0)
        {
          if ((v2 & 2) == 0) {
            goto LABEL_14;
          }
          int v3 = *((_DWORD *)v1 + 2);
          if (!v3 || route_gateway(2, v3, *((_DWORD *)v1 + 3), dword_10004BF68, 0)) {
            goto LABEL_14;
          }
          int v4 = addr2ascii(2, v1 + 1, 4, v23);
          addr2ascii(2, (char *)v1 + 12, 4, v22);
          addr2ascii(2, &dword_10004BF68, 4, v21);
          error((uint64_t)"ACSP plugin: error removing public net route. (%s/%s -> %s).", v5, v6, v7, v8, v9, v10, v11, v4);
          goto LABEL_12;
        }
        int v12 = *((_DWORD *)v1 + 2);
        if (!v12)
        {
          cifdefaultroute();
          goto LABEL_14;
        }
        if (!route_interface(2, v12, *((_DWORD *)v1 + 3), 23, &ifname, 0))
        {
          int v13 = addr2ascii(2, v1 + 1, 4, v23);
          addr2ascii(2, (char *)v1 + 12, 4, v22);
          error((uint64_t)"ACSP plugin: error removing private net route. (%s/%s).", v14, v15, v16, v17, v18, v19, v20, v13);
LABEL_12:
          *((_DWORD *)v1 + 6) = 1;
        }
      }
LABEL_14:
      int v1 = (uint64_t *)*v1;
    }
    while (v1);
  }
}

void sub_10002D3B0(uint64_t *a1)
{
  if (a1)
  {
    int v1 = a1;
    sleep(1u);
    cifdefaultroute();
    cifroute();
    do
    {
      *((_DWORD *)v1 + 6) = 1;
      __int16 v2 = *((_WORD *)v1 + 10);
      if (v2)
      {
        int v12 = *((_DWORD *)v1 + 2);
        if (!v12)
        {
          sifdefaultroute();
          goto LABEL_14;
        }
        if (!route_interface(1, v12, *((_DWORD *)v1 + 3), 23, &ifname, 0))
        {
          int v13 = addr2ascii(2, v1 + 1, 4, v23);
          addr2ascii(2, (char *)v1 + 12, 4, v22);
          error((uint64_t)"ACSP plugin: error installing private net route. (%s/%s).", v14, v15, v16, v17, v18, v19, v20, v13);
          goto LABEL_11;
        }
      }
      else if ((v2 & 2) != 0)
      {
        int v3 = *((_DWORD *)v1 + 2);
        if (!v3)
        {
          cifdefaultroute();
          goto LABEL_14;
        }
        if (!route_gateway(1, v3, *((_DWORD *)v1 + 3), dword_10004BF68, 1))
        {
          int v4 = addr2ascii(2, v1 + 1, 4, v23);
          addr2ascii(2, (char *)v1 + 12, 4, v22);
          addr2ascii(2, &dword_10004BF68, 4, v21);
          error((uint64_t)"ACSP plugin: error installing public net route. (%s/%s -> %s).", v5, v6, v7, v8, v9, v10, v11, v4);
LABEL_11:
          *((_DWORD *)v1 + 6) = 0;
        }
      }
LABEL_14:
      int v1 = (uint64_t *)*v1;
    }
    while (v1);
  }
}

void sub_10002D588(uint64_t **a1)
{
  uint64_t valuePtr = 100000;
  CFNumberRef v2 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  if (v2)
  {
    CFNumberRef v10 = v2;
    if (a1)
    {
      int v11 = 1;
      while (1)
      {
        CFStringRef v12 = CFStringCreateWithCString(0, (const char *)a1[2], 0x8000100u);
        if (!v12)
        {
          BOOL v21 = "ACSP plugin: error adding domain name - could not create CFString\n";
          goto LABEL_11;
        }
        CFStringRef v20 = v12;
        if (!publish_dns_wins_entry(kSCEntNetDNS, kSCPropNetDNSSearchDomains, v20, 0, kSCPropNetDNSSupplementalMatchDomains, v20, kSCPropNetDNSSupplementalMatchOrders, v10, @"ConfirmedServiceID", (void *)serviceidRef, v11))break; {
        publish_dns_wins_entry(kSCEntNetProxies, kSCPropNetDNSSupplementalMatchDomains, v20, 0, kSCPropNetDNSSupplementalMatchOrders, v10, 0, 0, 0, 0, v11);
        }
        CFRelease(v20);
        int v11 = 0;
        a1 = (uint64_t **)*a1;
        if (!a1) {
          goto LABEL_12;
        }
      }
      CFRelease(v20);
      BOOL v21 = "ACSP plugin: error adding domain name\n";
LABEL_11:
      error((uint64_t)v21, v13, v14, v15, v16, v17, v18, v19, key);
    }
LABEL_12:
    CFRelease(v10);
  }
  else
  {
    error((uint64_t)"ACSP plugin: error adding domain name - could not create CFNumber\n", v3, v4, v5, v6, v7, v8, v9, key);
  }
}

void sub_10002D714(unsigned int a1, uint64_t a2, unsigned int a3, unsigned __int8 a4, unsigned int a5, char a6, uint64_t a7, uint64_t a8, int a9)
{
  char v9 = a5;
  char v10 = a3;
  unsigned int v24 = HIBYTE(a3);
  byte_100048128 = HIBYTE(a3);
  unsigned int v12 = HIWORD(a3);
  byte_100048129 = BYTE2(a3);
  unsigned int v13 = a3 >> 8;
  LOBYTE(word_10004812A) = BYTE1(a3);
  HIBYTE(word_10004812A) = a3;
  unsigned int v14 = HIBYTE(a5);
  byte_10004812C = HIBYTE(a5);
  unsigned int v15 = HIWORD(a5);
  byte_10004812D = BYTE2(a5);
  unsigned int v16 = a5 >> 8;
  byte_10004812E = BYTE1(a5);
  byte_10004812F = a5;
  LOWORD(dword_100048130) = 4352;
  __int16 v17 = a2 - 4;
  BYTE2(dword_100048130) = (unsigned __int16)(a2 - 24) >> 8;
  BYTE5(qword_100048134) = a2 - 24;
  BYTE4(qword_100048134) = (unsigned __int16)(a2 - 24) >> 8;
  HIBYTE(dword_100048130) = a2 - 24;
  LOBYTE(qword_100048134) = 0;
  *(_WORD *)((char *)&qword_100048134 + 1) = a4;
  BYTE3(qword_100048134) = a6;
  HIWORD(qword_100048134) = 0;
  sub_10002D890((unsigned __int8 *)&byte_100048128, a2 - 12);
  word_100048120 = 69;
  LOBYTE(word_100048122) = HIBYTE(v17);
  HIBYTE(word_100048122) = v17;
  char v18 = word_100046FD0;
  byte_100048124 = HIBYTE(word_100046FD0);
  word_100046FD0 += 2;
  byte_100048125[0] = v18 + 1;
  *(_DWORD *)algn_100048126 = 289406976;
  word_10004812A = 0;
  byte_10004812C = v24;
  byte_10004812D = v12;
  byte_10004812E = v13;
  byte_10004812F = v10;
  LOBYTE(dword_100048130) = v14;
  BYTE1(dword_100048130) = v15;
  BYTE2(dword_100048130) = v16;
  HIBYTE(dword_100048130) = v9;
  sub_10002D890((unsigned __int8 *)&word_100048120, 20);
  word_10004812A = __rev16(ntohs());

  output(a1, (uint64_t)&outpacket_buf, a2, v19, v20, v21, v22, v23, a9);
}

uint64_t sub_10002D890(unsigned __int8 *a1, int a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = 0;
    if (a2) {
LABEL_7:
    }
      v2 += *a1;
  }
  else
  {
    uint64_t v2 = 0;
    unsigned int v3 = a2;
    do
    {
      unsigned int v4 = *(unsigned __int16 *)a1;
      a1 += 2;
      v2 += v4;
      if ((int)v2 < 0) {
        uint64_t v2 = (v2 >> 16) + (unsigned __int16)v2;
      }
      unsigned int v5 = v3 - 2;
      BOOL v6 = v3 > 3;
      v3 -= 2;
    }
    while (v6);
    if (v5) {
      goto LABEL_7;
    }
  }
  if ((unint64_t)v2 >= 0x10000)
  {
    do
      uint64_t v2 = (v2 >> 16) + (unsigned __int16)v2;
    while ((unint64_t)v2 >> 16);
  }
  return (unsigned __int16)~(_WORD)v2;
}

void sub_10002D904(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a1 == 4)
  {
    int v9 = a1[1];
    a1[1] = v9 + 1;
    if (v9 > 3)
    {
      dbglog((uint64_t)"No DHCP server replied\n", a2, a3, a4, a5, a6, a7, a8, v11);
      *a1 = 5;
    }
    else
    {
      sub_10002D99C(a1[8]);
    }
    if (a1[1] == 2)
    {
      char v10 = (uint64_t **)acspdhcpready_notifier;
      notify(v10, 0);
    }
  }
}

void sub_10002D99C(unsigned int a1)
{
  bzero(&word_100048120, 0x5DCuLL);
  outpacket_buf = 553649151;
  word_10004813C = 2049;
  byte_10004813E = 6;
  char v2 = word_100046FD2;
  word_100048140 = 0;
  LOBYTE(word_100048142) = (unsigned __int16)(word_100046FD2 + 2) >> 8;
  word_100046FD2 += 4;
  HIBYTE(word_100048142) = v2 + 3;
  unsigned int v3 = ntohl();
  dword_100048144 = 0;
  byte_100048148 = HIBYTE(v3);
  byte_100048149 = BYTE2(v3);
  byte_10004814A = BYTE1(v3);
  byte_10004814B = v3;
  qword_10004814C = 0;
  *(uint64_t *)((char *)&qword_10004814C + 7) = 0;
  byte_10004815B = 1;
  qword_10004815C = 0;
  *(_DWORD *)((char *)&qword_10004815C + 7) = 0;
  byte_100048167 = 1;
  qword_100048228 = 0x3D08013563538263;
  word_100048230 = 2055;
  byte_100048233 = 0;
  LOBYTE(word_100048235) = 1;
  qword_100048237 = 0xF9012B2C06063700;
  word_10004823F = -241;
  sub_10002D714(a1, 294, v3, 0x44u, 0xFFFFFFFF, 67, v4, v5, v6);
  *(_DWORD *)qword_10004BF70 = 4;

  timeout((int)sub_10002D904);
}

uint64_t chap_register_digest(uint64_t result)
{
  *(void *)(result + 64) = qword_10004BF78;
  qword_10004BF78 = result;
  return result;
}

void chap_auth_peer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if ((dword_10004BF80 & 2) != 0)
  {
    error((uint64_t)"CHAP: peer authentication already started!", a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    uint64_t v9 = qword_10004BF78;
    if (!qword_10004BF78) {
LABEL_5:
    }
      fatal();
    while (*(_DWORD *)v9 != a3)
    {
      uint64_t v9 = *(void *)(v9 + 64);
      if (!v9) {
        goto LABEL_5;
      }
    }
    qword_10004BF88 = a2;
    qword_10004BF90 = v9;
    double v17 = drand48();
    char v18 = dword_10004BF80;
    dword_10004BF80 |= 2u;
    *(_DWORD *)algn_10004BF84 = vcvtd_n_s64_f64(v17, 8uLL);
    if (v18)
    {
      sub_10002DBDC(&dword_10004BF80, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void sub_10002DBDC(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *a1;
  *a1 &= ~0x10u;
  if ((v9 & 0x20) == 0)
  {
    a1[6] = 0;
    a1[8] = 599917567;
    uint64_t v10 = a1 + 8;
    (*(void (**)(int *))(*((void *)a1 + 2) + 8))(a1 + 10);
    uint64_t v11 = *((unsigned __int8 *)a1 + 40);
    int v12 = strlen(*((const char **)a1 + 1));
    memcpy((char *)v10 + v11 + 9, *((const void **)a1 + 1), v12);
    __int16 v13 = v11 + v12 + 5;
    uint64_t v14 = (v11 + v12 + 9);
    a1[7] = v14;
    *((unsigned char *)a1 + 36) = 1;
    *((unsigned char *)a1 + 38) = HIBYTE(v13);
    *((unsigned char *)a1 + 39) = v13;
    int v15 = *a1;
    int v16 = a1[1] + 1;
    *((unsigned char *)a1 + 37) = *((unsigned char *)a1 + 4) + 1;
    *a1 = v15 | 0x20;
    a1[1] = v16;
LABEL_5:
    output(0, (uint64_t)(a1 + 8), v14, a4, a5, a6, a7, a8, v17);
    ++a1[6];
    *a1 |= 0x10u;
    timeout((int)sub_10002DBDC);
    return;
  }
  if (a1[6] < chap_max_transmits)
  {
    uint64_t v14 = a1[7];
    goto LABEL_5;
  }
  *a1 = v9 & 0xFFFFFFC3 | 0xC;

  auth_peer_fail(0, 49699, a3, a4, a5, a6, a7, a8);
}

void chap_auth_with_peer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if ((xmmword_10004C1F0 & 2) != 0)
  {
    error((uint64_t)"CHAP: authentication with peer already started!", a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    uint64_t v9 = qword_10004BF78;
    if (!qword_10004BF78) {
LABEL_5:
    }
      fatal();
    while (*(_DWORD *)v9 != a3)
    {
      uint64_t v9 = *(void *)(v9 + 64);
      if (!v9) {
        goto LABEL_5;
      }
    }
    *((void *)&xmmword_10004C1F0 + 1) = a2;
    *(void *)&xmmword_10004C200 = v9;
    LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 | 2;
  }
}

void *sub_10002DDDC()
{
  xmmword_10004C380 = 0u;
  unk_10004C390 = 0u;
  xmmword_10004C360 = 0u;
  unk_10004C370 = 0u;
  xmmword_10004C340 = 0u;
  unk_10004C350 = 0u;
  xmmword_10004C320 = 0u;
  unk_10004C330 = 0u;
  xmmword_10004C300 = 0u;
  unk_10004C310 = 0u;
  xmmword_10004C2E0 = 0u;
  unk_10004C2F0 = 0u;
  xmmword_10004C2C0 = 0u;
  unk_10004C2D0 = 0u;
  xmmword_10004C2A0 = 0u;
  unk_10004C2B0 = 0u;
  xmmword_10004C280 = 0u;
  unk_10004C290 = 0u;
  xmmword_10004C260 = 0u;
  unk_10004C270 = 0u;
  xmmword_10004C240 = 0u;
  unk_10004C250 = 0u;
  xmmword_10004C220 = 0u;
  unk_10004C230 = 0u;
  xmmword_10004C200 = 0u;
  unk_10004C210 = 0u;
  xmmword_10004C1F0 = 0u;
  bzero(&dword_10004BF80, 0x270uLL);
  chap_md5_init();

  return chapms_init();
}

void sub_10002DE58(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((int)a3 < 4) {
    return;
  }
  unsigned int v9 = __rev16(*((unsigned __int16 *)a2 + 1));
  uint64_t v10 = v9 - 4;
  if (v9 < 4 || v9 > a3) {
    return;
  }
  uint64_t v12 = a2[1];
  __int16 v13 = a2 + 4;
  uint64_t v14 = *a2;
  if ((v14 - 3) < 2)
  {
    int v34 = xmmword_10004C1F0;
    if ((xmmword_10004C1F0 & 7) != 3) {
      return;
    }
    int v35 = xmmword_10004C1F0 | 4;
    LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 | 4;
    if ((v34 & 0x10) != 0)
    {
      LODWORD(xmmword_10004C1F0) = v35 & 0xFFFFFFEF;
      untimeout((uint64_t)sub_10002EBA8, (uint64_t)&xmmword_10004C1F0);
    }
    if (v14 == 3)
    {
      int v36 = *(unsigned int (**)(unsigned __int8 *, uint64_t, char *))(xmmword_10004C200 + 32);
      if (v36)
      {
        if (!v36(v13, v10, (char *)&xmmword_10004C200 + 8)) {
          goto LABEL_75;
        }
LABEL_61:
        int v50 = *(_DWORD *)xmmword_10004C200;
        auth_withpeer_success(0, 49699, v50);
        return;
      }
      CFArrayRef v49 = "CHAP authentication succeeded";
LABEL_57:
      if (v10) {
        info((uint64_t)"%s: %.*v", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (int)v49);
      }
      else {
        info((uint64_t)"%s", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (int)v49);
      }
      if (v14 != 3) {
        goto LABEL_75;
      }
      goto LABEL_61;
    }
    int v44 = *(uint64_t (**)(unsigned __int8 *, uint64_t))(xmmword_10004C200 + 40);
    if (!v44)
    {
      CFArrayRef v49 = "CHAP authentication failed";
      goto LABEL_57;
    }
    byte_10004C4A2 = 0;
    int v45 = v44(v13, v10);
    if (v45 == 2)
    {
      if (byte_10004C3A0 != 1 || (byte_10004C3A0 = 0, byte_10004C5A2 != v12))
      {
        LODWORD(xmmword_10004C1F0) = v34;
        uint64_t v46 = (uint64_t)v13;
        int v47 = v10;
        int v48 = 0;
        goto LABEL_73;
      }
    }
    else
    {
      if (v45 != 1)
      {
LABEL_75:
        LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 | 8;
        auth_withpeer_fail(0, 49699);
        return;
      }
      if (byte_10004C3A0 != 1 || (byte_10004C3A0 = 0, byte_10004C5A2 != v12))
      {
        LODWORD(xmmword_10004C1F0) = v34;
        uint64_t v46 = (uint64_t)v13;
        int v47 = v10;
        int v48 = 1;
LABEL_73:
        if (!sub_10002ED70(v46, v47, v48)) {
          return;
        }
        LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 | 4;
        goto LABEL_75;
      }
    }
    LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 & 0xFFFFFFFB;
    return;
  }
  if (v14 == 2)
  {
    unsigned int v37 = dword_10004BF80;
    if ((dword_10004BF80 & 1) != 0 && v10 >= 2 && byte_10004BFA5 == v12)
    {
      if ((dword_10004BF80 & 0x20) != 0)
      {
        int v51 = v10 + ~a2[4];
        if (v51 < 0) {
          return;
        }
        if ((dword_10004BF80 & 0x10) != 0)
        {
          dword_10004BF80 &= ~0x10u;
          untimeout((uint64_t)sub_10002DBDC, (uint64_t)&dword_10004BF80);
        }
        if (explicit_remote)
        {
          int v40 = &remote_name;
        }
        else
        {
          LODWORD(v100) = v51;
          int v40 = (const char *)&v105;
          slprintf((int)&v105, 257, "%.*v");
        }
        uint64_t v75 = (uint64_t (*)(const char *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))chap_verify_hook;
        if (!chap_verify_hook) {
          uint64_t v75 = sub_10002EC88;
        }
        int v39 = v75(v40, (const char *)qword_10004BF88, v12, qword_10004BF90, (uint64_t)&unk_10004BFA8, (uint64_t)(a2 + 4), (uint64_t)&byte_10004C0EC, 256);
        if (v39 && auth_number())
        {
          unsigned int v37 = dword_10004BF80;
        }
        else
        {
          unsigned int v37 = dword_10004BF80 | 8;
          dword_10004BF80 |= 8u;
        }
      }
      else
      {
        if ((dword_10004BF80 & 4) == 0) {
          return;
        }
        int v39 = 0;
        int v40 = 0;
      }
      outpacket_buf = 599917567;
      int v76 = strlen(&byte_10004C0EC);
      int v82 = v76;
      int v83 = (v37 >> 3) & 1;
      if (v39 == -1) {
        int v83 = 1;
      }
      if (v83) {
        char v84 = 4;
      }
      else {
        char v84 = 3;
      }
      LOBYTE(word_100048120) = v84;
      HIBYTE(word_100048120) = v12;
      LOBYTE(word_100048122) = (unsigned __int16)(v76 + 4) >> 8;
      HIBYTE(word_100048122) = v76 + 4;
      if (v76 >= 1) {
        memcpy(&byte_100048124, &byte_10004C0EC, v76);
      }
      output(0, (uint64_t)&outpacket_buf, (v82 + 8), v77, v78, v79, v80, v81, (int)v100);
      byte_10004C3A1 = 0;
      char v92 = dword_10004BF80;
      if (v39 == -1)
      {
        dword_10004BF80 |= 0x20u;
        ++byte_10004BFA5;
        __strlcpy_chk();
      }
      else if ((dword_10004BF80 & 4) == 0)
      {
        dword_10004BF80 = dword_10004BF80 & 0xFFFFFFDB | 4;
        if ((v92 & 8) != 0)
        {
          notice((uint64_t)"CHAP peer authentication failed for %q", v85, v86, v87, v88, v89, v90, v91, (int)v40);
          auth_peer_fail(0, 49699, v94, v95, v96, v97, v98, v99);
        }
        else
        {
          notice((uint64_t)"CHAP peer authentication succeeded for %q", v85, v86, v87, v88, v89, v90, v91, (int)v40);
          size_t v93 = strlen(v40);
          auth_peer_success(0, 49699, *(_DWORD *)qword_10004BF90, (uint64_t)v40, v93);
          if (chap_rechallenge_time)
          {
            dword_10004BF80 |= 0x10u;
            uint64_t v33 = sub_10002DBDC;
LABEL_26:
            timeout((int)v33);
          }
        }
      }
    }
  }
  else if (v14 == 1)
  {
    if (v10 >= 2 && (xmmword_10004C1F0 & 3) == 3)
    {
      unsigned int v16 = *v13;
      if (v10 > v16)
      {
        if ((xmmword_10004C1F0 & 0x10) != 0)
        {
          LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 & 0xFFFFFFEF;
          untimeout((uint64_t)sub_10002EBA8, (uint64_t)&xmmword_10004C1F0);
          unsigned int v16 = *v13;
        }
        unsigned int v102 = 0;
        int v101 = v10 + ~v16;
        slprintf((int)v104, 257, "%.*v");
        if (explicit_remote || remote_name && !v104[0]) {
          __strlcpy_chk();
        }
        if (!get_secret(0, *((const char **)&xmmword_10004C1F0 + 1), v104, v103, (int *)&v102, 0))
        {
          unsigned int v102 = 0;
          warning((uint64_t)"No CHAP secret found for authenticating us to %q", v17, v18, v19, v20, v21, v22, v23, (int)v104);
        }
        byte_10004C3A0 = 0;
        int v105 = 599917567;
        (*(void (**)(unsigned char *, uint64_t, void, unsigned __int8 *, unsigned char *, void, char *))(xmmword_10004C200 + 24))(v110, v12, *((void *)&xmmword_10004C1F0 + 1), a2 + 4, v103, v102, (char *)&xmmword_10004C200 + 8);
        __memset_chk();
        uint64_t v24 = v110[0];
        int v25 = strlen(*((const char **)&xmmword_10004C1F0 + 1));
        memcpy(&v110[v110[0] + 1], *((const void **)&xmmword_10004C1F0 + 1), v25);
        uint64_t v26 = v24 + v25;
        char v106 = 2;
        char v107 = v12;
        char v108 = (unsigned __int16)(v26 + 5) >> 8;
        char v109 = v26 + 5;
        int v27 = v26 + 9;
        output(0, (uint64_t)&v105, v26 + 9, v28, v29, v30, v31, v32, v101);
        HIDWORD(xmmword_10004C240) = v27;
        __memcpy_chk();
        LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 & 0xFFFFFFEB | 0x10;
        uint64_t v33 = sub_10002EBA8;
        goto LABEL_26;
      }
    }
  }
  else if (chap_unknown_hook)
  {
    char v41 = dword_10004BF80;
    if (dword_10004BF80)
    {
      BOOL v42 = 0;
      byte_10004C0EC = 0;
      if ((dword_10004BF80 & 4) == 0)
      {
        unsigned int v100 = &byte_10004C0EC;
        int v43 = chap_unknown_hook(&byte_10004C3A1, qword_10004BF88, v14, v12, qword_10004BF90, &unk_10004BFA8, v13, v10);
        if (v43 == -2) {
          return;
        }
        if (v43)
        {
          char v41 = dword_10004BF80;
          BOOL v42 = v43 == -1;
        }
        else
        {
          BOOL v42 = 0;
          char v41 = dword_10004BF80 | 8;
          dword_10004BF80 |= 8u;
        }
      }
      outpacket_buf = 599917567;
      int v52 = strlen(&byte_10004C0EC);
      int v58 = v52;
      if (v42 | ((v41 & 8) >> 3)) {
        char v59 = 4;
      }
      else {
        char v59 = 3;
      }
      LOBYTE(word_100048120) = v59;
      HIBYTE(word_100048120) = v12;
      LOBYTE(word_100048122) = (unsigned __int16)(v52 + 4) >> 8;
      HIBYTE(word_100048122) = v52 + 4;
      if (v52 >= 1) {
        memcpy(&byte_100048124, &byte_10004C0EC, v52);
      }
      output(0, (uint64_t)&outpacket_buf, (v58 + 8), v53, v54, v55, v56, v57, (int)v100);
      if (!v42)
      {
        char v67 = dword_10004BF80;
        if ((dword_10004BF80 & 4) == 0)
        {
          dword_10004BF80 |= 4u;
          if ((v67 & 8) != 0)
          {
            notice((uint64_t)"CHAP peer authentication failed for %q", v60, v61, v62, v63, v64, v65, v66, (int)&byte_10004C3A1);
            auth_peer_fail(0, 49699, v69, v70, v71, v72, v73, v74);
          }
          else
          {
            notice((uint64_t)"CHAP peer authentication succeeded for %q", v60, v61, v62, v63, v64, v65, v66, (int)&byte_10004C3A1);
            size_t v68 = strlen(&byte_10004C3A1);
            auth_peer_success(0, 49699, *(_DWORD *)qword_10004BF90, (uint64_t)&byte_10004C3A1, v68);
            if (chap_rechallenge_time)
            {
              dword_10004BF80 |= 0x10u;
              timeout((int)sub_10002DBDC);
            }
          }
        }
      }
    }
  }
}

void sub_10002E800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = dword_10004BF80;
  if ((dword_10004BF80 & 0x10) != 0)
  {
    dword_10004BF80 &= ~0x10u;
    untimeout((uint64_t)sub_10002DBDC, (uint64_t)&dword_10004BF80);
    char v8 = dword_10004BF80;
  }
  if ((v8 & 2) != 0)
  {
    dword_10004BF80 = 0;
    auth_peer_fail(0, 49699, a3, a4, a5, a6, a7, a8);
  }
  int v9 = xmmword_10004C1F0;
  if ((xmmword_10004C1F0 & 0x10) != 0)
  {
    LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 & 0xFFFFFFEF;
    untimeout((uint64_t)sub_10002EBA8, (uint64_t)&xmmword_10004C1F0);
    int v9 = xmmword_10004C1F0;
  }
  if ((v9 & 6) == 2)
  {
    LODWORD(xmmword_10004C1F0) = v9 & 0xFFFFFFFD;
    auth_withpeer_fail(0, 49699);
  }
}

void sub_10002E8D8()
{
  chapms_reinit();
  LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 | 1;
  char v7 = dword_10004BF80;
  dword_10004BF80 |= 1u;
  if ((v7 & 2) != 0)
  {
    sub_10002DBDC(&dword_10004BF80, v0, v1, v2, v3, v4, v5, v6);
  }
}

void sub_10002E934()
{
  if ((xmmword_10004C1F0 & 0x10) != 0) {
    untimeout((uint64_t)sub_10002EBA8, (uint64_t)&xmmword_10004C1F0);
  }
  LODWORD(xmmword_10004C1F0) = 0;
  if ((dword_10004BF80 & 0x10) != 0) {
    untimeout((uint64_t)sub_10002DBDC, (uint64_t)&dword_10004BF80);
  }
  dword_10004BF80 = 0;
  if (byte_10004C5A4 == 1)
  {
    pthread_cancel((pthread_t)qword_10004C5C0);
    byte_10004C5A4 = 0;
  }
}

uint64_t sub_10002E9C8(unsigned __int8 *a1, int a2, void (*a3)(uint64_t, const char *), uint64_t a4)
{
  if (a2 < 4) {
    return 0;
  }
  int v5 = a1[2];
  int v6 = a1[3];
  uint64_t v7 = v6 | (v5 << 8);
  if (v7 < 4 || v7 > a2) {
    return 0;
  }
  int v12 = *a1;
  int v13 = a1[1];
  unsigned int v25 = v7 - 4;
  if ((v12 - 1) > 3) {
    uint64_t v14 = " code=0x%x";
  }
  else {
    uint64_t v14 = " %s";
  }
  a3(a4, v14);
  int v15 = a1 + 4;
  ((void (*)(uint64_t, const char *, ...))a3)(a4, " id=0x%x", v13);
  if ((v12 - 1) < 2)
  {
    if (v7 >= 5)
    {
      unsigned int v18 = *v15;
      if (v25 <= v18) {
        return v7;
      }
      uint64_t v19 = (char *)(a1 + 5);
      int v20 = v25 + ~v18;
      a3(a4, " <");
      if (v18)
      {
        unsigned int v21 = v18 + 1;
        do
        {
          int v22 = *v19++;
          ((void (*)(uint64_t, const char *, ...))a3)(a4, "%.2x", v22);
          --v21;
        }
        while (v21 > 1);
      }
      a3(a4, ">, name = ");
      unsigned int v16 = v19;
      int v17 = v20;
      goto LABEL_15;
    }
    return 4;
  }
  if ((v12 - 3) < 2)
  {
    a3(a4, " ");
    unsigned int v16 = (char *)(a1 + 4);
    int v17 = v7 - 4;
LABEL_15:
    print_string(v16, v17, a3, a4);
    return v7;
  }
  if (v7 < 5) {
    return 4;
  }
  unsigned int v23 = (v5 << 8) + v6 - 3;
  do
  {
    int v24 = *v15++;
    ((void (*)(uint64_t, const char *, ...))a3)(a4, " %.2x", v24);
    --v23;
  }
  while (v23 > 1);
  return v7;
}

void sub_10002EBA8(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9 = *a1;
  unsigned int v10 = *a1 & 0xFFFFFFEF;
  *a1 = v10;
  if ((v9 & 0x40) == 0)
  {
    a1[22] = 0;
    *a1 = v10 | 0x40;
LABEL_4:
    output(0, (uint64_t)(a1 + 24), a1[23], a4, a5, a6, a7, a8, v11);
    ++a1[22];
    *a1 |= 0x10u;
    timeout((int)sub_10002EBA8);
    return;
  }
  if ((int)a1[22] < chap_max_transmits) {
    goto LABEL_4;
  }
  *a1 = v9 & 0xFFFFFFA3 | 0xC;

  auth_peer_fail(0, 49699, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_10002EC88(const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v23 = 0;
  if (get_secret(0, a1, a2, v24, (int *)&v23, 1)) {
    return (*(uint64_t (**)(uint64_t, const char *, unsigned char *, void, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 16))(a3, a1, v24, v23, a5, a6, a7, a8);
  }
  error((uint64_t)"No CHAP secret found for authenticating %q", v15, v16, v17, v18, v19, v20, v21, (int)a1);
  return 0;
}

uint64_t sub_10002ED70(uint64_t a1, int a2, int a3)
{
  if (byte_10004C5A4) {
    return 0;
  }
  if (qword_10004C5A8) {
    free((void *)qword_10004C5A8);
  }
  size_t v7 = (a2 + 4);
  char v8 = malloc_type_malloc(v7, 0x4BEE6F19uLL);
  qword_10004C5A8 = (uint64_t)v8;
  if (!v8)
  {
    error((uint64_t)"CHAP: cannot allocate memory to save packet", v9, v10, v11, v12, v13, v14, v15, v30);
    return 0xFFFFFFFFLL;
  }
  memcpy(v8, (const void *)(a1 - 4), v7);
  dword_10004C5B0 = a3;
  if (pipe((int *)&qword_10004C5B8) < 0)
  {
    error((uint64_t)"chap failed to create pipe for User Interface...\n", v16, v17, v18, v19, v20, v21, v22, v30);
    goto LABEL_11;
  }
  if (pthread_create((pthread_t *)&qword_10004C5C0, 0, (void *(__cdecl *)(void *))sub_10002EEB8, 0))
  {
    error((uint64_t)"chap failed to create thread for client User Interface...\n", v23, v24, v25, v26, v27, v28, v29, v30);
    close(qword_10004C5B8);
    close(SHIDWORD(qword_10004C5B8));
LABEL_11:
    free((void *)qword_10004C5A8);
    qword_10004C5A8 = 0;
    return 0xFFFFFFFFLL;
  }
  wait_input_hook = (uint64_t (*)(double))sub_10002EF44;
  add_fd(qword_10004C5B8);
  uint64_t result = 0;
  byte_10004C5A4 = 1;
  return result;
}

uint64_t sub_10002EEB8()
{
  char __buf = -1;
  uint64_t v0 = pthread_self();
  if (!pthread_detach(v0))
  {
    if (byte_10004C4A2) {
      uint64_t v1 = &byte_10004C4A2;
    }
    else {
      uint64_t v1 = 0;
    }
    if (dword_10004C5B0 == 1) {
      uint64_t v2 = &change_password_hook;
    }
    else {
      uint64_t v2 = &retry_password_hook;
    }
    if (!((unsigned int (*)(char *))*v2)(v1)) {
      char __buf = 0;
    }
  }
  write(SHIDWORD(qword_10004C5B8), &__buf, 1uLL);
  return 0;
}

void sub_10002EF44()
{
  if (qword_10004C5B8 != -1 && is_ready_fd(qword_10004C5B8))
  {
    unsigned int v22 = 0;
    byte_10004C5A4 = 0;
    char v23 = 0;
    read(qword_10004C5B8, &v23, 1uLL);
    wait_input_hook = 0;
    remove_fd(qword_10004C5B8);
    close(qword_10004C5B8);
    close(SHIDWORD(qword_10004C5B8));
    qword_10004C5B8 = -1;
    if (v23)
    {
      v25[0] = 0;
      if (explicit_remote | remote_name) {
        __strlcpy_chk();
      }
      if (!get_secret(0, *((const char **)&xmmword_10004C1F0 + 1), v25, v24, (int *)&v22, 0))
      {
        unsigned int v22 = 0;
        warning((uint64_t)"No CHAP secret found for authenticating us to %q", v0, v1, v2, v3, v4, v5, v6, (int)v25);
      }
      int v26 = 599917567;
      if (dword_10004C5B0 == 1)
      {
        size_t v7 = strlen(new_passwd);
        int v8 = (*(uint64_t (**)(_WORD *, void, uint64_t, unsigned char *, void, char *, size_t, char *))(xmmword_10004C200 + 48))(v27, *((void *)&xmmword_10004C1F0 + 1), qword_10004C5A8, v24, v22, new_passwd, v7, (char *)&xmmword_10004C200 + 8);
        if (!v8) {
          save_new_password();
        }
      }
      else
      {
        int v8 = (*(uint64_t (**)(_WORD *, void, uint64_t, unsigned char *, void, char *))(xmmword_10004C200 + 56))(v27, *((void *)&xmmword_10004C1F0 + 1), qword_10004C5A8, v24, v22, (char *)&xmmword_10004C200 + 8);
      }
      __memset_chk();
      byte_10004C3A0 = 1;
      byte_10004C5A2 = *(unsigned char *)(qword_10004C5A8 + 1);
      free((void *)qword_10004C5A8);
      qword_10004C5A8 = 0;
      if (!v8) {
        output(0, (uint64_t)&v26, __rev16(v27[1]) + 4, v16, v17, v18, v19, v20, v21);
      }
    }
    else
    {
      free((void *)qword_10004C5A8);
      qword_10004C5A8 = 0;
      int v15 = xmmword_10004C1F0;
      if ((xmmword_10004C1F0 & 0x10) != 0)
      {
        LODWORD(xmmword_10004C1F0) = xmmword_10004C1F0 & 0xFFFFFFEF;
        untimeout((uint64_t)sub_10002EBA8, (uint64_t)&xmmword_10004C1F0);
        int v15 = xmmword_10004C1F0;
      }
      LODWORD(xmmword_10004C1F0) = v15 | 4;
      auth_withpeer_cancelled(0, 49699, v9, v10, v11, v12, v13, v14);
    }
  }
}

uint64_t setup_security_context()
{
  kern_return_t v0;
  uint64_t v1;
  _OWORD v3[2];
  int v4;
  mach_port_name_t v5;
  mach_port_t sp[2];

  *(void *)mach_port_t sp = 0;
  uint64_t v5 = 0;
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  uint64_t v0 = bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp[1]);
  if (v0)
  {
    if (v0 == 1102) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 4294967294;
    }
  }
  else
  {
    uint64_t v1 = sub_100030AC8(sp[1], sp, &v5, &v4, v3);
    mach_port_deallocate(mach_task_self_, sp[1]);
    if (!v1)
    {
      if (!sp[0]
        || (uint64_t v1 = task_set_special_port(mach_task_self_, 4, sp[0]),
            mach_port_deallocate(mach_task_self_, sp[0]),
            !v1))
      {
        if (v5)
        {
          if (!audit_session_join(v5)) {
            return 4294967293;
          }
          mach_port_deallocate(mach_task_self_, v5);
        }
        return 0;
      }
    }
  }
  return v1;
}

BOOL DesSetkey(uint64_t a1, uint8x8_t a2, uint8x8_t a3)
{
  uint64_t v3 = 0;
  int v4 = *(unsigned __int8 *)(a1 + 4);
  a2.i32[0] = *(_DWORD *)a1;
  int16x8_t v5 = (int16x8_t)vmovl_u8(a2);
  char v11 = v5.i8[0] & 0xFE;
  a3.i32[0] = *(_DWORD *)(a1 + 1);
  int v6 = *(unsigned __int8 *)(a1 + 5);
  char v13 = ((v6 | (v4 << 8)) >> 5) & 0xFE;
  *(int8x8_t *)v5.i8 = vand_s8((int8x8_t)vshl_u16((uint16x4_t)vorr_s8((int8x8_t)vshl_n_s16(*(int16x4_t *)v5.i8, 8uLL), (int8x8_t)*(_OWORD *)&vmovl_u8(a3)), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL), (int8x8_t)0xFE00FE00FE00FELL);
  unsigned __int32 v12 = vmovn_s16(v5).u32[0];
  int v7 = *(unsigned __int8 *)(a1 + 6);
  char v14 = ((v7 | (v6 << 8)) >> 6) & 0xFE;
  char v15 = 2 * v7;
  do
  {
    uint32x4_t v8 = (uint32x4_t)vdupq_n_s32(*(&v11 + v3));
    v10[v3++] = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vshlq_u32(v8, (uint32x4_t)xmmword_10003B650), (int16x8_t)vshlq_u32(v8, (uint32x4_t)xmmword_10003B640))), (int8x8_t)0x101010101010101);
  }
  while (v3 != 8);
  *__error() = 0;
  setkey((const char *)v10);
  return *__error() == 0;
}

uint64_t DesEncrypt(uint64_t a1, unsigned char *a2)
{
  uint64_t v3 = 0;
  unsigned int v4 = -8;
  do
  {
    uint32x4_t v5 = (uint32x4_t)vdupq_n_s32(*(unsigned __int8 *)(a1 + v3));
    v15[v3] = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_10003B650), (int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_10003B640))), (int8x8_t)0x101010101010101);
    v4 += 8;
    ++v3;
  }
  while (v4 < 0x38);
  *__error() = 0;
  encrypt((char *)v15, 0);
  int v6 = __error();
  uint64_t result = 0;
  if (!*v6)
  {
    unsigned int v8 = 0;
    uint64_t v9 = (unsigned __int8 *)v15;
    do
    {
      int v10 = 0;
      int v11 = 7;
      unsigned __int32 v12 = v9;
      do
      {
        int v13 = *v12++;
        v10 |= v13 << v11--;
      }
      while (v11 != -1);
      v9 += 8;
      *a2++ = v10;
      BOOL v14 = v8 >= 0x38;
      v8 += 8;
    }
    while (!v14);
    return 1;
  }
  return result;
}

uint64_t DesDecrypt(uint64_t a1, unsigned char *a2)
{
  uint64_t v3 = 0;
  unsigned int v4 = -8;
  do
  {
    uint32x4_t v5 = (uint32x4_t)vdupq_n_s32(*(unsigned __int8 *)(a1 + v3));
    v15[v3] = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_10003B650), (int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_10003B640))), (int8x8_t)0x101010101010101);
    v4 += 8;
    ++v3;
  }
  while (v4 < 0x38);
  *__error() = 0;
  encrypt((char *)v15, 1);
  int v6 = __error();
  uint64_t result = 0;
  if (!*v6)
  {
    unsigned int v8 = 0;
    uint64_t v9 = (unsigned __int8 *)v15;
    do
    {
      int v10 = 0;
      int v11 = 7;
      unsigned __int32 v12 = v9;
      do
      {
        int v13 = *v12++;
        v10 |= v13 << v11--;
      }
      while (v11 != -1);
      v9 += 8;
      *a2++ = v10;
      BOOL v14 = v8 >= 0x38;
      v8 += 8;
    }
    while (!v14);
    return 1;
  }
  return result;
}

uint64_t chap_md5_init()
{
  return chap_register_digest((uint64_t)&unk_100047208);
}

unsigned char *sub_10002F650(unsigned char *a1)
{
  unsigned int v2 = vcvtd_n_s64_f64(drand48(), 3uLL);
  *a1 = v2 + 16;

  return random_bytes(a1 + 1, v2 + 16);
}

uint64_t sub_10002F694(char a1, uint64_t a2, const void *a3, CC_LONG a4, unsigned __int8 *a5, uint64_t a6, int a7, int a8)
{
  memset(&c, 0, sizeof(c));
  char data = a1;
  if (*(unsigned char *)a6 != 16) {
    goto LABEL_6;
  }
  int v13 = a5 + 1;
  CC_LONG v14 = *a5;
  CC_MD5_Init(&c);
  uint64_t v15 = 1;
  CC_MD5_Update(&c, &data, 1u);
  CC_MD5_Update(&c, a3, a4);
  CC_MD5_Update(&c, v13, v14);
  CC_MD5_Final(md, &c);
  if (*(void *)md == *(void *)(a6 + 1) && v22 == *(void *)(a6 + 9))
  {
    uint64_t v17 = "Access granted";
  }
  else
  {
LABEL_6:
    uint64_t v15 = 0;
    uint64_t v17 = "Access denied";
  }
  slprintf(a7, a8, v17);
  return v15;
}

uint64_t sub_10002F7C4(unsigned char *a1, char a2, uint64_t a3, unsigned __int8 *a4, const void *a5, CC_LONG a6)
{
  memset(&c, 0, sizeof(c));
  char data = a2;
  uint64_t v9 = a4 + 1;
  CC_LONG v10 = *a4;
  CC_MD5_Init(&c);
  CC_MD5_Update(&c, &data, 1u);
  CC_MD5_Update(&c, a5, a6);
  CC_MD5_Update(&c, v9, v10);
  uint64_t result = CC_MD5_Final(a1 + 1, &c);
  *a1 = 16;
  return result;
}

uint64_t sub_10002F870(mach_port_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6, _DWORD *a7, _DWORD *a8)
{
  msg.msgh_size_t size = 0;
  int v17 = 4;
  uint64_t v18 = a2;
  int v19 = 16777472;
  int v20 = a3;
  uint64_t v21 = a4;
  int v22 = 1245184;
  uint64_t v23 = a5;
  int v24 = 1114112;
  uint64_t v25 = a6;
  int v26 = 1245184;
  NDR_record_t v27 = NDR_record;
  int v28 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x465000000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&msg, 3, 0x5Cu, 0x3Cu, reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v12)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (msg.msgh_id == 18100)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v13 = 4294966996;
          if (v17 == 1 && msg.msgh_size == 52 && !msg.msgh_remote_port && HIWORD(v19) << 16 == 1114112)
          {
            uint64_t v13 = 0;
            int v14 = HIDWORD(v21);
            *a7 = v18;
            *a8 = v14;
            return v13;
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v13 = 4294966996;
          if (HIDWORD(v18))
          {
            if (msg.msgh_remote_port) {
              uint64_t v13 = 4294966996;
            }
            else {
              uint64_t v13 = HIDWORD(v18);
            }
          }
        }
        else
        {
          uint64_t v13 = 4294966996;
        }
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v13;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v13;
}

uint64_t sub_10002FA74(int a1, _DWORD *a2, _DWORD *a3)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v13 = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x465100000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x34u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
      return v8;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      uint64_t v8 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 18101)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 44)
        {
          if (!*(_DWORD *)&msg[8])
          {
            uint64_t v8 = *(unsigned int *)&msg[32];
            if (!*(_DWORD *)&msg[32])
            {
              int v11 = DWORD1(v13);
              *a2 = v13;
              *a3 = v11;
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8]) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = *(_DWORD *)&msg[32] == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996;
          }
          else {
            uint64_t v8 = *(unsigned int *)&msg[32];
          }
          goto LABEL_23;
        }
      }
      uint64_t v8 = 4294966996;
    }
    else
    {
      uint64_t v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v8;
  }
  mig_put_reply_port(*(mach_port_t *)&msg[12]);
  return v8;
}

uint64_t sub_10002FBE4(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x465200000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18102)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            int v11 = DWORD1(v14);
            if (DWORD1(v14) == v15)
            {
              uint64_t v10 = 0;
              *a2 = *(void *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t sub_10002FDB8(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x465300000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18103)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            int v11 = DWORD1(v14);
            if (DWORD1(v14) == v15)
            {
              uint64_t v10 = 0;
              *a2 = *(void *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t sub_10002FF8C(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x465400000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18104)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            int v11 = DWORD1(v14);
            if (DWORD1(v14) == v15)
            {
              uint64_t v10 = 0;
              *a2 = *(void *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t sub_100030160(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 16777472;
  int v16 = a3;
  NDR_record_t v17 = NDR_record;
  int v18 = a3;
  int v19 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(void *)&msg.msgh_voucher_port = 0x465500000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v8 = mach_msg(&msg, 3, 0x3Cu, 0x30u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v9;
    }
    if (msg.msgh_id == 71)
    {
      uint64_t v9 = 4294966988;
    }
    else if (msg.msgh_id == 18105)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v9 = HIDWORD(v14);
            if (!HIDWORD(v14))
            {
              *a5 = v15;
              return v9;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = HIDWORD(v14) == 0;
          }
          if (v10) {
            uint64_t v9 = 4294966996;
          }
          else {
            uint64_t v9 = HIDWORD(v14);
          }
          goto LABEL_23;
        }
      }
      uint64_t v9 = 4294966996;
    }
    else
    {
      uint64_t v9 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v9;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v9;
}

uint64_t sub_10003030C(mach_port_t a1, int a2, _DWORD *a3)
{
  long long v12 = 0u;
  v10.msgh_size_t size = 0;
  NDR_record_t v11 = NDR_record;
  LODWORD(v12) = a2;
  mach_port_t reply_port = mig_get_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x465600000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    mach_port_t reply_port = v10.msgh_local_port;
  }
  uint64_t v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }
    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (v10.msgh_id == 18106)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v7 = v12;
            if (!v12)
            {
              *a3 = DWORD1(v12);
              return v7;
            }
            goto LABEL_23;
          }
        }
        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v12 == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996;
          }
          else {
            uint64_t v7 = v12;
          }
          goto LABEL_23;
        }
      }
      uint64_t v7 = 4294966996;
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v10);
    return v7;
  }
  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

uint64_t sub_100030484(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  int rcv_name_4 = a1;
  mach_port_t rcv_name_8 = reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x465700000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(rcv_name_8);
      return v6;
    }
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      uint64_t v6 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 18107)
    {
      if ((v9 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              *a2 = *(_DWORD *)&rcv_name_12[20];
              return v6;
            }
            goto LABEL_23;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4) {
            BOOL v7 = 1;
          }
          else {
            BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
          }
          if (v7) {
            uint64_t v6 = 4294966996;
          }
          else {
            uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
          }
          goto LABEL_23;
        }
      }
      uint64_t v6 = 4294966996;
    }
    else
    {
      uint64_t v6 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v9);
    return v6;
  }
  mig_put_reply_port(rcv_name_8);
  return v6;
}

uint64_t sub_1000305E8(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  int rcv_name_4 = a1;
  mach_port_t rcv_name_8 = reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x465800000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(rcv_name_8);
      return v6;
    }
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      uint64_t v6 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 18108)
    {
      if ((v9 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              *a2 = *(_DWORD *)&rcv_name_12[20];
              return v6;
            }
            goto LABEL_23;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4) {
            BOOL v7 = 1;
          }
          else {
            BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
          }
          if (v7) {
            uint64_t v6 = 4294966996;
          }
          else {
            uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
          }
          goto LABEL_23;
        }
      }
      uint64_t v6 = 4294966996;
    }
    else
    {
      uint64_t v6 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v9);
    return v6;
  }
  mig_put_reply_port(rcv_name_8);
  return v6;
}

uint64_t sub_10003074C(mach_port_t a1, int a2, _DWORD *a3)
{
  long long v12 = 0u;
  v10.msgh_size_t size = 0;
  NDR_record_t v11 = NDR_record;
  LODWORD(v12) = a2;
  mach_port_t reply_port = mig_get_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x465900000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    mach_port_t reply_port = v10.msgh_local_port;
  }
  uint64_t v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }
    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (v10.msgh_id == 18109)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v7 = v12;
            if (!v12)
            {
              *a3 = DWORD1(v12);
              return v7;
            }
            goto LABEL_23;
          }
        }
        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v12 == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996;
          }
          else {
            uint64_t v7 = v12;
          }
          goto LABEL_23;
        }
      }
      uint64_t v7 = 4294966996;
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v10);
    return v7;
  }
  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

uint64_t sub_1000308C4(mach_port_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6, int a7, int a8, int a9, _DWORD *a10, _DWORD *a11)
{
  int v18 = 4;
  v17.msgh_size_t size = 0;
  uint64_t v19 = a2;
  int v20 = 16777472;
  int v21 = a3;
  uint64_t v22 = a4;
  int v23 = 1245184;
  uint64_t v24 = a5;
  int v25 = 1114112;
  uint64_t v26 = a6;
  int v27 = 1245184;
  NDR_record_t v28 = NDR_record;
  int v29 = a3;
  int v30 = a7;
  int v31 = a8;
  int v32 = a9;
  mach_port_t reply_port = mig_get_reply_port();
  v17.msgh_remote_port = a1;
  v17.msgh_local_port = reply_port;
  v17.msgh_bits = -2147478253;
  *(void *)&v17.msgh_voucher_port = 0x465D00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v17);
    mach_port_t reply_port = v17.msgh_local_port;
  }
  uint64_t v13 = mach_msg(&v17, 3, 0x68u, 0x3Cu, reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v17.msgh_local_port);
  }
  else
  {
    if (!v13)
    {
      if (v17.msgh_id == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (v17.msgh_id == 18113)
      {
        if ((v17.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v14 = 4294966996;
          if (v18 == 1 && v17.msgh_size == 52 && !v17.msgh_remote_port && HIWORD(v20) << 16 == 1114112)
          {
            uint64_t v14 = 0;
            int v15 = HIDWORD(v22);
            *a10 = v19;
            *a11 = v15;
            return v14;
          }
        }
        else if (v17.msgh_size == 36)
        {
          uint64_t v14 = 4294966996;
          if (HIDWORD(v19))
          {
            if (v17.msgh_remote_port) {
              uint64_t v14 = 4294966996;
            }
            else {
              uint64_t v14 = HIDWORD(v19);
            }
          }
        }
        else
        {
          uint64_t v14 = 4294966996;
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
      mach_msg_destroy(&v17);
      return v14;
    }
    mig_dealloc_reply_port(v17.msgh_local_port);
  }
  return v14;
}

uint64_t sub_100030AC8(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _OWORD *a5)
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_OWORD *)&msg[20] = 0u;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x465F00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)msg, 50331651, 0x18u, 0x84u, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    return v12;
  }
  if (v11)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    return v12;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v12 = 4294966988;
    goto LABEL_27;
  }
  if (*(_DWORD *)&msg[20] != 18115)
  {
    uint64_t v12 = 4294966995;
    goto LABEL_27;
  }
  if ((*(_DWORD *)msg & 0x80000000) == 0)
  {
    if (*(_DWORD *)&msg[4] == 36)
    {
      uint64_t v12 = 4294966996;
      if (*(_DWORD *)&msg[32])
      {
        if (*(_DWORD *)&msg[8]) {
          uint64_t v12 = 4294966996;
        }
        else {
          uint64_t v12 = *(unsigned int *)&msg[32];
        }
      }
    }
    else
    {
      uint64_t v12 = 4294966996;
    }
    goto LABEL_27;
  }
  uint64_t v12 = 4294966996;
  if (*(_DWORD *)&msg[24] != 2
    || *(_DWORD *)&msg[4] != 64
    || *(_DWORD *)&msg[8]
    || WORD1(v17) << 16 != 1114112
    || HIWORD(v17) << 16 != 1114112)
  {
LABEL_27:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v12;
  }
  if (HIDWORD(v18) || v19 < 0x20) {
    return 4294966987;
  }
  uint64_t v12 = 0;
  int v14 = DWORD1(v17);
  *a2 = *(_DWORD *)&msg[28];
  *a3 = v14;
  *a4 = DWORD2(v18);
  long long v15 = v21;
  *a5 = v20;
  a5[1] = v15;
  return v12;
}

uint64_t sub_100030CB8(mach_port_t a1, int a2, void *a3, _DWORD *a4, _DWORD *a5, _OWORD *a6)
{
  memset(v21, 0, sizeof(v21));
  long long v20 = 0u;
  long long v19 = 0u;
  msg.msgh_size_t size = 0;
  *(NDR_record_t *)long long v18 = NDR_record;
  *(_DWORD *)&v18[8] = a2;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x466000000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&msg, 50331651, 0x24u, 0x80u, reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v13;
  }
  if (v12)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v13;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v13 = 4294966988;
    goto LABEL_27;
  }
  if (msg.msgh_id != 18116)
  {
    uint64_t v13 = 4294966995;
    goto LABEL_27;
  }
  if ((msg.msgh_bits & 0x80000000) == 0)
  {
    if (msg.msgh_size == 36)
    {
      uint64_t v13 = 4294966996;
      if (*(_DWORD *)&v18[8])
      {
        if (msg.msgh_remote_port) {
          uint64_t v13 = 4294966996;
        }
        else {
          uint64_t v13 = *(unsigned int *)&v18[8];
        }
      }
    }
    else
    {
      uint64_t v13 = 4294966996;
    }
    goto LABEL_27;
  }
  uint64_t v13 = 4294966996;
  if (*(_DWORD *)v18 != 1
    || msg.msgh_size != 60
    || msg.msgh_remote_port
    || BYTE3(v19) != 1
    || (int v14 = DWORD1(v19), DWORD1(v19) != v20))
  {
LABEL_27:
    mach_msg_destroy(&msg);
    return v13;
  }
  if (DWORD2(v20) || HIDWORD(v20) < 0x20) {
    return 4294966987;
  }
  uint64_t v13 = 0;
  *a3 = *(void *)&v18[4];
  *a4 = v14;
  *a5 = DWORD1(v20);
  long long v16 = *(_OWORD *)&v21[28];
  *a6 = *(_OWORD *)&v21[12];
  a6[1] = v16;
  return v13;
}

uint64_t sub_100030EF0(int a1, _DWORD *a2, _OWORD *a3)
{
  uint64_t v18 = 0;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x466100000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 50331651, 0x18u, 0x6Cu, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    return v8;
  }
  if (v7)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    return v8;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v8 = 4294966988;
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v8;
  }
  if (*(_DWORD *)&msg[20] != 18117)
  {
    uint64_t v8 = 4294966995;
    goto LABEL_23;
  }
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (*(_DWORD *)&msg[4] != 40)
  {
    if (*(_DWORD *)&msg[4] == 36)
    {
      if (*(_DWORD *)&msg[8]) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = *(_DWORD *)&msg[32] == 0;
      }
      if (v9) {
        uint64_t v8 = 4294966996;
      }
      else {
        uint64_t v8 = *(unsigned int *)&msg[32];
      }
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (*(_DWORD *)&msg[8])
  {
LABEL_22:
    uint64_t v8 = 4294966996;
    goto LABEL_23;
  }
  uint64_t v8 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_23;
  }
  uint64_t v11 = &msg[(*(unsigned int *)&msg[4] + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) < 0x20u) {
    return 4294966987;
  }
  uint64_t v8 = 0;
  *a2 = v14;
  long long v12 = *(_OWORD *)(v11 + 36);
  *a3 = *(_OWORD *)(v11 + 20);
  a3[1] = v12;
  return v8;
}

unsigned __int8 *__cdecl CC_MD4(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_MD4(data, len, md);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return _CC_MD5_Final(md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return _CC_MD5_Init(c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return _CC_MD5_Update(c, data, len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return _CC_SHA1_Final(md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return _CC_SHA1_Init(c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA1_Update(c, data, len);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
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

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return _CFBundleCopyInfoDictionaryForURL(url);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return _CFBundleGetFunctionPointerForName(bundle, functionName);
}

Boolean CFBundleLoadExecutable(CFBundleRef bundle)
{
  return _CFBundleLoadExecutable(bundle);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
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

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
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

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return _CFPropertyListCreateFromXMLData(allocator, xmlData, mutabilityOption, errorString);
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

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return _CFStringCreateWithCStringNoCopy(alloc, cStr, encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return _CFStringHasSuffix(theString, suffix);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return _CFURLCreateFromFileSystemRepresentation(allocator, buffer, bufLen, isDirectory);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreCopyMultiple(store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return _SCDynamicStoreCreateRunLoopSource(allocator, store, order);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkGlobalEntity(allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreRemoveValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreRemoveValue(store, key);
}

uint64_t SCDynamicStoreSetDisconnectCallBack()
{
  return _SCDynamicStoreSetDisconnectCallBack();
}

Boolean SCDynamicStoreSetMultiple(SCDynamicStoreRef store, CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFArrayRef keysToNotify)
{
  return _SCDynamicStoreSetMultiple(store, keysToSet, keysToRemove, keysToNotify);
}

Boolean SCDynamicStoreSetValue(SCDynamicStoreRef store, CFStringRef key, CFPropertyListRef value)
{
  return _SCDynamicStoreSetValue(store, key, value);
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
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

uint64_t __memmove_chk()
{
  return ___memmove_chk();
}

uint64_t __memset_chk()
{
  return ___memset_chk();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t __strncpy_chk()
{
  return ___strncpy_chk();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

void _exit(int a1)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

char *__cdecl addr2ascii(int a1, const void *a2, int a3, char *a4)
{
  return _addr2ascii(a1, a2, a3, a4);
}

uint32_t arc4random(void)
{
  return _arc4random();
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

au_asid_t audit_session_join(mach_port_name_t port)
{
  return _audit_session_join(port);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_look_up(bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

speed_t cfgetospeed(const termios *a1)
{
  return _cfgetospeed(a1);
}

int cfsetispeed(termios *a1, speed_t a2)
{
  return _cfsetispeed(a1, a2);
}

int cfsetospeed(termios *a1, speed_t a2)
{
  return _cfsetospeed(a1, a2);
}

int chdir(const char *a1)
{
  return _chdir(a1);
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

void clearerr(FILE *a1)
{
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

void closelog(void)
{
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

char *__cdecl crypt(const char *a1, const char *a2)
{
  return _crypt(a1, a2);
}

char *__cdecl ctime(const time_t *a1)
{
  return _ctime(a1);
}

char *__cdecl dirname(char *a1)
{
  return _dirname(a1);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
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

int dup(int a1)
{
  return _dup(a1);
}

int dup2(int a1, int a2)
{
  return _dup2(a1, a2);
}

void encrypt(char *a1, int a2)
{
}

void endpwent(void)
{
}

int execle(const char *__path, const char *__arg0, ...)
{
  return _execle(__path, __arg0);
}

int execve(const char *__file, char *const *__argv, char *const *__envp)
{
  return _execve(__file, __argv, __envp);
}

void exit(int a1)
{
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return _fdopen(a1, a2);
}

int feof(FILE *a1)
{
  return _feof(a1);
}

int ferror(FILE *a1)
{
  return _ferror(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

pid_t fork(void)
{
  return _fork();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return _getc(a1);
}

int getdtablesize(void)
{
  return _getdtablesize();
}

gid_t getegid(void)
{
  return _getegid();
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

uid_t geteuid(void)
{
  return _geteuid();
}

gid_t getgid(void)
{
  return _getgid();
}

group *__cdecl getgrnam(const char *a1)
{
  return _getgrnam(a1);
}

int getgroups(int a1, gid_t a2[])
{
  return _getgroups(a1, a2);
}

hostent *__cdecl gethostbyname(const char *a1)
{
  return _gethostbyname(a1);
}

uint64_t gethostid(void)
{
  return _gethostid();
}

int gethostname(char *a1, size_t a2)
{
  return _gethostname(a1, a2);
}

netent *__cdecl getnetbyname(const char *a1)
{
  return _getnetbyname(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t htonl()
{
  return _htonl();
}

uint64_t htons()
{
  return _htons();
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

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int isatty(int a1)
{
  return _isatty(a1);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return _mig_get_reply_port();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint64_t ne_log_obj()
{
  return _ne_log_obj();
}

uint64_t ne_session_copy_security_session_info()
{
  return _ne_session_copy_security_session_info();
}

uint64_t ne_session_create()
{
  return _ne_session_create();
}

uint64_t ne_session_get_info()
{
  return _ne_session_get_info();
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint64_t ntohl()
{
  return _ntohl();
}

uint64_t ntohs()
{
  return _ntohs();
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

void openlog(const char *a1, int a2, int a3)
{
}

int openpty(int *a1, int *a2, char *a3, termios *a4, winsize *a5)
{
  return _openpty(a1, a2, a3, a4, a5);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int pthread_cancel(pthread_t a1)
{
  return _pthread_cancel(a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return _pthread_detach(a1);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return _pthread_equal(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int putc(int a1, FILE *a2)
{
  return _putc(a1, a2);
}

utmpx *__cdecl pututxline(const utmpx *a1)
{
  return _pututxline(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return _readdir_r(a1, a2, a3);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

int seteuid(uid_t a1)
{
  return _seteuid(a1);
}

int setgid(gid_t a1)
{
  return _setgid(a1);
}

void setkey(const char *a1)
{
}

int setlogmask(int a1)
{
  return _setlogmask(a1);
}

int setpriority(int a1, id_t a2, int a3)
{
  return _setpriority(a1, a2, a3);
}

pid_t setsid(void)
{
  return _setsid();
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int setuid(uid_t a1)
{
  return _setuid(a1);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
}

void siglongjmp(sigjmp_buf a1, int a2)
{
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return _sigprocmask(a1, a2, a3);
}

int sigsetjmp(sigjmp_buf a1, int a2)
{
  return _sigsetjmp(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
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

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return _strlcat(__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return _strncat(__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return _strsep(__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

kern_return_t task_set_special_port(task_t task, int which_port, mach_port_t special_port)
{
  return _task_set_special_port(task, which_port, special_port);
}

int tcgetattr(int a1, termios *a2)
{
  return _tcgetattr(a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return _tcsetattr(a1, a2, a3);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

char *__cdecl ttyname(int a1)
{
  return _ttyname(a1);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int ungetc(int a1, FILE *a2)
{
  return _ungetc(a1, a2);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}