@interface PCLibrarySearchPaths
@end

@implementation PCLibrarySearchPaths

uint64_t ___PCLibrarySearchPaths_block_invoke()
{
  _PCLibrarySearchPaths_paths = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"/usr/lib", 0);
  return MEMORY[0x1F41817F8]();
}

@end