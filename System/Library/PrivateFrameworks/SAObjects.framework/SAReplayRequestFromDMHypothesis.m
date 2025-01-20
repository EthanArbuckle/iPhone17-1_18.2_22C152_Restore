@interface SAReplayRequestFromDMHypothesis
- (BOOL)requiresResponse;
- (NSData)dmHypothesis;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDmHypothesis:(id)a3;
@end

@implementation SAReplayRequestFromDMHypothesis

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ReplayRequestFromDMHypothesis";
}

- (NSData)dmHypothesis
{
  return (NSData *)[(AceObject *)self propertyForKey:@"dmHypothesis"];
}

- (void)setDmHypothesis:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end