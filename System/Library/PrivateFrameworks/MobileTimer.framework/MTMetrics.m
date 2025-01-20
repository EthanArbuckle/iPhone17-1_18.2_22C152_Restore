@interface MTMetrics
+ (id)_sharedPublicMetrics;
- (MTMetrics)init;
- (NAScheduler)serializer;
- (void)logAlarmAdded:(BOOL)a3;
- (void)logAlarmDeleted:(BOOL)a3;
- (void)logAlarmDismissAction:(unint64_t)a3;
- (void)logAlarmSnoozeAction:(unint64_t)a3;
- (void)logAlarmUpdated:(BOOL)a3;
- (void)logMultipleTimersAdded:(id)a3;
- (void)logSyncCompleted;
- (void)logSyncFailedWithError:(id)a3;
- (void)logTimerAdded;
- (void)logTimerDeleted;
- (void)logTimerDismissed;
- (void)logTimerRepeated;
- (void)logTimerUpdated;
- (void)setSerializer:(id)a3;
@end

@implementation MTMetrics

- (MTMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTMetrics;
  v2 = [(MTMetrics *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTMetrics.serialqueue", +[MTScheduler defaultPriority]);
    serializer = v2->_serializer;
    v2->_serializer = (NAScheduler *)v3;
  }
  return v2;
}

+ (id)_sharedPublicMetrics
{
  if (_sharedPublicMetrics_onceToken != -1) {
    dispatch_once(&_sharedPublicMetrics_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)_sharedPublicMetrics__sharedPublicMetrics;
  return v2;
}

uint64_t __33__MTMetrics__sharedPublicMetrics__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _sharedPublicMetrics__sharedPublicMetrics;
  _sharedPublicMetrics__sharedPublicMetrics = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)logAlarmAdded:(BOOL)a3
{
  serializer = self->_serializer;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__MTMetrics_logAlarmAdded___block_invoke;
  v4[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v5 = a3;
  [(NAScheduler *)serializer performBlock:v4];
}

uint64_t __27__MTMetrics_logAlarmAdded___block_invoke(uint64_t a1)
{
  uint64_t v1 = kMTMetricSleepAlarmAddKey;
  if (!*(unsigned char *)(a1 + 32)) {
    uint64_t v1 = kMTMetricAlarmAddKey;
  }
  return +[MTAnalytics incrementEventCount:*v1];
}

- (void)logAlarmDeleted:(BOOL)a3
{
  serializer = self->_serializer;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__MTMetrics_logAlarmDeleted___block_invoke;
  v4[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v5 = a3;
  [(NAScheduler *)serializer performBlock:v4];
}

uint64_t __29__MTMetrics_logAlarmDeleted___block_invoke(uint64_t a1)
{
  uint64_t v1 = kMTMetricSleepAlarmDeleteKey;
  if (!*(unsigned char *)(a1 + 32)) {
    uint64_t v1 = kMTMetricAlarmDeleteKey;
  }
  return +[MTAnalytics incrementEventCount:*v1];
}

- (void)logAlarmUpdated:(BOOL)a3
{
  serializer = self->_serializer;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__MTMetrics_logAlarmUpdated___block_invoke;
  v4[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v5 = a3;
  [(NAScheduler *)serializer performBlock:v4];
}

uint64_t __29__MTMetrics_logAlarmUpdated___block_invoke(uint64_t a1)
{
  uint64_t v1 = kMTMetricSleepAlarmUpdateKey;
  if (!*(unsigned char *)(a1 + 32)) {
    uint64_t v1 = kMTMetricAlarmUpdateKey;
  }
  return +[MTAnalytics incrementEventCount:*v1];
}

- (void)logAlarmSnoozeAction:(unint64_t)a3
{
  serializer = self->_serializer;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__MTMetrics_logAlarmSnoozeAction___block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  void v4[4] = a3;
  [(NAScheduler *)serializer performBlock:v4];
}

uint64_t __34__MTMetrics_logAlarmSnoozeAction___block_invoke(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 32);
  if (v1 <= 2) {
    return +[MTAnalytics incrementEventCount:*off_1E5916C58[v1]];
  }
  return result;
}

- (void)logAlarmDismissAction:(unint64_t)a3
{
  serializer = self->_serializer;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__MTMetrics_logAlarmDismissAction___block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  void v4[4] = a3;
  [(NAScheduler *)serializer performBlock:v4];
}

uint64_t __35__MTMetrics_logAlarmDismissAction___block_invoke(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 32);
  if (v1 <= 0xB && ((0xDE7u >> v1) & 1) != 0) {
    return +[MTAnalytics incrementEventCount:*off_1E5916C70[v1]];
  }
  return result;
}

- (void)logTimerAdded
{
}

uint64_t __26__MTMetrics_logTimerAdded__block_invoke()
{
  return +[MTAnalytics incrementEventCount:@"com.apple.MobileTimer.Timer.add"];
}

- (void)logMultipleTimersAdded:(id)a3
{
  id v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__MTMetrics_logMultipleTimersAdded___block_invoke;
  v7[3] = &unk_1E59150A8;
  id v8 = v4;
  id v6 = v4;
  [(NAScheduler *)serializer performBlock:v7];
}

void __36__MTMetrics_logMultipleTimersAdded___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = @"multipleTimersCount";
  v4[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  +[MTAnalytics submitEvent:@"com.apple.MobileTimer.MultipleTimers.running" eventParameters:v2];
}

- (void)logTimerDeleted
{
}

uint64_t __28__MTMetrics_logTimerDeleted__block_invoke()
{
  return +[MTAnalytics incrementEventCount:@"com.apple.MobileTimer.Timer.delete"];
}

- (void)logTimerUpdated
{
}

uint64_t __28__MTMetrics_logTimerUpdated__block_invoke()
{
  return +[MTAnalytics incrementEventCount:@"com.apple.MobileTimer.Timer.update"];
}

- (void)logTimerDismissed
{
}

uint64_t __30__MTMetrics_logTimerDismissed__block_invoke()
{
  return +[MTAnalytics incrementEventCount:@"com.apple.MobileTimer.Timer.dismiss"];
}

- (void)logTimerRepeated
{
}

uint64_t __29__MTMetrics_logTimerRepeated__block_invoke()
{
  return +[MTAnalytics incrementEventCount:@"com.apple.MobileTimer.Timer.repeat"];
}

- (void)logSyncCompleted
{
}

uint64_t __29__MTMetrics_logSyncCompleted__block_invoke()
{
  return +[MTAnalytics incrementEventCount:@"com.apple.MobileTimer.Sync.success"];
}

- (void)logSyncFailedWithError:(id)a3
{
  id v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__MTMetrics_logSyncFailedWithError___block_invoke;
  v7[3] = &unk_1E59150A8;
  id v8 = v4;
  id v6 = v4;
  [(NAScheduler *)serializer performBlock:v7];
}

void __36__MTMetrics_logSyncFailedWithError___block_invoke(uint64_t a1)
{
  +[MTAnalytics incrementEventCount:@"com.apple.MobileTimer.Sync.failure"];
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = NSString;
  uint64_t v3 = [v5 stringValue];
  id v4 = [v2 stringWithFormat:@"%@.%@", @"com.apple.MobileTimer.Sync.Error", v3];

  +[MTAnalytics incrementEventCount:v4];
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end