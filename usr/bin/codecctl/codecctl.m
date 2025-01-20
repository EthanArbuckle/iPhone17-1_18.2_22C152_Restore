unint64_t sub_100002584(FILE *a1, FILE *a2, unint64_t a3, unint64_t a4, int a5)
{
  unint64_t v10;
  unint64_t v11;
  char __str[32];

  do
  {
    do
    {
      printf("> ");
      fflush(__stdoutp);
      fgets(__str, 32, a1);
      v10 = strtoul(__str, 0, a5);
    }
    while (v10 < a3);
    v11 = v10;
  }
  while (v10 > a4);
  if (a2)
  {
    fprintf(a2, "%lu\n", v10);
    fflush(a2);
  }
  return v11;
}

uint64_t sub_100002678(char *__str, int __base)
{
  if (*__str != 48 || __str[1] != 98) {
    return strtoul(__str, 0, __base);
  }
  int v3 = __str[2];
  if ((v3 & 0xFE) != 0x30) {
    return 0;
  }
  uint64_t result = 0;
  v5 = __str + 3;
  do
  {
    uint64_t result = (v3 == 49) | (unint64_t)(2 * result);
    int v6 = *v5++;
    int v3 = v6;
  }
  while ((v6 & 0xFE) == 0x30);
  return result;
}

void sub_1000026E4(void *a1)
{
}

void *sub_1000026F8(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000027AC();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    int v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_1000027AC()
{
}

void sub_1000027C4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100002820(exception, a1);
}

void sub_10000280C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100002820(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100002854()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_100002888(unsigned char *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_1000027AC();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    size_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void *sub_100002928(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  if (v13)
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_100002ACC(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_100002A64(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x100002A44);
}

void sub_100002AB8(_Unwind_Exception *a1)
{
}

uint64_t sub_100002ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      sub_100002C54(__p, v12, __c);
      char v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_100002C38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100002C54(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000027AC();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

uint64_t *sub_100002D00(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      size_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            int v9 = (uint64_t **)a2[2];
          }
          else
          {
            int v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *int v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t sub_100002E98(uint64_t a1)
{
  *(unsigned char *)a1 = 1;
  *(void *)(a1 + 4) = 0x1000000001;
  *(void *)(a1 + 16) = __stdoutp;
  ioctl(0, 0x40087468uLL, v4);
  if (v5)
  {
    if (v5 < 0x11u) {
      unsigned int v2 = 1;
    }
    else {
      unsigned int v2 = v5 / 0x11u;
    }
    *(_DWORD *)(a1 + 4) = v2;
  }
  return a1;
}

uint64_t sub_100002F24()
{
  ioctl(0, 0x40087468uLL, v1);
  return v2;
}

FILE *sub_100002F60(uint64_t a1)
{
  uint64_t result = *(FILE **)(a1 + 16);
  if (result) {
    BOOL v3 = result == __stdoutp;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && result != __stderrp)
  {
    uint64_t result = (FILE *)fclose(result);
    *(void *)(a1 + 16) = 0;
  }
  return result;
}

uint64_t sub_100002FB4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100002FDC(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)(result + 4) = a2;
    *(unsigned char *)uint64_t result = 0;
  }
  return result;
}

uint64_t sub_100002FEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 8) = a2;
  return result;
}

uint64_t sub_100002FF4(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    if (!*(void *)(a2 + 8)) {
      return 0;
    }
    size_t v4 = *(const char **)a2;
  }
  else
  {
    size_t v4 = (const char *)a2;
    if (!*(unsigned char *)(a2 + 23)) {
      return 0;
    }
  }
  unsigned __int16 v5 = fopen(v4, "w");
  if (v5)
  {
    int v6 = v5;
    sub_100002F60(a1);
    *(void *)(a1 + 16) = v6;
    return 1;
  }
  if (*(char *)(a2 + 23) >= 0) {
    int v8 = (const char *)a2;
  }
  else {
    int v8 = *(const char **)a2;
  }
  fprintf(__stderrp, "Unable to open output file %s\n", v8);
  return 0;
}

uint64_t sub_1000030A0(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v2 = *(FILE **)(a1 + 16);
  if (*(char *)(a2 + 23) >= 0) {
    BOOL v3 = (const char *)a2;
  }
  else {
    BOOL v3 = *(const char **)a2;
  }
  return fprintf(v2, "%s\n", v3);
}

uint64_t sub_1000030E0(uint64_t result, int **a2, int a3, int a4)
{
  size_t v4 = *a2;
  v20 = a2[1];
  if (*a2 != v20)
  {
    uint64_t v7 = result;
    do
    {
      unsigned int v8 = *(_DWORD *)(v7 + 4);
      if (a3 == 4 && *(unsigned char *)v7)
      {
        double v9 = (double)v8;
        if (*(_DWORD *)(v7 + 8) == 10) {
          double v10 = v9 / 1.8;
        }
        else {
          double v10 = v9 / 1.5;
        }
        unsigned int v8 = v10;
      }
      if (v8 <= 1) {
        unsigned int v11 = 1;
      }
      else {
        unsigned int v11 = v8;
      }
      uint64_t v12 = *((void *)v4 + 1);
      uint64_t v13 = *((void *)v4 + 2) - v12;
      if (v13)
      {
        unsigned int v14 = 0;
        LODWORD(v15) = 0;
        int v16 = *v4;
        unint64_t v17 = v13 >> 2;
        unsigned int v18 = (v11 + ((unint64_t)(*((void *)v4 + 2) - v12) >> 2) - 1) / v11;
        do
        {
          unint64_t v19 = v15 / v11 + v14 * v18;
          if (v17 > v19) {
            sub_100003268(v7, (v16 + v19 * a4), *(_DWORD *)(v12 + 4 * v19), a3, 0);
          }
          if (v14 + 1 == v11 || v14 == -1) {
            fputc(10, *(FILE **)(v7 + 16));
          }
          else {
            fwrite("  ", 2uLL, 1uLL, *(FILE **)(v7 + 16));
          }
          unint64_t v15 = (v15 + 1);
          uint64_t v12 = *((void *)v4 + 1);
          unint64_t v17 = (*((void *)v4 + 2) - v12) >> 2;
          unsigned int v14 = v15 % v11;
        }
        while (v17 > v15 || v14);
      }
      uint64_t result = fputc(10, *(FILE **)(v7 + 16));
      v4 += 8;
    }
    while (v4 != v20);
  }
  return result;
}

uint64_t sub_100003268(uint64_t a1, uint64_t a2, unsigned int a3, int a4, int a5)
{
  int v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  *(_OWORD *)__str = 0u;
  long long v16 = 0u;
  int v9 = *(_DWORD *)(a1 + 8);
  if (v9 == 10)
  {
    switch(a4)
    {
      case 4:
        snprintf(__str, 0x64uLL, "R%012ud: %012d");
        break;
      case 2:
        snprintf(__str, 0x64uLL, "R%06ud: %06d");
        break;
      case 1:
        snprintf(__str, 0x64uLL, "R%06ud: %04d");
        break;
      default:
        fprintf(__stderrp, "Unexpected register width (%d).  Supported widths are 1 and 4\n");
        break;
    }
  }
  else if (v9 == 16)
  {
    switch(a4)
    {
      case 4:
        snprintf(__str, 0x64uLL, "%8Xh: 0x%08x");
        break;
      case 2:
        snprintf(__str, 0x64uLL, "%8Xh: 0x%04x");
        break;
      case 1:
        snprintf(__str, 0x64uLL, "%8Xh: 0x%02x");
        break;
      default:
        fprintf(__stderrp, "Unexpected register width (%d).  Supported widths are 1, 2, and 4\n");
        break;
    }
  }
  uint64_t result = fputs(__str, *(FILE **)(a1 + 16));
  if (a5)
  {
    fwrite("    ", 4uLL, 1uLL, *(FILE **)(a1 + 16));
    unint64_t v11 = (8 * a4);
    if (v11)
    {
      do
      {
        if ((a3 >> (v11 - 1))) {
          int v12 = 49;
        }
        else {
          int v12 = 48;
        }
        fputc(v12, *(FILE **)(a1 + 16));
      }
      while (v11-- > 1);
    }
    unsigned int v14 = *(FILE **)(a1 + 16);
    return fputc(10, v14);
  }
  return result;
}

uint64_t sub_10000347C(uint64_t a1, unsigned int *a2, int a3)
{
  int v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  *(_OWORD *)__str = 0u;
  long long v7 = 0u;
  int v4 = *(_DWORD *)(a1 + 8);
  if (v4 == 10)
  {
    snprintf(__str, 0x64uLL, "R%0*d: bitmask = %0*d, val = %0*d (patched count: %d)\n", (3 * a3));
  }
  else if (v4 == 16)
  {
    snprintf(__str, 0x64uLL, "%8Xh: bitmask = 0x%0*x, val = 0x%0*x (patched count: %d)\n", *a2);
  }
  return fputs(__str, *(FILE **)(a1 + 16));
}

double sub_10000355C(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)a1 = a1 + 8;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 56) = -1;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)&double result = 16;
  *(void *)(a1 + 88) = 16;
  *(_WORD *)(a1 + 96) = 256;
  return result;
}

size_t sub_1000035A0(uint64_t a1, int a2)
{
  BOOL v3 = __stderrp;
  int v4 = getprogname();
  fprintf(v3, "usage: %s [-d | -x] [-p] [-u] [-H val] [-c width] [-f file] [codec|index|default] [sequence...]\n", v4);
  fwrite("\t-d\tUse decimal register numbers\n", 0x21uLL, 1uLL, __stderrp);
  fwrite("\t-x\tUse hex register numbers\n", 0x1DuLL, 1uLL, __stderrp);
  fwrite("\t-H\tForce headphone detect: true/false\n", 0x27uLL, 1uLL, __stderrp);
  fwrite("\t-p\tPing codec (set exit status based on success)\n", 0x32uLL, 1uLL, __stderrp);
  fwrite("\t-u\tMatch codec on HAL UID rather than name\n", 0x2CuLL, 1uLL, __stderrp);
  fwrite("\t-c\tSet the column width (default is to expand to fit screen\n", 0x3DuLL, 1uLL, __stderrp);
  fwrite("\t-f\tDump output to file\n", 0x18uLL, 1uLL, __stderrp);
  fwrite("\t-a\tDump all codec settings then quit\n", 0x26uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("Sequence options:", 0x11uLL, 1uLL, __stderrp);
  fwrite("\t<reg> <value> <sleep_ms> \tWrite register\n", 0x2AuLL, 1uLL, __stderrp);
  fwrite("\tdump                     \tRead all registers\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\tread <reg>               \tRead single register\n", 0x30uLL, 1uLL, __stderrp);
  fwrite("\tread <reg>,<count>       \tRead register range\n", 0x2FuLL, 1uLL, __stderrp);
  fwrite("\twrite <reg> <value>      \tWrite single register\n", 0x31uLL, 1uLL, __stderrp);
  fwrite("\tmask <reg> <mask> <value>\tMask and write single register\n", 0x3AuLL, 1uLL, __stderrp);
  fwrite("\tpatch <reg> <mask> <value>\tThis command can patch a register bitmask value similar to above\n\t                          \t'mask' command format, but only by patching that bitmask value in driver.\n\t                          \tWhen the underlying driver write a bitmask value during the runtime,\n\t                          \tthe (address matched) bitmask patch will be applied. This can be used\n\t                          \tas driver tunable for some parameters, control logic register should\n\t                          \tnot be patched.\n", 0x213uLL, 1uLL, __stderrp);
  fwrite("\tpatch reset\t\t\tRemove all register bitmask patch, it will rest the underlying driver to its default behavior.\n", 0x6EuLL, 1uLL, __stderrp);
  fwrite("\tpatch list\t\t\tList all patched register bitmask list, it also show how many times underlying\n\t          \t\t\tdriver actually write the patched bitmask.\n", 0x96uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  size_t result = fwrite("Specify no sequence for interactive mode\n\n", 0x2AuLL, 1uLL, __stderrp);
  if (a2) {
    exit(0);
  }
  return result;
}

uint64_t sub_1000037E0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 97);
}

uint64_t sub_1000037E8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_1000037F0(uint64_t a1, std::string *this)
{
  int v4 = std::string::compare(this, "default");
  unsigned __int16 v5 = (std::string *)(a1 + 32);
  if (v4)
  {
    std::string::operator=(v5, this);
  }
  else
  {
    if (*(char *)(a1 + 55) < 0)
    {
      *(void *)(a1 + 40) = 5;
      unsigned __int16 v5 = *(std::string **)(a1 + 32);
    }
    else
    {
      *(unsigned char *)(a1 + 55) = 5;
    }
    strcpy((char *)v5, "Codec");
    *(unsigned char *)(a1 + 96) = 1;
  }
  return 1;
}

char *sub_10000387C@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[55] < 0) {
    return (char *)sub_100002888((unsigned char *)a2, *((void **)result + 4), *((void *)result + 5));
  }
  *(_OWORD *)a2 = *((_OWORD *)result + 2);
  *(void *)(a2 + 16) = *((void *)result + 6);
  return result;
}

uint64_t sub_1000038A8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

BOOL sub_1000038B0(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (v2) {
    std::string::operator=((std::string *)(a1 + 64), (const std::string *)a2);
  }
  else {
    fwrite("Empty output file name\n", 0x17uLL, 1uLL, __stderrp);
  }
  return v2 != 0;
}

char *sub_100003918@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[87] < 0) {
    return (char *)sub_100002888((unsigned char *)a2, *((void **)result + 8), *((void *)result + 9));
  }
  *(_OWORD *)a2 = *((_OWORD *)result + 4);
  *(void *)(a2 + 16) = *((void *)result + 10);
  return result;
}

uint64_t sub_100003944(uint64_t a1)
{
  return *(unsigned int *)(a1 + 88);
}

uint64_t sub_10000394C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 92);
}

uint64_t sub_100003954(uint64_t a1, int a2, char **a3)
{
  while (2)
  {
    while (1)
    {
      uint64_t v6 = getopt(a2, a3, "h?xdH:upc:f:a");
      if ((int)v6 <= 111) {
        break;
      }
      switch(v6)
      {
        case 'p':
          uint64_t v7 = a1;
          int v8 = 5;
LABEL_21:
          sub_100003CEC(v7, v8, 0);
          break;
        case 'u':
          *(unsigned char *)(a1 + 96) = 1;
          break;
        case 'x':
          *(_DWORD *)(a1 + 88) = 16;
          break;
        default:
          goto LABEL_33;
      }
    }
    switch((int)v6)
    {
      case 'a':
        uint64_t v7 = a1;
        int v8 = 4;
        goto LABEL_21;
      case 'b':
      case 'e':
        goto LABEL_33;
      case 'c':
        *(_DWORD *)(a1 + 92) = atoi(optarg);
        continue;
      case 'd':
        *(_DWORD *)(a1 + 88) = 10;
        continue;
      case 'f':
        sub_1000026F8(&__p, optarg);
        uint64_t v6 = sub_1000038B0(a1, (uint64_t)&__p);
        char v17 = v6;
        if (SHIBYTE(v23) < 0) {
          operator delete(__p);
        }
        if ((v17 & 1) == 0) {
          goto LABEL_33;
        }
        continue;
      default:
        if (v6 == 72)
        {
          __p = 0;
          v22 = 0;
          v23 = 0;
          long long v9 = optarg;
          if (!strcmp(optarg, "true"))
          {
            long long v11 = (char *)sub_100004714((uint64_t)&v23, 1uLL);
            int v12 = (char *)__p;
            long long v18 = v22;
            *(void *)long long v11 = 1;
            unsigned int v14 = v11 + 8;
            unint64_t v15 = v11;
            while (v18 != v12)
            {
              uint64_t v19 = *((void *)v18 - 1);
              v18 -= 8;
              *((void *)v15 - 1) = v19;
              v15 -= 8;
            }
          }
          else
          {
            if (strcmp(v9, "false")) {
              goto LABEL_29;
            }
            long long v11 = (char *)sub_100004714((uint64_t)&v23, 1uLL);
            int v12 = (char *)__p;
            uint64_t v13 = v22;
            *(void *)long long v11 = 0;
            unsigned int v14 = v11 + 8;
            unint64_t v15 = v11;
            while (v13 != v12)
            {
              uint64_t v16 = *((void *)v13 - 1);
              v13 -= 8;
              *((void *)v15 - 1) = v16;
              v15 -= 8;
            }
          }
          __p = v15;
          v22 = v14;
          v23 = &v11[8 * v10];
          if (v12) {
            operator delete(v12);
          }
          v22 = v14;
LABEL_29:
          sub_100003CEC(a1, 6, (uint64_t)&__p);
          if (__p)
          {
            v22 = (char *)__p;
            operator delete(__p);
          }
          continue;
        }
        if (v6 == -1) {
          return sub_100003DA0(a1, a2 - optind, (uint64_t)&a3[optind]);
        }
LABEL_33:
        sub_1000035A0(v6, 0);
        return 0;
    }
  }
}

void sub_100003BB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100003C04(uint64_t a1, void *a2)
{
  uint64_t v4 = a1 + 16;
  unint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void **)(a1 + 8);
  if ((unint64_t)v6 >= v5)
  {
    int v8 = *(void **)a1;
    uint64_t v9 = ((uint64_t)v6 - *(void *)a1) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      sub_1000046FC();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      uint64_t v13 = (char *)sub_100004714(v4, v12);
      int v8 = *(void **)a1;
      uint64_t v6 = *(void **)(a1 + 8);
    }
    else
    {
      uint64_t v13 = 0;
    }
    unsigned int v14 = &v13[8 * v9];
    unint64_t v15 = &v13[8 * v12];
    *(void *)unsigned int v14 = *a2;
    uint64_t v7 = v14 + 8;
    while (v6 != v8)
    {
      uint64_t v16 = *--v6;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *uint64_t v6 = *a2;
    uint64_t v7 = v6 + 1;
  }
  *(void *)(a1 + 8) = v7;
}

uint64_t sub_100003CEC(uint64_t a1, int a2, uint64_t a3)
{
  int v10 = a2;
  if (!a3)
  {
    uint64_t v11 = &v10;
    unint64_t v5 = (char *)(sub_10000489C((uint64_t **)a1, &v10, (uint64_t)&unk_10000BC48, &v11) + 5);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    goto LABEL_5;
  }
  uint64_t v11 = &v10;
  unint64_t v5 = (char *)(sub_10000489C((uint64_t **)a1, &v10, (uint64_t)&unk_10000BC48, &v11) + 5);
  if (v5 != (char *)a3)
  {
    uint64_t v6 = *(char **)a3;
    uint64_t v7 = *(void *)(a3 + 8);
    unint64_t v8 = (v7 - *(void *)a3) >> 3;
LABEL_5:
    sub_10000474C(v5, v6, v7, v8);
  }
  *(unsigned char *)(a1 + 97) = 0;
  return 1;
}

uint64_t sub_100003DA0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v6 = *(char **)a3;
    size_t v7 = strlen(*(const char **)a3);
    if (v7)
    {
      uint64_t v8 = 0;
      while ((v6[v8] & 0x80000000) == 0 && (_DefaultRuneLocale.__runetype[v6[v8]] & 0x400) != 0)
      {
        if (v7 == ++v8) {
          goto LABEL_7;
        }
      }
      sub_1000026F8(&__p, v6);
      sub_1000037F0(a1, &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    else
    {
LABEL_7:
      *(_DWORD *)(a1 + 56) = atoi(v6) - 1;
    }
    if ((int)a2 >= 2)
    {
      uint64_t v9 = *(const char **)(a3 + 8);
      if (!strcmp(v9, "dump"))
      {
        sub_100003CEC(a1, 1, 0);
        goto LABEL_148;
      }
      int v10 = strcmp(v9, "write");
      if (a2 < 4 || v10)
      {
        int v15 = strcmp(v9, "read");
        if (a2 >= 3 && !v15)
        {
          memset(&__p, 0, sizeof(__p));
          uint64_t v16 = *(char **)(a3 + 16);
          char v17 = strchr(v16, 44);
          if (v17)
          {
            long long v18 = v17;
            unint64_t v19 = strtoul(v17 + 1, 0, 0);
            *long long v18 = 0;
            uint64_t v16 = *(char **)(a3 + 16);
          }
          else
          {
            unint64_t v19 = 1;
          }
          uint64_t v33 = sub_100002678(v16, *(_DWORD *)(a1 + 88));
          uint64_t v34 = v33;
          std::string::size_type v35 = __p.__r_.__value_.__r.__words[2];
          std::string::size_type size = __p.__r_.__value_.__l.__size_;
          if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
          {
            v38 = (void *)__p.__r_.__value_.__r.__words[0];
            uint64_t v39 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
            unint64_t v40 = v39 + 1;
            if ((unint64_t)(v39 + 1) >> 61) {
              sub_1000046FC();
            }
            int64_t v41 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
            if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v40) {
              unint64_t v40 = v41 >> 2;
            }
            if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v42 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v42 = v40;
            }
            if (v42)
            {
              v43 = (char *)sub_100004714((uint64_t)&__p.__r_.__value_.__r.__words[2], v42);
              std::string::size_type size = __p.__r_.__value_.__l.__size_;
              v38 = (void *)__p.__r_.__value_.__r.__words[0];
            }
            else
            {
              v43 = 0;
            }
            v67 = (uint64_t *)&v43[8 * v39];
            std::string::size_type v35 = (std::string::size_type)&v43[8 * v42];
            uint64_t *v67 = v34;
            v37 = v67 + 1;
            while ((void *)size != v38)
            {
              uint64_t v68 = *(void *)(size - 8);
              size -= 8;
              *--v67 = v68;
            }
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v67;
            __p.__r_.__value_.__l.__size_ = (std::string::size_type)v37;
            __p.__r_.__value_.__r.__words[2] = v35;
            if (v38)
            {
              operator delete(v38);
              std::string::size_type v35 = __p.__r_.__value_.__r.__words[2];
            }
          }
          else
          {
            *(void *)__p.__r_.__value_.__l.__size_ = v33;
            v37 = (void *)(size + 8);
          }
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)v37;
          if ((unint64_t)v37 >= v35)
          {
            v70 = (void *)__p.__r_.__value_.__r.__words[0];
            uint64_t v71 = (uint64_t)((uint64_t)v37 - __p.__r_.__value_.__r.__words[0]) >> 3;
            unint64_t v72 = v71 + 1;
            if ((unint64_t)(v71 + 1) >> 61) {
              sub_1000046FC();
            }
            uint64_t v73 = v35 - __p.__r_.__value_.__r.__words[0];
            if (v73 >> 2 > v72) {
              unint64_t v72 = v73 >> 2;
            }
            if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v74 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v74 = v72;
            }
            if (v74)
            {
              v75 = (char *)sub_100004714((uint64_t)&__p.__r_.__value_.__r.__words[2], v74);
              v37 = (void *)__p.__r_.__value_.__l.__size_;
              v70 = (void *)__p.__r_.__value_.__r.__words[0];
            }
            else
            {
              v75 = 0;
            }
            v76 = (unint64_t *)&v75[8 * v71];
            std::string::size_type v77 = (std::string::size_type)&v75[8 * v74];
            unint64_t *v76 = v19;
            std::string::size_type v69 = (std::string::size_type)(v76 + 1);
            while (v37 != v70)
            {
              unint64_t v78 = *--v37;
              *--v76 = v78;
            }
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v76;
            __p.__r_.__value_.__l.__size_ = v69;
            __p.__r_.__value_.__r.__words[2] = v77;
            if (v70) {
              operator delete(v70);
            }
          }
          else
          {
            void *v37 = v19;
            std::string::size_type v69 = (std::string::size_type)(v37 + 1);
          }
          __p.__r_.__value_.__l.__size_ = v69;
          sub_100003CEC(a1, 0, (uint64_t)&__p);
          goto LABEL_146;
        }
        int v20 = strcmp(v9, "mask");
        if (a2 < 5 || v20)
        {
          uint64_t v31 = strcmp(v9, "patch");
          if (v31)
          {
            sub_1000035A0(v31, 1);
            return 0;
          }
          memset(&__p, 0, sizeof(__p));
          v66 = *(const char **)(a3 + 16);
          if (!strcmp(v66, "reset"))
          {
            uint64_t v108 = 1;
            sub_100003C04((uint64_t)&__p, &v108);
          }
          else
          {
            if (!strcmp(v66, "list"))
            {
              uint64_t v108 = 2;
            }
            else
            {
              uint64_t v108 = 0;
              sub_100003C04((uint64_t)&__p, &v108);
              uint64_t v108 = sub_100002678(*(char **)(a3 + 16), *(_DWORD *)(a1 + 88));
              sub_100003C04((uint64_t)&__p, &v108);
              uint64_t v108 = sub_100002678(*(char **)(a3 + 32), *(_DWORD *)(a1 + 88));
              sub_100003C04((uint64_t)&__p, &v108);
              uint64_t v108 = sub_100002678(*(char **)(a3 + 24), *(_DWORD *)(a1 + 88));
            }
            sub_100003C04((uint64_t)&__p, &v108);
          }
          sub_100003CEC(a1, 7, (uint64_t)&__p);
          goto LABEL_146;
        }
        memset(&__p, 0, sizeof(__p));
        uint64_t v21 = sub_100002678(*(char **)(a3 + 16), *(_DWORD *)(a1 + 88));
        uint64_t v22 = v21;
        std::string::size_type v23 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
        {
          v60 = (void *)__p.__r_.__value_.__r.__words[0];
          uint64_t v61 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          unint64_t v62 = v61 + 1;
          if ((unint64_t)(v61 + 1) >> 61) {
            sub_1000046FC();
          }
          int64_t v63 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
          if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v62) {
            unint64_t v62 = v63 >> 2;
          }
          if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v64 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v64 = v62;
          }
          if (v64)
          {
            v65 = (char *)sub_100004714((uint64_t)&__p.__r_.__value_.__r.__words[2], v64);
            std::string::size_type v23 = __p.__r_.__value_.__l.__size_;
            v60 = (void *)__p.__r_.__value_.__r.__words[0];
          }
          else
          {
            v65 = 0;
          }
          v79 = (uint64_t *)&v65[8 * v61];
          std::string::size_type v80 = (std::string::size_type)&v65[8 * v64];
          uint64_t *v79 = v22;
          std::string::size_type v24 = (std::string::size_type)(v79 + 1);
          while ((void *)v23 != v60)
          {
            uint64_t v81 = *(void *)(v23 - 8);
            v23 -= 8;
            *--v79 = v81;
          }
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v79;
          __p.__r_.__value_.__l.__size_ = v24;
          __p.__r_.__value_.__r.__words[2] = v80;
          if (v60) {
            operator delete(v60);
          }
        }
        else
        {
          *(void *)__p.__r_.__value_.__l.__size_ = v21;
          std::string::size_type v24 = v23 + 8;
        }
        __p.__r_.__value_.__l.__size_ = v24;
        uint64_t v82 = sub_100002678(*(char **)(a3 + 32), *(_DWORD *)(a1 + 88));
        uint64_t v83 = v82;
        std::string::size_type v84 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
        {
          v86 = (void *)__p.__r_.__value_.__r.__words[0];
          uint64_t v87 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          unint64_t v88 = v87 + 1;
          if ((unint64_t)(v87 + 1) >> 61) {
            sub_1000046FC();
          }
          int64_t v89 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
          if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v88) {
            unint64_t v88 = v89 >> 2;
          }
          if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v90 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v90 = v88;
          }
          if (v90)
          {
            v91 = (char *)sub_100004714((uint64_t)&__p.__r_.__value_.__r.__words[2], v90);
            std::string::size_type v84 = __p.__r_.__value_.__l.__size_;
            v86 = (void *)__p.__r_.__value_.__r.__words[0];
          }
          else
          {
            v91 = 0;
          }
          v92 = (uint64_t *)&v91[8 * v87];
          std::string::size_type v93 = (std::string::size_type)&v91[8 * v90];
          uint64_t *v92 = v83;
          std::string::size_type v85 = (std::string::size_type)(v92 + 1);
          while ((void *)v84 != v86)
          {
            uint64_t v94 = *(void *)(v84 - 8);
            v84 -= 8;
            *--v92 = v94;
          }
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v92;
          __p.__r_.__value_.__l.__size_ = v85;
          __p.__r_.__value_.__r.__words[2] = v93;
          if (v86) {
            operator delete(v86);
          }
        }
        else
        {
          *(void *)__p.__r_.__value_.__l.__size_ = v82;
          std::string::size_type v85 = v84 + 8;
        }
        __p.__r_.__value_.__l.__size_ = v85;
        uint64_t v95 = sub_100002678(*(char **)(a3 + 24), *(_DWORD *)(a1 + 88));
        uint64_t v96 = v95;
        std::string::size_type v97 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
        {
          v98 = (void *)__p.__r_.__value_.__r.__words[0];
          uint64_t v99 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          unint64_t v100 = v99 + 1;
          if ((unint64_t)(v99 + 1) >> 61) {
            sub_1000046FC();
          }
          int64_t v101 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
          if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v100) {
            unint64_t v100 = v101 >> 2;
          }
          if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v102 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v102 = v100;
          }
          if (v102)
          {
            v103 = (char *)sub_100004714((uint64_t)&__p.__r_.__value_.__r.__words[2], v102);
            std::string::size_type v97 = __p.__r_.__value_.__l.__size_;
            v98 = (void *)__p.__r_.__value_.__r.__words[0];
          }
          else
          {
            v103 = 0;
          }
          v104 = (uint64_t *)&v103[8 * v99];
          std::string::size_type v105 = (std::string::size_type)&v103[8 * v102];
          uint64_t *v104 = v96;
          std::string::size_type v50 = (std::string::size_type)(v104 + 1);
          while ((void *)v97 != v98)
          {
            uint64_t v106 = *(void *)(v97 - 8);
            v97 -= 8;
            *--v104 = v106;
          }
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v104;
          __p.__r_.__value_.__l.__size_ = v50;
          __p.__r_.__value_.__r.__words[2] = v105;
          if (v98) {
            operator delete(v98);
          }
        }
        else
        {
          *(void *)__p.__r_.__value_.__l.__size_ = v95;
          std::string::size_type v50 = v97 + 8;
        }
      }
      else
      {
        memset(&__p, 0, sizeof(__p));
        uint64_t v11 = sub_100002678(*(char **)(a3 + 16), *(_DWORD *)(a1 + 88));
        uint64_t v12 = v11;
        std::string::size_type v13 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
        {
          v25 = (void *)__p.__r_.__value_.__r.__words[0];
          uint64_t v26 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          unint64_t v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 61) {
            sub_1000046FC();
          }
          int64_t v28 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
          if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v27) {
            unint64_t v27 = v28 >> 2;
          }
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v27;
          }
          if (v29)
          {
            v30 = (char *)sub_100004714((uint64_t)&__p.__r_.__value_.__r.__words[2], v29);
            std::string::size_type v13 = __p.__r_.__value_.__l.__size_;
            v25 = (void *)__p.__r_.__value_.__r.__words[0];
          }
          else
          {
            v30 = 0;
          }
          v44 = (uint64_t *)&v30[8 * v26];
          std::string::size_type v45 = (std::string::size_type)&v30[8 * v29];
          uint64_t *v44 = v12;
          std::string::size_type v14 = (std::string::size_type)(v44 + 1);
          while ((void *)v13 != v25)
          {
            uint64_t v46 = *(void *)(v13 - 8);
            v13 -= 8;
            *--v44 = v46;
          }
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v44;
          __p.__r_.__value_.__l.__size_ = v14;
          __p.__r_.__value_.__r.__words[2] = v45;
          if (v25) {
            operator delete(v25);
          }
        }
        else
        {
          *(void *)__p.__r_.__value_.__l.__size_ = v11;
          std::string::size_type v14 = v13 + 8;
        }
        __p.__r_.__value_.__l.__size_ = v14;
        uint64_t v47 = sub_100002678(*(char **)(a3 + 24), *(_DWORD *)(a1 + 88));
        uint64_t v48 = v47;
        std::string::size_type v49 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
        {
          v51 = (void *)__p.__r_.__value_.__r.__words[0];
          uint64_t v52 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          unint64_t v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 61) {
            sub_1000046FC();
          }
          int64_t v54 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
          if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v53) {
            unint64_t v53 = v54 >> 2;
          }
          if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v55 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v55 = v53;
          }
          if (v55)
          {
            v56 = (char *)sub_100004714((uint64_t)&__p.__r_.__value_.__r.__words[2], v55);
            std::string::size_type v49 = __p.__r_.__value_.__l.__size_;
            v51 = (void *)__p.__r_.__value_.__r.__words[0];
          }
          else
          {
            v56 = 0;
          }
          v57 = (uint64_t *)&v56[8 * v52];
          std::string::size_type v58 = (std::string::size_type)&v56[8 * v55];
          uint64_t *v57 = v48;
          std::string::size_type v50 = (std::string::size_type)(v57 + 1);
          while ((void *)v49 != v51)
          {
            uint64_t v59 = *(void *)(v49 - 8);
            v49 -= 8;
            *--v57 = v59;
          }
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v57;
          __p.__r_.__value_.__l.__size_ = v50;
          __p.__r_.__value_.__r.__words[2] = v58;
          if (v51) {
            operator delete(v51);
          }
        }
        else
        {
          *(void *)__p.__r_.__value_.__l.__size_ = v47;
          std::string::size_type v50 = v49 + 8;
        }
      }
      __p.__r_.__value_.__l.__size_ = v50;
      sub_100003CEC(a1, 2, (uint64_t)&__p);
LABEL_146:
      if (__p.__r_.__value_.__r.__words[0])
      {
        __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
LABEL_148:
  if ((*(char *)(a1 + 55) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(a1 + 55)) {
      goto LABEL_150;
    }
LABEL_153:
    if ((*(_DWORD *)(a1 + 56) & 0x80000000) != 0) {
      return 1;
    }
    int v107 = 3;
LABEL_155:
    *(_DWORD *)(a1 + 24) = v107;
    return 1;
  }
  if (!*(void *)(a1 + 40)) {
    goto LABEL_153;
  }
LABEL_150:
  if (*(unsigned char *)(a1 + 96))
  {
    int v107 = 2;
    goto LABEL_155;
  }
  uint64_t result = 1;
  *(_DWORD *)(a1 + 24) = 1;
  return result;
}

void sub_100004614(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100004684(uint64_t **a1, _DWORD *a2, char *a3)
{
  uint64_t v4 = (uint64_t *)(a1 + 1);
  BOOL v3 = *a1;
  if (*a1 != (uint64_t *)(a1 + 1))
  {
    *a2 = *((_DWORD *)v3 + 8);
    if (v3 + 5 != (uint64_t *)a3) {
      sub_10000474C(a3, (char *)v3[5], v3[6], (v3[6] - v3[5]) >> 3);
    }
    sub_1000049BC(a1, v3);
  }
  return v3 != v4;
}

void sub_1000046FC()
{
}

void *sub_100004714(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100002854();
  }
  return operator new(8 * a2);
}

char *sub_10000474C(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  size_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 3)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *size_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61) {
      sub_1000046FC();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = sub_100004858(v7, v11);
    std::string::size_type v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      long long v18 = v9;
      unint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  std::string::size_type v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 3;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    long long v18 = v9;
    unint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  char *v12 = &v9[v17];
  return result;
}

char *sub_100004858(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_1000046FC();
  }
  uint64_t result = (char *)sub_100004714((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t **sub_10000489C(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  size_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        size_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        size_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    unint64_t v11 = operator new(0x40uLL);
    v11[8] = **a4;
    *((void *)v11 + 6) = 0;
    *((void *)v11 + 7) = 0;
    *((void *)v11 + 5) = 0;
    sub_100004964(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *sub_100004964(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  unint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_100002D00(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_1000049BC(uint64_t **a1, uint64_t *a2)
{
  BOOL v3 = sub_100004A00(a1, a2);
  uint64_t v4 = (void *)a2[5];
  if (v4)
  {
    a2[6] = (uint64_t)v4;
    operator delete(v4);
  }
  operator delete(a2);
  return v3;
}

uint64_t *sub_100004A00(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      BOOL v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      BOOL v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_100004A74(v6, a2);
  return v3;
}

uint64_t *sub_100004A74(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  BOOL v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      BOOL v3 = a2;
      goto LABEL_7;
    }
    do
    {
      BOOL v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  uint64_t v6 = (uint64_t **)v3[2];
  size_t v7 = *v6;
  if (*v6 == v3)
  {
    *uint64_t v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      size_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      size_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *BOOL v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      std::string::size_type v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *std::string::size_type v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      size_t v7 = *(uint64_t **)(*v7 + 8);
    }
    unint64_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      uint64_t v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *size_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        uint64_t v16 = v7;
      }
      else
      {
        unint64_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      std::string::size_type v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *std::string::size_type v24 = v23;
      goto LABEL_72;
    }
    uint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    size_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      size_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    size_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    size_t v7 = *(uint64_t **)v12;
  }
  unint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  int v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    size_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    int v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    unint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  std::string::size_type v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t start(int a1, char **a2)
{
  sub_10000355C((uint64_t)v26);
  if ((sub_100003954((uint64_t)v26, a1, a2) & 1) == 0) {
    exit(2);
  }
  uint64_t v25 = 0;
  int v4 = sub_1000037E8((uint64_t)v26);
  if (v4 == 1)
  {
    sub_10000387C((char *)v26, (uint64_t)__p);
    sub_100006998((uint64_t)__p, v21);
  }
  else
  {
    if (v4 != 2)
    {
      if (v4 == 3)
      {
        int v5 = sub_1000070B8();
        unsigned int v6 = sub_1000038A8((uint64_t)v26);
        if ((v6 & 0x80000000) == 0)
        {
          uint64_t v7 = *v5;
          if (v6 < (unint64_t)((v5[1] - *v5) >> 3))
          {
            int v8 = *(void **)(v7 + 8 * v6);
            *(void *)(v7 + 8 * v6) = 0;
            uint64_t v25 = v8;
            sub_100006330((uint64_t *)(*v5 + 8 * v6 + 8), (uint64_t *)v5[1], (uint64_t *)(*v5 + 8 * v6));
            uint64_t v10 = v9;
            uint64_t v11 = (void *)v5[1];
            while (v11 != v10)
            {
              uint64_t v13 = *--v11;
              uint64_t v12 = v13;
              *uint64_t v11 = 0;
              if (v13) {
                (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
              }
            }
            v5[1] = (uint64_t)v10;
            goto LABEL_17;
          }
        }
        fprintf(__stdoutp, "There is no device at index %d\n", v6 + 1);
        sub_1000051F8(v5);
      }
      int v8 = 0;
      goto LABEL_17;
    }
    sub_10000387C((char *)v26, (uint64_t)__p);
    sub_100006D9C((uint64_t)__p, v21);
  }
  int v8 = v21[0];
  uint64_t v25 = v21[0];
  v21[0] = 0;
  if (v24 < 0) {
    operator delete(__p[0]);
  }
LABEL_17:
  sub_100002F5C((uint64_t)__p);
  int v14 = sub_10000394C((uint64_t)v26);
  sub_100002FDC((uint64_t)__p, v14);
  int v15 = sub_100003944((uint64_t)v26);
  sub_100002FEC((uint64_t)__p, v15);
  sub_100003918((char *)v26, (uint64_t)v21);
  if (v22 < 0)
  {
    uint64_t v16 = v21[1];
    operator delete(v21[0]);
    if (!v16) {
      goto LABEL_24;
    }
  }
  else if (!v22)
  {
    goto LABEL_24;
  }
  sub_100003918((char *)v26, (uint64_t)v21);
  char v17 = sub_100002FF4((uint64_t)__p, (uint64_t)v21);
  if (v22 < 0) {
    operator delete(v21[0]);
  }
  if ((v17 & 1) == 0) {
    exit(2);
  }
LABEL_24:
  sub_10000533C(v26, (uint64_t)__p, (uint64_t *)&v25);
  if (!sub_1000037E0((uint64_t)v26))
  {
    sub_100002FB4((uint64_t)__p);
    if (!v8) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  if (v8)
  {
    sub_1000058D4((uint64_t)v26, (uint64_t)__p, (uint64_t *)&v25);
    sub_100002FB4((uint64_t)__p);
LABEL_28:
    (*(void (**)(void *))(*(void *)v8 + 8))(v8);
    goto LABEL_30;
  }
  uint64_t v18 = sub_1000070B8();
  fwrite("Choose a device:\n\n", 0x12uLL, 1uLL, __stdoutp);
  sub_1000051F8(v18);
  unint64_t v19 = sub_100002584(__stdinp, 0, 1uLL, (v18[1] - *v18) >> 3, 0);
  sub_1000058D4((uint64_t)v26, (uint64_t)__p, (uint64_t *)(*v18 + 8 * v19 - 8));
  sub_100002FB4((uint64_t)__p);
LABEL_30:
  if (v29 < 0) {
    operator delete(v28);
  }
  if (v27 < 0) {
    operator delete(v26[4]);
  }
  sub_1000063BC((uint64_t)v26, v26[1]);
  return 0;
}

void sub_10000513C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,char a24)
{
  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
  }
  sub_100005A9C((uint64_t)&a24);
  _Unwind_Resume(a1);
}

void sub_1000051F8(uint64_t *a1)
{
  fprintf(__stdoutp, "%4s %s\n", (const char *)&unk_10000BA8F, "NAME");
  uint64_t v2 = *a1;
  if (a1[1] != *a1)
  {
    unint64_t v3 = 0;
    unsigned int v4 = 1;
    do
    {
      int v5 = __stdoutp;
      sub_1000075C8(*(void *)(v2 + 8 * v3), v12);
      int v6 = v13;
      uint64_t v7 = (void **)v12[0];
      sub_100007658(*(void *)(v2 + 8 * v3), __p);
      if (v6 >= 0) {
        int v8 = v12;
      }
      else {
        int v8 = v7;
      }
      if (v11 >= 0) {
        uint64_t v9 = __p;
      }
      else {
        uint64_t v9 = (void **)__p[0];
      }
      fprintf(v5, "[%2d]: %s (%s)\n", v4, (const char *)v8, (const char *)v9);
      if (v11 < 0) {
        operator delete(__p[0]);
      }
      if (v13 < 0) {
        operator delete(v12[0]);
      }
      unint64_t v3 = v4;
      uint64_t v2 = *a1;
      ++v4;
    }
    while (v3 < (a1[1] - *a1) >> 3);
  }
}

void sub_100005320(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_10000533C(uint64_t **a1, uint64_t a2, uint64_t *a3)
{
  int v48 = 0;
  std::string::size_type v45 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  while (2)
  {
    BOOL v6 = sub_100004684(a1, &v48, (char *)&v45);
    if (v6)
    {
      switch(v48)
      {
        case 0:
          uint64_t v7 = v45;
          if (v45 == v46)
          {
            BOOL v33 = 0;
            goto LABEL_75;
          }
          if (!*a3) {
            break;
          }
          if ((unint64_t)(v46 - (unsigned char *)v45) < 9) {
            unsigned int v8 = 1;
          }
          else {
            unsigned int v8 = *((_DWORD *)v45 + 2);
          }
          int v25 = *(_DWORD *)v45;
          sub_100006420(&__p, v8);
          int v26 = sub_1000082AC(*a3, v25, v8, (char **)&__p);
          char v27 = v26;
          if (v26)
          {
            char v29 = (unsigned int *)__p;
            int64_t v28 = v43;
            if (__p == v43) {
              goto LABEL_55;
            }
            do
            {
              uint64_t v30 = *v29;
              unsigned int v31 = v29[1];
              int v32 = sub_10000792C(*a3, *v29);
              sub_100003268(a2, v30, v31, v32, 1);
              v29 += 2;
            }
            while (v29 != v28);
          }
          else
          {
            fprintf(__stderrp, "Unable to find register address %x\n", v25);
          }
          char v29 = (unsigned int *)__p;
LABEL_55:
          if (v29)
          {
            v43 = v29;
            operator delete(v29);
          }
          if ((v27 & 1) == 0) {
            break;
          }
          continue;
        case 1:
          if (!*a3) {
            goto LABEL_58;
          }
          if (sub_100005AEC(a3, a2, 1)) {
            continue;
          }
          v37 = __stderrp;
          sub_1000075C8(*a3, &__p);
          if (v44 >= 0) {
            p_p = (const char *)&__p;
          }
          else {
            p_p = (const char *)__p;
          }
          fprintf(v37, "Failed to dump registers for %s\n", p_p);
          if (SHIBYTE(v44) < 0) {
            operator delete(__p);
          }
          goto LABEL_73;
        case 2:
          if ((unint64_t)(v46 - (unsigned char *)v45) < 9) {
            goto LABEL_58;
          }
          if ((unint64_t)(v46 - (unsigned char *)v45) < 0x11) {
            char v9 = sub_100007818(*a3, *(_DWORD *)v45, *((_DWORD *)v45 + 2));
          }
          else {
            char v9 = sub_100007704(*a3, *(_DWORD *)v45, *((_DWORD *)v45 + 4), *((_DWORD *)v45 + 2));
          }
          if (v9) {
            continue;
          }
          fprintf(__stderrp, "Unable to write to the register address %x\n");
          goto LABEL_73;
        case 4:
          uint64_t v16 = sub_1000070B8();
          char v17 = (uint64_t *)*v16;
          uint64_t v18 = (uint64_t *)v16[1];
          if ((uint64_t *)*v16 == v18) {
            continue;
          }
          char v19 = 1;
          do
          {
            while (!sub_100005AEC(v17, a2, 1))
            {
              int v20 = __stderrp;
              sub_1000075C8(*v17, &__p);
              BOOL v21 = (const char *)&__p;
              if (v44 < 0) {
                BOOL v21 = (const char *)__p;
              }
              fprintf(v20, "Failed to dump registers for %s\n", v21);
              if (SHIBYTE(v44) < 0) {
                operator delete(__p);
              }
              char v19 = 0;
              if (++v17 == v18) {
                goto LABEL_58;
              }
            }
            ++v17;
          }
          while (v17 != v18);
          if ((v19 & 1) == 0) {
            goto LABEL_58;
          }
          continue;
        case 5:
          std::string __p = 0;
          if (!*a3 || !sub_1000091BC(*a3, &__p)) {
            goto LABEL_63;
          }
          if (__p == kCFBooleanTrue)
          {
            int v40 = 0;
            int64_t v41 = "Ping success\n";
          }
          else
          {
            if (__p != kCFBooleanFalse)
            {
LABEL_63:
              uint64_t v34 = __stdoutp;
              std::string::size_type v35 = "ping error\n";
              size_t v36 = 11;
LABEL_72:
              fwrite(v35, v36, 1uLL, v34);
LABEL_73:
              BOOL v33 = 0;
              goto LABEL_74;
            }
            int v40 = 1;
            int64_t v41 = "Ping failure\n";
          }
          fwrite(v41, 0xDuLL, 1uLL, __stdoutp);
          exit(v40);
        case 6:
          if (v45 == v46 || !*a3) {
            continue;
          }
          CFBooleanRef v10 = *(void *)v45 ? kCFBooleanTrue : kCFBooleanFalse;
          if (sub_100009248(*a3, v10)) {
            continue;
          }
          fprintf(__stderrp, "Unable to force headphone detect (%s)\n");
          goto LABEL_73;
        case 7:
          if (v46 == v45) {
            goto LABEL_58;
          }
          uint64_t v11 = *(unsigned int *)v45;
          if (v11 == 2)
          {
            std::string __p = 0;
            v43 = 0;
            uint64_t v44 = 0;
            BOOL v12 = sub_100007EE4(*a3, (uint64_t)&__p);
            int v14 = (unsigned int *)__p;
            char v13 = v43;
            if (__p != v43)
            {
              do
              {
                int v15 = sub_10000792C(*a3, *v14);
                sub_10000347C(a2, v14, v15);
                v14 += 4;
              }
              while (v14 != v13);
              int v14 = (unsigned int *)__p;
            }
            if (v14)
            {
              v43 = v14;
              operator delete(v14);
            }
            if (!v12)
            {
LABEL_71:
              uint64_t v34 = __stderrp;
              std::string::size_type v35 = "Unable to patch the register\n";
              size_t v36 = 29;
              goto LABEL_72;
            }
          }
          else
          {
            uint64_t v22 = *((void *)v45 + 2);
            uint64_t v23 = *((void *)v45 + 3);
            uint64_t v24 = *a3;
            LODWORD(__p) = *((void *)v45 + 1);
            HIDWORD(__p) = v23;
            v43 = (unsigned int *)v22;
            if ((sub_100007DD8(v24, v11, (uint64_t *)&__p) & 1) == 0) {
              goto LABEL_71;
            }
          }
          continue;
        default:
          fprintf(__stdoutp, "Unhandled Standalone operation %d\n");
          goto LABEL_73;
      }
    }
    break;
  }
LABEL_58:
  BOOL v33 = !v6;
LABEL_74:
  uint64_t v7 = v45;
LABEL_75:
  if (v7)
  {
    uint64_t v46 = v7;
    operator delete(v7);
  }
  return v33;
}

void sub_100005850(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1000058D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  if (*a3)
  {
    uint64_t v11 = *a3;
    while (1)
    {
      fputc(10, __stdoutp);
      sub_100005AEC(a3, a2, 0);
      fputc(10, __stdoutp);
      fwrite("? ", 2uLL, 1uLL, __stdoutp);
      fflush(__stdoutp);
      if (!fgets(__str, 32, __stdinp)) {
        break;
      }
      int v7 = sub_100003944(a1);
      unsigned int v8 = sub_100002678(__str, v7);
      if (sub_100007BA4(*a3, v8))
      {
        fwrite("new value? ", 0xBuLL, 1uLL, __stdoutp);
        fflush(__stdoutp);
        fgets(__str, 32, __stdinp);
        int v9 = sub_100002678(__str, 16);
        if ((sub_100007818(*a3, v8, v9) & 1) == 0) {
          fprintf(__stderrp, "Failed to write register to %x\n", v8);
        }
      }
    }
    uint64_t v3 = v11;
  }
  else
  {
    fwrite("Critical error!!! No device has been selected!!!\n", 0x31uLL, 1uLL, __stderrp);
  }
  return v3 != 0;
}

uint64_t sub_100005A9C(uint64_t a1)
{
  if (*(char *)(a1 + 87) < 0) {
    operator delete(*(void **)(a1 + 64));
  }
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  sub_1000063BC(a1, *(void **)(a1 + 8));
  return a1;
}

BOOL sub_100005AEC(uint64_t *a1, uint64_t a2, int a3)
{
  uint64_t v4 = *a1;
  if (!v4) {
    return 0;
  }
  if (a3)
  {
    unsigned int v6 = sub_100002F24();
    sub_100005F20((uint64_t)&v27);
    sub_100002C54(&__p, v6, 61);
    if ((v26 & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    if ((v26 & 0x80u) == 0) {
      uint64_t v8 = v26;
    }
    else {
      uint64_t v8 = v25;
    }
    int v9 = sub_100002928(&v29, (uint64_t)p_p, v8);
    sub_100002928(v9, (uint64_t)"\n", 1);
    if ((char)v26 < 0) {
      operator delete(__p);
    }
    CFBooleanRef v10 = sub_100002928(&v29, (uint64_t)"NAME : [", 8);
    sub_1000075C8(*a1, &__p);
    if ((v26 & 0x80u) == 0) {
      uint64_t v11 = &__p;
    }
    else {
      uint64_t v11 = __p;
    }
    if ((v26 & 0x80u) == 0) {
      uint64_t v12 = v26;
    }
    else {
      uint64_t v12 = v25;
    }
    char v13 = sub_100002928(v10, (uint64_t)v11, v12);
    sub_100002928(v13, (uint64_t)"]\n", 2);
    if ((char)v26 < 0) {
      operator delete(__p);
    }
    sub_100002C54(&__p, v6, 61);
    if ((v26 & 0x80u) == 0) {
      int v14 = &__p;
    }
    else {
      int v14 = __p;
    }
    if ((v26 & 0x80u) == 0) {
      uint64_t v15 = v26;
    }
    else {
      uint64_t v15 = v25;
    }
    uint64_t v16 = sub_100002928(&v29, (uint64_t)v14, v15);
    sub_100002928(v16, (uint64_t)"\n", 1);
    if ((char)v26 < 0) {
      operator delete(__p);
    }
    sub_100006874((uint64_t)v30, &__p);
    sub_1000030A0(a2, (uint64_t)&__p);
    if ((char)v26 < 0) {
      operator delete(__p);
    }
    *(uint64_t *)((char *)&v27
    uint64_t v29 = v17;
    if (v31 < 0) {
      operator delete((void *)v30[8]);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    std::ios::~ios();
    uint64_t v4 = *a1;
  }
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  sub_10000870C(v4);
  BOOL v18 = sub_100008498(*a1, &v27, 1);
  if (v18)
  {
    memset(v23, 0, sizeof(v23));
    sub_100006498(v23, v27, v28, (v28 - v27) >> 5);
    int v19 = sub_100007BE0(*a1);
    sub_1000030E0(a2, v23, 1, v19);
    std::string __p = v23;
    sub_1000067D0((void ***)&__p);
  }
  if (sub_100008498(*a1, &v27, 3))
  {
    memset(v22, 0, sizeof(v22));
    sub_100006498(v22, v27, v28, (v28 - v27) >> 5);
    int v20 = sub_100007BE0(*a1);
    sub_1000030E0(a2, v22, 4, v20);
    std::string __p = v22;
    sub_1000067D0((void ***)&__p);
  }
  else
  {
    BOOL v18 = 0;
  }
  sub_100008780(*a1);
  std::string __p = &v27;
  sub_1000067D0((void ***)&__p);
  return v18;
}

void sub_100005E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  sub_1000061F8((uint64_t)&a22);
  _Unwind_Resume(a1);
}

uint64_t sub_100005F20(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  *(void *)(a1 + 8) = 0;
  int v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 24));
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)(a1 + 16) = v7;
  *(void *)(v2 + *(void *)(v7 - 24)) = v6;
  *(void *)a1 = v8;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_1000061D0(_Unwind_Exception *a1)
{
}

uint64_t sub_1000061F8(uint64_t a1)
{
  *(void *)(a1 + 16) = v3;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  std::ios::~ios();
  return a1;
}

uint64_t *sub_100006330(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = a1;
  if (a1 != a2)
  {
    do
    {
      uint64_t v6 = *v4;
      *uint64_t v4 = 0;
      uint64_t v7 = *a3;
      *a3 = v6;
      if (v7) {
        (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
      }
      ++v4;
      ++a3;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

void sub_1000063BC(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1000063BC(a1, *a2);
    sub_1000063BC(a1, a2[1]);
    uint64_t v4 = (void *)a2[5];
    if (v4)
    {
      a2[6] = v4;
      operator delete(v4);
    }
    operator delete(a2);
  }
}

void *sub_100006420(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_100004858(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_10000647C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100006498(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_100006520(result, a4);
    uint64_t result = (void *)sub_10000659C((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_100006500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_1000067D0(&a9);
  _Unwind_Resume(a1);
}

char *sub_100006520(void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_1000046FC();
  }
  uint64_t result = (char *)sub_100006564((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *sub_100006564(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_100002854();
  }
  return operator new(32 * a2);
}

uint64_t sub_10000659C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *(_DWORD *)uint64_t v4 = *(_DWORD *)v6;
      *(void *)(v4 + 16) = 0;
      *(void *)(v4 + 24) = 0;
      *(void *)(v4 + 8) = 0;
      sub_100006658((void *)(v4 + 8), *(const void **)(v6 + 8), *(void *)(v6 + 16), (uint64_t)(*(void *)(v6 + 16) - *(void *)(v6 + 8)) >> 2);
      uint64_t v4 = v11 + 32;
      v11 += 32;
      v6 += 32;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_100006750((uint64_t)v8);
  return v4;
}

void sub_100006644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_100006658(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_1000066D4(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1000066B8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1000066D4(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_1000046FC();
  }
  uint64_t result = (char *)sub_100006718((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_100006718(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_100002854();
  }
  return operator new(4 * a2);
}

uint64_t sub_100006750(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100006788(a1);
  }
  return a1;
}

void sub_100006788(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)(v1 - 24);
    if (v3)
    {
      *(void *)(v1 - 16) = v3;
      operator delete(v3);
    }
    v1 -= 32;
  }
}

void sub_1000067D0(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_100006824((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_100006824(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    uint64_t v4 = *(void **)(i - 24);
    if (v4)
    {
      *(void *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

uint64_t sub_100006874@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_100006914(a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000027AC();
  }
  int v5 = (const void *)result;
  size_t v6 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    char v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((unsigned char *)a2 + 23) = v4;
    if (!v4) {
      goto LABEL_9;
    }
  }
  uint64_t result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((unsigned char *)a2 + v6) = 0;
  return result;
}

uint64_t sub_100006914(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 88) < v3) {
      *(void *)(a1 + 88) = v3;
    }
    return *(void *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(void *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

void **sub_100006960(void **a1)
{
  unint64_t v3 = a1;
  sub_1000092B8(&v3);
  return a1;
}

void sub_100006998(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 23);
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *(void *)(a1 + 8);
  }
  *a2 = 0;
  if (!v3) {
    return;
  }
  sub_1000026F8(__p, "IONameMatch");
  unsigned int v5 = sub_100006BB0(a1, (const char *)__p);
  unsigned int v6 = v5;
  if (v14 < 0)
  {
    operator delete(__p[0]);
    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v5)
  {
    goto LABEL_6;
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v7 = *(void *)(a1 + 8);
    if (!v7) {
      return;
    }
    uint64_t v8 = *(void *)a1 + v7;
  }
  else
  {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 23);
    if (!*(unsigned char *)(a1 + 23)) {
      return;
    }
    uint64_t v8 = a1 + v7;
  }
  if (*(unsigned char *)(v8 - 1) == 69)
  {
    std::string::basic_string(&v12, (const std::string *)a1, 0, v7 - 1, (std::allocator<char> *)&v15);
    sub_1000026F8(v10, "IONameMatch");
    unsigned int v9 = sub_100006BB0((uint64_t)&v12, (const char *)v10);
    if (v11 < 0) {
      operator delete(v10[0]);
    }
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v12.__r_.__value_.__l.__data_);
    }
    if (v9) {
LABEL_6:
    }
      operator new();
  }
}

void sub_100006B20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  *unsigned __int8 v26 = 0;
  _Unwind_Resume(exception_object);
}

CFMutableDictionaryRef sub_100006BB0(uint64_t a1, const char *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 0;
  }
  unsigned int v5 = Mutable;
  if (*(char *)(a1 + 23) >= 0) {
    unsigned int v6 = (const char *)a1;
  }
  else {
    unsigned int v6 = *(const char **)a1;
  }
  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, v6, 0);
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  CFStringRef v8 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0);
  CFStringRef v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    CFDictionarySetValue(v5, v8, v7);
    CFMutableDictionaryRef v13 = sub_100006EE8(v5, 0);
    CFMutableDictionaryRef v11 = v13;
    if (!v13) {
      CFMutableDictionaryRef v11 = sub_100006EE8(v5, "IOService");
    }
LABEL_20:
    CFRelease(v7);
    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  CFMutableDictionaryRef v11 = 0;
  if (v7) {
    goto LABEL_20;
  }
  if (v8) {
LABEL_14:
  }
    CFRelease(v9);
LABEL_15:
  CFRelease(v5);
  return v11;
}

uint64_t sub_100006CC8(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 12) = a2;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 8), @"CodecRegisterStartIndex", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFNumberRef v4 = CFProperty;
    int valuePtr = 0;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr)) {
      *(_DWORD *)(a1 + 16) = valuePtr;
    }
    CFRelease(v4);
  }
  if (*(unsigned char *)(a1 + 12))
  {
    CFNumberRef v5 = (const __CFNumber *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 8), @"CodecExtendedRegisterStartIndex", kCFAllocatorDefault, 0);
    if (v5)
    {
      CFNumberRef v6 = v5;
      int v8 = 0;
      if (CFNumberGetValue(v5, kCFNumberSInt32Type, &v8)) {
        *(_DWORD *)(a1 + 16) = v8;
      }
      CFRelease(v6);
    }
  }
  return 1;
}

void sub_100006D9C(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 23);
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *(void *)(a1 + 8);
  }
  *a2 = 0;
  if (v3)
  {
    sub_1000026F8(__p, "CodecUID");
    unsigned int v5 = sub_100006BB0(a1, (const char *)__p);
    unsigned int v6 = v5;
    if (v8 < 0)
    {
      operator delete(__p[0]);
      if (!v6) {
        return;
      }
    }
    else if (!v5)
    {
      return;
    }
    operator new();
  }
}

void sub_100006E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  *char v15 = 0;
  (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  _Unwind_Resume(a1);
}

CFMutableDictionaryRef sub_100006EE8(const __CFDictionary *a1, const char *a2)
{
  if (a2) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = "AppleEmbeddedAudio";
  }
  CFMutableDictionaryRef result = IOServiceMatching(v3);
  if (result)
  {
    unsigned int v5 = result;
    if (a1)
    {
      CFIndex Count = CFDictionaryGetCount(a1);
      keys = 0;
      std::string v12 = 0;
      uint64_t v13 = 0;
      values = 0;
      CFStringRef v9 = 0;
      uint64_t v10 = 0;
      sub_100007010((void **)&keys, Count);
      sub_100007010((void **)&values, Count);
      CFDictionaryGetKeysAndValues(a1, (const void **)keys, (const void **)values);
      if (Count >= 1)
      {
        for (uint64_t i = 0; i != Count; ++i)
          CFDictionarySetValue(v5, keys[i], values[i]);
      }
      if (values)
      {
        CFStringRef v9 = values;
        operator delete(values);
      }
      if (keys)
      {
        std::string v12 = keys;
        operator delete(keys);
      }
    }
    return (CFMutableDictionaryRef)IOServiceGetMatchingService(kIOMainPortDefault, v5);
  }
  return result;
}

void sub_100006FE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007010(void **a1, unint64_t a2)
{
  CFNumberRef v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_1000046FC();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    unsigned int v6 = (char *)sub_100004714(v3, a2);
    CFStringRef v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    CFStringRef v9 = &v6[8 * v8];
    CFMutableDictionaryRef v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    std::string v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

uint64_t *sub_1000070B8()
{
  *(void *)existing = 0;
  long long v5 = 0u;
  long long v6 = 0u;
  int v7 = 1065353216;
  sub_10000930C(&qword_100010000);
  CFDictionaryRef v0 = IOServiceMatching("AppleEmbeddedAudio");
  if (!IOServiceGetMatchingServices(kIOMainPortDefault, v0, &existing[1]))
  {
    while (1)
    {
      existing[0] = IOIteratorNext(existing[1]);
      if (!existing[0]) {
        break;
      }
      sub_100009C70((uint64_t)&v5, existing, existing);
    }
  }
  if (existing[1]) {
    IOObjectRelease(existing[1]);
  }
  LODWORD(v3) = 1;
  sub_10000A0DC((uint64_t)&v11, "AppleAudioHardwareInterface", (int *)&v3);
  CFStringRef v9 = &v11;
  uint64_t v10 = 1;
  CFTypeRef v4 = sub_100009378((uint64_t)&v9);
  if (cf) {
    CFRelease(cf);
  }
  if (v11) {
    CFRelease(v11);
  }
  sub_10000A2B4((uint64_t)&v11, "IOPropertyMatch", &v4);
  CFStringRef v9 = &v11;
  uint64_t v10 = 1;
  CFDictionaryRef v1 = sub_100009378((uint64_t)&v9);
  CFDictionaryRef v3 = v1;
  if (cf) {
    CFRelease(cf);
  }
  if (v11) {
    CFRelease(v11);
  }
  CFDictionaryRef v3 = 0;
  if (!IOServiceGetMatchingServices(kIOMainPortDefault, v1, &existing[1]))
  {
    while (1)
    {
      existing[0] = IOIteratorNext(existing[1]);
      if (!existing[0]) {
        break;
      }
      sub_100009C70((uint64_t)&v5, existing, existing);
    }
  }
  if ((void)v6) {
    operator new();
  }
  if (existing[1]) {
    IOObjectRelease(existing[1]);
  }
  if (v4) {
    CFRelease(v4);
  }
  sub_100009C24((uint64_t)&v5);
  return &qword_100010000;
}

void sub_1000073D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (a2) {
    sub_1000026E4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000074A0(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  return a1;
}

const void **sub_1000074E4(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t sub_100007518(uint64_t a1)
{
  *(void *)a1 = off_10000C3C8;
  sub_10000A2F8(a1 + 24, *(void **)(a1 + 32));
  return a1;
}

void sub_100007560(uint64_t a1)
{
  *(void *)a1 = off_10000C3C8;
  sub_10000A2F8(a1 + 24, *(void **)(a1 + 32));

  operator delete();
}

void *sub_1000075C8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  memset(v5, 0, sizeof(v5));
  if (IORegistryEntryGetName(*(_DWORD *)(a1 + 8), (char *)v5)) {
    CFDictionaryRef v3 = (char *)&unk_10000BA8F;
  }
  else {
    CFDictionaryRef v3 = (char *)v5;
  }
  return sub_1000026F8(a2, v3);
}

void *sub_100007658@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  io_registry_entry_t parent = 0;
  if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 8), "IOService", &parent)
    || (memset(name, 0, 128), IORegistryEntryGetName(parent, name)))
  {
    CFDictionaryRef v3 = (char *)&unk_10000BA8F;
  }
  else
  {
    CFDictionaryRef v3 = name;
  }
  return sub_1000026F8(a2, v3);
}

uint64_t sub_100007704(uint64_t a1, int a2, int a3, int a4)
{
  int v10 = 0;
  uint64_t result = sub_10000778C(a1, a2, &v10);
  if (result)
  {
    int v9 = v10 & ~a3 | a4 & a3;
    return sub_100007818(a1, a2, v9);
  }
  return result;
}

uint64_t sub_10000778C(uint64_t a1, int a2, _DWORD *a3)
{
  uint64_t v8 = 0;
  int v9 = 0;
  uint64_t v10 = 0;
  uint64_t v4 = sub_1000082AC(a1, a2, 1u, &v8);
  long long v5 = v8;
  if (v9 == v8) {
    int v6 = 0;
  }
  else {
    int v6 = v4;
  }
  if (v6 == 1)
  {
    *a3 = *((_DWORD *)v8 + 1);
LABEL_7:
    int v9 = v5;
    operator delete(v5);
    return v4;
  }
  if (v8) {
    goto LABEL_7;
  }
  return v4;
}

void sub_1000077FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100007818(uint64_t a1, int a2, int a3)
{
  int v15 = a3;
  int valuePtr = a2;
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 3, &kCFTypeArrayCallBacks);
  CFTypeRef cf = Mutable;
  if (!Mutable) {
    return 0;
  }
  long long v5 = Mutable;
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    CFArrayAppendValue(v5, v6);
    CFRelease(v7);
  }
  CFNumberRef v8 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v15);
  if (v8)
  {
    CFNumberRef v9 = v8;
    CFArrayAppendValue(v5, v8);
    CFRelease(v9);
  }
  CFArrayRef v10 = CFArrayCreate(kCFAllocatorDefault, &cf, 1, &kCFTypeArrayCallBacks);
  if (v10)
  {
    CFArrayRef v11 = v10;
    uint64_t v12 = sub_100007C74(a1, @"CodecRegisterData", v10);
    CFRelease(v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  CFRelease(cf);
  return v12;
}

uint64_t sub_10000792C(uint64_t a1, unsigned int a2)
{
  if (!*(void *)(a1 + 40))
  {
    std::string __p = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    sub_1000079EC(a1, (unint64_t **)&__p, 0);
    if (__p)
    {
      uint64_t v13 = __p;
      operator delete(__p);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = a1 + 32;
  uint64_t v4 = v6;
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v5;
  do
  {
    unsigned int v8 = *(_DWORD *)(v4 + 28);
    BOOL v9 = v8 >= a2;
    if (v8 >= a2) {
      CFArrayRef v10 = (uint64_t *)v4;
    }
    else {
      CFArrayRef v10 = (uint64_t *)(v4 + 8);
    }
    if (v9) {
      uint64_t v7 = v4;
    }
    uint64_t v4 = *v10;
  }
  while (*v10);
  if (v7 != v5 && *(_DWORD *)(v7 + 28) <= a2) {
    return *(unsigned int *)(v7 + 32);
  }
  else {
    return 0;
  }
}

void sub_1000079D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1000079EC(uint64_t a1, unint64_t **a2, int a3)
{
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  BOOL v24 = sub_100008498(a1, &v27, a3);
  if (v24)
  {
    uint64_t v4 = v27;
    uint64_t v25 = v28;
    if (v27 != v28)
    {
      uint64_t v5 = a2 + 2;
      do
      {
        int v6 = *(_DWORD *)v4;
        int v7 = sub_100007BE0(a1);
        BOOL v9 = *(unsigned int **)(v4 + 8);
        unsigned int v8 = *(unsigned int **)(v4 + 16);
        if (v9 != v8)
        {
          int v10 = v7;
          int v11 = 0;
          uint64_t v12 = a2[1];
          do
          {
            unint64_t v13 = (v6 + v11 * v10) | ((unint64_t)*v9 << 32);
            if ((unint64_t)v12 >= *v5)
            {
              uint64_t v14 = v12 - *a2;
              if ((unint64_t)(v14 + 1) >> 61) {
                sub_1000046FC();
              }
              uint64_t v15 = *v5 - (void)*a2;
              uint64_t v16 = v15 >> 2;
              if (v15 >> 2 <= (unint64_t)(v14 + 1)) {
                uint64_t v16 = v14 + 1;
              }
              if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v17 = v16;
              }
              if (v17) {
                BOOL v18 = (char *)sub_100004714((uint64_t)(a2 + 2), v17);
              }
              else {
                BOOL v18 = 0;
              }
              int v19 = (unint64_t *)&v18[8 * v14];
              *int v19 = v13;
              uint64_t v12 = v19 + 1;
              BOOL v21 = (char *)*a2;
              int v20 = (char *)a2[1];
              if (v20 != (char *)*a2)
              {
                do
                {
                  unint64_t v22 = *((void *)v20 - 1);
                  v20 -= 8;
                  *--int v19 = v22;
                }
                while (v20 != v21);
                int v20 = (char *)*a2;
              }
              *a2 = v19;
              a2[1] = v12;
              a2[2] = (unint64_t *)&v18[8 * v17];
              if (v20) {
                operator delete(v20);
              }
            }
            else
            {
              *v12++ = v13;
            }
            a2[1] = v12;
            ++v11;
            ++v9;
          }
          while (v9 != v8);
        }
        v4 += 32;
      }
      while (v4 != v25);
    }
  }
  uint64_t v30 = (void **)&v27;
  sub_1000067D0(&v30);
  return v24;
}

void sub_100007B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a13;
  sub_1000067D0(&a16);
  _Unwind_Resume(a1);
}

uint64_t sub_100007BA4(uint64_t a1, unsigned int a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 16);
  LODWORD(result) = sub_10000778C(a1, a2, &v5);
  if (v3 <= a2) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t sub_100007BE0(uint64_t a1)
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 8), @"CodecRegisterAddressIncrement", kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return 1;
  }
  CFNumberRef v2 = CFProperty;
  CFTypeID v3 = CFGetTypeID(CFProperty);
  if (v3 != CFNumberGetTypeID()) {
    return 1;
  }
  int valuePtr = 0;
  CFNumberGetValue(v2, kCFNumberSInt32Type, &valuePtr);
  if (valuePtr <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = valuePtr;
  }
  CFRelease(v2);
  return v4;
}

uint64_t sub_100007C74(uint64_t a1, const __CFString *a2, const void *a3)
{
  if (IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 8), a2, a3))
  {
    memset(name, 0, 128);
    if (IORegistryEntryGetName(*(_DWORD *)(a1 + 8), name)) {
      int v5 = (char *)&unk_10000BA8F;
    }
    else {
      int v5 = name;
    }
    sub_1000026F8(&__p, v5);
    sub_1000090EC(a2, name);
  }
  return 1;
}

void sub_100007D9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100007DD8(uint64_t a1, int a2, uint64_t *a3)
{
  int v11 = a2;
  uint64_t v12 = *a3;
  int v13 = *((_DWORD *)a3 + 2);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 4, &kCFTypeArrayCallBacks);
  if (!Mutable) {
    return 0;
  }
  int v5 = Mutable;
  for (uint64_t i = 0; i != 16; i += 4)
  {
    CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&v11 + i);
    if (v7)
    {
      CFNumberRef v8 = v7;
      CFArrayAppendValue(v5, v7);
      CFRelease(v8);
    }
  }
  uint64_t v9 = sub_100007C74(a1, @"CodecRegisterPatch", v5);
  CFRelease(v5);
  return v9;
}

BOOL sub_100007EE4(uint64_t a1, uint64_t a2)
{
  CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, "CodecRegisterPatch", 0);
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = v4;
  CFTypeRef cf = 0;
  BOOL v6 = sub_100008130(a1, v4, &cf);
  if (v6)
  {
    CFArrayRef v7 = (const __CFArray *)cf;
    CFTypeID v8 = CFGetTypeID(cf);
    if (v8 == CFArrayGetTypeID() && CFArrayGetCount(v7) >= 1)
    {
      CFIndex v9 = 0;
      unsigned int v10 = 0;
      do
      {
        CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v7, v9);
        int valuePtr = 0;
        CFNumberRef v12 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
        CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
        int v13 = valuePtr;
        int valuePtr = 0;
        CFNumberRef v14 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 1);
        CFNumberGetValue(v14, kCFNumberSInt32Type, &valuePtr);
        int v15 = valuePtr;
        int valuePtr = 0;
        CFNumberRef v16 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 2);
        CFNumberGetValue(v16, kCFNumberSInt32Type, &valuePtr);
        int v17 = valuePtr;
        int valuePtr = 0;
        CFNumberRef v18 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 3);
        CFNumberGetValue(v18, kCFNumberSInt32Type, &valuePtr);
        int v19 = valuePtr;
        BOOL v21 = *(_DWORD **)(a2 + 8);
        unint64_t v20 = *(void *)(a2 + 16);
        if ((unint64_t)v21 >= v20)
        {
          uint64_t v23 = *(_DWORD **)a2;
          uint64_t v24 = ((uint64_t)v21 - *(void *)a2) >> 4;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 60) {
            sub_1000046FC();
          }
          uint64_t v26 = v20 - (void)v23;
          if (v26 >> 3 > v25) {
            unint64_t v25 = v26 >> 3;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27)
          {
            uint64_t v28 = (char *)sub_1000098F4(a2 + 16, v27);
            uint64_t v23 = *(_DWORD **)a2;
            BOOL v21 = *(_DWORD **)(a2 + 8);
          }
          else
          {
            uint64_t v28 = 0;
          }
          uint64_t v29 = &v28[16 * v24];
          *(_DWORD *)uint64_t v29 = v13;
          *((_DWORD *)v29 + 1) = v15;
          *((_DWORD *)v29 + 2) = v17;
          *((_DWORD *)v29 + 3) = v19;
          uint64_t v30 = v29;
          if (v21 != v23)
          {
            do
            {
              *((_OWORD *)v30 - 1) = *((_OWORD *)v21 - 1);
              v30 -= 16;
              v21 -= 4;
            }
            while (v21 != v23);
            uint64_t v23 = *(_DWORD **)a2;
          }
          unint64_t v22 = v29 + 16;
          *(void *)a2 = v30;
          *(void *)(a2 + 8) = v29 + 16;
          *(void *)(a2 + 16) = &v28[16 * v27];
          if (v23) {
            operator delete(v23);
          }
        }
        else
        {
          *BOOL v21 = v13;
          v21[1] = v15;
          unint64_t v22 = v21 + 4;
          v21[2] = v17;
          v21[3] = v19;
        }
        *(void *)(a2 + 8) = v22;
        CFIndex v9 = ++v10;
      }
      while (CFArrayGetCount(v7) > v10);
    }
  }
  CFRelease(v5);
  return v6;
}

BOOL sub_100008130(uint64_t a1, const __CFString *a2, void *a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 8), a2, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    memset(name, 0, 128);
    if (IORegistryEntryGetName(*(_DWORD *)(a1 + 8), name)) {
      CFArrayRef v7 = (char *)&unk_10000BA8F;
    }
    else {
      CFArrayRef v7 = name;
    }
    sub_1000026F8(&__p, v7);
    sub_1000090EC(a2, name);
  }
  *a3 = CFProperty;
  return CFProperty != 0;
}

void sub_100008270(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000082AC(uint64_t a1, int a2, unsigned int a3, char **a4)
{
  if (!a3) {
    return 1;
  }
  a4[1] = *a4;
  std::string __p = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  BOOL v8 = sub_1000079EC(a1, (unint64_t **)&__p, 0);
  CFIndex v9 = __p;
  if (!v8 || (unsigned int v10 = v28, __p == v28))
  {
    uint64_t v25 = 0;
    if (!__p) {
      return v25;
    }
LABEL_35:
    uint64_t v28 = v9;
    operator delete(v9);
    return v25;
  }
  char v11 = 0;
  do
  {
    if (*v9 == a2) {
      char v11 = 1;
    }
    if (v11)
    {
      if (a2 + sub_100007BE0(a1) * a3 <= *v9) {
        break;
      }
      CFNumberRef v14 = a4[1];
      unint64_t v13 = (unint64_t)a4[2];
      if ((unint64_t)v14 >= v13)
      {
        uint64_t v15 = (v14 - *a4) >> 3;
        if ((unint64_t)(v15 + 1) >> 61) {
          sub_1000046FC();
        }
        uint64_t v16 = v13 - (void)*a4;
        uint64_t v17 = v16 >> 2;
        if (v16 >> 2 <= (unint64_t)(v15 + 1)) {
          uint64_t v17 = v15 + 1;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18) {
          int v19 = (char *)sub_100004714((uint64_t)(a4 + 2), v18);
        }
        else {
          int v19 = 0;
        }
        unint64_t v20 = &v19[8 * v15];
        *(void *)unint64_t v20 = *(void *)v9;
        CFNumberRef v12 = v20 + 8;
        unint64_t v22 = *a4;
        BOOL v21 = a4[1];
        if (v21 != *a4)
        {
          do
          {
            uint64_t v23 = *((void *)v21 - 1);
            v21 -= 8;
            *((void *)v20 - 1) = v23;
            v20 -= 8;
          }
          while (v21 != v22);
          BOOL v21 = *a4;
        }
        *a4 = v20;
        a4[1] = v12;
        a4[2] = &v19[8 * v18];
        if (v21) {
          operator delete(v21);
        }
      }
      else
      {
        *(void *)CFNumberRef v14 = *(void *)v9;
        CFNumberRef v12 = v14 + 8;
      }
      a4[1] = v12;
    }
    else
    {
      CFNumberRef v12 = a4[1];
    }
    v9 += 2;
  }
  while (a3 > (unint64_t)((v12 - *a4) >> 3) && v9 != v10);
  CFIndex v9 = __p;
  uint64_t v25 = v11 & 1;
  if (__p) {
    goto LABEL_35;
  }
  return v25;
}

void sub_100008474(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100008498(uint64_t a1, uint64_t *a2, int a3)
{
  BOOL v6 = sub_10000870C(a1);
  if (v6)
  {
    CFArrayRef v7 = *(const void **)(a1 + 48);
    uint64_t v31 = *(void *)(a1 + 40);
    int v8 = *(unsigned __int8 *)(a1 + 12);
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFArrayGetTypeID())
    {
      sub_100006824(a2);
      CFIndex Count = CFArrayGetCount((CFArrayRef)v7);
      if (Count >= 0) {
        uint64_t v11 = Count;
      }
      else {
        uint64_t v11 = Count + 1;
      }
      sub_1000087C8(a2, v11 >> 1);
      if (CFArrayGetCount((CFArrayRef)v7) >= 2)
      {
        uint64_t v12 = 0;
        int v13 = v8 != 0;
        unsigned int v14 = 1;
        unsigned int v15 = 1;
        while (1)
        {
          CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v7, v14 - 1);
          unsigned int valuePtr = 0;
          if (ValueAtIndex && CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr))
          {
            uint64_t v17 = valuePtr;
            v13 |= valuePtr < v12;
            CFDataRef v18 = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)v7, v14);
            if (v13)
            {
              if (a3 != 1)
              {
                int v24 = 4;
                goto LABEL_23;
              }
              int v13 = 1;
            }
            else
            {
              if (a3 != 3)
              {
                int v24 = 1;
LABEL_23:
                if (!sub_10000885C(a1, (uint64_t)a2, v18, valuePtr, v24, v19, v31 == 0)) {
                  fprintf(__stderrp, "Error encountered while reading register data for register address %x\n", valuePtr);
                }
                goto LABEL_14;
              }
              int v13 = 0;
            }
          }
          else
          {
            uint64_t v17 = v12;
          }
LABEL_14:
          uint64_t v20 = v15;
          CFIndex v21 = CFArrayGetCount((CFArrayRef)v7);
          if (v21 >= 0) {
            uint64_t v22 = v21;
          }
          else {
            uint64_t v22 = v21 + 1;
          }
          ++v15;
          v14 += 2;
          BOOL v23 = v20 < v22 >> 1;
          uint64_t v12 = v17;
          if (!v23) {
            goto LABEL_33;
          }
        }
      }
      goto LABEL_33;
    }
    CFTypeID v25 = CFGetTypeID(v7);
    if (v25 != CFDataGetTypeID())
    {
LABEL_33:
      sub_100008780(a1);
      return v6;
    }
    sub_100006824(a2);
    unsigned int v26 = *(_DWORD *)(a1 + 16);
    if (v8)
    {
      if (a3 != 1)
      {
        CFIndex Length = CFDataGetLength((CFDataRef)v7) / 4;
        int v28 = 4;
        goto LABEL_31;
      }
    }
    else if (a3 != 3)
    {
      CFIndex Length = CFDataGetLength((CFDataRef)v7);
      int v28 = 2;
LABEL_31:
      sub_1000087C8(a2, Length);
      if (!sub_10000885C(a1, (uint64_t)a2, (CFDataRef)v7, v26, v28, v29, v31 == 0)) {
        fprintf(__stderrp, "Error encountered while reading register data for register address %x\n", v26);
      }
      goto LABEL_33;
    }
  }
  return v6;
}

BOOL sub_10000870C(uint64_t a1)
{
  CFNumberRef v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRetain(v2);
    return 1;
  }
  else
  {
    if (*(unsigned char *)(a1 + 12)) {
      CFStringRef v4 = @"CodecExtendedRegisterData";
    }
    else {
      CFStringRef v4 = @"CodecRegisterData";
    }
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 8), v4, kCFAllocatorDefault, 0);
    *(void *)(a1 + 48) = CFProperty;
    return CFProperty != 0;
  }
}

uint64_t sub_100008780(uint64_t a1)
{
  CFDictionaryRef v1 = *(const void **)(a1 + 48);
  if (v1)
  {
    if (CFGetRetainCount(*(CFTypeRef *)(a1 + 48)) == 1) {
      *(void *)(a1 + 48) = 0;
    }
    CFRelease(v1);
  }
  return 1;
}

uint64_t sub_1000087C8(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 5)
  {
    if (a2 >> 59) {
      sub_1000046FC();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = sub_100006564(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 32 * v6;
    sub_10000992C(a1, v7);
    return sub_100009AD0((uint64_t)v7);
  }
  return result;
}

void sub_100008848(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100009AD0((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sub_10000885C(uint64_t a1, uint64_t a2, CFDataRef theData, unsigned int a4, int a5, uint64_t a6, int a7)
{
  if (!theData) {
    return theData != 0;
  }
  switch(a5)
  {
    case 1:
      CFIndex Length = CFDataGetLength(theData);
      BytePtr = CFDataGetBytePtr(theData);
      if (!BytePtr) {
        return theData != 0;
      }
      v57 = BytePtr;
      uint64_t v80 = a2;
      std::string __p = 0;
      std::string::size_type v85 = 0;
      unint64_t v86 = 0;
      sub_100009044(&__p, Length);
      if (Length >= 1)
      {
        uint64_t v58 = 0;
        uint64_t v59 = (uint64_t **)(a1 + 24);
        do
        {
          int v60 = v57[v58];
          uint64_t v61 = v85;
          if ((unint64_t)v85 >= v86)
          {
            int64_t v63 = __p;
            uint64_t v64 = ((char *)v85 - (unsigned char *)__p) >> 2;
            unint64_t v65 = v64 + 1;
            if ((unint64_t)(v64 + 1) >> 62) {
              sub_1000046FC();
            }
            uint64_t v66 = v86 - (void)__p;
            if ((uint64_t)(v86 - (void)__p) >> 1 > v65) {
              unint64_t v65 = v66 >> 1;
            }
            if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v67 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v67 = v65;
            }
            if (v67)
            {
              uint64_t v68 = (char *)sub_100006718((uint64_t)&v86, v67);
              int64_t v63 = __p;
              uint64_t v61 = v85;
            }
            else
            {
              uint64_t v68 = 0;
            }
            std::string::size_type v69 = &v68[4 * v64];
            *(_DWORD *)std::string::size_type v69 = v60;
            unint64_t v62 = v69 + 4;
            while (v61 != v63)
            {
              int v70 = *--v61;
              *((_DWORD *)v69 - 1) = v70;
              v69 -= 4;
            }
            std::string __p = v69;
            std::string::size_type v85 = v62;
            unint64_t v86 = (unint64_t)&v68[4 * v67];
            if (v63) {
              operator delete(v63);
            }
          }
          else
          {
            *std::string::size_type v85 = v60;
            unint64_t v62 = v61 + 1;
          }
          std::string::size_type v85 = v62;
          if (a7)
          {
            unsigned int v81 = v58 + a4;
            v87[0] = &v81;
            *((_DWORD *)sub_10000A34C(v59, &v81, (uint64_t)&unk_10000BC48, v87) + 8) = 1;
          }
          ++v58;
        }
        while (v58 != Length);
      }
      unsigned int v81 = a4;
      v82[1] = 0;
      uint64_t v83 = 0;
      v82[0] = 0;
      sub_100006658(v82, __p, (uint64_t)v85, ((char *)v85 - (unsigned char *)__p) >> 2);
      unint64_t v27 = (uint64_t *)v80;
      uint64_t v28 = v80 + 16;
      unint64_t v71 = *(void *)(v80 + 16);
      unint64_t v30 = *(void *)(v80 + 8);
      if (v30 >= v71)
      {
        uint64_t v31 = (uint64_t)(v30 - *(void *)v80) >> 5;
        unint64_t v72 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 59) {
          sub_1000046FC();
        }
        uint64_t v73 = v71 - *(void *)v80;
        if (v73 >> 4 > v72) {
          unint64_t v72 = v73 >> 4;
        }
        if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v34 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v34 = v72;
        }
        goto LABEL_97;
      }
      break;
    case 2:
      unint64_t v35 = CFDataGetLength(theData);
      size_t v36 = CFDataGetBytePtr(theData);
      if (!v36) {
        return theData != 0;
      }
      v37 = v36;
      uint64_t v80 = a2;
      std::string __p = 0;
      std::string::size_type v85 = 0;
      unint64_t v86 = 0;
      sub_100009044(&__p, v35 >> 1);
      if (v35 >= 2)
      {
        uint64_t v38 = 0;
        uint64_t v39 = (uint64_t **)(a1 + 24);
        if (v35 >> 1 <= 1) {
          uint64_t v40 = 1;
        }
        else {
          uint64_t v40 = v35 >> 1;
        }
        do
        {
          int v41 = *(unsigned __int16 *)&v37[2 * v38];
          unint64_t v42 = v85;
          if ((unint64_t)v85 >= v86)
          {
            uint64_t v44 = __p;
            uint64_t v45 = ((char *)v85 - (unsigned char *)__p) >> 2;
            unint64_t v46 = v45 + 1;
            if ((unint64_t)(v45 + 1) >> 62) {
              sub_1000046FC();
            }
            uint64_t v47 = v86 - (void)__p;
            if ((uint64_t)(v86 - (void)__p) >> 1 > v46) {
              unint64_t v46 = v47 >> 1;
            }
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v48 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v48 = v46;
            }
            if (v48)
            {
              std::string::size_type v49 = (char *)sub_100006718((uint64_t)&v86, v48);
              uint64_t v44 = __p;
              unint64_t v42 = v85;
            }
            else
            {
              std::string::size_type v49 = 0;
            }
            std::string::size_type v50 = &v49[4 * v45];
            *(_DWORD *)std::string::size_type v50 = v41;
            v43 = v50 + 4;
            while (v42 != v44)
            {
              int v51 = *--v42;
              *((_DWORD *)v50 - 1) = v51;
              v50 -= 4;
            }
            std::string __p = v50;
            std::string::size_type v85 = v43;
            unint64_t v86 = (unint64_t)&v49[4 * v48];
            if (v44) {
              operator delete(v44);
            }
          }
          else
          {
            *std::string::size_type v85 = v41;
            v43 = v42 + 1;
          }
          std::string::size_type v85 = v43;
          if (a7)
          {
            unsigned int v81 = v38 + a4;
            v87[0] = &v81;
            *((_DWORD *)sub_10000A34C(v39, &v81, (uint64_t)&unk_10000BC48, v87) + 8) = 2;
          }
          ++v38;
        }
        while (v38 != v40);
      }
      unsigned int v81 = a4;
      v82[1] = 0;
      uint64_t v83 = 0;
      v82[0] = 0;
      sub_100006658(v82, __p, (uint64_t)v85, ((char *)v85 - (unsigned char *)__p) >> 2);
      unint64_t v27 = (uint64_t *)v80;
      uint64_t v28 = v80 + 16;
      unint64_t v52 = *(void *)(v80 + 16);
      unint64_t v30 = *(void *)(v80 + 8);
      if (v30 >= v52)
      {
        uint64_t v31 = (uint64_t)(v30 - *(void *)v80) >> 5;
        unint64_t v53 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 59) {
          sub_1000046FC();
        }
        uint64_t v54 = v52 - *(void *)v80;
        if (v54 >> 4 > v53) {
          unint64_t v53 = v54 >> 4;
        }
        if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v34 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v34 = v53;
        }
        goto LABEL_97;
      }
      break;
    case 4:
      unint64_t v12 = CFDataGetLength(theData);
      int v13 = CFDataGetBytePtr(theData);
      if (!v13) {
        return theData != 0;
      }
      unsigned int v14 = v13;
      uint64_t v80 = a2;
      std::string __p = 0;
      std::string::size_type v85 = 0;
      unint64_t v86 = 0;
      sub_100009044(&__p, v12 >> 2);
      if (v12 >= 4)
      {
        uint64_t v15 = 0;
        if (v12 >> 2 <= 1) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = v12 >> 2;
        }
        do
        {
          uint64_t v17 = v85;
          if ((unint64_t)v85 >= v86)
          {
            uint64_t v19 = __p;
            uint64_t v20 = ((char *)v85 - (unsigned char *)__p) >> 2;
            unint64_t v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) >> 62) {
              sub_1000046FC();
            }
            uint64_t v22 = v86 - (void)__p;
            if ((uint64_t)(v86 - (void)__p) >> 1 > v21) {
              unint64_t v21 = v22 >> 1;
            }
            if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v23 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v23 = v21;
            }
            if (v23)
            {
              int v24 = (char *)sub_100006718((uint64_t)&v86, v23);
              uint64_t v19 = __p;
              uint64_t v17 = v85;
            }
            else
            {
              int v24 = 0;
            }
            CFTypeID v25 = &v24[4 * v20];
            *(_DWORD *)CFTypeID v25 = *(_DWORD *)&v14[4 * v15];
            CFDataRef v18 = v25 + 4;
            while (v17 != v19)
            {
              int v26 = *--v17;
              *((_DWORD *)v25 - 1) = v26;
              v25 -= 4;
            }
            std::string __p = v25;
            std::string::size_type v85 = v18;
            unint64_t v86 = (unint64_t)&v24[4 * v23];
            if (v19) {
              operator delete(v19);
            }
          }
          else
          {
            *std::string::size_type v85 = *(_DWORD *)&v14[4 * v15];
            CFDataRef v18 = v17 + 1;
          }
          std::string::size_type v85 = v18;
          if (a7)
          {
            unsigned int v81 = 0;
            unsigned int v81 = a4 + sub_100007BE0(a1) * v15;
            v87[0] = &v81;
            *((_DWORD *)sub_10000A34C((uint64_t **)(a1 + 24), &v81, (uint64_t)&unk_10000BC48, v87) + 8) = 4;
          }
          ++v15;
        }
        while (v15 != v16);
      }
      unsigned int v81 = a4;
      v82[1] = 0;
      uint64_t v83 = 0;
      v82[0] = 0;
      sub_100006658(v82, __p, (uint64_t)v85, ((char *)v85 - (unsigned char *)__p) >> 2);
      unint64_t v27 = (uint64_t *)v80;
      uint64_t v28 = v80 + 16;
      unint64_t v29 = *(void *)(v80 + 16);
      unint64_t v30 = *(void *)(v80 + 8);
      if (v30 >= v29)
      {
        uint64_t v31 = (uint64_t)(v30 - *(void *)v80) >> 5;
        unint64_t v32 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 59) {
          sub_1000046FC();
        }
        uint64_t v33 = v29 - *(void *)v80;
        if (v33 >> 4 > v32) {
          unint64_t v32 = v33 >> 4;
        }
        if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v34 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v34 = v32;
        }
LABEL_97:
        v87[4] = (unsigned int *)(v80 + 16);
        unint64_t v74 = (unsigned int *)sub_100006564(v28, v34);
        v75 = &v74[8 * v31];
        v87[0] = v74;
        v87[1] = v75;
        v87[3] = &v74[8 * v76];
        unsigned int *v75 = v81;
        *((void *)v75 + 2) = 0;
        *((void *)v75 + 3) = 0;
        *((void *)v75 + 1) = 0;
        *(_OWORD *)(v75 + 2) = *(_OWORD *)v82;
        *((void *)v75 + 3) = v83;
        v82[0] = 0;
        v82[1] = 0;
        uint64_t v83 = 0;
        v87[2] = v75 + 8;
        sub_10000992C(v27, v87);
        uint64_t v77 = v27[1];
        sub_100009AD0((uint64_t)v87);
        unint64_t v78 = v82[0];
        v27[1] = v77;
        if (v78)
        {
          v82[1] = v78;
          operator delete(v78);
        }
        goto LABEL_99;
      }
      break;
    default:
      return theData != 0;
  }
  *(_DWORD *)unint64_t v30 = v81;
  *(void *)(v30 + 16) = 0;
  *(void *)(v30 + 24) = 0;
  *(void *)(v30 + 8) = 0;
  *(_OWORD *)(v30 + 8) = *(_OWORD *)v82;
  *(void *)(v30 + 24) = v83;
  v27[1] = v30 + 32;
LABEL_99:
  if (__p)
  {
    std::string::size_type v85 = __p;
    operator delete(__p);
  }
  return theData != 0;
}

void sub_100008FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a14) {
    operator delete(a14);
  }
  _Unwind_Resume(a1);
}

void sub_100009044(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_1000046FC();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)sub_100006718(v3, a2);
    CFArrayRef v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    CFTypeID v9 = &v6[4 * v8];
    unsigned int v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    unint64_t v12 = v7;
    if (v11 != *a1)
    {
      unint64_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_1000090EC(const __CFString *a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  CFIndex Length = CFStringGetLength(a1);
  CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  operator new[]();
}

void sub_1000091A0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1000091BC(uint64_t a1, void *a2)
{
  CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, "Ping", 0);
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = v4;
  uint64_t v8 = 0;
  BOOL v6 = sub_100008130(a1, v4, &v8);
  *a2 = v8;
  CFRelease(v5);
  return v6;
}

CFStringRef sub_100009248(uint64_t a1, const void *a2)
{
  CFStringRef result = CFStringCreateWithCString(kCFAllocatorDefault, "HPDetect", 0);
  if (result)
  {
    CFStringRef v5 = result;
    uint64_t v6 = sub_100007C74(a1, result, a2);
    CFRelease(v5);
    return (const __CFString *)v6;
  }
  return result;
}

void sub_1000092B8(void ***a1)
{
  CFNumberRef v2 = *a1;
  if (*v2)
  {
    sub_10000930C(v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void *sub_10000930C(void *result)
{
  uint64_t v1 = result;
  CFNumberRef v2 = (void *)*result;
  uint64_t v3 = (void *)result[1];
  while (v3 != v2)
  {
    CFStringRef v4 = (void *)*--v3;
    CFStringRef result = v4;
    *uint64_t v3 = 0;
    if (v4) {
      CFStringRef result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
  }
  v1[1] = v2;
  return result;
}

CFDictionaryRef sub_100009378(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 8);
  keys = 0;
  unint64_t v35 = 0;
  size_t v36 = 0;
  sub_100007010((void **)&keys, v2);
  values = 0;
  unint64_t v32 = 0;
  uint64_t v33 = 0;
  sub_100007010((void **)&values, v2);
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    CFStringRef v4 = *(void ***)a1;
    uint64_t v5 = *(void *)a1 + 16 * v3;
    do
    {
      uint64_t v6 = *v4;
      CFArrayRef v7 = v35;
      if (v35 >= v36)
      {
        uint64_t v9 = v35 - keys;
        if ((unint64_t)(v9 + 1) >> 61) {
          sub_1000046FC();
        }
        unint64_t v10 = ((char *)v36 - (char *)keys) >> 2;
        if (v10 <= v9 + 1) {
          unint64_t v10 = v9 + 1;
        }
        if ((unint64_t)((char *)v36 - (char *)keys) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v11 = v10;
        }
        if (v11) {
          unint64_t v12 = (char *)sub_100004714((uint64_t)&v36, v11);
        }
        else {
          unint64_t v12 = 0;
        }
        int v13 = (void **)&v12[8 * v9];
        *int v13 = v6;
        uint64_t v8 = v13 + 1;
        uint64_t v15 = keys;
        unsigned int v14 = v35;
        if (v35 != keys)
        {
          do
          {
            uint64_t v16 = *--v14;
            *--int v13 = v16;
          }
          while (v14 != v15);
          unsigned int v14 = keys;
        }
        keys = v13;
        unint64_t v35 = v8;
        size_t v36 = (void **)&v12[8 * v11];
        if (v14) {
          operator delete(v14);
        }
      }
      else
      {
        *unint64_t v35 = v6;
        uint64_t v8 = v7 + 1;
      }
      unint64_t v35 = v8;
      uint64_t v17 = v4[1];
      CFDataRef v18 = v32;
      if (v32 >= v33)
      {
        uint64_t v20 = v32 - values;
        if ((unint64_t)(v20 + 1) >> 61) {
          sub_1000046FC();
        }
        unint64_t v21 = ((char *)v33 - (char *)values) >> 2;
        if (v21 <= v20 + 1) {
          unint64_t v21 = v20 + 1;
        }
        if ((unint64_t)((char *)v33 - (char *)values) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v22 = v21;
        }
        if (v22) {
          unint64_t v23 = (char *)sub_100004714((uint64_t)&v33, v22);
        }
        else {
          unint64_t v23 = 0;
        }
        int v24 = (void **)&v23[8 * v20];
        *int v24 = v17;
        uint64_t v19 = v24 + 1;
        int v26 = values;
        CFTypeID v25 = v32;
        if (v32 != values)
        {
          do
          {
            unint64_t v27 = *--v25;
            *--int v24 = v27;
          }
          while (v25 != v26);
          CFTypeID v25 = values;
        }
        values = v24;
        unint64_t v32 = v19;
        uint64_t v33 = (void **)&v23[8 * v22];
        if (v25) {
          operator delete(v25);
        }
      }
      else
      {
        *unint64_t v32 = v17;
        uint64_t v19 = v18 + 1;
      }
      unint64_t v32 = v19;
      v4 += 2;
    }
    while (v4 != (void **)v5);
  }
  CFDictionaryRef v28 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v28)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  if (values)
  {
    unint64_t v32 = values;
    operator delete(values);
  }
  if (keys)
  {
    unint64_t v35 = keys;
    operator delete(keys);
  }
  return v28;
}

void sub_10000960C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  __cxa_free_exception(v13);
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(a1);
}

const void **sub_100009664(const void **a1)
{
  unint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t sub_100009698(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100009710((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_100009710(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v8 = (void *)(a7 - 8);
    uint64_t v9 = (void *)(a7 - 8);
    do
    {
      uint64_t v10 = *--a3;
      *a3 = 0;
      *v9-- = v10;
      *((void *)&v16 + 1) = v8;
      v7 -= 8;
      uint64_t v8 = v9;
    }
    while (a3 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  sub_1000097A8((uint64_t)v13);
  return v11;
}

uint64_t sub_1000097A8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1000097E0((void *)a1);
  }
  return a1;
}

void *sub_1000097E0(void *result)
{
  uint64_t v1 = *(void ***)(result[2] + 8);
  unint64_t v2 = *(void ***)(result[1] + 8);
  while (v1 != v2)
  {
    uint64_t result = *v1;
    void *v1 = 0;
    if (result) {
      uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
    ++v1;
  }
  return result;
}

void **sub_100009848(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void *sub_100009880(void *result, uint64_t a2)
{
  uint64_t v2 = result[2];
  if (v2 != a2)
  {
    CFStringRef v4 = result;
    do
    {
      unsigned char v4[2] = v2 - 8;
      uint64_t result = *(void **)(v2 - 8);
      *(void *)(v2 - 8) = 0;
      if (result) {
        uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
      }
      uint64_t v2 = v4[2];
    }
    while (v2 != a2);
  }
  return result;
}

void *sub_1000098F4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100002854();
  }
  return operator new(16 * a2);
}

uint64_t sub_10000992C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1000099A4((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1000099A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      int v8 = *(_DWORD *)(a3 - 32);
      a3 -= 32;
      *(_DWORD *)(v7 - 32) = v8;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      *(void *)(v7 - 24) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 8);
      *(void *)(v7 - 8) = *(void *)(a3 + 24);
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(void *)(a3 + 24) = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 32;
      *((void *)&v14 + 1) -= 32;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  sub_100009A50((uint64_t)v11);
  return v9;
}

uint64_t sub_100009A50(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100009A88(a1);
  }
  return a1;
}

void sub_100009A88(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)(v1 + 8);
    if (v3)
    {
      *(void *)(v1 + 16) = v3;
      operator delete(v3);
    }
    v1 += 32;
  }
}

uint64_t sub_100009AD0(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_100009B08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    *(void *)(a1 + 16) = v2 - 32;
    uint64_t v5 = *(void **)(v2 - 24);
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 32;
    }
  }
}

std::string *sub_100009B64(std::string *__dst, const std::string::value_type *__src, size_t __len)
{
  LODWORD(v6) = SHIBYTE(__dst->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = __dst->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __len)
    {
      std::string::size_type size = __dst->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    uint64_t v7 = (std::string *)__dst->__r_.__value_.__r.__words[0];
  }
  else
  {
    uint64_t v7 = __dst;
    if (__len > 0x16)
    {
      std::string::size_type size = HIBYTE(__dst->__r_.__value_.__r.__words[2]);
      std::string::size_type v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(__dst, v9, __len - v9, size, 0, size, __len, __src);
      return __dst;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((unsigned char *)&__dst->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    __dst->__r_.__value_.__l.__size_ = __len;
  }
  else {
    *((unsigned char *)&__dst->__r_.__value_.__s + 23) = __len & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__len] = 0;
  return __dst;
}

uint64_t sub_100009C24(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  CFStringRef v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_100009C70(uint64_t a1, unsigned int *a2, _DWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    std::string::size_type v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      unint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          unint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  unint64_t v10 = operator new(0x18uLL);
  void *v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_100009E90(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *v10 = *v19;
LABEL_38:
    *uint64_t v19 = v10;
    goto LABEL_39;
  }
  void *v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_100009E7C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100009E90(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_100009F80(a1, prime);
    }
  }
}

void sub_100009F80(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_100002854();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *unint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t sub_10000A0DC(uint64_t a1, char *a2, int *a3)
{
  sub_10000A1B0((CFStringRef *)a1, a2);
  int valuePtr = *a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *(void *)(a1 + 8) = v5;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  return a1;
}

void sub_10000A174(_Unwind_Exception *a1)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  sub_100009664((const void **)v1);
  _Unwind_Resume(a1);
}

CFStringRef *sub_10000A1B0(CFStringRef *a1, char *a2)
{
  sub_1000026F8(__p, a2);
  if ((v9 & 0x80u) == 0) {
    unint64_t v3 = __p;
  }
  else {
    unint64_t v3 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    CFIndex v4 = v9;
  }
  else {
    CFIndex v4 = (CFIndex)__p[1];
  }
  CFStringRef v5 = CFStringCreateWithBytes(0, (const UInt8 *)v3, v4, 0x8000100u, 0);
  *a1 = v5;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  if ((char)v9 < 0) {
    operator delete(__p[0]);
  }
  return a1;
}

void sub_10000A270(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*v15) {
    CFRelease(*v15);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000A2B4(uint64_t a1, char *a2, const void **a3)
{
  sub_10000A1B0((CFStringRef *)a1, a2);
  CFStringRef v5 = *a3;
  if (v5) {
    CFRetain(v5);
  }
  *(void *)(a1 + 8) = v5;
  return a1;
}

void sub_10000A2F8(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_10000A2F8(a1, *a2);
    sub_10000A2F8(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *sub_10000A34C(uint64_t **a1, unsigned int *a2, uint64_t a3, unsigned int **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        unsigned __int8 v9 = (uint64_t **)v6;
        unsigned int v10 = *((_DWORD *)v6 + 7);
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unsigned __int8 v9 = a1 + 1;
LABEL_10:
    unint64_t v11 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v11 + 28) = **a4;
    sub_100004964(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t sub_10000A40C()
{
  return __cxa_atexit((void (*)(void *))sub_100006960, &qword_100010000, (void *)&_mh_execute_header);
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

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return _CFGetRetainCount(cf);
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

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
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

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return std::string::compare(this, __s);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

const char *getprogname(void)
{
  return _getprogname();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

void syslog(int a1, const char *a2, ...)
{
}