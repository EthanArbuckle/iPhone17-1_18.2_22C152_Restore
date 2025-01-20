@interface SASSpeechServerEndpointIdentified
+ (id)speechServerEndpointIdentified;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASSpeechServerEndpointIdentified

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"SpeechServerEndpointIdentified";
}

+ (id)speechServerEndpointIdentified
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end