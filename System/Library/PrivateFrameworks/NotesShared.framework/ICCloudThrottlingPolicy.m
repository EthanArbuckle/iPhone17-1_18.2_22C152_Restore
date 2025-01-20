@interface ICCloudThrottlingPolicy
+ (void)resetSavedPolicyState;
- (ICCloudThrottlingLevel)currentLevel;
- (ICCloudThrottlingPolicy)init;
- (ICCloudThrottlingPolicy)initWithThrottlingLevels:(id)a3 resetInterval:(double)a4;
- (NSArray)throttlingLevels;
- (NSDate)policyStartDate;
- (NSTimer)policyResetTimer;
- (double)batchInterval;
- (double)maximumBatchIntervalFactor;
- (double)resetInterval;
- (unint64_t)currentBatchCount;
- (unint64_t)currentLevelIndex;
- (void)changeLevelIfNecessary;
- (void)dealloc;
- (void)incrementBatchCount;
- (void)loadSavedPolicyState;
- (void)resetPolicy;
- (void)savePolicyState;
- (void)setCurrentBatchCount:(unint64_t)a3;
- (void)setCurrentLevelIndex:(unint64_t)a3;
- (void)setPolicyResetTimer:(id)a3;
- (void)setPolicyStartDate:(id)a3;
- (void)setResetInterval:(double)a3;
- (void)setThrottlingLevels:(id)a3;
- (void)startPolicyResetTimer;
@end

@implementation ICCloudThrottlingPolicy

- (void)loadSavedPolicyState
{
  v3 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  v4 = [v3 objectForKey:@"ThrottlingPolicyCurrentBatchCount"];
  -[ICCloudThrottlingPolicy setCurrentBatchCount:](self, "setCurrentBatchCount:", [v4 unsignedIntegerValue]);

  v5 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  v6 = [v5 objectForKey:@"ThrottlingPolicyCurrentLevelIndex"];
  -[ICCloudThrottlingPolicy setCurrentLevelIndex:](self, "setCurrentLevelIndex:", [v6 unsignedIntegerValue]);

  v7 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v7 doubleForKey:@"ThrottlingPolicyStartTime"];
  double v9 = v8;

  if (v9 == 0.0) {
    [MEMORY[0x1E4F1C9C8] date];
  }
  else {
  v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v9];
  }
  [(ICCloudThrottlingPolicy *)self setPolicyStartDate:v10];

  v11 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudThrottlingPolicy loadSavedPolicyState](self);
  }
}

- (double)maximumBatchIntervalFactor
{
  v2 = [(ICCloudThrottlingPolicy *)self currentLevel];
  [v2 maximumBatchIntervalFactor];
  double v4 = v3;

  return v4;
}

- (double)batchInterval
{
  v2 = [(ICCloudThrottlingPolicy *)self currentLevel];
  [v2 batchInterval];
  double v4 = v3;

  return v4;
}

- (ICCloudThrottlingLevel)currentLevel
{
  unint64_t v3 = [(ICCloudThrottlingPolicy *)self currentLevelIndex];
  double v4 = [(ICCloudThrottlingPolicy *)self throttlingLevels];
  unint64_t v5 = [v4 count] - 1;

  if (v3 >= v5) {
    unint64_t v3 = v5;
  }
  v6 = [(ICCloudThrottlingPolicy *)self throttlingLevels];
  v7 = [v6 objectAtIndexedSubscript:v3];

  return (ICCloudThrottlingLevel *)v7;
}

- (NSArray)throttlingLevels
{
  return self->_throttlingLevels;
}

- (unint64_t)currentLevelIndex
{
  return self->_currentLevelIndex;
}

- (void)setPolicyStartDate:(id)a3
{
}

- (void)setCurrentLevelIndex:(unint64_t)a3
{
  self->_currentLevelIndex = a3;
}

- (void)setCurrentBatchCount:(unint64_t)a3
{
  self->_currentBatchCount = a3;
}

void __48__ICCloudThrottlingPolicy_startPolicyResetTimer__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) policyResetTimer];
  int v3 = [v2 isValid];

  if (v3)
  {
    double v4 = [*(id *)(a1 + 32) policyResetTimer];
    [v4 invalidate];

    [*(id *)(a1 + 32) setPolicyResetTimer:0];
  }
  unint64_t v5 = [*(id *)(a1 + 32) policyStartDate];
  [*(id *)(a1 + 32) resetInterval];
  objc_msgSend(v5, "dateByAddingTimeInterval:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E4F1CB00];
  [v8 timeIntervalSinceNow];
  v7 = objc_msgSend(v6, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(void *)(a1 + 32), sel_resetPolicy, 0, 0);
  [*(id *)(a1 + 32) setPolicyResetTimer:v7];
}

- (void)setPolicyResetTimer:(id)a3
{
}

- (NSTimer)policyResetTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 48, 1);
}

- (ICCloudThrottlingPolicy)initWithThrottlingLevels:(id)a3 resetInterval:(double)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICCloudThrottlingPolicy;
  v7 = [(ICCloudThrottlingPolicy *)&v17 init];
  id v8 = v7;
  if (v7)
  {
    [(ICCloudThrottlingPolicy *)v7 setThrottlingLevels:v6];
    [(ICCloudThrottlingPolicy *)v8 setResetInterval:a4];
    [(ICCloudThrottlingPolicy *)v8 loadSavedPolicyState];
    double v9 = [(ICCloudThrottlingPolicy *)v8 policyStartDate];
    [v9 timeIntervalSinceNow];
    double v11 = -v10;
    [(ICCloudThrottlingPolicy *)v8 resetInterval];
    double v13 = v12;

    if (v13 < v11)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__ICCloudThrottlingPolicy_initWithThrottlingLevels_resetInterval___block_invoke;
      block[3] = &unk_1E64A4240;
      v16 = v8;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    [(ICCloudThrottlingPolicy *)v8 startPolicyResetTimer];
  }

  return v8;
}

- (double)resetInterval
{
  return self->_resetInterval;
}

- (NSDate)policyStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)startPolicyResetTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ICCloudThrottlingPolicy_startPolicyResetTimer__block_invoke;
  block[3] = &unk_1E64A4240;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)setThrottlingLevels:(id)a3
{
}

- (void)setResetInterval:(double)a3
{
  self->_resetInterval = a3;
}

- (ICCloudThrottlingPolicy)init
{
  return 0;
}

uint64_t __66__ICCloudThrottlingPolicy_initWithThrottlingLevels_resetInterval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetPolicy];
}

- (void)dealloc
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  v7 = __34__ICCloudThrottlingPolicy_dealloc__block_invoke;
  id v8 = &unk_1E64A4240;
  double v9 = self;
  performBlockOnMainThreadAndWait();
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICCloudThrottlingPolicy;
  [(ICCloudThrottlingPolicy *)&v4 dealloc];
}

uint64_t __34__ICCloudThrottlingPolicy_dealloc__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) policyResetTimer];
  [v2 invalidate];

  int v3 = *(void **)(a1 + 32);
  return [v3 setPolicyResetTimer:0];
}

- (void)incrementBatchCount
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v6 = [a1 currentBatchCount];
  int v7 = [a1 currentLevelIndex] + 1;
  id v8 = [a1 throttlingLevels];
  int v9 = [v8 count];
  double v10 = [a1 currentLevel];
  v11[0] = 67110146;
  v11[1] = v6;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  __int16 v14 = 1024;
  int v15 = v7;
  __int16 v16 = 1024;
  int v17 = v9;
  __int16 v18 = 2112;
  v19 = v10;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Processing cloud batch (%d of %@) in throttling level (%d of %d): %@", (uint8_t *)v11, 0x28u);
}

uint64_t __46__ICCloudThrottlingPolicy_incrementBatchCount__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) savePolicyState];
}

- (void)changeLevelIfNecessary
{
  [a1 currentLevelIndex];
  v2 = [a1 throttlingLevels];
  [v2 count];
  int v3 = [a1 currentLevel];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_4(&dword_1C3A61000, v4, v5, "Switching to cloud throttling level (%d of %d): %@", v6, v7, v8, v9, v10);
}

- (void)resetPolicy
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 currentLevel];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Resetting cloud throttling policy to the first level: %@", (uint8_t *)&v4, 0xCu);
}

uint64_t __38__ICCloudThrottlingPolicy_resetPolicy__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) savePolicyState];
}

+ (void)resetSavedPolicyState
{
  v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v2 removeObjectForKey:@"ThrottlingPolicyCurrentBatchCount"];

  int v3 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v3 removeObjectForKey:@"ThrottlingPolicyCurrentLevelIndex"];

  id v4 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v4 removeObjectForKey:@"ThrottlingPolicyStartTime"];
}

- (void)savePolicyState
{
  int v3 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICCloudThrottlingPolicy currentBatchCount](self, "currentBatchCount"));
  [v3 setObject:v4 forKey:@"ThrottlingPolicyCurrentBatchCount"];

  uint64_t v5 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICCloudThrottlingPolicy currentLevelIndex](self, "currentLevelIndex"));
  [v5 setObject:v6 forKey:@"ThrottlingPolicyCurrentLevelIndex"];

  id v8 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  uint64_t v7 = [(ICCloudThrottlingPolicy *)self policyStartDate];
  [v7 timeIntervalSinceReferenceDate];
  objc_msgSend(v8, "setDouble:forKey:", @"ThrottlingPolicyStartTime");
}

- (unint64_t)currentBatchCount
{
  return self->_currentBatchCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyResetTimer, 0);
  objc_storeStrong((id *)&self->_policyStartDate, 0);
  objc_storeStrong((id *)&self->_throttlingLevels, 0);
}

@end