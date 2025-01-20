@interface TGITextGenerationInference
- (OS_dispatch_queue)workQueue;
- (TGITextGenerationInference)initWithWorkQueue:(id)a3;
- (TGITextGenerationInferenceRunnerManager)inferenceRunnerManager;
- (id)createSessionWithUUID:(id)a3 configuration:(id)a4;
- (void)start;
@end

@implementation TGITextGenerationInference

- (TGITextGenerationInference)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TGITextGenerationInference;
  v6 = [(TGITextGenerationInference *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workQueue, a3);
    v8 = [[TGITextGenerationInferenceRunnerManager alloc] initWithWorkQueue:v5];
    inferenceRunnerManager = v7->_inferenceRunnerManager;
    v7->_inferenceRunnerManager = v8;
  }
  return v7;
}

- (void)start
{
  v3 = [(TGITextGenerationInference *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__TGITextGenerationInference_start__block_invoke;
  block[3] = &unk_2655345E8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __35__TGITextGenerationInference_start__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) inferenceRunnerManager];
  [v1 start];
}

- (id)createSessionWithUUID:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [TGITextGenerationInferenceSession alloc];
  v9 = [(TGITextGenerationInference *)self inferenceRunnerManager];
  v10 = [(TGITextGenerationInferenceSession *)v8 initWithUUID:v6 configuration:v7 inferenceRunnerManager:v9];

  return v10;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (TGITextGenerationInferenceRunnerManager)inferenceRunnerManager
{
  return (TGITextGenerationInferenceRunnerManager *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferenceRunnerManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end