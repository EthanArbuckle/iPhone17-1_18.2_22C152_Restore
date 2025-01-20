@interface SAUIPaginateList
- (BOOL)forward;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setForward:(BOOL)a3;
@end

@implementation SAUIPaginateList

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"PaginateList";
}

- (BOOL)forward
{
  return AceObjectBoolForProperty(self, @"forward");
}

- (void)setForward:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end