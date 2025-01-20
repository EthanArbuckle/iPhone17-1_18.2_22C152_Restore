@interface WXOfficeArt
+ (BOOL)writeWrapTightlyWith:(id)a3 toWriter:(id)a4;
+ (id)relativeHorizontalPositionEnumMap;
+ (id)relativeVerticalPositionEnumMap;
+ (id)textWrappingModeTypeEnumMap;
+ (void)readClientData:(_xmlNode *)a3 state:(id)a4 to:(id)a5;
+ (void)readFrom:(_xmlNode *)a3 parentRElement:(_xmlNode *)a4 parentParagraph:(id)a5 state:(id)a6 to:(id)a7;
+ (void)readOAX:(_xmlNode *)a3 parentRElement:(_xmlNode *)a4 parentParagraph:(id)a5 state:(id)a6 to:(id)a7;
+ (void)readPosition:(_xmlNode *)a3 state:(id)a4 to:(id)a5 isHorizontal:(BOOL)a6;
+ (void)readVml:(_xmlNode *)a3 parentRElement:(_xmlNode *)a4 parentParagraph:(id)a5 state:(id)a6 to:(id)a7;
+ (void)readWrap:(_xmlNode *)a3 state:(id)a4 to:(id)a5;
+ (void)readWrapDistance:(_xmlNode *)a3 parentElement:(_xmlNode *)a4 state:(id)a5 to:(id)a6;
+ (void)writeWrapBottomDistance:(id)a3 to:(id)a4;
+ (void)writeWrapLeftDistance:(id)a3 to:(id)a4;
+ (void)writeWrapPolygonChildren:(id)a3 to:(id)a4;
+ (void)writeWrapRightDistance:(id)a3 to:(id)a4;
+ (void)writeWrapText:(id)a3 to:(id)a4;
+ (void)writeWrapTopDistance:(id)a3 to:(id)a4;
@end

@implementation WXOfficeArt

+ (void)readFrom:(_xmlNode *)a3 parentRElement:(_xmlNode *)a4 parentParagraph:(id)a5 state:(id)a6 to:(id)a7
{
  v45[3] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [v12 text];
  objc_msgSend(v13, "setCurrentOfficeArtTextType:", objc_msgSend(v15, "textType"));

  if (xmlStrEqual(a3->name, (const xmlChar *)"drawing")) {
    [a1 readOAX:a3 parentRElement:a4 parentParagraph:v12 state:v13 to:v14];
  }
  else {
    [a1 readVml:a3 parentRElement:a4 parentParagraph:v12 state:v13 to:v14];
  }
  [v13 setCurrentOfficeArtTextType:0xFFFFFFFFLL];
  v16 = [v13 drawingState];
  v44 = [v16 targetBlipCollection];

  v17 = [v14 drawable];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v38 = v17;
    objc_opt_class();
    id v39 = v17;
    v18 = [v39 imageProperties];
    v45[0] = [v18 imageFill];
    id v41 = v13;
    id v42 = v12;
    id v40 = v14;
    v43 = v18;
    v45[1] = [v18 fill];
    v19 = [v18 stroke];
    v45[2] = [v19 fill];

    uint64_t v20 = 0;
    while (1)
    {
      id v21 = (id)v45[v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v21;
        if (v22) {
          goto LABEL_15;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v23 = [v21 pattern];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v22 = v23;
          }
          else {
            id v22 = 0;
          }

          if (v22)
          {
LABEL_15:
            v24 = [v22 blipRef];
            uint64_t v25 = [v24 index];
            if (v25)
            {
              v26 = [v44 blipAtIndex:v25];
              v27 = objc_alloc_init(OADBlip);
              v28 = [v26 mainSubBlip];
              [(OADBlip *)v27 setMainSubBlip:v28];

              v29 = [v26 altSubBlip];
              [(OADBlip *)v27 setAltSubBlip:v29];

              *[(OADBlip *)v27 referenceCount] = 1;
              v30 = (_DWORD *)[v26 referenceCount];
              --*v30;
              v31 = [v43 imageFill];
              v32 = [v31 blipRef];

              uint64_t v33 = [v32 index];
              v34 = [v32 name];
              v35 = [[OADBlipRef alloc] initWithIndex:v33 name:v34 blip:v27];
              [v22 setBlipRef:v35];
              v36 = [v32 effects];
              [(OADBlipRef *)v35 setEffects:v36];
            }
          }
        }
        else
        {
          id v22 = 0;
        }
      }

      if (++v20 == 3)
      {
        uint64_t v37 = 2;
        id v13 = v41;
        id v12 = v42;
        id v14 = v40;
        do

        while (v37 != -1);
        v17 = v38;
        break;
      }
    }
  }
}

+ (void)readOAX:(_xmlNode *)a3 parentRElement:(_xmlNode *)a4 parentParagraph:(id)a5 state:(id)a6 to:(id)a7
{
  id v18 = a6;
  id v10 = a7;
  v11 = [v18 WXDrawingNamespace];
  uint64_t v12 = OCXFindChild(a3, v11, "anchor");

  if (!v12)
  {
    id v13 = [v18 WXDrawingNamespace];
    uint64_t v12 = OCXFindChild(a3, v13, "inline");
  }
  id v14 = [v18 drawingState];
  v15 = [v18 WXDrawingNamespace];
  v16 = +[OAXGraphicalObject readFromParentXmlNode:v12 inNamespace:v15 drawingState:v14];

  if (v16)
  {
    [v10 setDrawable:v16];
    v17 = [v16 clientData];
    [v17 setDrawable:v16];
    [a1 readClientData:v12 state:v18 to:v17];
    objc_msgSend(v10, "setFloating:", objc_msgSend(v17, "floating"));
  }
}

+ (void)readClientData:(_xmlNode *)a3 state:(id)a4 to:(id)a5
{
  id v60 = a4;
  id v57 = a5;
  v7 = [v60 WXDrawingNamespace];
  v8 = (_xmlNode *)OCXFindChild(a3, v7, "docPr");

  v9 = [v57 drawable];
  [v9 id];
  id v10 = CXRequiredUnsignedLongAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"id");
  v11 = [v60 drawingState];
  uint64_t v12 = [v11 drawableForShapeId:v10];

  if (v12) {
    id v10 = (_xmlAttr *)+[OADDrawable generateOADDrawableId:v9];
  }
  [v9 setId:v10];
  id v13 = [v60 drawingState];
  [v13 setDrawable:v9 forShapeId:v10];

  id v62 = 0;
  LODWORD(v13) = CXOptionalStringAttribute(v8, (void *)CXNoNamespace, (xmlChar *)"title", &v62);
  id v59 = v62;
  if (v13)
  {
    id v14 = [v9 drawableProperties];
    [v14 setAltTitle:v59];
  }
  id v61 = 0;
  BOOL v15 = CXOptionalStringAttribute(v8, (void *)CXNoNamespace, (xmlChar *)"descr", &v61);
  id v58 = v61;
  if (v15)
  {
    v16 = [v9 drawableProperties];
    [v16 setAltDescription:v58];
  }
  v17 = [v60 WXDrawingNamespace];
  id v18 = (_xmlNode *)OCXFindChild(a3, v17, "extent");

  v19 = CXRequiredLongAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"cx");
  uint64_t v20 = CXRequiredLongAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"cy");
  id v21 = v57;
  id v22 = [v57 drawable];
  v23 = [v22 drawableProperties];

  if (![v23 hasOrientedBounds]
    || ([v23 orientedBounds], (v24 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v24 = objc_alloc_init(OADOrientedBounds);
    [v23 setOrientedBounds:v24];
  }
  [(OADOrientedBounds *)v24 bounds];
  double v27 = (double)(uint64_t)v19 / 12700.0;
  double v28 = (double)(uint64_t)v20 / 12700.0;
  if (v25 > 0.0 && v26 > 0.0)
  {
    double v29 = v27 / v25;
    if (v27 / v25 >= v28 / v26) {
      double v29 = v28 / v26;
    }
    float v30 = v29;
    double v31 = v30;
    double v27 = v25 * v31;
    double v28 = v26 * v31;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"inline"))
  {
    -[OADOrientedBounds setBounds:](v24, "setBounds:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v27, v28);
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"anchor"))
  {
    v32 = [v57 createAnchor];
    v55 = v32;
    unsigned int v33 = CXRequiredBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"behindDoc");
    objc_msgSend(v32, "setZIndex:", CXRequiredLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"relativeHeight"));
    if (v33) {
      objc_msgSend(v32, "setZIndex:", objc_msgSend(v32, "zIndex") - 503316480);
    }
    v34 = [v60 WXDrawingNamespace];
    v35 = (const xmlNode *)OCXFindChild(a3, v34, "positionH");

    if (v35)
    {
      id v36 = [a1 relativeHorizontalPositionEnumMap];
      id v63 = 0;
      BOOL NSStringAnyNsProp = sfaxmlGetNSStringAnyNsProp(v35, (const xmlChar *)"relativeFrom", &v63);
      id v38 = v63;
      uint64_t v39 = -130883970;
      if (NSStringAnyNsProp) {
        uint64_t v39 = (int)[v36 valueForString:v38];
      }

      v32 = v55;
      if (v39 != -130883970)
      {
        id v40 = [v57 anchor];
        id v41 = v40;
        if (v39 == 5) {
          uint64_t v42 = 4;
        }
        else {
          uint64_t v42 = v39;
        }
        [v40 setRelativeHorizontalPosition:v42];
      }
      [a1 readPosition:v35 state:v60 to:v55 isHorizontal:1];
    }
    v43 = [v60 WXDrawingNamespace];
    v44 = (const xmlNode *)OCXFindChild(a3, v43, "positionV");

    if (v44)
    {
      id v45 = [a1 relativeVerticalPositionEnumMap];
      id v63 = 0;
      BOOL v46 = sfaxmlGetNSStringAnyNsProp(v44, (const xmlChar *)"relativeFrom", &v63);
      id v47 = v63;
      uint64_t v48 = -130883970;
      if (v46) {
        uint64_t v48 = (int)[v45 valueForString:v47];
      }

      v32 = v55;
      if (v48 != -130883970)
      {
        v49 = [v57 anchor];
        [v49 setRelativeVerticalPosition:v48];
      }
      [a1 readPosition:v44 state:v60 to:v55 isHorizontal:0];
    }
    id v21 = v57;
    v50 = [v57 anchor];
    [a1 readWrap:a3 state:v60 to:v50];

    [v32 bounds];
    double v52 = v51;
    double v54 = v53;
    -[OADOrientedBounds setBounds:](v24, "setBounds:");
    objc_msgSend(v32, "setBounds:", v52, v54, v27, v28);
  }
}

+ (void)readPosition:(_xmlNode *)a3 state:(id)a4 to:(id)a5 isHorizontal:(BOOL)a6
{
  BOOL v6 = a6;
  id v40 = a4;
  id v9 = a5;
  id v10 = [v40 WXDrawingNamespace];
  uint64_t v11 = OCXFindChild(a3, v10, "align");

  uint64_t v12 = [v40 WXDrawingNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "offset");

  id v14 = [v40 WXDrawingNamespace];
  uint64_t v15 = OCXFindChild(a3, v14, "posOffset");

  if (v11)
  {
    v16 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v11);
    v17 = v16;
    if (v6)
    {
      if ([v16 isEqualToString:@"left"])
      {
        uint64_t v18 = 1;
      }
      else if ([v17 isEqualToString:@"center"])
      {
        uint64_t v18 = 2;
      }
      else if ([v17 isEqualToString:@"right"])
      {
        uint64_t v18 = 3;
      }
      else if ([v17 isEqualToString:@"inside"])
      {
        uint64_t v18 = 4;
      }
      else if ([v17 isEqualToString:@"outside"])
      {
        uint64_t v18 = 5;
      }
      else
      {
        uint64_t v18 = 1;
      }
      [v9 setHorizontalPosition:v18];
    }
    else
    {
      if ([v16 isEqualToString:@"top"])
      {
        uint64_t v28 = 1;
      }
      else if ([v17 isEqualToString:@"center"])
      {
        uint64_t v28 = 2;
      }
      else if ([v17 isEqualToString:@"bottom"])
      {
        uint64_t v28 = 3;
      }
      else if ([v17 isEqualToString:@"inside"])
      {
        uint64_t v28 = 4;
      }
      else if ([v17 isEqualToString:@"outside"])
      {
        uint64_t v28 = 5;
      }
      else
      {
        uint64_t v28 = 1;
      }
      [v9 setVerticalPosition:v28];
    }
  }
  else if (v13)
  {
    v17 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v13);
    [v9 bounds];
    double v22 = v21;
    double v24 = v23;
    if (v6)
    {
      double v25 = v20;
      int v26 = [v17 intValue];
      [v9 setHorizontalPosition:0];
      double v27 = (double)v26 / 12700.0;
    }
    else
    {
      double v27 = v19;
      int v38 = [v17 intValue];
      [v9 setVerticalPosition:0];
      double v25 = (double)v38 / 12700.0;
    }
    objc_msgSend(v9, "setBounds:", v27, v25, v22, v24);
  }
  else if (v15)
  {
    v17 = objc_msgSend([NSString alloc], "tc_initWithContentOfXmlNode:", v15);
    [v9 bounds];
    double v32 = v31;
    double v34 = v33;
    if (v6)
    {
      double v35 = v30;
      [v17 doubleValue];
      double v37 = v36 / 12700.0;
    }
    else
    {
      double v37 = v29;
      [v17 doubleValue];
      double v35 = v39 / 12700.0;
    }
    objc_msgSend(v9, "setBounds:", v37, v35, v32, v34);
  }
  else
  {
    v17 = 0;
  }
}

+ (void)readWrap:(_xmlNode *)a3 state:(id)a4 to:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 WXDrawingNamespace];
  uint64_t v11 = OCXFindChild(a3, v10, "wrapNone");

  if (v11)
  {
    [v9 setTextWrappingMode:3];
  }
  else
  {
    uint64_t v12 = [v8 WXDrawingNamespace];
    uint64_t v13 = (const xmlNode *)OCXFindChild(a3, v12, "wrapSquare");

    if (v13)
    {
      [v9 setTextWrappingMode:2];
      [a1 readWrapDistance:v13 parentElement:a3 state:v8 to:v9];
      unsigned int v28 = 0;
      id v14 = [a1 textWrappingModeTypeEnumMap];
      int v15 = readEnumProperty<WDATextWrappingModeType>(v13, (const xmlChar *)"wrapText", v14, &v28);

      if (v15) {
        [v9 setTextWrappingModeType:v28];
      }
    }
    else
    {
      v16 = [v8 WXDrawingNamespace];
      v17 = (const xmlNode *)OCXFindChild(a3, v16, "wrapThrough");

      if (v17)
      {
        [v9 setTextWrappingMode:5];
        [a1 readWrapDistance:v17 parentElement:a3 state:v8 to:v9];
        unsigned int v27 = 0;
        uint64_t v18 = [a1 textWrappingModeTypeEnumMap];
        int v19 = readEnumProperty<WDATextWrappingModeType>(v17, (const xmlChar *)"wrapText", v18, &v27);

        if (v19) {
          [v9 setTextWrappingModeType:v27];
        }
      }
      else
      {
        double v20 = [v8 WXDrawingNamespace];
        double v21 = (const xmlNode *)OCXFindChild(a3, v20, "wrapTight");

        if (v21)
        {
          [v9 setTextWrappingMode:4];
          [a1 readWrapDistance:v21 parentElement:a3 state:v8 to:v9];
          unsigned int v26 = 0;
          double v22 = [a1 textWrappingModeTypeEnumMap];
          int v23 = readEnumProperty<WDATextWrappingModeType>(v21, (const xmlChar *)"wrapText", v22, &v26);

          if (v23) {
            [v9 setTextWrappingModeType:v26];
          }
        }
        else
        {
          double v24 = [v8 WXDrawingNamespace];
          uint64_t v25 = OCXFindChild(a3, v24, "wrapTopAndBottom");

          if (v25)
          {
            [v9 setTextWrappingMode:1];
            [a1 readWrapDistance:v25 parentElement:a3 state:v8 to:v9];
          }
        }
      }
    }
  }
}

+ (void)readVml:(_xmlNode *)a3 parentRElement:(_xmlNode *)a4 parentParagraph:(id)a5 state:(id)a6 to:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  [v11 wxoavState];
  BOOL v46 = v48 = v11;
  [v46 setCurrentParagraph:v10];
  uint64_t v13 = +[OAVDrawable readDrawablesFromParent:a3 inNamespace:OAVOfficeDrawingNamespace state:v46];
  [v46 setCurrentParagraph:0];
  id v14 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)OAVOfficeDrawingNamespace, "OLEObject");
  int v15 = v14;
  if (!v14) {
    goto LABEL_23;
  }
  v16 = CXDefaultStringAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"ProgID", 0);
  id v45 = [v48 packagePart];
  id v47 = [v48 OCXReadRelationshipForNode:v15 packagePart:v45];
  BOOL v17 = +[OADOle isProgIDChart:v16];
  if (v47) {
    BOOL v18 = v17;
  }
  else {
    BOOL v18 = 0;
  }
  if (!v18)
  {
    double v24 = 0;
LABEL_14:
    unsigned int v27 = objc_alloc_init(OADOle);
    unsigned int v28 = v27;
    if (v24) {
      [(OADOle *)v27 setObject:v24];
    }
    uint64_t v25 = v28;
    if (v16) {
      [(OADOle *)v28 setAnsiProgID:v16];
    }
    goto LABEL_18;
  }
  context = (void *)MEMORY[0x23EC9A170](v17);
  v44 = [v45 package];
  int v19 = [v47 targetLocation];
  double v20 = [v44 partForLocation:v19];

  uint64_t v42 = v20;
  v43 = [v20 data];
  if ([v16 hasSuffix:@".12"])
  {
    double v21 = [EXReader alloc];
    double v22 = [v48 cancelDelegate];
    int v23 = [(OCDReader *)v21 initWithCancelDelegate:v22];

    if ([(OCXReader *)v23 start])
    {
      [(OCDReader *)v23 setData:v43];
      double v24 = [(EXReader *)v23 read];
    }
    else
    {
      double v24 = 0;
    }
    uint64_t v25 = 0;
  }
  else
  {
    int v23 = [v48 cancelDelegate];
    uint64_t v25 = +[OABOle readFromData:v43 cancel:v23];
    double v24 = 0;
  }

  unsigned int v26 = [v47 targetLocation];
  [v44 resetPartForLocation:v26];

  if (!v25) {
    goto LABEL_14;
  }
LABEL_18:
  id v49 = 0;
  BOOL v29 = CXOptionalStringAttribute(v15, (void *)CXNoNamespace, (xmlChar *)"ShapeID", &v49);
  id v30 = v49;
  if (v29)
  {
    double v31 = [v46 drawableForVmlShapeId:v30];
    uint64_t v32 = objc_opt_class();
    double v33 = TSUDynamicCast(v32, (uint64_t)v31);
    double v34 = v33;
    if (v33) {
      [v33 setOle:v25];
    }
  }
LABEL_23:
  uint64_t v35 = [v13 count];
  if (v35)
  {
    for (uint64_t i = 0; i != v35; ++i)
    {
      double v37 = [v13 objectAtIndex:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 setDrawable:v37];
        int v38 = [v37 clientData];
        [v38 setDrawable:v37];
        objc_msgSend(v12, "setFloating:", objc_msgSend(v38, "floating"));
        double v39 = [v38 textBox];
        if (v39)
        {
          id v40 = [v10 document];
          [v39 setDocument:v40];
        }
      }
    }
  }
}

+ (void)readWrapDistance:(_xmlNode *)a3 parentElement:(_xmlNode *)a4 state:(id)a5 to:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v17 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"distB", &v17)
    || CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"distB", &v17))
  {
    [v10 setWrapDistanceBottom:(double)v17 / 12700.0];
  }
  id v11 = [v9 WXDrawingNamespace];
  BOOL v12 = CXOptionalLongAttribute(a3, v11, (xmlChar *)"distL", &v17);

  if (v12 || CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"distL", &v17)) {
    [v10 setWrapDistanceLeft:(double)v17 / 12700.0];
  }
  uint64_t v13 = [v9 WXDrawingNamespace];
  BOOL v14 = CXOptionalLongAttribute(a3, v13, (xmlChar *)"distR", &v17);

  if (v14 || CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"distR", &v17)) {
    [v10 setWrapDistanceRight:(double)v17 / 12700.0];
  }
  int v15 = [v9 WXDrawingNamespace];
  BOOL v16 = CXOptionalLongAttribute(a3, v15, (xmlChar *)"distT", &v17);

  if (v16 || CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"distT", &v17)) {
    [v10 setWrapDistanceTop:(double)v17 / 12700.0];
  }
}

+ (id)relativeHorizontalPositionEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_38, 0, &dword_238A75000);
  }
  if (+[WXOfficeArt relativeHorizontalPositionEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXOfficeArt relativeHorizontalPositionEnumMap]::onceToken, &__block_literal_global_88);
  }
  v2 = (void *)+[WXOfficeArt relativeHorizontalPositionEnumMap]::sRelativeHorizontalPositionEnumMap;
  return v2;
}

void __48__WXOfficeArt_relativeHorizontalPositionEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXOfficeArt relativeHorizontalPositionEnumMap]::sRelativeHorizontalPositionStructs count:9 caseSensitive:1];
  v1 = (void *)+[WXOfficeArt relativeHorizontalPositionEnumMap]::sRelativeHorizontalPositionEnumMap;
  +[WXOfficeArt relativeHorizontalPositionEnumMap]::sRelativeHorizontalPositionEnumMap = (uint64_t)v0;
}

+ (id)relativeVerticalPositionEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_38_0, 0, &dword_238A75000);
  }
  if (+[WXOfficeArt relativeVerticalPositionEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXOfficeArt relativeVerticalPositionEnumMap]::onceToken, &__block_literal_global_40);
  }
  v2 = (void *)+[WXOfficeArt relativeVerticalPositionEnumMap]::sRelativeVerticalPositionEnumMap;
  return v2;
}

void __46__WXOfficeArt_relativeVerticalPositionEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXOfficeArt relativeVerticalPositionEnumMap]::sRelativeVerticalPositionStructs count:8 caseSensitive:1];
  v1 = (void *)+[WXOfficeArt relativeVerticalPositionEnumMap]::sRelativeVerticalPositionEnumMap;
  +[WXOfficeArt relativeVerticalPositionEnumMap]::sRelativeVerticalPositionEnumMap = (uint64_t)v0;
}

+ (id)textWrappingModeTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_53_0, 0, &dword_238A75000);
  }
  if (+[WXOfficeArt textWrappingModeTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXOfficeArt textWrappingModeTypeEnumMap]::onceToken, &__block_literal_global_55);
  }
  v2 = (void *)+[WXOfficeArt textWrappingModeTypeEnumMap]::sTextWrappingModeTypeEnumMap;
  return v2;
}

void __42__WXOfficeArt_textWrappingModeTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXOfficeArt textWrappingModeTypeEnumMap]::sTextWrappingModeTypeStructs count:4 caseSensitive:1];
  v1 = (void *)+[WXOfficeArt textWrappingModeTypeEnumMap]::sTextWrappingModeTypeEnumMap;
  +[WXOfficeArt textWrappingModeTypeEnumMap]::sTextWrappingModeTypeEnumMap = (uint64_t)v0;
}

+ (void)writeWrapText:(id)a3 to:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (v7)
  {
    BOOL v6 = +[WDAAnchor stringForTextWrappingModeType:](WDAAnchor, "stringForTextWrappingModeType:", [v7 textWrappingModeType]);
    [v5 writeAttribute:@"wrapText" content:v6 prefix:0 ns:0];
  }
}

+ (void)writeWrapLeftDistance:(id)a3 to:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v8)
  {
    [v8 wrapDistanceLeft];
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)(v6 * 12700.0));
    [v5 writeAttribute:@"distL" content:v7 prefix:0 ns:0];
  }
}

+ (void)writeWrapRightDistance:(id)a3 to:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v8)
  {
    [v8 wrapDistanceRight];
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)(v6 * 12700.0));
    [v5 writeAttribute:@"distR" content:v7 prefix:0 ns:0];
  }
}

+ (void)writeWrapTopDistance:(id)a3 to:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v8)
  {
    [v8 wrapDistanceTop];
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)(v6 * 12700.0));
    [v5 writeAttribute:@"distT" content:v7 prefix:0 ns:0];
  }
}

+ (void)writeWrapBottomDistance:(id)a3 to:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v8)
  {
    [v8 wrapDistanceBottom];
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)(v6 * 12700.0));
    [v5 writeAttribute:@"distB" content:v7 prefix:0 ns:0];
  }
}

+ (BOOL)writeWrapTightlyWith:(id)a3 toWriter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 textWrapPoints];
  if ((unint64_t)[v8 count] < 3)
  {

    goto LABEL_5;
  }
  if ([v6 textWrappingMode] != 4)
  {
    int v10 = [v6 textWrappingMode];

    if (v10 == 5) {
      goto LABEL_7;
    }
LABEL_5:
    BOOL v9 = 0;
    goto LABEL_11;
  }

LABEL_7:
  if ([v6 textWrappingMode] == 4) {
    id v11 = @"wrapTight";
  }
  else {
    id v11 = @"wrapThrough";
  }
  [v7 startElement:v11 prefix:@"wp" ns:0];
  [a1 writeWrapText:v6 to:v7];
  [a1 writeWrapLeftDistance:v6 to:v7];
  [a1 writeWrapRightDistance:v6 to:v7];
  [v7 startElement:@"wrapPolygon" prefix:@"wp" ns:0];
  [v7 writeAttribute:@"edited" BOOLContent:1 prefix:0 ns:0];
  BOOL v12 = [v6 textWrapPoints];
  [a1 writeWrapPolygonChildren:v12 to:v7];

  [v7 endElement];
  [v7 endElement];
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

+ (void)writeWrapPolygonChildren:(id)a3 to:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  uint64_t v6 = [v16 count];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      id v8 = [v16 objectAtIndexedSubscript:i];
      [v8 CGPointValue];
      double v10 = v9;
      double v12 = v11;

      double v13 = -2.72730423e13;
      if (v10 >= -2.72730423e13)
      {
        double v13 = v10;
        if (v10 > 2.72730423e13) {
          double v13 = 2.72730423e13;
        }
      }
      double v14 = -2.72730423e13;
      if (v12 >= -2.72730423e13)
      {
        double v14 = v12;
        if (v12 > 2.72730423e13) {
          double v14 = 2.72730423e13;
        }
      }
      if (i) {
        int v15 = @"lineTo";
      }
      else {
        int v15 = @"start";
      }
      [v5 startElement:v15 prefix:@"wp" ns:0];
      [v5 writeAttribute:@"x" intContent:(uint64_t)v13 prefix:0 ns:0];
      [v5 writeAttribute:@"y" intContent:(uint64_t)v14 prefix:0 ns:0];
      [v5 endElement];
    }
  }
}

@end