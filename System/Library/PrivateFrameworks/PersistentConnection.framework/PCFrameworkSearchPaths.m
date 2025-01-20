@interface PCFrameworkSearchPaths
@end

@implementation PCFrameworkSearchPaths

uint64_t ___PCFrameworkSearchPaths_block_invoke()
{
  _PCFrameworkSearchPaths_paths = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"/System/Library/Frameworks", @"/System/Library/PrivateFrameworks", 0);
  return MEMORY[0x1F41817F8]();
}

@end