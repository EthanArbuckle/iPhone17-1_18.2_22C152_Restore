@interface ScrollTestProcessor
- (BOOL)performActionForPage:(id)a3;
- (BOOL)startPageAction:(id)a3;
- (BOOL)startedScrollTest;
- (ScrollTestProcessor)initWithTestName:(id)a3 browserController:(id)a4;
- (int)scrollDelta;
- (void)setScrollDelta:(int)a3;
- (void)setStartedScrollTest:(BOOL)a3;
@end

@implementation ScrollTestProcessor

- (ScrollTestProcessor)initWithTestName:(id)a3 browserController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ScrollTestProcessor;
  v4 = [(ContentInteractionTestRunner *)&v8 initWithTestName:a3 browserController:a4];
  v5 = v4;
  if (v4) {
    v6 = v4;
  }

  return v5;
}

- (BOOL)startPageAction:(id)a3
{
  id v4 = a3;
  [(ScrollTestProcessor *)self setStartedScrollTest:0];
  v6.receiver = self;
  v6.super_class = (Class)ScrollTestProcessor;
  LOBYTE(self) = [(ContentInteractionTestRunner *)&v6 startPageAction:v4];

  return (char)self;
}

- (BOOL)performActionForPage:(id)a3
{
  id v4 = [(ContentInteractionTestRunner *)self pageWebView];
  v5 = [v4 scrollView];

  if (![(ScrollTestProcessor *)self startedScrollTest])
  {
    [(ContentInteractionTestRunner *)self startTrackingFrameRate];
    uint64_t v6 = [(ContentInteractionTestRunner *)self iterations];
    if ([(ScrollTestProcessor *)self scrollDelta]) {
      uint64_t v7 = [(ScrollTestProcessor *)self scrollDelta];
    }
    else {
      uint64_t v7 = 10;
    }
    [v5 _performScrollTest:&stru_1F3C268E8 iterations:v6 delta:v7];
    [(ScrollTestProcessor *)self setStartedScrollTest:1];
  }
  char v8 = [v5 _isAnimatingScrollTest];
  if ((v8 & 1) == 0) {
    [(ContentInteractionTestRunner *)self endTrackingFrameRate];
  }

  return v8;
}

- (int)scrollDelta
{
  return *(_DWORD *)&self->_startedScrollTest;
}

- (void)setScrollDelta:(int)a3
{
  *(_DWORD *)&self->_startedScrollTest = a3;
}

- (BOOL)startedScrollTest
{
  return *((unsigned char *)&self->super._iterations + 4);
}

- (void)setStartedScrollTest:(BOOL)a3
{
  *((unsigned char *)&self->super._iterations + 4) = a3;
}

@end