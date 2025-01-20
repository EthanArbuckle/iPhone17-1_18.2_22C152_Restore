@interface SASettingSetNumber
+ (id)setNumber;
- (BOOL)increment;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIncrement:(BOOL)a3;
@end

@implementation SASettingSetNumber

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetNumber";
}

+ (id)setNumber
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)increment
{
  return AceObjectBoolForProperty(self, @"increment");
}

- (void)setIncrement:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end