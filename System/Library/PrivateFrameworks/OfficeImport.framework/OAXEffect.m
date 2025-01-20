@interface OAXEffect
+ (BOOL)isEmpty:(id)a3;
+ (id)presetShadowTypeEnumMap;
+ (id)readEffectsFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5;
+ (id)updateIncomingEffects:(id)a3;
+ (id)updateOutgoingEffects:(id)a3;
+ (void)readGlow:(id)a3 fromXmlNode:(_xmlNode *)a4;
+ (void)readOuterShadow:(id)a3 fromXmlNode:(_xmlNode *)a4;
+ (void)readPresetShadow:(id)a3 fromXmlNode:(_xmlNode *)a4;
+ (void)readReflection:(id)a3 fromXmlNode:(_xmlNode *)a4;
+ (void)readShadow:(id)a3 fromXmlNode:(_xmlNode *)a4;
+ (void)writeGlow:(id)a3 to:(id)a4;
+ (void)writeOuterShadow:(id)a3 includeRotateWithShape:(BOOL)a4 to:(id)a5;
+ (void)writePresetShadow:(id)a3 to:(id)a4;
+ (void)writeReflection:(id)a3 to:(id)a4;
+ (void)writeShadowBase:(id)a3 to:(id)a4;
@end

@implementation OAXEffect

+ (id)readEffectsFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type != XML_ELEMENT_NODE) {
      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"outerShdw"))
    {
      v11 = objc_alloc_init(OADOuterShadowEffect);
      [a1 readOuterShadow:v11 fromXmlNode:i];
      [v9 addObject:v11];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"prstShdw"))
    {
      v11 = objc_alloc_init(OADPresetShadowEffect);
      [a1 readPresetShadow:v11 fromXmlNode:i];
      [v9 addObject:v11];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"reflection"))
    {
      v11 = objc_alloc_init(OADReflectionEffect);
      [a1 readReflection:v11 fromXmlNode:i];
      [v9 addObject:v11];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"glow"))
    {
      v11 = objc_alloc_init(OADGlowEffect);
      [a1 readGlow:v11 fromXmlNode:i];
      [v9 addObject:v11];
    }
    else
    {
      if (!xmlStrEqual(i->name, (const xmlChar *)"fillOverlay")) {
        continue;
      }
      v11 = +[OAXFillOverlayEffect readFromXmlNode:i packagePart:v13 drawingState:v8];
      [v9 addObject:v11];
    }
  }
  return v9;
}

+ (id)presetShadowTypeEnumMap
{
  v2 = (void *)+[OAXEffect(Private) presetShadowTypeEnumMap]::presetShadowTypeEnumMap;
  if (!+[OAXEffect(Private) presetShadowTypeEnumMap]::presetShadowTypeEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_6, 0, &dword_238A75000);
    }
    v3 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXEffect(Private) presetShadowTypeEnumMap]::presetShadowTypeEnumStructs count:20 caseSensitive:1];
    v4 = (void *)+[OAXEffect(Private) presetShadowTypeEnumMap]::presetShadowTypeEnumMap;
    +[OAXEffect(Private) presetShadowTypeEnumMap]::presetShadowTypeEnumMap = (uint64_t)v3;

    v2 = (void *)+[OAXEffect(Private) presetShadowTypeEnumMap]::presetShadowTypeEnumMap;
  }
  return v2;
}

+ (BOOL)isEmpty:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    char v7 = 0;
    if (v6)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    continue;
                  }
                }
              }
            }
          }
          char v7 = 1;
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    char v10 = v7 ^ 1;
  }
  else
  {
    char v10 = 1;
  }

  return v10 & 1;
}

+ (void)readShadow:(id)a3 fromXmlNode:(_xmlNode *)a4
{
  id v5 = a3;
  uint64_t v12 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"blurRad", &v12))
  {
    double v6 = (double)v12 / 12700.0;
    *(float *)&double v6 = v6;
    [v5 setBlurRadius:v6];
  }
  uint64_t v11 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"dist", &v11))
  {
    double v7 = (double)v11 / 12700.0;
    *(float *)&double v7 = v7;
    [v5 setDistance:v7];
  }
  uint64_t v10 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"dir", &v10))
  {
    double v8 = (double)v10 / 60000.0;
    *(float *)&double v8 = v8;
    [v5 setAngle:v8];
  }
  id v9 = +[OAXColor readColorFromParentXmlNode:a4];
  [v5 setColor:v9];
}

+ (void)readOuterShadow:(id)a3 fromXmlNode:(_xmlNode *)a4
{
  id v6 = a3;
  [a1 readShadow:v6 fromXmlNode:a4];
  double v16 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"sx", &v16))
  {
    HIDWORD(v7) = HIDWORD(v16);
    *(float *)&double v7 = v16;
    [v6 setXScale:v7];
  }
  double v15 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"sy", &v15))
  {
    HIDWORD(v8) = HIDWORD(v15);
    *(float *)&double v8 = v15;
    [v6 setYScale:v8];
  }
  uint64_t v14 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"kx", &v14))
  {
    double v9 = (double)v14 / 60000.0;
    *(float *)&double v9 = v9;
    [v6 setXSkew:v9];
  }
  uint64_t v13 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"ky", &v13))
  {
    double v10 = (double)v13 / 60000.0;
    *(float *)&double v10 = v10;
    [v6 setYSkew:v10];
  }
  uint64_t v11 = +[OAXBaseTypes readRectAlignmentFromXmlNode:a4 name:"algn"];
  if (v11) {
    [v6 setAlignment:v11];
  }
  BOOL v12 = 0;
  if (CXOptionalBoolAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"rotWithShape", &v12)) {
    [v6 setRotateWithShape:v12];
  }
}

+ (void)writeOuterShadow:(id)a3 includeRotateWithShape:(BOOL)a4 to:(id)a5
{
  BOOL v6 = a4;
  id v34 = a3;
  id v8 = a5;
  double v9 = NSNumber;
  [v34 xScale];
  *(float *)&double v11 = v10 * 100000.0;
  BOOL v12 = [v9 numberWithFloat:v11];
  uint64_t v13 = [v12 longValue];

  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v13);
  [v8 writeOAAttribute:@"sx" content:v14];

  double v15 = NSNumber;
  [v34 yScale];
  *(float *)&double v17 = v16 * 100000.0;
  v18 = [v15 numberWithFloat:v17];
  uint64_t v19 = [v18 longValue];

  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v19);
  [v8 writeOAAttribute:@"sy" content:v20];

  v21 = NSNumber;
  [v34 xSkew];
  *(float *)&double v23 = v22 * 60000.0;
  v24 = [v21 numberWithFloat:v23];
  uint64_t v25 = [v24 longValue];

  v26 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v25);
  [v8 writeOAAttribute:@"kx" content:v26];

  v27 = NSNumber;
  [v34 ySkew];
  *(float *)&double v29 = v28 * 60000.0;
  v30 = [v27 numberWithFloat:v29];
  uint64_t v31 = [v30 longValue];

  v32 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v31);
  [v8 writeOAAttribute:@"ky" content:v32];

  +[OAXBaseTypes writeRectAlignment:to:](OAXBaseTypes, "writeRectAlignment:to:", [v34 alignment], v8);
  if (v6)
  {
    if ([v34 rotateWithShape]) {
      v33 = @"1";
    }
    else {
      v33 = @"0";
    }
    [v8 writeOAAttribute:@"rotWithShape" content:v33];
  }
  [a1 writeShadowBase:v34 to:v8];
}

+ (void)readPresetShadow:(id)a3 fromXmlNode:(_xmlNode *)a4
{
  id v9 = a3;
  objc_msgSend(a1, "readShadow:fromXmlNode:");
  BOOL v6 = CXDefaultStringAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst", 0);
  if (v6)
  {
    double v7 = [a1 presetShadowTypeEnumMap];
    uint64_t v8 = [v7 valueForString:v6];

    if (v8 != -130883970) {
      [v9 setPresetShadowType:v8];
    }
  }
}

+ (void)writePresetShadow:(id)a3 to:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  double v7 = [a1 presetShadowTypeEnumMap];
  uint64_t v8 = objc_msgSend(v7, "stringForValue:", objc_msgSend(v9, "presetShadowType"));

  [v6 writeOAAttribute:@"prst" content:v8];
  [a1 writeShadowBase:v9 to:v6];
}

+ (void)readReflection:(id)a3 fromXmlNode:(_xmlNode *)a4
{
  id v5 = a3;
  uint64_t v31 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"blurRad", &v31))
  {
    double v6 = (double)v31 / 12700.0;
    *(float *)&double v6 = v6;
    [v5 setBlurRadius:v6];
  }
  double v30 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"stA", &v30))
  {
    HIDWORD(v7) = HIDWORD(v30);
    *(float *)&double v7 = v30;
    [v5 setStartOpacity:v7];
  }
  double v29 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"stPos", &v29))
  {
    HIDWORD(v8) = HIDWORD(v29);
    *(float *)&double v8 = v29;
    [v5 setStartPosition:v8];
  }
  double v28 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"endA", &v28))
  {
    HIDWORD(v9) = HIDWORD(v28);
    *(float *)&double v9 = v28;
    [v5 setEndOpacity:v9];
  }
  double v27 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"endPos", &v27))
  {
    HIDWORD(v10) = HIDWORD(v27);
    *(float *)&double v10 = v27;
    [v5 setEndPosition:v10];
  }
  uint64_t v26 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"dist", &v26))
  {
    double v11 = (double)v26 / 12700.0;
    *(float *)&double v11 = v11;
    [v5 setDistance:v11];
  }
  uint64_t v25 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"dir", &v25))
  {
    double v12 = (double)v25 / 60000.0;
    *(float *)&double v12 = v12;
    [v5 setDirection:v12];
  }
  uint64_t v24 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"fadeDir", &v24))
  {
    double v13 = (double)v24 / 60000.0;
    *(float *)&double v13 = v13;
    [v5 setFadeDirection:v13];
  }
  double v23 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"sx", &v23))
  {
    HIDWORD(v14) = HIDWORD(v23);
    *(float *)&double v14 = v23;
    [v5 setXScale:v14];
  }
  double v22 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"sy", &v22))
  {
    HIDWORD(v15) = HIDWORD(v22);
    *(float *)&double v15 = v22;
    [v5 setYScale:v15];
  }
  uint64_t v21 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"kx", &v21))
  {
    double v16 = (double)v21 / 60000.0;
    *(float *)&double v16 = v16;
    [v5 setXSkew:v16];
  }
  uint64_t v20 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"ky", &v20))
  {
    double v17 = (double)v20 / 60000.0;
    *(float *)&double v17 = v17;
    [v5 setYSkew:v17];
  }
  uint64_t v18 = +[OAXBaseTypes readRectAlignmentFromXmlNode:a4 name:"algn"];
  if (v18) {
    [v5 setAlignment:v18];
  }
  BOOL v19 = 0;
  if (CXOptionalBoolAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"rotWithShape", &v19)) {
    [v5 setRotateWithShape:v19];
  }
}

+ (void)writeReflection:(id)a3 to:(id)a4
{
  id v79 = a3;
  id v5 = a4;
  double v6 = NSNumber;
  [v79 blurRadius];
  *(float *)&double v8 = v7 * 12700.0;
  double v9 = [v6 numberWithFloat:v8];
  uint64_t v10 = [v9 longValue];

  double v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v10);
  [v5 writeOAAttribute:@"blurRad" content:v11];

  double v12 = NSNumber;
  [v79 startOpacity];
  *(float *)&double v14 = v13 * 100000.0;
  double v15 = [v12 numberWithFloat:v14];
  uint64_t v16 = [v15 longValue];

  double v17 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v16);
  [v5 writeOAAttribute:@"stA" content:v17];

  uint64_t v18 = NSNumber;
  [v79 startPosition];
  *(float *)&double v20 = v19 * 100000.0;
  uint64_t v21 = [v18 numberWithFloat:v20];
  uint64_t v22 = [v21 longValue];

  double v23 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v22);
  [v5 writeOAAttribute:@"stPos" content:v23];

  uint64_t v24 = NSNumber;
  [v79 endOpacity];
  *(float *)&double v26 = v25 * 100000.0;
  double v27 = [v24 numberWithFloat:v26];
  uint64_t v28 = [v27 longValue];

  double v29 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v28);
  [v5 writeOAAttribute:@"endA" content:v29];

  double v30 = NSNumber;
  [v79 endPosition];
  *(float *)&double v32 = v31 * 100000.0;
  v33 = [v30 numberWithFloat:v32];
  uint64_t v34 = [v33 longValue];

  v35 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v34);
  [v5 writeOAAttribute:@"endPos" content:v35];

  v36 = NSNumber;
  [v79 distance];
  *(float *)&double v38 = v37 * 12700.0;
  v39 = [v36 numberWithFloat:v38];
  uint64_t v40 = [v39 longValue];

  v41 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v40);
  [v5 writeOAAttribute:@"dist" content:v41];

  v42 = NSNumber;
  [v79 direction];
  *(float *)&double v44 = v43 * 60000.0;
  v45 = [v42 numberWithFloat:v44];
  uint64_t v46 = [v45 longValue];

  v47 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v46);
  [v5 writeOAAttribute:@"dir" content:v47];

  v48 = NSNumber;
  [v79 fadeDirection];
  *(float *)&double v50 = v49 * 60000.0;
  v51 = [v48 numberWithFloat:v50];
  uint64_t v52 = [v51 longValue];

  v53 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v52);
  [v5 writeOAAttribute:@"fadeDir" content:v53];

  v54 = NSNumber;
  [v79 xScale];
  *(float *)&double v56 = v55 * 100000.0;
  v57 = [v54 numberWithFloat:v56];
  uint64_t v58 = [v57 longValue];

  v59 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v58);
  [v5 writeOAAttribute:@"sx" content:v59];

  v60 = NSNumber;
  [v79 yScale];
  *(float *)&double v62 = v61 * 100000.0;
  v63 = [v60 numberWithFloat:v62];
  uint64_t v64 = [v63 longValue];

  v65 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v64);
  [v5 writeOAAttribute:@"sy" content:v65];

  v66 = NSNumber;
  [v79 xSkew];
  *(float *)&double v68 = v67 * 60000.0;
  v69 = [v66 numberWithFloat:v68];
  uint64_t v70 = [v69 longValue];

  v71 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v70);
  [v5 writeOAAttribute:@"kx" content:v71];

  v72 = NSNumber;
  [v79 ySkew];
  *(float *)&double v74 = v73 * 60000.0;
  v75 = [v72 numberWithFloat:v74];
  uint64_t v76 = [v75 longValue];

  v77 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v76);
  [v5 writeOAAttribute:@"ky" content:v77];

  +[OAXBaseTypes writeRectAlignment:to:](OAXBaseTypes, "writeRectAlignment:to:", [v79 alignment], v5);
  if ([v79 rotateWithShape]) {
    v78 = @"1";
  }
  else {
    v78 = @"0";
  }
  [v5 writeOAAttribute:@"rotWithShape" content:v78];
}

+ (void)readGlow:(id)a3 fromXmlNode:(_xmlNode *)a4
{
  id v7 = a3;
  double v5 = (double)CXDefaultLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"rad", 0) / 12700.0;
  *(float *)&double v5 = v5;
  [v7 setRadius:v5];
  double v6 = +[OAXColor readColorFromParentXmlNode:a4];
  if (!v6) {
    +[TCMessageException raise:OABadFormat];
  }
  [v7 setColor:v6];
}

+ (void)writeGlow:(id)a3 to:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  double v6 = NSNumber;
  [v13 radius];
  *(float *)&double v8 = v7 * 12700.0;
  double v9 = [v6 numberWithFloat:v8];
  uint64_t v10 = [v9 longValue];

  double v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v10);
  [v5 writeOAAttribute:@"rad" content:v11];

  double v12 = [v13 color];
  +[OAXColor writeColor:v12 to:v5];
}

+ (id)updateIncomingEffects:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v6)
  {

LABEL_14:
    uint64_t v16 = v5;
    goto LABEL_15;
  }
  char v7 = 0;
  uint64_t v8 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v11 = (void *)[v10 copy];
        [v11 blurRadius];
        *(float *)&double v13 = v12 / 5.0;
        [v11 setBlurRadius:v13];
        [v11 distance];
        *(float *)&double v15 = v14 * 0.5;
        [v11 setDistance:v15];
        [v4 addObject:v11];

        char v7 = 1;
      }
      else
      {
        objc_msgSend(v4, "addObject:", v10, (void)v19);
      }
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v6);

  uint64_t v16 = v4;
  if ((v7 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
  id v17 = v16;

  return v17;
}

+ (id)updateOutgoingEffects:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v6)
  {

LABEL_14:
    uint64_t v16 = v5;
    goto LABEL_15;
  }
  char v7 = 0;
  uint64_t v8 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v11 = (void *)[v10 copy];
        [v11 blurRadius];
        *(float *)&double v13 = v12 * 5.0;
        [v11 setBlurRadius:v13];
        [v11 distance];
        *(float *)&double v15 = v14 + v14;
        [v11 setDistance:v15];
        [v4 addObject:v11];

        char v7 = 1;
      }
      else
      {
        objc_msgSend(v4, "addObject:", v10, (void)v19);
      }
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v6);

  uint64_t v16 = v4;
  if ((v7 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
  id v17 = v16;

  return v17;
}

+ (void)writeShadowBase:(id)a3 to:(id)a4
{
  id v25 = a3;
  id v5 = a4;
  uint64_t v6 = NSNumber;
  [v25 blurRadius];
  *(float *)&double v8 = v7 * 12700.0;
  double v9 = [v6 numberWithFloat:v8];
  uint64_t v10 = [v9 longValue];

  double v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", OCXValidateST_PositiveCoordinate(v10));
  [v5 writeOAAttribute:@"blurRad" content:v11];

  float v12 = NSNumber;
  [v25 distance];
  *(float *)&double v14 = v13 * 12700.0;
  double v15 = [v12 numberWithFloat:v14];
  uint64_t v16 = [v15 longValue];

  id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", OCXValidateST_PositiveCoordinate(v16));
  [v5 writeOAAttribute:@"dist" content:v17];

  uint64_t v18 = NSNumber;
  [v25 angle];
  *(float *)&double v20 = v19 * 60000.0;
  long long v21 = [v18 numberWithFloat:v20];
  uint64_t v22 = [v21 longValue];

  double v23 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v22);
  [v5 writeOAAttribute:@"dir" content:v23];

  uint64_t v24 = [v25 color];
  +[OAXColor writeColor:v24 to:v5];
}

@end