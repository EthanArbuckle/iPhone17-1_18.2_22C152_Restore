@interface GQHTextSpan
+ (int)handleAttachment:(id)a3 state:(id)a4;
+ (int)handleAutoNumber:(id)a3 state:(id)a4;
+ (int)handleContainerHint:(id)a3 state:(id)a4;
+ (int)handlePageStart:(id)a3 state:(id)a4;
+ (int)handleSpan:(id)a3 checkForTrailingBlanks:(BOOL)a4 state:(id)a5;
+ (int)handleTextBackgroundForStyle:(id)a3 destStyle:(id)a4 state:(id)a5;
+ (int)handleTextList:(id)a3 checkForTrailingBlanks:(BOOL)a4 state:(id)a5;
+ (int)handleTextListChild:(id)a3 outputBlanks:(BOOL)a4 state:(id)a5;
+ (int)handleTextMarker:(id)a3 outputBlanks:(BOOL)a4 state:(id)a5;
+ (int)nonWhitespaceCount:(__CFArray *)a3;
@end

@implementation GQHTextSpan

+ (int)handleSpan:(id)a3 checkForTrailingBlanks:(BOOL)a4 state:(id)a5
{
  BOOL v6 = a4;
  id v9 = [a5 htmlDoc];
  [v9 startElement:"span"];
  id v10 = [a3 characterStyle];
  id v11 = objc_msgSend(a5, "cachedClassStringForTextStyle:implicitStyle:isColoredBackground:outlineLevel:outlineType:isSpan:", v10, objc_msgSend(a5, "implicitStyle"), objc_msgSend(a5, "coloredBackground"), 0, 0, 1);
  if (!v11)
  {
    v12 = objc_alloc_init(GQHStyle);
    +[GQHTextStyle mapStyle:v10 style:v12 state:a5 isSpan:1];
    CFTypeRef cf = 0;
    +[GQHStyle createBaseStyleClassString:v10 classString:&cf classType:objc_opt_class() state:a5];
    id v13 = [a5 implicitStyle];
    id v14 = [a5 coloredBackground];
    v15 = (__CFString *)cf;
    if (!cf) {
      v15 = &stru_85630;
    }
    id v11 = [a5 addCachedClassStringForTextStyle:v10 implicitStyle:v13 isColoredBackground:v14 outlineLevel:0 outlineType:0 isSpan:1 baseClassString:v15 cssCachedStyle:v12];
    if (cf) {
      CFRelease(cf);
    }
  }
  objc_msgSend(objc_msgSend(a5, "htmlDoc"), "setAttribute:cfStringValue:", "class", v11);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a5 setCurrentSpanStyle:0 baseStyle:0 cachedClass:v11];
  }
  int v16 = [a1 handleTextList:a3 checkForTrailingBlanks:v6 state:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a5 setCurrentSpanStyle:0 baseStyle:0 cachedClass:0];
  }
  [v9 endElementWithExpectedName:"span"];
  return v16;
}

+ (int)handleTextList:(id)a3 checkForTrailingBlanks:(BOOL)a4 state:(id)a5
{
  BOOL v6 = a4;
  CFArrayRef v8 = (const __CFArray *)[a3 children];
  unsigned int Count = CFArrayGetCount(v8);
  unsigned int v10 = Count;
  if (v6) {
    unsigned int Count = +[GQHTextSpan nonWhitespaceCount:v8];
  }
  if (!v10) {
    return 1;
  }
  unint64_t v11 = 0;
  unint64_t v12 = Count;
  do
  {
    int result = objc_msgSend(a1, "handleTextListChild:outputBlanks:state:", CFArrayGetValueAtIndex(v8, v11), v11 < v12, a5);
    ++v11;
  }
  while (v11 < v10 && result == 1);
  return result;
}

+ (int)handleTextListChild:(id)a3 outputBlanks:(BOOL)a4 state:(id)a5
{
  BOOL v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [a5 inContent];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = (const xmlChar *)[a3 content];
    unsigned int v10 = v9;
    if (v9 && xmlStrstr(v9, (const xmlChar *)"  "))
    {
      id v11 = [objc_alloc((Class)NSMutableString) initWithCString:v10 encoding:4];
      id v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @" %C", 160);
      objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", @"  ", v12, 2, 0, objc_msgSend(v11, "length"));

      unsigned int v10 = (const xmlChar *)[v11 UTF8String];
    }
    else
    {
      id v11 = 0;
    }
    objc_msgSend(objc_msgSend(a5, "htmlDoc"), "addXmlCharContent:", v10);

    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return objc_msgSend(a1, "handleTextMarker:outputBlanks:state:", a3, v6);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return [a1 handleAutoNumber:a3 state:a5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        objc_msgSend(objc_msgSend(a5, "htmlDoc"), "addContent:", objc_msgSend(a3, "value"));
        return 1;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        return [a1 handlePageStart:a3 state:a5];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          return [a1 handleAttachment:a3 state:a5];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            return [a1 handleContainerHint:a3 state:a5];
          }
          else
          {
            return 3;
          }
        }
      }
    }
  }
}

+ (int)handleTextBackgroundForStyle:(id)a3 destStyle:(id)a4 state:(id)a5
{
  uint64_t v11 = 0;
  if ([a3 overridesObjectProperty:22 value:&v11])
  {
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [a5 getColorString:v11];
        [a4 addAttribute:off_9CE08 value:v7];
        float v10 = 0.0;
        if (objc_msgSend(objc_msgSend(a5, "implicitStyle"), "overridesFloatProperty:value:", 30, &v10))
        {
          *(float *)&double v8 = v10;
          if (v10 > 0.0) {
            [a4 addAttribute:off_9CF10 intValue:llroundf(v10)];
          }
        }
        if (objc_msgSend(objc_msgSend(a5, "implicitStyle", v8), "overridesFloatProperty:value:", 31, &v10)&& v10 > 0.0)
        {
          [a4 addAttribute:off_9CEF8 intValue:llroundf(v10)];
        }
      }
    }
  }
  return 1;
}

+ (int)nonWhitespaceCount:(__CFArray *)a3
{
  int Count = CFArrayGetCount(a3);
  int v5 = Count;
  if (Count >= 1)
  {
    uint64_t v6 = Count + 1;
    while (1)
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(a3, (v6 - 2));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ([ValueAtIndex isBlank] & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
      }
      --v5;
      if ((unint64_t)--v6 <= 1) {
        return 0;
      }
    }
  }
  return v5;
}

+ (int)handleTextMarker:(id)a3 outputBlanks:(BOOL)a4 state:(id)a5
{
  BOOL v5 = a4;
  id v7 = [a5 htmlDoc];
  unsigned int v8 = [a3 type];
  if (v8 - 2 < 4)
  {
    [v7 startElement:"br"];
LABEL_3:
    [v7 endElement];
    return 1;
  }
  if (v8 == 1 && v5)
  {
    [v7 startElement:"span"];
    CFStringRef v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%C %C %C %C ", 160, 160, 160, 160);
    [v7 addContent:v10];
    CFRelease(v10);
    goto LABEL_3;
  }
  return 1;
}

+ (int)handleAutoNumber:(id)a3 state:(id)a4
{
  id v6 = [a4 htmlDoc];
  if ([a3 type] == 1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [a4 isMappingHeadersFooters])
  {
    CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%d", [a4 pageNumberForHeaderOrFooter]);
    [v6 addContent:v7];
    CFRelease(v7);
  }
  else
  {
    objc_msgSend(v6, "addContent:", objc_msgSend(a3, "value"));
  }
  return 1;
}

+ (int)handlePageStart:(id)a3 state:(id)a4
{
  return 1;
}

+ (int)handleAttachment:(id)a3 state:(id)a4
{
  id v5 = [a3 drawable];
  unsigned int v6 = [a4 useOutline];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_msgSend(objc_msgSend(v5, "graphicStyle"), "valueForObjectProperty:", 72);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        LOBYTE(v6) = 0;
        if (!v5) {
          return 1;
        }
        goto LABEL_8;
      }
      id v7 = [v5 externalTextWrap];
    }
    LOBYTE(v6) = [v7 inlineWrapEnabled];
  }
  if (!v5) {
    return 1;
  }
LABEL_8:
  if (v6) {
    return 1;
  }
  return +[GQHDrawable handleInlineDrawable:v5 htmlState:a4];
}

+ (int)handleContainerHint:(id)a3 state:(id)a4
{
  if (objc_opt_isKindOfClass()) {
    [a4 handleContainerHint:a3];
  }
  return 1;
}

@end