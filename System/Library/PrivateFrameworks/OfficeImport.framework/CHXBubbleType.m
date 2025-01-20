@interface CHXBubbleType
+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation CHXBubbleType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [v5 chart];
  v7 = +[CHDChartType chartTypeWithChart:v6];

  [v7 setVaryColors:0];
  v8 = [v5 drawingState];
  v9 = [v8 OAXChartNamespace];
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "bubbleScale");

  if (v10) {
    objc_msgSend(v7, "setBubbleScale:", CXRequiredUnsignedLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v11 = [v5 drawingState];
  v12 = [v11 OAXChartNamespace];
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "showNegBubbles");

  if (v13) {
    objc_msgSend(v7, "setShowNegBubbles:", CXRequiredBoolAttribute(v13, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v14 = [v5 drawingState];
  v15 = [v14 OAXChartNamespace];
  v16 = (_xmlNode *)OCXFindChild(a3, v15, "sizeRepresents");

  if (v16)
  {
    id v21 = 0;
    BOOL v17 = CXOptionalStringAttribute(v16, (void *)CXNoNamespace, (xmlChar *)"val", &v21);
    id v18 = v21;
    v19 = v18;
    if (v17) {
      objc_msgSend(v7, "setSizeRepresentsRadius:", objc_msgSend(v18, "isEqualToString:", @"w"));
    }
  }
  return v7;
}

@end