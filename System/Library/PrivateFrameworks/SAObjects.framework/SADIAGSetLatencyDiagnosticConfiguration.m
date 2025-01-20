@interface SADIAGSetLatencyDiagnosticConfiguration
+ (id)setLatencyDiagnosticConfiguration;
- (BOOL)requiresResponse;
- (NSArray)diagnosticActions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDiagnosticActions:(id)a3;
@end

@implementation SADIAGSetLatencyDiagnosticConfiguration

- (id)groupIdentifier
{
  return @"com.apple.ace.diagnostic";
}

- (id)encodedClassName
{
  return @"SetLatencyDiagnosticConfiguration";
}

+ (id)setLatencyDiagnosticConfiguration
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)diagnosticActions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"diagnosticActions", v3);
}

- (void)setDiagnosticActions:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end