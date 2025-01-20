@interface PFXBreak
+ (unsigned)breakCharacterFromPropertySet:(id)a3;
+ (void)addLineBreakForEntry:(id)a3;
- (BOOL)canAddColumnBreak;
- (BOOL)mapStartElementWithState:(id)a3;
@end

@implementation PFXBreak

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  v6 = (PFSPropertySet *)[v5 propertySet];
  if (PFXHtmlStyleDisplayValue(v6))
  {
    unsigned int v7 = +[PFXBreak breakCharacterFromPropertySet:v6];
    if (v7)
    {
      unsigned int v8 = v7;
      if ([(PFXBreak *)self canAddColumnBreak]) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 10;
      }
      [v5 setCurrentBreakState:v9];
      [v5 setParentBreakStateSameAsCurrent];
    }
    else
    {
      +[PFXBreak addLineBreakForEntry:v4];
    }
  }
  return 0;
}

+ (void)addLineBreakForEntry:(id)a3
{
  id v4 = [a3 htmlReaderState];
  id v5 = [v4 currentHtmlDocMediaState];
  id v6 = objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "storage");
  +[PFXCharacterRun addCharacter:8232 toStorage:v6];
  if ([v5 hasHints] && (objc_msgSend(v4, "inTable") & 1) == 0)
  {
    objc_msgSend(objc_msgSend(v4, "hintCollectorForStorage:", v6), "addLineBreakHintWithPresentationId:", @"p");
    [v5 popHint];
  }
}

+ (unsigned)breakCharacterFromPropertySet:(id)a3
{
  id v4 = [a3 valueForProperty:breakAfter];
  if (!v4 || (id v5 = [v4 lastObject]) == 0 || (v6 = v5, objc_msgSend(v5, "type") != &stru_108))
  {
LABEL_7:
    id v8 = [a3 valueForProperty:"clear"];
    if (!v8) {
      return (unsigned __int16)v8;
    }
    id v9 = [v8 lastObject];
    if (!v9
      || (v10 = v9, [v9 type] != &stru_108)
      || (objc_msgSend(objc_msgSend(v10, "value"), "isEqualToString:", @"both") & 1) == 0)
    {
      LOWORD(v8) = 0;
      return (unsigned __int16)v8;
    }
LABEL_11:
    LOWORD(v8) = 5;
    return (unsigned __int16)v8;
  }
  id v7 = [v6 value];
  if (([v7 isEqualToString:@"column"] & 1) == 0)
  {
    if ([v7 isEqualToString:@"page"]) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  LOWORD(v8) = 12;
  return (unsigned __int16)v8;
}

- (BOOL)canAddColumnBreak
{
  return 0;
}

@end