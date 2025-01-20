@interface SADIAGSetLatencyDiagnosticConfigurationDiagnosticAction
+ (id)setLatencyDiagnosticConfigurationDiagnosticAction;
- (NSString)verb;
- (NSURL)uri;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setUri:(id)a3;
- (void)setVerb:(id)a3;
@end

@implementation SADIAGSetLatencyDiagnosticConfigurationDiagnosticAction

- (id)groupIdentifier
{
  return @"com.apple.ace.diagnostic";
}

- (id)encodedClassName
{
  return @"SetLatencyDiagnosticConfigurationDiagnosticAction";
}

+ (id)setLatencyDiagnosticConfigurationDiagnosticAction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)uri
{
  return (NSURL *)AceObjectURLForProperty(self, @"uri");
}

- (void)setUri:(id)a3
{
}

- (NSString)verb
{
  return (NSString *)[(AceObject *)self propertyForKey:@"verb"];
}

- (void)setVerb:(id)a3
{
}

@end