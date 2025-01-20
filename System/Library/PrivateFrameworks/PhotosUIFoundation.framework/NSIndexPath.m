@interface NSIndexPath
@end

@implementation NSIndexPath

void __67__NSIndexPath_PhotosUIFoundation__px_indexPathsForItems_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x263F088C8], "px_indexPathForItem:inSection:", a2, *(void *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v3];
}

@end