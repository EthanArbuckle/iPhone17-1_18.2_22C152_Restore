@interface NanoPhotosUI
@end

@implementation NanoPhotosUI

uint64_t __nanophotos_log_NanoPhotosUI_block_invoke()
{
  _MergedGlobals = (uint64_t)os_log_create("com.apple.NanoPhotos", "NanoPhotosUI");
  return MEMORY[0x270F9A758]();
}

@end