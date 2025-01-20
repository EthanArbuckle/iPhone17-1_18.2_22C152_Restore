@interface PFAIAnchor
+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 readerState:(id)a4;
+ (void)startReferenceAnchorWithStackEntry:(id)a3 readerState:(id)a4;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAIAnchor

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentStackEntry];
  if ([a3 setFlowAsCurrent])
  {
    v12.receiver = self;
    v12.super_class = (Class)PFAIAnchor;
    id v6 = (id)[(PFXAnchor *)&v12 mapStartElementWithState:a3];
LABEL_6:
    objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", v6);
    goto LABEL_7;
  }
  if (([a3 inFlowHeader] & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)PFAIAnchor;
    [(PFXAnchor *)&v11 mapStartElementWithState:a3];
    v10.receiver = self;
    v10.super_class = (Class)PFAIAnchor;
    [(PFXAnchor *)&v10 mapEndElementWithState:a3];
    id v6 = 0;
    goto LABEL_6;
  }
  LOBYTE(v6) = 0;
LABEL_7:
  if (([a3 setPaginatedAsCurrent] & 1) != 0
    || ([a3 inFlowHeader] & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)PFAIAnchor;
    id v7 = (id)[(PFXAnchor *)&v9 mapStartElementWithState:a3];
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
    v6.super_class = (Class)PFAIAnchor;
    [(PFXAnchor *)&v6 mapEndElementWithState:a3];
  }
  if ([a3 setPaginatedAsCurrent])
  {
    v5.receiver = self;
    v5.super_class = (Class)PFAIAnchor;
    [(PFXAnchor *)&v5 mapEndElementWithState:a3];
  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 readerState:(id)a4
{
}

+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 readerState:(id)a4
{
}

@end