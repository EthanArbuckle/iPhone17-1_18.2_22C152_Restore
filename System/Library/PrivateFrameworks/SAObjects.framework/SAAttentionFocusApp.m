@interface SAAttentionFocusApp
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAAttentionFocusApp

- (id)groupIdentifier
{
  return @"com.apple.ace.attention";
}

- (id)encodedClassName
{
  return @"FocusApp";
}

- (BOOL)requiresResponse
{
  return 0;
}

@end