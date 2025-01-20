@interface NSDate(ThreeBars)
- (id)dateByAddingDays:()ThreeBars;
@end

@implementation NSDate(ThreeBars)

- (id)dateByAddingDays:()ThreeBars
{
  v5 = (void *)MEMORY[0x1D9440170]();
  v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v7 = [v6 components:28 fromDate:a1];
  v8 = [v6 dateFromComponents:v7];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v9 setDay:a3];
  v10 = [v6 dateByAddingComponents:v9 toDate:v8 options:0];

  return v10;
}

@end