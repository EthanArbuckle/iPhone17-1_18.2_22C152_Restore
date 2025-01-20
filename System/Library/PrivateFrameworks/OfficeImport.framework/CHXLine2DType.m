@interface CHXLine2DType
+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation CHXLine2DType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [v5 chart];
  v7 = +[CHDChartType chartTypeWithChart:v6];

  +[CHXLineType readFrom:a3 chartType:v7 state:v5];
  v8 = [v5 drawingState];
  v9 = [v8 OAXChartNamespace];
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "marker");

  if (v10) {
    objc_msgSend(v7, "setShowMarker:", CXRequiredBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }

  return v7;
}

@end