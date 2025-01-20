@interface BSUIReadingGoalsGaugeBox
- (BSUIReadingGoalsGaugeMetrics)readingGoalsGaugeMetrics;
- (Class)layoutClass;
- (TUIConfigurationProviding)configuration;
- (void)setConfiguration:(id)a3;
- (void)setReadingGoalsGaugeMetrics:(id)a3;
@end

@implementation BSUIReadingGoalsGaugeBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (BSUIReadingGoalsGaugeMetrics)readingGoalsGaugeMetrics
{
  return self->_readingGoalsGaugeMetrics;
}

- (void)setReadingGoalsGaugeMetrics:(id)a3
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

  objc_storeStrong((id *)&self->_readingGoalsGaugeMetrics, 0);
}

@end