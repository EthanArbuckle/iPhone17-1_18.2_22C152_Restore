@interface NSDate
- (id)iso8601String;
- (int64_t)absoluteDay;
@end

@implementation NSDate

- (id)iso8601String
{
  v3 = +[NSDateFormatter ISO8601Formatter];
  v4 = [v3 stringFromDate:self];

  return v4;
}

- (int64_t)absoluteDay
{
  [(NSDate *)self timeIntervalSinceReferenceDate];
  return (uint64_t)(v2 / 86400.0);
}

@end