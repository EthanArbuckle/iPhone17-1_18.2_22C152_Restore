@interface SSMetricsImpressionsEvent
- (NSArray)impressionIdentifiers;
- (SSMetricsImpressionsEvent)init;
- (id)description;
- (void)setImpressionIdentifiers:(id)a3;
@end

@implementation SSMetricsImpressionsEvent

- (SSMetricsImpressionsEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSMetricsImpressionsEvent;
  v2 = [(SSMetricsBaseEvent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SSMetricsMutableEvent *)v2 setEventType:@"impressions"];
  }
  return v3;
}

- (NSArray)impressionIdentifiers
{
  return (NSArray *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"impressions"];
}

- (void)setImpressionIdentifiers:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SSMetricsImpressionsEvent;
  v4 = [(SSMetricsBaseEvent *)&v8 description];
  objc_super v5 = [(SSMetricsImpressionsEvent *)self impressionIdentifiers];
  v6 = [v3 stringWithFormat:@"%@: Count: %ld", v4, objc_msgSend(v5, "count")];

  return v6;
}

@end