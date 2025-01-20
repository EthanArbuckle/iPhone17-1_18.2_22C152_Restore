@interface BSUIDailyReadingBox
- (BSUIDailyReadingMetrics)dailyReadingMetrics;
- (Class)layoutClass;
- (TUIConfigurationProviding)configuration;
- (void)setConfiguration:(id)a3;
- (void)setDailyReadingMetrics:(id)a3;
@end

@implementation BSUIDailyReadingBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (BSUIDailyReadingMetrics)dailyReadingMetrics
{
  return self->_dailyReadingMetrics;
}

- (void)setDailyReadingMetrics:(id)a3
{
}

- (TUIConfigurationProviding)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_dailyReadingMetrics, 0);
}

@end