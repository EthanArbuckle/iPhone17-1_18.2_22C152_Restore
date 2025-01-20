@interface NSIndexPath
@end

@implementation NSIndexPath

void __57__NSIndexPath_PhotosUI__pu_indexPathsForItems_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) addObject:v3];
}

@end