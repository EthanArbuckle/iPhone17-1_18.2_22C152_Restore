@interface CHBPie2DType
+ (id)chdChartTypeWithState:(id)a3;
+ (void)readWithState:(id)a3 chartType:(id)a4;
@end

@implementation CHBPie2DType

+ (void)readWithState:(id)a3 chartType:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = [v9 xlCurrentPlot];
  uint64_t v7 = v6;
  if (v6)
  {
    [v5 setFirstSliceAngle:*(__int16 *)(v6 + 162)];
    if (*(_WORD *)(v7 + 160)) {
      [v5 setDoughnutType:1];
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)v7 + 16))(v7) == 3)
    {
      int v8 = *(_DWORD *)(v7 + 164);
      if (v8 == 1)
      {
        [v5 setPieOfPieType:1];
        int v8 = *(_DWORD *)(v7 + 164);
      }
      if (v8 == 2) {
        [v5 setBarOfPieType:1];
      }
    }
  }
}

+ (id)chdChartTypeWithState:(id)a3
{
  id v4 = a3;
  id v5 = [CHDPie2DType alloc];
  uint64_t v6 = [v4 chart];
  uint64_t v7 = [(CHDPie2DType *)v5 initWithChart:v6];

  [a1 readWithState:v4 chartType:v7];
  return v7;
}

@end