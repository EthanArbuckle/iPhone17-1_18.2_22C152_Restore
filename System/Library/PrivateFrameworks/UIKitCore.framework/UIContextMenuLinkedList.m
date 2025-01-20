@interface UIContextMenuLinkedList
@end

@implementation UIContextMenuLinkedList

void __39___UIContextMenuLinkedList_removeNode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  [*(id *)(a1 + 32) addObject:v6];
  if ([v6 isEqual:*(void *)(a1 + 40)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __40___UIContextMenuLinkedList_nodeForMenu___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 menu];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __39___UIContextMenuLinkedList_description__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) first];

  if (v3 != v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:@" -> "];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendFormat:@"%@", v4];
}

@end