@interface SARDResultCandidateSelected
+ (id)resultCandidateSelected;
- (BOOL)requiresResponse;
- (BOOL)serverFallback;
- (NSString)selectedResultCandidateId;
- (SARDNativeFlowContextUpdate)nativeFlowContextUpdate;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setNativeFlowContextUpdate:(id)a3;
- (void)setSelectedResultCandidateId:(id)a3;
- (void)setServerFallback:(BOOL)a3;
@end

@implementation SARDResultCandidateSelected

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"ResultCandidateSelected";
}

+ (id)resultCandidateSelected
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SARDNativeFlowContextUpdate)nativeFlowContextUpdate
{
  return (SARDNativeFlowContextUpdate *)AceObjectAceObjectForProperty(self, @"nativeFlowContextUpdate");
}

- (void)setNativeFlowContextUpdate:(id)a3
{
}

- (NSString)selectedResultCandidateId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"selectedResultCandidateId"];
}

- (void)setSelectedResultCandidateId:(id)a3
{
}

- (BOOL)serverFallback
{
  return AceObjectBoolForProperty(self, @"serverFallback");
}

- (void)setServerFallback:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end