@interface CHBBar2DType
+ (id)chdChartTypeWithState:(id)a3;
+ (void)readWithState:(id)a3 chartType:(id)a4;
@end

@implementation CHBBar2DType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3 = a3;
  v4 = [CHDBar2DType alloc];
  v5 = [v3 chart];
  v6 = [(CHDBar2DType *)v4 initWithChart:v5];

  +[CHBBar2DType readWithState:v3 chartType:v6];
  return v6;
}

+ (void)readWithState:(id)a3 chartType:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  uint64_t v6 = [v10 xlCurrentPlot];
  uint64_t v7 = v6;
  if (v6)
  {
    [v5 setOverlap:*(__int16 *)(v6 + 160)];
    [v5 setGapWidth:*(__int16 *)(v7 + 162)];
    v8 = (XlChartBar *)(v7 + 144);
    [v5 setColumn:XlChartBar::isTranspose(v8) ^ 1];
    uint64_t isStacked = XlChartBar::isStacked(v8);
    +[CHBChartTypeWithGrouping setGrouping:v5 stacked:isStacked categoryPercentage:XlChartBar::isCategoryPercentage(v8)];
  }
}

@end