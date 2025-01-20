@interface SASMUXStartAsrOnServerRequest
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASMUXStartAsrOnServerRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"MUXStartAsrOnServerRequest";
}

- (BOOL)requiresResponse
{
  return 0;
}

@end