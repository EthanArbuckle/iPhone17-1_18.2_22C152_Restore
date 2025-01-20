@interface CHXUnsupportedSeries
+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation CHXUnsupportedSeries

+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4
{
  v4 = objc_msgSend(a4, "chart", a3);
  v5 = +[CHDSeries seriesWithChart:v4];

  return v5;
}

@end