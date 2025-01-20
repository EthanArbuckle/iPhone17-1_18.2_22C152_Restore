@interface CRLCanvasKnobTracker
- (BOOL)allowHUDToDisplay;
- (BOOL)didBegin;
- (BOOL)didDrag;
- (BOOL)dragEnding;
- (BOOL)endedOperationDueToESC;
- (BOOL)i_shouldForceDrag;
- (BOOL)isInspectorDrivenTracking;
- (BOOL)operationShouldBeDynamic;
- (BOOL)shouldEndMovingKnobOnESC;
- (BOOL)shouldHideOtherKnobs;
- (BOOL)shouldHideSelectionHighlight;
- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3;
- (BOOL)shouldUseKnobOffset;
- (BOOL)supportsAlignmentGuides;
- (BOOL)traceIfDesiredForBeginOperation;
- (BOOL)traceIfDesiredForEndOperation;
- (BOOL)wantsAutoscroll;
- (CGAffineTransform)transformInRootForStandardKnobs;
- (CGPoint)convertKnobPositionFromUnscaledCanvas:(CGPoint)a3;
- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3;
- (CGPoint)currentPosition;
- (CGPoint)knobOffset;
- (CGRect)currentBoundsForStandardKnobs;
- (CRLCanvasAutoscroll)autoscroll;
- (CRLCanvasKnob)knob;
- (CRLCanvasKnobTracker)init;
- (CRLCanvasKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (CRLCanvasRep)rep;
- (CRLInteractiveCanvasController)icc;
- (NSSet)repsToTransform;
- (double)delay;
- (double)unscaledStartAutoscrollThreshold;
- (id)repsToHide;
- (int)allowedAutoscrollDirections;
- (int64_t)inputType;
- (unint64_t)enabledKnobMask;
- (void)beginMovingKnob;
- (void)changeDynamicLayoutsForReps:(id)a3;
- (void)commitChangesForReps:(id)a3;
- (void)dealloc;
- (void)endMovingKnob;
- (void)i_resetCurrentPositionToKnobPositionIfAppropriate;
- (void)i_setKnobOffset:(CGPoint)a3;
- (void)moveKnobToCanvasPosition:(CGPoint)a3;
- (void)setAutoscroll:(id)a3;
- (void)setCurrentPosition:(CGPoint)a3;
- (void)setDidDrag:(BOOL)a3;
- (void)setDragEnding:(BOOL)a3;
- (void)setInputType:(int64_t)a3;
- (void)setIsInspectorDrivenTracking:(BOOL)a3;
- (void)setKnob:(id)a3;
- (void)setRep:(id)a3;
- (void)willEndMovingKnobDueToESC;
@end

@implementation CRLCanvasKnobTracker

- (CRLCanvasKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRLCanvasKnobTracker;
  v8 = [(CRLCanvasKnobTracker *)&v16 init];
  if (v8)
  {
    if (v6)
    {
      if (v7)
      {
LABEL_23:
        [(CRLCanvasKnobTracker *)v8 setKnob:v7];
        [(CRLCanvasKnobTracker *)v8 setRep:v6];
        v8->_inputType = 1;
        goto LABEL_24;
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DE8F8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101085970();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DE918);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v9);
      }
      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasKnobTracker initWithRep:knob:]");
      v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasKnobTracker.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 43, 0, "invalid nil value for '%{public}s'", "rep");

      if (v7) {
        goto LABEL_23;
      }
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE938);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010858C0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE958);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasKnobTracker initWithRep:knob:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasKnobTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 44, 0, "invalid nil value for '%{public}s'", "knob");

    goto LABEL_23;
  }
LABEL_24:

  return v8;
}

- (CRLCanvasKnobTracker)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasKnobTracker;
  return [(CRLCanvasKnobTracker *)&v3 init];
}

- (void)dealloc
{
  objc_super v3 = [(CRLCanvasRep *)self->_rep currentKnobTracker];

  if (v3 == self) {
    [(CRLCanvasRep *)self->_rep setCurrentKnobTracker:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasKnobTracker;
  [(CRLCanvasKnobTracker *)&v4 dealloc];
}

- (void)setRep:(id)a3
{
  v5 = (CRLCanvasRep *)a3;
  rep = self->_rep;
  if (rep != v5)
  {
    v8 = v5;
    id v7 = [(CRLCanvasRep *)rep currentKnobTracker];

    if (v7 == self) {
      [(CRLCanvasRep *)self->_rep setCurrentKnobTracker:0];
    }
    objc_storeStrong((id *)&self->_rep, a3);
    [(CRLCanvasRep *)self->_rep setCurrentKnobTracker:self];
    v5 = v8;
  }
}

- (CRLInteractiveCanvasController)icc
{
  return [(CRLCanvasRep *)self->_rep interactiveCanvasController];
}

- (NSSet)repsToTransform
{
  return +[NSSet setWithObject:self->_rep];
}

- (double)delay
{
  return 0.0;
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(CRLCanvasKnobTracker *)self rep];
  if (v6)
  {
    id v7 = v6;
    [v6 convertNaturalPointFromUnscaledCanvas:x, y];
    -[CRLCanvasKnobTracker moveKnobToRepPosition:](self, "moveKnobToRepPosition:");
    id v6 = v7;
  }
}

- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = [(CRLCanvasKnobTracker *)self rep];
  [v5 convertNaturalPointToUnscaledCanvas:x, y];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGPoint)convertKnobPositionFromUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = [(CRLCanvasKnobTracker *)self rep];
  [v5 convertNaturalPointFromUnscaledCanvas:x, y];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)beginMovingKnob
{
  self->_didBegin = 1;
}

- (void)endMovingKnob
{
  objc_super v3 = [(CRLCanvasRep *)self->_rep currentKnobTracker];

  if (v3 == self)
  {
    rep = self->_rep;
    [(CRLCanvasRep *)rep setCurrentKnobTracker:0];
  }
}

- (CGRect)currentBoundsForStandardKnobs
{
  [(CRLCanvasRep *)self->_rep boundsForStandardKnobs];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGAffineTransform)transformInRootForStandardKnobs
{
  double v4 = [(CRLCanvasRep *)self->_rep layout];
  if (v4)
  {
    double v6 = v4;
    [v4 transformInRoot];
    double v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (unint64_t)enabledKnobMask
{
  if (![(CRLCanvasKnobTracker *)self shouldHideOtherKnobs]) {
    return -1;
  }
  double v3 = [(CRLCanvasKnobTracker *)self knob];
  unint64_t v4 = sub_1002893CC((char)[v3 tag]);

  return v4;
}

- (BOOL)shouldHideOtherKnobs
{
  return 1;
}

- (BOOL)shouldHideSelectionHighlight
{
  return 1;
}

- (BOOL)allowHUDToDisplay
{
  return [(CRLCanvasKnobTracker *)self inputType] != 0;
}

- (BOOL)shouldUseKnobOffset
{
  return 1;
}

- (BOOL)shouldEndMovingKnobOnESC
{
  return 0;
}

- (void)willEndMovingKnobDueToESC
{
  self->_endedOperationDueToESC = 1;
}

- (void)i_setKnobOffset:(CGPoint)a3
{
  self->_knobOffset = a3;
}

- (void)i_resetCurrentPositionToKnobPositionIfAppropriate
{
  if (![(CRLCanvasKnobTracker *)self didDrag] && [(CRLCanvasKnobTracker *)self dragEnding])
  {
    id v4 = [(CRLCanvasKnobTracker *)self rep];
    double v3 = [(CRLCanvasKnobTracker *)self knob];
    [v3 position];
    [v4 convertNaturalPointToUnscaledCanvas:];
    -[CRLCanvasKnobTracker setCurrentPosition:](self, "setCurrentPosition:");
  }
}

- (BOOL)i_shouldForceDrag
{
  return 0;
}

- (BOOL)wantsAutoscroll
{
  return 1;
}

- (double)unscaledStartAutoscrollThreshold
{
  return 20.0;
}

- (int)allowedAutoscrollDirections
{
  return 15;
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  [(CRLCanvasKnobTracker *)self i_resetCurrentPositionToKnobPositionIfAppropriate];
  BOOL didBegin = self->_didBegin;
  if (!self->_didBegin)
  {
    self->_BOOL didBegin = 1;
    [(CRLCanvasKnobTracker *)self beginMovingKnob];
  }
  if ([(CRLCanvasKnobTracker *)self didDrag] || [(CRLCanvasKnobTracker *)self dragEnding])
  {
LABEL_7:
    if (didBegin) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  double v5 = [(CRLCanvasKnobTracker *)self knob];
  [v5 position];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(CRLCanvasKnobTracker *)self rep];
  [(CRLCanvasKnobTracker *)self currentPosition];
  [v10 convertNaturalPointFromUnscaledCanvas:];
  if (sub_100064084(v7, v9, v11, v12))
  {
    unsigned int v13 = [(CRLCanvasKnobTracker *)self i_shouldForceDrag];

    if (!v13) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  [(CRLCanvasKnobTracker *)self setDidDrag:1];
  if (didBegin)
  {
LABEL_8:
    if (![(CRLCanvasKnobTracker *)self didDrag]) {
      return;
    }
  }
LABEL_9:
  [(CRLCanvasKnobTracker *)self currentPosition];

  -[CRLCanvasKnobTracker moveKnobToCanvasPosition:](self, "moveKnobToCanvasPosition:");
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (void)commitChangesForReps:(id)a3
{
  if (self->_didBegin) {
    [(CRLCanvasKnobTracker *)self endMovingKnob];
  }
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)traceIfDesiredForBeginOperation
{
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  return 1;
}

- (id)repsToHide
{
  double v3 = objc_opt_new();
  id v4 = [(CRLCanvasKnobTracker *)self rep];
  double v5 = [v4 parentRep];

  double v6 = [v5 layout];
  double v7 = [(CRLCanvasKnobTracker *)self rep];
  double v8 = [v7 layout];
  unsigned int v9 = [v6 childLayoutIsCurrentlyHiddenWhileManipulating:v8];

  if (v9)
  {
    double v10 = [(CRLCanvasKnobTracker *)self rep];
    uint64_t v11 = +[NSSet setWithObject:v10];

    double v3 = (void *)v11;
  }

  return v3;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (CRLCanvasRep)rep
{
  return self->_rep;
}

- (BOOL)isInspectorDrivenTracking
{
  return self->_isInspectorDrivenTracking;
}

- (void)setIsInspectorDrivenTracking:(BOOL)a3
{
  self->_isInspectorDrivenTracking = a3;
}

- (CRLCanvasKnob)knob
{
  return self->_knob;
}

- (void)setKnob:(id)a3
{
}

- (BOOL)didBegin
{
  return self->_didBegin;
}

- (BOOL)didDrag
{
  return self->_didDrag;
}

- (void)setDidDrag:(BOOL)a3
{
  self->_didDrag = a3;
}

- (CGPoint)currentPosition
{
  double x = self->_currentPosition.x;
  double y = self->_currentPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentPosition:(CGPoint)a3
{
  self->_currentPosition = a3;
}

- (BOOL)dragEnding
{
  return self->_dragEnding;
}

- (void)setDragEnding:(BOOL)a3
{
  self->_dragEnding = a3;
}

- (BOOL)endedOperationDueToESC
{
  return self->_endedOperationDueToESC;
}

- (CGPoint)knobOffset
{
  double x = self->_knobOffset.x;
  double y = self->_knobOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CRLCanvasAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (void)setAutoscroll:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_storeStrong((id *)&self->_knob, 0);

  objc_storeStrong((id *)&self->_rep, 0);
}

@end