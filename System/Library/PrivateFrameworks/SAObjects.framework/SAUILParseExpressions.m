@interface SAUILParseExpressions
+ (id)parseExpressions;
- (BOOL)requiresResponse;
- (NSArray)expressions;
- (SARemoteDevice)targetDevice;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setExpressions:(id)a3;
- (void)setTargetDevice:(id)a3;
@end

@implementation SAUILParseExpressions

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.lite";
}

- (id)encodedClassName
{
  return @"ParseExpressions";
}

+ (id)parseExpressions
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)expressions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"expressions", v3);
}

- (void)setExpressions:(id)a3
{
}

- (SARemoteDevice)targetDevice
{
  return (SARemoteDevice *)AceObjectAceObjectForProperty(self, @"targetDevice");
}

- (void)setTargetDevice:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end