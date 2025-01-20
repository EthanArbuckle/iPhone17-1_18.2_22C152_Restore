@interface NDTPerf
+ (id)nowMinusPrevious:(id)a3;
+ (int64_t)cpuTime;
+ (int64_t)dirtyMemory;
+ (int64_t)wallTime;
- (NDTPerf)init;
- (double)cpuTimeMs;
- (id)description;
- (int64_t)cpuTime;
- (int64_t)dirtyMemory;
- (int64_t)wallTime;
- (void)setCpuTime:(int64_t)a3;
- (void)setDirtyMemory:(int64_t)a3;
- (void)setWallTime:(int64_t)a3;
@end

@implementation NDTPerf

- (NDTPerf)init
{
  v6.receiver = self;
  v6.super_class = (Class)NDTPerf;
  v2 = [(NDTPerf *)&v6 init];
  if (!v2) {
    goto LABEL_5;
  }
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v8 = 0u;
  pid_t v3 = getpid();
  if (!proc_pid_rusage(v3, 4, buffer))
  {
    v2->_dirtyMemory = *((void *)&v11 + 1);
    v2->_cpuTime = *((void *)&v8 + 1) + v8;
    v2->_wallTime = +[NDTPerf wallTime];
LABEL_5:
    v4 = v2;
    goto LABEL_6;
  }
  v4 = 0;
LABEL_6:

  return v4;
}

- (double)cpuTimeMs
{
  uint64_t v2 = [(NDTPerf *)self cpuTime];
  if (qword_1000C6C58 != -1) {
    dispatch_once(&qword_1000C6C58, &stru_1000A9CB0);
  }
  return *(double *)&qword_1000C69D8 * (double)v2 / 1000000.0;
}

+ (id)nowMinusPrevious:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(NDTPerf);
  -[NDTPerf setDirtyMemory:](v4, "setDirtyMemory:", (unsigned char *)-[NDTPerf dirtyMemory](v4, "dirtyMemory") - (unsigned char *)[v3 dirtyMemory]);
  -[NDTPerf setCpuTime:](v4, "setCpuTime:", (unsigned char *)-[NDTPerf cpuTime](v4, "cpuTime") - (unsigned char *)[v3 cpuTime]);
  v5 = [v3 wallTime];

  [(NDTPerf *)v4 setWallTime:(unsigned char *)[(NDTPerf *)v4 wallTime] - v5];

  return v4;
}

+ (int64_t)wallTime
{
  if (qword_1000C6C50 != -1) {
    dispatch_once(&qword_1000C6C50, &stru_1000A9C90);
  }
  return (qword_1000C6C48 * mach_absolute_time()) >> 8;
}

+ (int64_t)dirtyMemory
{
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  memset(v4, 0, sizeof(v4));
  pid_t v2 = getpid();
  if (proc_pid_rusage(v2, 4, (rusage_info_t *)v4)) {
    return 0;
  }
  else {
    return *((void *)&v5 + 1);
  }
}

+ (int64_t)cpuTime
{
  uint64_t v22 = 0;
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
  pid_t v2 = getpid();
  if (proc_pid_rusage(v2, 4, (rusage_info_t *)&v4)) {
    return 0;
  }
  else {
    return *((void *)&v5 + 1) + v5;
  }
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  long long v4 = NSStringFromClass(v3);
  long long v5 = +[NSString stringWithFormat:@"<%@:%p cpu=%lld, wall=%lld, dmem=%lld>", v4, self, [(NDTPerf *)self cpuTime], [(NDTPerf *)self wallTime], [(NDTPerf *)self dirtyMemory]];

  return v5;
}

- (int64_t)wallTime
{
  return self->_wallTime;
}

- (void)setWallTime:(int64_t)a3
{
  self->_wallTime = a3;
}

- (int64_t)cpuTime
{
  return self->_cpuTime;
}

- (void)setCpuTime:(int64_t)a3
{
  self->_cpuTime = a3;
}

- (int64_t)dirtyMemory
{
  return self->_dirtyMemory;
}

- (void)setDirtyMemory:(int64_t)a3
{
  self->_dirtyMemory = a3;
}

@end