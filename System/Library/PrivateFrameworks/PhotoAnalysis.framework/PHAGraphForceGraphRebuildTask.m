@interface PHAGraphForceGraphRebuildTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (double)period;
- (id)incrementalKey;
- (id)name;
- (id)taskClassDependencies;
- (int)priority;
@end

@implementation PHAGraphForceGraphRebuildTask

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHAGraphForceGraphRebuildTask;
  if ([(PHAGraphRebuildTask *)&v10 shouldRunWithGraphManager:v4]
    && ([v4 isReady] & 1) == 0)
  {
    v6 = [v4 workingContext];
    v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_INFO, "[PHAGraphForceGraphRebuildTask] Graph is not available, forcing to rebuild", v9, 2u);
    }

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (int)priority
{
  return 1;
}

- (id)taskClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (double)period
{
  return -1.0;
}

- (id)name
{
  return @"PHAGraphForceGraphRebuildTask";
}

@end