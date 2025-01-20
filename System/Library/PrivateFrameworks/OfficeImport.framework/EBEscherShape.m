@interface EBEscherShape
- (BOOL)showLegend;
- (id)chart;
- (id)chartData;
- (void)setChart:(id)a3;
- (void)setChartData:(id)a3;
- (void)setShowLegend:(BOOL)a3;
@end

@implementation EBEscherShape

- (id)chartData
{
  return self->mChartData;
}

- (void)setChartData:(id)a3
{
}

- (BOOL)showLegend
{
  return self->mShowLegend;
}

- (void)setShowLegend:(BOOL)a3
{
  self->mShowLegend = a3;
}

- (id)chart
{
  return self->mChart;
}

- (void)setChart:(id)a3
{
  v5 = (CHDChart *)a3;
  if (self->mChart != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mChart, a3);
    v5 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChart, 0);
  objc_storeStrong((id *)&self->mChartData, 0);
}

@end