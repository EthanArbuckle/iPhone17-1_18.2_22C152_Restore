@interface SAHAFloatValue
+ (id)floatValue;
- (float)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setValue:(float)a3;
@end

@implementation SAHAFloatValue

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"FloatValue";
}

+ (id)floatValue
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (float)value
{
  return AceObjectFloatForProperty(self, @"value");
}

- (void)setValue:(float)a3
{
}

@end