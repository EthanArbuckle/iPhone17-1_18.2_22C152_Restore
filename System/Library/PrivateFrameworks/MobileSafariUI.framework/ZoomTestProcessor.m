@interface ZoomTestProcessor
- (BOOL)didFirstZoomStep;
- (BOOL)performActionForPage:(id)a3;
- (BOOL)startPageAction:(id)a3;
- (BOOL)updateWithNewScale;
- (BOOL)zoomingIn;
- (CADisplayLink)displayLink;
- (ZoomTestProcessor)initWithTestName:(id)a3 browserController:(id)a4;
- (int)iterationsRemaining;
- (int)stepsPerZoom;
- (int64_t)testState;
- (void)setDidFirstZoomStep:(BOOL)a3;
- (void)setDisplayLink:(id)a3;
- (void)setIterationsRemaining:(int)a3;
- (void)setStepsPerZoom:(int)a3;
- (void)setTestState:(int64_t)a3;
- (void)setZoomingIn:(BOOL)a3;
- (void)startZoomingTest;
- (void)zoomTestStep;
@end

@implementation ZoomTestProcessor

- (ZoomTestProcessor)initWithTestName:(id)a3 browserController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ZoomTestProcessor;
  v4 = [(ContentInteractionTestRunner *)&v8 initWithTestName:a3 browserController:a4];
  v5 = v4;
  if (v4)
  {
    [(ZoomTestProcessor *)v4 setTestState:0];
    v6 = v5;
  }

  return v5;
}

- (BOOL)startPageAction:(id)a3
{
  id v4 = a3;
  if (![(ZoomTestProcessor *)self stepsPerZoom]) {
    [(ZoomTestProcessor *)self setStepsPerZoom:50];
  }
  [(ZoomTestProcessor *)self setTestState:1];
  v7.receiver = self;
  v7.super_class = (Class)ZoomTestProcessor;
  BOOL v5 = [(ContentInteractionTestRunner *)&v7 startPageAction:v4];

  return v5;
}

- (BOOL)updateWithNewScale
{
  v3 = [(ContentInteractionTestRunner *)self pageWebView];
  id v4 = [v3 scrollView];

  [v4 minimumZoomScale];
  double v6 = v5;
  [v4 maximumZoomScale];
  double v8 = v7;
  [v4 zoomScale];
  double v10 = v9;
  double v11 = (v8 - v6) / (double)[(ZoomTestProcessor *)self stepsPerZoom];
  if ([(ZoomTestProcessor *)self zoomingIn])
  {
    double v12 = v10 + v11;
    if (v10 + v11 > v8)
    {
      -[ZoomTestProcessor setZoomingIn:](self, "setZoomingIn:", 0, v12);
LABEL_7:
      BOOL v13 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    double v12 = v10 - v11;
    if (v10 - v11 < v6)
    {
      -[ZoomTestProcessor setZoomingIn:](self, "setZoomingIn:", 1, v12);
      [(ZoomTestProcessor *)self setIterationsRemaining:[(ZoomTestProcessor *)self iterationsRemaining] - 1];
      goto LABEL_7;
    }
  }
  [v4 setZoomScale:v12];
  BOOL v13 = 1;
LABEL_8:

  return v13;
}

- (void)zoomTestStep
{
  if (![(ZoomTestProcessor *)self didFirstZoomStep])
  {
    [(ContentInteractionTestRunner *)self startTrackingFrameRate];
    [(ZoomTestProcessor *)self setDidFirstZoomStep:1];
  }
  while (![(ZoomTestProcessor *)self updateWithNewScale])
    ;
  int v3 = [(ZoomTestProcessor *)self iterationsRemaining];
  id v4 = [(ZoomTestProcessor *)self displayLink];
  double v5 = v4;
  if (v3)
  {

    if (!v5)
    {
      [(ZoomTestProcessor *)self performSelector:sel_zoomTestStep withObject:0 afterDelay:0.0];
    }
  }
  else
  {
    [v4 invalidate];

    [(ZoomTestProcessor *)self setTestState:3];
    [(ContentInteractionTestRunner *)self endTrackingFrameRate];
  }
}

- (void)startZoomingTest
{
  [(ZoomTestProcessor *)self setIterationsRemaining:[(ContentInteractionTestRunner *)self iterations]];
  [(ZoomTestProcessor *)self setZoomingIn:1];
  int v3 = getenv("CA_BENCHMARK");
  if (!v3 || strcmp(v3, "1"))
  {
    id v4 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel_zoomTestStep];
    [(ZoomTestProcessor *)self setDisplayLink:v4];

    double v5 = [(ZoomTestProcessor *)self displayLink];
    double v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];
  }
  double v7 = [(ZoomTestProcessor *)self displayLink];

  if (!v7)
  {
    [(ZoomTestProcessor *)self performSelector:sel_zoomTestStep withObject:0 afterDelay:0.0];
  }
}

- (BOOL)performActionForPage:(id)a3
{
  if ([(ZoomTestProcessor *)self testState] == 1)
  {
    [(ZoomTestProcessor *)self startZoomingTest];
    [(ZoomTestProcessor *)self setTestState:2];
  }
  return [(ZoomTestProcessor *)self testState] != 3;
}

- (int)stepsPerZoom
{
  return self->_stepsPerZoom;
}

- (void)setStepsPerZoom:(int)a3
{
  self->_stepsPerZoom = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (int)iterationsRemaining
{
  return self->_iterationsRemaining;
}

- (void)setIterationsRemaining:(int)a3
{
  self->_iterationsRemaining = a3;
}

- (int64_t)testState
{
  return self->_testState;
}

- (void)setTestState:(int64_t)a3
{
  self->_testState = a3;
}

- (BOOL)didFirstZoomStep
{
  return self->_didFirstZoomStep;
}

- (void)setDidFirstZoomStep:(BOOL)a3
{
  self->_didFirstZoomStep = a3;
}

- (BOOL)zoomingIn
{
  return self->_zoomingIn;
}

- (void)setZoomingIn:(BOOL)a3
{
  self->_zoomingIn = a3;
}

- (void).cxx_destruct
{
}

@end