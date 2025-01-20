@interface CACRecordedUserActionFlow
+ (BOOL)supportsSecureCoding;
- (BOOL)doesNextSpokenCommandMatchIdentifier:(id)a3;
- (BOOL)skipNextAction;
- (CACRecordedUserActionFlow)init;
- (CACRecordedUserActionFlow)initWithCoder:(id)a3;
- (CACRecordedUserActionFlow)initWithUserActions:(id)a3;
- (NSArray)userActions;
- (NSString)identifier;
- (id)description;
- (id)plistDescription;
- (void)_configureEnvironment;
- (void)_executeNextActionWithCompletionBlock:(id)a3;
- (void)_exitFlowWithError:(id)a3 completionBlock:(id)a4;
- (void)_restoreEnvironment;
- (void)beginExecutingWithCompletionBlock:(id)a3;
- (void)cancelExecution;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSkipNextAction:(BOOL)a3;
@end

@implementation CACRecordedUserActionFlow

- (CACRecordedUserActionFlow)init
{
  v7.receiver = self;
  v7.super_class = (Class)CACRecordedUserActionFlow;
  v2 = [(CACRecordedUserActionFlow *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_executingTaskIndex = -1;
    uint64_t v4 = objc_opt_new();
    orignalEnvironmentSettings = v3->_orignalEnvironmentSettings;
    v3->_orignalEnvironmentSettings = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (CACRecordedUserActionFlow)initWithUserActions:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(CACRecordedUserActionFlow *)self init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tasks, a3);
    v15[0] = @"OverlayType";
    v8 = +[CACPreferences sharedPreferences];
    v9 = [v8 alwaysShowOverlayType];
    v15[1] = @"LocaleIdentifier";
    v16[0] = v9;
    v10 = +[CACPreferences sharedPreferences];
    v11 = [v10 localeIdentifier];
    v16[1] = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    environmentSettings = v7->_environmentSettings;
    v7->_environmentSettings = (NSDictionary *)v12;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:1 forKey:@"Version"];
  [v4 encodeObject:self->_tasks forKey:@"Tasks"];
  [v4 encodeObject:self->_environmentSettings forKey:@"EnvironmentSettings"];
}

- (CACRecordedUserActionFlow)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CACRecordedUserActionFlow *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Tasks"];
    tasks = v5->_tasks;
    v5->_tasks = (NSArray *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"EnvironmentSettings"];
    environmentSettings = v5->_environmentSettings;
    v5->_environmentSettings = (NSDictionary *)v14;
  }
  return v5;
}

- (NSArray)userActions
{
  return self->_tasks;
}

- (BOOL)doesNextSpokenCommandMatchIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  int64_t executingTaskIndex = v5->_executingTaskIndex;
  if (executingTaskIndex + 1 >= [(NSArray *)v5->_tasks count])
  {
    char v10 = 0;
  }
  else
  {
    uint64_t v7 = [(NSArray *)v5->_tasks objectAtIndex:v5->_executingTaskIndex + 1];
    v8 = [v7 spokenCommand];
    uint64_t v9 = [v8 identifier];
    char v10 = [v9 isEqualToString:v4];
  }
  objc_sync_exit(v5);

  return v10;
}

- (void)beginExecutingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  *(_WORD *)&v5->_isExecuting = 1;
  objc_sync_exit(v5);

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__CACRecordedUserActionFlow_beginExecutingWithCompletionBlock___block_invoke;
  v7[3] = &unk_264D116E0;
  v7[4] = v5;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __63__CACRecordedUserActionFlow_beginExecutingWithCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureEnvironment];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _executeNextActionWithCompletionBlock:v3];
}

- (void)cancelExecution
{
  obj = self;
  objc_sync_enter(obj);
  obj->_isCancelled = 1;
  objc_sync_exit(obj);
}

- (void)_executeNextActionWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = 1;
  if (v5->_skipNextAction) {
    uint64_t v6 = 2;
  }
  unint64_t v7 = v6 + v5->_executingTaskIndex;
  v5->_int64_t executingTaskIndex = v7;
  v5->_skipNextAction = 0;
  BOOL isCancelled = v5->_isCancelled;
  unint64_t v9 = [(NSArray *)v5->_tasks count];
  unint64_t v10 = v9;
  if (isCancelled || v7 >= v9)
  {
    objc_sync_exit(v5);

    if (isCancelled)
    {
      uint64_t v12 = v5;
      objc_sync_enter(v12);
      v12->_isExecuting = 0;
      objc_sync_exit(v12);

      uint64_t v14 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandPlayback.Error.CancelledByUser"];
      v13 = CACMakeError(3000, v14);
      [(CACRecordedUserActionFlow *)v12 _exitFlowWithError:v13 completionBlock:v4];

      goto LABEL_14;
    }
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = [(NSArray *)v5->_tasks objectAtIndex:v5->_executingTaskIndex];
    objc_sync_exit(v5);
  }
  if (v7 < v10)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__CACRecordedUserActionFlow__executeNextActionWithCompletionBlock___block_invoke;
    void v16[3] = &unk_264D11990;
    v16[4] = v5;
    id v17 = v4;
    [v14 beginExecutingWithCompletionBlock:v16];
  }
  else
  {
    v15 = v5;
    objc_sync_enter(v15);
    v15->_isExecuting = 0;
    objc_sync_exit(v15);

    [(CACRecordedUserActionFlow *)v15 _exitFlowWithError:0 completionBlock:v4];
  }
LABEL_14:
}

void __67__CACRecordedUserActionFlow__executeNextActionWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 code])
  {
    [*(id *)(a1 + 32) _exitFlowWithError:v3 completionBlock:*(void *)(a1 + 40)];
  }
  else
  {
    +[CACSpokenCommand defaultDelayBetweenCommands];
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    uint64_t v6 = dispatch_get_global_queue(21, 0);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __67__CACRecordedUserActionFlow__executeNextActionWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_264D116E0;
    unint64_t v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    dispatch_after(v5, v6, v8);
  }
}

uint64_t __67__CACRecordedUserActionFlow__executeNextActionWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeNextActionWithCompletionBlock:*(void *)(a1 + 40)];
}

- (void)_exitFlowWithError:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = (void (**)(id, id))a4;
  id v7 = a3;
  [(CACRecordedUserActionFlow *)self _restoreEnvironment];
  v6[2](v6, v7);
}

- (void)_configureEnvironment
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(NSDictionary *)self->_environmentSettings allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 isEqualToString:@"OverlayType"])
        {
          id v9 = [(NSDictionary *)self->_environmentSettings objectForKey:v8];
          unint64_t v10 = +[CACPreferences sharedPreferences];
          v11 = [v10 alwaysShowOverlayType];

          if (([v9 isEqualToString:v11] & 1) == 0)
          {
            uint64_t v12 = +[CACPreferences sharedPreferences];
            [v12 setAlwaysShowOverlayType:v9];

            [(NSMutableDictionary *)self->_orignalEnvironmentSettings setObject:v11 forKey:v8];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)_restoreEnvironment
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(NSMutableDictionary *)self->_orignalEnvironmentSettings allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 isEqualToString:@"OverlayType"])
        {
          id v9 = +[CACPreferences sharedPreferences];
          unint64_t v10 = [(NSMutableDictionary *)self->_orignalEnvironmentSettings objectForKey:v8];
          [v9 setAlwaysShowOverlayType:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)plistDescription
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_tasks;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "plistDescription", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 setObject:self->_environmentSettings forKey:@"UserActionFlowEnvironment"];
  [v3 setObject:v4 forKey:@"UserActionFlowTasks"];

  return v3;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_tasks;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    uint64_t v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%ld\t%@\n", v8 + i, *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      v8 += i;
    }
    while (v6);
  }

  return v3;
}

- (BOOL)skipNextAction
{
  return self->_skipNextAction;
}

- (void)setSkipNextAction:(BOOL)a3
{
  self->_skipNextAction = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_orignalEnvironmentSettings, 0);
  objc_storeStrong((id *)&self->_environmentSettings, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end