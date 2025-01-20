@interface RPTWaitTestParameters
- (NSString)testName;
- (RPTWaitTestParameters)init;
- (RPTWaitTestParameters)initWithTestName:(id)a3 wait:(double)a4 completionHandler:(id)a5;
- (RPTWaitTestParameters)initWithWait:(double)a3;
- (double)waitDuration;
- (id)completionHandler;
- (id)composerBlock;
- (void)setTestName:(id)a3;
@end

@implementation RPTWaitTestParameters

- (RPTWaitTestParameters)initWithTestName:(id)a3 wait:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RPTWaitTestParameters;
  v10 = [(RPTWaitTestParameters *)&v15 init];
  v11 = v10;
  if (v10)
  {
    [(RPTWaitTestParameters *)v10 setTestName:v8];
    v11->_waitDuration = a4;
    uint64_t v12 = [v9 copy];
    id completionHandler = v11->_completionHandler;
    v11->_id completionHandler = (id)v12;
  }
  return v11;
}

- (RPTWaitTestParameters)initWithWait:(double)a3
{
  return [(RPTWaitTestParameters *)self initWithTestName:0 wait:0 completionHandler:a3];
}

- (RPTWaitTestParameters)init
{
  return [(RPTWaitTestParameters *)self initWithWait:0.5];
}

- (id)composerBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__RPTWaitTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_1E613DF78;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1BA9B23F0](v4, a2);
  return v2;
}

void __38__RPTWaitTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 waitDuration];
  objc_msgSend(v3, "advanceTime:");
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (double)waitDuration
{
  return self->_waitDuration;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end