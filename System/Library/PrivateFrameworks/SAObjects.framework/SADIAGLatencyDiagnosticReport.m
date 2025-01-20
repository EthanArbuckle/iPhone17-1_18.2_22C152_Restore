@interface SADIAGLatencyDiagnosticReport
+ (id)latencyDiagnosticReport;
- (BOOL)requiresResponse;
- (NSArray)diagnosticReports;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDiagnosticReports:(id)a3;
@end

@implementation SADIAGLatencyDiagnosticReport

- (id)groupIdentifier
{
  return @"com.apple.ace.diagnostic";
}

- (id)encodedClassName
{
  return @"LatencyDiagnosticReport";
}

+ (id)latencyDiagnosticReport
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)diagnosticReports
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"diagnosticReports", v3);
}

- (void)setDiagnosticReports:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end