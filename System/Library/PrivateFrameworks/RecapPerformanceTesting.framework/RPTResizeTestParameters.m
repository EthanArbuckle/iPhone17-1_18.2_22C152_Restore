@interface RPTResizeTestParameters
- (CGSize)maximumWindowSize;
- (CGSize)minimumWindowSize;
- (NSString)testName;
- (RPTCoordinateSpaceConverter)conversion;
- (RPTResizeTestParameters)initWithTestName:(id)a3 window:(id)a4 completionHandler:(id)a5;
- (UIWindow)window;
- (id)completionHandler;
- (id)composerBlock;
- (void)prepareWithComposer:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConversion:(id)a3;
- (void)setMaximumWindowSize:(CGSize)a3;
- (void)setMinimumWindowSize:(CGSize)a3;
- (void)setTestName:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation RPTResizeTestParameters

- (void)prepareWithComposer:(id)a3
{
  id v4 = [(RPTResizeTestParameters *)self window];
  [(RPTResizeTestParameters *)self minimumWindowSize];
  objc_msgSend(v4, "_rpt_moveToSafeTopLeftOfScreemVisibleFrameAndResize:");
}

- (RPTResizeTestParameters)initWithTestName:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)RPTResizeTestParameters;
  v12 = [(RPTResizeTestParameters *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_testName, a3);
    objc_storeStrong((id *)&v13->_window, a4);
    objc_msgSend(v10, "_rpt_safeVisibleFrameOfScreen");
    v13->_minimumWindowSize = (CGSize)xmmword_1B627D2F0;
    double v16 = 1200.0;
    if (v14 <= 1200.0) {
      double v16 = v14;
    }
    double v17 = 800.0;
    if (v15 <= 800.0) {
      double v17 = v15;
    }
    v13->_maximumWindowSize.width = v16;
    v13->_maximumWindowSize.height = v17;
    uint64_t v18 = MEMORY[0x1BA9B23F0](v11);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = (id)v18;

    uint64_t v20 = +[RPTCoordinateSpaceConverter converterFromWindow:v10];
    conversion = v13->_conversion;
    v13->_conversion = (RPTCoordinateSpaceConverter *)v20;
  }
  return v13;
}

- (id)composerBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__RPTResizeTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_1E613DF28;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1BA9B23F0](v4, a2);
  return v2;
}

void __40__RPTResizeTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [RPTResizeInteraction alloc];
  id v4 = [*(id *)(a1 + 32) window];
  [*(id *)(a1 + 32) maximumWindowSize];
  v5 = -[RPTResizeInteraction initWithWindow:destinationSize:](v3, "initWithWindow:destinationSize:", v4);

  v6 = [*(id *)(a1 + 32) conversion];
  [(RPTResizeInteraction *)v5 setConversion:v6];

  [(RPTResizeInteraction *)v5 setShouldLift:0];
  [(RPTResizeInteraction *)v5 invokeWithComposer:v11 duration:1.0];
  v7 = operator new(0x50uLL);
  uint64_t v8 = 0;
  v7[2] = xmmword_1B627D328;
  v7[3] = unk_1B627D338;
  v7[4] = xmmword_1B627D348;
  _OWORD *v7 = xmmword_1B627D308;
  v7[1] = unk_1B627D318;
  do
  {
    id v9 = [(RPTResizeInteraction *)v5 reversedInteraction];
    id v10 = [v9 interactionByScalingBy:fabs(*(double *)((char *)v7 + v8))];

    [(RPTResizeInteraction *)v10 setShouldPress:0];
    [(RPTResizeInteraction *)v10 setShouldLift:0];
    if (*(double *)((char *)v7 + v8) < 0.0) {
      [(RPTResizeInteraction *)v10 setShouldLift:1];
    }
    [(RPTResizeInteraction *)v10 invokeWithComposer:v11 duration:1.0];
    v8 += 8;
    v5 = v10;
  }
  while (v8 != 80);
  operator delete(v7);
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (void)setConversion:(id)a3
{
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (CGSize)minimumWindowSize
{
  double width = self->_minimumWindowSize.width;
  double height = self->_minimumWindowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinimumWindowSize:(CGSize)a3
{
  self->_minimumWindowSize = a3;
}

- (CGSize)maximumWindowSize
{
  double width = self->_maximumWindowSize.width;
  double height = self->_maximumWindowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumWindowSize:(CGSize)a3
{
  self->_maximumWindowSize = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
}

@end