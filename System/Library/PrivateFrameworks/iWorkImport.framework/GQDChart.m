@interface GQDChart
+ (const)stateForReading;
- (id)graphicStyle;
- (id)legend;
- (id)model;
- (id)style;
- (int64_t)type;
- (void)dealloc;
- (void)setLegend:(id)a3;
@end

@implementation GQDChart

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9E670;
}

- (void)dealloc
{
  if (self->mIsLegendRetained) {
  v3.receiver = self;
  }
  v3.super_class = (Class)GQDChart;
  [(GQDGraphic *)&v3 dealloc];
}

- (id)legend
{
  return self->mLegend;
}

- (id)model
{
  return self->mModel;
}

- (id)style
{
  return self->mStyle;
}

- (id)graphicStyle
{
  return self->mStyle;
}

- (int64_t)type
{
  return self->mType;
}

- (void)setLegend:(id)a3
{
  mLegend = self->mLegend;
  if (mLegend && self->mIsLegendRetained) {

  }
  self->mIsLegendRetained = 0;
  self->mLegend = (GQDChartLegend *)a3;
}

@end