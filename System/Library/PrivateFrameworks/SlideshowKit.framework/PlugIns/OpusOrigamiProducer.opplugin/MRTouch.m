@interface MRTouch
+ (id)touchWithLocation:(CGPoint)a3 timestamp:(double)a4 tapCount:(unint64_t)a5;
+ (id)touchWithUITouch:(id)a3 inView:(id)a4;
- (CGPoint)location;
- (MRTouch)initWithUITouch:(id)a3 inView:(id)a4;
- (NSArray)gestureRecognizers;
- (double)timestamp;
- (id)description;
- (int)phase;
- (unint64_t)tapCount;
- (void)addGestureRecognizer:(id)a3;
- (void)dealloc;
- (void)removeGestureRecognizer:(id)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setPhase:(int)a3;
- (void)setTapCount:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation MRTouch

+ (id)touchWithLocation:(CGPoint)a3 timestamp:(double)a4 tapCount:(unint64_t)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v9 = objc_alloc_init(MRTouch);
  v9->_location.CGFloat x = x;
  v9->_location.CGFloat y = y;
  v9->_timestamp = a4;
  v9->_tapCount = a5;
  v9->_phase = 0;
  return v9;
}

- (MRTouch)initWithUITouch:(id)a3 inView:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)MRTouch;
  v6 = [(MRTouch *)&v15 init];
  if (v6)
  {
    [a3 locationInView:a4];
    v6->_location.CGFloat x = v7;
    v6->_location.CGFloat y = v8;
    [a4 contentScaleFactor];
    v6->_location.CGFloat x = v9 * v6->_location.x;
    [a4 bounds];
    double v11 = v10 - v6->_location.y;
    [a4 contentScaleFactor];
    v6->_location.CGFloat y = v12 * v11;
    [a3 timestamp];
    v6->_timestamp = v13;
    v6->_tapCount = (unint64_t)[a3 tapCount];
    v6->_phase = [a3 phase];
  }
  return v6;
}

+ (id)touchWithUITouch:(id)a3 inView:(id)a4
{
  v4 = [[MRTouch alloc] initWithUITouch:a3 inView:a4];
  return v4;
}

- (void)dealloc
{
  self->_gestureRecognizers = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRTouch;
  [(MRTouch *)&v3 dealloc];
}

- (NSArray)gestureRecognizers
{
  return +[NSArray arrayWithArray:self->_gestureRecognizers];
}

- (void)addGestureRecognizer:(id)a3
{
  gestureRecognizers = self->_gestureRecognizers;
  if (!gestureRecognizers)
  {
    gestureRecognizers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_gestureRecognizers = gestureRecognizers;
  }
  [(NSMutableArray *)gestureRecognizers addObject:a3];
}

- (void)removeGestureRecognizer:(id)a3
{
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)MRTouch;
  id v3 = [(MRTouch *)&v6 description];
  unsigned int phase = self->_phase;
  if (phase >= 5) {
    unsigned int phase = 5;
  }
  return [v3 stringByAppendingFormat:@" location=(%f,%f), timestamp=%f, tapCount=%d, phase=%@, numberOfGestureRecognizers=%d", *(_OWORD *)&self->_location, *(void *)&self->_timestamp, self->_tapCount, off_1AB058[phase], -[NSMutableArray count](self->_gestureRecognizers, "count")];
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)tapCount
{
  return self->_tapCount;
}

- (void)setTapCount:(unint64_t)a3
{
  self->_tapCount = a3;
}

- (int)phase
{
  return self->_phase;
}

- (void)setPhase:(int)a3
{
  self->_unsigned int phase = a3;
}

@end