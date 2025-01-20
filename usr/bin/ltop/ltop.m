uint64_t start(int a1, char **a2)
{
  int *v4;
  int v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  int v12;
  _DWORD *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _DWORD *v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  FILE *v47;
  const char *v48;
  size_t v49;
  int v50;
  int v51;
  size_t v52;
  int v53[4];
  long long v54;
  long long v55;

  qword_100008040 = (uint64_t)*a2;
  v4 = &dword_100008000;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        v5 = getopt(a1, a2, "g:hdLp:r:");
        if (v5 <= 103) {
          break;
        }
        switch(v5)
        {
          case 'p':
            dword_100008000 = atoi(optarg);
            break;
          case 'r':
            qword_100008010 = (uint64_t)optarg;
            break;
          case 'h':
            sub_10000374C();
            goto LABEL_115;
          default:
LABEL_117:
            sub_10000374C();
LABEL_110:
            exit(1);
        }
      }
      if (v5 <= 102) {
        break;
      }
      qword_100008008 = (uint64_t)optarg;
    }
    if (v5 != 100) {
      break;
    }
    dword_100008018 = 1;
  }
  if (v5 != -1)
  {
    if (v5 == 76)
    {
      sub_100003780();
      sub_100003874();
LABEL_115:
      exit(0);
    }
    goto LABEL_117;
  }
  if (optind == a1) {
    v50 = 0;
  }
  else {
    v50 = atoi(a2[optind]);
  }
  v6 = (const char *)qword_100008008;
  v7 = (const char *)qword_100008010;
  if (qword_100008008 && qword_100008010)
  {
    v47 = __stderrp;
    v48 = "Cannot specify both a resource and a group\n";
    v49 = 43;
LABEL_109:
    fwrite(v48, v49, 1uLL, v47);
    goto LABEL_110;
  }
  if (qword_100008008)
  {
    if (!qword_100008028)
    {
      sub_100003780();
      v6 = (const char *)qword_100008008;
    }
    v8 = dword_100008030;
    if (dword_100008030 < 1)
    {
LABEL_24:
      fprintf(__stderrp, "No such group: %s\n");
      goto LABEL_110;
    }
    v9 = (const char *)(qword_100008028 + 32);
    while (strcmp(v6, v9))
    {
      v9 += 96;
      if (!--v8) {
        goto LABEL_24;
      }
    }
    v7 = (const char *)qword_100008010;
  }
  if (!v7) {
    goto LABEL_34;
  }
  if (!qword_100008028)
  {
    sub_100003780();
    v7 = (const char *)qword_100008010;
  }
  v10 = dword_100008030;
  if (dword_100008030 < 1)
  {
LABEL_33:
    fprintf(__stderrp, "No such resource: %s\n");
    goto LABEL_110;
  }
  v11 = (const char *)qword_100008028;
  while (strcmp(v7, v11))
  {
    v11 += 96;
    if (!--v10) {
      goto LABEL_33;
    }
  }
  do
  {
LABEL_34:
    sub_100003780();
    if (*v4 < 0)
    {
      *(void *)v53 = 0x600000001;
      v51 = 0;
      v52 = 4;
      if (sysctl(v53, 2u, &v51, &v52, 0, 0) < 0) {
        sub_100003B08();
      }
      v12 = v51;
    }
    else
    {
      v12 = 1;
    }
    v13 = malloc_type_malloc(4 * v12, 0xD6C55D12uLL);
    if (!v13) {
      sub_100003B28();
    }
    v14 = v13;
    if (*v4 < 0)
    {
      v15 = proc_listallpids(v13, 4 * v12);
      if ((v15 & 0x80000000) != 0) {
        sub_100003B48();
      }
      v12 = v15;
      qsort(v14, v15, 4uLL, (int (__cdecl *)(const void *, const void *))sub_1000039A0);
    }
    else
    {
      *v13 = *v4;
    }
    if (v12 >= 1)
    {
      v16 = 0;
      v17 = v12;
      do
      {
        v18 = *((_DWORD *)v14 + v16);
        if ((v18 & 0x80000000) == 0)
        {
          v54 = 0u;
          v55 = 0u;
          *(_OWORD *)v53 = 0u;
          *__error() = 0;
          if ((ledger() & 0x80000000) != 0)
          {
            if (*__error() != 2 && *__error() != 3) {
              sub_100003B68();
            }
          }
          else
          {
            v19 = qword_100008038;
            if (qword_100008038)
            {
              while ((void)v55 != *(void *)v19)
              {
                v19 = *(void *)(v19 + 40);
                if (!v19) {
                  goto LABEL_50;
                }
              }
              v21 = *(void *)(v19 + 16);
            }
            else
            {
LABEL_50:
              v20 = malloc_type_malloc(0x30uLL, 0x10200406083FE87uLL);
              if (!v20)
              {
                v47 = __stderrp;
                v48 = "Out of memory";
                v49 = 13;
                goto LABEL_109;
              }
              v19 = (uint64_t)v20;
              *(void *)v20 = v55;
              v21 = *((void *)&v55 + 1);
              v22 = qword_100008038;
              v20[2] = 0;
              *((void *)v20 + 2) = v21;
              *((void *)v20 + 3) = 0;
              *((void *)v20 + 4) = 0;
              *((void *)v20 + 5) = v22;
              qword_100008038 = (uint64_t)v20;
            }
            if (v21 >= dword_100008030) {
              v21 = dword_100008030;
            }
            v52 = v21;
            v23 = malloc_type_malloc(48 * v21, 0x49E4006AuLL);
            if ((ledger() & 0x80000000) != 0) {
              sub_100003B68();
            }
            *(void *)(v19 + 24) = v23;
            *(_DWORD *)(v19 + 8) = 1;
            v24 = qword_100008020;
            if (qword_100008020)
            {
              while (*(_DWORD *)v24 != v18)
              {
                v24 = *(void *)(v24 + 48);
                if (!v24) {
                  goto LABEL_62;
                }
              }
            }
            else
            {
LABEL_62:
              v25 = (char *)malloc_type_malloc(0x38uLL, 0x1020040D8E0519AuLL);
              if (!v25)
              {
                v47 = __stderrp;
                v48 = "Out of memory\n";
                v49 = 14;
                goto LABEL_109;
              }
              v24 = (uint64_t)v25;
              if (!proc_name(v18, v25 + 8, 0x20u)) {
                __strlcpy_chk();
              }
              *(_DWORD *)v24 = v18;
              v26 = qword_100008020;
              *(void *)(v24 + 40) = v19;
              *(void *)(v24 + 48) = v26;
              qword_100008020 = v24;
            }
            *(_DWORD *)(v24 + 4) = 1;
          }
        }
        ++v16;
      }
      while (v16 != v17);
    }
    free(v14);
    printf("\n%5s %32s %32s %10s  %10s  %10s  %10s  %10s \n", "PID", "COMMAND", "RESOURCE", "CREDITS", "DEBITS", "BALANCE", "LIMIT", "PERIOD");
    v27 = qword_100008020;
    if (!qword_100008020) {
      goto LABEL_115;
    }
    v28 = 0;
    do
    {
      while (1)
      {
        if (!*(_DWORD *)(v27 + 4)) {
          goto LABEL_87;
        }
        printf("%5d %32s ", *(_DWORD *)v27, (const char *)(v27 + 8));
        v29 = *(uint64_t **)(v27 + 40);
        if (v29[2] >= 1) {
          break;
        }
        v28 = 0;
        v27 = *(void *)(v27 + 48);
        if (!v27) {
          goto LABEL_115;
        }
      }
      v30 = 0;
      v31 = 0;
      v28 = 0;
      v32 = v29[4];
      v33 = (const char *)qword_100008008;
      v34 = (uint64_t *)(v29[3] + 16);
      v35 = (void *)(v32 + 8);
      do
      {
        if ((!v33 || !strcmp(v33, (const char *)(qword_100008028 + v30 + 32)))
          && (!qword_100008010 || !strcmp((const char *)qword_100008010, (const char *)(qword_100008028 + v30))))
        {
          if (v28) {
            printf("%5s %32s ", "", "");
          }
          printf("%32s ", (const char *)(qword_100008028 + v30));
          v36 = *(v34 - 1);
          if (v32)
          {
            sub_1000039B0(v36, v36 - *v35);
            sub_1000039B0(*v34, *v34 - v35[1]);
            v37 = *(v34 - 2);
            v38 = v37 - *(v35 - 1);
          }
          else
          {
            sub_1000039B0(v36, 0);
            sub_1000039B0(*v34, 0);
            v38 = 0;
            v37 = *(v34 - 2);
          }
          sub_1000039B0(v37, v38);
          v39 = v34[1];
          if (v39 == 0x7FFFFFFFFFFFFFFFLL)
          {
            printf("%10s  %10s", "none", "-");
          }
          else
          {
            sub_1000039B0(v39, 0);
            sub_1000039B0(v34[2], 0);
          }
          ++v28;
          putchar(10);
          v33 = (const char *)qword_100008008;
          v29 = *(uint64_t **)(v27 + 40);
        }
        ++v31;
        v30 += 96;
        v34 += 6;
        v35 += 6;
      }
      while (v29[2] > v31);
LABEL_87:
      v27 = *(void *)(v27 + 48);
    }
    while (v27);
    if (!v28) {
      goto LABEL_115;
    }
    v40 = qword_100008020;
    v4 = &dword_100008000;
    if (qword_100008020)
    {
      do
      {
        v41 = *(void *)(v40 + 48);
        if (*(_DWORD *)(v40 + 4))
        {
          *(_DWORD *)(v40 + 4) = 0;
        }
        else
        {
          qword_100008020 = *(void *)(v40 + 48);
          free((void *)v40);
        }
        v40 = v41;
      }
      while (v41);
    }
    v42 = qword_100008038;
    if (qword_100008038)
    {
      do
      {
        v43 = *(void *)(v42 + 40);
        if (*(_DWORD *)(v42 + 8))
        {
          *(_DWORD *)(v42 + 8) = 0;
          free(*(void **)(v42 + 32));
          v44 = *(void *)(v42 + 24);
          *(void *)(v42 + 24) = 0;
          *(void *)(v42 + 32) = v44;
        }
        else
        {
          qword_100008038 = *(void *)(v42 + 40);
          free(*(void **)(v42 + 24));
          v45 = *(void **)(v42 + 32);
          if (v45) {
            free(v45);
          }
          free((void *)v42);
        }
        v42 = v43;
      }
      while (v43);
    }
    free((void *)qword_100008028);
    qword_100008028 = 0;
    sleep(v50);
  }
  while (v50);
  return 0;
}

uint64_t sub_10000374C()
{
  return printf("%s [-hdL] [-g group] [-p pid] [-r resource] [interval]\n", (const char *)qword_100008040);
}

uint64_t sub_100003780()
{
  int v4 = dword_100008030 + 5;
  v0 = malloc_type_malloc(96 * (dword_100008030 + 5), 0x1000040565EDBD2uLL);
  if (!v0)
  {
LABEL_6:
    fwrite("Out of memory\n", 0xEuLL, 1uLL, __stderrp);
    exit(1);
  }
  v1 = v0;
  while (1)
  {
    uint64_t result = ledger();
    if ((result & 0x80000000) != 0) {
      sub_100003B88();
    }
    int v3 = dword_100008030 + 5;
    dword_100008030 = v4;
    if (v4 != v3) {
      break;
    }
    free(v1);
    int v4 = dword_100008030 + 5;
    v1 = malloc_type_malloc(96 * (dword_100008030 + 5), 0x1000040565EDBD2uLL);
    if (!v1) {
      goto LABEL_6;
    }
  }
  qword_100008028 = (uint64_t)v1;
  return result;
}

uint64_t sub_100003874()
{
  puts("Resources being tracked:");
  uint64_t result = printf("\t%10s  %15s  %8s\n", "GROUP", "RESOURCE", "UNITS");
  int v1 = dword_100008030;
  if (dword_100008030 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = qword_100008028;
    do
    {
      if (*(unsigned char *)(v4 + 96 * v3) && v3 < v1)
      {
        v5 = (const char *)(v4 + 96 * v3 + 32);
        int v6 = v3;
        uint64_t v7 = v2;
        do
        {
          uint64_t result = strcmp((const char *)(v4 + v7 + 32), v5);
          if (!result)
          {
            uint64_t result = printf("\t%10s  %15s  %8s\n", (const char *)(v4 + v7 + 32), (const char *)(v4 + v7), (const char *)(v4 + v7 + 64));
            *(unsigned char *)(qword_100008028 + v7) = 0;
            uint64_t v4 = qword_100008028;
            int v1 = dword_100008030;
          }
          v7 += 96;
          ++v6;
        }
        while (v1 > v6);
      }
      ++v3;
      v2 += 96;
    }
    while (v3 < v1);
  }
  return result;
}

uint64_t sub_1000039A0(_DWORD *a1, _DWORD *a2)
{
  return (*a2 - *a1);
}

uint64_t sub_1000039B0(uint64_t a1, uint64_t a2)
{
  if (dword_100008018) {
    a1 = a2;
  }
  if (a1 == 0x7FFFFFFFFFFFFFFFLL) {
    return printf("%10s  ");
  }
  if (a1 >= 0) {
    unint64_t v4 = a1;
  }
  else {
    unint64_t v4 = -a1;
  }
  v5 = "";
  if (v4 >= 0x186A1) {
    v5 = "K";
  }
  if (v4 >= 0x989681) {
    v5 = "M";
  }
  if (v4 >= 0x2540BE401) {
    int v6 = "G";
  }
  else {
    int v6 = v5;
  }
  strlen(v6);
  return printf("%*lld%s%c ");
}

void sub_100003B08()
{
}

void sub_100003B28()
{
}

void sub_100003B48()
{
}

void sub_100003B68()
{
}

void sub_100003B88()
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

int atoi(const char *a1)
{
  return _atoi(a1);
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

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

uint64_t ledger()
{
  return _ledger();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void perror(const char *a1)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return _proc_listallpids(buffer, buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}