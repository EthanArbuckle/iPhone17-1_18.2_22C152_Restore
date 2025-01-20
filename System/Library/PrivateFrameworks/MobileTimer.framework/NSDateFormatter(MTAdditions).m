@interface NSDateFormatter(MTAdditions)
- (id)stringFromDate:()MTAdditions withRelativeToTimeZone:;
@end

@implementation NSDateFormatter(MTAdditions)

- (id)stringFromDate:()MTAdditions withRelativeToTimeZone:
{
  id v6 = a3;
  uint64_t v7 = [a4 secondsFromGMTForDate:v6];
  v8 = [a1 timeZone];
  double v9 = (double)(v7 - [v8 secondsFromGMTForDate:v6]);

  v10 = [v6 dateByAddingTimeInterval:v9];

  v11 = [a1 stringFromDate:v10];

  return v11;
}

@end