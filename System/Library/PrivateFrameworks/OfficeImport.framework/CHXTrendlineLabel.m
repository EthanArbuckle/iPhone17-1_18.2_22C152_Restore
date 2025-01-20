@interface CHXTrendlineLabel
+ (id)chdTrendlineLabelFromXmlTrendlineLabelElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation CHXTrendlineLabel

+ (id)chdTrendlineLabelFromXmlTrendlineLabelElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [v5 resources];
  v7 = +[CHDTrendlineLabel trendlineLabelWithResources:v6];

  v8 = [v5 drawingState];
  v9 = [v8 OAXChartNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "tx");

  if (v10)
  {
    id v25 = 0;
    id v26 = 0;
    +[CHXString readFromXmlTxElement:v10 formula:&v26 lastCached:&v25 state:v5];
    id v11 = v26;
    id v12 = v25;
    v13 = [v5 chart];
    [v7 setName:v11 chart:v13];

    [v7 setLastCachedName:v12];
  }
  v14 = [v5 drawingState];
  v15 = [v14 OAXChartNamespace];
  v16 = (_xmlNode *)OCXFindChild(a3, v15, "numFmt");

  if (v16)
  {
    id v24 = 0;
    BOOL v17 = CXOptionalStringAttribute(v16, (void *)CXNoNamespace, (xmlChar *)"formatCode", &v24);
    id v18 = v24;
    if (v17)
    {
      v19 = +[EDString edStringWithString:v18];
      v20 = +[EDContentFormat contentFormatWithFormatString:v19];

      [v7 setContentFormat:v20];
    }
    double v23 = 0.0;
    if (CXOptionalDoubleAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"sourceLinked", &v23)) {
      objc_msgSend(v7, "setIsContentFormatDerivedFromDataPoints:", v23 == 1.0, v23);
    }
  }
  v21 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v21 element:a3 state:v5];
  [v7 setGraphicProperties:v21];

  return v7;
}

@end