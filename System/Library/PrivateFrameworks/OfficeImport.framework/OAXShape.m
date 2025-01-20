@interface OAXShape
+ (BOOL)isWritable:(id)a3;
+ (id)readFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5;
+ (void)readCoreFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 toShape:(id)a5 drawingState:(id)a6;
+ (void)readNonVisualShapeProperties:(_xmlNode *)a3 nodeName:(const char *)a4 inNamespace:(id)a5 shapeProperties:(id)a6;
@end

@implementation OAXShape

+ (id)readFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  v8 = (CXNamespace *)a4;
  id v9 = a5;
  v10 = objc_alloc_init(OADShape);
  +[OAXDrawable readNonVisualPropertiesFromDrawableXmlNode:a3 inNamespace:v8 visualNodeName:"nvSpPr" toDrawable:v10 drawingState:v9];
  v11 = [(OADShape *)v10 shapeProperties];
  uint64_t v12 = OCXFindChild(a3, v8, "nvSpPr");
  if (v12) {
    v13 = (_xmlNode *)v12;
  }
  else {
    v13 = a3;
  }
  [a1 readNonVisualShapeProperties:v13 nodeName:"cNvSpPr" inNamespace:v8 shapeProperties:v11];
  [a1 readCoreFromXmlNode:a3 inNamespace:v8 toShape:v10 drawingState:v9];

  return v10;
}

+ (void)readNonVisualShapeProperties:(_xmlNode *)a3 nodeName:(const char *)a4 inNamespace:(id)a5 shapeProperties:(id)a6
{
  id v10 = a6;
  id v9 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)a5, a4);
  if (v9) {
    objc_msgSend(v10, "setIsTextBox:", CXDefaultBoolAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"txBox", 0));
  }
}

+ (void)readCoreFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 toShape:(id)a5 drawingState:(id)a6
{
  v30 = (CXNamespace *)a4;
  id v9 = a5;
  id v10 = a6;
  v11 = [v9 shapeProperties];
  uint64_t v12 = OCXFindChild(a3, v30, "style");
  if (v12)
  {
    v13 = objc_alloc_init(OADShapeStyle);
    +[OAXShapeStyle readFromNode:shapeStyle:drawingState:](OAXShapeStyle, "readFromNode:shapeStyle:drawingState:", v12);
  }
  else
  {
    v13 = 0;
  }
  uint64_t v14 = OCXFindChild(a3, v30, "spPr");
  if (!v14) {
    +[TCMessageException raise:OABadFormat];
  }
  +[OAXGraphic readPropertiesFromXmlNode:v14 graphicProperties:v11 drawingState:v10];
  if (v13)
  {
    v15 = [v10 styleMatrix];
    [(OADShapeStyle *)v13 applyToGraphicProperties:v11 styleMatrix:v15];
  }
  if (CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"useBgFill", 0))
  {
    v16 = objc_alloc_init(OADBackgroundFill);
    [v11 setFill:v16];
  }
  +[OAXTransform2D readFromParentXmlNode:v14 inNamespace:v30 toDrawable:v9 drawingState:v10];
  v17 = +[OAXGeometry readFromParentXmlNode:v14 drawingState:v10];
  [v9 setGeometry:v17];

  uint64_t v18 = OCXFindChild(a3, v30, "txBody");
  if (v18
    || ([v10 OAXMainNamespace],
        v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        v21 = (_xmlNode *)OCXFindChild(a3, v20, "txSp"),
        v20,
        v21)
    && (uint64_t v18 = OCXFindChild(v21, v30, "txBody")) != 0)
  {
    v19 = [v9 textBody];
    +[OAXTextBody readTextBodyFromXmlNode:v18 textBody:v19 drawingState:v10];
    if (v13) {
      [(OADShapeStyle *)v13 applyToTextBody:v19];
    }
  }
  else
  {
    uint64_t v22 = OCXFindChild(a3, v30, "bodyPr");
    if (!v22) {
      goto LABEL_18;
    }
    v19 = [v9 textBody];
    v23 = [v19 properties];
    +[OAXTextBody readTextBodyProperties:v22 textBodyProperties:v23 drawingState:v10];
  }
LABEL_18:
  uint64_t v24 = OCXFindChild(a3, v30, "txXfrm");
  if (v24)
  {
    v25 = +[OAXTransform2D readOrientedBoundsFromXmlNode:inNamespace:relative:drawingState:](OAXTransform2D, "readOrientedBoundsFromXmlNode:inNamespace:relative:drawingState:", v24, v30, [v10 isInsideGroup], v10);
    [v9 setTextOrientedBounds:v25];
  }
  uint64_t v26 = OCXFindChild(a3, v30, "bodyPr");
  if (v26)
  {
    v27 = [v9 textBody];
    v28 = [v27 properties];
    +[OAXTextBody readTextBodyProperties:v26 textBodyProperties:v28 drawingState:v10];
  }
  v29 = [v10 client];
  [v29 readClientDataFromShapeNode:a3 toShape:v9 state:v10];
}

+ (BOOL)isWritable:(id)a3
{
  id v3 = a3;
  v4 = +[OAXGeometry stringWritingShapeType:](OAXGeometry, "stringWritingShapeType:", [v3 type]);
  BOOL v5 = v4 != 0;

  return v5;
}

@end