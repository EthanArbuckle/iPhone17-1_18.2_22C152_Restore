@interface CHXMarker
+ (id)chdMarkerFromXmlMarkerElement:(_xmlNode *)a3 state:(id)a4;
+ (id)stringFromMarkerStyle:(int)a3;
+ (int)chdMarkerStyleFromXmlMarkerStyleElement:(_xmlNode *)a3;
@end

@implementation CHXMarker

+ (id)chdMarkerFromXmlMarkerElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(CHDMarker);
  v8 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v8 element:a3 state:v6];
  [(CHDMarker *)v7 setGraphicProperties:v8];
  if (!a3) {
    goto LABEL_16;
  }
  v9 = [v6 drawingState];
  v10 = [v9 OAXChartNamespace];
  uint64_t v11 = OCXFindChild(a3, v10, "symbol");

  if (v11) {
    uint64_t v12 = [a1 chdMarkerStyleFromXmlMarkerStyleElement:v11];
  }
  else {
    uint64_t v12 = 2;
  }
  if ([(OADGraphicProperties *)v8 hasFill])
  {
    v13 = [(OADGraphicProperties *)v8 fill];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [(OADGraphicProperties *)v8 hasStroke])
    {
      v14 = [(OADGraphicProperties *)v8 stroke];
      if ([v14 isFillOverridden])
      {
        v15 = [(OADGraphicProperties *)v8 stroke];
        v16 = [v15 fill];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = v12;
        }
        goto LABEL_14;
      }
    }
  }
LABEL_14:
  [(CHDMarker *)v7 setStyle:v12];
  v18 = [v6 drawingState];
  v19 = [v18 OAXChartNamespace];
  v20 = (_xmlNode *)OCXFindChild(a3, v19, "size");

  if (v20) {
    [(CHDMarker *)v7 setSize:CXRequiredUnsignedLongAttribute(v20, (CXNamespace *)CXNoNamespace, (xmlChar *)"val")];
  }
LABEL_16:

  return v7;
}

+ (int)chdMarkerStyleFromXmlMarkerStyleElement:(_xmlNode *)a3
{
  v3 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  if ([v3 isEqualToString:@"circle"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"dash"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"diamond"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"dot"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"none"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"plus"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"square"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"star"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"triangle"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"x"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (id)stringFromMarkerStyle:(int)a3
{
  if ((a3 + 1) > 0xB) {
    return @"dot";
  }
  else {
    return off_264D67D28[a3 + 1];
  }
}

@end