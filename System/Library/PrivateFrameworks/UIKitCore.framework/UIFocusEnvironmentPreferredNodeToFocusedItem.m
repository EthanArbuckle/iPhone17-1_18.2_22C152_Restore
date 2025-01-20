@interface UIFocusEnvironmentPreferredNodeToFocusedItem
@end

@implementation UIFocusEnvironmentPreferredNodeToFocusedItem

void ___UIFocusEnvironmentPreferredNodeToFocusedItem_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (*(id *)(a1 + 32) == v5)
  {
    v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    goto LABEL_5;
  }
  int v6 = [*(id *)(a1 + 40) containsObject:v5];
  v7 = v5;
  if (v6)
  {
LABEL_5:
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = v7;
    v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;

    *a3 = 1;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
}

@end