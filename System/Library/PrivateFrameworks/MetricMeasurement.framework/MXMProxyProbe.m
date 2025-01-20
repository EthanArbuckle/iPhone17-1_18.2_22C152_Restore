@interface MXMProxyProbe
+ (BOOL)supportsSecureCoding;
- (MXMProxyMetric)proxyMetric;
- (MXMProxyProbe)initWithCoder:(id)a3;
- (MXMProxyProbe)initWithProxyMetric:(id)a3;
- (id)sampleWithTimeout:(double)a3 stopReason:(unint64_t *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)updateNowUntilStoppedWithUpdateHandler:(id)a3 stopHandler:(id)a4;
@end

@implementation MXMProxyProbe

- (MXMProxyProbe)initWithProxyMetric:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMProxyProbe;
  v6 = [(MXMProbe *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proxyMetric, a3);
  }

  return v7;
}

- (MXMProxyProbe)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metric"];

  v6 = [(MXMProxyProbe *)self initWithProxyMetric:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MXMProxyProbe *)self proxyMetric];
  [v4 encodeObject:v5 forKey:@"metric"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateNowUntilStoppedWithUpdateHandler:(id)a3 stopHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF940] exceptionWithName:@"updateNowUntilStoppedWithUpdateHandler:stopHandler: is not implemented on MXMProxyProbe" reason:0 userInfo:0];
  objc_exception_throw(v7);
}

- (id)sampleWithTimeout:(double)a3 stopReason:(unint64_t *)a4
{
  id v7 = +[MXMProxyServiceManager shared];
  v8 = [(MXMProxyProbe *)self proxyMetric];
  objc_super v9 = [v7 _sampleWithProxyMetric:v8 timeout:a4 stopReason:a3];

  return v9;
}

- (MXMProxyMetric)proxyMetric
{
  return (MXMProxyMetric *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
}

@end