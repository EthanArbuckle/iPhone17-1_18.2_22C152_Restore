@interface NSFileManager
@end

@implementation NSFileManager

uint64_t __74__NSFileManager_PosterFoundation__pf_createTransientDirectoryAtURL_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
}

@end