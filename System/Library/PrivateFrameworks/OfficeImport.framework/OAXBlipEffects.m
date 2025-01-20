@interface OAXBlipEffects
+ (id)duotoneTransferModeEnumMap;
+ (id)readAlphaModFixEffect:(_xmlNode *)a3;
+ (id)readBiLevelEffect:(_xmlNode *)a3;
+ (id)readColorChangeEffect:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readDuotoneEffect:(_xmlNode *)a3;
+ (id)readGrayscaleEffect:(_xmlNode *)a3;
+ (id)readLuminanceEffect:(_xmlNode *)a3;
+ (void)readBlipEffectsFromBlipRef:(_xmlNode *)a3 toBlipRef:(id)a4 drawingState:(id)a5;
+ (void)writeAlphaModFixEffect:(id)a3 to:(id)a4;
+ (void)writeBiLevelEffect:(id)a3 to:(id)a4;
+ (void)writeBlipEffects:(id)a3 to:(id)a4;
+ (void)writeColorChangeEffect:(id)a3 to:(id)a4;
+ (void)writeDuotoneEffect:(id)a3 to:(id)a4;
+ (void)writeGrayscaleEffect:(id)a3 to:(id)a4;
+ (void)writeLuminanceEffect:(id)a3 to:(id)a4;
@end

@implementation OAXBlipEffects

+ (id)readLuminanceEffect:(_xmlNode *)a3
{
  v4 = objc_alloc_init(OADLuminanceEffect);
  +[OAXBaseTypes readOptionalFractionFromXmlNode:a3 name:"bright"];
  -[OADLuminanceEffect setBrightness:](v4, "setBrightness:");
  +[OAXBaseTypes readOptionalFractionFromXmlNode:a3 name:"contrast"];
  -[OADLuminanceEffect setContrast:](v4, "setContrast:");
  return v4;
}

+ (id)readDuotoneEffect:(_xmlNode *)a3
{
  v5 = OCXFirstChild(a3);
  if (v5)
  {
    v6 = +[OAXColor readColorFromNode:v5];
  }
  else
  {
    v6 = 0;
  }
  v7 = OCXNextSibling(v5);
  if (v7)
  {
    uint64_t v8 = +[OAXColor readColorFromNode:v7];
    v9 = (void *)v8;
    v10 = 0;
    if (v6 && v8)
    {
      v10 = objc_alloc_init(OADDuotoneEffect);
      [(OADDuotoneEffect *)v10 setColor1:v6];
      [(OADDuotoneEffect *)v10 setColor2:v9];
      v11 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"xfr1", 0);
      if (v11)
      {
        v12 = [a1 duotoneTransferModeEnumMap];
        uint64_t v13 = [v12 valueForString:v11];

        [(OADDuotoneEffect *)v10 setTransferMode1:v13];
      }
      v14 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"xfr2", 0);

      if (v14)
      {
        v15 = [a1 duotoneTransferModeEnumMap];
        uint64_t v16 = [v15 valueForString:v14];

        [(OADDuotoneEffect *)v10 setTransferMode2:v16];
      }
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }

  return v10;
}

+ (id)readAlphaModFixEffect:(_xmlNode *)a3
{
  v4 = objc_alloc_init(OADAlphaModFixEffect);
  double v7 = 0.0;
  if (CXOptionalFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"amt", &v7))
  {
    HIDWORD(v5) = HIDWORD(v7);
    *(float *)&double v5 = v7;
    [(OADAlphaModFixEffect *)v4 setAlpha:v5];
  }
  return v4;
}

+ (id)readGrayscaleEffect:(_xmlNode *)a3
{
  v3 = objc_alloc_init(OADGrayscaleEffect);
  return v3;
}

+ (void)readBlipEffectsFromBlipRef:(_xmlNode *)a3 toBlipRef:(id)a4 drawingState:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    name = i->name;
    if (xmlStrEqual(name, (const xmlChar *)"lum"))
    {
      uint64_t v11 = [a1 readLuminanceEffect:i];
    }
    else if (xmlStrEqual(name, (const xmlChar *)"grayscl"))
    {
      uint64_t v11 = [a1 readGrayscaleEffect:i];
    }
    else if (xmlStrEqual(name, (const xmlChar *)"biLevel"))
    {
      uint64_t v11 = [a1 readBiLevelEffect:i];
    }
    else if (xmlStrEqual(name, (const xmlChar *)"clrChange"))
    {
      uint64_t v11 = [a1 readColorChangeEffect:i drawingState:v8];
    }
    else if (xmlStrEqual(name, (const xmlChar *)"alphaModFix"))
    {
      uint64_t v11 = [a1 readAlphaModFixEffect:i];
    }
    else
    {
      if (!xmlStrEqual(name, (const xmlChar *)"duotone"))
      {
        v12 = 0;
        goto LABEL_17;
      }
      uint64_t v11 = [a1 readDuotoneEffect:i];
    }
    v12 = (void *)v11;
    if (v11) {
      [v13 addEffect:v11];
    }
LABEL_17:
  }
}

+ (void)writeBlipEffects:(id)a3 to:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v10 effectCount];
  if (v7)
  {
    uint64_t v8 = 0;
    while (1)
    {
      v9 = [v10 effectAtIndex:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [a1 writeBiLevelEffect:v9 to:v6];
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [a1 writeColorChangeEffect:v9 to:v6];
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [a1 writeDuotoneEffect:v9 to:v6];
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [a1 writeGrayscaleEffect:v9 to:v6];
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [a1 writeLuminanceEffect:v9 to:v6];
        goto LABEL_15;
      }
LABEL_16:

      if (v7 == ++v8) {
        goto LABEL_17;
      }
    }
    [a1 writeAlphaModFixEffect:v9 to:v6];
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:
}

+ (void)writeLuminanceEffect:(id)a3 to:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  id v6 = NSNumber;
  [v18 brightness];
  *(float *)&double v8 = v7 * 100000.0;
  v9 = [v6 numberWithFloat:v8];
  uint64_t v10 = [v9 longValue];

  uint64_t v11 = NSNumber;
  [v18 contrast];
  *(float *)&double v13 = v12 * 100000.0;
  v14 = [v11 numberWithFloat:v13];
  uint64_t v15 = [v14 longValue];

  [v5 startOAElement:@"lum"];
  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v10);
  [v5 writeOAAttribute:@"bright" content:v16];

  v17 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v15);
  [v5 writeOAAttribute:@"contrast" content:v17];

  [v5 endElement];
}

+ (void)writeGrayscaleEffect:(id)a3 to:(id)a4
{
  id v4 = a4;
  [v4 startOAElement:@"grayscl"];
  [v4 endElement];
}

+ (id)readBiLevelEffect:(_xmlNode *)a3
{
  id v4 = objc_alloc_init(OADBiLevelEffect);
  +[OAXBaseTypes readRequiredFractionFromXmlNode:a3 name:"thresh"];
  -[OADBiLevelEffect setThreshold:](v4, "setThreshold:");
  return v4;
}

+ (void)writeBiLevelEffect:(id)a3 to:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  id v6 = NSNumber;
  [v12 threshold];
  *(float *)&double v8 = v7 * 100000.0;
  v9 = [v6 numberWithFloat:v8];
  uint64_t v10 = [v9 longValue];

  [v5 startOAElement:@"biLevel"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v10);
  [v5 writeOAAttribute:@"thresh" content:v11];

  [v5 endElement];
}

+ (id)readColorChangeEffect:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5 = a4;
  id v6 = [v5 OAXMainNamespace];
  float v7 = (_xmlNode *)OCXFindChild(a3, v6, "clrFrom");

  if (v7 && (double v8 = OCXFirstChild(v7)) != 0)
  {
    v9 = +[OAXColor readColorFromNode:v8];
  }
  else
  {
    v9 = 0;
  }
  uint64_t v10 = [v5 OAXMainNamespace];
  uint64_t v11 = (_xmlNode *)OCXFindChild(a3, v10, "clrTo");

  if (v11)
  {
    id v12 = OCXFirstChild(v11);
    if (v12)
    {
      uint64_t v11 = +[OAXColor readColorFromNode:v12];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  double v13 = objc_alloc_init(OADColorChangeEffect);
  [(OADColorChangeEffect *)v13 setFromColor:v9];
  [(OADColorChangeEffect *)v13 setToColor:v11];

  return v13;
}

+ (void)writeColorChangeEffect:(id)a3 to:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  [v5 startOAElement:@"clrChange"];
  [v5 startOAElement:@"clrFrom"];
  id v6 = [v8 fromColor];
  +[OAXColor writeColor:v6 to:v5];

  [v5 endElement];
  [v5 startOAElement:@"clrTo"];
  float v7 = [v8 toColor];
  +[OAXColor writeColor:v7 to:v5];

  [v5 endElement];
  [v5 endElement];
}

+ (void)writeAlphaModFixEffect:(id)a3 to:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  id v6 = NSNumber;
  [v12 alpha];
  *(float *)&double v8 = v7 * 100000.0;
  v9 = [v6 numberWithFloat:v8];
  uint64_t v10 = [v9 longValue];

  [v5 startOAElement:@"alphaModFix"];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v10);
  [v5 writeOAAttribute:@"amt" content:v11];

  [v5 endElement];
}

+ (void)writeDuotoneEffect:(id)a3 to:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  [v5 startOAElement:@"duotone"];
  id v6 = [v8 color1];
  +[OAXColor writeColor:v6 to:v5];

  float v7 = [v8 color2];
  +[OAXColor writeColor:v7 to:v5];

  [v5 endElement];
}

+ (id)duotoneTransferModeEnumMap
{
  v2 = (void *)+[OAXBlipEffects(Private) duotoneTransferModeEnumMap]::duotoneTransferModeEnumMap;
  if (!+[OAXBlipEffects(Private) duotoneTransferModeEnumMap]::duotoneTransferModeEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_1, 0, &dword_238A75000);
    }
    v3 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXBlipEffects(Private) duotoneTransferModeEnumMap]::duotoneTransferModeEnumStructs count:14 caseSensitive:1];
    id v4 = (void *)+[OAXBlipEffects(Private) duotoneTransferModeEnumMap]::duotoneTransferModeEnumMap;
    +[OAXBlipEffects(Private) duotoneTransferModeEnumMap]::duotoneTransferModeEnumMap = (uint64_t)v3;

    v2 = (void *)+[OAXBlipEffects(Private) duotoneTransferModeEnumMap]::duotoneTransferModeEnumMap;
  }
  return v2;
}

@end