@interface CHBBar3DType
+ (id)chdChartTypeWithState:(id)a3;
@end

@implementation CHBBar3DType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3 = a3;
  v4 = [CHDBar3DType alloc];
  v5 = [v3 chart];
  v6 = [(CHDBar3DType *)v4 initWithChart:v5];

  +[CHBBar2DType readWithState:v3 chartType:v6];
  uint64_t v7 = [v3 xlCurrentPlot];
  if (v7)
  {
    uint64_t v8 = *(void *)(v7 + 8);
    if (v8) {
      [(CHDBar3DType *)v6 setGapDepth:*(__int16 *)(v8 + 26)];
    }
  }
  uint64_t v9 = [v3 xlCurrentDefaultSeriesFormat];
  if (v9) {
    [(CHDBar3DType *)v6 setShapeType:chdShapeTypeFromXlShapeTypeEnum(*(_DWORD *)(v9 + 76))];
  }

  return v6;
}

@end