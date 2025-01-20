@interface PLActivityCriterion
- (BOOL)satisfied;
- (PLActivityCriterion)init;
- (PLActivityCriterionDelegate)delegate;
- (void)didCompleteActivity:(id)a3;
- (void)didDisableActivity:(id)a3;
- (void)didEnableActivity:(id)a3;
- (void)didInterruptActivity:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSatisfied:(BOOL)a3;
@end

@implementation PLActivityCriterion

- (void)setSatisfied:(BOOL)a3
{
  if (self->_satisfied != a3)
  {
    BOOL v3 = a3;
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __36__PLActivityCriterion_setSatisfied___block_invoke;
      v15 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v16 = v5;
      if (setSatisfied__defaultOnce != -1) {
        dispatch_once(&setSatisfied__defaultOnce, &block);
      }
      if (setSatisfied__classDebugEnabled)
      {
        v6 = [NSString stringWithFormat:@"PLActivityCriterion::setSatisfied previouslySatisfied=%i, satisfied=%i for criterion=%@", self->_satisfied, v3, self, block, v13, v14, v15, v16];
        v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterion.m"];
        v8 = [v7 lastPathComponent];
        v9 = [NSString stringWithUTF8String:"-[PLActivityCriterion setSatisfied:]"];
        +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:51];

        v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    self->_satisfied = v3;
    v11 = [(PLActivityCriterion *)self delegate];
    [v11 didChangeCriterion:self];
  }
}

- (PLActivityCriterionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLActivityCriterionDelegate *)WeakRetained;
}

- (BOOL)satisfied
{
  return self->_satisfied;
}

- (void)didCompleteActivity:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLActivityCriterion_didCompleteActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didCompleteActivity__defaultOnce != -1) {
      dispatch_once(&didCompleteActivity__defaultOnce, block);
    }
    if (didCompleteActivity__classDebugEnabled)
    {
      v6 = [NSString stringWithFormat:@"PLActivityCriterion::didCompleteActivity:%@ for criterion=%@", v4, self];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterion.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLActivityCriterion didCompleteActivity:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:33];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

- (PLActivityCriterion)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLActivityCriterion;
  result = [(PLActivityCriterion *)&v3 init];
  if (result) {
    result->_satisfied = 0;
  }
  return result;
}

- (void)didEnableActivity:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLActivityCriterion_didEnableActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didEnableActivity__defaultOnce != -1) {
      dispatch_once(&didEnableActivity__defaultOnce, block);
    }
    if (didEnableActivity__classDebugEnabled)
    {
      v6 = [NSString stringWithFormat:@"PLActivityCriterion::didEnableActivity:%@ for criterion=%@", v4, self];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterion.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLActivityCriterion didEnableActivity:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:28];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  [(PLActivityCriterion *)self setDelegate:v4];
}

BOOL __41__PLActivityCriterion_didEnableActivity___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  didEnableActivity__classDebugEnabled = result;
  return result;
}

BOOL __43__PLActivityCriterion_didCompleteActivity___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  didCompleteActivity__classDebugEnabled = result;
  return result;
}

- (void)didInterruptActivity:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLActivityCriterion_didInterruptActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didInterruptActivity__defaultOnce != -1) {
      dispatch_once(&didInterruptActivity__defaultOnce, block);
    }
    if (didInterruptActivity__classDebugEnabled)
    {
      v6 = [NSString stringWithFormat:@"PLActivityCriterion::didInterruptActivity:%@ for criterion=%@", v4, self];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterion.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLActivityCriterion didInterruptActivity:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:37];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __44__PLActivityCriterion_didInterruptActivity___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  didInterruptActivity__classDebugEnabled = result;
  return result;
}

- (void)didDisableActivity:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLActivityCriterion_didDisableActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didDisableActivity__defaultOnce != -1) {
      dispatch_once(&didDisableActivity__defaultOnce, block);
    }
    if (didDisableActivity__classDebugEnabled)
    {
      v6 = [NSString stringWithFormat:@"PLActivityCriterion::didDisableActivity:%@ for criterion=%@", v4, self];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterion.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLActivityCriterion didDisableActivity:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:41];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  self->_satisfied = 0;
  [(PLActivityCriterion *)self setDelegate:0];
}

BOOL __42__PLActivityCriterion_didDisableActivity___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  didDisableActivity__classDebugEnabled = result;
  return result;
}

BOOL __36__PLActivityCriterion_setSatisfied___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  setSatisfied__classDebugEnabled = result;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end