@interface SASettingSetBool
+ (id)setBool;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (BOOL)toggle;
- (BOOL)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setToggle:(BOOL)a3;
- (void)setValue:(BOOL)a3;
@end

@implementation SASettingSetBool

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetBool";
}

+ (id)setBool
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)toggle
{
  return AceObjectBoolForProperty(self, @"toggle");
}

- (void)setToggle:(BOOL)a3
{
}

- (BOOL)value
{
  return AceObjectBoolForProperty(self, @"value");
}

- (void)setValue:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end