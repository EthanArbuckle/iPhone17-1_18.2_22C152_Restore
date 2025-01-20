@interface SASSpeechEndpointIdentified
+ (id)speechEndpointIdentified;
- (BOOL)requiresResponse;
- (NSNumber)endpointTimestamp;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEndpointTimestamp:(id)a3;
@end

@implementation SASSpeechEndpointIdentified

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"SpeechEndpointIdentified";
}

+ (id)speechEndpointIdentified
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)endpointTimestamp
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"endpointTimestamp"];
}

- (void)setEndpointTimestamp:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end