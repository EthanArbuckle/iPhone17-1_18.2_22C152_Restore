@interface CHXLineSeries
+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation CHXLineSeries

+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [v5 chart];
  v7 = +[CHDSeries seriesWithChart:v6];

  v8 = [v5 drawingState];
  v9 = [v8 OAXChartNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "marker");

  v11 = +[CHXMarker chdMarkerFromXmlMarkerElement:v10 state:v5];
  [v7 setMarker:v11];
  v12 = [v5 drawingState];
  v13 = [v12 OAXChartNamespace];
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "smooth");

  if (v14) {
    objc_msgSend(v7, "setSmooth:", CXRequiredBoolAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  }

  return v7;
}

@end