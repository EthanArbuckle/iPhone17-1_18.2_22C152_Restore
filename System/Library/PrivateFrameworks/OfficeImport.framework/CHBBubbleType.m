@interface CHBBubbleType
+ (id)chdChartTypeWithState:(id)a3;
+ (void)xlChartPlotFrom:(id)a3 state:(id)a4;
@end

@implementation CHBBubbleType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3 = a3;
  v4 = [CHDBubbleType alloc];
  v5 = [v3 chart];
  v6 = [(CHDBubbleType *)v4 initWithChart:v5];

  uint64_t v7 = [v3 xlCurrentPlot];
  uint64_t v8 = v7;
  if (v7)
  {
    [(CHDBubbleType *)v6 setBubbleScale:*(unsigned __int16 *)(v7 + 160)];
    [(CHDBubbleType *)v6 setSizeRepresentsRadius:*(_DWORD *)(v8 + 164) == 2];
    [(CHDBubbleType *)v6 setShowNegBubbles:XlChartLegendXn::isLabel((XlChartLegendXn *)(v8 + 144))];
  }

  return v6;
}

+ (void)xlChartPlotFrom:(id)a3 state:(id)a4
{
  id v4 = a3;
  operator new();
}

@end