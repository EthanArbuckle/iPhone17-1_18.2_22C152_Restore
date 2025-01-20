@interface OAXTextCharPropertyBag
+ (id)oaxUnderlineMap;
+ (id)stringWithCapsType:(unsigned __int8)a3;
+ (id)stringWithStrikeThroughType:(unsigned __int8)a3;
+ (id)stringWithUnderlineType:(unsigned __int8)a3;
+ (unsigned)readUnderlineType:(id)a3;
+ (void)readCharacterProperties:(_xmlNode *)a3 characterProperties:(id)a4 drawingState:(id)a5;
+ (void)readFont:(_xmlNode *)a3 characterProperties:(id)a4;
+ (void)readFormatting:(_xmlNode *)a3 characterProperties:(id)a4 drawingState:(id)a5;
@end

@implementation OAXTextCharPropertyBag

+ (void)readCharacterProperties:(_xmlNode *)a3 characterProperties:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    BOOL v36 = 0;
    double v34 = 0.0;
    uint64_t v35 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"b", &v36)) {
      [v8 setIsBold:v36];
    }
    uint64_t v10 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"u", 0);
    v33 = (void *)v10;
    if (v10) {
      objc_msgSend(v8, "setUnderlineType:", objc_msgSend(a1, "readUnderlineType:", v10));
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"i", &v36)) {
      [v8 setIsItalic:v36];
    }
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"sz", &v35, 15))
    {
      *(float *)&double v11 = (float)(v35 / 100);
      [v8 setSize:v11];
    }
    if (CXOptionalFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"baseline", &v34))
    {
      HIDWORD(v12) = HIDWORD(v34);
      *(float *)&double v12 = v34;
      [v8 setBaseline:v12];
    }
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"spc", &v35, 16))
    {
      double v13 = (double)v35 / 100.0;
      *(float *)&double v13 = v13;
      [v8 setSpacing:v13];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"kumimoji", &v36)) {
      [v8 setIsVerticalText:v36];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rtl", &v36)) {
      [v8 setIsRightToLeft:v36];
    }
    v14 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"strike", 0);
    v15 = v14;
    v32 = v14;
    if (v14)
    {
      if ([v14 isEqualToString:@"noStrike"])
      {
        uint64_t v16 = 0;
      }
      else if ([v15 isEqualToString:@"sngStrike"])
      {
        uint64_t v16 = 1;
      }
      else if ([v15 isEqualToString:@"dblStrike"])
      {
        uint64_t v16 = 2;
      }
      else
      {
        uint64_t v16 = 0;
      }
      [v8 setStrikeThroughType:v16];
    }
    v17 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"cap", 0);
    v18 = v17;
    v31 = v17;
    if (v17)
    {
      if ([v17 isEqualToString:@"none"])
      {
        uint64_t v19 = 0;
      }
      else if ([v18 isEqualToString:@"small"])
      {
        uint64_t v19 = 1;
      }
      else if ([v18 isEqualToString:@"all"])
      {
        uint64_t v19 = 2;
      }
      else
      {
        uint64_t v19 = 0;
      }
      [v8 setCaps:v19];
    }
    CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"lang", 0);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v30 = v20;
    if ([(NSString *)v20 length]) {
      [v8 setLanguage:OCDLanguageFromOfficeString(v20)];
    }
    id v29 = a1;
    for (i = OCXFirstChild(a3); ; i = OCXNextSibling(i))
    {
      if (!i)
      {

        goto LABEL_72;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"ln")) {
        break;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"uFill"))
      {
        v24 = CXFirstChild(i);
        v25 = [v9 packagePart];
        v23 = +[OAXFill readFillFromXmlNode:v24 packagePart:v25 drawingState:v9];

        if (v23) {
          [v8 setUnderlineFill:v23];
        }
        goto LABEL_46;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"uFillTx"))
      {
        [v8 setUnderlineFill:0];
      }
      else
      {
        if (xmlStrEqual(i->name, (const xmlChar *)"uLn"))
        {
          v26 = [v9 packagePart];
          v23 = +[OAXStroke readStrokeFromXmlNode:i packagePart:v26 drawingState:v9];

          if (v23) {
            [v8 setUnderlineStroke:v23];
          }
          goto LABEL_46;
        }
        if (xmlStrEqual(i->name, (const xmlChar *)"uLnTx"))
        {
          [v8 setUnderlineStroke:0];
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"formatting"))
        {
          [v29 readFormatting:i characterProperties:v8 drawingState:v9];
        }
        else
        {
          if (!xmlStrEqual(i->name, (const xmlChar *)"latin")
            && !xmlStrEqual(i->name, (const xmlChar *)"ea")
            && !xmlStrEqual(i->name, (const xmlChar *)"cs")
            && !xmlStrEqual(i->name, (const xmlChar *)"hAnsi")
            && !xmlStrEqual(i->name, (const xmlChar *)"sym"))
          {
            if (xmlStrEqual(i->name, (const xmlChar *)"hlinkClick"))
            {
              v23 = +[OAXHyperlink readHyperlink:i state:v9];
              [v8 setClickHyperlink:v23];
            }
            else if (xmlStrEqual(i->name, (const xmlChar *)"hlinkMouseOver"))
            {
              v23 = +[OAXHyperlink readHyperlink:i state:v9];
              [v8 setHoverHyperlink:v23];
            }
            else if (xmlStrEqual(i->name, (const xmlChar *)"effectLst"))
            {
              v23 = [v9 packagePart];
              v27 = +[OAXEffect readEffectsFromXmlNode:i packagePart:v23 drawingState:v9];
              [v8 setEffects:v27];
            }
            else
            {
              v28 = [v9 packagePart];
              v23 = +[OAXFill readFillFromXmlNode:i packagePart:v28 drawingState:v9];

              if (v23) {
                [v8 setFill:v23];
              }
            }
            goto LABEL_46;
          }
          objc_msgSend(v29, "readFont:characterProperties:", i, v8, v29);
        }
      }
LABEL_47:
      ;
    }
    v22 = [v9 packagePart];
    v23 = +[OAXStroke readStrokeFromXmlNode:i packagePart:v22 drawingState:v9];

    if (v23) {
      [v8 setStroke:v23];
    }
LABEL_46:

    goto LABEL_47;
  }
LABEL_72:
}

+ (void)readFont:(_xmlNode *)a3 characterProperties:(id)a4
{
  id v6 = a4;
  v5 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"typeface");
  if (xmlStrEqual(a3->name, (const xmlChar *)"latin"))
  {
    [v6 setLatinFont:v5];
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"ea"))
  {
    [v6 setEastAsianFont:v5];
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"cs"))
  {
    [v6 setBidiFont:v5];
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"hAnsi"))
  {
    [v6 setHAnsiFont:v5];
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"sym"))
  {
    [v6 setSymbolFont:v5];
  }
}

+ (id)oaxUnderlineMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_13, 0, &dword_238A75000);
  }
  if (+[OAXTextCharPropertyBag(Private) oaxUnderlineMap]::once != -1) {
    dispatch_once(&+[OAXTextCharPropertyBag(Private) oaxUnderlineMap]::once, &__block_literal_global_52);
  }
  v2 = (void *)+[OAXTextCharPropertyBag(Private) oaxUnderlineMap]::enumerationMap;
  return v2;
}

void __50__OAXTextCharPropertyBag_Private__oaxUnderlineMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXTextCharPropertyBag(Private) oaxUnderlineMap]::oaxUnderlineMap count:20 caseSensitive:1];
  v1 = (void *)+[OAXTextCharPropertyBag(Private) oaxUnderlineMap]::enumerationMap;
  +[OAXTextCharPropertyBag(Private) oaxUnderlineMap]::enumerationMap = (uint64_t)v0;
}

+ (unsigned)readUnderlineType:(id)a3
{
  id v4 = a3;
  v5 = [a1 oaxUnderlineMap];
  uint64_t v6 = [v5 valueForString:v4];

  if (v6 == -130883970) {
    unsigned __int8 v7 = 0;
  }
  else {
    unsigned __int8 v7 = v6;
  }

  return v7;
}

+ (void)readFormatting:(_xmlNode *)a3 characterProperties:(id)a4 drawingState:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v15 = 0;
  id v9 = [v8 OAXMainNamespace];
  uint64_t v10 = (_xmlNode *)OCXFindChild(a3, v9, "outline");

  if (v10 && CXOptionalBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v15)) {
    [v7 setFormatType:1];
  }
  double v11 = [v8 OAXMainNamespace];
  double v12 = (_xmlNode *)OCXFindChild(a3, v11, "engrave");

  if (v12 && CXOptionalBoolAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v15)) {
    [v7 setFormatType:2];
  }
  double v13 = [v8 OAXMainNamespace];
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "emboss");

  if (v14 && CXOptionalBoolAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v15)) {
    [v7 setFormatType:3];
  }
}

+ (id)stringWithCapsType:(unsigned __int8)a3
{
  if (a3 > 2u) {
    return @"none";
  }
  else {
    return off_264D62668[(char)a3];
  }
}

+ (id)stringWithStrikeThroughType:(unsigned __int8)a3
{
  if (a3 > 2u) {
    return @"noStrike";
  }
  else {
    return off_264D62680[(char)a3];
  }
}

+ (id)stringWithUnderlineType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [a1 oaxUnderlineMap];
  v5 = [v4 stringForValue:v3];

  return v5;
}

@end