@interface SXAnalyticsReporterProxy
- (SXAnalyticsReporterProxy)initWithAnalyticsReporter:(id)a3;
- (SXAnalyticsReporting)analyticsReporter;
- (void)reportEvent:(id)a3;
@end

@implementation SXAnalyticsReporterProxy

- (SXAnalyticsReporterProxy)initWithAnalyticsReporter:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SXAnalyticsReporterProxy;
  v5 = [(SXAnalyticsReporterProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_analyticsReporter, v4);
  }

  return v6;
}

- (void)reportEvent:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SXAnalyticsLog;
  if (os_log_type_enabled((os_log_t)SXAnalyticsLog, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_222AC5000, v5, OS_LOG_TYPE_DEFAULT, "Reporting analytics event, event=%{public}@", (uint8_t *)&v7, 0xCu);
  }
  v6 = [(SXAnalyticsReporterProxy *)self analyticsReporter];
  [v6 reportEvent:v4];
}

- (SXAnalyticsReporting)analyticsReporter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsReporter);
  return (SXAnalyticsReporting *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end