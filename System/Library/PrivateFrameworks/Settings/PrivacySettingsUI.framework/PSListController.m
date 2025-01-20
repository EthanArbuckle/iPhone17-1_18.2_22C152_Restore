@interface PSListController
@end

@implementation PSListController

uint64_t __81__PSListController_PUIGroupReplace__pui_replaceRows_withRows_header_insertPoint___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeContiguousSpecifiers:*(void *)(a1 + 40) animated:0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  return [v2 insertContiguousSpecifiers:v3 afterSpecifier:v4 animated:0];
}

@end