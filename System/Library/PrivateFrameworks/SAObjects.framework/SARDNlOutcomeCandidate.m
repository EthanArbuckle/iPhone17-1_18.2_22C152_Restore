@interface SARDNlOutcomeCandidate
+ (id)nlOutcomeCandidate;
- (BOOL)requiresResponse;
- (NSData)nlIntentHierarchyContainerProto;
- (NSString)resultCandidateId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setNlIntentHierarchyContainerProto:(id)a3;
- (void)setResultCandidateId:(id)a3;
@end

@implementation SARDNlOutcomeCandidate

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"NlOutcomeCandidate";
}

+ (id)nlOutcomeCandidate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)nlIntentHierarchyContainerProto
{
  return (NSData *)[(AceObject *)self propertyForKey:@"nlIntentHierarchyContainerProto"];
}

- (void)setNlIntentHierarchyContainerProto:(id)a3
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