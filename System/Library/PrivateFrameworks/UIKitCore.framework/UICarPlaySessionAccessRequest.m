@interface UICarPlaySessionAccessRequest
@end

@implementation UICarPlaySessionAccessRequest

void __61___UICarPlaySessionAccessRequest_initWithTimeout_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _cancelTimer];
    v2 = [v5 completion];
    v2[2](v2, 0);

    v3 = [v5 timeoutHandler];

    id WeakRetained = v5;
    if (v3)
    {
      v4 = [v5 timeoutHandler];
      v4[2]();

      id WeakRetained = v5;
    }
  }
}

@end