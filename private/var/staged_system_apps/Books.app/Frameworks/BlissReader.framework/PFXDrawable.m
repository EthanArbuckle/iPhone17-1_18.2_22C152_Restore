@interface PFXDrawable
- (BOOL)mapStartElementWithState:(id)a3;
- (PFXDrawablePlacement)placement;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXDrawable

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXDrawable;
  [(PFXDrawable *)&v3 dealloc];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  v5 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->mPlacement = v5;
  unsigned __int8 v6 = [(PFXDrawablePlacement *)v5 mapStartElementWithState:a3];
  id v7 = [a3 currentHtmlDocMediaState];
  if ([(PFXDrawablePlacement *)self->mPlacement mode] == 2)
  {
    if ([v7 hasHints])
    {
      if (([a3 inTable] & 1) == 0)
      {
        id v8 = [v7 nextHintLocation];
        if (v8 == [a3 totalTextRead])
        {
          objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "storage")), "addLineBreakHintWithPresentationId:", @"p");
          [v7 popHint];
        }
      }
    }
  }
  return v6;
}

- (void)mapEndElementWithState:(id)a3
{
}

- (PFXDrawablePlacement)placement
{
  return self->mPlacement;
}

@end