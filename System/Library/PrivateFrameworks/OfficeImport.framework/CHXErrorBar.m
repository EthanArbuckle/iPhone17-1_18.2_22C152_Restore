@interface CHXErrorBar
+ (id)chdErrorBarFromXmlErrorBarElement:(_xmlNode *)a3 state:(id)a4;
+ (id)chxErrorBarTypeFromEnum:(int)a3;
+ (id)chxErrorBarValueTypeFromEnum:(int)a3;
+ (int)chdErrorBarDirectionFromXmlElement:(_xmlNode *)a3;
+ (int)chdErrorBarTypeFromXmlElement:(_xmlNode *)a3;
+ (int)chdErrorBarValueTypeFromXmlElement:(_xmlNode *)a3;
@end

@implementation CHXErrorBar

+ (id)chdErrorBarFromXmlErrorBarElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = [CHDErrorBar alloc];
  v8 = [v6 chart];
  v9 = [(CHDErrorBar *)v7 initWithChart:v8];

  v10 = [v6 drawingState];
  v11 = [v10 OAXChartNamespace];
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "val");

  if (v12)
  {
    double v35 = 0.0;
    if (CXOptionalDoubleAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v35)) {
      [(CHDErrorBar *)v9 setValue:v35];
    }
  }
  v13 = [v6 drawingState];
  v14 = [v13 OAXChartNamespace];
  uint64_t v15 = OCXFindChild(a3, v14, "errBarType");

  -[CHDErrorBar setType:](v9, "setType:", [a1 chdErrorBarTypeFromXmlElement:v15]);
  v16 = [v6 drawingState];
  v17 = [v16 OAXChartNamespace];
  uint64_t v18 = OCXFindChild(a3, v17, "errValType");

  -[CHDErrorBar setValueType:](v9, "setValueType:", [a1 chdErrorBarValueTypeFromXmlElement:v18]);
  v19 = [v6 drawingState];
  v20 = [v19 OAXChartNamespace];
  uint64_t v21 = OCXFindChild(a3, v20, "errDir");

  -[CHDErrorBar setDirection:](v9, "setDirection:", [a1 chdErrorBarDirectionFromXmlElement:v21]);
  v22 = [v6 drawingState];
  v23 = [v22 OAXChartNamespace];
  v24 = (_xmlNode *)OCXFindChild(a3, v23, "noEndCap");

  if (v24) {
    [(CHDErrorBar *)v9 setNoEndCap:CXRequiredBoolAttribute(v24, (CXNamespace *)CXNoNamespace, (xmlChar *)"val")];
  }
  v25 = [v6 drawingState];
  v26 = [v25 OAXChartNamespace];
  uint64_t v27 = OCXFindChild(a3, v26, "minus");

  if (v27)
  {
    v28 = +[CHXData chdDataFromXmlDataElement:v27 state:v6];
    [(CHDErrorBar *)v9 setMinusValues:v28];
  }
  v29 = [v6 drawingState];
  v30 = [v29 OAXChartNamespace];
  uint64_t v31 = OCXFindChild(a3, v30, "plus");

  if (v31)
  {
    v32 = +[CHXData chdDataFromXmlDataElement:v31 state:v6];
    [(CHDErrorBar *)v9 setPlusValues:v32];
  }
  v33 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v33 element:a3 state:v6];
  [(CHDErrorBar *)v9 setGraphicProperties:v33];

  return v9;
}

+ (int)chdErrorBarTypeFromXmlElement:(_xmlNode *)a3
{
  if (!a3) {
    return 0;
  }
  id v7 = 0;
  int v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v7);
  id v4 = v7;
  v5 = v4;
  if (v3)
  {
    [v4 isEqualToString:@"both"];
    int v3 = [v5 isEqualToString:@"minus"];
    if ([v5 isEqualToString:@"plus"]) {
      int v3 = 2;
    }
  }

  return v3;
}

+ (int)chdErrorBarValueTypeFromXmlElement:(_xmlNode *)a3
{
  if (!a3) {
    return 2;
  }
  id v15 = 0;
  BOOL v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v15);
  id v4 = v15;
  v5 = v4;
  if (v3)
  {
    int v6 = [v4 isEqualToString:@"cust"];
    int v7 = [v5 isEqualToString:@"fixedVal"];
    int v8 = [v5 isEqualToString:@"percentage"];
    int v9 = [v5 isEqualToString:@"stdDev"];
    int v10 = [v5 isEqualToString:@"stdErr"];
    if (v6) {
      int v11 = 4;
    }
    else {
      int v11 = 2;
    }
    if (v7) {
      int v12 = 2;
    }
    else {
      int v12 = v11;
    }
    if (v8) {
      int v12 = 1;
    }
    if (v9) {
      int v12 = 3;
    }
    if (v10) {
      int v13 = 5;
    }
    else {
      int v13 = v12;
    }
  }
  else
  {
    int v13 = 2;
  }

  return v13;
}

+ (int)chdErrorBarDirectionFromXmlElement:(_xmlNode *)a3
{
  if (!a3) {
    return 1;
  }
  id v9 = 0;
  BOOL v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v9);
  id v4 = v9;
  v5 = v4;
  if (v3)
  {
    int v6 = [v4 isEqualToString:@"x"];
    int v7 = [v5 isEqualToString:@"y"] | v6 ^ 1;
  }
  else
  {
    int v7 = 1;
  }

  return v7;
}

+ (id)chxErrorBarTypeFromEnum:(int)a3
{
  BOOL v3 = @"both";
  if (a3 == 1) {
    BOOL v3 = @"minus";
  }
  if (a3 == 2) {
    return @"plus";
  }
  else {
    return v3;
  }
}

+ (id)chxErrorBarValueTypeFromEnum:(int)a3
{
  if ((a3 - 1) > 4) {
    return @"fixedVal";
  }
  else {
    return off_264D67D00[a3 - 1];
  }
}

@end