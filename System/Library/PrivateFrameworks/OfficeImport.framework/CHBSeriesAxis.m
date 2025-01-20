@interface CHBSeriesAxis
+ (XlChartPlotAxis)writeXlAxisFrom:(id)a3;
+ (id)readFrom:(XlChartPlotAxis *)a3 state:(id)a4;
@end

@implementation CHBSeriesAxis

+ (id)readFrom:(XlChartPlotAxis *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = [CHDSeriesAxis alloc];
    v7 = [v5 resources];
    v8 = [(CHDSeriesAxis *)v6 initWithResources:v7];

    var0 = (__int16 *)a3[1].var0;
    if (var0)
    {
      [(CHDAxis *)v8 setReverseOrder:XlChartCatSerRange::isReverse((XlChartCatSerRange *)a3[1].var0)];
      [(CHDAxis *)v8 setCrossesAt:(double)var0[8]];
      [(CHDAxis *)v8 setCrossBetween:XlChartCatSerRange::isBetween((XlChartCatSerRange *)var0)];
      [(CHDSeriesAxis *)v8 setLabelFrequency:var0[9]];
    }
    var2 = a3[1].var2;
    if (var2)
    {
      if ((XlChartAxCext::isAutoMax((XlChartAxCext *)var2) & 1) == 0) {
        [(CHDAxis *)v8 setScalingMaximum:(double)*((__int16 *)var2 + 9)];
      }
      if ((XlChartAxCext::isAutoMin((XlChartAxCext *)var2) & 1) == 0) {
        [(CHDAxis *)v8 setScalingMinimum:(double)*((__int16 *)var2 + 8)];
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (XlChartPlotAxis)writeXlAxisFrom:(id)a3
{
  id v3 = a3;
  operator new();
}

@end