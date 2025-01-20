@interface SASStartAsrOnServerRequest
- (BOOL)requiresResponse;
- (NSNumber)runCamFtm;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRunCamFtm:(id)a3;
@end

@implementation SASStartAsrOnServerRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"StartAsrOnServerRequest";
}

- (NSNumber)runCamFtm
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"runCamFtm"];
}

- (void)setRunCamFtm:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end