@interface VMUProcInfo
+ (id)getProcessIds;
+ (int)processParentId:(int)a3;
- (BOOL)isApp;
- (BOOL)isCFM;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMachO;
- (BOOL)isNative;
- (BOOL)isRunning;
- (BOOL)isSemiCriticalProcess;
- (BOOL)isSemiCriticalProcessWithNoTimeLimit;
- (BOOL)isZombie;
- (BOOL)shouldAnalyzeWithCorpse;
- (BOOL)signal:(int)a3;
- (BOOL)terminate;
- (VMUProcInfo)initWithPid:(int)a3;
- (VMUProcInfo)initWithTask:(unsigned int)a3;
- (VMUProcInfo)initWithVMUTask:(id)a3;
- (id)_infoFromCommandLine:(int)a3;
- (id)arguments;
- (id)description;
- (id)envVars;
- (id)firstArgument;
- (id)name;
- (id)platformName;
- (id)procTableName;
- (id)realAppName;
- (id)requestedAppName;
- (id)userAppName;
- (id)valueForEnvVar:(id)a3;
- (int)cpuType;
- (int)pid;
- (int)ppid;
- (int64_t)compare:(id)a3;
- (int64_t)compareByName:(id)a3;
- (int64_t)compareByUserAppName:(id)a3;
- (timeval)startTime;
- (unint64_t)hash;
- (unsigned)platform;
- (unsigned)task;
- (void)dealloc;
- (void)update;
@end

@implementation VMUProcInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstArg, 0);
  objc_storeStrong((id *)&self->_requestedAppName, 0);
  objc_storeStrong((id *)&self->_realAppName, 0);
  objc_storeStrong((id *)&self->_procTableName, 0);
  objc_storeStrong((id *)&self->_envVars, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_vmuTask, 0);
}

- (id)userAppName
{
  v3 = [(VMUProcInfo *)self realAppName];
  v4 = v3;
  if (v3)
  {
    [v3 rangeOfString:@"LaunchCFMApp"];
    if (v5)
    {
      uint64_t v6 = [(VMUProcInfo *)self firstArgument];

      v4 = (void *)v6;
    }
  }

  return v4;
}

- (id)realAppName
{
  if (!self->_realAppName)
  {
    v3 = [(VMUProcInfo *)self _infoFromCommandLine:0];
    realAppName = self->_realAppName;
    self->_realAppName = v3;

    uint64_t v5 = self->_realAppName;
    if (!v5 || ![(NSString *)v5 length])
    {
      uint64_t v6 = [(VMUProcInfo *)self procTableName];
      v7 = self->_realAppName;
      self->_realAppName = v6;
    }
  }
  v8 = self->_realAppName;

  return v8;
}

- (VMUProcInfo)initWithPid:(int)a3
{
  v4 = [(VMUProcInfo *)self init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    v4->_task = 0;
    vmuTask = v4->_vmuTask;
    v4->_vmuTask = 0;
  }
  return v5;
}

- (id)name
{
  name = self->_name;
  if (!name)
  {
    if (!self->_pid)
    {
      self->_name = (NSString *)@"mach_kernel";
      goto LABEL_7;
    }
    v4 = [(VMUProcInfo *)self userAppName];
    uint64_t v5 = [v4 lastPathComponent];
    uint64_t v6 = self->_name;
    self->_name = v5;

    v7 = self->_name;
    if (!v7 || ![(NSString *)v7 length])
    {
      name = [(VMUProcInfo *)self procTableName];
      v8 = [name lastPathComponent];
      v9 = self->_name;
      self->_name = v8;

LABEL_7:
    }
  }
  v10 = self->_name;

  return v10;
}

void __38__VMUProcInfo_shouldAnalyzeWithCorpse__block_invoke()
{
  [MEMORY[0x1E4F1CAD0] setWithObjects:@"Activity Monitor", @"bluetoothd", @"cfprefsd", @"coreaudiod", @"coreservicesd", @"coresymbolicationd", @"diagnosticd", @"hidd", @"kernelmanagerd", @"kextd", @"launchd", @"launchd.development", @"launchservicesd", @"logd", @"loginwindow", @"mach_kernel", @"mds",
    @"mdworker",
    @"notifyd",
    @"opendirectoryd",
    @"powerd",
    @"ReportCrash",
    @"ReportMemoryException",
    @"ReportPanic",
    @"rpc.lockd",
    @"securityd",
    @"spindump_agent",
    @"sysdiagnose",
    @"taskgated",
    @"TouchBarServer",
    @"UserEventAgent",
    @"usbd",
    @"watchdogd",
    @"WindowServer",
    @"WindowManager",
  uint64_t v0 = 0);
  v1 = (void *)shouldAnalyzeWithCorpse_s_criticalSystemProcesses;
  shouldAnalyzeWithCorpse_s_criticalSystemProcesses = v0;
}

- (BOOL)shouldAnalyzeWithCorpse
{
  vmuTask = self->_vmuTask;
  if (vmuTask && [(VMUTask *)vmuTask isCore]) {
    return 0;
  }
  if (shouldAnalyzeWithCorpse_onceToken != -1) {
    dispatch_once(&shouldAnalyzeWithCorpse_onceToken, &__block_literal_global_96);
  }
  uint64_t v5 = (void *)shouldAnalyzeWithCorpse_s_criticalSystemProcesses;
  uint64_t v6 = [(VMUProcInfo *)self name];
  LOBYTE(v5) = [v5 containsObject:v6];

  return (char)v5;
}

- (id)procTableName
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_procTableName) {
    goto LABEL_11;
  }
  vmuTask = self->_vmuTask;
  if (vmuTask && [(VMUTask *)vmuTask isCore])
  {
    v4 = [(VMUTask *)self->_vmuTask memoryCache];
    uint64_t v5 = -[VMUTaskMemoryCache coreFileProcName](v4);
    uint64_t v6 = (NSString *)[v5 copy];
    procTableName = self->_procTableName;
    self->_procTableName = v6;

LABEL_11:
    v12 = self->_procTableName;
    goto LABEL_12;
  }
  size_t size = 0;
  *(void *)v16 = 0xE00000001;
  int pid = self->_pid;
  int v17 = 1;
  int v18 = pid;
  if (sysctl(v16, 4u, 0, &size, 0, 0) < 0)
  {
    v14 = "Failure calling sysctl to get buf size";
  }
  else
  {
    v9 = malloc_type_calloc(1uLL, size, 0xA90FD239uLL);
    if ((sysctl(v16, 4u, v9, &size, 0, 0) & 0x80000000) == 0)
    {
      if (v9[10] == self->_pid)
      {
        v10 = [NSString stringWithUTF8String:(char *)v9 + 243];
      }
      else
      {
        v10 = @"Exited process";
      }
      v11 = self->_procTableName;
      self->_procTableName = &v10->isa;

      free(v9);
      goto LABEL_11;
    }
    free(v9);
    v14 = "Failure calling sysctl to get proc buf";
  }
  perror(v14);
  v12 = 0;
LABEL_12:

  return v12;
}

- (void)dealloc
{
  if (!self->_vmuTask)
  {
    mach_port_name_t task = self->_task;
    if (task + 1 >= 2) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], task);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)VMUProcInfo;
  [(VMUProcInfo *)&v4 dealloc];
}

- (id)_infoFromCommandLine:(int)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  size_t size = 0;
  if ((a3 - 3) > 1) {
    uint64_t v5 = &stru_1EFE27F38;
  }
  else {
    uint64_t v5 = (__CFString *)objc_opt_new();
  }
  vmuTask = self->_vmuTask;
  if (vmuTask && [(VMUTask *)vmuTask isCore])
  {
    *(void *)v34 = 0;
    int v32 = 0;
    v7 = [(VMUTask *)self->_vmuTask memoryCache];
    if (-[VMUTaskMemoryCache getCoreFileUserstack:]((uint64_t)v7))
    {
    }
    else
    {
      v9 = [(VMUTask *)self->_vmuTask memoryCache];
      int v10 = -[VMUTaskMemoryCache getCoreFileArgsLen:]((uint64_t)v9);

      if (!v10) {
        goto LABEL_13;
      }
    }
    size_t v30 = 0;
    size_t v31 = 0;
    v11 = [(VMUTask *)self->_vmuTask memoryCache];
    int v12 = [v11 mapAddress:*(void *)v34 - v32 size:v32 returnedAddress:&v31 returnedSize:&v30];

    if (v12) {
      goto LABEL_13;
    }
    size_t size = v30;
    v16 = malloc_type_malloc(v30, 0xE7F56D78uLL);
    if (!v16) {
      goto LABEL_13;
    }
    v8 = v16;
    memcpy(v16, (const void *)v31, size);
  }
  else
  {
    *(void *)v34 = 0x800000001;
    size_t v31 = 8;
    if (sysctl(v34, 2u, &size, &v31, 0, 0))
    {
LABEL_13:
      v13 = v5;
      goto LABEL_14;
    }
    *(void *)v34 = 0x3100000001;
    int pid = self->_pid;
    v8 = malloc_type_malloc(size, 0x3F566F42uLL);
    if (sysctl(v34, 3u, v8, &size, 0, 0))
    {
LABEL_10:
      free(v8);
      goto LABEL_13;
    }
  }
  *((unsigned char *)v8 + size - 1) = 0;
  if (!a3)
  {
    uint64_t v19 = NSString;
    v20 = v8 + 1;
LABEL_29:
    v21 = [v19 stringWithUTF8String:v20];

    free(v8);
    v13 = v21;
    goto LABEL_14;
  }
  size_t v17 = size;
  size_t v18 = 4;
  if (size >= 5)
  {
    while (*((unsigned char *)v8 + v18))
    {
      if (size == ++v18) {
        goto LABEL_10;
      }
    }
  }
  if (v18 >= size) {
    goto LABEL_10;
  }
  while (!*((unsigned char *)v8 + v18))
  {
    if (size == ++v18) {
      goto LABEL_10;
    }
  }
  if (a3 == 1)
  {
    v20 = (_DWORD *)((char *)v8 + v18);
    uint64_t v19 = NSString;
    goto LABEL_29;
  }
  if (v18 < size)
  {
    while (*((unsigned char *)v8 + v18))
    {
      if (++v18 >= size) {
        goto LABEL_10;
      }
    }
  }
  if (v18 >= size) {
    goto LABEL_10;
  }
  while (!*((unsigned char *)v8 + v18))
  {
    if (size == ++v18) {
      goto LABEL_10;
    }
  }
  int v22 = *v8 - (*v8 > 0);
  if (v22 >= 1 && v18 < size)
  {
    uint64_t v26 = 0;
    while (1)
    {
      v27 = [NSString stringWithUTF8String:(char *)v8 + v18];
      v28 = v27;
      if (v27)
      {
        size_t v29 = [(__CFString *)v27 length];
      }
      else
      {
        NSLog(&cfstr_ArgumentNumDUt.isa, v26, (char *)v8 + v18);
        size_t v29 = strlen((const char *)v8 + v18);
      }
      v18 += v29;
      if (v18 < size)
      {
        while (!*((unsigned char *)v8 + v18))
        {
          if (++v18 >= size)
          {
            size_t v18 = size;
            break;
          }
        }
      }
      if (a3 == 2) {
        break;
      }
      if (a3 == 3 && v28) {
        [(__CFString *)v5 addObject:v28];
      }

      uint64_t v26 = (v26 + 1);
      size_t v17 = size;
      if ((int)v26 >= v22 || v18 >= size) {
        goto LABEL_45;
      }
    }

    goto LABEL_72;
  }
LABEL_45:
  if ((a3 & 0xFFFFFFFE) != 2 && v18 < v17)
  {
    if (a3 == 4)
    {
      do
      {
        if (*((unsigned char *)v8 + v18))
        {
          v24 = [NSString stringWithUTF8String:(char *)v8 + v18];
          if ([v24 length] && [v24 rangeOfString:@"="] != NSNotFound)
          {
            [(__CFString *)v5 addObject:v24];
            size_t v25 = [v24 length];
          }
          else
          {
            size_t v25 = strlen((const char *)v8 + v18);
          }
          v18 += v25;

          size_t v17 = size;
        }
        ++v18;
      }
      while (v18 < v17);
    }
    goto LABEL_10;
  }
  v28 = v5;
LABEL_72:
  free(v8);
  v13 = v28;
LABEL_14:
  v14 = v13;

  return v14;
}

- (VMUProcInfo)initWithTask:(unsigned int)a3
{
  int x = 0;
  objc_super v4 = [(VMUProcInfo *)self init];
  uint64_t v5 = v4;
  if (v4)
  {
    vmuTask = v4->_vmuTask;
    v4->_vmuTask = 0;

    if (!mach_port_mod_refs(*MEMORY[0x1E4F14960], a3, 0, 1))
    {
      v5->_mach_port_name_t task = a3;
      if (!pid_for_task(a3, &x)) {
        v5->_int pid = x;
      }
    }
  }
  return v5;
}

- (VMUProcInfo)initWithVMUTask:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(VMUProcInfo *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vmuTask, a3);
    v7->_int pid = [(VMUTask *)v7->_vmuTask pid];
    v7->_mach_port_name_t task = [(VMUTask *)v7->_vmuTask taskPort];
  }

  return v7;
}

+ (id)getProcessIds
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v10 = 0;
  size_t size = 0;
  *(void *)v9 = 0xE00000001;
  v2 = [MEMORY[0x1E4F1CA48] array];
  if (sysctl(v9, 3u, 0, &size, 0, 0) < 0)
  {
    perror("Failure calling sysctl to get process list buffer size");
  }
  else
  {
    v3 = (int *)malloc_type_calloc(1uLL, size, 0xE1BF5590uLL);
    if ((sysctl(v9, 3u, v3, &size, 0, 0) & 0x80000000) == 0 && (int)(size / 0x288) >= 1)
    {
      uint64_t v4 = (size / 0x288);
      id v5 = v3 + 10;
      do
      {
        uint64_t v6 = [NSNumber numberWithInteger:*v5];
        [v2 insertObject:v6 atIndex:0];

        v5 += 162;
        --v4;
      }
      while (v4);
    }
    free(v3);
  }

  return v2;
}

+ (int)processParentId:(int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  size_t v4 = 648;
  *(void *)id v5 = 0xE00000001;
  int v6 = 1;
  int v7 = a3;
  sysctl(v5, 4u, v8, &v4, 0, 0);
  if (v4 == 648) {
    return v9;
  }
  else {
    return -1;
  }
}

- (timeval)startTime
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_startTime = &self->_startTime;
  __darwin_time_t tv_sec = self->_startTime.tv_sec;
  if (tv_sec) {
    goto LABEL_4;
  }
  if (self->_startTime.tv_usec)
  {
    __darwin_time_t tv_sec = 0;
LABEL_4:
    uint64_t v5 = *(void *)&self->_startTime.tv_usec;
    goto LABEL_21;
  }
  vmuTask = self->_vmuTask;
  if (vmuTask && [(VMUTask *)vmuTask isCore])
  {
    *(void *)v14 = 0;
    int v7 = [(VMUTask *)self->_vmuTask memoryCache];
    if (-[VMUTaskMemoryCache getCoreFileProcStarttimeSec:]((uint64_t)v7))
    {
    }
    else
    {
      uint64_t v10 = [(VMUTask *)self->_vmuTask memoryCache];
      int v11 = -[VMUTaskMemoryCache getCoreFileProcStarttimeUSec:]((uint64_t)v10);

      if (!v11)
      {
        __darwin_time_t tv_sec = *(void *)v14;
        self->_startTime.__darwin_time_t tv_sec = *(void *)v14;
        self->_startTime.tv_usec = 0;
        goto LABEL_4;
      }
    }
    goto LABEL_20;
  }
  size_t size = 0;
  *(void *)v14 = 0xE00000001;
  int pid = self->_pid;
  int v15 = 1;
  int v16 = pid;
  if (sysctl(v14, 4u, 0, &size, 0, 0) < 0)
  {
    int v12 = "Failure calling sysctl to get buf size";
LABEL_19:
    perror(v12);
    goto LABEL_20;
  }
  int v9 = (timeval *)malloc_type_calloc(1uLL, size, 0xC9AB2DADuLL);
  if (sysctl(v14, 4u, v9, &size, 0, 0) < 0)
  {
    free(v9);
    int v12 = "Failure calling sysctl to get proc buf";
    goto LABEL_19;
  }
  if (v9[2].tv_usec == self->_pid)
  {
    timeval *p_startTime = *v9;
    free(v9);
    __darwin_time_t tv_sec = p_startTime->tv_sec;
    goto LABEL_4;
  }
  free(v9);
LABEL_20:
  uint64_t v5 = 0;
  __darwin_time_t tv_sec = 0;
LABEL_21:
  result.tv_usec = v5;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (id)requestedAppName
{
  if (!self->_requestedAppName)
  {
    v3 = [(VMUProcInfo *)self _infoFromCommandLine:1];
    requestedAppName = self->_requestedAppName;
    self->_requestedAppName = v3;

    uint64_t v5 = self->_requestedAppName;
    if (!v5 || ![(NSString *)v5 length])
    {
      int v6 = [(VMUProcInfo *)self procTableName];
      int v7 = self->_requestedAppName;
      self->_requestedAppName = v6;
    }
  }
  v8 = self->_requestedAppName;

  return v8;
}

- (id)firstArgument
{
  p_firstArg = &self->_firstArg;
  firstArg = self->_firstArg;
  if (!firstArg)
  {
    uint64_t v5 = [(VMUProcInfo *)self _infoFromCommandLine:2];
    int v6 = (void *)v5;
    if (v5) {
      int v7 = (__CFString *)v5;
    }
    else {
      int v7 = &stru_1EFE27F38;
    }
    objc_storeStrong((id *)p_firstArg, v7);

    firstArg = self->_firstArg;
  }

  return firstArg;
}

- (id)arguments
{
  arguments = self->_arguments;
  if (!arguments)
  {
    size_t v4 = [(VMUProcInfo *)self _infoFromCommandLine:3];
    uint64_t v5 = self->_arguments;
    self->_arguments = v4;

    arguments = self->_arguments;
  }

  return arguments;
}

- (id)envVars
{
  envVars = self->_envVars;
  if (!envVars)
  {
    size_t v4 = [(VMUProcInfo *)self _infoFromCommandLine:4];
    uint64_t v5 = self->_envVars;
    self->_envVars = v4;

    envVars = self->_envVars;
  }

  return envVars;
}

- (id)valueForEnvVar:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1AD0D9F90]();
  uint64_t v6 = [v4 length];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = (void *)[[NSString alloc] initWithFormat:@"%@=", v4];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v9 = [(VMUProcInfo *)self envVars];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      int v12 = 0;
      uint64_t v13 = v7 + 1;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v9);
          }
          int v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v16 hasPrefix:v8])
          {
            uint64_t v17 = [v16 substringFromIndex:v13];

            int v12 = (void *)v17;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<VMUProcInfo: %@ (PID %d)>", self->_name, self->_pid];
}

- (int)pid
{
  return self->_pid;
}

- (int)ppid
{
  int result = self->_ppid;
  if (!result)
  {
    vmuTask = self->_vmuTask;
    if (vmuTask && [(VMUTask *)vmuTask isCore])
    {
      uint64_t v5 = [(VMUTask *)self->_vmuTask memoryCache];
      -[VMUTaskMemoryCache getCoreFilePPid:]((uint64_t)v5);

      int result = -1;
    }
    else
    {
      int result = +[VMUProcInfo processParentId:self->_pid];
    }
    self->_pint pid = result;
  }
  return result;
}

- (unsigned)task
{
  return 0;
}

- (void)update
{
  name = self->_name;
  self->_name = 0;

  id v4 = [(VMUProcInfo *)self name];
  envVars = self->_envVars;
  self->_envVars = 0;

  id v6 = [(VMUProcInfo *)self envVars];
  procTableName = self->_procTableName;
  self->_procTableName = 0;

  id v8 = [(VMUProcInfo *)self procTableName];
  realAppName = self->_realAppName;
  self->_realAppName = 0;

  id v10 = [(VMUProcInfo *)self realAppName];
  requestedAppName = self->_requestedAppName;
  self->_requestedAppName = 0;

  id v12 = [(VMUProcInfo *)self requestedAppName];
  firstArg = self->_firstArg;
  self->_firstArg = 0;

  id v14 = [(VMUProcInfo *)self firstArgument];

  [(VMUProcInfo *)self isZombie];
}

- (BOOL)isApp
{
  return 0;
}

- (BOOL)isMachO
{
  return ![(VMUProcInfo *)self isCFM];
}

- (BOOL)isCFM
{
  v2 = [(VMUProcInfo *)self realAppName];
  BOOL v3 = [v2 rangeOfString:@"LaunchCFMApp"] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (int)cpuType
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v10 = -1;
  vmuTask = self->_vmuTask;
  if (vmuTask && [(VMUTask *)vmuTask isCore])
  {
    id v4 = [(VMUTask *)self->_vmuTask memoryCache];
    int v5 = [v4 getCoreFileCPUType:&v10];

    if (v5) {
      return -1;
    }
    else {
      return v10;
    }
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    *(_OWORD *)uint64_t v11 = 0u;
    size_t v9 = 12;
    if (sysctlnametomib("sysctl.proc_cputype", v11, &v9) != -1)
    {
      size_t v7 = v9;
      v11[v9] = self->_pid;
      size_t v8 = 4;
      size_t v9 = v7 + 1;
      if (sysctl(v11, v7 + 1, &v10, &v8, 0, 0) == -1) {
        return -1;
      }
    }
    return v10;
  }
}

- (BOOL)isNative
{
  vmuTask = self->_vmuTask;
  if (!vmuTask || ![(VMUTask *)vmuTask isCore]) {
    return CSTaskIsTranslated() ^ 1;
  }
  id v4 = [(VMUTask *)self->_vmuTask memoryCache];
  char v5 = [v4 taskIsTranslated];

  return v5;
}

- (unsigned)platform
{
  unsigned int v7 = 0;
  vmuTask = self->_vmuTask;
  if (vmuTask && [(VMUTask *)vmuTask isCore])
  {
    id v4 = [(VMUTask *)self->_vmuTask memoryCache];
    int v5 = [v4 getPlatform:&v7];

    if (v5) {
      return 0;
    }
    else {
      return v7;
    }
  }
  else
  {
    return CSPlatformForTask();
  }
}

- (id)platformName
{
  uint64_t v2 = [(VMUProcInfo *)self platform];

  return VMUPlatformNameForPlatform(v2);
}

- (BOOL)isRunning
{
  vmuTask = self->_vmuTask;
  if (vmuTask && [(VMUTask *)vmuTask isCore]) {
    return 0;
  }
  uint64_t pid = self->_pid;

  return VMUProcessIsAnalyzable(pid);
}

- (BOOL)isSemiCriticalProcess
{
  if (isSemiCriticalProcess_onceToken != -1) {
    dispatch_once(&isSemiCriticalProcess_onceToken, &__block_literal_global_15);
  }
  BOOL v3 = [(VMUProcInfo *)self name];
  if ([(id)isSemiCriticalProcess_s_semiCriticalSystemProcesses containsObject:v3]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasSuffix:@"boardd"];
  }

  return v4;
}

void __36__VMUProcInfo_isSemiCriticalProcess__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithObjects:@"Carousel", @"SpringBoard", nil];
  v1 = (void *)isSemiCriticalProcess_s_semiCriticalSystemProcesses;
  isSemiCriticalProcess_s_semiCriticalSystemProcesses = v0;
}

- (BOOL)isSemiCriticalProcessWithNoTimeLimit
{
  return 0;
}

- (BOOL)isZombie
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  vmuTask = self->_vmuTask;
  if (vmuTask && [(VMUTask *)vmuTask isCore]) {
    return 0;
  }
  BOOL result = 1;
  if (!self->_isZombie)
  {
    size_t size = 0;
    *(void *)size_t v9 = 0xE00000001;
    int pid = self->_pid;
    int v10 = 1;
    int v11 = pid;
    if (sysctl(v9, 4u, 0, &size, 0, 0) < 0)
    {
      unsigned int v7 = "Failure calling sysctl to get buf size";
    }
    else
    {
      id v6 = malloc_type_calloc(1uLL, size, 0x3D3C66DFuLL);
      if (sysctl(v9, 4u, v6, &size, 0, 0) < 0)
      {
        free(v6);
        unsigned int v7 = "Failure calling sysctl to get proc buf";
      }
      else
      {
        if (*((_DWORD *)v6 + 10) == self->_pid)
        {
          self->_isZombie = *((unsigned char *)v6 + 36) == 5;
          free(v6);
          return self->_isZombie;
        }
        free(v6);
        unsigned int v7 = "Process exited";
      }
    }
    perror(v7);
    return 0;
  }
  return result;
}

- (BOOL)terminate
{
  vmuTask = self->_vmuTask;
  if (vmuTask && [(VMUTask *)vmuTask isCore]) {
    return 1;
  }
  pid_t pid = self->_pid;
  if (pid < 1) {
    return 0;
  }
  int v6 = kill(pid, 3);
  int v7 = kill(self->_pid, 9);
  return !v6 || v7 == 0;
}

- (BOOL)signal:(int)a3
{
  vmuTask = self->_vmuTask;
  return vmuTask && [(VMUTask *)vmuTask isCore] || kill(self->_pid, a3) == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [v4 pid] == self->_pid;

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int pid = self->_pid;
  if (pid >= (int)[v4 pid])
  {
    int v7 = self->_pid;
    int64_t v6 = v7 != [v4 pid];
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (int64_t)compareByName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VMUProcInfo *)self name];
  int64_t v6 = [v4 name];

  int64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (int64_t)compareByUserAppName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VMUProcInfo *)self userAppName];
  int64_t v6 = [v4 userAppName];

  int64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VMUProcInfo;
  return [(VMUProcInfo *)&v3 hash];
}

@end