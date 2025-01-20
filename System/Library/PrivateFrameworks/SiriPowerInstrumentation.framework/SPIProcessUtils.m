@interface SPIProcessUtils
+ (id)getProcessNameForPid:(int)a3;
+ (int)getUsageForPid:(int)a3 withOutput:(SPIResourceUsage *)a4;
+ (unsigned)getProcessForPid:(int)a3;
@end

@implementation SPIProcessUtils

+ (id)getProcessNameForPid:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (proc_name(a3, buffer, 0x400u) < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [NSString stringWithUTF8String:buffer];
  }

  return v3;
}

+ (unsigned)getProcessForPid:(int)a3
{
  v3 = +[SPIProcessUtils getProcessNameForPid:*(void *)&a3];
  v4 = [(id)processNameToTypeMapping objectForKey:v3];

  if (v4)
  {
    v5 = [(id)processNameToTypeMapping objectForKeyedSubscript:v3];
    LOBYTE(v4) = [v5 unsignedShortValue];
  }
  return v4;
}

+ (int)getUsageForPid:(int)a3 withOutput:(SPIResourceUsage *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(v18, 0, sizeof(v18));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  int result = proc_pid_rusage(a3, 5, (rusage_info_t *)v6);
  if (!result)
  {
    *(int8x16_t *)&a4->cpuCycles = vextq_s8(*(int8x16_t *)((char *)v18 + 8), *(int8x16_t *)((char *)v18 + 8), 8uLL);
    a4->memPhysFootprint = *((void *)&v7 + 1);
  }
  return result;
}

@end