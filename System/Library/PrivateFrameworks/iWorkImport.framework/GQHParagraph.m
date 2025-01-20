@interface GQHParagraph
+ (BOOL)retrieveFontSizeForFirstCharacter:(id)a3 fontSize:(float *)a4;
+ (BOOL)setupBulletStatesForParagraphStyle:(id)a3 paragraph:(id)a4 state:(id)a5 bulletStates:(__CFDictionary *)a6;
+ (__CFDictionary)prepareBullet:(id)a3 paragraph:(id)a4 style:(id)a5 state:(id)a6 bulletStates:(__CFDictionary *)a7 showBullet:(BOOL)a8;
+ (id)getBulletStyle:(id)a3 level:(int)a4;
+ (int)handleBookmark:(id)a3 state:(id)a4;
+ (int)handleInlineList:(id)a3 state:(id)a4;
+ (int)handleLink:(id)a3 state:(id)a4;
+ (int)handleParagraph:(id)a3 state:(id)a4 bulletStates:(__CFDictionary *)a5 isMultiColumn:(BOOL)a6;
+ (int)mapParagraphStyle:(id)a3 paragraph:(id)a4 state:(id)a5 bulletStates:(__CFDictionary *)a6 isMultiColumn:(BOOL)a7;
+ (void)mapBullet:(__CFDictionary *)a3 state:(id)a4;
@end

@implementation GQHParagraph

+ (int)handleParagraph:(id)a3 state:(id)a4 bulletStates:(__CFDictionary *)a5 isMultiColumn:(BOOL)a6
{
  BOOL v6 = a6;
  if (!CFArrayGetCount((CFArrayRef)[a3 children])) {
    return 1;
  }
  id v11 = [a4 htmlDoc];
  [v11 startElement:"p"];
  [a4 enterGraphicObject];
  id v12 = [a3 paragraphStyle];
  if (v12)
  {
    [a4 pushImplicitStyle:v12];
    id v13 = v12;
  }
  else
  {
    id v13 = [a4 implicitStyle];
  }
  unsigned int v15 = [a1 mapParagraphStyle:v13 paragraph:a3 state:a4 bulletStates:a5 isMultiColumn:v6];
  if (v15 == 1)
  {
    int v14 = [a1 handleInlineList:a3 state:a4];
    if (v12) {
      [a4 popImplicitStyle];
    }
    [a4 leaveGraphicObject];
    [v11 endElement];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a4 setCurrentParagraphStyle:0 baseStyle:0 cachedClass:0];
    }
  }
  else
  {
    int v14 = v15;
    [a4 leaveGraphicObject];
    [v11 endElement];
  }
  return v14;
}

+ (int)handleInlineList:(id)a3 state:(id)a4
{
  CFArrayRef v6 = (const __CFArray *)[a3 children];
  unsigned int Count = CFArrayGetCount(v6);
  unsigned int v8 = +[GQHTextSpan nonWhitespaceCount:v6];
  unint64_t v9 = Count;
  if (Count)
  {
    unint64_t v10 = 0;
    unint64_t v11 = v8;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v6, v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [a4 inContent];
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v13 = +[GQHTextSpan handleSpan:ValueAtIndex checkForTrailingBlanks:v10 >= v11 state:a4];
LABEL_12:
        int v14 = v13;
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v13 = [a1 handleLink:ValueAtIndex state:a4];
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v13 = [a1 handleBookmark:ValueAtIndex state:a4];
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = [a4 htmlDoc];
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v15 = [a4 htmlDoc];
        if ((isKindOfClass & 1) == 0)
        {
          int v14 = +[GQHTextSpan handleTextListChild:ValueAtIndex outputBlanks:v10 < v11 state:a4];
          goto LABEL_13;
        }
      }
      v29 = v15;
      [v15 startElement:"span"];
      if ([a4 implicitStyle]) {
        break;
      }
LABEL_46:
      int v14 = +[GQHTextSpan handleTextListChild:ValueAtIndex outputBlanks:v10 < v11 state:a4];
      [v29 endElement];
LABEL_13:
      if (++v10 >= v9 || v14 != 1) {
        return v14;
      }
    }
    int v32 = 0;
    id v17 = [a4 implicitStyle];
    v18 = objc_alloc_init(GQHStyle);
    if (![v17 hasValueForIntProperty:21 value:&v32])
    {
      if ([v17 hasValueForIntProperty:20 value:&v32])
      {
        if (v32 < 1) {
          v21 = &off_9D068;
        }
        else {
          v21 = &off_9D070;
        }
        [(GQHStyle *)v18 addAttribute:off_9CF58 value:*v21];
      }
      goto LABEL_32;
    }
    if (v32 == 2)
    {
      v19 = off_9CF58;
      v20 = &off_9D068;
    }
    else
    {
      if (v32 != 1)
      {
LABEL_32:
        id v22 = a1;
        int v30 = 0;
        int v31 = 0;
        unsigned int v23 = [v17 hasValueForIntProperty:11 value:&v31];
        unsigned int v24 = [v17 hasValueForIntProperty:7 value:&v30];
        if (v30) {
          unsigned int v25 = v24;
        }
        else {
          unsigned int v25 = 0;
        }
        if (v23 && v31)
        {
          if (v25)
          {
            CFStringRef v26 = CFStringCreateWithFormat(0, 0, @"%@ %@", off_9D018, off_9D088);
            [(GQHStyle *)v18 addAttribute:off_9CF48 value:v26];
            CFRelease(v26);
          }
          else
          {
            [(GQHStyle *)v18 addAttribute:off_9CF48 value:off_9D018];
          }
          a1 = v22;
        }
        else
        {
          a1 = v22;
          if (v25) {
            v27 = &off_9D088;
          }
          else {
            v27 = &off_9D028;
          }
          [(GQHStyle *)v18 addAttribute:off_9CF48 value:*v27];
        }
        +[GQHTextSpan handleTextBackgroundForStyle:v17 destStyle:v18 state:a4];
        [(GQHStyle *)v18 setStyleOnCurrentNode:a4];

        goto LABEL_46;
      }
      v19 = off_9CF58;
      v20 = &off_9D070;
    }
    [(GQHStyle *)v18 addAttribute:v19 value:*v20];
    +[GQHTextStyle reduceFontSizeForSuperscriptedText:v17 style:v18 state:a4];
    goto LABEL_32;
  }
  return 1;
}

+ (int)handleLink:(id)a3 state:(id)a4
{
  id v7 = [a4 htmlDoc];
  id v8 = [a3 href];
  if ([a4 shouldMapLinkWithUrl:v8]
    && (unint64_t v9 = +[GQHUtils createHtmlHrefForLinkUri:v8 state:a4]) != 0)
  {
    unint64_t v10 = v9;
    [v7 startElement:"a"];
    [v7 setAttribute:"href" cfStringValue:v10];
    CFRelease(v10);
    [v7 setAttribute:"title" cfStringValue:v8];
  }
  else
  {
    [v7 startElement:"span"];
  }
  if ([a3 characterStyle])
  {
    unint64_t v11 = objc_alloc_init(GQHStyle);
    +[GQHTextStyle mapStyle:style:state:](GQHTextStyle, "mapStyle:style:state:", [a3 characterStyle], v11, a4);
    -[GQHStyle setStyleOnCurrentNode:mappingBaseStyleClass:baseClassType:](v11, "setStyleOnCurrentNode:mappingBaseStyleClass:baseClassType:", a4, [a3 characterStyle], objc_opt_class());
  }
  int v12 = [a1 handleInlineList:a3 state:a4];
  [v7 endElement];
  return v12;
}

+ (int)handleBookmark:(id)a3 state:(id)a4
{
  id v7 = [a4 htmlDoc];
  id v8 = [a3 name];
  if (v8)
  {
    id v9 = v8;
    [v7 startElement:"a"];
    [v7 setAttribute:"name" cfStringValue:v9];
    [v7 endElement];
  }
  return [a1 handleInlineList:a3 state:a4];
}

+ (BOOL)setupBulletStatesForParagraphStyle:(id)a3 paragraph:(id)a4 state:(id)a5 bulletStates:(__CFDictionary *)a6
{
  id v9 = objc_msgSend(a3, "valueForObjectProperty:", 38, a4, a5);
  if (!v9) {
    return 0;
  }
  unint64_t v10 = v9;
  id v11 = v9;
  if ([v9 parent])
  {
    id v11 = v10;
    do
      id v11 = [v11 parent];
    while ([v11 parent]);
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(a6, v11, (const void **)&value))
  {
    value = objc_alloc_init(GQHBulletState);
    CFDictionaryAddValue(a6, v11, value);
  }
  id v12 = [a4 listLevel];
  id v13 = v12;
  BOOL v14 = 0;
  if ((v12 & 0x80000000) == 0 && dword_9CDF8 >= (int)v12)
  {
    [value setCurrentLevel:v12];
    CFArrayRef v15 = (const __CFArray *)[v10 valueForObjectProperty:55];
    if (v15)
    {
      id v16 = objc_msgSend((id)CFArrayGetValueAtIndex(v15, v13), "intValue");
      [value setBulletIndent:v16 level:v13];
    }
    CFArrayRef v17 = (const __CFArray *)[v10 valueForObjectProperty:54];
    if (v17)
    {
      id v18 = objc_msgSend((id)CFArrayGetValueAtIndex(v17, v13), "intValue");
      [value setTextIndent:v18 level:v13];
    }
    CFArrayRef v19 = (const __CFArray *)[v10 valueForObjectProperty:56];
    if (!v19) {
      goto LABEL_18;
    }
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v19, v13);
    if (!ValueAtIndex) {
      goto LABEL_18;
    }
    v21 = ValueAtIndex;
    unsigned int v22 = [ValueAtIndex type];
    switch(v22)
    {
      case 2u:
        id v23 = [v21 label];
        if (!v23) {
          goto LABEL_28;
        }
        unsigned int v24 = v23;
        if (![v23 labelType]) {
          goto LABEL_28;
        }
        CFStringRef v25 = (const __CFString *)[v24 format];
        v33.length = CFStringGetLength(v25);
        v33.location = 0;
        int v26 = CFStringFindWithOptions(v25, @"P", v33, 1uLL, 0);
        unsigned __int8 v27 = [a4 restartList];
        if ([value listStyleAtLevel:v13] == v11
          && (v27 & 1) == 0
          && [value hasNumberAtLevel:v13])
        {
          id v28 = (id)([value numberAtLevel:v13] + 1);
        }
        else
        {
          id v28 = [a3 valueForIntProperty:39];
        }
        [value setNumber:v28 level:v13];
        objc_msgSend(value, "setLabelType:level:", objc_msgSend(v24, "labelType"), v13);
        v29 = value;
        if (v26) {
          uint64_t v30 = 3;
        }
        else {
          uint64_t v30 = 2;
        }
        break;
      case 1u:
        v29 = value;
        uint64_t v30 = 4;
        break;
      case 0u:
LABEL_18:
        [value setType:0 level:v13];
        BOOL v14 = 0;
LABEL_29:
        [value setListStyle:v11 atLevel:v13];
        return v14;
      default:
LABEL_28:
        BOOL v14 = 1;
        goto LABEL_29;
    }
    [v29 setType:v30 level:v13];
    goto LABEL_28;
  }
  return v14;
}

+ (__CFDictionary)prepareBullet:(id)a3 paragraph:(id)a4 style:(id)a5 state:(id)a6 bulletStates:(__CFDictionary *)a7 showBullet:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = [a3 valueForObjectProperty:38];
  if (!v15) {
    return 0;
  }
  id v16 = v15;
  id v17 = v15;
  if ([v15 parent])
  {
    id v17 = v16;
    do
      id v17 = [v17 parent];
    while ([v17 parent]);
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(a7, v17, (const void **)&value))
  {
    value = objc_alloc_init(GQHBulletState);
    CFDictionaryAddValue(a7, v17, value);
  }
  CFArrayRef v18 = (const __CFArray *)[v16 valueForObjectProperty:56];
  if (!v18 || (ValueAtIndex = (void *)CFArrayGetValueAtIndex(v18, (int)[value currentLevel])) == 0)
  {
    [value currentLevel];
    return 0;
  }
  v20 = ValueAtIndex;
  unsigned int v21 = [ValueAtIndex type];
  id v52 = [value currentLevel];
  unsigned int v22 = 0;
  if (!v21) {
    return 0;
  }
  if (v21 == 2)
  {
    id v23 = (__CFString *)[v20 label];
    unsigned int v22 = v23;
    if (v23)
    {
      unsigned int v24 = [(__CFString *)v23 labelType];
      CFStringRef v25 = (const __CFString *)[(__CFString *)v22 format];
      CFStringRef v26 = v25;
      if (!v24)
      {
        CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, v25);
        goto LABEL_20;
      }
      v58.length = CFStringGetLength(v25);
      v58.location = 0;
      if (CFStringFindWithOptions(v26, @"P", v58, 1uLL, 0))
      {
        CFMutableStringRef MutableCopy = (CFMutableStringRef)[value createTieredNumberStringForLevel:v52];
LABEL_20:
        unsigned int v22 = MutableCopy;
        goto LABEL_22;
      }
      id v30 = [(__CFString *)v22 labelType];
      unsigned int v22 = +[GQHBulletState createLabelStr:number:](GQHBulletState, "createLabelStr:number:", v30, [value numberAtLevel:v52]);
      CFStringAppend(v22, @".");
    }
  }
LABEL_22:
  uint64_t v56 = 0;
  unsigned int v31 = [a3 overridesFloatProperty:23 value:(char *)&v56 + 4];
  unsigned int v51 = [a3 overridesFloatProperty:24 value:&v56];
  if (v8)
  {
    unsigned int v49 = v31;
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    unsigned int v32 = [value bulletIndentForLevel:v52];
    unsigned int v50 = [value textIndentForLevel:v52];
    v55 = 0;
    if ([a5 getAttribute:off_9CEF0 trblValue:&v55])
    {
      CFRange v33 = v55;
      v34 = v55;
    }
    else
    {
      v34 = objc_alloc_init(GQHTrbl);
      v55 = v34;
    }
    [(GQHTrbl *)v34 setLeft:(int)(float)(*(float *)&v56 + (float)(int)(v50 + v32))];
    [a5 addAttribute:off_9CEF0 trblValue:v55];

    id v35 = [a1 getBulletStyle:v16 level:v52];
    if (v35) {
      id v36 = v35;
    }
    else {
      id v36 = a3;
    }
    v37 = objc_alloc_init(GQHStyle);
    +[GQHTextStyle mapStyle:v36 style:v37 state:a6];
    id v54 = 0;
    if ([v16 overridesObjectProperty:57 value:&v54]
      && objc_msgSend(objc_msgSend(v54, "objectAtIndex:", (int)v52), "scaleWithText"))
    {
      float v53 = 0.0;
      if (!+[GQHParagraph retrieveFontSizeForFirstCharacter:fontSize:](GQHParagraph, "retrieveFontSizeForFirstCharacter:fontSize:", a4, &v53))[a3 hasValueForFloatProperty:2 value:&v53]; {
      float v38 = v53;
      }
      if (v53 != 0.0)
      {
        unsigned int v39 = [a6 textScale];
        float v38 = v53;
        if (v39)
        {
          float v38 = floorf((float)(v53 * (float)[a6 textScale]) / 100.0);
          float v53 = v38;
        }
      }
      v40 = off_9CE78;
      objc_msgSend(objc_msgSend(v54, "objectAtIndex:", (int)v52), "scale");
      [(GQHStyle *)v37 addAttribute:v40 intValue:(int)(float)(v38 * v41)];
    }
    [(GQHStyle *)v37 addAttribute:off_9CF38 intValue:0];
    [(GQHStyle *)v37 addAttribute:off_9CF18 value:off_9D040];
    [(GQHStyle *)v37 addAttribute:off_9CEA0 pxValue:llroundf((float)-v50)];
    [(GQHStyle *)v37 addAttribute:off_9CF48 value:off_9D028];
    [(GQHStyle *)v37 addAttribute:off_9CE60 value:off_9D000];
    [(GQHStyle *)v37 addAttribute:off_9CEA8 value:@"1.0"];
    CFDictionarySetValue(Mutable, @"BulletStyle", v37);

    unsigned int v31 = v49;
    if (!v22)
    {
      unsigned int v42 = v51;
      if ([value typeAtlevel:v52] == 4)
      {
        int v46 = xmlStrlen((const xmlChar *)"&bull;");
        CFDataRef v47 = CFDataCreate(0, (const UInt8 *)"&bull;", v46);
        CFDictionarySetValue(Mutable, @"BulletCharRef", v47);
        CFDataRef v48 = v47;
        unsigned int v31 = v49;
        CFRelease(v48);
      }
      goto LABEL_41;
    }
    CFDictionarySetValue(Mutable, @"BulletString", v22);
  }
  else
  {
    Mutable = 0;
  }
  unsigned int v42 = v51;
LABEL_41:
  if (v22) {
    CFRelease(v22);
  }
  if (((v31 | v42) & 1) != 0 || [a6 outlineLevel])
  {
    v43 = off_9CF38;
    int v44 = llroundf(*((float *)&v56 + 1) - *(float *)&v56);
    unsigned int v45 = [a6 outlineLevel];
    [a5 addAttribute:v43 pxValue:v44 + dword_9D2A8 * v45];
  }
  return Mutable;
}

+ (void)mapBullet:(__CFDictionary *)a3 state:(id)a4
{
  Value = (void *)CFDictionaryGetValue(a3, @"BulletStyle");
  CFDataRef v7 = (const __CFData *)CFDictionaryGetValue(a3, @"BulletCharRef");
  BOOL v8 = CFDictionaryGetValue(a3, @"BulletString");
  if (Value)
  {
    id v9 = v8;
    id v10 = [a4 htmlDoc];
    [v10 startElement:"span"];
    [Value setStyleOnCurrentNode:a4];
    if (v9)
    {
      [v10 addContent:v9];
    }
    else if (v7)
    {
      [v10 addCharRef:CFDataGetBytePtr(v7)];
    }
    [v10 endElement];
  }
}

+ (id)getBulletStyle:(id)a3 level:(int)a4
{
  v5 = 0;
  [a3 overridesObjectProperty:(a4 + 58) value:&v5];
  return v5;
}

+ (BOOL)retrieveFontSizeForFirstCharacter:(id)a3 fontSize:(float *)a4
{
  CFArrayRef v5 = (const __CFArray *)[a3 children];
  if (CFArrayGetCount(v5) < 1) {
    return 0;
  }
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(v5, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = [ValueAtIndex characterStyle];
    return [v7 hasValueForFloatProperty:2 value:a4];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return +[GQHParagraph retrieveFontSizeForFirstCharacter:ValueAtIndex fontSize:a4];
}

+ (int)mapParagraphStyle:(id)a3 paragraph:(id)a4 state:(id)a5 bulletStates:(__CFDictionary *)a6 isMultiColumn:(BOOL)a7
{
  BOOL v7 = a7;
  int v13 = 0;
  float v32 = 0.0;
  if ((objc_msgSend(a1, "setupBulletStatesForParagraphStyle:paragraph:state:bulletStates:") & 1) == 0)
  {
    if (![a3 hasValueForFloatProperty:30 value:&v32]
      || (*(float *)&double v14 = v32, v32 == 0.0))
    {
      unsigned int v15 = objc_msgSend(a3, "hasValueForFloatProperty:value:", 31, &v32, v14) ^ 1;
      if (v32 == 0.0) {
        int v13 = 1;
      }
      else {
        int v13 = v15;
      }
    }
    else
    {
      int v13 = 0;
    }
  }
  unsigned int v30 = 0;
  unsigned int v31 = 0;
  unsigned int v16 = [a3 overridesIntProperty:17 value:&v31];
  unsigned int v17 = [a3 overridesIntProperty:18 value:&v30];
  if (v16) {
    [a5 setOutlineLevel:v31];
  }
  if (v17) {
    [a5 setOutlineStyleType:v30];
  }
  if ([a5 useOutline])
  {
    unsigned int v31 = [a5 outlineLevel];
    unsigned int v30 = [a5 outlineStyleType];
    if (v30 == 1) {
      ++v31;
    }
  }
  if (v13)
  {
    id v18 = [a5 implicitStyle];
    id v19 = [a5 coloredBackground];
    id v20 = [a5 cachedClassStringForTextStyle:a3 implicitStyle:v18 isColoredBackground:v19 outlineLevel:v31 outlineType:v30 isSpan:0];
    if (v20) {
      goto LABEL_34;
    }
  }
  unsigned int v21 = objc_alloc_init(GQHStyle);
  +[GQHParagraphStyle mapStyle:a3 style:v21 state:a5];
  int v29 = 0;
  if ([a3 hasValueForFloatProperty:30 value:&v29]
    && ![a5 paragraphIndex])
  {
    [(GQHStyle *)v21 addAttribute:off_9CED0 intValue:0];
  }
  if ([a3 hasValueForFloatProperty:31 value:&v29])
  {
    unsigned int v22 = [a5 paragraphIndex];
    if (v22 == [a5 paragraphCount] - 1) {
      [(GQHStyle *)v21 addAttribute:off_9CEB8 intValue:0];
    }
  }
  id v23 = objc_msgSend(a1, "prepareBullet:paragraph:style:state:bulletStates:showBullet:", a3, a4, v21, a5, a6, (objc_msgSend(a4, "isBlank") | v7) ^ 1);
  if (v13)
  {
    CFTypeRef cf = 0;
    +[GQHStyle createBaseStyleClassString:a3 classString:&cf classType:objc_opt_class() state:a5];
    id v24 = [a5 implicitStyle];
    id v25 = [a5 coloredBackground];
    CFStringRef v26 = (__CFString *)cf;
    if (!cf) {
      CFStringRef v26 = &stru_85630;
    }
    id v20 = [a5 addCachedClassStringForTextStyle:a3 implicitStyle:v24 isColoredBackground:v25 outlineLevel:v31 outlineType:v30 isSpan:0 baseClassString:v26 cssCachedStyle:v21];
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    [(GQHStyle *)v21 setStyleOnCurrentNode:a5 mappingBaseStyleClass:a3 baseClassType:objc_opt_class()];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a5 setCurrentParagraphStyle:v21 baseStyle:a3 cachedClass:0];
    }
    id v20 = 0;
  }
  if (v23)
  {
    [a1 mapBullet:v23 state:a5];
    CFRelease(v23);
  }

  if (v13)
  {
LABEL_34:
    objc_msgSend(objc_msgSend(a5, "htmlDoc"), "setAttribute:cfStringValue:", "class", v20);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a5 setCurrentParagraphStyle:0 baseStyle:0 cachedClass:v20];
    }
  }
  return 1;
}

@end