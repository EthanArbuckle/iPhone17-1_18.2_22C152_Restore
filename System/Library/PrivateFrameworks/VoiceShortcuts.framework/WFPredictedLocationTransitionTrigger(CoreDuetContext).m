@interface WFPredictedLocationTransitionTrigger(CoreDuetContext)
- (double)timeIntervalLowerBound;
- (double)timeIntervalUpperBound;
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFPredictedLocationTransitionTrigger(CoreDuetContext)

- (double)timeIntervalLowerBound
{
  uint64_t v1 = [a1 minutesBefore];
  if ((unint64_t)(v1 - 1) > 4) {
    return -60.0;
  }
  else {
    return dbl_1C7EBA5F8[v1 - 1];
  }
}

- (double)timeIntervalUpperBound
{
  uint64_t v1 = [a1 minutesBefore];
  if ((unint64_t)(v1 - 1) > 4) {
    return 60.0;
  }
  else {
    return dbl_1C7EBA5D0[v1 - 1];
  }
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (id)contextStorePredicate
{
  BOOL v2 = [a1 destinationType] == 1;
  v3 = [a1 contextStoreKeyPathForCurrentState];
  v4 = (void *)MEMORY[0x1E4F5B6E8];
  v5 = [MEMORY[0x1E4F5B6B8] locationOfInterestTypeKey];
  v6 = [NSNumber numberWithInteger:v2];
  v7 = [MEMORY[0x1E4F5B6B8] transitionWithinTimeIntervalKey];
  v8 = NSNumber;
  [a1 timeIntervalUpperBound];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v10 = [MEMORY[0x1E4F5B6B8] transitionWithinTimeIntervalKey];
  v11 = NSNumber;
  [a1 timeIntervalLowerBound];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  v13 = [v4 predicateForKeyPath:v3, @"SUBQUERY(SELF.%@.value, $prediction, $prediction.%K = %@ AND $prediction.%K <= %@ AND $prediction.%K > %@).@count > 0", v3, v5, v6, v7, v9, v10, v12 withFormat];

  return v13;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForPredictedLocationOfInterestTransitions];
}

@end