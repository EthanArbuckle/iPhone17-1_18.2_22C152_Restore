@interface SAUIClearScreen
+ (id)clearScreen;
- (BOOL)requiresResponse;
- (SAAceView)initialView;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInitialView:(id)a3;
@end

@implementation SAUIClearScreen

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ClearScreen";
}

+ (id)clearScreen
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAAceView)initialView
{
  return (SAAceView *)AceObjectAceObjectForProperty(self, @"initialView");
}

- (void)setInitialView:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end