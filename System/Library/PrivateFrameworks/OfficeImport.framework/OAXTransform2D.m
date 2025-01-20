@interface OAXTransform2D
+ (CGRect)readChildrenBoundsFromParentXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5;
+ (id)readOrientedBoundsFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 relative:(BOOL)a5 drawingState:(id)a6;
+ (void)readFromParentXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 toDrawable:(id)a5 drawingState:(id)a6;
@end

@implementation OAXTransform2D

+ (void)readFromParentXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 toDrawable:(id)a5 drawingState:(id)a6
{
  v17 = (CXNamespace *)a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [v11 OAXMainNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "xfrm");

  if (v13 || (uint64_t v13 = OCXFindChild(a3, v17, "xfrm")) != 0)
  {
    v14 = [v10 drawableProperties];

    if (v14)
    {
      v15 = objc_msgSend(a1, "readOrientedBoundsFromXmlNode:inNamespace:relative:drawingState:", v13, v17, objc_msgSend(v11, "isInsideGroup"), v11);
      v16 = [v10 drawableProperties];
      [v16 setOrientedBounds:v15];
    }
  }
}

+ (id)readOrientedBoundsFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 relative:(BOOL)a5 drawingState:(id)a6
{
  BOOL v6 = a5;
  id v8 = a6;
  v9 = objc_alloc_init(OADOrientedBounds);
  double v10 = *MEMORY[0x263F001A8];
  double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  v14 = [v8 OAXMainNamespace];
  uint64_t v15 = OCXFindChild(a3, v14, "off");

  if (v15)
  {
    if (v6)
    {
      double v10 = (double)+[OAXBaseTypes readRequiredLongFromXmlNode:v15 name:"x"];
      double v11 = (double)+[OAXBaseTypes readRequiredLongFromXmlNode:v15 name:"y"];
    }
    else
    {
      +[OAXBaseTypes readPoint2DFromXmlNode:v15];
      double v10 = v16;
      double v11 = v17;
    }
  }
  v18 = [v8 OAXMainNamespace];
  uint64_t v19 = OCXFindChild(a3, v18, "ext");

  if (v19)
  {
    if (v6)
    {
      double v12 = (double)+[OAXBaseTypes readRequiredLongFromXmlNode:v19 name:"cx"];
      double v13 = (double)+[OAXBaseTypes readRequiredLongFromXmlNode:v19 name:"cy"];
    }
    else
    {
      +[OAXBaseTypes readSize2DFromXmlNode:v19];
      double v12 = v20;
      double v13 = v21;
    }
  }
  -[OADOrientedBounds setBounds:](v9, "setBounds:", v10, v11, v12, v13);
  +[OAXBaseTypes readOptionalAngleFromXmlNode:a3 name:"rot"];
  float v23 = v22;
  *(float *)&double v22 = v23;
  [(OADOrientedBounds *)v9 setRotation:v22];
  [(OADOrientedBounds *)v9 setFlipX:CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"flipH", 0)];
  [(OADOrientedBounds *)v9 setFlipY:CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"flipV", 0)];
  int v24 = [(OADOrientedBounds *)v9 flipX];
  int v25 = [(OADOrientedBounds *)v9 flipY];
  if (v23 != 0.0 && v24 != v25)
  {
    *(float *)&double v26 = 360.0 - v23;
    [(OADOrientedBounds *)v9 setRotation:v26];
  }

  return v9;
}

+ (CGRect)readChildrenBoundsFromParentXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  id v6 = a5;
  v7 = [v6 OAXMainNamespace];
  id v8 = (_xmlNode *)OCXFindChild(a3, v7, "xfrm");

  v9 = [v6 OAXMainNamespace];
  uint64_t v10 = OCXFindChild(v8, v9, "chOff");

  if (!v10)
  {
    double v11 = [v6 OAXMainNamespace];
    uint64_t v10 = OCXFindChild(v8, v11, "off");

    if (!v10)
    {
      +[TCMessageException raise:OABadFormat];
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = +[OAXBaseTypes readRequiredLongFromXmlNode:v10 name:"x"];
  uint64_t v13 = +[OAXBaseTypes readRequiredLongFromXmlNode:v10 name:"y"];
  v14 = [v6 OAXMainNamespace];
  uint64_t v15 = OCXFindChild(v8, v14, "chExt");

  if (!v15)
  {
    double v16 = [v6 OAXMainNamespace];
    uint64_t v15 = OCXFindChild(v8, v16, "ext");

    if (!v15)
    {
      +[TCMessageException raise:OABadFormat];
      uint64_t v15 = 0;
    }
  }
  uint64_t v17 = +[OAXBaseTypes readRequiredLongFromXmlNode:v15 name:"cx"];
  double v18 = (double)+[OAXBaseTypes readRequiredLongFromXmlNode:v15 name:"cy"];

  double v19 = (double)v12;
  double v20 = (double)v13;
  double v21 = (double)v17;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

@end