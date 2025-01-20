uint64_t sub_100002D10()
{
  const char *v0;
  int v1;
  const char *v2;
  char **v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  const char *v8;
  const char *v9;
  char *v10;
  uint64_t __key;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  long long v17;

  v0 = off_10000C000[0];
  if (*off_10000C000[0])
  {
    v1 = 0;
    v2 = "";
    v3 = off_10000C058;
    do
    {
      v4 = strlen(v0);
      v5 = (uint64_t)*(v3 - 9);
      if (!v5
        || (v16 = 0u,
            v17 = 0u,
            v14 = 0u,
            v15 = 0u,
            v13 = 0u,
            __key = v5,
            bsearch(&__key, off_10000C000, 0x59uLL, 0x58uLL, (int (__cdecl *)(const void *, const void *))sub_100002E3C)))
      {
        v6 = v1 + v4 + 1;
        if (v6 <= dword_10000E128) {
          v7 = v1 + v4 + 1;
        }
        else {
          v7 = v4;
        }
        if (v6 <= dword_10000E128) {
          v8 = v2;
        }
        else {
          v8 = "\n";
        }
        if (dword_10000E128)
        {
          v1 = v7;
          v9 = v8;
        }
        else
        {
          v9 = v2;
        }
        printf("%s%s", v9, v0);
        v2 = " ";
      }
      v10 = *v3;
      v3 += 11;
      v0 = v10;
    }
    while (*v10);
  }
  return putchar(10);
}

uint64_t sub_100002E3C(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

void sub_100002E48(const char *a1, uint64_t a2)
{
  v3 = strdup(a1);
  v4 = v3;
  __stringp = v3;
  if (v3)
  {
    v5 = v3;
    do
    {
      if (!*v5) {
        break;
      }
      __s1 = 0;
      while (1)
      {
        v6 = strsep(&__stringp, " \t,\n");
        if (!v6) {
          break;
        }
        if (*v6)
        {
          v7 = sub_100002FA4(v6, a2, (const char **)&__s1);
          if (v7)
          {
            v8 = v7;
            if (a2 || !sub_100006AC8(v7))
            {
              v9 = malloc_type_malloc(0x18uLL, 0x70040305B5C43uLL);
              if (!v9) {
                sub_100007098();
              }
              v10 = v9;
              v9[1] = v8[1];
              if (__s1)
              {
                v11 = strdup(__s1);
                __s1 = v11;
                if (v11) {
                  v10[1] = v11;
                }
              }
              v12 = malloc_type_malloc(0x58uLL, 0x10D0040E0FCBBA0uLL);
              v10[2] = v12;
              if (!v12) {
                sub_100007098();
              }
              long long v13 = *((_OWORD *)v8 + 1);
              _OWORD *v12 = *(_OWORD *)v8;
              v12[1] = v13;
              long long v14 = *((_OWORD *)v8 + 2);
              long long v15 = *((_OWORD *)v8 + 3);
              long long v16 = *((_OWORD *)v8 + 4);
              *((void *)v12 + 10) = v8[10];
              v12[3] = v15;
              v12[4] = v16;
              v12[2] = v14;
              void *v10 = 0;
              *off_10000DEC8 = v10;
              off_10000DEC8 = (_UNKNOWN **)v10;
            }
          }
          break;
        }
      }
      v5 = __stringp;
    }
    while (__stringp);
  }
  free(v4);
  if (!off_10000DEC0) {
    sub_100007074();
  }
}

const char **sub_100002FA4(char *a1, uint64_t a2, const char **a3)
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  v6 = strchr(a1, 61);
  v7 = v6;
  if (v6)
  {
    char *v6 = 0;
    v7 = v6 + 1;
  }
  __key = a1;
  v8 = (const char **)bsearch(&__key, off_10000C000, 0x59uLL, 0x58uLL, (int (__cdecl *)(const void *, const void *))sub_100002E3C);
  v9 = v8;
  if (v8)
  {
    v10 = v8[2];
    if (v10)
    {
      if (v7)
      {
        size_t v11 = strlen(v10);
        size_t v12 = v11 + strlen(v7) + 2;
        long long v13 = (char *)malloc_type_malloc(v12, 0x4295190FuLL);
        snprintf(v13, v12, "%s=%s", v9[2], v7);
        v10 = v13;
      }
      sub_100002E48(v10, a2);
      return 0;
    }
  }
  else
  {
    warnx("%s: keyword not found", a1);
    dword_10000E138 = 1;
  }
  if (a3) {
    *a3 = v7;
  }
  return v9;
}

uint64_t sub_1000030CC()
{
  *(void *)v3 = 0x1800000006;
  size_t v2 = 8;
  int v0 = sysctl(v3, 2u, &qword_10000E100, &v2, 0, 0);
  uint64_t result = 1;
  if (v0 != -1)
  {
    dword_10000E108 = 100;
    dword_10000E10C = 1;
    return 0;
  }
  return result;
}

void sub_100003170()
{
  int v0 = &off_10000DEC0;
  while (1)
  {
    int v0 = (_UNKNOWN **)*v0;
    if (!v0) {
      break;
    }
    if (*(unsigned char *)v0[1])
    {
      v1 = off_10000DEC0;
      if (off_10000DEC0)
      {
        do
        {
          if ((*(unsigned char *)(v1[2] + 24) & 2) != 0)
          {
            if (*v1) {
              printf("%-*s");
            }
            else {
              printf("%s");
            }
          }
          else
          {
            printf("%*s");
          }
          if (!*v1) {
            break;
          }
          putchar(32);
          v1 = (void *)*v1;
        }
        while (v1);
      }
      putchar(10);
      return;
    }
  }
}

char *sub_100003268(uint64_t a1, int a2, int a3)
{
  if (dword_10000E114)
  {
    if (!dword_10000E11C || dword_10000E118 != 0)
    {
      return strdup("");
    }
  }
  v34 = 0;
  if (*(unsigned char *)(*(void *)a1 + 36) == 5)
  {
    int v8 = asprintf(&v34, "<defunct>");
  }
  else
  {
    size[0] = 0;
    *(void *)&size[1] = 0x800000001;
    size_t v35 = 4;
    if (sysctl(&size[1], 2u, size, &v35, 0, 0) != -1)
    {
      v9 = malloc_type_malloc(size[0], 0xFF147BABuLL);
      if (v9)
      {
        v10 = v9;
        *(void *)&size[1] = 0x3100000001;
        size[3] = *(_DWORD *)(*(void *)a1 + 40);
        size_t v35 = size[0];
        if (sysctl(&size[1], 3u, v9, &v35, 0, 0) != -1)
        {
          size_t v12 = (const char *)(v10 + 1);
          int v11 = *v10;
          size_t v13 = v35;
          long long v14 = (char *)v10 + v35;
          if ((uint64_t)v35 >= 5)
          {
            do
            {
              if (!*v12) {
                break;
              }
              ++v12;
            }
            while (v12 < v14);
          }
          if (v12 != v14)
          {
            if (v12 < v14)
            {
              int64_t v15 = (char *)v10 + v35 - v12;
              while (!*v12)
              {
                ++v12;
                if (!--v15)
                {
                  size_t v12 = (char *)v10 + v35;
                  break;
                }
              }
            }
            if (v12 != v14)
            {
              long long v16 = 0;
              int v17 = 0;
              long long v18 = v12;
              if (v11 >= 1 && v12 < v14)
              {
                uint64_t v19 = 0;
                int v17 = 0;
                long long v16 = 0;
                int v20 = 0;
                while (1)
                {
                  if (!v12[v19])
                  {
                    if (v16)
                    {
                      *long long v16 = 32;
                      if (!a3) {
                        goto LABEL_52;
                      }
                    }
                    else
                    {
                      int v17 = v19;
                      if (!a3)
                      {
LABEL_52:
                        long long v16 = (char *)&v12[v19];
                        goto LABEL_54;
                      }
                    }
                    ++v20;
                    size_t v13 = v35;
                    long long v16 = (char *)&v12[v19];
                  }
                  ++v19;
                  if (v20 >= v11 || &v12[v19] >= (const char *)v10 + v13)
                  {
                    long long v18 = &v12[v19];
                    break;
                  }
                }
              }
              if (a3 && dword_10000E110)
              {
                if (getuid())
                {
                  int v21 = *(_DWORD *)(*(void *)a1 + 392);
                  uid_t v22 = getuid();
                  size_t v23 = v35;
                  if (v21 == v22 && v18 < (const char *)v10 + v35)
                  {
                    do
                    {
LABEL_46:
                      v25 = v16;
                      if (!*v18)
                      {
                        long long v16 = (char *)v18;
                        if (v25)
                        {
                          if (v18 == v25 + 1)
                          {
                            long long v16 = v25;
                            break;
                          }
                          char *v25 = 32;
                          size_t v23 = v35;
                          long long v16 = (char *)v18;
                        }
                      }
                      ++v18;
                    }
                    while (v18 < (const char *)v10 + v23);
                  }
                }
                else
                {
                  size_t v23 = v35;
                  if (v18 < (const char *)v10 + v35) {
                    goto LABEL_46;
                  }
                }
              }
LABEL_54:
              if (v16 && v16 != v12)
              {
                int v26 = asprintf(&v34, "%s", v12);
                free(v10);
                goto LABEL_60;
              }
            }
          }
        }
        free(v10);
      }
    }
    int v8 = asprintf(&v34, "(%s)");
  }
  int v26 = v8;
  int v17 = v8;
LABEL_60:
  if (dword_10000E130)
  {
    v27 = &v34[v26 - 1];
    if (v26 >= 2)
    {
      while (*v27 != 47)
      {
        if (--v27 <= v34) {
          goto LABEL_66;
        }
      }
      ++v27;
      if (a2) {
        goto LABEL_70;
      }
      goto LABEL_67;
    }
  }
  else
  {
    v27 = v34;
  }
LABEL_66:
  if (!a2)
  {
LABEL_67:
    v28 = &v27[v17];
    int v30 = *v28;
    v29 = v28 + 1;
    if (v30) {
      v27 = v29;
    }
    else {
      v27 += v17;
    }
  }
LABEL_70:
  size_t v31 = strlen(v27);
  v32 = (char *)malloc_type_malloc((4 * v31) | 1, 0x6DFF631DuLL);
  if (!v32) {
    sub_1000070B4();
  }
  v33 = v32;
  strvis(v32, v27, 88);
  free(v34);
  return v33;
}

void sub_1000036A0(uint64_t a1, void *a2, int a3, int a4, int a5)
{
  uint64_t v7 = a2[2];
  int v8 = sub_100003268(a1, a3, a4);
  v9 = v8;
  if (*a2)
  {
    printf("%-*.*s", *(__int16 *)(v7 + 48), *(__int16 *)(v7 + 48), v8);
  }
  else if (dword_10000E128)
  {
    int v10 = *(__int16 *)(v7 + 48) - dword_10000E13C + dword_10000E128;
    if (v10 < 1 || a5 != 0) {
      int v10 = *(__int16 *)(v7 + 48);
    }
    if (v10 >= 1)
    {
      int v12 = v10 + 1;
      size_t v13 = v8;
      do
      {
        int v14 = *v13;
        if (!*v13) {
          break;
        }
        ++v13;
        putchar(v14);
        --v12;
      }
      while (v12 > 1);
    }
  }
  else
  {
    fputs(v8, __stdoutp);
  }

  free(v9);
}

size_t sub_100003798(uint64_t a1)
{
  v1 = sub_100003268(a1, 1, dword_10000E130 == 0);
  size_t v2 = strlen(v1);
  free(v1);
  return v2;
}

size_t sub_1000037E8(uint64_t a1)
{
  v1 = sub_100003268(a1, 1, 1);
  size_t v2 = strlen(v1);
  free(v1);
  return v2;
}

size_t sub_100003828(uint64_t a1)
{
  v1 = sub_100003268(a1, 1, 0);
  size_t v2 = strlen(v1);
  free(v1);
  return v2;
}

void sub_100003868(uint64_t a1, void *a2)
{
  sub_1000036A0(a1, a2, 1, dword_10000E130 == 0, 0);
}

void sub_100003888(uint64_t a1, void *a2)
{
}

void sub_100003898(uint64_t a1, void *a2)
{
}

uint64_t sub_1000038A8(uint64_t a1, uint64_t a2)
{
  return printf("%-*s", *(__int16 *)(*(void *)(a2 + 16) + 48), (const char *)(*(void *)a1 + 243));
}

uint64_t sub_1000038E4(uint64_t a1, uint64_t a2)
{
  int v2 = *(__int16 *)(*(void *)(a2 + 16) + 48);
  v3 = getpwuid(*(__int16 *)(*(void *)a1 + 420));
  if (v3) {
    pw_name = v3->pw_name;
  }
  else {
    pw_name = "UNKNOWN";
  }
  if (!*pw_name) {
    pw_name = "-";
  }
  return printf("%-*s", v2, pw_name);
}

uint64_t sub_100003954(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!dword_10000E114)
  {
    uint64_t v4 = *a1;
    int v5 = *(char *)(*a1 + 36);
    if (v5 == 5)
    {
      char v6 = 90;
    }
    else if (v5 == 4)
    {
      char v6 = 84;
    }
    else
    {
      char v6 = aRusith[*((int *)a1 + 85)];
    }
    char v14 = v6;
    int v9 = *(_DWORD *)(v4 + 32);
    int v10 = *(char *)(v4 + 242);
    if (v10 < 0)
    {
      char v11 = 60;
    }
    else
    {
      if (!v10)
      {
        int v12 = &v15;
        if ((v9 & 0x800) == 0)
        {
LABEL_16:
          if ((v9 & 0x2000) != 0 && v5 != 5) {
            *v12++ = 69;
          }
          if ((v9 & 0x10) != 0) {
            *v12++ = 86;
          }
          if ((v9 & 0x200) != 0) {
            *v12++ = 76;
          }
          if ((*(unsigned char *)(*a1 + 612) & 2) != 0) {
            *v12++ = 115;
          }
          if ((v9 & 2) != 0 && *(_DWORD *)(*a1 + 564) == *(_DWORD *)(*a1 + 576)) {
            *v12++ = 43;
          }
          char *v12 = 0;
          goto LABEL_29;
        }
LABEL_15:
        *v12++ = 88;
        goto LABEL_16;
      }
      char v11 = 78;
    }
    int v12 = v16;
    char v15 = v11;
    if ((v9 & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (dword_10000E11C)
  {
    uint64_t v3 = a1[57] + 60 * dword_10000E118;
    char v14 = aRusith[(int)sub_100006B88(*(unsigned int *)(v3 + 24), *(unsigned int *)(v3 + 36))];
    char v15 = 0;
LABEL_29:
    int v7 = *(__int16 *)(v2 + 48);
    int v8 = &v14;
    return printf("%-*s", v7, v8);
  }
  int v7 = *(__int16 *)(v2 + 48);
  int v8 = " ";
  return printf("%-*s", v7, v8);
}

uint64_t sub_100003B10()
{
  if (dword_10000E114 && dword_10000E11C) {
    return printf("%*d%c");
  }
  else {
    return printf("%*d");
  }
}

uint64_t sub_100003C10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (dword_10000E114)
  {
    if (!dword_10000E11C || dword_10000E118 != 0) {
      return printf("%-*s", *(__int16 *)(v2 + 48), " ");
    }
  }
  int v5 = *(__int16 *)(v2 + 48);
  char v6 = user_from_uid(*(_DWORD *)(*(void *)a1 + 420), 0);
  return printf("%-*s", v5, v6);
}

size_t sub_100003CA4(uint64_t a1)
{
  v1 = user_from_uid(*(_DWORD *)(*(void *)a1 + 420), 0);
  return strlen(v1);
}

uint64_t sub_100003CCC(uint64_t a1, uint64_t a2)
{
  int v2 = *(__int16 *)(*(void *)(a2 + 16) + 48);
  uint64_t v3 = user_from_uid(*(_DWORD *)(*(void *)a1 + 392), 0);
  return printf("%-*s", v2, v3);
}

size_t sub_100003D18(uint64_t a1)
{
  v1 = user_from_uid(*(_DWORD *)(*(void *)a1 + 392), 0);
  return strlen(v1);
}

uint64_t sub_100003D40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  unsigned int v3 = *(_DWORD *)(*(void *)a1 + 572);
  if (v3 == -1) {
    return printf("%*s", *(__int16 *)(v2 + 48), "??");
  }
  snprintf(__str, 0x10uLL, "%d/%d", HIBYTE(v3), v3 & 0xFFFFFF);
  return printf("%*s", *(__int16 *)(v2 + 48), __str);
}

uint64_t sub_100003DF4(uint64_t a1)
{
  if (dword_10000E114)
  {
    if (!dword_10000E11C || dword_10000E118 != 0) {
      return printf("%*s ");
    }
  }
  dev_t v2 = *(_DWORD *)(*(void *)a1 + 572);
  if (v2 == -1) {
    return printf("%*s ");
  }
  unsigned int v3 = devname(v2, 0x2000u);
  if (!v3) {
    return printf("%*s ");
  }
  uint64_t v4 = v3;
  if (strncmp(v3, "tty", 3uLL)) {
    strncmp(v4, "cua", 3uLL);
  }
  return printf("%*.*s%c");
}

uint64_t sub_100003F14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  dev_t v3 = *(_DWORD *)(*(void *)a1 + 572);
  uint64_t v4 = "??";
  if (v3 != -1)
  {
    int v5 = devname(v3, 0x2000u);
    if (v5) {
      uint64_t v4 = v5;
    }
  }
  return printf("%-*s", *(__int16 *)(v2 + 48), v4);
}

uint64_t sub_100003F78(time_t **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (dword_10000DE98 < 0) {
    dword_10000DE98 = *nl_langinfo(4) != 0;
  }
  time_t v11 = **a1;
  uint64_t v4 = localtime(&v11);
  uint64_t v5 = qword_10000E120 - **a1;
  if (v5 > 86399)
  {
    if ((unint64_t)v5 > 0x93A7F)
    {
      int v9 = "%e%b%y";
      goto LABEL_11;
    }
    int v6 = dword_10000DE98;
    int v7 = "%a%I%p";
    int v8 = "%a%H  ";
  }
  else
  {
    int v6 = dword_10000DE98;
    int v7 = "%l:%M%p";
    int v8 = "%k:%M  ";
  }
  if (v6) {
    int v9 = v7;
  }
  else {
    int v9 = v8;
  }
LABEL_11:
  strftime(v12, 0x64uLL, v9, v4);
  return printf("%-*s", *(__int16 *)(v3 + 48), v12);
}

uint64_t sub_1000040B0(time_t **a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  time_t v5 = **a1;
  uint64_t v3 = localtime(&v5);
  strftime(v6, 0x63uLL, "%c", v3);
  return printf("%-*s", *(__int16 *)(v2 + 48), v6);
}

char *sub_100004148(void **a1)
{
  v5.tv_sec = 0;
  *(void *)&v5.tv_usec = 0;
  gettimeofday(&v5, 0);
  __darwin_time_t v2 = v5.tv_sec - **a1;
  uint64_t v4 = 0;
  if (v2 < 8640001)
  {
    if (v2 <= 86400)
    {
      if (v2 < 3601) {
        asprintf(&v4, "%02ld:%02ld");
      }
      else {
        asprintf(&v4, "%02ld:%02ld:%02ld");
      }
    }
    else
    {
      asprintf(&v4, "%02ld-%02ld:%02ld:%02ld");
    }
  }
  else
  {
    asprintf(&v4, "%ld-%02ld:%02ld:%02ld");
  }
  return v4;
}

void sub_100004348(void **a1, uint64_t a2)
{
  uint64_t v3 = sub_100004148(a1);
  printf("%*s", *(__int16 *)(*(void *)(a2 + 16) + 48), v3);

  free(v3);
}

size_t sub_1000043A4(void **a1)
{
  v1 = sub_100004148(a1);
  size_t v2 = strlen(v1);
  free(v1);
  return v2;
}

uint64_t sub_1000043DC(uint64_t a1)
{
  if (!*(void *)(*(void *)a1 + 96)) {
    return printf("%-*s");
  }
  if (*(void *)(*(void *)a1 + 104)) {
    return printf("%-*.*s");
  }
  return printf("%-*lx");
}

uint64_t sub_100004458(uint64_t a1, uint64_t a2)
{
  return printf("%*lu", *(__int16 *)(*(void *)(a2 + 16) + 48), *(void *)(a1 + 364) >> 10);
}

uint64_t sub_100004498(uint64_t a1, uint64_t a2)
{
  return printf("%*lu", *(__int16 *)(*(void *)(a2 + 16) + 48), *(void *)(a1 + 372) >> 10);
}

uint64_t sub_1000044D8(_DWORD *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  int v3 = a1[101] + a1[96];
  BOOL v4 = v3 <= 999999;
  if (v3 > 999999) {
    v3 -= 1000000;
  }
  int v5 = a1[103] + a1[98];
  int v6 = a1[97] + a1[95] + a1[100];
  if (!v4) {
    ++v6;
  }
  if (v5 <= 999999) {
    int v7 = a1[103] + a1[98];
  }
  else {
    int v7 = v5 - 1000000;
  }
  int v8 = v7 + v3;
  int v9 = v6 + a1[102];
  if (v5 > 999999) {
    ++v9;
  }
  if (v8 > 999999)
  {
    ++v9;
    v8 -= 1000000;
  }
  snprintf(__str, 0x80uLL, "%3ld:%02ld.%02ld", ((v8 + 5000) / 1000000 + v9) / 60, ((v8 + 5000) / 1000000 + v9) % 60, (v8 + 5000) / 10000 % 100);
  return printf("%*s", *(__int16 *)(v2 + 48), __str);
}

uint64_t sub_100004660(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (dword_10000E114)
  {
    int v3 = dword_10000E11C;
    if (dword_10000E11C)
    {
      BOOL v4 = (int *)(*(void *)(a1 + 456) + 60 * dword_10000E118);
      int v3 = *v4;
      int v5 = v4[1];
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = *(_DWORD *)(a1 + 404) + *(_DWORD *)(a1 + 384);
    int v3 = *(_DWORD *)(a1 + 400) + *(_DWORD *)(a1 + 380);
    if (v5 >= 1000000)
    {
      ++v3;
      v5 -= 1000000;
    }
  }
  snprintf(__str, 0x80uLL, "%3ld:%02ld.%02ld", ((v5 + 5000) / 1000000 + v3) / 60, ((v5 + 5000) / 1000000 + v3) % 60, (v5 + 5000) / 10000 % 100);
  return printf("%*s", *(__int16 *)(v2 + 48), __str);
}

uint64_t sub_1000047EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (dword_10000E114)
  {
    int v3 = dword_10000E11C;
    if (dword_10000E11C)
    {
      uint64_t v4 = *(void *)(a1 + 456) + 60 * dword_10000E118;
      int v3 = *(_DWORD *)(v4 + 8);
      int v5 = *(_DWORD *)(v4 + 12);
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = *(_DWORD *)(a1 + 412) + *(_DWORD *)(a1 + 392);
    int v3 = *(_DWORD *)(a1 + 408) + *(_DWORD *)(a1 + 388);
    if (v5 >= 1000000)
    {
      ++v3;
      v5 -= 1000000;
    }
  }
  snprintf(__str, 0x80uLL, "%3ld:%02ld.%02ld", ((v5 + 5000) / 1000000 + v3) / 60, ((v5 + 5000) / 1000000 + v3) % 60, (v5 + 5000) / 10000 % 100);
  return printf("%*s", *(__int16 *)(v2 + 48), __str);
}

uint64_t sub_100004978(uint64_t a1)
{
  return *(unsigned int *)(a1 + 344);
}

uint64_t sub_100004980(uint64_t a1, uint64_t a2)
{
  if (dword_10000E114)
  {
    int v2 = dword_10000E11C;
    if (dword_10000E11C) {
      int v2 = *(_DWORD *)(*(void *)(a1 + 456) + 60 * dword_10000E118 + 16);
    }
  }
  else
  {
    int v2 = *(_DWORD *)(a1 + 344);
  }
  return printf("%*.1f", *(__int16 *)(*(void *)(a2 + 16) + 48), (double)v2 * 100.0 / 1000.0);
}

double sub_100004A18(uint64_t a1)
{
  if (dword_10000E10C)
  {
    int v2 = dword_10000E140;
  }
  else
  {
    int v2 = sub_1000030CC();
    dword_10000E140 = v2;
  }
  double result = 0.0;
  if (!v2) {
    return (float)*(unint64_t *)(a1 + 372) / (double)(unint64_t)qword_10000E100 * 100.0;
  }
  return result;
}

uint64_t sub_100004A98(uint64_t a1, uint64_t a2)
{
  int v2 = *(__int16 *)(*(void *)(a2 + 16) + 48);
  double v3 = sub_100004A18(a1);
  return printf("%*.1f", v2, v3);
}

uint64_t sub_100004ADC(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 313)) {
    uint64_t v2 = *(void *)(a1 + 96);
  }
  else {
    uint64_t v2 = 0;
  }
  return printf("%*ld", *(__int16 *)(*(void *)(a2 + 16) + 48), v2);
}

uint64_t sub_100004B24(uint64_t a1, uint64_t a2)
{
  return printf("%*s", *(__int16 *)(*(void *)(a2 + 16) + 48), "-");
}

uint64_t sub_100004B60(uint64_t a1, uint64_t a2)
{
  return printf("%*ld", *(__int16 *)(*(void *)(a2 + 16) + 48), 0);
}

uint64_t sub_100004B94(void *a1, uint64_t a2)
{
  return sub_100004BA8((unsigned __int8 *)(*a1 + *(void *)(*(void *)(a2 + 16) + 56)), *(void *)(a2 + 16));
}

uint64_t sub_100004BA8(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned __int8 **)(a2 + 72);
  int v5 = &byte_10000DE9D;
  if ((*(unsigned char *)(a2 + 24) & 2) != 0)
  {
    byte_10000DE9D = 45;
    int v5 = &byte_10000DE9E;
  }
  char *v5 = 42;
  int v6 = v5 + 1;
  do
  {
    int v7 = *v4++;
    *v6++ = v7;
  }
  while (v7);
  switch(*(_DWORD *)(a2 + 64))
  {
    case 0:
      int v8 = fmtcheck(asc_10000DE9C, "%*hhd");
      uint64_t v9 = *(__int16 *)(a2 + 48);
      uint64_t v10 = (char)*a1;
      return printf(v8, v9, v10);
    case 1:
      int v8 = fmtcheck(asc_10000DE9C, "%*hhu");
      uint64_t v9 = *(__int16 *)(a2 + 48);
      uint64_t v10 = *a1;
      return printf(v8, v9, v10);
    case 2:
      int v8 = fmtcheck(asc_10000DE9C, "%*hd");
      uint64_t v9 = *(__int16 *)(a2 + 48);
      uint64_t v10 = *(__int16 *)a1;
      return printf(v8, v9, v10);
    case 3:
      int v8 = fmtcheck(asc_10000DE9C, "%*hu");
      uint64_t v9 = *(__int16 *)(a2 + 48);
      uint64_t v10 = *(unsigned __int16 *)a1;
      return printf(v8, v9, v10);
    case 4:
      time_t v11 = "%*d";
      goto LABEL_12;
    case 5:
      time_t v11 = "%*u";
LABEL_12:
      int v8 = fmtcheck(asc_10000DE9C, v11);
      uint64_t v9 = *(__int16 *)(a2 + 48);
      uint64_t v10 = *(unsigned int *)a1;
      return printf(v8, v9, v10);
    case 6:
      int v12 = "%*ld";
      goto LABEL_16;
    case 7:
      int v12 = "%*lu";
      goto LABEL_16;
    case 8:
      int v12 = "%*lx";
LABEL_16:
      int v8 = fmtcheck(asc_10000DE9C, v12);
      uint64_t v9 = *(__int16 *)(a2 + 48);
      uint64_t v10 = *(void *)a1;
      return printf(v8, v9, v10);
    default:
      errx(1, "unknown type %d", *(_DWORD *)(a2 + 64));
  }
}

uint64_t sub_100004D68(void *a1, uint64_t a2)
{
  return sub_100004BA8((unsigned __int8 *)(*a1 + *(void *)(*(void *)(a2 + 16) + 56) + 296), *(void *)(a2 + 16));
}

uint64_t sub_100004D80(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!*(unsigned char *)(a1 + 313)) {
    return printf("%*s", *(__int16 *)(v2 + 48), "-");
  }
  double v3 = (unsigned __int8 *)(a1 + *(void *)(v2 + 56) + 24);

  return sub_100004BA8(v3, v2);
}

uint64_t sub_100004DEC(uint64_t a1, uint64_t a2)
{
  buffer[0] = 0;
  buffer[1] = 0;
  int v3 = proc_pidinfo(*(_DWORD *)(*(void *)a1 + 40), 12, 0, buffer, 16);
  uint64_t v4 = *(const char ***)(a2 + 16);
  if (v3 != 16) {
    return printf("%*s");
  }
  int v5 = *v4;
  if (!strcmp(*v4, "wql")) {
    return printf("%*s");
  }
  if (strcmp(v5, "wqr")) {
    strcmp(v5, "wqb");
  }
  return printf("%*d");
}

uint64_t sub_100004EF8()
{
  if (kpersona_pidinfo()) {
    return printf("%*s");
  }
  else {
    return printf("%*u");
  }
}

uint64_t start(int a1, uint64_t a2)
{
  v144 = 0;
  long long v142 = 0u;
  long long v143 = 0u;
  v141 = 0;
  long long v139 = 0u;
  long long v140 = 0u;
  v138 = 0;
  long long v136 = 0u;
  long long v137 = 0u;
  v135 = 0;
  long long v133 = 0u;
  long long v134 = 0u;
  v132 = 0;
  long long v130 = 0u;
  long long v131 = 0u;
  v129 = 0;
  long long v127 = 0u;
  long long v128 = 0u;
  size_t size = 0;
  uint64_t v126 = 0;
  *(_OWORD *)v145 = xmmword_1000076D0;
  BOOL v4 = compat_mode("bin/ps", "unix2003");
  setlocale(0, "");
  time(&qword_10000E120);
  int v5 = getenv("COLUMNS");
  if (v5 && *v5)
  {
    int v7 = atoi(v5);
    goto LABEL_12;
  }
  if (ioctl(1, 0x40087468uLL, &v126) != -1 || ioctl(2, 0x40087468uLL, &v126) != -1)
  {
    int v8 = WORD1(v126);
    if (!WORD1(v126))
    {
      int v7 = 79;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  int v6 = ioctl(0, 0x40087468uLL, &v126);
  int v7 = 79;
  if (v6 != -1)
  {
    int v8 = WORD1(v126);
    if (WORD1(v126)) {
LABEL_10:
    }
      int v7 = v8 - 1;
  }
LABEL_12:
  dword_10000E128 = v7;
  if (a1 < 2) {
    goto LABEL_50;
  }
  BOOL v9 = v4;
  if (v4) {
    uint64_t v10 = "aACcdeEfg:G:hjLlMmO:o:p:rSTt:U:u:vwx";
  }
  else {
    uint64_t v10 = "aACcdeEgG:hjLlMmO:o:p:rSTt:U:uvwx";
  }
  time_t v11 = *(const char **)(a2 + 8);
  int v12 = *(unsigned __int8 **)(a2 + 16);
  int v13 = *(unsigned __int8 *)v11;
  if (*v11)
  {
    char v14 = *v11;
    char v15 = *(unsigned __int8 **)(a2 + 8);
    while (1)
    {
      long long v16 = strchr(v10, v14);
      if (v16)
      {
        if (v16[1] == 58) {
          break;
        }
      }
      int v17 = *++v15;
      char v14 = v17;
      if (!v17) {
        goto LABEL_21;
      }
    }
    if (v13 == 45) {
      goto LABEL_48;
    }
    int v18 = 0;
  }
  else
  {
LABEL_21:
    char v15 = 0;
    int v18 = 1;
  }
  size_t v19 = strlen(v11);
  int v20 = (unsigned __int8 *)&v11[v19 - 1];
  int v21 = *v20;
  if (v21 == 116)
  {
    if (v13 != 45 && v20 == v15)
    {
      if (v12)
      {
        int v61 = *v12;
        if (v61 != 45 && (v61 - 48) > 9) {
          goto LABEL_38;
        }
      }
      *char v15 = 84;
      int v13 = *(unsigned __int8 *)v11;
    }
  }
  else
  {
    if ((v21 - 48) < 0xA) {
      int v22 = v18;
    }
    else {
      int v22 = 0;
    }
    if (v22 == 1)
    {
      while (v20 >= (unsigned __int8 *)v11)
      {
        int v23 = *v20;
        BOOL v24 = v23 != 44 && (v23 - 48) > 9;
        if (v24) {
          break;
        }
        --v20;
      }
      int v26 = 0;
      v25 = (const char *)(v20 + 1);
      goto LABEL_40;
    }
  }
  if (v13 != 45)
  {
LABEL_38:
    v25 = 0;
    int v26 = 1;
LABEL_40:
    v27 = malloc_type_malloc(v19 + 3, 0xBA2A40A8uLL);
    if (!v27) {
      sub_100007098();
    }
    v28 = v27;
    v29 = v27;
    if (*v11 != 45)
    {
      BOOL v9 = 0;
      unsigned char *v27 = 45;
      v29 = v27 + 1;
    }
    if (v26)
    {
      int v30 = v29;
      size_t v31 = v11;
    }
    else
    {
      memcpy(v29, v11, v25 - v11);
      v29[v25 - v11] = 112;
      int v30 = &v29[v25 - v11 + 1];
      size_t v31 = v25;
    }
    strcpy(v30, v31);
    goto LABEL_49;
  }
LABEL_48:
  v28 = v11;
LABEL_49:
  BOOL v4 = v9;
  *(void *)(a2 + 8) = v28;
LABEL_50:
  byte_10000E148 = 0;
  *(void *)&long long v142 = 0;
  DWORD2(v142) = 4;
  *(void *)&long long v143 = sub_1000061A4;
  *((void *)&v143 + 1) = "group";
  v144 = 0;
  *(void *)&long long v139 = 0;
  DWORD2(v139) = 4;
  *(void *)&long long v140 = sub_1000062EC;
  *((void *)&v140 + 1) = "process group";
  v141 = 0;
  *(void *)&long long v136 = 0;
  DWORD2(v136) = 4;
  *(void *)&long long v137 = sub_1000062EC;
  *((void *)&v137 + 1) = "process id";
  v138 = 0;
  *(void *)&long long v133 = 0;
  DWORD2(v133) = 4;
  *(void *)&long long v134 = sub_100006400;
  *((void *)&v134 + 1) = "ruser";
  v135 = 0;
  *(void *)&long long v130 = 0;
  DWORD2(v130) = 4;
  *(void *)&long long v131 = sub_100006540;
  *((void *)&v131 + 1) = "tty";
  v132 = 0;
  *(void *)&long long v127 = 0;
  DWORD2(v127) = 4;
  *(void *)&long long v128 = sub_100006400;
  *((void *)&v128 + 1) = "user";
  if (v4) {
    v32 = "aACcdeEfg:G:hjLlMmO:o:p:rSTt:U:u:vwx";
  }
  else {
    v32 = "aACcdeEgG:hjLlMmO:o:p:rSTt:U:uvwx";
  }
  v129 = 0;
  int v33 = getopt(a1, (char *const *)a2, v32);
  if (v33 != -1)
  {
    int v122 = 0;
    int v119 = 0;
    int v121 = 0;
    int v118 = 0;
    int v124 = 0;
    int v35 = 0;
    int v34 = 0;
    v38 = aUidPidPpidFlag;
    if (!v4) {
      v38 = aUidPidPpidCpuP;
    }
    v117 = v38;
    uint64_t v39 = 0xFFFFFFFFLL;
    v37 = &aUserPidPpidPgi[37];
    while (2)
    {
      uint64_t v36 = 0;
      switch((char)v33)
      {
        case 'A':
          goto LABEL_71;
        case 'C':
          dword_10000E12C = 1;
          goto LABEL_107;
        case 'E':
          goto LABEL_73;
        case 'G':
          v40 = optarg;
          v41 = &v142;
          goto LABEL_94;
        case 'L':
          sub_100002D10();
          exit(0);
        case 'M':
          sub_100002E48(aUserPidTtCpuSt, 0);
          aUserPidTtCpuSt[0] = 0;
          int v121 = 1;
          dword_10000E114 = 1;
          goto LABEL_107;
        case 'O':
          v42 = aPid_1;
          int v121 = 1;
          sub_100002E48(aPid_1, 1);
          sub_100002E48(optarg, 1);
          sub_100002E48(aTtStateTimeCom, 1);
          aTtStateTimeCom[0] = 0;
          v37 = aUserPidPpidPgi + 37;
          goto LABEL_96;
        case 'S':
          dword_10000E134 = 1;
          goto LABEL_107;
        case 'T':
          v40 = ttyname(0);
          optarg = v40;
          if (!v40) {
            sub_1000070E8();
          }
          goto LABEL_91;
        case 'U':
          v40 = optarg;
          v41 = &v133;
          goto LABEL_94;
        case 'X':
          goto LABEL_108;
        case 'a':
          ++v35;
          int v34 = 1;
          goto LABEL_107;
        case 'c':
          dword_10000E130 = 1;
          goto LABEL_107;
        case 'd':
          int v122 = 1;
          goto LABEL_71;
        case 'e':
          if (!v4)
          {
LABEL_73:
            dword_10000E110 = 1;
            goto LABEL_107;
          }
LABEL_71:
          ++v35;
          int v34 = 1;
LABEL_72:
          uint64_t v36 = 1;
          goto LABEL_108;
        case 'f':
          *((_DWORD *)v37 + 74) = 0;
          if (!v4 || v127)
          {
            sub_100002E48(aUserPidPpidCpu, 0);
          }
          else
          {
            sub_100002E48(aUidPidPpidCpuC, 0);
            v43 = sub_100002FA4("command", 0, 0);
            if (v43) {
              *((_WORD *)v43 + 24) = 64;
            }
          }
          goto LABEL_102;
        case 'g':
          if (!v4) {
            goto LABEL_107;
          }
          v40 = optarg;
          v41 = &v139;
          goto LABEL_94;
        case 'h':
          int v44 = (unsigned __int16)v126;
          if ((unsigned __int16)v126 <= 5u) {
            int v44 = 22;
          }
          int v124 = v44;
          goto LABEL_107;
        case 'j':
          v45 = aUserPidPpidPgi;
          sub_100002E48(aUserPidPpidPgi, 0);
          goto LABEL_101;
        case 'l':
          sub_100002E48(v117, 0);
          aUidPidPpidCpuP[0] = 0;
          goto LABEL_102;
        case 'm':
          v46 = aUserPidPpidPgi + 37;
          int v47 = 1;
          goto LABEL_89;
        case 'o':
          int v121 = 1;
          sub_100002E48(optarg, 1);
          goto LABEL_107;
        case 'p':
          sub_100006798((uint64_t)&v136, optarg);
          ++v35;
          goto LABEL_107;
        case 'r':
          v46 = &aUserPidPpidPgi[37];
          int v47 = 2;
LABEL_89:
          *((_DWORD *)v46 + 83) = v47;
          goto LABEL_107;
        case 't':
          v40 = optarg;
LABEL_91:
          v41 = &v130;
          goto LABEL_94;
        case 'u':
          if (v4)
          {
            v40 = optarg;
            v41 = &v127;
LABEL_94:
            sub_100006798((uint64_t)v41, v40);
            ++v35;
            int v119 = 1;
          }
          else
          {
            v45 = aUserPidCpuMemV;
            sub_100002E48(aUserPidCpuMemV, 0);
            dword_10000E14C = 2;
LABEL_101:
            char *v45 = 0;
LABEL_102:
            int v121 = 1;
          }
          goto LABEL_107;
        case 'v':
          v42 = aPidStateTimeSl;
          sub_100002E48(aPidStateTimeSl, 0);
          int v121 = 1;
          dword_10000E14C = 1;
LABEL_96:
          char *v42 = 0;
          goto LABEL_107;
        case 'w':
          if (v118)
          {
            int v48 = 0;
          }
          else
          {
            if (*((int *)v37 + 74) > 130) {
              goto LABEL_106;
            }
            int v48 = 131;
          }
          *((_DWORD *)v37 + 74) = v48;
LABEL_106:
          ++v118;
LABEL_107:
          uint64_t v36 = v39;
LABEL_108:
          int v33 = getopt(a1, (char *const *)a2, v32);
          uint64_t v39 = v36;
          if (v33 == -1) {
            goto LABEL_109;
          }
          continue;
        case 'x':
          goto LABEL_72;
        default:
          goto LABEL_172;
      }
    }
  }
  int v34 = 0;
  int v119 = 0;
  int v121 = 0;
  int v35 = 0;
  int v124 = 0;
  int v122 = 0;
  LODWORD(v36) = -1;
  v37 = aUserPidPpidPgi + 37;
LABEL_109:
  uint64_t v49 = optind;
  if (!isatty(1)) {
    *((_DWORD *)v37 + 74) = 0;
  }
  v50 = *(const char **)(a2 + 8 * v49);
  if (v50)
  {
    v51 = (const char **)(a2 + 8 * v49 + 8);
    do
    {
      if (*(unsigned __int8 *)v50 - 48 > 9)
      {
        v68 = __stderrp;
        v69 = getprogname();
        fprintf(v68, "%s: illegal argument: %s\n", v69, *(v51 - 1));
LABEL_172:
        sub_100006968(v4);
      }
      sub_100006798((uint64_t)&v136, v50);
      v52 = *v51++;
      v50 = v52;
    }
    while (v52);
  }
  if (byte_10000E148 == 1) {
    goto LABEL_175;
  }
  int v53 = v119;
  if ((int)v36 >= 0) {
    int v53 = v36;
  }
  int v120 = v53;
  if (!v121)
  {
    if (v4 && v127) {
      sub_100002E48("uid", 0);
    }
    if (v4) {
      v54 = aPidTtyTimeComm;
    }
    else {
      v54 = aPidTtStateTime;
    }
    sub_100002E48(v54, 0);
  }
  if (!v35)
  {
    v129 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    if (!v129) {
      sub_100007098();
    }
    *(void *)&long long v127 = 0x100000001;
    *(_DWORD *)v129 = getuid();
    int v35 = 1;
  }
  v55 = off_10000DEC0;
  if (off_10000DEC0)
  {
    do
    {
      uint64_t v56 = v55[2];
      int v57 = *(_DWORD *)(v56 + 24);
      if ((v57 & 8) != 0)
      {
        *(_WORD *)(v56 + 80) = *(_WORD *)(v56 + 48);
        *(_WORD *)(v56 + 48) = 0;
      }
      if ((v57 & 4) != 0) {
        byte_10000E158 = 1;
      }
      v55 = (void *)*v55;
    }
    while (v55);
  }
  int v58 = 0;
  if (v35 != 1)
  {
    int v59 = 0;
    goto LABEL_155;
  }
  int v59 = 0;
  if (v142 == 1) {
    goto LABEL_155;
  }
  if (v139 == 1)
  {
    v60 = (void **)&v141;
    int v59 = 2;
LABEL_154:
    int v35 = 0;
    int v58 = *(_DWORD *)*v60;
    goto LABEL_155;
  }
  int v59 = v136;
  if (v136 == 1)
  {
    v60 = &v138;
    goto LABEL_154;
  }
  if (v133 == 1)
  {
    v60 = &v135;
    int v59 = 6;
    goto LABEL_154;
  }
  if (v130 == 1)
  {
    v60 = &v132;
    int v59 = 4;
    goto LABEL_154;
  }
  if (v127 == 1)
  {
    v60 = &v129;
    if (v120) {
      int v59 = 6;
    }
    else {
      int v59 = 5;
    }
    goto LABEL_154;
  }
  int v58 = 0;
  int v59 = 0;
  int v35 = 1;
LABEL_155:
  *(void *)v145 = 0xE00000001;
  v145[2] = v59;
  v145[3] = v58;
  if ((sysctl(v145, 4u, 0, &size, 0, 0) & 0x80000000) == 0)
  {
    v63 = malloc_type_malloc(size, 0x2F90465FuLL);
    unsigned int v64 = 0;
    size_t v65 = size;
    while (1)
    {
      size_t size = v65;
      int v66 = sysctl(v145, 4u, v63, &size, 0, 0);
      if ((v66 & 0x80000000) == 0) {
        break;
      }
      if (v64 > 0x3E7) {
        goto LABEL_156;
      }
      if (*__error() != 12 || sysctl(v145, 4u, 0, &size, 0, 0)) {
        goto LABEL_164;
      }
      v63 = malloc_type_realloc(v63, size, 0xCCE25AB7uLL);
      size_t v65 = size;
LABEL_165:
      ++v64;
    }
    if (!v66)
    {
      size_t v67 = size / 0x288;
      if ((int)(size / 0x288) >= 1)
      {
        qword_10000E150 = (uint64_t)malloc_type_calloc((size / 0x288), 0x1D8uLL, 0x10300409D75B528uLL);
        if (!qword_10000E150) {
          sub_100007098();
        }
        int v70 = 0;
        if (v34) {
          BOOL v80 = 1;
        }
        else {
          BOOL v80 = v35 == 0;
        }
        char v81 = v80;
        v82 = v63;
        while (1)
        {
          int v83 = v82[10];
          if (v83 && (!v122 || v83 != v82[141]))
          {
            uint64_t v84 = v136;
            if ((int)v136 >= 1)
            {
              v85 = (int *)v138;
              do
              {
                int v86 = *v85++;
                if (v83 == v86) {
                  goto LABEL_215;
                }
              }
              while (--v84);
            }
            if (v120 || (dev_t v97 = v82[143], v97 != -1) && (v82[8] & 2) != 0 && devname(v97, 0x2000u))
            {
              if (v81) {
                goto LABEL_215;
              }
              uint64_t v98 = v142;
              if ((int)v142 >= 1)
              {
                v99 = v144;
                do
                {
                  int v100 = *v99++;
                  if (v82[100] == v100) {
                    goto LABEL_215;
                  }
                }
                while (--v98);
              }
              uint64_t v101 = v139;
              if ((int)v139 >= 1)
              {
                v102 = v141;
                do
                {
                  int v103 = *v102++;
                  if (v82[141] == v103) {
                    goto LABEL_215;
                  }
                }
                while (--v101);
              }
              uint64_t v104 = v133;
              if ((int)v133 >= 1)
              {
                v105 = (int *)v135;
                do
                {
                  int v106 = *v105++;
                  if (v82[98] == v106) {
                    goto LABEL_215;
                  }
                }
                while (--v104);
              }
              uint64_t v107 = v130;
              if ((int)v130 >= 1)
              {
                v108 = (int *)v132;
                do
                {
                  int v109 = *v108++;
                  if (v82[143] == v109) {
                    goto LABEL_215;
                  }
                }
                while (--v107);
              }
              uint64_t v110 = v127;
              if ((int)v127 >= 1)
              {
                v111 = (int *)v129;
                while (1)
                {
                  int v112 = *v111++;
                  if (v82[105] == v112) {
                    break;
                  }
                  if (!--v110) {
                    goto LABEL_226;
                  }
                }
LABEL_215:
                uint64_t v87 = qword_10000E150;
                uint64_t v88 = qword_10000E150 + 472 * v70;
                *(void *)uint64_t v88 = v82;
                sub_100006CC8(v88);
                if (byte_10000E158 == 1)
                {
                  uint64_t v89 = v87 + 472 * v70;
                  *(unsigned char *)(v89 + 313) = 0;
                  size_t v90 = strlen((const char *)(*(void *)v88 + 243));
                  v91 = (char *)malloc_type_malloc(v90 + 3, 0xD84D190FuLL);
                  *(void *)(v89 + 320) = v91;
                  strcpy(v91, (const char *)(*(void *)v88 + 243));
                  v92 = malloc_type_malloc(0xAuLL, 0xF0205827uLL);
                  *(void *)(v89 + 328) = v92;
                  unsigned char *v92 = 0;
                }
                v93 = off_10000DEC0;
                if (off_10000DEC0)
                {
                  do
                  {
                    uint64_t v94 = v93[2];
                    if ((*(unsigned char *)(v94 + 24) & 8) != 0)
                    {
                      int v95 = (*(uint64_t (**)(uint64_t))(v94 + 40))(v88);
                      if (v95 <= *(__int16 *)(v94 + 48)) {
                        LOWORD(v95) = *(_WORD *)(v94 + 48);
                      }
                      else {
                        *(_WORD *)(v94 + 48) = v95;
                      }
                      int v96 = *(__int16 *)(v94 + 80);
                      if (v96 < (__int16)v95) {
                        *(_WORD *)(v94 + 48) = v96;
                      }
                    }
                    v93 = (void *)*v93;
                  }
                  while (v93);
                }
                ++v70;
              }
            }
          }
LABEL_226:
          v82 += 162;
          BOOL v24 = (int)v67 <= 1;
          LODWORD(v67) = v67 - 1;
          if (v24) {
            goto LABEL_174;
          }
        }
      }
      int v70 = 0;
LABEL_174:
      sub_1000069D4();
      sub_100003170();
      if (v70)
      {
        qsort((void *)qword_10000E150, v70, 0x1D8uLL, (int (__cdecl *)(const void *, const void *))sub_100006A44);
        if (v70 <= 0)
        {
          v114 = (char *)qword_10000E150;
        }
        else
        {
          unsigned int v71 = v70;
          uint64_t v72 = 0;
          int v73 = 0;
          int v74 = v124 - 4;
          v75 = &aUserPidPpidPgi[37];
          uint64_t v123 = v71;
          do
          {
            if (dword_10000E114)
            {
              v76 = v75;
              *((_DWORD *)v75 + 71) = 1;
              if (*(_DWORD *)(qword_10000E150 + 472 * v72 + 440))
              {
                unsigned int v77 = 0;
                do
                {
                  dword_10000E118 = v77;
                  v78 = off_10000DEC0;
                  if (off_10000DEC0)
                  {
                    do
                    {
                      (*(void (**)(uint64_t, void *))(v78[2] + 32))(qword_10000E150 + 472 * v72, v78);
                      if (!*v78) {
                        break;
                      }
                      putchar(32);
                      v78 = (void *)*v78;
                    }
                    while (v78);
                  }
                  putchar(10);
                  if (v124)
                  {
                    if (v73 == v74)
                    {
                      putchar(10);
                      sub_100003170();
                      int v73 = 0;
                    }
                    else
                    {
                      ++v73;
                    }
                  }
                  ++v77;
                }
                while (v77 < *(_DWORD *)(qword_10000E150 + 472 * v72 + 440));
              }
              v75 = v76;
              *((_DWORD *)v76 + 71) = 0;
            }
            else
            {
              v79 = off_10000DEC0;
              if (off_10000DEC0)
              {
                do
                {
                  (*(void (**)(uint64_t, void *))(v79[2] + 32))(qword_10000E150 + 472 * v72, v79);
                  if (!*v79) {
                    break;
                  }
                  putchar(32);
                  v79 = (void *)*v79;
                }
                while (v79);
              }
              putchar(10);
              if (v124)
              {
                if (v73 == v74)
                {
                  putchar(10);
                  sub_100003170();
                  int v73 = 0;
                }
                else
                {
                  ++v73;
                }
              }
            }
            ++v72;
          }
          while (v72 != v123);
          uint64_t v113 = 0;
          v114 = (char *)qword_10000E150;
          do
          {
            if (!*(_DWORD *)&v114[v113 + 436] && *(_DWORD *)&v114[v113 + 440]) {
              free(*(void **)&v114[v113 + 456]);
            }
            v113 += 472;
          }
          while (472 * v123 != v113);
        }
        free(v63);
        free(v114);
        *(void *)((char *)&v142 + 4) = 0;
        LODWORD(v142) = 0;
        if (v144) {
          free(v144);
        }
        long long v143 = 0uLL;
        v144 = 0;
        DWORD2(v136) = 0;
        *(void *)&long long v136 = 0;
        if (v138) {
          free(v138);
        }
        long long v137 = 0uLL;
        v138 = 0;
        *(void *)((char *)&v139 + 4) = 0;
        LODWORD(v139) = 0;
        if (v141) {
          free(v141);
        }
        long long v140 = 0uLL;
        v141 = 0;
        DWORD2(v133) = 0;
        *(void *)&long long v133 = 0;
        if (v135) {
          free(v135);
        }
        long long v134 = 0uLL;
        v135 = 0;
        DWORD2(v130) = 0;
        *(void *)&long long v130 = 0;
        if (v132) {
          free(v132);
        }
        long long v131 = 0uLL;
        v132 = 0;
        DWORD2(v127) = 0;
        *(void *)&long long v127 = 0;
        if (v129) {
          free(v129);
        }
        long long v128 = 0uLL;
        v129 = 0;
        int v115 = dword_10000E138;
        if (!dword_10000E138)
        {
          v116 = __stdoutp;
          if (ferror(__stdoutp) || fflush(v116)) {
            sub_1000070CC();
          }
          int v115 = dword_10000E138;
        }
        exit(v115);
      }
LABEL_175:
      exit(1);
    }
LABEL_164:
    sleep(1u);
    goto LABEL_165;
  }
LABEL_156:
  perror("Failure calling sysctl");
  return 0;
}

uint64_t sub_1000061A4(uint64_t a1, char *__s)
{
  if (!*__s)
  {
    warnx("Invalid (zero-length) %s name");
LABEL_17:
    uint64_t result = 0;
    byte_10000E148 = 1;
    return result;
  }
  if (strlen(__s) > 0xFE)
  {
    warnx("%s name too long: %s");
    goto LABEL_17;
  }
  __endptr = 0;
  *__error() = 0;
  unint64_t v4 = strtoul(__s, &__endptr, 10);
  if (*__error() || (!*__endptr ? (BOOL v5 = v4 >> 31 == 0) : (BOOL v5 = 0), !v5 || (v6 = getgrgid(v4)) == 0))
  {
    int v6 = getgrnam(__s);
    if (!v6)
    {
      warnx("No %s %s '%s'");
      goto LABEL_17;
    }
  }
  int v7 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 >= *(_DWORD *)(a1 + 4))
  {
    sub_100006B10(a1);
    int v7 = *(_DWORD *)a1;
  }
  gid_t gr_gid = v6->gr_gid;
  uint64_t v9 = *(void *)(a1 + 32);
  *(_DWORD *)a1 = v7 + 1;
  *(_DWORD *)(v9 + 4 * v7) = gr_gid;
  return 1;
}

uint64_t sub_1000062EC(uint64_t a1, const char *a2)
{
  if (*a2)
  {
    __endptr = 0;
    *__error() = 0;
    unint64_t v4 = strtol(a2, &__endptr, 10);
    BOOL v5 = "Invalid %s: %s";
    BOOL v6 = __endptr != a2 && *__endptr == 0;
    if (!v6 || (v4 & 0x8000000000000000) != 0 || (int v7 = *__error(), v5 = "%s too large: %s", v7) || v4 >> 5 >= 0xC35)
    {
      warnx(v5, *(void *)(a1 + 24), a2);
      *__error() = 34;
    }
    if (*__error() == 34)
    {
      uint64_t result = 0;
      byte_10000E148 = 1;
    }
    else
    {
      int v9 = *(_DWORD *)a1;
      if (*(_DWORD *)a1 >= *(_DWORD *)(a1 + 4))
      {
        sub_100006B10(a1);
        int v9 = *(_DWORD *)a1;
      }
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)a1 = v9 + 1;
      *(_DWORD *)(v10 + 4 * v9) = v4;
      return 1;
    }
  }
  else
  {
    sub_100007104();
    return 0;
  }
  return result;
}

uint64_t sub_100006400(uint64_t a1, char *__s)
{
  if (!*__s)
  {
    warnx("Invalid (zero-length) %s name");
    goto LABEL_17;
  }
  if (strlen(__s) > 0xFE)
  {
    warnx("%s name too long: %s");
    goto LABEL_17;
  }
  unint64_t v4 = getpwnam(__s);
  if (!v4)
  {
    __endptr = 0;
    *__error() = 0;
    unint64_t v5 = strtoul(__s, &__endptr, 10);
    if (*__error())
    {
      BOOL v6 = "No %s named '%s'";
    }
    else
    {
      BOOL v6 = "No %s named '%s'";
      if (!*__endptr && !(v5 >> 31))
      {
        unint64_t v4 = getpwuid(v5);
        if (v4) {
          goto LABEL_8;
        }
        BOOL v6 = "No %s name or ID matches '%s'";
      }
    }
    warnx(v6, *(void *)(a1 + 24), __s);
LABEL_17:
    uint64_t result = 0;
    byte_10000E148 = 1;
    return result;
  }
LABEL_8:
  int v7 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 >= *(_DWORD *)(a1 + 4))
  {
    sub_100006B10(a1);
    int v7 = *(_DWORD *)a1;
  }
  uid_t pw_uid = v4->pw_uid;
  uint64_t v9 = *(void *)(a1 + 32);
  *(_DWORD *)a1 = v7 + 1;
  *(_DWORD *)(v9 + 4 * v7) = pw_uid;
  return 1;
}

uint64_t sub_100006540(uint64_t a1, char *__s1)
{
  uint64_t v2 = __s1;
  memset(&v10, 0, sizeof(v10));
  v11[0] = 0;
  int v4 = *__s1;
  if (v4 != 47)
  {
    if (v4 == 99 && !strcmp(__s1, "co"))
    {
      uint64_t v2 = "/dev/console";
    }
    else
    {
      __strlcpy_chk();
      __strlcat_chk();
      if (v12[0] != 0x7974742F7665642FLL
        && (v12[0] != 0x6E6F632F7665642FLL || *(void *)((char *)v12 + 5) != 0x656C6F736E6F63))
      {
        __strlcpy_chk();
        __strlcat_chk();
        if (!stat(v11, &v10) && (v10.st_mode & 0xF000) == 0x2000) {
          goto LABEL_15;
        }
      }
      uint64_t v2 = (const char *)v12;
    }
  }
  if (access(v2, 0) == -1 || stat(v2, &v10) == -1)
  {
    if (v11[0]) {
      warn("%s and %s");
    }
    else {
      warn("%s");
    }
    goto LABEL_27;
  }
  if ((v10.st_mode & 0xF000) != 0x2000)
  {
    if (v11[0]) {
      warnx("%s and %s: Not a terminal");
    }
    else {
      warnx("%s: Not a terminal");
    }
LABEL_27:
    uint64_t result = 0;
    byte_10000E148 = 1;
    return result;
  }
LABEL_15:
  int v6 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 >= *(_DWORD *)(a1 + 4))
  {
    sub_100006B10(a1);
    int v6 = *(_DWORD *)a1;
  }
  dev_t st_rdev = v10.st_rdev;
  uint64_t v8 = *(void *)(a1 + 32);
  *(_DWORD *)a1 = v6 + 1;
  *(_DWORD *)(v8 + 4 * v6) = st_rdev;
  return 1;
}

void sub_100006798(uint64_t a1, const char *a2)
{
  uint64_t v2 = a2;
  LOBYTE(v4) = *a2;
  if (*a2 || ((*(void (**)(uint64_t, unsigned char *))(a1 + 16))(a1, v13), (LOBYTE(v4) = *v2) != 0))
  {
    while (1)
    {
      if (memchr(" \t", (char)v4, 3uLL))
      {
        int v5 = *(unsigned __int8 *)++v2;
        LOBYTE(v4) = v5;
        if (!v5) {
          goto LABEL_7;
        }
      }
      else
      {
        if (v4 != 44)
        {
          unint64_t v9 = 0;
          do
          {
            unint64_t v10 = v9;
            if (memchr(" \t,", (char)v4, 4uLL))
            {
              int v6 = &v13[v10];
              v2 += v10;
              goto LABEL_8;
            }
            unint64_t v9 = v10 + 1;
            v13[v10] = v4;
            int v4 = v2[v10 + 1];
          }
          while (v2[v10 + 1] && v10 < 0x3FF);
          time_t v11 = &v2[v9];
          if (v10 < 0x3FF)
          {
            int v6 = &v13[v9];
            uint64_t v2 = v11;
            goto LABEL_8;
          }
          while (v4 && !memchr(" \t,", (char)v4, 4uLL))
          {
            int v12 = *(unsigned __int8 *)++v11;
            int v4 = v12;
          }
          warnx("Value too long: %.*s", v11 - v2, v2);
          byte_10000E148 = 1;
          uint64_t v2 = v11;
          goto LABEL_9;
        }
LABEL_7:
        int v6 = v13;
LABEL_8:
        unsigned char *v6 = 0;
        (*(void (**)(uint64_t, unsigned char *))(a1 + 16))(a1, v13);
LABEL_9:
        char v7 = *v2;
        if (*v2)
        {
          do
          {
            if (!memchr(" \t", v7, 3uLL)) {
              break;
            }
            int v8 = *(unsigned __int8 *)++v2;
            char v7 = v8;
          }
          while (v8);
        }
        if (v7 == 44) {
          ++v2;
        }
        LOBYTE(v4) = *v2;
        if (!*v2) {
          return;
        }
      }
    }
  }
}

void sub_100006968(int a1)
{
  v1 = "          [-g grp[,grp...]] [-u [uid,uid...]]";
  if (!a1) {
    v1 = "          [-u]";
  }
  fprintf(__stderrp, "%s\n%s\n%s\n%s\n", "usage: ps [-AaCcEefhjlMmrSTvwXx] [-O fmt | -o fmt] [-G gid[,gid...]]", v1, "          [-p pid[,pid...]] [-t tty[,tty...]] [-U user[,user...]]", "       ps [-L]");
  exit(1);
}

void sub_1000069D4()
{
  int v0 = dword_10000E13C;
  for (i = off_10000DEC0; i; i = *(void **)i)
  {
    uint64_t v2 = *((void *)i + 2);
    int v3 = strlen(*((const char **)i + 1));
    int v4 = *(__int16 *)(v2 + 48);
    if (v4 < v3)
    {
      *(_WORD *)(v2 + 48) = v3;
      int v4 = (__int16)v3;
    }
    v0 += v4 + 1;
    dword_10000E13C = v0;
  }
  dword_10000E13C = v0 - 1;
}

uint64_t sub_100006A44(_DWORD *a1, _DWORD *a2)
{
  if (dword_10000E14C == 1)
  {
    int v5 = a2[93];
    int v6 = a1[93];
    return (v5 - v6);
  }
  if (dword_10000E14C == 2)
  {
    int v3 = sub_100004978((uint64_t)a2);
    return v3 - sub_100004978((uint64_t)a1);
  }
  int v7 = *(_DWORD *)(*(void *)a1 + 572);
  int v8 = *(_DWORD *)(*(void *)a2 + 572);
  uint64_t result = (v7 - v8);
  if (v7 == v8)
  {
    int v5 = *(_DWORD *)(*(void *)a1 + 40);
    int v6 = *(_DWORD *)(*(void *)a2 + 40);
    return (v5 - v6);
  }
  return result;
}

_UNKNOWN **sub_100006AC8(const char **a1)
{
  uint64_t v2 = &off_10000DEC0;
  do
    uint64_t v2 = (_UNKNOWN **)*v2;
  while (v2 && strcmp(*(const char **)v2[2], *a1));
  return v2;
}

void *sub_100006B10(uint64_t a1)
{
  int v2 = 2 * *(_DWORD *)(a1 + 4) + 2;
  uint64_t result = malloc_type_realloc(*(void **)(a1 + 32), *(int *)(a1 + 8) * (uint64_t)v2, 0x7061BF9AuLL);
  if (!result)
  {
    free(*(void **)(a1 + 32));
    errx(1, "realloc to %d %ss failed", v2, *(const char **)(a1 + 24));
  }
  *(_DWORD *)(a1 + 4) = v2;
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t sub_100006B88(uint64_t result, uint64_t a2)
{
  switch((int)result)
  {
    case 1:
      return result;
    case 2:
      uint64_t result = 5;
      break;
    case 3:
      if (a2 <= 20) {
        uint64_t result = 3;
      }
      else {
        uint64_t result = 4;
      }
      break;
    case 4:
      uint64_t result = 2;
      break;
    case 5:
      uint64_t result = 6;
      break;
    default:
      uint64_t result = 7;
      break;
  }
  return result;
}

uint64_t sub_100006BF8(uint64_t a1, thread_inspect_t target_act, int a3, thread_info_t thread_info_out)
{
  if (a3 == 4)
  {
    mach_msg_type_number_t thread_info_outCnt = 4;
    thread_inspect_t v9 = target_act;
    thread_flavor_t v10 = 12;
LABEL_8:
    uint64_t result = thread_info(v9, v10, thread_info_out, &thread_info_outCnt);
    if (result) {
      return result;
    }
    integer_t v7 = *(_DWORD *)(a1 + 348);
    integer_t v8 = thread_info_out[1];
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    mach_msg_type_number_t thread_info_outCnt = 5;
    thread_inspect_t v9 = target_act;
    thread_flavor_t v10 = 11;
    goto LABEL_8;
  }
  if (a3 != 1) {
    return 5;
  }
  mach_msg_type_number_t thread_info_outCnt = 5;
  uint64_t result = thread_info(target_act, 0xAu, thread_info_out, &thread_info_outCnt);
  if (result) {
    return result;
  }
  integer_t v7 = *(_DWORD *)(a1 + 348);
  integer_t v8 = thread_info_out[2];
LABEL_10:
  uint64_t result = 0;
  if (v7 < v8) {
    *(_DWORD *)(a1 + 348) = v8;
  }
  return result;
}

uint64_t sub_100006CC8(uint64_t a1)
{
  kern_return_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  vm_size_t v18;
  mach_port_t object_name;
  mach_vm_size_t size;
  mach_vm_address_t address;
  int info[4];
  long long v23;
  int v24;
  mach_msg_type_number_t thread_info_outCnt;
  mach_msg_type_number_t task_info_outCnt;

  mach_msg_type_number_t thread_info_outCnt = 10;
  *(_DWORD *)(a1 + 340) = 7;
  int v2 = (vm_map_read_t *)(a1 + 336);
  if (task_read_for_pid()) {
    return 1;
  }
  task_info_outCnt = 10;
  if (task_info(*(_DWORD *)(a1 + 336), 0x12u, (task_info_t)(a1 + 360), &task_info_outCnt)) {
    goto LABEL_6;
  }
  BOOL v24 = 0;
  *(_OWORD *)info = 0u;
  int v23 = 0u;
  size_t size = 0;
  address = 2415919104;
  object_name = 0;
  task_info_outCnt = 9;
  if (!mach_vm_region(*v2, &address, &size, 10, info, &task_info_outCnt, &object_name))
  {
    if (v23)
    {
      if (size == 0x10000000)
      {
        unint64_t v4 = *(void *)(a1 + 364);
        if (v4 >= 0x20000001) {
          *(void *)(a1 + 364) = v4 - 0x20000000;
        }
      }
    }
  }
  task_info_outCnt = 4;
  if (task_info(*(_DWORD *)(a1 + 336), 3u, (task_info_t)(a1 + 400), &task_info_outCnt)) {
    goto LABEL_6;
  }
  int v5 = *(_DWORD *)(a1 + 396);
  switch(v5)
  {
    case 4:
      task_info_outCnt = 4;
      task_name_t v7 = *(_DWORD *)(a1 + 336);
      integer_t v8 = (integer_t *)(a1 + 416);
      task_flavor_t v9 = 12;
      goto LABEL_18;
    case 2:
      task_info_outCnt = 5;
      task_name_t v7 = *(_DWORD *)(a1 + 336);
      integer_t v8 = (integer_t *)(a1 + 416);
      task_flavor_t v9 = 11;
LABEL_18:
      if (!task_info(v7, v9, v8, &task_info_outCnt))
      {
        int v6 = *(_DWORD *)(a1 + 420);
        *(_DWORD *)(a1 + 348) = v6;
        goto LABEL_20;
      }
LABEL_6:
      uint64_t result = 1;
      *(_DWORD *)(a1 + 436) = 1;
      return result;
    case 1:
      task_info_outCnt = 5;
      if (!task_info(*(_DWORD *)(a1 + 336), 0xAu, (task_info_t)(a1 + 416), &task_info_outCnt))
      {
        *(_DWORD *)(a1 + 348) = *(_DWORD *)(a1 + 424);
        int v6 = *(_DWORD *)(a1 + 420);
LABEL_20:
        *(_DWORD *)(a1 + 352) = v6;
        break;
      }
      goto LABEL_6;
  }
  *(_DWORD *)(a1 + 436) = 0;
  *(_DWORD *)(a1 + 344) = 0;
  if (task_threads(*(_DWORD *)(a1 + 336), (thread_act_array_t *)(a1 + 448), (mach_msg_type_number_t *)(a1 + 440)))
  {
    mach_port_deallocate(mach_task_self_, *v2);
    return 1;
  }
  *(_DWORD *)(a1 + 356) = 1;
  *(void *)(a1 + 456) = malloc_type_calloc(*(unsigned int *)(a1 + 440), 0x3CuLL, 0x1000040C2DCA394uLL);
  if (*(_DWORD *)(a1 + 440))
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    int v12 = 0;
    do
    {
      mach_msg_type_number_t thread_info_outCnt = 10;
      int v13 = thread_info(*(_DWORD *)(*(void *)(a1 + 448) + 4 * v11), 3u, (thread_info_t)(*(void *)(a1 + 456) + v10), &thread_info_outCnt);
      char v14 = *(void *)(a1 + 456);
      if (v13) {
        int v12 = 1;
      }
      else {
        *(_DWORD *)(a1 + 344) += *(_DWORD *)(v14 + v10 + 16);
      }
      if (sub_100006BF8(a1, *(_DWORD *)(*(void *)(a1 + 448) + 4 * v11), *(_DWORD *)(v14 + v10 + 20), (thread_info_t)(v14 + v10 + 40)))int v12 = 1; {
      char v15 = *(void *)(a1 + 456);
      }
      long long v16 = *(_DWORD *)(v15 + v10 + 24);
      switch(v16)
      {
        case 1:
          break;
        case 2:
          long long v16 = 5;
          break;
        case 3:
          if (*(int *)(v15 + v10 + 36) <= 20) {
            long long v16 = 3;
          }
          else {
            long long v16 = 4;
          }
          break;
        case 4:
          long long v16 = 2;
          break;
        case 5:
          long long v16 = 6;
          break;
        default:
          long long v16 = 7;
          break;
      }
      if (v16 < *(_DWORD *)(a1 + 340)) {
        *(_DWORD *)(a1 + 340) = v16;
      }
      if ((*(unsigned char *)(v15 + v10 + 28) & 1) == 0) {
        *(_DWORD *)(a1 + 356) = 0;
      }
      mach_port_deallocate(mach_task_self_, *(_DWORD *)(*(void *)(a1 + 448) + 4 * v11++));
      int v17 = *(unsigned int *)(a1 + 440);
      v10 += 60;
    }
    while (v11 < v17);
    int v18 = 4 * v17;
  }
  else
  {
    int v12 = 0;
    int v18 = 0;
  }
  *(_DWORD *)(a1 + 464) = v12;
  vm_deallocate(mach_task_self_, *(void *)(a1 + 448), v18);
  mach_port_deallocate(mach_task_self_, *(_DWORD *)(a1 + 336));
  return 0;
}

void sub_100007074()
{
}

void sub_100007098()
{
}

void sub_1000070B4()
{
}

void sub_1000070CC()
{
}

void sub_1000070E8()
{
}

void sub_100007104()
{
  byte_10000E148 = 1;
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return _bsearch(__key, __base, __nel, __width, __compar);
}

BOOL compat_mode(const char *function, const char *mode)
{
  return _compat_mode(function, mode);
}

char *__cdecl devname(dev_t a1, mode_t a2)
{
  return _devname(a1, a2);
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

int ferror(FILE *a1)
{
  return _ferror(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

const char *__cdecl fmtcheck(const char *a1, const char *a2)
{
  return _fmtcheck(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

group *__cdecl getgrgid(gid_t a1)
{
  return _getgrgid(a1);
}

group *__cdecl getgrnam(const char *a1)
{
  return _getgrnam(a1);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

const char *getprogname(void)
{
  return _getprogname();
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

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int isatty(int a1)
{
  return _isatty(a1);
}

uint64_t kpersona_pidinfo()
{
  return _kpersona_pidinfo();
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_vm_region(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return _mach_vm_region(target_task, address, size, flavor, info, infoCnt, object_name);
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

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

char *__cdecl nl_langinfo(nl_item a1)
{
  return _nl_langinfo(a1);
}

void perror(const char *a1)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int putchar(int a1)
{
  return _putchar(a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return _setlocale(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
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

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
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

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

int strvis(char *a1, const char *a2, int a3)
{
  return _strvis(a1, a2, a3);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

uint64_t task_read_for_pid()
{
  return _task_read_for_pid();
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return _task_threads(target_task, act_list, act_listCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return _thread_info(target_act, flavor, thread_info_out, thread_info_outCnt);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

char *__cdecl ttyname(int a1)
{
  return _ttyname(a1);
}

char *__cdecl user_from_uid(uid_t a1, int a2)
{
  return _user_from_uid(a1, a2);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

void warn(const char *a1, ...)
{
}

void warnx(const char *a1, ...)
{
}