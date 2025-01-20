@interface WTTextEffect
@end

@implementation WTTextEffect

void __28___WTTextEffect_invalidate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rootLayer];
  [v2 removeFromSuperlayer];

  v3 = [*(id *)(a1 + 32) completion];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) completion];
    v4[2]();
  }
}

@end