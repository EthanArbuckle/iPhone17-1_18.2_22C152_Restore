@interface OAXTextParaPropertyBag
+ (id)readSpacing:(_xmlNode *)a3 drawingState:(id)a4;
+ (int)readBulletScheme:(id)a3;
+ (void)readAlign:(id)a3 paragraphProperties:(id)a4;
+ (void)readFontAlign:(id)a3 paragraphProperties:(id)a4;
+ (void)readParagraphProperties:(_xmlNode *)a3 paragraphProperties:(id)a4 drawingState:(id)a5;
+ (void)readTabList:(_xmlNode *)a3 paragraphProperties:(id)a4 drawingState:(id)a5;
@end

@implementation OAXTextParaPropertyBag

+ (void)readParagraphProperties:(_xmlNode *)a3 paragraphProperties:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    uint64_t v54 = 0;
    BOOL v53 = 0;
    double v52 = 0.0;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"marL", &v54))
    {
      double v10 = (double)v54 / 12700.0;
      *(float *)&double v10 = v10;
      [v8 setLeftMargin:v10];
    }
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"marR", &v54))
    {
      double v11 = (double)v54 / 12700.0;
      *(float *)&double v11 = v11;
      [v8 setRightMargin:v11];
    }
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"lvl", &v54)) {
      [v8 setLevel:v54];
    }
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"indent", &v54))
    {
      double v12 = (double)v54 / 12700.0;
      *(float *)&double v12 = v12;
      [v8 setIndent:v12];
    }
    id v51 = 0;
    BOOL v13 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"algn", &v51);
    id v14 = v51;
    if (v13) {
      [a1 readAlign:v14 paragraphProperties:v8];
    }
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"defTabSz", &v54, 12))
    {
      double v15 = (double)v54 / 12700.0;
      *(float *)&double v15 = v15;
      [v8 setDefaultTab:v15];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rtl", &v53)) {
      [v8 setIsRightToLeft:v53];
    }
    v45 = v14;
    id v50 = 0;
    BOOL v16 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"fontAlgn", &v50);
    id v17 = v50;
    if (v16) {
      [a1 readFontAlign:v17 paragraphProperties:v8];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"latinLnBrk", &v53)) {
      [v8 setIsLatinLineBreak:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"hangingPunct", &v53)) {
      [v8 setIsHangingPunctuation:v53];
    }
    v44 = v17;
    for (i = OCXFirstChild(a3); ; i = OCXNextSibling(i))
    {
      if (!i)
      {

        break;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"lnSpc"))
      {
        v19 = [a1 readSpacing:i drawingState:v9];
        [v8 setLineSpacing:v19];
        goto LABEL_42;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"spcBef"))
      {
        v19 = [a1 readSpacing:i drawingState:v9];
        [v8 setBeforeSpacing:v19];
        goto LABEL_42;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"spcAft"))
      {
        v19 = [a1 readSpacing:i drawingState:v9];
        [v8 setAfterSpacing:v19];
        goto LABEL_42;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"tabLst"))
      {
        [a1 readTabList:i paragraphProperties:v8 drawingState:v9];
        v19 = 0;
        goto LABEL_42;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"defRPr"))
      {
        +[OAXTextCharPropertyBag readCharacterProperties:i characterProperties:v8 drawingState:v9];
        v19 = 0;
        goto LABEL_42;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"buClr"))
      {
        v20 = +[OAXColor readColorFromParentXmlNode:i];
        if (v20)
        {
          v21 = [[OADBulletColorSpecification alloc] initWithBulletColor:v20];
          [v8 setBulletColor:v21];
LABEL_37:
        }
      }
      else
      {
        if (xmlStrEqual(i->name, (const xmlChar *)"buClrTx"))
        {
          v20 = objc_alloc_init(OADBulletColorFollowText);
          [v8 setBulletColor:v20];
          goto LABEL_40;
        }
        if (xmlStrEqual(i->name, (const xmlChar *)"buSzPts"))
        {
          if (!CXOptionalLongAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v54)) {
            goto LABEL_41;
          }
          v22 = [OADPointBulletSize alloc];
          v20 = [(OADPointBulletSize *)v22 initWithPoints:((int)v54 / 100)];
          [v8 setBulletSize:v20];
        }
        else
        {
          if (xmlStrEqual(i->name, (const xmlChar *)"buSzPct"))
          {
            if (!CXOptionalFractionAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v52)) {
              goto LABEL_41;
            }
            v23 = [OADPercentBulletSize alloc];
            double v24 = v52 * 100.0;
            *(float *)&double v24 = v52 * 100.0;
            v20 = [(OADPercentBulletSize *)v23 initWithPercent:v24];
            [v8 setBulletSize:v20];
            goto LABEL_40;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"buSzTx"))
          {
            v20 = objc_alloc_init(OADBulletSizeFollowText);
            [v8 setBulletSize:v20];
            goto LABEL_40;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"buFont"))
          {
            id v49 = 0;
            BOOL v25 = CXOptionalStringAttribute(i, (void *)CXNoNamespace, (xmlChar *)"typeface", &v49);
            v20 = (OADBulletColorFollowText *)v49;
            if (v25) {
              v26 = [[OADBulletFontSpecification alloc] initWithFont:v20];
            }
            else {
              v26 = objc_alloc_init(OADBulletFontFollowText);
            }
            [v8 setBulletFont:v26];

            unint64_t v48 = 0;
            if (CXOptionalUnsignedLongAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"charset", &v48)) {
              [v8 setBulletCharSet:v48];
            }
            goto LABEL_40;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"buFontTx"))
          {
            v20 = objc_alloc_init(OADBulletFontFollowText);
            [v8 setBulletFont:v20];
            goto LABEL_40;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"buAutoNum"))
          {
            id v47 = 0;
            BOOL v27 = CXOptionalStringAttribute(i, (void *)CXNoNamespace, (xmlChar *)"type", &v47);
            v20 = (OADBulletColorFollowText *)v47;
            if (v27)
            {
              v28 = numberBulletSchemeEnumMap();
              v40 = v20;
              uint64_t v39 = [v28 valueForString:v20];

              LODWORD(v28) = CXOptionalLongAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"startAt", &v54);
              int v29 = v54;
              v30 = [OADAutoNumberBulletProperties alloc];
              if (v28) {
                uint64_t v31 = v29;
              }
              else {
                uint64_t v31 = 1;
              }
              v32 = [(OADAutoNumberBulletProperties *)v30 initWithAutoNumberSchemeType:v39 startIndex:v31];
              [v8 setBulletProperties:v32];

              v20 = v40;
            }
            goto LABEL_40;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"buChar"))
          {
            id v46 = 0;
            BOOL v33 = CXOptionalStringAttribute(i, (void *)CXNoNamespace, (xmlChar *)"char", &v46);
            v34 = (OADBulletColorFollowText *)v46;
            v20 = v34;
            if (!v33) {
              goto LABEL_40;
            }
            unint64_t v35 = [(OADBulletColorFollowText *)v34 length];
            if (!v35) {
              goto LABEL_40;
            }
            uint64_t v36 = [(OADBulletColorFollowText *)v20 characterAtIndex:0] & 0xFC00;
            if (v36 == 55296)
            {
              if (v35 < 2
                || [(OADBulletColorFollowText *)v20 characterAtIndex:1] >> 10 != 55)
              {
                goto LABEL_40;
              }
              uint64_t v37 = 2;
            }
            else
            {
              if (v36 == 56320) {
                goto LABEL_40;
              }
              uint64_t v37 = 1;
            }
            uint64_t v42 = v37;
            v38 = [OADCharacterBulletProperties alloc];
            v43 = [(OADBulletColorFollowText *)v20 substringToIndex:v42];
            v21 = [(OADCharacterBulletProperties *)v38 initWithBullet:v43];

            [v8 setBulletProperties:v21];
            goto LABEL_37;
          }
          if (!xmlStrEqual(i->name, (const xmlChar *)"buBlip"))
          {
            if (!xmlStrEqual(i->name, (const xmlChar *)"buNone")) {
              goto LABEL_41;
            }
            v20 = objc_alloc_init(OADNullBulletProperties);
            [v8 setBulletProperties:v20];
            goto LABEL_40;
          }
          v41 = [v9 packagePart];
          v20 = +[OAXFill readBlipRefFromXmlNode:i packagePart:v41 forDrawable:0 drawingState:v9 forBullet:1];

          if (v20 && ([(OADBulletColorFollowText *)v20 isNull] & 1) == 0)
          {
            v21 = [[OADImageBulletProperties alloc] initWithBlipRef:v20];
            [v8 setBulletProperties:v21];
            goto LABEL_37;
          }
        }
      }
LABEL_40:

LABEL_41:
      v19 = 0;
LABEL_42:
    }
  }
}

+ (void)readAlign:(id)a3 paragraphProperties:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (textAlignEnumMap(void)::once != -1) {
    dispatch_once(&textAlignEnumMap(void)::once, &__block_literal_global_202);
  }
  id v6 = (id)textAlignEnumMap(void)::theEnumMap;
  objc_msgSend(v5, "setAlign:", objc_msgSend(v6, "valueForString:", v7));
}

+ (void)readFontAlign:(id)a3 paragraphProperties:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (fontAlignEnumMap(void)::once != -1) {
    dispatch_once(&fontAlignEnumMap(void)::once, &__block_literal_global_217);
  }
  id v6 = (id)fontAlignEnumMap(void)::theEnumMap;
  objc_msgSend(v5, "setFontAlign:", objc_msgSend(v6, "valueForString:", v7));
}

+ (int)readBulletScheme:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"alphaLcParenBoth"])
    {
      int v5 = 1;
    }
    else if ([v4 isEqualToString:@"alphaLcParenR"])
    {
      int v5 = 3;
    }
    else if ([v4 isEqualToString:@"alphaLcPeriod"])
    {
      int v5 = 5;
    }
    else if ([v4 isEqualToString:@"alphaUcParenBoth"])
    {
      int v5 = 2;
    }
    else if ([v4 isEqualToString:@"alphaUcParenR"])
    {
      int v5 = 4;
    }
    else if ([v4 isEqualToString:@"alphaUcPeriod"])
    {
      int v5 = 6;
    }
    else if ([v4 isEqualToString:@"arabic1Minus"])
    {
      int v5 = 13;
    }
    else if ([v4 isEqualToString:@"arabic2Minus"])
    {
      int v5 = 14;
    }
    else if ([v4 isEqualToString:@"arabicDbPeriod"])
    {
      int v5 = 11;
    }
    else if ([v4 isEqualToString:@"arabicDbPlain"])
    {
      int v5 = 12;
    }
    else if ([v4 isEqualToString:@"arabicParenBoth"])
    {
      int v5 = 7;
    }
    else if ([v4 isEqualToString:@"arabicParenR"])
    {
      int v5 = 8;
    }
    else if ([v4 isEqualToString:@"arabicPeriod"])
    {
      int v5 = 9;
    }
    else if ([v4 isEqualToString:@"arabicPlain"])
    {
      int v5 = 10;
    }
    else if ([v4 isEqualToString:@"circleNumDbPlain"])
    {
      int v5 = 22;
    }
    else if ([v4 isEqualToString:@"circleNumWdBlackPlain"])
    {
      int v5 = 23;
    }
    else if ([v4 isEqualToString:@"circleNumWdWhitePlain"])
    {
      int v5 = 24;
    }
    else if ([v4 isEqualToString:@"ea1ChsPeriod"])
    {
      int v5 = 25;
    }
    else if ([v4 isEqualToString:@"ea1ChsPlain"])
    {
      int v5 = 26;
    }
    else if ([v4 isEqualToString:@"ea1ChtPeriod"])
    {
      int v5 = 27;
    }
    else if ([v4 isEqualToString:@"ea1ChtPlain"])
    {
      int v5 = 28;
    }
    else if ([v4 isEqualToString:@"ea1JpnChsDbPeriod"])
    {
      int v5 = 29;
    }
    else if ([v4 isEqualToString:@"ea1JpnKorPeriod"])
    {
      int v5 = 31;
    }
    else if ([v4 isEqualToString:@"ea1JpnKorPlain"])
    {
      int v5 = 30;
    }
    else if ([v4 isEqualToString:@"hebrew2Minus"])
    {
      int v5 = 15;
    }
    else if ([v4 isEqualToString:@"hindiAlpha1Period"])
    {
      int v5 = 41;
    }
    else if ([v4 isEqualToString:@"hindiAlphaPeriod"])
    {
      int v5 = 38;
    }
    else if ([v4 isEqualToString:@"hindiNumParenR"])
    {
      int v5 = 40;
    }
    else if ([v4 isEqualToString:@"hindiNumPeriod"])
    {
      int v5 = 39;
    }
    else if ([v4 isEqualToString:@"romanLcParenBoth"])
    {
      int v5 = 16;
    }
    else if ([v4 isEqualToString:@"romanLcParenR"])
    {
      int v5 = 18;
    }
    else if ([v4 isEqualToString:@"romanLcPeriod"])
    {
      int v5 = 20;
    }
    else if ([v4 isEqualToString:@"romanUcParenBoth"])
    {
      int v5 = 17;
    }
    else if ([v4 isEqualToString:@"romanUcParenR"])
    {
      int v5 = 19;
    }
    else if ([v4 isEqualToString:@"romanUcPeriod"])
    {
      int v5 = 21;
    }
    else if ([v4 isEqualToString:@"thaiAlphaParenBoth"])
    {
      int v5 = 34;
    }
    else if ([v4 isEqualToString:@"thaiAlphaParenR"])
    {
      int v5 = 33;
    }
    else if ([v4 isEqualToString:@"thaiAlphaPeriod"])
    {
      int v5 = 32;
    }
    else if ([v4 isEqualToString:@"thaiNumParenBoth"])
    {
      int v5 = 37;
    }
    else if ([v4 isEqualToString:@"thaiNumParenR"])
    {
      int v5 = 36;
    }
    else if ([v4 isEqualToString:@"thaiNumPeriod"])
    {
      int v5 = 35;
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

+ (id)readSpacing:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5 = a4;
  id v6 = [v5 OAXMainNamespace];
  id v7 = (_xmlNode *)OCXFindChild(a3, v6, "spcPct");

  id v8 = [v5 OAXMainNamespace];
  id v9 = (_xmlNode *)OCXFindChild(a3, v8, "spcPts");

  if (v7)
  {
    *(double *)&uint64_t v20 = 0.0;
    BOOL v10 = CXOptionalFractionAttribute(v7, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", (double *)&v20);
    if (*(double *)&v20 >= 0.0 && v10)
    {
      double v12 = [OADPercentTextSpacing alloc];
      double v13 = *(double *)&v20 * 100.0;
      *(float *)&double v13 = *(double *)&v20 * 100.0;
      uint64_t v14 = [(OADPercentTextSpacing *)v12 initWithPercent:v13];
LABEL_13:
      v18 = (void *)v14;
      goto LABEL_15;
    }
  }
  else if (v9)
  {
    *(double *)&uint64_t v20 = 0.0;
    BOOL v15 = CXOptionalLongAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v20);
    if (v20 >= 0 && v15)
    {
      id v17 = [OADPointTextSpacing alloc];
      uint64_t v14 = [(OADPointTextSpacing *)v17 initWithPoints:((int)v20 / 100)];
      goto LABEL_13;
    }
  }
  v18 = 0;
LABEL_15:

  return v18;
}

+ (void)readTabList:(_xmlNode *)a3 paragraphProperties:(id)a4 drawingState:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v10 = [v8 OAXMainNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v10, "tab");

  while (Child)
  {
    uint64_t v18 = 0;
    if (CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"pos", &v18, 12))
    {
      id v17 = 0;
      BOOL v12 = CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"algn", &v17);
      id v13 = v17;
      if (v12)
      {
        uint64_t v14 = objc_alloc_init(OADTabStop);
        [(OADTabStop *)v14 setPosition:(int)((double)v18 / 12700.0)];
        if (tabStopAlignEnumMap(void)::once != -1) {
          dispatch_once(&tabStopAlignEnumMap(void)::once, &__block_literal_global_187);
        }
        id v15 = (id)tabStopAlignEnumMap(void)::theEnumMap;
        -[OADTabStop setAlign:](v14, "setAlign:", [v15 valueForString:v13]);

        [v9 addObject:v14];
      }
    }
    else
    {
      id v13 = 0;
    }
    BOOL v16 = [v8 OAXMainNamespace];
    Child = OCXFindNextChild(Child, v16, (xmlChar *)"tab");
  }
  [v7 setTabStops:v9];
}

@end