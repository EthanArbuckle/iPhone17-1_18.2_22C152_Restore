@interface PFAICharacterRun
+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 readerState:(id)a4;
+ (void)readText:(const char *)a3 readerState:(id)a4;
+ (void)readTextFromStream:(_xmlTextReader *)a3 childIndex:(unint64_t)a4 readerState:(id)a5;
+ (void)readTextRange:(_NSRange)a3 fromText:(const char *)a4 readerState:(id)a5;
+ (void)startReferenceAnchorWithStackEntry:(id)a3 readerState:(id)a4;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAICharacterRun

+ (void)readTextRange:(_NSRange)a3 fromText:(const char *)a4 readerState:(id)a5
{
  v7 = xmlStrsub((const xmlChar *)a4, a3.location, a3.length);
  id v8 = [objc_alloc((Class)NSString) initWithXmlString:v7];
  xmlFree(v7);
  [a1 readTextToCurrentOrientation:v8 readerState:a5];
}

+ (void)readText:(const char *)a3 readerState:(id)a4
{
  id v7 = [a4 currentStackEntry];
  id v8 = [a4 currentDocOrientationState];
  if (![v8 hasHints] || (objc_msgSend(a4, "inTable") & 1) != 0)
  {
    v9 = +[NSString stringWithXmlString:a3];
    [a1 readTextToCurrentOrientation:v9 readerState:a4];
    return;
  }
  id v10 = objc_msgSend(a4, "hintCollectorForStorage:", objc_msgSend(objc_msgSend(v7, "currentEntryMediaState"), "storage"));
  int v11 = xmlStrlen((const xmlChar *)a3);
  v12 = (char *)[a4 totalTextRead];
  if (!v11) {
    return;
  }
  v13 = v12;
  uint64_t v14 = 0;
  uint64_t v15 = v11;
  uint64_t v19 = v11;
  v20 = &v12[v11];
  while (objc_msgSend(v8, "hasHints", v19))
  {
    v16 = (char *)[v8 nextHintLocation];
    v17 = (char *)(v16 - v13);
    if (v16 == v13) {
      goto LABEL_13;
    }
    if ((uint64_t)v16 >= (uint64_t)v13)
    {
      v18 = v16;
      if (v16 >= v20)
      {
        [a1 readTextRange:v14 fromText:v15 readerState:a3, a4];
        return;
      }
      [a1 readTextRange:v14 fromText:v17 readerState:a3, a4];
      v14 += (uint64_t)v17;
      uint64_t v15 = v19 - v14;
      v13 = v18;
LABEL_13:
      [v10 addLineBreakHintWithPresentationId:@"p"];
    }
    [v8 popHint];
    if (!v15) {
      return;
    }
  }
  [a1 readTextRange:v14 fromText:v15 readerState:a3, a4];

  [v8 invalidateLineHints];
}

+ (void)readTextFromStream:(_xmlTextReader *)a3 childIndex:(unint64_t)a4 readerState:(id)a5
{
  id v8 = xmlTextReaderConstValue(a3);
  if (v8)
  {
    v9 = v8;
    if (xmlStrlen(v8) >= 1)
    {
      if ([a5 setFlowAsCurrent]) {
        [a1 readText:v9 readerState:a5];
      }
      if ([a5 setPaginatedAsCurrent])
      {
        if ([a5 inBody]) {
          [a5 setCfiPathForTextRun:a4];
        }
        [a1 readText:v9 readerState:a5];
      }
    }
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentStackEntry];
  if ([a3 setFlowAsCurrent])
  {
    v10.receiver = self;
    v10.super_class = (Class)PFAICharacterRun;
    id v6 = (id)[(PFXCharacterRun *)&v10 mapStartElementWithState:a3];
    objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", v6);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  if ([a3 setPaginatedAsCurrent])
  {
    v9.receiver = self;
    v9.super_class = (Class)PFAICharacterRun;
    id v7 = (id)[(PFXCharacterRun *)&v9 mapStartElementWithState:a3];
    objc_msgSend(objc_msgSend(v5, "paginatedState"), "setProcessOrientation:", v7);
    LOBYTE(v6) = v6 | v7;
  }
  [a3 setCfiPathForCurrentStorage];
  return (char)v6;
}

- (void)mapEndElementWithState:(id)a3
{
  if ([a3 setFlowAsCurrent])
  {
    v6.receiver = self;
    v6.super_class = (Class)PFAICharacterRun;
    [(PFXCharacterRun *)&v6 mapEndElementWithState:a3];
  }
  if ([a3 setPaginatedAsCurrent])
  {
    v5.receiver = self;
    v5.super_class = (Class)PFAICharacterRun;
    [(PFXCharacterRun *)&v5 mapEndElementWithState:a3];
  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 readerState:(id)a4
{
}

+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 readerState:(id)a4
{
}

@end