@interface UIEditMenuListItem
@end

@implementation UIEditMenuListItem

void __64___UIEditMenuListItem_itemWithMenuElement_preferredDisplayMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB3418], "variantForSelector:", objc_msgSend(a2, "action"));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __64___UIEditMenuListItem_itemWithMenuElement_preferredDisplayMode___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB3418];
  id v7 = [a2 identifier];
  uint64_t v4 = [v3 variantForActionIdentifier:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

@end