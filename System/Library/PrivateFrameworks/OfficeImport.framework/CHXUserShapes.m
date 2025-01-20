@interface CHXUserShapes
+ (CGPoint)readRealPoint:(_xmlNode *)a3;
+ (float)readRealCoordinate:(_xmlNode *)a3;
+ (id)readAbsoluteSizeAnchor:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readDrawable:(_xmlNode *)a3 anchor:(id)a4 drawingState:(id)a5;
+ (id)readRelativeSizeAnchor:(_xmlNode *)a3 drawingState:(id)a4;
+ (void)readFromCharSpaceNode:(_xmlNode *)a3 state:(id)a4;
@end

@implementation CHXUserShapes

+ (void)readFromCharSpaceNode:(_xmlNode *)a3 state:(id)a4
{
  id v28 = a4;
  v6 = [v28 drawingState];
  v7 = [v6 OAXChartNamespace];
  uint64_t v8 = OCXFindChild(a3, v7, "userShapes");

  if (!v8) {
    goto LABEL_18;
  }
  v9 = [v28 chartPart];
  v10 = [v28 drawingState];
  v11 = [v10 OCXReadRelationshipForNode:v8 packagePart:v9];

  v12 = [v9 package];
  v13 = [v11 targetLocation];
  v14 = [v12 partForLocation:v13];

  if (!v14) {
    goto LABEL_17;
  }
  xmlNodePtr v15 = OCXGetRootElement((_xmlDoc *)[v14 xmlDocument]);
  v16 = v15;
  if (!v15 || !xmlStrEqual(v15->name, (const xmlChar *)"userShapes"))
  {
    v17 = [v9 package];
    v26 = [v11 targetLocation];
    [(CHXDrawingState *)v17 resetPartForLocation:v26];
    goto LABEL_16;
  }
  v17 = [[CHXDrawingState alloc] initWithCHXState:v28];
  [(OAXDrawingState *)v17 setPackagePart:v14];
  v18 = [v28 drawingState];
  v19 = [v18 styleMatrix];
  [(OAXDrawingState *)v17 setStyleMatrix:v19];

  v20 = [v28 drawingState];
  v21 = [v20 targetBlipCollection];
  [(OAXDrawingState *)v17 setTargetBlipCollection:v21];

  for (i = OCXFirstChild(v16); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"relSizeAnchor"))
    {
      uint64_t v23 = [a1 readRelativeSizeAnchor:i drawingState:v17];
    }
    else
    {
      if (!xmlStrEqual(i->name, (const xmlChar *)"absSizeAnchor")) {
        continue;
      }
      uint64_t v23 = [a1 readAbsoluteSizeAnchor:i drawingState:v17];
    }
    v24 = (void *)v23;
    if (v23)
    {
      v25 = [v28 chart];
      [v25 addChild:v24];
    }
  }
  v26 = [v9 package];
  v27 = [v11 targetLocation];
  [v26 resetPartForLocation:v27];

LABEL_16:
LABEL_17:

LABEL_18:
}

+ (id)readRelativeSizeAnchor:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  v7 = OCXFirstChild(a3);
  uint64_t v8 = 0;
  v9 = 0;
  v10 = 0;
  while (v7)
  {
    if (xmlStrEqual(v7->name, (const xmlChar *)"from"))
    {
      v10 = v7;
    }
    else if (xmlStrEqual(v7->name, (const xmlChar *)"to"))
    {
      v9 = v7;
    }
    else
    {
      uint64_t v8 = v7;
    }
    v7 = OCXNextSibling(v7);
  }
  if (v10 && v9 && v8)
  {
    [a1 readRealPoint:v10];
    double v12 = v11;
    double v14 = v13;
    [a1 readRealPoint:v9];
    double v16 = v15;
    double v18 = v17;
    v19 = objc_alloc_init(CHDRelativeSizeAnchor);
    -[CHDRelativeSizeAnchor setFrom:](v19, "setFrom:", v12, v14);
    -[CHDRelativeSizeAnchor setTo:](v19, "setTo:", v16, v18);
    v7 = [a1 readDrawable:v8 anchor:v19 drawingState:v6];
  }
  return v7;
}

+ (CGPoint)readRealPoint:(_xmlNode *)a3
{
  objc_msgSend(a1, "readRealCoordinate:", OCXFirstChildNamed(a3, (xmlChar *)"x"));
  float v6 = v5;
  objc_msgSend(a1, "readRealCoordinate:", OCXFirstChildNamed(a3, (xmlChar *)"y"));
  double v8 = v7;
  double v9 = v6;
  result.y = v8;
  result.x = v9;
  return result;
}

+ (float)readRealCoordinate:(_xmlNode *)a3
{
  v3 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", a3);
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

+ (id)readDrawable:(_xmlNode *)a3 anchor:(id)a4 drawingState:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = [v8 OAXChartDrawingNamespace];
  v10 = +[OAXDrawable readDrawableFromXmlNode:a3 inNamespace:v9 drawingState:v8];

  if (v10)
  {
    double v11 = objc_alloc_init(CHDOfficeArtClient);
    [(CHDOfficeArtClient *)v11 setAnchor:v7];
    [v10 setClientData:v11];
  }
  return v10;
}

+ (id)readAbsoluteSizeAnchor:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  id v7 = OCXFirstChild(a3);
  id v8 = 0;
  double v9 = 0;
  v10 = 0;
  while (v7)
  {
    if (xmlStrEqual(v7->name, (const xmlChar *)"from"))
    {
      v10 = v7;
    }
    else if (xmlStrEqual(v7->name, (const xmlChar *)"ext"))
    {
      double v9 = v7;
    }
    else
    {
      id v8 = v7;
    }
    id v7 = OCXNextSibling(v7);
  }
  if (v10 && v9 && v8)
  {
    [a1 readRealPoint:v10];
    double v12 = v11;
    double v14 = v13;
    +[OAXBaseTypes readSize2DFromXmlNode:v9];
    double v16 = v15;
    double v18 = v17;
    v19 = objc_alloc_init(CHDAbsoluteSizeAnchor);
    -[CHDAbsoluteSizeAnchor setFrom:](v19, "setFrom:", v12, v14);
    -[CHDAbsoluteSizeAnchor setSize:](v19, "setSize:", v16, v18);
    id v7 = [a1 readDrawable:v8 anchor:v19 drawingState:v6];
  }
  return v7;
}

@end