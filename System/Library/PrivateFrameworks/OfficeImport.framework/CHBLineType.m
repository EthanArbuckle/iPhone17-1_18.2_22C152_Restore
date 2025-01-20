@interface CHBLineType
+ (void)readWithState:(id)a3 chartType:(id)a4;
@end

@implementation CHBLineType

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