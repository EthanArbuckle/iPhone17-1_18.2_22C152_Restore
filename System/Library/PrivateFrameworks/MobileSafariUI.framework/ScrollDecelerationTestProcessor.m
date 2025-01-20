@interface ScrollDecelerationTestProcessor
- (BOOL)performActionForPage:(id)a3;
- (BOOL)startPageAction:(id)a3;
- (ScrollDecelerationTestProcessor)initWithTestName:(id)a3 browserController:(id)a4;
- (int)iterationsRemaining;
- (int64_t)state;
- (void)setIterationsRemaining:(int)a3;
- (void)setState:(int64_t)a3;
@end

@implementation ScrollDecelerationTestProcessor

- (ScrollDecelerationTestProcessor)initWithTestName:(id)a3 browserController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ScrollDecelerationTestProcessor;
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
  [(ScrollDecelerationTestProcessor *)self setIterationsRemaining:[(ContentInteractionTestRunner *)self iterations]];
  [(ScrollDecelerationTestProcessor *)self setState:0];
  v6.receiver = self;
  v6.super_class = (Class)ScrollDecelerationTestProcessor;
  LOBYTE(self) = [(ContentInteractionTestRunner *)&v6 startPageAction:v4];

  return (char)self;
}

- (BOOL)performActionForPage:(id)a3
{
  int64_t v4 = [(ScrollDecelerationTestProcessor *)self state];
  BOOL v5 = 0;
  switch(v4)
  {
    case 0:
      [(ScrollDecelerationTestProcessor *)self setState:1];
      [(ContentInteractionTestRunner *)self startTrackingFrameRate];
      return 1;
    case 1:
      objc_super v6 = [(ContentInteractionTestRunner *)self pageWebView];
      v7 = [v6 scrollView];

      objc_msgSend(v7, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __56__ScrollDecelerationTestProcessor_performActionForPage___block_invoke;
      v15[3] = &unk_1E6D77E20;
      v15[4] = self;
      objc_msgSend(v7, "_simulateScrollWithTranslation:duration:willBeginDragging:didEndDragging:willBeginDecelerating:didEndDecelerating:", 0, 0, 0, v15, 0.0, 1000.0, 0.25);
      [(ScrollDecelerationTestProcessor *)self setState:2];

      return 1;
    case 3:
      objc_super v8 = [(ContentInteractionTestRunner *)self pageWebView];
      v9 = [v8 scrollView];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __56__ScrollDecelerationTestProcessor_performActionForPage___block_invoke_2;
      v14[3] = &unk_1E6D77E20;
      v14[4] = self;
      objc_msgSend(v9, "_simulateScrollWithTranslation:duration:willBeginDragging:didEndDragging:willBeginDecelerating:didEndDecelerating:", 0, 0, 0, v14, 0.0, -1000.0, 0.25);
      [(ScrollDecelerationTestProcessor *)self setState:2];

      return 1;
    case 4:
      uint64_t v10 = [(ScrollDecelerationTestProcessor *)self iterationsRemaining] - 1;
      [(ScrollDecelerationTestProcessor *)self setIterationsRemaining:v10];
      if (v10)
      {
        v11 = self;
        uint64_t v12 = 0;
      }
      else
      {
        [(ContentInteractionTestRunner *)self endTrackingFrameRate];
        v11 = self;
        uint64_t v12 = 5;
      }
      [(ScrollDecelerationTestProcessor *)v11 setState:v12];
      return 1;
    case 5:
      return v5;
    default:
      return 1;
  }
}

uint64_t __56__ScrollDecelerationTestProcessor_performActionForPage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:3];
}

uint64_t __56__ScrollDecelerationTestProcessor_performActionForPage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:4];
}

- (int)iterationsRemaining
{
  return self->_iterationsRemaining;
}

- (void)setIterationsRemaining:(int)a3
{
  self->_iterationsRemaining = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end