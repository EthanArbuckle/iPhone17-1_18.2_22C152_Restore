long long *sub_1000033AC(int a1)
{
  int v1;

  strcpy((char *)&qword_100008108, "Apple ARM");
  dword_100008100 = 3230803;
  switch(a1)
  {
    case 0:
      snprintf((char *)&xmmword_100008000, 0x100uLL, "%s v%s [%s, %s, %s, %s]", "Apple corecrypto Module");
      break;
    case 1:
      strcpy((char *)&xmmword_100008000, "Apple corecrypto Module");
      break;
    case 2:
      BYTE4(xmmword_100008000) = 0;
      v1 = 808334385;
      goto LABEL_7;
    case 3:
      BYTE4(xmmword_100008000) = 0;
      v1 = 1919251285;
LABEL_7:
      LODWORD(xmmword_100008000) = v1;
      break;
    case 4:
      strcpy((char *)&xmmword_100008000, "Software");
      break;
    case 5:
    case 6:
      snprintf((char *)&xmmword_100008000, 0x100uLL, "%s");
      break;
    default:
      strcpy((char *)&xmmword_100008000, "INVALID Module ID");
      break;
  }
  return &xmmword_100008000;
}

uint64_t start(int a1, const char **a2)
{
  uint64_t v17 = 0;
  __filename = 0;
  cc_clear();
  if (a1 >= 2)
  {
    LODWORD(v4) = 1;
    while (1)
    {
      v5 = a2[(int)v4];
      if (strcmp(v5, "-v") && strcmp(v5, "--verbose") && strcmp(v5, "-f") && strcmp(v5, "--force"))
      {
        if (!strcmp(v5, "-b") || !strcmp(v5, "--boot-arg"))
        {
          sub_100003974(&v17);
        }
        else
        {
          if (!strcmp(v5, "-d") || !strcmp(v5, "--disable"))
          {
            int v6 = v17 | 4;
          }
          else if (!strcmp(v5, "-F") || !strcmp(v5, "--fail"))
          {
            int v6 = v17 | 0x10;
          }
          else
          {
            if (strcmp(v5, "-N") && strcmp(v5, "--nointegrity"))
            {
              if (!strcmp(v5, "-m") || !strcmp(v5, "--mode"))
              {
                uint64_t v4 = (int)v4 + 1;
                LODWORD(v17) = strtoll(a2[v4], 0, 10);
              }
              else
              {
                if (strcmp(v5, "-t") && strcmp(v5, "--trace")) {
                  sub_1000039D8(a2);
                }
                LODWORD(v17) = v17 | 0x80;
                uint64_t v4 = (int)v4 + 1;
                __filename = (char *)a2[v4];
              }
              goto LABEL_25;
            }
            int v6 = v17 | 0x40;
          }
          LODWORD(v17) = v6;
        }
      }
LABEL_25:
      LODWORD(v4) = v4 + 1;
      if ((int)v4 >= a1) {
        goto LABEL_29;
      }
    }
  }
  sub_100003974(&v17);
LABEL_29:
  uint64_t v7 = v17;
  uint64_t v8 = fipspost_trace_vtable;
  fwrite("About to call the FIPS_POST function in the corecrypto.dylib\n", 0x3DuLL, 1uLL, __stderrp);
  if ((v7 & 0x80) != 0)
  {
    if (v8)
    {
      v11 = __stderrp;
      if (__filename)
      {
        fwrite("Tracing: enabled\n", 0x11uLL, 1uLL, __stderrp);
        v10 = fopen(__filename, "w");
        (*(void (**)(uint64_t, uint64_t (*)(FILE *, void *, size_t), FILE *))v8)(v7, sub_100003A20, v10);
        goto LABEL_36;
      }
      v16 = "Tracing: disabled, no trace file.\n";
    }
    else
    {
      v11 = __stderrp;
      v16 = "Tracing: disabled, not available.\n";
    }
    fwrite(v16, 0x22uLL, 1uLL, v11);
    fwrite("Tracing required by test parameters; exiting.\n", 0x2EuLL, 1uLL, __stderrp);
    exit(-1);
  }
  v9 = ", but available.";
  if (!v8) {
    v9 = (const char *)&unk_100003EE5;
  }
  fprintf(__stderrp, "Tracing: disabled%s\n", v9);
  v10 = 0;
LABEL_36:
  memset(&v19, 0, sizeof(v19));
  if (!dladdr(&_fipspost_post, &v19)) {
    fwrite("dladdr failed\n", 0xEuLL, 1uLL, __stderrp);
  }
  uint64_t v12 = fipspost_post();
  v13 = "false";
  if (!v12) {
    v13 = "true";
  }
  fprintf(__stderrp, "Returned from calling the FIPS_POST function in the corecrypto.dylib: result = %s\n", v13);
  if (v12) {
    fwrite("FIPS_POST failed!\n", 0x12uLL, 1uLL, __stderrp);
  }
  if (v10)
  {
    int v14 = (*(uint64_t (**)(uint64_t))(v8 + 8))(v12);
    fprintf(__stderrp, "Tracing returned: %d\n", v14);
    fclose(v10);
  }
  return v12;
}

uint64_t sub_100003974(_DWORD *a1)
{
  uint64_t result = os_parse_boot_arg_int();
  if (result)
  {
    *a1 = 0;
    return fprintf(__stderrp, "A fips_mode boot arg was set: 0x%x\n", 0);
  }
  return result;
}

void sub_1000039D8(const char **a1)
{
  v1 = __stderrp;
  v2 = *a1;
  v3 = sub_1000033AC(0);
  fprintf(v1, "Usage: %s [-dFN] [-m mode] [-t trace.out]\n\nExecute the FIPS POST tests under a variety of conditions.\n\t-b,--boot-arg   \tRead the \"fips_mode\" boot arg.\n\t-d,--disable    \tDisable testing and return success.\n\t-F,--fail       \tForce tests to fail, but continue testing.\n\t-N,--nointegrity\tBypass the integrity checks.\n\t-m,--mode mode  \tSpecify a discrete numerical fips_mode to test.\n\t-t,--trace file \tLog tracing output, if available, to the filename.\n\t                \tReturn an error if tracing is disabled.\n%s\n", v2, (const char *)v3);
  exit(-1);
}

uint64_t sub_100003A20(FILE *__stream, void *__ptr, size_t a3)
{
  if (fwrite(__ptr, 1uLL, a3, __stream) == a3) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t cc_clear()
{
  return _cc_clear();
}

int dladdr(const void *a1, Dl_info *a2)
{
  return _dladdr(a1, a2);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

uint64_t fipspost_post()
{
  return _fipspost_post();
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint64_t os_parse_boot_arg_int()
{
  return _os_parse_boot_arg_int();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}