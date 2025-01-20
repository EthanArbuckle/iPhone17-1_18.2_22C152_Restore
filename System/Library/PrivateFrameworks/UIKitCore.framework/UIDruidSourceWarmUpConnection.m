@interface UIDruidSourceWarmUpConnection
@end

@implementation UIDruidSourceWarmUpConnection

uint64_t __40___UIDruidSourceWarmUpConnection_warmUp__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __40___UIDruidSourceWarmUpConnection_warmUp__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }
}

@end