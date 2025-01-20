@interface SASStartPronunciationRequest
+ (id)startPronunciationRequest;
- (BOOL)requiresResponse;
- (SASPronunciationContext)context;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContext:(id)a3;
@end

@implementation SASStartPronunciationRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"StartPronunciationRequest";
}

+ (id)startPronunciationRequest
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
  return 1;
}

@end