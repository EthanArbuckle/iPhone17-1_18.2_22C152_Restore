@interface SAUIHideSiriOverlay
+ (id)hideSiriOverlay;
- (BOOL)hideSnippets;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHideSnippets:(BOOL)a3;
@end

@implementation SAUIHideSiriOverlay

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"HideSiriOverlay";
}

+ (id)hideSiriOverlay
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)hideSnippets
{
  return AceObjectBoolForProperty(self, @"hideSnippets");
}

- (void)setHideSnippets:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end