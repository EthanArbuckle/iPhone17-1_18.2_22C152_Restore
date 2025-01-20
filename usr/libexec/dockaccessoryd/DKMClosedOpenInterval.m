@interface DKMClosedOpenInterval
- (id)negativeInfinityIntervalString;
- (id)positiveInfinityIntervalString;
- (id)standardIntervalString;
@end

@implementation DKMClosedOpenInterval

- (id)standardIntervalString
{
  return @"[%@, %@");
}

- (id)negativeInfinityIntervalString
{
  return @"<%@";
}

- (id)positiveInfinityIntervalString
{
  return @"%@+";
}

@end