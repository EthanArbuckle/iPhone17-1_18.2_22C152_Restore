@interface OAXShapeStyle
+ (void)readFromNode:(_xmlNode *)a3 shapeStyle:(id)a4 drawingState:(id)a5;
@end

@implementation OAXShapeStyle

+ (void)readFromNode:(_xmlNode *)a3 shapeStyle:(id)a4 drawingState:(id)a5
{
  id v20 = a4;
  id v7 = a5;
  v8 = [v7 OAXMainNamespace];
  v9 = OCXFirstChild(a3, v8, (xmlChar *)"lnRef");

  v10 = +[OAXStyleMatrix readReferenceFromNode:v9];
  [v20 setLineReference:v10];

  v11 = [v7 OAXMainNamespace];
  v12 = OCXNextSibling(v9, v11, (xmlChar *)"fillRef");

  v13 = +[OAXStyleMatrix readReferenceFromNode:v12];
  [v20 setFillReference:v13];

  v14 = [v7 OAXMainNamespace];
  v15 = OCXNextSibling(v12, v14, (xmlChar *)"effectRef");

  v16 = +[OAXStyleMatrix readReferenceFromNode:v15];
  [v20 setEffectReference:v16];

  v17 = [v7 OAXMainNamespace];
  v18 = OCXNextSibling(v15, v17, (xmlChar *)"fontRef");

  v19 = objc_alloc_init(OADFontReference);
  +[OAXFontReference readFromNode:v18 fontReference:v19];
  [v20 setFontReference:v19];
}

@end