@interface NSDateInterval(MTUtilities)
+ (id)mtDateIntervalWithEndDate:()MTUtilities duration:;
- (uint64_t)mtContainsDate:()MTUtilities;
@end

@implementation NSDateInterval(MTUtilities)

- (uint64_t)mtContainsDate:()MTUtilities
{
  id v4 = a3;
  v5 = [a1 startDate];
  if ([v5 isEqualToDate:v4])
  {
    uint64_t v6 = 1;
  }
  else
  {
    v7 = [a1 endDate];
    if ([v7 isEqualToDate:v4]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = [a1 containsDate:v4];
    }
  }
  return v6;
}

+ (id)mtDateIntervalWithEndDate:()MTUtilities duration:
{
  v5 = (objc_class *)MEMORY[0x1E4F28C18];
  id v6 = a4;
  id v7 = [v5 alloc];
  v8 = [v6 dateByAddingTimeInterval:-a1];
  v9 = (void *)[v7 initWithStartDate:v8 endDate:v6];

  return v9;
}

@end