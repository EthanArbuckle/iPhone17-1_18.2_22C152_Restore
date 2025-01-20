@interface CHXBubbleSeries
+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation CHXBubbleSeries

+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [v5 chart];
  v7 = +[CHDSeries seriesWithChart:v6];

  v8 = [v5 drawingState];
  v9 = [v8 OAXChartNamespace];
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "bubble3D");

  if (v10) {
    objc_msgSend(v7, "setBubble3D:", CXRequiredBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v11 = [v5 drawingState];
  v12 = [v11 OAXChartNamespace];
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "invertIfNegative");

  if (v13) {
    objc_msgSend(v7, "setInvertIfNegative:", CXRequiredBoolAttribute(v13, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }
  v14 = [v5 drawingState];
  v15 = [v14 OAXChartNamespace];
  uint64_t v16 = OCXFindChild(a3, v15, "dLbls");

  if (!v16)
  {
    v17 = [v5 drawingState];
    v18 = [v17 OAXChartNamespace];
    v19 = (_xmlNode *)OCXFindChild(0, v18, "showBubbleSize");

    if (v19) {
      uint64_t v20 = (uint64_t)CXRequiredBoolAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
    }
    else {
      uint64_t v20 = 1;
    }
    [v7 setShowBubbleSize:v20];
  }

  return v7;
}

@end