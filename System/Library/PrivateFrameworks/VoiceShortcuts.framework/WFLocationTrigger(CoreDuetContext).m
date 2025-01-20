@interface WFLocationTrigger(CoreDuetContext)
- (uint64_t)shouldFireTriggerWithEventInfo:()CoreDuetContext error:;
@end

@implementation WFLocationTrigger(CoreDuetContext)

- (uint64_t)shouldFireTriggerWithEventInfo:()CoreDuetContext error:
{
  uint64_t v2 = [a1 startTime];
  if (!v2) {
    return 1;
  }
  v3 = (void *)v2;
  v4 = [a1 endTime];

  if (!v4) {
    return 1;
  }
  v5 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v6 = [a1 isDateWithinTimeRange:v5];

  return v6;
}

@end