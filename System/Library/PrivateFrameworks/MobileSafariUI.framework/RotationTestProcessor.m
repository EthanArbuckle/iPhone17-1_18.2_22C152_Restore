@interface RotationTestProcessor
- (BOOL)performActionForPage:(id)a3;
- (BOOL)startPageAction:(id)a3;
- (RotationTestProcessor)initWithTestName:(id)a3 browserController:(id)a4;
- (int)iterationsRemaining;
- (int64_t)testState;
- (void)setIterationsRemaining:(int)a3;
- (void)setTestState:(int64_t)a3;
- (void)startRotation;
@end

@implementation RotationTestProcessor

- (RotationTestProcessor)initWithTestName:(id)a3 browserController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RotationTestProcessor;
  v4 = [(ContentInteractionTestRunner *)&v8 initWithTestName:a3 browserController:a4];
  v5 = v4;
  if (v4)
  {
    [(RotationTestProcessor *)v4 setTestState:0];
    v6 = v5;
  }

  return v5;
}

- (BOOL)startPageAction:(id)a3
{
  id v4 = a3;
  [(RotationTestProcessor *)self setIterationsRemaining:[(ContentInteractionTestRunner *)self iterations]];
  [(RotationTestProcessor *)self setTestState:1];
  v6.receiver = self;
  v6.super_class = (Class)RotationTestProcessor;
  LOBYTE(self) = [(ContentInteractionTestRunner *)&v6 startPageAction:v4];

  return (char)self;
}

- (void)startRotation
{
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v4 = [v3 statusBarOrientation];

  if (v4 == 3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 3;
  }
  objc_super v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  v7[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__RotationTestProcessor_startRotation__block_invoke;
  v8[3] = &unk_1E6D77C20;
  v8[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__RotationTestProcessor_startRotation__block_invoke_2;
  v7[3] = &unk_1E6D77C20;
  [v6 rotateIfNeeded:v5 before:v8 after:v7];
  [(RotationTestProcessor *)self setTestState:2];
}

uint64_t __38__RotationTestProcessor_startRotation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startTrackingFrameRate];
}

uint64_t __38__RotationTestProcessor_startRotation__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) endTrackingFrameRate];
  v2 = *(void **)(a1 + 32);
  return [v2 setTestState:4];
}

- (BOOL)performActionForPage:(id)a3
{
  if ([(RotationTestProcessor *)self testState] == 1) {
    [(RotationTestProcessor *)self startRotation];
  }
  return [(RotationTestProcessor *)self testState] != 4;
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

@end