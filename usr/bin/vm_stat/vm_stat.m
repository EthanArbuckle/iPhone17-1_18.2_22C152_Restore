void start(int a1, char *const *a2)
{
  int v4;
  int v5;
  double v6;
  double v7;
  int v8;
  int v9;

  qword_100008000 = (uint64_t)*a2;
  setlinebuf(__stdoutp);
  v4 = 0;
  while (1)
  {
    v5 = getopt(a1, a2, "c:");
    if (v5 != 99) {
      break;
    }
    v4 = strtol(optarg, 0, 10);
    if (v4 <= 0)
    {
      warnx("count must be positive");
      goto LABEL_15;
    }
  }
  if (v5 == -1)
  {
    if (a1 - optind == 1)
    {
      v6 = strtod(a2[optind], 0);
      if (v6 >= 0.0)
      {
        v7 = v6;
        dword_100008008 = mach_host_self();
        if (v7 != 0.0)
        {
          sub_1000035C0();
          if (v4 != 1)
          {
            v8 = 2;
            do
            {
              do
              {
                v9 = v8;
                usleep((int)(v7 * 1000000.0));
                sub_1000035C0();
                v8 = v9 + 1;
              }
              while (!v4);
            }
            while (v9 < v4);
          }
LABEL_18:
          exit(0);
        }
LABEL_17:
        sub_100003350();
        goto LABEL_18;
      }
    }
    else if (a1 - optind < 2)
    {
      dword_100008008 = mach_host_self();
      goto LABEL_17;
    }
  }
LABEL_15:
  fprintf(__stderrp, "usage: %s [[-c count] interval]\n", (const char *)qword_100008000);
  exit(1);
}

uint64_t sub_100003350()
{
  return printf("%-30s %16llu.\n", "Swapouts:", qword_100008088);
}

double sub_1000035C0()
{
  int v0 = dword_100008140;
  int v1 = ++dword_100008140;
  if (!v0)
  {
    sub_10000382C();
    int v1 = dword_100008140;
  }
  if (v1 >= 21) {
    dword_100008140 = 0;
  }
  sub_1000037BC((host_info64_t)&xmmword_100008010);
  sub_100003988((xmmword_100008010 - dword_10000806C), 8u);
  sub_100003988(DWORD1(xmmword_100008010), 8u);
  sub_100003988(dword_10000806C, 8u);
  sub_100003988(DWORD2(xmmword_100008010), 8u);
  sub_100003988(DWORD1(xmmword_100008090), 8u);
  sub_100003988(HIDWORD(xmmword_100008010), 8u);
  sub_100003988(dword_100008068, 8u);
  sub_100003988(qword_100008040 - qword_1000080D8, 8u);
  sub_100003988(qword_100008048 - qword_1000080E0, 8u);
  sub_100003988(qword_100008020 - qword_1000080B8, 8u);
  sub_100003988(qword_100008028 - qword_1000080C0, 8u);
  sub_100003988(qword_100008060 - qword_1000080F8, 8u);
  sub_100003988(DWORD2(xmmword_100008090), 0xBu);
  sub_100003988(HIDWORD(xmmword_100008090), 9u);
  sub_100003988(qword_1000080A0, 8u);
  sub_100003988(xmmword_100008090, 8u);
  sub_100003988(xmmword_100008070 - xmmword_100008108, 8u);
  sub_100003988(*((void *)&xmmword_100008070 + 1) - *((void *)&xmmword_100008108 + 1), 8u);
  sub_100003988(xmmword_100008030 - xmmword_1000080C8, 8u);
  sub_100003988(*((void *)&xmmword_100008030 + 1) - *((void *)&xmmword_1000080C8 + 1), 8u);
  sub_100003988(qword_100008080 - qword_100008118, 8u);
  sub_100003988(qword_100008088 - qword_100008120, 8u);
  putchar(10);
  xmmword_100008108 = xmmword_100008070;
  *(_OWORD *)&qword_100008118 = *(_OWORD *)&qword_100008080;
  xmmword_100008128 = xmmword_100008090;
  qword_100008138 = qword_1000080A0;
  xmmword_1000080C8 = xmmword_100008030;
  *(_OWORD *)&qword_1000080D8 = *(_OWORD *)&qword_100008040;
  xmmword_1000080E8 = xmmword_100008050;
  *(_OWORD *)&qword_1000080F8 = *(_OWORD *)&qword_100008060;
  double result = *(double *)&xmmword_100008010;
  xmmword_1000080A8 = xmmword_100008010;
  *(_OWORD *)&qword_1000080B8 = *(_OWORD *)&qword_100008020;
  return result;
}

uint64_t sub_1000037BC(host_info64_t host_info64_out)
{
  mach_msg_type_number_t host_info64_outCnt = 38;
  uint64_t result = host_statistics64(dword_100008008, 4, host_info64_out, &host_info64_outCnt);
  if (result)
  {
    fprintf(__stderrp, "%s: failed to get statistics. error %d\n", (const char *)qword_100008000, 1);
    exit(1);
  }
  return result;
}

double sub_10000382C()
{
  sub_1000037BC((host_info64_t)&xmmword_100008010);
  printf("Mach Virtual Memory Statistics: ");
  printf("(page size of %llu bytes)\n", vm_kernel_page_size);
  printf("%8s %8s %8s %8s %8s %8s %8s %8s %8s %8s %8s %8s %11s %9s %8s %8s %8s %8s %8s %8s %8s %8s\n", "free", "active", "specul", "inactive", "throttle", "wired", "prgable", "faults", "copy", "0fill", "reactive", "purged", "file-backed", "anonymous", "cmprssed", "cmprssor", "dcomprs", "comprs",
    "pageins",
    "pageout",
    "swapins",
    "swapouts");
  double result = 0.0;
  xmmword_1000080A8 = 0u;
  *(_OWORD *)&qword_1000080B8 = 0u;
  xmmword_1000080C8 = 0u;
  *(_OWORD *)&qword_1000080D8 = 0u;
  xmmword_1000080E8 = 0u;
  *(_OWORD *)&qword_1000080F8 = 0u;
  xmmword_100008108 = 0u;
  *(_OWORD *)&qword_100008118 = 0u;
  xmmword_100008128 = 0u;
  qword_100008138 = 0;
  return result;
}

uint64_t sub_100003988(unint64_t a1, unsigned int a2)
{
  if (a2 >= 0x4F) {
    int v3 = 79;
  }
  else {
    int v3 = a2;
  }
  if (snprintf(__str, 0x50uLL, "%*llu", v3, a1) > v3
    && snprintf(__str, 0x50uLL, "%*lluK", v3 - 1, a1 / 0x3E8) > v3
    && snprintf(__str, 0x50uLL, "%*lluM", v3 - 1, a1 / 0xF4240) > v3)
  {
    snprintf(__str, 0x50uLL, "%*lluG", v3 - 1, a1 / 0x3B9ACA00);
  }
  fputs(__str, __stdoutp);
  return putchar(32);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return _host_statistics64(host_priv, flavor, host_info64_out, host_info64_outCnt);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int setlinebuf(FILE *a1)
{
  return _setlinebuf(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

double strtod(const char *a1, char **a2)
{
  return _strtod(a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

void warnx(const char *a1, ...)
{
}