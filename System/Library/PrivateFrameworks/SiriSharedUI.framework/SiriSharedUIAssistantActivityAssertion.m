@interface SiriSharedUIAssistantActivityAssertion
- (void)beginActivityWithReason:(id)a3;
- (void)endActivityWithReason:(id)a3;
@end

@implementation SiriSharedUIAssistantActivityAssertion

- (void)beginActivityWithReason:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  SRUIFInvokeOnMainQueue();
}

void __66__SiriSharedUIAssistantActivityAssertion_beginActivityWithReason___block_invoke(uint64_t a1)
{
  v2 = soft_SBUIGetUserAgent();
  char v3 = [v2 isScreenOn];

  if ((v3 & 1) == 0)
  {
    id v4 = soft_SBUIGetUserAgent();
    [v4 undimScreen];
  }
  soft_SBUIGetUserAgent();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setIdleTimerDisabled:1 forReason:*(void *)(a1 + 32)];
}

- (void)endActivityWithReason:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  SRUIFInvokeOnMainQueue();
}

void __64__SiriSharedUIAssistantActivityAssertion_endActivityWithReason___block_invoke(uint64_t a1)
{
  soft_SBUIGetUserAgent();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setIdleTimerDisabled:0 forReason:*(void *)(a1 + 32)];
}

@end