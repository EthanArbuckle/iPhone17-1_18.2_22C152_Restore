@interface OAXFill
+ (id)pathGradientFillTypeEnumMap;
+ (id)presetPatternFillTypeEnumMap;
+ (id)readBlipRefFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 forDrawable:(id)a5 drawingState:(id)a6 forBullet:(BOOL)a7;
+ (id)readFillFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5;
+ (id)readGradientFillFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readGroupFillFromXmlNode:(_xmlNode *)a3;
+ (id)readImageFillFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 forDrawable:(id)a5 drawingState:(id)a6;
+ (id)readLinearGradientFillFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readNullFillFromXmlNode:(_xmlNode *)a3;
+ (id)readPathGradientFillFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readPresetPatternFillFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readSolidFillFromXmlNode:(_xmlNode *)a3;
+ (id)tileFlipModeEnumMap;
+ (void)readGradientFillFromXmlNode:(_xmlNode *)a3 toGradientFill:(id)a4 drawingState:(id)a5;
+ (void)readTile:(_xmlNode *)a3 tile:(id)a4;
@end

@implementation OAXFill

+ (id)readFillFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3->type == XML_ELEMENT_NODE)
  {
    if (xmlStrEqual(a3->name, (const xmlChar *)"noFill"))
    {
      uint64_t v10 = [a1 readNullFillFromXmlNode:a3];
LABEL_14:
      v11 = (void *)v10;
      goto LABEL_16;
    }
    if (xmlStrEqual(a3->name, (const xmlChar *)"solidFill"))
    {
      uint64_t v10 = [a1 readSolidFillFromXmlNode:a3];
      goto LABEL_14;
    }
    if (xmlStrEqual(a3->name, (const xmlChar *)"gradFill"))
    {
      uint64_t v10 = [a1 readGradientFillFromXmlNode:a3 drawingState:v9];
      goto LABEL_14;
    }
    if (xmlStrEqual(a3->name, (const xmlChar *)"blipFill"))
    {
      uint64_t v10 = [a1 readImageFillFromXmlNode:a3 packagePart:v8 forDrawable:0 drawingState:v9];
      goto LABEL_14;
    }
    if (xmlStrEqual(a3->name, (const xmlChar *)"pattFill"))
    {
      uint64_t v10 = [a1 readPresetPatternFillFromXmlNode:a3 drawingState:v9];
      goto LABEL_14;
    }
    if (xmlStrEqual(a3->name, (const xmlChar *)"grpFill"))
    {
      uint64_t v10 = [a1 readGroupFillFromXmlNode:a3];
      goto LABEL_14;
    }
  }
  v11 = 0;
LABEL_16:

  return v11;
}

+ (id)readSolidFillFromXmlNode:(_xmlNode *)a3
{
  v4 = objc_alloc_init(OADSolidFill);
  v5 = +[OAXColor readColorFromParentXmlNode:a3];
  if (v5) {
    [(OADSolidFill *)v4 setColor:v5];
  }

  return v4;
}

+ (id)pathGradientFillTypeEnumMap
{
  if (+[OAXFill(Private) pathGradientFillTypeEnumMap]::once != -1) {
    dispatch_once(&+[OAXFill(Private) pathGradientFillTypeEnumMap]::once, &__block_literal_global_47);
  }
  v2 = (void *)+[OAXFill(Private) pathGradientFillTypeEnumMap]::pathGradientFillTypeEnumMap;
  return v2;
}

+ (id)readNullFillFromXmlNode:(_xmlNode *)a3
{
  return +[OADNullFill nullFill];
}

+ (id)tileFlipModeEnumMap
{
  v2 = (void *)+[OAXFill(Private) tileFlipModeEnumMap]::tileFlipModeEnumMap;
  if (!+[OAXFill(Private) tileFlipModeEnumMap]::tileFlipModeEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_7, 0, &dword_238A75000);
    }
    v3 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXFill(Private) tileFlipModeEnumMap]::tileFlipModeEnumStructs count:4 caseSensitive:1];
    v4 = (void *)+[OAXFill(Private) tileFlipModeEnumMap]::tileFlipModeEnumMap;
    +[OAXFill(Private) tileFlipModeEnumMap]::tileFlipModeEnumMap = (uint64_t)v3;

    v2 = (void *)+[OAXFill(Private) tileFlipModeEnumMap]::tileFlipModeEnumMap;
  }
  return v2;
}

+ (void)readTile:(_xmlNode *)a3 tile:(id)a4
{
  id v13 = a4;
  +[OAXBaseTypes readOptionalLengthFromXmlNode:a3 name:"tx"];
  objc_msgSend(v13, "setOffsetX:");
  +[OAXBaseTypes readOptionalLengthFromXmlNode:a3 name:"tx"];
  objc_msgSend(v13, "setOffsetY:");
  double v6 = CXDefaultFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"sx", 1.0);
  *(float *)&double v6 = v6;
  [v13 setScaleX:v6];
  double v7 = CXDefaultFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"sy", 1.0);
  *(float *)&double v7 = v7;
  [v13 setScaleY:v7];
  id v8 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"flip", (NSString *)@"none");
  id v9 = [a1 tileFlipModeEnumMap];
  uint64_t v10 = [v9 valueForString:v8];

  [v13 setFlipMode:v10];
  unsigned int v11 = +[OAXBaseTypes readRectAlignmentFromXmlNode:a3 name:"algn"];
  if (v11 <= 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v11;
  }
  [v13 setAlignment:v12];
}

+ (id)readGroupFillFromXmlNode:(_xmlNode *)a3
{
  v3 = objc_alloc_init(OADGroupFill);
  return v3;
}

+ (id)presetPatternFillTypeEnumMap
{
  v2 = (void *)+[OAXFill(Private) presetPatternFillTypeEnumMap]::presetPatternFillTypeEnumMap;
  if (!+[OAXFill(Private) presetPatternFillTypeEnumMap]::presetPatternFillTypeEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_239, 0, &dword_238A75000);
    }
    v3 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXFill(Private) presetPatternFillTypeEnumMap]::presetPatternFillTypeEnumStructs count:54 caseSensitive:1];
    v4 = (void *)+[OAXFill(Private) presetPatternFillTypeEnumMap]::presetPatternFillTypeEnumMap;
    +[OAXFill(Private) presetPatternFillTypeEnumMap]::presetPatternFillTypeEnumMap = (uint64_t)v3;

    v2 = (void *)+[OAXFill(Private) presetPatternFillTypeEnumMap]::presetPatternFillTypeEnumMap;
  }
  return v2;
}

+ (id)readBlipRefFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 forDrawable:(id)a5 drawingState:(id)a6 forBullet:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v13 OAXMainNamespace];
  v15 = (_xmlNode *)OCXFindChild(a3, v14, "blip");

  if (!v15) {
    +[TCMessageException raise:OABadFormat];
  }
  v16 = [v13 OCXReadRelationshipForNode:v15 attributeName:"embed" packagePart:v11];
  v17 = v16;
  if (v16)
  {
    v18 = [v16 targetLocation];
    if (v7) {
      [v13 bulletBlipRefForURL:v18];
    }
    else {
    v21 = [v13 blipRefForURL:v18];
    }
    +[OAXBlipEffects readBlipEffectsFromBlipRef:v15 toBlipRef:v21 drawingState:v13];
  }
  else
  {
    v19 = [v13 OCXReadRelationshipForNode:v15 attributeName:"link" packagePart:v11];
    v17 = v19;
    if (!v19)
    {
      id v27 = 0;
      goto LABEL_14;
    }
    v20 = [v19 targetLocation];
    v18 = [v20 relativeString];

    v21 = +[OADBlipRef blipRefWithIndex:0 name:v18 blip:0];
  }

  v22 = [v13 OAXMainNamespace];
  v23 = (_xmlNode *)OCXFindChild(v15, v22, "extLst");

  if (v23)
  {
    v24 = OCXFirstChildNamed(v23, (xmlChar *)"ext");
    while (v24)
    {
      v25 = CXDefaultStringAttribute(v24, (CXNamespace *)CXNoNamespace, (xmlChar *)"uri", 0);
      v26 = [v13 client];
      [v26 readBlipExtWithURI:v25 fromNode:v24 toDrawable:v12 state:v13];

      v24 = OCXNextSiblingNamed(v24, (xmlChar *)"ext");
    }
  }
  id v27 = v21;

LABEL_14:
  return v27;
}

+ (id)readImageFillFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 forDrawable:(id)a5 drawingState:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(OADImageFill);
  v14 = [v12 OAXMainNamespace];
  uint64_t v15 = OCXFindChild(a3, v14, "stretch");

  if (v15)
  {
    v16 = objc_alloc_init(OADStretchTechnique);
    [a1 readStretch:v15 stretch:v16];
    [(OADImageFill *)v13 setTechnique:v16];
  }
  else
  {
    v16 = objc_alloc_init(OADTileTechnique);
    v17 = [v12 OAXMainNamespace];
    uint64_t v18 = OCXFindChild(a3, v17, "tile");

    if (v18) {
      [a1 readTile:v18 tile:v16];
    }
    [(OADImageFill *)v13 setTechnique:v16];
  }

  v19 = [v12 OAXMainNamespace];
  uint64_t v20 = OCXFindChild(a3, v19, "srcRect");

  if (v20)
  {
    v21 = +[OAXBaseTypes readRelativeRectFromXmlNode:v20];
    [(OADImageFill *)v13 setSourceRect:v21];
  }
  BOOL v24 = 0;
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rotWithShape", &v24)) {
    [(OADImageFill *)v13 setRotateWithShape:v24];
  }
  v22 = [a1 readBlipRefFromXmlNode:a3 packagePart:v10 forDrawable:v11 drawingState:v12 forBullet:0];
  if (v22) {
    [(OADImageFill *)v13 setBlipRef:v22];
  }

  return v13;
}

+ (void)readGradientFillFromXmlNode:(_xmlNode *)a3 toGradientFill:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 OAXMainNamespace];
  id v11 = (_xmlNode *)OCXFindChild(a3, v10, "gsLst");

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v13 = [v9 OAXMainNamespace];
    id v26 = a1;
    v28 = a3;
    Child = (_xmlNode *)OCXFindChild(v11, v13, "gs");

    while (Child)
    {
      +[OAXBaseTypes readRequiredFractionFromXmlNode:name:](OAXBaseTypes, "readRequiredFractionFromXmlNode:name:", Child, "pos", v26, v28);
      int v16 = v15;
      v17 = +[OAXColor readColorFromParentXmlNode:Child];
      LODWORD(v18) = v16;
      +[OADGradientFillStop addStopWithColor:v17 position:v12 toArray:v18];
      v19 = [v9 OAXMainNamespace];
      Child = OCXFindNextChild(Child, v19, (xmlChar *)"gs");
    }
    objc_msgSend(v8, "setStops:", v12, v26, v28);
    a1 = v27;
    a3 = v29;
  }
  BOOL v30 = 0;
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rotWithShape", &v30)) {
    [v8 setRotateWithShape:v30];
  }
  uint64_t v20 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"flip", 0);
  if (v20)
  {
    v21 = [a1 tileFlipModeEnumMap];
    uint64_t v22 = [v21 valueForString:v20];

    [v8 setFlipMode:v22];
  }
  v23 = [v9 OAXMainNamespace];
  uint64_t v24 = OCXFindChild(a3, v23, "tileRect");

  if (v24)
  {
    v25 = +[OAXBaseTypes readRelativeRectFromXmlNode:v24];
    [v8 setTileRect:v25];
  }
}

+ (id)readLinearGradientFillFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  BOOL v7 = objc_alloc_init(OADGradientFill);
  [a1 readGradientFillFromXmlNode:a3 toGradientFill:v7 drawingState:v6];
  id v8 = objc_alloc_init(OADLinearShade);
  id v9 = [v6 OAXMainNamespace];
  id v10 = (_xmlNode *)OCXFindChild(a3, v9, "lin");

  if (v10)
  {
    uint64_t v14 = 0;
    if (CXOptionalLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"ang", &v14))
    {
      double v11 = (double)v14 / 60000.0;
      *(float *)&double v11 = v11;
      [(OADLinearShade *)v8 setAngle:v11];
    }
    BOOL v13 = 0;
    if (CXOptionalBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"scaled", &v13)) {
      [(OADLinearShade *)v8 setScaled:v13];
    }
  }
  [(OADGradientFill *)v7 setShade:v8];

  return v7;
}

+ (id)readPathGradientFillFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  BOOL v7 = objc_alloc_init(OADGradientFill);
  [a1 readGradientFillFromXmlNode:a3 toGradientFill:v7 drawingState:v6];
  id v8 = [v6 OAXMainNamespace];
  id v9 = (_xmlNode *)OCXFindChild(a3, v8, "path");

  if (!v9) {
    +[TCMessageException raise:OABadFormat];
  }
  id v10 = objc_alloc_init(OADPathShade);
  double v11 = CXDefaultStringAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"path", 0);
  if (v11)
  {
    id v12 = [a1 pathGradientFillTypeEnumMap];
    uint64_t v13 = [v12 valueForString:v11];

    [(OADPathShade *)v10 setType:v13];
  }
  uint64_t v14 = [v6 OAXMainNamespace];
  uint64_t v15 = OCXFindChild(v9, v14, "fillToRect");

  if (v15)
  {
    int v16 = +[OAXBaseTypes readRelativeRectFromXmlNode:v15];
    [(OADPathShade *)v10 setFillToRect:v16];
  }
  [(OADGradientFill *)v7 setShade:v10];

  return v7;
}

+ (id)readGradientFillFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  BOOL v7 = [v6 OAXMainNamespace];
  uint64_t v8 = OCXFindChild(a3, v7, "path");

  if (v8) {
    [a1 readPathGradientFillFromXmlNode:a3 drawingState:v6];
  }
  else {
  id v9 = [a1 readLinearGradientFillFromXmlNode:a3 drawingState:v6];
  }

  return v9;
}

+ (id)readPresetPatternFillFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  BOOL v7 = objc_alloc_init(OADPatternFill);
  uint64_t v8 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst", 0);
  if (v8)
  {
    id v9 = [a1 presetPatternFillTypeEnumMap];
    uint64_t v10 = [v9 valueForString:v8];
  }
  else
  {
    uint64_t v10 = 1;
  }
  double v11 = objc_alloc_init(OADPresetPattern);
  [(OADPresetPattern *)v11 setType:v10];
  [(OADPatternFill *)v7 setPattern:v11];
  id v12 = [v6 OAXMainNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "fgClr");

  if (v13)
  {
    uint64_t v14 = +[OAXColor readColorFromParentXmlNode:v13];
    [(OADPatternFill *)v7 setFgColor:v14];
  }
  uint64_t v15 = [v6 OAXMainNamespace];
  uint64_t v16 = OCXFindChild(a3, v15, "bgClr");

  if (v16)
  {
    v17 = +[OAXColor readColorFromParentXmlNode:v16];
    [(OADPatternFill *)v7 setBgColor:v17];
  }
  return v7;
}

void __47__OAXFill_Private__pathGradientFillTypeEnumMap__block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ47__OAXFill_Private__pathGradientFillTypeEnumMap_EUb_E31pathGradientFillTypeEnumStructs, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ47__OAXFill_Private__pathGradientFillTypeEnumMap_EUb_E31pathGradientFillTypeEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_76, 0, &dword_238A75000);
    __cxa_guard_release(&_ZGVZZ47__OAXFill_Private__pathGradientFillTypeEnumMap_EUb_E31pathGradientFillTypeEnumStructs);
  }
  v0 = [[TCEnumerationMap alloc] initWithStructs:&_ZZZ47__OAXFill_Private__pathGradientFillTypeEnumMap_EUb_E31pathGradientFillTypeEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[OAXFill(Private) pathGradientFillTypeEnumMap]::pathGradientFillTypeEnumMap;
  +[OAXFill(Private) pathGradientFillTypeEnumMap]::pathGradientFillTypeEnumMap = (uint64_t)v0;
}

@end