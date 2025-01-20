@interface MXSpinTracerData
+ (BOOL)supportsSecureCoding;
- (MXCPUExceptionDiagnostic)cpuExceptionDiagnostic;
- (MXDiskWriteExceptionDiagnostic)diskWriteExceptionDiagnostic;
- (MXSpinTracerData)initWithCoder:(id)a3;
- (id)initPayloadDataWithDiagnostics:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCpuExceptionDiagnostic:(id)a3;
- (void)setDiskWriteExceptionDiagnostic:(id)a3;
@end

@implementation MXSpinTracerData

- (id)initPayloadDataWithDiagnostics:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXSpinTracerData;
  v5 = [(MXSourceData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"cpuExceptionDiagnostics"];
    cpuExceptionDiagnostic = v5->_cpuExceptionDiagnostic;
    v5->_cpuExceptionDiagnostic = (MXCPUExceptionDiagnostic *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"diskWriteExceptionDiagnostics"];
    diskWriteExceptionDiagnostic = v5->_diskWriteExceptionDiagnostic;
    v5->_diskWriteExceptionDiagnostic = (MXDiskWriteExceptionDiagnostic *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  cpuExceptionDiagnostic = self->_cpuExceptionDiagnostic;
  id v5 = a3;
  [v5 encodeObject:cpuExceptionDiagnostic forKey:@"cpuExceptionDiagnostics"];
  [v5 encodeObject:self->_diskWriteExceptionDiagnostic forKey:@"diskWriteExceptionDiagnostics"];
}

- (MXSpinTracerData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXSpinTracerData;
  id v5 = [(MXSourceData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cpuExceptionDiagnostics"];
    cpuExceptionDiagnostic = v5->_cpuExceptionDiagnostic;
    v5->_cpuExceptionDiagnostic = (MXCPUExceptionDiagnostic *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diskWriteExceptionDiagnostics"];
    diskWriteExceptionDiagnostic = v5->_diskWriteExceptionDiagnostic;
    v5->_diskWriteExceptionDiagnostic = (MXDiskWriteExceptionDiagnostic *)v8;
  }
  return v5;
}

- (MXCPUExceptionDiagnostic)cpuExceptionDiagnostic
{
  return (MXCPUExceptionDiagnostic *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCpuExceptionDiagnostic:(id)a3
{
}

- (MXDiskWriteExceptionDiagnostic)diskWriteExceptionDiagnostic
{
  return (MXDiskWriteExceptionDiagnostic *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDiskWriteExceptionDiagnostic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskWriteExceptionDiagnostic, 0);

  objc_storeStrong((id *)&self->_cpuExceptionDiagnostic, 0);
}

@end