@interface CHBScatterSeries
+ (id)chdSeriesWithState:(id)a3;
@end

@implementation CHBScatterSeries

+ (id)chdSeriesWithState:(id)a3
{
  id v3 = a3;
  v4 = [CHDScatterSeries alloc];
  v5 = [v3 chart];
  v6 = [(CHDLineSeries *)v4 initWithChart:v5];

  uint64_t v7 = [v3 xlCurrentDefaultSeriesFormat];
  uint64_t v8 = v7;
  if (v7)
  {
    BOOL v9 = *(unsigned char *)(v7 + 88) != 0;
    if (*(void *)(v7 + 8)) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  uint64_t v8 = *(void *)([v3 xlCurrentPlot] + 24);
  if (v8) {
    char v10 = v9;
  }
  else {
    char v10 = 1;
  }
  if ((v10 & 1) == 0) {
    BOOL v9 = *(unsigned char *)(v8 + 88) != 0;
  }
LABEL_10:
  [(CHDLineSeries *)v6 setSmooth:v9];
  v11 = +[CHBMarker readFrom:v8 state:v3];
  [(CHDLineSeries *)v6 setMarker:v11];

  return v6;
}

@end