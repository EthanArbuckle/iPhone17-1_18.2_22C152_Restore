@interface SAUIListenForPronunciation
+ (id)listenForPronunciation;
- (BOOL)requiresResponse;
- (SASPronunciationContext)context;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContext:(id)a3;
@end

@implementation SAUIListenForPronunciation

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ListenForPronunciation";
}

+ (id)listenForPronunciation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASPronunciationContext)context
{
  return (SASPronunciationContext *)AceObjectAceObjectForProperty(self, @"context");
}

- (void)setContext:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end