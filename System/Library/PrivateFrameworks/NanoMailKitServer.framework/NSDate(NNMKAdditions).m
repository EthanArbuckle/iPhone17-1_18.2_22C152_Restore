@interface NSDate(NNMKAdditions)
+ (id)nnmk_startOfCurrentDay;
- (BOOL)nnmk_isToday;
@end

@implementation NSDate(NNMKAdditions)

+ (id)nnmk_startOfCurrentDay
{
  v0 = [MEMORY[0x263EFF8F0] currentCalendar];
  v1 = [MEMORY[0x263EFF910] date];
  v2 = [v0 components:252 fromDate:v1];

  [v2 setHour:0];
  [v2 setMinute:0];
  [v2 setSecond:0];
  v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  v4 = [v3 dateFromComponents:v2];

  return v4;
}

- (BOOL)nnmk_isToday
{
  v2 = objc_msgSend(MEMORY[0x263EFF910], "nnmk_startOfCurrentDay");
  BOOL v3 = [a1 compare:v2] != -1;

  return v3;
}

@end