@interface SADirectInvocationUpdateReadingState
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SADirectInvocationUpdateReadingState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DirectInvocationUpdateReadingState";
}

- (BOOL)requiresResponse
{
  return 0;
}

@end