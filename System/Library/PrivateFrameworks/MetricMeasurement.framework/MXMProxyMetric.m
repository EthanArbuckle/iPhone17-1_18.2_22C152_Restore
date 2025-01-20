@interface MXMProxyMetric
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldAlwaysWrapInProxy;
- (BOOL)_shouldConstructProbe;
- (BOOL)_shouldNeverWrapInProxy;
- (BOOL)prepareWithOptions:(id)a3 error:(id *)a4;
- (MXMMetric)_underlyingMetric;
- (MXMMetric)metric;
- (MXMProbe)_remoteProbe;
- (MXMProxyMetric)initWithCoder:(id)a3;
- (MXMProxyMetric)initWithMetric:(id)a3;
- (id)_constructProbe;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_sampleMode;
- (void)didStartAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 startDate:(id)a5;
- (void)didStartAtTime:(unint64_t)a3 startDate:(id)a4;
- (void)didStopAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 stopDate:(id)a5;
- (void)didStopAtTime:(unint64_t)a3 stopDate:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)willStartAtEstimatedTime:(unint64_t)a3;
- (void)willStop;
@end

@implementation MXMProxyMetric

- (MXMProxyMetric)initWithMetric:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMProxyMetric;
  v5 = [(MXMMetric *)&v9 initWithIdentifier:@"proxy metric" filter:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    underlyingMetric = v5->__underlyingMetric;
    v5->__underlyingMetric = (MXMMetric *)v6;
  }
  return v5;
}

- (MXMMetric)metric
{
  v2 = [(MXMProxyMetric *)self _underlyingMetric];
  v3 = (void *)[v2 copy];

  return (MXMMetric *)v3;
}

- (MXMProbe)_remoteProbe
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(MXMProxyMetric *)self _underlyingMetric];
  id v4 = [v3 _constructProbe];

  v5 = [(MXMProxyMetric *)self _underlyingMetric];
  uint64_t v6 = [v5 filter];
  [v4 setFilter:v6];

  v7 = _MXMGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [(MXMProxyMetric *)self _underlyingMetric];
    objc_super v9 = [v8 filter];
    int v11 = 138412546;
    v12 = v4;
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_21FA7B000, v7, OS_LOG_TYPE_INFO, "Created probe %@ for remote use using filter %@.", (uint8_t *)&v11, 0x16u);
  }
  return (MXMProbe *)v4;
}

- (MXMProxyMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMProxyMetric;
  v5 = [(MXMMetric *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"underlyingMetric"];
    underlyingMetric = v5->__underlyingMetric;
    v5->__underlyingMetric = (MXMMetric *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MXMProxyMetric;
  id v4 = a3;
  [(MXMMetric *)&v6 encodeWithCoder:v4];
  v5 = [(MXMProxyMetric *)self _underlyingMetric];
  [v4 encodeObject:v5 forKey:@"underlyingMetric"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  objc_super v6 = [(MXMProxyMetric *)self _underlyingMetric];
  v7 = (void *)[v6 copyWithZone:a3];
  v8 = (void *)[v5 initWithMetric:v7];

  return v8;
}

- (unint64_t)_sampleMode
{
  id v4 = [(MXMProxyMetric *)self _underlyingMetric];
  char v5 = [v4 _sampleMode];

  if ((v5 & 4) != 0)
  {
    objc_super v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MXMProxyMetric.m" lineNumber:70 description:@"Underlying metric expects continuous mode. This isn't supported"];
  }
  objc_super v6 = [(MXMProxyMetric *)self _underlyingMetric];
  unint64_t v7 = [v6 _sampleMode];

  return v7;
}

- (BOOL)_shouldAlwaysWrapInProxy
{
  return 0;
}

- (BOOL)_shouldNeverWrapInProxy
{
  return 1;
}

- (BOOL)_shouldConstructProbe
{
  return 1;
}

- (id)_constructProbe
{
  v3 = [MXMProxyProbe alloc];
  id v4 = [(MXMMetric *)self copy];
  char v5 = [(MXMProxyProbe *)v3 initWithProxyMetric:v4];

  return v5;
}

- (BOOL)prepareWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MXMProxyMetric;
  if ([(MXMMetric *)&v10 prepareWithOptions:v6 error:a4])
  {
    unint64_t v7 = [(MXMProxyMetric *)self _underlyingMetric];
    char v8 = [v7 prepareWithOptions:v6 error:a4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)willStartAtEstimatedTime:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MXMProxyMetric;
  -[MXMMetric willStartAtEstimatedTime:](&v6, sel_willStartAtEstimatedTime_);
  char v5 = [(MXMProxyMetric *)self _underlyingMetric];
  [v5 willStartAtEstimatedTime:a3];
}

- (void)didStartAtTime:(unint64_t)a3 startDate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MXMProxyMetric;
  id v6 = a4;
  [(MXMMetric *)&v8 didStartAtTime:a3 startDate:v6];
  unint64_t v7 = [(MXMProxyMetric *)self _underlyingMetric];
  [v7 didStartAtTime:a3 startDate:v6];
}

- (void)didStartAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 startDate:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MXMProxyMetric;
  id v8 = a5;
  [(MXMMetric *)&v10 didStartAtContinuousTime:a3 absoluteTime:a4 startDate:v8];
  objc_super v9 = [(MXMProxyMetric *)self _underlyingMetric];
  [v9 didStartAtContinuousTime:a3 absoluteTime:a4 startDate:v8];
}

- (void)willStop
{
  v4.receiver = self;
  v4.super_class = (Class)MXMProxyMetric;
  [(MXMMetric *)&v4 willStop];
  v3 = [(MXMProxyMetric *)self _underlyingMetric];
  [v3 willStop];
}

- (void)didStopAtTime:(unint64_t)a3 stopDate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MXMProxyMetric;
  id v6 = a4;
  [(MXMMetric *)&v8 didStopAtTime:a3 stopDate:v6];
  unint64_t v7 = [(MXMProxyMetric *)self _underlyingMetric];
  [v7 didStopAtTime:a3 stopDate:v6];
}

- (void)didStopAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 stopDate:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MXMProxyMetric;
  id v8 = a5;
  [(MXMMetric *)&v10 didStopAtContinuousTime:a3 absoluteTime:a4 stopDate:v8];
  objc_super v9 = [(MXMProxyMetric *)self _underlyingMetric];
  [v9 didStopAtContinuousTime:a3 absoluteTime:a4 stopDate:v8];
}

- (MXMMetric)_underlyingMetric
{
  return (MXMMetric *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
}

@end