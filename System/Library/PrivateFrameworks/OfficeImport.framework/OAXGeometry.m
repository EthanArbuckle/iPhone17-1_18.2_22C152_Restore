@interface OAXGeometry
+ (OADAdjustCoord)readAdjustCoordFromXmlNode:(_xmlNode *)a3 name:(const char *)a4 formulaNameToIndexMap:(id)a5;
+ (id)formulaKeywordEnumMap;
+ (id)formulaTypeEnumMap;
+ (id)pathFillModeEnumMap;
+ (id)readCustomGeometryFromXmlNode:(_xmlNode *)a3 hasImplicitFormulas:(BOOL)a4 drawingState:(id)a5;
+ (id)readFromParentXmlNode:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readPresetGeometryFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)shapeTypeEnumMap;
+ (id)stringForShapeType:(int)a3;
+ (id)stringWritingShapeType:(int)a3;
+ (int)adjustValueWithGuideXmlNode:(_xmlNode *)a3;
+ (int)shapeTypeForString:(id)a3;
+ (void)addFormulasFromFile:(id)a3 toCustomGeometry:(id)a4 formulaNameToIndexMap:(id)a5 drawingState:(id)a6;
+ (void)readAdjustValuesFromCustomGeometryXmlNode:(_xmlNode *)a3 toCustomGeometry:(id)a4 adjustValueNameToIndexMap:(id)a5 drawingState:(id)a6;
+ (void)readFormulasFromCustomGeometryXmlNode:(_xmlNode *)a3 toCustomGeometry:(id)a4 adjustValueNameToIndexMap:(id)a5 formulaNameToIndexMap:(id)a6 drawingState:(id)a7;
+ (void)readPathsFromCustomGeometryXmlNode:(_xmlNode *)a3 toCustomGeometry:(id)a4 formulaNameToIndexMap:(id)a5 drawingState:(id)a6;
+ (void)readTextRectFromCustomGeometryXmlNode:(_xmlNode *)a3 toCustomGeometry:(id)a4 formulaNameToIndexMap:(id)a5 drawingState:(id)a6;
+ (void)write:(id)a3 to:(id)a4;
+ (void)writePath:(id)a3 coordSpace:(CsRect<int>)a4 to:(id)a5;
+ (void)writeShapePathPoint:(OADAdjustPoint)a3 origin:(CsPoint<int>)a4 to:(id)a5;
@end

@implementation OAXGeometry

+ (int)shapeTypeForString:(id)a3
{
  id v4 = a3;
  v5 = [a1 shapeTypeEnumMap];
  int v6 = [v5 valueForString:v4];

  return v6;
}

+ (id)shapeTypeEnumMap
{
  if (+[OAXGeometry(Private) shapeTypeEnumMap]::once != -1) {
    dispatch_once(&+[OAXGeometry(Private) shapeTypeEnumMap]::once, &__block_literal_global_49);
  }
  v2 = (void *)+[OAXGeometry(Private) shapeTypeEnumMap]::shapeTypeEnumMap;
  return v2;
}

+ (id)formulaTypeEnumMap
{
  if (+[OAXGeometry(Private) formulaTypeEnumMap]::once != -1) {
    dispatch_once(&+[OAXGeometry(Private) formulaTypeEnumMap]::once, &__block_literal_global_735);
  }
  v2 = (void *)+[OAXGeometry(Private) formulaTypeEnumMap]::formulaTypeEnumMap;
  return v2;
}

+ (id)formulaKeywordEnumMap
{
  if (+[OAXGeometry(Private) formulaKeywordEnumMap]::once != -1) {
    dispatch_once(&+[OAXGeometry(Private) formulaKeywordEnumMap]::once, &__block_literal_global_786);
  }
  v2 = (void *)+[OAXGeometry(Private) formulaKeywordEnumMap]::formulaKeywordEnumMap;
  return v2;
}

+ (OADAdjustCoord)readAdjustCoordFromXmlNode:(_xmlNode *)a3 name:(const char *)a4 formulaNameToIndexMap:(id)a5
{
  id v7 = a5;
  v8 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4);
  v9 = [v7 objectForKey:v8];
  v10 = v9;
  if (v9) {
    v11 = (_xmlAttr *)[v9 unsignedIntValue];
  }
  else {
    v11 = CXRequiredLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, 12);
  }
  OADAdjustCoord v12 = (OADAdjustCoord)((v10 != 0) | ((void)v11 << 32));

  return v12;
}

+ (int)adjustValueWithGuideXmlNode:(_xmlNode *)a3
{
  v3 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fmla");
  id v4 = objc_msgSend(v3, "tc_componentsSeparatedByWhitespace");
  if ([v4 count] != 2) {
    +[TCMessageException raise:OABadFormat];
  }
  v5 = [v4 objectAtIndex:0];
  char v6 = [v5 isEqualToString:@"val"];

  if ((v6 & 1) == 0) {
    +[TCMessageException raise:OABadFormat];
  }
  id v7 = [v4 objectAtIndex:1];
  int v8 = [v7 intValue];

  return v8;
}

+ (id)stringForShapeType:(int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    id v4 = [a1 shapeTypeEnumMap];
    v5 = [v4 stringForValue:v3];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)pathFillModeEnumMap
{
  if (+[OAXGeometry(Private) pathFillModeEnumMap]::once != -1) {
    dispatch_once(&+[OAXGeometry(Private) pathFillModeEnumMap]::once, &__block_literal_global_789);
  }
  v2 = (void *)+[OAXGeometry(Private) pathFillModeEnumMap]::pathFillModeEnumMap;
  return v2;
}

+ (id)readFromParentXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  id v7 = [v6 OAXMainNamespace];
  uint64_t v8 = OCXFindChild(a3, v7, "prstGeom");

  if (v8)
  {
    uint64_t v9 = [a1 readPresetGeometryFromXmlNode:v8 drawingState:v6];
LABEL_5:
    OADAdjustCoord v12 = (void *)v9;
    goto LABEL_6;
  }
  v10 = [v6 OAXMainNamespace];
  uint64_t v11 = OCXFindChild(a3, v10, "custGeom");

  if (v11)
  {
    uint64_t v9 = [a1 readCustomGeometryFromXmlNode:v11 hasImplicitFormulas:0 drawingState:v6];
    goto LABEL_5;
  }
  OADAdjustCoord v12 = 0;
LABEL_6:

  return v12;
}

+ (id)readCustomGeometryFromXmlNode:(_xmlNode *)a3 hasImplicitFormulas:(BOOL)a4 drawingState:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = objc_alloc_init(OADCustomShapeGeometry);
  [(OADShapeGeometry *)v9 setIsEscher:0];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [a1 readAdjustValuesFromCustomGeometryXmlNode:a3 toCustomGeometry:v9 adjustValueNameToIndexMap:v10 drawingState:v8];
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [a1 addFormulasFromFile:@"_KeywordFormulas" toCustomGeometry:v9 formulaNameToIndexMap:v11 drawingState:v8];
  if (v5) {
    [a1 addFormulasFromFile:@"_ImplicitFormulas" toCustomGeometry:v9 formulaNameToIndexMap:v11 drawingState:v8];
  }
  [a1 readFormulasFromCustomGeometryXmlNode:a3 toCustomGeometry:v9 adjustValueNameToIndexMap:v10 formulaNameToIndexMap:v11 drawingState:v8];
  [a1 readTextRectFromCustomGeometryXmlNode:a3 toCustomGeometry:v9 formulaNameToIndexMap:v11 drawingState:v8];
  [a1 readPathsFromCustomGeometryXmlNode:a3 toCustomGeometry:v9 formulaNameToIndexMap:v11 drawingState:v8];

  return v9;
}

+ (void)write:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = v6;
      id v8 = v6;
      [v8 geometryCoordSpace];
      [v7 startOAElement:@"custGeom"];
      [v7 startOAElement:@"avLst"];
      [v7 endElement];
      [v7 startOAElement:@"gdLst"];
      [v7 endElement];
      [v7 startOAElement:@"ahLst"];
      [v7 endElement];
      [v7 startOAElement:@"cxnLst"];
      uint64_t v9 = 0;
      int v10 = 4;
      do
      {
        [v7 startOAElement:@"cxn"];
        [v7 writeOAAttribute:@"ang" intContent:v9];
        [v7 startOAElement:@"pos"];
        [v7 writeOAAttribute:@"x" content:@"wd2"];
        [v7 writeOAAttribute:@"y" content:@"hd2"];
        [v7 endElement];
        [v7 endElement];
        v9 += 5400000;
        --v10;
      }
      while (v10);
      [v7 endElement];
      [v7 startOAElement:@"rect"];
      [v7 writeOAAttribute:@"l" intContent:0];
      [v7 writeOAAttribute:@"t" intContent:0];
      [v7 writeOAAttribute:@"r" content:@"r"];
      [v7 writeOAAttribute:@"b" content:@"b"];
      [v7 endElement];
      [v7 startOAElement:@"pathLst"];
      for (unint64_t i = 0; i < [v8 pathCount]; ++i)
      {
        OADAdjustCoord v12 = [v8 pathAtIndex:i];
        v29[0] = v29[1];
        [a1 writePath:v12 coordSpace:v29 to:v7];
      }
      [v7 endElement];
      [v7 endElement];
LABEL_21:

      id v6 = v28;
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = v6;
      id v8 = v6;
      [v7 startOAElement:@"prstGeom"];
      v27 = objc_msgSend(a1, "stringWritingShapeType:", objc_msgSend(v8, "type"));
      [v7 writeOAAttribute:@"prst" content:v27];
      [v7 startOAElement:@"avLst"];
      if ([v8 adjustValueCount])
      {
        v26 = +[TCBundleResourceManager instance];
        v13 = (_xmlDoc *)[v26 xmlDocumentForResource:v27 ofType:@"xml" inPackage:@"OAShapeTypes"];
        if (v13)
        {
          v14 = [[OAXDrawingState alloc] initWithClient:0];
          v15 = OCXGetRootElement(v13);
          v16 = [(OAXDrawingState *)v14 OAXMainNamespace];
          v17 = (_xmlNode *)OCXFindChild(v15, v16, "avLst");

          if (v17)
          {
            v18 = [(OAXDrawingState *)v14 OAXMainNamespace];
            Child = (_xmlNode *)OCXFindChild(v17, v18, "gd");

            if (Child)
            {
              uint64_t v20 = 0;
              do
              {
                int v21 = [a1 adjustValueWithGuideXmlNode:Child];
                if ([v8 hasAdjustValueAtIndex:v20]) {
                  int v21 = [v8 adjustValueAtIndex:v20];
                }
                id v22 = a1;
                v23 = CXRequiredStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"name");
                [v7 startOAElement:@"gd"];
                [v7 writeOAAttribute:@"name" content:v23];
                v24 = objc_msgSend(NSString, "stringWithFormat:", @"val %ld", v21);
                [v7 writeOAAttribute:@"fmla" content:v24];

                [v7 endElement];
                v25 = [(OAXDrawingState *)v14 OAXMainNamespace];
                Child = OCXFindNextChild(Child, v25, (xmlChar *)"gd");

                uint64_t v20 = (v20 + 1);
                a1 = v22;
              }
              while (Child);
            }
          }
        }
      }
      [v7 endElement];
      [v7 endElement];

      goto LABEL_21;
    }
  }
LABEL_22:
}

+ (id)stringWritingShapeType:(int)a3
{
  if (a3 == 202)
  {
    BOOL v5 = @"rect";
  }
  else
  {
    BOOL v5 = +[OAXGeometry stringForShapeType:v3];
  }
  return v5;
}

+ (id)readPresetGeometryFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  id v7 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst");
  if (v7)
  {
    id v8 = objc_alloc_init(OADPresetShapeGeometry);
    -[OADPresetShapeGeometry setType:](v8, "setType:", [a1 shapeTypeForString:v7]);
    uint64_t v9 = [v6 OAXMainNamespace];
    int v10 = (_xmlNode *)OCXFindChild(a3, v9, "avLst");

    if (v10)
    {
      id v11 = [v6 OAXMainNamespace];
      Child = (_xmlNode *)OCXFindChild(v10, v11, "gd");

      if (Child)
      {
        uint64_t v13 = 0;
        do
        {
          -[OADShapeGeometry setAdjustValue:atIndex:](v8, "setAdjustValue:atIndex:", [a1 adjustValueWithGuideXmlNode:Child], v13);
          v14 = [v6 OAXMainNamespace];
          Child = OCXFindNextChild(Child, v14, (xmlChar *)"gd");

          uint64_t v13 = (v13 + 1);
        }
        while (Child);
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (void)readAdjustValuesFromCustomGeometryXmlNode:(_xmlNode *)a3 toCustomGeometry:(id)a4 adjustValueNameToIndexMap:(id)a5 drawingState:(id)a6
{
  id v20 = a4;
  id v10 = a5;
  id v11 = a6;
  OADAdjustCoord v12 = [v11 OAXMainNamespace];
  uint64_t v13 = (_xmlNode *)OCXFindChild(a3, v12, "avLst");

  if (v13)
  {
    v14 = [v11 OAXMainNamespace];
    Child = (_xmlNode *)OCXFindChild(v13, v14, "gd");

    if (Child)
    {
      uint64_t v16 = 0;
      do
      {
        objc_msgSend(v20, "setAdjustValue:atIndex:", objc_msgSend(a1, "adjustValueWithGuideXmlNode:", Child), v16);
        v17 = CXRequiredStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"name");
        v18 = [NSNumber numberWithUnsignedInt:v16];
        [v10 setObject:v18 forKey:v17];

        v19 = [v11 OAXMainNamespace];
        Child = OCXFindNextChild(Child, v19, (xmlChar *)"gd");

        uint64_t v16 = (v16 + 1);
      }
      while (Child);
    }
  }
}

+ (void)readFormulasFromCustomGeometryXmlNode:(_xmlNode *)a3 toCustomGeometry:(id)a4 adjustValueNameToIndexMap:(id)a5 formulaNameToIndexMap:(id)a6 drawingState:(id)a7
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v42 = a4;
  id v50 = a5;
  id v11 = a6;
  id v43 = a7;
  OADAdjustCoord v12 = [v43 OAXMainNamespace];
  uint64_t v13 = (_xmlNode *)OCXFindChild(a3, v12, "gdLst");

  if (v13)
  {
    uint64_t v14 = [v11 count];
    v15 = [v43 OAXMainNamespace];
    Child = (_xmlNode *)OCXFindChild(v13, v15, "gd");

    if (Child)
    {
      while (1)
      {
        v48 = CXRequiredStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"fmla");
        v17 = objc_msgSend(v48, "tc_componentsSeparatedByWhitespace");
        int v18 = [v17 count];
        if (v18 - 1 <= 1) {
          unsigned int v19 = 1;
        }
        else {
          unsigned int v19 = v18 - 1;
        }
        if (v19 >= 3) {
          unsigned int v19 = 3;
        }
        if ((v18 - 2) >= 3) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = (v18 - 1);
        }
        uint64_t v21 = [v17 firstObject];
        v45 = Child;
        uint64_t v46 = v14;
        if (!v21) {
          +[TCMessageException raise:OABadFormat];
        }
        id v22 = [a1 formulaTypeEnumMap];
        uint64_t v23 = [v22 valueForString:v21];

        uint64_t v44 = v23;
        if (v23 == -130883970) {
          +[TCMessageException raise:OABadFormat];
        }
        v47 = (void *)v21;
        uint64_t v51 = 0;
        uint64_t v52 = 0;
        uint64_t v53 = 0;
        if ((int)v20 >= 1) {
          break;
        }
LABEL_31:
        v37 = [OADFormula alloc];
        v38 = [(OADFormula *)v37 initWithType:v44 arg0:v51 arg1:v52 arg2:v53];
        [v42 addFormula:v38];
        v39 = CXRequiredStringAttribute(v45, (CXNamespace *)CXNoNamespace, (xmlChar *)"name");
        v40 = [NSNumber numberWithUnsignedInt:v46];
        [v11 setObject:v40 forKey:v39];

        [(OADFormula *)v38 setName:v39];
        v41 = [v43 OAXMainNamespace];
        Child = OCXFindNextChild(v45, v41, (xmlChar *)"gd");
        uint64_t v14 = (v46 + 1);

        if (!Child) {
          goto LABEL_32;
        }
      }
      uint64_t v24 = 0;
      while (1)
      {
        uint64_t v25 = v24 + 1;
        v26 = [v17 objectAtIndex:v24 + 1];
        unsigned int v27 = [v26 characterAtIndex:0];
        id v28 = [v11 objectForKey:v26];

        if (v28) {
          break;
        }
        v32 = [v50 objectForKey:v26];

        if (v32)
        {
          v33 = [v50 objectForKey:v26];
          uint64_t v30 = [v33 unsignedLongValue];

          uint64_t v31 = 2;
          goto LABEL_29;
        }
        v34 = [a1 formulaKeywordEnumMap];
        uint64_t v35 = [v34 valueForString:v26];

        if (v35 != -130883970)
        {
          v36 = [a1 formulaKeywordEnumMap];
          uint64_t v30 = [v36 valueForString:v26];

          uint64_t v31 = 4;
          goto LABEL_29;
        }
        if (v27 <= 0xFF && ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v27 + 60) >> 10) & 1) != 0 || v27 == 45)
        {
          uint64_t v30 = [v26 intValue];
          uint64_t v31 = 1;
          goto LABEL_29;
        }
        +[TCMessageException raise:OABadFormat];
LABEL_30:

        ++v24;
        if (v20 == v25) {
          goto LABEL_31;
        }
      }
      v29 = [v11 objectForKey:v26];
      uint64_t v30 = [v29 unsignedLongValue];

      uint64_t v31 = 3;
LABEL_29:
      *(&v51 + v24) = v31 | (v30 << 32);
      goto LABEL_30;
    }
  }
LABEL_32:
}

+ (void)addFormulasFromFile:(id)a3 toCustomGeometry:(id)a4 formulaNameToIndexMap:(id)a5 drawingState:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = +[TCBundleResourceManager instance];
  uint64_t v14 = (_xmlDoc *)[v13 xmlDocumentForResource:v15 ofType:@"xml" inPackage:@"OAShapeTypes"];
  if (!v14)
  {
    +[TCMessageException raise:OABadFormat];
    uint64_t v14 = 0;
  }
  [a1 readFormulasFromCustomGeometryXmlNode:OCXGetRootElement(v14) toCustomGeometry:v10 adjustValueNameToIndexMap:0 formulaNameToIndexMap:v11 drawingState:v12];
}

+ (void)readTextRectFromCustomGeometryXmlNode:(_xmlNode *)a3 toCustomGeometry:(id)a4 formulaNameToIndexMap:(id)a5 drawingState:(id)a6
{
  id v14 = a4;
  id v10 = a5;
  id v11 = [a6 OAXMainNamespace];
  uint64_t v12 = OCXFindChild(a3, v11, "rect");

  if (v12)
  {
    uint64_t v13 = -[OADAdjustRect initWithLeft:top:right:bottom:]([OADAdjustRect alloc], "initWithLeft:top:right:bottom:", [a1 readAdjustCoordFromXmlNode:v12 name:"l" formulaNameToIndexMap:v10], objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", v12, "t", v10), objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", v12, "r", v10), objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", v12, "b", v10));
    [v14 addTextBodyRect:v13];
  }
}

+ (void)readPathsFromCustomGeometryXmlNode:(_xmlNode *)a3 toCustomGeometry:(id)a4 formulaNameToIndexMap:(id)a5 drawingState:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v35 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v11 OAXMainNamespace];
  uint64_t v13 = (_xmlNode *)OCXFindChild(a3, v12, "pathLst");

  if (v13)
  {
    id v14 = [v11 OAXMainNamespace];
    uint64_t v15 = OCXFindChild(v13, v14, "path");

    v37 = (_xmlNode *)v15;
    if (v15)
    {
      do
      {
        v38 = objc_alloc_init(OADPath);
        int v16 = CXDefaultLongAttribute(v37, (CXNamespace *)CXNoNamespace, (xmlChar *)"w", 0);
        -[OADPath setSize:](v38, "setSize:", (double)v16, (double)(int)CXDefaultLongAttribute(v37, (CXNamespace *)CXNoNamespace, (xmlChar *)"h", 0));
        v36 = CXDefaultStringAttribute(v37, (CXNamespace *)CXNoNamespace, (xmlChar *)"fill", 0);
        if (v36)
        {
          v17 = [a1 pathFillModeEnumMap];
          uint64_t v18 = [v17 valueForString:v36];

          [(OADPath *)v38 setFillMode:v18];
        }
        [(OADPath *)v38 setStroked:CXDefaultBoolAttribute(v37, (CXNamespace *)CXNoNamespace, (xmlChar *)"stroke", 1)];
        for (unint64_t i = OCXFirstChild(v37); i; unint64_t i = OCXNextSibling(i))
        {
          if (i->type != XML_ELEMENT_NODE) {
            continue;
          }
          uint64_t v20 = [v11 OAXMainNamespace];
          Child = (_xmlNode *)OCXFindChild(i, v20, "pt");

          if (Child)
          {
            unint64_t v22 = 0;
            uint64_t v23 = &v40;
            do
            {
              *(v23 - 1) = objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", Child, "x", v10, v35);
              uint64_t *v23 = [a1 readAdjustCoordFromXmlNode:Child name:"y" formulaNameToIndexMap:v10];
              uint64_t v24 = [v11 OAXMainNamespace];
              Child = OCXFindNextChild(Child, v24, (xmlChar *)"pt");

              int v25 = v22 + 1;
              if (!Child) {
                break;
              }
              v23 += 2;
            }
            while (v22++ < 2);
          }
          else
          {
            int v25 = 0;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"close"))
          {
            if (v25) {
              +[TCMessageException raise:OABadFormat];
            }
            unsigned int v27 = objc_alloc_init(OADClosePathElement);
            goto LABEL_26;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"moveTo"))
          {
            id v28 = off_264D60528;
            if (v25 != 1)
            {
              +[TCMessageException raise:OABadFormat];
              id v28 = off_264D60528;
            }
LABEL_25:
            id v29 = objc_alloc(*v28);
            unsigned int v27 = (OADClosePathElement *)objc_msgSend(v29, "initWithToPoint:", v39, v40);
            goto LABEL_26;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"lnTo"))
          {
            id v28 = off_264D60520;
            if (v25 != 1)
            {
              +[TCMessageException raise:OABadFormat];
              id v28 = off_264D60520;
            }
            goto LABEL_25;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"cubicBezTo"))
          {
            if (v25 != 3) {
              +[TCMessageException raise:OABadFormat];
            }
            uint64_t v31 = [OADCubicBezierToPathElement alloc];
            unsigned int v27 = -[OADCubicBezierToPathElement initWithControlPoint1:controlPoint2:toPoint:](v31, "initWithControlPoint1:controlPoint2:toPoint:", v39, v40, v41, v42, v43, v44);
          }
          else if (xmlStrEqual(i->name, (const xmlChar *)"quadBezTo"))
          {
            if (v25 != 2) {
              +[TCMessageException raise:OABadFormat];
            }
            v32 = [OADQuadBezierToPathElement alloc];
            unsigned int v27 = -[OADQuadBezierToPathElement initWithControlPoint:toPoint:](v32, "initWithControlPoint:toPoint:", v39, v40, v41, v42);
          }
          else
          {
            if (!xmlStrEqual(i->name, (const xmlChar *)"arcTo"))
            {
              uint64_t v30 = 0;
              goto LABEL_27;
            }
            if (v25) {
              +[TCMessageException raise:OABadFormat];
            }
            unsigned int v27 = -[OADArcToPathElement initWithSemiaxes:startAngle:angleLength:]([OADArcToPathElement alloc], "initWithSemiaxes:startAngle:angleLength:", objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", i, "wR", v10, v35), objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", i, "hR", v10), objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", i, "stAng", v10), objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", i, "swAng", v10));
          }
LABEL_26:
          uint64_t v30 = v27;
LABEL_27:
          -[OADPath addElement:](v38, "addElement:", v30, v35);
        }
        [v35 addPath:v38];
        v33 = [v11 OAXMainNamespace];
        v34 = OCXFindNextChild(v37, v33, (xmlChar *)"path");

        v37 = v34;
      }
      while (v34);
    }
  }
}

+ (void)writePath:(id)a3 coordSpace:(CsRect<int>)a4 to:(id)a5
{
  BOOL v5 = *(void **)&a4.var0[2];
  id v6 = *(int **)a4.var0;
  id v8 = a3;
  id v9 = v5;
  [v9 startOAElement:@"path"];
  int v10 = v6[1];
  uint64_t v11 = *v6;
  [v9 writeOAAttribute:@"w" intContent:v6[2] - v11];
  [v9 writeOAAttribute:@"h" intContent:v6[3] - (uint64_t)v6[1]];
  uint64_t v12 = [v8 fillMode];
  uint64_t v13 = [a1 pathFillModeEnumMap];
  [v9 writeOAAttribute:@"fill" enumContent:v12 map:v13];

  objc_msgSend(v9, "writeOAAttribute:BOOLContent:", @"stroke", objc_msgSend(v8, "stroked"));
  [v9 writeOAAttribute:@"extrusionOk" BOOLContent:0];
  uint64_t v14 = [v8 elementCount];
  if (v14)
  {
    for (uint64_t i = 0; v14 != i; ++i)
    {
      int v16 = [v8 elementAtIndex:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 startOAElement:@"close"];
        [v9 endElement];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
          [v9 startOAElement:@"cubicBezTo"];
          uint64_t v18 = [v17 controlPoint1];
          v34[0] = v11;
          v34[1] = v10;
          objc_msgSend(a1, "writeShapePathPoint:origin:to:", v18, v19, v34, v9);
          uint64_t v20 = [v17 controlPoint2];
          v33[0] = v11;
          v33[1] = v10;
          objc_msgSend(a1, "writeShapePathPoint:origin:to:", v20, v21, v33, v9);
          uint64_t v22 = [v17 toPoint];
          v32[0] = v11;
          v32[1] = v10;
          objc_msgSend(a1, "writeShapePathPoint:origin:to:", v22, v23, v32, v9);
          [v9 endElement];
LABEL_11:

          goto LABEL_12;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v24 = v16;
          [v9 startOAElement:@"lnTo"];
          uint64_t v25 = [v24 toPoint];
          v31[0] = v11;
          v31[1] = v10;
          objc_msgSend(a1, "writeShapePathPoint:origin:to:", v25, v26, v31, v9);
          [v9 endElement];
          goto LABEL_11;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = v16;
          [v9 startOAElement:@"moveTo"];
          uint64_t v28 = [v27 toPoint];
          v30[0] = v11;
          v30[1] = v10;
          objc_msgSend(a1, "writeShapePathPoint:origin:to:", v28, v29, v30, v9);
          [v9 endElement];
          goto LABEL_11;
        }
      }
LABEL_12:
    }
  }
  [v9 endElement];
}

+ (void)writeShapePathPoint:(OADAdjustPoint)a3 origin:(CsPoint<int>)a4 to:(id)a5
{
  int value = a3.y.value;
  OADAdjustCoord x = a3.x;
  id v8 = a5;
  [v8 startOAElement:@"pt"];
  [v8 writeOAAttribute:@"x" intContent:(*(uint64_t *)&x >> 32) - *(int *)a4.var0[0]];
  [v8 writeOAAttribute:@"y" intContent:value - (uint64_t)*(int *)(*(void *)&a4 + 4)];
  [v8 endElement];
}

void __40__OAXGeometry_Private__shapeTypeEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ40__OAXGeometry_Private__shapeTypeEnumMap_EUb_E20shapeTypeEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ40__OAXGeometry_Private__shapeTypeEnumMap_EUb_E20shapeTypeEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_9, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ40__OAXGeometry_Private__shapeTypeEnumMap_EUb_E20shapeTypeEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ40__OAXGeometry_Private__shapeTypeEnumMap_EUb_E20shapeTypeEnumStructs count:187 caseSensitive:1];
  v1 = (void *)+[OAXGeometry(Private) shapeTypeEnumMap]::shapeTypeEnumMap;
  +[OAXGeometry(Private) shapeTypeEnumMap]::shapeTypeEnumMap = (uint64_t)v0;
}

void __42__OAXGeometry_Private__formulaTypeEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ42__OAXGeometry_Private__formulaTypeEnumMap_EUb0_E22formulaTypeEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ42__OAXGeometry_Private__formulaTypeEnumMap_EUb0_E22formulaTypeEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_784, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ42__OAXGeometry_Private__formulaTypeEnumMap_EUb0_E22formulaTypeEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ42__OAXGeometry_Private__formulaTypeEnumMap_EUb0_E22formulaTypeEnumStructs count:17 caseSensitive:1];
  v1 = (void *)+[OAXGeometry(Private) formulaTypeEnumMap]::formulaTypeEnumMap;
  +[OAXGeometry(Private) formulaTypeEnumMap]::formulaTypeEnumMap = (uint64_t)v0;
}

void __45__OAXGeometry_Private__formulaKeywordEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ45__OAXGeometry_Private__formulaKeywordEnumMap_EUb1_E25formulaKeywordEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ45__OAXGeometry_Private__formulaKeywordEnumMap_EUb1_E25formulaKeywordEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_787, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ45__OAXGeometry_Private__formulaKeywordEnumMap_EUb1_E25formulaKeywordEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ45__OAXGeometry_Private__formulaKeywordEnumMap_EUb1_E25formulaKeywordEnumStructs count:6 caseSensitive:1];
  v1 = (void *)+[OAXGeometry(Private) formulaKeywordEnumMap]::formulaKeywordEnumMap;
  +[OAXGeometry(Private) formulaKeywordEnumMap]::formulaKeywordEnumMap = (uint64_t)v0;
}

void __43__OAXGeometry_Private__pathFillModeEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ43__OAXGeometry_Private__pathFillModeEnumMap_EUb2_E23pathFillModeEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ43__OAXGeometry_Private__pathFillModeEnumMap_EUb2_E23pathFillModeEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_808, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ43__OAXGeometry_Private__pathFillModeEnumMap_EUb2_E23pathFillModeEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ43__OAXGeometry_Private__pathFillModeEnumMap_EUb2_E23pathFillModeEnumStructs count:6 caseSensitive:1];
  v1 = (void *)+[OAXGeometry(Private) pathFillModeEnumMap]::pathFillModeEnumMap;
  +[OAXGeometry(Private) pathFillModeEnumMap]::pathFillModeEnumMap = (uint64_t)v0;
}

@end