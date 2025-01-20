@interface SSTestingCoordinator
- (SSTestingCoordinatorDelegate)delegate;
- (void)_delayedHandleRunPPTRequest:(id)a3;
- (void)handleRunPPTRequest:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SSTestingCoordinator

- (void)_delayedHandleRunPPTRequest:(id)a3
{
  id v8 = a3;
  v4 = [MEMORY[0x263F1C408] sharedApplication];
  v5 = [v8 testName];
  [v4 startedIPTest:v5];

  if ([v8 numberOfRequiredScreenshots])
  {
    v6 = [(SSTestingCoordinator *)self delegate];
    [v6 testingCoordinator:self requestsTakingScreenshotForRunPPTRequest:v8];
  }
  else
  {
    v6 = [MEMORY[0x263F1C408] sharedApplication];
    v7 = [v8 testName];
    [v6 finishedIPTest:v7];
  }
}

- (void)handleRunPPTRequest:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SSTestingCoordinator_handleRunPPTRequest___block_invoke;
  v7[3] = &unk_2644ED8E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x263EF83A0], v7);
}

uint64_t __44__SSTestingCoordinator_handleRunPPTRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _delayedHandleRunPPTRequest:*(void *)(a1 + 40)];
}

- (SSTestingCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSTestingCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end