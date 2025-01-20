@interface SASettingSetFloat
+ (id)setFloat;
- (BOOL)requiresResponse;
- (float)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setValue:(float)a3;
@end

@implementation SASettingSetFloat

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetFloat";
}

+ (id)setFloat
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

- (BOOL)requiresResponse
{
  return 0;
}

@end