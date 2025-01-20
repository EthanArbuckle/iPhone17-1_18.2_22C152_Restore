@interface SAHABooleanValue
+ (id)BOOLeanValue;
- (BOOL)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setValue:(BOOL)a3;
@end

@implementation SAHABooleanValue

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"BooleanValue";
}

+ (id)BOOLeanValue
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)value
{
  return AceObjectBoolForProperty(self, @"value");
}

- (void)setValue:(BOOL)a3
{
}

@end