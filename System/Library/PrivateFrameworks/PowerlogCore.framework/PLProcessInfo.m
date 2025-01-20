@interface PLProcessInfo
- (BOOL)isEqualToProcessInfo:(id)a3;
- (NSDictionary)threadNameToInfo;
- (NSString)processName;
- (PLProcessInfo)initWithName:(id)a3 andID:(int)a4;
- (PLProcessInfo)initWithProcessInfo:(id)a3;
- (double)totalSystemTime;
- (double)totalUserTime;
- (id)description;
- (id)diffSinceBaseline:(id)a3;
- (int)pid;
- (void)populateCPUTime;
- (void)setPid:(int)a3;
- (void)setProcessName:(id)a3;
- (void)setThreadNameToInfo:(id)a3;
- (void)setTotalSystemTime:(double)a3;
- (void)setTotalUserTime:(double)a3;
@end

@implementation PLProcessInfo

- (PLProcessInfo)initWithName:(id)a3 andID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLProcessInfo;
  v7 = [(PLProcessInfo *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(PLProcessInfo *)v7 setProcessName:v6];
    [(PLProcessInfo *)v8 setPid:v4];
    [(PLProcessInfo *)v8 populateCPUTime];
  }

  return v8;
}

- (PLProcessInfo)initWithProcessInfo:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(PLProcessInfo);
  id v6 = [v4 processName];
  [(PLProcessInfo *)v5 setProcessName:v6];

  -[PLProcessInfo setPid:](v5, "setPid:", [v4 pid]);
  [v4 totalUserTime];
  -[PLProcessInfo setTotalUserTime:](v5, "setTotalUserTime:");
  [v4 totalSystemTime];
  double v8 = v7;

  [(PLProcessInfo *)v5 setTotalSystemTime:v8];
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(PLProcessInfo *)self processName];
  uint64_t v5 = [(PLProcessInfo *)self pid];
  id v6 = [(PLProcessInfo *)self threadNameToInfo];
  double v7 = [v3 stringWithFormat:@"%@ (%d), %lu threads", v4, v5, objc_msgSend(v6, "count")];

  return v7;
}

- (id)diffSinceBaseline:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[PLProcessInfo alloc] initWithProcessInfo:self];
  [(PLProcessInfo *)self totalUserTime];
  double v7 = v6;
  [v4 totalUserTime];
  [(PLProcessInfo *)v5 setTotalUserTime:v7 - v8];
  [(PLProcessInfo *)self totalSystemTime];
  double v10 = v9;
  [v4 totalSystemTime];
  [(PLProcessInfo *)v5 setTotalSystemTime:v10 - v11];
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v13 = [(PLProcessInfo *)self threadNameToInfo];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __35__PLProcessInfo_diffSinceBaseline___block_invoke;
  v20 = &unk_1E6255AB0;
  id v21 = v4;
  id v22 = v12;
  id v14 = v12;
  id v15 = v4;
  [v13 enumerateKeysAndObjectsUsingBlock:&v17];

  -[PLProcessInfo setThreadNameToInfo:](v5, "setThreadNameToInfo:", v14, v17, v18, v19, v20);
  return v5;
}

void __35__PLProcessInfo_diffSinceBaseline___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  double v8 = [v5 threadNameToInfo];
  double v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = [v6 diffSinceBaseline:v9];

  [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v7];
}

- (void)populateCPUTime
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
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
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  if (!proc_pid_rusage([(PLProcessInfo *)self pid], 5, (rusage_info_t *)&v3))
  {
    +[PLUtilities secondsFromMachTime:(void)v4];
    -[PLProcessInfo setTotalUserTime:](self, "setTotalUserTime:");
    +[PLUtilities secondsFromMachTime:*((void *)&v4 + 1)];
    -[PLProcessInfo setTotalSystemTime:](self, "setTotalSystemTime:");
  }
}

- (BOOL)isEqualToProcessInfo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_16;
  }
  long long v5 = [(PLProcessInfo *)self processName];
  long long v6 = [v4 processName];
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_16;
  }
  int v8 = [(PLProcessInfo *)self pid];
  if (v8 != [v4 pid]) {
    goto LABEL_16;
  }
  [(PLProcessInfo *)self totalUserTime];
  double v10 = v9;
  [v4 totalUserTime];
  if (v10 != v11) {
    goto LABEL_16;
  }
  [(PLProcessInfo *)self totalSystemTime];
  double v13 = v12;
  [v4 totalSystemTime];
  if (v13 != v14) {
    goto LABEL_16;
  }
  long long v15 = [(PLProcessInfo *)self threadNameToInfo];
  uint64_t v16 = [v15 count];
  long long v17 = [v4 threadNameToInfo];
  uint64_t v18 = [v17 count];

  if (v16 == v18)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = [(PLProcessInfo *)self threadNameToInfo];
    uint64_t v19 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          v24 = [(PLProcessInfo *)self threadNameToInfo];
          v25 = [v24 objectForKeyedSubscript:v23];
          v26 = [v4 threadNameToInfo];
          v27 = [v26 objectForKeyedSubscript:v23];
          int v28 = [v25 isEqualToThreadInfo:v27];

          if (!v28)
          {
            BOOL v29 = 0;
            goto LABEL_19;
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
    BOOL v29 = 1;
LABEL_19:
  }
  else
  {
LABEL_16:
    BOOL v29 = 0;
  }

  return v29;
}

- (double)totalSystemTime
{
  return self->_totalSystemTime;
}

- (void)setTotalSystemTime:(double)a3
{
  self->_totalSystemTime = a3;
}

- (double)totalUserTime
{
  return self->_totalUserTime;
}

- (void)setTotalUserTime:(double)a3
{
  self->_totalUserTime = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProcessName:(id)a3
{
}

- (NSDictionary)threadNameToInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setThreadNameToInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadNameToInfo, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end