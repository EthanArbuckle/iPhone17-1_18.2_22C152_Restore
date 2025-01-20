@interface SASettingNumericSnippet
+ (id)numericSnippet;
- (BOOL)increment;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIncrement:(BOOL)a3;
@end

@implementation SASettingNumericSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"NumericSnippet";
}

+ (id)numericSnippet
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

@end