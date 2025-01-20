@interface CHXScatterType
+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation CHXScatterType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  v4 = objc_msgSend(a4, "chart", a3);
  v5 = +[CHDChartType chartTypeWithChart:v4];

  [v5 setVaryColors:0];
  return v5;
}

@end