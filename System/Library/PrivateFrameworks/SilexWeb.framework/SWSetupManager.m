@interface SWSetupManager
- (NSMutableOrderedSet)tasks;
- (SWLogger)logger;
- (SWSetupManager)initWithLogger:(id)a3;
- (void)addTask:(id)a3;
- (void)performTasks;
@end

@implementation SWSetupManager

- (SWSetupManager)initWithLogger:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SWSetupManager;
  v6 = [(SWSetupManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_logger, a3);
    uint64_t v8 = [MEMORY[0x263EFF9B0] orderedSet];
    tasks = v7->_tasks;
    v7->_tasks = (NSMutableOrderedSet *)v8;
  }
  return v7;
}

- (void)addTask:(id)a3
{
  id v9 = a3;
  v4 = [(SWSetupManager *)self logger];
  id v5 = NSString;
  v6 = [v9 identifier];
  v7 = [v5 stringWithFormat:@"Adding setup task with identifier %@", v6];
  [v4 log:v7];

  if (v9)
  {
    uint64_t v8 = [(SWSetupManager *)self tasks];
    [v8 addObject:v9];
  }
}

- (void)performTasks
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(SWSetupManager *)self logger];
  v4 = NSString;
  id v5 = [(SWSetupManager *)self tasks];
  v6 = objc_msgSend(v4, "stringWithFormat:", @"Performing %li setup tasks", objc_msgSend(v5, "count"));
  [v3 log:v6];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = [(SWSetupManager *)self tasks];
  uint64_t v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
        v14 = [(SWSetupManager *)self logger];
        v15 = NSString;
        v16 = [v13 identifier];
        v17 = [v15 stringWithFormat:@"Performing setup task: %@", v16];
        [v14 log:v17];

        [v13 performSetup];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  v18 = [(SWSetupManager *)self tasks];
  [v18 removeAllObjects];
}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSMutableOrderedSet)tasks
{
  return self->_tasks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end