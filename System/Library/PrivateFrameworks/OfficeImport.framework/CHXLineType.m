@interface CHXLineType
+ (void)readFrom:(_xmlNode *)a3 chartType:(id)a4 state:(id)a5;
@end

@implementation CHXLineType

+ (void)readFrom:(_xmlNode *)a3 chartType:(id)a4 state:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  [v11 setVaryColors:0];
  v8 = [v7 drawingState];
  v9 = [v8 OAXChartNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "grouping");

  objc_msgSend(v11, "setGrouping:", +[CHXChartType chdGroupingFromXmlGroupingElement:](CHXChartType, "chdGroupingFromXmlGroupingElement:", v10));
}

@end