@interface OAVShapeManager
- (BOOL)autoInsets;
- (BOOL)fitShapeToText;
- (BOOL)isFillOK;
- (BOOL)isFilled;
- (BOOL)isImage;
- (BOOL)isPolyline;
- (BOOL)isShadowOK;
- (BOOL)isShadowed;
- (BOOL)isStrokeOK;
- (BOOL)isStroked;
- (BOOL)isWordArt;
- (CGPoint)shadowOffsets;
- (OAVShapeManager)initWithShape:(_xmlNode *)a3 type:(unsigned __int16)a4 packagePart:(id)a5 state:(id)a6;
- (OAVTextBoxInsets)textInsets;
- (_xmlNode)shape;
- (float)fillAngle;
- (float)fillBgAlpha;
- (float)fillFgAlpha;
- (float)fillFocus;
- (float)shadowAlpha;
- (float)strokeFgAlpha;
- (float)strokeMiterLimit;
- (float)strokeWidth;
- (id)fillBgColor;
- (id)fillFgColor;
- (id)fillGradientColors;
- (id)fillType;
- (id)imageFillId;
- (id)imageFillTitle;
- (id)imageRelId;
- (id)limo;
- (id)movieRelId;
- (id)oavState;
- (id)packagePart;
- (id)path;
- (id)points;
- (id)shadowColor;
- (id)shadowType;
- (id)strokeBgColor;
- (id)strokeCapStyle;
- (id)strokeCompoundType;
- (id)strokeDashStyle;
- (id)strokeEndArrowLength;
- (id)strokeEndArrowType;
- (id)strokeEndArrowWidth;
- (id)strokeFgColor;
- (id)strokeFillType;
- (id)strokeJoinStyle;
- (id)strokeStartArrowLength;
- (id)strokeStartArrowType;
- (id)strokeStartArrowWidth;
- (id)textAltLayoutFlow;
- (id)textAnchor;
- (id)textBodyRects;
- (id)textLayoutFlow;
- (id)textRotation;
- (id)textWrapStyle;
- (unsigned)type;
@end

@implementation OAVShapeManager

- (BOOL)isImage
{
  v2 = [(OAVShapeManager *)self imageRelId];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)imageRelId
{
  BOOL v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "imagedata");
  if (v3)
  {
    v4 = v3;
    v5 = CXDefaultStringAttribute(v3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"relid", 0);
    if (!v5)
    {
      v6 = [(OCXReadState *)self->mOAVState OCXReadRelationshipForNode:v4 packagePart:self->mPackagePart];
      v5 = [v6 identifier];
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isWordArt
{
  mType = (EshShapeLib *)self->mType;
  if (mType)
  {
    LOBYTE(v4) = EshShapeLib::isWordArt(mType);
  }
  else
  {
    v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "textpath");
    if (v4)
    {
      v5 = (CXNamespace *)CXNoNamespace;
      LOBYTE(v4) = CXDefaultBoolAttribute(v4, v5, (xmlChar *)"on", 0);
    }
  }
  return (char)v4;
}

- (id)fillType
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", (NSString *)@"solid");
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v3 = @"solid";
  }
  return v3;
}

- (BOOL)isFilled
{
  if (![(OAVShapeManager *)self isFillOK])
  {
    LOBYTE(v4) = 0;
    return v4;
  }
  uint64_t isFillOn = EshShapeLib::isFillOn((EshShapeLib *)self->mType, 1);
  uint64_t v4 = CXDefaultBoolAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"filled", isFillOn);
  v5 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (!v5) {
    return v4;
  }
  v6 = (CXNamespace *)CXNoNamespace;
  return CXDefaultBoolAttribute(v5, v6, (xmlChar *)"on", v4);
}

- (BOOL)isFillOK
{
  uint64_t isFillOK = EshShapeLib::isFillOK((EshShapeLib *)self->mType, 1);
  uint64_t v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "path");
  if (!v4) {
    return isFillOK;
  }
  v5 = (CXNamespace *)CXNoNamespace;
  return CXDefaultBoolAttribute(v4, v5, (xmlChar *)"fillok", isFillOK);
}

- (id)fillFgColor
{
  CXDefaultStringAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"fillcolor", (NSString *)@"white");
  BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v4)
  {
    uint64_t v5 = CXDefaultStringAttribute(v4, (CXNamespace *)CXNoNamespace, (xmlChar *)"color", v3);

    BOOL v3 = (NSString *)v5;
  }
  return v3;
}

- (float)fillFgAlpha
{
  v2 = (NSString *)@"1.0";
  BOOL v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"opacity", (NSString *)@"1.0");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  float v4 = OAVReadFraction(v2);

  return v4;
}

- (id)path
{
  CXDefaultStringAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"path", 0);
  BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  float v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "path");
  if (v4)
  {
    uint64_t v5 = CXDefaultStringAttribute(v4, (CXNamespace *)CXNoNamespace, (xmlChar *)"v", v3);

    BOOL v3 = (NSString *)v5;
  }
  return v3;
}

- (unsigned)type
{
  return self->mType;
}

- (_xmlNode)shape
{
  return self->mShape;
}

- (OAVTextBoxInsets)textInsets
{
  float v3 = OAVReadLength((NSString *)@"0.10in");
  float v4 = OAVReadLength((NSString *)@"0.05in");
  float v5 = OAVReadLength((NSString *)@"0.10in");
  float v6 = OAVReadLength((NSString *)@"0.05in");
  v7 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "textbox");
  if (v7)
  {
    v8 = CXDefaultStringAttribute(v7, (CXNamespace *)CXNoNamespace, (xmlChar *)"inset", 0);
    v9 = v8;
    if (v8)
    {
      v10 = [v8 componentsSeparatedByString:@","];
      for (unsigned int i = 0; [v10 count] > (unint64_t)i; ++i)
      {
        v12 = [v10 objectAtIndex:i];
        v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        v14 = [v12 stringByTrimmingCharactersInSet:v13];

        if ([(NSString *)v14 length])
        {
          float v15 = OAVReadLength(v14);
          float v16 = v15;
          switch(i)
          {
            case 0u:
              break;
            case 1u:
              float v4 = v15;
              goto LABEL_10;
            case 2u:
              float v5 = v15;
              goto LABEL_10;
            case 3u:
              float v6 = v15;
              goto LABEL_10;
            default:
              goto LABEL_10;
          }
        }
        else
        {
LABEL_10:
          float v16 = v3;
        }

        float v3 = v16;
      }
    }
  }
  float v17 = v3;
  float v18 = v4;
  float v19 = v5;
  float v20 = v6;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (id)textLayoutFlow
{
  v2 = [(NSDictionary *)self->mTextBoxStyle objectForKey:@"layout-flow"];
  if (!v2) {
    v2 = @"horizontal";
  }
  return v2;
}

- (id)textAltLayoutFlow
{
  return [(NSDictionary *)self->mTextBoxStyle objectForKey:@"mso-layout-flow-alt"];
}

- (BOOL)fitShapeToText
{
  v2 = [(NSDictionary *)self->mTextBoxStyle objectForKey:@"mso-fit-shape-to-text"];
  char v3 = [v2 isEqualToString:@"t"];

  return v3;
}

- (id)textAnchor
{
  v2 = [(NSDictionary *)self->mShapeStyle objectForKey:@"v-text-anchor"];
  if (!v2) {
    v2 = @"top";
  }
  return v2;
}

- (id)strokeFgColor
{
  CXDefaultStringAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"strokecolor", (NSString *)@"black");
  char v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  float v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v4)
  {
    uint64_t v5 = CXDefaultStringAttribute(v4, (CXNamespace *)CXNoNamespace, (xmlChar *)"color", v3);

    char v3 = (NSString *)v5;
  }
  return v3;
}

- (float)strokeFgAlpha
{
  v2 = (NSString *)@"1.0";
  char v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"opacity", (NSString *)@"1.0");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  float v4 = OAVReadFraction(v2);

  return v4;
}

- (BOOL)isStroked
{
  if (![(OAVShapeManager *)self isStrokeOK])
  {
    LOBYTE(v4) = 0;
    return v4;
  }
  uint64_t isStrokeOn = EshShapeLib::isStrokeOn((EshShapeLib *)self->mType, 1);
  uint64_t v4 = CXDefaultBoolAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"stroked", isStrokeOn);
  uint64_t v5 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (!v5) {
    return v4;
  }
  float v6 = (CXNamespace *)CXNoNamespace;
  return CXDefaultBoolAttribute(v5, v6, (xmlChar *)"on", v4);
}

- (BOOL)isStrokeOK
{
  uint64_t isStrokeOK = EshShapeLib::isStrokeOK((EshShapeLib *)self->mType, 1);
  uint64_t v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "path");
  if (!v4) {
    return isStrokeOK;
  }
  uint64_t v5 = (CXNamespace *)CXNoNamespace;
  return CXDefaultBoolAttribute(v4, v5, (xmlChar *)"strokeok", isStrokeOK);
}

- (id)strokeFillType
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"filltype", (NSString *)@"solid");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"solid";
  }
  return v3;
}

- (id)strokeDashStyle
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"dashstyle", (NSString *)@"solid");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"solid";
  }
  return v3;
}

- (id)strokeJoinStyle
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"joinstyle", (NSString *)@"round");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"round";
  }
  return v3;
}

- (id)strokeStartArrowType
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"startarrow", (NSString *)@"none");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"none";
  }
  return v3;
}

- (id)strokeStartArrowWidth
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"startarrowwidth", (NSString *)@"medium");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"medium";
  }
  return v3;
}

- (id)strokeStartArrowLength
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"startarrowlength", (NSString *)@"medium");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"medium";
  }
  return v3;
}

- (id)strokeEndArrowType
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"endarrow", (NSString *)@"none");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"none";
  }
  return v3;
}

- (id)strokeEndArrowWidth
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"endarrowwidth", (NSString *)@"medium");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"medium";
  }
  return v3;
}

- (id)strokeEndArrowLength
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"endarrowlength", (NSString *)@"medium");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"medium";
  }
  return v3;
}

- (float)strokeWidth
{
  CXDefaultStringAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"strokeweight", (NSString *)@"0.75pt");
  char v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v4)
  {
    uint64_t v5 = CXDefaultStringAttribute(v4, (CXNamespace *)CXNoNamespace, (xmlChar *)"weight", v3);

    char v3 = (NSString *)v5;
  }
  float v6 = OAVReadLength(v3);

  return v6;
}

- (id)strokeCapStyle
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"endcap", (NSString *)@"flat");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"flat";
  }
  return v3;
}

- (id)strokeCompoundType
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"linestyle", (NSString *)@"single");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"single";
  }
  return v3;
}

- (BOOL)isShadowed
{
  if (![(OAVShapeManager *)self isShadowOK]) {
    return 0;
  }
  char v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "shadow");
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (CXNamespace *)CXNoNamespace;
  return CXDefaultBoolAttribute(v3, v4, (xmlChar *)"on", 0);
}

- (BOOL)isShadowOK
{
  uint64_t isShadowOK = EshShapeLib::isShadowOK((EshShapeLib *)self->mType, 1);
  uint64_t v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "path");
  if (!v4) {
    return isShadowOK;
  }
  uint64_t v5 = (CXNamespace *)CXNoNamespace;
  return CXDefaultBoolAttribute(v4, v5, (xmlChar *)"shadowok", isShadowOK);
}

- (id)shadowColor
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "shadow");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"color", (NSString *)@"#808080");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"#808080";
  }
  return v3;
}

- (float)shadowAlpha
{
  v2 = (NSString *)@"1.0";
  char v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "shadow");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"opacity", (NSString *)@"1.0");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  float v4 = OAVReadFraction(v2);

  return v4;
}

- (CGPoint)shadowOffsets
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "shadow");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"offset", (NSString *)@"2pt,2pt");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"2pt,2pt";
  }
  float v4 = [(__CFString *)v3 componentsSeparatedByString:@","];
  uint64_t v5 = [v4 objectAtIndex:0];
  float v6 = OAVReadLength(v5);

  double v7 = 2.0;
  if ((unint64_t)[v4 count] >= 2)
  {
    v8 = [v4 objectAtIndex:1];
    float v9 = OAVReadLength(v8);

    double v7 = v9;
  }

  double v10 = v6;
  double v11 = v7;
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)packagePart
{
  return self->mPackagePart;
}

- (id)movieRelId
{
  mShape = self->mShape;
  float v4 = [(OAVReadState *)self->mOAVState oaxState];
  uint64_t v5 = [v4 OAXWordProcessingMLNamespace];
  float v6 = (_xmlNode *)OCXFindChild(mShape, v5, "movie");

  if (v6)
  {
    double v7 = [(OAVReadState *)self->mOAVState oaxState];
    v8 = [v7 OAXWordProcessingMLNamespace];
    float v9 = CXDefaultStringAttribute(v6, v8, (xmlChar *)"relid", 0);

    if (!v9)
    {
      double v10 = [(OCXReadState *)self->mOAVState OCXReadRelationshipForNode:v6 packagePart:self->mPackagePart];
      float v9 = [v10 identifier];
    }
  }
  else
  {
    float v9 = 0;
  }
  return v9;
}

- (float)fillAngle
{
  v2 = (NSString *)@"0";
  char v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"angle", (NSString *)@"0");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  float v4 = OAVReadAngle(v2);

  return v4;
}

- (float)fillFocus
{
  v2 = (NSString *)@"0";
  char v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"focus", (NSString *)@"0");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  float v4 = OAVReadFraction(v2);

  return v4;
}

- (id)fillBgColor
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"color2", (NSString *)@"white");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"white";
  }
  return v3;
}

- (id)fillGradientColors
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"colors", 0);
    v2 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (float)fillBgAlpha
{
  v2 = (NSString *)@"1.0";
  char v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"opacity2", (NSString *)@"1.0");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  float v4 = OAVReadFraction(v2);

  return v4;
}

- (id)imageFillId
{
  char v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v3)
  {
    float v4 = v3;
    uint64_t v5 = CXDefaultStringAttribute(v3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"relid", 0);
    if (!v5)
    {
      float v6 = [(OCXReadState *)self->mOAVState OCXReadRelationshipForNode:v4 packagePart:self->mPackagePart];
      uint64_t v5 = [v6 identifier];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)textRotation
{
  v2 = [(NSDictionary *)self->mTextBoxStyle objectForKey:@"mso-rotate"];
  if (!v2) {
    v2 = @"0";
  }
  return v2;
}

- (id)textWrapStyle
{
  v2 = [(NSDictionary *)self->mShapeStyle objectForKey:@"mso-wrap-style"];
  if (!v2) {
    v2 = @"square";
  }
  return v2;
}

- (id)limo
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "path");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"limo", 0);
    v2 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)textBodyRects
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "path");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"TextBodyrect", 0);
    v2 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (OAVShapeManager)initWithShape:(_xmlNode *)a3 type:(unsigned __int16)a4 packagePart:(id)a5 state:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)OAVShapeManager;
  v13 = [(OAVShapeManager *)&v24 init];
  v14 = v13;
  if (v13)
  {
    v13->mShape = a3;
    v13->mType = a4;
    objc_storeStrong((id *)&v13->mPackagePart, a5);
    CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"style");
    float v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = OAVReadComposite(v15);
    mShapeStyle = v14->mShapeStyle;
    v14->mShapeStyle = (NSDictionary *)v16;

    float v18 = (_xmlNode *)OCXFindChild(v14->mShape, (CXNamespace *)OAVOfficeMainNamespace, "textbox");
    if (v18)
    {
      CXDefaultStringAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"style", 0);
      float v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      float v20 = v19;
      if (v19)
      {
        uint64_t v21 = OAVReadComposite(v19);
        mTextBoxStyle = v14->mTextBoxStyle;
        v14->mTextBoxStyle = (NSDictionary *)v21;
      }
    }
    objc_storeStrong((id *)&v14->mOAVState, a6);
  }
  return v14;
}

- (id)oavState
{
  return self->mOAVState;
}

- (BOOL)isPolyline
{
  return xmlStrEqual(self->mShape->name, (const xmlChar *)"polyline") != 0;
}

- (id)points
{
  return CXDefaultStringAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"points", 0);
}

- (id)imageFillTitle
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"title", 0);
    v2 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)strokeBgColor
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"color2", (NSString *)@"white");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"white";
  }
  return v3;
}

- (float)strokeMiterLimit
{
  v2 = (NSString *)@"8.0";
  char v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"miterlimit", (NSString *)@"8.0");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  float v4 = OAVReadFraction(v2);

  return v4;
}

- (id)shadowType
{
  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "shadow");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", (NSString *)@"single");
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = @"single";
  }
  return v3;
}

- (BOOL)autoInsets
{
  v2 = CXDefaultStringAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"insetmode", 0);
  char v3 = [v2 isEqualToString:@"auto"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOAVState, 0);
  objc_storeStrong((id *)&self->mTextBoxStyle, 0);
  objc_storeStrong((id *)&self->mShapeStyle, 0);
  objc_storeStrong((id *)&self->mPackagePart, 0);
}

@end