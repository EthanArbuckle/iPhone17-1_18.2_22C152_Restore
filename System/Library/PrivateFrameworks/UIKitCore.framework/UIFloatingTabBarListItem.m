@interface UIFloatingTabBarListItem
@end

@implementation UIFloatingTabBarListItem

void __46___UIFloatingTabBarListItem_initWithChildren___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v7 = a2;
  v5 = [v7 children];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"_UIFloatingTabBarListItem.m" lineNumber:40 description:@"List item with children cannot also have a parent item."];
  }
  objc_storeWeak(v7 + 2, *(id *)(a1 + 32));
  v7[3] = a3;
}

@end