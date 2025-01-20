@interface MXMResourceProbe
+ (id)probe;
+ (int)_processIdentifierWithProcessName:(const char *)a3 error:(id *)a4;
- (BOOL)performPreIterationActions;
- (MXMResourceProbe)init;
- (NSThread)pollingThread;
- (id)_pollMainBody;
- (id)sampleWithTimeout:(double)a3 stopReason:(unint64_t *)a4;
- (void)_beginUpdates;
- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 mach_space_basicinfo:(ipc_info_space_basic *)a5;
- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 pm_networking_stats:(id *)a5;
- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 rusage:(rusage_info_v6 *)a5;
- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 taskinfo:(proc_taskinfo *)a5;
- (void)_pollAllProcesses:(id)a3;
- (void)_pollBasicTaskInformation:(id)a3 pid:(int)a4;
- (void)_pollProcessNetworkingStatsWithData:(id)a3 pid:(int)a4 task:(unsigned int)a5;
- (void)_pollProcessResourceUsageWithData:(id)a3 pid:(int)a4;
- (void)_pollProcessWithData:(id)a3 pid:(int)a4;
- (void)_pollTaskMachPortInformation:(id)a3 task:(unsigned int)a4;
- (void)_stopUpdates;
- (void)setPollingThread:(id)a3;
@end

@implementation MXMResourceProbe

+ (int)_processIdentifierWithProcessName:(const char *)a3 error:(id *)a4
{
  *(void *)&v19[17] = *MEMORY[0x263EF8340];
  v6 = getprogname();
  if (strcmp(v6, a3))
  {
    *__error() = 0;
    int v7 = proc_listpids(1u, 0, 0, 0);
    v8 = malloc_type_malloc(v7, 0x8D521121uLL);
    int v9 = proc_listpids(1u, 0, v8, v7);
    if (*__error() || (v7 >= v9 ? (unsigned int v10 = v9) : (unsigned int v10 = v7), v10 < 4))
    {
LABEL_12:
      free(v8);
    }
    else
    {
      uint64_t v11 = 0;
      unint64_t v12 = (unint64_t)(int)v10 >> 2;
      if (v12 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v12;
      }
      while (1)
      {
        int v14 = *((_DWORD *)v8 + v11);
        proc_name(v14, &v18, 0x40u);
        if (!strcmp((const char *)&v18, a3)) {
          break;
        }
        if (v13 == ++v11) {
          goto LABEL_12;
        }
      }
      free(v8);
      if ((v14 & 0x80000000) == 0)
      {
        v17 = _MXMGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v18 = 67109378;
          v19[0] = v14;
          LOWORD(v19[1]) = 2080;
          *(void *)((char *)&v19[1] + 2) = a3;
          _os_log_impl(&dword_21FA7B000, v17, OS_LOG_TYPE_INFO, "Found pid (%i) for process name: %s", (uint8_t *)&v18, 0x12u);
        }

        return v14;
      }
    }
    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"Failed to find process.." code:1 userInfo:MEMORY[0x263EFFA78]];
    }
    v15 = _MXMGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      *(void *)v19 = a3;
      _os_log_impl(&dword_21FA7B000, v15, OS_LOG_TYPE_DEFAULT, "Failed to find pid for process name: %s", (uint8_t *)&v18, 0xCu);
    }

    return 0;
  }
  return getpid();
}

+ (id)probe
{
  v2 = (void *)[objc_alloc((Class)a1) init];
  return v2;
}

- (MXMResourceProbe)init
{
  v3.receiver = self;
  v3.super_class = (Class)MXMResourceProbe;
  return [(MXMProbe *)&v3 init];
}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 rusage:(rusage_info_v6 *)a5
{
  v21 = a5;
  id v22 = a3;
  if (_buildData_timestamp_rusage__onceToken != -1) {
    dispatch_once(&_buildData_timestamp_rusage__onceToken, &__block_literal_global_0);
  }
  for (uint64_t i = 0; i != 38; i += 2)
  {
    uint64_t v8 = *(void *)&_buildData_timestamp_rusage__infos[i];
    int v9 = *(void **)&_buildData_timestamp_rusage__infos[i + 1];
    id v10 = *((id *)&_buildData_timestamp_rusage__infos[i + 1] + 1);
    uint64_t v11 = [(MXMProbe *)self filter];
    int v12 = [v11 matchesSamplesWithTag:v10];

    if (!v12) {
      goto LABEL_12;
    }
    id v13 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_10:
      unint64_t v18 = *(void *)&v21->ri_uuid[v8];
      goto LABEL_11;
    }
    int v14 = +[MXMUtilizationSampleTag CPUQos];
    if ([v14 containsTag:v10])
    {
    }
    else
    {
      v15 = +[MXMUtilizationSampleTag CPUTime];
      int v16 = [v15 containsTag:v10];

      if (!v16) {
        goto LABEL_10;
      }
    }
    +[MXMMachUtils _nanosecondsWithAbsoluteTime:](MXMMachUtils, "_nanosecondsWithAbsoluteTime:", *(void *)&v21->ri_uuid[v8], v21);
    unint64_t v18 = (unint64_t)v17;
LABEL_11:
    v19 = [[MXMSampleSet alloc] initWithTag:v10 unit:v13 attributes:0];
    [v22 appendSet:v19];

    id v20 = (id)[v22 appendUnsignedIntegerValue:v18 tag:v10 timestamp:a4];
LABEL_12:
  }
}

double __48__MXMResourceProbe__buildData_timestamp_rusage___block_invoke()
{
  uint64_t v0 = +[MXMUnitMemory bytes];
  uint64_t v23 = +[MXMUnitCycle cycles];
  uint64_t v22 = +[MXMUnitInstruction baseUnit];
  uint64_t v1 = [MEMORY[0x263F08C98] nanoseconds];
  uint64_t v21 = +[MXMUtilizationSampleTag CPUCycles];
  uint64_t v20 = +[MXMUtilizationSampleTag CPUInstructions];
  uint64_t v19 = +[MXMUtilizationSampleTag CPUTimeUser];
  uint64_t v18 = +[MXMUtilizationSampleTag CPUTimeSystem];
  uint64_t v17 = +[MXMUtilizationSampleTag CPUQosDefault];
  uint64_t v16 = +[MXMUtilizationSampleTag CPUQosMaintenance];
  uint64_t v15 = +[MXMUtilizationSampleTag CPUQosBackground];
  uint64_t v14 = +[MXMUtilizationSampleTag CPUQosUtility];
  uint64_t v13 = +[MXMUtilizationSampleTag CPUQosLegacy];
  uint64_t v12 = +[MXMUtilizationSampleTag CPUQosUserInitiated];
  uint64_t v11 = +[MXMUtilizationSampleTag CPUQosUserInteractive];
  uint64_t v2 = +[MXMUtilizationSampleTag memoryPhysical];
  uint64_t v3 = +[MXMUtilizationSampleTag memoryPeakPhysicalLifetime];
  uint64_t v4 = +[MXMUtilizationSampleTag memoryPeakPhysicalInterval];
  uint64_t v5 = +[MXMUtilizationSampleTag memoryWired];
  uint64_t v6 = +[MXMUtilizationSampleTag memoryResident];
  uint64_t v7 = +[MXMUtilizationSampleTag IOReads];
  uint64_t v8 = +[MXMUtilizationSampleTag IOWrites];
  uint64_t v9 = +[MXMUtilizationSampleTag IOLogicalWrites];
  _buildData_timestamp_rusage__infos[0] = xmmword_21FA98390;
  qword_267EF3CD0 = v23;
  unk_267EF3CD8 = v21;
  xmmword_267EF3CE0 = xmmword_21FA983A0;
  qword_267EF3CF0 = v22;
  unk_267EF3CF8 = v20;
  xmmword_267EF3D00 = xmmword_21FA983B0;
  qword_267EF3D10 = v1;
  unk_267EF3D18 = v19;
  xmmword_267EF3D20 = xmmword_21FA983C0;
  qword_267EF3D30 = v1;
  unk_267EF3D38 = v18;
  xmmword_267EF3D40 = xmmword_21FA983D0;
  qword_267EF3D50 = v1;
  unk_267EF3D58 = v17;
  xmmword_267EF3D60 = xmmword_21FA983E0;
  qword_267EF3D70 = v1;
  unk_267EF3D78 = v16;
  xmmword_267EF3D80 = xmmword_21FA983F0;
  qword_267EF3D90 = v1;
  unk_267EF3D98 = v15;
  xmmword_267EF3DA0 = xmmword_21FA98400;
  qword_267EF3DB0 = v1;
  unk_267EF3DB8 = v14;
  xmmword_267EF3DC0 = xmmword_21FA98410;
  qword_267EF3DD0 = v1;
  unk_267EF3DD8 = v13;
  xmmword_267EF3DE0 = xmmword_21FA98420;
  qword_267EF3DF0 = v1;
  unk_267EF3DF8 = v12;
  xmmword_267EF3E00 = xmmword_21FA98430;
  qword_267EF3E10 = v1;
  unk_267EF3E18 = v11;
  xmmword_267EF3E20 = xmmword_21FA98440;
  qword_267EF3E30 = v0;
  unk_267EF3E38 = v2;
  xmmword_267EF3E40 = xmmword_21FA98450;
  qword_267EF3E50 = v0;
  unk_267EF3E58 = v3;
  xmmword_267EF3E60 = xmmword_21FA98460;
  qword_267EF3E70 = v0;
  unk_267EF3E78 = v4;
  xmmword_267EF3E80 = xmmword_21FA98470;
  qword_267EF3E90 = v0;
  unk_267EF3E98 = v5;
  xmmword_267EF3EA0 = xmmword_21FA98480;
  qword_267EF3EB0 = v0;
  unk_267EF3EB8 = v6;
  xmmword_267EF3EC0 = xmmword_21FA98490;
  qword_267EF3ED0 = v0;
  qword_267EF3ED8 = v7;
  xmmword_267EF3EE0 = xmmword_21FA984A0;
  qword_267EF3EF0 = v0;
  qword_267EF3EF8 = v8;
  *(void *)&double result = 232;
  xmmword_267EF3F00 = xmmword_21FA984B0;
  qword_267EF3F10 = v0;
  qword_267EF3F18 = v9;
  return result;
}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 taskinfo:(proc_taskinfo *)a5
{
  id v14 = a3;
  uint64_t v7 = [MXMSampleSet alloc];
  uint64_t v8 = +[MXMUtilizationSampleTag memoryVirtual];
  uint64_t v9 = +[MXMUnitMemory bytes];
  id v10 = [(MXMSampleSet *)v7 initWithTag:v8 unit:v9 attributes:0];
  [v14 appendSet:v10];

  uint64_t pti_virtual_size = a5->pti_virtual_size;
  uint64_t v12 = +[MXMUtilizationSampleTag memoryVirtual];
  id v13 = (id)[v14 appendUnsignedIntegerValue:pti_virtual_size tag:v12 timestamp:a4];
}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 mach_space_basicinfo:(ipc_info_space_basic *)a5
{
  id v13 = a3;
  uint64_t v7 = [MXMSampleSet alloc];
  uint64_t v8 = +[MXMUtilizationSampleTag machPort];
  uint64_t v9 = [(MXMSampleSet *)v7 initWithTag:v8 unit:0 attributes:0];
  [v13 appendSet:v9];

  uint64_t iisb_table_inuse = a5->iisb_table_inuse;
  uint64_t v11 = +[MXMUtilizationSampleTag machPort];
  id v12 = (id)[v13 appendUnsignedIntValue:iisb_table_inuse tag:v11 timestamp:a4];
}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 pm_networking_stats:(id *)a5
{
  id v35 = a3;
  uint64_t v7 = [MXMSampleSet alloc];
  uint64_t v8 = +[MXMUtilizationSampleTag networkRecievedBytes];
  uint64_t v9 = +[MXMUnitMemory bytes];
  id v10 = [(MXMSampleSet *)v7 initWithTag:v8 unit:v9 attributes:0];
  [v35 appendSet:v10];

  uint64_t v11 = [MXMSampleSet alloc];
  id v12 = +[MXMUtilizationSampleTag networkSentBytes];
  id v13 = +[MXMUnitMemory bytes];
  id v14 = [(MXMSampleSet *)v11 initWithTag:v12 unit:v13 attributes:0];
  [v35 appendSet:v14];

  uint64_t v15 = [MXMSampleSet alloc];
  uint64_t v16 = +[MXMUtilizationSampleTag networkRecievedPackets];
  uint64_t v17 = +[MXMUnitPacket baseUnit];
  uint64_t v18 = [(MXMSampleSet *)v15 initWithTag:v16 unit:v17 attributes:0];
  [v35 appendSet:v18];

  uint64_t v19 = [MXMSampleSet alloc];
  uint64_t v20 = +[MXMUtilizationSampleTag networkSentPackets];
  uint64_t v21 = +[MXMUnitPacket baseUnit];
  uint64_t v22 = [(MXMSampleSet *)v19 initWithTag:v20 unit:v21 attributes:0];
  [v35 appendSet:v22];

  unint64_t var3 = a5->var3;
  v24 = +[MXMUtilizationSampleTag networkRecievedBytes];
  id v25 = (id)[v35 appendUnsignedIntegerValue:var3 tag:v24 timestamp:a4];

  unint64_t var4 = a5->var4;
  v27 = +[MXMUtilizationSampleTag networkSentBytes];
  id v28 = (id)[v35 appendUnsignedIntegerValue:var4 tag:v27 timestamp:a4];

  unint64_t var1 = a5->var1;
  v30 = +[MXMUtilizationSampleTag networkRecievedPackets];
  id v31 = (id)[v35 appendUnsignedIntegerValue:var1 tag:v30 timestamp:a4];

  unint64_t var2 = a5->var2;
  v33 = +[MXMUtilizationSampleTag networkSentPackets];
  id v34 = (id)[v35 appendUnsignedIntegerValue:var2 tag:v33 timestamp:a4];
}

- (void)_beginUpdates
{
  v12.receiver = self;
  v12.super_class = (Class)MXMResourceProbe;
  [(MXMProbe *)&v12 _beginUpdates];
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F08B88]);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __33__MXMResourceProbe__beginUpdates__block_invoke;
  uint64_t v9 = &unk_2645251B8;
  objc_copyWeak(&v10, &location);
  uint64_t v4 = (void *)[v3 initWithBlock:&v6];
  -[MXMResourceProbe setPollingThread:](self, "setPollingThread:", v4, v6, v7, v8, v9);

  uint64_t v5 = [(MXMResourceProbe *)self pollingThread];
  [v5 start];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __33__MXMResourceProbe__beginUpdates__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [MEMORY[0x263F08B88] currentThread];
  if (([v1 isCancelled] & 1) != 0 || (uint64_t v2 = WeakRetained) == 0)
  {
LABEL_5:
  }
  else
  {
    while (1)
    {
      int v3 = [v2 updating];

      if (!v3) {
        break;
      }
      uint64_t v4 = [WeakRetained _pollMainBody];
      [WeakRetained _handleIncomingData:v4];

      usleep(0x30D40u);
      uint64_t v1 = [MEMORY[0x263F08B88] currentThread];
      int v5 = [v1 isCancelled];
      uint64_t v2 = WeakRetained;
      if (v5) {
        goto LABEL_5;
      }
    }
  }
}

- (void)_stopUpdates
{
  v9.receiver = self;
  v9.super_class = (Class)MXMResourceProbe;
  [(MXMProbe *)&v9 _stopUpdates];
  uint64_t v4 = [(MXMResourceProbe *)self pollingThread];
  [v4 cancel];

  usleep(0x61A80u);
  int v5 = [(MXMResourceProbe *)self pollingThread];
  char v6 = [v5 isFinished];

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MXMResourceProbe.m" lineNumber:281 description:@"Failed to stop polling thread."];
  }
  uint64_t v7 = [(MXMResourceProbe *)self _pollMainBody];
  [(MXMProbe *)self _handleIncomingData:v7];

  [(MXMResourceProbe *)self setPollingThread:0];
}

- (id)sampleWithTimeout:(double)a3 stopReason:(unint64_t *)a4
{
  int v5 = [(MXMResourceProbe *)self _pollMainBody];
  char v6 = [(MXMProbe *)self filter];
  uint64_t v7 = [v5 dataMatchingFilter:v6];

  return v7;
}

- (BOOL)performPreIterationActions
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  int v3 = [(MXMProbe *)self filter];
  int v4 = [v3 finite];

  if (!v4) {
    return 1;
  }
  int v5 = [(MXMProbe *)self filter];
  char v6 = [v5 attributeFilterWithName:@"Process Name"];
  uint64_t v7 = [v6 values];

  uint64_t v8 = [(MXMProbe *)self filter];
  objc_super v9 = [v8 attributeFilterWithName:@"Process Identifier"];
  id v31 = [v9 values];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (!v11)
  {
    char v14 = 1;
    goto LABEL_18;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v37;
  char v14 = 1;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v37 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      uint64_t v17 = objc_opt_class();
      id v18 = v16;
      int v19 = objc_msgSend(v17, "_processIdentifierWithProcessName:error:", objc_msgSend(v18, "UTF8String"), 0);
      if (v19 >= 1)
      {
        int v20 = v19;
        if (!proc_reset_footprint_interval()) {
          continue;
        }
        uint64_t v21 = _MXMGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          int v42 = v20;
          __int16 v43 = 2112;
          id v44 = v18;
          _os_log_impl(&dword_21FA7B000, v21, OS_LOG_TYPE_ERROR, "Unable to reset the peak interval footprint of pid %d (%@)", buf, 0x12u);
        }
      }
      char v14 = 0;
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v45 count:16];
  }
  while (v12);
LABEL_18:

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v23 = v31;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        int v28 = [*(id *)(*((void *)&v32 + 1) + 8 * j) intValue];
        if (v28 >= 1)
        {
          int v29 = v28;
          if (proc_reset_footprint_interval())
          {
            v30 = _MXMGetLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              int v42 = v29;
              _os_log_impl(&dword_21FA7B000, v30, OS_LOG_TYPE_ERROR, "Unable to reset the peak interval footprint of pid %d", buf, 8u);
            }

            char v14 = 0;
          }
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v25);
  }

  return v14 & 1;
}

- (id)_pollMainBody
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  int v3 = objc_alloc_init(MXMMutableSampleData);
  int v4 = [(MXMProbe *)self filter];
  int v5 = [v4 finite];

  if (v5)
  {
    long long v36 = v3;
    char v6 = [(MXMProbe *)self filter];
    uint64_t v7 = objc_msgSend(v6, "attributeFilterWithName:");
    uint64_t v8 = [v7 values];

    objc_super v9 = [(MXMProbe *)self filter];
    id v10 = objc_msgSend(v9, "attributeFilterWithName:");
    uint64_t v11 = [v10 values];

    uint64_t v12 = _MXMGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v8;
      __int16 v45 = 2112;
      uint64_t v46 = v11;
      _os_log_impl(&dword_21FA7B000, v12, OS_LOG_TYPE_INFO, "Polling with the following process names: %@ and pids: %@.", buf, 0x16u);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    if (v8)
    {
      uint64_t v13 = objc_msgSend(v8, "setByAddingObjectsFromSet:", v11, v11, v8);
    }
    else
    {
      uint64_t v16 = objc_msgSend(MEMORY[0x263EFFA08], "set", v11, 0);
      uint64_t v13 = [v16 setByAddingObjectsFromSet:v11];
    }
    uint64_t v17 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v39;
      unint64_t v20 = 0x264524000uLL;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v13);
          }
          uint64_t v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v23 = [v22 cStringUsingEncoding:4];
            uint64_t v24 = objc_opt_class();
            id v37 = 0;
            uint64_t v25 = [v24 _processIdentifierWithProcessName:v23 error:&v37];
            id v26 = v37;
            if ((v25 & 0x80000000) != 0) {
              goto LABEL_25;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v26 = 0;
              goto LABEL_25;
            }
            uint64_t v25 = [v22 intValue];
            id v26 = 0;
            if ((v25 & 0x80000000) != 0) {
              goto LABEL_25;
            }
          }
          if (!v26)
          {
            v27 = self;
            [(MXMResourceProbe *)self _pollProcessWithData:v36 pid:v25];
            unint64_t v28 = v20;
            int v29 = *(void **)(v20 + 3816);
            v30 = [NSNumber numberWithInt:v25];
            id v31 = [v29 attributeWithName:@"Process Identifier" numericValue:v30];
            [(MXMMutableSampleData *)v36 appendAttribute:v31];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v32 = [*(id *)(v28 + 3816) attributeWithName:@"Process Name" stringValue:v22];
              [(MXMMutableSampleData *)v36 appendAttribute:v32];
            }
            id v26 = 0;
            unint64_t v20 = v28;
            self = v27;
          }
LABEL_25:
        }
        uint64_t v18 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v18);
    }

    int v3 = v36;
  }
  else
  {
    char v14 = _MXMGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [(MXMProbe *)self filter];
      *(_DWORD *)buf = 138412290;
      id v44 = v15;
      _os_log_impl(&dword_21FA7B000, v14, OS_LOG_TYPE_INFO, "Polling all process's with filter %@.", buf, 0xCu);
    }
    [(MXMResourceProbe *)self _pollAllProcesses:v3];
  }
  return v3;
}

- (void)_pollAllProcesses:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = _MXMGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = *__error();
    *(_DWORD *)buf = 67109120;
    int v14 = v7;
    _os_log_impl(&dword_21FA7B000, v6, OS_LOG_TYPE_ERROR, "Clearing errno for libproc call (value being cleared: %i).", buf, 8u);
  }

  *__error() = 0;
  uint64_t v8 = proc_listpids(1u, 0, 0, 0);
  objc_super v9 = malloc_type_malloc(4 * v8, 0x100004052888210uLL);
  proc_listpids(1u, 0, v9, 32);
  if (*__error())
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MXMResourceProbe.m", 383, @"Failed to call proc_listpids. Errno (%i).", *__error());

    if (!v8) {
      goto LABEL_9;
    }
  }
  else if (!v8)
  {
    goto LABEL_9;
  }
  id v10 = (int *)v9;
  do
  {
    int v11 = *v10++;
    if ((v11 & 0x80000000) == 0) {
      -[MXMResourceProbe _pollProcessWithData:pid:](self, "_pollProcessWithData:pid:", v5);
    }
    --v8;
  }
  while (v8);
LABEL_9:
  free(v9);
}

- (void)_pollProcessWithData:(id)a3 pid:(int)a4
{
  kern_return_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  uint8_t v14[12];
  mach_port_name_t v15;

  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v15 = 0;
  int v7 = [(MXMProbe *)self filter];
  uint64_t v8 = +[MXMUtilizationSampleTag machPort];
  if ([v7 matchesSamplesWithTag:v8])
  {
    objc_super v9 = task_for_pid(*MEMORY[0x263EF8960], v4, &v15);

    if (!v9)
    {
      [(MXMResourceProbe *)self _pollProcessResourceUsageWithData:v6 pid:v4];
LABEL_12:
      [(MXMResourceProbe *)self _pollTaskMachPortInformation:v6 task:v15];
      [(MXMResourceProbe *)self _pollProcessNetworkingStatsWithData:v6 pid:v4 task:v15];
      goto LABEL_13;
    }
  }
  else
  {
    id v10 = [(MXMProbe *)self filter];
    int v11 = +[MXMUtilizationSampleTag network];
    if ([v10 matchesSamplesWithTag:v11])
    {
      objc_super v9 = task_for_pid(*MEMORY[0x263EF8960], v4, &v15);
      uint64_t v12 = v9 != 0;
    }
    else
    {
      uint64_t v12 = 0;
      objc_super v9 = -1;
    }

    if (!v12) {
      goto LABEL_11;
    }
  }
  uint64_t v13 = _MXMGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v14 = 0;
    _os_log_impl(&dword_21FA7B000, v13, OS_LOG_TYPE_ERROR, "Failed to grab task port.", v14, 2u);
  }

LABEL_11:
  [(MXMResourceProbe *)self _pollProcessResourceUsageWithData:v6 pid:v4];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_pollProcessNetworkingStatsWithData:(id)a3 pid:(int)a4 task:(unsigned int)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  id v6 = a3;
  uint64_t v7 = mach_absolute_time();
  pm_sample_task_and_pid();
  -[MXMResourceProbe _buildData:timestamp:pm_networking_stats:](self, "_buildData:timestamp:pm_networking_stats:", v6, v7, (char *)v8 + 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    *(void *)&v8[0]);
}

- (void)_pollProcessResourceUsageWithData:(id)a3 pid:(int)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  *(_OWORD *)buffer = 0u;
  *__error() = 0;
  int v7 = proc_pid_rusage(a4, 6, buffer);
  uint64_t v8 = mach_absolute_time();
  if (v7)
  {
    uint64_t v9 = _MXMGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = *__error();
      int v11 = __error();
      uint64_t v12 = strerror(*v11);
      v14[0] = 67109634;
      v14[1] = a4;
      __int16 v15 = 1024;
      int v16 = v10;
      __int16 v17 = 2080;
      uint64_t v18 = v12;
      _os_log_impl(&dword_21FA7B000, v9, OS_LOG_TYPE_INFO, "Failed to retrieve rusage info for pid: %i. errno=%d(%s)", (uint8_t *)v14, 0x18u);
    }
  }
  else
  {
    +[MXMMachUtils _nanosecondsWithAbsoluteTime:v8];
    [(MXMResourceProbe *)self _buildData:v6 timestamp:(unint64_t)v13 rusage:buffer];
  }
}

- (void)_pollTaskMachPortInformation:(id)a3 task:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  memset(v11, 0, sizeof(v11));
  int v8 = MEMORY[0x223C57650](v4, v11);
  uint64_t v9 = mach_absolute_time();
  if (v8)
  {
    int v10 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MXMResourceProbe.m", 456, @"Failed to retrieve port information for task: %i", v4);
  }
  [(MXMResourceProbe *)self _buildData:v7 timestamp:v9 mach_space_basicinfo:v11];
}

- (void)_pollBasicTaskInformation:(id)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  memset(buffer, 0, sizeof(buffer));
  id v7 = a3;
  if (proc_pidinfo(v4, 4, 0, buffer, 96) != 96)
  {
    int v8 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MXMResourceProbe.m", 463, @"Failed to gather process task information for pid: %i", v4);
  }
  [(MXMResourceProbe *)self _buildData:v7 timestamp:mach_absolute_time() taskinfo:buffer];
}

- (NSThread)pollingThread
{
  return (NSThread *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPollingThread:(id)a3
{
}

- (void).cxx_destruct
{
}

@end