@interface _UIGestureStudyMetricsGestureRecognizer
- (BOOL)_affectedByGesture:(id)a3;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)originalPosition;
- (NSString)eventName;
- (UITouch)primaryTouch;
- (_UIGestureStudyMetricsGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)allowableMovement;
- (double)duration;
- (double)movement;
- (double)startTimestamp;
- (int64_t)observedTouchCount;
- (void)reset;
- (void)setAllowableMovement:(double)a3;
- (void)setOriginalPosition:(CGPoint)a3;
- (void)setPrimaryTouch:(id)a3;
- (void)setStartTimestamp:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _UIGestureStudyMetricsGestureRecognizer

- (_UIGestureStudyMetricsGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIGestureStudyMetricsGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UIGestureRecognizer *)v4 setName:@"gesture-study-press-duration"];
    [(UIGestureRecognizer *)v5 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v5 setDelaysTouchesEnded:0];
    [(UIGestureRecognizer *)v5 _setAcceptsFailureRequiments:0];
    [(_UIGestureStudyMetricsGestureRecognizer *)v5 setAllowableMovement:0.0];
  }
  return v5;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  v5 = [(_UIGestureStudyMetricsGestureRecognizer *)self primaryTouch];
  [v5 locationInView:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  self->_observedTouchCount += [v7 count];
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    v5 = [v7 anyObject];
    [(_UIGestureStudyMetricsGestureRecognizer *)self setPrimaryTouch:v5];

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[_UIGestureStudyMetricsGestureRecognizer setStartTimestamp:](self, "setStartTimestamp:");
    double v6 = [(UIGestureRecognizer *)self view];
    [(_UIGestureStudyMetricsGestureRecognizer *)self locationInView:v6];
    -[_UIGestureStudyMetricsGestureRecognizer setOriginalPosition:](self, "setOriginalPosition:");

    [(UIGestureRecognizer *)self setState:1];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  double v6 = [(_UIGestureStudyMetricsGestureRecognizer *)self primaryTouch];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    [(UIGestureRecognizer *)self setState:3];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  double v6 = [(_UIGestureStudyMetricsGestureRecognizer *)self primaryTouch];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    [(UIGestureRecognizer *)self setState:4];
  }
}

- (void)reset
{
  self->_observedTouchCount = 0;
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)@"none";
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  id v5 = [(UIGestureRecognizer *)self view];
  [(_UIGestureStudyMetricsGestureRecognizer *)self locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(UIGestureRecognizer *)self view];
  objc_msgSend(v10, "convertPoint:toCoordinateSpace:", v4, v7, v9);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (double)duration
{
  [(_UIGestureStudyMetricsGestureRecognizer *)self startTimestamp];
  double v4 = v3;
  double result = 978307200.0;
  if (v4 < 978307200.0)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v7 = v6;
    [(_UIGestureStudyMetricsGestureRecognizer *)self startTimestamp];
    return v7 - v8;
  }
  return result;
}

- (double)movement
{
  double v3 = [(UIGestureRecognizer *)self view];
  [(_UIGestureStudyMetricsGestureRecognizer *)self locationInView:v3];
  double v5 = v4;
  double v7 = v6;

  [(_UIGestureStudyMetricsGestureRecognizer *)self originalPosition];
  return sqrt((v8 - v5) * (v8 - v5) + (v9 - v7) * (v9 - v7));
}

- (int64_t)observedTouchCount
{
  return self->_observedTouchCount;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (CGPoint)originalPosition
{
  double x = self->_originalPosition.x;
  double y = self->_originalPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalPosition:(CGPoint)a3
{
  self->_originalPosition = a3;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (UITouch)primaryTouch
{
  return self->_primaryTouch;
}

- (void)setPrimaryTouch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end