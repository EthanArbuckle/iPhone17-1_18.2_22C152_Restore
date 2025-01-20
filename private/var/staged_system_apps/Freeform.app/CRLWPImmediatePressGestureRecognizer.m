@interface CRLWPImmediatePressGestureRecognizer
- (BOOL)didSendReset;
- (BOOL)disallowOptionKey;
- (CGPoint)initialPosition;
- (CGPoint)previousPosition;
- (UIView)canvasView;
- (double)previousTimestamp;
- (double)velocity;
- (int64_t)inputType;
- (void)reset;
- (void)setCanvasView:(id)a3;
- (void)setDidSendReset:(BOOL)a3;
- (void)setDisallowOptionKey:(BOOL)a3;
- (void)setInitialPosition:(CGPoint)a3;
- (void)setInputType:(int64_t)a3;
- (void)setPreviousPosition:(CGPoint)a3;
- (void)setPreviousTimestamp:(double)a3;
- (void)setVelocity:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CRLWPImmediatePressGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CRLWPImmediatePressGestureRecognizer *)self setDidSendReset:0];
  [(CRLWPImmediatePressGestureRecognizer *)self setPreviousTimestamp:CFAbsoluteTimeGetCurrent()];
  v14.receiver = self;
  v14.super_class = (Class)CRLWPImmediatePressGestureRecognizer;
  [(CRLWPImmediatePressGestureRecognizer *)&v14 touchesBegan:v7 withEvent:v6];

  v8 = [v7 anyObject];

  v9 = [(CRLWPImmediatePressGestureRecognizer *)self canvasView];

  if (v9) {
    [(CRLWPImmediatePressGestureRecognizer *)self canvasView];
  }
  else {
  v10 = [(CRLWPImmediatePressGestureRecognizer *)self view];
  }
  [v8 locationInView:v10];
  -[CRLWPImmediatePressGestureRecognizer setPreviousPosition:](self, "setPreviousPosition:");

  id v11 = [v8 tapCount];
  -[CRLWPImmediatePressGestureRecognizer setInputType:](self, "setInputType:", sub_10036FEA4((BOOL)[v8 type]));
  id v12 = [(CRLWPImmediatePressGestureRecognizer *)self state];
  if ((unint64_t)v11 < 2)
  {
    if ((uint64_t)v12 <= 0)
    {
      [(CRLWPImmediatePressGestureRecognizer *)self previousPosition];
      -[CRLWPImmediatePressGestureRecognizer setInitialPosition:](self, "setInitialPosition:");
      if (([(CRLWPImmediatePressGestureRecognizer *)self modifierFlags] & 0x20000) != 0)
      {
        uint64_t v13 = 1;
        goto LABEL_13;
      }
      if ([(CRLWPImmediatePressGestureRecognizer *)self disallowOptionKey]
        && ([(CRLWPImmediatePressGestureRecognizer *)self modifierFlags] & 0x80000) != 0)
      {
LABEL_6:
        uint64_t v13 = 5;
LABEL_13:
        [(CRLWPImmediatePressGestureRecognizer *)self setState:v13];
      }
    }
  }
  else if (v12 != (id)5)
  {
    goto LABEL_6;
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  [(CRLWPImmediatePressGestureRecognizer *)self previousTimestamp];
  double v10 = Current - v9;
  [(CRLWPImmediatePressGestureRecognizer *)self setPreviousTimestamp:Current];
  id v11 = [v6 anyObject];
  id v12 = [(CRLWPImmediatePressGestureRecognizer *)self view];
  [v11 locationInView:v12];
  double v14 = v13;
  double v16 = v15;

  [(CRLWPImmediatePressGestureRecognizer *)self previousPosition];
  double v18 = v17;
  double v20 = v19;
  -[CRLWPImmediatePressGestureRecognizer setPreviousPosition:](self, "setPreviousPosition:", v14, v16);
  if (v10 <= 0.0)
  {
    int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD748);
    }
    v23 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B8A44(v22, v23);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD768);
    }
    v24 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v24, v22);
    }
    v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPImmediatePressGestureRecognizer touchesMoved:withEvent:]");
    v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPImmediatePressGestureRecognizer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:75 isFatal:0 description:"Time travel should have had a non-zero value here"];

    double v21 = 0.0;
  }
  else
  {
    double v21 = sub_1000653B4(v18, v20, v14, v16) / v10;
  }
  [(CRLWPImmediatePressGestureRecognizer *)self setVelocity:v21];
  v27.receiver = self;
  v27.super_class = (Class)CRLWPImmediatePressGestureRecognizer;
  [(CRLWPImmediatePressGestureRecognizer *)&v27 touchesMoved:v6 withEvent:v7];
}

- (void)reset
{
  v11.receiver = self;
  v11.super_class = (Class)CRLWPImmediatePressGestureRecognizer;
  [(CRLWPImmediatePressGestureRecognizer *)&v11 reset];
  if (![(CRLWPImmediatePressGestureRecognizer *)self didSendReset])
  {
    v3 = [(CRLWPImmediatePressGestureRecognizer *)self delegate];
    double v10 = sub_100246AC8(v3, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLGestureDelegate);

    [v10 didReset:self];
    [(CRLWPImmediatePressGestureRecognizer *)self setDidSendReset:1];
  }
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (CGPoint)initialPosition
{
  double x = self->_initialPosition.x;
  double y = self->_initialPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialPosition:(CGPoint)a3
{
  self->_initialPosition = a3;
}

- (UIView)canvasView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);

  return (UIView *)WeakRetained;
}

- (void)setCanvasView:(id)a3
{
}

- (BOOL)disallowOptionKey
{
  return self->_disallowOptionKey;
}

- (void)setDisallowOptionKey:(BOOL)a3
{
  self->_disallowOptionKedouble y = a3;
}

- (BOOL)didSendReset
{
  return self->_didSendReset;
}

- (void)setDidSendReset:(BOOL)a3
{
  self->_didSendReset = a3;
}

- (double)previousTimestamp
{
  return self->_previousTimestamp;
}

- (void)setPreviousTimestamp:(double)a3
{
  self->_previousTimestamp = a3;
}

- (CGPoint)previousPosition
{
  double x = self->_previousPosition.x;
  double y = self->_previousPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousPosition:(CGPoint)a3
{
  self->_previousPosition = a3;
}

- (void).cxx_destruct
{
}

@end