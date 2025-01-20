@interface CRLWPLongPressGestureRecognizer
- (BOOL)didSendReset;
- (CGPoint)previousPosition;
- (double)previousTimestamp;
- (double)velocity;
- (int64_t)inputType;
- (void)reset;
- (void)setDidSendReset:(BOOL)a3;
- (void)setInputType:(int64_t)a3;
- (void)setPreviousPosition:(CGPoint)a3;
- (void)setPreviousTimestamp:(double)a3;
- (void)setVelocity:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CRLWPLongPressGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CRLWPLongPressGestureRecognizer *)self setDidSendReset:0];
  [(CRLWPLongPressGestureRecognizer *)self setPreviousTimestamp:CFAbsoluteTimeGetCurrent()];
  v13.receiver = self;
  v13.super_class = (Class)CRLWPLongPressGestureRecognizer;
  [(CRLWPLongPressGestureRecognizer *)&v13 touchesBegan:v7 withEvent:v6];
  v8 = [v7 anyObject];

  v9 = [(CRLWPLongPressGestureRecognizer *)self view];
  [v8 locationInView:v9];
  -[CRLWPLongPressGestureRecognizer setPreviousPosition:](self, "setPreviousPosition:");

  BOOL v10 = 0;
  if ((unint64_t)[(CRLWPLongPressGestureRecognizer *)self numberOfTouchesRequired] <= 1)
  {
    v11 = [v6 allTouches];
    BOOL v10 = (unint64_t)[v11 count] > 1;
  }
  id v12 = [v8 tapCount];
  -[CRLWPLongPressGestureRecognizer setInputType:](self, "setInputType:", sub_10036FEA4((BOOL)[v8 type]));
  if (((unint64_t)v12 > 1 || v10) && [(CRLWPLongPressGestureRecognizer *)self state] != (id)5) {
    [(CRLWPLongPressGestureRecognizer *)self setState:5];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  [(CRLWPLongPressGestureRecognizer *)self previousTimestamp];
  double v10 = Current - v9;
  [(CRLWPLongPressGestureRecognizer *)self setPreviousTimestamp:Current];
  v11 = [v6 anyObject];
  id v12 = [(CRLWPLongPressGestureRecognizer *)self view];
  [v11 locationInView:v12];
  double v14 = v13;
  double v16 = v15;

  [(CRLWPLongPressGestureRecognizer *)self previousPosition];
  double v18 = v17;
  double v20 = v19;
  -[CRLWPLongPressGestureRecognizer setPreviousPosition:](self, "setPreviousPosition:", v14, v16);
  if (v10 <= 0.0)
  {
    int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFC40);
    }
    v23 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E09C(v22, v23);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFC60);
    }
    v24 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v24, v22);
    }
    v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPLongPressGestureRecognizer touchesMoved:withEvent:]");
    v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPLongPressGestureRecognizer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:56 isFatal:0 description:"Time travel should have had a non-zero value here"];

    double v21 = 0.0;
  }
  else
  {
    double v21 = sub_1000653B4(v18, v20, v14, v16) / v10;
  }
  [(CRLWPLongPressGestureRecognizer *)self setVelocity:v21];
  v27.receiver = self;
  v27.super_class = (Class)CRLWPLongPressGestureRecognizer;
  [(CRLWPLongPressGestureRecognizer *)&v27 touchesMoved:v6 withEvent:v7];
}

- (void)reset
{
  v11.receiver = self;
  v11.super_class = (Class)CRLWPLongPressGestureRecognizer;
  [(CRLWPLongPressGestureRecognizer *)&v11 reset];
  if (![(CRLWPLongPressGestureRecognizer *)self didSendReset])
  {
    v3 = [(CRLWPLongPressGestureRecognizer *)self delegate];
    double v10 = sub_100246AC8(v3, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLGestureDelegate);

    [v10 didReset:self];
    [(CRLWPLongPressGestureRecognizer *)self setDidSendReset:1];
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

@end