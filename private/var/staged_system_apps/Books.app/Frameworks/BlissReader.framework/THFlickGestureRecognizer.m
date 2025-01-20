@interface THFlickGestureRecognizer
- (CGPoint)initialLocationInView:(id)a3;
- (CGPoint)translationInView:(id)a3;
- (THFlickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)dealloc;
- (void)p_invalidateTimer;
- (void)p_killTimerFired:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation THFlickGestureRecognizer

- (THFlickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THFlickGestureRecognizer;
  return [(THFlickGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
}

- (void)dealloc
{
  [(THFlickGestureRecognizer *)self p_invalidateTimer];
  v3.receiver = self;
  v3.super_class = (Class)THFlickGestureRecognizer;
  [(THFlickGestureRecognizer *)&v3 dealloc];
}

- (CGPoint)initialLocationInView:(id)a3
{
  double x = self->_startLocation.x;
  double y = self->_startLocation.y;
  id v6 = [self view].window;

  [a3 convertPoint:v6 fromView:x, y];
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  [a3 convertPoint:[-[THFlickGestureRecognizer view](self, "view") window] fromView:self->_startLocation.x, self->_startLocation.y];
  [a3 convertPoint:[-[THFlickGestureRecognizer view](self, "view") window] fromView:self->_endLocation.x, self->_endLocation.y];

  TSDSubtractPoints();
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if ((unint64_t)[a3 count] < 2 || -[THFlickGestureRecognizer state](self, "state"))
  {
    objc_msgSend(objc_msgSend(a3, "anyObject"), "locationInView:", objc_msgSend(-[THFlickGestureRecognizer view](self, "view"), "window"));
    self->_startLocation.double x = v6;
    self->_startLocation.double y = v7;
    +[NSDate timeIntervalSinceReferenceDate];
    self->_startInterval = v8;
    self->_endLocation = self->_startLocation;
    self->_endInterval = self->_startInterval;
    self->_killTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"p_killTimerFired:" selector:0 userInfo:0 repeats:0.15];
  }
  else
  {
    [(THFlickGestureRecognizer *)self setState:5];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_msgSend(objc_msgSend(a3, "anyObject"), "locationInView:", objc_msgSend(-[THFlickGestureRecognizer view](self, "view"), "window"));
  self->_endLocation.double x = v5;
  self->_endLocation.double y = v6;
  +[NSDate timeIntervalSinceReferenceDate];
  self->_endInterval = v7;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  [(THFlickGestureRecognizer *)self p_invalidateTimer];
  if (![(THFlickGestureRecognizer *)self state])
  {
    [(THFlickGestureRecognizer *)self translationInView:[(THFlickGestureRecognizer *)self view]];
    TSDPointLength();
    if (v5 <= 25.0) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = 3;
    }
    [(THFlickGestureRecognizer *)self setState:v6];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (![(THFlickGestureRecognizer *)self state])
  {
    [(THFlickGestureRecognizer *)self setState:4];
  }
}

- (void)p_invalidateTimer
{
  self->_killTimer = 0;
}

- (void)p_killTimerFired:(id)a3
{
  if (![(THFlickGestureRecognizer *)self state])
  {
    [(THFlickGestureRecognizer *)self setState:5];
    [(THFlickGestureRecognizer *)self p_invalidateTimer];
  }
}

@end