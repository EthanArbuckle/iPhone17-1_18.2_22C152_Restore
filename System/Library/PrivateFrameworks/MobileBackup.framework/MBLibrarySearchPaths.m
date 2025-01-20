@interface MBLibrarySearchPaths
@end

@implementation MBLibrarySearchPaths

uint64_t ___MBLibrarySearchPaths_block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"/usr/lib", 0);
  _MBLibrarySearchPaths_paths = result;
  return result;
}

@end