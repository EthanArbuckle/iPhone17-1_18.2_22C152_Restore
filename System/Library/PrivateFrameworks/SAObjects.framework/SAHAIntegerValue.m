@interface SAHAIntegerValue
+ (id)integerValue;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)value;
- (void)setValue:(int64_t)a3;
@end

@implementation SAHAIntegerValue

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"IntegerValue";
}

+ (id)integerValue
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)value
{
  return AceObjectIntegerForProperty(self, @"value");
}

- (void)setValue:(int64_t)a3
{
}

@end