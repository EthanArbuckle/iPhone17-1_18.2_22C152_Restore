@interface CHXFont
+ (id)defaultEdRunCollectionForTitle:(id)a3 titleElement:(_xmlNode *)a4 state:(id)a5;
+ (id)defaultEdRunCollectionWithState:(id)a3;
+ (id)edFontFromXmlTextPropertiesElement:(_xmlNode *)a3 state:(id)a4;
+ (id)edFontWithFullOadCharacterProperties:(id)a3 state:(id)a4;
+ (id)edFontWithOadCharacterProperties:(id)a3 state:(id)a4;
+ (id)edFontWithOadTextBody:(id)a3 state:(id)a4;
+ (id)edRunCollectionFromXmlTextPropertiesElement:(_xmlNode *)a3 state:(id)a4;
+ (id)readParagraphPropertiesFromXmlTextPropertiesParentElement:(_xmlNode *)a3 state:(id)a4;
+ (void)mapFontProperties:(id)a3 to:(id)a4;
+ (void)mapFontProperties:(id)a3 toTextProps:(id)a4 withEffects:(id)a5;
@end

@implementation CHXFont

+ (id)edRunCollectionFromXmlTextPropertiesElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = objc_alloc_init(OADTextBody);
    v7 = [v5 drawingState];
    +[OAXTextBody readTextBodyFromXmlNode:a3 textBody:v6 drawingState:v7];

    a3 = +[CHXFont edFontWithOadTextBody:v6 state:v5];
    if ([(OADTextBody *)v6 paragraphCount])
    {
      v8 = [(OADTextBody *)v6 firstParagraphEffects];
    }
    else
    {
      v8 = 0;
    }

    if (a3)
    {
      uint64_t v10 = +[OAXEffect updateIncomingEffects:v8];

      v11 = [v5 resources];
      v12 = +[EDRun runWithCharIndex:0 font:a3 effects:v10 resources:v11];

      v9 = +[EDCollection collection];
      [v9 addObject:v12];

      v8 = (void *)v10;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }

  return v9;
}

+ (id)edFontFromXmlTextPropertiesElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(OADTextBody);
  v8 = [v6 drawingState];
  +[OAXTextBody readTextBodyFromXmlNode:a3 textBody:v7 drawingState:v8];

  v9 = [a1 edFontWithOadTextBody:v7 state:v6];

  return v9;
}

+ (id)edFontWithOadTextBody:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 paragraphCount])
  {
    v8 = [v6 paragraphAtIndex:0];
    v9 = [v8 properties];
    uint64_t v10 = [a1 edFontWithOadCharacterProperties:v9 state:v7];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)edFontWithOadCharacterProperties:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 defaultTextProperties];
  id v9 = v6;
  for (i = v9; ; i = v11)
  {
    v11 = [i parent];
    if (!v11) {
      break;
    }
    v12 = +[OADParagraphProperties defaultProperties];
    char v13 = [v11 isEqual:v12];

    if (v13) {
      break;
    }
    id v14 = v8;
    if (v8)
    {
      v15 = v14;
      while (v15 != v11)
      {
        uint64_t v16 = [v15 parent];

        v15 = (void *)v16;
        if (!v16) {
          goto LABEL_8;
        }
      }

      break;
    }
LABEL_8:
  }
  v17 = [i parent];
  [i setParent:v8];
  v18 = [a1 edFontWithFullOadCharacterProperties:v9 state:v7];
  [i setParent:v17];

  return v18;
}

+ (id)edFontWithFullOadCharacterProperties:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [EDFont alloc];
  v8 = [v6 resources];
  id v9 = [(EDFont *)v7 initWithResources:v8];

  uint64_t v10 = [v6 drawingState];
  if ([v5 hasLatinFont])
  {
    v11 = [v5 latinFont];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      char v13 = [v5 latinFont];
      id v14 = [v10 fontScheme];
      v15 = OADAbsoluteFontNameWithPossiblyRelativeFontNameAndFontScheme(v13, v14);
      [(EDFont *)v9 setName:v15];
    }
  }
  uint64_t v16 = [v5 fill];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [v16 color];
    v18 = [v10 colorMap];
    v19 = [v10 colorScheme];
    v20 = +[OADColor tsuColorWithColor:v17 colorMap:v18 colorScheme:v19 colorPalette:0];

    [(EDFont *)v9 setColor:v20];
  }

  [v5 size];
  [(EDFont *)v9 setHeight:(float)(v21 * 20.0)];
  if ([v5 underlineType] == 3) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = [v5 underlineType] != 0;
  }
  [(EDFont *)v9 setUnderline:v22];
  -[EDFont setBold:](v9, "setBold:", [v5 isBold]);
  -[EDFont setItalic:](v9, "setItalic:", [v5 isItalic]);
  if ([v5 strikeThroughType]) {
    [(EDFont *)v9 setStrike:1];
  }
  v23 = [v6 resources];
  v24 = [v23 fonts];

  uint64_t v25 = [v24 indexOfObject:v9];
  if (v25 == -1) {
    uint64_t v25 = [v24 addObject:v9];
  }
  v26 = [v24 objectAtIndex:v25];

  return v26;
}

+ (id)defaultEdRunCollectionWithState:(id)a3
{
  id v3 = a3;
  v4 = [v3 defaultTextProperties];
  id v5 = +[CHXFont edFontWithFullOadCharacterProperties:v4 state:v3];

  id v6 = +[EDCollection collection];
  id v7 = [v3 resources];
  v8 = +[EDRun runWithCharIndex:0 font:v5 effects:0 resources:v7];

  [v6 addObject:v8];
  return v6;
}

+ (id)defaultEdRunCollectionForTitle:(id)a3 titleElement:(_xmlNode *)a4 state:(id)a5
{
  id v7 = a5;
  [v7 pushTitleTextProperties:1];
  v8 = objc_alloc_init(OADCharacterProperties);
  id v9 = [a1 edFontWithOadCharacterProperties:v8 state:v7];
  [v7 popTitleTextProperties];
  if (v9)
  {
    uint64_t v10 = [v7 drawingState];
    v11 = [v10 OAXChartNamespace];
    uint64_t v12 = (void *)OCXFindChild(a4, v11, "txPr");

    if (v12)
    {
      char v13 = objc_alloc_init(OADTextBody);
      id v14 = [v7 drawingState];
      +[OAXTextBody readTextBodyFromXmlNode:v12 textBody:v13 drawingState:v14];

      if ([(OADTextBody *)v13 paragraphCount])
      {
        uint64_t v12 = [(OADTextBody *)v13 firstParagraphEffects];
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    uint64_t v16 = [v7 resources];
    v17 = +[EDRun runWithCharIndex:0 font:v9 effects:v12 resources:v16];

    v15 = +[EDCollection collection];
    [v15 addObject:v17];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)readParagraphPropertiesFromXmlTextPropertiesParentElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  id v6 = [v5 drawingState];
  id v7 = [v6 OAXChartNamespace];
  uint64_t v8 = OCXFindChild(a3, v7, "txPr");

  if (v8)
  {
    id v9 = objc_alloc_init(OADTextBody);
    uint64_t v10 = [v5 drawingState];
    +[OAXTextBody readTextBodyFromXmlNode:v8 textBody:v9 drawingState:v10];

    if ([(OADTextBody *)v9 paragraphCount])
    {
      v11 = [(OADTextBody *)v9 paragraphAtIndex:0];
      uint64_t v12 = [v11 properties];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = objc_alloc_init(OADParagraphProperties);
  }

  return v12;
}

+ (void)mapFontProperties:(id)a3 to:(id)a4
{
  id v26 = a3;
  id v5 = a4;
  id v6 = [v26 name];
  [v5 setLatinFont:v6];

  [v26 height];
  double v8 = v7 / 20.0;
  *(float *)&double v8 = v8;
  [v5 setSize:v8];
  objc_msgSend(v5, "setIsBold:", objc_msgSend(v26, "isBold"));
  objc_msgSend(v5, "setIsItalic:", objc_msgSend(v26, "isItalic"));
  id v9 = [v26 color];
  [v9 redComponent];
  double v11 = v10;
  [v9 greenComponent];
  double v13 = v12;
  [v9 blueComponent];
  float v14 = v11;
  *(float *)&double v15 = v13;
  *(float *)&double v17 = v16;
  *(float *)&double v16 = v14;
  v18 = +[OADRgbColor rgbColorWithRed:v16 green:v15 blue:v17];
  v19 = objc_alloc_init(OADSolidFill);
  [(OADSolidFill *)v19 setColor:v18];
  [v5 setFill:v19];
  if ([v26 isUnderlineOverridden])
  {
    unsigned int v20 = [v26 underline];
    unint64_t v21 = 0x302030200uLL >> (8 * v20);
    if (v20 >= 5) {
      LOBYTE(v21) = 0;
    }
    [v5 setUnderlineType:v21 & 3];
  }
  if ([v26 isStrikeOverridden]) {
    objc_msgSend(v5, "setStrikeThroughType:", objc_msgSend(v26, "isStrike"));
  }
  if ([v26 script])
  {
    int v22 = [v26 script];
    [v5 size];
    float v24 = -0.06;
    if (v22 != 2) {
      float v24 = 0.0;
    }
    if (v22 == 1) {
      float v24 = 0.32;
    }
    *(float *)&double v23 = v24 / *(float *)&v23;
    [v5 setBaseline:v23];
  }
  objc_msgSend(v5, "setFormatType:", objc_msgSend(v26, "isOutline"));
  if (([v5 hasEffects] & 1) == 0)
  {
    uint64_t v25 = [MEMORY[0x263EFF8C0] array];
    [v5 setEffects:v25];
  }
}

+ (void)mapFontProperties:(id)a3 toTextProps:(id)a4 withEffects:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v13 && v8)
  {
    double v10 = [v8 addParagraph];
    double v11 = [v10 properties];
    double v12 = v11;
    if (v9) {
      [v11 setEffects:v9];
    }
    [a1 mapFontProperties:v13 to:v12];
  }
}

@end