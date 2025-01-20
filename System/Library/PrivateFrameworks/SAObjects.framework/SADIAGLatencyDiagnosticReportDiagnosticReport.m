@interface SADIAGLatencyDiagnosticReportDiagnosticReport
+ (id)latencyDiagnosticReportDiagnosticReport;
- (NSNumber)latency;
- (NSString)verb;
- (NSURL)uri;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLatency:(id)a3;
- (void)setUri:(id)a3;
- (void)setVerb:(id)a3;
@end

@implementation SADIAGLatencyDiagnosticReportDiagnosticReport

- (id)groupIdentifier
{
  return @"com.apple.ace.diagnostic";
}

- (id)encodedClassName
{
  return @"LatencyDiagnosticReportDiagnosticReport";
}

+ (id)latencyDiagnosticReportDiagnosticReport
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)latency
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"latency"];
}

- (void)setLatency:(id)a3
{
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