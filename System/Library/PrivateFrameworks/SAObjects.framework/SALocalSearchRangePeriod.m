@interface SALocalSearchRangePeriod
+ (id)rangePeriod;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)endSecondsSinceMidnight;
- (int64_t)startSecondsSinceMidnight;
- (void)setEndSecondsSinceMidnight:(int64_t)a3;
- (void)setStartSecondsSinceMidnight:(int64_t)a3;
@end

@implementation SALocalSearchRangePeriod

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"RangePeriod";
}

+ (id)rangePeriod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)endSecondsSinceMidnight
{
  return AceObjectIntegerForProperty(self, @"endSecondsSinceMidnight");
}

- (void)setEndSecondsSinceMidnight:(int64_t)a3
{
}

- (int64_t)startSecondsSinceMidnight
{
  return AceObjectIntegerForProperty(self, @"startSecondsSinceMidnight");
}

- (void)setStartSecondsSinceMidnight:(int64_t)a3
{
}

@end