@interface CHXGraphicProperties
+ (BOOL)isGraphicPropertiesContainedByXmlElement:(_xmlNode *)a3 state:(id)a4;
+ (id)oadGraphicPropertiesFromXmlElementWithGraphicProperties:(_xmlNode *)a3 state:(id)a4;
+ (void)setGraphicPropertiesFromXmlElementWithGraphicProperties:(id)a3 element:(_xmlNode *)a4 state:(id)a5;
@end

@implementation CHXGraphicProperties

+ (void)setGraphicPropertiesFromXmlElementWithGraphicProperties:(id)a3 element:(_xmlNode *)a4 state:(id)a5
{
  id v15 = a3;
  id v7 = a5;
  if (v15 && a4)
  {
    v8 = [v7 drawingState];
    v9 = [v8 OAXChartNamespace];
    uint64_t v10 = OCXFindChild(a4, v9, "spPr");

    if (v10)
    {
      v11 = [v7 drawingState];
      +[OAXGraphic readPropertiesFromXmlNode:v10 graphicProperties:v15 drawingState:v11];
    }
    v12 = [v7 drawingState];
    v13 = [v12 OAXChartNamespace];
    uint64_t v14 = OCXFindChild(a4, v13, "layout");

    if (v14) {
      +[CHXLayout readFrom:v14 graphicProperties:v15 state:v7];
    }
  }
}

+ (id)oadGraphicPropertiesFromXmlElementWithGraphicProperties:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(OADGraphicProperties);
  [a1 setGraphicPropertiesFromXmlElementWithGraphicProperties:v7 element:a3 state:v6];

  return v7;
}

+ (BOOL)isGraphicPropertiesContainedByXmlElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  id v6 = [v5 drawingState];
  id v7 = [v6 OAXChartNamespace];
  if (OCXFindChild(a3, v7, "spPr"))
  {
    BOOL v8 = 1;
  }
  else
  {
    v9 = [v5 drawingState];
    uint64_t v10 = [v9 OAXChartNamespace];
    BOOL v8 = OCXFindChild(a3, v10, "layout") != 0;
  }
  return v8;
}

@end