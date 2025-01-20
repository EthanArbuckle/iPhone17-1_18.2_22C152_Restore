@interface SAEHandleUnderstandingOutputCompleted
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAEHandleUnderstandingOutputCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.execution";
}

- (id)encodedClassName
{
  return @"HandleUnderstandingOutputCompleted";
}

- (BOOL)requiresResponse
{
  return 0;
}

@end