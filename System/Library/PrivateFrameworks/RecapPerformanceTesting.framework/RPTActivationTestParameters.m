@interface RPTActivationTestParameters
- (NSString)testName;
- (RPTActivationTestParameters)initWithTestName:(id)a3 window:(id)a4 completionHandler:(id)a5;
- (UIWindow)window;
- (id)completionHandler;
- (id)composerBlock;
- (void)prepareWithComposer:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setTestName:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation RPTActivationTestParameters

- (RPTActivationTestParameters)initWithTestName:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RPTActivationTestParameters;
  v11 = [(RPTActivationTestParameters *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(RPTActivationTestParameters *)v11 setTestName:v8];
    [(RPTActivationTestParameters *)v12 setWindow:v9];
    [(RPTActivationTestParameters *)v12 setCompletionHandler:v10];
  }

  return v12;
}

- (void)prepareWithComposer:(id)a3
{
  id v4 = a3;
  v5 = [RPTActivationInteraction alloc];
  v6 = [(RPTActivationTestParameters *)self window];
  id v7 = [(RPTActivationInteraction *)v5 initForAction:1 window:v6];

  [v7 invokeWithComposer:v4 duration:1.0];
}

- (id)composerBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__RPTActivationTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_1E613DF78;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1BA9B23F0](v4, a2);
  return v2;
}

void __44__RPTActivationTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [RPTActivationInteraction alloc];
  id v4 = [*(id *)(a1 + 32) window];
  id v5 = [(RPTActivationInteraction *)v3 initForAction:0 window:v4];

  v6 = +[RPTSettings processEnvironment];
  uint64_t v7 = [v6 activationIterationCount];

  if (v7 >= 2)
  {
    do
    {
      [v5 invokeWithComposer:v9 duration:1.0];
      id v8 = [v5 reversedInteraction];
      [v8 invokeWithComposer:v9 duration:1.0];

      --v7;
    }
    while (v7);
  }
  else
  {
    [v5 invokeWithComposer:v9 duration:1.0];
  }
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
}

@end