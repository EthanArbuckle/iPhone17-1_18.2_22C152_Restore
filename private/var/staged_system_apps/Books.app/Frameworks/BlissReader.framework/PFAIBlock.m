@interface PFAIBlock
- (BOOL)canAddColumnBreak:(id)a3;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementUsingCurrentLayoutWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAIBlock

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentStackEntry];
  if ([a3 setFlowAsCurrent])
  {
    v11.receiver = self;
    v11.super_class = (Class)PFAIBlock;
    id v6 = (id)[(PFXBlock *)&v11 mapStartElementWithState:a3];
    objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", v6);
    if (([a3 setPaginatedAsCurrent] & 1) == 0)
    {
      if (v6)
      {
        char isKindOfClass = 1;
        goto LABEL_12;
      }
      goto LABEL_9;
    }
  }
  else
  {
    if (![a3 setPaginatedAsCurrent])
    {
LABEL_9:
      [v5 nonDelegatedReader];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(objc_msgSend(v5, "parentEntry"), "nonDelegatedReader");
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
      else
      {
        char isKindOfClass = 0;
      }
      goto LABEL_12;
    }
    LOBYTE(v6) = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)PFAIBlock;
  id v8 = (id)[(PFXBlock *)&v10 mapStartElementWithState:a3];
  objc_msgSend(objc_msgSend(v5, "paginatedState"), "setProcessOrientation:", v8);
  char isKindOfClass = 1;
  if ((v6 & 1) == 0 && (v8 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_12:
  [a3 setCfiPathForCurrentStorage];
  return isKindOfClass & 1;
}

- (void)mapEndElementUsingCurrentLayoutWithState:(id)a3
{
  id v5 = [a3 currentStackEntry];
  id v6 = [v5 currentEntryOrientationState];
  id v7 = [a3 currentDocOrientationState];
  if ([v7 hasHints])
  {
    if (([a3 inTable] & 1) == 0)
    {
      id v8 = [a3 totalTextRead];
      if (v8 == [v7 nextHintLocation])
      {
        if ([v7 inList])
        {
          id v9 = [a3 totalTextRead];
          BOOL v10 = v9 == [v7 nextHintLocation] && [v7 nextHintShapeRef] == 0;
        }
        else
        {
          BOOL v10 = 1;
        }
        if (!xmlStrEqual((const xmlChar *)"div", (const xmlChar *)[v5 xmlElementName])
          && v10
          && [v7 hasHints])
        {
          do
          {
            if ([v7 nextHintShapeRef]) {
              break;
            }
            id v11 = [a3 totalTextRead];
            if (v11 != [v7 nextHintLocation]) {
              break;
            }
            objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(v6, "storage")), "addLineBreakHintWithPresentationId:", @"p");
            [v7 popHint];
          }
          while (([v7 hasHints] & 1) != 0);
        }
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PFAIBlock;
  [(PFXBlock *)&v12 mapEndElementWithState:a3];
}

- (void)mapEndElementWithState:(id)a3
{
  if ([a3 setFlowAsCurrent]) {
    [(PFAIBlock *)self mapEndElementUsingCurrentLayoutWithState:a3];
  }
  if ([a3 setPaginatedAsCurrent])
  {
    [(PFAIBlock *)self mapEndElementUsingCurrentLayoutWithState:a3];
  }
}

- (BOOL)canAddColumnBreak:(id)a3
{
  return [a3 paginatedIsCurrent];
}

@end