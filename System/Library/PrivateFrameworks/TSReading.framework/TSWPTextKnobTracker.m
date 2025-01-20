@interface TSWPTextKnobTracker
+ (const)p_lineFragmentForCharIndex:(unint64_t)a3 knobTag:(unint64_t)a4 selectionType:(int)a5 rep:(id)a6;
- (BOOL)didShowMagnifier;
- (BOOL)fixupWordSelection;
- (BOOL)ignoreNextCall;
- (BOOL)p_isMagnifyingVerticalText;
- (BOOL)p_newHeadCharIndex:(unint64_t)a3 isPastTailCharIndex:(unint64_t)a4 rep:(id)a5;
- (BOOL)p_newTailCharIndex:(unint64_t)a3 isPastHeadCharIndex:(unint64_t)a4 rep:(id)a5;
- (BOOL)shouldHideOtherKnobs;
- (TSWPEditingController)editingController;
- (TSWPTextKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (_NSRange)adjustSelectionRange:(_NSRange)a3 forStorage:(id)a4;
- (double)delay;
- (double)unscaledStartAutoscrollThreshold;
- (id)icc;
- (id)p_rangedMagnifier;
- (unint64_t)p_charIndexForKnob:(unint64_t)a3 selection:(id)a4;
- (void)autoscrollWillNotStart;
- (void)dealloc;
- (void)endMovingKnob;
- (void)moveKnobToCanvasPosition:(CGPoint)a3;
- (void)p_cleanupWhenDone;
- (void)p_fixUpWordSelection;
- (void)p_magnifyWithTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6 delayed:(BOOL)a7;
- (void)p_setSelectionFromPoint:(CGPoint)a3;
- (void)p_startMagnifying;
- (void)p_stopMagnifyingWithAnimation:(BOOL)a3;
- (void)setEditingController:(id)a3;
- (void)setIgnoreNextCall:(BOOL)a3;
- (void)updateAfterAutoscroll:(id)a3;
- (void)updateAfterAutoscroll:(id)a3 atPoint:(CGPoint)a4;
@end

@implementation TSWPTextKnobTracker

- (TSWPTextKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)TSWPTextKnobTracker;
  v5 = -[TSDKnobTracker initWithRep:knob:](&v31, sel_initWithRep_knob_, a3);
  if (v5)
  {
    objc_opt_class();
    [(TSDEditorController *)[(TSDInteractiveCanvasController *)[(TSDRep *)[(TSDKnobTracker *)v5 rep] interactiveCanvasController] editorController] textInputEditor];
    [(TSWPTextKnobTracker *)v5 setEditingController:TSUDynamicCast()];
    [(TSWPEditingController *)[(TSWPTextKnobTracker *)v5 editingController] setKnobTracking:1];
    [(TSWPEditingController *)[(TSWPTextKnobTracker *)v5 editingController] setKnobTag:[[(TSDKnobTracker *)v5 knob] tag]];
    v6 = [(TSDKnobTracker *)v5 rep];
    [a4 position];
    -[TSDRep convertNaturalPointToUnscaledCanvas:](v6, "convertNaturalPointToUnscaledCanvas:");
    -[TSWPEditingController setKnobTrackingDragPoint:]([(TSWPTextKnobTracker *)v5 editingController], "setKnobTrackingDragPoint:", v7, v8);
    v5->_multiTap = [(TSWPEditingController *)[(TSWPTextKnobTracker *)v5 editingController] knobTrackingTapCount] > 1;
    v9 = [(TSWPEditingController *)[(TSWPTextKnobTracker *)v5 editingController] selection];
    v5->_rangeAtStart.location = [(TSWPSelection *)v9 range];
    v5->_rangeAtStart.length = v10;
    if ([(TSWPSelection *)v9 type] != 7)
    {
      v9 = [(TSWPEditingController *)[(TSWPTextKnobTracker *)v5 editingController] logicalToVisualSelection:v9];
      [(TSWPEditingController *)[(TSWPTextKnobTracker *)v5 editingController] setSelection:v9];
    }
    v5->_selectionType = [(TSWPSelection *)v9 type];
    id v11 = [(TSWPEditingController *)[(TSWPTextKnobTracker *)v5 editingController] calculateVisualRunsFromSelection:v9 updateControllerSelection:1];
    unint64_t v12 = [v11 headChar];
    unint64_t v13 = [v11 tailChar];
    if (v13 >= v12) {
      unint64_t v14 = v12;
    }
    else {
      unint64_t v14 = v13;
    }
    unint64_t v15 = [v11 headChar];
    unint64_t v16 = [v11 tailChar];
    if (v15 <= v16) {
      unint64_t v17 = v16;
    }
    else {
      unint64_t v17 = v15;
    }
    if (v14 <= v17 + 1) {
      unint64_t v18 = v17 + 1;
    }
    else {
      unint64_t v18 = v14;
    }
    if (v14 >= v17 + 1) {
      NSUInteger v19 = v17 + 1;
    }
    else {
      NSUInteger v19 = v14;
    }
    v5->_rangeAtStart.location = v19;
    v5->_rangeAtStart.length = v18 - v19;
    v5->_headCharAtStart = [v11 headChar];
    v5->_tailCharAtStart = [v11 tailChar];
    [(TSDRep *)[(TSDKnobTracker *)v5 rep] invalidateHUDState];
    BOOL v20 = [(TSWPEditingController *)[(TSWPTextKnobTracker *)v5 editingController] isParagraphModeWithSelection:v11 onStorage:[(TSWPEditingController *)[(TSWPTextKnobTracker *)v5 editingController] storage]];
    if (v20)
    {
      v21 = [(TSDKnobTracker *)v5 rep];
      if ([[(TSDKnobTracker *)v5 knob] tag] == 10) {
        uint64_t v22 = [v11 start];
      }
      else {
        uint64_t v22 = [v11 end];
      }
      v23 = (void *)[(TSDRep *)v21 repForCharIndex:v22 isStart:[[(TSDKnobTracker *)v5 knob] tag] == 11];
      if ([(TSDKnobTracker *)v5 rep] != v23) {
        [v23 invalidateKnobs];
      }
      [(TSDRep *)[(TSDKnobTracker *)v5 rep] invalidateKnobs];
      [(TSDKnobTracker *)v5 setKnob:[(TSDRep *)[(TSDKnobTracker *)v5 rep] knobForTag:[[(TSDKnobTracker *)v5 knob] tag]]];
    }
    if ([(TSWPEditingController *)[(TSWPTextKnobTracker *)v5 editingController] interactiveCanvasController])
    {
      uint64_t v24 = [(TSDKnobTracker *)v5 rep];
      if (a4) {
        BOOL v25 = v24 == 0;
      }
      else {
        BOOL v25 = 1;
      }
      char v26 = v25 || v20;
      if ((v26 & 1) == 0)
      {
        uint64_t v27 = [(TSDKnobTracker *)v5 rep];
        v28 = [(TSWPEditingController *)[(TSWPTextKnobTracker *)v5 editingController] interactiveCanvasController];
        v29 = [(TSDKnobTracker *)v5 rep];
        [a4 position];
        -[TSDRep convertNaturalPointToUnscaledCanvas:](v29, "convertNaturalPointToUnscaledCanvas:");
        -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v28, "convertUnscaledToBoundsPoint:");
        -[TSWPTextKnobTracker p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:](v5, "p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:", v27, 1, 1);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  if (self->_textMagnifierTimer)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPTextKnobTracker dealloc]"];
    [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextKnobTracker.mm"), 126, @"_textMagnifierTimer retains us, so it should be gone by our -dealloc" file lineNumber description];
  }
  [(TSWPTextKnobTracker *)self p_cleanupWhenDone];
  [(TSWPTextKnobTracker *)self p_stopMagnifyingWithAnimation:0];

  self->_editingController = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSWPTextKnobTracker;
  [(TSDKnobTracker *)&v5 dealloc];
}

- (double)delay
{
  return 0.1;
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  if (self->_ignoreNextCall)
  {
    self->_ignoreNextCall = 0;
  }
  else
  {
    double y = a3.y;
    double x = a3.x;
    self->_knobMoved = 1;
    -[TSWPTextKnobTracker p_setSelectionFromPoint:](self, "p_setSelectionFromPoint:");
    -[TSWPEditingController setKnobTrackingDragPoint:]([(TSWPTextKnobTracker *)self editingController], "setKnobTrackingDragPoint:", x, y);
    v6 = [(TSDKnobTracker *)self rep];
    [(TSDRep *)v6 invalidateKnobPositions];
  }
}

- (void)endMovingKnob
{
  if (self->_knobMoved)
  {
    [(TSWPTextKnobTracker *)self p_fixUpWordSelection];
    [(TSWPTextKnobTracker *)self p_stopMagnifyingWithAnimation:0];
  }
  [(TSWPTextKnobTracker *)self p_cleanupWhenDone];
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextKnobTracker;
  [(TSDKnobTracker *)&v3 endMovingKnob];
}

- (void)p_cleanupWhenDone
{
  if (!self->_doneTracking)
  {
    self->_doneTracking = 1;
    [(TSWPEditingController *)[(TSWPTextKnobTracker *)self editingController] setKnobTracking:0];
    objc_super v3 = [(TSDKnobTracker *)self rep];
    [(TSDRep *)v3 invalidateKnobs];
    [(TSDRep *)v3 invalidateKnobPositions];
    [(TSDRep *)v3 invalidateHUDState];
  }
}

- (BOOL)p_isMagnifyingVerticalText
{
  objc_super v3 = [(TSWPEditingController *)[(TSWPTextKnobTracker *)self editingController] selection];
  unint64_t v4 = [[(TSDKnobTracker *)self knob] tag];
  objc_super v5 = +[TSWPTextKnobTracker p_lineFragmentForCharIndex:[(TSWPTextKnobTracker *)self p_charIndexForKnob:v4 selection:v3] knobTag:v4 selectionType:self->_selectionType rep:[(TSDKnobTracker *)self rep]];
  if (v5) {
    LODWORD(v5) = (v5[25] >> 5) & 1;
  }
  return (char)v5;
}

+ (const)p_lineFragmentForCharIndex:(unint64_t)a3 knobTag:(unint64_t)a4 selectionType:(int)a5 rep:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = objc_msgSend(a6, "columns", 0);
  result = (const void *)[v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    id v11 = result;
    uint64_t v12 = *(void *)v15;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v15 != v12) {
        objc_enumerationMutation(v9);
      }
      result = (const void *)[*(id *)(*((void *)&v14 + 1) + 8 * v13) lineFragmentForCharIndex:a3 knobTag:a4 selectionType:v6];
      if (result) {
        break;
      }
      if (v11 == (const void *)++v13)
      {
        result = (const void *)[v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        id v11 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (id)p_rangedMagnifier
{
  BOOL v2 = [(TSWPTextKnobTracker *)self p_isMagnifyingVerticalText];
  objc_super v3 = off_2646AEE20;
  if (!v2) {
    objc_super v3 = off_2646AEE08;
  }
  unint64_t v4 = *v3;

  return (id)[(__objc2_class *)v4 sharedRangedMagnifier];
}

- (void)p_startMagnifying
{
  textMagnifierTimer = self->_textMagnifierTimer;
  if (!textMagnifierTimer)
  {
    unint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPTextKnobTracker p_startMagnifying]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextKnobTracker.mm"), 261, @"invalid nil value for '%s'", "_textMagnifierTimer");
    textMagnifierTimer = self->_textMagnifierTimer;
  }
  id v6 = [(NSTimer *)textMagnifierTimer userInfo];
  double v7 = [(TSWPTextKnobTracker *)self p_rangedMagnifier];
  self->_magnifier = v7;
  uint64_t v8 = [v6 target];
  [v6 magnificationPoint];
  double v10 = v9;
  double v12 = v11;
  [v6 offset];
  -[TSWPTextMagnifierRanged beginMagnifyingTarget:magnificationPoint:offset:animated:](v7, "beginMagnifyingTarget:magnificationPoint:offset:animated:", v8, [v6 animated], v10, v12, v13, v14);
  self->_didShowMagnifier = 1;

  self->_textMagnifierTimer = 0;
}

- (void)p_magnifyWithTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6 delayed:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double y = a5.y;
  double x = a5.x;
  double v11 = a4.y;
  double v12 = a4.x;
  textMagnifierTimer = self->_textMagnifierTimer;
  if (textMagnifierTimer)
  {
    [(NSTimer *)textMagnifierTimer invalidate];

    self->_textMagnifierTimer = 0;
  }
  if (v7)
  {
    BOOL v20 = objc_alloc_init(TSWPBeginMagnificationUserInfo);
    [(TSWPBeginMagnificationUserInfo *)v20 setTarget:a3];
    -[TSWPBeginMagnificationUserInfo setMagnificationPoint:](v20, "setMagnificationPoint:", v12, v11);
    -[TSWPBeginMagnificationUserInfo setOffset:](v20, "setOffset:", x, y);
    [(TSWPBeginMagnificationUserInfo *)v20 setAnimated:v8];
    self->_textMagnifierTimer = (NSTimer *)(id)[MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel_p_startMagnifying selector:v20 userInfo:0 repeats:0.25];
    long long v16 = (void *)[MEMORY[0x263EFF9F0] currentRunLoop];
    [v16 addTimer:self->_textMagnifierTimer forMode:*MEMORY[0x263EFF478]];
  }
  else
  {
    magnifier = self->_magnifier;
    if (magnifier)
    {
      [(TSWPTextMagnifierRanged *)magnifier setTarget:a3];
      -[TSWPTextMagnifierRanged setMagnificationPoint:](self->_magnifier, "setMagnificationPoint:", v12, v11);
      unint64_t v18 = self->_magnifier;
      -[TSWPTextMagnifierRanged setOffset:](v18, "setOffset:", x, y);
    }
    else
    {
      uint64_t v19 = [(TSWPTextKnobTracker *)self p_rangedMagnifier];
      self->_magnifier = v19;
      -[TSWPTextMagnifierRanged beginMagnifyingTarget:magnificationPoint:offset:animated:](v19, "beginMagnifyingTarget:magnificationPoint:offset:animated:", a3, v8, v12, v11, x, y);
      self->_didShowMagnifier = 1;
    }
  }
}

- (void)p_stopMagnifyingWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  textMagnifierTimer = self->_textMagnifierTimer;
  if (textMagnifierTimer)
  {
    [(NSTimer *)textMagnifierTimer invalidate];

    self->_textMagnifierTimer = 0;
  }
  magnifier = self->_magnifier;
  if (magnifier)
  {
    [(TSWPTextMagnifierRanged *)magnifier stopMagnifying:v3];
    self->_magnifier = 0;
  }
}

- (void)p_setSelectionFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(TSWPTextKnobTracker *)self editingController];
  BOOL v7 = [(TSWPEditingController *)v6 storage];
  id v8 = -[TSWPInteractiveCanvasController closestRepToPoint:forStorage:]([(TSWPEditingController *)v6 interactiveCanvasController], "closestRepToPoint:forStorage:", v7, x, y);
  if (v8)
  {
    double v9 = v8;
    objc_msgSend(v8, "convertNaturalPointFromUnscaledCanvas:", x, y);
    double v11 = v10;
    double v13 = v12;
    int v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "columns"), "objectAtIndexedSubscript:", 0), "textIsVertical");
    BOOL v15 = [(TSWPEditingController *)self->_editingController isInParagraphMode];
    BOOL v16 = v15;
    if (!self->_multiTap && !v15)
    {
      objc_msgSend(v9, "knobOffsetForKnob:paragraphMode:", -[TSDKnobTracker knob](self, "knob"), 0);
      double v18 = v17;
      unint64_t v19 = [[(TSDKnobTracker *)self knob] tag];
      double v20 = -1.0;
      if (v19 == 11) {
        double v21 = 1.0;
      }
      else {
        double v21 = -1.0;
      }
      if (v19 != 11) {
        double v20 = 1.0;
      }
      double v22 = v11 + v18 + v20;
      if (v14) {
        double v11 = v22;
      }
      else {
        double v13 = v13 - v18 + v21;
      }
    }
    int v101 = v14;
    v23 = [(TSWPEditingController *)v6 selection];
    [(TSWPSelection *)v23 range];
    unint64_t v24 = [[(TSDKnobTracker *)self knob] tag];
    unint64_t v25 = objc_msgSend(v9, "charIndexForPointWithPinning:isTail:selectionType:", v24 == 10, -[TSWPSelection type](v23, "type"), v11, v13);
    if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger tailCharAtStart = v25;
      if (self->_multiTap)
      {
        if (v24 == 11)
        {
          if ([(TSWPTextKnobTracker *)self p_newHeadCharIndex:v25 isPastTailCharIndex:self->_tailCharAtStart rep:v9])
          {
            uint64_t v27 = 10;
          }
          else
          {
            uint64_t v27 = 11;
          }
          goto LABEL_26;
        }
        if (v24 == 10)
        {
          if ([(TSWPTextKnobTracker *)self p_newTailCharIndex:v25 isPastHeadCharIndex:self->_headCharAtStart rep:v9])
          {
            uint64_t v27 = 11;
          }
          else
          {
            uint64_t v27 = 10;
          }
LABEL_26:
          if (v24 == v27)
          {
            uint64_t v102 = v24;
          }
          else
          {
            [(TSWPEditingController *)v6 setKnobTag:v27];
            [(TSDRep *)[(TSDKnobTracker *)self rep] invalidateKnobs];
            [v9 invalidateKnobs];
            uint64_t v32 = [v9 knobForTag:v27];
            if (v32) {
              [(TSDKnobTracker *)self setKnob:v32];
            }
            uint64_t v102 = v27;
          }
          goto LABEL_31;
        }
        uint64_t v102 = v24;
        p_rangeAtStart = &self->_rangeAtStart;
        NSUInteger location = self->_rangeAtStart.location;
LABEL_37:
        v100 = p_rangeAtStart;
        p_NSUInteger length = &p_rangeAtStart->length;
        NSUInteger v30 = p_rangeAtStart->length + location;
        goto LABEL_38;
      }
      uint64_t v102 = v24;
      if (self->_selectionType) {
        goto LABEL_31;
      }
      p_rangeAtStart = &self->_rangeAtStart;
      NSUInteger location = self->_rangeAtStart.location;
      if (v24 == 11)
      {
        NSUInteger v30 = self->_rangeAtStart.length + location;
        if (v25 < v30)
        {
          v100 = &self->_rangeAtStart;
          BOOL v31 = -[TSWPTextKnobTracker p_newHeadCharIndex:isPastTailCharIndex:rep:](self, "p_newHeadCharIndex:isPastTailCharIndex:rep:", v25, self->_tailCharAtStart, v9, &self->_rangeAtStart.length);
LABEL_33:
          BOOL v33 = v31;
          if (v31)
          {
            if (self->_selectionType == 7) {
              NSUInteger tailCharAtStart = self->_tailCharAtStart;
            }
            else {
              NSUInteger tailCharAtStart = [(TSWPStorage *)v7 previousCharacterIndex:v30];
            }
          }
          if (self->_selectionType == 7)
          {
            unint64_t v43 = self->_tailCharAtStart;
            if (tailCharAtStart >= v43) {
              unint64_t v44 = self->_tailCharAtStart;
            }
            else {
              unint64_t v44 = tailCharAtStart;
            }
            if (tailCharAtStart <= v43) {
              unint64_t v45 = self->_tailCharAtStart;
            }
            else {
              unint64_t v45 = tailCharAtStart;
            }
            unint64_t v46 = [(TSWPStorage *)v7 nextCharacterIndex:v45];
            if (v44 <= v46) {
              unint64_t v47 = v46;
            }
            else {
              unint64_t v47 = v44;
            }
            if (v44 >= v46) {
              NSUInteger tailCharAtStart = v46;
            }
            else {
              NSUInteger tailCharAtStart = v44;
            }
            NSUInteger length = v47 - tailCharAtStart;
          }
          else
          {
            NSUInteger length = v30 - tailCharAtStart;
          }
          uint64_t v39 = 1;
          uint64_t v102 = 11;
          goto LABEL_74;
        }
        uint64_t v54 = [(TSWPStorage *)[(TSWPEditingController *)v6 storage] previousCharacterIndex:self->_rangeAtStart.length + p_rangeAtStart->location];
      }
      else
      {
        if (v24 != 10 || v25 > location) {
          goto LABEL_37;
        }
        uint64_t v54 = [(TSWPStorage *)[(TSWPEditingController *)v6 storage] nextCharacterIndex:p_rangeAtStart->location];
      }
      if (v54 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v56 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", v54, 0);
        [(TSDRep *)[(TSDKnobTracker *)self rep] knobCenterForSelection:v56 knob:[(TSDKnobTracker *)self knob]];
        double v58 = v57;
        double v60 = v59;

        if (v58 != *MEMORY[0x263F001A0] || v60 != *(double *)(MEMORY[0x263F001A0] + 8))
        {
          objc_msgSend(v9, "knobOffsetForKnob:paragraphMode:", -[TSDKnobTracker knob](self, "knob"), v16);
          double v62 = v61;
          unint64_t v63 = [[(TSDKnobTracker *)self knob] tag];
          double v64 = -1.0;
          if (v63 == 11) {
            double v65 = 1.0;
          }
          else {
            double v65 = -1.0;
          }
          if (v63 != 11) {
            double v64 = 1.0;
          }
          double v66 = v58 + v62 + v64;
          if (v101) {
            double v11 = v66;
          }
          else {
            double v13 = v60 - v62 + v65;
          }
          uint64_t v67 = objc_msgSend(v9, "charIndexForPointWithPinning:", v11, v13);
          if (v67 != 0x7FFFFFFFFFFFFFFFLL) {
            NSUInteger tailCharAtStart = v67;
          }
        }
      }
LABEL_31:
      v100 = &self->_rangeAtStart;
      p_NSUInteger length = &self->_rangeAtStart.length;
      NSUInteger v30 = self->_rangeAtStart.length + self->_rangeAtStart.location;
      if (v102 == 11)
      {
        BOOL v31 = -[TSWPTextKnobTracker p_newHeadCharIndex:isPastTailCharIndex:rep:](self, "p_newHeadCharIndex:isPastTailCharIndex:rep:", tailCharAtStart, self->_tailCharAtStart, v9, p_length);
        goto LABEL_33;
      }
LABEL_38:
      BOOL v34 = -[TSWPTextKnobTracker p_newTailCharIndex:isPastHeadCharIndex:rep:](self, "p_newTailCharIndex:isPastHeadCharIndex:rep:", tailCharAtStart, self->_headCharAtStart, v9, p_length);
      BOOL v33 = v34;
      if (v34)
      {
        if (self->_selectionType == 7) {
          NSUInteger tailCharAtStart = self->_headCharAtStart;
        }
        else {
          NSUInteger tailCharAtStart = [(TSWPStorage *)v7 nextCharacterIndex:v100->location];
        }
      }
      if (self->_selectionType == 7)
      {
        unint64_t headCharAtStart = self->_headCharAtStart;
        if (headCharAtStart >= tailCharAtStart) {
          unint64_t v36 = tailCharAtStart;
        }
        else {
          unint64_t v36 = self->_headCharAtStart;
        }
        if (headCharAtStart <= tailCharAtStart) {
          unint64_t v37 = tailCharAtStart;
        }
        else {
          unint64_t v37 = self->_headCharAtStart;
        }
        unint64_t v38 = [(TSWPStorage *)v7 nextCharacterIndex:v37];
        uint64_t v39 = 0;
        if (v36 <= v38) {
          unint64_t v40 = v38;
        }
        else {
          unint64_t v40 = v36;
        }
        if (v36 >= v38) {
          NSUInteger tailCharAtStart = v38;
        }
        else {
          NSUInteger tailCharAtStart = v36;
        }
        NSUInteger length = v40 - tailCharAtStart;
      }
      else
      {
        uint64_t v39 = 0;
        NSUInteger v42 = tailCharAtStart - v30;
        NSUInteger tailCharAtStart = v100->location;
        NSUInteger length = v42 + v100->length;
      }
LABEL_74:
      if (![(TSWPEditingController *)v6 isParagraphModeWithSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", tailCharAtStart, length) onStorage:v7])
      {
LABEL_121:
        if (self->_multiTap)
        {
          v105.NSUInteger location = v100->location;
          v105.NSUInteger length = *v98;
          v104.NSUInteger location = tailCharAtStart;
          v104.NSUInteger length = length;
          NSRange v72 = NSUnionRange(v104, v105);
          NSUInteger tailCharAtStart = v72.location;
          NSUInteger length = v72.length;
        }
        -[TSWPTextKnobTracker adjustSelectionRange:forStorage:](self, "adjustSelectionRange:forStorage:", tailCharAtStart, length, v7);
        [(TSWPStorage *)v7 selectionRangeForCharIndex:[(TSWPSelection *)v23 range]];
        uint64_t v73 = NSIntersectionRangeInclusive();
        uint64_t v75 = v74;
        if ([(TSWPSelection *)v23 range] != v73 || v76 != v75)
        {
          v77 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 7, v73, v75, 0, 0);
          if (v102 == 10) {
            uint64_t v78 = 33616;
          }
          else {
            uint64_t v78 = 848;
          }
          [(TSWPEditingController *)v6 setSelection:v77 withFlags:v78];
          [(TSWPEditingController *)v6 calculateVisualRunsFromSelection:[(TSWPEditingController *)v6 selection] updateControllerSelection:1];
          v79 = [(TSWPEditingController *)v6 selection];

          if (v39) {
            uint64_t v80 = [(TSWPSelection *)v79 start];
          }
          else {
            uint64_t v80 = [(TSWPSelection *)v79 end];
          }
          v81 = (TSDRep *)[v9 repForCharIndex:v80 isStart:v39];
          if (v81)
          {
            v82 = v81;
            if ([(TSDKnobTracker *)self rep] != v81)
            {
              [(TSWPEditingController *)v6 setKnobTag:v102];
              [(TSDRep *)[(TSDKnobTracker *)self rep] invalidateKnobs];
              [(TSDRep *)v82 invalidateKnobs];
              [(TSDKnobTracker *)self setRep:v82];
              [(TSDKnobTracker *)self setKnob:[(TSDRep *)[(TSDKnobTracker *)self rep] knobForTag:v102]];
            }
          }
          [(TSDRep *)[(TSDKnobTracker *)self rep] knobCenterForSelection:v79 knob:[(TSDKnobTracker *)self knob]];
          -[TSDKnob setPosition:]([(TSDKnobTracker *)self knob], "setPosition:", v83, v84);
          [[(TSDKnobTracker *)self knob] position];
          BOOL v87 = v86 == *(double *)(MEMORY[0x263F001A0] + 8) && v85 == *MEMORY[0x263F001A0];
          if ([(TSWPEditingController *)self->_editingController isInParagraphMode] || v87)
          {
            [(TSWPTextKnobTracker *)self p_stopMagnifyingWithAnimation:1];
          }
          else if ([(TSWPEditingController *)v6 interactiveCanvasController] {
                 && [(TSDKnobTracker *)self rep]
          }
                 && [(TSDKnobTracker *)self knob])
          {
            v88 = [(TSWPEditingController *)v6 interactiveCanvasController];
            v89 = [(TSDKnobTracker *)self rep];
            [[(TSDKnobTracker *)self knob] position];
            -[TSDRep convertNaturalPointToUnscaledCanvas:](v89, "convertNaturalPointToUnscaledCanvas:");
            -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v88, "convertUnscaledToBoundsPoint:");
            double v91 = v90;
            double v93 = v92;
            v94 = [(TSDKnobTracker *)self rep];
            double v95 = *MEMORY[0x263F00148];
            double v96 = *(double *)(MEMORY[0x263F00148] + 8);
            BOOL v97 = self->_textMagnifierTimer == 0;
            -[TSWPTextKnobTracker p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:](self, "p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:", v94, v97, 0, v91, v93, v95, v96);
          }
        }
        return;
      }
      if (v33) {
        goto LABEL_120;
      }
      uint64_t v48 = objc_msgSend(+[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", objc_msgSend(v9, "columns"), 0, 1, v11, v13), "lineFragmentClosestToPoint:knobTag:", 5, v11, v13);
      if (!v48) {
        goto LABEL_120;
      }
      v49 = (NSUInteger *)v48;
      CGFloat v51 = *(double *)(v48 + 48);
      CGFloat v50 = *(double *)(v48 + 56);
      CGFloat v53 = *(double *)(v48 + 64);
      CGFloat v52 = *(double *)(v48 + 72);
      if (v39)
      {
        if (v101)
        {
          if (v11 <= CGRectGetMinX(*(CGRect *)(v48 + 48)))
          {
            if (v102 != 10) {
              goto LABEL_120;
            }
            goto LABEL_84;
          }
LABEL_90:
          if (*v49 <= length + tailCharAtStart) {
            NSUInteger v55 = length + tailCharAtStart;
          }
          else {
            NSUInteger v55 = *v49;
          }
          if (*v49 >= length + tailCharAtStart) {
            tailCharAtStart += length;
          }
          else {
            NSUInteger tailCharAtStart = *v49;
          }
          NSUInteger length = v55 - tailCharAtStart;
          goto LABEL_120;
        }
        if (v13 < CGRectGetMaxY(*(CGRect *)(v48 + 48))) {
          goto LABEL_90;
        }
        if (v102 != 10)
        {
LABEL_120:
          NSUInteger tailCharAtStart = -[TSWPStorage textRangeForParagraphsInCharRange:](v7, "textRangeForParagraphsInCharRange:", tailCharAtStart, length);
          NSUInteger length = v71;
          goto LABEL_121;
        }
      }
      else
      {
        if (v102 != 10) {
          goto LABEL_120;
        }
        if (v101)
        {
LABEL_84:
          v106.origin.double x = v51;
          v106.origin.double y = v50;
          v106.size.width = v53;
          v106.size.height = v52;
          if (v11 >= CGRectGetMaxX(v106)) {
            goto LABEL_120;
          }
LABEL_114:
          NSUInteger v68 = v49[1];
          NSUInteger v69 = v68 + *v49;
          if (tailCharAtStart <= v69) {
            NSUInteger v70 = v68 + *v49;
          }
          else {
            NSUInteger v70 = tailCharAtStart;
          }
          if (tailCharAtStart >= v69) {
            NSUInteger tailCharAtStart = v69;
          }
          NSUInteger length = v70 - tailCharAtStart;
          goto LABEL_120;
        }
      }
      v107.origin.double x = v51;
      v107.origin.double y = v50;
      v107.size.width = v53;
      v107.size.height = v52;
      if (v13 > CGRectGetMinY(v107)) {
        goto LABEL_114;
      }
      goto LABEL_120;
    }
  }
}

- (BOOL)p_newHeadCharIndex:(unint64_t)a3 isPastTailCharIndex:(unint64_t)a4 rep:(id)a5
{
  BOOL v9 = [(TSWPEditingController *)self->_editingController isInParagraphMode];
  BOOL v10 = a3 >= a4;
  if (self->_selectionType == 7 && !v9)
  {
    double v11 = +[TSWPTextKnobTracker p_lineFragmentForCharIndex:a3 knobTag:11 selectionType:7 rep:a5];
    unint64_t v13 = [a5 range];
    int v14 = 0;
    BOOL v15 = a4 >= v13;
    unint64_t v16 = a4 - v13;
    if (v15 && v16 < v12) {
      int v14 = +[TSWPTextKnobTracker p_lineFragmentForCharIndex:a4 knobTag:11 selectionType:self->_selectionType rep:a5];
    }
    if (v11 && v11 == v14)
    {
      BOOL v17 = [(TSWPStorage *)[(TSWPEditingController *)[(TSWPTextKnobTracker *)self editingController] storage] isWritingDirectionRightToLeftForParagraphAtCharIndex:a3];
      unint64_t v18 = TSWPLineFragment::visualIndexForCharIndex(v11, a3);
      unint64_t v19 = TSWPLineFragment::visualIndexForCharIndex(v11, a4);
      if (v17) {
        return v18 < v19;
      }
      else {
        return v18 > v19;
      }
    }
  }
  return v10;
}

- (BOOL)p_newTailCharIndex:(unint64_t)a3 isPastHeadCharIndex:(unint64_t)a4 rep:(id)a5
{
  BOOL v9 = [(TSWPEditingController *)self->_editingController isInParagraphMode];
  BOOL v10 = a3 <= a4;
  if (self->_selectionType == 7 && !v9)
  {
    double v11 = +[TSWPTextKnobTracker p_lineFragmentForCharIndex:a3 knobTag:11 selectionType:7 rep:a5];
    unint64_t v13 = [a5 range];
    int v14 = 0;
    BOOL v15 = a4 >= v13;
    unint64_t v16 = a4 - v13;
    if (v15 && v16 < v12) {
      int v14 = +[TSWPTextKnobTracker p_lineFragmentForCharIndex:a4 knobTag:11 selectionType:self->_selectionType rep:a5];
    }
    if (v11 && v11 == v14)
    {
      BOOL v17 = [(TSWPStorage *)[(TSWPEditingController *)[(TSWPTextKnobTracker *)self editingController] storage] isWritingDirectionRightToLeftForParagraphAtCharIndex:a3];
      unint64_t v18 = TSWPLineFragment::visualIndexForCharIndex(v11, a3);
      unint64_t v19 = TSWPLineFragment::visualIndexForCharIndex(v11, a4);
      if (v17) {
        return v18 > v19;
      }
      else {
        return v18 < v19;
      }
    }
  }
  return v10;
}

- (void)p_fixUpWordSelection
{
  if (![(TSWPTextKnobTracker *)self fixupWordSelection]
    || [(TSWPTextMagnifierRanged *)self->_magnifier terminalPointPlacedCarefully])
  {
    BOOL v3 = [(TSWPTextKnobTracker *)self editingController];
    [(TSWPEditingController *)v3 revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold];
    return;
  }
  [(TSWPTextMagnifierRanged *)self->_magnifier horizontalMovement];
  double v5 = v4;
  unint64_t v6 = [[(TSDKnobTracker *)self knob] tag];
  BOOL v7 = [(TSWPEditingController *)[(TSWPTextKnobTracker *)self editingController] selection];
  id v8 = v7;
  if (v5 >= 0.0)
  {
    if (v5 <= 0.0) {
      return;
    }
    if (v6 != 11)
    {
      unint64_t v10 = [(TSWPSelection *)v7 end];
      unint64_t v16 = [(TSDKnobTracker *)self rep];
      if (v16
        && (BOOL v17 = (void *)[(TSDRep *)v16 columnForCharIndex:v10]) != 0
        && (unint64_t v18 = (unint64_t *)objc_msgSend(v17, "lineFragmentForCharIndex:knobTag:selectionType:", v10, 10, -[TSWPSelection type](v8, "type"))) != 0)
      {
        int v15 = 1;
        if (*v18 < v10
          && v10 == v18[1] + *v18
          && (IsWhitespaceCharacter([(TSWPStorage *)[(TSWPEditingController *)[(TSWPTextKnobTracker *)self editingController] storage] characterAtIndex:v10 - 1]) & 1) != 0)
        {
          return;
        }
      }
      else
      {
        int v15 = 1;
      }
      goto LABEL_23;
    }
    uint64_t v14 = [(TSWPSelection *)v7 start];
  }
  else
  {
    if (v6 == 11)
    {
      uint64_t v9 = [(TSWPSelection *)v7 start];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
        return;
      }
      unint64_t v10 = v9;
      unint64_t location = [(TSWPSelection *)v8 range];
      NSUInteger length = v12;
      goto LABEL_29;
    }
    uint64_t v14 = [(TSWPSelection *)v7 end];
  }
  unint64_t v10 = v14;
  int v15 = 0;
LABEL_23:
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    return;
  }
  unint64_t location = [(TSWPSelection *)v8 range];
  NSUInteger length = v19;
  if (!v15)
  {
    double v20 = [(TSWPEditingController *)[(TSWPTextKnobTracker *)self editingController] storage];
    if (v6 != 11)
    {
      uint64_t v25 = [(TSWPStorage *)v20 nextWordFromIndex:v10 forward:0];
      if (v25 != 0x7FFFFFFFFFFFFFFFLL && v25 + v26 > location)
      {
        NSUInteger length = length - v10 + v25 + v26;
        goto LABEL_31;
      }
      NSUInteger v22 = [(TSWPStorage *)[(TSWPEditingController *)[(TSWPTextKnobTracker *)self editingController] storage] wordAtCharIndex:v10 includePreviousWord:1];
      if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    unint64_t v21 = [(TSWPStorage *)v20 nextWordFromIndex:v10 forward:1];
    if (v21 < location + length)
    {
      location += v21 - v10;
      length -= v21 - v10;
      goto LABEL_31;
    }
  }
LABEL_29:
  NSUInteger v22 = [(TSWPStorage *)[(TSWPEditingController *)[(TSWPTextKnobTracker *)self editingController] storage] wordAtCharIndex:v10 includePreviousWord:1];
  if (v22 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_30:
    v30.unint64_t location = v22;
    v30.NSUInteger length = v23;
    v29.unint64_t location = location;
    v29.NSUInteger length = length;
    NSRange v24 = NSUnionRange(v29, v30);
    unint64_t location = v24.location;
    NSUInteger length = v24.length;
  }
LABEL_31:
  uint64_t v27 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", [(TSWPSelection *)v8 type], location, length, [(TSWPSelection *)v8 styleInsertionBehavior], [(TSWPSelection *)v8 caretAffinity]);
  [(TSWPEditingController *)[(TSWPTextKnobTracker *)self editingController] setSelection:v27 withFlags:772];
}

- (unint64_t)p_charIndexForKnob:(unint64_t)a3 selection:(id)a4
{
  if ([a4 type] == 7)
  {
    if (a3 == 11)
    {
      return [a4 headChar];
    }
    else
    {
      return [a4 tailChar];
    }
  }
  else if (a3 == 11)
  {
    return [a4 start];
  }
  else
  {
    return [a4 end];
  }
}

- (BOOL)shouldHideOtherKnobs
{
  return 0;
}

- (BOOL)fixupWordSelection
{
  return 1;
}

- (_NSRange)adjustSelectionRange:(_NSRange)a3 forStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)updateAfterAutoscroll:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  -[TSWPTextMagnifierRanged setAutoscrollDirections:](self->_magnifier, "setAutoscrollDirections:", [a3 directions]);
  id v7 = [(TSWPTextKnobTracker *)self icc];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSWPTextKnobTracker icc](self, "icc"), "layerHost"), "canvasView"), "convertPoint:fromView:", 0, x, y);
  objc_msgSend(v7, "convertBoundsToUnscaledPoint:");
  double v9 = v8;
  double v11 = v10;
  -[TSWPTextKnobTracker p_setSelectionFromPoint:](self, "p_setSelectionFromPoint:");
  magnifier = self->_magnifier;

  -[TSWPTextMagnifierRanged postAutoscrollPoint:](magnifier, "postAutoscrollPoint:", v9, v11);
}

- (id)icc
{
  BOOL v2 = [(TSWPTextKnobTracker *)self editingController];

  return [(TSWPEditingController *)v2 interactiveCanvasController];
}

- (void)updateAfterAutoscroll:(id)a3
{
  magnifier = self->_magnifier;
  uint64_t v4 = [a3 directions];

  [(TSWPTextMagnifierRanged *)magnifier setAutoscrollDirections:v4];
}

- (void)autoscrollWillNotStart
{
}

- (double)unscaledStartAutoscrollThreshold
{
  BOOL v2 = [(TSWPEditingController *)self->_editingController isInParagraphMode];
  double result = 40.0;
  if (!v2) {
    return 25.0;
  }
  return result;
}

- (TSWPEditingController)editingController
{
  return self->_editingController;
}

- (void)setEditingController:(id)a3
{
}

- (BOOL)didShowMagnifier
{
  return self->_didShowMagnifier;
}

- (BOOL)ignoreNextCall
{
  return self->_ignoreNextCall;
}

- (void)setIgnoreNextCall:(BOOL)a3
{
  self->_ignoreNextCall = a3;
}

@end