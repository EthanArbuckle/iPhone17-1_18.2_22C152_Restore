@interface RBCoalitionKernelAdapter
- (int64_t)applyCoalitionWithID:(unint64_t)a3 coalitionLevel:(unint64_t)a4;
- (int64_t)coalitionInfoForPID:(int)a3 outCoalitionInfo:(coalition_info *)a4;
- (unint64_t)coalitionLevelForID:(unint64_t)a3;
@end

@implementation RBCoalitionKernelAdapter

- (unint64_t)coalitionLevelForID:(unint64_t)a3
{
  return 0;
}

- (int64_t)applyCoalitionWithID:(unint64_t)a3 coalitionLevel:(unint64_t)a4
{
  return -1;
}

- (int64_t)coalitionInfoForPID:(int)a3 outCoalitionInfo:(coalition_info *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v19 = a3;
  uint64_t v18 = 0;
  memset(buffer, 0, sizeof(buffer));
  v6 = rbs_process_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226AB3000, v6, OS_LOG_TYPE_DEFAULT, "coalitionInfoForPID: Calling proc_pidinfo", buf, 2u);
  }

  int v7 = proc_pidinfo(a3, 20, 0, buffer, 40);
  if (v7 < 0)
  {
    int v11 = v7;
    v12 = rbs_process_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RBCoalitionKernelAdapter coalitionInfoForPID:outCoalitionInfo:](a3, v11, v12);
    }

    return -1;
  }
  else
  {
    size_t v16 = 8;
    int v8 = sysctlbyname("kern.coalition_roles", v30, &v16, &v19, 4uLL);
    if (v8 < 0 || v16 != 8)
    {
      v9 = rbs_process_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v13 = v19;
        long long v14 = buffer[0];
        int v15 = *__error();
        *(_DWORD *)buf = 67110144;
        int v21 = v13;
        __int16 v22 = 2048;
        uint64_t v23 = v14;
        __int16 v24 = 2048;
        uint64_t v25 = *((void *)&v14 + 1);
        __int16 v26 = 1024;
        int v27 = v8;
        __int16 v28 = 1024;
        int v29 = v15;
        _os_log_error_impl(&dword_226AB3000, v9, OS_LOG_TYPE_ERROR, "Kernel call to get coalition roles for PID %d, resource coalition id: %llu, jetsam coalition id: %llu, failed: ret %d, errno %d.", buf, 0x28u);
      }
    }
    int64_t result = 0;
    *(_OWORD *)&a4->var0 = buffer[0];
    a4->var2 = v31 == 1;
  }
  return result;
}

- (void)coalitionInfoForPID:(NSObject *)a3 outCoalitionInfo:.cold.1(int a1, int a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v6 = *__error();
  v7[0] = 67109632;
  v7[1] = a1;
  __int16 v8 = 1024;
  int v9 = a2;
  __int16 v10 = 1024;
  int v11 = v6;
  _os_log_error_impl(&dword_226AB3000, a3, OS_LOG_TYPE_ERROR, "Kernel call to get coalition info for PID %d failed: ret %d, errno %d.", (uint8_t *)v7, 0x14u);
}

@end