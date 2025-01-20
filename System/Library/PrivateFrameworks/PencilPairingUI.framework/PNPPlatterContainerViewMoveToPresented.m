@interface PNPPlatterContainerViewMoveToPresented
@end

@implementation PNPPlatterContainerViewMoveToPresented

uint64_t ___PNPPlatterContainerViewMoveToPresented_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresented:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t ___PNPPlatterContainerViewMoveToPresented_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end