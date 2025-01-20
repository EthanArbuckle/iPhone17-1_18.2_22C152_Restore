@interface RTWorkoutSchedulerMetricsTask
+ (id)defaultsKeyForTaskType:(unint64_t)a3;
+ (unint64_t)taskTypeForDefaultsKey:(id)a3;
- (NSDate)taskFinish;
- (NSDate)taskStart;
- (RTDefaultsManager)defaultsManager;
- (RTWorkoutSchedulerMetricsTask)initWithTaskType:(unint64_t)a3 defaultsManager:(id)a4;
- (int64_t)totalNAtStart;
- (unint64_t)currentNAtFinish;
- (unint64_t)currentNAtStart;
- (unint64_t)memoryFootprintAtFinish;
- (unint64_t)memoryFootprintAtStart;
- (unint64_t)taskRunDailyCount;
- (unint64_t)taskRunDailyCountForMetricsTaskType:(unint64_t)a3;
- (unint64_t)taskType;
- (void)resetTaskState;
- (void)setCurrentNAtFinish:(unint64_t)a3;
- (void)setCurrentNAtStart:(unint64_t)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setMemoryFootprintAtFinish:(unint64_t)a3;
- (void)setMemoryFootprintAtStart:(unint64_t)a3;
- (void)setTaskFinish:(id)a3;
- (void)setTaskRunDailyCount:(unint64_t)a3;
- (void)setTaskStart:(id)a3;
- (void)setTaskType:(unint64_t)a3;
- (void)setTotalNAtStart:(int64_t)a3;
@end

@implementation RTWorkoutSchedulerMetricsTask

+ (id)defaultsKeyForTaskType:(unint64_t)a3
{
  if (a3 > 6) {
    return @"RTDefaultsWorkoutSchedulerMetricsTaskTypeInitialClusterAndSyncKey";
  }
  else {
    return off_1E6B9B7E8[a3];
  }
}

+ (unint64_t)taskTypeForDefaultsKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RTDefaultsWorkoutSchedulerMetricsTaskTypeInitialClusterAndSyncKey"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"RTDefaultsWorkoutSchedulerMetricsTaskTypeWorkoutComparisonKey"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"RTDefaultsWorkoutSchedulerMetricsTaskTypeWorkoutComparisonOnChargerKey"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"RTDefaultsWorkoutSchedulerMetricsTaskTypeClusterAndSyncKey"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"RTDefaultsWorkoutSchedulerMetricsTaskTypeUpdateRelevanceScoreKey"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"RTDefaultsWorkoutSchedulerMetricsTaskTypeProcessNewlyAddedWorkoutKey"])
  {
    unint64_t v4 = 6;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (RTWorkoutSchedulerMetricsTask)initWithTaskType:(unint64_t)a3 defaultsManager:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTWorkoutSchedulerMetricsTask;
    v8 = [(RTWorkoutSchedulerMetricsTask *)&v13 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_defaultsManager, a4);
      [(RTWorkoutSchedulerMetricsTask *)v9 setTaskType:a3];
      [(RTWorkoutSchedulerMetricsTask *)v9 setTaskStart:0];
      [(RTWorkoutSchedulerMetricsTask *)v9 setTaskFinish:0];
      [(RTWorkoutSchedulerMetricsTask *)v9 setMemoryFootprintAtStart:-1];
      [(RTWorkoutSchedulerMetricsTask *)v9 setMemoryFootprintAtFinish:-1];
      [(RTWorkoutSchedulerMetricsTask *)v9 setTaskRunDailyCount:[(RTWorkoutSchedulerMetricsTask *)v9 taskRunDailyCountForMetricsTaskType:a3]];
      [(RTWorkoutSchedulerMetricsTask *)v9 setTotalNAtStart:-1];
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)resetTaskState
{
  [(RTWorkoutSchedulerMetricsTask *)self setTaskStart:0];
  [(RTWorkoutSchedulerMetricsTask *)self setTaskFinish:0];
  [(RTWorkoutSchedulerMetricsTask *)self setMemoryFootprintAtStart:-1];
  [(RTWorkoutSchedulerMetricsTask *)self setMemoryFootprintAtFinish:-1];
  id v3 = [(RTWorkoutSchedulerMetricsTask *)self defaultsManager];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:-[RTWorkoutSchedulerMetricsTask taskRunDailyCount](self, "taskRunDailyCount")];
  v5 = +[RTWorkoutSchedulerMetricsTask defaultsKeyForTaskType:[(RTWorkoutSchedulerMetricsTask *)self taskType]];
  [v3 setObject:v4 forKey:v5];

  [(RTWorkoutSchedulerMetricsTask *)self setTotalNAtStart:-1];
}

- (unint64_t)taskRunDailyCountForMetricsTaskType:(unint64_t)a3
{
  unint64_t v4 = +[RTWorkoutSchedulerMetricsTask defaultsKeyForTaskType:a3];
  v5 = [(RTWorkoutSchedulerMetricsTask *)self defaultsManager];
  v6 = [v5 objectForKey:v4];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (unint64_t)memoryFootprintAtStart
{
  return self->_memoryFootprintAtStart;
}

- (void)setMemoryFootprintAtStart:(unint64_t)a3
{
  self->_memoryFootprintAtStart = a3;
}

- (unint64_t)memoryFootprintAtFinish
{
  return self->_memoryFootprintAtFinish;
}

- (void)setMemoryFootprintAtFinish:(unint64_t)a3
{
  self->_memoryFootprintAtFinish = a3;
}

- (unint64_t)currentNAtFinish
{
  return self->_currentNAtFinish;
}

- (void)setCurrentNAtFinish:(unint64_t)a3
{
  self->_currentNAtFinish = a3;
}

- (unint64_t)currentNAtStart
{
  return self->_currentNAtStart;
}

- (void)setCurrentNAtStart:(unint64_t)a3
{
  self->_currentNAtStart = a3;
}

- (NSDate)taskStart
{
  return self->_taskStart;
}

- (void)setTaskStart:(id)a3
{
}

- (NSDate)taskFinish
{
  return self->_taskFinish;
}

- (void)setTaskFinish:(id)a3
{
}

- (unint64_t)taskType
{
  return self->_taskType;
}

- (void)setTaskType:(unint64_t)a3
{
  self->_taskType = a3;
}

- (unint64_t)taskRunDailyCount
{
  return self->_taskRunDailyCount;
}

- (void)setTaskRunDailyCount:(unint64_t)a3
{
  self->_taskRunDailyCount = a3;
}

- (int64_t)totalNAtStart
{
  return self->_totalNAtStart;
}

- (void)setTotalNAtStart:(int64_t)a3
{
  self->_totalNAtStart = a3;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_taskFinish, 0);

  objc_storeStrong((id *)&self->_taskStart, 0);
}

@end