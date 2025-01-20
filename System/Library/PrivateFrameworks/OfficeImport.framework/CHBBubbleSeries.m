@interface CHBBubbleSeries
+ (id)chdSeriesWithState:(id)a3;
@end

@implementation CHBBubbleSeries

+ (id)chdSeriesWithState:(id)a3
{
  id v3 = a3;
  v4 = [CHDBubbleSeries alloc];
  v5 = [v3 chart];
  v6 = [(CHDSeries *)v4 initWithChart:v5];

  uint64_t v7 = [v3 xlCurrentDefaultSeriesFormat];
  if (v7)
  {
    BOOL v8 = *(unsigned char *)(v7 + 81) != 0;
    BOOL v9 = *(unsigned char *)(v7 + 87) != 0;
  }
  else
  {
    BOOL v9 = 0;
    BOOL v8 = 0;
  }
  [(CHDBubbleSeries *)v6 setBubble3D:v8];
  [(CHDBubbleSeries *)v6 setShowBubbleSize:v9];

  return v6;
}

@end