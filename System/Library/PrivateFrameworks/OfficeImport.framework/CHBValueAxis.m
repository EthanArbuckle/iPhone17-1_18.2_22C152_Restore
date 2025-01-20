@interface CHBValueAxis
+ (XlChartPlotAxis)writeXlAxisFrom:(id)a3;
+ (id)readFrom:(XlChartPlotAxis *)a3 state:(id)a4;
@end

@implementation CHBValueAxis

+ (id)readFrom:(XlChartPlotAxis *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = [CHDValueAxis alloc];
    v7 = [v5 resources];
    v8 = [(CHDValueAxis *)v6 initWithResources:v7];

    var0 = (double *)a3[1].var0;
    if (var0)
    {
      if ((XlChartValueRange::isAutoMax((XlChartValueRange *)a3[1].var0) & 1) == 0)
      {
        double v10 = var0[3];
        int isLogScale = XlChartValueRange::isLogScale((XlChartValueRange *)var0);
        double v12 = __exp10(v10);
        if (!isLogScale) {
          double v12 = v10;
        }
        [(CHDAxis *)v8 setScalingMaximum:v12];
      }
      if ((XlChartValueRange::isAutoMin((XlChartValueRange *)var0) & 1) == 0)
      {
        double v13 = var0[2];
        int v14 = XlChartValueRange::isLogScale((XlChartValueRange *)var0);
        double v15 = __exp10(v13);
        if (!v14) {
          double v15 = v13;
        }
        [(CHDAxis *)v8 setScalingMinimum:v15];
      }
      if ((XlChartValueRange::isAutoMajor((XlChartValueRange *)var0) & 1) == 0)
      {
        double v16 = var0[4];
        int v17 = XlChartValueRange::isLogScale((XlChartValueRange *)var0);
        double v18 = __exp10(v16);
        if (!v17) {
          double v18 = v16;
        }
        [(CHDValueAxis *)v8 setMajorUnitValue:v18];
      }
      if ((XlChartValueRange::isAutoMinor((XlChartValueRange *)var0) & 1) == 0)
      {
        double v19 = var0[5];
        int v20 = XlChartValueRange::isLogScale((XlChartValueRange *)var0);
        double v21 = __exp10(v19);
        if (!v20) {
          double v21 = v19;
        }
        [(CHDValueAxis *)v8 setMinorUnitValue:v21];
      }
      if ((XlChartValueRange::isAutoCross((XlChartValueRange *)var0) & 1) == 0)
      {
        double v22 = var0[6];
        int v23 = XlChartValueRange::isLogScale((XlChartValueRange *)var0);
        double v24 = __exp10(v22);
        if (!v23) {
          double v24 = v22;
        }
        [(CHDAxis *)v8 setCrossesAt:v24];
      }
      [(CHDAxis *)v8 setReverseOrder:XlChartValueRange::isReverse((XlChartValueRange *)var0)];
      if (XlChartValueRange::isLogScale((XlChartValueRange *)var0)) {
        [(CHDValueAxis *)v8 setScalingLogBase:10.0];
      }
    }
    uint64_t v25 = *(void *)&a3[1].var1;
    if (v25)
    {
      uint64_t v26 = *(int *)(v25 + 16);
      if v26 < 0xA && ((0x327u >> v26)) {
        [(CHDValueAxis *)v8 setBuiltInUnit:dword_238EDEFE8[v26]];
      }
      [(CHDValueAxis *)v8 setShowBuiltInUnitFlag:*(unsigned __int8 *)(v25 + 20)];
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