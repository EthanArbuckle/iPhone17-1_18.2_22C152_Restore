@interface MBFrameworkSearchPaths
@end

@implementation MBFrameworkSearchPaths

uint64_t ___MBFrameworkSearchPaths_block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"/System/Library/Frameworks", @"/System/Library/PrivateFrameworks", 0);
  _MBFrameworkSearchPaths_paths = result;
  return result;
}

@end