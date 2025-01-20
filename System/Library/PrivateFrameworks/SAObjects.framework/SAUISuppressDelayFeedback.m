@interface SAUISuppressDelayFeedback
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAUISuppressDelayFeedback

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"SuppressDelayFeedback";
}

- (BOOL)requiresResponse
{
  return 0;
}

@end