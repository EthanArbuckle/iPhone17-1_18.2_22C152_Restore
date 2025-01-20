@interface DKMOpenClosedInterval
- (id)negativeInfinityIntervalString;
- (id)positiveInfinityIntervalString;
- (id)standardIntervalString;
@end

@implementation DKMOpenClosedInterval

- (id)standardIntervalString
{
  return CFSTR("(%@, %@]");
}

- (id)negativeInfinityIntervalString
{
  return @"<=%@";
}

- (id)positiveInfinityIntervalString
{
  return @">%@";
}

@end