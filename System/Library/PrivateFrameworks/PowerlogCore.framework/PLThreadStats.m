@interface PLThreadStats
+ (id)getThreadName:(unint64_t)a3 inProcess:(int)a4 isNamed:(BOOL *)a5;
- (BOOL)shouldGatherStatsForProcessName:(id)a3;
- (BOOL)shouldIncludeThread:(id)a3 withTotalSystemTime:(double)a4 withTotalUserTime:(double)a5;
- (NSDictionary)currentSnapshot;
- (NSDictionary)processThreadMap;
- (PLThreadStats)initWithTimeFilter:(double)a3 withPercentFilter:(unint64_t)a4 withProcessThreadMapping:(id)a5 withError:(id *)a6;
- (double)absoluteTimeFilter;
- (id)diffSinceLastSnapshot;
- (id)diffSnapshotWithNew:(id)a3 andOld:(id)a4;
- (id)filterDiff:(id)a3;
- (id)generateSnapshot;
- (id)threadStatsForPid:(void *)a3 withThreads:;
- (unint64_t)percentTimeFilter;
- (void)setAbsoluteTimeFilter:(double)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setPercentTimeFilter:(unint64_t)a3;
- (void)setProcessThreadMap:(id)a3;
@end

@implementation PLThreadStats

- (PLThreadStats)initWithTimeFilter:(double)a3 withPercentFilter:(unint64_t)a4 withProcessThreadMapping:(id)a5 withError:(id *)a6
{
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PLThreadStats;
  v11 = [(PLThreadStats *)&v21 init];
  if (!v11) {
    goto LABEL_13;
  }
  self;
  if (a3 >= 0.0)
  {
    [(PLThreadStats *)v11 setAbsoluteTimeFilter:a3];
    self;
    if (a4 >= 0x65)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = 2;
      goto LABEL_9;
    }
    [(PLThreadStats *)v11 setPercentTimeFilter:a4];
    if (!v10)
    {
      [(PLThreadStats *)v11 setProcessThreadMap:0];
      goto LABEL_11;
    }
    v14 = [MEMORY[0x1E4F1CA60] dictionary];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __89__PLThreadStats_initWithTimeFilter_withPercentFilter_withProcessThreadMapping_withError___block_invoke;
    v19[3] = &unk_1E62558F8;
    id v15 = v14;
    id v20 = v15;
    [v10 enumerateKeysAndObjectsUsingBlock:v19];
    if ([v15 count])
    {
      [(PLThreadStats *)v11 setProcessThreadMap:v15];

LABEL_11:
      v17 = -[PLThreadStats generateSnapshot](v11);
      [(PLThreadStats *)v11 setCurrentSnapshot:v17];

      v16 = v11;
      goto LABEL_14;
    }
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PLThreadStatsErrorDomain" code:3 userInfo:0];

LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v13 = 1;
LABEL_9:
  [v12 errorWithDomain:@"PLThreadStatsErrorDomain" code:v13 userInfo:0];
  v16 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v16;
}

void __89__PLThreadStats_initWithTimeFilter_withPercentFilter_withProcessThreadMapping_withError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a2;
  id v7 = [v5 setWithArray:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)generateSnapshot
{
  id v1 = a1;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = PLLogThreadStats();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_INFO, "started snapshot generation", buf, 2u);
    }

    unint64_t v4 = +[PLUtilities maxProcessCount];
    v17[1] = v17;
    v5 = (unsigned int *)((char *)v17 - ((4 * v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v5, 4 * v4);
    int v6 = proc_listpids(1u, 0, 0, 0);
    proc_listpids(1u, 0, v5, 4 * v4);
    if ((unint64_t)v6 >> 2 >= v4) {
      unint64_t v7 = v4;
    }
    else {
      unint64_t v7 = (unint64_t)v6 >> 2;
    }
    for (; v7; --v7)
    {
      unsigned int v9 = *v5++;
      uint64_t v8 = v9;
      id v10 = +[PLUtilities fullProcessNameForPid:v9];
      if ([v1 shouldGatherStatsForProcessName:v10])
      {
        v11 = [v1 processThreadMap];
        v12 = [v11 objectForKeyedSubscript:v10];
        uint64_t v13 = -[PLThreadStats threadStatsForPid:withThreads:]((uint64_t)v1, v8, v12);

        if ([v13 count])
        {
          v14 = [[PLProcessInfo alloc] initWithName:v10 andID:v8];
          [(PLProcessInfo *)v14 setThreadNameToInfo:v13];
          [v2 setObject:v14 forKeyedSubscript:v10];
        }
      }
    }
    id v15 = PLLogThreadStats();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1BBD2F000, v15, OS_LOG_TYPE_INFO, "finished snapshot generation", v18, 2u);
    }

    id v1 = (id)[v2 copy];
  }
  return v1;
}

- (id)diffSinceLastSnapshot
{
  v3 = -[PLThreadStats generateSnapshot](self);
  unint64_t v4 = [(PLThreadStats *)self currentSnapshot];
  v5 = [(PLThreadStats *)self diffSnapshotWithNew:v3 andOld:v4];

  [(PLThreadStats *)self setCurrentSnapshot:v3];
  int v6 = [(PLThreadStats *)self filterDiff:v5];

  return v6;
}

- (id)diffSnapshotWithNew:(id)a3 andOld:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = objc_opt_new();
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __44__PLThreadStats_diffSnapshotWithNew_andOld___block_invoke;
  id v15 = &unk_1E6255A38;
  id v16 = v5;
  id v17 = v7;
  id v8 = v7;
  id v9 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:&v12];

  id v10 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
  return v10;
}

void __44__PLThreadStats_diffSnapshotWithNew_andOld___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 objectForKeyedSubscript:v7];
  id v8 = [v6 diffSinceBaseline:v9];

  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
}

- (id)filterDiff:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __28__PLThreadStats_filterDiff___block_invoke;
  uint64_t v12 = &unk_1E6255A38;
  uint64_t v13 = self;
  id v14 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];

  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return v7;
}

void __28__PLThreadStats_filterDiff___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  id v7 = [v6 threadNameToInfo];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __28__PLThreadStats_filterDiff___block_invoke_2;
  v20[3] = &unk_1E6255A60;
  v20[4] = v22;
  v20[5] = v21;
  [v7 enumerateKeysAndObjectsUsingBlock:v20];

  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = [v6 threadNameToInfo];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __28__PLThreadStats_filterDiff___block_invoke_3;
  id v15 = &unk_1E6255A88;
  uint64_t v16 = *(void *)(a1 + 32);
  v18 = v21;
  v19 = v22;
  id v10 = v8;
  id v17 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:&v12];

  if (objc_msgSend(v10, "count", v12, v13, v14, v15, v16))
  {
    v11 = [[PLProcessInfo alloc] initWithProcessInfo:v6];
    [(PLProcessInfo *)v11 setThreadNameToInfo:v10];
    [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v5];
  }
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
}

double __28__PLThreadStats_filterDiff___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 userTime];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  [v4 systemTime];
  double v7 = v6;

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v7 + *(double *)(v8 + 24);
  *(double *)(v8 + 24) = result;
  return result;
}

void __28__PLThreadStats_filterDiff___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) shouldIncludeThread:v5 withTotalSystemTime:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) withTotalUserTime:*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)])objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6); {
}
  }

- (id)threadStatsForPid:(void *)a3 withThreads:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    uint64_t v7 = [v5 count];
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v25 = 0u;
    memset(buffer, 0, sizeof(buffer));
    if (proc_pidinfo(a2, 4, 0, buffer, 96) == 96
      && (v9 = 8 * SDWORD1(v25), (id v10 = malloc_type_malloc(v9, 0x3A3CA823uLL)) != 0))
    {
      v11 = v10;
      while (1)
      {
        unsigned int v12 = proc_pidinfo(a2, 6, 0, v11, v9);
        if ((v12 & 0x80000000) != 0) {
          break;
        }
        if (v9 >= v12)
        {
          if (v12 >= 8)
          {
            uint64_t v14 = v12 >> 3;
            id v15 = (uint64_t *)v11;
            do
            {
              uint64_t v17 = *v15++;
              uint64_t v16 = v17;
              unsigned __int8 v23 = 0;
              v18 = +[PLThreadStats getThreadName:v17 inProcess:a2 isNamed:&v23];
              if (v18 && (!v7 || [v6 containsObject:v18]))
              {
                v19 = [[PLThreadInfo alloc] initWithThread:v16 inProcess:a2];
                uint64_t v20 = v19;
                if (v19)
                {
                  [(PLThreadInfo *)v19 setThreadName:v18];
                  [(PLThreadInfo *)v20 setIsNamed:v23];
                  [v8 setObject:v20 forKeyedSubscript:v18];
                }
              }
              --v14;
            }
            while (v14);
          }
          break;
        }
        v9 += 512;
        v11 = reallocf(v11, v9);
        if (!v11) {
          goto LABEL_20;
        }
      }
      free(v11);
LABEL_20:
      id v13 = (id)[v8 copy];
    }
    else
    {
      id v13 = v8;
    }
    objc_super v21 = v13;
  }
  else
  {
    objc_super v21 = 0;
  }

  return v21;
}

- (BOOL)shouldGatherStatsForProcessName:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = [(PLThreadStats *)self processThreadMap];

    if (v6)
    {
      uint64_t v7 = [(PLThreadStats *)self processThreadMap];
      uint64_t v8 = [v7 objectForKeyedSubscript:v5];
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)shouldIncludeThread:(id)a3 withTotalSystemTime:(double)a4 withTotalUserTime:(double)a5
{
  id v8 = a3;
  if ([(PLThreadStats *)self percentTimeFilter])
  {
    if (a4 <= 0.0)
    {
      char v12 = 0;
    }
    else
    {
      [v8 systemTime];
      double v10 = v9 * 100.0 / a4;
      v11 = PLLogThreadStats();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLThreadStats shouldIncludeThread:withTotalSystemTime:withTotalUserTime:](self);
      }

      char v12 = v10 >= (double)[(PLThreadStats *)self percentTimeFilter];
    }
    if (a5 > 0.0)
    {
      [v8 userTime];
      double v14 = v13 * 100.0 / a5;
      id v15 = PLLogThreadStats();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLThreadStats shouldIncludeThread:withTotalSystemTime:withTotalUserTime:](self);
      }

      if (v14 >= (double)[(PLThreadStats *)self percentTimeFilter]) {
        char v12 = 1;
      }
    }
  }
  else
  {
    char v12 = 1;
  }
  uint64_t v16 = PLLogThreadStats();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[PLThreadStats shouldIncludeThread:withTotalSystemTime:withTotalUserTime:](v12, v16);
  }

  [(PLThreadStats *)self absoluteTimeFilter];
  if (v17 == 0.0)
  {
    char v18 = 1;
  }
  else
  {
    [v8 systemTime];
    double v20 = v19;
    [(PLThreadStats *)self absoluteTimeFilter];
    BOOL v22 = v20 >= v21;
    [v8 userTime];
    double v24 = v23;
    [(PLThreadStats *)self absoluteTimeFilter];
    char v18 = v24 >= v25 || v22;
  }
  char v26 = v18 & v12;

  return v26;
}

+ (id)getThreadName:(unint64_t)a3 inProcess:(int)a4 isNamed:(BOOL *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *a5 = 0;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"0x%llx", a3);
  if (a4 < 1)
  {
    id v12 = 0;
  }
  else
  {
    memset(v15, 0, 464);
    memset(buffer, 0, sizeof(buffer));
    if (proc_pidinfo(a4, 10, a3, buffer, 1288) <= 0 && (*__error() == 3 || *__error() == 22))
    {
      id v12 = v8;
    }
    else
    {
      double v9 = [NSString stringWithUTF8String:v15];
      uint64_t v10 = [v9 length];
      v11 = v8;
      if (v10)
      {
        *a5 = 1;
        v11 = v9;
      }
      id v12 = v11;
    }
  }

  return v12;
}

- (NSDictionary)processThreadMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProcessThreadMap:(id)a3
{
}

- (double)absoluteTimeFilter
{
  return self->_absoluteTimeFilter;
}

- (void)setAbsoluteTimeFilter:(double)a3
{
  self->_absoluteTimeFilter = a3;
}

- (unint64_t)percentTimeFilter
{
  return self->_percentTimeFilter;
}

- (void)setPercentTimeFilter:(unint64_t)a3
{
  self->_percentTimeFilter = a3;
}

- (NSDictionary)currentSnapshot
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_processThreadMap, 0);
}

- (void)shouldIncludeThread:(char)a1 withTotalSystemTime:(NSObject *)a2 withTotalUserTime:.cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "thread meets pct: %d", (uint8_t *)v2, 8u);
}

- (void)shouldIncludeThread:(void *)a1 withTotalSystemTime:withTotalUserTime:.cold.2(void *a1)
{
  [a1 percentTimeFilter];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_13(&dword_1BBD2F000, v1, v2, "usr pct %f filter %zu", v3, v4, v5, v6, v7);
}

- (void)shouldIncludeThread:(void *)a1 withTotalSystemTime:withTotalUserTime:.cold.3(void *a1)
{
  [a1 percentTimeFilter];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_13(&dword_1BBD2F000, v1, v2, "sys pct %f filter %zu", v3, v4, v5, v6, v7);
}

@end