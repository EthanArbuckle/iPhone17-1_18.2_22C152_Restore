@interface NSDateComponentsFormatter
+ (id)hoursMinutesSecondsStringWithInterval:(double)a3 forAccessibility:(BOOL)a4;
@end

@implementation NSDateComponentsFormatter

+ (id)hoursMinutesSecondsStringWithInterval:(double)a3 forAccessibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc_init((Class)NSDateComponentsFormatter);
  [v6 setAllowedUnits:224];
  if (v4)
  {
    [v6 setZeroFormattingBehavior:14];
    [v6 setUnitsStyle:3];
  }
  else
  {
    [v6 setZeroFormattingBehavior:0];
    [v6 setZeroFormattingBehavior:0];
  }
  v7 = [v6 stringFromTimeInterval:a3];

  return v7;
}

@end