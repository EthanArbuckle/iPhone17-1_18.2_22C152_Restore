@interface SCBackgroundSystemTask
- (BOOL)_conformsToTaskHandling;
- (BOOL)isRepeating;
- (SCBackgroundSystemTask)init;
- (id)identifier;
- (void)init;
- (void)registerForTaskUsingQueue:(id)a3;
- (void)rejectAndCloseTask:(id)a3 reason:(id)a4;
@end

@implementation SCBackgroundSystemTask

- (SCBackgroundSystemTask)init
{
  v7.receiver = self;
  v7.super_class = (Class)SCBackgroundSystemTask;
  v2 = [(SCBackgroundSystemTask *)&v7 init];
  v3 = v2;
  if (v2 && ![(SCBackgroundSystemTask *)v2 _conformsToTaskHandling])
  {
    v5 = SCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(SCBackgroundSystemTask *)v3 init];
    }

    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (void)registerForTaskUsingQueue:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SCBackgroundSystemTask *)self isRepeating];
  id v8 = [MEMORY[0x263F29900] sharedScheduler];
  v6 = [(SCBackgroundSystemTask *)self identifier];
  if (v5) {
    [(SCBackgroundSystemTask *)self repeatingTaskHandler];
  }
  else {
  objc_super v7 = [(SCBackgroundSystemTask *)self nonRepeatingTaskHandler];
  }
  [v8 registerForTaskWithIdentifier:v6 usingQueue:v4 launchHandler:v7];
}

- (void)rejectAndCloseTask:(id)a3 reason:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = SCLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = [(SCBackgroundSystemTask *)self identifier];
    int v10 = 138412802;
    v11 = v9;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_error_impl(&dword_25B654000, v8, OS_LOG_TYPE_ERROR, "\"SC task %@ will not handle BGST task %@. Reason: %@\"", (uint8_t *)&v10, 0x20u);
  }
  [v6 setTaskCompleted];
}

- (BOOL)_conformsToTaskHandling
{
  v3 = [(SCBackgroundSystemTask *)self identifier];

  if (v3)
  {
    [(SCBackgroundSystemTask *)self isRepeating];
    char v4 = objc_opt_respondsToSelector();
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (id)identifier
{
  return 0;
}

- (BOOL)isRepeating
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)init
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v4 = [a1 identifier];
  int v5 = [a1 isRepeating];
  id v6 = @"handleNonRepeatingTask";
  if (v5) {
    id v6 = @"handleRepeatingTask";
  }
  int v7 = 138412546;
  id v8 = v4;
  __int16 v9 = 2112;
  int v10 = v6;
  _os_log_error_impl(&dword_25B654000, a2, OS_LOG_TYPE_ERROR, "\"Couldn't initialize task for identifier %@ and/or selector %@\"", (uint8_t *)&v7, 0x16u);
}

@end