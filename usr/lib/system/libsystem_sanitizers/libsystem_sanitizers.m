vm_address_t _sanitizers_init(unsigned __int8 **a1, const char **a2)
{
  vm_address_t result;
  uint64_t v3;
  BOOL v4;
  int v5;
  unint64_t v6;
  trace *v7;

  result = config::env::Parser::consumeEnv(a1, a2);
  if (v3) {
    v4 = 0;
  }
  else {
    v4 = (v3 & 0xFFFFFFFF00000000) == 0x200000000;
  }
  v5 = (v3 & 0xFFFFFFFE) == 2 || v4;
  v6 = result & 0xFFFFFFFF0000FF00 | ((v3 & 0xFFFFFFFF00000000) == 0x200000000);
  LODWORD(v7) = v5 | ((v3 == 3) << 8);
  if ((v3 & 0xFFFFFFFF00000000) == 0x200000000)
  {
    result = asan::initRuntime((asan *)&v6);
    v5 = v7;
  }
  if (v5) {
    return trace::initTraceCollection((trace *)BYTE1(v7));
  }
  return result;
}

uint64_t config::env::Parser::consumeEnv(unsigned __int8 **this, const char **a2)
{
  v4 = this;
  uint64_t Config = config::env::Parser::getConfig((config::env::Parser *)&v4);
  if ((Config & 1) == 0) {
    config::env::Parser::removeEnvVars(&v4);
  }
  return Config;
}

uint64_t config::env::Parser::getConfig(config::env::Parser *this)
{
  uint64_t v12 = *MEMORY[0x263EF8C08];
  long long v8 = xmmword_2655E86E8;
  long long v9 = unk_2655E86F8;
  long long v10 = xmmword_2655E8708;
  unsigned int v2 = config::env::Parser::getSetting<BOOL,3ul>((uint64_t)this, (uint64_t)"SanitizersChildProcessPropagation", 0, (uint64_t)&v8);
  long long v8 = xmmword_2655E86E8;
  long long v9 = unk_2655E86F8;
  long long v10 = xmmword_2655E8708;
  int v3 = config::env::Parser::getSetting<BOOL,3ul>((uint64_t)this, (uint64_t)"SanitizersPrintReportToStderr", 0, (uint64_t)&v8);
  uint64_t v4 = config::env::Parser::getNumber<long,&(strtol)>((uint64_t)this, (uint64_t)"SanitizersExitCode", 0);
  long long v8 = xmmword_2655E8688;
  long long v9 = unk_2655E8698;
  long long v10 = xmmword_2655E86A8;
  long long v11 = unk_2655E86B8;
  config::env::Parser::getSetting<config::env::AllocationTraces,4ul>((uint64_t)this, (uint64_t)"SanitizersAllocationTraces", 0, (uint64_t)&v8);
  v7[0] = xmmword_2655E86C8;
  v7[1] = unk_2655E86D8;
  config::env::Parser::getSetting<config::env::Address,2ul>((uint64_t)this, (uint64_t)"SanitizersAddress", 0, (uint64_t)v7);
  uint64_t v5 = 256;
  if (!v3) {
    uint64_t v5 = 0;
  }
  return v5 | (v4 << 32) | v2;
}

uint64_t config::env::Parser::getSetting<BOOL,3ul>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = _simple_getenv();
  if (v6)
  {
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = a4 + 16 * v7;
      long long v9 = *(unsigned char **)(v8 + 8);
      int v10 = *v9;
      if (*v9)
      {
        long long v11 = v9 + 1;
        uint64_t v12 = (unsigned __int8 *)v6;
        do
        {
          if (v10 != *v12) {
            break;
          }
          ++v12;
          int v13 = *v11++;
          int v10 = v13;
        }
        while (v13);
      }
      else
      {
        uint64_t v12 = (unsigned __int8 *)v6;
      }
      if (v10 == *v12) {
        break;
      }
      if (++v7 == 3) {
        return a3;
      }
    }
    return *(unsigned char *)v8 & 1;
  }
  return a3;
}

uint64_t config::env::Parser::getNumber<long,&(strtol)>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (const char *)_simple_getenv();
  if (!v4) {
    return a3;
  }
  int v5 = *(unsigned __int8 *)v4;
  if (*v4)
  {
    uint64_t v6 = (unsigned __int8 *)(v4 + 1);
    uint64_t v7 = &byte_263DF2B72;
    do
    {
      if (v5 != *v7) {
        break;
      }
      ++v7;
      int v8 = *v6++;
      int v5 = v8;
    }
    while (v8);
  }
  else
  {
    uint64_t v7 = &byte_263DF2B72;
  }
  if (v5 == *v7) {
    return a3;
  }

  return strtol(v4, 0, 0);
}

uint64_t config::env::Parser::getSetting<config::env::Address,2ul>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = _simple_getenv();
  if (v6)
  {
    uint64_t v7 = 0;
    while (1)
    {
      int v8 = (void *)(a4 + 16 * v7);
      long long v9 = (unsigned char *)v8[1];
      int v10 = *v9;
      if (*v9)
      {
        long long v11 = v9 + 1;
        uint64_t v12 = (unsigned __int8 *)v6;
        do
        {
          if (v10 != *v12) {
            break;
          }
          ++v12;
          int v13 = *v11++;
          int v10 = v13;
        }
        while (v13);
      }
      else
      {
        uint64_t v12 = (unsigned __int8 *)v6;
      }
      if (v10 == *v12) {
        break;
      }
      if (++v7 == 2) {
        return a3;
      }
    }
    return *(unsigned int *)v8;
  }
  return a3;
}

uint64_t config::env::Parser::getSetting<config::env::AllocationTraces,4ul>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = _simple_getenv();
  if (v6)
  {
    uint64_t v7 = 0;
    while (1)
    {
      int v8 = (void *)(a4 + 16 * v7);
      long long v9 = (unsigned char *)v8[1];
      int v10 = *v9;
      if (*v9)
      {
        long long v11 = v9 + 1;
        uint64_t v12 = (unsigned __int8 *)v6;
        do
        {
          if (v10 != *v12) {
            break;
          }
          ++v12;
          int v13 = *v11++;
          int v10 = v13;
        }
        while (v13);
      }
      else
      {
        uint64_t v12 = (unsigned __int8 *)v6;
      }
      if (v10 == *v12) {
        break;
      }
      if (++v7 == 4) {
        return a3;
      }
    }
    return *(unsigned int *)v8;
  }
  return a3;
}

unsigned __int8 **config::env::Parser::unsetEnv<18ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned int v2 = *result;
  if (*result)
  {
    int v3 = result;
    while (1)
    {
      int v4 = *v2;
      int v5 = a2;
      if (*v2)
      {
        uint64_t v6 = v2 + 1;
        int v5 = a2;
        while (1)
        {
          int v7 = *v5;
          if (v4 != v7) {
            break;
          }
          ++v5;
          int v8 = *v6++;
          int v4 = v8;
          if (!v8) {
            goto LABEL_7;
          }
        }
      }
      else
      {
LABEL_7:
        int v7 = *v5;
      }
      if (!v7 && v2[17] == 61)
      {
        long long v9 = result[1];
        ++result;
        unsigned int v2 = v9;
        if (v9) {
          continue;
        }
      }
      *v3++ = v2;
      int v10 = result[1];
      ++result;
      unsigned int v2 = v10;
      if (!v10) {
        break;
      }
    }
  }
  else
  {
    int v3 = result;
  }
  *int v3 = 0;
  return result;
}

unsigned __int8 **config::env::Parser::removeEnvVars(unsigned __int8 ***this)
{
  config::env::Parser::unsetEnv<34ul>(*this, "SanitizersChildProcessPropagation");
  config::env::Parser::unsetEnv<30ul>(*this, "SanitizersPrintReportToStderr");
  config::env::Parser::unsetEnv<19ul>(*this, "SanitizersExitCode");
  config::env::Parser::unsetEnv<27ul>(*this, "SanitizersAllocationTraces");
  unsigned int v2 = *this;

  return config::env::Parser::unsetEnv<18ul>(v2, "SanitizersAddress");
}

unsigned __int8 **config::env::Parser::unsetEnv<34ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned int v2 = *result;
  if (*result)
  {
    int v3 = result;
    while (1)
    {
      int v4 = *v2;
      int v5 = a2;
      if (*v2)
      {
        uint64_t v6 = v2 + 1;
        int v5 = a2;
        while (1)
        {
          int v7 = *v5;
          if (v4 != v7) {
            break;
          }
          ++v5;
          int v8 = *v6++;
          int v4 = v8;
          if (!v8) {
            goto LABEL_7;
          }
        }
      }
      else
      {
LABEL_7:
        int v7 = *v5;
      }
      if (!v7 && v2[33] == 61)
      {
        long long v9 = result[1];
        ++result;
        unsigned int v2 = v9;
        if (v9) {
          continue;
        }
      }
      *v3++ = v2;
      int v10 = result[1];
      ++result;
      unsigned int v2 = v10;
      if (!v10) {
        break;
      }
    }
  }
  else
  {
    int v3 = result;
  }
  *int v3 = 0;
  return result;
}

unsigned __int8 **config::env::Parser::unsetEnv<30ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned int v2 = *result;
  if (*result)
  {
    int v3 = result;
    while (1)
    {
      int v4 = *v2;
      int v5 = a2;
      if (*v2)
      {
        uint64_t v6 = v2 + 1;
        int v5 = a2;
        while (1)
        {
          int v7 = *v5;
          if (v4 != v7) {
            break;
          }
          ++v5;
          int v8 = *v6++;
          int v4 = v8;
          if (!v8) {
            goto LABEL_7;
          }
        }
      }
      else
      {
LABEL_7:
        int v7 = *v5;
      }
      if (!v7 && v2[29] == 61)
      {
        long long v9 = result[1];
        ++result;
        unsigned int v2 = v9;
        if (v9) {
          continue;
        }
      }
      *v3++ = v2;
      int v10 = result[1];
      ++result;
      unsigned int v2 = v10;
      if (!v10) {
        break;
      }
    }
  }
  else
  {
    int v3 = result;
  }
  *int v3 = 0;
  return result;
}

unsigned __int8 **config::env::Parser::unsetEnv<27ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned int v2 = *result;
  if (*result)
  {
    int v3 = result;
    while (1)
    {
      int v4 = *v2;
      int v5 = a2;
      if (*v2)
      {
        uint64_t v6 = v2 + 1;
        int v5 = a2;
        while (1)
        {
          int v7 = *v5;
          if (v4 != v7) {
            break;
          }
          ++v5;
          int v8 = *v6++;
          int v4 = v8;
          if (!v8) {
            goto LABEL_7;
          }
        }
      }
      else
      {
LABEL_7:
        int v7 = *v5;
      }
      if (!v7 && v2[26] == 61)
      {
        long long v9 = result[1];
        ++result;
        unsigned int v2 = v9;
        if (v9) {
          continue;
        }
      }
      *v3++ = v2;
      int v10 = result[1];
      ++result;
      unsigned int v2 = v10;
      if (!v10) {
        break;
      }
    }
  }
  else
  {
    int v3 = result;
  }
  *int v3 = 0;
  return result;
}

unsigned __int8 **config::env::Parser::unsetEnv<19ul>(unsigned __int8 **result, unsigned __int8 *a2)
{
  unsigned int v2 = *result;
  if (*result)
  {
    int v3 = result;
    while (1)
    {
      int v4 = *v2;
      int v5 = a2;
      if (*v2)
      {
        uint64_t v6 = v2 + 1;
        int v5 = a2;
        while (1)
        {
          int v7 = *v5;
          if (v4 != v7) {
            break;
          }
          ++v5;
          int v8 = *v6++;
          int v4 = v8;
          if (!v8) {
            goto LABEL_7;
          }
        }
      }
      else
      {
LABEL_7:
        int v7 = *v5;
      }
      if (!v7 && v2[18] == 61)
      {
        long long v9 = result[1];
        ++result;
        unsigned int v2 = v9;
        if (v9) {
          continue;
        }
      }
      *v3++ = v2;
      int v10 = result[1];
      ++result;
      unsigned int v2 = v10;
      if (!v10) {
        break;
      }
    }
  }
  else
  {
    int v3 = result;
  }
  *int v3 = 0;
  return result;
}

void asan::ReportGenerator::createReport(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)a4 = *(_OWORD *)a2;
  *(void *)(a4 + 16) = *(void *)(a2 + 16);
  bzero((void *)(a4 + 48), 0x470uLL);
  *(void *)(a4 + 40) = a3[2];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)a3;
  *(void *)(a4 + 1184) = 3;
  *(void *)(a4 + 1192) = (**(uint64_t (***)(void))*a1)();
  int v7 = (*(uint64_t (**)(uint64_t, void, void))(*(void *)*a1 + 104))(*a1, *a3, a3[1]);
  switch(v7)
  {
    case 233:
    case 250:
      *(_DWORD *)(a4 + 48) = 6;
      *(void *)(a4 + 56) = "unimplemented";
      *(void *)(a4 + 64) = "unimplemented";
      break;
    case 234:
    case 235:
    case 236:
    case 237:
    case 238:
    case 239:
    case 240:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
      break;
    case 241:
      *(_DWORD *)(a4 + 48) = 5;
      int v8 = "stack-buffer-underflow";
      goto LABEL_6;
    case 242:
    case 243:
      *(_DWORD *)(a4 + 48) = 4;
      int v8 = "stack-buffer-overflow";
LABEL_6:
      *(void *)(a4 + 56) = v8;
      asan::ReportGenerator::fillStackVarInfo(a1, a4);
      break;
    case 249:
      asan::ReportGenerator::addGlobalBufferOverflowInfo((uint64_t)a1, a4);
      break;
    case 251:
      asan::ReportGenerator::addHeapBufferOverflowInfo(a1, a4);
      break;
    case 252:
    case 253:
      asan::ReportGenerator::addUseAfterFreeInfo(a1, a4);
      break;
    default:
      if (!v7) {
        asan::ReportGenerator::createReport();
      }
      return;
  }
  if (!*(_DWORD *)(a4 + 48))
  {
    *(void *)(a4 + 56) = "corrupted shadow";
    *(void *)(a4 + 64) = "corrupted shadow";
  }
}

uint64_t asan::ReportGenerator::addHeapBufferOverflowInfo(uint64_t *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 3;
  *(void *)(a2 + 56) = "heap-buffer-overflow";
  *(void *)(a2 + 64) = "heap";
  uint64_t v4 = *a1;
  long long v11 = *(_OWORD *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 40);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, long long *))(*(void *)v4 + 56))(v4, &v11);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    asan::ReportGenerator::addHeapBufferOverflowInfo();
  }
  uint64_t v8 = v5;
  uint64_t v9 = v6;
  bzero((void *)(a2 + 105), 0x437uLL);
  *(void *)(a2 + 88) = v8;
  *(void *)(a2 + 96) = v9;
  *(unsigned char *)(a2 + 104) = 0;
  return (**(uint64_t (***)(void))a1[1])();
}

uint64_t asan::ReportGenerator::addUseAfterFreeInfo(uint64_t *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 1;
  *(void *)(a2 + 56) = "heap-use-after-free";
  *(void *)(a2 + 64) = "heap";
  uint64_t v4 = *a1;
  long long v11 = *(_OWORD *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 40);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, long long *))(*(void *)v4 + 56))(v4, &v11);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    asan::ReportGenerator::addUseAfterFreeInfo();
  }
  uint64_t v8 = v5;
  uint64_t v9 = v6;
  bzero((void *)(a2 + 105), 0x437uLL);
  *(void *)(a2 + 88) = v8;
  *(void *)(a2 + 96) = v9;
  *(unsigned char *)(a2 + 104) = 1;
  return (**(uint64_t (***)(void))a1[1])();
}

void asan::ReportGenerator::addGlobalBufferOverflowInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 2;
  *(void *)(a2 + 56) = "global-buffer-overflow";
  *(void *)(a2 + 64) = "global";
  uint64_t v3 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), *(void *)(a2 + 24));
  if (!v3) {
    asan::ReportGenerator::addGlobalBufferOverflowInfo();
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)(v3 + 24);
  while (*(unsigned __int8 *)(v5 + v4++))
    ;
  *(void *)(a2 + 72) = v5;
  *(void *)(a2 + 80) = v4 - 1;
  *(_OWORD *)(a2 + 88) = *(_OWORD *)v3;

  bzero((void *)(a2 + 104), 0x438uLL);
}

void asan::ReportGenerator::addStackBufferOverflowInfo(uint64_t *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 4;
  *(void *)(a2 + 56) = "stack-buffer-overflow";
  asan::ReportGenerator::fillStackVarInfo(a1, a2);
}

void asan::ReportGenerator::addStackBufferUnderflowInfo(uint64_t *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 48) = 5;
  *(void *)(a2 + 56) = "stack-buffer-underflow";
  asan::ReportGenerator::fillStackVarInfo(a1, a2);
}

void asan::ReportGenerator::fillStackVarInfo(uint64_t *a1, uint64_t a2)
{
  *(void *)(a2 + 64) = "stack";
  uint64_t v3 = *a1;
  long long v14 = *(_OWORD *)(a2 + 24);
  uint64_t v15 = *(void *)(a2 + 40);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, long long *))(*(void *)v3 + 56))(v3, &v14);
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    asan::ReportGenerator::fillStackVarInfo();
  }
  uint64_t v7 = v4;
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  asan::ReportGenerator::StackVar::getStackVar(*(asan::ReportGenerator::StackVar **)(v4 + 8), (const char *)(*(void *)(a2 + 24) - v4), (uint64_t)&v11);
  uint64_t v8 = v11;
  if (!(void)v11) {
    asan::ReportGenerator::fillStackVarInfo();
  }
  uint64_t v9 = *((void *)&v12 + 1);
  *(void *)(a2 + 72) = v12;
  *(void *)(a2 + 80) = v9;
  bzero((void *)(a2 + 105), 0x437uLL);
  uint64_t v10 = *((void *)&v11 + 1);
  *(void *)(a2 + 88) = v8 + v7;
  *(void *)(a2 + 96) = v10;
  *(unsigned char *)(a2 + 104) = 0;
}

unint64_t asan::ReportGenerator::StackVar::getStackVar@<X0>(asan::ReportGenerator::StackVar *this@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  __endptr = (char *)this;
  unint64_t v5 = strtoul((const char *)this, &__endptr, 10);
  if (!v5) {
    asan::ReportGenerator::StackVar::getStackVar();
  }
  unint64_t v6 = v5;
  *(void *)(a3 + 32) = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  unint64_t result = asan::ReportGenerator::StackVar::parse((const char **)&__endptr, (unint64_t *)a3);
  unint64_t v8 = v6 - 1;
  if (v6 != 1 && *(void *)(a3 + 8) + *(void *)a3 < (unint64_t)a2)
  {
    uint64_t v9 = 0;
    unint64_t v10 = v6 - 2;
    do
    {
      if (v8 == v9) {
        break;
      }
      *(void *)(a3 + 32) = 0;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      unint64_t result = asan::ReportGenerator::StackVar::parse((const char **)&__endptr, (unint64_t *)a3);
      if (v10 == v9) {
        break;
      }
      ++v9;
    }
    while (*(void *)(a3 + 8) + *(void *)a3 < (unint64_t)a2);
  }
  return result;
}

unint64_t asan::ReportGenerator::StackVar::parse@<X0>(const char **__endptr@<X0>, unint64_t *a2@<X8>)
{
  a2[4] = 0;
  *a2 = strtoul(*__endptr, (char **)__endptr, 10);
  a2[1] = strtoul(*__endptr, (char **)__endptr, 10);
  unint64_t result = strtoul(*__endptr, (char **)__endptr, 10);
  unint64_t v6 = 0;
  uint64_t v7 = *__endptr;
  unint64_t v8 = (char *)(*__endptr + 1);
  while (1)
  {
    uint64_t v9 = (char *)&v7[v6 + 1];
    char *__endptr = v9;
    unsigned int v10 = *v9;
    if (v10 <= 0x3A && ((1 << v10) & 0x400000100000001) != 0) {
      break;
    }
    ++v6;
  }
  a2[2] = (unint64_t)v8;
  a2[3] = v6;
  if (v10 == 58)
  {
    long long v12 = (char *)&v7[v6 + 2];
    char *__endptr = v12;
    unint64_t result = strtoul(v12, (char **)__endptr, 10);
    a2[4] = result;
  }
  return result;
}

vm_address_t trace::initTraceCollection(trace *this)
{
  char v1 = (char)this;
  vm_address_t v2 = vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  vm_address_t result = vm::create<trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>>();
  *(void *)&sanitizers_report_globals = v2;
  *((void *)&sanitizers_report_globals + 1) = result;
  collector = v2;
  collector = result;
  collector = v1;
  if ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int))*MEMORY[0x263EF8CA0] == libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc) {
    trace::initTraceCollection();
  }
  libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::previousLogger = (uint64_t (*)(void, void, void, void, void, void))*MEMORY[0x263EF8CA0];
  *MEMORY[0x263EF8CA0] = libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc;
  return result;
}

vm_address_t vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>()
{
  if (0x2404000uLL % *MEMORY[0x263EF8C78]) {
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  }
  vm_map_t v0 = *MEMORY[0x263EF8C60];
  vm_address_t address = 0;
  char v1 = (debug *)vm_map(v0, &address, 0x2404000uLL, 0, 1660944385, 0, 0, 0, 3, 3, 1u);
  if (v1) {
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>(v1, v2);
  }
  vm_address_t v3 = address;
  bzero((void *)address, 0x2404000uLL);
  return v3;
}

vm_address_t vm::create<trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>>()
{
  if (0x1000000uLL % *MEMORY[0x263EF8C78]) {
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  }
  vm_map_t v0 = *MEMORY[0x263EF8C60];
  vm_address_t address = 0;
  char v1 = (debug *)vm_map(v0, &address, 0x1000000uLL, 0, 1660944385, 0, 0, 0, 3, 3, 1u);
  if (v1) {
    vm::create<trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>>(v1, v2);
  }
  vm_address_t v3 = address;
  bzero((void *)address, 0x1000000uLL);
  return v3;
}

const char *sanitizers_diagnose_memory_error(unsigned int a1, uint64_t a2, void (*a3)(void, void, void), unint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v18 = 0;
  uint64_t v19 = a2;
  v20 = a3;
  unsigned int v21 = a1;
  unint64_t v8 = (unint64_t *)MemoryReader::read((MemoryReader *)v17, a4, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    if (*v8 && v8[1])
    {
      uint64_t v10 = MemoryReader::read((MemoryReader *)v17, *v8, 37765120);
      uint64_t v11 = MemoryReader::read((MemoryReader *)v17, v9[1], 0x1000000);
      if (v10) {
        BOOL v12 = v11 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
        uint64_t v13 = "failed to load trace depot and/or allocation map";
      }
      else
      {
        v16[0] = &unk_270ED4C20;
        v16[1] = v10;
        v16[2] = v11;
        uint64_t v13 = trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::diagnoseMemoryError((uint64_t)v16, a5, a6);
      }
    }
    else
    {
    }
  }
  else
  {
  }
  for (uint64_t i = v18; v18; uint64_t i = v18)
  {
    uint64_t v18 = i - 1;
    v20(v21, v17[2 * i - 2], v17[2 * i - 1]);
  }
  return v13;
}

const char *trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::diagnoseMemoryError(uint64_t a1, unint64_t a2, uint64_t a3)
{
  long long v12 = 0u;
  long long v13 = 0u;
  trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::diagnoseFault(a1, a2, &v12);
  long long v6 = v12;
  if ((void)v12) {
    BOOL v7 = *((void *)&v12 + 1) == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    return "allocation metadata unavailable";
  }
  char v9 = v13;
  uint64_t v10 = "underflow";
  if ((unint64_t)v12 < a2) {
    uint64_t v10 = "overflow";
  }
  if ((_BYTE)v13) {
    uint64_t v11 = "use-after-free";
  }
  else {
    uint64_t v11 = v10;
  }
  bzero((void *)(a3 + 33), 0x437uLL);
  *(void *)a3 = v11;
  *(void *)(a3 + 8) = a2;
  *(_OWORD *)(a3 + 16) = v6;
  *(unsigned char *)(a3 + 32) = v9;
  trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces(a1, (uint64_t)&v12, a3 + 40, a3 + 576);
  return 0;
}

double trace::Lookup::create(trace::Lookup *this, unsigned __int8 (*a2)[24])
{
  *(void *)this = &unk_270ED4C20;
  double result = *(double *)&sanitizers_report_globals;
  *(_OWORD *)((char *)this + 8) = sanitizers_report_globals;
  return result;
}

uint64_t trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if ((a2 & 0xF) != 0 || (a2 & 0xF0FFFFFFFFFFFFFFLL) >= 0xFC0000001) {
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert();
  }
  unsigned int v3 = (1540483477 * ((1540483477 * ((1540483477 * a2) ^ ((1540483477 * a2) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(a2)) ^ ((1540483477 * HIDWORD(a2)) >> 24)));
  unsigned int v4 = (1540483477 * (v3 ^ (v3 >> 13))) & 0xFFFFF ^ ((1540483477 * (v3 ^ (v3 >> 13))) >> 15);
  uint64_t v5 = 0xFFFFLL;
  if (a3 < 0xFFFF) {
    uint64_t v5 = a3;
  }
  _X4 = (8 * a2) & 0x7800000000000000 | ((a2 & 0xF0FFFFFFFFFFFFFFLL) >> 4) | (v5 << 43);
  BOOL v7 = (uint64_t *)(a1 + 16 * v4);
  uint64_t v8 = *v7;
  do
  {
    _X1 = v7[1];
    __asm { CASP            X0, X1, X4, X5, [X8] }
    _ZF = result == v8;
    uint64_t v8 = result;
  }
  while (!_ZF);
  return result;
}

uint64_t trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 >= 0x41) {
    trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace();
  }
  unsigned int v4 = a2;
  uint64_t result = hash::Murmur2::hashPointers(a2, a3);
  unint64_t v7 = *(void *)(a1 + 8 * (result & 0x7FFFF));
  if (result != v7 || HIBYTE(v7) != a3)
  {
    unint64_t add_explicit = atomic_fetch_add_explicit((atomic_ullong *volatile)(a1 + 37748736), a3, memory_order_relaxed);
    *(void *)(a1 + 8 * (result & 0x7FFFF)) = result | ((unint64_t)((a3 << 24) | add_explicit & 0x3FFFFF) << 32);
    if (((a3 << 24) | add_explicit & 0x3FFFFF) >> 24)
    {
      unint64_t v10 = (unint64_t)(a3 << 24) >> 24;
      do
      {
        uint64_t v11 = *v4++;
        *(void *)(a1 + 0x400000 + 8 * (add_explicit++ & 0x3FFFFF)) = v11;
        --v10;
      }
      while (v10);
    }
  }
  return result;
}

uint64_t hash::Murmur2::hashPointers(uint64_t *a1, uint64_t a2)
{
  unsigned int v2 = -474048815;
  if (a2)
  {
    uint64_t v3 = 8 * a2;
    do
    {
      uint64_t v4 = *a1++;
      unsigned int v2 = (1540483477
          * ((1540483477 * ((1540483477 * v4) ^ ((1540483477 * v4) >> 24))) ^ (1540483477 * v2))) ^ (1540483477 * ((1540483477 * HIDWORD(v4)) ^ ((1540483477 * HIDWORD(v4)) >> 24)));
      v3 -= 8;
    }
    while (v3);
  }
  return (1540483477 * (v2 ^ (v2 >> 13))) ^ ((1540483477 * (v2 ^ (v2 >> 13))) >> 15);
}

uint64_t trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::addDeallocTrace(uint64_t result, uint64_t a2)
{
  if ((a2 & 0xF) != 0 || (a2 & 0xF0FFFFFFFFFFFFFFLL) >= 0xFC0000001) {
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::addDeallocTrace();
  }
  _X4 = 0;
  _X5 = 0;
  __asm { CASP            X4, X5, X4, X5, [X9] }
  if (((_X4 >> 3) & 0xF00000000000000 | (16 * (_X4 & 0x7FFFFFFFFFFLL))) == a2)
  {
    _X4 = _X4 | 0x8000000000000000;
    unsigned int v3 = (1540483477 * ((1540483477 * ((1540483477 * a2) ^ ((1540483477 * a2) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(a2)) ^ ((1540483477 * HIDWORD(a2)) >> 24)));
    uint64_t v11 = (uint64_t *)(result
                    + 16 * ((1540483477 * (v3 ^ (v3 >> 13))) & 0xFFFFF ^ ((1540483477 * (v3 ^ (v3 >> 13))) >> 15)));
    uint64_t result = *v11;
    do
    {
      _X3 = v11[1];
      __asm { CASP            X2, X3, X4, X5, [X8] }
      _ZF = _X2 == result;
      uint64_t result = _X2;
    }
    while (!_ZF);
  }
  return result;
}

uint64_t debug::print(debug *this, const char *a2, ...)
{
  va_start(va, a2);
  uint64_t v4 = *MEMORY[0x263EF8C08];
  vsnprintf(__str, 0x400uLL, "Failed to map VM region of size %zu (%zu pages)\n", va);
  return fputs(__str, (FILE *)*MEMORY[0x263EF8C10]);
}

{
  char __str[1024];
  uint64_t v4;
  va_list va;

  va_start(va, a2);
  uint64_t v4 = *MEMORY[0x263EF8C08];
  vsnprintf(__str, 0x400uLL, (const char *)this, va);
  return fputs(__str, (FILE *)*MEMORY[0x263EF8C10]);
}

uint64_t libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t ptr, int a6)
{
  int v9 = result;
  v18[72] = *MEMORY[0x263EF8C08];
  if (libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::previousLogger) {
    uint64_t result = libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::previousLogger(result, a2, a3, a4, ptr, (a6 + 1));
  }
  if ((v9 & 8) != 0)
  {
    unsigned int v10 = a6 + 2;
    if ((~v9 & 6) != 0)
    {
      if ((v9 & 2) != 0)
      {
        if (ptr && ((ptr & 0xF00000000000000) != 0 || !collector))
        {
          size_t v15 = malloc_size((const void *)ptr);
          if (v10 >= 7) {
            libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc();
          }
          unint64_t v16 = v15;
          uint64_t v17 = collector;
          thread_stack_pcs();
          trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace(v17, &v18[a6 + 3], 0);
          return trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert(collector, ptr, v16);
        }
        return result;
      }
      if ((v9 & 4) == 0 || !a3 || (a3 & 0xF00000000000000) == 0 && collector) {
        return result;
      }
      if (v10 >= 7) {
        libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc();
      }
    }
    else
    {
      if (!ptr) {
        return result;
      }
      if ((ptr & 0xF00000000000000) != 0 || !collector)
      {
        size_t v11 = malloc_size((const void *)ptr);
        if (v10 >= 7) {
          libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc();
        }
        unint64_t v12 = v11;
        uint64_t v13 = collector;
        thread_stack_pcs();
        trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace(v13, &v18[a6 + 3], 0);
        uint64_t result = trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert(collector, ptr, v12);
      }
      if (!a3 || (a3 & 0xF00000000000000) == 0 && collector) {
        return result;
      }
      if (v10 >= 7) {
        libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc();
      }
    }
    uint64_t v14 = collector;
    thread_stack_pcs();
    trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace(v14, &v18[a6 + 3], 0);
    return trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::addDeallocTrace(collector, a3);
  }
  return result;
}

uint64_t MemoryReader::read(MemoryReader *this, unint64_t a2, uint64_t a3)
{
  if (*((void *)this + 6) >= 3uLL) {
    MemoryReader::read();
  }
  uint64_t result = (*((uint64_t (**)(void))this + 7))(*((unsigned int *)this + 18));
  if (result)
  {
    uint64_t v6 = *((void *)this + 6);
    *((void *)this + 6) = v6 + 1;
    unint64_t v7 = (void *)((char *)this + 16 * v6);
    *unint64_t v7 = result;
    v7[1] = a3;
  }
  return result;
}

uint64_t trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  memset(v10, 0, sizeof(v10));
  trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get(*(void *)(a1 + 16), a2, (uint64_t)v10);
  if (*(void *)&v10[0]) {
    BOOL v7 = *((void *)&v10[0] + 1) == 0;
  }
  else {
    BOOL v7 = 1;
  }
  uint64_t v8 = !v7;
  if (!v7) {
    trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces(a1, (uint64_t)v10, a3, a4);
  }
  return v8;
}

{
  BOOL v4;
  uint64_t result;

  if (*(void *)a2) {
    uint64_t v4 = *(void *)(a2 + 8) == 0;
  }
  else {
    uint64_t v4 = 1;
  }
  if (v4) {
    trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces();
  }
  uint64_t result = trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace(*(void *)(a1 + 8), *(_DWORD *)(a2 + 20), (void *)(a3 + 24));
  *(_DWORD *)(a3 + 16) = result;
  if (*(unsigned char *)(a2 + 16))
  {
    uint64_t result = trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace(*(void *)(a1 + 8), *(_DWORD *)(a2 + 24), (void *)(a4 + 24));
    *(_DWORD *)(a4 + 16) = result;
  }
  return result;
}

double trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a2 & 0xF) != 0 || (a2 & 0xF0FFFFFFFFFFFFFFLL) >= 0xFC0000001) {
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get();
  }
  unsigned int v3 = (1540483477 * ((1540483477 * ((1540483477 * a2) ^ ((1540483477 * a2) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(a2)) ^ ((1540483477 * HIDWORD(a2)) >> 24)));
  uint64_t v4 = (1540483477 * (v3 ^ (v3 >> 13))) & 0xFFFFF ^ ((1540483477 * (v3 ^ (v3 >> 13))) >> 15);
  uint64_t v5 = *(void *)(a1 + 16 * v4);
  if ((((unint64_t)v5 >> 3) & 0xF00000000000000 | (16 * (v5 & 0x7FFFFFFFFFFLL))) == a2)
  {
    *(void *)a3 = a2;
    *(void *)(a3 + 8) = (unsigned __int16)((unint64_t)v5 >> 43);
    *(unsigned char *)(a3 + 16) = v5 < 0;
    double result = *(double *)(a1 + 16 * v4 + 8);
    *(double *)(a3 + 20) = result;
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace(uint64_t a1, int a2, void *a3)
{
  unint64_t v3 = *(void *)(a1 + 8 * (*(void *)&a2 & 0x7FFFFLL));
  if (v3 != a2 || (v3 & 0xC0000000000000) != 0 || (HIDWORD(v3) - 0x1000000) >> 30 != 0) {
    return 0;
  }
  unsigned int v11 = -474048815;
  trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::forEachFrame<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace(trace::Id,unsigned long (&)[64])::{lambda(unsigned long,unsigned long)#1}>(a1, v3, &v11);
  if (((1540483477 * (v11 ^ (v11 >> 13))) ^ ((1540483477 * (v11 ^ (v11 >> 13))) >> 15)) != v3) {
    return 0;
  }
  unint64_t v8 = HIBYTE(v3);
  unint64_t v9 = HIDWORD(v3);
  do
  {
    *a3++ = *(void *)(a1 + 0x400000 + 8 * (v9++ & 0x3FFFFF));
    --v8;
  }
  while (v8);
  return HIBYTE(HIDWORD(v3));
}

uint64_t trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::forEachFrame<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::retrieveTrace(trace::Id,unsigned long (&)[64])::{lambda(unsigned long,unsigned long)#1}>(uint64_t result, unint64_t a2, unsigned int *a3)
{
  unint64_t v3 = HIBYTE(a2);
  if (HIBYTE(a2))
  {
    unint64_t v4 = HIDWORD(a2);
    uint64_t v5 = result + 0x400000;
    unsigned int v6 = *a3;
    do
    {
      int v7 = *(_DWORD *)(v5 + 8 * (v4 & 0x3FFFFF) + 4);
      unsigned int v8 = 1540483477 * *(_DWORD *)(v5 + 8 * (v4 & 0x3FFFFF));
      unsigned int v6 = (1540483477 * ((1540483477 * (v8 ^ HIBYTE(v8))) ^ (1540483477 * v6))) ^ (1540483477
                                                                                  * ((1540483477 * v7) ^ ((1540483477 * v7) >> 24)));
      ++v4;
      --v3;
    }
    while (v3);
    *a3 = v6;
  }
  return result;
}

double trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::diagnoseFault@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, long long *a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8C08];
  unint64_t v5 = a2 & 0xFFFFFFFFFFFFFFF0;
  unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFF0;
  unint64_t v7 = -16;
  unint64_t v8 = a2 & 0xFFFFFFFFFFFFFFF0;
  while ((v8 & 0xF0FFFFFFFFFFFFF0) < 0xFC0000001)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get(*(void *)(a1 + 16), v8, (uint64_t)&v27);
    if ((void)v27) {
      BOOL v9 = *((void *)&v27 + 1) == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9 && !BlockInfo::absDistance((BlockInfo *)&v27, a2) && (_BYTE)v28)
    {
      long long v29 = v28;
      if ((void)v27 && *((void *)&v27 + 1))
      {
        *a3 = v27;
        *(void *)&long long v19 = v29;
        a3[1] = v29;
        return *(double *)&v19;
      }
      break;
    }
    v8 -= 16;
    v7 += 16;
    if (v7 >= 0x3FF1) {
      break;
    }
  }
  unint64_t v10 = -16;
  while (1)
  {
    if ((v6 & 0xF0FFFFFFFFFFFFF0) >= 0xFC0000001)
    {
LABEL_19:
      long long v25 = 0u;
      long long v26 = 0u;
      goto LABEL_20;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get(*(void *)(a1 + 16), v6, (uint64_t)&v27);
    BOOL v11 = !(void)v27 || *((void *)&v27 + 1) == 0;
    if (!v11 && BlockInfo::absDistance((BlockInfo *)&v27, a2) && !(_BYTE)v28) {
      break;
    }
    v6 -= 16;
    v10 += 16;
    if (v10 >= 0x3FF1) {
      goto LABEL_19;
    }
  }
  long long v25 = v27;
  long long v26 = v28;
LABEL_20:
  unint64_t v12 = -16;
  while (1)
  {
    uint64_t v13 = v5 + v12 + 16;
    if ((v13 & 0xF0FFFFFFFFFFFFF0) >= 0xFC0000001)
    {
LABEL_29:
      long long v23 = 0u;
      long long v24 = 0u;
      goto LABEL_30;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get(*(void *)(a1 + 16), v13, (uint64_t)&v27);
    BOOL v14 = !(void)v27 || *((void *)&v27 + 1) == 0;
    if (!v14 && BlockInfo::absDistance((BlockInfo *)&v27, a2) && !(_BYTE)v28) {
      break;
    }
    v12 += 16;
    if (v12 >= 0x3FF1) {
      goto LABEL_29;
    }
  }
  long long v23 = v27;
  long long v24 = v28;
LABEL_30:
  if ((void)v25) {
    BOOL v15 = *((void *)&v25 + 1) == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    unint64_t v16 = &v23;
  }
  else
  {
    unint64_t v16 = &v25;
    if ((void)v23) {
      BOOL v17 = *((void *)&v23 + 1) == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (!v17)
    {
      unint64_t v18 = BlockInfo::absDistance((BlockInfo *)&v25, a2);
      if (v18 > BlockInfo::absDistance((BlockInfo *)&v23, a2)) {
        unint64_t v16 = &v23;
      }
    }
  }
  long long v19 = *v16;
  long long v20 = v16[1];
  *a3 = *v16;
  a3[1] = v20;
  return *(double *)&v19;
}

unint64_t BlockInfo::absDistance(BlockInfo *this, unint64_t a2)
{
  BOOL v3 = *(void *)this >= a2;
  unint64_t result = *(void *)this - a2;
  if (result == 0 || !v3)
  {
    if (BlockInfo::endInclusive(this) >= a2) {
      return 0;
    }
    else {
      return a2 - BlockInfo::endInclusive(this);
    }
  }
  return result;
}

uint64_t BlockInfo::endInclusive(BlockInfo *this)
{
  if (!*(void *)this || (uint64_t v1 = *((void *)this + 1)) == 0) {
    BlockInfo::endInclusive();
  }
  return *(void *)this + v1 - 1;
}

void asan::initGlobalVars(uint64_t a1, uint64_t a2)
{
  asan::_shadow = a1;
  asan::_globals = a2;
  _dyld_register_func_for_add_image((void (__cdecl *)(const mach_header *, intptr_t))asan::initGlobalVars(Shadow *,asan::GlobalsRegistry *)::$_0::__invoke);
}

uint64_t asan::GlobalsRegistryImpl::registerSection(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 >= 0x7FF) {
    asan::GlobalsRegistryImpl::registerSection();
  }
  uint64_t v4 = result + 16 * v3;
  *(void *)(v4 + 16) = a2;
  *(void *)(v4 + 24) = a3;
  atomic_fetch_add_explicit((atomic_ullong *volatile)(result + 8), 1uLL, memory_order_release);
  return result;
}

unint64_t *asan::GlobalsRegistryImpl::getGlobalVar(atomic_ullong *this, unint64_t a2)
{
  unint64_t explicit = atomic_load_explicit(this + 1, memory_order_acquire);
  if (!explicit) {
    return 0;
  }
  unint64_t v3 = this + 2;
  uint64_t v4 = &this[2 * explicit + 2];
  while (1)
  {
    atomic_ullong v5 = v3[1];
    if (v5) {
      break;
    }
LABEL_8:
    v3 += 2;
    if (v3 == v4) {
      return 0;
    }
  }
  unint64_t result = (unint64_t *)*v3;
  uint64_t v7 = v5 << 6;
  while (*result > a2 || result[2] + *result <= a2)
  {
    result += 8;
    v7 -= 64;
    if (!v7) {
      goto LABEL_8;
    }
  }
  return result;
}

vm_address_t vm::create<asan::GlobalsRegistryImpl>()
{
  if (0x8000uLL % *MEMORY[0x263EF8C78]) {
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  }
  vm_map_t v0 = *MEMORY[0x263EF8C60];
  vm_address_t address = 0;
  uint64_t v1 = (debug *)vm_map(v0, &address, 0x8000uLL, 0, 1660944385, 0, 0, 0, 3, 3, 1u);
  if (v1) {
    vm::create<asan::GlobalsRegistryImpl>(v1, v2);
  }
  vm_address_t v3 = address;
  *(void *)vm_address_t address = &unk_270ED4C00;
  *(void *)(v3 + 8) = 0;
  bzero((void *)(v3 + 16), 0x7FF0uLL);
  return v3;
}

uint8_t *asan::initGlobalVars(Shadow *,asan::GlobalsRegistry *)::$_0::__invoke(const mach_header_64 *a1)
{
  unint64_t size = 0;
  unint64_t result = getsectiondata(a1, "__DATA", "__asan_globals", &size);
  if ((size & 0x3F) != 0) {
    asan::initGlobalVars(Shadow *,asan::GlobalsRegistry *)::$_0::__invoke();
  }
  if (size)
  {
    unsigned int v2 = result;
    uint64_t v3 = (uint64_t)size >> 6;
    uint64_t v4 = (uint64_t)size >> 6 << 6;
    atomic_ullong v5 = result;
    do
    {
      (*(void (**)(uint64_t, uint8_t *))(*(void *)asan::_shadow + 16))(asan::_shadow, v5);
      v5 += 64;
      v4 -= 64;
    }
    while (v4);
    return (uint8_t *)(**(uint64_t (***)(uint64_t, uint8_t *, uint64_t))asan::_globals)(asan::_globals, v2, v3);
  }
  return result;
}

uint64_t asan::initCompilerABI(uint64_t result)
{
  _shadow = result;
  return result;
}

uint64_t __asan_abi_load_n(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 88))(_shadow, a1, a2);
    if (result)
    {
      uint64_t v11 = 0;
      memset(v8, 0, sizeof(v8));
      *(void *)&long long v9 = v2;
      *((void *)&v9 + 1) = &vars0;
      unint64_t v10 = &v11;
      *(void *)&long long v6 = a1;
      *((void *)&v6 + 1) = a2;
      char v7 = 0;
      asan::reportError(&v9, &v6);
    }
  }
  return result;
}

uint64_t __asan_abi_region_is_poisoned(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 88))(_shadow, a1, a2);
  }
  return result;
}

uint64_t __asan_abi_exp_load_n(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 88))(_shadow, a1, a2);
  }
  return result;
}

uint64_t __asan_abi_store_n(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 88))(_shadow, a1, a2);
    if (result)
    {
      uint64_t v11 = 0;
      memset(v8, 0, sizeof(v8));
      *(void *)&long long v9 = v2;
      *((void *)&v9 + 1) = &vars0;
      unint64_t v10 = &v11;
      *(void *)&long long v6 = a1;
      *((void *)&v6 + 1) = a2;
      char v7 = 1;
      asan::reportError(&v9, &v6);
    }
  }
  return result;
}

uint64_t __asan_abi_exp_store_n(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 88))(_shadow, a1, a2);
  }
  return result;
}

uint64_t __asan_abi_address_is_poisoned(uint64_t a1)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)_shadow + 64))(_shadow, a1);
  }
  return result;
}

uint64_t __asan_abi_poison_memory_region(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, void, uint64_t, uint64_t))(*(void *)_shadow + 72))(_shadow, a1, 0, 0, a2, 249);
  }
  return result;
}

uint64_t __asan_abi_unpoison_memory_region(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 80))(_shadow, a1, a2);
  }
  return result;
}

uint64_t __asan_abi_set_shadow_xx_n(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = _shadow;
  if (_shadow) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)_shadow + 8))(_shadow, a1, a3, a2);
  }
  return result;
}

uint64_t __asan_abi_load_cxx_array_cookie()
{
  return 0;
}

uint64_t __asan_abi_get_current_fake_stack()
{
  return 0;
}

uint64_t __asan_abi_addr_is_in_fake_stack()
{
  return 0;
}

void *__asan_abi_stack_malloc_n(int a1, size_t size)
{
  if (!_shadow) {
    return 0;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(void *)(StatusReg + 1848) = 1;
  uint64_t result = malloc_type_malloc(size, 0xBA746D43uLL);
  *(void *)(StatusReg + 1848) = 0;
  return result;
}

void *__asan_abi_stack_malloc_always_n(int a1, size_t size)
{
  if (!_shadow) {
    return 0;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(void *)(StatusReg + 1848) = 1;
  uint64_t result = malloc_type_malloc(size, 0x3827F463uLL);
  *(void *)(StatusReg + 1848) = 0;
  return result;
}

void __asan_abi_stack_free_n(int a1, void *a2)
{
  if (_shadow)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(void *)(StatusReg + 1848) = 1;
    free(a2);
    *(void *)(StatusReg + 1848) = 0;
  }
}

uint64_t asan::initRuntime(asan *a1)
{
  if ((_BYTE)cfg) {
    asan::initRuntime();
  }
  cfg = *(void *)a1;
  asan::initShadow(a1);
  uint64_t v2 = (uint64_t)v1;
  uint64_t inited = asan::initGlobalsRegistry(v1);

  return asan::initRuntime(v2, inited);
}

uint64_t asan::initRuntime(uint64_t a1, uint64_t a2)
{
  asan::initCompilerABI(a1);
  asan::initGlobalVars(a1, a2);
  libmallocShadow = a1;
  uint64_t result = malloc_sanitizer_set_functions();
  reportShadow = a1;
  reportGlobals = a2;
  return result;
}

uint64_t asan::initLibmallocHooks(uint64_t a1)
{
  libmallocShadow = a1;
  return malloc_sanitizer_set_functions();
}

uint64_t asan::initReportGeneration(uint64_t result, uint64_t a2)
{
  reportShadow = result;
  reportGlobals = a2;
  return result;
}

uint64_t asan::initLibmallocHooks(Shadow *)::$_0::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    asan::initLibmallocHooks(Shadow *)::$_0::__invoke();
  }
  if (a4)
  {
    uint64_t v4 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 1848);
    uint64_t v5 = *(void *)libmallocShadow;
    if (v4)
    {
      long long v6 = *(uint64_t (**)(void))(v5 + 40);
    }
    else
    {
      long long v6 = *(uint64_t (**)(void))(v5 + 24);
    }
    return v6();
  }
  else
  {
    unint64_t v8 = *(uint64_t (**)(void))(*(void *)libmallocShadow + 72);
    return v8();
  }
}

uint64_t asan::initLibmallocHooks(Shadow *)::$_1::__invoke()
{
  uint64_t v0 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 1848);
  uint64_t v1 = *(void *)libmallocShadow;
  if (v0) {
    return (*(uint64_t (**)(void))(v1 + 48))();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 32))();
  }
}

void asan::reportError(long long *a1, long long *a2)
{
  malloc_sanitizer_set_functions();
  memset(v50, 0, 384);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long __src = 0u;
  long long v43 = 0u;
  long long v40 = *a1;
  uint64_t v41 = *((void *)a1 + 2);
  long long v38 = *a2;
  uint64_t v39 = *((void *)a2 + 2);
  trace::Lookup::create((trace::Lookup *)&v59, v4);
  v60.dli_fname = (const char *)reportShadow;
  v60.dli_fbase = v5;
  v60.dli_sname = (const char *)reportGlobals;
  long long v57 = v40;
  uint64_t v58 = v41;
  long long v55 = v38;
  uint64_t v56 = v39;
  asan::ReportGenerator::createReport((uint64_t *)&v60, (uint64_t)&v57, &v55, (uint64_t)&__src);
  if (BYTE1(cfg))
  {
    if (BYTE8(v44)) {
      char v7 = "WRITE";
    }
    else {
      char v7 = "READ";
    }
    unsigned int v8 = v45;
    if (BYTE8(v48)) {
      long long v9 = "freed ";
    }
    else {
      long long v9 = &byte_263DF2B72;
    }
    unint64_t v10 = "allocation";
    if ((v45 & 0xFFFFFFFE) == 4) {
      unint64_t v10 = "stack variable";
    }
    if (v45 == 2) {
      uint64_t v11 = "global variable";
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t v12 = *((void *)&v47 + 1);
    uint64_t v13 = *((void *)&v43 + 1) - *((void *)&v47 + 1);
    uint64_t v14 = v48 + *((void *)&v47 + 1);
    debug::print((debug *)"=================================================================\n", v6);
    debug::print((debug *)"Address Sanitizer: %s at address %p\n", v15, *((void *)&v45 + 1), *((void *)&v43 + 1));
    debug::print((debug *)"Registers: pc=%p fp=%p sp=%p\n", v16, __src, (void)v43);
    debug::print((debug *)"Faulty %s of size %zu at address %p\n", v17, v7, (void)v44, *((void *)&v43 + 1));
    debug::print((debug *)"Located at offset %td of %s%s ", v18, v13, v9, v11);
    if (v8 <= 5 && ((1 << v8) & 0x34) != 0) {
      debug::print((debug *)"'%.*s' ", v19, (void)v47, *((void *)&v46 + 1));
    }
    debug::print((debug *)"[%p, %p), size: %td\n", v19, v12, v14, (void)v48);
    debug::print((debug *)"\n", v20);
    unsigned int v21 = (void *)*((void *)&__src + 1);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    bzero(&v59.dli_sname, 0x208uLL);
    v59.dli_fname = *(const char **)(StatusReg - 8);
    v59.dli_fbase = (void *)mach_absolute_time();
    LODWORD(v59.dli_sname) = backtrace_from_fp(v21, &v59.dli_saddr, 64);
    debug::print((debug *)"%s trace on thread %llu at MAT %llu\n", v23, "Fault", v59.dli_fname, v59.dli_fbase);
    if (LODWORD(v59.dli_sname))
    {
      unint64_t v25 = 0;
      do
      {
        long long v26 = (const void *)*((void *)&v59.dli_saddr + v25);
        memset(&v60, 0, sizeof(v60));
        dladdr(v26, &v60);
        debug::print((debug *)"  %2lu. %p in %s + %zu (%s)\n", v27, ++v25, v26, v60.dli_sname, (unsigned char *)v26 - (char *)v60.dli_saddr, v60.dli_fname);
      }
      while (v25 < LODWORD(v59.dli_sname));
    }
    debug::print((debug *)"\n", v24);
    if (v8 > 5 || ((1 << v8) & 0x34) == 0)
    {
      debug::print((debug *)"%s trace on thread %llu at MAT %llu\n", v28, "Allocation", v49);
      if (LODWORD(v50[0]))
      {
        unint64_t v30 = 0;
        do
        {
          v31 = (const void *)*((void *)v50 + v30 + 1);
          memset(&v59, 0, sizeof(v59));
          dladdr(v31, &v59);
          debug::print((debug *)"  %2lu. %p in %s + %zu (%s)\n", v32, ++v30, v31, v59.dli_sname, (unsigned char *)v31 - (char *)v59.dli_saddr, v59.dli_fname);
        }
        while (v30 < LODWORD(v50[0]));
      }
      debug::print((debug *)"\n", v29);
      if (BYTE8(v48))
      {
        debug::print((debug *)"%s trace on thread %llu at MAT %llu\n", v33, "Deallocation", v51, v52);
        if (v53)
        {
          for (unint64_t i = 0;
                i < v53;
                debug::print((debug *)"  %2lu. %p in %s + %zu (%s)\n", v37, ++i, v36, v59.dli_sname, v36 - (char *)v59.dli_saddr, v59.dli_fname))
          {
            v36 = (unsigned char *)v54[i];
            memset(&v59, 0, sizeof(v59));
            dladdr(v36, &v59);
          }
        }
        debug::print((debug *)"\n", v34);
      }
    }
  }
  asan::callDebuggerBreakpointSymbol(&__src);
  die();
}

void die(void)
{
  if (!HIDWORD(cfg)) {
    abort();
  }
  _exit(SHIDWORD(cfg));
}

void asan::callDebuggerBreakpointSymbol(void *__src)
{
  memcpy(&report, __src, 0x4B0uLL);

  sanitizers_address_on_report();
}

BOOL __asan_report_present()
{
  return qword_26AA38928 != 0;
}

uint64_t __asan_get_report_pc()
{
  return report;
}

uint64_t __asan_get_report_bp()
{
  return qword_26AA38918;
}

uint64_t __asan_get_report_sp()
{
  return qword_26AA38920;
}

uint64_t __asan_get_report_address()
{
  return qword_26AA38928;
}

uint64_t __asan_get_report_access_type()
{
  return byte_26AA38938;
}

uint64_t __asan_get_report_access_size()
{
  return qword_26AA38930;
}

uint64_t __asan_get_report_description()
{
  return qword_26AA38948;
}

uint64_t __asan_locate_address(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, void *a5)
{
  if (qword_26AA38928 != a1) {
    __asan_locate_address_cold_3();
  }
  uint64_t v5 = unk_26AA38970;
  *a4 = qword_26AA38968;
  *a5 = v5;
  if (qword_26AA38960)
  {
    if (!a3) {
      __asan_locate_address_cold_1();
    }
    if (a3 >= qword_26AA38960 + 1) {
      uint64_t v6 = qword_26AA38960 + 1;
    }
    else {
      uint64_t v6 = a3;
    }
    if (!v6) {
      __asan_locate_address_cold_2();
    }
    unint64_t v7 = v6 - 1;
    int v8 = *(unsigned __int8 *)qword_26AA38958;
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = qword_26AA38958 + 1;
      do
      {
        *(unsigned char *)(a2 + v11) = v8;
        uint64_t v10 = v11 + 1;
        int v8 = *(unsigned __int8 *)(v12 + v11);
      }
      while (++v11 < v7 && v8 != 0);
    }
    *(unsigned char *)(a2 + v10) = 0;
  }
  return qword_26AA38950;
}

void *__asan_get_shadow_mapping(void *result, void *a2)
{
  *uint64_t result = qword_26AA38DB0;
  *a2 = qword_26AA38DB8;
  return result;
}

unint64_t __asan_get_alloc_stack(uint64_t a1, void *a2, unint64_t a3, _DWORD *a4)
{
  if (qword_26AA38928 != a1) {
    __asan_get_alloc_stack_cold_1();
  }
  if (a3 >= dword_26AA38990) {
    unint64_t result = dword_26AA38990;
  }
  else {
    unint64_t result = a3;
  }
  if (result)
  {
    uint64_t v5 = &qword_26AA38998;
    unint64_t v6 = result;
    do
    {
      uint64_t v7 = *v5++;
      *a2++ = v7;
      --v6;
    }
    while (v6);
  }
  *a4 = qword_26AA38980;
  return result;
}

unint64_t __asan_get_free_stack(uint64_t a1, void *a2, unint64_t a3, _DWORD *a4)
{
  if (qword_26AA38928 != a1) {
    __asan_get_free_stack_cold_1();
  }
  if (a3 >= dword_26AA38BA8) {
    unint64_t result = dword_26AA38BA8;
  }
  else {
    unint64_t result = a3;
  }
  if (result)
  {
    uint64_t v5 = &qword_26AA38BB0;
    unint64_t v6 = result;
    do
    {
      uint64_t v7 = *v5++;
      *a2++ = v7;
      --v6;
    }
    while (v6);
  }
  *a4 = qword_26AA38B98;
  return result;
}

double asan::initShadow(asan *this)
{
  if (0x200000000uLL % *MEMORY[0x263EF8C78]) {
    vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>();
  }
  vm_map_t v1 = *MEMORY[0x263EF8C60];
  vm_address_t address = 0;
  uint64_t v2 = (debug *)vm_map(v1, &address, 0x200000000uLL, 0, 1660944385, 0, 0, 0, 3, 3, 1u);
  if (v2) {
    asan::initShadow(v2, v3);
  }
  shadow = (uint64_t)&unk_270ED4C38;
  *(void *)algn_26AA38DC8 = address;
  *(void *)&double result = 0x200000000;
  xmmword_26AA38DD0 = xmmword_263DF25B0;
  return result;
}

void *ASanShadow::memsetShadow(ASanShadow *this, void *__b, int __c, size_t __len)
{
  return memset(__b, __c, __len);
}

void ASanShadow::bzeroShadow(ASanShadow *this, void *a2, size_t a3)
{
}

void *ASanShadow::poison(ASanShadow *this, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, int a6)
{
  if ((a2 & 7) != 0) {
    ASanShadow::poison();
  }
  unint64_t v6 = (char *)(*((void *)this + 1) + ((unint64_t)(a2 - *((void *)this + 3)) >> 3));
  int v7 = a3 & 7;
  size_t v8 = a3 >> 3;
  unint64_t v9 = a4 >> 3;
  unint64_t v10 = (a4 + a3 + a5) >> 3;
  if (a6 == 233) {
    int v11 = 250;
  }
  else {
    int v11 = a6;
  }
  if (a6 == 233) {
    int v12 = 251;
  }
  else {
    int v12 = a6;
  }
  if (a6 == 240) {
    int v13 = 241;
  }
  else {
    int v13 = v11;
  }
  if (a6 == 240) {
    int v14 = 243;
  }
  else {
    int v14 = v12;
  }
  memset(v6, v13, a4 >> 3);
  BOOL v15 = &v6[v9];
  bzero(v15, v8);
  unint64_t v16 = &v15[v8];
  size_t v17 = v9 + v8;
  if (v7 && v10 > v17)
  {
    *v16++ = v7;
    size_t v18 = v10 + ~v17;
  }
  else
  {
    size_t v18 = v10 - v17;
  }

  return memset(v16, v14, v18);
}

void ASanShadow::unpoison(ASanShadow *this, uint64_t a2, unint64_t a3)
{
}

BOOL ASanShadow::addressIsPoisoned(ASanShadow *this, uint64_t a2)
{
  if (*(unsigned char *)(((unint64_t)(a2 - *((void *)this + 3)) >> 3) + *((void *)this + 1))) {
    BOOL v2 = (a2 & 7) < *(char *)(((unint64_t)(a2 - *((void *)this + 3)) >> 3) + *((void *)this + 1));
  }
  else {
    BOOL v2 = 1;
  }
  return !v2;
}

uint64_t ASanShadow::regionIsPoisoned(uint64_t this, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = a2;
  uint64_t v4 = a2 + a3;
  if (__CFADD__(a2, a3))
  {
    __break(1u);
    return this;
  }
  uint64_t v5 = *(void *)(this + 24);
  uint64_t v6 = *(void *)(this + 8);
  if (!*(unsigned char *)(((unint64_t)(v4 - 1 - v5) >> 3) + v6)
    || ((v4 - 1) & 7) < *(char *)(((unint64_t)(v4 - 1 - v5) >> 3) + v6))
  {
    unint64_t v8 = v6 + ((unint64_t)(a2 - v5) >> 3);
    unint64_t v9 = v4 - v5;
    unint64_t v10 = v6 + ((unint64_t)(v4 - v5) >> 3);
    unint64_t v11 = v10 - v8;
    if (v10 <= v8) {
      return 0;
    }
    size_t v12 = v11 >= 0x100 ? 256 : v10 - v8;
    if (!memcmp((const void *)(v6 + ((unint64_t)(a2 - v5) >> 3)), &zeros, v12))
    {
      unint64_t v13 = 0;
      unint64_t v14 = v9 >> 3;
      unint64_t v15 = v11 >> 8;
      unint64_t v16 = (char *)(v8 + 256);
      unint64_t v17 = v14 - ((unint64_t)(v3 - v5) >> 3) - 256;
      do
      {
        unint64_t v18 = v13;
        if (v15 == v13) {
          break;
        }
        ++v13;
        unint64_t v19 = v17 - 256;
        size_t v20 = v17 >= 0x100 ? 256 : v17;
        int v21 = memcmp(v16, &zeros, v20);
        v16 += 256;
        unint64_t v17 = v19;
      }
      while (!v21);
      if (v15 <= v18) {
        return 0;
      }
    }
  }
  uint64_t v22 = v3;
  do
  {
    int v23 = *(char *)(((unint64_t)(v3 - v5) >> 3) + v6);
    int v24 = v3 & 7;
    ++v22;
    ++v3;
    if (v23) {
      BOOL v25 = v24 < v23;
    }
    else {
      BOOL v25 = 1;
    }
  }
  while (v25);
  return v3 - 1;
}

uint64_t ASanShadow::getShadowByteForAddress(ASanShadow *this, unint64_t a2)
{
  return *(unsigned __int8 *)(((a2 - *((void *)this + 3)) >> 3) + *((void *)this + 1));
}

void *ASanShadow::setShadowBytes(void *result, uint64_t a2, size_t a3, int __c)
{
  if (a3) {
    return memset((void *)(result[1] + a2), __c, a3);
  }
  return result;
}

unint64_t ASanShadow::shadowForAddress(ASanShadow *this, uint64_t a2)
{
  return *((void *)this + 1) + ((unint64_t)(a2 - *((void *)this + 3)) >> 3);
}

BOOL ASanShadow::addressIsInMem(ASanShadow *this, unint64_t a2)
{
  unint64_t v2 = *((void *)this + 1);
  return v2 > a2 || *((void *)this + 2) + v2 <= a2;
}

BOOL ASanShadow::addressIsInShadow(ASanShadow *this, unint64_t a2)
{
  unint64_t v2 = *((void *)this + 1);
  return v2 <= a2 && *((void *)this + 2) + v2 > a2;
}

uint64_t ASanShadow::getShadowStart(ASanShadow *this)
{
  return *((void *)this + 1);
}

uint64_t ASanShadow::getShadowValue(ASanShadow *this, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = *((void *)this + 1);
  if (v3 <= a2 && *((void *)this + 2) + v3 > a2) {
    ASanShadow::getShadowValue();
  }
  if (a3 >= 0x11) {
    ASanShadow::getShadowValue();
  }
  uint64_t v4 = (unsigned __int8 *)(v3 + ((a2 - *((void *)this + 3)) >> 3));
  if (a3 > 8 && *v4 == 0) {
    ++v4;
  }
  if ((char)*v4 > 0) {
    ++v4;
  }
  return *v4;
}

uint64_t ASanShadow::getAllocationEnd(uint64_t a1, uint64_t *a2)
{
  uint64_t IsPoisoned = ASanShadow::regionIsPoisoned(a1, *a2, a2[1]);
  if (!IsPoisoned) {
    ASanShadow::getAllocationEnd();
  }
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = (unsigned __int8 *)(v5 + ((unint64_t)(IsPoisoned - v4) >> 3));
  unsigned int v7 = *v6;
  if (v7 <= 7)
  {
    unsigned int v8 = *++v6;
    unsigned int v7 = v8;
    if (v8 <= 8) {
      ASanShadow::getAllocationEnd();
    }
  }
  switch(v7)
  {
    case 0xF4u:
    case 0xF5u:
    case 0xF6u:
    case 0xF7u:
    case 0xF8u:
    case 0xF9u:
    case 0xFAu:
      __break(1u);
      JUMPOUT(0x263DF1AE8);
    case 0xFBu:
      unint64_t v9 = v6 - 1;
      do
        int v14 = *++v9;
      while (v14 == 251);
      return v4 + 8 * (void)&v9[-v5];
    case 0xFCu:
      --v6;
      do
        int v12 = *++v6;
      while (v12 == 252);
      goto LABEL_11;
    case 0xFDu:
LABEL_11:
      unint64_t v9 = v6 - 1;
      do
        int v13 = *++v9;
      while (v13 == 253);
      break;
    default:
      unint64_t v9 = v6 - 1;
      do
        int v10 = *++v9;
      while (v10 != 243);
      do
        int v11 = *++v9;
      while (v11 == 243);
      break;
  }
  return v4 + 8 * (void)&v9[-v5];
}

unint64_t ASanShadow::getAllocationInfo(uint64_t a1, long long *a2)
{
  long long v6 = *a2;
  uint64_t v7 = *((void *)a2 + 2);
  unint64_t AllocationEnd = ASanShadow::getAllocationEnd(a1, (uint64_t *)&v6);
  unint64_t result = AllocationEnd - *(void *)(AllocationEnd - 16);
  if (result > *(void *)a2 || *(void *)a2 >= AllocationEnd) {
    ASanShadow::getAllocationInfo();
  }
  return result;
}

void *ASanShadow::poisonGlobal(ASanShadow *a1, uint64_t *a2)
{
  unint64_t result = ASanShadow::poison(a1, *a2, a2[1], 0, a2[2] - a2[1], 249);
  *(void *)((((unint64_t)a2 - *((void *)a1 + 3)) >> 3) + *((void *)a1 + 1)) = 0xF9F9F9F9F9F9F9F9;
  return result;
}

void *ASanShadow::poisonAllocation(ASanShadow *a1, uint64_t a2, unint64_t a3, unint64_t a4, int a5)
{
  unint64_t v6 = a3 - a4;
  if (a3 <= a4) {
    ASanShadow::poisonAllocation();
  }
  if (v6 <= 0xF) {
    ASanShadow::poisonAllocation();
  }
  unint64_t result = ASanShadow::poison(a1, a2, a4, 0, v6, a5);
  if (((a3 + a2) & 7) != 0) {
    ASanShadow::poisonAllocation();
  }
  *(void *)(a3 + a2 - 16) = a3;
  return result;
}

void *ASanShadow::poisonNewAllocation(ASanShadow *this, uint64_t a2, unint64_t a3, unint64_t a4)
{
  return ASanShadow::poisonAllocation(this, a2, a3, a4, 251);
}

void *ASanShadow::poisonNewStackFrame(ASanShadow *this, uint64_t a2, unint64_t a3, unint64_t a4)
{
  return ASanShadow::poisonAllocation(this, a2, a3, a4, 243);
}

void *ASanShadow::poisonFreedAllocation(ASanShadow *this, uint64_t a2, uint64_t a3)
{
  unint64_t result = ASanShadow::poison(this, a2, 0, 0, a3, 253);
  if ((a2 & 7) != 0) {
    ASanShadow::poison();
  }
  *(unsigned char *)(((unint64_t)(a2 - *((void *)this + 3)) >> 3) + *((void *)this + 1)) = -4;
  return result;
}

void *ASanShadow::poisonFreedStackFrame(ASanShadow *this, uint64_t a2, uint64_t a3)
{
  unint64_t result = ASanShadow::poison(this, a2, 0, 0, a3, 253);
  if ((a2 & 7) != 0) {
    ASanShadow::poison();
  }
  *(unsigned char *)(((unint64_t)(a2 - *((void *)this + 3)) >> 3) + *((void *)this + 1)) = -4;
  return result;
}

void asan::ReportGenerator::createReport()
{
  __assert_rtn("createReport", "report_generator.cpp", 27, "shadowVal != ShadowValue::Valid");
}

void asan::ReportGenerator::addHeapBufferOverflowInfo()
{
}

void asan::ReportGenerator::addUseAfterFreeInfo()
{
}

void asan::ReportGenerator::addGlobalBufferOverflowInfo()
{
}

void asan::ReportGenerator::fillStackVarInfo()
{
  __assert_rtn("fillStackVarInfo", "report_generator.cpp", 88, "stackVar.offset != 0");
}

{
  __assert_rtn("fillStackVarInfo", "report_generator.cpp", 80, "alloc.isValid()");
}

void asan::ReportGenerator::StackVar::getStackVar()
{
  __assert_rtn("getStackVar", "report_generator.cpp", 191, "numVars != 0");
}

void trace::initTraceCollection()
{
  __assert_rtn("install", "malloc_logger.h", 76, "malloc_logger != loggerFunc");
}

void vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>(debug *a1, const char *a2)
{
}

void vm::create<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>>()
{
  __assert_rtn("mapCommon", "vm_helpers.h", 26, "(size % vm_page_size) == 0");
}

void vm::create<trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>>(debug *a1, const char *a2)
{
}

void trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::insert()
{
}

void trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>::insertTrace()
{
  __assert_rtn("insertTrace", "trace_depot.h", 128, "length <= MaxTraceLength");
}

void trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::addDeallocTrace()
{
}

void libmalloc::MallocLogger<&(onAlloc(unsigned long,unsigned long,unsigned int)),&(onDealloc(unsigned long,unsigned int))>::loggerFunc()
{
  __assert_rtn("collectTrace", "trace_depot.h", 150, "topFramesToSkip <= 6");
}

void MemoryReader::read()
{
}

void trace::AllocationMap<1048576ul,&(hash::Murmur2::hashPointer(unsigned long))>::get()
{
}

void trace::Extractor<trace::Depot<524288ul,64ul,8ul,hash::Murmur2,&(thread_stack_pcs)>,trace::AllocationMap<1048576ul,&hash::Murmur2::hashPointer>>::retrieveTraces()
{
}

void BlockInfo::endInclusive()
{
}

void asan::GlobalsRegistryImpl::registerSection()
{
}

void vm::create<asan::GlobalsRegistryImpl>(debug *a1, const char *a2)
{
}

void asan::initGlobalVars(Shadow *,asan::GlobalsRegistry *)::$_0::__invoke()
{
  __assert_rtn("getGlobalsSection", "globals.cpp", 33, "(size % sizeof(GlobalVar)) == 0");
}

void asan::initRuntime()
{
}

void asan::initLibmallocHooks(Shadow *)::$_0::__invoke()
{
  __assert_rtn("operator()", "runtime.cpp", 43, "leftrz_sz == 0");
}

void __asan_locate_address_cold_1()
{
}

void __asan_locate_address_cold_2()
{
}

void __asan_locate_address_cold_3()
{
  __assert_rtn("__asan_locate_address", "debugger_abi.cpp", 37, "(uintptr_t)addr == report.access.address");
}

void __asan_get_alloc_stack_cold_1()
{
  __assert_rtn("__asan_get_alloc_stack", "debugger_abi.cpp", 62, "(uintptr_t)addr == report.access.address");
}

void __asan_get_free_stack_cold_1()
{
  __assert_rtn("__asan_get_free_stack", "debugger_abi.cpp", 67, "(uintptr_t)addr == report.access.address");
}

void asan::initShadow(debug *a1, const char *a2)
{
}

void ASanShadow::poison()
{
  __assert_rtn("poison", "shadow.cpp", 127, "(base & (ASAN_SHADOW_ALIGNMENT - 1)) == 0");
}

void ASanShadow::getShadowValue()
{
  __assert_rtn("getShadowValue", "shadow.cpp", 271, "accessSize <= 16");
}

{
  __assert_rtn("getShadowValue", "shadow.cpp", 270, "addressIsInMem(addr)");
}

void ASanShadow::getAllocationEnd()
{
}

{
  __assert_rtn("getAllocationEnd", "shadow.cpp", 296, "*shadowVal > 0x8");
}

void ASanShadow::getAllocationInfo()
{
  __assert_rtn("getAllocationInfo", "shadow.cpp", 342, "allocation <= access.address && access.address < allocationEnd");
}

void ASanShadow::poisonAllocation()
{
  __assert_rtn("poisonAllocation", "shadow.cpp", 357, "redzoneSize >= 16");
}

{
  __assert_rtn("poisonAllocation", "shadow.cpp", 361, "endPtr % 8 == 0");
}

{
  __assert_rtn("poisonAllocation", "shadow.cpp", 355, "allocSize > userSize");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _dyld_register_func_for_add_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
}

void _exit(int a1)
{
}

uint64_t _simple_getenv()
{
  return MEMORY[0x270EDDC20]();
}

void abort(void)
{
}

int backtrace_from_fp(void *startfp, void **array, int size)
{
  return MEMORY[0x270EDD000](startfp, array, *(void *)&size);
}

void bzero(void *a1, size_t a2)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270EDCE20](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270EDD0D8](a1, a2);
}

void free(void *a1)
{
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x270EDCE70](mhp, segname, sectname, size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDD768]();
}

uint64_t malloc_sanitizer_set_functions()
{
  return MEMORY[0x270EDDAE8]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDDAF8](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB08](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDD180](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDD188](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDD190](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDD198](__b, *(void *)&__c, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDD340](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDD350](__str, __endptr, *(void *)&__base);
}

uint64_t thread_stack_pcs()
{
  return MEMORY[0x270EDD370]();
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDDA78](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}