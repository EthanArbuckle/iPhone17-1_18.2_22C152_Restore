@interface MXMSystemProbe
+ (id)probe;
- (MXMSystemProbe)init;
- (void)_beginUpdates;
- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 cpuLoad:(processor_cpu_load_info *)a5;
- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 loadInfo:(processor_set_load_info *)a5;
- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 processorCount:(unsigned int)a5;
- (void)_gatherConstantSystemProperties;
- (void)_pollProcessorLoadInformationWithData:(id)a3;
- (void)_pollSystemHostProcessorInfoWithData:(id)a3;
- (void)_pollSystemLoadInformationWithData:(id)a3;
- (void)_pollSystemLoop;
- (void)_pollSystemMainBody;
- (void)_prepareData;
- (void)_stopUpdates;
@end

@implementation MXMSystemProbe

+ (id)probe
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (MXMSystemProbe)init
{
  v6.receiver = self;
  v6.super_class = (Class)MXMSystemProbe;
  id v2 = [(MXMProbe *)&v6 init];
  v3 = v2;
  if (v2)
  {
    updateThread = v2->_updateThread;
    v2->_updateThread = 0;
  }
  return v3;
}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 processorCount:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  v7 = +[MXMSystemSampleTag CPUCoresLogical];
  id v8 = (id)[v9 appendUnsignedIntValue:v5 tag:v7 timestamp:a4];
}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 cpuLoad:(processor_cpu_load_info *)a5
{
  id v19 = a3;
  uint64_t v7 = a5->cpu_ticks[0];
  uint64_t v8 = a5->cpu_ticks[1];
  uint64_t v10 = a5->cpu_ticks[2];
  uint64_t v9 = a5->cpu_ticks[3];
  v11 = +[MXMUtilizationSampleTag CPUTicksIdle];
  id v12 = (id)[v19 appendUnsignedIntValue:v10 tag:v11 timestamp:a4];

  v13 = +[MXMUtilizationSampleTag CPUTicksUser];
  id v14 = (id)[v19 appendUnsignedIntValue:v7 tag:v13 timestamp:a4];

  v15 = +[MXMUtilizationSampleTag CPUTicksSystem];
  id v16 = (id)[v19 appendUnsignedIntValue:v8 tag:v15 timestamp:a4];

  v17 = +[MXMUtilizationSampleTag CPUTicksNice];
  id v18 = (id)[v19 appendUnsignedIntValue:v9 tag:v17 timestamp:a4];
}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 loadInfo:(processor_set_load_info *)a5
{
  id v13 = a3;
  uint64_t thread_count = a5->thread_count;
  uint64_t v8 = +[MXMUtilizationSampleTag CPULoadThread];
  id v9 = (id)[v13 appendIntValue:thread_count tag:v8 timestamp:a4];

  uint64_t task_count = a5->task_count;
  v11 = +[MXMUtilizationSampleTag CPULoadTask];
  id v12 = (id)[v13 appendIntValue:task_count tag:v11 timestamp:a4];
}

- (void)_prepareData
{
  v3 = objc_alloc_init(MXMMutableSampleData);
  data = self->_data;
  self->_data = v3;

  uint64_t v5 = self->_data;
  objc_super v6 = [MXMMutableSampleSet alloc];
  uint64_t v7 = +[MXMUtilizationSampleTag CPUTicksIdle];
  uint64_t v8 = [(MXMSampleSet *)v6 initWithTag:v7 unit:0 attributes:0];
  [(MXMMutableSampleData *)v5 appendSet:v8];

  id v9 = self->_data;
  uint64_t v10 = [MXMMutableSampleSet alloc];
  v11 = +[MXMUtilizationSampleTag CPUTicksUser];
  id v12 = [(MXMSampleSet *)v10 initWithTag:v11 unit:0 attributes:0];
  [(MXMMutableSampleData *)v9 appendSet:v12];

  id v13 = self->_data;
  id v14 = [MXMMutableSampleSet alloc];
  v15 = +[MXMUtilizationSampleTag CPUTicksSystem];
  id v16 = [(MXMSampleSet *)v14 initWithTag:v15 unit:0 attributes:0];
  [(MXMMutableSampleData *)v13 appendSet:v16];

  v17 = self->_data;
  id v18 = [MXMMutableSampleSet alloc];
  id v19 = +[MXMUtilizationSampleTag CPUTicksNice];
  v20 = [(MXMSampleSet *)v18 initWithTag:v19 unit:0 attributes:0];
  [(MXMMutableSampleData *)v17 appendSet:v20];

  v21 = self->_data;
  v22 = [MXMMutableSampleSet alloc];
  v23 = +[MXMUtilizationSampleTag CPULoadThread];
  v24 = [(MXMSampleSet *)v22 initWithTag:v23 unit:0 attributes:0];
  [(MXMMutableSampleData *)v21 appendSet:v24];

  v25 = self->_data;
  v26 = [MXMMutableSampleSet alloc];
  id v28 = +[MXMUtilizationSampleTag CPULoadTask];
  v27 = [(MXMSampleSet *)v26 initWithTag:v28 unit:0 attributes:0];
  [(MXMMutableSampleData *)v25 appendSet:v27];
}

- (void)_beginUpdates
{
  v5.receiver = self;
  v5.super_class = (Class)MXMSystemProbe;
  [(MXMProbe *)&v5 _beginUpdates];
  v3 = (NSThread *)[objc_alloc(MEMORY[0x263F08B88]) initWithTarget:self selector:sel__pollSystemLoop object:0];
  updateThread = self->_updateThread;
  self->_updateThread = v3;

  [(MXMSystemProbe *)self _pollSystemLoop];
  [(MXMSystemProbe *)self _gatherConstantSystemProperties];
}

- (void)_stopUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)MXMSystemProbe;
  [(MXMProbe *)&v4 _stopUpdates];
  [(NSThread *)self->_updateThread cancel];
  updateThread = self->_updateThread;
  self->_updateThread = 0;
}

- (void)_pollSystemLoop
{
  id v4 = [MEMORY[0x263F08B88] currentThread];
  if ([v4 isCancelled])
  {
LABEL_4:
  }
  else
  {
    while (1)
    {
      BOOL v3 = [(MXMProbe *)self updating];

      if (!v3) {
        break;
      }
      [(MXMSystemProbe *)self _pollSystemMainBody];
      usleep(0xF4240u);
      [(MXMSystemProbe *)self _pollSystemLoop];
      id v4 = [MEMORY[0x263F08B88] currentThread];
      if ([v4 isCancelled]) {
        goto LABEL_4;
      }
    }
  }
}

- (void)_gatherConstantSystemProperties
{
  BOOL v3 = self->_data;
  [(MXMSystemProbe *)self _pollSystemHostProcessorInfoWithData:v3];
  [(MXMProbe *)self _handleIncomingData:v3];
}

- (void)_pollSystemMainBody
{
  BOOL v3 = self->_data;
  [(MXMSystemProbe *)self _pollProcessorLoadInformationWithData:v3];
  [(MXMSystemProbe *)self _pollSystemLoadInformationWithData:v3];
  [(MXMSystemProbe *)self _pollSystemThermalsWithData:v3];
  [(MXMSystemProbe *)self _pollSystemBatteryWithData:v3];
}

- (void)_pollSystemHostProcessorInfoWithData:(id)a3
{
  kern_return_t v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v26;
  void *v28;
  void *v29;
  void *v30;
  mach_msg_type_number_t out_processor_infoCnt[2];
  uint8_t buf[4];
  kern_return_t v33;
  void v34[2];
  void v35[3];

  v35[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34[0] = &unk_26D14D528;
  v34[1] = &unk_26D14D558;
  v35[0] = &unk_26D14D540;
  v35[1] = &unk_26D14D570;
  objc_super v5 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  objc_super v6 = [v5 allKeys];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    id v28 = v5;
    do
    {
      id v9 = [v5 allKeys];
      uint64_t v10 = [v9 objectAtIndexedSubscript:v8];

      v11 = [v5 objectForKeyedSubscript:v10];
      v30 = v10;
      processor_flavor_t v12 = [v10 intValue];
      v29 = v11;
      size_t v13 = [v11 integerValue];
      id v14 = (processor_info_array_t *)malloc_type_malloc(v13, 0x9C141D88uLL);
      *(void *)out_processor_infoCnt = 0;
      host_t v15 = MEMORY[0x223C57640]();
      LODWORD(v10) = host_processor_info(v15, v12, &out_processor_infoCnt[1], v14, out_processor_infoCnt);
      uint64_t v16 = mach_absolute_time();
      if (v10)
      {
        v25 = [MEMORY[0x263F08690] currentHandler];
        [v25 handleFailureInMethod:a2 object:self file:@"MXMSystemProbe.m" lineNumber:172 description:@"Failed to retrieve mach host information."];
      }
      [(MXMSystemProbe *)self _buildData:v4 timestamp:v16 processorCount:out_processor_infoCnt[1]];
      if (out_processor_infoCnt[1])
      {
        if ((v12 - 1) > 1)
        {
          v26 = [MEMORY[0x263EFF940] exceptionWithName:@"MetricMeasurement" reason:@"Invalid Processor Flavor Value" userInfo:0];
          objc_exception_throw(v26);
        }
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        unint64_t v19 = 0;
        do
        {
          processor_info_array_t v20 = *v14;
          if (v12 == 1) {
            [(MXMSystemProbe *)self _buildData:v4 timestamp:v16 cpuInfo:&v20[v17]];
          }
          else {
            [(MXMSystemProbe *)self _buildData:v4 timestamp:v16 cpuLoad:&v20[v18]];
          }
          ++v19;
          v18 += 4;
          v17 += 5;
        }
        while (v19 < out_processor_infoCnt[1]);
      }
      v21 = mach_vm_deallocate(*MEMORY[0x263EF8960], (mach_vm_address_t)*v14, v13);
      v22 = _MXMGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        v33 = v21;
        _os_log_impl(&dword_21FA7B000, v22, OS_LOG_TYPE_DEBUG, "Recieved non-success kernel return from mach_vm_deallocate (%i).", buf, 8u);
      }

      free(v14);
      ++v8;
      objc_super v5 = v28;
      v23 = [v28 allKeys];
      v24 = [v23 count];
    }
    while (v8 < v24);
  }
}

- (void)_pollProcessorLoadInformationWithData:(id)a3
{
  kern_return_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  mach_msg_type_number_t info_outCnt;
  processor_set_name_t default_set;
  integer_t info_out[2];
  uint64_t v14;

  id v5 = a3;
  *(void *)info_out = 0;
  id v14 = 0;
  info_outCnt = 4;
  default_set = 0;
  host_t v6 = MEMORY[0x223C57640]();
  if (processor_set_default(v6, &default_set))
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MXMSystemProbe.m" lineNumber:207 description:@"Failed to retrieve pset name."];
  }
  uint64_t v7 = processor_set_statistics(default_set, 4, info_out, &info_outCnt);
  unint64_t v8 = mach_absolute_time();
  if (v7)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MXMSystemProbe.m" lineNumber:212 description:@"Failed to retrieve set load info."];
  }
  [(MXMSystemProbe *)self _buildData:v5 timestamp:v8 loadInfo:info_out];
}

- (void)_pollSystemLoadInformationWithData:(id)a3
{
  mach_msg_type_number_t host_info64_outCnt = 0;
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  host_t v5 = MEMORY[0x223C57640](self, a2, a3);
  if (host_statistics64(v5, 4, (host_info64_t)v7, &host_info64_outCnt))
  {
    host_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MXMSystemProbe.m" lineNumber:224 description:@"Failed to retrieve host statistics."];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateThread, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end