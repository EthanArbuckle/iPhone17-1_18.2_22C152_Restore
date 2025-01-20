@interface _PASCrashHelper
+ (void)optInCurrentProcessForLogFaultProbabalisticCrashesWithConfig:(id)a3;
+ (void)simulateCrashWithDescription:(id)a3;
@end

@implementation _PASCrashHelper

+ (void)optInCurrentProcessForLogFaultProbabalisticCrashesWithConfig:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"_PASCrashHelper.m", 83, @"Invalid parameter not satisfying: %@", @"config" object file lineNumber description];
  }
  if (+[_PASDeviceInfo isDNUEnabled])
  {
    unsigned int v6 = [v5 oddsNumerator];
    if (v6 > [v5 oddsDenominator])
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, a1, @"_PASCrashHelper.m", 85, @"Invalid parameter not satisfying: %@", @"config.oddsNumerator <= config.oddsDenominator" object file lineNumber description];
    }
    if ([v5 oddsNumerator])
    {
      _PASLogFaultAndProbCrashWindowSize = [v5 uniqueCallsiteWindowSize];
      uint32_t v7 = arc4random_uniform([v5 oddsDenominator]);
      if (v7 < [v5 oddsNumerator])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "_PASLogFaultAndProbCrash will be armed for this process!", buf, 2u);
        }
        atomic_store(1u, _PASLogFaultAndProbCrashArmed);
      }
    }
  }
}

+ (void)simulateCrashWithDescription:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = @"No description";
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v5 = 138412290;
    unsigned int v6 = v4;
    _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Simulating crash, reason: %@", (uint8_t *)&v5, 0xCu);
  }
}

@end