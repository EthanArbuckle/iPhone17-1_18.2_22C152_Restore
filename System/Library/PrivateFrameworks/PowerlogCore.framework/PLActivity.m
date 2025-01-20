@interface PLActivity
+ (id)activityEntryKey;
+ (id)activityStatesEntryKey;
+ (id)workQueue;
- (BOOL)allCriteriaSatisfied;
- (BOOL)enabled;
- (BOOL)mustRunCriterionSatisfied;
- (NSArray)criteria;
- (NSDate)lastCompletedDate;
- (NSString)description;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (PLActivity)initWithIdentifier:(id)a3 withCriteria:(id)a4 withMustRunCriterion:(id)a5 withQueue:(id)a6 withInterruptBlock:(id)a7 withActivityBlock:(id)a8;
- (PLActivityCriterion)mustRunCriterion;
- (PLEntry)activityEntry;
- (id)activityBlock;
- (id)criteriaString;
- (id)interruptBlock;
- (id)mustRunCriterionString;
- (int64_t)state;
- (void)allCriteriaSatisfied;
- (void)didChangeCriterion:(id)a3;
- (void)disable;
- (void)enable;
- (void)enumerateCriteriaWithBlock:(id)a3;
- (void)interruptActivity;
- (void)logEntry;
- (void)runActivity;
- (void)setActivityBlock:(id)a3;
- (void)setActivityEntry:(id)a3;
- (void)setCriteria:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInterruptBlock:(id)a3;
- (void)setLastCompletedDate:(id)a3;
- (void)setMustRunCriterion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setState:(int64_t)a3;
- (void)syncWithDB;
@end

@implementation PLActivity

uint64_t __25__PLActivity_runActivity__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C1869120]();
  v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __25__PLActivity_runActivity__block_invoke_cold_4();
  }

  v4 = [*(id *)(a1 + 32) activityBlock];
  v5 = [*(id *)(a1 + 32) lastCompletedDate];
  v6 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  ((void (**)(void, void *, void *))v4)[2](v4, v5, v6);

  v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __25__PLActivity_runActivity__block_invoke_cold_3();
  }

  if ([*(id *)(a1 + 32) state] == 3)
  {
    v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __25__PLActivity_runActivity__block_invoke_cold_1();
    }

    v9 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __25__PLActivity_runActivity__block_invoke_17;
    v16[3] = &unk_1E6255840;
    v16[4] = v9;
    [v9 enumerateCriteriaWithBlock:v16];
  }
  else if ([*(id *)(a1 + 32) state] == 1 || objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __25__PLActivity_runActivity__block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) setState:4];
    v11 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [*(id *)(a1 + 32) setLastCompletedDate:v11];

    v12 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __25__PLActivity_runActivity__block_invoke_18;
    v15[3] = &unk_1E6255840;
    v15[4] = v12;
    [v12 enumerateCriteriaWithBlock:v15];
    v13 = [*(id *)(a1 + 32) mustRunCriterion];
    [v13 didCompleteActivity:*(void *)(a1 + 32)];
  }
  return [*(id *)(a1 + 32) setState:0];
}

- (NSDate)lastCompletedDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setState:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  int64_t state = obj->_state;
  if (state == a3 || a3 && state == -1) {
    goto LABEL_4;
  }
  if (state == 2)
  {
    if ((a3 | 4) != 4) {
      goto LABEL_4;
    }
  }
  else if (state == 1)
  {
    if ((unint64_t)a3 > 4 || ((1 << a3) & 0x19) == 0) {
      goto LABEL_4;
    }
  }
  else if (state)
  {
    if (a3 && state == 3) {
      goto LABEL_4;
    }
    if (state == 3)
    {
      v5 = [(PLActivity *)obj interruptBlock];

      if (!v5) {
        goto LABEL_4;
      }
      int64_t state = obj->_state;
    }
    if (a3 && state == 4)
    {
LABEL_4:
      objc_sync_exit(obj);

      return;
    }
  }
  else if ((unint64_t)(a3 + 1) > 3 || !a3)
  {
    goto LABEL_4;
  }
  obj->_int64_t state = a3;
  objc_sync_exit(obj);

  [(PLActivity *)obj logEntry];
}

- (void)logEntry
{
  v3 = [PLEntry alloc];
  v4 = [(id)objc_opt_class() activityStatesEntryKey];
  v13 = [(PLEntry *)v3 initWithEntryKey:v4];

  v5 = NSNumber;
  v6 = [(PLActivity *)self activityEntry];
  v7 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "entryID"));
  [(PLEntry *)v13 setObject:v7 forKeyedSubscript:@"ActivityID"];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLActivity state](self, "state"));
  [(PLEntry *)v13 setObject:v8 forKeyedSubscript:@"State"];

  v9 = +[PowerlogCore sharedCore];
  v10 = [v9 storage];
  [v10 blockingWriteEntry:v13 withCompletionBlock:&__block_literal_global_20];

  v11 = +[PowerlogCore sharedCore];
  v12 = [v11 storage];
  [v12 flushCachesWithReason:@"ActivityStatesEntry"];
}

- (void)didChangeCriterion:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(PLActivity *)v5 enabled];
  objc_sync_exit(v5);

  if (v6)
  {
    v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(PLActivity *)v4 didChangeCriterion:v7];
    }

    if (-[PLActivity state](v5, "state") || ![v4 satisfied])
    {
      if (-[PLActivity state](v5, "state") == 1 && ([v4 satisfied] & 1) == 0)
      {
        [(PLActivity *)v5 setState:3];
        [(PLActivity *)v5 interruptActivity];
      }
    }
    else
    {
      if ([(PLActivity *)v5 mustRunCriterionSatisfied])
      {
        v8 = v5;
        uint64_t v9 = 2;
LABEL_13:
        [(PLActivity *)v8 setState:v9];
        [(PLActivity *)v5 runActivity];
        goto LABEL_14;
      }
      if ([(PLActivity *)v5 allCriteriaSatisfied])
      {
        v8 = v5;
        uint64_t v9 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_14:
}

- (int64_t)state
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (PLEntry)activityEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 72, 1);
}

+ (id)activityStatesEntryKey
{
  return +[PLOperator entryKeyForType:@"EventForward" andName:@"ActivityStates"];
}

- (BOOL)mustRunCriterionSatisfied
{
  v3 = [(PLActivity *)self mustRunCriterion];
  if (v3)
  {
    id v4 = [(PLActivity *)self mustRunCriterion];
    char v5 = [v4 satisfied];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (PLActivityCriterion)mustRunCriterion
{
  return (PLActivityCriterion *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)allCriteriaSatisfied
{
  v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PLActivity allCriteriaSatisfied]();
  }

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__PLActivity_allCriteriaSatisfied__block_invoke;
  v7[3] = &unk_1E6255868;
  v7[4] = &v8;
  [(PLActivity *)self enumerateCriteriaWithBlock:v7];
  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PLActivity allCriteriaSatisfied]();
  }

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)enumerateCriteriaWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  if (v4)
  {
    char v5 = [(PLActivity *)self criteria];
    objc_sync_enter(v5);
    char v14 = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v6 = [(PLActivity *)self criteria];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
        if (v14) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    objc_sync_exit(v5);
  }
}

- (NSArray)criteria
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

void __34__PLActivity_allCriteriaSatisfied__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  BOOL v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __34__PLActivity_allCriteriaSatisfied__block_invoke_cold_1(v5, v6);
  }

  if (([v5 satisfied] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (void)runActivity
{
  v3 = [(PLActivity *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__PLActivity_runActivity__block_invoke;
  block[3] = &unk_1E62538C8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (id)activityBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

uint64_t __25__PLActivity_runActivity__block_invoke_18(uint64_t a1, void *a2)
{
  return [a2 didCompleteActivity:*(void *)(a1 + 32)];
}

- (void)setLastCompletedDate:(id)a3
{
}

- (PLActivity)initWithIdentifier:(id)a3 withCriteria:(id)a4 withMustRunCriterion:(id)a5 withQueue:(id)a6 withInterruptBlock:(id)a7 withActivityBlock:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v28 = a5;
  id v17 = a6;
  id v29 = a7;
  id v18 = a8;
  v19 = 0;
  if (v15)
  {
    if (v16)
    {
      uint64_t v20 = objc_msgSend(v16, "count", v28);
      v19 = 0;
      if (v18)
      {
        if (v17 && v20)
        {
          v30.receiver = self;
          v30.super_class = (Class)PLActivity;
          v21 = [(PLActivity *)&v30 init];
          v22 = v21;
          if (v21)
          {
            objc_storeStrong((id *)&v21->_identifier, a3);
            objc_storeStrong((id *)&v22->_criteria, a4);
            objc_storeStrong((id *)&v22->_mustRunCriterion, a5);
            objc_storeStrong((id *)&v22->_queue, a6);
            uint64_t v23 = [v18 copy];
            id activityBlock = v22->_activityBlock;
            v22->_id activityBlock = (id)v23;

            uint64_t v25 = [v29 copy];
            id interruptBlock = v22->_interruptBlock;
            v22->_id interruptBlock = (id)v25;

            v22->_int64_t state = -1;
            v22->_enabled = 0;
            [(PLActivity *)v22 syncWithDB];
          }
          self = v22;
          v19 = self;
        }
      }
    }
  }

  return v19;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_enabled == v3)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_enabled = v3;
    objc_sync_exit(obj);

    if (v3)
    {
      [(PLActivity *)obj enable];
    }
    else
    {
      [(PLActivity *)obj disable];
    }
  }
}

+ (id)workQueue
{
  uint64_t v2 = objc_opt_class();
  return +[PLUtilities workQueueForClass:v2];
}

+ (id)activityEntryKey
{
  return +[PLOperator entryKeyForType:@"EventNone" andName:@"Activity"];
}

- (void)syncWithDB
{
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, a2, a3, "PLActivity::syncWithDB: _activityEntry=%@", a5, a6, a7, a8, 2u);
}

void __24__PLActivity_syncWithDB__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  BOOL v3 = [*(id *)(a1 + 32) activityEntry];
  [v3 setObject:v2 forKeyedSubscript:@"Criteria"];

  id v5 = [*(id *)(a1 + 32) mustRunCriterionString];
  id v4 = [*(id *)(a1 + 32) activityEntry];
  [v4 setObject:v5 forKeyedSubscript:@"MustRunCriterion"];
}

- (void)enable
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLActivity::enable", v2, v3, v4, v5, v6);
}

uint64_t __20__PLActivity_enable__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didEnableActivity:*(void *)(a1 + 32)];
}

- (void)disable
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLActivity::disable", v2, v3, v4, v5, v6);
}

uint64_t __21__PLActivity_disable__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didDisableActivity:*(void *)(a1 + 32)];
}

uint64_t __25__PLActivity_runActivity__block_invoke_17(uint64_t a1, void *a2)
{
  return [a2 didInterruptActivity:*(void *)(a1 + 32)];
}

- (void)interruptActivity
{
  uint64_t v3 = [(PLActivity *)self interruptBlock];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    int64_t v5 = [(PLActivity *)self state];

    if (v5 == 3)
    {
      uint8_t v6 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __31__PLActivity_interruptActivity__block_invoke;
      block[3] = &unk_1E62538C8;
      block[4] = self;
      dispatch_async(v6, block);
    }
  }
}

void __31__PLActivity_interruptActivity__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interruptBlock];
  uint64_t v1 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v2[2](v2, v1);
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(PLActivity *)self criteriaString];
  int64_t v5 = [(PLActivity *)self mustRunCriterionString];
  uint8_t v6 = [v3 stringWithFormat:@"{%@, %@}", v4, v5];

  return (NSString *)v6;
}

- (id)criteriaString
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__15;
  long long v12 = __Block_byref_object_dispose__15;
  id v13 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__PLActivity_criteriaString__block_invoke;
  v7[3] = &unk_1E6255868;
  v7[4] = &v8;
  [(PLActivity *)self enumerateCriteriaWithBlock:v7];
  uint64_t v3 = NSString;
  uint64_t v4 = [(id)v9[5] componentsJoinedByString:@", "];
  int64_t v5 = [v3 stringWithFormat:@"(%@)", v4];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __28__PLActivity_criteriaString__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 description];
  [v2 addObject:v3];
}

- (id)mustRunCriterionString
{
  id v3 = [(PLActivity *)self mustRunCriterion];
  if (v3)
  {
    uint64_t v4 = [(PLActivity *)self mustRunCriterion];
    int64_t v5 = [v4 description];
  }
  else
  {
    int64_t v5 = &stru_1F15208F0;
  }

  return v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
}

- (void)setActivityBlock:(id)a3
{
}

- (id)interruptBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setInterruptBlock:(id)a3
{
}

- (void)setCriteria:(id)a3
{
}

- (void)setMustRunCriterion:(id)a3
{
}

- (void)setActivityEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCompletedDate, 0);
  objc_storeStrong((id *)&self->_activityEntry, 0);
  objc_storeStrong((id *)&self->_mustRunCriterion, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong(&self->_interruptBlock, 0);
  objc_storeStrong(&self->_activityBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)didChangeCriterion:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = 138412802;
  id v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a2 state];
  __int16 v8 = 1024;
  int v9 = [v5 satisfied];
  _os_log_debug_impl(&dword_1BBD2F000, a3, OS_LOG_TYPE_DEBUG, "PLActivity::didChangeCriterion:%@, state=%lu, satisfied=%i", (uint8_t *)&v4, 0x1Cu);
}

void __25__PLActivity_runActivity__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLActivity::runActivity: activity block interrupted", v2, v3, v4, v5, v6);
}

void __25__PLActivity_runActivity__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLActivity::runActivity: activity block completed", v2, v3, v4, v5, v6);
}

void __25__PLActivity_runActivity__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLActivity::runActivity: activity block end", v2, v3, v4, v5, v6);
}

void __25__PLActivity_runActivity__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLActivity::runActivity: activity block begin", v2, v3, v4, v5, v6);
}

- (void)allCriteriaSatisfied
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLActivity::allCriteriaSatisfied: begin", v2, v3, v4, v5, v6);
}

void __34__PLActivity_allCriteriaSatisfied__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = [a1 satisfied];
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "PLActivity::allCriteriaSatisfied criterion=%@, satisfied=%i", (uint8_t *)&v3, 0x12u);
}

@end