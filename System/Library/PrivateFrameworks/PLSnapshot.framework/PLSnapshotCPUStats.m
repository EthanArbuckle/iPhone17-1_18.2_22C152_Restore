@interface PLSnapshotCPUStats
+ (double)getCoalitionSnapshot:(unint64_t)a3;
+ (double)getCpuSnapshot:(int)a3;
@end

@implementation PLSnapshotCPUStats

+ (double)getCpuSnapshot:(int)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v5 = 0u;
  int v3 = proc_pid_rusage(a3, 1, (rusage_info_t *)&v5);
  double result = -1.0;
  if (!v3) {
    +[PLSnapshotUtilities secondsFromMachTime:](PLSnapshotUtilities, "secondsFromMachTime:", (void)v6, -1.0);
  }
  return result;
}

+ (double)getCoalitionSnapshot:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v4 = proc_listcoalitions();
  long long v5 = (uint64_t *)malloc_type_malloc(2 * v4, 0xB41EEAA9uLL);
  int v6 = proc_listcoalitions();
  if (v6 > 2 * v4 || v6 < 16)
  {
    double v13 = -1.0;
    if (!v5) {
      return v13;
    }
    goto LABEL_16;
  }
  uint64_t v7 = 0;
  uint64_t v8 = v6 >> 4;
  long long v9 = &_os_log_internal;
  long long v10 = v5;
  while (1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *v10;
      *(_DWORD *)buf = 67109376;
      int v17 = v7;
      __int16 v18 = 2048;
      uint64_t v19 = v11;
      _os_log_debug_impl(&dword_22CA1E000, v9, OS_LOG_TYPE_DEBUG, "Coalitions ID number %d is: %lld\n", buf, 0x12u);
    }
    if (*v10 == a3) {
      break;
    }
    ++v7;
    v10 += 2;
    if (v8 == v7)
    {
      double v13 = -1.0;
      goto LABEL_16;
    }
  }
  long long v12 = malloc_type_malloc(0x160uLL, 0x1000040AF73A19AuLL);
  if (coalition_info_resource_usage())
  {
    double v13 = -1.0;
    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
    +[PLSnapshotUtilities secondsFromMachTime:v12[3]];
    double v13 = v14;
  }
  free(v12);
LABEL_16:
  free(v5);
  return v13;
}

@end