@interface CHBArea2DType
+ (id)chdChartTypeWithState:(id)a3;
+ (void)readWithState:(id)a3 chartType:(id)a4;
@end

@implementation CHBArea2DType

+ (id)chdChartTypeWithState:(id)a3
{
  id v4 = a3;
  v5 = [CHDArea2DType alloc];
  v6 = [v4 chart];
  v7 = [(CHDArea2DType *)v5 initWithChart:v6];

  [a1 readWithState:v4 chartType:v7];
  return v7;
}

+ (void)readWithState:(id)a3 chartType:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = [v9 xlCurrentPlot];
  if (v6)
  {
    v7 = (XlChartArea *)(v6 + 144);
    uint64_t isStacked = XlChartArea::isStacked((XlChartArea *)(v6 + 144));
    +[CHBChartTypeWithGrouping setGrouping:v5 stacked:isStacked categoryPercentage:XlChartArea::isCategoryPercentage(v7)];
  }
}

@end