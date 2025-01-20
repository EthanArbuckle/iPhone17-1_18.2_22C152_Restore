uint64_t start(int a1, char *const *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  unsigned int v13;
  const char *v14;
  pid_t v15;
  uint64_t v16;
  FILE *v17;
  char *v18;
  uint64_t v19;
  vm_size_t v21;
  unint64_t v22;
  FILE *v23;
  int v24;
  int *v25;
  char *v26;
  vm_size_t v27;
  vm_size_t v28;
  uint64_t v29;
  int *v30;
  int v31;
  char *__endptr[3];
  size_t v33;
  unint64_t v34;
  vfsconf v35;

  memset(&v35, 0, sizeof(v35));
  v4 = getopt(a1, a2, "io:en:s:h") << 24;
  if (v4 == -16777216)
  {
    v31 = 0;
    v5 = 0;
    LODWORD(v6) = 0;
    v7 = 0;
    v8 = 0;
LABEL_33:
    if (optind != a1 - 1 || (v5 & v6 & 1) != 0)
    {
LABEL_35:
      puts("usage: mount_tmpfs [-o options] [-i | -e] [-n max_nodes] [-s max_mem_size] <directory>");
      return 64;
    }
    v14 = a2[optind];
    if (getvfsbyname("tmpfs", &v35))
    {
      LODWORD(__endptr[0]) = 0;
      v15 = fork();
      if (v15 == -1) {
        goto LABEL_41;
      }
      if (!v15)
      {
        execl("/sbin/kextload", "/sbin/kextload", "/System/Library/Extensions/tmpfs.kext", 0);
        v30 = __error();
        exit(*v30);
      }
      if (wait4(v15, (int *)__endptr, 0, 0) != v15 || ((uint64_t)__endptr[0] & 0x7F) != 0)
      {
LABEL_41:
        v16 = *__error();
        if (v16)
        {
LABEL_42:
          fprintf(__stderrp, "could not load kernel extension, return code %d\n", v16);
          return v16;
        }
      }
      else
      {
        v16 = BYTE1(__endptr[0]);
        if (BYTE1(__endptr[0])) {
          goto LABEL_42;
        }
      }
      if (getvfsbyname("tmpfs", &v35)) {
        sub_100003C0C();
      }
    }
    v34 = 0;
    v21 = vm_kernel_page_size;
    v33 = 8;
    if (sysctlbyname("hw.memsize", &v34, &v33, 0, 0))
    {
      v22 = 1000000 * v21;
      v23 = __stderrp;
      v24 = *__error();
      v25 = __error();
      v26 = strerror(*v25);
      fprintf(v23, "Could not get the hw memory size, errno = %d (%s)\n", v24, v26);
    }
    else
    {
      v22 = v34 >> 1;
    }
    v27 = vm_kernel_page_size;
    if (v7)
    {
      v28 = (v7 + vm_kernel_page_size - 1) / vm_kernel_page_size * vm_kernel_page_size;
      if (v28 <= v22)
      {
        v22 = (v7 + vm_kernel_page_size - 1) / vm_kernel_page_size * vm_kernel_page_size;
      }
      else
      {
        fprintf(__stderrp, "Desired memsize %lld too large - defaulting to %lld bytes\n", v28, v22);
        v27 = vm_kernel_page_size;
      }
    }
    v29 = 100000;
    if (v8) {
      v29 = v8;
    }
    __endptr[0] = (char *)(v22 / v27);
    __endptr[1] = (char *)v29;
    __endptr[2] = (char *)((v5 ^ 1) & 1);
    if (mount("tmpfs", v14, v31, __endptr)) {
      sub_100003BF0();
    }
    return 0;
  }
  v8 = 0;
  v7 = 0;
  v9 = 0;
  v5 = 0;
  v31 = 0;
  while (2)
  {
    v6 = 1;
    switch(v4 >> 24)
    {
      case 'e':
        v5 = 1;
        goto LABEL_15;
      case 'h':
        puts("usage: mount_tmpfs [-o options] [-i | -e] [-n max_nodes] [-s max_mem_size] <directory>");
        return 0;
      case 'i':
        goto LABEL_32;
      case 'n':
        v8 = strtoll(optarg, 0, 10);
        v6 = v9;
        if (v8 > 0) {
          goto LABEL_32;
        }
        v17 = __stderrp;
        v18 = optarg;
        v19 = 110;
        goto LABEL_45;
      case 'o':
        LODWORD(__endptr[0]) = 0;
        LODWORD(v34) = 0;
        getmnt_silent = 0;
        if (!getmntopts()) {
          err(1, "error parsing mount options");
        }
        v31 = (int)__endptr[0];
        freemntopts();
LABEL_15:
        v6 = v9;
        goto LABEL_32;
      case 's':
        v10 = optarg;
        __endptr[0] = 0;
        v11 = strtoll(optarg, __endptr, 10);
        v7 = v11;
        v12 = __endptr[0];
        v13 = *__endptr[0];
        if (v13 > 0x66)
        {
          if (*__endptr[0] <= 0x6Cu)
          {
            if (v13 != 103)
            {
              if (v13 != 107) {
                goto LABEL_29;
              }
              goto LABEL_19;
            }
            goto LABEL_26;
          }
          if (v13 != 109)
          {
            if (v13 != 116) {
              goto LABEL_29;
            }
            goto LABEL_25;
          }
LABEL_27:
          v7 = v11 << 20;
          goto LABEL_28;
        }
        if (*__endptr[0] > 0x4Cu)
        {
          if (v13 != 77)
          {
            if (v13 != 84) {
              goto LABEL_29;
            }
LABEL_25:
            v7 = v11 << 40;
            goto LABEL_28;
          }
          goto LABEL_27;
        }
        if (v13 != 71)
        {
          if (v13 != 75) {
            goto LABEL_29;
          }
LABEL_19:
          v7 = v11 << 10;
          goto LABEL_28;
        }
LABEL_26:
        v7 = v11 << 30;
LABEL_28:
        v12 = __endptr[0] + 1;
LABEL_29:
        if (v12 != v10 && !*v12)
        {
          v6 = v9;
          if (v7 > 0)
          {
LABEL_32:
            v4 = getopt(a1, a2, "io:en:s:h") << 24;
            v9 = v6;
            if (v4 == -16777216) {
              goto LABEL_33;
            }
            continue;
          }
        }
        v17 = __stderrp;
        v18 = optarg;
        v19 = 115;
LABEL_45:
        fprintf(v17, "invalid value for '-%c': %s\n", v19, v18);
        return 64;
      default:
        goto LABEL_35;
    }
  }
}

void sub_100003BF0()
{
}

void sub_100003C0C()
{
}

int *__error(void)
{
  return ___error();
}

void err(int a1, const char *a2, ...)
{
}

int execl(const char *__path, const char *__arg0, ...)
{
  return _execl(__path, __arg0);
}

void exit(int a1)
{
}

pid_t fork(void)
{
  return _fork();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

uint64_t freemntopts()
{
  return _freemntopts();
}

uint64_t getmntopts()
{
  return _getmntopts();
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

int getvfsbyname(const char *a1, vfsconf *a2)
{
  return _getvfsbyname(a1, a2);
}

int mount(const char *a1, const char *a2, int a3, void *a4)
{
  return _mount(a1, a2, a3, a4);
}

int puts(const char *a1)
{
  return _puts(a1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  return _wait4(a1, a2, a3, a4);
}