@interface WFTimeOfDayTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
- (uint64_t)needsRegistrationAfterFiring;
@end

@implementation WFTimeOfDayTrigger(CoreDuetContext)

- (uint64_t)needsRegistrationAfterFiring
{
  return 1;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (id)contextStorePredicate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5B6A8] userContext];
  v3 = [MEMORY[0x1E4F5B6B8] keyPathForSunriseSunsetDataDictionary];
  v4 = [v2 objectForKeyedSubscript:v3];

  v5 = [MEMORY[0x1E4F5B6B8] currentSunriseKey];
  v6 = [v4 objectForKey:v5];

  v7 = [MEMORY[0x1E4F5B6B8] currentSunsetKey];
  v8 = [v4 objectForKey:v7];

  v9 = [MEMORY[0x1E4FB7350] nextFireDateFromNowWithTrigger:a1 currentSunriseTime:v6 currentSunsetTime:v8];
  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 duration:300.0];
    v11 = [MEMORY[0x1E4F5B6B8] predicateForSystemTimeInInterval:v10];
  }
  else
  {
    v12 = getWFTriggersLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      v15 = "-[WFTimeOfDayTrigger(CoreDuetContext) contextStorePredicate]";
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_ERROR, "%s Could not create predicate for WFTimeOfDayTrigger because next fire date was nil", (uint8_t *)&v14, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForSystemTime];
}

@end