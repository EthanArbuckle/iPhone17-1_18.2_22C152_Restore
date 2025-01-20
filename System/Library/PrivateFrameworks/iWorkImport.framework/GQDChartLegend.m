@interface GQDChartLegend
+ (const)stateForReading;
- (id)chart;
- (id)graphicStyle;
- (void)dealloc;
@end

@implementation GQDChartLegend

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9E728;
}

- (void)dealloc
{
  if (self->mIsChartRetained) {

  }
  v3.receiver = self;
  v3.super_class = (Class)GQDChartLegend;
  [(GQDGraphic *)&v3 dealloc];
}

- (id)chart
{
  return self->mChart;
}

- (id)graphicStyle
{
  return [(GQDChart *)self->mChart graphicStyle];
}

@end