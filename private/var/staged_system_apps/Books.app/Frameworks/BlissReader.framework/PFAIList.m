@interface PFAIList
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAIList

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentStackEntry];
  if ([a3 setFlowAsCurrent])
  {
    v10.receiver = self;
    v10.super_class = (Class)PFAIList;
    id v6 = (id)[(PFXList *)&v10 mapStartElementWithState:a3];
    objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", v6);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  if ([a3 setPaginatedAsCurrent])
  {
    v9.receiver = self;
    v9.super_class = (Class)PFAIList;
    id v7 = (id)[(PFXList *)&v9 mapStartElementWithState:a3];
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
    v6.super_class = (Class)PFAIList;
    [(PFXList *)&v6 mapEndElementWithState:a3];
  }
  if ([a3 setPaginatedAsCurrent])
  {
    v5.receiver = self;
    v5.super_class = (Class)PFAIList;
    [(PFXList *)&v5 mapEndElementWithState:a3];
  }
}

@end