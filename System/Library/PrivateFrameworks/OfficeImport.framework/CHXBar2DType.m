@interface CHXBar2DType
+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4;
+ (void)readFrom:(_xmlNode *)a3 chartType:(id)a4 state:(id)a5;
@end

@implementation CHXBar2DType

+ (void)readFrom:(_xmlNode *)a3 chartType:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [v7 setVaryColors:0];
  v9 = [v8 drawingState];
  v10 = [v9 OAXChartNamespace];
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "gapWidth");

  if (v11) {
    objc_msgSend(v7, "setGapWidth:", CXRequiredUnsignedLongAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v12 = [v8 drawingState];
  v13 = [v12 OAXChartNamespace];
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "overlap");

  if (v14) {
    objc_msgSend(v7, "setOverlap:", -(uint64_t)CXRequiredLongAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v15 = [v8 drawingState];
  v16 = [v15 OAXChartNamespace];
  uint64_t v17 = OCXFindChild(a3, v16, "barDir");

  if (v17)
  {
    id v23 = 0;
    uint64_t v17 = CXOptionalStringAttribute((_xmlNode *)v17, (void *)CXNoNamespace, (xmlChar *)"val", &v23);
    id v18 = v23;
    v19 = v18;
    if (v17) {
      uint64_t v17 = [v18 isEqualToString:@"col"];
    }
  }
  [v7 setColumn:v17];
  v20 = [v8 drawingState];
  v21 = [v20 OAXChartNamespace];
  uint64_t v22 = OCXFindChild(a3, v21, "grouping");

  objc_msgSend(v7, "setGrouping:", +[CHXChartType chdGroupingFromXmlGroupingElement:](CHXChartType, "chdGroupingFromXmlGroupingElement:", v22));
}

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = [v6 chart];
  id v8 = +[CHDChartType chartTypeWithChart:v7];

  [a1 readFrom:a3 chartType:v8 state:v6];
  return v8;
}

@end