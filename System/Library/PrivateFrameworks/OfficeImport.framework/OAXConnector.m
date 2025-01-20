@interface OAXConnector
+ (id)readFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5;
+ (void)readConnectionFromParent:(_xmlNode *)a3 nodeName:(const char *)a4 connection:(id)a5 drawingState:(id)a6;
+ (void)readNonVisualConnectorProperties:(_xmlNode *)a3 inNamespace:(id)a4 connectorProperties:(id)a5 drawingState:(id)a6;
@end

@implementation OAXConnector

+ (id)readFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  v8 = (CXNamespace *)a4;
  id v9 = a5;
  v10 = objc_alloc_init(OADConnector);
  uint64_t v11 = OCXFindChild(a3, v8, "nvCxnSpPr");
  if (!v11) {
    +[TCMessageException raise:OABadFormat];
  }
  +[OAXDrawable readNonVisualPropertiesFromDrawableXmlNode:a3 inNamespace:v8 visualNodeName:"nvCxnSpPr" toDrawable:v10 drawingState:v9];
  v12 = [(OADConnector *)v10 connectorProperties];
  [a1 readNonVisualConnectorProperties:v11 inNamespace:v8 connectorProperties:v12 drawingState:v9];
  +[OAXShape readCoreFromXmlNode:a3 inNamespace:v8 toShape:v10 drawingState:v9];

  return v10;
}

+ (void)readConnectionFromParent:(_xmlNode *)a3 nodeName:(const char *)a4 connection:(id)a5 drawingState:(id)a6
{
  id v13 = a5;
  id v9 = [a6 OAXMainNamespace];
  v10 = (_xmlNode *)OCXFindChild(a3, v9, a4);

  uint64_t v11 = CXRequiredLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"id");
  v12 = CXRequiredLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx");
  [v13 setDrawableId:v11];
  [v13 setLocationIndex:v12];
}

+ (void)readNonVisualConnectorProperties:(_xmlNode *)a3 inNamespace:(id)a4 connectorProperties:(id)a5 drawingState:(id)a6
{
  v15 = (CXNamespace *)a4;
  id v10 = a5;
  id v11 = a6;
  +[OAXShape readNonVisualShapeProperties:a3 nodeName:"cNvCxnSpPr" inNamespace:v15 shapeProperties:v10];
  uint64_t v12 = OCXFindChild(a3, v15, "cNvCxnSpPr");
  if (v12)
  {
    id v13 = [v10 from];
    [a1 readConnectionFromParent:v12 nodeName:"stCxn" connection:v13 drawingState:v11];

    v14 = [v10 to];
    [a1 readConnectionFromParent:v12 nodeName:"endCxn" connection:v14 drawingState:v11];
  }
}

@end