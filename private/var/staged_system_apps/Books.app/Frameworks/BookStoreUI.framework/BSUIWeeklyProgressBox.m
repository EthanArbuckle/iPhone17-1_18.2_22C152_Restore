@interface BSUIWeeklyProgressBox
- (BSUIWeeklyProgressMetrics)weeklyProgressMetrics;
- (Class)layoutClass;
- (TUIConfigurationProviding)configuration;
- (void)setConfiguration:(id)a3;
- (void)setWeeklyProgressMetrics:(id)a3;
@end

@implementation BSUIWeeklyProgressBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (BSUIWeeklyProgressMetrics)weeklyProgressMetrics
{
  return self->_weeklyProgressMetrics;
}

- (void)setWeeklyProgressMetrics:(id)a3
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

  objc_storeStrong((id *)&self->_weeklyProgressMetrics, 0);
}

@end