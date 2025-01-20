@interface THHighlightGestureController
- (AEMarginNote)trackingMarginNote;
- (BOOL)_shouldBeginImmediateHighlightForGesture:(id)a3;
- (BOOL)_shouldShowMagnifierForGesture:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handlingGesture;
- (BOOL)p_canHighlightAtPoint:(CGPoint)a3 inView:(id)a4;
- (BOOL)p_isLikelyHighlightTouchAtPoint:(CGPoint)a3 inView:(id)a4;
- (BOOL)p_shouldDragOwnInteraction:(CGPoint)a3 rep:(id)a4;
- (CGPoint)dragGestureRecognizer:(id)a3 requiredMovementForTouch:(id)a4;
- (CGPoint)p_clampPointToLine:(CGPoint)a3;
- (THInteractiveCanvasController)interactiveCanvasController;
- (THMarginNotesOwner)trackingNotesOwner;
- (THTimeoutDragGestureRecognizer)highlightGestureRecognizer;
- (THTimeoutDragGestureRecognizer)stylusHighlightGestureRecognizer;
- (THTimeoutLongPressGestureRecognizer)likelyHighlightGestureRecognizer;
- (THWPRep)trackingRep;
- (UILongPressGestureRecognizer)catalystNotesGestureRecognizer;
- (UILongPressGestureRecognizer)marginNotesGestureRecognizer;
- (id)p_marginNoteHitRep:(CGPoint)a3;
- (void)dealloc;
- (void)handleHighlightState:(int64_t)a3 atPoint:(CGPoint)a4;
- (void)p_beginMagnification:(id)a3 atPoint:(CGPoint)a4;
- (void)p_catalystNoteGesture:(id)a3;
- (void)p_highlightGesture:(id)a3;
- (void)p_likelyHighlightGesture:(id)a3;
- (void)p_marginNoteGesture:(id)a3;
- (void)p_moveLoupe:(CGPoint)a3 inRep:(id)a4;
- (void)p_stopMagnification:(id)a3;
- (void)setCatalystNotesGestureRecognizer:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlightGestureRecognizer:(id)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setLikelyHighlightGestureRecognizer:(id)a3;
- (void)setMarginNotesGestureRecognizer:(id)a3;
- (void)setStylusHighlightGestureRecognizer:(id)a3;
- (void)setTrackingMarginNote:(id)a3;
- (void)setTrackingNotesOwner:(id)a3;
- (void)setTrackingRep:(id)a3;
- (void)setUpGestureRecognizers;
@end

@implementation THHighlightGestureController

- (void)setUpGestureRecognizers
{
  if ((TSUSupportsTextInteraction() & 1) == 0)
  {
    v3 = [[THTimeoutDragGestureRecognizer alloc] initWithTarget:self action:"p_highlightGesture:"];
    [(THTimeoutDragGestureRecognizer *)v3 setMinimumPressDuration:0.0];
    [(THTimeoutDragGestureRecognizer *)v3 setMaximumPressDuration:1.60000002];
    [(THTimeoutDragGestureRecognizer *)v3 setAllowedTouchTypes:&off_4998F0];
    [(THTimeoutDragGestureRecognizer *)v3 setStylus:1];
    [(THTimeoutDragGestureRecognizer *)v3 setDelegate:self];
    [(-[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView")) addGestureRecognizer:v3];
    [(THHighlightGestureController *)self setStylusHighlightGestureRecognizer:v3];
    v4 = [[THTimeoutDragGestureRecognizer alloc] initWithTarget:self action:"p_highlightGesture:"];
    [(THTimeoutDragGestureRecognizer *)v4 setMinimumPressDuration:0.25];
    [(THTimeoutDragGestureRecognizer *)v4 setMaximumPressDuration:0.600000024];
    [(THTimeoutDragGestureRecognizer *)v4 setAllowableMovement:8.0];
    [(THTimeoutDragGestureRecognizer *)v4 setDelegate:self];
    [(-[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView")) addGestureRecognizer:v4];
    [(THHighlightGestureController *)self setHighlightGestureRecognizer:v4];
    [(THTimeoutDragGestureRecognizer *)[(THHighlightGestureController *)self highlightGestureRecognizer] requireGestureRecognizerToFail:[(THHighlightGestureController *)self stylusHighlightGestureRecognizer]];
    objc_msgSend(objc_msgSend(objc_msgSend(-[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "enclosingScrollView"), "panGestureRecognizer"), "requireGestureRecognizerToFail:", -[THHighlightGestureController stylusHighlightGestureRecognizer](self, "stylusHighlightGestureRecognizer"));
    v5 = [[THTimeoutLongPressGestureRecognizer alloc] initWithTarget:self action:"p_likelyHighlightGesture:"];
    [(THTimeoutLongPressGestureRecognizer *)v5 setAllowedTouchTypes:&off_499908];
    [(THTimeoutLongPressGestureRecognizer *)v5 setMinimumPressDuration:0.25];
    [(THTimeoutLongPressGestureRecognizer *)v5 setMaximumPressDuration:1.60000002];
    [(THTimeoutLongPressGestureRecognizer *)v5 setAllowableMovement:8.0];
    [(THTimeoutLongPressGestureRecognizer *)v5 setAllowedTouchTypes:&off_499920];
    [(THTimeoutLongPressGestureRecognizer *)v5 setDelegate:self];
    [(-[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView")) addGestureRecognizer:v5];
    [(THHighlightGestureController *)self setLikelyHighlightGestureRecognizer:v5];
    [(THTimeoutLongPressGestureRecognizer *)[(THHighlightGestureController *)self likelyHighlightGestureRecognizer] requireGestureRecognizerToFail:[(THHighlightGestureController *)self stylusHighlightGestureRecognizer]];
    [(THTimeoutDragGestureRecognizer *)v4 setDependentGestureRecognizer:v5];
    [(THTimeoutDragGestureRecognizer *)v3 setDependentGestureRecognizer:v5];
  }
  -[THHighlightGestureController setMarginNotesGestureRecognizer:](self, "setMarginNotesGestureRecognizer:", [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"p_marginNoteGesture:"]);
  [(UILongPressGestureRecognizer *)[(THHighlightGestureController *)self marginNotesGestureRecognizer] setMinimumPressDuration:0.0];
  [(UILongPressGestureRecognizer *)[(THHighlightGestureController *)self marginNotesGestureRecognizer] setDelegate:self];
  [(THTimeoutDragGestureRecognizer *)[(THHighlightGestureController *)self highlightGestureRecognizer] requireGestureRecognizerToFail:[(THHighlightGestureController *)self marginNotesGestureRecognizer]];
  [(THTimeoutDragGestureRecognizer *)[(THHighlightGestureController *)self stylusHighlightGestureRecognizer] requireGestureRecognizerToFail:[(THHighlightGestureController *)self marginNotesGestureRecognizer]];
  id v6 = [(THInteractiveCanvasController *)[(THHighlightGestureController *)self interactiveCanvasController] canvasView];
  v7 = [(THHighlightGestureController *)self marginNotesGestureRecognizer];

  [v6 addGestureRecognizer:v7];
}

- (void)dealloc
{
  [(THHighlightGestureController *)self setHighlightGestureRecognizer:0];
  [(THHighlightGestureController *)self setLikelyHighlightGestureRecognizer:0];
  [(THHighlightGestureController *)self setMarginNotesGestureRecognizer:0];
  [(THHighlightGestureController *)self setCatalystNotesGestureRecognizer:0];
  [(THHighlightGestureController *)self setInteractiveCanvasController:0];
  [(THHighlightGestureController *)self setStylusHighlightGestureRecognizer:0];
  if ([(THHighlightGestureController *)self trackingRep]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[THHighlightGestureController dealloc]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"] lineNumber:143 description:@"highlight gesture being torn down while tracking"];
  }
  if ([(THHighlightGestureController *)self trackingMarginNote]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m") lineNumber:144 description:@"highlight gesture being torn down while tracking"];
  }
  if ([(THHighlightGestureController *)self trackingNotesOwner]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m") lineNumber:145 description:@"highlight gesture being torn down while tracking"];
  }
  v3.receiver = self;
  v3.super_class = (Class)THHighlightGestureController;
  [(THHighlightGestureController *)&v3 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(THTimeoutDragGestureRecognizer *)[(THHighlightGestureController *)self highlightGestureRecognizer] setEnabled:a3];
  [(THTimeoutLongPressGestureRecognizer *)[(THHighlightGestureController *)self likelyHighlightGestureRecognizer] setEnabled:v3];
  [(UILongPressGestureRecognizer *)[(THHighlightGestureController *)self marginNotesGestureRecognizer] setEnabled:v3];
  v5 = [(THHighlightGestureController *)self catalystNotesGestureRecognizer];

  [(UILongPressGestureRecognizer *)v5 setEnabled:v3];
}

- (CGPoint)p_clampPointToLine:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(THHighlightGestureController *)self trackingRep];
  -[THWPRep convertNaturalPointFromUnscaledCanvas:]([(THHighlightGestureController *)self trackingRep], "convertNaturalPointFromUnscaledCanvas:", x, y);
  -[THWPRep pinToNaturalBounds:andLastLineFragment:](v6, "pinToNaturalBounds:andLastLineFragment:", 1);
  double v8 = v7;
  double v10 = v9;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = [(THHighlightGestureController *)self trackingRep];
  if (v11)
  {
    -[THWPRep lineMetricsAtPoint:](v11, "lineMetricsAtPoint:", v8, v10);
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    uint64_t v15 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
  }
  if (!CGRectIsEmpty(*(CGRect *)&v12))
  {
    -[THWPRep convertNaturalRectToUnscaledCanvas:]([(THHighlightGestureController *)self trackingRep], "convertNaturalRectToUnscaledCanvas:", v18, v19);
    double y = CGRectGetMidY(v21);
  }
  double v16 = x;
  double v17 = y;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (void)p_beginMagnification:(id)a3 atPoint:(CGPoint)a4
{
  -[THHighlightGestureController p_clampPointToLine:](self, "p_clampPointToLine:", a4.x, a4.y);
  -[THInteractiveCanvasController convertUnscaledToBoundsPoint:]([(THHighlightGestureController *)self interactiveCanvasController], "convertUnscaledToBoundsPoint:", v6, v7);
  self->mMagnifying = 1;
  [+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier") beginMagnifyingTarget:a3 magnificationPoint:1 offset:v8 animated:CGPointZero.x, CGPointZero.y];
  id v10 = +[TSWPHyperlinkUIController sharedHyperlinkUIController];

  [v10 endUISession];
}

- (void)p_moveLoupe:(CGPoint)a3 inRep:(id)a4
{
  -[THHighlightGestureController p_clampPointToLine:](self, "p_clampPointToLine:", a4, a3.x, a3.y);
  -[THInteractiveCanvasController convertUnscaledToBoundsPoint:]([(THHighlightGestureController *)self interactiveCanvasController], "convertUnscaledToBoundsPoint:", v5, v6);
  double v8 = v7;
  double v10 = v9;
  id v11 = +[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier];

  [v11 setMagnificationPoint:v8, v10];
}

- (void)p_stopMagnification:(id)a3
{
  if (self->mMagnifying)
  {
    if (objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier", a3), "target"))
    {
      [+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier") stopMagnifying:1];
      self->mMagnifying = 0;
    }
  }
}

- (void)handleHighlightState:(int64_t)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(THInteractiveCanvasController *)[(THHighlightGestureController *)self interactiveCanvasController] endEditing];
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:]([(THHighlightGestureController *)self interactiveCanvasController], "convertBoundsToUnscaledPoint:", x, y);
  double v10 = v8;
  double v11 = v9;
  switch(a3)
  {
    case 1:
      self->mHighlighting = 1;
      self->mLongPressGestureStartPoint.double x = v8;
      self->mLongPressGestureStartPoint.double y = v9;
      if (![(THHighlightGestureController *)self trackingRep])
      {
        objc_opt_class();
        -[THInteractiveCanvasController hitRep:]([(THHighlightGestureController *)self interactiveCanvasController], "hitRep:", v10, v11);
        [(THHighlightGestureController *)self setTrackingRep:TSUDynamicCast()];
        if (![(THHighlightGestureController *)self trackingRep]) {
          [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController handleHighlightState:atPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m") lineNumber:228 description:@"Gesture shouldn't have fired if we weren't over a text rep"];
        }
        goto LABEL_19;
      }
      break;
    case 2:
      if (!self->mTrackingHighlight)
      {
LABEL_19:
        self->BOOL mTrackingHighlight = 1;
        -[THWPHighlightController beginDragHighlightAtPoint:]([(THWPRep *)[(THHighlightGestureController *)self trackingRep] highlightController], "beginDragHighlightAtPoint:", self->mLongPressGestureStartPoint.x, self->mLongPressGestureStartPoint.y);
      }
      v20 = [(THWPRep *)[(THHighlightGestureController *)self trackingRep] highlightController];
      -[THWPHighlightController moveDragHighlightToPoint:](v20, "moveDragHighlightToPoint:", v10, v11);
      break;
    case 3:
      BOOL mTrackingHighlight = self->mTrackingHighlight;
      uint64_t v12 = [(THWPRep *)[(THHighlightGestureController *)self trackingRep] highlightController];
      double v13 = v10;
      double v14 = v11;
      if (mTrackingHighlight)
      {
        uint64_t v15 = 1;
        goto LABEL_13;
      }
      if (-[THWPHighlightController isCanvasPointOnHighlight:](v12, "isCanvasPointOnHighlight:", v10, v11))
      {
        objc_opt_class();
        [(THInteractiveCanvasController *)[(THHighlightGestureController *)self interactiveCanvasController] beginEditingRep:[(THHighlightGestureController *)self trackingRep]];
        TSUDynamicCast();
      }
      goto LABEL_14;
    case 4:
    case 5:
      [(THHighlightGestureController *)self p_stopMagnification:[(THHighlightGestureController *)self trackingRep]];
      if (self->mTrackingHighlight)
      {
        uint64_t v12 = [(THWPRep *)[(THHighlightGestureController *)self trackingRep] highlightController];
        double v13 = v10;
        double v14 = v11;
        uint64_t v15 = 0;
LABEL_13:
        -[THWPHighlightController endDragHighlightAtPoint:accept:](v12, "endDragHighlightAtPoint:accept:", v15, v13, v14);
      }
LABEL_14:
      *(_WORD *)&self->mHighlighting = 0;
      [(THHighlightGestureController *)self setTrackingRep:0];
      break;
    default:
      id v16 = +[TSUAssertionHandler currentHandler];
      double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController handleHighlightState:atPoint:]");
      long long v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"];
      [v16 handleFailureInFunction:v17 file:v18 lineNumber:285 description:@"Unexpected gesture state"];
      break;
  }
}

- (void)p_highlightGesture:(id)a3
{
  [(THInteractiveCanvasController *)[(THHighlightGestureController *)self interactiveCanvasController] endEditing];
  id v5 = [a3 state];
  [a3 locationInView:[self interactiveCanvasController].canvasView];
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:]([(THHighlightGestureController *)self interactiveCanvasController], "convertBoundsToUnscaledPoint:", v6, v7);
  double v10 = v8;
  double v11 = v9;
  switch((unint64_t)v5)
  {
    case 1uLL:
      self->mHighlighting = 1;
      self->mLongPressGestureStartPoint.double x = v8;
      self->mLongPressGestureStartPoint.double y = v9;
      if (![(THHighlightGestureController *)self trackingRep])
      {
        objc_opt_class();
        -[THInteractiveCanvasController hitRep:]([(THHighlightGestureController *)self interactiveCanvasController], "hitRep:", v10, v11);
        [(THHighlightGestureController *)self setTrackingRep:TSUDynamicCast()];
        if (![(THHighlightGestureController *)self trackingRep]) {
          [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController p_highlightGesture:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m") lineNumber:303 description:@"Gesture shouldn't have fired if we weren't over a text rep"];
        }
        if ([(THHighlightGestureController *)self _shouldShowMagnifierForGesture:a3])
        {
          -[THHighlightGestureController p_beginMagnification:atPoint:](self, "p_beginMagnification:atPoint:", [(THHighlightGestureController *)self trackingRep], v10, v11);
        }
        if ([(THHighlightGestureController *)self _shouldBeginImmediateHighlightForGesture:a3])
        {
          goto LABEL_19;
        }
      }
      break;
    case 2uLL:
      if ([(THHighlightGestureController *)self _shouldShowMagnifierForGesture:a3]) {
        -[THHighlightGestureController p_moveLoupe:inRep:](self, "p_moveLoupe:inRep:", [(THHighlightGestureController *)self trackingRep], v10, v11);
      }
      objc_opt_class();
      if ((objc_msgSend((id)TSUDynamicCast(), "hasMovedDistance:", 10.6400003, 16.0) & 1) != 0
        || [(THHighlightGestureController *)self _shouldBeginImmediateHighlightForGesture:a3])
      {
        if (!self->mTrackingHighlight)
        {
LABEL_19:
          self->BOOL mTrackingHighlight = 1;
          -[THWPHighlightController beginDragHighlightAtPoint:]([(THWPRep *)[(THHighlightGestureController *)self trackingRep] highlightController], "beginDragHighlightAtPoint:", self->mLongPressGestureStartPoint.x, self->mLongPressGestureStartPoint.y);
        }
        long long v19 = [(THWPRep *)[(THHighlightGestureController *)self trackingRep] highlightController];
        -[THWPHighlightController moveDragHighlightToPoint:](v19, "moveDragHighlightToPoint:", v10, v11);
      }
      else if (self->mTrackingHighlight)
      {
        -[THWPHighlightController endDragHighlightAtPoint:accept:]([(THWPRep *)[(THHighlightGestureController *)self trackingRep] highlightController], "endDragHighlightAtPoint:accept:", 0, v10, v11);
        self->BOOL mTrackingHighlight = 0;
      }
      break;
    case 3uLL:
      if ([(THHighlightGestureController *)self _shouldShowMagnifierForGesture:a3]) {
        [(THHighlightGestureController *)self p_stopMagnification:[(THHighlightGestureController *)self trackingRep]];
      }
      BOOL mTrackingHighlight = self->mTrackingHighlight;
      uint64_t v12 = [(THWPRep *)[(THHighlightGestureController *)self trackingRep] highlightController];
      if (mTrackingHighlight)
      {
        double v13 = v10;
        double v14 = v11;
        uint64_t v15 = 1;
        goto LABEL_27;
      }
      if (-[THWPHighlightController isCanvasPointOnHighlight:](v12, "isCanvasPointOnHighlight:", v10, v11))
      {
        objc_opt_class();
        unsigned int v21 = (objc_opt_isKindOfClass() & 1) != 0 ? [a3 isStylus] ^ 1 : 1;
        objc_opt_class();
        [(THInteractiveCanvasController *)[(THHighlightGestureController *)self interactiveCanvasController] beginEditingRep:[(THHighlightGestureController *)self trackingRep]];
        uint64_t v22 = TSUDynamicCast();
        if (v22)
        {
          if (v21)
          {
            v23 = (void *)v22;
            -[THWPRep convertNaturalPointFromUnscaledCanvas:]([(THHighlightGestureController *)self trackingRep], "convertNaturalPointFromUnscaledCanvas:", v10, v11);
            [v23 tappedInRep:[self trackingRep] point:2 tapCount:0 isTapHold:0 precise:v24 v25];
          }
        }
      }
      goto LABEL_28;
    case 4uLL:
    case 5uLL:
      [(THHighlightGestureController *)self p_stopMagnification:[(THHighlightGestureController *)self trackingRep]];
      if (self->mTrackingHighlight)
      {
        uint64_t v12 = [(THWPRep *)[(THHighlightGestureController *)self trackingRep] highlightController];
        double v13 = v10;
        double v14 = v11;
        uint64_t v15 = 0;
LABEL_27:
        -[THWPHighlightController endDragHighlightAtPoint:accept:](v12, "endDragHighlightAtPoint:accept:", v15, v13, v14);
      }
LABEL_28:
      *(_WORD *)&self->mHighlighting = 0;
      [(THHighlightGestureController *)self setTrackingRep:0];
      break;
    default:
      id v16 = +[TSUAssertionHandler currentHandler];
      double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController p_highlightGesture:]");
      long long v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"];
      [v16 handleFailureInFunction:v17 file:v18 lineNumber:391 description:@"Unexpected gesture state"];
      break;
  }
}

- (BOOL)_shouldShowMagnifierForGesture:(id)a3
{
  return [(id)TSUDynamicCast() isStylus] ^ 1;
}

- (BOOL)_shouldBeginImmediateHighlightForGesture:(id)a3
{
  objc_opt_class();
  BOOL v3 = (void *)TSUDynamicCast();

  return [v3 isStylus];
}

- (void)p_likelyHighlightGesture:(id)a3
{
  id v5 = (char *)[a3 state];
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 == (unsigned char *)&dword_0 + 1)
    {
      [a3 locationInView:[self interactiveCanvasController].canvasView];
      -[THInteractiveCanvasController convertBoundsToUnscaledPoint:]([(THHighlightGestureController *)self interactiveCanvasController], "convertBoundsToUnscaledPoint:", v6, v7);
      double v9 = v8;
      double v11 = v10;
      objc_opt_class();
      -[THInteractiveCanvasController hitRep:]([(THHighlightGestureController *)self interactiveCanvasController], "hitRep:", v9, v11);
      [(THHighlightGestureController *)self setTrackingRep:TSUDynamicCast()];
      if ([(THHighlightGestureController *)self _shouldShowMagnifierForGesture:a3]) {
        -[THHighlightGestureController p_beginMagnification:atPoint:](self, "p_beginMagnification:atPoint:", [(THHighlightGestureController *)self trackingRep], v9, v11);
      }
      mHighlightGestureRecognizer = self->mHighlightGestureRecognizer;
      [(THTimeoutLongPressGestureRecognizer *)[(THHighlightGestureController *)self likelyHighlightGestureRecognizer] maximumPressDuration];
      double v14 = v13;
      [(THTimeoutLongPressGestureRecognizer *)[(THHighlightGestureController *)self likelyHighlightGestureRecognizer] minimumPressDuration];
      double v16 = v14 - v15;
      [(THTimeoutDragGestureRecognizer *)mHighlightGestureRecognizer resetCancelTimerWithTimeout:v16];
    }
  }
  else if (!self->mHighlighting)
  {
    [(THHighlightGestureController *)self p_stopMagnification:[(THHighlightGestureController *)self trackingRep]];
    [(THHighlightGestureController *)self setTrackingRep:0];
  }
}

- (id)p_marginNoteHitRep:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(THHighlightGestureController *)self interactiveCanvasController];

  return -[THInteractiveCanvasController hitRep:withGesture:passingTest:](v5, "hitRep:withGesture:passingTest:", 0, &stru_458FA8, x, y);
}

- (void)p_marginNoteGesture:(id)a3
{
  [a3 locationInView:[self interactiveCanvasController].canvasView];
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:]([(THHighlightGestureController *)self interactiveCanvasController], "convertBoundsToUnscaledPoint:", v5, v6);
  double v8 = v7;
  double v10 = v9;
  double v11 = (char *)[a3 state];
  if ((unint64_t)(v11 - 3) < 2)
  {
    -[THMarginNotesOwner convertCanvasPointToOwnerPoint:]([(THHighlightGestureController *)self trackingNotesOwner], "convertCanvasPointToOwnerPoint:", v8, v10);
    id v19 = [(-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "marginNotesController") marginNoteAtPoint:v17, v18];
    id v20 = [v19 annotation];
    if (v20 == [(AEMarginNote *)[(THHighlightGestureController *)self trackingMarginNote] annotation])
    {
      [(THInteractiveCanvasController *)[(THHighlightGestureController *)self interactiveCanvasController] delegate];
      [TSUProtocolCast() interactiveCanvasControllerWillShowNoteEditor:[self interactiveCanvasController]];
      [(THMarginNotesOwner *)[(THHighlightGestureController *)self trackingNotesOwner] showEditorForMarginNote:v19];
    }
    [(-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "marginNotesController") unhighlightAllMarginNotes];
    [(THHighlightGestureController *)self setTrackingMarginNote:0];
    [(THHighlightGestureController *)self setTrackingNotesOwner:0];
  }
  else if (v11 == (unsigned char *)&dword_0 + 2)
  {
    -[THMarginNotesOwner convertCanvasPointToOwnerPoint:]([(THHighlightGestureController *)self trackingNotesOwner], "convertCanvasPointToOwnerPoint:", v8, v10);
    id v23 = [(-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "marginNotesController") marginNoteAtPoint:v21, v22];
    id v24 = [v23 annotation];
    id v25 = [(AEMarginNote *)[(THHighlightGestureController *)self trackingMarginNote] annotation];
    id v16 = [(THMarginNotesOwner *)[(THHighlightGestureController *)self trackingNotesOwner] marginNotesController];
    if (v24 == v25)
    {
      double v15 = (AEMarginNote *)v23;
LABEL_20:
      [v16 highlightMarginNote:v15];
      return;
    }
    [v16 unhighlightAllMarginNotes];
  }
  else
  {
    if (v11 == (unsigned char *)&dword_0 + 1)
    {
      -[THHighlightGestureController p_marginNoteHitRep:](self, "p_marginNoteHitRep:", v8, v10);
      -[THHighlightGestureController setTrackingNotesOwner:](self, "setTrackingNotesOwner:", [(id)TSUProtocolCast() marginNotesOwner]);
      if (![(THHighlightGestureController *)self trackingNotesOwner]) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController p_marginNoteGesture:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m") lineNumber:460 description:@"Gesture shouldn't have fired if we weren't over a notes owner"];
      }
      -[THMarginNotesOwner convertCanvasPointToOwnerPoint:]([(THHighlightGestureController *)self trackingNotesOwner], "convertCanvasPointToOwnerPoint:", v8, v10);
      -[THHighlightGestureController setTrackingMarginNote:[THMarginNotesOwner marginNotesController] marginNoteAtPoint:v12 v13];
      id v14 = [(THMarginNotesOwner *)[(THHighlightGestureController *)self trackingNotesOwner] marginNotesController];
      double v15 = [(THHighlightGestureController *)self trackingMarginNote];
      id v16 = v14;
      goto LABEL_20;
    }
    id v26 = +[TSUAssertionHandler currentHandler];
    v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController p_marginNoteGesture:]");
    v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"];
    [v26 handleFailureInFunction:v27 file:v28 lineNumber:492 description:@"Unexpected gesture state"];
  }
}

- (void)p_catalystNoteGesture:(id)a3
{
  [a3 locationInView:[self interactiveCanvasController].canvasView];
  double v6 = v5;
  double v8 = v7;
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:]([(THHighlightGestureController *)self interactiveCanvasController], "convertBoundsToUnscaledPoint:", v5, v7);
  double v10 = v9;
  double v12 = v11;
  objc_opt_class();
  -[THInteractiveCanvasController hitRep:]([(THHighlightGestureController *)self interactiveCanvasController], "hitRep:", v10, v12);
  double v13 = (void *)TSUDynamicCast();
  unsigned int v14 = objc_msgSend(objc_msgSend(v13, "highlightController"), "isCanvasPointOnHighlight:", v10, v12);
  id v15 = objc_msgSend(objc_msgSend(v13, "highlightController"), "annotationAtUnscaledPoint:", v10, v12);
  if (v14) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    double v17 = v15;
    double v18 = (int *)[a3 state];
    if ((unint64_t)v18 - 1 >= 2 && v18 != &dword_4)
    {
      if (v18 == (int *)((char *)&dword_0 + 3))
      {
        id v19 = [(THHighlightGestureController *)self interactiveCanvasController];
        id v20 = [v17 annotationUuid];
        -[THInteractiveCanvasController presentMenuAtCanvasPoint:forAnnotationUUID:](v19, "presentMenuAtCanvasPoint:forAnnotationUUID:", v20, v6, v8);
      }
      else
      {
        id v21 = +[TSUAssertionHandler currentHandler];
        double v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController p_catalystNoteGesture:]");
        id v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"];
        [v21 handleFailureInFunction:v22 file:v23 lineNumber:521 description:@"Unexpected gesture state"];
      }
    }
  }
}

- (BOOL)p_shouldDragOwnInteraction:(CGPoint)a3 rep:(id)a4
{
  [a4 convertNaturalPointFromUnscaledCanvas:a3.x, a3.y];

  return [a4 isPointInSelectedArea:];
}

- (BOOL)p_canHighlightAtPoint:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = [(THHighlightGestureController *)self interactiveCanvasController];
  if (![(THInteractiveCanvasController *)v8 supportsWritingHighlights]) {
    return 0;
  }
  [a4 convertPoint:x toView:[v8 canvasView]];
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](v8, "convertBoundsToUnscaledPoint:");
  double v10 = v9;
  double v12 = v11;
  objc_opt_class();
  -[THInteractiveCanvasController hitRep:]([(THHighlightGestureController *)self interactiveCanvasController], "hitRep:", v10, v12);
  uint64_t v13 = TSUDynamicCast();
  if (!v13) {
    return 0;
  }
  unsigned int v14 = (void *)v13;
  if (-[THHighlightGestureController p_shouldDragOwnInteraction:rep:](self, "p_shouldDragOwnInteraction:rep:", v13, v10, v12))
  {
    return 0;
  }
  id v16 = [v14 highlightController];

  return [v16 shouldBeginDragHighlightAtPoint:v10, v12];
}

- (BOOL)p_isLikelyHighlightTouchAtPoint:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = [(THHighlightGestureController *)self interactiveCanvasController];
  [a4 convertPoint:x, y toView:[v7 canvasView]];
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](v7, "convertBoundsToUnscaledPoint:");
  CGFloat v10 = v8;
  CGFloat v11 = v9;
  if (v7)
  {
    -[THInteractiveCanvasController wordMetricsAtPoint:](v7, "wordMetricsAtPoint:", v8, v9);
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    uint64_t v15 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    uint64_t v12 = 0;
  }
  double MinX = CGRectGetMinX(*(CGRect *)&v12);
  v20.size.height = 0.0;
  v20.origin = 0u;
  v20.size.width = 0.0;
  CGFloat Width = CGRectGetWidth(v20);
  v21.origin.double x = MinX + -10.0;
  v21.origin.double y = 0.0 - fmaxf(0.0, 10.0);
  *(float *)&CGFloat Width = Width + -15.0;
  v21.size.width = fmaxf(*(float *)&Width, 35.0) + 10.0;
  v21.size.height = fmaxf(0.0, 8.0) + 0.0 - v21.origin.y;
  v19.double x = v10;
  v19.double y = v11;
  return CGRectContainsPoint(v21, v19);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (![(THInteractiveCanvasController *)[(THHighlightGestureController *)self interactiveCanvasController] supportsReadingHighlights]|| ([(THInteractiveCanvasController *)[(THHighlightGestureController *)self interactiveCanvasController] currentlyScrolling] & 1) != 0|| ([(THInteractiveCanvasController *)[(THHighlightGestureController *)self interactiveCanvasController] currentlyWaitingOnThreadedLayoutAndRender] & 1) != 0)
  {
    return 0;
  }
  [a4 locationInView:[self interactiveCanvasController].canvasView];
  double v9 = v8;
  double v11 = v10;
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:]([(THHighlightGestureController *)self interactiveCanvasController], "convertBoundsToUnscaledPoint:", v8, v10);
  double v13 = v12;
  double v15 = v14;
  if ([(THHighlightGestureController *)self highlightGestureRecognizer] == a3)
  {
LABEL_12:
    id v16 = [(THInteractiveCanvasController *)[(THHighlightGestureController *)self interactiveCanvasController] canvasView];
    return -[THHighlightGestureController p_canHighlightAtPoint:inView:](self, "p_canHighlightAtPoint:inView:", v16, v9, v11);
  }
  if ([(THHighlightGestureController *)self stylusHighlightGestureRecognizer] == a3)
  {
    objc_opt_class();
    -[THInteractiveCanvasController hitRep:]([(THHighlightGestureController *)self interactiveCanvasController], "hitRep:", v9, v11);
    if ([TSUDynamicCast highlightController].isCanvasPointOnHighlight:v9, v11)return 0; {
    goto LABEL_12;
    }
  }
  if ([(THHighlightGestureController *)self likelyHighlightGestureRecognizer] != a3)
  {
    if ([(THHighlightGestureController *)self marginNotesGestureRecognizer] != a3)
    {
      if ([(THHighlightGestureController *)self catalystNotesGestureRecognizer] != a3) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController gestureRecognizer:shouldReceiveTouch:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m") lineNumber:631 description:@"Unexpected gesture"];
      }
      return 0;
    }
    -[THHighlightGestureController p_marginNoteHitRep:](self, "p_marginNoteHitRep:", v13, v15);
    id v17 = [(id)TSUProtocolCast() marginNotesOwner];
    [v17 convertCanvasPointToOwnerPoint:v13, v15];
    if (v17)
    {
      double v20 = v18;
      double v21 = v19;
      id v22 = [v17 marginNotesController];
      return [v22 hasMarginNoteAtPoint:v20, v21];
    }
    return 0;
  }
  if (!-[THHighlightGestureController p_canHighlightAtPoint:inView:](self, "p_canHighlightAtPoint:inView:", [(THInteractiveCanvasController *)[(THHighlightGestureController *)self interactiveCanvasController] canvasView], v9, v11))return 0; {
  [(THInteractiveCanvasController *)[(THHighlightGestureController *)self interactiveCanvasController] canvasView];
  }

  return [(THHighlightGestureController *)self p_isLikelyHighlightTouchAtPoint:v9 inView:v11];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return [(THHighlightGestureController *)self likelyHighlightGestureRecognizer] == a3|| [(THHighlightGestureController *)self stylusHighlightGestureRecognizer] == a3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return [(THHighlightGestureController *)self likelyHighlightGestureRecognizer] != a3
      || [(THTimeoutDragGestureRecognizer *)[(THHighlightGestureController *)self highlightGestureRecognizer] state] == 0;
}

- (CGPoint)dragGestureRecognizer:(id)a3 requiredMovementForTouch:(id)a4
{
  [a4 locationInView:[self interactiveCanvasController].canvasView];
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:]([(THHighlightGestureController *)self interactiveCanvasController], "convertBoundsToUnscaledPoint:", v6, v7);
  double v9 = v8;
  double v11 = v10;
  objc_opt_class();
  -[THInteractiveCanvasController hitRep:]([(THHighlightGestureController *)self interactiveCanvasController], "hitRep:", v9, v11);
  if ((objc_msgSend(objc_msgSend((id)TSUDynamicCast(), "highlightController"), "isCanvasPointOnHighlight:", v9, v11) & 1) != 0|| -[THHighlightGestureController _shouldBeginImmediateHighlightForGesture:](self, "_shouldBeginImmediateHighlightForGesture:", a3))
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  else
  {
    double y = 16.0;
    double x = 10.6400003;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  return self->mInteractiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  self->mInteractiveCanvasController = (THInteractiveCanvasController *)a3;
}

- (UILongPressGestureRecognizer)marginNotesGestureRecognizer
{
  return self->mMarginNotesGestureRecognizer;
}

- (void)setMarginNotesGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)catalystNotesGestureRecognizer
{
  return self->mCatalystNotesGestureRecognizer;
}

- (void)setCatalystNotesGestureRecognizer:(id)a3
{
}

- (THTimeoutDragGestureRecognizer)highlightGestureRecognizer
{
  return self->mHighlightGestureRecognizer;
}

- (void)setHighlightGestureRecognizer:(id)a3
{
}

- (THTimeoutLongPressGestureRecognizer)likelyHighlightGestureRecognizer
{
  return self->mLikelyHighlightGestureRecognizer;
}

- (void)setLikelyHighlightGestureRecognizer:(id)a3
{
}

- (AEMarginNote)trackingMarginNote
{
  return self->mTrackingMarginNote;
}

- (void)setTrackingMarginNote:(id)a3
{
}

- (THMarginNotesOwner)trackingNotesOwner
{
  return self->mTrackingNotesOwner;
}

- (void)setTrackingNotesOwner:(id)a3
{
}

- (THWPRep)trackingRep
{
  return self->mTrackingRep;
}

- (void)setTrackingRep:(id)a3
{
}

- (BOOL)handlingGesture
{
  return self->_handlingGesture;
}

- (THTimeoutDragGestureRecognizer)stylusHighlightGestureRecognizer
{
  return self->_stylusHighlightGestureRecognizer;
}

- (void)setStylusHighlightGestureRecognizer:(id)a3
{
}

@end