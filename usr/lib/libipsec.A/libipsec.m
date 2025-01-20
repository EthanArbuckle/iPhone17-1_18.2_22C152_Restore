char *__cdecl ipsec_dump_policy(caddr_t a1, char *a2)
{
  return ipsec_dump_policy1();
}

char *ipsec_dump_policy1()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (!v0) {
    return 0;
  }
  v3 = (unsigned __int16 *)v0;
  if (*(_WORD *)(v0 + 2) != 18)
  {
    v11 = 0;
    int v29 = 12;
LABEL_40:
    __ipsec_errcode = v29;
    return v11;
  }
  if (v1) {
    v4 = v1;
  }
  else {
    v4 = " ";
  }
  unint64_t v5 = *(unsigned __int8 *)(v0 + 6);
  if (v5 >= 3)
  {
    v11 = 0;
    int v29 = 17;
    goto LABEL_40;
  }
  unint64_t v6 = *(unsigned __int16 *)(v0 + 4);
  if (v6 >= 6)
  {
    v11 = 0;
    int v29 = 5;
    goto LABEL_40;
  }
  int v7 = v2;
  size_t v8 = strlen((&ipsp_dir_strs)[v5]);
  size_t v9 = v8 + strlen((&ipsp_policy_strs)[v6]) + 2;
  v10 = (char *)malloc_type_malloc(v9, 0xED90A0EuLL);
  v11 = v10;
  if (!v10)
  {
    int v29 = 21;
    goto LABEL_40;
  }
  snprintf(v10, v9, "%s %s", (&ipsp_dir_strs)[*((unsigned __int8 *)v3 + 6)], (&ipsp_policy_strs)[v3[2]]);
  if (v3[2] == 2)
  {
    unsigned int v12 = *v3;
    if (v12 >= 3)
    {
      unint64_t v13 = 8 * *v3;
      unint64_t v14 = 16;
      do
        v14 += *(unsigned __int16 *)((char *)v3 + v14);
      while (v14 < v13);
      if (v14 == v13)
      {
        unint64_t v15 = 16;
        while (1)
        {
          v16 = (char *)v3 + v15;
          unint64_t v17 = v13 - v15;
          unint64_t v18 = *(unsigned __int16 *)((char *)v3 + v15);
          if (v17 < v18) {
            break;
          }
          int v19 = *((unsigned __int16 *)v16 + 1);
          switch(v19)
          {
            case '2':
              v20 = "esp";
              break;
            case 'l':
              v20 = "ipcomp";
              break;
            case '3':
              v20 = "ah";
              break;
            default:
              goto LABEL_51;
          }
          if ((unint64_t)v16[4] > 2)
          {
            int v32 = 8;
            goto LABEL_54;
          }
          __str[0] = 0;
          if (v18 >= 9)
          {
            uint64_t v21 = v16[8];
            v22 = (sockaddr *)&v16[v21 + 8];
            if (v21 + v22->sa_len + 8 != v18
              || !set_address(v36, (sockaddr *)(v16 + 8), v7)
              || !set_address(__s, v22, v7)
              || (size_t v23 = strlen(v36), v23 + strlen(__s) - 2051 < 0xFFFFFFFFFFFFF7FBLL))
            {
              int v32 = 6;
LABEL_54:
              __ipsec_errcode = v32;
              goto LABEL_47;
            }
            snprintf(__str, 0x804uLL, "%s-%s", v36, __s);
          }
          if ((unint64_t)v16[5] > 3)
          {
            int v32 = 9;
            goto LABEL_54;
          }
          if (*((_WORD *)v16 + 3)) {
            snprintf(v33, 0x400uLL, "%s/%s/%s/%s%c%u", v20);
          }
          else {
            snprintf(v33, 0x400uLL, "%s/%s/%s/%s");
          }
          int v24 = strlen(v11);
          size_t v25 = strlen(v4);
          size_t v26 = v25 + v24 + strlen(v33) + 1;
          v27 = (char *)malloc_type_realloc(v11, v26, 0x9D9DDBB2uLL);
          if (!v27)
          {
            int v30 = 21;
            goto LABEL_46;
          }
          v28 = v27;
          snprintf(&v27[v24], v26 - v24, "%s%s", v4, v33);
          v15 += *(unsigned __int16 *)((char *)v3 + v15);
          unint64_t v13 = 8 * *v3;
          v11 = v28;
          if (v15 >= v13) {
            goto LABEL_44;
          }
        }
LABEL_51:
        int v32 = 7;
        goto LABEL_54;
      }
      goto LABEL_45;
    }
    if (v12 != 2)
    {
LABEL_45:
      int v30 = 3;
LABEL_46:
      __ipsec_errcode = v30;
LABEL_47:
      free(v11);
      return 0;
    }
    v28 = v11;
LABEL_44:
    __ipsec_errcode = 0;
    return v28;
  }
  else
  {
    __ipsec_errcode = 0;
  }
  return v11;
}

char *ipsec_dump_policy_withports()
{
  return ipsec_dump_policy1();
}

char *set_address(char *a1, sockaddr *a2, int a3)
{
  v4 = a1;
  uint64_t v8 = *MEMORY[0x263EF8340];
  *a1 = 0;
  if (getnameinfo(a2, a2->sa_len, v7, 0x401u, v6, 0x20u, 10)) {
    return 0;
  }
  if (a3) {
    snprintf(v4, 0x401uLL, "%s[%s]");
  }
  else {
    snprintf(v4, 0x401uLL, "%s");
  }
  return v4;
}

int ipsec_get_policylen(caddr_t a1)
{
  if (a1) {
    return 8 * *(unsigned __int16 *)a1;
  }
  else {
    return -1;
  }
}

const char *ipsec_strerror(void)
{
  int v0 = __ipsec_errcode;
  if (__ipsec_errcode >= 0x1F)
  {
    int v0 = 30;
    __ipsec_errcode = 30;
  }
  return ipsec_errlist[v0];
}

uint64_t __ipsec_set_strerror(uint64_t result)
{
  __ipsec_errcode = 26;
  qword_268290540 = result;
  return result;
}

uint64_t __libipsecparse()
{
  int v0 = 0;
  v1 = v45;
  uint64_t v2 = 200;
  uint64_t v47 = *MEMORY[0x263EF8340];
  long long v44 = 0uLL;
  __libipsecnerrs = 0;
  __libipsecchar = -2;
  unint64_t v3 = 0x268290000;
  v4 = v46;
  unint64_t v5 = v46;
  unint64_t v6 = v45;
  while (1)
  {
    *(_WORD *)unint64_t v5 = v0;
    if (&v4[2 * v2 - 2] <= v5)
    {
      if ((unint64_t)v2 >> 4 > 0x270
        || ((unint64_t)(2 * v2) >= 0x2710 ? (uint64_t v2 = 10000) : (v2 *= 2),
            (int v7 = malloc_type_malloc(18 * v2 + 15, 0x3246144EuLL)) == 0))
      {
        uint64_t v39 = 2;
        v40 = "memory exhausted";
LABEL_87:
        fprintf((FILE *)*MEMORY[0x263EF8348], "libipsec: %s while parsing \"%s\"\n", v40, (const char *)__libipsectext);
        goto LABEL_88;
      }
      uint64_t v8 = v7;
      uint64_t v9 = (v5 - v4) >> 1;
      uint64_t v10 = v9 + 1;
      memcpy(v7, v4, 2 * (v9 + 1));
      memcpy(&v8[(2 * v2 + 15) & 0xFFFFFFFFFFFFFFF0], v1, 16 * (v9 + 1));
      if (v4 != v46) {
        free(v4);
      }
      if (v2 <= v10)
      {
        uint64_t v39 = 1;
        goto LABEL_89;
      }
      unint64_t v5 = &v8[2 * v9];
      unint64_t v6 = &v8[16 * v10 - 16 + ((2 * v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
      v4 = v8;
      v1 = &v8[(2 * v2 + 15) & 0xFFFFFFFFFFFFFFF0];
      unint64_t v3 = 0x268290000uLL;
    }
    if (((0xAE38802D57A2A30uLL >> v0) & 1) == 0)
    {
      int v11 = yypact[v0];
      int v12 = __libipsecchar;
      if (__libipsecchar == -2)
      {
        int v12 = __libipseclex();
        __libipsecchar = v12;
      }
      if (v12 <= 0)
      {
        int v13 = 0;
        __libipsecchar = 0;
      }
      else
      {
        int v13 = v12 > 0x111 ? 2 : yytranslate[v12];
      }
      uint64_t v14 = (v13 + v11);
      unint64_t v3 = 0x268290000;
      if (v14 <= 0x30 && v13 == yycheck[v14]) {
        break;
      }
    }
    if ((0x5187380000555CDuLL >> v0))
    {
LABEL_86:
      ++__libipsecnerrs;
      uint64_t v39 = 1;
      v40 = "syntax error";
      goto LABEL_87;
    }
    uint64_t v15 = yydefact[v0];
    uint64_t v16 = yyr2[v15];
    long long v44 = *(_OWORD *)&v6[16 * (1 - v16)];
    switch((int)v15)
    {
      case 2:
        p_dir = *((_DWORD *)v6 - 4);
        p_type = *(_DWORD *)v6;
        goto LABEL_46;
      case 4:
        p_dir = *((_DWORD *)v6 - 12);
        p_type = *(_DWORD *)v6;
        unint64_t v17 = (char *)malloc_type_malloc(*((int *)v6 - 4) + 2, 0x115BBE7uLL);
        if (!v17) {
          goto LABEL_97;
        }
        unint64_t v18 = v17;
        snprintf(v17, *((int *)v6 - 4) + 2, "-%s", *((const char **)v6 - 1));
        *__error() = 0;
        p_priority_offset = atol(v18);
        int v19 = (char *)v18;
        unint64_t v3 = 0x268290000uLL;
        free(v19);
        if (*__error() || (LODWORD(v20) = p_priority_offset, p_priority_offset <= (uint64_t)0xFFFFFFFF7FFFFFFFLL))
        {
LABEL_96:
          int v41 = 27;
          goto LABEL_102;
        }
LABEL_36:
        int v21 = v20 ^ 0x80000000;
LABEL_44:
        p_priority = v21;
LABEL_47:
        if (init_x_policy()) {
          return 0xFFFFFFFFLL;
        }
        goto LABEL_80;
      case 6:
        p_dir = *((_DWORD *)v6 - 16);
        p_type = *(_DWORD *)v6;
        *__error() = 0;
        *(void *)(v3 + 1480) = atol(*((const char **)v6 - 1));
        if (!*__error())
        {
          uint64_t v20 = *(void *)(v3 + 1480);
          if (v20 < 0x80000000) {
            goto LABEL_36;
          }
        }
        goto LABEL_96;
      case 8:
        p_dir = *((_DWORD *)v6 - 12);
        p_type = *(_DWORD *)v6;
        int v21 = *((_DWORD *)v6 - 4);
        goto LABEL_44;
      case 10:
        p_dir = *((_DWORD *)v6 - 20);
        p_type = *(_DWORD *)v6;
        *__error() = 0;
        *(void *)(v3 + 1480) = atol(*((const char **)v6 - 1));
        if (*__error()) {
          goto LABEL_94;
        }
        uint64_t v22 = *(void *)(v3 + 1480);
        if (v22 >= 1073741825) {
          goto LABEL_94;
        }
        int v21 = *((_DWORD *)v6 - 12) - v22;
        goto LABEL_44;
      case 12:
        p_dir = *((_DWORD *)v6 - 20);
        p_type = *(_DWORD *)v6;
        *__error() = 0;
        *(void *)(v3 + 1480) = atol(*((const char **)v6 - 1));
        if (*__error() || (uint64_t v23 = *(void *)(v3 + 1480), v23 >= 0x40000000))
        {
LABEL_94:
          int v41 = 28;
          goto LABEL_102;
        }
        int v21 = *((_DWORD *)v6 - 12) + v23;
        goto LABEL_44;
      case 14:
        p_dir = *(_DWORD *)v6;
        p_type = 0;
LABEL_46:
        p_priority = 0;
        goto LABEL_47;
      case 16:
        v43 = v1;
        if (p_type == 2)
        {
          if (!p_protocol)
          {
            int v41 = 19;
            goto LABEL_102;
          }
          if ((p_mode - 3) < 0xFFFFFFFE)
          {
            int v41 = 8;
            goto LABEL_102;
          }
          int v24 = (unsigned __int8 *)p_src;
          size_t v25 = (unsigned __int8 *)p_dst;
          if (__PAIR128__(p_dst, p_src) == 0)
          {
            if (p_mode == 1)
            {
              int v24 = 0;
              size_t v25 = 0;
              int v26 = 0;
              __ipsec_errcode = 0;
              int v27 = 8;
              goto LABEL_78;
            }
            int v41 = 6;
LABEL_102:
            __ipsec_errcode = v41;
            return 0xFFFFFFFFLL;
          }
          if (*(unsigned __int8 *)(p_src + 1) != *(unsigned __int8 *)(p_dst + 1))
          {
            int v41 = 24;
            goto LABEL_102;
          }
          __ipsec_errcode = 0;
        }
        else
        {
          size_t v25 = (unsigned __int8 *)p_dst;
          int v24 = (unsigned __int8 *)p_src;
          __ipsec_errcode = 0;
          if (!p_src)
          {
            int v27 = 8;
            if (!p_dst) {
              goto LABEL_73;
            }
            goto LABEL_77;
          }
        }
        int v27 = *v24 + 8;
        if (!v25)
        {
LABEL_73:
          int v26 = 0;
          goto LABEL_78;
        }
LABEL_77:
        int v26 = *v25;
LABEL_78:
        uint64_t v32 = (v26 + v27);
        size_t v33 = tlen + v32;
        tlen += v32;
        v34 = (char *)malloc_type_realloc((void *)pbuf, v33, 0x2582A82BuLL);
        if (!v34)
        {
LABEL_97:
          int v41 = 21;
          goto LABEL_102;
        }
        pbuf = (uint64_t)v34;
        int v35 = offset;
        v36 = &v34[offset];
        *(_WORD *)v36 = v32;
        *((_WORD *)v36 + 1) = p_protocol;
        v36[4] = p_mode;
        v36[5] = p_level;
        *((_WORD *)v36 + 3) = p_reqid;
        offset = v35 + 8;
        set_sockaddr(v24);
        set_sockaddr(v25);
        __ipsec_errcode = 0;
        policy_parse_request_init();
        unint64_t v3 = 0x268290000;
        v1 = v43;
LABEL_80:
        v5 -= 2 * v16;
        unint64_t v6 = &v6[-16 * v16 + 16];
        *(_OWORD *)unint64_t v6 = v44;
        uint64_t v37 = yyr1[v15] - 19;
        uint64_t v38 = (*(__int16 *)v5 + yypgoto[v37]);
        if (v38 <= 0x30 && *(unsigned __int16 *)v5 == (unsigned __int16)yycheck[v38]) {
          int v0 = yytable[v38];
        }
        else {
          int v0 = yydefgoto[v37];
        }
LABEL_84:
        v5 += 2;
        break;
      case 23:
      case 24:
        int v41 = 25;
        goto LABEL_102;
      case 25:
        p_protocol = *(_DWORD *)v6;
        goto LABEL_80;
      case 26:
        p_mode = *(_DWORD *)v6;
        goto LABEL_80;
      case 27:
        p_level = *(_DWORD *)v6;
        p_reqid = 0;
        goto LABEL_80;
      case 28:
        p_level = 3;
        p_reqid = atol(*((const char **)v6 + 1));
        goto LABEL_80;
      case 29:
        v28 = (const char **)v6;
        int v29 = 0;
        goto LABEL_62;
      case 30:
        int v30 = (const char **)v6;
        v31 = 0;
        goto LABEL_65;
      case 31:
        v28 = (const char **)(v6 - 16);
        int v29 = (const char **)v6;
LABEL_62:
        p_src = (uint64_t)parse_sockaddr(v28, v29);
        if (!p_src) {
          return 0xFFFFFFFFLL;
        }
        goto LABEL_80;
      case 32:
        int v30 = (const char **)(v6 - 16);
        v31 = (const char **)v6;
LABEL_65:
        p_dst = (uint64_t)parse_sockaddr(v30, v31);
        if (!p_dst) {
          return 0xFFFFFFFFLL;
        }
        goto LABEL_80;
      case 33:
        if (p_dir != 2) {
          goto LABEL_95;
        }
        goto LABEL_80;
      case 34:
        if (p_dir == 1) {
          goto LABEL_80;
        }
LABEL_95:
        int v41 = 17;
        goto LABEL_102;
      default:
        goto LABEL_80;
    }
  }
  if ((0x80F000000000uLL >> v14)) {
    goto LABEL_86;
  }
  if (v14 != 4)
  {
    if (v12 >= 1) {
      __libipsecchar = -2;
    }
    int v0 = yytable[v14];
    *((_OWORD *)v6 + 1) = __libipseclval;
    v6 += 16;
    goto LABEL_84;
  }
  uint64_t v39 = 0;
LABEL_88:
  uint64_t v8 = v4;
LABEL_89:
  if (v8 != v46) {
    free(v8);
  }
  return v39;
}

uint64_t init_x_policy()
{
  if (pbuf)
  {
    free((void *)pbuf);
    tlen = 0;
  }
  int v0 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
  pbuf = (uint64_t)v0;
  if (v0)
  {
    tlen = 16;
    *int v0 = 0;
    v0[1] = 0;
    *((_WORD *)v0 + 1) = 18;
    *((_WORD *)v0 + 2) = p_type;
    *((unsigned char *)v0 + 6) = p_dir;
    int v1 = p_priority;
    if (p_priority)
    {
      uint64_t result = 0xFFFFFFFFLL;
      int v1 = 29;
    }
    else
    {
      uint64_t result = 0;
      offset = 16;
    }
  }
  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    int v1 = 21;
  }
  __ipsec_errcode = v1;
  return result;
}

void policy_parse_request_init()
{
  p_protocol = 0;
  p_mode = 0;
  p_level = 0;
  p_reqid = 0;
  if (p_src)
  {
    free((void *)p_src);
    p_src = 0;
  }
  if (p_dst)
  {
    free((void *)p_dst);
    p_dst = 0;
  }
}

char *parse_sockaddr(const char **a1, const char **a2)
{
  unint64_t v18 = 0;
  size_t v4 = *(int *)a1 + 1;
  unint64_t v5 = (char *)malloc_type_malloc(v4, 0xB3BA63E8uLL);
  unint64_t v6 = v5;
  if (v5)
  {
    if (a2)
    {
      size_t v7 = *(int *)a2 + 1;
      uint64_t v8 = (char *)malloc_type_malloc(v7, 0x712A9112uLL);
      if (!v8)
      {
        free(v6);
        fprintf((FILE *)*MEMORY[0x263EF8348], "libipsec: %s while parsing \"%s\"\n", "malloc failed", (const char *)__libipsectext);
        uint64_t v16 = __error();
        uint64_t v14 = strerror(*v16);
        goto LABEL_16;
      }
      uint64_t v9 = v8;
      strlcpy(v6, a1[1], v4);
      strlcpy(v9, a2[1], v7);
    }
    else
    {
      strlcpy(v5, a1[1], v4);
      uint64_t v9 = 0;
    }
    memset(&v19, 0, sizeof(v19));
    v19.ai_flags = 4;
    v19.ai_socktype = 2;
    int v12 = getaddrinfo(v6, v9, &v19, &v18);
    free(v6);
    if (v9) {
      free(v9);
    }
    if (v12)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "libipsec: %s while parsing \"%s\"\n", "invalid IP address", (const char *)__libipsectext);
      int v13 = v12;
LABEL_11:
      uint64_t v14 = (void *)gai_strerror(v13);
LABEL_16:
      __ipsec_set_strerror((uint64_t)v14);
      return 0;
    }
    if (!v18->ai_addr)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "libipsec: %s while parsing \"%s\"\n", "invalid IP address", (const char *)__libipsectext);
      int v13 = 0;
      goto LABEL_11;
    }
    uint64_t v15 = (char *)malloc_type_malloc(v18->ai_addrlen, 0xF344FBA0uLL);
    unint64_t v6 = v15;
    if (v15)
    {
      memcpy(v15, v18->ai_addr, v18->ai_addrlen);
      freeaddrinfo(v18);
      __ipsec_errcode = 0;
    }
    else
    {
      __ipsec_errcode = 21;
      freeaddrinfo(v18);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "libipsec: %s while parsing \"%s\"\n", "malloc failed", (const char *)__libipsectext);
    uint64_t v10 = __error();
    int v11 = strerror(*v10);
    __ipsec_set_strerror((uint64_t)v11);
  }
  return v6;
}

uint64_t __libipsecerror(const char *a1)
{
  return fprintf((FILE *)*MEMORY[0x263EF8348], "libipsec: %s while parsing \"%s\"\n", a1, (const char *)__libipsectext);
}

caddr_t ipsec_set_policy(char *a1, int a2)
{
  pbuf = 0;
  tlen = 0;
  p_dir = 4;
  p_type = 0;
  policy_parse_request_init();
  __policy__strbuffer__init__(a1);
  LODWORD(a1) = __libipsecparse();
  __policy__strbuffer__free__();
  if (!a1)
  {
    int v4 = 0;
    caddr_t result = (caddr_t)pbuf;
    *(_WORD *)pbuf = tlen >> 3;
    goto LABEL_7;
  }
  if (pbuf) {
    free((void *)pbuf);
  }
  caddr_t result = 0;
  if (!__ipsec_errcode)
  {
    int v4 = 2;
LABEL_7:
    __ipsec_errcode = v4;
  }
  return result;
}

unsigned __int8 *set_sockaddr(unsigned __int8 *__src)
{
  if (__src)
  {
    int v1 = __src;
    int v2 = offset;
    __src = (unsigned __int8 *)memcpy((void *)(pbuf + offset), v1, *v1);
    offset = v2 + *v1;
  }
  __ipsec_errcode = 0;
  return __src;
}

uint64_t __libipseclex()
{
  unint64_t v0 = 0x268290000uLL;
  unint64_t v1 = 0x268290000uLL;
  unint64_t v2 = 0x268290000uLL;
  if ((yy_init & 1) == 0)
  {
    yy_init = 1;
    if ((yy_start & 1) == 0) {
      yy_start = 1;
    }
    if (!__libipsecin) {
      __libipsecin = *MEMORY[0x263EF8350];
    }
    if (!__libipsecout) {
      __libipsecout = *MEMORY[0x263EF8358];
    }
    uint64_t v3 = yy_buffer_stack;
    if (!yy_buffer_stack
      || (uint64_t v4 = yy_buffer_stack_top, (buffer = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top)) == 0))
    {
      __libipsecensure_buffer_stack();
      uint64_t buffer = __libipsec_create_buffer((FILE *)__libipsecin, 0x4000);
      uint64_t v3 = yy_buffer_stack;
      uint64_t v4 = yy_buffer_stack_top;
      *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = buffer;
    }
    yy_n_chars = *(void *)(buffer + 32);
    yy_c_buf_p = *(void *)(buffer + 16);
    __libipsectext = yy_c_buf_p;
    __libipsecin = **(void **)(v3 + 8 * v4);
    yy_hold_char = *(unsigned char *)yy_c_buf_p;
  }
  unint64_t v6 = yy_ec;
  unint64_t v7 = 0x268290000uLL;
  unint64_t v8 = 0x268290000uLL;
LABEL_13:
  uint64_t v9 = yy_c_buf_p;
  *(unsigned char *)yy_c_buf_p = *(unsigned char *)(v1 + 1568);
  LODWORD(v10) = *(unsigned __int8 *)(v2 + 1540);
  uint64_t v63 = v9;
  while (1)
  {
    do
    {
LABEL_14:
      uint64_t v11 = v6[*(unsigned __int8 *)v9];
      if (yy_accept[(int)v10])
      {
        *(_DWORD *)(v8 + 1572) = v10;
        *(void *)(v7 + 1576) = v9;
      }
      uint64_t v12 = (int)v10;
      uint64_t v13 = yy_base[(int)v10] + v11;
      if (v10 != (__int16)yy_chk[v13])
      {
        do
        {
          uint64_t v12 = yy_def[v12];
          if (v12 >= 129) {
            uint64_t v11 = *((unsigned __int8 *)&yy_meta + v11);
          }
          uint64_t v13 = yy_base[v12] + v11;
        }
        while (yy_chk[v13] != (unsigned __int16)v12);
      }
      uint64_t v10 = yy_nxt[v13];
      ++v9;
    }
    while (yy_base[v10] != 251);
    while (2)
    {
      LOWORD(v14) = yy_accept[(int)v10];
      if (!(_WORD)v14)
      {
        uint64_t v9 = *(void *)(v7 + 1576);
        LOWORD(v14) = yy_accept[*(int *)(v8 + 1572)];
      }
      int v14 = (__int16)v14;
      __libipsectext = v63;
      __libipsecleng = v9 - v63;
      *(unsigned char *)(v1 + 1568) = *(unsigned char *)v9;
      *(unsigned char *)uint64_t v9 = 0;
      uint64_t v15 = (char *)v9;
LABEL_24:
      yy_c_buf_p = (uint64_t)v15;
      switch(v14)
      {
        case 0:
          *(unsigned char *)uint64_t v9 = *(unsigned char *)(v1 + 1568);
          uint64_t v9 = *(void *)(v7 + 1576);
          LODWORD(v10) = *(_DWORD *)(v8 + 1572);
          continue;
        case 1:
        case 3:
          int v54 = 1;
          goto LABEL_94;
        case 2:
          int v54 = 2;
LABEL_94:
          LODWORD(__libipseclval) = v54;
          return 258;
        case 4:
        case 5:
          return 259;
        case 6:
          unsigned int v56 = -1073741824;
          goto LABEL_98;
        case 7:
          unsigned int v56 = 0x80000000;
          goto LABEL_98;
        case 8:
          unsigned int v56 = 0x40000000;
LABEL_98:
          LODWORD(__libipseclval) = v56;
          return 261;
        case 9:
          return 260;
        case 10:
          LODWORD(__libipseclval) = strlen((const char *)__libipsectext);
          *((void *)&__libipseclval + 1) = __libipsectext;
          return 262;
        case 11:
          LODWORD(__libipseclval) = 0;
          return 263;
        case 12:
          int v57 = 5;
          goto LABEL_107;
        case 13:
          int v57 = 1;
          goto LABEL_107;
        case 14:
          int v57 = 2;
          goto LABEL_107;
        case 15:
          int v57 = 4;
          goto LABEL_107;
        case 16:
          int v57 = 3;
LABEL_107:
          LODWORD(__libipseclval) = v57;
          return 263;
        case 17:
          int v58 = 50;
          goto LABEL_112;
        case 18:
          int v58 = 51;
          goto LABEL_112;
        case 19:
          int v58 = 108;
LABEL_112:
          LODWORD(__libipseclval) = v58;
          return 264;
        case 20:
          int v59 = 1;
          goto LABEL_115;
        case 21:
          int v59 = 2;
LABEL_115:
          LODWORD(__libipseclval) = v59;
          return 265;
        case 22:
          return 270;
        case 23:
          return 271;
        case 24:
          LODWORD(__libipseclval) = 0;
          return 266;
        case 25:
          int v60 = 1;
          goto LABEL_123;
        case 26:
          int v60 = 2;
          goto LABEL_123;
        case 27:
          LODWORD(__libipseclval) = strlen((const char *)(__libipsectext + 7));
          *((void *)&__libipseclval + 1) = __libipsectext + 7;
          return 267;
        case 28:
          int v60 = 3;
LABEL_123:
          LODWORD(__libipseclval) = v60;
          return 266;
        case 29:
          return 272;
        case 30:
          LODWORD(__libipseclval) = strlen((const char *)__libipsectext);
          *((void *)&__libipseclval + 1) = __libipsectext;
          return 268;
        case 31:
          return 273;
        case 32:
          *((void *)&__libipseclval + 1) = __libipsectext + 1;
          LODWORD(__libipseclval) = strlen((const char *)__libipsectext) - 2;
          return 269;
        case 33:
        case 34:
          goto LABEL_13;
        case 35:
          v53 = v6;
          fwrite((const void *)__libipsectext, __libipsecleng, 1uLL, (FILE *)__libipsecout);
          unint64_t v8 = 0x268290000;
          unint64_t v7 = 0x268290000;
          unint64_t v6 = v53;
          goto LABEL_13;
        case 36:
          int v16 = __libipsectext;
          *(unsigned char *)uint64_t v9 = *(unsigned char *)(v1 + 1568);
          uint64_t v17 = yy_buffer_stack;
          uint64_t v18 = yy_buffer_stack_top;
          uint64_t v19 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
          int v62 = v16;
          if (*(_DWORD *)(v19 + 64))
          {
            uint64_t v20 = yy_n_chars;
          }
          else
          {
            uint64_t v20 = *(void *)(v19 + 32);
            yy_n_chars = v20;
            *(void *)uint64_t v19 = __libipsecin;
            uint64_t v19 = *(void *)(v17 + 8 * v18);
            *(_DWORD *)(v19 + 64) = 1;
          }
          LODWORD(v21) = yy_c_buf_p;
          uint64_t v22 = *(unsigned char **)(v19 + 8);
          if (yy_c_buf_p <= (unint64_t)&v22[v20])
          {
            v48 = v6;
            uint64_t v9 = __libipsectext + ~v62 + (int)v9;
            yy_c_buf_p = v9;
            LODWORD(v10) = yy_get_previous_state();
            unint64_t v8 = 0x268290000uLL;
            unint64_t v7 = 0x268290000uLL;
            if (yy_accept[(int)v10])
            {
              yy_last_accepting_state = v10;
              yy_last_accepting_cpos = v9;
            }
            uint64_t v49 = (int)v10;
            uint64_t v50 = yy_base[(int)v10] + 1;
            unint64_t v2 = 0x268290000;
            unint64_t v6 = v48;
            if (v10 != (__int16)yy_chk[v50])
            {
              do
              {
                int v51 = (unsigned __int16)yy_def[v49];
                uint64_t v49 = (__int16)v51;
                uint64_t v50 = yy_base[(__int16)v51] + 1;
              }
              while (v51 != yy_chk[v50]);
            }
            uint64_t v63 = __libipsectext;
            if (v50)
            {
              int v52 = (unsigned __int16)yy_nxt[v50];
              if (v52 != 128)
              {
                LODWORD(v10) = (__int16)v52;
                yy_c_buf_p = ++v9;
                goto LABEL_14;
              }
            }
            continue;
          }
          if (yy_c_buf_p > (unint64_t)&v22[v20 + 1]) {
            yy_fatal_error("fatal flex scanner internal error--end of buffer missed");
          }
          uint64_t v15 = (char *)__libipsectext;
          if (!*(_DWORD *)(v19 + 60))
          {
            int v14 = 37;
            unint64_t v2 = 0x268290000;
            unint64_t v6 = yy_ec;
            if (yy_c_buf_p - __libipsectext == 1) {
              goto LABEL_24;
            }
            goto LABEL_80;
          }
          int v23 = ~__libipsectext + yy_c_buf_p;
          if (v23 >= 1)
          {
            int v24 = ~__libipsectext + yy_c_buf_p;
            do
            {
              char v25 = *v15++;
              *v22++ = v25;
              --v24;
            }
            while (v24);
            uint64_t v19 = *(void *)(v17 + 8 * v18);
          }
          uint64_t v64 = v23;
          if (*(_DWORD *)(v19 + 64) == 2)
          {
            yy_n_chars = 0;
            unint64_t v26 = 0x268290000;
            goto LABEL_37;
          }
          int v29 = ~v23;
          int v30 = *(_DWORD *)(v19 + 24);
          unsigned int v31 = v30 + ~v23;
          int v61 = v23;
          if (!v31)
          {
            do
            {
              if (!*(_DWORD *)(v19 + 40))
              {
                *(void *)(v19 + 8) = 0;
LABEL_132:
                yy_fatal_error("fatal error - scanner input buffer overflow");
              }
              unint64_t v32 = v0;
              size_t v33 = *(void **)(v19 + 8);
              int v34 = 2 * v30;
              *(_DWORD *)(v19 + 24) = v34;
              int v35 = (char *)malloc_type_realloc(v33, v34 + 2, 0x659923AFuLL);
              *(void *)(v19 + 8) = v35;
              if (!v35) {
                goto LABEL_132;
              }
              int v21 = &v35[(int)v21 - (int)v33];
              unint64_t v0 = v32;
              *(void *)(v32 + 1560) = v21;
              uint64_t v19 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
              int v30 = *(_DWORD *)(v19 + 24);
              unsigned int v31 = v30 + v29;
            }
            while (!(v30 + v29));
          }
          if (v31 >= 0x2000) {
            size_t v36 = 0x2000;
          }
          else {
            size_t v36 = v31;
          }
          unint64_t v26 = 0x268290000uLL;
          if (*(_DWORD *)(v19 + 44))
          {
            unint64_t v27 = 0;
            while (1)
            {
              int v37 = getc((FILE *)__libipsecin);
              if (v37 == -1 || v37 == 10) {
                break;
              }
              *(unsigned char *)(*(void *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8) + v64 + v27++) = v37;
              if (v36 == v27)
              {
                unint64_t v27 = v36;
                break;
              }
            }
            if (v37 == -1)
            {
              int v41 = ferror((FILE *)__libipsecin);
              unint64_t v7 = 0x268290000;
              unint64_t v8 = 0x268290000;
              if (v41) {
LABEL_135:
              }
                yy_fatal_error("input in flex scanner failed");
            }
            else
            {
              if (v37 == 10) {
                *(unsigned char *)(*(void *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8) + v64 + v27++) = 10;
              }
              unint64_t v7 = 0x268290000;
              unint64_t v8 = 0x268290000;
            }
            yy_n_chars = v27;
          }
          else
          {
            *__error() = 0;
            size_t v39 = fread((void *)(*(void *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8) + v61), 1uLL, v36, (FILE *)__libipsecin);
            unint64_t v27 = (int)v39;
            yy_n_chars = (int)v39;
            unint64_t v7 = 0x268290000;
            unint64_t v8 = 0x268290000;
            if (!(v39 << 32))
            {
              while (ferror((FILE *)__libipsecin))
              {
                if (*__error() != 4) {
                  goto LABEL_135;
                }
                *__error() = 0;
                clearerr((FILE *)__libipsecin);
                size_t v40 = fread((void *)(*(void *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8) + v64), 1uLL, v36, (FILE *)__libipsecin);
                unint64_t v27 = (int)v40;
                yy_n_chars = (int)v40;
                if (v40 << 32)
                {
                  unint64_t v7 = 0x268290000;
                  unint64_t v8 = 0x268290000;
                  goto LABEL_67;
                }
              }
              uint64_t v17 = yy_buffer_stack;
              uint64_t v18 = yy_buffer_stack_top;
              uint64_t v19 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
              unint64_t v7 = 0x268290000;
              unint64_t v8 = 0x268290000;
              int v23 = v61;
              unint64_t v1 = 0x268290000;
LABEL_37:
              *(void *)(v19 + 32) = 0;
              if (v23) {
                goto LABEL_38;
              }
              goto LABEL_70;
            }
          }
LABEL_67:
          uint64_t v17 = yy_buffer_stack;
          uint64_t v18 = yy_buffer_stack_top;
          uint64_t v19 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
          *(void *)(v19 + 32) = v27;
          if (v27)
          {
            int v28 = 0;
            int v23 = v61;
            unint64_t v1 = 0x268290000;
            goto LABEL_71;
          }
          int v23 = v61;
          unint64_t v1 = 0x268290000;
          if (v61)
          {
LABEL_38:
            unint64_t v27 = 0;
            int v28 = 2;
            *(_DWORD *)(v19 + 64) = 2;
            goto LABEL_71;
          }
LABEL_70:
          int v42 = v23;
          __libipsecrestart(*(FILE **)(v26 + 1424));
          int v23 = v42;
          unint64_t v8 = 0x268290000;
          unint64_t v7 = 0x268290000;
          unint64_t v27 = yy_n_chars;
          uint64_t v17 = yy_buffer_stack;
          uint64_t v18 = yy_buffer_stack_top;
          uint64_t v19 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
          int v28 = 1;
LABEL_71:
          unint64_t v43 = v27 + v23;
          if (v43 <= *(int *)(v19 + 24))
          {
            uint64_t v47 = *(void *)(v19 + 8);
            unint64_t v2 = 0x268290000;
            unint64_t v6 = yy_ec;
          }
          else
          {
            size_t v44 = v43 + (v27 >> 1);
            v45 = malloc_type_realloc(*(void **)(v19 + 8), v44, 0x659923AFuLL);
            uint64_t v17 = yy_buffer_stack;
            uint64_t v18 = yy_buffer_stack_top;
            *(void *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8) = v45;
            uint64_t v46 = *(void *)(v17 + 8 * v18);
            uint64_t v47 = *(void *)(v46 + 8);
            if (!v47) {
              yy_fatal_error("out of dynamic memory in yy_get_next_buffer()");
            }
            *(_DWORD *)(v46 + 24) = v44 - 2;
            unint64_t v43 = yy_n_chars + v64;
            unint64_t v2 = 0x268290000;
            unint64_t v6 = yy_ec;
            unint64_t v7 = 0x268290000;
            unint64_t v8 = 0x268290000;
          }
          yy_n_chars = v43;
          *(unsigned char *)(v47 + v43) = 0;
          *(unsigned char *)(v43 + *(void *)(*(void *)(v17 + 8 * v18) + 8) + 1) = 0;
          uint64_t v15 = *(char **)(*(void *)(v17 + 8 * v18) + 8);
          __libipsectext = (uint64_t)v15;
          int v14 = 37;
          unint64_t v0 = 0x268290000uLL;
          if (v28 == 1) {
            goto LABEL_24;
          }
          if (v28)
          {
            uint64_t v22 = *(unsigned char **)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8);
            uint64_t v20 = yy_n_chars;
LABEL_80:
            uint64_t v9 = (uint64_t)&v22[v20];
            yy_c_buf_p = (uint64_t)&v22[v20];
            LODWORD(v10) = yy_get_previous_state();
            unint64_t v8 = 0x268290000;
            unint64_t v7 = 0x268290000;
            unint64_t v6 = yy_ec;
            uint64_t v63 = __libipsectext;
            continue;
          }
          uint64_t v9 = (uint64_t)&v15[~v62 + (int)v9];
          yy_c_buf_p = v9;
          LODWORD(v10) = yy_get_previous_state();
          unint64_t v8 = 0x268290000;
          unint64_t v7 = 0x268290000;
          unint64_t v6 = yy_ec;
          uint64_t v63 = __libipsectext;
          break;
        case 37:
          return 0;
        default:
          yy_fatal_error("fatal flex scanner internal error--no action found");
      }
      break;
    }
  }
}

void *__libipsecensure_buffer_stack()
{
  caddr_t result = (void *)yy_buffer_stack;
  if (yy_buffer_stack)
  {
    if (yy_buffer_stack_top >= (unint64_t)(yy_buffer_stack_max - 1))
    {
      uint64_t v1 = yy_buffer_stack_max + 8;
      caddr_t result = malloc_type_realloc((void *)yy_buffer_stack, 8 * (yy_buffer_stack_max + 8), 0x659923AFuLL);
      yy_buffer_stack = (uint64_t)result;
      if (result)
      {
        unint64_t v2 = &result[yy_buffer_stack_max];
        *unint64_t v2 = 0u;
        v2[1] = 0u;
        v2[2] = 0u;
        v2[3] = 0u;
        yy_buffer_stack_max = v1;
        return result;
      }
LABEL_8:
      yy_fatal_error("out of dynamic memory in yyensure_buffer_stack()");
    }
  }
  else
  {
    caddr_t result = malloc_type_malloc(8uLL, 0x81795676uLL);
    yy_buffer_stack = (uint64_t)result;
    if (!result) {
      goto LABEL_8;
    }
    *caddr_t result = 0;
    yy_buffer_stack_max = 1;
    yy_buffer_stack_top = 0;
  }
  return result;
}

uint64_t __libipsec_create_buffer(FILE *a1, int a2)
{
  uint64_t v4 = malloc_type_malloc(0x48uLL, 0x81795676uLL);
  if (!v4
    || (uint64_t v5 = (uint64_t)v4, v4[6] = a2, v6 = malloc_type_malloc(a2 + 2, 0x81795676uLL), (*(void *)(v5 + 8) = v6) == 0))
  {
    yy_fatal_error("out of dynamic memory in yy_create_buffer()");
  }
  *(_DWORD *)(v5 + 40) = 1;
  __libipsec_init_buffer(v5, a1);
  return v5;
}

uint64_t yy_get_previous_state()
{
  uint64_t result = yy_start;
  uint64_t v1 = (unsigned char *)__libipsectext;
  if (__libipsectext < (unint64_t)yy_c_buf_p)
  {
    do
    {
      if (*v1) {
        uint64_t v2 = yy_ec[*v1];
      }
      else {
        uint64_t v2 = 1u;
      }
      if (yy_accept[(int)result])
      {
        yy_last_accepting_state = result;
        yy_last_accepting_cpos = (uint64_t)v1;
      }
      uint64_t v3 = (int)result;
      uint64_t v4 = yy_base[(int)result] + v2;
      if (result != (__int16)yy_chk[v4])
      {
        do
        {
          uint64_t v3 = yy_def[v3];
          if (v3 >= 129) {
            uint64_t v2 = *((unsigned __int8 *)&yy_meta + v2);
          }
          uint64_t v4 = yy_base[v3] + v2;
        }
        while (yy_chk[v4] != (unsigned __int16)v3);
      }
      uint64_t result = yy_nxt[v4];
      ++v1;
    }
    while (v1 != (unsigned char *)yy_c_buf_p);
  }
  return result;
}

void yy_fatal_error(const char *a1)
{
}

int *__libipsecrestart(FILE *a1)
{
  if (!yy_buffer_stack || (uint64_t buffer = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top)) == 0)
  {
    __libipsecensure_buffer_stack();
    uint64_t buffer = __libipsec_create_buffer((FILE *)__libipsecin, 0x4000);
    *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = buffer;
  }
  uint64_t result = __libipsec_init_buffer(buffer, a1);
  uint64_t v4 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
  uint64_t v5 = *(void *)(v4 + 32);
  yy_c_buf_p = *(void *)(v4 + 16);
  __libipsectext = yy_c_buf_p;
  unint64_t v6 = *(uint64_t **)(yy_buffer_stack + 8 * yy_buffer_stack_top);
  yy_n_chars = v5;
  __libipsecin = *v6;
  yy_hold_char = *(unsigned char *)yy_c_buf_p;
  return result;
}

int *__libipsec_init_buffer(uint64_t a1, FILE *a2)
{
  int v4 = *__error();
  __libipsec_flush_buffer(a1);
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 60) = 1;
  uint64_t v5 = yy_buffer_stack;
  if (yy_buffer_stack) {
    uint64_t v5 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
  }
  if (v5 != a1) {
    *(void *)(a1 + 52) = 1;
  }
  if (a2)
  {
    int v6 = fileno(a2);
    BOOL v7 = isatty(v6) > 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  *(_DWORD *)(a1 + 44) = v7;
  uint64_t result = __error();
  *uint64_t result = v4;
  return result;
}

void *__libipsec_switch_to_buffer(uint64_t a1)
{
  uint64_t result = __libipsecensure_buffer_stack();
  uint64_t v3 = yy_buffer_stack;
  if (yy_buffer_stack)
  {
    uint64_t v4 = yy_buffer_stack_top;
    uint64_t v5 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    if (v5 == a1) {
      return result;
    }
    if (v5)
    {
      uint64_t v6 = yy_c_buf_p;
      *(unsigned char *)yy_c_buf_p = yy_hold_char;
      *(void *)(*(void *)(v3 + 8 * v4) + 16) = v6;
      *(void *)(*(void *)(v3 + 8 * v4) + 32) = yy_n_chars;
    }
  }
  else
  {
    if (!a1) {
      return result;
    }
    uint64_t v4 = yy_buffer_stack_top;
  }
  *(void *)(v3 + 8 * v4) = a1;
  yy_n_chars = *(void *)(a1 + 32);
  yy_c_buf_p = *(void *)(a1 + 16);
  __libipsectext = yy_c_buf_p;
  __libipsecin = **(void **)(v3 + 8 * v4);
  yy_hold_char = *(unsigned char *)yy_c_buf_p;
  return result;
}

void *__libipsecalloc(size_t a1)
{
  return malloc_type_malloc(a1, 0x81795676uLL);
}

void __libipsec_delete_buffer(void **a1)
{
  if (a1)
  {
    if (yy_buffer_stack) {
      uint64_t v2 = *(void ***)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    }
    else {
      uint64_t v2 = 0;
    }
    if (v2 == a1) {
      *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = 0;
    }
    if (*((_DWORD *)a1 + 10)) {
      free(a1[1]);
    }
    free(a1);
  }
}

uint64_t __libipsec_flush_buffer(uint64_t result)
{
  if (result)
  {
    *(void *)(result + 32) = 0;
    **(unsigned char **)(result + 8) = 0;
    *(unsigned char *)(*(void *)(result + 8) + 1) = 0;
    *(void *)(result + 16) = *(void *)(result + 8);
    *(_DWORD *)(result + 48) = 1;
    *(_DWORD *)(result + 64) = 0;
    if (yy_buffer_stack) {
      uint64_t v1 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    }
    else {
      uint64_t v1 = 0;
    }
    if (v1 == result)
    {
      uint64_t v2 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
      yy_n_chars = *(void *)(v2 + 32);
      yy_c_buf_p = *(void *)(v2 + 16);
      __libipsectext = yy_c_buf_p;
      __libipsecin = **(void **)(yy_buffer_stack + 8 * yy_buffer_stack_top);
      yy_hold_char = *(unsigned char *)yy_c_buf_p;
    }
  }
  return result;
}

void *__libipsecpush_buffer_state(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = __libipsecensure_buffer_stack();
    uint64_t v2 = yy_buffer_stack;
    uint64_t v3 = yy_buffer_stack_top;
    if (yy_buffer_stack)
    {
      if (*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top))
      {
        uint64_t v4 = yy_c_buf_p;
        *(unsigned char *)yy_c_buf_p = yy_hold_char;
        *(void *)(*(void *)(v2 + 8 * v3) + 16) = v4;
        *(void *)(*(void *)(v2 + 8 * v3++) + 32) = yy_n_chars;
        yy_buffer_stack_top = v3;
      }
    }
    *(void *)(v2 + 8 * v3) = v1;
    uint64_t v5 = v1[4];
    yy_c_buf_p = v1[2];
    __libipsectext = yy_c_buf_p;
    uint64_t v6 = *(uint64_t **)(v2 + 8 * v3);
    yy_n_chars = v5;
    __libipsecin = *v6;
    yy_hold_char = *(unsigned char *)yy_c_buf_p;
  }
  return result;
}

void __libipsecpop_buffer_state()
{
  if (yy_buffer_stack)
  {
    unint64_t v0 = *(void ***)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    if (v0)
    {
      __libipsec_delete_buffer(v0);
      uint64_t v1 = yy_buffer_stack;
      uint64_t v2 = yy_buffer_stack_top;
      *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = 0;
      if (v2)
      {
        uint64_t v3 = v2 - 1;
        yy_buffer_stack_top = v3;
        uint64_t v4 = *(void *)(v1 + 8 * v3);
        if (v4)
        {
          yy_n_chars = *(void *)(v4 + 32);
          yy_c_buf_p = *(void *)(v4 + 16);
          __libipsectext = yy_c_buf_p;
          __libipsecin = **(void **)(v1 + 8 * v3);
          yy_hold_char = *(unsigned char *)yy_c_buf_p;
        }
      }
    }
  }
}

char *__libipsec_scan_buffer(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2 - 2;
  if (a2 < 2 || *(unsigned char *)(a1 + v2) || *(unsigned char *)(a2 + a1 - 1)) {
    return 0;
  }
  uint64_t v6 = (char *)malloc_type_malloc(0x48uLL, 0x81795676uLL);
  if (!v6) {
    yy_fatal_error("out of dynamic memory in yy_scan_buffer()");
  }
  uint64_t v4 = v6;
  *((_DWORD *)v6 + 6) = v2;
  *((void *)v6 + 1) = a1;
  *((void *)v6 + 2) = a1;
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 4) = (int)v2;
  *((void *)v6 + 5) = 0;
  *((_DWORD *)v6 + 12) = 1;
  *(void *)(v6 + 60) = 0;
  __libipsec_switch_to_buffer((uint64_t)v6);
  return v4;
}

char *__libipsec_scan_string(char *a1)
{
  uint64_t v2 = (int)strlen(a1);

  return __libipsec_scan_bytes(a1, v2);
}

char *__libipsec_scan_bytes(char *a1, uint64_t a2)
{
  unint64_t v4 = a2 + 2;
  uint64_t v5 = malloc_type_malloc(a2 + 2, 0x81795676uLL);
  if (!v5) {
    yy_fatal_error("out of dynamic memory in yy_scan_bytes()");
  }
  if (a2)
  {
    uint64_t v6 = v5;
    uint64_t v7 = a2;
    do
    {
      char v8 = *a1++;
      *v6++ = v8;
      --v7;
    }
    while (v7);
  }
  *(_WORD *)&v5[a2] = 0;
  uint64_t result = __libipsec_scan_buffer((uint64_t)v5, v4);
  if (!result) {
    yy_fatal_error("bad buffer in yy_scan_bytes()");
  }
  *((_DWORD *)result + 10) = 1;
  return result;
}

uint64_t __libipsecget_lineno()
{
  return __libipseclineno;
}

uint64_t __libipsecget_in()
{
  return __libipsecin;
}

uint64_t __libipsecget_out()
{
  return __libipsecout;
}

uint64_t __libipsecget_leng()
{
  return __libipsecleng;
}

uint64_t __libipsecget_text()
{
  return __libipsectext;
}

uint64_t __libipsecset_lineno(uint64_t result)
{
  __libipseclineno = result;
  return result;
}

uint64_t __libipsecset_in(uint64_t result)
{
  __libipsecin = result;
  return result;
}

uint64_t __libipsecset_out(uint64_t result)
{
  __libipsecout = result;
  return result;
}

uint64_t __libipsecget_debug()
{
  return __libipsec_flex_debug;
}

uint64_t __libipsecset_debug(uint64_t result)
{
  __libipsec_flex_debug = result;
  return result;
}

uint64_t __libipseclex_destroy()
{
  for (i = (void *)yy_buffer_stack; yy_buffer_stack; i = (void *)yy_buffer_stack)
  {
    if (!i[yy_buffer_stack_top]) {
      break;
    }
    __libipsec_delete_buffer((void **)i[yy_buffer_stack_top]);
    *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = 0;
    __libipsecpop_buffer_state();
  }
  free(i);
  yy_buffer_stack = 0;
  yy_buffer_stack_top = 0;
  yy_buffer_stack_max = 0;
  yy_c_buf_p = 0;
  yy_init = 0;
  yy_start = 0;
  __libipsecin = 0;
  __libipsecout = 0;
  return 0;
}

void *__libipsecrealloc(void *a1, size_t a2)
{
  return malloc_type_realloc(a1, a2, 0x659923AFuLL);
}

void *__policy__strbuffer__init__(char *__s)
{
  if (yy_buffer_stack)
  {
    uint64_t v2 = *(void ***)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    if (v2) {
      __libipsec_delete_buffer(v2);
    }
  }
  int v3 = strlen(__s);
  unint64_t v4 = __libipsec_scan_bytes(__s, v3);
  struint64_t buffer = (uint64_t)v4;

  return __libipsec_switch_to_buffer((uint64_t)v4);
}

void __policy__strbuffer__free__()
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x270ED86F0](a1);
}

void clearerr(FILE *a1)
{
}

void exit(int a1)
{
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x270ED9B90](*(void *)&a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x270ED9B98](a1, a2, a3, a4);
}

int getc(FILE *a1)
{
  return MEMORY[0x270ED9BC0](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x270ED9CA8](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}