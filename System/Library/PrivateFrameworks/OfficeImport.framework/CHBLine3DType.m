@interface CHBLine3DType
+ (id)chdChartTypeWithState:(id)a3;
@end

@implementation CHBLine3DType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3 = a3;
  v4 = [CHDLine3DType alloc];
  v5 = [v3 chart];
  v6 = [(CHDLine3DType *)v4 initWithChart:v5];

  +[CHBLineType readWithState:v3 chartType:v6];
  uint64_t v7 = [v3 xlCurrentPlot];
  if (v7)
  {
    uint64_t v8 = *(void *)(v7 + 8);
    if (v8) {
      [(CHDLine3DType *)v6 setGapDepth:*(__int16 *)(v8 + 26)];
    }
  }

  return v6;
}

@end