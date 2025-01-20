@interface TSAHyperlinkGestureRecognizer
- (BOOL)tapEnabled;
- (BOOL)tapHoldEnabled;
- (BOOL)wasTapHold;
- (TSAHyperlinkGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (TSDInteractiveCanvasController)icc;
- (TSWPHyperlinkField)hitField;
- (TSWPHyperlinkHostRepProtocol)hitRep;
- (id)p_smartFieldForTouch:(id)a3 outRep:(id *)a4;
- (void)dealloc;
- (void)p_delayElapsed:(id)a3;
- (void)reset;
- (void)setEnabled:(BOOL)a3;
- (void)setHitField:(id)a3;
- (void)setHitRep:(id)a3;
- (void)setIcc:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTapEnabled:(BOOL)a3;
- (void)setTapHoldEnabled:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TSAHyperlinkGestureRecognizer

- (TSAHyperlinkGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSAHyperlinkGestureRecognizer;
  result = [(TSAHyperlinkGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
  if (result)
  {
    result->_tapEnabled = 1;
    result->_tapHoldEnabled = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSAHyperlinkGestureRecognizer;
  [(TSAHyperlinkGestureRecognizer *)&v3 dealloc];
}

- (void)reset
{
  if ([(TSAHyperlinkGestureRecognizer *)self state] != 3)
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
    objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "endUISession");
  }
  [(TSAHyperlinkGestureRecognizer *)self setHitRep:0];
  [(TSAHyperlinkGestureRecognizer *)self setHitField:0];
  v3.receiver = self;
  v3.super_class = (Class)TSAHyperlinkGestureRecognizer;
  [(TSAHyperlinkGestureRecognizer *)&v3 reset];
}

- (void)setEnabled:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSAHyperlinkGestureRecognizer;
  [(TSAHyperlinkGestureRecognizer *)&v3 setEnabled:a3];
}

- (void)setState:(int64_t)a3
{
  if (a3 == 5)
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
    if ([(TSAHyperlinkGestureRecognizer *)self hitRep]) {
      objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "endUISession");
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)TSAHyperlinkGestureRecognizer;
  [(TSAHyperlinkGestureRecognizer *)&v5 setState:a3];
}

- (id)p_smartFieldForTouch:(id)a3 outRep:(id *)a4
{
  [(TSDInteractiveCanvasController *)self->_icc layoutIfNeeded];
  icc = self->_icc;
  objc_msgSend(a3, "locationInView:", -[TSAHyperlinkGestureRecognizer view](self, "view"));
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](icc, "convertBoundsToUnscaledPoint:");
  double v9 = v8;
  double v11 = v10;
  id result = -[TSDInteractiveCanvasController hitRep:](self->_icc, "hitRep:");
  if (result)
  {
    objc_msgSend(result, "convertNaturalPointFromUnscaledCanvas:", v9, v11);
    double v14 = v13;
    double v16 = v15;
    objc_opt_class();
    -[TSDInteractiveCanvasController hitRep:](self->_icc, "hitRep:", v9, v11);
    id result = (id)TSUDynamicCast();
    if (result)
    {
      id v17 = result;
      id result = (id)objc_msgSend(result, "smartFieldAtPoint:", v14, v16);
      if (a4)
      {
        if (result) {
          *a4 = v17;
        }
      }
    }
  }
  return result;
}

- (void)p_delayElapsed:(id)a3
{
  self->_wasTapHold = 1;
  [(TSAHyperlinkGestureRecognizer *)self setState:3];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)TSAHyperlinkGestureRecognizer;
  [(TSAHyperlinkGestureRecognizer *)&v12 touchesBegan:a3 withEvent:a4];
  self->_wasTapHold = 0;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  if (!*(_WORD *)&self->_tapEnabled
    || [(TSDInteractiveCanvasController *)self->_icc currentlyScrolling])
  {
    goto LABEL_3;
  }
  if (![(TSAHyperlinkGestureRecognizer *)self state])
  {
    if ([(TSAHyperlinkGestureRecognizer *)self numberOfTouches] != 1) {
      goto LABEL_3;
    }
    v6 = (void *)[a3 anyObject];
    objc_msgSend(v6, "locationInView:", -[TSAHyperlinkGestureRecognizer view](self, "view"));
    self->_touchBeginPoint.x = v7;
    self->_touchBeginPoint.y = v8;
    uint64_t v11 = 0;
    objc_opt_class();
    [(TSAHyperlinkGestureRecognizer *)self p_smartFieldForTouch:v6 outRep:&v11];
    uint64_t v9 = TSUDynamicCast();
    if (!v9)
    {
LABEL_3:
      [(TSAHyperlinkGestureRecognizer *)self setState:5];
      return;
    }
    uint64_t v10 = v9;
    [(TSAHyperlinkGestureRecognizer *)self setHitRep:v11];
    [(TSAHyperlinkGestureRecognizer *)self setHitField:v10];
    objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "startUISessionForHyperlinkField:inRep:", self->_hitField, self->_hitRep);
    objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "showHyperlinkHighlight");
    if (self->_tapHoldEnabled) {
      [(TSAHyperlinkGestureRecognizer *)self performSelector:sel_p_delayElapsed_ withObject:v6 afterDelay:1.0];
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TSAHyperlinkGestureRecognizer;
  [(TSAHyperlinkGestureRecognizer *)&v10 touchesMoved:a3 withEvent:a4];
  v6 = (void *)[a3 anyObject];
  double v7 = 14.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(TSWPHyperlinkHostRepProtocol *)self->_hitRep isEditing])
  {
    double v7 = 0.0;
  }
  objc_msgSend(v6, "locationInView:", -[TSAHyperlinkGestureRecognizer view](self, "view"));
  if (TSDDistance(self->_touchBeginPoint.x, self->_touchBeginPoint.y, v8, v9) > v7
    || [(TSAHyperlinkGestureRecognizer *)self p_smartFieldForTouch:v6 outRep:0] != self->_hitField)
  {
    [(TSAHyperlinkGestureRecognizer *)self setState:5];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSAHyperlinkGestureRecognizer;
  [(TSAHyperlinkGestureRecognizer *)&v6 touchesEnded:a3 withEvent:a4];
  if (!self->_wasTapHold)
  {
    if (self->_tapEnabled)
    {
      [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
      objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "endUISession");
      uint64_t v5 = 3;
    }
    else
    {
      if (!self->_tapHoldEnabled) {
        return;
      }
      uint64_t v5 = 5;
    }
    [(TSAHyperlinkGestureRecognizer *)self setState:v5];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(TSAHyperlinkGestureRecognizer *)self state] != 3)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSAHyperlinkGestureRecognizer;
    [(TSAHyperlinkGestureRecognizer *)&v7 touchesCancelled:a3 withEvent:a4];
    [(TSAHyperlinkGestureRecognizer *)self setState:5];
    objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "hideHyperlinkHighlight");
  }
}

- (BOOL)tapEnabled
{
  return self->_tapEnabled;
}

- (void)setTapEnabled:(BOOL)a3
{
  self->_tapEnabled = a3;
}

- (BOOL)tapHoldEnabled
{
  return self->_tapHoldEnabled;
}

- (void)setTapHoldEnabled:(BOOL)a3
{
  self->_tapHoldEnabled = a3;
}

- (BOOL)wasTapHold
{
  return self->_wasTapHold;
}

- (TSDInteractiveCanvasController)icc
{
  return self->_icc;
}

- (void)setIcc:(id)a3
{
  self->_icc = (TSDInteractiveCanvasController *)a3;
}

- (TSWPHyperlinkHostRepProtocol)hitRep
{
  return self->_hitRep;
}

- (void)setHitRep:(id)a3
{
}

- (TSWPHyperlinkField)hitField
{
  return self->_hitField;
}

- (void)setHitField:(id)a3
{
}

@end