@interface TSDEditMenuTapGestureRecognizer
- (BOOL)ignoreTargetAction;
- (id)touchedRep;
- (void)reset;
- (void)setIgnoreTargetAction:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation TSDEditMenuTapGestureRecognizer

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)TSDEditMenuTapGestureRecognizer;
  [(TSDEditMenuTapGestureRecognizer *)&v3 reset];
  self->mIgnoreTargetAction = 0;

  self->mTouchedRep = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v7 = objc_msgSend((id)-[TSDEditMenuTapGestureRecognizer delegate](self, "delegate"), "interactiveCanvasController");
  if (![(TSDEditMenuTapGestureRecognizer *)self numberOfTouches]
    && [a3 count] == 1
    && ([v7 currentlyScrolling] & 1) == 0)
  {
    v8 = (void *)[a3 anyObject];
    if (v8)
    {
      v9 = v8;
      if ([v8 tapCount] == 1)
      {
        objc_msgSend(v9, "locationInView:", -[TSDEditMenuTapGestureRecognizer view](self, "view"));
        objc_msgSend(v7, "convertBoundsToUnscaledPoint:");
        double v11 = v10;
        double v13 = v12;
        id v18 = 0;
        uint64_t v14 = objc_msgSend(v7, "hitKnobAtPoint:returningRep:", &v18);
        if (v14)
        {
          if (objc_msgSend(v18, "wantsEditMenuForTapAtPoint:onKnob:", v14, v11, v13))
          {
            id v15 = v18;
            if (v18) {
              goto LABEL_12;
            }
          }
        }
        v16 = objc_msgSend((id)objc_msgSend(v7, "hitRep:", v11, v13), "repForSelecting");
        if (v16)
        {
          id v15 = v16;
          if ([v16 info])
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "layerHost"), "asiOSCVC"), "shouldSelectAndShowEditMenuOnFirstTapForRep:", v15))
            {
LABEL_12:

              self->mTouchedRep = (TSDRep *)v15;
              self->mIgnoreTargetAction = 0;
              v17.receiver = self;
              v17.super_class = (Class)TSDEditMenuTapGestureRecognizer;
              [(TSDEditMenuTapGestureRecognizer *)&v17 touchesBegan:a3 withEvent:a4];
            }
          }
        }
      }
    }
  }
  if (!self->mTouchedRep) {
    [(TSDEditMenuTapGestureRecognizer *)self setState:5];
  }
}

- (id)touchedRep
{
  return self->mTouchedRep;
}

- (BOOL)ignoreTargetAction
{
  return self->mIgnoreTargetAction;
}

- (void)setIgnoreTargetAction:(BOOL)a3
{
  self->mIgnoreTargetAction = a3;
}

@end