@interface SASMUXResultCandidate
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSDictionary)resultCandidates;
- (NSString)rcID;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRcID:(id)a3;
- (void)setResultCandidates:(id)a3;
@end

@implementation SASMUXResultCandidate

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"MUXResultCandidate";
}

- (NSString)rcID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"rcID"];
}

- (void)setRcID:(id)a3
{
}

- (NSDictionary)resultCandidates
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"resultCandidates", v3);
}

- (void)setResultCandidates:(id)a3
{
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