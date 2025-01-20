@interface TUEligibilityChecker
+ (BOOL)isCallRecordingEligible;
+ (void)isCallRecordingEligible;
@end

@implementation TUEligibilityChecker

+ (BOOL)isCallRecordingEligible
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int domain_answer = os_eligibility_get_domain_answer();
  v3 = TUDefaultLog();
  v4 = v3;
  if (domain_answer)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[TUEligibilityChecker isCallRecordingEligible];
    }

    return 0;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = 0;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "os_eligibility for OS_ELIGIBILITY_DOMAIN_NICKEL: %llu", buf, 0xCu);
    }

    return 0;
  }
}

+ (void)isCallRecordingEligible
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "os_eligibility_get_domain_answer failed with error %d", (uint8_t *)v2, 8u);
}

@end