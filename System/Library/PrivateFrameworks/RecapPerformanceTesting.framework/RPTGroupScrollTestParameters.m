@interface RPTGroupScrollTestParameters
+ (id)newWithTestName:(id)a3 parameters:(id)a4 completionHandler:(id)a5;
- (NSArray)parameters;
- (NSString)testName;
- (id)completionHandler;
- (id)composerBlock;
- (void)prepareWithComposer:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setParameters:(id)a3;
- (void)setTestName:(id)a3;
@end

@implementation RPTGroupScrollTestParameters

- (NSArray)parameters
{
  return self->_parameters;
}

- (void)setTestName:(id)a3
{
}

- (void)setParameters:(id)a3
{
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)composerBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__RPTGroupScrollTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_1E613DF78;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1BA9B23F0](v4, a2);
  return v2;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->testName, 0);
}

- (NSString)testName
{
  return self->testName;
}

- (void)prepareWithComposer:(id)a3
{
  id v4 = a3;
  id v6 = [(RPTGroupScrollTestParameters *)self parameters];
  v5 = [v6 firstObject];
  [v5 prepareWithComposer:v4];
}

+ (id)newWithTestName:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setTestName:v9];

  [v10 setParameters:v8];
  [v10 setCompletionHandler:v7];

  return v10;
}

void __45__RPTGroupScrollTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  v5 = [*(id *)(a1 + 32) parameters];
  id v6 = [v4 arrayWithArray:v5];

  [v6 removeObjectAtIndex:0];
  id v7 = [*(id *)(a1 + 32) parameters];
  id v8 = [v7 firstObject];
  id v9 = [v8 composerBlock];
  ((void (**)(void, id))v9)[2](v9, v3);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v15, "prepareWithComposer:", v3, (void)v17);
        v16 = [v15 composerBlock];
        ((void (**)(void, id))v16)[2](v16, v3);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

@end