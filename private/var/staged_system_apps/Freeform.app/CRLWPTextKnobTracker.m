@interface CRLWPTextKnobTracker
+ (const)p_lineFragmentForCharIndex:(unint64_t)a3 knobTag:(unint64_t)a4 selectionType:(unint64_t)a5 rep:(id)a6;
- (BOOL)didDragKnob;
- (BOOL)fixupWordSelection;
- (BOOL)ignoreNextCall;
- (BOOL)p_isMagnifyingVerticalText;
- (BOOL)p_newHeadCharIndex:(unint64_t)a3 isPastTailCharIndex:(unint64_t)a4 rep:(id)a5;
- (BOOL)p_newTailCharIndex:(unint64_t)a3 isPastHeadCharIndex:(unint64_t)a4 rep:(id)a5;
- (BOOL)shouldHideOtherKnobs;
- (CGPoint)magnificationPoint;
- (CRLWPTextKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (_NSRange)adjustSelectionRange:(_NSRange)a3 forStorage:(id)a4;
- (_TtC8Freeform11CRLWPEditor)textEditor;
- (double)delay;
- (id)p_rangedMagnifier;
- (unint64_t)p_charIndexForKnob:(unint64_t)a3 selection:(id)a4;
- (void)dealloc;
- (void)endMovingKnob;
- (void)moveKnobToCanvasPosition:(CGPoint)a3;
- (void)p_cleanupWhenDone;
- (void)p_fixUpWordSelection;
- (void)p_magnifyWithTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6 delayed:(BOOL)a7;
- (void)p_setSelectionFromPoint:(CGPoint)a3;
- (void)p_startMagnifyingAt:(CGPoint)a3;
- (void)p_stopMagnifyingWithAnimation:(BOOL)a3;
- (void)setIgnoreNextCall:(BOOL)a3;
- (void)setMagnificationPoint:(CGPoint)a3;
- (void)setTextEditor:(id)a3;
- (void)updateSelectionAfterAutoscroll:(id)a3;
@end

@implementation CRLWPTextKnobTracker

- (CRLWPTextKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v66.receiver = self;
  v66.super_class = (Class)CRLWPTextKnobTracker;
  v8 = [(CRLCanvasKnobTracker *)&v66 initWithRep:v6 knob:v7];
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    v10 = [(CRLCanvasKnobTracker *)v8 rep];
    v11 = [v10 interactiveCanvasController];
    v12 = [v11 editorController];
    v13 = [v12 textInputEditor];
    v14 = sub_1002469D0(v9, v13);
    [(CRLWPTextKnobTracker *)v8 setTextEditor:v14];

    v15 = [(CRLWPTextKnobTracker *)v8 textEditor];
    [v15 setKnobTracking:1];

    v16 = [(CRLCanvasKnobTracker *)v8 knob];
    id v17 = [v16 tag];
    v18 = [(CRLWPTextKnobTracker *)v8 textEditor];
    [v18 setKnobTag:v17];

    v19 = [(CRLCanvasKnobTracker *)v8 rep];
    [v7 position];
    [v19 convertNaturalPointToUnscaledCanvas:];
    double v21 = v20;
    double v23 = v22;
    v24 = [(CRLWPTextKnobTracker *)v8 textEditor];
    [v24 setKnobTrackingDragPoint:v21, v23];

    v25 = [(CRLWPTextKnobTracker *)v8 textEditor];
    v8->_multiTap = (uint64_t)[v25 knobTrackingTapCount] > 1;

    v26 = [(CRLWPTextKnobTracker *)v8 textEditor];
    v27 = [v26 selection];

    v8->_selectionType = (unint64_t)[v27 type];
    v8->_rangeAtStart.location = (NSUInteger)[v27 range];
    v8->_rangeAtStart.length = v28;
    if (v8->_selectionType != 7)
    {
      v29 = [(CRLWPTextKnobTracker *)v8 textEditor];
      v30 = [v29 editorHelper];
      uint64_t v31 = [v30 logicalToVisualSelection:v27];

      v32 = [(CRLWPTextKnobTracker *)v8 textEditor];
      [v32 setSelection:v31];

      v27 = (void *)v31;
    }
    v33 = [(CRLWPTextKnobTracker *)v8 textEditor];
    v34 = [v33 editorHelper];
    v35 = [v34 calculateVisualRunsFromSelection:v27 updateControllerSelection:1];

    v36 = [v35 start];
    v37 = [v35 end];
    if ([v35 isVisual])
    {
      v36 = [v35 headCharIndex];
      v38 = [v35 tailCharIndex];
      if (v38 < v36) {
        v36 = v38;
      }
      id v39 = [v35 headCharIndex];
      id v40 = [v35 tailCharIndex];
      if (v39 <= v40) {
        unint64_t v41 = (unint64_t)v40;
      }
      else {
        unint64_t v41 = (unint64_t)v39;
      }
      v8->_headCharAtStart = (unint64_t)[v35 headCharIndex];
      v8->_tailCharAtStart = (unint64_t)[v35 tailCharIndex];
      v42 = [(CRLWPTextKnobTracker *)v8 textEditor];
      v43 = [v42 storage];
      v37 = (unsigned char *)sub_1001CB3C4(v41, v43);
    }
    else
    {
      v8->_headCharAtStart = (unint64_t)v36;
      v8->_tailCharAtStart = (unint64_t)v37;
    }
    if (v36 <= v37) {
      v44 = v37;
    }
    else {
      v44 = v36;
    }
    if (v36 >= v37) {
      v45 = v37;
    }
    else {
      v45 = v36;
    }
    v8->_rangeAtStart.location = (NSUInteger)v45;
    v8->_rangeAtStart.length = v44 - v45;
    v46 = [(CRLCanvasKnobTracker *)v8 rep];
    [v46 refreshEditMenu];

    v47 = [(CRLWPTextKnobTracker *)v8 textEditor];
    unsigned int v48 = [v47 wantsParagraphModeWithSelection:v35];

    if (v48)
    {
      v49 = [(CRLCanvasKnobTracker *)v8 rep];
      v50 = [(CRLCanvasKnobTracker *)v8 knob];
      if ([v50 tag] == (id)10) {
        id v51 = [v35 start];
      }
      else {
        id v51 = [v35 end];
      }
      id v52 = v51;
      v53 = [(CRLCanvasKnobTracker *)v8 knob];
      v54 = [v49 repForCharIndex:v52 isStart:[v53 tag] == (id)11];

      v55 = [(CRLCanvasKnobTracker *)v8 rep];

      if (v55 != v54) {
        [v54 invalidateKnobs];
      }
      v56 = [(CRLCanvasKnobTracker *)v8 rep];
      [v56 invalidateKnobs];

      v57 = [(CRLCanvasKnobTracker *)v8 rep];
      v58 = [(CRLCanvasKnobTracker *)v8 knob];
      v59 = [v57 knobForTag:[v58 tag]];
      [(CRLCanvasKnobTracker *)v8 setKnob:v59];
    }
    v60 = [(CRLWPTextKnobTracker *)v8 textEditor];
    v61 = [v60 interactiveCanvasController];
    if (v61)
    {
      v62 = [(CRLCanvasKnobTracker *)v8 rep];

      if (v7) {
        BOOL v63 = v62 == 0;
      }
      else {
        BOOL v63 = 1;
      }
      if (v63) {
        char v64 = 1;
      }
      else {
        char v64 = v48;
      }
      if (v64) {
        goto LABEL_35;
      }
      v60 = [(CRLCanvasKnobTracker *)v8 rep];
      [v7 position];
      -[CRLWPTextKnobTracker p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:](v8, "p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:", v60, 1, 1);
    }

LABEL_35:
  }

  return v8;
}

- (void)dealloc
{
  if (self->_textMagnifierTimer)
  {
    int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FFFB0);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BCC18(v3, v4);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FFFD0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = +[CRLAssertionHandler packedBacktraceString];
      sub_10106CDAC(v6, buf, v3, (os_log_t)v5);
    }

    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTextKnobTracker dealloc]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPTextKnobTracker.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 156, 0, "_textMagnifierTimer retains us, so it should be gone by our -dealloc");
  }
  [(CRLWPTextKnobTracker *)self p_cleanupWhenDone];
  [(CRLWPTextKnobTracker *)self p_stopMagnifyingWithAnimation:0];
  textEditor = self->_textEditor;
  self->_textEditor = 0;

  v10.receiver = self;
  v10.super_class = (Class)CRLWPTextKnobTracker;
  [(CRLCanvasKnobTracker *)&v10 dealloc];
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
    -[CRLWPTextKnobTracker p_setSelectionFromPoint:](self, "p_setSelectionFromPoint:");
    id v6 = [(CRLWPTextKnobTracker *)self textEditor];
    [v6 setKnobTrackingDragPoint:x, y];

    id v7 = [(CRLCanvasKnobTracker *)self rep];
    [v7 invalidateKnobPositions];
  }
}

- (void)endMovingKnob
{
  if (self->_knobMoved) {
    [(CRLWPTextKnobTracker *)self p_fixUpWordSelection];
  }
  [(CRLWPTextKnobTracker *)self p_stopMagnifyingWithAnimation:1];
  [(CRLWPTextKnobTracker *)self p_cleanupWhenDone];
  v3.receiver = self;
  v3.super_class = (Class)CRLWPTextKnobTracker;
  [(CRLCanvasKnobTracker *)&v3 endMovingKnob];
}

- (void)p_cleanupWhenDone
{
  if (!self->_doneTracking)
  {
    self->_doneTracking = 1;
    id v3 = [(CRLWPTextKnobTracker *)self textEditor];
    [v3 setKnobTracking:0];

    id v4 = [(CRLCanvasKnobTracker *)self rep];
    [v4 invalidateKnobs];
    [v4 invalidateKnobPositions];
    [v4 refreshEditMenu];
  }
}

- (BOOL)p_isMagnifyingVerticalText
{
  id v3 = [(CRLWPTextKnobTracker *)self textEditor];
  id v4 = [v3 selection];

  v5 = [(CRLCanvasKnobTracker *)self knob];
  id v6 = [v5 tag];

  unint64_t v7 = [(CRLWPTextKnobTracker *)self p_charIndexForKnob:v6 selection:v4];
  unint64_t selectionType = self->_selectionType;
  uint64_t v9 = [(CRLCanvasKnobTracker *)self rep];
  objc_super v10 = +[CRLWPTextKnobTracker p_lineFragmentForCharIndex:v7 knobTag:v6 selectionType:selectionType rep:v9];

  if (v10) {
    BOOL v11 = (v10[25] >> 5) & 1;
  }
  else {
    LOBYTE(v11) = 0;
  }

  return v11;
}

+ (const)p_lineFragmentForCharIndex:(unint64_t)a3 knobTag:(unint64_t)a4 selectionType:(unint64_t)a5 rep:(id)a6
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [a6 columns];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v9);
      }
      id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) lineFragmentForCharIndex:a3 knobTag:a4 selectionType:a5];
      if (v13) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v13 = 0;
  }

  return v13;
}

- (id)p_rangedMagnifier
{
  if (!self->_magnifier)
  {
    [(CRLWPTextKnobTracker *)self p_isMagnifyingVerticalText];
    id v3 = (CRLWPTextMagnifierRanged *)objc_opt_new();
    magnifier = self->_magnifier;
    self->_magnifier = v3;
  }
  v5 = self->_magnifier;

  return v5;
}

- (void)p_startMagnifyingAt:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  self->_didDragKnob = 1;
  if (+[CRLFeatureFlagGroup isRedesignedTextCursorEnabled])
  {
    id v7 = [(CRLWPTextKnobTracker *)self textEditor];
    id v6 = [v7 textSelectionDelegate];
    [v6 beginLoupeSessionAt:x, y];
  }
}

- (void)p_magnifyWithTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6 delayed:(BOOL)a7
{
  double y = a4.y;
  double x = a4.x;
  self->_didDragKnob = 1;
  if (+[CRLFeatureFlagGroup isRedesignedTextCursorEnabled])
  {
    id v11 = [(CRLWPTextKnobTracker *)self textEditor];
    id v10 = [v11 textSelectionDelegate];
    [v10 moveLoupeTo:x, y];
  }
}

- (void)p_stopMagnifyingWithAnimation:(BOOL)a3
{
  if (+[CRLFeatureFlagGroup isRedesignedTextCursorEnabled])
  {
    id v5 = [(CRLWPTextKnobTracker *)self textEditor];
    id v4 = [v5 textSelectionDelegate];
    [v4 endLoupeSession];
  }
}

- (void)p_setSelectionFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v146 = [(CRLWPTextKnobTracker *)self textEditor];
  id v6 = [v146 storage];
  id v7 = [v146 closestRepToPoint:v6 forStorage:x, y];
  v8 = v7;
  if (v7)
  {
    [v7 convertNaturalPointFromUnscaledCanvas:x, y];
    double v10 = v9;
    double v12 = v11;
    id v13 = [v8 columns];
    v14 = [v13 firstObject];
    unsigned int v15 = [v14 textIsVertical];

    unsigned __int8 v16 = [(CRLWPEditor *)self->_textEditor wantsParagraphMode];
    if (self->_multiTap) {
      char v17 = 1;
    }
    else {
      char v17 = v16;
    }
    if ((v17 & 1) == 0)
    {
      if (v15)
      {
        long long v18 = [(CRLCanvasKnobTracker *)self knob];
        [v8 knobOffsetForKnob:v18 paragraphMode:0];
        double v20 = v19;

        double v21 = [(CRLCanvasKnobTracker *)self knob];
        id v22 = [v21 tag];
        double v23 = 1.0;
        if (v22 == (id)11) {
          double v23 = -1.0;
        }
        double v10 = v10 + v20 + v23;
      }
      else
      {
        v24 = [(CRLCanvasKnobTracker *)self knob];
        [v8 knobOffsetForKnob:v24 paragraphMode:0];
        double v26 = v25;

        double v21 = [(CRLCanvasKnobTracker *)self knob];
        id v27 = [v21 tag];
        double v28 = -1.0;
        if (v27 == (id)11) {
          double v28 = 1.0;
        }
        double v12 = v12 - v26 + v28;
      }
    }
    v29 = [v146 selection];
    [v29 range];
    v30 = [(CRLCanvasKnobTracker *)self knob];
    unsigned int v144 = v15;
    id v31 = [v30 tag];

    id v32 = [v29 type];
    v33 = [v8 layout];
    tailCharAtStart = +[CRLWPColumn charIndexForPointWithPinning:isTail:selectionType:inLayoutTarget:](CRLWPColumn, "charIndexForPointWithPinning:isTail:selectionType:inLayoutTarget:", v31 == (id)10, v32, v33, v10, v12);

    if (tailCharAtStart == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v35 = v29;
      id v36 = v8;
LABEL_146:

      goto LABEL_147;
    }
    v145 = v6;
    if (self->_multiTap)
    {
      if (v31 == (id)11)
      {
        if ([(CRLWPTextKnobTracker *)self p_newHeadCharIndex:tailCharAtStart isPastTailCharIndex:self->_tailCharAtStart rep:v8])
        {
          uint64_t v37 = 10;
        }
        else
        {
          uint64_t v37 = 11;
        }
LABEL_29:
        if (v31 == (id)v37) {
          goto LABEL_34;
        }
        [v146 setKnobTag:v37];
        v43 = [(CRLCanvasKnobTracker *)self rep];
        [v43 invalidateKnobs];

        [v8 invalidateKnobs];
        v44 = [v8 knobForTag:v37];
        if (v44) {
          [(CRLCanvasKnobTracker *)self setKnob:v44];
        }
        id v31 = (id)v37;
        goto LABEL_33;
      }
      if (v31 == (id)10)
      {
        if ([(CRLWPTextKnobTracker *)self p_newTailCharIndex:tailCharAtStart isPastHeadCharIndex:self->_headCharAtStart rep:v8])
        {
          uint64_t v37 = 11;
        }
        else
        {
          uint64_t v37 = 10;
        }
        goto LABEL_29;
      }
      p_rangeAtStart = &self->_rangeAtStart;
      NSUInteger location = self->_rangeAtStart.location;
LABEL_39:
      p_NSUInteger length = &p_rangeAtStart->length;
      NSUInteger v40 = p_rangeAtStart->length + location;
      goto LABEL_40;
    }
    if (self->_selectionType) {
      goto LABEL_34;
    }
    p_rangeAtStart = &self->_rangeAtStart;
    NSUInteger location = self->_rangeAtStart.location;
    if (v31 == (id)11)
    {
      p_NSUInteger length = &self->_rangeAtStart.length;
      NSUInteger v40 = self->_rangeAtStart.length + location;
      if ((unint64_t)tailCharAtStart < v40)
      {
LABEL_35:
        unsigned int v45 = -[CRLWPTextKnobTracker p_newHeadCharIndex:isPastTailCharIndex:rep:](self, "p_newHeadCharIndex:isPastTailCharIndex:rep:", tailCharAtStart, self->_tailCharAtStart, v8, 80);
        char v46 = v45;
        if (v45)
        {
          if (self->_selectionType == 7) {
            tailCharAtStart = (char *)self->_tailCharAtStart;
          }
          else {
            tailCharAtStart = (char *)[v145 previousCharacterIndex:v40];
          }
        }
        if (self->_selectionType == 7)
        {
          unint64_t v57 = self->_tailCharAtStart;
          if ((unint64_t)tailCharAtStart <= v57) {
            unint64_t v58 = self->_tailCharAtStart;
          }
          else {
            unint64_t v58 = (unint64_t)tailCharAtStart;
          }
          v59 = (char *)[v145 nextCharacterIndex:v58];
          if ((unint64_t)tailCharAtStart >= v57) {
            v60 = (char *)v57;
          }
          else {
            v60 = tailCharAtStart;
          }
          if (v60 <= v59) {
            v61 = v59;
          }
          else {
            v61 = v60;
          }
          if (v60 >= v59) {
            tailCharAtStart = v59;
          }
          else {
            tailCharAtStart = v60;
          }
          NSUInteger length = v61 - tailCharAtStart;
        }
        else
        {
          NSUInteger length = v40 - (void)tailCharAtStart;
        }
        unsigned int v143 = 1;
        uint64_t v141 = 11;
        goto LABEL_78;
      }
      unint64_t v41 = [v146 storage];
      id v42 = [v41 previousCharacterIndex:self->_rangeAtStart.length + p_rangeAtStart->location];
    }
    else
    {
      if (v31 != (id)10 || (unint64_t)tailCharAtStart > location) {
        goto LABEL_39;
      }
      unint64_t v41 = [v146 storage];
      id v42 = [v41 nextCharacterIndex:p_rangeAtStart->location];
    }
    id v73 = v42;

    if (v73 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_34:
      p_rangeAtStart = &self->_rangeAtStart;
      p_NSUInteger length = &self->_rangeAtStart.length;
      NSUInteger v40 = self->_rangeAtStart.length + self->_rangeAtStart.location;
      if (v31 == (id)11) {
        goto LABEL_35;
      }
LABEL_40:
      uint64_t v141 = (uint64_t)v31;
      id v47 = [v29 type:80];
      unsigned int v48 = tailCharAtStart;
      if (v47 != (id)7) {
        unsigned int v48 = (char *)[v6 previousCharacterIndex:tailCharAtStart];
      }
      unsigned int v49 = [(CRLWPTextKnobTracker *)self p_newTailCharIndex:v48 isPastHeadCharIndex:self->_headCharAtStart rep:v8];
      char v46 = v49;
      if (v49)
      {
        if (self->_selectionType == 7) {
          tailCharAtStart = (char *)self->_headCharAtStart;
        }
        else {
          tailCharAtStart = (char *)[v145 nextCharacterIndex:p_rangeAtStart->location];
        }
      }
      if (self->_selectionType == 7)
      {
        unint64_t headCharAtStart = self->_headCharAtStart;
        if (headCharAtStart <= (unint64_t)tailCharAtStart) {
          unint64_t v51 = (unint64_t)tailCharAtStart;
        }
        else {
          unint64_t v51 = self->_headCharAtStart;
        }
        id v52 = (char *)[v145 nextCharacterIndex:v51];
        unsigned int v143 = 0;
        if (headCharAtStart >= (unint64_t)tailCharAtStart) {
          v53 = tailCharAtStart;
        }
        else {
          v53 = (char *)headCharAtStart;
        }
        if (v53 <= v52) {
          v54 = v52;
        }
        else {
          v54 = v53;
        }
        if (v53 >= v52) {
          tailCharAtStart = v52;
        }
        else {
          tailCharAtStart = v53;
        }
        NSUInteger length = v54 - tailCharAtStart;
      }
      else
      {
        unsigned int v143 = 0;
        v56 = &tailCharAtStart[-v40];
        tailCharAtStart = (char *)p_rangeAtStart->location;
        NSUInteger length = (NSUInteger)&v56[p_rangeAtStart->length];
      }
LABEL_78:
      v62 = +[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", tailCharAtStart, length);
      unsigned int v63 = [v146 wantsParagraphModeWithSelection:v62];

      if (!v63)
      {
        v72 = v145;
        goto LABEL_124;
      }
      if (v46)
      {
LABEL_123:
        v72 = v145;
        tailCharAtStart = [v145 textRangeForParagraphsInCharRange:tailCharAtStart length];
        NSUInteger length = v90;
LABEL_124:
        if (self->_multiTap)
        {
          v150.NSUInteger location = p_rangeAtStart->location;
          v150.NSUInteger length = *p_length;
          v148.NSUInteger location = (NSUInteger)tailCharAtStart;
          v148.NSUInteger length = length;
          NSRange v91 = NSUnionRange(v148, v150);
          tailCharAtStart = (char *)v91.location;
          NSUInteger length = v91.length;
        }
        id v92 = -[CRLWPTextKnobTracker adjustSelectionRange:forStorage:](self, "adjustSelectionRange:forStorage:", tailCharAtStart, length, v72);
        NSUInteger v94 = v93;
        v95 = [v146 editorHelper];
        v151.NSUInteger location = [v95 selectionRangeForCharIndex:[v29 range]];
        v151.NSUInteger length = v96;
        v149.NSUInteger location = (NSUInteger)v92;
        v149.NSUInteger length = v94;
        id v97 = (id)sub_100209474(v149, v151);
        uint64_t v99 = v98;

        if ([v29 range] == v97 && v100 == v99)
        {
          v35 = v29;
          id v36 = v8;
          id v6 = v145;
          goto LABEL_146;
        }
        id v6 = v145;
        id v101 = objc_msgSend(objc_alloc((Class)objc_msgSend(v146, "wpSelectionClass")), "initWithType:range:styleInsertionBehavior:caretAffinity:", 7, v97, v99, 0, 0);
        v102 = [v146 editorController];
        [v102 setSelection:v101 forEditor:v146 withFlags:14];

        v103 = [v146 editorHelper];
        v104 = [v146 selection];
        id v105 = [v103 calculateVisualRunsFromSelection:v104 updateControllerSelection:1];

        v35 = [v146 selection];

        self->_unint64_t selectionType = (unint64_t)[v35 type];
        if (v143) {
          id v106 = [v35 start];
        }
        else {
          id v106 = [v35 end];
        }
        v107 = [v8 repForCharIndex:v106 isStart:v143];
        v108 = v107;
        if (v107)
        {
          id v36 = v107;

          id v109 = [(CRLCanvasKnobTracker *)self rep];

          if (v109 != v36)
          {
            [v146 setKnobTag:v141];
            v110 = [(CRLCanvasKnobTracker *)self rep];
            [v110 invalidateKnobs];

            [v36 invalidateKnobs];
            [(CRLCanvasKnobTracker *)self setRep:v36];
            v111 = [(CRLCanvasKnobTracker *)self rep];
            v112 = [v111 knobForTag:v141];
            [(CRLCanvasKnobTracker *)self setKnob:v112];
          }
        }
        else
        {
          id v36 = v8;
        }
        v113 = [(CRLCanvasKnobTracker *)self rep];
        v114 = [(CRLCanvasKnobTracker *)self knob];
        [v113 knobCenterForSelection:v35 knob:v114];
        double v116 = v115;
        double v118 = v117;
        v119 = [(CRLCanvasKnobTracker *)self knob];
        [v119 setPosition:v116, v118];

        v120 = [(CRLCanvasKnobTracker *)self knob];
        [v120 position];
        double v122 = v121;
        double v124 = v123;
        double v125 = CGRectNull.origin.y;

        unsigned int v126 = [*(id *)((char *)&self->super.super.isa + v140) wantsParagraphMode];
        BOOL v127 = v122 == CGRectNull.origin.x;
        if (v124 != v125) {
          BOOL v127 = 0;
        }
        if ((v126 | v127) == 1)
        {
          [(CRLWPTextKnobTracker *)self p_stopMagnifyingWithAnimation:1];
        }
        else
        {
          v128 = [v146 interactiveCanvasController];
          if (v128)
          {
            v129 = [(CRLCanvasKnobTracker *)self rep];
            if (v129)
            {
              v130 = [(CRLCanvasKnobTracker *)self knob];

              if (!v130) {
                goto LABEL_145;
              }
              v128 = [(CRLCanvasKnobTracker *)self rep];
              v131 = [(CRLCanvasKnobTracker *)self knob];
              [v131 position];
              -[CRLWPTextKnobTracker p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:](self, "p_magnifyWithTarget:magnificationPoint:offset:animated:delayed:", v128, self->_textMagnifierTimer == 0, 0);
            }
          }
        }
LABEL_145:

        goto LABEL_146;
      }
      char v64 = [v8 columns];
      v65 = +[CRLWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](CRLWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", v64, 0, 1, v10, v12);

      objc_super v66 = (char *)[v65 lineFragmentClosestToPoint:5 knobTag:v10 v12];
      v67 = (long long *)v66;
      if (!v66) {
        goto LABEL_122;
      }
      CGFloat v69 = *((double *)v66 + 5);
      CGFloat v68 = *((double *)v66 + 6);
      CGFloat v71 = *((double *)v66 + 7);
      CGFloat v70 = *((double *)v66 + 8);
      if (v143)
      {
        if (v144)
        {
          if (v10 <= CGRectGetMinX(*(CGRect *)(v66 + 40)))
          {
            if (v141 != 10) {
              goto LABEL_122;
            }
            goto LABEL_89;
          }
LABEL_101:
          if (*((uint64_t *)v67 + 3) < 0) {
            v84 = &xmmword_101176F48;
          }
          else {
            v84 = v67;
          }
          v85 = *(char **)v84;
          if (v85 <= &tailCharAtStart[length]) {
            v86 = &tailCharAtStart[length];
          }
          else {
            v86 = v85;
          }
          if (v85 >= &tailCharAtStart[length]) {
            tailCharAtStart += length;
          }
          else {
            tailCharAtStart = v85;
          }
          NSUInteger length = v86 - tailCharAtStart;
          goto LABEL_122;
        }
        if (v12 < CGRectGetMaxY(*(CGRect *)(v66 + 40))) {
          goto LABEL_101;
        }
        if (v141 != 10)
        {
LABEL_122:

          goto LABEL_123;
        }
      }
      else
      {
        if (v141 != 10) {
          goto LABEL_122;
        }
        if (v144)
        {
LABEL_89:
          v152.origin.double x = v69;
          v152.origin.double y = v68;
          v152.size.width = v71;
          v152.size.height = v70;
          if (v10 >= CGRectGetMaxX(v152)) {
            goto LABEL_122;
          }
LABEL_113:
          if (*((uint64_t *)v67 + 3) < 0) {
            v87 = &xmmword_101176F48;
          }
          else {
            v87 = v67;
          }
          v88 = (char *)(*(void *)v87 + *((void *)v87 + 1));
          if (tailCharAtStart <= v88) {
            v89 = v88;
          }
          else {
            v89 = tailCharAtStart;
          }
          if (tailCharAtStart >= v88) {
            tailCharAtStart = v88;
          }
          NSUInteger length = v89 - tailCharAtStart;
          goto LABEL_122;
        }
      }
      v154.origin.double x = v69;
      v154.origin.double y = v68;
      v154.size.width = v71;
      v154.size.height = v70;
      if (v12 > CGRectGetMinY(v154)) {
        goto LABEL_113;
      }
      goto LABEL_122;
    }
    v44 = -[CRLWPSelection initWithRange:]([CRLWPSelection alloc], "initWithRange:", v73, 0);
    v74 = [(CRLCanvasKnobTracker *)self rep];
    [v74 caretRectForSelection:v44];
    double v76 = v75;
    double v78 = v77;
    double v80 = v79;
    CGFloat v82 = v81;

    v155.origin.double x = CGRectNull.origin.x;
    v155.origin.double y = CGRectNull.origin.y;
    v155.size.width = CGRectNull.size.width;
    v155.size.height = CGRectNull.size.height;
    v153.origin.double x = v76;
    v153.origin.double y = v78;
    v153.size.width = v80;
    v153.size.height = v82;
    if (!CGRectEqualToRect(v153, v155))
    {
      unsigned int v83 = v144;
      if (v31 != (id)11) {
        unsigned int v83 = 0;
      }
      if (v83 == 1)
      {
        double v76 = v76 + v80;
      }
      else if (v31 == (id)10)
      {
        double v132 = -0.0;
        if (!v144) {
          double v132 = v82;
        }
        double v78 = v78 + v132;
      }
      if (v144)
      {
        v133 = [(CRLCanvasKnobTracker *)self knob];
        id v134 = [v133 tag];
        double v135 = 1.0;
        if (v134 == (id)11) {
          double v135 = -1.0;
        }
        double v10 = v76 + v135;
      }
      else
      {
        v133 = [(CRLCanvasKnobTracker *)self knob];
        id v136 = [v133 tag];
        double v137 = -1.0;
        if (v136 == (id)11) {
          double v137 = 1.0;
        }
        double v12 = v78 + v137;
      }

      v138 = [v8 layout];
      unint64_t v139 = +[CRLWPColumn charIndexForPointWithPinning:inLayoutTarget:](CRLWPColumn, "charIndexForPointWithPinning:inLayoutTarget:", v138, v10, v12);

      if (v139 != 0x7FFFFFFFFFFFFFFFLL) {
        tailCharAtStart = (char *)v139;
      }
    }
LABEL_33:

    goto LABEL_34;
  }
LABEL_147:
}

- (BOOL)p_newHeadCharIndex:(unint64_t)a3 isPastTailCharIndex:(unint64_t)a4 rep:(id)a5
{
  id v8 = a5;
  BOOL v9 = a3 >= a4;
  if (self->_selectionType == 7 && ![(CRLWPEditor *)self->_textEditor wantsParagraphMode])
  {
    double v10 = +[CRLWPTextKnobTracker p_lineFragmentForCharIndex:a3 knobTag:11 selectionType:self->_selectionType rep:v8];
    id v12 = [v8 range];
    id v13 = 0;
    BOOL v14 = a4 >= (unint64_t)v12;
    unint64_t v15 = a4 - (void)v12;
    if (v14 && v15 < v11) {
      id v13 = +[CRLWPTextKnobTracker p_lineFragmentForCharIndex:a4 knobTag:11 selectionType:self->_selectionType rep:v8];
    }
    if (v10) {
      BOOL v16 = v10 == v13;
    }
    else {
      BOOL v16 = 0;
    }
    if (v16)
    {
      char v17 = [(CRLWPTextKnobTracker *)self textEditor];
      long long v18 = [v17 storage];
      unsigned int v19 = [v18 isWritingDirectionRightToLeftForParagraphAtCharIndex:a3];

      unint64_t v20 = sub_10015A7EC((uint64_t)v10, a3);
      unint64_t v21 = sub_10015A7EC((uint64_t)v10, a4);
      if (v19) {
        BOOL v9 = v20 < v21;
      }
      else {
        BOOL v9 = v20 > v21;
      }
    }
  }

  return v9;
}

- (BOOL)p_newTailCharIndex:(unint64_t)a3 isPastHeadCharIndex:(unint64_t)a4 rep:(id)a5
{
  id v8 = a5;
  BOOL v9 = a3 <= a4;
  if (self->_selectionType == 7 && ![(CRLWPEditor *)self->_textEditor wantsParagraphMode])
  {
    double v10 = +[CRLWPTextKnobTracker p_lineFragmentForCharIndex:a3 knobTag:11 selectionType:self->_selectionType rep:v8];
    id v12 = [v8 range];
    id v13 = 0;
    BOOL v14 = a4 >= (unint64_t)v12;
    unint64_t v15 = a4 - (void)v12;
    if (v14 && v15 < v11) {
      id v13 = +[CRLWPTextKnobTracker p_lineFragmentForCharIndex:a4 knobTag:11 selectionType:self->_selectionType rep:v8];
    }
    if (v10) {
      BOOL v16 = v10 == v13;
    }
    else {
      BOOL v16 = 0;
    }
    if (v16)
    {
      char v17 = [(CRLWPTextKnobTracker *)self textEditor];
      long long v18 = [v17 storage];
      unsigned int v19 = [v18 isWritingDirectionRightToLeftForParagraphAtCharIndex:a3];

      unint64_t v20 = sub_10015A7EC((uint64_t)v10, a3);
      unint64_t v21 = sub_10015A7EC((uint64_t)v10, a4);
      if (v19) {
        BOOL v9 = v20 > v21;
      }
      else {
        BOOL v9 = v20 < v21;
      }
    }
  }

  return v9;
}

- (void)p_fixUpWordSelection
{
  if (![(CRLWPTextKnobTracker *)self fixupWordSelection]
    || [(CRLWPTextMagnifierRanged *)self->_magnifier terminalPointPlacedCarefully])
  {
    return;
  }
  [(CRLWPTextMagnifierRanged *)self->_magnifier horizontalMovement];
  double v4 = v3;
  id v43 = [(CRLCanvasKnobTracker *)self knob];
  id v5 = [v43 tag];

  id v6 = [(CRLWPTextKnobTracker *)self textEditor];
  id v44 = [v6 selection];

  if (v4 >= 0.0)
  {
    if (v4 <= 0.0) {
      goto LABEL_38;
    }
    if (v5 != (id)11)
    {
      id v7 = [v44 end];
      double v10 = [(CRLCanvasKnobTracker *)self rep];
      unint64_t v11 = v10;
      if (v10)
      {
        id v12 = [v10 columnForCharIndex:v7];
        if (v12
          && (id v13 = (uint64_t *)objc_msgSend(v12, "lineFragmentForCharIndex:knobTag:selectionType:", v7, 10, objc_msgSend(v44, "type"))) != 0&& (v13[3] < 0 ? (v14 = &xmmword_101176F48) : (v14 = (long long *)v13), *(void *)v14 < (unint64_t)v7 && v7 == (unsigned char *)(*(void *)v14 + *((void *)v14 + 1))))
        {
          unint64_t v15 = [(CRLWPTextKnobTracker *)self textEditor];
          BOOL v16 = [v15 storage];
          char v17 = sub_1001CA378((uint64_t)[v16 characterAtIndex:v7 - 1]);

          if (v17) {
            goto LABEL_38;
          }
        }
        else
        {
        }
      }
      goto LABEL_23;
    }
    id v8 = [v44 start];
LABEL_11:
    id v7 = v8;
    int v9 = 0;
    goto LABEL_24;
  }
  if (v5 != (id)11)
  {
    id v8 = [v44 end];
    goto LABEL_11;
  }
  id v7 = [v44 start];
LABEL_23:
  int v9 = 1;
LABEL_24:
  if (v7 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger location = (char *)[v44 range];
    NSUInteger length = v19;
    if (v9)
    {
      unint64_t v21 = [(CRLWPTextKnobTracker *)self textEditor];
      id v22 = [v21 storage];
      id v23 = [v22 wordAtCharIndex:v7 includePreviousWord:1];
      NSUInteger v25 = v24;

      if (v23 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_37:
        id v39 = [[CRLWPSelection alloc] initWithType:[v44 type] range:location length:[v44 styleInsertionBehavior] caretAffinity:[v44 caretAffinity]];
        NSUInteger v40 = [(CRLWPTextKnobTracker *)self textEditor];
        unint64_t v41 = [v40 editorController];
        id v42 = [(CRLWPTextKnobTracker *)self textEditor];
        [v41 setSelection:v39 forEditor:v42 withFlags:9];

        goto LABEL_38;
      }
    }
    else if (v5 == (id)11)
    {
      id v27 = [(CRLWPTextKnobTracker *)self textEditor];
      double v28 = (char *)[v27 nextWordFromIndex:v7 forward:1];

      if (v28 < &location[length])
      {
        location += v28 - v7;
        length -= v28 - v7;
        goto LABEL_37;
      }
      v33 = [(CRLWPTextKnobTracker *)self textEditor];
      v34 = [v33 storage];
      id v23 = [v34 wordAtCharIndex:v7 includePreviousWord:1];
      NSUInteger v25 = v35;

      if (v23 == (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_37;
      }
    }
    else
    {
      v29 = [(CRLWPTextKnobTracker *)self textEditor];
      v30 = (char *)[v29 nextWordFromIndex:v7 forward:0];
      uint64_t v32 = v31;

      if (v30 != (char *)0x7FFFFFFFFFFFFFFFLL && &v30[v32] > location)
      {
        NSUInteger length = (NSUInteger)&v30[v32 + length - (void)v7];
        goto LABEL_37;
      }
      id v36 = [(CRLWPTextKnobTracker *)self textEditor];
      uint64_t v37 = [v36 storage];
      id v23 = [v37 wordAtCharIndex:v7 includePreviousWord:1];
      NSUInteger v25 = v38;

      if (v23 == (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_37;
      }
    }
    v46.NSUInteger location = (NSUInteger)location;
    v46.NSUInteger length = length;
    v47.NSUInteger location = (NSUInteger)v23;
    v47.NSUInteger length = v25;
    NSRange v26 = NSUnionRange(v46, v47);
    NSUInteger location = (char *)v26.location;
    NSUInteger length = v26.length;
    goto LABEL_37;
  }
LABEL_38:
}

- (unint64_t)p_charIndexForKnob:(unint64_t)a3 selection:(id)a4
{
  id v5 = a4;
  if ([v5 type] == (id)7)
  {
    if (a3 == 11) {
      id v6 = [v5 headCharIndex];
    }
    else {
      id v6 = [v5 tailCharIndex];
    }
  }
  else if (a3 == 11)
  {
    id v6 = [v5 start];
  }
  else
  {
    id v6 = [v5 end];
  }
  unint64_t v7 = (unint64_t)v6;

  return v7;
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

- (void)updateSelectionAfterAutoscroll:(id)a3
{
  id v8 = a3;
  [v8 adjustedUnscaledAutoscrollPoint];
  double v5 = v4;
  double v7 = v6;
  -[CRLWPTextMagnifierRanged setAutoscrollDirections:](self->_magnifier, "setAutoscrollDirections:", [v8 directions]);
  -[CRLWPTextKnobTracker p_setSelectionFromPoint:](self, "p_setSelectionFromPoint:", v5, v7);
  -[CRLWPTextMagnifierRanged postAutoscrollPoint:](self->_magnifier, "postAutoscrollPoint:", v5, v7);
}

- (_TtC8Freeform11CRLWPEditor)textEditor
{
  return self->_textEditor;
}

- (void)setTextEditor:(id)a3
{
}

- (BOOL)didDragKnob
{
  return self->_didDragKnob;
}

- (BOOL)ignoreNextCall
{
  return self->_ignoreNextCall;
}

- (void)setIgnoreNextCall:(BOOL)a3
{
  self->_ignoreNextCall = a3;
}

- (CGPoint)magnificationPoint
{
  double x = self->_magnificationPoint.x;
  double y = self->_magnificationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  self->_magnificationPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnifier, 0);
  objc_storeStrong((id *)&self->_textMagnifierTimer, 0);

  objc_storeStrong((id *)&self->_textEditor, 0);
}

@end