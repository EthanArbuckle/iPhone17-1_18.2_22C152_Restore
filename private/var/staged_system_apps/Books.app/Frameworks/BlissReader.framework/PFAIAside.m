@interface PFAIAside
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAIAside

- (BOOL)mapStartElementWithState:(id)a3
{
  if ([a3 setPaginatedAsCurrent])
  {
    v6.receiver = self;
    v6.super_class = (Class)PFAIAside;
    [(PFXAside *)&v6 mapStartElementWithState:a3];
  }
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentStackEntry"), "flowState"), "setProcessOrientation:", 0);
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  if ([a3 setPaginatedAsCurrent])
  {
    v5.receiver = self;
    v5.super_class = (Class)PFAIAside;
    [(PFXAside *)&v5 mapEndElementWithState:a3];
  }
}

@end