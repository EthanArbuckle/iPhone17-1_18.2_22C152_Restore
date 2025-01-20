@interface ReviewActionHandlerForType
@end

@implementation ReviewActionHandlerForType

uint64_t ___ReviewActionHandlerForType_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a3;
  v6 = PXStickersReviewViewController(v3, v4);
  v7 = [v5 navigationController];

  [v7 pushViewController:v6 animated:1];
  return 1;
}

@end