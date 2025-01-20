@interface SAPhoneCallEmergencySnippet
+ (id)callEmergencySnippet;
- (SAUIColor)bodyBackgroundColor;
- (SAUIColor)bodyTextColor;
- (SAUIColor)headerBackgroundColor;
- (SAUIColor)headerTextColor;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)countDownSeconds;
- (void)setBodyBackgroundColor:(id)a3;
- (void)setBodyTextColor:(id)a3;
- (void)setCountDownSeconds:(int64_t)a3;
- (void)setHeaderBackgroundColor:(id)a3;
- (void)setHeaderTextColor:(id)a3;
@end

@implementation SAPhoneCallEmergencySnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"CallEmergencySnippet";
}

+ (id)callEmergencySnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIColor)bodyBackgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"bodyBackgroundColor");
}

- (void)setBodyBackgroundColor:(id)a3
{
}

- (SAUIColor)bodyTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"bodyTextColor");
}

- (void)setBodyTextColor:(id)a3
{
}

- (int64_t)countDownSeconds
{
  return AceObjectIntegerForProperty(self, @"countDownSeconds");
}

- (void)setCountDownSeconds:(int64_t)a3
{
}

- (SAUIColor)headerBackgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"headerBackgroundColor");
}

- (void)setHeaderBackgroundColor:(id)a3
{
}

- (SAUIColor)headerTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"headerTextColor");
}

- (void)setHeaderTextColor:(id)a3
{
}

@end