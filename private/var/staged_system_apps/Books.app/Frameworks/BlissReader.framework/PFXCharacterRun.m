@interface PFXCharacterRun
+ (BOOL)addColumnBreak:(id)a3;
+ (BOOL)addLineBreak:(id)a3;
+ (BOOL)addParagraphBreak:(id)a3;
+ (BOOL)isCharForcesLineBreak:(unsigned __int16)a3;
+ (id)trimWhitespaceInText:(id)a3 previousCharacter:(unsigned __int16)a4 elementName:(const char *)a5 forMediaState:(id)a6;
+ (void)addCharacter:(unsigned __int16)a3 toStorage:(id)a4;
+ (void)readTextFromStream:(_xmlTextReader *)a3 childIndex:(unint64_t)a4 readerState:(id)a5;
+ (void)readTextToCurrentOrientation:(id)a3 readerState:(id)a4;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXCharacterRun

+ (void)readTextFromStream:(_xmlTextReader *)a3 childIndex:(unint64_t)a4 readerState:(id)a5
{
  if ([a5 inBody]) {
    [a5 setCfiPathForTextRun:a4];
  }
  v9 = +[NSString stringWithXmlString:xmlTextReaderConstValue(a3)];
  if ([(NSString *)v9 length])
  {
    [a1 readTextToCurrentOrientation:v9 readerState:a5];
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  id v6 = [a3 currentHtmlDocMediaState];
  id v7 = [v5 storage];
  [v5 setCurrentBreakStateSameAsParent];
  [(id)objc_opt_class() startReferenceAnchorWithStackEntry:v4 readerState:a3];
  if ([v6 hasHints])
  {
    if (([a3 inTable] & 1) == 0)
    {
      id v8 = [a3 totalTextRead];
      if (v8 == [v6 nextHintLocation] && !objc_msgSend(v6, "nextHintShapeRef"))
      {
        objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", v7), "addLineBreakHintWithPresentationId:", @"p");
        [v6 popHint];
      }
    }
  }
  id v13 = 0;
  BOOL v9 = +[PFXCharacterStyle map:&v13 stackEntry:v4];
  if (v9)
  {
    [v5 setCharacterStyle:v13];
    if ([v13 definesProperty:17]) {
      id v10 = v13;
    }
    else {
      id v10 = [v7 paragraphStyleAtCharIndex:[v7 length] effectiveRange:0];
    }
    [v10 floatValueForProperty:17];
    [v5 setFontSize:v11];
  }
  else if (v13)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v13) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXCharacterRun mapStartElementWithState:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXCharacterRun.mm") lineNumber:86 description:@"Programming error. Superfluous character style."];
  }
  return v9;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  [(id)objc_opt_class() endCurrentReferenceAnchorForEntryOrientation:v4 readerState:a3];

  [v4 setParentBreakStateSameAsCurrent];
}

+ (void)addCharacter:(unsigned __int16)a3 toStorage:(id)a4
{
  UniChar chars = a3;
  if (a3)
  {
    CFStringRef v5 = CFStringCreateWithCharactersNoCopy(0, &chars, 1, kCFAllocatorNull);
    if (v5)
    {
      CFStringRef v6 = v5;
      [a4 replaceCharactersInRange:NSMakeRange([a4 length], 0) withString:v5 notifyObservers:0 undoTransaction:0];
      CFRelease(v6);
    }
  }
}

+ (BOOL)addColumnBreak:(id)a3
{
  return 1;
}

+ (BOOL)addLineBreak:(id)a3
{
  return 1;
}

+ (BOOL)addParagraphBreak:(id)a3
{
  return 1;
}

+ (BOOL)isCharForcesLineBreak:(unsigned __int16)a3
{
  BOOL result = 1;
  if (a3 > 0xAu || ((1 << a3) & 0x430) == 0) {
    return a3 == 8232;
  }
  return result;
}

+ (void)readTextToCurrentOrientation:(id)a3 readerState:(id)a4
{
  id v7 = [a4 currentHtmlStackEntry];
  id v8 = [v7 currentEntryMediaState];
  id v9 = [v8 storage];
  id v10 = [v9 length];
  if ([v9 length]) {
    id v11 = [v9 characterAtIndex:v10 - 1];
  }
  else {
    id v11 = 0;
  }
  [v9 replaceCharactersInRange:v10 withString:[a1 trimWhitespaceInText:v11 previousCharacter:v7.xmlElementName forMediaState:v8] notifyObservers:0 undoTransaction:0];
  v12 = [v9 length];
  if (((unint64_t)objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "listLevel") & 0x8000000000000000) != 0) {
    id v13 = 0;
  }
  else {
    id v13 = objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "listLevel");
  }
  [v9 setParagraphLevel:v13 forCharRange:v10 to:v12 - v10 undoTransaction:0];
  id v14 = [v8 characterStyle];

  [v9 setCharacterStyle:v14 range:v10 undoTransaction:v12 - v10];
}

+ (id)trimWhitespaceInText:(id)a3 previousCharacter:(unsigned __int16)a4 elementName:(const char *)a5 forMediaState:(id)a6
{
  uint64_t v7 = a4;
  unsigned int v10 = [a6 whitespace];
  if (xmlStrEqual((const xmlChar *)"pre", (const xmlChar *)a5)) {
    return a3;
  }
  BOOL v11 = xmlStrEqual((const xmlChar *)"code", (const xmlChar *)a5) || v10 == 1;
  if (v11 || v10 == 3) {
    return a3;
  }
  if (v10 == 4)
  {
    id v14 = +[NSCharacterSet whitespaceCharacterSet];
    char v15 = 0;
  }
  else
  {
    id v14 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    char v15 = 1;
  }
  a3 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "componentsSeparatedByCharactersInSet:", v14), "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"SELF != ''")), "componentsJoinedByString:", @" ");
  if ([a1 isCharForcesLineBreak:v7]
    && [a3 length]
    && [a3 characterAtIndex:0] == 32)
  {
    a3 = [a3 substringFromIndex:1];
  }
  if ((v15 & 1) != 0 || ![a3 length]) {
    return a3;
  }

  return [a3 stringByReplacingOccurrencesOfString:@"\n " withString:@"\n"];
}

@end