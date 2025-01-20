@interface SWSystemSleepAssertionProvider
+ (id)sharedProvider;
- (id)acquirePreventSystemSleepAssertionWithIdentifier:(id)a3;
- (id)acquireSystemActivityAssertionWithIdentifier:(id)a3;
@end

@implementation SWSystemSleepAssertionProvider

+ (id)sharedProvider
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SWSystemSleepAssertionProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26AB24FA8 != -1) {
    dispatch_once(&qword_26AB24FA8, block);
  }
  v2 = (void *)_MergedGlobals_1;
  return v2;
}

uint64_t __48__SWSystemSleepAssertionProvider_sharedProvider__block_invoke(uint64_t a1)
{
  _MergedGlobals_1 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (id)acquirePreventSystemSleepAssertionWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[SWPreventSystemSleepAssertion alloc] initWithIdentifier:v3];
  [(SWPreventSystemSleepAssertion *)v4 acquireWithTimeout:0 handler:0.0];

  return v4;
}

- (id)acquireSystemActivityAssertionWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[SWSystemActivityAssertion alloc] initWithIdentifier:v3];
  [(SWSystemActivityAssertion *)v4 acquireWithTimeout:0 handler:0.0];

  return v4;
}

@end