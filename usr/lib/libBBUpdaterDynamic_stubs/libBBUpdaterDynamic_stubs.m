uint64_t (*BBUpdaterExtremeCreate())(void)
{
  uint64_t (*result)(void);
  uint64_t vars8;

  if (_MergedGlobals == -1)
  {
    result = (uint64_t (*)(void))off_2686C1338;
    if (!off_2686C1338) {
      return result;
    }
  }
  else
  {
    dispatch_once(&_MergedGlobals, &__block_literal_global);
    result = (uint64_t (*)(void))off_2686C1338;
    if (!off_2686C1338) {
      return result;
    }
  }

  return (uint64_t (*)(void))result();
}

void sBBUpdaterLoadLibrary()
{
  if (access("/System/Library/Frameworks/CoreTelephony.framework", 0))
  {
    v0 = dlopen("/usr/lib/libBBUpdaterDynamic.dylib", 261);
    if (!v0)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "failed loading %s\n", "/usr/lib/libBBUpdaterDynamic.dylib");
      off_2686C1340 = 0;
      off_2686C1348 = 0;
      off_2686C1338 = 0;
    }
    v1 = "BBUpdaterExtremeCreate";
    off_2686C1338 = dlsym(v0, "BBUpdaterExtremeCreate");
    if (!off_2686C1338
      || (v1 = "BBUpdaterSetOptions", (off_2686C1340 = dlsym(v0, "BBUpdaterSetOptions")) == 0)
      || (v1 = "BBUpdaterExecCommand", (off_2686C1348 = dlsym(v0, "BBUpdaterExecCommand")) == 0))
    {
      syslog(3, "failed loading %s from %s\n", v1, "/usr/lib/libBBUpdaterDynamic.dylib");
      off_2686C1338 = 0;
      off_2686C1340 = 0;
      off_2686C1348 = 0;
    }
  }
  else
  {
    v2 = getprogname();
    syslog(5, "ummm...why is %s linking with libBBUpdaterDynamic.dylib?\n", v2);
  }
}

uint64_t BBUpdaterSetOptions(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (_MergedGlobals != -1)
  {
    dispatch_once(&_MergedGlobals, &__block_literal_global_3);
    v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_2686C1340;
    if (off_2686C1340) {
      goto LABEL_3;
    }
    return 0;
  }
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_2686C1340;
  if (!off_2686C1340) {
    return 0;
  }
LABEL_3:

  return v6(a1, a2, a3);
}

uint64_t BBUpdaterExecCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (_MergedGlobals != -1)
  {
    dispatch_once(&_MergedGlobals, &__block_literal_global_6);
    v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))off_2686C1348;
    if (off_2686C1348) {
      goto LABEL_3;
    }
    return 0;
  }
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))off_2686C1348;
  if (!off_2686C1348) {
    return 0;
  }
LABEL_3:

  return v8(a1, a2, a3, a4);
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}