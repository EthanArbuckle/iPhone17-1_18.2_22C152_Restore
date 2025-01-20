@interface SWProcessTerminationManager
- (NSMutableArray)onRetryBlocks;
- (SWErrorReporting)errorReporter;
- (SWProcessTerminationManager)initWithTerminationThrottler:(id)a3 errorReporter:(id)a4;
- (SWProcessTerminationPolicyDecider)throttler;
- (void)onRetry:(id)a3;
- (void)webContentProcessTerminated;
@end

@implementation SWProcessTerminationManager

- (SWProcessTerminationManager)initWithTerminationThrottler:(id)a3 errorReporter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)SWProcessTerminationManager;
    v11 = [(SWProcessTerminationManager *)&v16 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_throttler, a3);
      objc_storeStrong((id *)&v12->_errorReporter, a4);
      uint64_t v13 = [MEMORY[0x263EFF980] array];
      onRetryBlocks = v12->_onRetryBlocks;
      v12->_onRetryBlocks = (NSMutableArray *)v13;
    }
    self = v12;
    v10 = self;
  }

  return v10;
}

- (void)webContentProcessTerminated
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(SWProcessTerminationManager *)self throttler];
  uint64_t v4 = [v3 retryPolicy];

  if (v4)
  {
    if (v4 == 1)
    {
      id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"web_content" code:2 userInfo:0];
      v5 = [(SWProcessTerminationManager *)self errorReporter];
      [v5 reportError:v11];
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = [(SWProcessTerminationManager *)self onRetryBlocks];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))();
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)onRetry:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(SWProcessTerminationManager *)self onRetryBlocks];
    v5 = (void *)MEMORY[0x22A621430](v4);

    [v6 addObject:v5];
  }
}

- (SWProcessTerminationPolicyDecider)throttler
{
  return self->_throttler;
}

- (SWErrorReporting)errorReporter
{
  return self->_errorReporter;
}

- (NSMutableArray)onRetryBlocks
{
  return self->_onRetryBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onRetryBlocks, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_throttler, 0);
}

@end