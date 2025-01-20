@interface PFXCharacterStyle
+ (BOOL)map:(id *)a3 stackEntry:(id)a4;
+ (BOOL)mapCharacterPropertiesFrom:(id)a3 to:(id)a4;
+ (BOOL)mapProperties:(id)a3 to:(id)a4 stackEntry:(id)a5;
+ (void)mapElementPropertiesTo:(id)a3 stackEntry:(id)a4;
+ (void)mapHrefForStackEntry:(id)a3;
+ (void)mapTextShadowShorthand:(id)a3 to:(id)a4 parentFontSize:(double)a5;
@end

@implementation PFXCharacterStyle

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
      *a3 = [v7 characterStyleForStyleSelector:v8];
      objc_msgSend(objc_msgSend(a4, "currentEntryMediaState"), "setWhitespace:", objc_msgSend(v7, "whitespaceValueForStyleSelector:", v8));
      [a1 mapHrefForStackEntry:a4];
      LOBYTE(a1) = 1;
    }
    else
    {
      LOBYTE(a1) = 0;
    }
  }
  else
  {
    id v10 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "parentHtmlStackEntry"), "currentEntryMediaState"), "characterStyle");
    id v11 = objc_alloc_init((Class)TSSPropertyMap);
    a1 = [a1 mapCharacterPropertiesFrom:a4 to:v11];
    if (a1)
    {
      *a3 = v10;
      if ([v11 count])
      {
        id v12 = [a4 htmlReaderState];
        id v18 = [v7 stylesheet];
        uint64_t v13 = qword_5716E8++;
        v14 = +[NSString stringWithFormat:@"HTML Imported Character Style %ld", v13];
        v15 = +[NSString stringWithFormat:@"html-imported-character-style-%ld", v13];
        id v16 = [objc_alloc((Class)TSWPCharacterStyle) initWithContext:[v12 tspContext] name:v14 overridePropertyMap:v11 isVariation:0];
        [v18 addStyle:v16 withIdentifier:v15];
        *a3 = v16;
      }
      objc_msgSend(v7, "setWhitespaceValue:forStyleSelector:", objc_msgSend(objc_msgSend(a4, "currentEntryMediaState"), "whitespace"), v8);
      [v7 setCharacterStyle:*a3 forStyleSelector:v8];
    }
    [v7 setDisplayValue:a1 forStyleSelector:v8];
  }
  return (char)a1;
}

+ (BOOL)mapCharacterPropertiesFrom:(id)a3 to:(id)a4
{
  id v7 = (PFSPropertySet *)objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "propertySet");
  int v8 = PFXHtmlStyleDisplayValue(v7);
  if (v8)
  {
    id v9 = objc_alloc_init((Class)TSSPropertyMap);
    id v10 = [v9 copy];
    [a1 mapElementPropertiesTo:v9 stackEntry:a3];
    [a1 mapProperties:v7 to:a4 stackEntry:a3];
    if ([v9 count] || objc_msgSend(v10, "count"))
    {
      [a4 addValuesFromPropertyMap:v9];
      id v11 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "parentHtmlStackEntry"), "currentEntryMediaState"), "characterStyle");
      if (v11) {
        objc_msgSend(a4, "addValuesFromPropertyMap:", objc_msgSend(v11, "propertyMap"));
      }
      [a4 addValuesFromPropertyMap:v10];
    }
  }
  return v8;
}

+ (void)mapTextShadowShorthand:(id)a3 to:(id)a4 parentFontSize:(double)a5
{
  if (!a3) {
    return;
  }
  int v8 = (char *)[a3 count];
  if (!v8) {
    return;
  }
  id v9 = v8;
  id v10 = 0;
  unint64_t v11 = 0;
  double v12 = 0.0;
  double v13 = 0.0;
  do
  {
    +[PFSUtilities htmlValueToPointLength:parentFontSize:](PFSUtilities, "htmlValueToPointLength:parentFontSize:", [a3 objectAtIndex:v10], a5);
    double v15 = v14;
    if (v14 != -65536.0)
    {
      if (v11)
      {
        if (v11 == 1)
        {
          double v12 = v14;
        }
        else if (v11 == 2)
        {
          unint64_t v11 = 3;
          goto LABEL_15;
        }
      }
      else
      {
        double v13 = v14;
      }
      ++v11;
    }
    ++v10;
  }
  while (v9 != v10);
  double v15 = 0.0;
  if (v11 <= 1) {
    return;
  }
LABEL_15:
  double v16 = sqrt(v12 * v12 + v13 * v13);
  double v17 = 0.0;
  if (v12 != 0.0 || v13 != 0.0)
  {
    if (v12 < 0.0 || v13 < 0.0)
    {
      if (v12 < 0.0 || v13 >= 0.0) {
        goto LABEL_24;
      }
      long double v20 = asin(v12 / v16);
      double v19 = 180.0;
      double v18 = v20 * 180.0 / 3.14159265;
    }
    else
    {
      double v18 = asin(v12 / v16) * -180.0 / 3.14159265;
      double v19 = 360.0;
    }
    double v17 = v18 + v19;
  }
LABEL_24:
  if (v12 >= 0.0 || v13 < 0.0)
  {
    if (v12 < 0.0 && v13 < 0.0) {
      double v17 = asin(-v12 / v16) * 180.0 / -3.14159265 + 180.0;
    }
  }
  else
  {
    double v17 = asin(-v12 / v16) * 180.0 / 3.14159265;
  }
  double v21 = 360.0 - round(v17);
  if (v11 <= 2 || v15 < 0.0) {
    double v15 = 0.0;
  }
  id v23 = +[PFXStyleUtilities colorInArray:a3];
  if (!v23) {
    id v23 = +[TSUColor blackColor];
  }
  v24 = +[TSDShadow shadowWithAngle:offset:radius:opacity:color:enabled:](TSDShadow, "shadowWithAngle:offset:radius:opacity:color:enabled:", [v23 CGColor], 1, v21, v16, v15, 1.0);

  [a4 setObject:v24 forProperty:40];
}

+ (BOOL)mapProperties:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v9 = [a5 htmlReaderState];
  +[PFXFont mapFontProperties:a3 to:a4 stackEntry:a5];
  double v11 = v10;
  id v12 = [a3 valueForProperty:"text-decoration"];
  double v13 = v12;
  if (!v12) {
    goto LABEL_17;
  }
  if (![v12 count] || !objc_msgSend(v13, "count"))
  {
    LODWORD(v13) = 0;
    goto LABEL_17;
  }
  id v72 = v9;
  char v14 = 0;
  char v15 = 0;
  unint64_t v16 = 0;
  do
  {
    id v17 = [[v13 objectAtIndex:v16] value];
    if ([v17 isEqualToString:@"line-through"])
    {
      char v14 = 1;
      id v18 = a4;
      uint64_t v19 = 1;
      uint64_t v20 = 26;
    }
    else
    {
      if ([v17 isEqualToString:@"underline"])
      {
        char v15 = 1;
        id v18 = a4;
        uint64_t v19 = 1;
      }
      else
      {
        if (![v17 isEqualToString:@"none"]) {
          goto LABEL_13;
        }
        [a4 setIntValue:0 forProperty:26];
        id v18 = a4;
        uint64_t v19 = 0;
      }
      uint64_t v20 = 22;
    }
    [v18 setIntValue:v19 forProperty:v20];
LABEL_13:
    ++v16;
  }
  while (v16 < (unint64_t)[v13 count]);
  LODWORD(v13) = v14 & 1;
  if (v15)
  {
    id v27 = [a3 valueForProperty:PFXPropNmApplePubUnderline[0]];
    id v9 = v72;
    if (v27)
    {
      id v28 = [v27 lastObject];
      if ([v28 type] == &stru_108)
      {
        id v29 = [v28 value];
        if ([@"double" isEqualToString:v29])
        {
          uint64_t v30 = 2;
        }
        else if ([@"triple" isEqualToString:v29])
        {
          uint64_t v30 = 2;
        }
        else
        {
          uint64_t v30 = 1;
        }
      }
      else
      {
        uint64_t v30 = 1;
      }
      [a4 setIntValue:v30 forProperty:22];
    }
  }
  else
  {
    id v9 = v72;
  }
LABEL_17:
  id v21 = [a3 valueForProperty:PFXPropNmApplePubUnderlineColor[0]];
  if (v21)
  {
    id v22 = +[PFXStyleUtilities colorInArray:v21];
    if (v22) {
      [a4 setObject:v22 forProperty:24];
    }
  }
  if (v13)
  {
    id v23 = [a3 valueForProperty:PFXPropNmApplePubStrikethru[0]];
    if (v23)
    {
      id v24 = [v23 lastObject];
      if ([v24 type] == &stru_108)
      {
        id v25 = [v24 value];
        if ([@"double" isEqualToString:v25])
        {
          uint64_t v26 = 2;
        }
        else if ([@"triple" isEqualToString:v25])
        {
          uint64_t v26 = 2;
        }
        else
        {
          uint64_t v26 = 1;
        }
      }
      else
      {
        uint64_t v26 = 1;
      }
      [a4 setIntValue:v26 forProperty:26];
    }
  }
  id v31 = [a3 valueForProperty:PFXPropNmApplePubStrikethruWidth[0]];
  if (v31)
  {
    +[PFXStyleUtilities pointLengthInArray:v31 readerState:v9];
    *(float *)&double v32 = v32;
    [a4 setFloatValue:27 forProperty:v32];
  }
  id v33 = [a3 valueForProperty:PFXPropNmApplePubStrikethruColor[0]];
  if (v33)
  {
    id v34 = +[PFXStyleUtilities colorInArray:v33];
    if (v34) {
      [a4 setObject:v34 forProperty:28];
    }
  }
  id v35 = [a3 valueForProperty:"letter-spacing"];
  if (v35)
  {
    v36 = v35;
    if ([v35 count])
    {
      id v37 = [v36 lastObject];
      if (+[PFSUtilities tokenRepresentsLength:v37])
      {
        +[PFSUtilities htmlValueToPointLength:v37 parentFontSize:v11];
        if (v38 != -65536.0) {
          goto LABEL_43;
        }
      }
      else
      {
        unsigned __int8 v46 = objc_msgSend(objc_msgSend(v37, "value"), "isEqualToString:", @"normal");
        double v38 = 0.0;
        if (v46)
        {
LABEL_43:
          double v39 = v38 / v11;
          *(float *)&double v39 = v39;
          [a4 setFloatValue:35 forProperty:v39];
        }
      }
    }
  }
  id v40 = [a3 valueForProperty:"vertical-align"];
  if (v40)
  {
    v41 = v40;
    if ([v40 count])
    {
      id v42 = [v41 lastObject];
      id v43 = [v42 value];
      if ([v43 isEqualToString:@"sub"])
      {
        id v44 = a4;
        uint64_t v45 = 2;
        goto LABEL_52;
      }
      if (![v43 isEqualToString:@"super"])
      {
        if ([v43 isEqualToString:@"top"]
          || [v43 isEqualToString:@"middle"]
          || [v43 isEqualToString:@"bottom"]
          || [v43 isEqualToString:@"baseline"]
          || [v43 isEqualToString:@"text-bottom"]
          || [v43 isEqualToString:@"text-top"])
        {
          double v47 = 0.0;
        }
        else
        {
          if (!+[PFSUtilities tokenRepresentsLength:v42]) {
            goto LABEL_61;
          }
          +[PFSUtilities htmlValueToPointLength:v42 parentFontSize:v11];
          if (v47 == -65536.0) {
            goto LABEL_61;
          }
          *(float *)&double v47 = v47;
        }
        [a4 setFloatValue:33 forProperty:v47];
        goto LABEL_61;
      }
      id v44 = a4;
      uint64_t v45 = 1;
LABEL_52:
      [v44 setIntValue:v45 forProperty:36];
    }
  }
LABEL_61:
  id v48 = [a3 valueForProperty:"text-shadow"];
  if (v48)
  {
    id v49 = v48;
    if ([v48 count]) {
      [a1 mapTextShadowShorthand:v49 to:a4 parentFontSize:v11];
    }
  }
  id v50 = [a3 valueForProperty:"visibility"];
  if (v50)
  {
    if (!strcmp((const char *)[v50 lastObject].value.UTF8String), "hidden"))double v51 = 0.0; {
    else
    }
      double v51 = 1.0;
    id v52 = [a4 objectForProperty:18];
    if (!v52) {
      id v52 = +[TSUColor blackColor];
    }
    [a4 setObject:[v52 colorWithAlphaComponent:v51] forProperty:18];
  }
  id v53 = [a3 valueForProperty:"text-transform"];
  if (v53)
  {
    id v54 = [v53 lastObject];
    if ([v54 type] == &stru_108)
    {
      id v55 = [v54 value];
      if ([v55 isEqualToString:@"capitalize"])
      {
        uint64_t v56 = 3;
        goto LABEL_79;
      }
      if ([v55 isEqualToString:@"small-caps"])
      {
        uint64_t v56 = 2;
        goto LABEL_79;
      }
      if ([v55 isEqualToString:@"lowercase"])
      {
LABEL_78:
        uint64_t v56 = 0;
        goto LABEL_79;
      }
      if ([v55 isEqualToString:@"none"])
      {
        if ([a4 intValueForProperty:21] == 1) {
          goto LABEL_78;
        }
      }
      else if ([v55 isEqualToString:@"uppercase"])
      {
        uint64_t v56 = 1;
LABEL_79:
        [a4 setIntValue:v56 forProperty:21];
      }
    }
  }
  id v57 = [a3 valueForProperty:"background"];
  if (v57)
  {
    id v58 = +[PFXStyleUtilities colorInArray:v57];
    if (v58) {
      [a4 setObject:v58 forProperty:37];
    }
  }
  id v59 = [a3 valueForProperty:"font-variant"];
  if (v59)
  {
    id v60 = [v59 lastObject];
    if ([v60 type] == &stru_108)
    {
      id v61 = [v60 value];
      if ([v61 isEqualToString:@"capitalize"])
      {
        uint64_t v62 = 3;
        goto LABEL_96;
      }
      if ([v61 isEqualToString:@"small-caps"])
      {
        uint64_t v62 = 2;
        goto LABEL_96;
      }
      if ([v61 isEqualToString:@"uppercase"])
      {
        uint64_t v62 = 1;
        goto LABEL_96;
      }
      if ([v61 isEqualToString:@"lowercase"])
      {
        uint64_t v62 = 0;
LABEL_96:
        [a4 setIntValue:v62 forProperty:21];
      }
    }
  }
  id v63 = [a3 valueForProperty:"-webkit-text-fill-color"];
  if (v63
    && objc_msgSend(objc_msgSend(objc_msgSend(v63, "lastObject"), "value"), "isEqualToString:", @"transparent"))
  {
    id v64 = [a3 valueForProperty:"-webkit-text-stroke"];
    if (v64)
    {
      +[PFSUtilities htmlValueToPointLength:parentFontSize:](PFSUtilities, "htmlValueToPointLength:parentFontSize:", [v64 lastObject], v11);
      if (v65 == -65536.0) {
        double v65 = 1.0;
      }
      *(float *)&double v65 = v65;
      [a4 setFloatValue:31 forProperty:v65];
    }
    id v66 = [a3 valueForProperty:"-webkit-text-stroke-color"];
    if (v66)
    {
      id v67 = +[PFXStyleUtilities htmlPairToColor:](PFXStyleUtilities, "htmlPairToColor:", [v66 lastObject]);
      if (v67) {
        [a4 setObject:v67 forProperty:32];
      }
    }
  }
  id v68 = [a5 valueForAttribute:"lang"];
  if (v68)
  {
    id v69 = +[PFSConstants languageForString:v68];
    if (v69) {
      [a4 setObject:v69 forProperty:39];
    }
  }
  id v70 = [a5 valueForAttribute:"role"];
  if (v70) {
    [a4 setObject:v70 forProperty:47];
  }
  return 1;
}

+ (void)mapHrefForStackEntry:(id)a3
{
  id v4 = [a3 valueForAttribute:"href"];
  if (v4)
  {
    id v5 = v4;
    v6 = +[NSURL URLWithString:v4];
    if (![(NSURL *)v6 scheme]) {
      v6 = +[NSURL URLWithString:](NSURL, "URLWithString:", objc_msgSend(objc_msgSend(a3, "readerState"), "documentRelativeEntryForRelativeUri:", v5));
    }
    [a3 setHref:v6];
  }
}

+ (void)mapElementPropertiesTo:(id)a3 stackEntry:(id)a4
{
  id v7 = (const xmlChar *)[a4 xmlElementName];
  objc_msgSend(objc_msgSend(a4, "currentEntryMediaState"), "parentFontSize");
  double v9 = v8;
  if (xmlStrEqual(v7, (const xmlChar *)"abbr") || xmlStrEqual(v7, (const xmlChar *)"address")) {
    goto LABEL_3;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"a"))
  {
    [a1 mapHrefForStackEntry:a4];
    return;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"acronym")) {
    goto LABEL_3;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"b"))
  {
LABEL_13:
    id v10 = a3;
    uint64_t v11 = 19;
    goto LABEL_4;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"big")) {
    goto LABEL_15;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"cite")) {
    goto LABEL_3;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"code"))
  {
LABEL_21:
    [a3 setObject:@"Courier" forProperty:16];
    LODWORD(v12) = 13.0;
    goto LABEL_16;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"dfn")) {
    return;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"em")) {
    goto LABEL_3;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"font"))
  {
    +[PFXFont mapFontTagTo:a3 stackEntry:a4];
    return;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"i"))
  {
LABEL_3:
    id v10 = a3;
    uint64_t v11 = 20;
LABEL_4:
    [v10 setBoolValue:1 forProperty:v11];
    return;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"kbd") || xmlStrEqual(v7, (const xmlChar *)"samp")) {
    goto LABEL_21;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"small"))
  {
LABEL_15:
    double v12 = v9 * 1.20000005;
    *(float *)&double v12 = v9 * 1.20000005;
LABEL_16:
    [a3 setFloatValue:17 forProperty:v12];
    return;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"s")
    || xmlStrEqual(v7, (const xmlChar *)"strike")
    || xmlStrEqual(v7, (const xmlChar *)"del"))
  {
    id v13 = a3;
    uint64_t v14 = 1;
    uint64_t v15 = 26;
  }
  else
  {
    if (xmlStrEqual(v7, (const xmlChar *)"sub"))
    {
      id v13 = a3;
      uint64_t v14 = 2;
    }
    else
    {
      if (!xmlStrEqual(v7, (const xmlChar *)"sup"))
      {
        if (xmlStrEqual(v7, (const xmlChar *)"strong")) {
          goto LABEL_13;
        }
        if (xmlStrEqual(v7, (const xmlChar *)"tt")) {
          goto LABEL_21;
        }
        if (!xmlStrEqual(v7, (const xmlChar *)"u") && !xmlStrEqual(v7, (const xmlChar *)"ins"))
        {
          if (!xmlStrEqual(v7, (const xmlChar *)"var")) {
            return;
          }
          goto LABEL_3;
        }
        id v13 = a3;
        uint64_t v14 = 1;
        uint64_t v15 = 22;
        goto LABEL_36;
      }
      id v13 = a3;
      uint64_t v14 = 1;
    }
    uint64_t v15 = 36;
  }
LABEL_36:

  [v13 setIntValue:v14 forProperty:v15];
}

@end