@interface GQHChartLegend
+ (__CFData)renderChart:(id)a3;
+ (char)pdfId:(id)a3;
+ (id)geometry:(id)a3;
+ (int)handleFloatingLegend:(id)a3 state:(id)a4;
+ (int)handleInlineLegend:(id)a3 state:(id)a4;
@end

@implementation GQHChartLegend

+ (__CFData)renderChart:(id)a3
{
  return (__CFData *)sub_47040(a3);
}

+ (char)pdfId:(id)a3
{
  id v3 = [a3 legend];
  return (char *)[v3 uid];
}

+ (id)geometry:(id)a3
{
  id v3 = [a3 legend];
  return [v3 geometry];
}

+ (int)handleFloatingLegend:(id)a3 state:(id)a4
{
  id v6 = [a3 chart];
  return [a1 handleFloatingChart:v6 state:a4];
}

+ (int)handleInlineLegend:(id)a3 state:(id)a4
{
  if (!objc_msgSend(objc_msgSend(a3, "chart"), "legend")) {
    objc_msgSend(objc_msgSend(a3, "chart"), "setLegend:", a3);
  }
  id v7 = [a3 chart];
  return [a1 handleInlineChart:v7 state:a4];
}

@end