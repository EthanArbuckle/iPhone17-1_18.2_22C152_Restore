@interface DKMClosedClosedInterval
- (id)negativeInfinityIntervalString;
- (id)positiveInfinityIntervalString;
- (id)standardIntervalString;
@end

@implementation DKMClosedClosedInterval

- (id)standardIntervalString
{
  return @"[%@, %@]";
}

- (id)negativeInfinityIntervalString
{
  return @"<=%@";
}

- (id)positiveInfinityIntervalString
{
  return @"%@+";
}

@end