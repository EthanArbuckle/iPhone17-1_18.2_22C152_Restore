@interface SAUIColor
+ (id)color;
- (NSNumber)alpha;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)blueValue;
- (int64_t)greenValue;
- (int64_t)redValue;
- (void)setAlpha:(id)a3;
- (void)setBlueValue:(int64_t)a3;
- (void)setGreenValue:(int64_t)a3;
- (void)setRedValue:(int64_t)a3;
@end

@implementation SAUIColor

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"Color";
}

+ (id)color
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)alpha
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"alpha"];
}

- (void)setAlpha:(id)a3
{
}

- (int64_t)blueValue
{
  return AceObjectIntegerForProperty(self, @"blueValue");
}

- (void)setBlueValue:(int64_t)a3
{
}

- (int64_t)greenValue
{
  return AceObjectIntegerForProperty(self, @"greenValue");
}

- (void)setGreenValue:(int64_t)a3
{
}

- (int64_t)redValue
{
  return AceObjectIntegerForProperty(self, @"redValue");
}

- (void)setRedValue:(int64_t)a3
{
}

@end