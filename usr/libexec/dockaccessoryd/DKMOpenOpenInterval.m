@interface DKMOpenOpenInterval
- (id)negativeInfinityIntervalString;
- (id)positiveInfinityIntervalString;
- (id)standardIntervalString;
@end

@implementation DKMOpenOpenInterval

- (id)standardIntervalString
{
  return @"(%@, %@)";
}

- (id)negativeInfinityIntervalString
{
  return @"<%@";
}

- (id)positiveInfinityIntervalString
{
  return @">%@";
}

@end