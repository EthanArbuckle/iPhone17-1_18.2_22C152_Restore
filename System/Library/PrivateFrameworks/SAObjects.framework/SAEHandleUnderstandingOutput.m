@interface SAEHandleUnderstandingOutput
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)policyActionList;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPolicyActionList:(id)a3;
@end

@implementation SAEHandleUnderstandingOutput

- (id)groupIdentifier
{
  return @"com.apple.ace.execution";
}

- (id)encodedClassName
{
  return @"HandleUnderstandingOutput";
}

- (NSArray)policyActionList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"policyActionList", v3);
}

- (void)setPolicyActionList:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end