@interface MXHangTracerData
+ (BOOL)supportsSecureCoding;
- (MXAppLaunchDiagnostic)appLaunchDiagnostic;
- (MXHangDiagnostic)hangDiagnostic;
- (MXHangTracerData)initWithCoder:(id)a3;
- (id)initPayloadDataWithDiagnostics:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppLaunchDiagnostic:(id)a3;
- (void)setHangDiagnostic:(id)a3;
@end

@implementation MXHangTracerData

- (id)initPayloadDataWithDiagnostics:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXHangTracerData;
  v5 = [(MXSourceData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"hangDiagnostic"];
    hangDiagnostic = v5->_hangDiagnostic;
    v5->_hangDiagnostic = (MXHangDiagnostic *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"appLaunchDiagnostic"];
    appLaunchDiagnostic = v5->_appLaunchDiagnostic;
    v5->_appLaunchDiagnostic = (MXAppLaunchDiagnostic *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  hangDiagnostic = self->_hangDiagnostic;
  id v5 = a3;
  [v5 encodeObject:hangDiagnostic forKey:@"hangDiagnostic"];
  [v5 encodeObject:self->_appLaunchDiagnostic forKey:@"appLaunchDiagnostic"];
}

- (MXHangTracerData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXHangTracerData;
  id v5 = [(MXSourceData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hangDiagnostic"];
    hangDiagnostic = v5->_hangDiagnostic;
    v5->_hangDiagnostic = (MXHangDiagnostic *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appLaunchDiagnostic"];
    appLaunchDiagnostic = v5->_appLaunchDiagnostic;
    v5->_appLaunchDiagnostic = (MXAppLaunchDiagnostic *)v8;
  }
  return v5;
}

- (MXHangDiagnostic)hangDiagnostic
{
  return (MXHangDiagnostic *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHangDiagnostic:(id)a3
{
}

- (MXAppLaunchDiagnostic)appLaunchDiagnostic
{
  return (MXAppLaunchDiagnostic *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAppLaunchDiagnostic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchDiagnostic, 0);

  objc_storeStrong((id *)&self->_hangDiagnostic, 0);
}

@end