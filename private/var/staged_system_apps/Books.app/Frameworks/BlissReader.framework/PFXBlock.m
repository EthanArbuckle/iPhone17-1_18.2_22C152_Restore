@interface PFXBlock
+ (BOOL)isEntryInline:(id)a3;
+ (void)addBreakIfApplicableToEntry:(id)a3 newBreakState:(unsigned __int16)a4 hintCollector:(id)a5;
+ (void)mapLayoutStyleFromPropertySet:(id)a3 toPropertyMap:(id)a4 readerState:(id)a5;
- (BOOL)canAddColumnBreak:(id)a3;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXBlock

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  id v7 = [a3 currentHtmlDocMediaState];
  id v18 = 0;
  BOOL v8 = +[PFXParagraphStyle map:&v18 stackEntry:v5];
  if (v8)
  {
    if (xmlStrEqual((const xmlChar *)[v5 xmlElementName], (const xmlChar *)"li")
      && [v7 inList])
    {
      [v7 setListStart:((char *)[v7 listStart]) + 1];
    }
    [v6 setCurrentBreakStateSameAsParent];
    id v9 = [v6 storage];
    id v10 = objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(v6, "storage"));
    unsigned int v11 = +[PFXBreak breakCharacterFromPropertySet:](PFXBreak, "breakCharacterFromPropertySet:", [v6 propertySet]);
    uint64_t v12 = 10;
    if (v11)
    {
      unsigned int v13 = v11;
      if (v11 != 10)
      {
        if (-[PFXBlock canAddColumnBreak:](self, "canAddColumnBreak:", a3, 10)) {
          uint64_t v12 = v13;
        }
        else {
          uint64_t v12 = 10;
        }
      }
    }
    +[PFXBlock addBreakIfApplicableToEntry:v5 newBreakState:v12 hintCollector:v10];
    id v14 = [v9 length];
    [v9 stylesheet];
    [v18 stylesheet];
    [v9 setParagraphStyle:v18 forCharRange:v14];
    if (((unint64_t)[v7 listLevel] & 0x8000000000000000) != 0) {
      id v15 = 0;
    }
    else {
      id v15 = [v7 listLevel];
    }
    [v9 setParagraphLevel:v15 forCharRange:v14 undoTransaction:0];
    [v6 setStartCharIndex:v14];
    [v6 setParagraphStyle:v18];
    [v18 floatValueForProperty:17];
    [v6 setFontSize:v16];
    if (![v6 listStyle])
    {
      if ([v7 inList]) {
        +[PFXList mapBulletWithOrientationState:v6 readerState:a3];
      }
      else {
        +[PFXList mapNonListStyleWithOrientationState:v6 readerState:a3];
      }
    }
    if ([v6 listStyle])
    {
      [v9 setListStyle:[v6 listStyle] forCharRange:v14 undoTransaction:0];
      if ([v7 inList]) {
        [v9 setListStart:[v7 listStart] forCharRange:v14 undoTransaction:0];
      }
    }
    else
    {
      objc_msgSend(v9, "setListStyle:forCharRange:undoTransaction:", objc_msgSend(objc_msgSend(v6, "stylesheet"), "defaultListStyle"), v14, 0, 0);
    }
  }
  return v8;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  id v6 = [a3 drawableReaderForCurrentMediaStateWithStackEntry:[v4 parentHtmlStackEntry]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    +[PFXBlock mapLayoutStyleFromPropertySet:toPropertyMap:readerState:](PFXBlock, "mapLayoutStyleFromPropertySet:toPropertyMap:readerState:", [v5 propertySet], [v6 textBlockPropertyMap], a3);
  }

  [v5 setParentBreakStateSameAsCurrent];
}

+ (BOOL)isEntryInline:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "propertySet"), "valueForProperty:", "display");
  if (!v3) {
    return 0;
  }
  id v4 = [v3 lastObject];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  if ([v4 type] != &stru_108) {
    return 0;
  }
  id v6 = [v5 value];

  return [v6 isEqualToString:@"inline"];
}

+ (void)addBreakIfApplicableToEntry:(id)a3 newBreakState:(unsigned __int16)a4 hintCollector:(id)a5
{
  uint64_t v6 = a4;
  id v9 = [a3 currentEntryMediaState];
  unsigned __int8 v10 = [a1 isEntryInline:a3];
  id v11 = [v9 currentBreakState];
  if (v11)
  {
    if ((v10 & 1) == 0)
    {
      +[PFXCharacterRun addCharacter:toStorage:](PFXCharacterRun, "addCharacter:toStorage:", v11, [v9 storage]);
      if ((objc_msgSend(objc_msgSend(a3, "htmlReaderState"), "inTable") & 1) == 0) {
        [a5 updateLastLineBreakHint];
      }
    }
  }

  [v9 setCurrentBreakState:v6];
}

+ (void)mapLayoutStyleFromPropertySet:(id)a3 toPropertyMap:(id)a4 readerState:(id)a5
{
  id v8 = +[PFXColumnStyle createColumnsWithPropertySet:a3 readerState:a5];
  [a4 setObject:v8 forProperty:148];

  id v9 = +[PFXColumnStyle createPaddingWithPropertySet:a3 readerState:a5];
  [a4 setObject:v9 forProperty:146];

  uint64_t v10 = +[PFXColumnStyle mapVerticalAlignmentWithPropertySet:a3];

  [a4 setIntValue:v10 forProperty:149];
}

- (BOOL)canAddColumnBreak:(id)a3
{
  return 0;
}

@end