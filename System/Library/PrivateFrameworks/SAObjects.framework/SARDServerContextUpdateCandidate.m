@interface SARDServerContextUpdateCandidate
- (BOOL)requiresResponse;
- (NSArray)mappedDomainEntities;
- (NSData)nlContextUpdatePayload;
- (NSData)pegasusConversationContext;
- (NSString)resultCandidateId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMappedDomainEntities:(id)a3;
- (void)setNlContextUpdatePayload:(id)a3;
- (void)setPegasusConversationContext:(id)a3;
- (void)setResultCandidateId:(id)a3;
@end

@implementation SARDServerContextUpdateCandidate

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"ServerContextUpdateCandidate";
}

- (NSArray)mappedDomainEntities
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"mappedDomainEntities", v3);
}

- (void)setMappedDomainEntities:(id)a3
{
}

- (NSData)nlContextUpdatePayload
{
  return (NSData *)[(AceObject *)self propertyForKey:@"nlContextUpdatePayload"];
}

- (void)setNlContextUpdatePayload:(id)a3
{
}

- (NSData)pegasusConversationContext
{
  return (NSData *)[(AceObject *)self propertyForKey:@"pegasusConversationContext"];
}

- (void)setPegasusConversationContext:(id)a3
{
}

- (NSString)resultCandidateId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resultCandidateId"];
}

- (void)setResultCandidateId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end