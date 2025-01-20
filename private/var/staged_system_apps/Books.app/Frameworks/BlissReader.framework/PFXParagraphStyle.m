@interface PFXParagraphStyle
+ (BOOL)map:(id *)a3 stackEntry:(id)a4;
+ (BOOL)mapParagraphPropertiesFrom:(id)a3 to:(id)a4;
+ (void)mapAlignString:(id)a3 to:(id)a4;
+ (void)mapAlignment:(id)a3 to:(id)a4;
+ (void)mapBorders:(id)a3 to:(id)a4 stackEntry:(id)a5;
+ (void)mapDropCap:(id)a3 to:(id)a4 stackEntry:(id)a5;
+ (void)mapElementPropertiesTo:(id)a3 stackEntry:(id)a4;
+ (void)mapFillColor:(id)a3 to:(id)a4;
+ (void)mapHyphenate:(id)a3 to:(id)a4;
+ (void)mapHyphenateString:(id)a3 to:(id)a4;
+ (void)mapLineSpacing:(id)a3 to:(id)a4 stackEntry:(id)a5;
+ (void)mapPageBreakBefore:(id)a3 to:(id)a4 stackEntry:(id)a5;
+ (void)mapProperties:(id)a3 to:(id)a4 stackEntry:(id)a5;
+ (void)mapTabInterval:(id)a3 to:(id)a4 stackEntry:(id)a5;
+ (void)mapTabStops:(id)a3 to:(id)a4 stackEntry:(id)a5;
+ (void)mapTextIndent:(id)a3 to:(id)a4 stackEntry:(id)a5;
+ (void)populateDefaultParagraphProperties:(id)a3;
@end

@implementation PFXParagraphStyle

+ (BOOL)map:(id *)a3 stackEntry:(id)a4
{
  *a3 = 0;
  id v7 = objc_msgSend(objc_msgSend(a4, "htmlReaderState"), "currentHtmlDocMediaState");
  id v8 = [a4 styleSelector];
  id v9 = [v7 displayValueForStyleSelector:v8];
  if (v9)
  {
    if ([v9 BOOLValue])
    {
      *a3 = [v7 paragraphStyleForStyleSelector:v8];
      objc_msgSend(objc_msgSend(a4, "currentEntryMediaState"), "setWhitespace:", objc_msgSend(v7, "whitespaceValueForStyleSelector:", v8));
      LOBYTE(v10) = 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    id v11 = objc_alloc_init((Class)TSSPropertyMap);
    id v10 = [a1 mapParagraphPropertiesFrom:a4 to:v11];
    if (v10)
    {
      id v12 = [v7 defaultParagraphStyle];
      if ([v11 count]) {
        id v12 = objc_msgSend(objc_msgSend(v7, "stylesheet"), "variationOfStyle:propertyMap:", v12, v11);
      }
      objc_msgSend(v7, "setWhitespaceValue:forStyleSelector:", objc_msgSend(objc_msgSend(a4, "currentEntryMediaState"), "whitespace"), v8);
      [v7 setParagraphStyle:v12 forStyleSelector:v8];
      *a3 = v12;
    }
    [v7 setDisplayValue:v10 forStyleSelector:v8];
  }
  return (char)v10;
}

+ (BOOL)mapParagraphPropertiesFrom:(id)a3 to:(id)a4
{
  id v7 = [(PFSPropertySet *)[a3 currentEntryMediaState] propertySet];
  int v8 = PFXHtmlStyleDisplayValue(v7);
  if (v8)
  {
    id v9 = objc_alloc_init((Class)TSSPropertyMap);
    id v10 = [v9 copy];
    [a1 mapElementPropertiesTo:v9 stackEntry:a3];
    [a1 mapProperties:v7 to:v10 stackEntry:a3];
    +[PFXCharacterStyle mapCharacterPropertiesFrom:a3 to:v10];
    if ([v9 count] || objc_msgSend(v10, "count"))
    {
      [a4 addValuesFromPropertyMap:v9];
      [a4 addValuesFromPropertyMap:v10];
    }
  }
  return v8;
}

+ (void)populateDefaultParagraphProperties:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2062AC;
  v3[3] = &unk_4574B8;
  v3[4] = a3;
  [+[TSWPParagraphStyle paragraphProperties] enumeratePropertiesUsingBlock:v3];
}

+ (void)mapLineSpacing:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v8 = [a3 valueForProperty:"line-height"];
  if (v8)
  {
    id v9 = [v8 objectAtIndex:0];
    id v10 = (char *)[v9 type];
    objc_msgSend(objc_msgSend(a5, "currentEntryMediaState"), "parentFontSize");
    double v12 = v11;
    +[PFSUtilities htmlValueToLineHeight:parentFontSize:](PFSUtilities, "htmlValueToLineHeight:parentFontSize:", v9);
    if (v13 >= 0.0)
    {
      double v14 = v13;
      if ((unint64_t)(v10 - 278) > 0x12 || ((1 << (v10 - 22)) & 0x60003) == 0)
      {
        id v17 = [a3 valueForProperty:PFXPropNmApplePubLineSpacingMode[0]];
        if (v17
          && (id v18 = [v17 objectAtIndex:0],
              v19 = (section_64 *)[v18 type],
              id v20 = objc_msgSend(objc_msgSend(v18, "value"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")), v19 == &stru_108))
        {
          v21 = v20;
          if ([v20 isEqualToString:@"min"])
          {
            uint64_t v16 = 1;
          }
          else if ([v21 isEqualToString:@"max"])
          {
            uint64_t v16 = 3;
          }
          else
          {
            uint64_t v16 = 2;
            if (([v21 isEqualToString:@"exact"] & 1) == 0)
            {
              if ([v21 isEqualToString:@"between"]) {
                uint64_t v16 = 4;
              }
              else {
                uint64_t v16 = 2;
              }
            }
          }
        }
        else
        {
          uint64_t v16 = 2;
        }
      }
      else
      {
        uint64_t v16 = 0;
        double v14 = v13 / v12;
      }
      id v22 = [objc_alloc((Class)TSWPLineSpacing) initWithMode:v16 amount:v14];
      [a4 setObject:v22 forProperty:85];
    }
  }
}

+ (void)mapPageBreakBefore:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v6 = +[PFSUtilities identValueOrNilFromPair:](PFSUtilities, "identValueOrNilFromPair:", objc_msgSend(objc_msgSend(a3, "valueForProperty:", "page-break-before", a4, a5), "objectAtIndex:", 0));
  if (v6 && [@"always" isEqualToString:v6])
  {
    [a4 setBoolValue:1 forProperty:91];
  }
}

+ (void)mapFillColor:(id)a3 to:(id)a4
{
  id v6 = [a3 valueForProperty:"background-color"];
  if (v6 || (id v6 = [a3 valueForProperty:"background"]) != 0)
  {
    id v7 = +[PFXStyleUtilities colorInArray:v6];
    if (v7)
    {
      [a4 setObject:v7 forProperty:98];
    }
  }
}

+ (void)mapBorders:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  uint64_t v26 = 0;
  id v7 = +[PFXBorderStyle mapStroke:paragraphBorderType:stackEntry:](PFXBorderStyle, "mapStroke:paragraphBorderType:stackEntry:", a3, &v26);
  if (v26)
  {
    id v8 = v7;
    id v9 = [a5 currentEntryMediaState];
    double v10 = 0.0;
    double v11 = v9;
    switch(v26)
    {
      case 1:
        [v9 paddingBefore];
        goto LABEL_6;
      case 2:
        [v9 paddingAfter];
LABEL_6:
        double v13 = v12;
        break;
      case 3:
        [v9 paddingBefore];
        double v15 = v14;
        [v11 paddingAfter];
        double v13 = (v15 + v16) * 0.5;
        break;
      case 4:
        [v9 leftPadding];
        double v18 = v17;
        [v11 rightPadding];
        double v10 = (v18 + v19) * 0.5;
        [v11 paddingBefore];
        double v21 = v20;
        [v11 paddingAfter];
        double v13 = (v21 + v22) * 0.5;
        break;
      default:
        double v13 = 0.0;
        break;
    }
    [a4 setObject:[objc_alloc((Class)TSWPRuleOffset) initWithDX:-v10 dY:v13] forProperty:105];
    LODWORD(v23) = 1.0;
    [a4 setFloatValue:104 forProperty:v23];
    [a4 setIntValue:v26 forProperty:102];
    if (v8)
    {
      id v24 = a4;
      id v25 = v8;
    }
    else
    {
      id v25 = +[TSDStroke emptyStroke];
      id v24 = a4;
    }
    [v24 setObject:v25 forProperty:103];
  }
}

+ (void)mapAlignString:(id)a3 to:(id)a4
{
  if (objc_msgSend(@"left", "isEqualToString:"))
  {
    uint64_t v6 = 0;
  }
  else if ([@"center" isEqualToString:a3])
  {
    uint64_t v6 = 2;
  }
  else if ([@"right" isEqualToString:a3])
  {
    uint64_t v6 = 1;
  }
  else
  {
    if (![@"justify" isEqualToString:a3]) {
      return;
    }
    uint64_t v6 = 3;
  }

  [a4 setIntValue:v6 forProperty:86];
}

+ (void)mapAlignment:(id)a3 to:(id)a4
{
  id v6 = [a3 valueForProperty:"text-align"];
  if (v6)
  {
    id v7 = [v6 objectAtIndex:0];
    id v8 = (section_64 *)[v7 type];
    id v9 = [[[v7 value] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    if (v8 == &stru_108)
    {
      [a1 mapAlignString:v9 to:a4];
    }
  }
}

+ (void)mapHyphenateString:(id)a3 to:(id)a4
{
  if (objc_msgSend(@"none", "isEqualToString:"))
  {
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  if (([@"auto" isEqualToString:a3] & 1) == 0)
  {
    if (![@"manual" isEqualToString:a3]) {
      return;
    }
    goto LABEL_5;
  }
  uint64_t v6 = 1;
LABEL_6:

  [a4 setIntValue:v6 forProperty:93];
}

+ (void)mapHyphenate:(id)a3 to:(id)a4
{
  id v6 = [a3 valueForProperty:"hyphens"];
  if (v6)
  {
    id v7 = [v6 objectAtIndex:0];
    id v8 = (section_64 *)[v7 type];
    id v9 = objc_msgSend(objc_msgSend(v7, "value"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    if (v8 == &stru_108)
    {
      [a1 mapHyphenateString:v9 to:a4];
    }
  }
}

+ (void)mapTextIndent:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v8 = [a5 htmlReaderState];
  objc_msgSend(objc_msgSend(a5, "currentEntryMediaState"), "parentFontSize");
  double v10 = v9;
  [v8 pageContentWidth];
  double v12 = v11;
  id v13 = [a3 valueForProperty:"text-indent"];
  if (v13)
  {
    +[PFSUtilities htmlValueToPointLength:parentFontSize:percentageBasis:](PFSUtilities, "htmlValueToPointLength:parentFontSize:percentageBasis:", [v13 objectAtIndex:0], v10, v12);
    double v15 = v14;
  }
  else
  {
    double v15 = -65536.0;
  }
  if ([a4 containsProperty:81])
  {
    [a4 floatValueForProperty:81];
    double v17 = v16;
  }
  else
  {
    double v17 = -65536.0;
  }
  if (v15 != -65536.0 || v17 != -65536.0)
  {
    double v18 = 0.0;
    if (v17 == -65536.0) {
      double v17 = 0.0;
    }
    double v19 = -0.0;
    if (v15 != -65536.0) {
      double v19 = v15;
    }
    double v20 = v19 + v17;
    if (v20 >= 0.0)
    {
      double v18 = v20;
    }
    else
    {
      double v21 = v17 - v20;
      *(float *)&double v21 = v21;
      [a4 setFloatValue:81 forProperty:v21];
    }
    *(float *)&double v17 = v18;
    [a4 setFloatValue:80 forProperty:v17];
  }
}

+ (void)mapTabInterval:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v7 = [a3 valueForProperty:"tab-interval"];
  if (v7)
  {
    id v8 = v7;
    id v9 = [a5 htmlReaderState];
    objc_msgSend(objc_msgSend(a5, "currentEntryMediaState"), "parentFontSize");
    double v11 = v10;
    [v9 pageContentWidth];
    +[PFSUtilities htmlValueToPointLength:parentFontSize:percentageBasis:](PFSUtilities, "htmlValueToPointLength:parentFontSize:percentageBasis:", [v8 objectAtIndex:0], v11, v12);
    *(float *)&double v13 = v13;
    [a4 setFloatValue:83 forProperty:v13];
  }
}

+ (void)mapTabStops:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v8 = [a3 valueForProperty:"tab-stops"];
  if (v8)
  {
    id v9 = v8;
    id v29 = objc_alloc_init((Class)TSWPTabs);
    id v10 = [a5 htmlReaderState];
    objc_msgSend(objc_msgSend(a5, "currentEntryMediaState"), "parentFontSize");
    double v12 = v11;
    [v10 pageContentWidth];
    double v14 = v13;
    id v27 = a4;
    if ([v9 count] == (char *)&dword_0 + 1)
    {
      if (!qword_573700)
      {
        objc_sync_enter(a1);
        if (!qword_573700)
        {
          double v15 = [[PFSPair alloc] initWithType:264 value:@"none"];
          __dmb(0xBu);
          qword_573700 = (uint64_t)v15;
        }
        objc_sync_exit(a1);
      }
      id v16 = [v9 lastObject:a4];
      if ([v16 isEqual:qword_573700]) {
        id v9 = 0;
      }
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16 v27];
    if (v17)
    {
      uint64_t v18 = 0;
      id v19 = 0;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v9);
          }
          double v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          double v23 = (section_64 *)[v22 type];
          if (v23 == &stru_108)
          {
            id v24 = [v22 value];
            if ([v24 isEqualToString:@"left"])
            {
              uint64_t v18 = 0;
            }
            else if ([v24 isEqualToString:@"center"])
            {
              uint64_t v18 = 1;
            }
            else if ([v24 isEqualToString:@"right"])
            {
              uint64_t v18 = 2;
            }
            else if ([v24 isEqualToString:@"decimal"])
            {
              uint64_t v18 = 3;
            }
            else
            {
              uint64_t v18 = v18;
            }
          }
          else if (v23 == (section_64 *)((char *)&stru_B8.reserved3 + 3))
          {
            id v19 = [v22 value];
          }
          else
          {
            +[PFSUtilities htmlValueToPointLength:v22 parentFontSize:v12 percentageBasis:v14];
            if (v25 != -65536.0)
            {
              id v26 = [objc_alloc((Class)TSWPTab) initWithPosition:v18 alignment:v19 leader:v25];
              [v29 insertTab:v26];
            }
          }
        }
        id v17 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v17);
    }
    [v28 setObject:v29 forProperty:84];
  }
}

+ (void)mapDropCap:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v8 = [a3 valueForProperty:PFXPropNmApplePubDropCap[0]];
  if ([v8 count] == (char *)&dword_0 + 3)
  {
    uint64_t v9 = +[PFXStyleUtilities integerValueInPair:](PFXStyleUtilities, "integerValueInPair:", [v8 objectAtIndexedSubscript:0]);
    int64_t v10 = +[PFXStyleUtilities integerValueInPair:](PFXStyleUtilities, "integerValueInPair:", [v8 objectAtIndexedSubscript:1]);
    if (v9 >= 1)
    {
      int64_t v11 = v10;
      id v12 = +[TSSPropertyMap propertyMap];
      id v13 = [a3 valueForProperty:PFXPropNmApplePubDropCapBackground[0]];
      if ([v13 count] == (char *)&dword_0 + 1)
      {
        id v14 = +[PFXStyleUtilities colorInArray:v13];
        if (v14) {
          [v12 setObject:v14 forProperty:38];
        }
      }
      id v15 = [a3 valueForProperty:PFXPropNmApplePubDropCapColor];
      if ([v15 count] == (char *)&dword_0 + 1)
      {
        id v16 = +[PFXStyleUtilities colorInArray:v15];
        if (v16) {
          [v12 setObject:v16 forProperty:18];
        }
      }
      +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", [v8 subarrayWithRange:2, 1], [a5 htmlReaderState]);
      double v18 = v17;
      id v19 = +[TSWPDropCapSpacing dropCapSpacingWithLineCount:v11 elevatedLineCount:0];
      [(TSWPDropCapSpacing *)v19 setPadding:v18];
      uint64_t v20 = +[TSWPDropCap dropCapWithCharCount:v9 characterStyleOverridePropertyMap:v12 spacing:v19];
      [a4 setObject:v20 forProperty:109];
    }
  }
}

+ (void)mapProperties:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  [a1 mapLineSpacing:to:stackEntry:];
  [a1 mapFillColor:a3 to:a4];
  [a1 mapAlignment:a3 to:a4];
  +[PFXMargins mapMarginsForEntry:to:inList:](PFXMargins, "mapMarginsForEntry:to:inList:", a5, a4, xmlStrEqual((const xmlChar *)"li", (const xmlChar *)[a5 xmlElementName]) != 0);
  [a1 mapBorders:a3 to:a4 stackEntry:a5];
  [a1 mapTextIndent:a3 to:a4 stackEntry:a5];
  [a1 mapTabInterval:a3 to:a4 stackEntry:a5];
  [a1 mapTabStops:a3 to:a4 stackEntry:a5];
  [a1 mapPageBreakBefore:a3 to:a4 stackEntry:a5];
  [a1 mapHyphenate:a3 to:a4];

  [a1 mapDropCap:a3 to:a4 stackEntry:a5];
}

+ (void)mapElementPropertiesTo:(id)a3 stackEntry:(id)a4
{
  id v7 = (const xmlChar *)[a4 xmlElementName];
  if (!xmlStrEqual(v7, (const xmlChar *)"blockquote"))
  {
    if (xmlStrEqual(v7, (const xmlChar *)"center")) {
      goto LABEL_5;
    }
    if (xmlStrEqual(v7, (const xmlChar *)"div")
      || xmlStrEqual(v7, (const xmlChar *)"dt")
      || xmlStrEqual(v7, (const xmlChar *)"dd"))
    {
      goto LABEL_18;
    }
    if (xmlStrEqual(v7, (const xmlChar *)"h1"))
    {
      [a3 setObject:@"Times-Roman" forProperty:16];
      double v15 = 8589936700.0;
    }
    else if (xmlStrEqual(v7, (const xmlChar *)"h2"))
    {
      [a3 setObject:@"Times-Roman" forProperty:16];
      LODWORD(v15) = 24.0;
    }
    else if (xmlStrEqual(v7, (const xmlChar *)"h3"))
    {
      [a3 setObject:@"Times-Roman" forProperty:16];
      LODWORD(v15) = 18.0;
    }
    else if (xmlStrEqual(v7, (const xmlChar *)"h4"))
    {
      [a3 setObject:@"Times-Roman" forProperty:16];
      LODWORD(v15) = 16.0;
    }
    else if (xmlStrEqual(v7, (const xmlChar *)"h5"))
    {
      [a3 setObject:@"Times-Roman" forProperty:16];
      LODWORD(v15) = 12.0;
    }
    else
    {
      if (!xmlStrEqual(v7, (const xmlChar *)"h6"))
      {
        if (!xmlStrEqual(v7, (const xmlChar *)"li"))
        {
          if (!xmlStrEqual(v7, (const xmlChar *)"p") && !xmlStrEqual(v7, (const xmlChar *)"body"))
          {
            if (xmlStrEqual(v7, (const xmlChar *)"pre"))
            {
              [a3 setObject:@"Courier" forProperty:16];
              LODWORD(v9) = 13.0;
              id v10 = a3;
              uint64_t v11 = 17;
              goto LABEL_3;
            }
            if (!xmlStrEqual(v7, (const xmlChar *)"th")) {
              goto LABEL_6;
            }
            [a3 setBoolValue:1 forProperty:19];
LABEL_5:
            [a3 setIntValue:2 forProperty:86];
            goto LABEL_6;
          }
          [a3 setObject:@"Times-Roman" forProperty:16];
          LODWORD(v17) = 16.0;
          [a3 setFloatValue:87 forProperty:v17];
          LODWORD(v9) = 16.0;
LABEL_19:
          id v10 = a3;
          uint64_t v11 = 88;
          goto LABEL_3;
        }
        [a3 setObject:@"Times-Roman" forProperty:16];
LABEL_18:
        [a3 setFloatValue:87 forProperty:0.0];
        double v9 = 0.0;
        goto LABEL_19;
      }
      [a3 setObject:@"Times-Roman" forProperty:16];
      LODWORD(v15) = 10.0;
    }
    [a3 setFloatValue:17 forProperty:v15];
    [a3 setBoolValue:1 forProperty:19];
    LODWORD(v16) = 20.0;
    [a3 setFloatValue:87 forProperty:v16];
    LODWORD(v9) = 20.0;
    goto LABEL_19;
  }
  [a3 setObject:@"Times-Roman" forProperty:16];
  HIDWORD(v8) = 1076887552;
  *(float *)&double v8 = 16.0;
  [a3 setFloatValue:17 forProperty:v8];
  double v9 = 8589936700.0;
  id v10 = a3;
  uint64_t v11 = 81;
LABEL_3:
  [v10 setFloatValue:v11 forProperty:v9];
LABEL_6:
  id v12 = [a4 parentEntry];
  if (v12 && xmlStrEqual((const xmlChar *)[v12 xmlElementName], (const xmlChar *)"table"))
  {
    [a3 setFloatValue:81 forProperty:0.0];
    [a3 setFloatValue:80 forProperty:0.0];
  }
  id v13 = [a4 valueForAttribute:"align"];
  if (v13)
  {
    id v14 = v13;
    if (+[PFXUtilities elementHasTextAlign:](PFXUtilities, "elementHasTextAlign:", [a4 xmlElementName]))
    {
      [a1 mapAlignString:v14 to:a3];
    }
  }
}

@end