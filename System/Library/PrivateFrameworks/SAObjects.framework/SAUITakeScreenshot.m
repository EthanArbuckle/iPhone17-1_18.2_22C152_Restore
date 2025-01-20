@interface SAUITakeScreenshot
- (BOOL)requiresResponse;
- (BOOL)shouldHideSiri;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setShouldHideSiri:(BOOL)a3;
@end

@implementation SAUITakeScreenshot

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"TakeScreenshot";
}

- (BOOL)shouldHideSiri
{
  return AceObjectBoolForProperty(self, @"shouldHideSiri");
}

- (void)setShouldHideSiri:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end