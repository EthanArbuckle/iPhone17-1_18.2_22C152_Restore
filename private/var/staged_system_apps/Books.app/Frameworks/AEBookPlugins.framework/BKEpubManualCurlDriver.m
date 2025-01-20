@interface BKEpubManualCurlDriver
- (BKEpubManualCurlDriver)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 time:(double)a5;
- (BKEpubManualCurlGestureImplementation)gesture;
- (CADisplayLink)displayLink;
- (double)minimumGestureInterval;
- (id)manualCurlHandler;
- (void)_linkFired:(id)a3;
- (void)run:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setGesture:(id)a3;
- (void)setManualCurlHandler:(id)a3;
@end

@implementation BKEpubManualCurlDriver

- (BKEpubManualCurlDriver)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 time:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  v17.receiver = self;
  v17.super_class = (Class)BKEpubManualCurlDriver;
  v10 = [(BKEpubManualCurlDriver *)&v17 init];
  if (v10)
  {
    uint64_t v11 = +[CADisplayLink displayLinkWithTarget:v10 selector:"_linkFired:"];
    displayLink = v10->_displayLink;
    v10->_displayLink = (CADisplayLink *)v11;

    [(CADisplayLink *)v10->_displayLink heartbeatRate];
    v10->_minimumGestureInterval = v13 * 0.5;
    v14 = -[BKEpubManualCurlGestureImplementation initWithStartPoint:endPoint:duration:]([BKEpubManualCurlGestureImplementation alloc], "initWithStartPoint:endPoint:duration:", v9, v8, x, y, a5);
    gesture = v10->_gesture;
    v10->_gesture = v14;
  }
  return v10;
}

- (void)run:(id)a3
{
  [(BKEpubManualCurlDriver *)self setManualCurlHandler:a3];
  v4 = [(BKEpubManualCurlDriver *)self gesture];
  [v4 setState:1];

  double v5 = CACurrentMediaTime();
  v6 = [(BKEpubManualCurlDriver *)self gesture];
  [v6 setStartTime:v5];

  id v8 = [(BKEpubManualCurlDriver *)self displayLink];
  v7 = +[NSRunLoop mainRunLoop];
  [v8 addToRunLoop:v7 forMode:NSDefaultRunLoopMode];
}

- (void)_linkFired:(id)a3
{
  id v31 = a3;
  v4 = [(BKEpubManualCurlDriver *)self gesture];
  double v5 = (char *)[v4 state];

  [v31 targetTimestamp];
  double v7 = v6;
  id v8 = [(BKEpubManualCurlDriver *)self gesture];
  double v9 = v8;
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    [v8 setNextTime:v7];

    v10 = [(BKEpubManualCurlDriver *)self manualCurlHandler];
    uint64_t v11 = [(BKEpubManualCurlDriver *)self gesture];
    ((void (**)(void, void *))v10)[2](v10, v11);

    v12 = [(BKEpubManualCurlDriver *)self gesture];
    [v12 setState:2];
  }
  else
  {
    [v8 endTime];
    double v14 = v13;

    if (v7 <= v14)
    {
      [v31 targetTimestamp];
      double v20 = v19;
      v21 = [(BKEpubManualCurlDriver *)self gesture];
      [v21 nextTime];
      double v23 = v20 - v22;
      [(BKEpubManualCurlDriver *)self minimumGestureInterval];
      double v25 = v24;

      if (v23 >= v25)
      {
        [v31 targetTimestamp];
        double v27 = v26;
        v28 = [(BKEpubManualCurlDriver *)self gesture];
        [v28 setNextTime:v27];

        v29 = [(BKEpubManualCurlDriver *)self manualCurlHandler];
        v30 = [(BKEpubManualCurlDriver *)self gesture];
        ((void (**)(void, void *))v29)[2](v29, v30);
      }
    }
    else
    {
      v15 = [(BKEpubManualCurlDriver *)self gesture];
      [v15 setState:3];

      v16 = [(BKEpubManualCurlDriver *)self manualCurlHandler];
      ((void (**)(void, BKEpubManualCurlGestureImplementation *))v16)[2](v16, self->_gesture);

      [(BKEpubManualCurlDriver *)self setManualCurlHandler:0];
      objc_super v17 = [(BKEpubManualCurlDriver *)self displayLink];
      v18 = +[NSRunLoop mainRunLoop];
      [v17 removeFromRunLoop:v18 forMode:NSDefaultRunLoopMode];

      [(BKEpubManualCurlDriver *)self setDisplayLink:0];
    }
  }
}

- (BKEpubManualCurlGestureImplementation)gesture
{
  return self->_gesture;
}

- (void)setGesture:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (id)manualCurlHandler
{
  return self->_manualCurlHandler;
}

- (void)setManualCurlHandler:(id)a3
{
}

- (double)minimumGestureInterval
{
  return self->_minimumGestureInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_manualCurlHandler, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong((id *)&self->_gesture, 0);
}

@end