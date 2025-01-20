@interface MXReportCrashData
+ (BOOL)supportsSecureCoding;
- (MXCrashDiagnostic)crashDiagnostic;
- (MXReportCrashData)initWithCoder:(id)a3;
- (id)initPayloadDataWithDiagnostics:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCrashDiagnostic:(id)a3;
@end

@implementation MXReportCrashData

- (id)initPayloadDataWithDiagnostics:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXReportCrashData;
  v5 = [(MXSourceData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"crashDiagnostic"];
    crashDiagnostic = v5->_crashDiagnostic;
    v5->_crashDiagnostic = (MXCrashDiagnostic *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MXReportCrashData)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXReportCrashData;
  v5 = [(MXSourceData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"crashDiagnostic"];
    crashDiagnostic = v5->_crashDiagnostic;
    v5->_crashDiagnostic = (MXCrashDiagnostic *)v6;
  }
  return v5;
}

- (MXCrashDiagnostic)crashDiagnostic
{
  return (MXCrashDiagnostic *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCrashDiagnostic:(id)a3
{
}

- (void).cxx_destruct
{
}

@end