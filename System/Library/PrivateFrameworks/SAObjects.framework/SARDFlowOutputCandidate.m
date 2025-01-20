@interface SARDFlowOutputCandidate
- (BOOL)requiresResponse;
- (BOOL)shouldNotMitigateAsFalseTrigger;
- (NSArray)payload;
- (NSString)resultCandidateId;
- (SARDServerContextUpdateCandidate)serverContextUpdateCandidate;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPayload:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setServerContextUpdateCandidate:(id)a3;
- (void)setShouldNotMitigateAsFalseTrigger:(BOOL)a3;
@end

@implementation SARDFlowOutputCandidate

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"FlowOutputCandidate";
}

- (NSArray)payload
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"payload", &unk_1EFD73568);
}

- (void)setPayload:(id)a3
{
}

- (NSString)resultCandidateId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resultCandidateId"];
}

- (void)setResultCandidateId:(id)a3
{
}

- (SARDServerContextUpdateCandidate)serverContextUpdateCandidate
{
  return (SARDServerContextUpdateCandidate *)AceObjectAceObjectForProperty(self, @"serverContextUpdateCandidate");
}

- (void)setServerContextUpdateCandidate:(id)a3
{
}

- (BOOL)shouldNotMitigateAsFalseTrigger
{
  return AceObjectBoolForProperty(self, @"shouldNotMitigateAsFalseTrigger");
}

- (void)setShouldNotMitigateAsFalseTrigger:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end