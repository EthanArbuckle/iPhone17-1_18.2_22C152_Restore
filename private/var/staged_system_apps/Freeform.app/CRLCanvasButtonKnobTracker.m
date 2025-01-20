@interface CRLCanvasButtonKnobTracker
- (BOOL)allowHUDToDisplay;
- (BOOL)operationShouldBeDynamic;
- (BOOL)p_knobContainsCurrentPosition;
- (BOOL)shouldHideOtherKnobs;
- (BOOL)shouldHideSelectionHighlight;
- (BOOL)traceIfDesiredForBeginOperation;
- (BOOL)traceIfDesiredForEndOperation;
- (CRLCanvasButtonKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (SEL)action;
- (id)target;
- (void)endMovingKnob;
- (void)moveKnobToRepPosition:(CGPoint)a3;
- (void)setAction:(SEL)a3;
- (void)setTarget:(id)a3;
@end

@implementation CRLCanvasButtonKnobTracker

- (CRLCanvasButtonKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6FF0);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AE128(v8, v9);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7010);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v10, v8);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasButtonKnobTracker initWithRep:knob:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasButtonKnobTracker.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:27 isFatal:0 description:"button knob tracker made without a button knob"];
  }
  v15.receiver = self;
  v15.super_class = (Class)CRLCanvasButtonKnobTracker;
  v13 = [(CRLCanvasKnobTracker *)&v15 initWithRep:v6 knob:v7];

  return v13;
}

- (BOOL)allowHUDToDisplay
{
  return 0;
}

- (BOOL)operationShouldBeDynamic
{
  return 0;
}

- (BOOL)shouldHideOtherKnobs
{
  return 0;
}

- (BOOL)shouldHideSelectionHighlight
{
  return 0;
}

- (BOOL)p_knobContainsCurrentPosition
{
  v2 = self;
  v3 = [(CRLCanvasKnobTracker *)self knob];
  [(CRLCanvasKnobTracker *)v2 currentPosition];
  LOBYTE(v2) = [v3 isHitByUnscaledPoint:1 inputType:];

  return (char)v2;
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  uint64_t v4 = objc_opt_class();
  v5 = [(CRLCanvasKnobTracker *)self knob];
  sub_1002469D0(v4, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if ([v6 isEnabled]) {
    [v6 setHighlighted:[self p_knobContainsCurrentPosition]];
  }
}

- (void)endMovingKnob
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(CRLCanvasKnobTracker *)self knob];
  v5 = sub_1002469D0(v3, v4);

  [v5 setHighlighted:0];
  id v6 = self;
  if ([v5 isEnabled]
    && [(CRLCanvasButtonKnobTracker *)v6 p_knobContainsCurrentPosition])
  {
    id v7 = [(CRLCanvasButtonKnobTracker *)v6 target];
    [v7 action:[v6 action]];
  }
  v8.receiver = v6;
  v8.super_class = (Class)CRLCanvasButtonKnobTracker;
  [(CRLCanvasKnobTracker *)&v8 endMovingKnob];
}

- (BOOL)traceIfDesiredForBeginOperation
{
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014F7030);
  }
  v2 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "begin button knob interaction", v4, 2u);
  }
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014F7050);
  }
  v2 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "end button knob interaction", v4, 2u);
  }
  return 1;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->mTarget);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->mAction) {
    return self->mAction;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = 0;
  }
  self->mAction = v3;
}

- (void).cxx_destruct
{
}

@end